#!/usr/bin/env python3

import os
import pandas as pd
import csv

# Define the function to read Excel while preserving "n/a" and blank cells
def _read_excel(source_excel_path, excel_sheet_name):
    return pd.read_excel(source_excel_path,
                         sheet_name=excel_sheet_name,
                         dtype=str,
                         keep_default_na=False,
                         na_values=[])
# File paths
excel_file_path = '../Docs/OpenExposureData_Spec.xlsx'
output_directory = '../Docs'  # Directory where CSV files will be saved

# Ensure the output directory exists
if not os.path.exists(output_directory):
    os.makedirs(output_directory)

# List of sheet names to export
sheet_names = ['README', 'OED Input Fields', 'Peril Values','Financial Code Values','Occupancy Values','Construction Values','Currency Values','Country Values','AreaCode Values','Other Values','OED CR Field Appendix','Versioning']  # Add your sheet names here

# Dictionary of columns to remove for each sheet
columns_to_remove = {
    'OED Input Fields': ['SecMod?', 'BackEndTableName','Back End DB Field Name'],
    'Peril Values': ['For filtering:','Peril','PerilsCovered']
}

# Iterate over the list of sheet names
for sheet_name in sheet_names:
    # Read the specified sheet from the Excel file using the custom function
    df = _read_excel(excel_file_path, sheet_name)

    # Strip spaces out of the sheet name
    sanitized_sheet_name = sheet_name.replace(" ", "")

    # Remove specified columns if they exist in the DataFrame
    if sheet_name in columns_to_remove:
        df = df.drop(columns=columns_to_remove[sheet_name], errors='ignore')

    # Identify and remove unnamed columns
    unnamed_columns = [col for col in df.columns if 'Unnamed' in col]
    df.drop(unnamed_columns, axis=1, inplace=True)

    # Define the CSV file path
    csv_file_path = os.path.join(output_directory, '{}.csv'.format(sanitized_sheet_name))

    # Export the DataFrame to a CSV file with double quotes for strings
    df.to_csv(csv_file_path, index=False, quoting=csv.QUOTE_ALL, encoding='utf-8')

    print(f"Data from {sheet_name} has been exported to {csv_file_path}.")

print("All specified sheets have been exported to CSV files.")
