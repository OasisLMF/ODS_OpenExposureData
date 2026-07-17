Financial Details - Primary Insurance
=====================================

OED is designed to allow a wide variety of complex financial structures – beyond that currently possible in Oasis or any other catastrophe modelling platform. To encompass such a variety of financial structures (e.g. different limits for different perils, or multiple policy special conditions) within a limited set of input files (two for primary insurance) it is necessary to allow multiple rows within each file for the same location or policy. The need for this will become clearer in the examples that follow.

The OED hierarchy is described in the *overview* section. Primary financial structures in OED can apply at the following levels:

•	Location ‘Loc’

•	Special Conditions ‘Cond’

•	Policy ‘Pol’

•	Account ‘Acc’

The above abbreviations are used consistently throughout OED (for example in the field names).
Limits, deductibles and minimum and maximum deductibles can be defined at each of these levels and can apply to different combinations of coverages at each of these levels as described in the next section.
 
|

Coverage Values
###############

Coverage values to describe which combination of coverage types a financial structure apply to are as follows:

.. csv-table::
    :widths: 8,20
    :header: "Coverage Value", "Description"

    "0",	"No deductible / limit"
    "1",	"Building"
    "2",	"Other (typically appurtenant structures)"
    "3",	"Contents"
    "4",	"Business Interruption (BI)"
    "5",	"Property Damage (PD: Building + Other + Contents)"
    "6",	"All (PD + BI)"

These coverage values (1 to 6) are embedded in the input field names (as shown in the examples). 

|

Deductible and Limit Types
##########################

The deductible and limit type fields describe whether the deductibles and limits are flat monetary amounts, or percentages of TIV, or percentages of loss:

.. csv-table::
    :widths: 5,20
    :header: "Type", "Description"

    "0",	"Deductible / limit is flat monetary amount"
    "1",	"Deductible / limit is a percentage of loss"
    "2",	"Deductible / limit is a percentage of TIV"

There are multiple ‘Type’ fields containing the values in the table above, each representing a different combination of hierarchy, financial structure kind and coverage.

|

Deductible and Limit Codes
##########################

The deductible and limit code fields describe how the deductibles and limits operate. The options for deductible codes are as follows:


.. csv-table::
    :widths: 5,20 
    :header: "Deductible Code", "Description"

    "0",	"Regular: applies to an individual loss (or the sum of losses from an individual event depending on the hierarchy level of application)"
    "1",	"Annual aggregate: applies to the sum of losses over a year"
    "2",	"Franchise deductible: disappears when the franchise level is reached"
    "3",	"Non-ranking deductible: a deductible that does not count (or ‘rank’) towards a maximum annual aggregate deductible"
    "4",	"Residual deductible: A deductible (normally lower than the regular deductible) that applies after a maximum annual aggregate deductible amount is reached"
    "5",	"CEA Homeowners: A specific type of deductible applying in a California Earthquake Authority (CEA) Homeowners policy"
    "6",	"CEA Homeowners Choice: A specific type of deductible applying in a California Earthquake Authority (CEA) Homeowners Choice policy"

 
The options for limit codes are as follows:

|

.. csv-table::
    :widths: 5,30
    :header: "Limit Code", "Description"

    "0",	"Regular: applies to an individual loss (or the sum of losses from an individual event depending on the hierarchy level of application)"
    "1",	"Annual aggregate: applies to the sum of losses over a year"

|

Structure of Financial Field Names
##################################


There are multiple financial fields to store the ‘Type’, ‘Code’ and actual values for the different deductible and limits reflecting the different variations of:

•	What hierarchy the financial structure applies at: ‘Loc’, ‘Cond’, ‘Pol’ or ‘Acc’

•	Whether the financial structure is a limit or deductible or maximum or minimum deductible: ‘Ded’, ‘Limit’, ‘MaxDed’ or ‘MinDed’

•	The coverage that the financial structure applies to (‘1Building’ to ‘6All’)

This is illustrated below:

.. image:: images/Hierarchy.png
 
|

For example:

**LocDedCode1Building** is the field in the location input file that contains the code for the deductible applicable to losses from building coverages.

**AccLimitCode6All** is the field in the account input file that contains the code for the limit applicable to losses from all coverages at account level.

**PolDed6All** is the field in the account input file that contains the value of the deductible applicable to losses from all coverages at policy level.

**LocMaxDed1Building** is the field in the location input file that contains the value of the maximum deductible applicable to losses from the building coverage.

**CondLimitType6All** is the field in the account input file that contains the type of limit applicable to losses from all coverages for a special condition. 

The reason for having both the coverage value (1 to 6) as well as spelling out the coverage kind in the input field names is so that the users of OED can easily associate the value numbers with the coverage types.

|

Policy Special Conditions
#########################

Policy special conditions are financial structures that apply to only a subset of locations within a policy. They apply after all location terms, but before any blanket policy terms or layer terms.

The scope of each special condition is specified using a **CondTag** on each location (in the location input file) that corresponds with the **CondTag** in the account input file.

A unique set of financial terms and a classification is identified by the **CondNumber** field in the account file.

The specification of the financial details of the condition is done in the same way as any other financial structure within OED but using the field names starting with ‘Cond’. All of the coverage values deductible and limit types and codes can be used for a special condition to specify how the special condition financial structures work. 

See the Financial Details Policy Conditions section for a detailed description of how special conditions are specified, and some examples.

|

Participation Fields
####################

The following fields are available to reflect that an insurer may only have a share of a primary policy or location:

**LayerParticipation** represents the share that an insurer has in a policy.

**LocParticipation** represents the share that an insurer has in a particular location. Occasionally there are cases when this can vary within a policy (e.g. binders or offshore) and so this field is provided to allow flexibility in these circumstances.
 
|

Currencies
##########

Three currency fields are available:

•	**LocCurrency** contains the currency in the location file and specifies the currency for TIV and location level financial terms.

•	**AccCurrency** contains the currency in the account file and specifies the currency for special condition, policy and account level financial terms.

•	**ReinsCurrency** contains the currency in the reinsurance file and specifies the currency for reinsurance financial terms.

The currency code values are predominantly those contained within the ISO4217 standard although older (for example pre-euro) codes are also allowed.

|

Examples of Specifying Primary Financial Structures
####################################################

The following examples illustrate the principles discussed in the previous sections. Not all required fields are shown in the examples below – only those needed to illustrate the principles highlighted.

**Example 1 – Personal lines with coverage deductibles**

Personal lines data often has one location per policy / account, with financial terms only applying at location-coverage or location level. There are two ways that this could be represented in OED, either using one account / policy per location or using an account / policy to represent multiple locations reflecting some natural grouping of personal lines policies. The latter approach is more space efficient. Both approaches are described below.

The tables below show 3 locations, all with the same 100,000 buildings TIV and deductibles that apply at the buildings coverage level. Location 1 has a monetary (**DedType = 0**) deductible of 200, location 2 has a 1% of TIV deductible (**DedType = 2**) and location 3 has a 5% of loss deductible (**DedType = 1**).

|

The OED Account and Location tables using the first approach are as follows:

OED Account file:

.. csv-table::
    :widths: 25,20
    :header: "AccNumber", "PolNumber"

    "PolRef1",	"PolRef1"
    "PolRef2",	"PolRef2"
    "PolRef3",	"PolRef3"

|

OED Location file:

.. csv-table::
    :widths: 15,15,15,20,20,15
    :header: "LocNumber", "AccNumber", "BuildingTIV", "LocDedType1Building","LocDedCode1Building","LocDed1Building"

    "1",	"PolRef1",	"100,000",	"0",	"0",	"200"
    "2",	"PolRef2",	"100,000",	"2",	"0",	"0.01"
    "3",	"PolRef3",	"100,000",	"1",	"0",	"0.05"

|

Note that **LocDedCode1Building = 0** which means the deductible is a standard type (not an annual aggregate or franchise etc.) This field is not actually required for standard deductibles – it would default to 0 if not provided.

Not all required fields are shown in the tables above; specifically, **PortNumber, AccCurrency** and **PolPerilsCovered** are required in the account table, and **PortNumber, LocPerilsCovered, CountryCode, OtherTIV, ContentsTIV, BITIV** and **LocCurrency** are required in the location table.
The second way of representing personal lines data is to group all locations under one ‘policy’ but provide the true policy reference in the **LocNumber** field, as shown below:

|

OED Account file:

.. csv-table::
    :header: "AccNumber", "PolNumber"

    "1",	"1"

|

OED Location file:

.. csv-table::
    :widths: 15,15,15,22,22,18
    :header: "LocNumber", "AccNumber", "BuildingTIV", "LocDedType1Building","LocDedCode1Building","LocDed1Building"

    "PolRef1",	"1",	"100,000",	"0",	"0",	"200"
    "PolRef2",	"1",	"100,000",	"2",	"0",	"0.01"
    "PolRef3",	"1",	"100,000",	"1",	"0",	"0.05"

|

This is a more efficient approach as the size of the account table is much smaller which is relevant since personal lines portfolios can easily contain several million locations.

|

**Example 2 – Commercial lines – multiple locations per policy with location and policy deductibles and a policy limit**

The tables below show an example of a commercial portfolio with 3 accounts, each with 2 locations. Each location has a coverage deductible and there is an overall policy deductible and an overall policy limit.


OED Account file:

.. csv-table::
    :widths: 15,15,20,18,22,15
    :header: "AccNumber",	"PolNumber",	"PolDedType6All",	"PolDed6All",	"PolLimitType6All",	"PolLimit6All"

    "1",	"1",	"0",	"50,000",	"0",	"1,500,000"
    "2",	"1",	"2",	"0.05",	    "0",	"1,500,000"
    "3",	"1",	"1",	"0.10",	    "2",	"0.80"

|

OED Location file:

.. csv-table::
    :widths: 12,12,15,25,20  
    :header: "LocNumber",	"AccNumber",	"BuildingTIV",	"LocDedType1Building",	"LocDed1Building"

    "1",	"1",	"1,000,000",	"0",	"10,000"
    "2",    "1",	"1,000,000",	"2",	"0.01"
    "3",	"2",	"1,000,000",	"1",	"0.05"
    "4",	"2",	"2,000,000",	"0",	"15,000"
    "5",	"3",	"2,000,000",	"0",	"10,000"
    "6",	"3",	"2,000,000",	"2",	"0.10"

In the account table above, there are two options for specifying the policy limit: either using the **PolLimit6All** field (as shown) or using the **LayerLimit** field (not shown). If a limit is specified as anything other than a monetary amount (e.g. as a percentage of sum insured) then the **PolLimit6All** field must be used. 

If there are underlying limits before a policy layer (e.g. perhaps a sublimit for storm surge that applies to all locations) then **PolLimit6All** must be used. If there is only one monetary policy limit, then the user has a choice of whether to use LayerLimit or **PolLimit6All**. Our recommendation in this case is to use **LayerLimit** rather than **PolLimit6All**, as this may prove more efficient downstream when reporting out on main policy limits.

|
 
**Example 3 – Commercial lines – multiple locations per policy with different policy level deductibles and limits for different perils**

The tables below show an example of a commercial portfolio with 3 accounts, each with 2 locations. Each account has one policy and each policy covers earthquake **(peril code = QQ1)**, wind **(WW1)** and flood **(OO1)**. Each location has a coverage deductible which applies to all perils. Each policy has deductibles and limits that apply across all coverages; however the policy flood deductibles are higher than those for wind and earthquake and the flood limits are lower than those for wind and earthquake.

|

OED Account file:

.. csv-table::
    :widths: 18,18,18,25,20,25,20
    :header: "AccNumber",	"PolNumber",    "PolPeril",	"PolDedType6All",	"PolDed6All",	"PolLimitType6All",	"PolLimit6All"

    "1",	"1",	"QQ1;WW1",	"0",	"50,000",	"0",	"1,500,000"
    "1",	"1",	"OO1",	    "0",	"100,000",	"0",	"500,000"
    "2",	"1",	"QQ1;WW1",	"2",	"0.05",	    "0",	"1,500,000"
    "2",	"1",	"OO1",	    "0",	"500,000",	"0",	"1,000,000"
    "3",	"1",	"QQ1;WW1",	"1",	"0.10",	    "2",	"0.80"
    "3",	"1",	"OO1",	    "1",	"0.20",	    "2",	"0.60"

|

OED Location file:

.. csv-table::
    :widths: 15,15,18,30,20  
    :header: "LocNumber",	"AccNumber",	"BuildingTIV",	"LocDedType1Building",	"LocDed1Building"

    "1",	"1",	"1,000,000",	"0",	"10,000"
    "2",	"1",	"1,000,000",	"2",	"0.01"
    "3",	"2",	"1,000,000",	"1",	"0.05"
    "4",	"2",	"2,000,000",	"0",	"15,000"
    "5",	"3",	"2,000,000",	"0",	"10,000"
    "6",	"3",	"2,000,000",	"2",	"0.10"

The account table above shows one of the flexible features of the OED – the possibility of having multiple rows for the same policy in the account table. This allows different terms to be specified for different perils as indicated by the **PolPeril** field.

|

**Example 4 – Policy layers**

The tables below show an example of a commercial portfolio with 1 account containing 6 locations and two policy layers. Each location has a coverage deductible and each policy has an underlying deductible applying across all coverage types.

|

OED Account file:

.. csv-table::
    :widths: 12,12,20,15,20,15,20 
    :header: "AccNumber",	"PolNumber",	"PolDedType6All",	"PolDed6All",	"LayerAttachment",	"LayerLimit",	"LayerParticipation"

    "1",	"1",	"0",	"50,000",	"0",	        "1,500,000",	"0.1"
    "1",	"2",	"0",	"50,000",	"1,500,000",	"3,500,000",	"0.5"

|

OED Location file:

.. csv-table::
    :widths: 10,12,12,20,15  
    :header: "LocNumber",	"AccNumber",	"BuildingTIV",	"LocDedType1Building",	"LocDed1Building"

    "1",	"1",	"1,000,000",	"0",	"10,000"
    "2",	"1",	"1,000,000",	"2",	"0.01"
    "3",	"1",	"1,000,000",	"1",	"0.05"
    "4",	"1",	"2,000,000",	"0",	"15,000"
    "5",	"1",	"2,000,000",	"0",	"10,000"
    "6",	"1",	"2,000,000",	"2",	"0.10"

The two different layers in the example above have different policy numbers within the same account. The insurer has a 10% share of the first layer and a 50% share of the second layer specified within **LayerParticipation**. The policy level deductible specified in **PolDedType6All** and **PolDed6All** applies to losses before the layer terms apply.

Although not shown in the example above, it is possible to specify a layer number for each layer using the **LayerNumber** field. 

If a policy has a limit that covers all perils and coverage types, then either **PolLimit6All** or **LayerLimit** can be used to represent this limit. In this case the recommendation is to use **LayerLimit** rather than **PolLimit6All**, as this then results in a consistent field containing the ultimate policy limit that can ease subsequent reporting.
