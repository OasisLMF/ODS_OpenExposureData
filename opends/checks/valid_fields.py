import pandas as pd

from opends.checks.base import Check
from opends.components.file import File


class ValidFieldCheck(Check):

    def __init__(self, data: pd.DataFrame, file: File) -> None:
        super().__init__(data=data, file=file, check_name="valid field")

    def run(self) -> None:
        data_columns = list(self.data)

        for column_name in data_columns:
            if self.file.fields.get(column_name) is None:
                self.log_data.append(f"field name: {column_name} for {self.file.name} file is not valid")

        if len(self.log_data) == 0:
            self.passed = True
