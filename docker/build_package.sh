#!/bin/bash


DIR_BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [[ ! -d "$DIR_BASE/output/" ]]; then
    mkdir $DIR_BASE/output/
fi

# Clear prev wheels & tars
    find ./dist/ -name "ods_tools-*" -exec rm -rf {} \;

set -e
# Create Spec Json
    extract_spec.py json --source-excel-path ./OpenExposureData/Docs/OpenExposureData_Spec.xlsx \
                         --output-json-path ./ods_tools/data/OpenExposureData_Spec.json

# Build
    pip install pip-tools wheel 
    python setup.py sdist
    python setup.py bdist_wheel

# test install 
    VER_PKG=$(cat ./ods_tools/__init__.py | grep  __version__ | awk -F"'" ' {print $2} ')
    WHL_PKG=$(find ./dist/ -name "ods_tools-${VER_PKG}*.whl")
