import socket
import struct
import time

from .proto.udp_payload_pb2 import *

class MulticastReader(socket.socket):
    def __init__(self, multicastAddress: str, multicastPort: int, bindAddress: str = ''):
        self._address= multicastAddress
        self._port = multicastPort
        self._bind = bindAddress
        self._joinReq = struct.pack("4sl", socket.inet_aton(self._address), socket.INADDR_ANY)

        super(MulticastReader, self).__init__(socket.AF_INET, socket.SOCK_DGRAM)
        self.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.bind((self._bind, self._port))

    def join(self):
        self.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, self._joinReq)
    
    def leave(self):
        self.setsockopt(socket.IPPROTO_IP, socket.IP_DROP_MEMBERSHIP, self._joinReq)

    def close(self):
        self.leave()
        super(MulticastReader, self).close()

    def readUdpPayload(self) -> UdpPayload | None:
        payload = self.recv(1500)

        if len(payload) == 0:
            return None
        
        udpPayload = UdpPayload()
        udpPayload.ParseFromString(payload)
        return udpPayload

class MulticastWriter(socket.socket):
    def __init__(self, multicastAddress: str, multicastPort: int, source_id: int, bindAddress: str = ''):
        self._address= multicastAddress
        self._port = multicastPort
        self._bind = bindAddress
        self._joinReq = struct.pack("4sl", socket.inet_aton(self._address), socket.INADDR_ANY)
        self._msg = UdpPayload()
        self._msg.source_id = source_id

        super(MulticastWriter, self).__init__(socket.AF_INET, socket.SOCK_DGRAM)
        self.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.bind((self._bind, self._port))

    def sendPayload(self, payload: bytes, type: str, sequence: int) -> int:
        msg = self._msg
        msg.sequence = sequence
        msg.timestamp = time.time_ns()
        msg.type = type
        msg.payload = payload

        return self.sendto(msg.SerializeToString(), (self._address, self._port))