from pathlib import Path

from telemetry import Subscriber

class Volatus:
    def __init__(self, configPath: Path, systemName: str, clusterName: str, nodeName: str):
        pass

    def connect(self) -> bool:
        pass

    def close(self) -> bool:
        pass

    def subscribe(self, groupName: str) -> Subscriber :
        pass

    def unsubscribe(self, groupName: str) -> bool:
        pass