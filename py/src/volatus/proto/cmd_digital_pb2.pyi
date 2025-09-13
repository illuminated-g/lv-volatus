from google.protobuf.internal import containers as _containers
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Mapping as _Mapping, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class CmdDigital(_message.Message):
    __slots__ = ("channel", "value")
    CHANNEL_FIELD_NUMBER: _ClassVar[int]
    VALUE_FIELD_NUMBER: _ClassVar[int]
    channel: str
    value: bool
    def __init__(self, channel: _Optional[str] = ..., value: bool = ...) -> None: ...

class CmdDigitalMultiple(_message.Message):
    __slots__ = ("values",)
    VALUES_FIELD_NUMBER: _ClassVar[int]
    values: _containers.RepeatedCompositeFieldContainer[CmdDigital]
    def __init__(self, values: _Optional[_Iterable[_Union[CmdDigital, _Mapping]]] = ...) -> None: ...
