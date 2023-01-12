# ODS Tools

## Overview

ODS tools is a python package put in place to support generic use case regarding the reading and writing of ODS file
in accordance with the [ODS schemas](https://github.com/OasisLMF/OpenDataStandards/).

## command line interface

ODS tools provide command line interface to quickly convert oed files:

example :

```
ods_tools convert --location path_to_location_file --path output folder
```

see `ods_tools convert --help` for more option

## package usage

### loading exposure data

in order to load oed file we use the concept of source.
A source will define how to retrieve the oed data. For the moment we only support files but other type of
source such as DataBase could be envisaged.
The loading itself support several format such as parquet, csv and all pandas read_csv supported compression
The path to the file can be absolute relative or even an url

config example:

```python
config = {
    'location': 'SourceLocOEDPiWind.csv', # csv file
    'account': 'SourceAccOEDPiWind.parquet', # parquet file
    'ri_info': {
        'cur_version_name': 'orig', # passing args to the reader function
        'sources': {
            'orig': {
                'source_type': 'filepath',
                'filepath': 'SourceReinsInfoOEDPiWind.csv',
                'read_param': {
                    'usecols':[
                        'ReinsNumber', 'ReinsLayerNumber', 'ReinsName', 'ReinsPeril',
                        'ReinsInceptionDate', 'ReinsExpiryDate', 'CededPercent', 'RiskLimit',
                        'RiskAttachment', 'OccLimit', 'OccAttachment', 'PlacedPercent',
                        'ReinsCurrency', 'InuringPriority', 'ReinsType', 'RiskLevel', 'OEDVersion'
                    ]
                }
            }
        }
    },
    'ri_scope': 'https://raw.githubusercontent.com/OasisLMF/OasisPiWind/master/tests/inputs/SourceReinsScopeOEDPiWind.csv', # url
}
```

### Access Oed File as DataFrame

Once the config is done you can create your OedExposure Object
and access the Dataframe representation of the different sources.
Data Type in the DataFrame will correspond to the type

```python
import ods_tools
oed_exposure = ods_tools.oed.OedExposure(**config)
location = oed_exposure.location.dataframe
account = oed_exposure.account.dataframe
```

### Saving Change to the oed DataFrame

You can modify the DataFrame and save it as a new version

```python
oed_exposure.location.save(version_name='modified version',
                            source='path_to_save_the_file')
```

you may also save the exposure itself this will save the current dataframe to the specified directory_path.  
if you specify version_name, oed files will be saved as f'{version_name}_{OED_NAME}' + compression (ex: version_2_location.csv)  
if the version_name is an empty string, oed files will be saved as just f'{OED_NAME}' + compression (ex: location.parquet)  
if version_name is None,  oed files will take the same name as the current source if it is a filepath or f'{OED_NAME}' + compression otherwise
(ex: SourceLocOEDPiWind.csv)

compression let you specify the file extension (csv, parquet, zip, gzip, bz2, zstd)

if save_config is True the exposure config will also be saved in the directory 
```python
oed_exposure.save(directory_path, version_name, compression, save_config)
```

### OED Validation

Validity of oed files can be checked at loading time with the argument check_oed

```python
oed_exposure = ods_tools.oed.OedExposure(check_oed=True, validation_config=validation_config, **config)
```

validation_config is a list of all check that you want to perform, if one oed source fail a check depending on validation_config
4 different action can be performed 'raise', 'log', 'ignore', 'return'.
 - 'raise' will raise an OdsException
 - 'log' will log the issue with a info level
 - 'ignore' will ignore the issue
 - 'return' will return the check issue in a list in order for the developer to perform its own treatment.
In that case the check method need to be called instead of relying on the constructor
```python
oed_exposure = ods_tools.oed.OedExposure(check_oed=False**config)
invalid_data = oed_exposure.check(custom_validation_config)
```

the curent default validation under ods_tools.oed.common DEFAULT_VALIDATION_CONFIG contains
```python
VALIDATOR_ON_ERROR_ACTION = {'raise', 'log', 'ignore', 'return'}
DEFAULT_VALIDATION_CONFIG = [
    {'name': 'required_fields', 'on_error': 'raise'},
    {'name': 'unknown_column', 'on_error': 'log'},
    {'name': 'valid_values', 'on_error': 'raise'},
    {'name': 'perils', 'on_error': 'raise'},
    {'name': 'occupancy_code', 'on_error': 'raise'},
    {'name': 'construction_code', 'on_error': 'raise'},
    {'name': 'country_and_area_code', 'on_error': 'raise'},
]
```

An OdsException is raised with a message indicating which file is invalid and why.

### Currency Conversion Support

Exposure Data handles the conversion of relevant columns of the oed files to another currency
to do so you will need to provide information on the currency conversion method in the config or after loading

#### DictBasedCurrencyRates

DictBasedCurrencyRates is a solution where all the rate are provided via files and stored internally as a dictionary.

We support csv file (compressed or not) or a parquet file where they will be read as DataFrame.
exemple of currency_conversion_json ("source_type": "parquet" if parquet file is used):

```json
{
    "currency_conversion_type": "DictBasedCurrencyRates",
    "source_type": "csv",
    "file_path": "tests/inputs/roe.csv"
}
```

The expected format is (roe being a float in parquet format):

```
cur_from,cur_to,roe
USD,GBP,0.85
USD,EUR,0.95
GBP,EUR,1.12
```

Rate can also be passed directly in currency_conversion_json
ex:

```json
{
    "currency_conversion_type": "DictBasedCurrencyRates",
    "source_type": "dict",
    "currency_rates": [["USD", "GBP", 0.85],
                       ["USD", "EUR", 0.95],
                       ["GBP", "EUR", 1.12]
                      ]
}
```

When looking for a key pair, DictBasedCurrencyRates check 1st for the key pair (cur1, cur2) then for (cur2, cur1).
So if a Currency pairs is only specified one way (ex: GBP=>EUR) then it is automatically assume that
roe EUR=>GBP = 1/(roe GPB=>EUR)

if a currency pair is missing ValueError(f"currency pair {(cur_from, cur_to)} is missing") is thrown

#### FxCurrencyRates

OasisLMF let you use the external package [forex-python](https://forex-python.readthedocs.io/en/latest/usage.html)
to perform the conversion. A date may be specified in ISO 8601 format (YYYY-MM-DD)
currency_conversion_json:

```json
{
  "currency_conversion_type": "FxCurrencyRates",
  "datetime": "2018-10-10"
}
```

those config can be added as a json file path of directly into the oed_config dict

```python
config_with_currency_rate = {
    'location': 'SourceLocOEDPiWind.csv', # csv file
    'currency_conversion': {
        "currency_conversion_type": "DictBasedCurrencyRates",
        "source_type": "dict",
        "currency_rates": {
            ('USD', 'GBP'): 0.85,
            ('USD', 'EUR'): 0.952,
            ('GBP', 'EUR'): 1.12}
        },
    'reporting_currency': 'USD',
    }
```

if reporting_currency is specified in the config, the oed file will be converted on load
It can also be set once the OedExposure object has been created

```python
import ods_tools
oed_exposure = ods_tools.oed.OedExposure(**config)
oed_exposure.currency_conversion = ods_tools.oed.forex.create_currency_rates(
    {
        "currency_conversion_type": "DictBasedCurrencyRates",
        "source_type": "dict",
        "currency_rates": {
            ('USD', 'GBP'): 0.85,
            ('USD', 'EUR'): 0.952,
            ('GBP', 'EUR'): 1.12}
        }
)
oed_exposure.reporting_currency = 'EUR' # this line will trigger currency conversion
```
