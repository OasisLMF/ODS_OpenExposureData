<img src="https://github.com/OasisLMF/OpenDataStandards/blob/master/images/ODS_LOGO.png" width = "300" />


# OED Cyber

### Introduction

The increasing demand over the last five years, resulted in the release of the first data schema for cyber exposure data in 2022. Since then, it became obvious that only one OED data schema accommodating multiple classes of business would be more efficient than being separate.

Following this, OED 4.0.0. was released in Jan 2025 and incorporates all of the fields captured in the original version of the cyber schema. There has been some changes to the names of the data fields to align and integrate with property and the original schema.

Please refer to the release notes for OED v4 that includes all updates (https://github.com/OasisLMF/ODS_OpenExposureData/releases).

More general information can also be found on the ODS webpage (https://oasislmf.org/open-data-standards.

It’s important to note that this is NOT an Oasis standard but a market initiative that is only curated by Oasis and so the success of ODS is reliant on community collaboration. The aim of ODS is not to serve or be controlled by a single entity for their own commercial benefit, but to accommodate multiple developers and users, be open and transparent for all.

The initial cyber data standard was developed through the collaboration of a working group throughout 2022, made up of participants from the following companies. Their time and efforts were hugely appreciated. 

* Allianz
* Aon
* Axis Capital
* Cyberacuview
* Gallagher Re
* Guidewire Cyence
* Guy Carp
* KOVRR
* Oasis LMF (ODS curator/secretariat)
* Ren Re
* Richard DeKorte (Cyber Security Independent)
* RMS
* Sompo International
* Swiss Re
* Waratah Analytics
* Zurich

&nbsp;

### Rationale

The initial data schema was primarily intended to ensure a degree of consistency in policy-level data capture and to enable efficient sharing of select data fields across the industry. Other than the benefit of reduced frictional cost, wide-spread adoption of the schema should enable portfolio managers to implement granular, accurate and robust exposure management procedures. This can, in turn, enable sophisticated risk accumulation and/or cyber modelling use cases.

The cyber specific data fields are highlighted in the 'Cyber Fields Status' column in the 'OEDInputsFields.csv' where the fields can be filtered on 'R' for 'required fields', 'O' for 'optional' and 'CR' for 'conditionally required'. 

The cyber specific coverages are included in the 'CoverageValues'.csv and prefixed by 'PolDed' for sub-deductibles and 'PolLimit' for sub-limits.



### Considerations

1. The aim of this schema is to promote consistency and efficiency of the transfer of cyber data around the marketplace. As the focus of this schema is to accommodate key requirements for multiple uses, this is not considered exhaustive and it is expected to develop and evolve over time. The user is not expected to populate all fields and should be treated as a guide. 

2. ODS encourages the capture of company identifier information but does not endorse any one provider of this data.  It is the responsibility of the user to ensure that no contractual agreements with third parties are breached in the use of this schema or the transfer of licensed data such as DUNS or LEI company identifies.

3. TECHNOGRAPHIC DATA: Opinions around the capture of technographic data were mixed during the development of the original schema. Most suggested they should be considered "aspirational" at this stage and should be the focus for further developments. The main reason for that thinking is that capturing this data accurately to reflect how and where these providers are used in a complex business is not trivial. Questions to consider for example are, "is the cloud/email provider the same for all servers and systems within a company?" or "do all devices/systems use the same OS?"

However, reinsurers consider that even capturing the basic data would provide value, especially for accumulation analytics. Therefore, it was decided that some basic fields should be included but populated at the discretion of the user. 
They should consider the vendors of their 'primary' or 'main' systems/servers as included in the 'OSVendor' (operating system), 'CloudVendor' (cloud provider), 'CRMVendor' (customer relationship management provider), 'PatchPolicy' (cadence of patches for the main systems) and 'BackUpFreq' (cadence of backups for the main systems) fields.

4. The user is responsible for populating the data fields in this schema. No fields will be linked to any external database (i.e., for industry scheme or code).

5. All cyber exposure fields are captured in the acc (account) file. There are no 'required' fields for cyber captured in the loc file.
   
Any feedback or suggestions should be sent as an issue in the GitHub repo: https://github.com/OasisLMF/ODS_OpenExposureData/issues

&nbsp;


### Governance

A cyber steering committee (CSC) will be set up one enough market adoption has occurred and developments to this need 'steering'. This will act as a "sub-committee" and a member of this CSC will report into the main ODS Steer Co.

