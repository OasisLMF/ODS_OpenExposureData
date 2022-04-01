<img src="https://github.com/OasisLMF/OpenDataStandards/blob/master/images/ODS_LOGO.png" width = "300" />


# ODS Liability

### Introduction

There is an increasing demand for a set of agreed open standards around Liability business. It makes sense for the whole industry that these standards are developed in line with current standards for property business and should be encapsulated in the ODS process and format. Please refer to the GitHub Repository (https://github.com/OasisLMF/OpenDataStandards) or the ODS webpage  (https://oasislmf.org/open-data-standards) for further information.

It’s important to note that this is NOT an Oasis standard but a market initiative that is only curated by Oasis and so the success of ODS is reliant on community collaboration. The aim of ODS is not to serve or be controlled by a single entity for their own commercial benefit, but to accommodate multiple developers and users, be open and transparent for all.

Throughout 2021, a small working group of practitioners in this space have consulted on various approaches, the taxonomy and what key data fields need to be included in this standard. 

&nbsp;

### Rationale

This data standard is primarily intended to ensure a degree of consistency in policy-level data capture and to enable efficient sharing of select data fields across the industry. Other than the benefit of reduced frictional cost, wide-spread adoption of the schema should enable portfolio managers to implement granular, accurate and robust exposure management procedures. This can, in turn, enable sophisticated risk accumulation and/or liability modelling use cases.

Eventually it was decided that the preferred approach was to make this schema as succinct and prescriptive as possible to ensure consistency of the data formats and to keep any ambiguity to a minimum. Therefore, any supported options or specific date formats are included in the ‘descriptions’ to support the user and promote the opportunity for data to be machine-readable.

The taxonomy below is intended to be internationally applicable, with liability coverages and their naming conventions harmonised under one hierarchy. The ambition is to create one standard that can be understood and implemented across UK, European and US markets. Increased market adoption of this schema will heavily rely on it being used by the key players in the data transfer process, specifically the brokers and reinsurers.

At a high level, the approach taken has aligned to the EIOPA definition of liability classes (classes 10-13 in their non-life risk classification convention), with some subdivision of the broad Other  category. The benefit of linking the scope to the EIOPA definition is primarily to ensure exhaustiveness. 

*Motor Liability*, *Aviation Liability*, *Marine Liability* and *Personal Liability* are all proposed to be excluded from the first version of the standard. This is partly motivated by concerns around the sharing of personal information, but also the idea that liability exposure accumulation analysis often starts at company or industry-level. Accident & Health, which is not considered a liability class under the EIOPA convention, could be omitted for similar reasons, with a possible fringe case for inclusion being the Workers’ Compensation class of business.

It’s worth noting that in designing the taxonomy, it was decided to consider attributes of the insured, such as industry/trade/profession, separately from class/coverage. For example, medical practitioners, financial institutions, architects, engineers and lawyers can all be considered as insured attributes to be captured for the *Professional Liability* coverage class. This should lend itself to a more concise and consistent data schema.

&nbsp;

### Taxonomy 

Below is the proposed class-based taxonomy, for the purpose of identifying the insurance policy coverages that should be in or out of scope of the first version of the standard.
<img src="https://github.com/OasisLMF/OpenDataStandards/blob/develop/images/ODS_Liability_Taxonomy_v1.png" />

**Note:** What is considered 'Other', EIOPA has termed ‘general liability’. To avoid confusion, its intended to avoid this term as far as possible. In the US, general liability is better described as either Commercial or Personal Liability whereas in the UK it’s referred to as either Public or Employers Liability. 

&nbsp;

### Next Steps

As interest and adoption increases, the likely next steps for this standard will be to develop the schema to include more required data fields specific to each sub-class through collaboration of small working groups and on-going feedback. This work will also include expanding the scope of the taxonomy to those classes currently not supported and driven by demand, such as motor and aviation.

Any feedback and suggestions for updates should be submitted via the 'issues' here (https://github.com/OasisLMF/OpenDataStandards/issues) which will then be reviewed by the Technical Working Group (TWG).

&nbsp;

### Governance

A liability steering committee (LSC) will be set up and will contain members from companies in the liability space who will oversee the development of this standard. The LSC will act as a "sub-committee" into the main ODS SC and will follow the same governance and signoff process.

