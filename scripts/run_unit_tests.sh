#!/usr/bin/env bash

# navigate to directory
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH
cd ..

if [ ! -d ./venv ];
then
    echo "virtual environment is not present creating venv"
    python3 -m venv venv
    echo "venv created"
    source venv/bin/activate
    pip install -r requirements.txt
else
    echo "virtual environment is already present"
    source venv/bin/activate
fi

export PYTHONPATH="$PWD/src/"
python -m unittest discover ./tests/
