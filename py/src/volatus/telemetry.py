import time
import threading
import queue
import socket
import struct

from .config import *
from .vecto.UDP import *
from .vecto.proto import group_data_pb2, string_data_pb2

class ChannelValue:
    def __init__(self, chanCfg: ChannelConfig):
        self.name = chanCfg.name
        self.value = chanCfg.defaultValue
        self.time_ns = 0
    
    def update(self, value, timestamp: int):
        self.value = value
        if timestamp:
            self.time_ns = timestamp
        else:
            self.time_ns = time.time_ns()
    
class ChannelGroup:
    def __init__(self, groupCfg: GroupConfig):
        self._channel: dict[str, ChannelValue] = dict()
        self.config = groupCfg
        self.name = groupCfg.name
        self.time_ns = 0
        
        self._chanIndex: dict[str, int] = dict()
        self._channels: list[ChannelValue] = []
        self._valLock = threading.Lock()
        self._count = 0

        channels = groupCfg.channels

        i:int = 0
        for chanCfg in channels.values():
            chan = ChannelValue(chanCfg)
            self._channels.append(chan)
            self._channel[chan.name] = chan
            self._chanIndex[chanCfg.name] = i
            i += 1

        self._count = i

    def chanByName(self, chanName: str) -> ChannelValue | None:
        return self._channel.get(chanName)

    def chanIndex(self, chanName: str) -> int | None:
        return self._chanIndex.get(chanName)
    
    def chanByIndex(self, chanIndex: int) -> ChannelValue | None:
        return self._channels[chanIndex]
    
    def valueByIndex(self, chanIndex: int) -> str | float | None:
        return self._channels[chanIndex].value()
    
    def updateValues(self, values: list[str | float], time_ns: int = None):
        if not time_ns:
            time_ns = time.time_ns()
        
        if len(values) != self._count:
            raise ValueError()
        
        for i, chan in enumerate(self._channels):
            chan.update(values[i], time_ns) #TODO check value order

        self._time_ns = time_ns

    def allValues(self) -> tuple[list[str | float], int]:
        """
        Returns the current values stored by the group of channels
        
        Return: tuple[values: list[str | float | None], time_ns: int]
        """
        vals = []
        for chan in self._channels:
            vals.append(chan.value())
        
        return vals, self._time_ns
    
class SubActionType(Enum):
    UNKNOWN = 0
    CLOSE = 1
    ADD_GROUP = 2
    
class SubAction:
    def __init__(self, type: SubActionType):
        self.type = type
    
class SubActionAddGroup(SubAction):
    def __init__(self, group: ChannelGroup):
        super(SubActionAddGroup, self).__init__(SubActionType.ADD_GROUP)
        self.group = group
    
class SubActionClose(SubAction):
    def __init__(self):
        super(SubActionClose, self).__init__(SubActionType.CLOSE)            

class Subscriber:
    def __init__(self, endpt: EndpointConfig):
        self._endpoint = endpt
        self._actions: queue.Queue[SubAction] = queue.Queue()
        self._thread: threading.Thread = threading.Thread(target= self._readLoop)

        self._reader = MulticastReader(endpt.address, endpt.port)

        self._groups: dict[str, ChannelGroup] = dict()

        self._thread.start()

    def addGroup(self, group: ChannelGroup):
        if group.config.publishConfig != self._endpoint:
            raise ValueError(f'Group {group.name} does not match subscriber endpoint of {str(self._endpoint)}')
        
        self._actions.put(SubActionAddGroup(group))

    def close(self):
        self._actions.put(SubActionClose())
        self._thread.join()

    def _readLoop(self):
        self._reader.join()
        groupData = group_data_pb2.GroupData()
        stringData = string_data_pb2.StringData()

        close: bool = False

        while not close:
            # check for actions
            while not self._actions.empty():
                action = self._actions.get()
                match action.type:
                    case SubActionType.ADD_GROUP:
                        self._groups[action.group.name] = action.group
                    
                    case SubActionType.CLOSE:
                        close = True
                        continue

            # read payload
            udpPayload = self._reader.readUdpPayload()
            if not udpPayload:
                # disconnected, try rejoining multicast
                self._reader.leave()
                self._reader.join()
                continue

            match udpPayload.type:
                case 'v:GroupData':
                    # numeric data
                    groupData.ParseFromString(udpPayload.payload)
                    group = self._groups.get(groupData.group_name)
                    if group:
                        group.updateValues(groupData.scaled_data, groupData.data_timestamp)

                case 'v:StringData':
                    stringData.ParseFromString(udpPayload.payload)
                    group = self._groups.get(stringData.group_name)
                    if group:
                        group.updateValues(stringData.scaled_data, stringData.data_timestamp)

        self._reader.close()


class Telemetry:
    def __init__(self):
        self._values = dict()
        self._subscribers: dict[EndpointConfig, Subscriber] = dict()
        self._subLock = threading.Lock()
        self._groups = dict()

    def createPublishGroupCfg(self, groupCfg: GroupConfig) -> ChannelGroup:
        pass
    
    def subscribeToGroupCfg(self, groupCfg: GroupConfig) -> ChannelGroup:
        # check to see if group already exists
        group = self._groups.get(groupCfg.name)
        if group:
            return group
        
        endpt = groupCfg.publishConfig

        group = ChannelGroup(groupCfg)
        self._groups[group.name] = group

        if not endpt:
            raise ValueError(f'Group {groupCfg.name()} does not have a publish config and cannot be subscribed to.')
        
        with self._subLock:
            if endpt in self._subscribers:
                sub = self._subscribers[endpt]
                sub.addGroup(group)
            else:    
                sub = Subscriber(endpt)
                self._subscribers[endpt] = sub
                sub.addGroup(group)
        
        return group
    
    def shutdown(self):
        with self._subLock:
            for sub in self._subscribers.values():
                sub.close()
