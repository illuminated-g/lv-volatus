from pathlib import Path

from telemetry import Subscriber
from .config import VolatusConfig

class Volatus:
    def __init__(self, configPath: Path, systemName: str, clusterName: str, nodeName: str):
        self._system = systemName
        self._cluster = clusterName
        self._node = nodeName
        self._config = VolatusConfig()

        self.__loadConfig(configPath)

    def __loadConfig(self, path: Path):
        self._config.load(path)

    def __createTelemetry(self):
        pass

    def __startTCP(self):
        pass

    def config(self) -> VolatusConfig:
        return self._config

    def connect(self) -> bool:
        pass

    def close(self) -> bool:
        pass

    def subscribe(self, groupName: str) -> Subscriber :
        pass

    def unsubscribe(self, groupName: str) -> bool:
        pass