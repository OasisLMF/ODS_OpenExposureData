from typing import List
import pandas as pd

from opends.components.file import File


class RequiredFieldsCheck:

    def __init__(self, data: pd.DataFrame, file: File) -> None:
        self.data: pd.DataFrame = data
        self.file: File = file
        self.log_data: List[str] = []

    def run(self) -> None:
        pass
