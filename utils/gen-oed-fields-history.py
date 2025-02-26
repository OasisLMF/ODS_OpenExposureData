#!/usr/bin/env python3

import click
import pandas as pd
import re
import os
import pathlib
from packaging.version import Version, InvalidVersion


# Defaults
source_csv_default = pathlib.Path(os.path.dirname(os.path.realpath(__file__))).parent.joinpath('OpenExposureData')
history_file = 'OEDInputFieldsVersionHistory.csv'
current_fields_file = 'OEDInputFields.csv'


def check_semver_valid(version_str):
    semver_pattern = r"^(\d+)\.(\d+)\.(\d+)$"

    # reject if not semvar
    if not re.match(semver_pattern, version_str):
        raise ValueError("version is not valid semvar '{major}.{minor}.{patch}'")

    # Need CSV spec format to work, not excel, reject if lest than OED v4
    version = Version(version_str)
    if version < Version("4.0.0"):
        raise ValueError("This script requires the version be OED 4.0.0, or higher")

@click.command()
@click.option("--version-number", required=True, help="Name of new version")
@click.option("--source-csv-dir", default=source_csv_default, help="Path to dir with OED csv files")
def update_input_fields_history(version_number, source_csv_dir):
    # guard check version tag is semvar and over 4.0.0
    check_semver_valid(version_number)

    # read data
    version_history_fp = os.path.join(source_csv_dir, history_file)
    latest_fields_fp = os.path.join(source_csv_dir, current_fields_file)
    df_history=pd.read_csv(version_history_fp)
    df_latest=pd.read_csv(latest_fields_fp)

    # update history
    df_latest['version_number']=version_number
    df_updated=pd.concat([df_history, df_latest])
    df_updated.to_csv(version_history_fp, index=False)

if __name__ == "__main__":
    update_input_fields_history()
