ODS Changelog
==================

`v3.0.0`_
---------

* (https://github.com/OasisLMF/OpenDataStandards/issues/40) - Add ‘locPopulation’ file to the current OED loc file.

* (https://github.com/OasisLMF/OpenDataStandards/issues/68) (re-opened from v2.3.0) 

After the updates to the occupancy codes for common house type such as ‘detached’, ‘semi-detached’, ‘end-terrace’ and ‘bungalow’ (OED occ codes 1070-1073) were released in ODS v2.3.0, an update to the current occupancy code for ‘terraced-housing’ was required to make it more specific to ‘mid-terraced ‘housing. 

* (https://github.com/OasisLMF/OpenDataStandards/issues/70) - Removal of building types (linked to https://github.com/OasisLMF/OpenDataStandards/issues/68). 


* (https://github.com/OasisLMF/OpenDataStandards/issues/74)- OED to support public infrastructure (transport, utilities and other).

* (https://github.com/OasisLMF/OpenDataStandards/issues/76) - support agriculture in OED.

* (https://github.com/OasisLMF/OpenDataStandards/issues/77) - Extended length of loc user def fields (to 200 characters).

* (https://github.com/OasisLMF/OpenDataStandards/issues/78) - Add OED peril code for off-floodplain. 

* (https://github.com/OasisLMF/OpenDataStandards/issues/79) - New OED fields related to vulnerability.

* (https://github.com/OasisLMF/OpenDataStandards/issues/81) - Additions to OED to support off-shore renewable energy.

* (https://github.com/OasisLMF/OpenDataStandards/issues/85) - Additional OED currency and rate of exchange fields.


`v2.3.2`_
---------
* (https://github.com/OasisLMF/OpenDataStandards/pull/80) - Add currency conversion capability to ods_tool
* (https://github.com/OasisLMF/OpenDataStandards/pull/82) - Simplify the currency conversion interface

`v2.3.1`_
---------
Added missing SoilValue field to OED spec from (https://github.com/OasisLMF/OpenDataStandards/issues/67)

`v2.3.0`_
---------
* (https://github.com/OasisLMF/OpenDataStandards/issues/66) - additing data tytpes to the ORD outputs, found here: https://github.com/OasisLMF/OpenDataStandards/blob/develop/OpenResultsData/Docs/ORD_Data_Spec.xlsx
* (https://github.com/OasisLMF/OpenDataStandards/issues/67) - inclusion of soil types for earthquake perils in OED
* (https://github.com/OasisLMF/OpenDataStandards/issues/68) - additonal geogschemes, roofcover types and OED occupancy codes
* (https://github.com/OasisLMF/OpenDataStandards/pull/73) - set unknown columns to dtype categorical



`v2.2.0`_
---------
* (https://github.com/OasisLMF/OpenDataStandards/issues/65) - update the wording in the 'OED data spec' to limit the use of geogscheme/geogname to '30'
* Inclusion of OED Liability data schema and docs (https://github.com/OasisLMF/OpenDataStandards/tree/master/OpenExposureData/Liability)


`v2.1.2`_
---------
Fixed package issue 

missing spec csv in published package

`v2.1.1`_
---------
Fix package installation issue https://github.com/OasisLMF/OpenDataStandards/pull/61 - Patched to `2.1.1` to fix but spec remains the same as `2.1.0`

`v2.1.0`_
---------

* (https://github.com/OasisLMF/OpenDataStandards/issues/53) - new payout type for step policies.
* (https://github.com/OasisLMF/OpenDataStandards/issues/54) - Addition peril codes for volcanic perils.
* (https://github.com/OasisLMF/OpenDataStandards/issues/58) - Additional occupancy and construction codes with descriptions.
* (https://github.com/OasisLMF/OpenDataStandards/issues/56) - Added testing to ods_tools package and generate csv spec from excel file.
* Above issues updated in the data spec .xlsx, associated .rst files and the OED pdf doc.

* Includes the hotfix to the Pypi conversion tool for .csv <> Parquet data formats below:
https://github.com/OasisLMF/OpenDataStandards/tree/develop/src



`v2.0.0`_
---------

**OED Version 2.0.0**

1. Updated documentation (rst files, csv, excel and pdf)

2. Updated piwind OED (example) files

3. Added a separate 'LocPopulation' file to OED - (https://github.com/OasisLMF/OpenDataStandards/issues/40)

4. Added 'w3w' as a geogscheme to data spec .xslx to support 'What3Words' - (https://github.com/OasisLMF/OpenDataStandards/issues/39)

5. Added 'CondTag' varchar(20) field to loc and acc files (https://github.com/OasisLMF/OpenDataStandards/issues/30)

6. Removed 'CondNumber' int field from loc file

7. Added 'OEDVersion' varchar(10) field to all four input files - (https://github.com/OasisLMF/OpenDataStandards/issues/33)

8. Change 'NumberOfEmployees' int field to 'NumberOfOccupants' int field ion loc file  (https://github.com/OasisLMF/OpenDataStandards/issues/40)

9. Added 'OccupantPeriod' tiny int field to loc file - (https://github.com/OasisLMF/OpenDataStandards/issues/40)

10. Added 'IsAggregate' field - https://github.com/OasisLMF/OpenDataStandards/issues/45

11. Increased the amount of 'GeogScheme'/'GeogName' pairs supported in OED - (https://github.com/OasisLMF/OpenDataStandards/issues/51)

12. Expanding the supported perils to include subsidence, pandemic, agriculture related perils and cyber - https://github.com/OasisLMF/OpenDataStandards/issues/46

13. Changed data type of 'CondNumber' from int to varchar(20) in acc file

14. Moved 'RiskLevel' char(3) field to ReinsInfo file (removed from ReinsScope file) - (https://github.com/OasisLMF/OpenDataStandards/issues/21)

15. Created a CSV to Parquet conversion tool in Python https://github.com/OasisLMF/OpenDataStandards/tree/develop/src 

**ORD Version 2.0.0**

1. Report name changed from Period Average Loss Table (PALT) to Average Loss Table (ALT) - (https://github.com/OasisLMF/OpenDataStandards/issues/36)

2. Removed standalone financial perspectives - https://github.com/OasisLMF/OpenDataStandards/issues/37

3. Reindexing of EPCalc and EPType as follows;

**EPCalc:**

1 = Mean Damage Ratio

2 = Full Uncertainty

3 = Per Sample Mean

4 = Sample Mean

**EPType:**

1 = OEP

2 = OEP TVaR

3 = AEP

4 = AEP TVaR

* Dropped version from ORD spec filename




`v2.0.0rc1`_
---------

**OED**

* Version 2.0.0

* Updated documentation (rst files, csv, excel and pdf)

* Updated piwind oed files

* Added 'w3w' as a geogscheme to data spec .xslx to support 'What3Words' - 
(https://github.com/OasisLMF/OpenDataStandards/issues/39)

**Location file**

* Added CondTag varchar(20) field

* Removed CondNumber int field

* Added OEDVersion varchar(10) field - (https://github.com/OasisLMF/OpenDataStandards/issues/33)

**Account file**

* Added CondTag varchar(20) field - (https://github.com/OasisLMF/OpenDataStandards/issues/30)

* Changed data type of CondNumber from int to varchar(20)

* Added OEDVersion varchar(10) field

**ReinsInfo file**

* Added RiskLevel char(3) field (from ReinsScope file) - (https://github.com/OasisLMF/OpenDataStandards/issues/21)

* Added OEDVersion varchar(10) field

**ReinsScope file**

* Removed RiskLevel char(3) field (moved to ReinsInfo file)

* Added OEDVersion varchar(10) field

**ORD**

* Version 2.0.0

* Report name changed from Period Average Loss Table (PALT) to Average Loss Table (ALT) - (https://github.com/OasisLMF/OpenDataStandards/issues/36)

* Reindexing of EPCalc and EPType as follows;

**EPCalc:**

1 = Mean Damage Ratio

2 = Full Uncertainty

3 = Per Sample Mean

4 = Sample Mean

**EPType:**

1 = OEP

2 = OEP TVaR

3 = AEP

4 = AEP TVaR

* Dropped version from ORD spec filename



`v1.1.5`_
---------
* (https://github.com/OasisLMF/OpenDataStandards/issues/23) - Added IFM occupancy codes for specific oil, gas, electric and nuclear risks
* (https://github.com/OasisLMF/OpenDataStandards/issues/27) - Added a occupamcy code for commercial railway buildings
* Updated OpenExposureData_Spec to include new IFM occ codes
* Updated Occupancy Values.csv in schema folder with new IFM occ codes


`v1.1.4`_
---------
* (https://github.com/OasisLMF/OpenDataStandards/issues/22) - Updated ranges for FirstFloorHeight and FirstFloorHeightUnit fields
* Made updates to the ODS ReadMe - added Munich Re and QOMPLX logos and mission statement
* Added the 'ODS_2021_Planning_&_Strategy_v1.pdf Doc
* Updated the ORD data spec for v1.1.3 and associated .csv files from latest one supplied by NASDAQ following the Lloyd's Lab project
* Added the ORD_Questions_&_Feedback.rst doc
* Added ODS diagram to the ReadMe file.


`v1.1.3`_
---------
* (https://github.com/OasisLMF/OpenDataStandards/issues/2) - Updated area code for Canada from 2 digit codes to two letter codes
* (https://github.com/OasisLMF/OpenDataStandards/issues/4) - Added a field in the loc file for 'StaticMotorVehicle' 
* (https://github.com/OasisLMF/OpenDataStandards/issues/18) - Made multiple updates to data ranges in the OED data spec spreadsheet ('OED Input Field' tab)
* (https://github.com/OasisLMF/OpenDataStandards/issues/19) - Update to 'ContentsFloodVuln' to include option 5 for no susceptibility
* (https://github.com/OasisLMF/OpenDataStandards/issues/20) - Added 'CondClass' to the loc file in the OED data spec 

.. _`1.1.4`:  https://github.com/OasisLMF/OpenDataStandards/compare/1.1.3...1.1.4
.. _`1.1.3`:  https://github.com/OasisLMF/OpenDataStandards/compare/1.1.2...1.1.3
