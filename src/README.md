# ODS Tools

## Overview
ODS tools is a python package put in place to support generic use case regarding the reading and writing of ODS file
in accordance with the [ODS schemas](https://github.com/OasisLMF/OpenDataStandards/).

## command line interface
ODS tools provide command line interface to quickly convert
- single csv file or all csv files in a directory (with generic name see ods.usual_file_name) into parquet \
`ods_tools csv_to_parquet -c csv_filepath -p parquet_filepath`
- single parquet files or all files in a directory (with generic name see ods.usual_file_name) a back to csv \
`ods_tools parquet_to_csv -c csv_filepath -p parquet_filepath`

  
## Generic functions
- ods_tools.read_csv : convert csv file to dataframe
- ods_tools.read_parquet : convert parquet file to dataframe
- ods_tools.csv_to_parquet : convert csv file to parquet file
- ods_tools.parquet_to_csv : convert parquet file to csv file
