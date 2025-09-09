from pathlib import Path

from collections.abc import Callable

from .telemetry import *
from .config import *
from .vecto.TCP import *
from .proto.cmd_digital_pb2 import *
from .proto.cmd_analog_pb2 import *

class VCommand:
    """Constructed command that is ready to be sent to a Volatus system.
    """

    def __init__(self, targetName: str,
                 type: str,
                 payload: bytes,
                 seqFunc: Callable[[], int],
                 sendFunc: Callable[[str, str, bytes, int, str], None],
                 taskName: str = ''):
        """Initializes a new command that is ready to be sent.

        :param targetName: The name of the target to send the command to. Can be a node name or a targetGroup name.
        :type targetName: str
        :param type: The message type string use to infer the message type by the recipient.
        :type type: str
        :param payload: The serialized protobuf message used as the command data.
        :type payload: bytes
        :param seqFunc: A reference to the function used to generate the next sequence number sent in the message header.
        :type seqFunc: Callable[[], int]
        :param sendFunc: A reference to the function that sends the message out over TCP. Expected to be the send function of the TCP class.
        :type sendFunc: Callable[[str, str, bytes, int, str], None]
        :param taskName: The target task for the command, defaults to '' which requires tasks to be subscribed to the specific message type.
        :type taskName: str, optional
        """
        self._targetName = targetName
        self._type = type
        self._payload = payload
        self._seqFunc = seqFunc
        self._taskName = taskName
        self._sendFunc = sendFunc

    def send(self):
        """Sends the command over TCP as initialized.
        """
        self._sendFunc(self._targetName, self._type, self._payload, self._seqFunc(), self._taskName)

class Volatus:
    """The main API class for interacting with Volatus configs and systems.
    """

    def __init__(self, configPath: Path, systemName: str, clusterName: str, nodeName: str):
        """Prepares to interact with a Volatus system with the provided configuration.

        The python script/app is expected to have a node entry in the specified configuration file.

        :param configPath: The path to the configuration file that described the Volatus system.
        :type configPath: Path
        :param systemName: The system name the script is expecting to interact with. This is used as validation that the script is intended for the configured system.
        :type systemName: str
        :param clusterName: Teh cluster within the system that the script can communicate with. Most Volatus systems will only have a single cluster.
        :type clusterName: str
        :param nodeName: The name of the python script within the configuration file.
        :type nodeName: str
        :raises ValueError: The specified systemName was not found in the configuration.
        :raises ValueError: The specified clusterName or nodeName was not found in the configuration.
        """
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
        """Stops all communication threads managed by the Volatus framework to prepare for reloading configuration or stopping the Python app.
        """
        if self.tcp:
            self.tcp.shutdown()

        if self.telemetry:
            self.telemetry.shutdown()

    def lookupTargetId(self, targetName: str) -> int | None:
        """Looks up the numeric ID used to route a message to the desired node(s).

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
        """Prepares a digital command to be sent to a Volatus system.

        Digital commands are typically used to set an output value or trigger a control component.

        :param chanName: The name of the channel to update the value for.
        :type chanName: str
        :param value: The new value to set the channel to.
        :type value: bool
        :raises ValueError: The specified channel name was not found in the system.
        :return: The initialized command ready to be sent.
        :rtype: VCommand
        """
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
        """Prepares an analog/numeric command to send to a Volatus system.

        Analog commands are typically used to update analog outputs or change numeric parameters of a control component.

        :param chanName: The name of the channel to update the value of.
        :type chanName: str
        :param value: The new value to set the channel to.
        :type value: float
        :raises ValueError: The specified channel was not found in the system.
        :return: The initialized command ready to be sent.
        :rtype: VCommand
        """
        cmd = CmdAnalog()
        cmd.channel = chanName
        cmd.value = value

        chan = self.config.lookupChannelByName(chanName)
        if not chan:
            raise ValueError(f'Unknown channel "{chanName}"')
        
        targetName = chan.nodeName
        taskName = chan.taskName

        return VCommand(targetName, 'cmd_analog', cmd.SerializeToString(), self.__nextSeq, self.tcp.sendMsg, taskName)

    def createDigitalMultipleCommand(self, values: list[tuple[str, bool]]) -> VCommand:
        """Creates a command that can update multiple digital values simultaneously.

        This is the multiple version of DigitalCommand. All values specified must belong to the same task.

        :param values: Pairs of channel names and values to update.
        :type values: list[tuple[str, bool]]
        :raises ValueError: A specified channel was not found in the system.
        :raises ValueError: Channels are not all part of the same task.
        :return: The intiialized command ready to be sent.
        :rtype: VCommand
        """
        cmd = CmdDigitalMultiple()

        targetName: str = None
        taskName: str = None

        for chanName, value in values:
            val = cmd.values.add()
            val.channel = chanName
            val.value = value
            
            chan = self.config.lookupChannelByName(chanName)
            if not chan:
                raise ValueError(f'Unknown channel "{chanName}"')
            
            if not targetName:
                targetName = chan.nodeName
                taskName = chan.taskName
            else:
                if targetName != chan.nodeName or taskName != chan.taskName:
                    raise ValueError('Multiple command can only include channels from a single node/task.')
        
        return VCommand(targetName, 'cmd_digital_multiple', cmd.SerializeToString(), self.__nextSeq(), self.tcp.sendMsg, taskName)

    def createAnalogMultipleCommand(self, values: list[tuple[str, float]]) -> VCommand:
        """Prepares a command that can update multiple numeric values simultaneously

        This is the multiple version of AnalogCommand. All channels in this command must belong to the same task.

        :param values: Pairs of channel names and values to update.
        :type values: list[tuple[str, float]]
        :raises ValueError: A specified channel name was not found in the system.
        :raises ValueError: Channels are not all part of the same task.
        :return: The initialized commmand ready to be sent.
        :rtype: VCommand
        """
        cmd = CmdAnalogMultiple()

        targetName: str = None
        taskName: str = None

        for chanName, value in values:
            val = cmd.values.add()
            val.channel = chanName
            val.value = value
            
            chan = self.config.lookupChannelByName(chanName)
            if not chan:
                raise ValueError(f'Unknown channel "{chanName}"')
            
            if not targetName:
                targetName = chan.nodeName
                taskName = chan.taskName
            else:
                if targetName != chan.nodeName or taskName != chan.taskName:
                    raise ValueError('Multiple command can only include channels from a single node/task.')
        
        return VCommand(targetName, 'cmd_analog_multiple', cmd.SerializeToString(), self.__nextSeq(), self.tcp.sendMsg, taskName)


    def subscribe(self, groupName: str) -> ChannelGroup:
        """Subscribes to the telemetry data from the specified group.

        Groups are named collections of channels that are published together. Once subscribed, the channels within the group
        will be updated and values can be read from channel objects directly or all at once directly from the group.

        :param groupName: The name of the group to subscribe to.
        :type groupName: str
        :raises ValueError: The specified group name was not found in the system configuration.
        :raises RuntimeError: The configuration for the node this Python app is running as was not configured for networking.
        :return: The group that has been subscribed to.
        :rtype: ChannelGroup
        """
        if self.telemetry:
            groupCfg = self.config.lookupGroupByName(groupName)

            if not groupCfg:
                raise ValueError(f'Unknown group name "{groupName}".')
            
            return self.telemetry.subscribeToGroupCfg(groupCfg)

        raise RuntimeError('Volatus is not configured for networking and the telemetry component is not available.')

    def unsubscribe(self, group: ChannelGroup) -> bool:
        pass