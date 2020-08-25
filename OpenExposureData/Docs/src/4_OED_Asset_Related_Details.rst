Asset Related Details
======================

The following sections describe the OED specification for the asset value, usage, construction, and other modifiers that can influence the susceptibility of an asset to damage from a peril.
Coverage total insurable value (TIV)

Total insurable value (TIV) for each property is captured in four location level fields:

•	**BuildingTIV**: The total insurable value of the buildings.

•	**ContentsTIV**: The total insurance value of contents and stock.

•	**BITIV**: The total business interruption, or other time related, total insurable value.

•	**OtherTIV**: The total insurable value for elements other than the main building / contents / time elements. Typically used to represent the TIV for outbuildings / ap

Total insurable value is not peril dependent. The currency of the TIV is specified in the **LocCurrency** field. 
 
Occupancy Type
##############

Occupancy codes are stored in the **OccupancyCode** field. The occupancy type list is predominantly a one to one mapping from the AIR CEDE occupancy codes, although some extra codes have been added. The broad categories of code and the number ranges are shown in the table below.


.. csv-table::
    :widths: 10,10
    :header: "OED Occupancy Code Range", "Broad Category of Occupancy"

    "1000",	        "Unknown"
    "1050 – 1099",	"Residential"
    "1100 – 1149",	"Commercial"
    "1150 – 1199",	"Industrial"
    "1200 – 1249",	"Religion / Government / Education"
    "1250 – 1299",	"Transportation"
    "1300 – 1349",	"Utilities"
    "1350 – 1399",	"Miscellaneous"
    "2000 – 2799",	"Industrial Facility" 
    "3000 – 3999",	"Offshore"  

Although the code ranges above infer an extremely long list of codes there are less than 200 distinct occupancy codes in total. Yachts and automobiles are included under construction type codes rather than occupancy codes.
Some users may have translated from a different (original) occupancy code to the OED occupancy code but would like to store the original occupancy code information. This can be done using the **OrgOccupancyScheme** and **OrgOccupancyCode** fields.
 
|
 
Construction Type
##################

Construction codes are stored in the **ConstructionCode** field. The construction type list is predominantly a one to one mapping from the AIR CEDE construction codes, although some extra codes have been added. The broad categories of code and the number ranges are shown in table below.


.. csv-table::
    :widths: 10,10
    :header: "OED Construction Code Range", "Broad Category of Construction"

    "5000",	"Unknown"
    "5050 – 5099",	"Wood"
    "5100 – 5149",	"Masonry"
    "5150 – 5199",	"Concrete"
    "5200 – 5249",	"Steel"
    "5250 – 5299",	"Composite"
    "5300 – 5349",	"Special"
    "5350 – 5399",	"Mobile Homes"
    "5400 – 5449",	"Bridges"
    "5450 – 5499",	"Roads, Railroads, Runways"
    "5500 – 5549",	"Dams"
    "5550 – 5599",	"Tunnels"
    "5600 – 5649",	"Storage Tanks"
    "5650 – 5699",	"Pipelines"
    "5700 – 5749",	"Chimneys"
    "5750 – 5799",	"Towers"
    "5800 – 5849",	"Equipment"
    "5850 – 5899",	"Automobiles"
    "5900 – 5949",	"Yachts"
    "5950 – 5999",	"Miscellaneous"
    "6000 – 6099",	"Marine Cargo General"
    "6100 – 6149",	"Marine Cargo Combustible"
    "6150 – 6199",	"Marine Cargo Non-Combustible"
    "7000 - 7999",	"Offshore"

|

Although the code ranges above infer a very long list of codes there are less than 200 construction codes in total.
Some users may have translated from a different (original) construction code scheme to the OED construction code scheme but would like to store the original construction code information. This can be done using the **OrgConstructionScheme** and **OrgConstructionCode** fields.

|

Other Common Modifiers
######################

While different catastrophe models will use different modifiers to adjust the vulnerability of an asset, the following are the most commonly used modifiers:

•	**YearBuilt**: the year the building was built. **YearUpgraded**, **RoofYearBuil** are also modifiers that allow the user to add additional information.

•	**NumberOfStoreys**: The total number of storeys in a building. **BuildingHeight** is also available for the user to add in the precise height of the building if this is known. **FloorsOccupied** allows the specific floors in the building that are occupied to be specified.

•	**NumberOfBuildings**: The number of buildings represented by this location. This is commonly used to indicate the presence of aggregated data. If, instead, a user has specific details about different locations, but wants to denote a linkage of some kind between each location then the **LocGroup** field can be used to link individual locations (either for reporting purposes or to define a reinsurance ‘risk’ level).  **CorrelationGroup** can be used to denote a correlation in secondary uncertainty between groups of locations.

•	**FloorArea** & **FloorAreaUnit**: The total floor area occupied, summing the area of multiple floors.

Other modifiers, either peril specific or less commonly used by models, are available and are listed in the specification spreadsheet. They can be identified by filtering on the SecMod column in the ‘OED Input Fields’ sheet in the specification spreadsheet.
 
|

Flexi-tables
############

Despite the wide range of fields available in OED, there is always the possibility that a user needs to enter or store information without a corresponding OED field. This can be achieved through the flexi-table functionality within OED, which essentially provides a key-value pair back end table at the main hierarchical levels.
To enter additional field / values, a user can enter additional columns: **FlexiLocZZZ**, **FlexPolZZZ**, **FlexiAccZZZ**, where ‘ZZZ’ contains the name of the new field.
For example, if a user wants to store information on house colour, they could add an additional column to the location input file with the fieldname *FlexiLocHouseColour*.


