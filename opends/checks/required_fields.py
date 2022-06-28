from typing import List
import pandas as pd

from opends.components.file import File


class RequiredFieldsCheck:

    def __init__(self, data: pd.DataFrame, file: File) -> None:
        self.data: pd.DataFrame = data
        self.file: File = file
        self.log_data: List[str] = []

    def log(self) -> None:
        pass

    def check(self) -> bool:
        pass

    def run(self) -> None:
        outcome = self.check()
        if outcome is False:
            self.log()
