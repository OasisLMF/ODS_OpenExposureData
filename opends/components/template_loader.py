import json
from typing import Dict, Optional

from opends.components.file import File


class TemplateLoader:

    def __init__(self, file_path: str) -> None:
        self.file_path: str = file_path
        self.files: Dict[str, File] = dict()
        self._data: Optional[dict] = None
        self._populate_files()

    def _load_json_file(self) -> None:
        with open(self.file_path, 'r') as json_file:
            self._data = json.load(json_file)

    def _populate_files(self) -> None:
        for i in self.data.keys():
            placeholder = self.data[i]
            placeholder["name"] = i

            for file_name in placeholder["file_names"]:
                file = self.get_or_insert(file_name=file_name)
                file.add_field(field_data=placeholder)

    def get_or_insert(self, file_name: str) -> File:
        file = self.files.get(file_name)

        if file is None:
            file = File(name=file_name)
            self.files[file_name] = file
        return file

    @property
    def data(self) -> dict:
        if self._data is None:
            self._load_json_file()
        return self._data
