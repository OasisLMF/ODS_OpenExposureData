"""
This file defines the class that loads all the metadata around data standards metadata for all files.
"""
import json
from typing import Optional, List


class TemplateMetaLoaderSingleton(type):
    """
    This class implements the Singleton pattern
    """
    instances = {}

    def __call__(cls, *args, **kwargs):
        if cls not in cls.instances:
            cls.instances[cls] = super(TemplateMetaLoaderSingleton, cls).__call__(*args, **kwargs)
        return cls.instances[cls]


class TemplateMetaLoader(metaclass=TemplateMetaLoaderSingleton):
    """
    This class loads metadata around the schema.

    Attributes:
         file_path (str): the path to the JSON file that houses all the metadata for the schema
    """
    def __init__(self, file_path: str) -> None:
        """
        The constructor for the TemplateMetaLoader class.

        Args:
            file_path: (str) the path to the JSON file that houses all the metadata for all the files
        """
        self.file_path: str = file_path
        self._data: Optional[dict] = None

    def _load_json_file(self) -> dict:
        """
        Loads all the metadata for all the files from a JSON file.

        Returns: (dict) data loaded from the JSON file
        """
        with open(self.file_path, 'r') as json_file:
            return json.load(json_file)

    @property
    def data(self) -> dict:
        if self._data is None:
            self._data = self._load_json_file()
        return self._data

    @property
    def supported_perils(self) -> List[str]:
        return self.data["supported perils"]

    @property
    def supported_oed_codes(self) -> List[str]:
        return self.data["supported OED codes"]


def get_template_meta_data(name: str) -> TemplateMetaLoader:
    """
    Gets the meta-data that is already loaded.

    Warnings:
        This error will raise a ValueError if the meta-data is not already loaded.

    Args:
        name: (str) name of process accessing the meta-data

    Returns: (TemplateMetaLoader) The meta-data that is already loaded
    """
    meta_data: Optional[TemplateMetaLoader] = TemplateMetaLoaderSingleton.instances.get(TemplateMetaLoader)
    if meta_data is None:
        raise ValueError(f"meta data has not been loaded before {name}")
    return meta_data
