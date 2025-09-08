import socket
import struct
import time
import threading
import queue
from enum import Enum

from ..config import *

from .proto.tcp_payload_pb2 import *
from .proto.tcp_client_hello_pb2 import *
from .proto.tcp_server_hello_pb2 import *

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

class TCPMessaging:
    def __init__(self, address: str, port: int, server: bool, vCfg: VolatusConfig, nodeCfg: NodeConfig):
        self.address = address
        self.port = port
        self.server = server
        self.state: str = 'UNKNOWN'
        self.vCfg = vCfg
        self.nodeCfg = nodeCfg
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

        self.id = nodeCfg.id

        self._actionQ: queue.Queue[TCPAction] = queue.Queue()
        self._sendQueue: queue.Queue[TcpPayload] = queue.Queue()

        self.socket.settimeout(5)

        if self.server:
            raise ValueError('Server mode is not implemented in Python yet.')
        else:
            self._thread = threading.Thread(target= self._clientLoop)

        self._thread.start()
    
    def open(self):
        self._actionQ.put(TCPAction.OPEN)

    def close(self):
        self._actionQ.put(TCPAction.CLOSE)
    
    def shutdown(self):
        self._actionQ.put(TCPAction.SHUTDOWN)

    def sendMsg(self, target: str, type: str, payload: bytes, sequence: int, task: str = ''):
        targetId = self.vCfg.lookupNodeByName(target).id

        if targetId:
            #timestamp (0) is set when actually sent
            toSend = TcpPayload()
            toSend.target_node = targetId
            toSend.source_id = self.id
            toSend.sequence = sequence
            toSend.type = type
            toSend.task_id = task
            toSend.payload = payload
            self._sendQueue.put(toSend)

    def _clientLoop(self):
        clientHello = TcpClientHello()
        clientHello.node_id = self.nodeCfg.id
        clientHello.system = self.vCfg.system.name
        clientHello.cluster = self.nodeCfg.clusterName
        clientHello.node_name = self.nodeCfg.name
        clientHello.config_version = str(self.vCfg.version)
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
                        if state == ClientState.CONNECTED:
                            state = ClientState.CLOSING
                            self.state = str(state)

            #flush the queue while not connected
            if state != ClientState.CONNECTED:
                while not self._sendQueue.empty():
                    self._sendQueue.get_nowait()

            if state == ClientState.CONNECTING:
                #make an attempt at connecting to the server
                self.socket.connect((self.address, self.port))

                # connection handshake, client starts by sending ClientHello
                self.__sendSized(helloPayload)

                # server responds with ServerHello
                serverPayload = self.__recvSized()
                if serverPayload:
                    serverHello = TcpServerHello()
                    serverHello.ParseFromString(serverPayload)
                    if serverHello.status == ConnectStatus.STATUS_SUCCESS:
                        state = ClientState.CONNECTED
                        self.state = str(state)
                    else:
                        raise RuntimeError(
                            f'Connection error {serverHello.status} from server, aborting.'
                        )

            if state == ClientState.CONNECTED:
                #check for messages to send
                while not self._sendQueue.empty():
                    payload = self._sendQueue.get_nowait()
                    payload.timestamp = time.time_ns()

                    try:
                        self.__sendSized(payload.SerializeToString())
                    except:
                        state = ClientState.CLOSING
                        self.state = str(state)
                        continue

                #check for incoming messages
                # while True:
                #     recvBytes = self.__recvSized()
                #     if recvBytes:
                #         tcpPayload.ParseFromString(recvBytes)
                #         #TODO handle receiving messages
                #     else:
                #         state = ClientState.CLOSING
                #         self.state = str(state)
                #         break

            if state == ClientState.CLOSING:
                self.socket.shutdown(socket.SHUT_RDWR)
                self.socket.close()

                if open and not shutdown:
                    #error during send, try to reconnect
                    state = ClientState.CONNECTING
                    self.state = str(state)
                elif shutdown:
                    state = ClientState.SHUTDOWN
                    self.state = str(state)

    def __sendSized(self, payload: bytes):
        l = len(payload)
        lb = l.to_bytes(4, 'little')
        buf = lb + payload
        self.socket.sendall(buf)

    def __recvSized(self) -> bytes:
        sizeBytes = self.socket.recv(4)
        if len(sizeBytes) == 0:
            return bytes()
        else:
            size = int.from_bytes(sizeBytes, 'little')
            recvBytes = self.socket.recv(size)
            if len(recvBytes) < size:
                return bytes()
            
            return recvBytes

    def _serverClientLoop(self):
        pass

    def _serverLoop(self):
        pass