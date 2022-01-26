Geography and Perils
====================

There are several aspects to geographical information in OED:

•	Country codes

•	Address information fields

•	Geocoding information

|

Country Codes
#############

Country codes are stored in the **CountryCode** field and are based on the ISO3166 alpha-2 codes with the following additions:

•	*XB* = Bonaire

•	*XS* = Saba

•	*XE* = St Eustatius

•	*XW* = Worldwide exposure (not used for modelling)

•	Offshore regions have been added as a direct one to one mapping from AIR’s CEDE offshore codes (the AIR three letter codes have been mapped to two-character codes for storage efficiency e.g. 'A1' for Alaska offshore)

Full details of the permitted code values are in the OED specification spreadsheet.

|

Standardised Geographical Fields
################################

The following fields are available for capturing geographical information in OED:

•	**StreetAddress**: The building number and street

•	**PostalCode**: The predominant full resolution postal code used (e.g. 5-digit zip code in the US)

•	**City**: City name

•	**AreaCode**: Code representing typically the largest geographical division in a country (e.g. State code). See the Open Exposure Data Spec spreadsheet for a list of values.

•	**AreaName**: Description of the **AreaCode** (e.g. State name)

|

Flexible Geographical Fields
############################

The OED format caters for a wide variety of models from different model developers. In order to allow sufficient flexibility to cope with different user and model developer requirements there are flexible geographical fields: **GeogSchemeXX / GeogNameXX**. The 'XX' needs to be replaced by an integer so the name pairs become **GeogScheme1/GeogName1** and OED can support up to ninety-nine pairs. It's worth noting that performance time (especially during the 'lookup' phase of analysis) may be affected the more pairs are used. These pairs allow model developers and users to define their own geographical schemes (defined by an appropriate GeogScheme code) each with a corresponding set of GeogName values.

For example, a model developer may want to split each country up into four equal areas ‘A’, ‘B’, ‘C’, ‘D’. In this case they would define a new GeogScheme code e.g. ‘QUAD’. They would communicate to users of their model that they must specify GeogName values ‘A’, ‘B’, ‘C’ or ‘D’ for their new ‘QUAD’ GeogScheme. The model user would then populate one of the GeogScheme / GeogName pairs with ‘QUAD’ and ‘A’, ‘B’, ‘C’ or ‘D’ respectively.

This provides a large amount of flexibility to cope with different user and model developer requirements.
GeogScheme codes are up to five characters (no special characters). The latest codes can be found in the Open Exposure Data Spec spreadsheet on the OED GitHub repository in https://github.com/OasisLMF/OpenDataStandards/tree/master/OpenExposureData/Docs

Users can also specify their own schemes (e.g. for reporting purposes). The only requirement here is that any user defined scheme codes **must start with ‘X’** in order to avoid a potential code clash with future model developer schemes.

|

Geocoding
#########

**Latitude** and **Longitude** fields are available within OED. However, a latitude and longitude pair in isolation gives no indication as to the resolution of the geocode, the confidence in the geocode or the geocoder used to derive the latitude and longitude. 

**AddressMatch** allows information about the resolution of the geocode to be captured. For example, whether the latitude / longitude pair represents the centroid of a large area (e.g. a State) or the centre of an individual building.

**GeocodeQuality** allows the capture of a number between 0 and 1 representing a confidence score associated with the geocode (1 denoting perfect confidence, 0 denoting zero confidence).

**Geocoder** is a free text field that allows capture of the name and version of the geocoding engine used. 

|

Peril Codes
###########

The system for capturing which perils apply to different exposure elements and financial structures is designed to be flexible and extensible. Each peril is assigned a code and shown in the table below:


.. csv-table::
    :widths: 130,30
    :header: "Peril", "Input Format Peril Code"

    "Earthquake - Shake only",	            "QEQ"	
    "Fire Following",	                    "QFF"	
    "Tsunami",	                            "QTS"	
    "Sprinkler Leakage",	                "QSL"	
    "Landslide",	                        "QLS"	
    "Liquefaction",	                        "QLF"	
    "Tropical Cyclone",	                    "WTC"	
    "Extra Tropical Cyclone",	            "WEC"	
    "Storm Surge",	                        "WSS"	
    "River / Fluvial Flood",	            "ORF"	
    "Flash / Surface / Pluvial Flood",	    "OSF"	
    "Straight-line / other convective wind","XSL"	
    "Tornado",	                            "XTD"	
    "Hail",	                                "XHL"	
    "Snow",	                                "ZSN"	
    "Ice",	                                "ZIC"	
    "Freeze",	                            "ZFZ"	
    "NonCat",	                            "BFR"	    
    "Wildfire / Bushfire",	                "BBF"	
    "NBCR Terrorism",	                    "MNT"	
    "Conventional Terrorism",	            "MTR"	
    "Lightning",	                        "XLT"
    "Winterstorm Wind",	                    "ZST"	
    "Smoke",	                            "BSK"
    "Drought Induced Subsidence",           "SSD"
    "Crop Hail (From Convective Storm)",     "XCH"
    "Cyber Security Data and Privacy Breach","CSB"
    "Cyber Security Property Damage",       "CPD"
    "Pandemic Flu",                         "PNF"
    "Volcanic Ash Cloud",               	"VVA"
    "Volcanic lava flow/eruption",	        "VVE"
    "Volcanic landslide/mudslide",      	"VVL"


The input format codes are designed to be easier to populate and recognize by an analyst. The reason for the slightly counterintuitive form of some of the abbreviations is that they are designed so that a predominant peril can quickly be identified by searching for one particular character in the abbreviations: ‘B’ for Fire, ‘O’ for Flood, ‘Q’ for Quake, ‘X’ for Convective storm, ‘Z’ for Winter storm, ‘W’ for Wind, ‘M’ for Terrorism. 

As well as the individual peril codes in the above table, there are also codes for common groupings of perils as shown in the table below.

.. csv-table::
    :widths: 130,30
    :header: "Peril Group", "Input Code" 

    "Earthquake perils",	                                "QQ1"	
    "Windstorm with storm surge",	                        "WW1"	
    "Windstorm w/o storm surge",	                        "WW2"	
    "Flood w/o storm surge",	                            "OO1"	
    "Winter storm",	                                        "ZZ1"	
    "Convective storm",	                                    "XX1"	
    "Convective storm incl. winter storm (for RMS users)",	"XZ1"	
    "Terrorism",	                                        "MM1"	
    "Wildfire with smoke",	                                "BB1"	
    "Pandemic",                                             "PP1"
    "Crop",                                                 "GG1"
    "Cyber",                                                "CC1"
    "Volcanic",                                             "VV1"
    "All perils",	                                        "AA1"	


There are several fields in the OED input tables for storing the peril codes.

Firstly, there are two fields that indicate whether or not a peril is covered for a particular location or policy: **LocPerilsCovered** and **PolPerilsCovered** respectively. These can be used to exclude a certain peril completely from a location or a particular policy.

Secondly, there are fields that indicate the perils that a particular level of financial structure covers: **LocPeril, CondPeril, PolPeril, AccPeril** and **ReinsPeril**. These indicate the perils that the financial terms (limits or deductibles) in that particular row of data apply to.

Note that this means there are two peril code fields at location and policy level (**LocPerilsCovered / LocPeril and PolPerilsCovered / PolPeril**). The **LocPerilsCovered** and **PolPerilsCovered** fields define the overall coverage for a location or policy irrespective of financial fields. This makes it much easier for the analyst to filter locations or policies that cover specific perils.

For all of these peril fields, the peril codes (either individual or peril-group codes) are entered separated by semi-colons. So for example, if a location covered wind (including all wind sub-perils) and earthquake (including all EQ sub-perils) then the users would enter *‘QQ1;WW1’* in the **LocPerilsCovered** field. If there is a policy level limit that only applies to wind, then the user would enter *‘WW1’* in the **PolPerils** field.

The way these peril codes have been designed means there is great flexibility in indicating the coverage or exclusion of perils and allowing different limits and deductibles to apply to different perils. Some examples of this are shown in the examples part of the **Financial Details** section.
