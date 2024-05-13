Policy Special Conditions
#########################

Policy special conditions are financial structures that apply to only a subset of locations within a policy. They apply after all location terms, but before any blanket policy terms or layer terms.  As well as the deductibles and limits for conditions which begin with 'Cond' and follow the same field name convention as for location and policy terms, there are the following required fields:

In the OED location and account file:

*   **CondTag** identifies the locations that a condition applies to in the locations file, and links them to the condition terms in the account file.

In the OED account file:

*   **CondNumber** identifies a unique set of financial terms of the condition 
*   **CondPeril** identifies the perils that the condition applies to
*   **CondPriority** identifies the order in which special conditions apply in case more than one condition applies to the same locations.

Optionally in the OED account file;

*   **CondName** is a descriptive field for the condition
*   **CondClass** can be used to specify a policy restriction condition

|

CondTag
#######

The scope of each special condition is specified using a **CondTag** on each location in the location input file that corresponds with the **CondTag** in the account input file. This field is normally a meaningful string describing the scope of the condition, such as 'California'.

|

**Example 1 - a California sub-limit**

|

OED Location file:

.. csv-table::
    :widths: 15,15,15,15,20
    :header: "AccNumber", "LocNumber", "CountryCode", "AreaCode", "CondTag"

    "Acc1",    "Loc1",  "US", "CA",  "California"
    "Acc1",    "Loc2",  "US", "CA",  "California"
    "Acc1",    "Loc3",  "US", "IN",  ""
    "Acc1",    "Loc4",  "US", "NV",  ""

The **CondTag** is also included in the accounts file for the policies the condition applies to.

|

OED Account file:

.. csv-table::
    :widths: 20,20,20,20,20
    :header: "AccNumber", "PolNumber", "CondTag", "CondNumber", "CondLimit6All"

    "Acc1", "Pol1",  "California",  "1",  "10,000,000"

In this example, a 'sub-limit' of $10,000,000 applies to the combined loss for locations 1 and 2 in California. This applies after any location terms specified and before any policy terms which apply to all locations under the account.

Some example ground up losses are as follows;

|

Example losses: 

.. csv-table::
    :widths: 15,15,15,15,20
    :header: "AccNumber", "LocNumber", "CountryCode", "AreaCode", "Ground up loss"

    "Acc1",    "Loc1",  "US", "CA",  "5,000,000"
    "Acc1",    "Loc2",  "US", "CA",  "7,000,000"
    "Acc1",    "Loc3",  "US", "IN",  "0"
    "Acc1",    "Loc4",  "US", "NV",  "4,000,000"

The policy loss for an earthquake affecting California and Nevada in this scenario would be **$14,000,000** due to the California losses being limited to $10,000,000.

It is common to have multiple conditions on a policy, applying to different groups of locations.  When this is the case, the policy record in the account file must be duplicated for each different **CondTag** on the locations, as demonstrated in the next example.

|

CondNumber
##########

The set of financial terms for each condition is identified by the **CondNumber** field in the account file.

For each policy in the account file, the financial terms identified by the **CondNumber** will be applied to the locations under the scope defined by each CondTag.

In Example 2, **CondNumber** 1 is a $10,000,000 sub-limit applies to California losses and **CondNumber** 2 is a $15,000,000 sublimit for losses in the New Madrid region.

**CondNumber** is normally a policy condition reference number, and may be numeric or alphanumeric. An optional field **CondName** can be used to describe the condition in meaningful terms.

Note that although these types of conditions are referred to as sub-limits, they can be any combination of the regular types of financial terms such as deductibles, min and max deductibles, and limits.

|

**Example 2 - a California sub-limit and a New Madrid sub-limit**


|

OED Location file:

.. csv-table::
    :widths: 15,15,15,15,20
    :header: "AccNumber", "LocNumber", "CountryCode", "AreaCode", "CondTag"

    "Acc2",    "Loc1",  "US", "CA",  "California"
    "Acc2",    "Loc2",  "US", "CA",  "California"
    "Acc2",    "Loc3",  "US", "IN",  "New Madrid"
    "Acc2",    "Loc4",  "US", "NV",  ""

|

OED Account file:

.. csv-table::
    :widths: 20,20,20,20,20,20
    :header: "AccNumber", "PolNumber", "CondTag", "CondNumber", "CondLimit6All", "CondName"

    "Acc2", "Pol1",  "California",  "1",  "10,000,000", "CA sub-limit"
    "Acc2", "Pol1",  "New Madrid",  "2",  "15,000,000", "NM sub-limit"

In this example, a sub-limit of $10,000,000 will apply to the sum of losses from locations 1 and 2 for an earthquake in the California area, and a sub-limit of $15,000,000 will apply to the loss from Indiana location 3 from an earthquake in the New Madrid region, before any policy terms.  

No sub-limits apply to losses for the Nevada location 4, because it is not subject to any condition (CondTag field is blank).

|

CondPeril
#########

Commonly, sub-limit conditions are peril-specific as well as region-specific.  The **CondPeril** field specifies which perils the condition applies to. This can be a single peril code, or a string of peril codes separated by semi-colons.

**CondPeril** must always be included in the account file whenever there are conditions, and it must be filled in with the appropriate peril codes. 

For example, a California earthquake sub-limit may be specified as follows;

|

**Example 3 - California earthquake sub-limit**

|

OED Location file

|

.. csv-table::
    :widths: 15,15,15,15,20,20
    :header: "AccNumber", "LocNumber", "CountryCode", "AreaCode", "CondTag", "LocPerilsCovered"

    "Acc3",    "Loc1",  "US", "CA",  "California",  "OO1;QQ1"
    "Acc3",    "Loc2",  "US", "CA",  "California",  "OO1;QQ1"
    "Acc3",    "Loc3",  "US", "IN",  "",  "OO1;QQ1"
    "Acc3",    "Loc4",  "MX", "02",  "",  "OO1;QQ1"

The **LocPerilsCovered** field specify that each location in the account is subject to 'All flood perils' and 'All earthquake perils'.

|

OED Account file:

|

.. csv-table::
    :widths: 20,20,20,20,20,20,20
    :header: "AccNumber", "PolNumber", "CondTag", "CondNumber", "CondLimit6All", "PolPerilsCovered", "CondPeril"

    "Acc3", "Pol1",  "California",  "1",  "10,000,000", "OO1;QQ1", "QQ1"

|

The **PolPerilsCovered** field specifies that the policy is subject to 'All flood perils' and 'All earthquake perils'.

However the **CondPeril** field specifies that the condition is subject to 'All earthquake perils' only.

This means that the sub-limit will only apply to losses arising from earthquake perils on the policy.

|

Nested hierarchal conditions
############################

In the above examples with multiple conditions, each condition applied to a different group of locations.

There can also be multiple sub-limits that apply to the same location in a nested hierarchy.

An example of this might be a US Wind sub-limit with nested state-level sub-limits, say for Florida and Texas, on an account covering global locations.

We must 'tag' all of the locations for each condition that applies to them by adding more records in the locations file.

|

**Example 4 - nested hierarchal conditions**


OED Location file:

.. csv-table::
    :widths: 15,15,15,15,20
    :header: "AccNumber", "LocNumber", "CountryCode", "AreaCode", "CondTag"

    "Acc4","Loc1","US","FL","Florida"
    "Acc4","Loc1","US","FL","US"
    "Acc4","Loc2","US","FL","Florida"
    "Acc4","Loc2","US","FL","US"
    "Acc4","Loc3","US","TX","Texas"
    "Acc4","Loc3","US","TX","US"  
