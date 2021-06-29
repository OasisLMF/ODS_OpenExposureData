Reinsurance
============

There are many different types of reinsurance available and many different combinations of financial terms that can apply within each type of reinsurance. The scope of each reinsurance contract, and the definition of risk level that applies within a contract (if there are per-risk terms), are also important considerations that are discussed in the following sections.

|

Reinsurance Types and Terms
###########################

OED has been designed to allow capture of a broad range of reinsurance terms without the need to enter any information directly through a user interface. The range of reinsurance types that are currently considered within OED are as follows.

|

.. csv-table::
    :header: "Type of Reinsurance",	"Value in ReinsType Field",	"Notes"

    "Facultative",	"FAC",	"Excess of loss (or sometimes proportional) contract applicable at location, location group, policy or account level. The risk level must be consistent with the field used to define the scope. **RiskLimit, RiskAttachment** and **PlacedPercent** are typically the fields used. 

    "Quota Share",	"QS",	"A proportional contract applicable to a tranche of exposure defined using the reinsurance scope filter fields. **PlacedPercent**, and sometimes **RiskLimit** and **OccLimit** are typically the fields used.

    "Surplus Share",	"SS",	"A proportional contract where the proportion ceded varies by risk. The risk level must be consistent with the field used to define the scope. **CededPercent** must be specified for each risk in the reinsurance scope table. **OccLimit** is sometimes also used.

    "Per Risk Treaty",	"PR",	"An excess of loss contract applying per-risk to a tranche of exposure defined using the reinsurance scope filter fields. "RiskLimit, RiskAttachment" and sometimes "PlacedPercent" and "OccLimit" are the fields typically used.

    "Catastrophe Excess of Loss",	"CXL",	"An excess of loss contract applying per-event to a tranche of exposure defined using the reinsurance scope filter fields. **OccLimit, OccAttachment** and sometimes **PlacedPercent** are the fields typically used.

    "Aggregate Excess of Loss",	"AXL",	"An aggregate excess of loss contract applying per-period to a tranche of exposure defined using the reinsurance scope filter fields. **AggLimit, AggAttachment** and sometimes **PlacedPercent** are the fields typically used.
 
The fields used to define reinsurance financial terms are given in the table below. These are all specified in the reinsurance info table, although for surplus treaties note that **CededPercent** must be specified in the reinsurance scope table.

|

.. csv-table::
    :widths: 18, 60
    :header: "Field Name",	"Description"

	"RiskLevel",            "The definition of risk. See below for more information."
    "RiskLimit",            "Limit applicable to the losses from an event at the defined **RiskLevel.**"
    "RiskAttachment",	    "Attachment applicable to the losses from an event at the defined **RiskLevel.**"
    "OccLimit",	            "Limit applicable to the sum of losses from an event."
    "OccAttachment",	    "Attachment applicable to the sum of losses from an event."
    "OccFranchiseDed",	    "A per-occurrence deductible that vanishes when it is exceeded."
    "OccReverseFranchise",	"The total event loss is excluded from the treaty if the reverse franchise threshold is exceeded."
    "AggLimit",	            "Limit applicable to the sum of losses within an **AggPeriod.**"
    "AggAttachment",	    "Attachment applicable to the sum of losses within an **AggPeriod.**"
    "AggPeriod",	        "The period within which to sum losses (in days)."
    "InuringPriority",	    "Indicates the order in which reinsurance applies. 1 denotes the contract that applies first."
    "Reinstatement",	    "The number of reinstatements."
    "CededPercent",	        "The percentage applied to the gross loss entering the reinsurance contracts before other reinsurance terms. Predominantly used for surplus treaties. Unlike all the other terms in this table, **CededPercent** is specified in the reinsurance scope table for surplus treaties and in the reinsurance info table for all other treaty types."    
    "PlacedPercent",	    "The percentage applied to the reinsurance loss after other reinsurance terms. Predominantly used for all contracts other than surplus treaties."
    "TreatyShare",	        "The treaty share which is applicable to the individual reinsurer."

|

Risk Level
##########

The term ‘risk level’ in the table above refers to what is defined as a ‘risk’ in the context of the particular reinsurance treaty. The definition of what constitutes a risk is an involved subject, but the reinsured usually defines this. For example, a risk could be one building in a large spread-out site, a number of buildings defined by such a site, a combination of sites close together, or a policy layer or account.

In the context of OED a risk-level is specified in the **RiskLevel** field in the reinsurance info table and can be defined as either location (*LOC*), location-group (*LGR*), policy (*POL* - including individual layers) or account level (ACC). Risk level is only relevant for reinsurance contracts with risk-level terms. However, this can include facultative contracts, quota share and surplus treaties and catastrophe excess of loss contracts as well as per-risk treaties.

|

Reinsurance Percentages and Calculation Order
#############################################

There are various percentages defined in OED that are applicable to reinsurance, and several kinds of limits and attachments so it is important to be clear about the order in which they work. The main principles are outlined below.

The loss applicable to a reinsurance contract is the gross loss (assuming no inuring reinsurance contracts). In other words the loss to which reinsurance terms are applied is the ground-up loss net of all primary insurance limits, deductibles and shares.

The order of application of reinsurance terms is then as follows:

1.	**CededPercent** is applied to the gross loss. This applies before any other reinsurance terms including per risk terms, per occurrence terms or aggregate terms. This is typically used in surplus treaties (in the reinsurance scope table) where event limits within such treaties are always specified in terms of treaty loss (and not in terms of the gross loss). It could also be used within quota share treaties (within the reinsurance info table) if the risk or event limit terms within a quota share treaty are specified in terms of treaty loss rather than gross loss (although this is unusual).

2.	Risk terms are applied.

3.	Occurrence terms are applied.

4.	Aggregate terms are applied.

5.	**PlacedPercent** is applied. This applies after all other reinsurance terms. This is the percentage field that is normally used for treaty types other than surplus.

|

Examples of OED Tables Including Reinsurance
############################################

The examples below demonstrate how the reinsurance info and reinsurance scope tables work and interact with the account and location tables. As with the other examples in this document, not all the required fields are shown in the tables.

**Example 1 - Facultative Reinsurance**

The tables below demonstrate two facultative reinsurance contracts, one at location level and one at policy level.

A 0.5m xs 1m location level facultative contract applies to location 2 in account 1, and a 1.2m xs 2.0m policy level facultative reinsurance contract applies to policy 1 in account 3.

|

OED Account file:

.. csv-table::
    :widths: 10,10,10,12,12,15,10
    :header: "PortNumber",	"AccNumber",	"PolNumber",	"PolDedType6All",	"PolDed6All",	"PolLimitType6All",	"PolLimit6All"

    "1",	"1",	"1",	"0",	"50,000",	"0",	"1,500,000"
    "1",	"2",	"1",	"2",	"0.05",	    "0",	"1,500,000"
    "1",	"3",	"1",	"1",	"0.10",	    "2",	"0.80"

|

OED Location file:

.. csv-table::
    :widths: 8,8,8,8,12,10  
    :header: "PortNumber",	"LocNumber",	"AccNumber",	"BuildingTIV",	"LocDedType1Building",	"LocDed1Building"

    "1",	"1",	"1",	"1,000,000",	"0",	"10,000"
    "1",	"2",	"1",	"1,000,000",	"2",	"0.01"
    "1",	"1",	"2",	"1,000,000",	"1",	"0.05"
    "1",	"2",	"2",	"2,000,000",	"0",	"15,000"
    "1",	"1",	"3",	"2,000,000",	"0",	"10,000"
    "1",	"2",	"3",	"2,000,000",	"2",	"0.10"

|

OED Reinsurance Info file:

.. csv-table::
    :widths: 10,10,12,10,10,10,10
    :header: "ReinsNumber",	"ReinsType",	"RiskAttachment",	"RiskLimit",	"PlacedPercent",	"InuringPriority", "RiskLevel"

    "1",	"FAC",	"1,000,000",	"500,000",	    "1.0",	"1",  "LOC"
    "2",	"FAC",	"2,000,000",	"1,200,000",	"1.0",	"1",  "POL"
 
|

OED Reinsurance Scope file:

.. csv-table::
    :header: "ReinsNumber",	"PortNumber",	"AccNumber",	"PolNumber",	"LocNumber"

    "1",	"1",	"1",	 "",       "2"
    "2",	"1",	"3",	"1",	   ""

|

The reinsurance info table must contain one row per **ReinsNumber**. **ReinsNumber** must be unique in this table. Although not shown, the reinsurance info table must always contain the **ReinsPeril** field, indicating which perils the reinsurance contract covers.

Facultative contracts are typically 100% placed and so **PlacedPercent** is 1.0. Given that these are contracts on different accounts there is no concept of one contract inuring to the benefit of the other and so the **InuringPriority** is 1. 

The reinsurance scope table must contain at least one entry for every **ReinsNumber** in the reinsurance info table. Although not the case in this example, it can contain more than one entry for a given **ReinsNumber**. 

Only four of the ten possible filter fields are shown in the example above: **PortNumber, AccNumber, PolNumber** and **LocNumber**.

The combination of the filter fields for **ReinsNumber = 1** means that the facultative contract will apply to the records where the following logical statement is true:

**PortNumber = 1** AND **AccNumber = 1** AND **LocNumber = 2**

i.e. to location 2 in account 1 in portfolio 1.

For **ReinsNumber** 2 the facultative contract will apply to the records where the following logical statement is true:

**PortNumber = 1** AND **AccNumber = 3** AND **PolNumber = 1**

i.e. to policy 1 in account 3 in portfolio 1.

The **RiskLevel** is defined as *LOC* for **ReinsNumber** 1 and *POL* for **ReinsNumber** 2. 

The only filter fields that can be used for facultative (and surplus treaties) are **PortNumber, AccNumber, PolNumber, LocNumber** and **LocGroup** – i.e. portfolio plus the filter fields that correspond with the different risk levels: *ACC, POL, LOC* and *LGR*.

|

**Example 2 – Quota Share Reinsurance**

The example shows the OED specification for a 20% quota share reinsurance contract, applying to locations within Great Britain in portfolio 1, with a risk limit of 100,000 and an event limit of 1,000,000. ‘Risk’ is defined as a location, and risk and event limits are specified in terms of gross amount (i.e. the loss before the application of the 20% quota share).


OED Account file:

.. csv-table::
    :widths: 8,8,8,8,8,8,8
    :header: "PortNumber",	"AccNumber",	"PolNumber",	"PolDedType6All",	"PolDed6All",	"PolLimitType6All",	"PolLimit6All"


    "1",	"1",	"1",	"0",	"50,000",	"0",	"1,500,000"
    "1",	"2",	"1",	"2",	"0.05",	    "0",	"1,500,000"
    "1",	"3",	"1",	"1",	"0.10",	    "2",	"0.80"

|

OED Location file:


.. csv-table::
    :widths: 8,8,8,8,8,8,8
    :header: "PortNumber",	"LocNumber",	"AccNumber",	"CountryCode",	"BuildingTIV",	"LocDedType1Building",	"LocDed1Building"

    "1",	"1",	"1",	"GB",	"1,000,000",	"0",	"10,000"
    "1",	"2",	"1",	"GB",	"1,000,000",	"2",	"0.01"
    "1",	"1",	"2",	"GB",	"1,000,000",	"1",	"0.05"
    "1",	"2",	"2",	"GB",	"2,000,000",	"0",	"15,000"
    "1",	"1",	"3",	"DE",	"2,000,000",	"0",	"10,000"
    "1",	"2",	"3",	"DE",	"2,000,000",	"2",	"0.10"



OED Reinsurance Info file:

.. csv-table::
    :header: "ReinsNumber",	"ReinsType",	"RiskLimit",	"OccLimit",	"PlacedPercent",	"InuringPriority",	"RiskLevel"

    "1",	"QS",	"100,000",	"1,000,000",	"0.20",	"1",	"LOC"

|

OED Reinsurance Scope file:

.. csv-table::
    :header: "ReinsNumber",	"PortNumber",	"AccNumber",	"PolNumber",	"LocNumber",	"CountryCode"
   
    "1",	"1",		"","","",	                                                            "GB"


|

In the reinsurance info table in the example above, **PlacedPercent** is used to specify the 20% quota share. This means that the risk and occurrence limits will apply before the application of the 20%. In other words, the risk and occurrence terms apply to the gross figure. This is normally the way quota share treaties are worded (so that it is clear how the risk and occurrence limits relate to the attachments of other per-risk and per-occurrence contracts that the reinsured may have). 

However, some quota share treaties are worded with limits applying to the amount ceded to the treaty (i.e. after application of the 20%). If that is the case, then the user can specify 0.2 in the **CededPercent** field instead of **PlacedPercent**: **CededPercent** always applies to the incoming loss before any other terms (**PlacedPercent** always applies to the loss after all other terms). Alternatively, the user could gross up the limits to represent 100% values and continue to use **PlacedPercent**.

The logic in the reinsurance scope table means that only items with **PortNumber = 1** AND **CountryCode = GB** will be covered by the quota share contract. This means that losses from locations in account 3 will not be ceded to this treaty (as the locations in account 3 are in Germany).

|

**Example 3 - Surplus share reinsurance**

The example shows how a 3-line surplus treaty with a retention of 500,000 is specified in OED. The surplus treaty has an event limit of 3,000,000 (applicable to the loss ceded to the treaty, not the gross amount), and ‘risk’ is defined as the location.

OED Account file:

.. csv-table::
    :widths: 10,10,10,12,12,12,10
    :header: "PortNumber",	"AccNumber",	"PolNumber",	"PolDedType6All",	"PolDed6All",	"PolLimitType6All",	"PolLimit6All"
    
    "1",	"1",	"1",	"0",	"50,000",	"0",	"1,500,000"
    "1",	"2",	"1",	"2",	"0.05",	    "0",	"1,500,000"
    "1",	"3",	"1",	"1",	"0.10",	    "2",	"0.80"

|

OED Location file:

.. csv-table::
    :widths: 8,8,8,10,12,12 
    :header: "PortNumber",	"LocNumber",	"AccNumber",	"BuildingTIV",	"LocDedType1Building",	"LocDed1Building"

    "1",	"1",	"1",	"1,000,000",	"0",	"10,000"
    "1",	"2",	"1",	"1,000,000",	"2",	"0.01"
    "1",	"1",	"2",	"1,000,000",	"1",	"0.05"
    "1",	"2",	"2",	"2,000,000",	"0",	"15,000"
    "1",	"1",	"3",	"2,000,000",	"0",	"10,000"
    "1",	"2",	"3",	"2,000,000",	"2",	"0.10"
 
|

OED Reinsurance Info file:

.. csv-table::
    :widths: 8,8,8,8,8,8,8
    :header: "ReinsNumber",	"ReinsType",	"RiskLimit",	"OccLimit",	    "PlacedPercent",	"InuringPriority",	    "RiskLevel"

    "1",	"SS",	"0",	"3,000,000",	"1.0",	"1",	    "LOC"

|

OED Reinsurance Scope file:

.. csv-table::
    :header: "ReinsNumber",	"PortNumber",	"AccNumber",	"PolNumber",	"LocNumber",	"CededPercent"

    "1",	"1",	"1",	"",      "1",	"0.50"
    "1",	"1",	"1",	"",      "2",	"0.50"
    "1",	"1",	"2",	"",      "1",	"0.50"
    "1",	"1",	"2",	"",      "2",	"0.75"
    "1",	"1",	"3",	"",      "1",	"0.75"
    "1",	"1",	"3",	"",      "2",	"0.75"

|

For surplus treaties, **CededPercent** must be specified for each risk in the reinsurance scope table.

Unlike in the previous quota share example, the 3,000,000 event limit specified in the reinsurance info table applies to losses after the application of the surplus percentage. This is because **CededPercent** is always used for surplus treaties, and **CededPercent** applies before any other terms.

With surplus treaties, the following rule must be followed (they are the same as for facultative treaties):

•	Only the filter fields **PortNumber, AccNumber, PolNumber, LocNumber** & **LocGroup** can be used with surplus treaties.

|

**Example 4 - Per-risk and cat XL reinsurance**

The example below shows the specification of two reinsurance treaties – both of which apply to portfolios 1 and 2, with the per-risk contract inuring to the benefit of the cat XL contract.


OED Account file:

.. csv-table::
    :widths: 8,8,8,8,8,8,8
    :header: "PortNumber",	"AccNumber",	"PolNumber",	"PolDedType6All",	"PolDed6All",	"PolLimitType6All",	    "PolLimit6All"

    "1",	"1",	"1",	"0",	"50,000",	"0",	"1,500,000"
    "1",	"2",	"1",	"2",	"0.05",	    "0",	"1,500,000"
    "2",	"1",	"1",	"1",	"0.10",	    "2", 	"0.80"


|

OED Location file:

.. csv-table::
    :widths: 5,5,5,5,8,6 
    :header: "PortNumber",	"LocNumber",	"AccNumber",	"BuildingTIV",	"LocDedType1Building",	"LocDed1Building"

    "1",	"1",	"1",	"1,000,000",	"0",	"10,000"
    "1",	"2",	"1",	"1,000,000",	"2",	"0.01"
    "1",	"1",	"2",	"1,000,000",	"1",	"0.05"
    "1",	"2",	"2",	"2,000,000",	"0",	"15,000"
    "2",	"1",	"1",	"2,000,000",	"0",	"10,000"
    "2",	"2",	"1",	"2,000,000",	"2",	"0.10"

|

OED Reinsurance Info file:

.. csv-table::
    :header: "ReinsNumber",	"ReinsType",	"RiskAttachment",	"RiskLimit",	"OccAttachment",	"OccLimit",	"InuringPriority",	"RiskLevel"

    "1",	"PR",	"500,000",	    "1,500,000",	"0",	           "0",	           "1",			"LOC"
    "2",	"CXL",	"0",	        "0",            "3,000,000",	"3,000,000",	"2"

|

OED Reinsurance Scope file:

.. csv-table::
    :header: "ReinsNumber",	"PortNumber",	"AccNumber",	"PolNumber",	"LocNumber"

    "1",	"1",	"", "", ""
    "1",	"2",	"", "", ""
    "2",	"1",	"", "", ""			 
    "2",	"2",	"", "", ""			 	

|

Note that the account and location tables now contain exposures from two portfolios.

The **InuringPriority** field specifies the order in which treaties apply. Here the per-risk contract applies before (i.e. inures to the benefit of) the Cat XL. This means that the losses that enter the Cat XL treaty are net of any recoveries from the Per-risk treaty. The **InuringPriority** values do not need to be consecutive – the treaty with the lowest number will always be applied before the treaty with the higher number.

The reinsurance scope table contains two rows per treaty. This is to indicate that the treaties apply to both portfolio 1 and portfolio 2. The scope of each reinsurance treaty is defined by those records that satisfy the logical statement: **PortNumber** = *1* OR **PortNumber** = *2*. i.e. records either in portfolio 1 or 2. 

Essentially, within each **ReinsNumber**, each row of the reinsurance scope table acts as an OR operator and each filtering column acts as an AND operator. Although only four reinsurance scope fields are shown in the table above, all 10 reinsurance scope filtering fields could be used to define the scope of quota share, per-risk, cat XL or aggregate XL treaties.

The **RiskLevel** of the per-risk treaty is defined at location level (*LOC*). For the Cat XL treaty in this example there are no risk terms and so the **RiskLevel** is left blank.
