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

Unlike the CondTag, **CondNumber** must be an integer but its value is unimportant. An optional field **CondName** can be used to describe the condition in meaningful terms.

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

|

OED Location file:

.. csv-table::
    :widths: 15,15,15,15,20
    :header: "AccNumber", "LocNumber", "CountryCode", "AreaCode", "CondTag"

    "Acc4",    "Loc1",  "US", "FL",  "Florida"
    "Acc4",    "Loc1",  "US", "FL",  "US"
    "Acc4",    "Loc2",  "US", "FL",  "Florida"
    "Acc4",    "Loc2",  "US", "FL",  "US"
    "Acc4",    "Loc3",  "US", "TX",  "Texas"
    "Acc4",    "Loc3",  "US", "TX",  "US"  
    "Acc4",    "Loc4",  "US", "LA",  "US"
    "Acc4",    "Loc5",  "MX", "02",  ""

We have two location records for Locations 1,2 and 3, with a CondTag for the 'Florida' or 'Texas' sub-limits and a second CondTag 'US' for the US wind sub-limit. Location 5 is outside the scope of all conditions.

In the account file, we have policy record for each condition: Florida, Texas and US sub-limit.

|

OED Account file:

.. csv-table::
    :widths: 20,20,20,20,20,20,20,20
    :header: "AccNumber", "PolNumber", "CondTag", "CondNumber", "CondLimit6All", "CondName", "CondPeril","CondPriority"

    "Acc4", "Pol1",  "Florida",  "1",  "10,000,000",   "FL sub-limit", "WW1", "1"
    "Acc4", "Pol1",  "Texas",  "2",  "5,000,000",   "TX sub-limit",  "WW1", "1"
    "Acc4", "Pol1",  "US",  "3",  "12,500,000",   "US sub-limit",  "WW1", "2"

The Florida and Texas sub-limits apply first, and the US sub-limit applies second. This would result in any combined losses from Florida and Texas exceeding the US sub-limit being limited to $12,500,000.  Then policy terms would apply to the sum of limited US locations and the rest of world locations.

|

Example losses: 

.. csv-table::
    :widths: 15,15,15,15,20
    :header: "AccNumber", "LocNumber", "CountryCode", "AreaCode", "Ground up loss"

    "Acc4",    "Loc1",  "US", "FL",  "5,000,000"
    "Acc4",    "Loc2",  "US", "FL",  "6,000,000"
    "Acc4",    "Loc3",  "US", "TX",  "7,000,000"
    "Acc4",    "Loc4",  "US", "LA",  "1,000,000"
    "Acc4",    "Loc5",  "MX", "02",  "0"

The Florida sub-limit applies to the losses from Locations 1 and 2 and limits them to $10,000,000.   The Texas sub-limit limits the Location 3 loss to $5,000,000.

The US sub-limit applies to the sum of the **limited** state level losses of $10,000,000 and $5,000,000, and to the $1,000,000 loss from Location 4 which is only subject to the US sub-limit .  The total gross loss before policy terms is **$12,500,000**. 

The Florida and Texas sub-limits can be referred to as 'child' conditions, with the US sub-limit referred to as the 'parent' condition.  

'Nested' means that all locations in the child sub-limit regions also belong to the parent sub-limit region. There may be locations belonging 
to the parent sub-limit region but not any child sub-limit region.

It is possible to represent an unlimited number of hierarchal levels in OED, but in practice the number of hierarchal levels rarely exceeds two.

|

CondPriority
############

When there are hierarchal conditions as in the example above, it is necessary to specify the order in which the conditions apply. **CondPriority** is an integer field in the accounts file which specifies the relative order in which the conditions apply.

In the previous example, the value in the **CondPriority** field is equivalent to the hierarchal level of each condition.

However in practice, where there are many children conditions, there is often an overall ranking or priority assigned to each condition regardless of whether there is a hierarchy or not.

|

**Example 5 - parent and child conditions**

|

OED Location file:

.. csv-table::
    :widths: 20,20,20
    :header: "AccNumber", "LocNumber", "CondTag"

    "Acc5",    "Loc1", "child1"
    "Acc5",    "Loc1", "parent"
    "Acc5",    "Loc2", "child2"
    "Acc5",    "Loc2", "parent"
    "Acc5",    "Loc3", "child3"
    "Acc5",    "Loc3", "parent"
    "Acc5",    "Loc4", "parent"
    "Acc5",    "Loc5", ""

The location file must have two records for each location subject to a child condition and the parent condition.  Locations 1-3 all appear twice in the locations file with two different CondTags and are part of the nested hierarchal conditions. 

Location 4 is subject to the parent condition only so it appears only once.

Location 5 appears once and is outside of the hierarchy with no conditions, and its loss is carried into the policy terms with no sub-limits applied.

|

OED Account file:

.. csv-table::
    :widths: 20,20,20,20,20,20,20
    :header: "AccNumber", "PolNumber", "CondTag", "CondNumber", "CondLimit6All", "CondName", "CondPriority"

    "Acc5", "Pol1",  "child1",  "1",  "10,000,000",   "child1",  "1"
    "Acc5", "Pol1",  "child2",  "2",  "5,000,000",   "child2",  "2"
    "Acc5", "Pol1",  "child3",  "3",  "5,000,000",   "child3",  "3"
    "Acc5", "Pol1",  "parent",  "5",  "20,000,000",   "parent",  "4"
    

The relative values of CondPriority between the child conditions do not matter when the conditions apply to non-overlapping groups of locations.  All that matters is that the relative value of the CondPriority of the parent condition is greater than the value of CondPriority of each of the child conditions.

Hierarchal conditions are only recognised by the presence of duplicate locations in the locations file, and not by the values in CondPriority or the descriptions of the conditions in CondName.

It is only when the same location appears twice in the location file with different CondTag values that the relative values of **CondPriority** will be used to determine the order in which the conditions apply. **CondPriority** is disregarded in the case that there are multiple non-overlapping conditions.

|

Policy restrictions
###################

In all of previous examples, the conditions have been 'sub-limit' types, where the set of financial terms apply to the locations which are assigned a particular CondTag. This is the default case and it does not need to be explicitly specified.

For accounts with multiple locations, the default assumption is that if there is more than one policy on the account, then every policy applies to every location in the account. 

However, policies on an account can sometimes have certain locations excluded. Policy restrictions are specified in OED using the **CondClass** field.

|

CondClass
#########

Policy restrictions are implemented as an alternative classification of special conditions which can be specified by the **CondClass** field in the account file. A value of 1 means 'Policy restriction', otherwise the default value of 0 (sub-limit) is assumed. 

The difference between them is what happens to losses for locations under the account that do not have a CondTag.

* When the condition is a sub-limit - the locations that have no CondTag will still contribute loss to the policy on the account.
* When the condition is a policy restriction - the locations that have no CondTag **will not** contribute loss to the policy on the account.

There are usually no financial terms such as limits or deductibles that apply in policy restrictions.  A policy restriction is normally only used to exclude locations from contributing to a policy. 

Next is an example which excludes Florida locations from the policy. 

|

**Example 6 - Single policy restriction**

|

OED Location file:

.. csv-table::
    :widths: 15,15,15,15,20
    :header: "AccNumber", "LocNumber", "CountryCode", "AreaCode", "CondTag"

    "Acc6",    "Loc1",  "US", "NC",  "366"
    "Acc6",    "Loc2",  "US", "NC",  "366"
    "Acc6",    "Loc3",  "US", "FL",  ""
    "Acc6",    "Loc4",  "US", "TX",  "366"

|

OED Account file:

.. csv-table::
    :widths: 20,20,20,20,20,20
    :header: "AccNumber", "PolNumber", "CondTag", "CondNumber", "CondName", "CondClass"
    
    "Acc6", "Pol1",  "366",  "366450", "EXCL FL LOCS", "1"

Only Locations 1, 2, and 4 are subject to the policy terms and Florida location 3 is excluded.

|

Example losses: 

.. csv-table::
    :widths: 15,15,15,15,20
    :header: "AccNumber", "LocNumber", "CountryCode", "AreaCode", "Ground up loss"

    "Acc6",    "Loc1",  "US", "NC",  "4,000,000"
    "Acc6",    "Loc2",  "US", "NC",  "2,000,000"
    "Acc6",    "Loc3",  "US", "FL",  "20,000,000"
    "Acc6",    "Loc4",  "US", "TX",  "10,000,000"

The policy restriction means that the Florida loss is excluded, The gross loss is the sum of losses from the non-Florida locations which is **$16,000,000**.

|

Conditions on multi-policy accounts
###################################

When there are multiple policies on an account, conditions can be symmetric (same conditions apply to all policies) or assymmetric (different conditions per policy).

Continuing the regional sub-limit example 2, we can add a second excess policy to the account with the same conditions.

|

**Example 7 - Symmetric policy conditions**

|

OED Location file:

.. csv-table::
    :widths: 15,15,15,15,20
    :header: "AccNumber", "LocNumber", "CountryCode", "AreaCode", "CondTag"

    "Acc7",    "Loc1",  "US", "CA",  "California"
    "Acc7",    "Loc2",  "US", "CA",  "California"
    "Acc7",    "Loc3",  "US", "IN",  "New Madrid"
    "Acc7",    "Loc4",  "US", "NV",  ""

|

OED Account file:

.. csv-table::
    :widths: 20,20,20,20,20,20,20
    :header: "AccNumber", "PolNumber", "CondTag", "CondNumber", "CondLimit6All", "LayerAttachment", "LayerLimit"

    "Acc7", "Pol1",  "California",  "1",  "10,000,000", "0", "10,000,000"
    "Acc7", "Pol1",  "New Madrid",  "2",  "5,000,000", "0", "10,000,000"
    "Acc7", "Pol2",  "California",  "1",  "10,000,000", "10,000,000", "15,000,000"
    "Acc7", "Pol2",  "New Madrid",  "2",  "5,000,000", "10,000,000", "15,000,000"
    
Some layer terms are added to distinguish between Pol1 and Pol2. This is an example where conditions are symmetric across policies.

|

Example losses: 

.. csv-table::
    :widths: 15,15,15,15,20
    :header: "AccNumber", "LocNumber", "CountryCode", "AreaCode", "Ground up loss"

    "Acc7",    "Loc1",  "US", "CA",  "5,000,000"
    "Acc7",    "Loc2",  "US", "CA",  "7,000,000"
    "Acc7",    "Loc3",  "US", "IN",  "0"
    "Acc7",    "Loc4",  "US", "NV",  "4,000,000"


Pol1: California losses are limited to $10,000,000. Loss before layer terms = $14,000,000. Gross loss after layer limit = **$10,000,000**

Pol2: California losses are limited to $10,000,000. Loss before layer terms = $14,000,000.  Gross loss after layer attachement and limit = **$4,000,000**

| 

If we drop one of the sub-limits from Pol2, then this is an example of assymmetric conditions.

|

**Example 8 - Asymmetric policy conditions**

Policies may be defined to apply to different locations within an account.  When this is the case, policy restrictions can be used to specify the exclusion of different locations for each policy.  This leads to assymmetric policy conditions.

In this example, a policy restriction is used to exclude location 4 from policy A.  In addition, a normal sub-limit applies to a location in policy A.  The sub-limit is applied as priority 1, and the restriction as priority 2.  

Policy B covers all 4 locations without the sublimit.

|

OED Location file:

.. csv-table::
    :widths: 15,15,15
    :header: "AccNumber", "LocNumber", "CondTag"

    "Acc8",    "Loc1",  "PolA"
    "Acc8",    "Loc2",  "Sublimit_400k"
    "Acc8",    "Loc2",  "PolA"
    "Acc8",    "Loc3",  "PolA"
    "Acc8",    "Loc4",  ""

|
    
OED Account file:

.. csv-table::
    :widths: 20,20,20,20,20,20,20
    :header: "AccNumber", "PolNumber", "CondTag", "CondNumber", "CondPriority", "CondClass", "CondLimit6All"

    "Acc8", "PolA",  "Sublimit_400k",  "1",  "1",  "0",  "400,000"
    "Acc8", "PolA",  "PolA",  "2",  "2",  "1",  ""
    "Acc8", "PolB",  "",  "",  "",  "",  ""

|

Example losses: 

.. csv-table::
    :widths: 15,15,20
    :header: "AccNumber", "LocNumber", "Ground up loss"

    "Acc8",    "Loc1",  "800,000"
    "Acc8",    "Loc2",  "1,000,000"
    "Acc8",    "Loc3",  "500,000"
    "Acc8",    "Loc4",  "300,000"


PolA: Location 2 is limited to $400,000. Location 4 is excluded. Gross loss before policy terms = $800k + $400k + $500k = **$1,700,000**

Pol2: Gross loss before policy terms = $800k + $1000k + $500k + $300k = **$2,600,000**

|

For each specified CondTag in the locations file, there must be least one associated policy condition in the accounts file, and vice versa.  In other words, there must not be any CondTags in the one file not appearing in the other file.

Finally, below are some examples of sub-limits in combination with other policy terms.

We show two examples, firstly where the sub-limits are not nested and secondly where the sub-limits are nested.

|

**Example 9 – Commercial lines – multiple locations per policy with location and policy deductibles but with a sub-limit for tier 1 wind**

The tables below show an example of a commercial portfolio with 1 account containing 6 locations. The policy covers earthquake and wind with the same overall policy limit for both perils. However, for certain locations two different sub-limits apply for wind (e.g. Florida wind sub-limit and Texas wind sub-limit). 

|

OED Location file:

.. csv-table::
    :widths: 15,15,20,25,20,15
    :header: "AccNumber",   "LocNumber",    "BuildingTIV",  "LocDedType1Building",  "LocDed1Building",  "CondTag"

    "Acc9",    "1",    "1,000,000",    "0",    "10,000",   "1"
    "Acc9",    "2",    "1,000,000",    "2",    "0.01",     "1"
    "Acc9",    "3",    "1,000,000",    "1",    "0.05",     "2"
    "Acc9",    "4",    "2,000,000",    "0",    "15,000",   "2"
    "Acc9",    "5",    "2,000,000",    "0",    "10,000",   
    "Acc9",    "6",    "2,000,000",    "2",    "0.10", 

|

OED Account file:

.. csv-table::
    :widths: 20,30,30, 30,30,30,30,30,25
    :header: "AccNumber",   "PolNumber",    "PolPerilsCovered", "PolLimit6All", "CondTag", "CondNumber",    "CondPriority", "CondPeril",    "CondLimit6All"

    "Acc9",    "1",    "QQ1;WW1",  "1,500,000", "1",   "1",    "1",    "WW1",  "250,000"
    "Acc9",    "1",    "QQ1;WW1",  "1,500,000", "2",   "2",    "1",    "WW1",  "500,000"

|

**Example 10 – Commercial lines – multiple locations per policy with location and policy deductibles with nested hierarchal sub-limits for wind**

If two special conditions are nested or overlap (e.g. Texas tier 1 wind sub-limit of 250,000 (**CondNumber** = 1) and Texas overall wind sub-limit of 500,000 (**CondNumber** = 2)), the tables would be specified as shown below. The example below assumes that locations 1 and 2 are in the Texas tier 1 region, locations 3 and 4 are within Texas but not in the Tier 1 wind region, and locations 5 and 6 are outside Texas.

|

OED Location file:

.. csv-table::
    :widths: 12,12,15,20,15,10 
    :header: "AccNumber",   "LocNumber",    "BuildingTIV",  "LocDedType1Building",  "LocDed1Building",  "CondTag"

    "Acc10",    "1",    "1,000,000",    "0",    "10,000",   "1"
    "Acc10",    "1",    "1,000,000",    "0",    "10,000",   "2"
    "Acc10",    "2",    "1,000,000",    "2",    "0.01",     "1"
    "Acc10",    "2",    "1,000,000",    "2",    "0.01",     "2"
    "Acc10",    "3",    "1,000,000",    "1",    "0.05",     "2"
    "Acc10",    "4",    "2,000,000",    "0",    "15,000",   "2"
    "Acc10",    "5",    "2,000,000",    "0",    "10,000"
    "Acc10",    "6",    "2,000,000",    "2",    "0.10"

|

OED Account file:

.. csv-table::
    :widths: 20,20,30,30,20,20,20,25,25
    :header: "AccNumber",   "PolNumber",    "PolPerilsCovered",     "PolLimit6All",  "CondTag",   "CondNumber", "CondPriority", "CondPeril",    "CondLimit6All"


    "Acc10",    "1",    "QQ1; WW1",     "1,500,000", "1",   "1",    "1",    "WW1",  "250,000"
    "Acc10",    "1",    "QQ1; WW1",     "1,500,000", "2",   "2",    "2",    "WW1",  "500,000"


