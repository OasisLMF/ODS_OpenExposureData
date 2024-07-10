Notes
=====

Blanks Allowed
##############

With reference to the Required Field column in the OEDInputFields table, blanks are not allowed for any required 'R' fields but are allowed for all optional 'O' and conditionally required 'CR' fields.

|

Peril Values
############

For filtering:

* b = fire
* o = flood
* q = quake
* x = convective storm (e.g. hail, tornado, etc.)
* z = winterstorm
* w = wind (e.g. tropical cyclone, etc.)
* m = terrorism
* s = subsidence
* g = agriculture
* p = pandemic
* v = volcanic
* s = sewage backup

Examples of combining peril codes:

|

.. csv-table::
    :widths: 20,50,30
    :header: "DB table PerilCode", "Peril description", "Input format abbreviation"

    "15", "EQ with Fire Following and tsunami with Sprinkler Leakage", "QEQ;QFF;QTS;QSL"
    "7", "EQ with Fire Following and tsunami without Sprinkler Leakage", "QEQ;QFF;QTS"
    "448", "Windstorm (ETC + TC) with Storm Surge", "WTC;WEC;WSS"
    "16777215","All perils covered","AA1"

|

Coverage Values
###############

|

There are explicit coverage codes in OED for property and cyber classes of business.

**Property**

For property insurance policies, 1Building, 2Other, 3Contents and 4BI are covered under a policy if a value greater than zero is entered into the fields BuildingTIV, OtherTIV, ContentsTIV, BITIV, respectively.  

Any deductibles and limits that apply to these coverages are specified using the financial fields with the coverage codes embedded in the field names. e.g. PolDed1Building.

**Cyber**

For cyber insurance policies, coverage should be specified using the 'PolCoverage' field. Multiple coverages are indicated by entering a semi-colon-separated list as shown in the examples table.

|

**Examples** 

|

.. csv-table::
    :widths: 30,25
    :header: "Example", "PolCoverage"

    "Single coverage","EXT"
    "Multiple coverages", "BI;CBI;DIAS;EXT;REG"
    "All cyber coverages", "CYB"
    

|

If the PolCoverage field is not present, the default value is 'CYB', i.e. the policy covers all cyber coverages.

Any deductibles and limits that apply to specific coverages are specified using the financial fields with the coverage codes embedded in the field names. e.g. PolDedEXT.

**Liability**

Liability insurance policies do not have explicit coverage codes in OED. Instead the liability coverage should be described using the 'CoverageClassDescription' field, which is a required field. The coverage of defense costs may be specified using the DefenceCost field.

|

Conditionally Required (CR) fields
##################################

Notes on Conditionally Required (CR) fields (to be used in conjunction with 'OEDCRFieldAppendix' table):

Grouping format: most granular - CRx-xx-x-x, higher level group - CRx-xx-x, higher level group - CRx-xx, highest level groups - CRx, where x is a digit between 0 and 9.

Some conditionally required fields have just the highest level hierarchy group.

If there is data in the most granular level group, then all the fields in that group and its higher levels must be included in the file too.

**Example 1** 

|

if a user wants to include Policy Blanket Deductible, PolDed6All with Conditionally Required code: CR2-06-1
Then the following logic is used to find additional fields that need to be populated:

* Require all other fields with exactly the same conditionally required field, (CR2-06-1), i.e. PolDedType6All
* Require all fields with code CR2, i.e. PolPeril

There are two fields with the last digit different (CR2-06-x), i.e. PolMinDed6All and PolMaxDed6All, that can be used with PolDed6All field, either individually or both.

|

**Example 2** 

If a user wants to include Minimum Policy Blanket Deductible, PolminDed6All with Conditionally Required code: CR2-06-2
Then the following logic is used to find additional fields that need to be populated:

* As there are no other fields with the same level, then only the next hierarchical levels should be considered.
* Require all other fields with code CR2-06, i.e. PolDedCodeAll
* Require all fields with code CR2, i.e. PolPeril

|

**Example 3** 

To define reinsurance scope, at least one field in CR6-xx group must be present. If a user wants to filter by Location Number (LocNumber) with Conditionally Required field: CR6-01-1-3

Then the following logic is used to find additional fields that need to be populated:

*Require all other fields with code CR6-01-1, i.e. AccNumber
*Require all fields with code CR6-01, i.e. PortNumber

Any additional fields within CR6-xx-x-x group can also be added (or in the higher levels), as required.

|

Motor classification
####################

References for motor classification:

HAZUS: 

https://www.hsdl.org/?view&did=480580

GEC: 

https://www.mvn.usace.army.mil/Portals/56/docs/PD/Donaldsv-Gulf.pdf

