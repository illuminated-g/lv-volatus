"""The core module containing the Volatus class to be used for handling configs and system interactions."""

from pathlib import Path
from collections.abc import Callable
from datetime import datetime

from volatus.telemetry import Telemetry, ChannelGroup
from volatus.config import VolatusConfig, NodeConfig, ConfigLoader, ClusterConfig
from volatus.vecto.TCP import TCPMessaging
from volatus.proto.cmd_digital_pb2 import CmdDigital, CmdDigitalMultiple
from volatus.proto.cmd_analog_pb2 import CmdAnalog, CmdAnalogMultiple
from volatus.proto.start_log_pb2 import StartLog
from volatus.proto.stop_log_pb2 import StopLog

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

class StartLogCommand(VCommand):
    """A prepared command to start logging across a set of target nodes that can be sent with send()
    """
    
    def __init__(self,
                 targetName: str,
                 testName: str,
                 seqFunc: Callable[[], int],
                 sendFunc: Callable[[str, str, bytes, int, str], None],
                 startedBy: str,
                 timestamp: str = ''):
        self._seqFunc = seqFunc
        self._sendFunc = sendFunc
        self._targetName = targetName
        self._timestamp = timestamp

        self._cmd = StartLog()
        self._cmd.series = testName
        self._cmd.started_by = startedBy

    def send(self):
        if not self._timestamp:
            self._timestamp = datetime.now().strftime('%Y%m%dT%H%M%S')

        self._cmd.timestamp = self._timestamp

        self._sendFunc(self._targetName, 'start_log', self._cmd.SerializeToString(), self._seqFunc(), '')

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

        self.systemName: str = systemName
        """The name of the system in the configuration to validate the correct system is being referenced."""

        self.clusterName: str = clusterName
        """The name of the cluster this app belongs to in the configuration."""

        self.nodeName: str = nodeName
        """The name of the node (application) to use from the configuration."""

        self.config: VolatusConfig = ConfigLoader.load(configPath)
        """The configuration from the configPath argument."""

        self._cluster: ClusterConfig
        self._node: NodeConfig
        self._telemetry: Telemetry
        self._tcp: TCPMessaging

        self._seq = 0

        cfgSystemName = self.config.system.name

        if systemName != cfgSystemName:
            raise ValueError(
                f'Created config object for "{systemName}" system but config loaded is for "{cfgSystemName}".')


        self._cluster = self.config.lookupClusterByName(clusterName)
        if self._cluster:
            self._node = self._cluster.lookupNodeByName(nodeName)

        if not self._node:
            raise ValueError(
                f'Unable to find node "{nodeName}" in cluster "{clusterName}".')

        self.__initFromConfig()

    def __createTelemetry(self):
        self._telemetry = Telemetry()

    def __startTCP(self):
        tcpCfg = self._node.network.tcp

        self._tcp = TCPMessaging(tcpCfg.address, tcpCfg.port, tcpCfg.server, self.config, self._node)
        self._tcp.open()

    def __initFromConfig(self):
        node = self._node
        cluster = self._cluster

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
        if self._tcp:
            self._tcp.shutdown()

        if self._telemetry:
            self._telemetry.shutdown()

    def lookupTargetId(self, targetName: str) -> int | None:
        """Looks up the numeric ID used to route a message to the desired node(s).

        Also useful for verifying if a target name is valid; unknown target names return None as the value.
        """
        #check if target is a node
        node = self._cluster.lookupNodeByName(targetName)
        if node:
            return node.id
        
        #check if target is a targetGroup
        targetGroup = self._cluster.lookupTargetGroupId(targetName)
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

        return VCommand(targetName, 'cmd_digital', cmd.SerializeToString(), self.__nextSeq, self._tcp.sendMsg, taskName)
    
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

        return VCommand(targetName, 'cmd_analog', cmd.SerializeToString(), self.__nextSeq, self._tcp.sendMsg, taskName)

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
        
        return VCommand(targetName, 'cmd_digital_multiple', cmd.SerializeToString(), self.__nextSeq(), self._tcp.sendMsg, taskName)

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
        
        return VCommand(targetName, 'cmd_analog_multiple', cmd.SerializeToString(), self.__nextSeq(), self._tcp.sendMsg, taskName)
    
    def createStartLogCommand(self, targetName: str, testName: str, startedBy: str, timestamp: str = '') -> VCommand:
        """Prepare a Start Log command to send to a Volatus system.

        :param targetName: Either the node or targetGroup to send the log command to.
        :type targetName: str
        :param testName: The primary name used for the log.
        :type testName: str
        :param startedBy: The user or source of the start log command.
        :type startedBy: str
        :param timestamp: The string representation of the time of the start log command, should be in basic ISO-8601
            format with second precision, when defaulted to '' it generates a timestamp string when the command is sent.
        :type timestamp: str, optional
        :return: The prepared command ready to be sent with send()
        :rtype: VCommand
        """
        cmd = StartLogCommand(
            targetName,
            testName,
            self.__nextSeq,
            self._tcp.sendMsg,
            startedBy,
            timestamp
        )

        return cmd
    
    def createStopLogCommand(self, targetName: str, reason: str) -> VCommand:
        cmd = StopLog()
        cmd.reason = reason
        return VCommand(targetName, 'stop_log', cmd.SerializeToString(), self.__nextSeq, self._tcp.sendMsg)

    def subscribe(self, groupName: str, timeout_s: float = None) -> tuple[ChannelGroup, bool]:
        """Subscribes to the telemetry data from the specified group.

        Groups are named collections of channels that are published together. Once subscribed, the channels within the group
        will be updated and values can be read from channel objects directly or all at once directly from the group.

        :param groupName: The name of the group to subscribe to.
        :type groupName: str
        :param timeout_s: How much time to wait for data to arrive after subscribing, defaults to None
        :type timeout_s: float
        :raises ValueError: The specified group name was not found in the system configuration.
        :raises RuntimeError: The configuration for the node this Python app is running as was not configured for networking.
        :return: The group that has been subscribed to.
        :rtype: tuple[ChannelGroup, bool]
        """

        
        if self._telemetry:
            groupCfg = self.config.lookupGroupByName(groupName)

            if not groupCfg:
                raise ValueError(f'Unknown group name "{groupName}".')
            
            bindAddress = self._node.network.bindAddress
            
            return self._telemetry.subscribeToGroupCfg(groupCfg, timeout_s)

        raise RuntimeError('Volatus is not configured for networking and the telemetry component is not available.')

    def unsubscribe(self, group: ChannelGroup):
        """Not implemented yet.

        :param group: The group that was subscribed to.
        :type group: ChannelGroup
        """
        pass