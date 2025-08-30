import time
import threading
import queue
import socket
import struct

from .config import *

class ChannelValue:
    def __init__(self, chanCfg: ChannelConfig):
        self._name = chanCfg.name()
        self._value = chanCfg.defaultValue()
        self._time_ns = 0

    def value(self):
        return self._value
    
    def update(self, value, timestamp: int):
        self._value = value
        if timestamp:
            self._time_ns = timestamp
        else:
            self._time_ns = time.time_ns()

    def time_ns(self) -> int:
        return self._time_ns
    
class ChannelGroup:
    def __init__(self, groupCfg: GroupConfig):
        self._cfg = groupCfg
        self._chanIndex: dict[str, int] = dict()
        self._channels: list[ChannelValue] = []
        self._valLock = threading.Lock()
        self._count = 0
        self._time_ns = 0

        channels = groupCfg.channels()

        i:int = 0
        for chanCfg in channels:
            self._channels.append(ChannelValue(chanCfg))
            self._chanIndex[chanCfg.name()] = i
            i += 1

        self._count = i

    def config(self) -> GroupConfig:
        return self._cfg
    
    def name(self) -> str:
        return self._cfg.name()

    def chanIndex(self, chanName: str) -> int | None:
        return self._chanIndex.get(chanName)
    
    def chanByName(self, chanName: str) -> ChannelValue | None:
        return self._channels[self.chanIndex(chanName)]
    
    def chanByIndex(self, chanIndex: int) -> ChannelValue | None:
        return self._channels[chanIndex]
    
    def valueByIndex(self, chanIndex: int) -> str | float | None:
        return self._channels[chanIndex].value()
    
    def updateValues(self, values: list[str | float], time_ns: int = None):
        if not time_ns:
            time_ns = time.time_ns()
        
        if len(values) != len(self._count):
            raise ValueError()
        
        for i, chan in enumerate(self._channels):
            chan.update(values[i], time_ns) #TODO check value order

        self._time_ns = time_ns

    def time_ns(self) -> int:
        return self._time_ns

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
        self._type = type

    def type(self) -> SubActionType:
        return self._type
    
class SubActionAddGroup(SubAction):
    def __init__(self, group: ChannelGroup):
        super(SubActionAddGroup, self).__init__(SubActionType.ADD_GROUP)
        self._group = group
    
    def group(self) -> ChannelGroup:
        return self._group
    
class SubActionClose(SubAction):
    def __init__(self):
        super(SubActionClose, self).__init__(SubActionType.CLOSE)            

class Subscriber:
    def __init__(self, endpt: EndpointConfig):
        self._endpoint = endpt
        self._actions: queue.Queue[SubAction] = queue.Queue()
        self._thread: threading.Thread = threading.Thread(target= self._readLoop)
        
        self._socket: socket.socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self._socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self._socket.bind(endpt.address(), endpt.port())

        mult_req = struct.pack("4sl", socket.inet_aton(endpt.address()), socket.INADDR_ANY)
        self._socket.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, mult_req)

        self._thread.start()

    def addGroup(self, group: ChannelGroup):
        if group.config().publishConfig() != self._endpoint:
            raise ValueError(f'Group {group.name()} does not match subscriber endpoint of {str(self._endpoint)}')
        
        self._actions.put(SubActionAddGroup(group))

    def close(self):
        self._actions.put(SubActionClose())

    def _readLoop(self):
        while True:
            self._socket.recv_into

class Telemetry:
    def __init__(self):
        self._values = dict()
        self._subscribers: dict[EndpointConfig, Subscriber] = dict()
        self._subLock = threading.Lock()
    
    def subscribeToGroupCfg(self, groupCfg: GroupConfig) -> Subscriber:
        endpt = groupCfg.publishConfig()

        if not endpt:
            raise ValueError(f'Group {groupCfg.name()} does not have a publish config and cannot be subscribed to.')
        
        with self._subLock:
            if endpt in self._subscribers:
                sub = self._subscribers[endpt]
                sub.addGroupCfg(groupCfg)
            else:    
                sub = Subscriber(endpt)
                self._subscribers[endpt] = sub
                sub.addGroupCfg(groupCfg)
        
        return sub