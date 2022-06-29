from typing import List
import pandas as pd

from opends.components.file import File


class Check:

    def __init__(self, data: pd.DataFrame, file: File, check_name: str) -> None:
        self.data: pd.DataFrame = data
        self.file: File = file
        self.check_name: str = check_name
        self.log_data: List[str] = []
        self.passed: bool = False

    def run(self) -> None:
        raise NotImplementedError(f"run function needs to be implemented for the {self.check_name}")
