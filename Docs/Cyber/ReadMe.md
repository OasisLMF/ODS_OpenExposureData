<img src="https://github.com/OasisLMF/OpenDataStandards/blob/master/images/ODS_LOGO.png" width = "300" />


# OED Cyber

### Introduction

There is an increasing demand for a set of agreed open standards for cyber business. It makes sense for the whole industry that these standards are developed in line with current standards for property and liability business and should be encapsulated in the ODS process and format. Please refer to the GitHub Repository (https://github.com/OasisLMF/ODS_OpenExposureData) or the ODS webpage (https://oasislmf.org/open-data-standards) for further information.

It’s important to note that this is NOT an Oasis standard but a market initiative that is only curated by Oasis and so the success of ODS is reliant on community collaboration. The aim of ODS is not to serve or be controlled by a single entity for their own commercial benefit, but to accommodate multiple developers and users, be open and transparent for all.

Throughout 2022, a working group of practitioners from the companies listed below have consulted on various approaches and the majority have agreed on the key data fields included in this standard. 

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

This data standard is primarily intended to ensure a degree of consistency in policy-level data capture and to enable efficient sharing of select data fields across the industry. Other than the benefit of reduced frictional cost, wide-spread adoption of the schema should enable portfolio managers to implement granular, accurate and robust exposure management procedures. This can, in turn, enable sophisticated risk accumulation and/or cyber modelling use cases.

Eventually it was decided that the preferred approach was to make this schema as succinct and prescriptive as possible to ensure consistency of the data formats and to keep any ambiguity to a minimum. Therefore, any supported options or specific date formats are included in the ‘descriptions’ to support the user and promote the opportunity for data to be machine-readable.

The main contention during the working group sessions was around the inclusion of technographic data fields and how they may be captured. All users are encouraged to read the considerations below (also included in the 'Read Me' tab of the data spec spreadsheet).


### Considerations

1. The aim of this schema is to promote consistency and efficiency of the transfer of cyber data around the marketplace. As the focus of this schema is to accommodate key requirements for multiple uses, this is not considered exhaustive and it is expected to develop and evolve over time. The user is not expected to populate all fields and the 'level of priority' will differ per user and should be treated as a guide. Only "essential" fields are considered strictly necessary for this schema to be used.


2. ODS encourages the capture of company identifier information but does not endorse any one provider of this data.  It is the responsibility of the user to ensure that no contractual agreements with third parties are breached in the use of this schema or the transfer of licensed data such as DUNS or LEI company identifies.

3. TECHNOGRAPHIC DATA: Opinions around the capture of technographic data have been mixed during the development of this standard. Most have suggested these should be considered "aspirational" at this stage and should be the focus for further developments. The main reason for that thinking is that capturing this data accurately to reflect how and where these providers are used in a complex business is not trivial. Questions to consider for example are, "is the cloud/email provider the same for all servers and systems within a company?" or "do all devices/systems use the same OS?"                                                                                                                                                                                                                  However, reinsurers consider that even capturing the basic data would provide value, especially for accumulation analytics. Therefore, it was decided that some basic fields should be included but populated at the discretion of the user. They should consider the vendors of their 'primary' or 'main' systems/servers as included in the 'Technographic_Data' tab.  There is no doubt that developing the capture of technographic data should be a focus for the market going-forward when writing and modelling cyber business.

4. The 'Data Example' tab provides an example of how this data schema may be used but only contains the 'essential' and 'highly recommended' fields.

5. It was decided that a shorter list of coverages would make capturing the sub-limits and deductibles by coverage simpler and promote consistency around the market. These are listed in the 'Coverages' tab with a description of the "sub-coverages" included under each.

6. The user is responsible for populating the data fields in this schema. No fields will be linked to any external database (i.e., for industry scheme or code).

7. All dates should be captured in ISO 8601 format (yyyy-mm-dd) to promote and support machine readable data. 'Year Founded' and 'Industry Vintage' only require the four-digit year (yyyy).

8. All country codes should be captured in ISO2A (2 digit) format to promote and support machine readable data.
	
Any feedback or suggestions should be sent as an issue in the GitHub repo: https://github.com/OasisLMF/ODS_OpenExposureData/issues
or email: matt.donovan@oasislmf.org

&nbsp;

### Next Steps

As the cyber modelling and underwriting industry is still in its infancy, the data capture and data quality in the market is improving continuously and so the first version of this data standard is intended as a 'first attempt' to get a consistent and open data format. As adoption increases, the aim is to develop this standard further with feedback from the community.

Any feedback and suggestions for updates should be submitted via the 'issues' here (https://github.com/OasisLMF/OpenDataStandards/issues) which will then be reviewed by the Technical Working Group (TWG).

&nbsp;

### Governance

A cyber steering committee (CSC) will be set up following some market adoption and companies in the cyber space will be represented to oversee the development of this standard. The CSC will act as a "sub-committee" into the main ODS SC and will follow the same governance and signoff process.

