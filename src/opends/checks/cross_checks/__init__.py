"""
This file defines the entry point for running all checks on two files.
"""
from typing import List

import pandas as pd

from opends.checks.cross_checks.base import Check
from opends.checks.cross_checks.consistent_values import ConsistentValuesCheck
from opends.components.file import File


def perform_checks(left_data: pd.DataFrame, left_file: File, right_data: pd.DataFrame, right_file: File) -> List[str]:
    """
    Performs all the checks on two files.

    Args:
        left_data: (pd.DataFrame) data loaded from the left file
        left_file: (File) metadata about the right file
        right_data: (pd.DataFrame) data loaded from the right file
        right_file: (File) metadata about the left file

    Returns: (List[str]) the logs of the file test stating that the check passed or where it failed
    """
    checks: List[Check] = [
        ConsistentValuesCheck(left_data=left_data, left_file=left_file,
                              right_data=right_data, right_file=right_file,
                              column_name="PortNumber"),
        ConsistentValuesCheck(left_data=left_data, left_file=left_file,
                              right_data=right_data, right_file=right_file,
                              column_name="AccNumber")
    ]
    return _run_checks(checks=checks)


def perform_reinsurance_checks(reinscope_data: pd.DataFrame, reinscope_file: File,
                               right_data: pd.DataFrame, right_file: File) -> List[str]:
    # TODO => add reins checks that have guards that will do nothing if the file types are not matching the guard
    checks: List[Check] = [

    ]
    return _run_checks(checks=checks)


def _run_checks(checks: List[Check]) -> List[str]:
    """
    Runs a lists of Check instances and returns the log_data from all tests.

    Args:
        checks: (List[Check]) the checks that need to be run

    Returns: (List[str]) the logs of the file test stating that the check passed or where it failed
    """
    for check in checks:
        check.run()

    log_buffer = []

    for check in checks:
        for log in check.log_data:
            log_buffer.append(log)

    return log_buffer
