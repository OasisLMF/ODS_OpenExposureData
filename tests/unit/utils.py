import json
import os

DIR_PATH = str(os.path.dirname(os.path.realpath(__file__))) + "/meta_data/oed_schema.json"


def get_oed_schema() -> dict:
    with open(DIR_PATH, 'r') as json_file:
        return json.load(json_file)
