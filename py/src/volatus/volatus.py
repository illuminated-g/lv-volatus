from pathlib import Path

from .telemetry import *
from .config import *
from .vecto.TCP import *
from .proto.cmd_digital_pb2 import *
from .proto.cmd_analog_pb2 import *

class VCommand:
    def __init__(self, targetName: str, type: str, payload: bytes, seqFunc, sendFunc, taskName: str = ''):
        self._targetName = targetName
        self._type = type
        self._payload = payload
        self._seqFunc = seqFunc
        self._taskName = taskName
        self._sendFunc = sendFunc

    def send(self):
        self._sendFunc(self._targetName, self._type, self._payload, self._seqFunc(), self._taskName)

class Volatus:
    def __init__(self, configPath: Path, systemName: str, clusterName: str, nodeName: str):
        self.systemName = systemName
        self.clusterName = clusterName
        self.nodeName = nodeName
        self.config: VolatusConfig = ConfigLoader.load(configPath)
        self.cluster: ClusterConfig
        self.node: NodeConfig
        self.telemetry: Telemetry
        self.tcp: TCPMessaging

        self._seq = 0

        cfgSystemName = self.config.system.name

        if systemName != cfgSystemName:
            raise ValueError(
                f'Created config object for "{systemName}" system but config loaded is for "{cfgSystemName}".')


        self.cluster = self.config.lookupClusterByName(clusterName)
        if self.cluster:
            self.node = self.cluster.lookupNodeByName(nodeName)

        if not self.node:
            raise ValueError(
                f'Unable to find node "{nodeName}" in cluster "{clusterName}".')

        self.__initFromConfig()

    def __createTelemetry(self):
        self.telemetry = Telemetry()

    def __startTCP(self):
        tcpCfg = self.node.network.tcp

        self.tcp = TCPMessaging(tcpCfg.address, tcpCfg.port, tcpCfg.server, self.config, self.node)
        self.tcp.open()

    def __initFromConfig(self):
        node = self.node
        cluster = self.cluster

        if node.network.tcp:
            self.__startTCP()
        
        self.__createTelemetry()

    def __enter__(self):
        return self
    
    def __exit__(self, type, value, traceback):
        self.shutdown()

    def __nextSeq(self) -> int:
        seq = self._seq
        self._seq += 1
        return seq

    def shutdown(self):
        if self.tcp:
            self.tcp.shutdown()

        if self.telemetry:
            self.telemetry.shutdown()

    def lookupTargetId(self, targetName: str) -> int | None:
        """
        Looks up the numeric ID used to route a message to the desired node(s).
        Also useful for verifying if a target name is valid; unknown target names return None as the value.
        """

        #check if target is a node
        node = self.cluster.lookupNodeByName(targetName)
        if node:
            return node.id
        
        #check if target is a targetGroup
        targetGroup = self.cluster.lookupTargetGroupId(targetName)
        return targetGroup
    
    def createDigitalCommand(self, chanName: str, value: bool) -> VCommand:
        cmd = CmdDigital()
        cmd.channel = chanName
        cmd.value = value

        chan = self.config.lookupChannelByName(chanName)
        if not chan:
            raise ValueError(f'Unknown channel "{chanName}".')
        
        targetName = chan.nodeName
        taskName = chan.taskName

        return VCommand(targetName, 'cmd_digital', cmd.SerializeToString(), self.__nextSeq, self.tcp.sendMsg, taskName)
    
    def createAnalogCommand(self, chanName: str, value: float) -> VCommand:
        cmd = CmdAnalog()
        cmd.channel = chanName
        cmd.value = value

        chan = self.config.lookupChannelByName(chanName)
        if not chan:
            raise ValueError(f'Unknown channel "{chanName}"')
        
        targetName = chan.nodeName
        taskName = chan.taskName

        return VCommand(targetName, 'cmd_analog', cmd.SerializeToString(), self.__nextSeq, self.tcp.sendMsg, taskName)

    def createDigitalMultipleCommand(self, values: list[tuple[str, bool]]) -> bytes:
        cmd = CmdDigitalMultiple()

        targetName: str = None
        taskName: str = None

        for chanName, value in values:
            val = cmd.values.add()
            val.channel = chanName
            val.value = value
            
            chan = self.config.lookupChannelByName(chanName)
            if not targetName:
                targetName = chan.nodeName
                taskName = chan.taskName
            else:
                if targetName != chan.nodeName or taskName != chan.taskName:
                    raise ValueError('Multiple command can only include channels from a single node/task.')
        
        return VCommand(targetName, 'cmd_digital_multiple', cmd.SerializeToString(), self.__nextSeq(), self.tcp.sendMsg, taskName)

    def createAnalogMultipleCommand(self, values: list[tuple[str, float]]) -> VCommand:
        cmd = CmdAnalogMultiple()

        targetName: str = None
        taskName: str = None

        for chanName, value in values:
            val = cmd.values.add()
            val.channel = chanName
            val.value = value
            
            chan = self.config.lookupChannelByName(chanName)
            if not targetName:
                targetName = chan.nodeName
                taskName = chan.taskName
            else:
                if targetName != chan.nodeName or taskName != chan.taskName:
                    raise ValueError('Multiple command can only include channels from a single node/task.')
        
        return VCommand(targetName, 'cmd_analog_multiple', cmd.SerializeToString(), self.__nextSeq(), self.tcp.sendMsg, taskName)


    def subscribe(self, groupName: str) -> ChannelGroup :
        if self.telemetry:
            groupCfg = self.config.lookupGroupByName(groupName)
            return self.telemetry.subscribeToGroupCfg(groupCfg)

        raise RuntimeError('Volatus is not configured for networking and the telemetry component is not available.')

    def unsubscribe(self, groupName: str) -> bool:
        pass