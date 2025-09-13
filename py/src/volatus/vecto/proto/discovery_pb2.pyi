from google.protobuf.internal import containers as _containers
from google.protobuf.internal import enum_type_wrapper as _enum_type_wrapper
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Mapping as _Mapping, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class ServiceType(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = ()
    SERVICETYPE_UNKNOWN: _ClassVar[ServiceType]
    SERVICETYPE_TCPSERVER: _ClassVar[ServiceType]
    SERVICETYPE_HTTPSERVER: _ClassVar[ServiceType]
SERVICETYPE_UNKNOWN: ServiceType
SERVICETYPE_TCPSERVER: ServiceType
SERVICETYPE_HTTPSERVER: ServiceType

class Service(_message.Message):
    __slots__ = ("type", "port")
    TYPE_FIELD_NUMBER: _ClassVar[int]
    PORT_FIELD_NUMBER: _ClassVar[int]
    type: ServiceType
    port: int
    def __init__(self, type: _Optional[_Union[ServiceType, str]] = ..., port: _Optional[int] = ...) -> None: ...

class Discovery(_message.Message):
    __slots__ = ("node_id", "name", "ip", "status", "services", "capabilities", "system", "cluster", "app_version", "cfg_version")
    NODE_ID_FIELD_NUMBER: _ClassVar[int]
    NAME_FIELD_NUMBER: _ClassVar[int]
    IP_FIELD_NUMBER: _ClassVar[int]
    STATUS_FIELD_NUMBER: _ClassVar[int]
    SERVICES_FIELD_NUMBER: _ClassVar[int]
    CAPABILITIES_FIELD_NUMBER: _ClassVar[int]
    SYSTEM_FIELD_NUMBER: _ClassVar[int]
    CLUSTER_FIELD_NUMBER: _ClassVar[int]
    APP_VERSION_FIELD_NUMBER: _ClassVar[int]
    CFG_VERSION_FIELD_NUMBER: _ClassVar[int]
    node_id: int
    name: str
    ip: int
    status: str
    services: _containers.RepeatedCompositeFieldContainer[Service]
    capabilities: _containers.RepeatedScalarFieldContainer[str]
    system: str
    cluster: str
    app_version: str
    cfg_version: str
    def __init__(self, node_id: _Optional[int] = ..., name: _Optional[str] = ..., ip: _Optional[int] = ..., status: _Optional[str] = ..., services: _Optional[_Iterable[_Union[Service, _Mapping]]] = ..., capabilities: _Optional[_Iterable[str]] = ..., system: _Optional[str] = ..., cluster: _Optional[str] = ..., app_version: _Optional[str] = ..., cfg_version: _Optional[str] = ...) -> None: ...
