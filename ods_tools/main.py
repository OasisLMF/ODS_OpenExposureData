"""
suite of tools to read and write ODS file in csv of parquet
"""
__all__ = [
    'main',
    'convert',
    'check'
]

import argparse
import logging

from .oed import OedExposure, OdsException

logger = logging.getLogger(__name__)


def get_oed_exposure(config_json=None, oed_dir=None, **kwargs):
    if config_json:
        return OedExposure.from_config(config_json, **kwargs)
    elif oed_dir:
        return OedExposure.from_dir(oed_dir, **kwargs)
    else:
        return OedExposure(**kwargs)


def extract_exposure_args(kwargs):
    exposure_kwargs = {}
    for param in ['location', 'account', 'ri_info', 'ri_scope', 'oed_dir', 'check_oed', 'config_json', 'validation_config']:
        value = kwargs.pop(param, None)
        if value is not None:
            exposure_kwargs[param] = value
    return exposure_kwargs


def check(**kwargs):
    """run the check command on Exposure"""
    oed_exposure = get_oed_exposure(**extract_exposure_args(kwargs))
    oed_exposure.check(**kwargs)


def convert(**kwargs):
    """Convert exposure data to an other format (ex: csv to parquet)"""
    path = kwargs.pop('output_dir', None) or kwargs.get('oed_dir', None)
    if not path:
        raise OdsException('--output-dir or --oed-dir need to be provided to perform convert')
    oed_exposure = get_oed_exposure(**extract_exposure_args(kwargs))
    oed_exposure.save(path=path, **kwargs)


command_action = {
    'check': check,
    'convert': convert,
}


def add_exposure_data_args(command):
    command.add_argument('--location', help='Path to the location file', default=None)
    command.add_argument('--account', help='Path to the account file', default=None)
    command.add_argument('--ri-info', help='Path to the ri_info file', default=None)
    command.add_argument('--ri-scope', help='Path to the ri_scope file', default=None)
    command.add_argument('--oed-dir', help='Path to the OED directory containing stardard named OED files', default=None)
    command.add_argument('--config-json', help='Path to the config_json file', default=None)
    command.add_argument('--validation-config', help='Path to the validation_config file', default=None)


main_parser = argparse.ArgumentParser()

oed_exposure_creation = """
there are several options to specify the exposure data,
 - by providing  the path to each OED source using `--location`, `--account`, `--ri-info`, `--ri-scope`.
 - by providing  an OED config json file using `--config-json`.
 - by providing  the path to the directory where the exposure is stored using `--oed-dir`.
 
if multiple options are use at the same time, --config-json will have the priority over --oed-dir
specific paths (--location, --account, --ri-info, --ri-scope) will overwrite the path found in (--config-json or --oed-dir)
 """


convert_description = """
convert OED files to an other format
"""

command_parser = main_parser.add_subparsers(help='command [convert]', dest='command', required=True)
convert_command = command_parser.add_parser('convert', description=convert_description +
                                            oed_exposure_creation, formatter_class=argparse.RawTextHelpFormatter)
add_exposure_data_args(convert_command)
convert_command.add_argument('--check-oed', help='if True, OED file will be checked before convertion', default=False)
convert_command.add_argument('--output-dir', help='path of the output directory', required=False)
convert_command.add_argument('-c', '--compression', help='compression to use (ex: parquet, zip, gzip, csv,...)', required=True)
convert_command.add_argument('--save-config', help='if True, OED config file will be save in the --path directory', default=False)
convert_command.add_argument('-v', '--logging-level', help='logging level (debug:10, info:20, warning:30, error:40, critical:50)',
                             default=30, type=int)

check_description = """
check exposure data.
"""

check_command = command_parser.add_parser('check', description=check_description + oed_exposure_creation,
                                          formatter_class=argparse.RawTextHelpFormatter)
add_exposure_data_args(check_command)
check_command.add_argument('-v', '--logging-level', help='logging level (debug:10, info:20, warning:30, error:40, critical:50)',
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

    command_action[kwargs.pop('command')](** kwargs)


if __name__ == "__main__":
    main()
