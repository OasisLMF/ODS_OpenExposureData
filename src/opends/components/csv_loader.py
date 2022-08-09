"""
This file defines the class that loads a CSV file with correct Dtypes from fields defined in the schema.
"""
from typing import Dict, List

import pandas as pd

from opends.components.template_loader import TemplateLoader
from opends.components.template_meta_loader import TemplateMetaLoader
from opends.enums import FileNames
from opends.version_control import SchemaPath, SchemaMetaDataPath


class CsvLoader:
    """
    This class is responsible for loading CSV data with specific data types based on the schema loaded.

    Attributes:
        template_data (TemplateLoader): the metadata around the file and schema for that file being loaded
        meta_data (TemplateMetaLoader): the metadata around the template_data
        data_path (str): the path to the file being loaded
        file_type (FileNames): the type of file being loaded
    """
    def __init__(self, version: str, data_path: str, file_type: FileNames) -> None:
        """
        The constructor for the CsvLoader class.

        Args:
            version: (str) the version of the schema being loaded
            data_path: (str) the path to the data that is going to be loaded
            file_type: (FileNames) the type of file being loaded
        """
        self.template_data: TemplateLoader = TemplateLoader(file_path=SchemaPath(version_string=version))
        self.meta_data: TemplateMetaLoader = TemplateMetaLoader(file_path=SchemaMetaDataPath(version_string=version))
        self.data_path: str = data_path
        self.file_type: FileNames = file_type

    def _get_types(self) -> Dict[str, str]:
        """
        Gets the Pandas data types from the data fields that are needed.

        Returns: (Dict[str, str]) the name of the data field and the pandas data type
        """
        type_dict: Dict[str, str] = dict()

        data_columns: List[str] = pd.read_csv(self.data_path).columns.values.tolist()
        file = self.template_data.files.get(self.file_type.value)

        for data_column in data_columns:
            data_field = file.fields.get(data_column)
            if data_field is not None:
                type_dict[data_field.name] = data_field.pandas_value.pandas_value

        return type_dict

    def read(self) -> pd.DataFrame:
        """
        Reads the CSV file with specific data types.

        Returns: (pd.DataFrame) the loaded data
        """
        d_types_dict = self._get_types()
        return pd.read_csv(self.data_path, dtype=d_types_dict)

    def unsafe_read(self) -> pd.DataFrame:
        """
        Reads the CSV file with no specific types specified.

        Returns: (pd.DataFrame) the loaded data
        """
        return pd.read_csv(self.data_path)
