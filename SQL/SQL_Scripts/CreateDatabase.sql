
USE master
GO 


IF EXISTS (SELECT * FROM sys.databases WHERE name = 'OED')
BEGIN
    ALTER DATABASE OED SET SINGLE_USER WITH ROLLBACK IMMEDIATE
    DROP DATABASE OED
END
GO  

CREATE database OED
GO

USE OED
GO



CREATE TABLE account
(
  accountid         INT IDENTITY(1,1) PRIMARY KEY,
  portfolioid       INT     NOT NULL,
  accname           VARCHAR,
  accgroup          VARCHAR,
  accstatus         VARCHAR,
  expiringaccnumber VARCHAR,
  cedantname        VARCHAR,
  acccurrency       INT    ,
  accuserdef1       VARCHAR,
  accuserdef2       VARCHAR,
  accuserdef3       VARCHAR,
  accuserdef4       VARCHAR,
  accuserdef5       VARCHAR,
  originalcurrency  INT    ,
  rateofexchange    FLOAT  
)
GO

CREATE TABLE accountterm
(
  accounttermid INT IDENTITY(1,1) PRIMARY KEY,
  termid        INT NOT NULL,
  accountid     INT NOT NULL
)
GO

CREATE TABLE condition
(
  conditionid  INT IDENTITY(1,1) PRIMARY KEY,
  policyid     INT     NOT NULL,
  condnumber   VARCHAR,
  condname     VARCHAR,
  condpriority INT    ,
  condclass    INT    ,
  condtag      VARCHAR
)
GO

CREATE TABLE conditionterm
(
  conditiontermid INT IDENTITY(1,1) PRIMARY KEY,
  termid          INT NOT NULL,
  conditionid     INT NOT NULL
)
GO

CREATE TABLE coverage
(
  coverageid     INT IDENTITY(1,1) PRIMARY KEY,
  locationid     INT   NOT NULL,
  coveragetypeid INT   NOT NULL,
  tiv            FLOAT NOT NULL DEFAULT 0
)
GO

CREATE TABLE coverageterm
(
  coveragetermid INT IDENTITY(1,1) PRIMARY KEY,
  termid         INT NOT NULL,
  coverageid     INT NOT NULL
)
GO

CREATE TABLE item
(
  itemid     INT IDENTITY(1,1) PRIMARY KEY,
  coverageid INT NOT NULL,
  perilid    INT NOT NULL
)
GO

CREATE TABLE itemterm
(
  itemtermid INT IDENTITY(1,1) PRIMARY KEY,
  termid     INT NOT NULL,
  itemid     INT NOT NULL
)
GO

CREATE TABLE layer
(
  layerid     INT IDENTITY(1,1) PRIMARY KEY,
  policyid    INT NOT NULL,
  layernumber INT
)
GO

CREATE TABLE layerterm
(
  layertermid INT IDENTITY(1,1) PRIMARY KEY,
  termid      INT NOT NULL,
  layerid     INT NOT NULL
)
GO

CREATE TABLE location
(
  locationid                 INT IDENTITY(1,1) PRIMARY KEY,
  accountid                  INT     NOT NULL,
  locnumber                  VARCHAR,
  locname                    VARCHAR,
  locgroup                   VARCHAR,
  correlationgroup           VARCHAR,
  isprimary                  BIT    ,
  istenant                   BIT    ,
  buildingid                 VARCHAR,
  locinceptiondate           DATE   ,
  locexpirydate              DATE   ,
  percentcomplete            FLOAT  ,
  completiondate             DATE   ,
  countrycode                VARCHAR,
  latitude                   FLOAT  ,
  longitude                  FLOAT  ,
  streetaddress              VARCHAR,
  postalcode                 VARCHAR,
  city                       VARCHAR,
  areacode                   VARCHAR,
  areaname                   VARCHAR,
  geogschemexx               VARCHAR,
  geognamexx                 VARCHAR,
  addressmatch               VARCHAR,
  geocodequality             VARCHAR,
  geocoder                   VARCHAR,
  orgoccupancyscheme         VARCHAR,
  orgoccupancycode           VARCHAR,
  orgconstructionscheme      VARCHAR,
  orgconstructioncode        VARCHAR,
  occupancycode              INT    ,
  constructioncode           INT    ,
  yearbuilt                  INT    ,
  numberofstoreys            INT    ,
  numberofbuildings          INT    ,
  floorarea                  FLOAT  ,
  floorareaunit              INT    ,
  locuserdef1                VARCHAR,
  locuserdef2                VARCHAR,
  locuserdef3                VARCHAR,
  locuserdef4                VARCHAR,
  locuserdef5                VARCHAR,
  locperilscovered           VARCHAR,
  bipoi                      INT    ,
  loccurrency                INT    ,
  locgrosspremium            FLOAT  ,
  loctax                     FLOAT  ,
  locbrokerage               FLOAT  ,
  locnetpremium              FLOAT  ,
  noncatgrounduploss         FLOAT  ,
  locparticipation           FLOAT  ,
  payoutbasis                VARCHAR,
  reinstag                   VARCHAR,
  biwaitingperiod            INT    ,
  yearupgraded               INT    ,
  surgeleakage               INT    ,
  sprinklertype              INT    ,
  percentsprinklered         FLOAT  ,
  roofcover                  INT    ,
  roofyearbuilt              INT    ,
  roofgeometry               INT    ,
  roofequipment              INT    ,
  roofframe                  INT    ,
  roofmaintenance            INT    ,
  buildingcondition          INT    ,
  roofattachedstructures     INT    ,
  roofdeck                   INT    ,
  roofpitch                  INT    ,
  roofanchorage              INT    ,
  roofdeckattachment         INT    ,
  roofcoverattachment        INT    ,
  glasstype                  INT    ,
  latticetype                INT    ,
  floodzone                  BIT    ,
  softstory                  INT    ,
  basement                   INT    ,
  basementlevelcount         INT    ,
  windowprotection           INT    ,
  foundationtype             INT    ,
  wallattachedstructure      INT    ,
  appurtenantstructure       INT    ,
  constructionquality        INT       ,
  groundequipment            INT       ,
  equipmentbracing           INT       ,
  flashing                   INT       ,
  buildingshape              INT       ,
  shapeirregularity          INT       ,
  pounding                   INT       ,
  ornamentation              INT       ,
  specialeqconstruction      INT       ,
  retrofit                   INT       ,
  cripplewall                INT       ,
  foundationconnection       INT       ,
  shortcolumn                INT       ,
  fatigue                    INT       ,
  cladding                   INT       ,
  bipreparedness             INT       ,
  biredundancy               INT       ,
  firstfloorheight           INT       ,
  firstfloorheightunit       INT       ,
  datum                      INT       ,
  groundelevation            INT       ,
  groundelevationunit        INT       ,
  tank                       INT       ,
  redundancy                 INT       ,
  internalpartition          INT       ,
  externaldoors              INT       ,
  torsion                    INT       ,
  mechanicalequipmentside    INT       ,
  contentswindvuln           INT       ,
  contentsfloodvuln          INT       ,
  contentsquakevuln          INT       ,
  smalldebris                INT       ,
  floorsoccupied             INT       ,
  flooddefenseheight         INT       ,
  flooddefenseheightunit     INT       ,
  flooddebrisresilience      INT       ,
  basefloodelevation         INT       ,
  basefloodelevationunit     INT       ,
  buildingheight             INT       ,
  buildingheightunit         INT       ,
  buildingvaluation          INT       ,
  treeexposure               INT       ,
  chimney                    INT       ,
  buildingtype               INT       ,
  packaging                  INT       ,
  protection                 INT       ,
  salvageprotection          INT       ,
  valuablesstorage           INT       ,
  daysheld                   INT       ,
  brickveneer                INT       ,
  femacompliance             INT       ,
  customfloodsop             INT       ,
  customfloodzone            VARCHAR       ,
  multistoryhall             INT       ,
  buildingexterioropening    INT       ,
  serviceequipmentprotection INT       ,
  tallonestory               INT       ,
  terrainroughness           INT       ,
  payroll                    INT       ,
  condtag                    VARCHAR       ,
  isaggregate                INT       ,
  occupantperiod             INT       ,
  soiltype                   INT       ,
  soilvalue                  FLOAT       ,
  numberofoccupants          INT       ,
  originalcurrency           INT       ,
  rateofexchange             FLOAT       ,
  offshorewaterdepth         FLOAT       ,
  sectionlength              FLOAT       ,
  powercapacity              FLOAT       ,
  vulnerabilitysetid         INT       ,
  buildingfloodvuln          INT       ,
  bifloodvuln                INT       ,
  geom                       VARCHAR       ,
  codeprovision              INT       ,
  anchorage                  INT       ,
  diameterofpipeline         INT       ,
  voltageofenergy            INT       ,
  pumpingcapacity            INT       
)
GO

CREATE TABLE locterm
(
  loctermid  INT IDENTITY(1,1) PRIMARY KEY,
  termid     INT NOT NULL,
  locationid INT NOT NULL
)
GO

CREATE TABLE oedversion
(
  oedversion VARCHAR
)
GO

CREATE TABLE pdterm
(
  pdtermid   INT IDENTITY(1,1) PRIMARY KEY,
  termid     INT NOT NULL,
  locationid INT NOT NULL
)
GO

CREATE TABLE peril
(
  perilid INT IDENTITY(1,1) PRIMARY KEY,
  peril   VARCHAR
)
GO

CREATE TABLE policy
(
  policyid          INT IDENTITY(1,1) PRIMARY KEY,
  accountid         INT     NOT NULL,
  polnumber         VARCHAR,
  polstatus         VARCHAR,
  polinceptiondate  DATE   ,
  polexpirydate     DATE   ,
  producername      VARCHAR,
  underwriter       VARCHAR,
  branchname        VARCHAR,
  lob               VARCHAR,
  expiringpolnumber VARCHAR,
  polperilscovered  VARCHAR,
  polgrosspremium   FLOAT  ,
  poltax            FLOAT  ,
  polbrokerage      FLOAT  ,
  polnetpremium     FLOAT  ,
  hoursclause       INT    ,
  poluserdef1       VARCHAR,
  poluserdef2       VARCHAR,
  poluserdef3       VARCHAR,
  poluserdef4       VARCHAR,
  poluserdef5       VARCHAR
)
GO

CREATE TABLE policyterm
(
  policytermid INT IDENTITY(1,1) PRIMARY KEY,
  termid       INT NOT NULL,
  policyid     INT NOT NULL
)
GO

CREATE TABLE portfolio
(
  portfolioid INT IDENTITY(1,1) PRIMARY KEY,
  portnumber  VARCHAR NOT NULL,
  portname    VARCHAR,
  portnotes   VARCHAR
)
GO

CREATE TABLE term
(
  termid           INT IDENTITY(1,1) PRIMARY KEY,
  termlevel        INT  ,
  termcoveragetype INT  ,
  dedtype          INT  ,
  dedcode          INT  ,
  deductible       FLOAT,
  limittype        INT  ,
  limitcode        INT  ,
  limit            FLOAT,
  participation    FLOAT
)
GO


-- TEMP IMPORT TABLES
CREATE TABLE _location_import
(
    PortNumber varchar(20) ,
    AccNumber nvarchar(40) ,
    LocNumber nvarchar(20) ,
    LocName nvarchar(20) ,
    LocGroup nvarchar(20) ,
    CorrelationGroup int ,
    IsPrimary tinyint ,
    IsTenant tinyint ,
    BuildingID varchar(20) ,
    LocInceptionDate smalldatetime ,
    LocExpiryDate smalldatetime ,
    PercentComplete decimal ,
    CompletionDate date ,
    CountryCode char(2) ,
    Latitude decimal ,
    Longitude decimal ,
    StreetAddress nvarchar(100) ,
    PostalCode nvarchar(20) ,
    City nvarchar(50) ,
    AreaCode nvarchar(20) ,
    AreaName nvarchar(50) ,
    GeogSchemeXX varchar(5) ,
    GeogNameXX nvarchar(50) ,
    AddressMatch tinyint ,
    GeocodeQuality float ,
    Geocoder varchar(20) ,
    OrgOccupancyScheme varchar(10) ,
    OrgOccupancyCode varchar(100) ,
    OrgConstructionScheme varchar(10) ,
    OrgConstructionCode varchar(100) ,
    OccupancyCode int ,
    ConstructionCode int ,
    YearBuilt smallint ,
    NumberOfStoreys tinyint ,
    NumberOfBuildings int ,
    FloorArea float ,
    FloorAreaUnit tinyint ,
    LocUserDef1 varchar(100) ,
    LocUserDef2 varchar(100) ,
    LocUserDef3 varchar(100) ,
    LocUserDef4 varchar(100) ,
    LocUserDef5 varchar(100) ,
    FlexiLocZZZ varchar(40) ,
    LocPerilsCovered varchar(250) ,
    BuildingTIV float ,
    OtherTIV float ,
    ContentsTIV float ,
    BITIV float ,
    BIPOI float ,
    LocCurrency char(3) ,
    LocGrossPremium float ,
    LocTax float ,
    LocBrokerage float ,
    LocNetPremium float ,
    NonCatGroundUpLoss float ,
    LocParticipation float ,
    PayoutBasis tinyint ,
    ReinsTag varchar(20) ,
    LocDedCode1Building tinyint ,
    LocDedType1Building tinyint ,
    LocDed1Building float ,
    LocMinDed1Building float ,
    LocMaxDed1Building float ,
    LocDedCode2Other tinyint ,
    LocDedType2Other tinyint ,
    LocDed2Other float ,
    LocMinDed2Other float ,
    LocMaxDed2Other float ,
    LocDedCode3Contents tinyint ,
    LocDedType3Contents tinyint ,
    LocDed3Contents float ,
    LocMinDed3Contents float ,
    LocMaxDed3Contents float ,
    LocDedCode4BI tinyint ,
    LocDedType4BI tinyint ,
    LocDed4BI float ,
    LocMinDed4BI float ,
    LocMaxDed4BI float ,
    LocDedCode5PD tinyint ,
    LocDedType5PD tinyint ,
    LocDed5PD float ,
    LocMinDed5PD float ,
    LocMaxDed5PD float ,
    LocDedCode6All tinyint ,
    LocDedType6All tinyint ,
    LocDed6All float ,
    LocMinDed6All float ,
    LocMaxDed6All float ,
    LocLimitCode1Building tinyint ,
    LocLimitType1Building tinyint ,
    LocLimit1Building float ,
    LocLimitCode2Other tinyint ,
    LocLimitType2Other tinyint ,
    LocLimit2Other float ,
    LocLimitCode3Contents tinyint ,
    LocLimitType3Contents tinyint ,
    LocLimit3Contents float ,
    LocLimitCode4BI tinyint ,
    LocLimitType4BI tinyint ,
    LocLimit4BI float ,
    LocLimitCode5PD tinyint ,
    LocLimitType5PD tinyint ,
    LocLimit5PD float ,
    LocLimitCode6All tinyint ,
    LocLimitType6All tinyint ,
    LocLimit6All float ,
    BIWaitingPeriod float ,
    LocPeril varchar(250) ,
    YearUpgraded smallint ,
    SurgeLeakage float ,
    SprinklerType tinyint ,
    PercentSprinklered float ,
    RoofCover tinyint ,
    RoofYearBuilt smallint ,
    RoofGeometry tinyint ,
    RoofEquipment tinyint ,
    RoofFrame tinyint ,
    RoofMaintenance tinyint ,
    BuildingCondition tinyint ,
    RoofAttachedStructures tinyint ,
    RoofDeck tinyint ,
    RoofPitch tinyint ,
    RoofAnchorage tinyint ,
    RoofDeckAttachment tinyint ,
    RoofCoverAttachment tinyint ,
    GlassType tinyint ,
    LatticeType tinyint ,
    FloodZone varchar(20) ,
    SoftStory tinyint ,
    Basement tinyint ,
    BasementLevelCount tinyint ,
    WindowProtection tinyint ,
    FoundationType tinyint ,
    WallAttachedStructure tinyint ,
    AppurtenantStructure tinyint ,
    ConstructionQuality tinyint ,
    GroundEquipment tinyint ,
    EquipmentBracing tinyint ,
    Flashing tinyint ,
    BuildingShape tinyint ,
    ShapeIrregularity tinyint ,
    Pounding tinyint ,
    Ornamentation tinyint ,
    SpecialEQConstruction tinyint ,
    Retrofit tinyint ,
    CrippleWall tinyint ,
    FoundationConnection tinyint ,
    ShortColumn tinyint ,
    Fatigue tinyint ,
    Cladding tinyint ,
    BIPreparedness tinyint ,
    BIRedundancy tinyint ,
    FirstFloorHeight float ,
    FirstFloorHeightUnit tinyint ,
    Datum varchar(20) ,
    GroundElevation float ,
    GroundElevationUnit tinyint ,
    Tank tinyint ,
    Redundancy tinyint ,
    InternalPartition tinyint ,
    ExternalDoors tinyint ,
    Torsion tinyint ,
    MechanicalEquipmentSide tinyint ,
    ContentsWindVuln tinyint ,
    ContentsFloodVuln tinyint ,
    ContentsQuakeVuln tinyint ,
    SmallDebris tinyint ,
    FloorsOccupied varchar(255) ,
    FloodDefenseHeight float ,
    FloodDefenseHeightUnit tinyint ,
    FloodDebrisResilience tinyint ,
    BaseFloodElevation float ,
    BaseFloodElevationUnit tinyint ,
    BuildingHeight float ,
    BuildingHeightUnit tinyint ,
    BuildingValuation varchar(20) ,
    TreeExposure tinyint ,
    Chimney tinyint ,
    BuildingType tinyint ,
    Packaging tinyint ,
    Protection tinyint ,
    SalvageProtection tinyint ,
    ValuablesStorage tinyint ,
    DaysHeld smallint ,
    BrickVeneer tinyint ,
    FEMACompliance tinyint ,
    CustomFloodSOP tinyint ,
    CustomFloodZone varchar(20) ,
    MultiStoryHall tinyint ,
    BuildingExteriorOpening tinyint ,
    ServiceEquipmentProtection tinyint ,
    TallOneStory tinyint ,
    TerrainRoughness tinyint ,
    Payroll int ,
    StaticMotorVehicle tinyint ,
    CondTag varchar(20) ,
    OEDVersion varchar(10) ,
    IsAggregate tinyint ,
    OccupantPeriod tinyint ,
    SoilType tinyint ,
    SoilValue float ,
    NumberOfOccupants int ,
    OccupantUnderfive int ,
    OccupantOver65 int ,
    OccupantAge5to65 int ,
    OccupantFemale int ,
    OccupantMale int ,
    OccupantOther int ,
    OccupantUrban int ,
    OccupantRural int ,
    OccupantPoverty int ,
    OccupantRefugee int ,
    OccupantUnemployed int ,
    OccupantDisability int ,
    OccupantEthnicMinority int ,
    OccupantTemporary int ,
    OriginalCurrency char(3) ,
    RateOfExchange float ,
    OffshoreWaterDepth float ,
    SectionLength float ,
    PowerCapacity float ,
    VulnerabilitySetID int ,
    BuildingFloodVuln tinyint ,
    BIFloodVuln tinyint ,
    Geom varchar(250) ,
    CodeProvision tinyint ,
    Anchorage tinyint ,
    DiameterOfPipeline tinyint ,
    VoltageOfEnergy tinyint ,
    PumpingCapacity tinyint ,
    SoilLiquefiable int ,
    CommoditySchemeXX varchar(5) ,
    CommodityCodeXX varchar(10) ,
    CommodityVintageXX smallint 
)

CREATE TABLE _account_import
(
    PortNumber varchar(20) ,
    PortName varchar(40) ,
    PortNotes varchar(200) ,
    AccNumber nvarchar(40) ,
    AccName nvarchar(100) ,
    AccGroup varchar(40) ,
    AccStatus char(1) ,
    ExpiringAccNumber nvarchar(40) ,
    CedantName varchar(40) ,
    AccCurrency char(3) ,
    AccUserDef1 varchar(100) ,
    AccUserDef2 varchar(100) ,
    AccUserDef3 varchar(100) ,
    AccUserDef4 varchar(100) ,
    AccUserDef5 varchar(100) ,
    FlexiAccZZZ varchar(40) ,
    AccPeril varchar(250) ,
    AccDedCode1Building tinyint ,
    AccDedType1Building tinyint ,
    AccDed1Building float ,
    AccMinDed1Building float ,
    AccMaxDed1Building float ,
    AccDedCode2Other tinyint ,
    AccDedType2Other tinyint ,
    AccDed2Other float ,
    AccMinDed2Other float ,
    AccMaxDed2Other float ,
    AccDedCode3Contents tinyint ,
    AccDedType3Contents tinyint ,
    AccDed3Contents float ,
    AccMinDed3Contents float ,
    AccMaxDed3Contents float ,
    AccDedCode4BI tinyint ,
    AccDedType4BI tinyint ,
    AccDed4BI float ,
    AccMinDed4BI float ,
    AccMaxDed4BI float ,
    AccDedCode5PD tinyint ,
    AccDedType5PD tinyint ,
    AccDed5PD float ,
    AccMinDed5PD float ,
    AccMaxDed5PD float ,
    AccDedCode6All tinyint ,
    AccDedType6All tinyint ,
    AccDed6All float ,
    AccMinDed6All float ,
    AccMaxDed6All float ,
    AccLimitCode1Building tinyint ,
    AccLimitType1Building tinyint ,
    AccLimit1Building float ,
    AccLimitCode2Other tinyint ,
    AccLimitType2Other tinyint ,
    AccLimit2Other float ,
    AccLimitCode3Contents tinyint ,
    AccLimitType3Contents tinyint ,
    AccLimit3Contents float ,
    AccLimitCode4BI tinyint ,
    AccLimitType4BI tinyint ,
    AccLimit4BI float ,
    AccLimitCode5PD tinyint ,
    AccLimitType5PD tinyint ,
    AccLimit5PD float ,
    AccLimitCode6All tinyint ,
    AccLimitType6All tinyint ,
    AccLimit6All float ,
    PolNumber varchar(20) ,
    PolStatus char(1) ,
    PolInceptionDate smalldatetime ,
    PolExpiryDate smalldatetime ,
    ProducerName varchar(40) ,
    Underwriter varchar(40) ,
    BranchName varchar(20) ,
    LOB varchar(20) ,
    ExpiringPolNumber varchar(20) ,
    PolPerilsCovered varchar(250) ,
    PolGrossPremium float ,
    PolTax float ,
    PolBrokerage float ,
    PolNetPremium float ,
    LayerNumber int ,
    LayerParticipation float ,
    LayerLimit float ,
    LayerAttachment float ,
    HoursClause int ,
    PolPeril varchar(250) ,
    PolDedCode1Building tinyint ,
    PolDedType1Building tinyint ,
    PolDed1Building float ,
    PolMinDed1Building float ,
    PolMaxDed1Building float ,
    PolDedCode2Other tinyint ,
    PolDedType2Other tinyint ,
    PolDed2Other float ,
    PolMinDed2Other float ,
    PolMaxDed2Other float ,
    PolDedCode3Contents tinyint ,
    PolDedType3Contents tinyint ,
    PolDed3Contents float ,
    PolMinDed3Contents float ,
    PolMaxDed3Contents float ,
    PolDedCode4BI tinyint ,
    PolDedType4BI tinyint ,
    PolDed4BI float ,
    PolMinDed4BI float ,
    PolMaxDed4BI float ,
    PolDedCode5PD tinyint ,
    PolDedType5PD tinyint ,
    PolDed5PD float ,
    PolMinDed5PD float ,
    PolMaxDed5PD float ,
    PolDedCode6All tinyint ,
    PolDedType6All tinyint ,
    PolDed6All float ,
    PolMinDed6All float ,
    PolMaxDed6All float ,
    PolLimitCode1Building tinyint ,
    PolLimitType1Building tinyint ,
    PolLimit1Building float ,
    PolLimitCode2Other tinyint ,
    PolLimitType2Other tinyint ,
    PolLimit2Other float ,
    PolLimitCode3Contents tinyint ,
    PolLimitType3Contents tinyint ,
    PolLimit3Contents float ,
    PolLimitCode4BI tinyint ,
    PolLimitType4BI tinyint ,
    PolLimit4BI float ,
    PolLimitCode5PD tinyint ,
    PolLimitType5PD tinyint ,
    PolLimit5PD float ,
    PolLimitCode6All tinyint ,
    PolLimitType6All tinyint ,
    PolLimit6All float ,
    StepFunctionName varchar(30) ,
    StepTriggerType tinyint ,
    StepNumber tinyint ,
    PayOutType tinyint ,
    TriggerType tinyint ,
    TriggerBuildingStart float ,
    TriggerBuildingEnd float ,
    DeductibleBuilding float ,
    PayOutBuildingStart float ,
    PayOutBuildingEnd float ,
    PayOutLimitBuilding float ,
    TriggerContentsStart float ,
    TriggerContentsEnd float ,
    DeductibleContents float ,
    PayOutContentsStart float ,
    PayOutContentsEnd float ,
    PayOutLimitContents float ,
    TriggerBuildingContentsStart float ,
    TriggerBuildingContentsEnd float ,
    DeductibleBuildingContents float ,
    PayOutBuildingContentsStart float ,
    PayOutBuildingContentsEnd float ,
    PayOutLimitBuildingContents float ,
    ExtraExpenseFactor float ,
    ExtraExpenseLimit float ,
    DebrisRemovalFactor float ,
    MinimumTIV float ,
    ScaleFactor float ,
    IsLimitAtDamage tinyint ,
    PolUserDef1 varchar(100) ,
    PolUserDef2 varchar(100) ,
    PolUserDef3 varchar(100) ,
    PolUserDef4 varchar(100) ,
    PolUserDef5 varchar(100) ,
    FlexiPolZZZ varchar(40) ,
    CondNumber varchar(20) ,
    CondName varchar(40) ,
    CondPriority int ,
    CondPeril varchar(250) ,
    CondDedCode1Building tinyint ,
    CondDedType1Building tinyint ,
    CondDed1Building float ,
    CondMinDed1Building float ,
    CondMaxDed1Building float ,
    CondDedCode2Other tinyint ,
    CondDedType2Other tinyint ,
    CondDed2Other float ,
    CondMinDed2Other float ,
    CondMaxDed2Other float ,
    CondDedCode3Contents tinyint ,
    CondDedType3Contents tinyint ,
    CondDed3Contents float ,
    CondMinDed3Contents float ,
    CondMaxDed3Contents float ,
    CondDedCode4BI tinyint ,
    CondDedType4BI tinyint ,
    CondDed4BI float ,
    CondMinDed4BI float ,
    CondMaxDed4BI float ,
    CondDedCode5PD tinyint ,
    CondDedType5PD tinyint ,
    CondDed5PD float ,
    CondMinDed5PD float ,
    CondMaxDed5PD float ,
    CondDedCode6All tinyint ,
    CondDedType6All tinyint ,
    CondDed6All float ,
    CondMinDed6All float ,
    CondMaxDed6All float ,
    CondLimitCode1Building tinyint ,
    CondLimitType1Building tinyint ,
    CondLimit1Building float ,
    CondLimitCode2Other tinyint ,
    CondLimitType2Other tinyint ,
    CondLimit2Other float ,
    CondLimitCode3Contents tinyint ,
    CondLimitType3Contents tinyint ,
    CondLimit3Contents float ,
    CondLimitCode4BI tinyint ,
    CondLimitType4BI tinyint ,
    CondLimit4BI float ,
    CondLimitCode5PD tinyint ,
    CondLimitType5PD tinyint ,
    CondLimit5PD float ,
    CondLimitCode6All tinyint ,
    CondLimitType6All tinyint ,
    CondLimit6All float ,
    CondClass tinyint ,
    CondTag varchar(20) ,
    OEDVersion varchar(10) ,
    OriginalCurrency char(3) ,
    RateOfExchange float ,
    AccParticipation float ,
    CompanyIDSchemeXX varchar(5) ,
    CompanyIDCodeXX int ,
    YearFounded smallint ,
    StreetAddress nvarchar(100) ,
    PostalCode nvarchar(20) ,
    City nvarchar(50) ,
    CountryCode char(2) ,
    AreaCode char(3) ,
    IndustrySchemeXX varchar(5) ,
    IndustryCodeXX int ,
    IndustryVintageXX smallint ,
    IndustryDescription nvarchar(250) ,
    NumberOfEmployees int ,
    AnnualRevenue float ,
    AnnualRevenueCurrency char(3) ,
    GrossProfitMargin float ,
    NumberOfRecords int ,
    URL varchar(250) ,
    IsPackage smallint ,
    PolDed float ,
    StackedPolNumber varchar(20) ,
    LayerAggAttachment float ,
    LayerAggLimit float ,
    PolLimitNPBI float ,
    PolDedNPBI float ,
    PolLimitCBI float ,
    PolDedCBI float ,
    PolLimitDIAS float ,
    PolDedDIAS float ,
    PolLimitEXT float ,
    PolDedEXT float ,
    PolLimitFIN float ,
    PolDedFIN float ,
    PolLimitINRE float ,
    PolDedINRE float ,
    PolLimitLIA float ,
    PolDedLIA float ,
    PolLimitREG float ,
    PolDedREG float ,
    PolLimitENO float ,
    PolDedENO float ,
    LimitCurrency char(3) ,
    DedCurrency char(3) ,
    PolSIR float ,
    PolCoverage varchar(250) ,
    OSVendor int ,
    CloudVendor int ,
    EmailVendor int ,
    CRMVendor int ,
    PatchPolicy tinyint ,
    BackUpFreq tinyint ,
    AreaName nvarchar(50) ,
    CoverageClassDescription nvarchar(100) ,
    CoverageTerritory nvarchar(100) ,
    CoverageTrigger tinyint ,
    IsGroupCover smallint ,
    DefenceCost tinyint ,
    BIWaitingPeriod float ,
    BIPOI float ,
    InsuredName nvarchar(100)
)

-- FOREIGN KEY CONSTRAINTS
ALTER TABLE account
  ADD CONSTRAINT FK_portfolio_TO_account
    FOREIGN KEY (portfolioid)
    REFERENCES portfolio (portfolioid)
GO

ALTER TABLE accountterm
  ADD CONSTRAINT FK_term_TO_accountterm
    FOREIGN KEY (termid)
    REFERENCES term (termid)
GO

ALTER TABLE accountterm
  ADD CONSTRAINT FK_account_TO_accountterm
    FOREIGN KEY (accountid)
    REFERENCES account (accountid)
GO

ALTER TABLE condition
  ADD CONSTRAINT FK_policy_TO_condition
    FOREIGN KEY (policyid)
    REFERENCES policy (policyid)
GO

ALTER TABLE conditionterm
  ADD CONSTRAINT FK_term_TO_conditionterm
    FOREIGN KEY (termid)
    REFERENCES term (termid)
GO

ALTER TABLE conditionterm
  ADD CONSTRAINT FK_condition_TO_conditionterm
    FOREIGN KEY (conditionid)
    REFERENCES condition (conditionid)
GO

ALTER TABLE coverage
  ADD CONSTRAINT FK_location_TO_coverage
    FOREIGN KEY (locationid)
    REFERENCES location (locationid)
GO

ALTER TABLE coverageterm
  ADD CONSTRAINT FK_term_TO_coverageterm
    FOREIGN KEY (termid)
    REFERENCES term (termid)
GO

ALTER TABLE coverageterm
  ADD CONSTRAINT FK_coverage_TO_coverageterm
    FOREIGN KEY (coverageid)
    REFERENCES coverage (coverageid)
GO

ALTER TABLE item
  ADD CONSTRAINT FK_coverage_TO_item
    FOREIGN KEY (coverageid)
    REFERENCES coverage (coverageid)
GO

ALTER TABLE item
  ADD CONSTRAINT FK_peril_TO_item
    FOREIGN KEY (perilid)
    REFERENCES peril (perilid)
GO

ALTER TABLE itemterm
  ADD CONSTRAINT FK_term_TO_itemterm
    FOREIGN KEY (termid)
    REFERENCES term (termid)
GO

ALTER TABLE itemterm
  ADD CONSTRAINT FK_item_TO_itemterm
    FOREIGN KEY (itemid)
    REFERENCES item (itemid)
GO

ALTER TABLE layer
  ADD CONSTRAINT FK_policy_TO_layer
    FOREIGN KEY (policyid)
    REFERENCES policy (policyid)
GO

ALTER TABLE layerterm
  ADD CONSTRAINT FK_term_TO_layerterm
    FOREIGN KEY (termid)
    REFERENCES term (termid)
GO

ALTER TABLE layerterm
  ADD CONSTRAINT FK_layer_TO_layerterm
    FOREIGN KEY (layerid)
    REFERENCES layer (layerid)
GO

ALTER TABLE location
  ADD CONSTRAINT FK_account_TO_location
    FOREIGN KEY (accountid)
    REFERENCES account (accountid)
GO

ALTER TABLE locterm
  ADD CONSTRAINT FK_term_TO_locterm
    FOREIGN KEY (termid)
    REFERENCES term (termid)
GO

ALTER TABLE locterm
  ADD CONSTRAINT FK_location_TO_locterm
    FOREIGN KEY (locationid)
    REFERENCES location (locationid)
GO

ALTER TABLE pdterm
  ADD CONSTRAINT FK_term_TO_pdterm
    FOREIGN KEY (termid)
    REFERENCES term (termid)
GO

ALTER TABLE pdterm
  ADD CONSTRAINT FK_location_TO_pdterm
    FOREIGN KEY (locationid)
    REFERENCES location (locationid)
GO

ALTER TABLE policy
  ADD CONSTRAINT FK_account_TO_policy
    FOREIGN KEY (accountid)
    REFERENCES account (accountid)
GO

ALTER TABLE policyterm
  ADD CONSTRAINT FK_term_TO_policyterm
    FOREIGN KEY (termid)
    REFERENCES term (termid)
GO

ALTER TABLE policyterm
  ADD CONSTRAINT FK_policy_TO_policyterm
    FOREIGN KEY (policyid)
    REFERENCES policy (policyid)
GO

