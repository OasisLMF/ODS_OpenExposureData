#!/bin/bash

set -e

DIR_BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [[ ! -d "$DIR_BASE/output/" ]]; then
    mkdir $DIR_BASE/output/
fi

# Clear prev wheels & tars
    find ./dist/ -name "ods_tools-*" -exec rm -rf {} \;

# Build
    pip install pip-tools wheel 
    python setup.py sdist
    python setup.py bdist_wheel

# test install 
    VER_PKG=$(cat ./src/__init__.py | grep  __version__ | awk -F"'" ' {print $2} ')
    WHL_PKG=$(find ./dist/ -name "ods_tools-${VER_PKG}*.whl")
