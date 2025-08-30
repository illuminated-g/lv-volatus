from google.protobuf.internal import containers as _containers
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Optional as _Optional

DESCRIPTOR: _descriptor.FileDescriptor

class StringData(_message.Message):
    __slots__ = ("group_name", "data_timestamp", "strings")
    GROUP_NAME_FIELD_NUMBER: _ClassVar[int]
    DATA_TIMESTAMP_FIELD_NUMBER: _ClassVar[int]
    STRINGS_FIELD_NUMBER: _ClassVar[int]
    group_name: str
    data_timestamp: int
    strings: _containers.RepeatedScalarFieldContainer[str]
    def __init__(self, group_name: _Optional[str] = ..., data_timestamp: _Optional[int] = ..., strings: _Optional[_Iterable[str]] = ...) -> None: ...
