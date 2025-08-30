from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Optional as _Optional

DESCRIPTOR: _descriptor.FileDescriptor

class UdpPayload(_message.Message):
    __slots__ = ("source_id", "sequence", "timestamp", "type", "payload")
    SOURCE_ID_FIELD_NUMBER: _ClassVar[int]
    SEQUENCE_FIELD_NUMBER: _ClassVar[int]
    TIMESTAMP_FIELD_NUMBER: _ClassVar[int]
    TYPE_FIELD_NUMBER: _ClassVar[int]
    PAYLOAD_FIELD_NUMBER: _ClassVar[int]
    source_id: int
    sequence: int
    timestamp: int
    type: str
    payload: bytes
    def __init__(self, source_id: _Optional[int] = ..., sequence: _Optional[int] = ..., timestamp: _Optional[int] = ..., type: _Optional[str] = ..., payload: _Optional[bytes] = ...) -> None: ...
