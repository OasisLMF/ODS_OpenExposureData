<img src="https://github.com/OasisLMF/OpenDataStandards/blob/master/images/ODS_LOGO.png" width = "300" />


# OED Liability

### Introduction

The first version of the OED schema for liability data was released in April 2022 following the efforts of a small market working group. The release video can be found on the Oasis You Tube channel (https://youtu.be/WW9N4mlNtb8). This was the first data schema available to the market to promote the use of standardised liability data for the re/insurance industry. 

OED v4.0.0 is the first major release which brings together the data standards for multiple exposure classes; property, cyber, liability and marine cargo, into a single integrated specification. It incorporates all fields from the original liability schema (v1), with some field names updated for better alignment with property and the main schema.

&nbsp;

### Rationale

This data standard is primarily intended to ensure a degree of consistency in policy-level data capture and to enable efficient sharing of select data fields across the industry. Other than the benefit of reduced frictional cost, wide-spread adoption of the schema should enable portfolio managers to implement granular, accurate and robust exposure management procedures. This can, in turn, enable sophisticated risk accumulation and/or liability modelling use cases.

The approach for the original schema was to make it as succinct and prescriptive as possible to ensure consistency of the data formats and to keep any ambiguity to a minimum. 

The original taxonomy created for the liability data standard below is still intended to be internationally applicable and implemented across UK, European and US markets. Increased market adoption of this schema will heavily rely on it being used by the key players in the data transfer process, specifically the brokers and reinsurers.

At a high level, the approach taken has aligned to the EIOPA definition of liability classes (classes 10-13 in their non-life risk classification convention), with some subdivision of the broad Other category. The benefit of linking the scope to the EIOPA definition is primarily to ensure exhaustiveness. 

*Motor Liability*, *Aviation Liability*, *Marine Liability* and *Personal Liability* are all excluded from the data standard. This is partly motivated by concerns around the sharing of personal information, but also the idea that liability exposure accumulation analysis often starts at company or industry-level. Accident & Health, which is not considered a liability class under the EIOPA convention, could be omitted for similar reasons, with a possible fringe case for inclusion being the Workers’ Compensation class of business.

It’s worth noting that in designing the taxonomy, it was decided to consider attributes of the insured, such as industry/trade/profession, separately from class/coverage. For example, medical practitioners, financial institutions, architects, engineers and lawyers can all be considered as insured attributes to be captured for the *Professional Liability* coverage class. This should lend itself to a more concise and consistent data schema.

&nbsp;

### Taxonomy 

Below is the proposed class-based taxonomy, for the purpose of identifying the insurance policy coverages that should be in or out of scope of the first version of the standard.
&nbsp;

<img src="https://github.com/OasisLMF/ODS_OpenExposureData/blob/MattDonovan82-patch-1/Docs/images/ODS_Liability_Taxonomy_v1.png" />

**Note:** What is considered 'Other', EIOPA has termed ‘general liability’. To avoid confusion, its intended to avoid this term as far as possible. In the US, general liability is better described as either Commercial or Personal Liability whereas in the UK it’s referred to as either Public or Employers Liability. 

&nbsp;

### Next Steps

As interest and adoption increases, the likely next steps for this standard will be to develop the schema to include more required data fields specific to each sub-class through collaboration and on-going feedback. This work will also include expanding the scope of the taxonomy to those classes currently not supported and driven by demand, such as motor and aviation.

Any feedback and suggestions for updates should be submitted via the 'issues' here (https://github.com/OasisLMF/OpenDataStandards/issues) which will then be reviewed by the Technical Working Group (TWG).





