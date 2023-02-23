Policy Special Conditions
#########################

Policy special conditions are financial structures that apply to only a subset of locations within a policy. They apply after all location terms, but before any blanket policy terms or layer terms.  As well as the financial fields for conditions which begin with 'Cond' and follow the same field name convention as for location and policy terms, there are the following key fields:

In the OED location and account file:

*   **CondTag** identifies the locations that a condition applies to in the locations file, and links them to the condition terms in the account file.

In the OED account file:

*   **CondNumber** identifies a unique set of financial terms of the condition 
*   **CondName** is a descriptive field for the condition
*   **CondPeril** identifies the perils that the condition applies to
*   **CondPriority** identifies the order in which special conditions apply in case more than one condition applies to the same locations.
*   **CondClass** is used to specify a policy restriction

|

CondTag
#######

The scope of each special condition is specified using a **CondTag** on each location in the location input file that corresponds with the **CondTag** in the account input file. This field can contain a meaningful string such as 'California', or it can be a policy condition reference number.

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
    "Acc1",    "Loc4",  "MX", "02",  ""

The **CondTag** is also included in the accounts file for the policies the condition applies to.

|

OED Account file:

.. csv-table::
    :widths: 20,20,20,20,20
    :header: "AccNumber", "PolNumber", "CondTag", "CondNumber", "CondLimit6All"

    "Acc1", "Pol1",  "California",  "1",  "10,000,000"

It is common to have multiple conditions on a policy, applying to different groups of locations.  When this is the case, the policy record must be duplicated for each different **CondTag** on the locations.

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
    "Acc2",    "Loc4",  "MX", "02",  ""

|

OED Account file:

.. csv-table::
    :widths: 20,20,20,20,20
    :header: "AccNumber", "PolNumber", "CondTag", "CondNumber", "CondLimit6All"

    "Acc2", "Pol1",  "California",  "1",  "10,000,000"
    "Acc2", "Pol1",  "New Madrid",  "1",  "10,000,000"

In this example, a 'sub-limit' of $10m will apply to the sum of California locations 1 and 2 losses and separately to the New Madrid location 3 loss, before any policy terms.  

No sub-limits apply to the Mexico location 4, because it is not subject to any condition (CondTag field is blank).

|

CondNumber
##########

A unique set of financial terms is identified by the **CondNumber** field in the account file.

For each policy in the account file, the financial terms identified by the **CondNumber** will be applied to the locations under the scope defined by each CondTag.

In the previous example, the same condition of a $10m sub-limit applies to two different groups of locations, California and New Madrid.

If instead the New Madrid sub-limit had a different limit, then this would be represented by a different **CondNumber**, as follows.

|

**Example 3 - different terms for each sub-limit**

|

OED Location file:

.. csv-table::
    :widths: 15,15,15,15,20
    :header: "AccNumber", "LocNumber", "CountryCode", "AreaCode", "CondTag"

    "Acc3",    "Loc1",  "US", "CA",  "California"
    "Acc3",    "Loc2",  "US", "CA",  "California"
    "Acc3",    "Loc3",  "US", "IN",  "New Madrid"
    "Acc3",    "Loc4",  "MX", "02",  ""

|

OED Account file:

.. csv-table::
    :widths: 20,20,20,20,20,20
    :header: "AccNumber", "PolNumber", "CondTag", "CondNumber", "CondLimit6All", "CondName"

    "Acc3", "Pol1",  "California",  "1",  "10,000,000",   "CA sub-limit"
    "Acc3", "Pol1",  "New Madrid",  "2",  "5,000,000",   "NM sub-limit"

Unlike the CondTag, **CondNumber** must be an integer but its value is unimportant.  **CondName** can be used to describe the condition in meaningful terms.

Note that although these types of conditions are referred to as 'sub-limits', they can be any combination of the regular types of financial terms such as deductibles, min and max deductibles, and limits.

|

CondPeril
#########

Commonly, sub-limit conditions are peril-specific as well as region-specific.  The **CondPeril** field specifies which perils the condition applies to.

For example, a California earthquake sub-limit may be specified as follows;

|

**Example 4 - California earthquake sub-limit**

|

OED Location file

|

.. csv-table::
    :widths: 15,15,15,15,20,20
    :header: "AccNumber", "LocNumber", "CountryCode", "AreaCode", "CondTag", "LocPerilsCovered"

    "Acc4",    "Loc1",  "US", "CA",  "California",  "WW1;QQ1"
    "Acc4",    "Loc2",  "US", "CA",  "California",  "WW1;QQ1"
    "Acc4",    "Loc3",  "US", "IN",  "",  "WW1;QQ1"
    "Acc4",    "Loc4",  "MX", "02",  "",  "WW1;QQ1"

The **LocPerilsCovered** field specify that each location in the account is subject to 'All wind' perils and 'All earthquake perils'

|

OED Account file:

|

.. csv-table::
    :widths: 20,20,20,20,20,20,20
    :header: "AccNumber", "PolNumber", "CondTag", "CondNumber", "CondLimit6All", "PolPerilsCovered", "CondPeril"

    "Acc4", "Pol1",  "California",  "1",  "10,000,000", "WW1;QQ1", "QQ1"

|

The **PolPerilsCovered** field specifies that the policy is subject to 'All wind' perils and 'All earthquake' perils.

However the **CondPeril** field specifies that the condition is subject to 'All earthquake' perils only.

This means that the sub-limit will only apply to losses arising from earthquake perils on the policy.

|

Nested hierarchal conditions
############################

In the above examples with multiple conditions, each condition applied to a different group of locations.

There can also be multiple sub-limits that apply to the same location in a nested hierarchy.

An example of this might be a US Earthquake sub-limit with nested regional sub-limits on an account covering a global set of locations.

If we add a US Earthquake sub-limit to example 3 above, we must 'tag' all of the US sub-limit locations by adding a second record per location to the locations file.

|

**Example 5 - nested hierarchal conditions**

|

OED Location file:

.. csv-table::
    :widths: 15,15,15,15,20
    :header: "AccNumber", "LocNumber", "CountryCode", "AreaCode", "CondTag"

    "Acc5",    "Loc1",  "US", "CA",  "California"
    "Acc5",    "Loc1",  "US", "CA",  "US"
    "Acc5",    "Loc2",  "US", "CA",  "California"
    "Acc5",    "Loc2",  "US", "CA",  "US"
    "Acc5",    "Loc3",  "US", "IN",  "New Madrid"
    "Acc5",    "Loc3",  "US", "IN",  "US"  
    "Acc5",    "Loc4",  "MX", "02",  ""

Now we have two location records for Locations 1,2 and 3, with a second CondTag 'US'.

In the account file, we add a policy record for the US sub-limit.

|

OED Account file:

.. csv-table::
    :widths: 20,20,20,20,20,20,20
    :header: "AccNumber", "PolNumber", "CondTag", "CondNumber", "CondLimit6All", "CondName", "CondPriority"

    "Acc5", "Pol1",  "California",  "1",  "10,000,000",   "CA sub-limit",  "1"
    "Acc5", "Pol1",  "New Madrid",  "2",  "5,000,000",   "NM sub-limit",  "1"
    "Acc5", "Pol1",  "US",  "3",  "12,500,000",   "US sub-limit",  "2"
  e regional sub-limits can be referred to as 'child' conditions, with the US sub-limit referred to as the 'parent' condition.  
'Nested' means that all locations in the child sub-limit regions also belong to the parent sub-limit region.

The regional sub-limits apply first, and the US sub-limit applies second. This would result in any combined losses from California and New Madrid exceeding $12.5m being limited.  Then policy terms would apply to the sum of limited US locations and the rest of world locations.

It is possible to represent an unlimited number of hierarchal conditions in OED, but in practice the number of hierarchal levels rarely exceeds two.

|

CondPriority
############

When there are hierarchal conditions as in the example above, it is necessary to specify the order in which the conditions apply. **CondPriority** is an integer field in the accounts file which specifies the relative order in which the conditions apply.

In the previous example, the value in the **CondPriority** field is equivalent to the hierarchal level of each condition.

However in practice, where there are many children conditions, there is often an overall ranking or priority assigned to each condition regardless of whether there is a hierarchy or not.

|

**Example 6 - parent and child conditions**

|

OED Location file:

.. csv-table::
    :widths: 20,20,20
    :header: "AccNumber", "LocNumber", "CondTag"

    "Acc6",    "Loc1", "child1"
    "Acc6",    "Loc1", "parent"
    "Acc6",    "Loc2", "child2"
    "Acc6",    "Loc2", "parent"
    "Acc6",    "Loc3", "child3"
    "Acc6",    "Loc3", "parent"
    "Acc6",    "Loc4", "child4"
    "Acc6",    "Loc4", "parent"
    "Acc6",    "Loc5", ""

The location file must have two records for each location subject to a child condition and the parent condition.  Locations 1-4 all appear twice in the locations file with two different CondTags and are part of the nested hierarchal conditions. 

Location 5 appears once and is outside of the hierarchy with no conditions, and its loss is carried into the policy terms with no sub-limits applied.

|

OED Account file:

.. csv-table::
    :widths: 20,20,20,20,20,20,20
    :header: "AccNumber", "PolNumber", "CondTag", "CondNumber", "CondLimit6All", "CondName", "CondPriority"

    "Acc6", "Pol1",  "child1",  "1",  "10,000,000",   "child1",  "1"
    "Acc6", "Pol1",  "child2",  "2",  "5,000,000",   "child2",  "2"
    "Acc6", "Pol1",  "child3",  "3",  "5,000,000",   "child3",  "3"
    "Acc6", "Pol1",  "child4",  "4",  "5,000,000",   "child4",  "4"
    "Acc6", "Pol1",  "parent",  "5",  "20,000,000",   "parent",  "5"
    

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

There are not normally any financial terms such as limits or deductibles that apply in policy restrictions.  A policy restriction is normally only used to exclude locations from contributing to a policy. 

Next is an example which excludes New Madrid locations from the policy. This time, CondTag uses a numeric condition reference number.

|

**Example 7 - Single policy restriction**

|

OED Location file:

.. csv-table::
    :widths: 15,15,15,15,20
    :header: "AccNumber", "LocNumber", "CountryCode", "AreaCode", "CondTag"

    "Acc7",    "Loc1",  "US", "CA",  "366450"
    "Acc7",    "Loc2",  "US", "CA",  "366450"
    "Acc7",    "Loc3",  "US", "IN",  ""
    "Acc7",    "Loc4",  "MX", "02",  "366450"

|

OED Account file:

.. csv-table::
    :widths: 20,20,20,20,20,20,20
    :header: "AccNumber", "PolNumber", "CondTag", "CondNumber", "CondName", "CondClass", "LayerLimit"
    
    "Acc7", "Pol1",  "366450",  "366450", "EXCL NM LOCS", "1", "2,500,000"

Only Locations 1, 2, and 4 are subject to the policy terms and location 3 is excluded.

|

Conditions on multi-policy accounts
###################################

When there are multiple policies on an account, conditions can be symmetric (same conditions apply to all policies) or assymmetric (different conditions per policy).

Continuing the regional sub-limit example 3, we can add a second excess policy to the account with the same conditions.

|

**Example 8 - Symmetric policy sub-limits**

|

OED Location file:

.. csv-table::
    :widths: 15,15,15,15,20
    :header: "AccNumber", "LocNumber", "CountryCode", "AreaCode", "CondTag"

    "Acc8",    "Loc1",  "US", "CA",  "California"
    "Acc8",    "Loc2",  "US", "CA",  "California"
    "Acc8",    "Loc3",  "US", "IN",  "New Madrid"
    "Acc8",    "Loc4",  "MX", "02",  ""

|

OED Account file:

.. csv-table::
    :widths: 20,20,20,20,20,20,20
    :header: "AccNumber", "PolNumber", "CondTag", "CondNumber", "CondLimit6All", "LayerAttachment", "LayerLimit"

    "Acc8", "Pol1",  "California",  "1",  "10,000,000", "0", "5,000,000"
    "Acc8", "Pol1",  "New Madrid",  "2",  "5,000,000", "0", "5,000,000"
    "Acc8", "Pol2",  "California",  "1",  "10,000,000", "5,000,000", "15,000,000"
    "Acc8", "Pol2",  "New Madrid",  "2",  "5,000,000", "5,000,000", "15,000,000"
    
Some layer terms are added to distinguish between Pol1 and Pol2. This is an example where conditions are symmetric across policies.

If we drop one of the sub-limits from Pol2, then this is an example of assymmetric conditions.

|

**Example 9 - Asymmetric policy sub-limits**

|

OED Location file:

.. csv-table::
    :widths: 15,15,15,15,20
    :header: "AccNumber", "LocNumber", "CountryCode", "AreaCode", "CondTag"

    "Acc9",    "Loc1",  "US", "CA",  "California"
    "Acc9",    "Loc2",  "US", "CA",  "California"
    "Acc9",    "Loc3",  "US", "IN",  "New Madrid"
    "Acc9",    "Loc4",  "MX", "02",  ""

|
    
OED Account file:

.. csv-table::
    :widths: 20,20,20,20,20,20,20
    :header: "AccNumber", "PolNumber", "CondTag", "CondNumber", "CondLimit6All", "LayerAttachment", "LayerLimit"

    "Acc9", "Pol1",  "California",  "1",  "10,000,000", "0", "10,000,000"
    "Acc9", "Pol1",  "New Madrid",  "2",  "5,000,000", "0", "10,000,000"
    "Acc9", "Pol2",  "California",  "1",  "10,000,000", "10,000,000", "15,000,000"

In this case, the New Madrid losses would be limited to $ 5m for Pol1, but unlimited for Pol2.

For each specified CondTag in the locations file, there must be least one associated policy condition in the accounts file, and vice versa.  In other words, there must not be any CondTags in the one file not appearing in the other file.

In example 10, California locations are excluded from two different policies on an account. 

|

**Example 10 - Restrictions on two policies**

|

OED Location file:

.. csv-table::
    :widths: 15,15,15,15,20
    :header: "AccNumber", "LocNumber", "CountryCode", "AreaCode", "CondTag"

    "Acc10",    "Loc1",  "US", "CA",  "CA"
    "Acc10",    "Loc2",  "US", "CA",  "CA"
    "Acc10",    "Loc3",  "US", "IN",  ""
    "Acc10",    "Loc4",  "MX", "02",  ""

|

OED Account file:

.. csv-table::
    :widths: 20,20,20,20,20,20,20
    :header: "AccNumber", "PolNumber", "CondTag", "CondNumber", "CondName", "CondClass", "LayerLimit", "LayerAttachment", "LayerParticipation"

    "Acc10", "PolA",  "CA",  "331826", "EXCL CA LOCS", "1", "5,000,000", "0", "0.5" 
    "Acc10", "PolB",  "CA",  "331828", "EXCL CA LOCS", "1", "25,000,000","25,000,000", "0.41418"

Only locations 3 and 4 are subject to the terms of PolA and PolB and locations 1 and 2 are excluded.

Although in this example the same locations are excluded from both policies, it is possible to use policy restrictions to exclude different locations from each policy on an account.

|

**Example 11 – Commercial lines – multiple locations per policy with location and policy deductibles but with a sub-limit for tier 1 wind**

The tables below show an example of a commercial portfolio with 1 account containing 6 locations. The policy covers earthquake and wind with the same overall policy limit for both perils. However, for certain locations two different sub-limits apply for wind. We show two examples of this below, firstly where the sub-limits are not nested (e.g. Florida wind sub-limit and Texas wind sub-limit), and secondly where the sub-limits are nested (e.g. Texas tier 1 wind sub-limit and Texas overall wind sub-limit).

|

OED Location file:

.. csv-table::
    :widths: 15,15,20,25,20,15
    :header: "AccNumber",   "LocNumber",    "BuildingTIV",  "LocDedType1Building",  "LocDed1Building",  "CondTag"

    "Acc11",    "1",    "1,000,000",    "0",    "10,000",   "1"
    "Acc11",    "2",    "1,000,000",    "2",    "0.01",     "1"
    "Acc11",    "3",    "1,000,000",    "1",    "0.05",     "2"
    "Acc11",    "4",    "2,000,000",    "0",    "15,000",   "2"
    "Acc11",    "5",    "2,000,000",    "0",    "10,000",   
    "Acc11",    "6",    "2,000,000",    "2",    "0.10", 

|

OED Account file:

.. csv-table::
    :widths: 20,30,30, 30,30,30,30,30,25
    :header: "AccNumber",   "PolNumber",    "PolPeril", "PolLimit6All", "CondTag", "CondNumber",    "CondPriority", "CondPeril",    "CondLimit6All"

    "Acc11",    "1",    "QQ1;WW1",  "1,500,000", "1",   "1",    "1",    "WW1",  "250,000"
    "Acc11",    "1",    "QQ1;WW1",  "1,500,000", "2",   "2",    "1",    "WW1",  "500,000"

|

If two special conditions are nested or overlap – meaning that some locations have two applicable special conditions (e.g. Texas tier 1 wind sub-limit of 250,000 (**CondNumber** = 1) and Texas overall wind sub-limit of 500,000 (**CondNumber** = 2)), the tables would be specified as shown below. The example below assumes that locations 1 and 2 are in the Texas tier 1 region, locations 3 and 4 are within Texas but not in the Tier 1 wind region, and locations 5 and 6 are outside Texas.

|

**Example 12 – Commercial lines – multiple locations per policy with location and policy deductibles with nested hierarchal sub-limits for wind**

|

OED Location file:

.. csv-table::
    :widths: 12,12,15,20,15,10 
    :header: "AccNumber",   "LocNumber",    "BuildingTIV",  "LocDedType1Building",  "LocDed1Building",  "CondTag"

    "Acc12",    "1",    "1,000,000",    "0",    "10,000",   "1"
    "Acc12",    "1",    "1,000,000",    "0",    "10,000",   "2"
    "Acc12",    "2",    "1,000,000",    "2",    "0.01",     "1"
    "Acc12",    "2",    "1,000,000",    "2",    "0.01",     "2"
    "Acc12",    "3",    "1,000,000",    "1",    "0.05",     "2"
    "Acc12",    "4",    "2,000,000",    "0",    "15,000",   "2"
    "Acc12",    "5",    "2,000,000",    "0",    "10,000"
    "Acc12",    "6",    "2,000,000",    "2",    "0.10"

|

OED Account file:

.. csv-table::
    :widths: 20,20,30,30,20,20,20,25,25
    :header: "AccNumber",   "PolNumber",    "PolPeril",     "PolLimit6All",  "CondTag",   "CondNumber", "CondPriority", "CondPeril",    "CondLimit6All"


    "Acc12",    "1",    "QQ1; WW1",     "1,500,000", "1",   "1",    "1",    "WW1",  "250,000"
    "Acc12",    "1",    "QQ1; WW1",     "1,500,000", "2",   "2",    "2",    "WW1",  "500,000"


