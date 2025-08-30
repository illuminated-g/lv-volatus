from google.protobuf.internal import enum_type_wrapper as _enum_type_wrapper
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class AckNackResult(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = ()
    RESULT_UNKNOWN: _ClassVar[AckNackResult]
    RESULT_ACK: _ClassVar[AckNackResult]
    RESULT_INVALIDTARGET: _ClassVar[AckNackResult]
    RESULT_INVALIDTASK: _ClassVar[AckNackResult]
    RESULT_DISALLOWED: _ClassVar[AckNackResult]
    RESULT_OUTOFSEQUENCE: _ClassVar[AckNackResult]
    RESULT_EXPIRED: _ClassVar[AckNackResult]
    RESULT_UNEXPECTED_TYPE: _ClassVar[AckNackResult]
    RESULT_PAYLOAD_ERROR: _ClassVar[AckNackResult]
RESULT_UNKNOWN: AckNackResult
RESULT_ACK: AckNackResult
RESULT_INVALIDTARGET: AckNackResult
RESULT_INVALIDTASK: AckNackResult
RESULT_DISALLOWED: AckNackResult
RESULT_OUTOFSEQUENCE: AckNackResult
RESULT_EXPIRED: AckNackResult
RESULT_UNEXPECTED_TYPE: AckNackResult
RESULT_PAYLOAD_ERROR: AckNackResult

class TcpAckNack(_message.Message):
    __slots__ = ("target_node", "sequence", "timestamp", "type", "task_id", "result")
    TARGET_NODE_FIELD_NUMBER: _ClassVar[int]
    SEQUENCE_FIELD_NUMBER: _ClassVar[int]
    TIMESTAMP_FIELD_NUMBER: _ClassVar[int]
    TYPE_FIELD_NUMBER: _ClassVar[int]
    TASK_ID_FIELD_NUMBER: _ClassVar[int]
    RESULT_FIELD_NUMBER: _ClassVar[int]
    target_node: int
    sequence: int
    timestamp: int
    type: str
    task_id: str
    result: AckNackResult
    def __init__(self, target_node: _Optional[int] = ..., sequence: _Optional[int] = ..., timestamp: _Optional[int] = ..., type: _Optional[str] = ..., task_id: _Optional[str] = ..., result: _Optional[_Union[AckNackResult, str]] = ...) -> None: ...
