from google.protobuf.internal import containers as _containers
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Optional as _Optional

DESCRIPTOR: _descriptor.FileDescriptor

class GroupData(_message.Message):
    __slots__ = ("group_name", "data_timestamp", "scaled_data", "raw_data")
    GROUP_NAME_FIELD_NUMBER: _ClassVar[int]
    DATA_TIMESTAMP_FIELD_NUMBER: _ClassVar[int]
    SCALED_DATA_FIELD_NUMBER: _ClassVar[int]
    RAW_DATA_FIELD_NUMBER: _ClassVar[int]
    group_name: str
    data_timestamp: int
    scaled_data: _containers.RepeatedScalarFieldContainer[float]
    raw_data: _containers.RepeatedScalarFieldContainer[float]
    def __init__(self, group_name: _Optional[str] = ..., data_timestamp: _Optional[int] = ..., scaled_data: _Optional[_Iterable[float]] = ..., raw_data: _Optional[_Iterable[float]] = ...) -> None: ...
