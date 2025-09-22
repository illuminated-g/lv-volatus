from google.protobuf.internal import containers as _containers
from google.protobuf.internal import enum_type_wrapper as _enum_type_wrapper
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Mapping as _Mapping, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class EventLevel(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = ()
    EVENTLEVEL_UNKNOWN: _ClassVar[EventLevel]
    EVENTLEVEL_DEBUG: _ClassVar[EventLevel]
    EVENTLEVEL_INFO: _ClassVar[EventLevel]
    EVENTLEVEL_WARNING: _ClassVar[EventLevel]
    EVENTLEVEL_ERROR: _ClassVar[EventLevel]
EVENTLEVEL_UNKNOWN: EventLevel
EVENTLEVEL_DEBUG: EventLevel
EVENTLEVEL_INFO: EventLevel
EVENTLEVEL_WARNING: EventLevel
EVENTLEVEL_ERROR: EventLevel

class Error(_message.Message):
    __slots__ = ("status", "code", "source")
    STATUS_FIELD_NUMBER: _ClassVar[int]
    CODE_FIELD_NUMBER: _ClassVar[int]
    SOURCE_FIELD_NUMBER: _ClassVar[int]
    status: bool
    code: int
    source: str
    def __init__(self, status: bool = ..., code: _Optional[int] = ..., source: _Optional[str] = ...) -> None: ...

class Event(_message.Message):
    __slots__ = ("timestamp", "level", "context", "message", "error")
    TIMESTAMP_FIELD_NUMBER: _ClassVar[int]
    LEVEL_FIELD_NUMBER: _ClassVar[int]
    CONTEXT_FIELD_NUMBER: _ClassVar[int]
    MESSAGE_FIELD_NUMBER: _ClassVar[int]
    ERROR_FIELD_NUMBER: _ClassVar[int]
    timestamp: int
    level: EventLevel
    context: str
    message: str
    error: Error
    def __init__(self, timestamp: _Optional[int] = ..., level: _Optional[_Union[EventLevel, str]] = ..., context: _Optional[str] = ..., message: _Optional[str] = ..., error: _Optional[_Union[Error, _Mapping]] = ...) -> None: ...

class Events(_message.Message):
    __slots__ = ("events",)
    EVENTS_FIELD_NUMBER: _ClassVar[int]
    events: _containers.RepeatedCompositeFieldContainer[Event]
    def __init__(self, events: _Optional[_Iterable[_Union[Event, _Mapping]]] = ...) -> None: ...
