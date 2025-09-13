from google.protobuf.internal import containers as _containers
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Mapping as _Mapping, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class CmdAnalog(_message.Message):
    __slots__ = ("channel", "value")
    CHANNEL_FIELD_NUMBER: _ClassVar[int]
    VALUE_FIELD_NUMBER: _ClassVar[int]
    channel: str
    value: float
    def __init__(self, channel: _Optional[str] = ..., value: _Optional[float] = ...) -> None: ...

class CmdAnalogMultiple(_message.Message):
    __slots__ = ("values",)
    VALUES_FIELD_NUMBER: _ClassVar[int]
    values: _containers.RepeatedCompositeFieldContainer[CmdAnalog]
    def __init__(self, values: _Optional[_Iterable[_Union[CmdAnalog, _Mapping]]] = ...) -> None: ...
