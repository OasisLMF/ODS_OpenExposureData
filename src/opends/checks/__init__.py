"""
This file defines the entry point for running all checks on an individual file.
"""
from typing import List

import pandas as pd

from opends.checks.base import Check
from opends.checks.correct_data_type import CorrectDataTypeCheck
from opends.checks.correct_range import CorrectRangeCheck
from opends.checks.required_fields import RequiredFieldsCheck
from opends.checks.valid_fields import ValidFieldCheck
from opends.components.file import File


def perform_checks(data: pd.DataFrame, file: File) -> List[str]:
    """
    Performs all the checks on an individual file.

    Args:
        data: (pd.DataFrame) the data to have checks performed on
        file: (File) the metadata for the file being checked

    Returns: (List[str]) the logs of the file test stating that the check passed or where it failed
    """
    checks: List[Check] = [
        ValidFieldCheck(data=data, file=file),
        RequiredFieldsCheck(data=data, file=file),
        CorrectDataTypeCheck(data=data, file=file),
        CorrectRangeCheck(data=data, file=file)
    ]
    for check in checks:
        check.run()

    log_buffer = []
    
    for check in checks:
        for log in check.log_data:
            log_buffer.append(log)

    return log_buffer
