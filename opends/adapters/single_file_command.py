import argparse
import os
from typing import List

import pandas as pd

from opends.checks import perform_checks
from opends.components.template_loader import TemplateLoader
from opends.version_control import DIR_PATH


class SingleCommandFileAdapter:

    def __init__(self, file_path: str, file_name: str) -> None:
        self.file_path: str = file_path
        self.file_name: str = file_name
        self.templates: TemplateLoader = TemplateLoader(file_path=DIR_PATH)
        self.data: pd.DataFrame = self._load_csv()

    def _load_csv(self) -> pd.DataFrame:
        return pd.read_csv(self.file_path)

    def run_checks(self) -> List[str]:
        return perform_checks(data=self.data, file=self.templates.files[self.file_name])


def main() -> None:
    args_parser = argparse.ArgumentParser()
    args_parser.add_argument('--name', action='store', type=str, required=True,
                             help="the name of the file being checked")
    args_parser.add_argument('--type', action='store', type=str, required=True,
                             help="type of file being checked like: Loc, Acc, ReinsInfo, ReinsScope")
    args = args_parser.parse_args()

    file_path = str(os.getcwd()) + f"/{args.name}"
    file_name = args.type

    log_data = SingleCommandFileAdapter(file_path=file_path, file_name=file_name).run_checks()

    with open(f'{os.getcwd()}/{file_name}_check_output.txt', mode='wt', encoding='utf-8') as file:
        file.write('\n'.join(log_data))
