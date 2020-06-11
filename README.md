<img src="images/Oasis_LOGO.png" width="250"/> 

# Open Data Standards (ODS)
ODS is curated by Oasis LMF and governed by the Open Data Standards Steering Committee (SC) which consists of attendees from (re)insurers, brokers and cat model vendors. 
The two main aspects of ODS are the Open Exposure Data and the Open Results Data. 

## Open Exposure Data (OED)
    
The aim of OED is to provide the industry with a robust, open and transparent data format. 
This will improve efficiency and transparency for the cat modelling community, facilitating data transfer and analytics across models and vendors.
OED is a model agnostic data format that comprises of four input files (Acc, Loc, RI Scope, RI Info).
A SQL Server schema is also available.
OED is directly supported by the Oasis Loss Modelling Framework.

## Open Results Data (ORD)

ORD was initially developed during the Lloyd's Lab innovation project in November 2019 by a working group focussed on constructing model agnostic results formats and approriate data formats. 
These model outputs will cover an extensive suite of results that can be isolated by aspects of the exposure data, financial and statistical perspectives. Working documents can be found in the docs folder.

ORD will be implemented by the Oasis Loss Modelling Framework during 2020 and all updates and progress will be located in this repo. 

## Governance

ODS is governed by a steering committee that meets every quarter and is chaired by Oasis LMF. The committee is made up of representatives from the following companies:

<img src="images/Oasis_LOGO.png" width="250"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src="images/NASDAQ_logo.png" width ="160" />


### *Cat Model Vendors:*

<img src="images/corelogic_logo.png" width ="200"/>&nbsp; &nbsp; &nbsp; <img src="images/AIR_Worldwide's_logo.jpeg" width ="100"/>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src="images/JBA_logo.jpeg" width ="80"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src="images/IF_Logo.png" width ="150"/>


### *Insurers:*

<img src="images/zurich_logo.png" width ="130"/>    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src="images/ascot_logo.png" width ="90"/>


### *Reinsurers:*

<img src="images/renre_logo.png" width ="180"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src="images/SwissRe_logo.jpg" width ="180"/>


### *Brokers:*

<img src="images/Willis_logo.jpeg" width ="200"/> <img src="images/Aon_logo.jpeg" width ="200" /> &nbsp; &nbsp; <img src="images/bms_logo.jpeg" width ="130"/> &nbsp; &nbsp; &nbsp; &nbsp;<img src="images/GuyCarp_logo.png" width ="280"/>


### *Market & Data:*
 
<img src="images/Lloyds_logo.png" width="150"/>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img
src="images/perils_ag_logo.png" width="250"/>



## Attributions
OED was developed by a working group of industry practitioners in close collaboration with AIR Worldwide who generously made their CEDE schema available to the industry. 
The working group was chaired by Matthew Jones with technical work led by Aiste Kalinauskaite both of NASDAQ (formerly Simplitium). 
The initial OED assets were ported from https://github.com/simplitium/oed on 28 April 2020 with permission from NASDAQ.

## License
The content of the Open Exposure Data (OED) format itself is licensed under the CC0 1.0 Universal license.
The MSSQL scripts to generate the relational database structure are licensed under BSD 3-clause license.
