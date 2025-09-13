from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Optional as _Optional

DESCRIPTOR: _descriptor.FileDescriptor

class TcpPayload(_message.Message):
    __slots__ = ("target_node", "source_id", "sequence", "timestamp", "type", "task_id", "payload")
    TARGET_NODE_FIELD_NUMBER: _ClassVar[int]
    SOURCE_ID_FIELD_NUMBER: _ClassVar[int]
    SEQUENCE_FIELD_NUMBER: _ClassVar[int]
    TIMESTAMP_FIELD_NUMBER: _ClassVar[int]
    TYPE_FIELD_NUMBER: _ClassVar[int]
    TASK_ID_FIELD_NUMBER: _ClassVar[int]
    PAYLOAD_FIELD_NUMBER: _ClassVar[int]
    target_node: int
    source_id: int
    sequence: int
    timestamp: int
    type: str
    task_id: str
    payload: bytes
    def __init__(self, target_node: _Optional[int] = ..., source_id: _Optional[int] = ..., sequence: _Optional[int] = ..., timestamp: _Optional[int] = ..., type: _Optional[str] = ..., task_id: _Optional[str] = ..., payload: _Optional[bytes] = ...) -> None: ...
