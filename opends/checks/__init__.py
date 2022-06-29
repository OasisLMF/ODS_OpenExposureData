from typing import List

import pandas as pd

from opends.checks.base import Check
from opends.checks.valid_fields import ValidFieldCheck
from opends.components.file import File


def perform_checks(data: pd.DataFrame, file: File) -> List[str]:
    checks: List[Check] = [
        ValidFieldCheck(data=data, file=file)
    ]
    for check in checks:
        check.run()

    log_buffer = []
    
    for check in checks:
        for log in check.log_data:
            log_buffer.append(log)

    return log_buffer
