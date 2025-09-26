import time
import threading
import queue
import ipaddress
from enum import Enum

from .config import Cfg, GroupConfig, ChannelConfig, EndpointConfig, VolatusConfig, NodeConfig
from .vecto.UDP import MulticastReader, MulticastWriter
from .vecto import util
from .vecto.proto import discovery_pb2

class DiscoveryActionType(Enum):
    UNKNOWN = 0
    CLOSE = 1

class DiscoveryAction:
    def __init__(self, type: DiscoveryActionType):
        self.type = type

class DiscoveryActionClose(DiscoveryAction):
    def __init__(self):
        super(DiscoveryActionClose, self).__init__(DiscoveryActionType.CLOSE)

class DiscoveryService:

    def __init__(self, vCfg: VolatusConfig, nodeCfg: NodeConfig):
        self._cluster = vCfg.lookupClusterByName(nodeCfg.clusterName)
        self._nodesLock = threading.Lock()
        self._nodes: dict[str, discovery_pb2.Discovery] = dict()
        self._actions: queue.Queue[DiscoveryAction] = queue.Queue()
        self._nodeCfg = nodeCfg
        self._vCfg = vCfg
        self._close = False

        self._reader = MulticastReader(self._cluster.discovery.address,
                                       self._cluster.discovery.port,
                                       nodeCfg.network.bindAddress)
        
        self._writer = MulticastWriter(self._cluster.discovery.address,
                                       self._cluster.discovery.port,
                                       nodeCfg.id,
                                       nodeCfg.network.bindAddress)

        self._readerThread: threading.Thread = threading.Thread(target= self._readerLoop)
        self._writerThread: threading.Thread = threading.Thread(target= self._writerLoop)

        self._readerThread.start()
        self._writerThread.start()

    def shutdown(self):
        self._actions.put(DiscoveryActionClose())

    def _writerLoop(self):
        interval = self._nodeCfg.network.announceInterval
        lastAnnounce = 0

        bindAddress = util.resolveAddress(self._nodeCfg.network.bindAddress)

        if bindAddress == '0.0.0.0':
            bindAddress = util.localIPs()[0]

        discovery = discovery_pb2.Discovery()
        discovery.node_id = self._nodeCfg.id
        discovery.name = self._nodeCfg.name
        discovery.ip = int(ipaddress.ip_address(bindAddress))
        discovery.system = self._vCfg.system.name
        discovery.cluster = self._nodeCfg.clusterName
        discovery.cfg_version = str(self._vCfg.version)

        if self._nodeCfg.network.httpPort:
            httpService = discovery_pb2.Service()
            httpService.type = discovery_pb2.ServiceType.SERVICETYPE_HTTPSERVER
            httpService.port = self._nodeCfg.network.httpPort

            discovery.services.append(httpService)

        payload = discovery.SerializeToString()

        while not self._close:
            now = time.time()
            if now - lastAnnounce > interval:
                self._writer.sendPayload(payload, 'v:Discovery', 0)
                lastAnnounce = now

            time.sleep(0.2)

    def _readerLoop(self):
        #connect to multicast
        self._reader.join()

        discovery = discovery_pb2.Discovery()

        while not self._close:
            #check for actions
            while not self._actions.empty():
                action = self._actions.get()
                match action.type:
                    case DiscoveryActionType.CLOSE:
                        self._close = True
                        continue
            
            if not self._close:
                #check reader for incoming discovery packets
                try:
                    udpPayload = self._reader.readUdpPayload()
                    if not udpPayload:
                        #disconnected or other error, rejoin
                        self._reader.leave()
                        self._reader.join()
                        continue

                    match udpPayload.type:
                        case 'v:Discovery':
                            discovery.ParseFromString(udpPayload.payload)

                            with self._nodesLock:
                                self._nodes[discovery.name] = discovery

                except TimeoutError:
                    pass
        
        self._reader.close()

