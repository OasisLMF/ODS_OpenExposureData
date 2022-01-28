#!/usr/bin/env python3

import pandas as pd
import click 
import os

@click.command()
@click.option('--source-excel-path', required=True, default=None, help='Path to MS excel sheet' )
@click.option('--output-csv-path', default='OpenExposureData_Spec.csv', help='Path to write csv file' )
@click.option('--excel-sheet-name', default="OED Input Fields", help='Sheet label to extract' )
def extract_spec_to_csv(source_excel_path, output_csv_path, excel_sheet_name):
    df_spec = pd.read_excel(
        source_excel_path,
        sheet_name=excel_sheet_name,
        dtype={'Default': str},
        keep_default_na=False,
        na_values=[])
    df_spec.to_csv(
        path_or_buf=output_csv_path,
        encoding='utf-8',
        mode='w',
        index=False)
    print(f'Written CSV spec: "{output_csv_path}"  \noutput based on file: "{source_excel_path}", sheet: "{excel_sheet_name}"')

if __name__ == '__main__':
    extract_spec_to_csv()
