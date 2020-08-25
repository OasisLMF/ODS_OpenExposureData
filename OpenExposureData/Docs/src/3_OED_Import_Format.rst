OED Import Format
====================

The import format for OED is defined by four .csv files:

•	Location (loc)
•	Account (acc)
•	Reinsurance info (RIinfo)
•	Reinsurance scope (RIscope)

The fields in each file and their corresponding data type are described in the ‘OED Input Fields’ tab in the sheet in the OED Data Spec spreadsheet. (https://github.com/OasisLMF/OpenDataStandards/blob/develop/OpenExposureData/Docs/Open%20Exposure%20Data%20Spec_v1.1.2.xlsx)

Location ('loc') Import File
############################

This file contains details relating to each location such as the value and type of asset (including primary and secondary modifiers), geographical information, the perils covered and the financial structures within the insurance contract relating to the location.

This file is the only mandatory file to run a model and to produce the ground-up losses.

For simple cases, one location is represented by one row in the file. However, for cases with location level financial structures that vary by peril, or where multiple special conditions associated with a particular location exist, one location can be represented by multiple rows. This is necessary to allow the full complexity of financial contracts to be represented in a limited number of input files.
 
For example, a simple location covering wind ('WW1' – see the Perils **<here>** section) and flood ('OO1') with a 100 deductible for buildings (which applies to the combined loss from both perils if both perils happen in a single event) could be represented as follows:


.. csv-table::
    :widths: 25,25,30,20,35,35
    :header: "LocNumber", "BuildingTIV", "LocPerilsCovered", "LocPeril", "LocDedType1Building", "LocDed1Building"
    
    "1", "100,000", "OO1;WW1", "OO1;WW1", "0", "100"


If the same location had a 100 deductible for wind but a 1000 deductible for flood that applied to losses from each peril separately, this would be represented in the location input file as shown below:


.. csv-table::
    :widths: 25,25,30,20,35,35
    :header: "LocNumber", "BuildingTIV", "LocPerilsCovered", "LocPeril", "LocDedType1Building", "LocDed1Building"

    "1", "100,000", "OO1;WW1", "WW1", "0", "100"
    "1", "100,000", "OO1;WW1", "OO1", "0", "1000"


The field names in the examples above are described further in the assets, geography and perils and financial structures sections. **<insert links here>**

The minimum fields required in a location file are **LocNumber, AccNumber, PortNumber, CountryCode, LocPerilsCovered, LocCurrency, BuildingTIV, ContentsTIV, BITIV, OtherTIV**.

The full set of fields in a location import file can be found by filtering on ‘Loc’ in the 'Input File' column of the 'OED Input Fields' sheet within the *Open Exposure Data Spec* spreadsheet. 

There are over 200 potential fields that could be used within the location file. However, it is not mandatory to use a field that contains no data and so, most OED location input files will contain far fewer than 200 columns. 



Account (acc) Import File
#########################

The account file contains details of the policies and accounts that exist within the import portfolios. Most of the fields in this file relate to financial structures, including special conditions.

This file is always required when modelling for insured (or gross) losses.

An account may contain multiple policies and typically, each row will represent one policy. However, for cases with policy level financial structures that vary by peril or where a policy contains multiple special conditions, one policy may have multiple rows in the account file. 

The minimum fields required in an account file are **AccNumber**, **AccCurrency, PolNumber, PortNumber, PolPerilsCovered**.

The full set of fields in an account import file can be found by filtering on ‘Acc’ in the 'Input File' column of the 'OED Input Fields' sheet within the *Open Exposure Data Spec* spreadsheet. 

Similarly to the loc file, there are over 200 potential fields that could be used within the account file, but it is not mandatory to use a field that contains no data and so, most OED account input files will contain far fewer than 200 columns. 

For example, if account level financial terms are not required (i.e. financial terms that apply across groups of policies) then all the financial fields starting with ‘Acc’ can be omitted (removing the need for 48 fields). If special conditions are not required another 48 fields can be excluded. See the section on financial structures along with the examples for details of how the financial structure fields operate together. **<link here>**



Reinsurance Info (RIinfo) Import File
#####################################

The reinsurance info file contains details of the reinsurance contracts that relate to the underlying portfolios, accounts and locations. There must be exactly one entry per reinsurance contract in this file. Any financial terms relating to reinsurance contracts should be entered in this file with the exception of the **CededPercent** for a surplus treaty (which should be entered in the reinsurance scope file).

For a list of the reinsurance financial terms available and examples about how to specify such terms see the reinsurance section and associated examples.
If there is no reinsurance, this import file is not required. If there is reinsurance, the minimum fields required are **ReinsNumber, ReinsPeril, ReinsCurrency, InuringPriority, ReinsType, PlacedPercent**.

**ReinsNumber** must be unique, as this links with the reinsurance scope file.

The full set of fields in a reinsurance info import file can be found by filtering on ‘ReinsInfo’ in the 'Input File' column of the *Open Exposure Data Spec* spreadsheet. There are over 20 potential fields that could be used within the reinsurance info file. However, it is not mandatory to use a field that contains no data. 



Reinsurance Scope (RIscope) Import File
#########################################

The reinsurance scope file contains details of three different but related pieces of information:

•	The scope of the reinsurance contract: i.e. which portfolios, accounts, locations are covered by a particular reinsurance contract.

•	The risk level of the reinsurance contract: i.e. for reinsurance contracts with financial structures relating to a ‘risk’, the definition of what risk means.

•	The CededPercent for a surplus treaty: which can vary for each risk covered by the treaty.

The above three points are discussed in turn below.

The scope of what a reinsurance contract applies to is defined by the ten ‘filter fields’ available in the reinsurance scope file: **PortNumber, AccNumber, PolNumber, LocGroup, LocNumber, CedantName, ProducerName, LOB, CountryCode, ReinsTag.**

**For example:**

If a reinsurance contract applies to a particular portfolio ‘A’ then the value ‘A’ would be entered in the **PortNumber** field.

If reinsurance applies only to account B in portfolio A, then ‘A’ would be entered in the **PortNumber** field and ‘B’ would be entered in the same row in the **AccNumber** field. In other words, entering criteria in the same row essentially applies an *AND* condition.
Scope information relating to the same reinsurance contract can also be applied in separate rows: in this case each row would act like an *OR* condition for the filter. 

**For example:**

If **PortNumber** = ‘A’ is entered in one row and **AccNumber** = ‘B’ is entered in a separate row, then the scope of the reinsurance policy would apply to all records that match the condition: all records in portfolio ‘A’ *OR* any records in account number ‘B’.

If **LocNumber** is used as a scope filter then **AccNumber** and **PortNumber** must be specified too (otherwise **LocNumber** does not uniquely identify a location).
If **PolNumber** is used as a scope filter then **AccNumber** and **PortNumber** must be specified too (otherwise **PolNumber** does not uniquely identify a policy).

The RiskLevel of a reinsurance contract refers to the level at which ‘risk’ terms apply. A ‘risk’ can either be defined at Location ‘LOC’, Location Group ‘LGR’, Policy ‘POL’ or Account level ‘ACC’. If a reinsurance contract does not contain risk specific terms then the **RiskLevel** field should be left blank. Note that it is not only per-risk treaties that have risk level terms. A facultative contract, a quota share treaty or even a catastrophe XL may also have risk level terms and thus require a risk level to be defined. 

Although the reinsurance scope and the risk level are two different concepts, for facultative contracts and surplus treaties, the OED format requires that the risk level for a particular contract should also be used to define the scope of the contract. This is because these contracts, by their nature, either apply to individual risks (facultative) or have a ceded percent that varies by risk (surplus), and so to have scope defined by fields different to the risk level would cause ambiguity and confusion.

Surplus treaties require entry of **CededPercent** at the risk level. For example, if the risk level within a surplus treaty is location (LOC), then the user must list every location covered by the treaty in the **LocNumber** field (along with **AccNumber** and **PortNumber** to uniquely identify the location within the file) as well as the **CededPercent** for each location.

If there is no reinsurance, the reinsurance scope import file is not required. If there is reinsurance, each reinsurance entry in the reinsurance info file must have at least one entry in the reinsurance scope file; some contracts will have multiple entries in the scope file. 

The minimum fields required are: **ReinsNumber** and **RiskLevel**, at least one of the ten filter fields, and **CededPercent** for surplus treaties.
The full set of fields in a reinsurance scope import file can be found by filtering on ‘ReinsScope’ in the Input File column of the *Open Exposure Data Spec* spreadsheet. There are over 10 potential fields that could be used within the reinsurance scope file. However, it is not mandatory to use a field that contains no data. 

For a list of the reinsurance financial terms available and examples about how to specify such terms see the reinsurance section and associated examples. **<insert links here>**

