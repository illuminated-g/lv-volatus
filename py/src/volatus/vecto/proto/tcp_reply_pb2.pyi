from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Optional as _Optional

DESCRIPTOR: _descriptor.FileDescriptor

class TcpReply(_message.Message):
    __slots__ = ("request_sequence", "request_timestamp", "payload", "type")
    REQUEST_SEQUENCE_FIELD_NUMBER: _ClassVar[int]
    REQUEST_TIMESTAMP_FIELD_NUMBER: _ClassVar[int]
    PAYLOAD_FIELD_NUMBER: _ClassVar[int]
    TYPE_FIELD_NUMBER: _ClassVar[int]
    request_sequence: int
    request_timestamp: int
    payload: bytes
    type: str
    def __init__(self, request_sequence: _Optional[int] = ..., request_timestamp: _Optional[int] = ..., payload: _Optional[bytes] = ..., type: _Optional[str] = ...) -> None: ...
