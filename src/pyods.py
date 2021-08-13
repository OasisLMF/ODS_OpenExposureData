"""

"""
import os
try:
    import pandas as pd
except ImportError:
    pd = None

pd_converter = {
    "0 or 1": "Int8",
    "bigint": "float64",
    "binary": "Int8",
    "bit": "Int8",
    "char": "category",
    "date": "category",
    "datetime": "category",
    "decimal": "float64",
    "float": "float64",
    "int": "Int64",
    "nchar": "category",
    "nvarchar": "category",
    "real": "float64",
    "smalldatetime": "category",
    "smallint": "Int32",
    "tinyint": "Int32",
    "uniqueidentifier": "category",
    "varbinary": "bytes",
    "varchar": "category"
}


ods_field_fp = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'OpenExposureData', 'Schema', 'OED_Input_Fields.csv')

__ods_fields = None


def get_ods_fields(df_engine):
    global __ods_fields
    if __ods_fields is None:
        ods_fields_df = df_engine.read_csv(ods_field_fp,
                                skipinitialspace=True,
                                keep_default_na=False,
                                na_values=[])

        # convert Data Type to pandas DataType
        ods_fields_df['pd_dtype'] = ods_fields_df['Data Type'].str.split('(', 1, expand=True)[0].map(pd_converter)

        # check that to Data Type is missing from our converter
        if ods_fields_df['pd_dtype'].isna().any():
            raise ValueError(f"missing pd_dtype for:\n"
                             f"""{ods_fields_df.loc[ods_fields_df['pd_dtype'].isna(),
                                               ['File Name', 'Input Field Name', 'Type & Description', 'Data Type']]}""")

        # split ods_fields per File Name
        ods_fields_df.rename(columns={'File Name':'File Names'}, inplace=True)
        split_df = ods_fields_df['File Names'].str.split(';').apply(df_engine.Series, 1).stack()
        split_df.index = split_df.index.droplevel(-1)
        split_df.name = 'File Name'
        split_df = split_df.str.strip()
        ods_fields_df = ods_fields_df.join(split_df).drop(columns='File Names')

        # create a field dict for each File Name available and None
        __ods_fields = {}
        for file_name in ods_fields_df['File Name'].unique():
            file_name_df = ods_fields_df[ods_fields_df['File Name']==file_name]
            file_name_df.set_index(['Input Field Name'], inplace=True)
            __ods_fields[file_name] = file_name_df.to_dict(orient='index')
        no_file_name_df = ods_fields_df[['Input Field Name', 'pd_dtype', 'Default']].drop_duplicates()
        no_file_name_df.set_index(['Input Field Name'], inplace=True)
        __ods_fields[None] = no_file_name_df.to_dict(orient='index')
    return __ods_fields


def read_csv(filepath_or_buffer, df_engine=pd, file_type=None, dtype=None, default=None, memory_map=True, **kwargs):
    if df_engine is None:
        raise Exception(f"df_engine parameter not specified, you must install pandas"
                        " or pass your DataFrame engine (modin, dask,...)")

    all_ods_fields = get_ods_fields(df_engine)
    try:
        ods_fields = all_ods_fields[file_type]
    except KeyError as e:
        raise KeyError(f"Unknown file_type {file_type}. Must be in {list(all_ods_fields)}", e)

    pd_dtype = {input_field_name: info['pd_dtype'] for input_field_name, info in ods_fields.items()}
    if dtype:
        pd_dtype = {**pd_dtype, **dtype}
    df = df_engine.read_csv(filepath_or_buffer, dtype=pd_dtype, memory_map=memory_map, **kwargs)
    for column, info in ods_fields.items():
        if column not in df.columns:
            if info.get('Required Field') == 'R':
                raise Exception(f"required column '{column}' is missing in {file_type} file")
            else:
                continue

        if df[column].isna().any() or (info['pd_dtype'] == 'str' and df[column].isnull().any()):
            if info.get("Allow blanks?") == 'NO':
                raise Exception(f"column '{column}' has missing values in {file_type} file")
            else:
                if default and column in default:
                    col_default = default[column]
                else:
                    col_default = info['Default']
                if col_default != 'n/a':
                    df[column].fillna(df[column].dtype.type(col_default), inplace=True)

    return df


def read_parquet(parquet_fp, df_engine=pd, **kwargs):
    return df_engine.read_parquet(parquet_fp, **kwargs)


def csv_to_parquet(csv_fp, parquet_fp, file_type, **kwargs):
    read_csv(csv_fp, file_type=file_type, **kwargs).to_parquet(parquet_fp)


def parquet_to_csv(parquet_fp, csv_fp, index=False, **kwargs):
    read_parquet(parquet_fp).to_csv(csv_fp, index=index, **kwargs)


if __name__ == "__main__":
    # TODO: move to test
    base_path = "~/OasisPiWind/tests/inputs"
    print(read_csv(os.path.join(base_path,"SourceLocOEDPiWind.csv"), file_type='Loc'))
    print(read_csv(os.path.join(base_path,"SourceAccOEDPiWind.csv"), file_type='Acc'))
    print(read_csv(os.path.join(base_path,"SourceReinsScopeOEDPiWind.csv"), file_type='ReinsScope'))
    print(read_csv(os.path.join(base_path,"SourceReinsInfoOEDPiWind.csv"), file_type='ReinsInfo'))

    print(csv_to_parquet(os.path.join(base_path,"SourceLocOEDPiWind.csv"), os.path.join(base_path,"SourceLocOEDPiWind.parquet"), file_type='Loc'))
    print(csv_to_parquet(os.path.join(base_path,"SourceAccOEDPiWind.csv"), os.path.join(base_path,"SourceAccOEDPiWind.parquet"), file_type='Acc'))
    print(csv_to_parquet(os.path.join(base_path,"SourceReinsScopeOEDPiWind.csv"), os.path.join(base_path,"SourceReinsScopeOEDPiWind.parquet"), file_type='ReinsScope'))
    print(csv_to_parquet(os.path.join(base_path,"SourceReinsInfoOEDPiWind.csv"), os.path.join(base_path,"SourceReinsInfoOEDPiWind.parquet"), file_type='ReinsInfo'))


    print(read_parquet(os.path.join(base_path,"SourceLocOEDPiWind.parquet")))
    print(read_parquet(os.path.join(base_path,"SourceAccOEDPiWind.parquet")))
    print(read_parquet(os.path.join(base_path,"SourceReinsScopeOEDPiWind.parquet")))
    print(read_parquet(os.path.join(base_path,"SourceReinsInfoOEDPiWind.parquet")))


    print(parquet_to_csv(os.path.join(base_path,"SourceLocOEDPiWind.parquet"), os.path.join(base_path,"SourceLocOEDPiWind.2.csv")))
    print(parquet_to_csv(os.path.join(base_path,"SourceAccOEDPiWind.parquet"), os.path.join(base_path,"SourceAccOEDPiWind.2.csv")))
    print(parquet_to_csv(os.path.join(base_path,"SourceReinsScopeOEDPiWind.parquet"), os.path.join(base_path,"SourceReinsScopeOEDPiWind.2.csv")))
    print(parquet_to_csv(os.path.join(base_path,"SourceReinsInfoOEDPiWind.parquet"), os.path.join(base_path,"SourceReinsInfoOEDPiWind.2.csv")))
