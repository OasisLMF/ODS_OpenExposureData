"""
suite of tools to read and write ODS file in csv of parquet
"""
__all__ = [
    'main',
]

import argparse
import logging

from .ods import oed

logger = logging.getLogger(__name__)

commands = {'convert': oed.ExposureData.convert}

main_parser = argparse.ArgumentParser()

convert_description = """
convert oed files to an other format

oed files path can be set in a config json file or directly as argument
if for an oed file (ex: location) is specify both in the config and the argument --location
the argument will be the one selected.
"""

command_parser = main_parser.add_subparsers(help='command [convert]', dest='command', required=True)
convert = command_parser.add_parser('convert', description=convert_description)
convert.add_argument('--location', help='Path to the location file', default=None)
convert.add_argument('--account', help='Path to the account file', default=None)
convert.add_argument('--ri_info', help='Path to the ri_info file', default=None)
convert.add_argument('--ri_scope', help='Path to the ri_scope file', default=None)
convert.add_argument('--check_oed', help='if True, oed file will be checked before convertion', default=False)
convert.add_argument('--config_json', help='Path to the config_json file', default=None)
convert.add_argument('-p', '--path', help='path of the output directory', required=True)
convert.add_argument('-c', '--compression', help='compression to use (ex: parquet, zip, gzip, csv,...)', required=True)
convert.add_argument('--save_config', help='if True, oed config file will be save in the --path directory', default=False)
convert.add_argument('-v', '--logging-level', help='logging level (debug:10, info:20, warning:30, error:40, critical:50)',
                     default=30, type=int)


def main():
    """command line interface for ODS conversion between csv and parquet"""
    kwargs = vars(main_parser.parse_args())
    ch = logging.StreamHandler()
    formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
    ch.setFormatter(formatter)
    logger.addHandler(ch)
    logging_level = kwargs.pop('logging_level')
    logger.setLevel(logging_level)

    commands[kwargs.pop('command')](**kwargs)


if __name__ == "__main__":
    main()
