"""
This file defines the class that loads all the data standards metadata for all files.
"""
import json
from typing import Dict, Optional

from opends.components.file import File


class TemplateLoaderSingleton(type):
    """
    This class implements the Singleton pattern
    """
    _instances = {}

    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            cls._instances[cls] = super(TemplateLoaderSingleton, cls).__call__(*args, **kwargs)
        return cls._instances[cls]


class TemplateLoader(metaclass=TemplateLoaderSingleton):
    """
    This class is responsible for loading the metadata around all the files and sorting them into File and DataField
    classes.

    Attributes:
        file_path (str): the path to the JSON file that houses all the metadata for all the files
        files (Dict[str, File]): a collection of files that house metadata around individual files
    """
    def __init__(self, file_path: str) -> None:
        """
        The constructor for the TemplateLoader class.

        Args:
            file_path: (str) the path to the JSON file that houses all the metadata for all the files
        """
        self.file_path: str = file_path
        self.files: Dict[str, File] = dict()
        self._data: Optional[dict] = None
        self._populate_files()

    def _load_json_file(self) -> dict:
        """
        Loads all the metadata for all the files from a JSON file.

        Returns: (dict) data loaded from the JSON file
        """
        with open(self.file_path, 'r') as json_file:
            return json.load(json_file)

    def _populate_files(self) -> None:
        """
        Populates File instances with data fields.

        Returns: None
        """
        for i in self.data.keys():
            placeholder = self.data[i]
            placeholder["name"] = i

            for file_name in placeholder["file_names"]:
                file = self.get_or_insert(file_name=file_name)
                file.add_field(field_data=placeholder)

    def get_or_insert(self, file_name: str) -> File:
        """
        Tries to get a File based on the name of that file.
        Inserts a new File instance if the File is not initially found.

        Args:
            file_name: (str) the name of the file being extracted

        Returns: (File) the extracted file, newly inserted or pre-existing
        """
        file = self.files.get(file_name)

        if file is None:
            file = File(name=file_name)
            self.files[file_name] = file
        return file

    @property
    def data(self) -> dict:
        if self._data is None:
            self._data = self._load_json_file()
        return self._data
