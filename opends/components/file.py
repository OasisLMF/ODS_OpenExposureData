from typing import Dict, Optional, List

from opends.components.field import DataField, Required


class FileFlyweight(type):

    _instances = {}

    def __call__(cls, *args, **kwargs):
        if len(args) > 0:
            name = args[0]
        else:
            name = kwargs["name"]

        if name not in cls._instances:
            cls._instances[name] = super(FileFlyweight, cls).__call__(*args, **kwargs)
        return cls._instances[name]


class File(metaclass=FileFlyweight):

    def __init__(self, name: str) -> None:
        self.name: str = name
        self.fields: Dict[str, DataField] = dict()
        self._field_names: Optional[List[str]] = None

    def add_field(self, field_data: dict) -> None:
        new_field = DataField.from_dict(input_data=field_data)
        self.fields[new_field.name] = new_field

    @property
    def field_names(self) -> List[str]:
        if self._field_names is None:
            self._field_names = list(self.fields.keys())
        return self._field_names

    @property
    def required_fields(self) -> List[str]:
        buffer = []
        for field_name in self.fields.keys():
            field = self.fields[field_name]
            if field.required == Required.R:
                buffer.append(field.name)
        return buffer
