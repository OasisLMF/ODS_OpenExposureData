"""
This file is a utility file for defining test data paths and getting schema data for unit tests.
"""
import json
import os

DIR_PATH = str(os.path.dirname(os.path.realpath(__file__))) + "/meta_data/oed_schema.json"
LOC_PATH = str(os.path.dirname(os.path.realpath(__file__))) + "/meta_data/loc.csv"
META_DATA_PATH = str(os.path.dirname(os.path.realpath(__file__))) + "/meta_data/"


def get_oed_schema() -> dict:
    with open(DIR_PATH, 'r') as json_file:
        return json.load(json_file)
