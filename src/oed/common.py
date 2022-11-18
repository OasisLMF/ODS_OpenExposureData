"""
common static variable and ods_tools exceptions
"""


class OdsException(Exception):
    pass


# PANDAS_COMPRESSION_MAP is also used to order the preferred input format in ExposureData.from_dir
PANDAS_COMPRESSION_MAP = {
    'parquet': '.parquet',
    'csv': '.csv',
    'zip': '.zip',
    'gzip': '.gz',
    'bz2': '.bz2',
    'zstd': '.zst',
}

PANDAS_DEFAULT_NULL_VALUES = {
    '-1.#IND',
    '1.#QNAN',
    '1.#IND',
    '-1.#QNAN',
    '#N/A N/A',
    '#N/A',
    'N/A',
    'n/a',
    'NA',
    '#NA',
    'NULL',
    'null',
    'NaN',
    '-NaN',
    'nan',
    '-nan',
    '',
}

USUAL_FILE_NAME = {
    'location': ['location'],
    'account': ['account'],
    'ri_info': ['ri_info', 'reinsinfo'],
    'ri_scope': ['ri_scope', 'reinsscope'],
}

OED_TYPE_TO_NAME = {
    'Loc': 'location',
    'Acc': 'account',
    'ReinsInfo': 'ri_info',
    'ReinsScope': 'ri_scope'
}

OED_NAME_TO_TYPE = {value: key for key, value in OED_TYPE_TO_NAME.items()}

OED_IDENTIFIER_FIELDS = {
    'Loc': ['PortNumber', 'AccNumber', 'LocNumber'],
    'Acc': ['PortNumber', 'AccNumber', 'PolNumber', 'LayerNumber'],
    'ReinsInfo': ['ReinsNumber', 'ReinsLayerNumber', 'ReinsName', 'ReinsPeril'],
    'ReinsScope': ['ReinsNumber', 'PortNumber', 'AccNumber', 'LocNumber']
}

# on_error can be: raise, log, ignore or return
VALIDATOR_ON_ERROR_ACTION = {'raise', 'log', 'ignore', 'return'}
DEFAULT_VALIDATION_CONFIG = [
    {'name': 'required_fields', 'on_error': 'raise'},
    {'name': 'unkown_column', 'on_error': 'log'},
    {'name': 'valid_values', 'on_error': 'raise'},
    {'name': 'perils', 'on_error': 'raise'},
    {'name': 'occupancy_code', 'on_error': 'raise'},
    {'name': 'construction_code', 'on_error': 'raise'},
    {'name': 'country_and_area_code', 'on_error': 'raise'},
]

OED_PERIL_COLUMNS = ['AccPeril', 'PolPerilsCovered', 'PolPeril', 'CondPeril', 'LocPerilsCovered', 'LocPeril',
                     'ReinsPeril']
