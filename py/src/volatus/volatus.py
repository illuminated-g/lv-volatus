from pathlib import Path

from .telemetry import *
from .config import *

class Volatus:
    def __init__(self, configPath: Path, systemName: str, clusterName: str, nodeName: str):
        self.systemName = systemName
        self.clusterName = clusterName
        self.nodeName = nodeName
        self.config: VolatusConfig = ConfigLoader.load(configPath)
        self.cluster: ClusterConfig
        self.node: NodeConfig
        self.telemetry: Telemetry

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
        pass

    def __initFromConfig(self):
        node = self.node
        cluster = self.cluster

        if node.network.tcp:
            self.__startTCP()
        
        self.__createTelemetry()

    def connect(self) -> bool:
        pass

    def close(self) -> bool:
        self.telemetry.close()

    def subscribe(self, groupName: str) -> ChannelGroup :
        groupCfg = self.config.lookupGroupByName(groupName)
        return self.telemetry.subscribeToGroupCfg(groupCfg)

    def unsubscribe(self, groupName: str) -> bool:
        pass