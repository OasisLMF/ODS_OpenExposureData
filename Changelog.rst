ODS Changelog
==================

`v2.1.0`_
---------
.. start_latest_release

* [#53]https://github.com/OasisLMF/OpenDataStandards/issues/53 - new payout type for step policies.
* [#54]https://github.com/OasisLMF/OpenDataStandards/issues/54 - Addition peril codes for volcanic perils.
* [#58]https://github.com/OasisLMF/OpenDataStandards/issues/58 - Additional occupancy and construction codes with descriptions.
* Above issues updated in the data spec .xlsx, associated .rst files and the OED pdf doc.

* Includes the new Pypi conversion tool for .csv to Parquet data formats in the 'feature' branch. 
https://github.com/OasisLMF/OpenDataStandards/tree/feature/56-testing-and-excel-schema

.. end_latest_release



`v2.0.0`_
---------
.. start_latest_release

**OED Version 2.0.0**

1. Updated documentation (rst files, csv, excel and pdf)

2. Updated piwind OED (example) files

3. Added a separate 'LocPopulation' file to OED - [#40] (https://github.com/OasisLMF/OpenDataStandards/issues/40)

4. Added 'w3w' as a geogscheme to data spec .xslx to support 'What3Words' - [#39](https://github.com/OasisLMF/OpenDataStandards/issues/39)

5. Added 'CondTag' varchar(20) field to loc and acc files [#30](https://github.com/OasisLMF/OpenDataStandards/issues/30)

6. Removed 'CondNumber' int field from loc file

7. Added 'OEDVersion' varchar(10) field to all four input files - [#33](https://github.com/OasisLMF/OpenDataStandards/issues/33)

8. Change 'NumberOfEmployees' int field to 'NumberOfOccupants' int field ion loc file - [#40] (https://github.com/OasisLMF/OpenDataStandards/issues/40)

9. Added 'OccupantPeriod' tiny int field to loc file - [#40] (https://github.com/OasisLMF/OpenDataStandards/issues/40)

10. Added 'IsAggregate' field - [#45] https://github.com/OasisLMF/OpenDataStandards/issues/45

11. Increased the amount of 'GeogScheme'/'GeogName' pairs supported in OED -[#51] (https://github.com/OasisLMF/OpenDataStandards/issues/51)

12. Expanding the supported perils to include subsidence, pandemic, agriculture related perils and cyber - [#46] https://github.com/OasisLMF/OpenDataStandards/issues/46

13. Changed data type of 'CondNumber' from int to varchar(20) in acc file

14. Moved 'RiskLevel' char(3) field to ReinsInfo file (removed from ReinsScope file) - [#21](https://github.com/OasisLMF/OpenDataStandards/issues/21)

15. Created a CSV to Parquet conversion tool in Python https://github.com/OasisLMF/OpenDataStandards/tree/develop/src 

**ORD Version 2.0.0**

1. Report name changed from Period Average Loss Table (PALT) to Average Loss Table (ALT) - [#36](https://github.com/OasisLMF/OpenDataStandards/issues/36)

2. Removed standalone financial perspectives - [#37] https://github.com/OasisLMF/OpenDataStandards/issues/37

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
.. end_latest_release




`v2.0.0rc1`_
---------
.. start_latest_release

**OED**

* Version 2.0.0

* Updated documentation (rst files, csv, excel and pdf)

* Updated piwind oed files

* Added 'w3w' as a geogscheme to data spec .xslx to support 'What3Words' - 
[#39](https://github.com/OasisLMF/OpenDataStandards/issues/39)

**Location file**

* Added CondTag varchar(20) field

* Removed CondNumber int field

* Added OEDVersion varchar(10) field - [#33](https://github.com/OasisLMF/OpenDataStandards/issues/33)

**Account file**

* Added CondTag varchar(20) field - [#30](https://github.com/OasisLMF/OpenDataStandards/issues/30)

* Changed data type of CondNumber from int to varchar(20)

* Added OEDVersion varchar(10) field

**ReinsInfo file**

* Added RiskLevel char(3) field (from ReinsScope file) - [#21](https://github.com/OasisLMF/OpenDataStandards/issues/21)

* Added OEDVersion varchar(10) field

**ReinsScope file**

* Removed RiskLevel char(3) field (moved to ReinsInfo file)

* Added OEDVersion varchar(10) field

**ORD**

* Version 2.0.0

* Report name changed from Period Average Loss Table (PALT) to Average Loss Table (ALT) - [#36](https://github.com/OasisLMF/OpenDataStandards/issues/36)

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
.. end_latest_release



`v1.1.5`_
---------
.. start_latest_release
* [#23](https://github.com/OasisLMF/OpenDataStandards/issues/23) - Added IFM occupancy codes for specific oil, gas, electric and nuclear risks
* [#27](https://github.com/OasisLMF/OpenDataStandards/issues/27) - Added a occupamcy code for commercial railway buildings
* Updated OpenExposureData_Spec to include new IFM occ codes
* Updated Occupancy Values.csv in schema folder with new IFM occ codes
.. end_latest_release


`v1.1.4`_
---------
.. start_latest_release
* [#22](https://github.com/OasisLMF/OpenDataStandards/issues/22) - Updated ranges for FirstFloorHeight and FirstFloorHeightUnit fields
* Made updates to the ODS ReadMe - added Munich Re and QOMPLX logos and mission statement
* Added the 'ODS_2021_Planning_&_Strategy_v1.pdf Doc
* Updated the ORD data spec for v1.1.3 and associated .csv files from latest one supplied by NASDAQ following the Lloyd's Lab project
* Added the ORD_Questions_&_Feedback.rst doc
* Added ODS diagram to the ReadMe file.
.. end_latest_release


`v1.1.3`_
---------
* [#2](https://github.com/OasisLMF/OpenDataStandards/issues/2) - Updated area code for Canada from 2 digit codes to two letter codes
* [#4](https://github.com/OasisLMF/OpenDataStandards/issues/4) - Added a field in the loc file for 'StaticMotorVehicle' 
* [#18](https://github.com/OasisLMF/OpenDataStandards/issues/18) - Made multiple updates to data ranges in the OED data spec spreadsheet ('OED Input Field' tab)
* [#19](https://github.com/OasisLMF/OpenDataStandards/issues/19) - Update to 'ContentsFloodVuln' to include option 5 for no susceptibility
* [#20](https://github.com/OasisLMF/OpenDataStandards/issues/20) - Added 'CondClass' to the loc file in the OED data spec 

.. _`1.1.4`:  https://github.com/OasisLMF/OpenDataStandards/compare/1.1.3...1.1.4
.. _`1.1.3`:  https://github.com/OasisLMF/OpenDataStandards/compare/1.1.2...1.1.3
