from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Optional as _Optional

DESCRIPTOR: _descriptor.FileDescriptor

class SyncTicks(_message.Message):
    __slots__ = ("value_on_trigger",)
    VALUE_ON_TRIGGER_FIELD_NUMBER: _ClassVar[int]
    value_on_trigger: int
    def __init__(self, value_on_trigger: _Optional[int] = ...) -> None: ...
