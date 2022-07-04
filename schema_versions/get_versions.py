"""
This file gets the supported versions data standards files and generates JSON schemas for them.
"""
import os
from subprocess import Popen

DIR_PATH = str(os.path.dirname(os.path.realpath(__file__)))
ROOT_PATH = str(os.path.dirname(os.path.realpath(__file__))).replace("schema_versions", "") + "/generateJSONschema.py"

SUPPORTED_VERSIONS = [
        "1.1.5",
        "2.0.0",
        "2.0.1",
        "2.1.1",
        "2.1.2",
        "2.2.0",
        "2.3.0",
        "2.3.1"
    ]


if __name__ == "__main__":
    print("getting all supported versions")

    # get the schema file
    for version in SUPPORTED_VERSIONS:
        clean_version = version.replace(".", "_")
        command = f"wget https://github.com/OasisLMF/OpenDataStandards/raw/{version}/" \
                  f"OpenExposureData/Docs/OpenExposureData_Spec.xlsx"
        get_file = Popen(f"cd {DIR_PATH} && {command}", shell=True)
        get_file.wait()

        command_two = f"mv OpenExposureData_Spec.xlsx exposure_data{clean_version}.xlsx"
        move_file = Popen(f"cd {DIR_PATH} && {command_two}", shell=True)
        move_file.wait()

        command_three = f"python {ROOT_PATH} --version {version}"
        run_schema_creation = Popen(command_three, shell=True)
        run_schema_creation.wait()
