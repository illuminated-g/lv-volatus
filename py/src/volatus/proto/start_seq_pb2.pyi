from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Optional as _Optional

DESCRIPTOR: _descriptor.FileDescriptor

class StartSeq(_message.Message):
    __slots__ = ("seq_name", "start_ticks")
    SEQ_NAME_FIELD_NUMBER: _ClassVar[int]
    START_TICKS_FIELD_NUMBER: _ClassVar[int]
    seq_name: str
    start_ticks: int
    def __init__(self, seq_name: _Optional[str] = ..., start_ticks: _Optional[int] = ...) -> None: ...
