import os
from typing import List, Optional

from opends.adapters.single_file_test import SingleFileTestAdapter
from opends.enums import FileNames
import argparse


class ReinsuranceFilesTestAdapter:

    def __init__(self, version: str, root_path: str) -> None:
        self.version: str = version
        self.root_path: str = root_path
        self._csv_files: Optional[List[str]] = None
        self.reinscope: Optional[SingleFileTestAdapter] = None
        self.reinsinfo: Optional[SingleFileTestAdapter] = None
        self.acc: Optional[SingleFileTestAdapter] = None
        self.loc: Optional[SingleFileTestAdapter] = None
        self._load_files()

    def _load_files(self) -> None:
        file_names: List[FileNames] = [x for x in FileNames]
        file_names_strs: List[str] = [x.value for x in FileNames]

        for name in self.csv_files:
            for x in range(0, len(file_names_strs)):
                if file_names_strs[x].casefold() in name:
                    self.load_file_adapter(file_path=f"{self.root_path}/{name}", file_name=file_names[x])
                    break

    def load_file_adapter(self, file_path: str, file_name: FileNames) -> None:
        if file_name == FileNames.REINSSCOPE:
            self.reinscope = SingleFileTestAdapter(file_path=file_path, file_name=file_name, version=self.version)
        elif file_name == FileNames.ACC:
            self.acc = SingleFileTestAdapter(file_path=file_path, file_name=file_name, version=self.version)
        elif file_name == FileNames.LOC:
            self.loc = SingleFileTestAdapter(file_path=file_path, file_name=file_name, version=self.version)
        elif file_name == FileNames.REINSINFO:
            self.reinsinfo = SingleFileTestAdapter(file_path=file_path, file_name=file_name, version=self.version)
        else:
            raise ValueError(f"{file_name} is not supported")

    @property
    def csv_files(self) -> List[str]:
        if self._csv_files is None:
            all_files = os.listdir(self.root_path)
            self._csv_files = list(filter(lambda f: f.endswith('.csv'), all_files))
            self._csv_files.sort()
        return self._csv_files


