import argparse
import os
from typing import List

from opends.adapters.single_file_test import SingleFileTestAdapter
from opends.checks.cross_checks import perform_checks
from opends.enums import FileNames


class CrossFileTestAdapter:

    def __init__(self, left_file_path: str, left_file_name: FileNames,
                 right_file_path: str, right_file_name: FileNames, version: str) -> None:
        self.left_file_adapter: SingleFileTestAdapter = SingleFileTestAdapter(
            file_path=left_file_path, file_name=left_file_name, version=version
        )
        self.right_file_adapter: SingleFileTestAdapter = SingleFileTestAdapter(
            file_path=right_file_path, file_name=right_file_name, version=version
        )

    def run_checks(self) -> List[str]:
        return perform_checks(
            left_data=self.left_file_adapter.data,
            left_file=self.left_file_adapter.templates.files[self.left_file_adapter.file_name.value],
            right_data=self.right_file_adapter.data,
            right_file=self.right_file_adapter.templates.files[self.right_file_adapter.file_name.value]
        )


def main() -> None:
    """
    Entry point for a terminal command that checks the file.

    Returns: None
    """
    args_parser = argparse.ArgumentParser()
    args_parser.add_argument('--lname', action='store', type=str, required=True,
                             help="the name of the left file being checked")
    args_parser.add_argument('--ltype', action='store', type=str, required=True,
                             help="type of left file being checked like: Loc, Acc, ReinsInfo, ReinsScope")
    args_parser.add_argument('--rname', action='store', type=str, required=True,
                             help="the name of the right file being checked")
    args_parser.add_argument('--rtype', action='store', type=str, required=True,
                             help="type of right file being checked like: Loc, Acc, ReinsInfo, ReinsScope")
    args_parser.add_argument('--version', action='store', type=str, required=True,
                             help="the OED version to be run")
    args = args_parser.parse_args()

    left_file_path = str(os.getcwd()) + f"/{args.rname}"
    left_file_name = FileNames(args.ltype)
    right_file_path = str(os.getcwd()) + f"/{args.rname}"
    right_file_name = FileNames(args.ltype)

    adapter = CrossFileTestAdapter(
        left_file_path=left_file_path,
        left_file_name=left_file_name,
        right_file_path=right_file_path,
        right_file_name=right_file_name,
        version=args.version
    )
    log_data = adapter.run_checks()

    with open(f'{os.getcwd()}/{left_file_name.value}_cross_check_output.txt', mode='wt', encoding='utf-8') as file:
        file.write('\n'.join(log_data))

