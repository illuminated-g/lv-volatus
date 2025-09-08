from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Optional as _Optional

DESCRIPTOR: _descriptor.FileDescriptor

class TcpClientHello(_message.Message):
    __slots__ = ("node_id", "system", "cluster", "node_name", "app_version", "config_version", "config_hash")
    NODE_ID_FIELD_NUMBER: _ClassVar[int]
    SYSTEM_FIELD_NUMBER: _ClassVar[int]
    CLUSTER_FIELD_NUMBER: _ClassVar[int]
    NODE_NAME_FIELD_NUMBER: _ClassVar[int]
    APP_VERSION_FIELD_NUMBER: _ClassVar[int]
    CONFIG_VERSION_FIELD_NUMBER: _ClassVar[int]
    CONFIG_HASH_FIELD_NUMBER: _ClassVar[int]
    node_id: int
    system: str
    cluster: str
    node_name: str
    app_version: str
    config_version: str
    config_hash: str
    def __init__(self, node_id: _Optional[int] = ..., system: _Optional[str] = ..., cluster: _Optional[str] = ..., node_name: _Optional[str] = ..., app_version: _Optional[str] = ..., config_version: _Optional[str] = ..., config_hash: _Optional[str] = ...) -> None: ...
