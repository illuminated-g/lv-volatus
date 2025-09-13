from google.protobuf.internal import enum_type_wrapper as _enum_type_wrapper
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class ConnectStatus(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = ()
    STATUS_UNKNOWN: _ClassVar[ConnectStatus]
    STATUS_SUCCESS: _ClassVar[ConnectStatus]
    STATUS_ERROR: _ClassVar[ConnectStatus]
    STATUS_BAD_CONFIG: _ClassVar[ConnectStatus]
    STATUS_BAD_SYSTEM: _ClassVar[ConnectStatus]
    STATUS_BAD_CLUSTER: _ClassVar[ConnectStatus]
STATUS_UNKNOWN: ConnectStatus
STATUS_SUCCESS: ConnectStatus
STATUS_ERROR: ConnectStatus
STATUS_BAD_CONFIG: ConnectStatus
STATUS_BAD_SYSTEM: ConnectStatus
STATUS_BAD_CLUSTER: ConnectStatus

class TcpServerHello(_message.Message):
    __slots__ = ("status",)
    STATUS_FIELD_NUMBER: _ClassVar[int]
    status: ConnectStatus
    def __init__(self, status: _Optional[_Union[ConnectStatus, str]] = ...) -> None: ...
