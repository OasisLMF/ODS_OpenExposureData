OVERVIEW OF OED
===============

The OED comprises of four input files which are designed to allow the user to enter data in a manageable way without needing to populate and understand the relationship between a large number of tables. This does mean that there are areas of inefficiency and duplication in the input tables: this is inevitable when trying to balance between practicality and efficiency. 

The four input files are described in the Input Format {enter link to that .rst here}

Hierarchy
---------

OED follows an organisational and financial structure hierarchy that most users of catastrophe models will be familiar with. Specifically:

Coverage
########

A **coverage** type represents the lowest structure within the OED hierarchy and constitutes the specific type of coverage within an insurance policy. Within OED this is defined as:

•	Buildings
•	Other (e.g. outbuildings – ‘appurtenant’ structures or motor)
•	Contents
•	Business Interruption (BI) or time element coverage

Primary financial structures such as limits and deductibles can be attached at coverage level as well as across property damage (PD = Buildings +Other Buildings + Contents) and across all coverages. 

Location
########

A **location**, or site, comprises a group of coverages at one particular location. Primary financial structures, such as limits or deductibles can be applied at location level. Reinsurance financial structures, such as facultative reinsurance, can also be attached at location level.

Sometimes an individual location record will actually represent a number of buildings (but perhaps because of poor data quality only the main location is known). This can be represented using the **NumberOfBuildings** field. Occasionally an insurer will have details about a number of individual locations that they wish to link in some way, for example a number of buildings on a university campus or on an industrial site. This can be achieved using the **LocGroup** field.

Policy
########

A **policy** is a specific type of financial structure that applies to a set of locations. The unique aspect of a policy is that multiple policies can exist under the same account and can apply to the same set of locations. An example of this is an insurance layer, where several layers can apply to the same underlying set of locations. Reinsurance can also apply at policy level.

Within a policy there is a hierarchy of financial terms as follows:

•	A **special condition** is a type of policy level financial structure where financial conditions (such as sub-limits and sub-deductibles) apply to a subset of locations.
•	**Standard policy level** financial structures apply after special conditions but before layers.
•	**Layers** apply after special conditions and standard policy level financial structures.
Since multiple policies can apply to the same set of locations care must be taken when summing exposure or ground-up loss at policy level to avoid overcounting these metrics.

Account
########

An **account** comprises a group of policies and locations (both are needed: you cannot have a policy without a location or a location without a policy). Primary and reinsurance financial structures can apply at account level. 

An **account group** can also be specified (using the AccGroup field) which provides a means of grouping accounts together for reporting purposes. Financial structures cannot apply at account group level.

Portfolio
########

A **portfolio** comprises a number of accounts. Primary financial structures cannot apply at portfolio level, however reinsurance structures can.
 
The table below shows the different hierarchical levels in OED:

.. csv-table::
    :header: "Heirarchy", "Description", "Primary Financial Terms?", "Reinsurance Financial Terms?"

    "Location coverage",	"Building, contents, business interruption (BI), other",	"Yes",	"No"
    "Location",	"Defined through the **LocNumber** field; location level financial field names start with ‘Loc’",	"Yes", "Yes"
    "Location group",	"Defined through the **LocGroup** field",	"No",	"Yes"
    "Policy",	"Defined through the **PolNumber** field; within the policy level there is a hierarchy of financial terms:
    Special conditions apply first; field names start with *‘Cond’*. Standard policy conditions apply after special conditions; field start with *‘Pol’*.
    Layers apply after special conditions; field names start with *‘Layer’*."	"Yes",	"Yes"
    "Account",	"Defined through the **AccNumber** field; account level financial term field names all start with *‘Acc’*",	"Yes", "Yes"
    "Account group",	"Defined through the **AccGroup** field",	"No",	"No"
    "Portfolio",	"Defined by the **PortNumber** field",	"No",	"Yes"

