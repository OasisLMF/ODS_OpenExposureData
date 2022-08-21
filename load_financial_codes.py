import pandas as pd


PATH = "./OED_financial_terms_supported.xlsx"


if __name__ == "__main__":
    print("loading financial codes data")
    df_fields = pd.read_excel(PATH, sheet_name='OED Financial Fields supported', engine='openpyxl')

    financial_codes_schema = {}

    for record in list(df_fields.T.to_dict().values()):
        file_name_list = record["File Name"].replace(" ", "").split(";")
        del record["File Name"]

        for name in file_name_list:
            # file_field_key = name + ";" + record["Input Field Name"]
            if financial_codes_schema.get(name) is None:
                financial_codes_schema[name] = {}

            financial_codes_schema[name][record["Input Field Name"]] = record

    print("test")
    # for i, field in list(df_fields.T.to_dict().values()):
    #     print(i)
    # print("data file loaded")
