from netifaces import interfaces, ifaddresses, AF_INET
from enum import Enum
import socket
import struct

class IPType(Enum):
    UNKNOWN = 0
    SPECIFIC = 1
    SUBNET = 2
    ANY = 3

    def __str__(self):
        return f'{self.name}'

def ipToInt(ip: str) -> int:
    return struct.unpack("!L", socket.inet_aton(ip))[0]

def intToIp(ip: int) -> str:
    return socket.inet_ntoa(struct.pack('!L', ip))

def localIPs() -> list[str]:
    ips = []
    for interface in interfaces():
        links = ifaddresses(interface).get(AF_INET)
        if links:
            for link in links:
                ips.append(link['addr'])
    
    return ips

def splitSubnet(address: str) -> tuple[str, int]:
    parts = address.split('/')
    if len(parts) > 1:
        return (parts[0], int(parts[1]))
    
    return (parts[0], 32)

def ipType(address: str) -> IPType:
    addr, maskBits = splitSubnet(address)

    if maskBits < 32:
        return IPType.SUBNET
    
    if address == '0.0.0.0':
        return IPType.ANY
    
    ips = localIPs()

    if address in ips:
        return IPType.SPECIFIC
    
    return IPType.UNKNOWN

def resolveAddress(address: str) -> str | None:
    type = ipType(address)

    match type:
        case IPType.SPECIFIC:
            return address
        
        case IPType.ANY:
            return '0.0.0.0'
        
        case IPType.SUBNET:
            ips = localIPs()

            subAddr, maskBits = splitSubnet(address)
            shift = 32 - maskBits

            mask = 0

            for i in range(maskBits):
                mask = mask << 1 + 1

            mask = mask << shift

            iAddr = ipToInt(subAddr)
            subnet = iAddr & mask

            for ip in ips:
                masked = ipToInt(ip) & mask
                if masked == subnet:
                    return ip
                
    return None
