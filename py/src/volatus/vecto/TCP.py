import socket
import struct
import time
import threading
import queue
from enum import Enum

from ..config import *

from .proto.tcp_payload_pb2 import *
from .proto.tcp_client_hello_pb2 import *

thread_local = threading.local()

class ClientState(Enum):
    UNKNOWN = 0
    IDLE = 1
    CONNECTING = 2
    CONNECTED = 3
    CLOSING = 4
    ERROR = 5
    SHUTDOWN = 6

    def __str__(self):
        return f'{self.name}'

class ServerState(Enum):
    UNKNOWN = 0
    IDLE = 1
    LISTENING = 2
    CLOSING = 3
    ERROR = 4
    SHUTDOWN = 5

    def __str__(self):
        return f'{self.name}'

class TCPAction(Enum):
    UNKNOWN = 0
    OPEN = 1
    CLOSE = 2
    SHUTDOWN = 3

    def __str__(self):
        return f'{self.name}'

class ClientInfo:
    def __init__(self, address: tuple[str, int]):
        self.address = address

class TCPMessaging(socket.socket):
    def __init__(self, address: str, port: int, server: bool, vCfg: VolatusConfig, nodeCfg: NodeConfig):
        self.address = address
        self.port = port
        self.server = server
        self.state: str = 'UNKNOWN'
        self.vCfg = vCfg
        self.nodeCfg = nodeCfg

        self.id = nodeCfg.id

        self._actionQ: queue.Queue[TCPAction] = queue.Queue()
        self._sendQueue: queue.Queue[TcpPayload] = queue.Queue()

        super(TCPMessaging, self).__init__(socket.AF_INET, socket.SOCK_STREAM)

        self.settimeout(5)

        if self._server:
            raise ValueError('Server mode is not implemented in Python yet.')
        else:
            self._thread = threading.Thread(target= self._clientLoop)

        self._thread.start()

    def sendMsg(self, target: str, type: str, payload: bytes, sequence: int, task: str = ''):
        targetId = self.vCfg.lookupNodeByName(target).id

        if targetId:
            #timestamp (0) is set when actually sent
            toSend = TcpPayload(targetId, self.id, sequence, 0, type, task, payload)
            self._sendQueue.put(toSend)

    def _clientLoop(self):
        clientHello = TcpClientHello()
        clientHello.system = self.vCfg.system
        clientHello.cluster = self.nodeCfg.clusterName
        clientHello.node_id = self.nodeCfg.id
        clientHello.node_name = self.nodeCfg.name
        clientHello.config_version = str(self.vCfg.version())
        helloPayload = clientHello.SerializeToString()

        tcpPayload = TcpPayload()
        tcpPayload.source_id = self.nodeCfg.id

        state = ClientState.IDLE
        self.state = str(state)

        shutdown = False
        open = False

        while not shutdown:
            #check actionQ for commands
            while not self._actionQ.empty():
                action = self._actionQ.get_nowait()
                match action:
                    case TCPAction.OPEN:
                        if state == ClientState.IDLE:
                            open = True
                            state = ClientState.CONNECTING
                            self.state = str(state)

                    case TCPAction.CLOSE:
                        if state != ClientState.IDLE:
                            open = False
                            state = ClientState.CLOSING
                            self.state = str(state)

                    case TCPAction.SHUTDOWN:
                        shutdown = True
                        if state != ClientState.IDLE:
                            state = ClientState.CLOSING
                            self.state = str(state)

            #flush the queue while not connected
            if state != ClientState.CONNECTED:
                while not self._sendQueue.empty():
                    self._sendQueue.get_nowait()

            if state == ClientState.CONNECTING:
                #make an attempt at connecting to the server
                try:
                    self.connect(self.address)
                    state = ClientState.CONNECTED
                    self.state = str(state)
                except:
                    pass

            if state == ClientState.CONNECTED:
                #check for messages to send
                while not self._sendQueue.empty():
                    payload = self._sendQueue.get_nowait()
                    payload.timestamp = time.time_ns()

                    try:
                        self.sendall(payload.SerializeToString())
                    except:
                        state = ClientState.CLOSING
                        self.state = str(state)
                        continue

                #check for incoming messages
                while True:
                    sizeBytes = self.recv(4)
                    if sizeBytes == 0:
                        state = ClientState.CLOSING
                        self.state = str(state)
                        break
                    else:
                        size = int.from_bytes(sizeBytes, 'little')
                        recvBytes = self.recv(size)
                        if len(recvBytes) < size:
                            state = ClientState.CLOSING
                            self.state = str(state)
                        
                        tcpPayload.ParseFromString(recvBytes)
                        #TODO handle receiving messages

            if state == ClientState.CLOSING:
                self.shutdown()
                self.close()

                if open and not shutdown:
                    #error during send, try to reconnect
                    state = ClientState.CONNECTING
                    self.state = str(state)
                elif shutdown:
                    state = ClientState.SHUTDOWN
                    self.state = str(state)

    def _serverClientLoop(self):
        pass

    def _serverLoop(self):
        pass