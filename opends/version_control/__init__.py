"""
This file defines the entrypoint for extracting data standards raw-data.

Warnings:
    - there is no version control at the moment this will be implemented in the future
"""
import json
import os

DIR_PATH = str(os.path.dirname(os.path.realpath(__file__))) + "/oed_schema.json"


def get_oed_schema() -> dict:
    """
    Gets the raw data for the data standards for all files.

    Returns: (dict) data standards for all files
    """
    with open(DIR_PATH, 'r') as json_file:
        return json.load(json_file)
