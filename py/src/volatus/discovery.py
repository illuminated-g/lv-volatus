import time
import threading
import queue
from enum import Enum

from .config import Cfg, GroupConfig, ChannelConfig, EndpointConfig, VolatusConfig, NodeConfig
from .vecto.UDP import MulticastReader, MulticastWriter
from .vecto.proto import discovery_pb2

class DiscoveryService:

    def __init__(self, vCfg: VolatusConfig, nodeCfg: NodeConfig):
        cluster = vCfg.lookupClusterByName(nodeCfg.clusterName)
        