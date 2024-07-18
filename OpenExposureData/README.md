
The csv files in this folder are the "source of truth" of the specification of the Open Exposure Data Standard.

## Index of files

| File |  Contents | 
| ------- | ----------- | 
| [Abbreviations](Abbreviations.csv) | A table of common abbreviations used in OED and their meanings | 
| [AreaCodeValues](AreaCodeValues.csv) | A closed code list of area codes that may be populated in the OED field 'AreaCode' |
| [CommodityValues](CommodityValues.csv) | A closed code list of commodity codes that may be populated in the OED field 'CommodityCodeXX' | 
| [ConstructionValues](ConstructionValues.csv) | A closed code list of construction codes that may be populated in the OED field 'ConstructionCode' | 
| [CoverageValues](CoverageValues.csv) | A list of coverage code values. The use of these fields is explained in the [Coverage Values](#coveragevalues) section  | 
| [CurrencyValues](CurrencyValues.csv) | A closed code list of currency code values that may be populated in any OED currency field 'XXCurrency' | 
| [FinancialCodeValues](FinancialCodeValues.csv) | A closed code list of financial code values that may be populated in OED financial fields | 
| [IndustryCodeValues](IndustryCodeValues.csv) | A closed code list of Industry code values that may be populated in the OED field 'IndustryCodeXX' | 
| [OEDCRFieldAppendix](OEDCRFieldAppendix.csv) | A list of [conditionally required codes](#oedcrfieldappendix) for those OED fields that have 'CR' status. | 
| [OEDInputFields](OEDInputFields.csv) | A list of all [OED input fields](#oedinputfields) with descriptions and main attributes.  | 
| [OccupancyValues](OccupancyValues.csv) |  A closed code list of occupancy codes that may be populated in the OED field 'OccupancyCode'  | 
| [OtherValues](OtherValues.csv) | A code list for all other OED fields which must be populated using enumerated values. Also see [Other Values](#othervalues) section. | 
| [PerilsCovered](PerilsCovered.csv) | A mapping table of single (non-group) peril codes to all peril codes. |
| [PerilValues](PerilValues.csv) | A list of all [peril codes](#perilvalues) and their descriptions. | 
| [Versioning](Versioning.csv) | A list of occupancy and construction codes that have changed or been added, and the OED version they were introduced. | 

<a id="oedinputfields"></a>
## OED Input Fields

The OED Input Fields file specifies all OED field names, which OED file they go in, their data types, default values and field status for each exposure class.

The OED files are;

* Location 'loc'
* Account 'acc'
* Reinsurance info 'reins_info'
* Reinsurance scope 'reins_scope'

The exposure classes are;

* Property
* Cyber
* Liability

The field statuses are;

* Required 'R'
* Conditionally Required 'CR'
* Optional 'O'
* Not applicable 'n/a'

The field status of any OED field is allowed to be different across exposure classes.  

The reason for this structure is to allow flexibility in the data standard to meet the specific business needs for whatever the intended usage (exposure data storage, loss modelling, underwriting, humanitarian/public sector etc.), whilst maintaining consistency in the naming and data attributes of fields that are common. 

### Blanks allowed?

Blanks are not allowed for any required 'R' fields but are allowed for all optional 'O' and conditionally required 'CR' fields.

<a id="coveragevalues"></a>
## Coverage Values

There are explicit coverage codes in OED for Property and Cyber exposure classes.

### Property

For property insurance policies, 1Building, 2Other, 3Contents and 4BI are covered under a policy if a value greater than zero is entered into the fields BuildingTIV, OtherTIV, ContentsTIV, BITIV, respectively.  

Any deductibles and limits that apply to these coverages are specified using the financial fields with the coverage codes embedded in the field names. e.g. PolDed1Building.

### Cyber

For cyber insurance policies, coverage should be specified using the 'PolCoverage' field. Multiple coverages are indicated by entering a semi-colon-separated list as shown in the examples table.

#### Examples 

| Example |  PolCoverage | 
| ------- | ----------- | 
| Single coverage | EXT | 
| Multiple coverages | BI;CBI;DIAS;EXT;REG | 
| All cyber coverages | CYB | 

If the PolCoverage field is not present, the default value is 'CYB', i.e. the policy covers all cyber coverages.

Any deductibles and limits that apply to specific coverages are specified using the financial fields with the coverage codes embedded in the field names. e.g. PolDedEXT.

### Liability

Liability insurance policies do not have explicit coverage codes in OED. Instead the liability coverage should be described using the 'CoverageClassDescription' field, which is a required field. The coverage of defense costs may be specified using the DefenceCost field.

<a id="perilvalues"></a>
## Peril Values

The first letter of every peril code indicates a broad peril grouping summarized as follows:

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

| Peril description |  Input format abbreviation | 
| ------- | ----------- | 
| EQ with Fire Following and Tsunami with Sprinkler Leakage | QEQ;QFF;QTS;QSL | 
| EQ with Fire Following and Tsunami without Sprinkler Leakage | QEQ;QFF;QTS | 
| Windstorm (ETC + TC) with Storm Surge | WTC;WEC;WSS | 
| All perils covered | AA1 | 

<a id="othervalues"></a>
## Other Values

The code lists in Other Values are generally closed, meaning that only values that appear in the list are allowed to be populated in the relevant OED field. There are a few exceptions which are explained in the relevant OED field description. In particular;

* GeogSchemeXX
* IndustrySchemeXX
* CompanyIDSchemeXX
* CommoditySchemeXX

User defined scheme names may be populated in these fields as long as they are pre-fixed with 'X'.

* Statuses

These codes may be used by the fields 'AccStatus' and 'PolStatus'. In addition to the codes listed in OtherValues, users may enter any other single character code for their own purposes.


<a id="oedcrfieldappendix"></a>
## OED CR Field Appendix

Notes on Conditionally Required (CR) fields;

Grouping format: most granular - CRx-xx-x-x, higher level group - CRx-xx-x, higher level group - CRx-xx, highest level groups - CRx, where x is a digit between 0 and 9.

Some conditionally required fields have just the highest level hierarchy group.

If there is data in the most granular level group, then all the fields in that group and its higher levels must be included in the file too.

#### Example 1 

if a user wants to include Policy Blanket Deductible, PolDed6All with Conditionally Required code: CR2-06-1
Then the following logic is used to find additional fields that need to be populated:

* Require all other fields with exactly the same conditionally required field, (CR2-06-1), i.e. PolDedType6All
* Require all fields with code CR2, i.e. PolPeril

There are two fields with the last digit different (CR2-06-x), i.e. PolMinDed6All and PolMaxDed6All, that can be used with PolDed6All field, either individually or both.

#### Example 2 

If a user wants to include Minimum Policy Blanket Deductible, PolminDed6All with Conditionally Required code: CR2-06-2
Then the following logic is used to find additional fields that need to be populated:

* As there are no other fields with the same level, then only the next hierarchical levels should be considered.
* Require all other fields with code CR2-06, i.e. PolDedCodeAll
* Require all fields with code CR2, i.e. PolPeril

#### Example 3 

To define reinsurance scope, at least one field in CR6-xx group must be present. If a user wants to filter by Location Number (LocNumber) with Conditionally Required field: CR6-01-1-3

Then the following logic is used to find additional fields that need to be populated:

* Require all other fields with code CR6-01-1, i.e. AccNumber
* Require all fields with code CR6-01, i.e. PortNumber

Any additional fields within CR6-xx-x-x group can also be added (or in the higher levels), as required.

