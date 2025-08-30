from volatus.telemetry import *
from volatus.config import *
from volatus.vecto.UDP import *
from volatus.vecto.proto.discovery_pb2 import *
import socket
import struct
import datetime

endpt = EndpointConfig("239.0.0.10", 36987)

discWriter = MulticastWriter(endpt.address(), endpt.port(), 5)

disc = Discovery(system='TestSystem', cluster='TestCluster', name='Python')
discWriter.sendPayload(disc.SerializeToString(), 'v:Discovery', 0)

discWriter.close()