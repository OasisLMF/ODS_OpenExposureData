USE master;
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'OED')
BEGIN
    ALTER DATABASE OED SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE OED
END

CREATE DATABASE OED
GO

------------------------------------------------------------------------------------------------------

USE OED
GO

-- oed version table
CREATE TABLE [dbo].[OedVersion] (
    [OedVersion] VARCHAR (10) NULL
);
GO

------------------------------------------------------------------------------------------------------

CREATE TABLE [dbo].[Portfolio] (
    [PortfolioId] INT NOT NULL,
    [PortNumber]  VARCHAR (20) NOT NULL,
    [PortName]    VARCHAR (40) NULL,
    [PortNotes]   VARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([PortfolioId] ASC)
);
GO


CREATE TABLE [dbo].[Account] (
    [AccountId]         INT         NOT NULL,
    [PortfolioId]       INT         NOT NULL,
    [AccNumber]         NVARCHAR (100) NOT NULL
    PRIMARY KEY CLUSTERED ([AccountId] ASC)
);
GO

CREATE TABLE [dbo].[AccountDetails] (
    [AccountId]         INT         NOT NULL,
    [AccName]           NVARCHAR (100) NULL,
    [AccGroup]          VARCHAR (40) NULL,
    [AccStatus]         CHAR (1) NULL,
    [ExpiringAccNumber] NVARCHAR (40) NULL,
    [CedantName]        VARCHAR (40) NULL,
    [AccCurrency]       CHAR (3) NULL,
    [AccUserDef1]       VARCHAR (100) NULL,
    [AccUserDef2]       VARCHAR (100) NULL,
    [AccUserDef3]       VARCHAR (100) NULL,
    [AccUserDef4]       VARCHAR (100) NULL,
    [AccUserDef5]       VARCHAR (100) NULL,
    [OriginalCurrency]  CHAR (3) NULL,
    [RateOfExchange]    FLOAT (53)  NULL,
    PRIMARY KEY CLUSTERED ([AccountId] ASC)
);
GO

CREATE TABLE [dbo].[Policy] (
    [PolicyId]          INT         NOT NULL,
    [AccountId]         INT         NOT NULL,
    [PolNumber]         VARCHAR (20) NULL,
    [PolPerilsCovered]  VARCHAR (250) NULL
    PRIMARY KEY CLUSTERED ([PolicyId] ASC),
    CONSTRAINT [FK_account_TO_policy] FOREIGN KEY ([AccountId]) REFERENCES [dbo].[Account] ([AccountId])
);
GO

CREATE TABLE [dbo].[PolicyDetails] (
    [PolicyId]          INT         NOT NULL,
    [PolStatus]         CHAR (1) NULL,
    [PolInceptionDate]  SMALLDATETIME NULL,
    [PolExpiryDate]     SMALLDATETIME NULL,
    [ProducerName]      VARCHAR (40) NULL,
    [Underwriter]       VARCHAR (40) NULL,
    [BranchName]        VARCHAR (20) NULL,
    [Lob]               VARCHAR (20) NULL,
    [ExpiringPolNumber] VARCHAR (20) NULL,
    [PolGrossPremium]   FLOAT (53)  NULL,
    [PolTax]            FLOAT (53)  NULL,
    [PolBrokerage]      FLOAT (53)  NULL,
    [PolNetPremium]     FLOAT (53)  NULL,
    [HoursClause]       INT         NULL,
    [PolUserDef1]       VARCHAR (100) NULL,
    [PolUserDef2]       VARCHAR (100) NULL,
    [PolUserDef3]       VARCHAR (100) NULL,
    [PolUserDef4]       VARCHAR (100) NULL,
    [PolUserDef5]       VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([PolicyId] ASC)
);
GO

CREATE TABLE [dbo].[Layer] (
    [LayerId]     INT NOT NULL,
    [PolicyId]    INT NOT NULL,
    [LayerNumber] INT NULL,
    PRIMARY KEY CLUSTERED ([LayerId] ASC),
    CONSTRAINT [FK_policy_TO_layer] FOREIGN KEY ([PolicyId]) REFERENCES [dbo].[Policy] ([PolicyId])
);
GO

CREATE TABLE [dbo].[Condition] (
    [ConditionId]  INT         NOT NULL,
    [PolicyId]     INT         NOT NULL,
    [CondNumber]   VARCHAR (1) NULL,
    [CondName]     VARCHAR (1) NULL,
    [CondPriority] INT         NULL,
    [CondClass]    INT         NULL,
    [CondTag]      VARCHAR (1) NULL,
    PRIMARY KEY CLUSTERED ([ConditionId] ASC),
    CONSTRAINT [FK_policy_TO_condition] FOREIGN KEY ([PolicyId]) REFERENCES [dbo].[Policy] ([PolicyId])
);
GO

CREATE TABLE [dbo].[Location] (
    [LocationId]                 INT         NOT NULL,
    [AccountId]                  INT         NOT NULL,
    [LocNumber]                  NVARCHAR (20) NOT NULL,
    [LocPerilsCovered]           VARCHAR (250) NOT NULL
    PRIMARY KEY CLUSTERED ([LocationId] ASC),
    CONSTRAINT [FK_account_TO_location] FOREIGN KEY ([AccountId]) REFERENCES [dbo].[account] ([AccountId])
);
GO

CREATE TABLE [dbo].[ConditionLocation] (
    [ConditionLocationId]        INT         NOT NULL,
    [LocationId]                 INT         NOT NULL,
    [ConditionId]                INT         NOT NULL,
    [CondTag]                    VARCHAR (250) NOT NULL
    PRIMARY KEY CLUSTERED ([ConditionLocationId] ASC),
    CONSTRAINT [FK_conditionlocation_TO_location] FOREIGN KEY ([LocationId]) REFERENCES [dbo].[Location] ([LocationId]),
    CONSTRAINT [FK_conditionlocation_TO_condition] FOREIGN KEY ([ConditionId]) REFERENCES [dbo].[Condition] ([ConditionId])
);
GO

CREATE TABLE [dbo].[LocationDetail] (
    [LocationId]                 INT         NOT NULL,
    [LocName]                    NVARCHAR (20) NULL,
    [LocGroup]                   NVARCHAR (20) NULL,
    [CorrelationGroup]           INT NULL,
    [IsPrimary]                  TINYINT NULL,
    [IsTenant]                   TINYINT NULL,
    [BuildingId]                 VARCHAR (20) NULL,
    [LocInceptionDate]           SMALLDATETIME NULL,
    [LocExpiryDate]              SMALLDATETIME NULL,
    [PercentComplete]            DECIMAL (18, 4) NULL,
    [CompletionDate]             DATE NULL,
    [CountryCode]                CHAR (2) NULL,
    [Latitude]                   DECIMAL (18, 6) NULL,
    [Longitude]                  DECIMAL (18, 6) NULL,
    [StreetAddress]              NVARCHAR (100) NULL,
    [PostalCode]                 NVARCHAR (20) NULL,
    [City]                       NVARCHAR (50) NULL,
    [AreaCode]                   NVARCHAR (20) NULL,
    [AreaName]                   NVARCHAR (50) NULL,
    [GeogSchemeXx]               VARCHAR (5) NULL,
    [GeogNameXx]                 NVARCHAR (50) NULL,
    [AddressMatch]               TINYINT NULL,
    [GeocodeQuality]             FLOAT (53) NULL,
    [Geocoder]                   VARCHAR (20) NULL,
    [OrgOccupancyScheme]         VARCHAR (10) NULL,
    [OrgOccupancyCode]           VARCHAR (100) NULL,
    [OrgConstructionScheme]      VARCHAR (10) NULL,
    [OrgConstructionCode]        VARCHAR (100) NULL,
    [OccupancyCode]              INT         NULL,
    [ConstructionCode]           INT         NULL,
    [YearBuilt]                  SMALLINT    NULL,
    [NumberOfStoreys]            TINYINT     NULL,
    [NumberOfBuildings]          INT         NULL,
    [FloorArea]                  FLOAT (53)  NULL,
    [FloorAreaUnit]              TINYINT     NULL,
    [LocUserDef1]                VARCHAR (100) NULL,
    [LocUserDef2]                VARCHAR (100) NULL,
    [LocUserDef3]                VARCHAR (100) NULL,
    [LocUserDef4]                VARCHAR (100) NULL,
    [LocUserDef5]                VARCHAR (100) NULL,
    [Bipoi]                      FLOAT (53)  NULL,
    [LocCurrency]                CHAR (3)    NULL,
    [LocGrossPremium]            FLOAT (53)  NULL,
    [LocTax]                     FLOAT (53)  NULL,
    [LocBrokerage]               FLOAT (53)  NULL,
    [LocNetPremium]              FLOAT (53)  NULL,
    [NonCatGroundUpLoss]         FLOAT (53)  NULL,
    [LocParticipation]           FLOAT (53)  NULL,
    [PayoutBasis]                TINYINT     NULL,
    [ReinsTag]                   VARCHAR (20) NULL,
    [BiWaitingPeriod]            FLOAT (53)  NULL,
    [YearUpgraded]               SMALLINT    NULL,
    [SurgeLeakage]               FLOAT (53)  NULL,
    [SprinklerType]              TINYINT     NULL,
    [PercentSprinklered]         FLOAT (53)  NULL,
    [RoofCover]                  TINYINT     NULL,
    [RoofYearBuilt]              SMALLINT    NULL,
    [RoofGeometry]               TINYINT     NULL,
    [RoofEquipment]              TINYINT     NULL,
    [RoofFrame]                  TINYINT     NULL,
    [RoofMaintenance]            TINYINT     NULL,
    [BuildingCondition]          TINYINT     NULL,
    [RoofAttachedStructures]     TINYINT     NULL,
    [RoofDeck]                   TINYINT     NULL,
    [RoofPitch]                  TINYINT     NULL,
    [RoofAnchorage]              TINYINT     NULL,
    [RoofDeckAttachment]         TINYINT     NULL,
    [RoofCoverAttachment]        TINYINT     NULL,
    [GlassType]                  TINYINT     NULL,
    [LatticeType]                TINYINT     NULL,
    [FloodZone]                  VARCHAR (20) NULL,
    [SoftStory]                  TINYINT     NULL,
    [Basement]                   TINYINT     NULL,
    [BasementLevelCount]         TINYINT     NULL,
    [WindowProtection]           TINYINT     NULL,
    [FoundationType]             TINYINT     NULL,
    [WallAttachedStructure]      TINYINT     NULL,
    [AppurtenantStructure]       TINYINT     NULL,
    [ConstructionQuality]        TINYINT     NULL,
    [GroundEquipment]            TINYINT     NULL,
    [EquipmentBracing]           TINYINT     NULL,
    [Flashing]                   TINYINT     NULL,
    [BuildingShape]              TINYINT     NULL,
    [ShapeIrregularity]          TINYINT     NULL,
    [Pounding]                   TINYINT     NULL,
    [Ornamentation]              TINYINT     NULL,
    [SpecialEqConstruction]      TINYINT     NULL,
    [Retrofit]                   TINYINT     NULL,
    [CrippleWall]                TINYINT     NULL,
    [FoundationConnection]       TINYINT     NULL,
    [ShortColumn]                TINYINT     NULL,
    [Fatigue]                    TINYINT     NULL,
    [Cladding]                   TINYINT     NULL,
    [BiPreparedness]             TINYINT     NULL,
    [BiRedundancy]               TINYINT     NULL,
    [FirstFloorHeight]           FLOAT (53)  NULL,
    [FirstFloorHeightUnit]       TINYINT     NULL,
    [Datum]                      VARCHAR (20) NULL,
    [GroundElevation]            FLOAT (53)  NULL,
    [GroundElevationUnit]        TINYINT     NULL,
    [Tank]                       TINYINT     NULL,
    [Redundancy]                 TINYINT     NULL,
    [InternalPartition]          TINYINT     NULL,
    [ExternalDoors]              TINYINT     NULL,
    [Torsion]                    TINYINT     NULL,
    [MechanicalEquipmentSide]    TINYINT     NULL,
    [ContentsWindVuln]           TINYINT     NULL,
    [ContentsFloodVuln]          TINYINT     NULL,
    [ContentsQuakeVuln]          TINYINT     NULL,
    [SmallDebris]                TINYINT     NULL,
    [FloorsOccupied]             VARCHAR (255) NULL,
    [FloodDefenseHeight]         FLOAT (53)  NULL,
    [FloodDefenseHeightUnit]     TINYINT     NULL,
    [FloodDebrisResilience]      TINYINT     NULL,
    [BaseFloodElevation]         FLOAT (53)  NULL,
    [BaseFloodElevationUnit]     TINYINT     NULL,
    [BuildingHeight]             FLOAT (53)  NULL,
    [BuildingHeightUnit]         TINYINT     NULL,
    [BuildingValuation]          VARCHAR (20) NULL,
    [TreeExposure]               TINYINT     NULL,
    [Chimney]                    TINYINT     NULL,
    [BuildingType]               TINYINT     NULL,
    [Packaging]                  TINYINT     NULL,
    [Protection]                 TINYINT     NULL,
    [SalvageProtection]          TINYINT     NULL,
    [ValuablesStorage]           TINYINT     NULL,
    [DaysHeld]                   SMALLINT    NULL,
    [BrickVeneer]                TINYINT     NULL,
    [FemaCompliance]             TINYINT     NULL,
    [CustomFloodSop]             TINYINT     NULL,
    [CustomFloodZone]            VARCHAR (20) NULL,
    [MultiStoryHall]             TINYINT     NULL,
    [BuildingExteriorOpening]    TINYINT     NULL,
    [ServiceEquipmentProtection] TINYINT     NULL,
    [TallOneStory]               TINYINT     NULL,
    [TerrainRoughness]           TINYINT     NULL,
    [Payroll]                    INT         NULL,
    [CondTag]                    VARCHAR (20) NULL,
    [IsAggregate]                TINYINT     NULL,
    [OccupantPeriod]             TINYINT     NULL,
    [SoilType]                   TINYINT     NULL,
    [SoilValue]                  FLOAT (53)  NULL,
    [NumberOfOccupants]          INT         NULL,
    [OriginalCurrency]           CHAR (3)    NULL,
    [RateOfExchange]             FLOAT (53)  NULL,
    [OffshoreWaterDepth]         FLOAT (53)  NULL,
    [SectionLength]              FLOAT (53)  NULL,
    [PowerCapacity]              FLOAT (53)  NULL,
    [VulnerabilitySetId]         INT         NULL,
    [BuildingFloodVuln]          TINYINT     NULL,
    [BiFloodVuln]                TINYINT     NULL,
    [Geom]                       VARCHAR (250) NULL,
    [CodeProvision]              TINYINT     NULL,
    [Anchorage]                  TINYINT     NULL,
    [DiameterOfPipeline]         TINYINT     NULL,
    [VoltageOfEnergy]            TINYINT     NULL,
    [PumpingCapacity]            TINYINT     NULL,
    PRIMARY KEY CLUSTERED ([LocationId] ASC)
);
GO

CREATE TABLE [dbo].[CoverageType] (
    [CoverageTypeId] INT            NOT NULL,
    [CoverageType]   VARCHAR(10)    NOT NULL
    PRIMARY KEY CLUSTERED ([CoverageTypeId] ASC)
);
GO

CREATE TABLE [dbo].[Coverage] (
    [CoverageId]     INT        NOT NULL,
    [LocationId]     INT        NOT NULL,
    [CoverageTypeId] INT        NOT NULL,
    [TIV]            FLOAT (53) DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([CoverageId] ASC),
    CONSTRAINT [FK_location_TO_coverage] FOREIGN KEY ([LocationId]) REFERENCES [dbo].[Location] ([LocationId]),
    CONSTRAINT [FK_coveragetype_TO_coverage] FOREIGN KEY ([CoverageTypeId]) REFERENCES [dbo].[CoverageType] ([CoverageTypeId])
);
GO

CREATE TABLE [dbo].[Peril] (
    [PerilId] INT         NOT NULL,
    [Peril]   VARCHAR (3) NOT NULL,
    [IsGroupPeril] BIT NOT NULL,
    PRIMARY KEY CLUSTERED ([PerilId] ASC)
);
GO

CREATE TABLE [dbo].[PerilGroup] (
    [PerilGroupID] INT NOT NULL,
    [PerilId]   INT NOT NULL
    CONSTRAINT [FK_peril_TO_perilgroup] FOREIGN KEY ([PerilGroupID]) REFERENCES [dbo].[Peril] ([PerilId]),
    CONSTRAINT [FK_peril_TO_peril] FOREIGN KEY ([PerilID]) REFERENCES [dbo].[Peril] ([PerilId])
);
GO

CREATE TABLE [dbo].[Item] (
    [ItemId]     INT NOT NULL,
    [CoverageId] INT NOT NULL,
    [PerilId]    INT NOT NULL
    PRIMARY KEY CLUSTERED ([ItemId] ASC),
    CONSTRAINT [FK_coverage_TO_item] FOREIGN KEY ([CoverageId]) REFERENCES [dbo].[Coverage] ([CoverageId]),
    CONSTRAINT [FK_peril_TO_item] FOREIGN KEY ([PerilId]) REFERENCES [dbo].[Peril] ([PerilId])
);
GO


CREATE TABLE [dbo].[Term] (
    [TermId]           INT        NOT NULL,
    [TermLevel]        INT        NOT NULL,
    [TermCoverageType] INT        NOT NULL,
    [DedType]          INT        NULL,
    [DedCode]          INT        NULL,
    [Deductible]       FLOAT (53) NULL,
    [MinDeductible]    FLOAT (53) NULL,
    [MaxDeductible]    FLOAT (53) NULL,
    [LimitType]        INT        NULL,
    [LimitCode]        INT        NULL,
    [Limit]            FLOAT (53) NULL,
    [Participation]    FLOAT (53) NULL,
    PRIMARY KEY CLUSTERED ([TermId] ASC)
);
GO

CREATE TABLE [dbo].[TermCoverageType] (
    [TermCoverageTypeId] INT        NOT NULL,
    [CoverageTypeId]     INT        NOT NULL
);
GO


------------------------------------------------------------------------------------------------------

CREATE TABLE [dbo].[CoverageTerm] (
    [CoverageTermId] INT NOT NULL,
    [TermId]         INT NOT NULL,
    [CoverageId]     INT NOT NULL,
    PRIMARY KEY CLUSTERED ([CoverageTermId] ASC),
    CONSTRAINT [FK_coverage_TO_coverageterm] FOREIGN KEY ([CoverageId]) REFERENCES [dbo].[Coverage] ([CoverageId]),
    CONSTRAINT [FK_term_TO_coverageterm] FOREIGN KEY ([TermId]) REFERENCES [dbo].[Term] ([TermId])
);
GO

CREATE TABLE [dbo].[ConditionTerm] (
    [ConditionTermId] INT NOT NULL,
    [TermId]          INT NOT NULL,
    [ConditionId]     INT NOT NULL,
    PRIMARY KEY CLUSTERED ([ConditionTermId] ASC),
    CONSTRAINT [FK_condition_TO_conditionterm] FOREIGN KEY ([ConditionId]) REFERENCES [dbo].[Condition] ([ConditionId]),
    CONSTRAINT [FK_term_TO_conditionterm] FOREIGN KEY ([TermId]) REFERENCES [dbo].[Term] ([TermId])
);
GO

CREATE TABLE [dbo].[ConditionCoverageTerm] (
    [ConditionCoverageTermId] INT NOT NULL,
    [TermId]          INT NOT NULL,
    [ConditionId]     INT NOT NULL,
    [CoverageTypeId]  INT NOT NULL,
    PRIMARY KEY CLUSTERED ([ConditionCoverageTermId] ASC),
    CONSTRAINT [FK_condition_TO_conditioncoverageterm] FOREIGN KEY ([ConditionId]) REFERENCES [dbo].[Condition] ([ConditionId]),
    CONSTRAINT [FK_term_TO_conditioncoverageterm] FOREIGN KEY ([TermId]) REFERENCES [dbo].[Term] ([TermId]),
    CONSTRAINT [FK_coveragetype_TO_conditioncoverageterm] FOREIGN KEY ([CoverageTypeId]) REFERENCES [dbo].[CoverageType] ([CoverageTypeId])
);
GO

CREATE TABLE [dbo].[ConditionPDTerm] (
    [ConditionPDTermId] INT NOT NULL,
    [TermId]          INT NOT NULL,
    [ConditionId]     INT NOT NULL,
    PRIMARY KEY CLUSTERED ([ConditionPDTermId] ASC),
    CONSTRAINT [FK_condition_TO_conditionpdterm] FOREIGN KEY ([ConditionId]) REFERENCES [dbo].[Condition] ([ConditionId]),
    CONSTRAINT [FK_term_TO_conditionpdterm] FOREIGN KEY ([TermId]) REFERENCES [dbo].[Term] ([TermId])
);
GO

CREATE TABLE [dbo].[AccountTerm] (
    [AccountTermId] INT NOT NULL,
    [TermId]        INT NOT NULL,
    [AccountId]     INT NOT NULL,
    PRIMARY KEY CLUSTERED ([AccountTermId] ASC),
    CONSTRAINT [FK_account_TO_accountterm] FOREIGN KEY ([AccountId]) REFERENCES [dbo].[Account] ([AccountId]),
    CONSTRAINT [FK_term_TO_accountterm] FOREIGN KEY ([TermId]) REFERENCES [dbo].[Term] ([TermId])
);
GO

CREATE TABLE [dbo].[PolicyTerm] (
    [PolicyTermId] INT NOT NULL,
    [TermId]       INT NOT NULL,
    [PolicyId]     INT NOT NULL,
    PRIMARY KEY CLUSTERED ([PolicyTermId] ASC),
    CONSTRAINT [FK_policy_TO_policyterm] FOREIGN KEY ([PolicyId]) REFERENCES [dbo].[Policy] ([PolicyId]),
    CONSTRAINT [FK_term_TO_policyterm] FOREIGN KEY ([TermId]) REFERENCES [dbo].[Term] ([TermId])
);
GO

CREATE TABLE [dbo].[PolicyCoverageTerm] (
    [PolicyCoverageTermId] INT NOT NULL,
    [TermId]          INT NOT NULL,
    [PolicyId]     INT NOT NULL,
    [CoverageTypeId]  INT NOT NULL,
    PRIMARY KEY CLUSTERED ([PolicyCoverageTermId] ASC),
    CONSTRAINT [FK_policy_TO_policycoverageterm] FOREIGN KEY ([PolicyId]) REFERENCES [dbo].[Policy] ([PolicyId]),
    CONSTRAINT [FK_term_TO_policycoverageterm] FOREIGN KEY ([TermId]) REFERENCES [dbo].[Term] ([TermId]),
    CONSTRAINT [FK_coveragetype_TO_policycoverageterm] FOREIGN KEY ([CoverageTypeId]) REFERENCES [dbo].[CoverageType] ([CoverageTypeId])
);
GO

CREATE TABLE [dbo].[PolicyPDTerm] (
    [PolicyPDTermId] INT NOT NULL,
    [TermId]       INT NOT NULL,
    [PolicyId]     INT NOT NULL,
    PRIMARY KEY CLUSTERED ([PolicyPDTermId] ASC),
    CONSTRAINT [FK_policy_TO_policypdterm] FOREIGN KEY ([PolicyId]) REFERENCES [dbo].[Policy] ([PolicyId]),
    CONSTRAINT [FK_term_TO_policypdterm] FOREIGN KEY ([TermId]) REFERENCES [dbo].[Term] ([TermId])
);
GO

CREATE TABLE [dbo].[LayerTerm] (
    [LayerTermId] INT NOT NULL,
    [TermId]      INT NOT NULL,
    [LayerId]     INT NOT NULL,
    PRIMARY KEY CLUSTERED ([LayerTermId] ASC),
    CONSTRAINT [FK_layer_TO_layerterm] FOREIGN KEY ([LayerId]) REFERENCES [dbo].[Layer] ([LayerId]),
    CONSTRAINT [FK_term_TO_layerterm] FOREIGN KEY ([TermId]) REFERENCES [dbo].[Term] ([TermId])
);
GO

CREATE TABLE [dbo].[LocTerm] (
    [LocTermId]  INT NOT NULL,
    [TermId]     INT NOT NULL,
    [LocationId] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([LocTermId] ASC),
    CONSTRAINT [FK_location_TO_locterm] FOREIGN KEY ([LocationId]) REFERENCES [dbo].[Location] ([LocationId]),
    CONSTRAINT [FK_term_TO_locterm] FOREIGN KEY ([TermId]) REFERENCES [dbo].[Term] ([TermId])
);
GO

CREATE TABLE [dbo].[PDTerm] (
    [PdTermId]   INT NOT NULL,
    [TermId]     INT NOT NULL,
    [LocationId] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([PdTermId] ASC),
    CONSTRAINT [FK_location_TO_pdterm] FOREIGN KEY ([LocationId]) REFERENCES [dbo].[Location] ([LocationId]),
    CONSTRAINT [FK_term_TO_pdterm] FOREIGN KEY ([TermId]) REFERENCES [dbo].[Term] ([TermId])
);
GO

CREATE TABLE [dbo].[ItemTerm] (
    [ItemTermId] INT NOT NULL,
    [TermId]     INT NOT NULL,
    [ItemId]     INT NOT NULL,
    PRIMARY KEY CLUSTERED ([ItemTermId] ASC),
    CONSTRAINT [FK_item_TO_itemterm] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[Item] ([ItemId]),
    CONSTRAINT [FK_term_TO_itemterm] FOREIGN KEY ([TermId]) REFERENCES [dbo].[Term] ([TermId])
);
GO

------------------------------------------------------------------------------------------------------

CREATE TABLE [dbo].[_import_account] (
    [PortNumber]                   VARCHAR (20)   NULL,
    [PortName]                     VARCHAR (40)   NULL,
    [PortNotes]                    VARCHAR (200)  NULL,
    [AccNumber]                    NVARCHAR (40)  NULL,
    [AccName]                      NVARCHAR (100) NULL,
    [AccGroup]                     VARCHAR (40)   NULL,
    [AccStatus]                    CHAR (1)       NULL,
    [ExpiringAccNumber]            NVARCHAR (40)  NULL,
    [CedantName]                   VARCHAR (40)   NULL,
    [AccCurrency]                  CHAR (3)       NULL,
    [AccUserDef1]                  VARCHAR (100)  NULL,
    [AccUserDef2]                  VARCHAR (100)  NULL,
    [AccUserDef3]                  VARCHAR (100)  NULL,
    [AccUserDef4]                  VARCHAR (100)  NULL,
    [AccUserDef5]                  VARCHAR (100)  NULL,
    [FlexiAccZzz]                  VARCHAR (40)   NULL,
    [AccPeril]                     VARCHAR (250)  NULL,
    [AccDedCode1Building]          TINYINT        NULL,
    [AccDedType1Building]          TINYINT        NULL,
    [AccDed1Building]              FLOAT (53)     NULL,
    [AccMinDed1Building]           FLOAT (53)     NULL,
    [AccMaxDed1Building]           FLOAT (53)     NULL,
    [AccDedCode2Other]             TINYINT        NULL,
    [AccDedType2Other]             TINYINT        NULL,
    [AccDed2Other]                 FLOAT (53)     NULL,
    [AccMinDed2Other]              FLOAT (53)     NULL,
    [AccMaxDed2Other]              FLOAT (53)     NULL,
    [AccDedCode3Contents]          TINYINT        NULL,
    [AccDedType3Contents]          TINYINT        NULL,
    [AccDed3Contents]              FLOAT (53)     NULL,
    [AccMinDed3Contents]           FLOAT (53)     NULL,
    [AccMaxDed3Contents]           FLOAT (53)     NULL,
    [AccDedCode4Bi]                TINYINT        NULL,
    [AccDedType4Bi]                TINYINT        NULL,
    [AccDed4Bi]                    FLOAT (53)     NULL,
    [AccMinDed4Bi]                 FLOAT (53)     NULL,
    [AccMaxDed4Bi]                 FLOAT (53)     NULL,
    [AccDedCode5Pd]                TINYINT        NULL,
    [AccDedType5Pd]                TINYINT        NULL,
    [AccDed5Pd]                    FLOAT (53)     NULL,
    [AccMinDed5Pd]                 FLOAT (53)     NULL,
    [AccMaxDed5Pd]                 FLOAT (53)     NULL,
    [AccDedCode6All]               TINYINT        NULL,
    [AccDedType6All]               TINYINT        NULL,
    [AccDed6All]                   FLOAT (53)     NULL,
    [AccMinDed6All]                FLOAT (53)     NULL,
    [AccMaxDed6All]                FLOAT (53)     NULL,
    [AccLimitCode1Building]        TINYINT        NULL,
    [AccLimitType1Building]        TINYINT        NULL,
    [AccLimit1Building]            FLOAT (53)     NULL,
    [AccLimitCode2Other]           TINYINT        NULL,
    [AccLimitType2Other]           TINYINT        NULL,
    [AccLimit2Other]               FLOAT (53)     NULL,
    [AccLimitCode3Contents]        TINYINT        NULL,
    [AccLimitType3Contents]        TINYINT        NULL,
    [AccLimit3Contents]            FLOAT (53)     NULL,
    [AccLimitCode4Bi]              TINYINT        NULL,
    [AccLimitType4Bi]              TINYINT        NULL,
    [AccLimit4Bi]                  FLOAT (53)     NULL,
    [AccLimitCode5Pd]              TINYINT        NULL,
    [AccLimitType5Pd]              TINYINT        NULL,
    [AccLimit5Pd]                  FLOAT (53)     NULL,
    [AccLimitCode6All]             TINYINT        NULL,
    [AccLimitType6All]             TINYINT        NULL,
    [AccLimit6All]                 FLOAT (53)     NULL,
    [PolNumber]                    VARCHAR (20)   NULL,
    [PolStatus]                    CHAR (1)       NULL,
    [PolInceptionDate]             SMALLDATETIME  NULL,
    [PolExpiryDate]                SMALLDATETIME  NULL,
    [ProducerName]                 VARCHAR (40)   NULL,
    [Underwriter]                  VARCHAR (40)   NULL,
    [BranchName]                   VARCHAR (20)   NULL,
    [Lob]                          VARCHAR (20)   NULL,
    [ExpiringPolNumber]            VARCHAR (20)   NULL,
    [PolPerilsCovered]             VARCHAR (250)  NULL,
    [PolGrossPremium]              FLOAT (53)     NULL,
    [PolTax]                       FLOAT (53)     NULL,
    [PolBrokerage]                 FLOAT (53)     NULL,
    [PolNetPremium]                FLOAT (53)     NULL,
    [LayerNumber]                  INT            NULL,
    [LayerParticipation]           FLOAT (53)     NULL,
    [LayerLimit]                   FLOAT (53)     NULL,
    [LayerAttachment]              FLOAT (53)     NULL,
    [HoursClause]                  INT            NULL,
    [PolPeril]                     VARCHAR (250)  NULL,
    [PolDedCode1Building]          TINYINT        NULL,
    [PolDedType1Building]          TINYINT        NULL,
    [PolDed1Building]              FLOAT (53)     NULL,
    [PolMinDed1Building]           FLOAT (53)     NULL,
    [PolMaxDed1Building]           FLOAT (53)     NULL,
    [PolDedCode2Other]             TINYINT        NULL,
    [PolDedType2Other]             TINYINT        NULL,
    [PolDed2Other]                 FLOAT (53)     NULL,
    [PolMinDed2Other]              FLOAT (53)     NULL,
    [PolMaxDed2Other]              FLOAT (53)     NULL,
    [PolDedCode3Contents]          TINYINT        NULL,
    [PolDedType3Contents]          TINYINT        NULL,
    [PolDed3Contents]              FLOAT (53)     NULL,
    [PolMinDed3Contents]           FLOAT (53)     NULL,
    [PolMaxDed3Contents]           FLOAT (53)     NULL,
    [PolDedCode4Bi]                TINYINT        NULL,
    [PolDedType4Bi]                TINYINT        NULL,
    [PolDed4Bi]                    FLOAT (53)     NULL,
    [PolMinDed4Bi]                 FLOAT (53)     NULL,
    [PolMaxDed4Bi]                 FLOAT (53)     NULL,
    [PolDedCode5Pd]                TINYINT        NULL,
    [PolDedType5Pd]                TINYINT        NULL,
    [PolDed5Pd]                    FLOAT (53)     NULL,
    [PolMinDed5Pd]                 FLOAT (53)     NULL,
    [PolMaxDed5Pd]                 FLOAT (53)     NULL,
    [PolDedCode6All]               TINYINT        NULL,
    [PolDedType6All]               TINYINT        NULL,
    [PolDed6All]                   FLOAT (53)     NULL,
    [PolMinDed6All]                FLOAT (53)     NULL,
    [PolMaxDed6All]                FLOAT (53)     NULL,
    [PolLimitCode1Building]        TINYINT        NULL,
    [PolLimitType1Building]        TINYINT        NULL,
    [PolLimit1Building]            FLOAT (53)     NULL,
    [PolLimitCode2Other]           TINYINT        NULL,
    [PolLimitType2Other]           TINYINT        NULL,
    [PolLimit2Other]               FLOAT (53)     NULL,
    [PolLimitCode3Contents]        TINYINT        NULL,
    [PolLimitType3Contents]        TINYINT        NULL,
    [PolLimit3Contents]            FLOAT (53)     NULL,
    [PolLimitCode4Bi]              TINYINT        NULL,
    [PolLimitType4Bi]              TINYINT        NULL,
    [PolLimit4Bi]                  FLOAT (53)     NULL,
    [PolLimitCode5Pd]              TINYINT        NULL,
    [PolLimitType5Pd]              TINYINT        NULL,
    [PolLimit5Pd]                  FLOAT (53)     NULL,
    [PolLimitCode6All]             TINYINT        NULL,
    [PolLimitType6All]             TINYINT        NULL,
    [PolLimit6All]                 FLOAT (53)     NULL,
    [StepFunctionName]             VARCHAR (30)   NULL,
    [StepTriggerType]              TINYINT        NULL,
    [StepNumber]                   TINYINT        NULL,
    [PayOutType]                   TINYINT        NULL,
    [TriggerType]                  TINYINT        NULL,
    [TriggerBuildingStart]         FLOAT (53)     NULL,
    [TriggerBuildingEnd]           FLOAT (53)     NULL,
    [DeductibleBuilding]           FLOAT (53)     NULL,
    [PayOutBuildingStart]          FLOAT (53)     NULL,
    [PayOutBuildingEnd]            FLOAT (53)     NULL,
    [PayOutLimitBuilding]          FLOAT (53)     NULL,
    [TriggerContentsStart]         FLOAT (53)     NULL,
    [TriggerContentsEnd]           FLOAT (53)     NULL,
    [DeductibleContents]           FLOAT (53)     NULL,
    [PayOutContentsStart]          FLOAT (53)     NULL,
    [PayOutContentsEnd]            FLOAT (53)     NULL,
    [PayOutLimitContents]          FLOAT (53)     NULL,
    [TriggerBuildingContentsStart] FLOAT (53)     NULL,
    [TriggerBuildingContentsEnd]   FLOAT (53)     NULL,
    [DeductibleBuildingContents]   FLOAT (53)     NULL,
    [PayOutBuildingContentsStart]  FLOAT (53)     NULL,
    [PayOutBuildingContentsEnd]    FLOAT (53)     NULL,
    [PayOutLimitBuildingContents]  FLOAT (53)     NULL,
    [ExtraExpenseFactor]           FLOAT (53)     NULL,
    [ExtraExpenseLimit]            FLOAT (53)     NULL,
    [DebrisRemovalFactor]          FLOAT (53)     NULL,
    [MinimumTiv]                   FLOAT (53)     NULL,
    [ScaleFactor]                  FLOAT (53)     NULL,
    [IsLimitAtDamage]              TINYINT        NULL,
    [PolUserDef1]                  VARCHAR (100)  NULL,
    [PolUserDef2]                  VARCHAR (100)  NULL,
    [PolUserDef3]                  VARCHAR (100)  NULL,
    [PolUserDef4]                  VARCHAR (100)  NULL,
    [PolUserDef5]                  VARCHAR (100)  NULL,
    [FlexiPolZzz]                  VARCHAR (40)   NULL,
    [CondNumber]                   VARCHAR (20)   NULL,
    [CondName]                     VARCHAR (40)   NULL,
    [CondPriority]                 INT            NULL,
    [CondPeril]                    VARCHAR (250)  NULL,
    [CondDedCode1Building]         TINYINT        NULL,
    [CondDedType1Building]         TINYINT        NULL,
    [CondDed1Building]             FLOAT (53)     NULL,
    [CondMinDed1Building]          FLOAT (53)     NULL,
    [CondMaxDed1Building]          FLOAT (53)     NULL,
    [CondDedCode2Other]            TINYINT        NULL,
    [CondDedType2Other]            TINYINT        NULL,
    [CondDed2Other]                FLOAT (53)     NULL,
    [CondMinDed2Other]             FLOAT (53)     NULL,
    [CondMaxDed2Other]             FLOAT (53)     NULL,
    [CondDedCode3Contents]         TINYINT        NULL,
    [CondDedType3Contents]         TINYINT        NULL,
    [CondDed3Contents]             FLOAT (53)     NULL,
    [CondMinDed3Contents]          FLOAT (53)     NULL,
    [CondMaxDed3Contents]          FLOAT (53)     NULL,
    [CondDedCode4Bi]               TINYINT        NULL,
    [CondDedType4Bi]               TINYINT        NULL,
    [CondDed4Bi]                   FLOAT (53)     NULL,
    [CondMinDed4Bi]                FLOAT (53)     NULL,
    [CondMaxDed4Bi]                FLOAT (53)     NULL,
    [CondDedCode5Pd]               TINYINT        NULL,
    [CondDedType5Pd]               TINYINT        NULL,
    [CondDed5Pd]                   FLOAT (53)     NULL,
    [CondMinDed5Pd]                FLOAT (53)     NULL,
    [CondMaxDed5Pd]                FLOAT (53)     NULL,
    [CondDedCode6All]              TINYINT        NULL,
    [CondDedType6All]              TINYINT        NULL,
    [CondDed6All]                  FLOAT (53)     NULL,
    [CondMinDed6All]               FLOAT (53)     NULL,
    [CondMaxDed6All]               FLOAT (53)     NULL,
    [CondLimitCode1Building]       TINYINT        NULL,
    [CondLimitType1Building]       TINYINT        NULL,
    [CondLimit1Building]           FLOAT (53)     NULL,
    [CondLimitCode2Other]          TINYINT        NULL,
    [CondLimitType2Other]          TINYINT        NULL,
    [CondLimit2Other]              FLOAT (53)     NULL,
    [CondLimitCode3Contents]       TINYINT        NULL,
    [CondLimitType3Contents]       TINYINT        NULL,
    [CondLimit3Contents]           FLOAT (53)     NULL,
    [CondLimitCode4Bi]             TINYINT        NULL,
    [CondLimitType4Bi]             TINYINT        NULL,
    [CondLimit4Bi]                 FLOAT (53)     NULL,
    [CondLimitCode5Pd]             TINYINT        NULL,
    [CondLimitType5Pd]             TINYINT        NULL,
    [CondLimit5Pd]                 FLOAT (53)     NULL,
    [CondLimitCode6All]            TINYINT        NULL,
    [CondLimitType6All]            TINYINT        NULL,
    [CondLimit6All]                FLOAT (53)     NULL,
    [CondClass]                    TINYINT        NULL,
    [CondTag]                      VARCHAR (20)   NULL,
    [OedVersion]                   VARCHAR (10)   NULL,
    [OriginalCurrency]             CHAR (3)       NULL,
    [RateOfExchange]               FLOAT (53)     NULL,
    [AccParticipation]             FLOAT (53)     NULL,
    [CompanyIdSchemeXx]            VARCHAR (5)    NULL,
    [CompanyIdCodeXx]              INT            NULL,
    [YearFounded]                  SMALLINT       NULL,
    [StreetAddress]                NVARCHAR (100) NULL,
    [PostalCode]                   NVARCHAR (20)  NULL,
    [City]                         NVARCHAR (50)  NULL,
    [CountryCode]                  CHAR (2)       NULL,
    [AreaCode]                     CHAR (3)       NULL,
    [IndustrySchemeXx]             VARCHAR (5)    NULL,
    [IndustryCodeXx]               INT            NULL,
    [IndustryVintageXx]            SMALLINT       NULL,
    [IndustryDescription]          NVARCHAR (250) NULL,
    [NumberOfEmployees]            INT            NULL,
    [AnnualRevenue]                FLOAT (53)     NULL,
    [AnnualRevenueCurrency]        CHAR (3)       NULL,
    [GrossProfitMargin]            FLOAT (53)     NULL,
    [NumberOfRecords]              INT            NULL,
    [Url]                          VARCHAR (250)  NULL,
    [IsPackage]                    SMALLINT       NULL,
    [PolDed]                       FLOAT (53)     NULL,
    [StackedPolNumber]             VARCHAR (20)   NULL,
    [LayerAggAttachment]           FLOAT (53)     NULL,
    [LayerAggLimit]                FLOAT (53)     NULL,
    [PolLimitNpbi]                 FLOAT (53)     NULL,
    [PolDedNpbi]                   FLOAT (53)     NULL,
    [PolLimitCbi]                  FLOAT (53)     NULL,
    [PolDedCbi]                    FLOAT (53)     NULL,
    [PolLimitDias]                 FLOAT (53)     NULL,
    [PolDedDias]                   FLOAT (53)     NULL,
    [PolLimitExt]                  FLOAT (53)     NULL,
    [PolDedExt]                    FLOAT (53)     NULL,
    [PolLimitFin]                  FLOAT (53)     NULL,
    [PolDedFin]                    FLOAT (53)     NULL,
    [PolLimitInre]                 FLOAT (53)     NULL,
    [PolDedInre]                   FLOAT (53)     NULL,
    [PolLimitLia]                  FLOAT (53)     NULL,
    [PolDedLia]                    FLOAT (53)     NULL,
    [PolLimitReg]                  FLOAT (53)     NULL,
    [PolDedReg]                    FLOAT (53)     NULL,
    [PolLimitEno]                  FLOAT (53)     NULL,
    [PolDedEno]                    FLOAT (53)     NULL,
    [LimitCurrency]                CHAR (3)       NULL,
    [DedCurrency]                  CHAR (3)       NULL,
    [PolSir]                       FLOAT (53)     NULL,
    [PolCoverage]                  VARCHAR (250)  NULL,
    [OsVendor]                     INT            NULL,
    [CloudVendor]                  INT            NULL,
    [EmailVendor]                  INT            NULL,
    [CrmVendor]                    INT            NULL,
    [PatchPolicy]                  TINYINT        NULL,
    [BackUpFreq]                   TINYINT        NULL,
    [AreaName]                     NVARCHAR (50)  NULL,
    [CoverageClassDescription]     NVARCHAR (100) NULL,
    [CoverageTerritory]            NVARCHAR (100) NULL,
    [CoverageTrigger]              TINYINT        NULL,
    [IsGroupCover]                 SMALLINT       NULL,
    [DefenceCost]                  TINYINT        NULL,
    [BiWaitingPeriod]              FLOAT (53)     NULL,
    [Bipoi]                        FLOAT (53)     NULL,
    [InsuredName]                  NVARCHAR (100) NULL
);
GO

CREATE TABLE [dbo].[_import_location] (
    [PortNumber]                 VARCHAR (20)   NULL,
    [AccNumber]                  NVARCHAR (40)  NULL,
    [LocNumber]                  NVARCHAR (20)  NULL,
    [LocName]                    NVARCHAR (20)  NULL,
    [LocGroup]                   NVARCHAR (20)  NULL,
    [CorrelationGroup]           INT            NULL,
    [IsPrimary]                  TINYINT        NULL,
    [IsTenant]                   TINYINT        NULL,
    [BuildingId]                 VARCHAR (20)   NULL,
    [LocInceptionDate]           SMALLDATETIME  NULL,
    [LocExpiryDate]              SMALLDATETIME  NULL,
    [PercentComplete]            DECIMAL (18)   NULL,
    [CompletionDate]             DATE           NULL,
    [CountryCode]                CHAR (2)       NULL,
    [Latitude]                   DECIMAL (18)   NULL,
    [Longitude]                  DECIMAL (18)   NULL,
    [StreetAddress]              NVARCHAR (100) NULL,
    [PostalCode]                 NVARCHAR (20)  NULL,
    [City]                       NVARCHAR (50)  NULL,
    [AreaCode]                   NVARCHAR (20)  NULL,
    [AreaName]                   NVARCHAR (50)  NULL,
    [GeogSchemeXx]               VARCHAR (5)    NULL,
    [GeogNameXx]                 NVARCHAR (50)  NULL,
    [AddressMatch]               TINYINT        NULL,
    [GeocodeQuality]             FLOAT (53)     NULL,
    [Geocoder]                   VARCHAR (20)   NULL,
    [OrgOccupancyScheme]         VARCHAR (10)   NULL,
    [OrgOccupancyCode]           VARCHAR (100)  NULL,
    [OrgConstructionScheme]      VARCHAR (10)   NULL,
    [OrgConstructionCode]        VARCHAR (100)  NULL,
    [OccupancyCode]              INT            NULL,
    [ConstructionCode]           INT            NULL,
    [YearBuilt]                  SMALLINT       NULL,
    [NumberOfStoreys]            TINYINT        NULL,
    [NumberOfBuildings]          INT            NULL,
    [FloorArea]                  FLOAT (53)     NULL,
    [FloorAreaUnit]              TINYINT        NULL,
    [LocUserDef1]                VARCHAR (100)  NULL,
    [LocUserDef2]                VARCHAR (100)  NULL,
    [LocUserDef3]                VARCHAR (100)  NULL,
    [LocUserDef4]                VARCHAR (100)  NULL,
    [LocUserDef5]                VARCHAR (100)  NULL,
    [FlexiLocZzz]                VARCHAR (40)   NULL,
    [LocPerilsCovered]           VARCHAR (250)  NULL,
    [BuildingTiv]                FLOAT (53)     NULL,
    [OtherTiv]                   FLOAT (53)     NULL,
    [ContentsTiv]                FLOAT (53)     NULL,
    [BiTiv]                      FLOAT (53)     NULL,
    [Bipoi]                      FLOAT (53)     NULL,
    [LocCurrency]                CHAR (3)       NULL,
    [LocGrossPremium]            FLOAT (53)     NULL,
    [LocTax]                     FLOAT (53)     NULL,
    [LocBrokerage]               FLOAT (53)     NULL,
    [LocNetPremium]              FLOAT (53)     NULL,
    [NonCatGroundUpLoss]         FLOAT (53)     NULL,
    [LocParticipation]           FLOAT (53)     NULL,
    [PayoutBasis]                TINYINT        NULL,
    [ReinsTag]                   VARCHAR (20)   NULL,
    [LocDedCode1Building]        TINYINT        NULL,
    [LocDedType1Building]        TINYINT        NULL,
    [LocDed1Building]            FLOAT (53)     NULL,
    [LocMinDed1Building]         FLOAT (53)     NULL,
    [LocMaxDed1Building]         FLOAT (53)     NULL,
    [LocDedCode2Other]           TINYINT        NULL,
    [LocDedType2Other]           TINYINT        NULL,
    [LocDed2Other]               FLOAT (53)     NULL,
    [LocMinDed2Other]            FLOAT (53)     NULL,
    [LocMaxDed2Other]            FLOAT (53)     NULL,
    [LocDedCode3Contents]        TINYINT        NULL,
    [LocDedType3Contents]        TINYINT        NULL,
    [LocDed3Contents]            FLOAT (53)     NULL,
    [LocMinDed3Contents]         FLOAT (53)     NULL,
    [LocMaxDed3Contents]         FLOAT (53)     NULL,
    [LocDedCode4Bi]              TINYINT        NULL,
    [LocDedType4Bi]              TINYINT        NULL,
    [LocDed4Bi]                  FLOAT (53)     NULL,
    [LocMinDed4Bi]               FLOAT (53)     NULL,
    [LocMaxDed4Bi]               FLOAT (53)     NULL,
    [LocDedCode5Pd]              TINYINT        NULL,
    [LocDedType5Pd]              TINYINT        NULL,
    [LocDed5Pd]                  FLOAT (53)     NULL,
    [LocMinDed5Pd]               FLOAT (53)     NULL,
    [LocMaxDed5Pd]               FLOAT (53)     NULL,
    [LocDedCode6All]             TINYINT        NULL,
    [LocDedType6All]             TINYINT        NULL,
    [LocDed6All]                 FLOAT (53)     NULL,
    [LocMinDed6All]              FLOAT (53)     NULL,
    [LocMaxDed6All]              FLOAT (53)     NULL,
    [LocLimitCode1Building]      TINYINT        NULL,
    [LocLimitType1Building]      TINYINT        NULL,
    [LocLimit1Building]          FLOAT (53)     NULL,
    [LocLimitCode2Other]         TINYINT        NULL,
    [LocLimitType2Other]         TINYINT        NULL,
    [LocLimit2Other]             FLOAT (53)     NULL,
    [LocLimitCode3Contents]      TINYINT        NULL,
    [LocLimitType3Contents]      TINYINT        NULL,
    [LocLimit3Contents]          FLOAT (53)     NULL,
    [LocLimitCode4Bi]            TINYINT        NULL,
    [LocLimitType4Bi]            TINYINT        NULL,
    [LocLimit4Bi]                FLOAT (53)     NULL,
    [LocLimitCode5Pd]            TINYINT        NULL,
    [LocLimitType5Pd]            TINYINT        NULL,
    [LocLimit5Pd]                FLOAT (53)     NULL,
    [LocLimitCode6All]           TINYINT        NULL,
    [LocLimitType6All]           TINYINT        NULL,
    [LocLimit6All]               FLOAT (53)     NULL,
    [BiWaitingPeriod]            FLOAT (53)     NULL,
    [LocPeril]                   VARCHAR (250)  NULL,
    [YearUpgraded]               SMALLINT       NULL,
    [SurgeLeakage]               FLOAT (53)     NULL,
    [SprinklerType]              TINYINT        NULL,
    [PercentSprinklered]         FLOAT (53)     NULL,
    [RoofCover]                  TINYINT        NULL,
    [RoofYearBuilt]              SMALLINT       NULL,
    [RoofGeometry]               TINYINT        NULL,
    [RoofEquipment]              TINYINT        NULL,
    [RoofFrame]                  TINYINT        NULL,
    [RoofMaintenance]            TINYINT        NULL,
    [BuildingCondition]          TINYINT        NULL,
    [RoofAttachedStructures]     TINYINT        NULL,
    [RoofDeck]                   TINYINT        NULL,
    [RoofPitch]                  TINYINT        NULL,
    [RoofAnchorage]              TINYINT        NULL,
    [RoofDeckAttachment]         TINYINT        NULL,
    [RoofCoverAttachment]        TINYINT        NULL,
    [GlassType]                  TINYINT        NULL,
    [LatticeType]                TINYINT        NULL,
    [FloodZone]                  VARCHAR (20)   NULL,
    [SoftStory]                  TINYINT        NULL,
    [Basement]                   TINYINT        NULL,
    [BasementLevelCount]         TINYINT        NULL,
    [WindowProtection]           TINYINT        NULL,
    [FoundationType]             TINYINT        NULL,
    [WallAttachedStructure]      TINYINT        NULL,
    [AppurtenantStructure]       TINYINT        NULL,
    [ConstructionQuality]        TINYINT        NULL,
    [GroundEquipment]            TINYINT        NULL,
    [EquipmentBracing]           TINYINT        NULL,
    [Flashing]                   TINYINT        NULL,
    [BuildingShape]              TINYINT        NULL,
    [ShapeIrregularity]          TINYINT        NULL,
    [Pounding]                   TINYINT        NULL,
    [Ornamentation]              TINYINT        NULL,
    [SpecialEqConstruction]      TINYINT        NULL,
    [Retrofit]                   TINYINT        NULL,
    [CrippleWall]                TINYINT        NULL,
    [FoundationConnection]       TINYINT        NULL,
    [ShortColumn]                TINYINT        NULL,
    [Fatigue]                    TINYINT        NULL,
    [Cladding]                   TINYINT        NULL,
    [BiPreparedness]             TINYINT        NULL,
    [BiRedundancy]               TINYINT        NULL,
    [FirstFloorHeight]           FLOAT (53)     NULL,
    [FirstFloorHeightUnit]       TINYINT        NULL,
    [Datum]                      VARCHAR (20)   NULL,
    [GroundElevation]            FLOAT (53)     NULL,
    [GroundElevationUnit]        TINYINT        NULL,
    [Tank]                       TINYINT        NULL,
    [Redundancy]                 TINYINT        NULL,
    [InternalPartition]          TINYINT        NULL,
    [ExternalDoors]              TINYINT        NULL,
    [Torsion]                    TINYINT        NULL,
    [MechanicalEquipmentSide]    TINYINT        NULL,
    [ContentsWindVuln]           TINYINT        NULL,
    [ContentsFloodVuln]          TINYINT        NULL,
    [ContentsQuakeVuln]          TINYINT        NULL,
    [SmallDebris]                TINYINT        NULL,
    [FloorsOccupied]             VARCHAR (255)  NULL,
    [FloodDefenseHeight]         FLOAT (53)     NULL,
    [FloodDefenseHeightUnit]     TINYINT        NULL,
    [FloodDebrisResilience]      TINYINT        NULL,
    [BaseFloodElevation]         FLOAT (53)     NULL,
    [BaseFloodElevationUnit]     TINYINT        NULL,
    [BuildingHeight]             FLOAT (53)     NULL,
    [BuildingHeightUnit]         TINYINT        NULL,
    [BuildingValuation]          VARCHAR (20)   NULL,
    [TreeExposure]               TINYINT        NULL,
    [Chimney]                    TINYINT        NULL,
    [BuildingType]               TINYINT        NULL,
    [Packaging]                  TINYINT        NULL,
    [Protection]                 TINYINT        NULL,
    [SalvageProtection]          TINYINT        NULL,
    [ValuablesStorage]           TINYINT        NULL,
    [DaysHeld]                   SMALLINT       NULL,
    [BrickVeneer]                TINYINT        NULL,
    [FemaCompliance]             TINYINT        NULL,
    [CustomFloodSop]             TINYINT        NULL,
    [CustomFloodZone]            VARCHAR (20)   NULL,
    [MultiStoryHall]             TINYINT        NULL,
    [BuildingExteriorOpening]    TINYINT        NULL,
    [ServiceEquipmentProtection] TINYINT        NULL,
    [TallOneStory]               TINYINT        NULL,
    [TerrainRoughness]           TINYINT        NULL,
    [Payroll]                    INT            NULL,
    [StaticMotorVehicle]         TINYINT        NULL,
    [CondTag]                    VARCHAR (20)   NULL,
    [OedVersion]                 VARCHAR (10)   NULL,
    [IsAggregate]                TINYINT        NULL,
    [OccupantPeriod]             TINYINT        NULL,
    [SoilType]                   TINYINT        NULL,
    [SoilValue]                  FLOAT (53)     NULL,
    [NumberOfOccupants]          INT            NULL,
    [OccupantUnderFive]          INT            NULL,
    [OccupantOver65]             INT            NULL,
    [OccupantAge5To65]           INT            NULL,
    [OccupantFemale]             INT            NULL,
    [OccupantMale]               INT            NULL,
    [OccupantOther]              INT            NULL,
    [OccupantUrban]              INT            NULL,
    [OccupantRural]              INT            NULL,
    [OccupantPoverty]            INT            NULL,
    [OccupantRefugee]            INT            NULL,
    [OccupantUnemployed]         INT            NULL,
    [OccupantDisability]         INT            NULL,
    [OccupantEthnicMinority]     INT            NULL,
    [OccupantTemporary]          INT            NULL,
    [OriginalCurrency]           CHAR (3)       NULL,
    [RateOfExchange]             FLOAT (53)     NULL,
    [OffshoreWaterDepth]         FLOAT (53)     NULL,
    [SectionLength]              FLOAT (53)     NULL,
    [PowerCapacity]              FLOAT (53)     NULL,
    [VulnerabilitySetId]         INT            NULL,
    [BuildingFloodVuln]          TINYINT        NULL,
    [BiFloodVuln]                TINYINT        NULL,
    [Geom]                       VARCHAR (250)  NULL,
    [CodeProvision]              TINYINT        NULL,
    [Anchorage]                  TINYINT        NULL,
    [DiameterOfPipeline]         TINYINT        NULL,
    [VoltageOfEnergy]            TINYINT        NULL,
    [PumpingCapacity]            TINYINT        NULL,
    [SoilLiquefiable]            INT            NULL,
    [CommoditySchemeXx]          VARCHAR (5)    NULL,
    [CommodityCodeXx]            VARCHAR (10)   NULL,
    [CommodityVintageXx]         SMALLINT       NULL
);
GO

------------------------------------------------------------------------------------------------------



CREATE TABLE [dbo].[_businesskeys_account] (
    [AccountId] INT         NOT NULL,
    [PortNumber]  VARCHAR (20) NOT NULL,
    [AccNumber]   NVARCHAR (100) NOT NULL
    PRIMARY KEY CLUSTERED ([AccountId] ASC)
);
GO

CREATE TABLE [dbo].[_businesskeys_policy] (
    [PolicyId] INT         NOT NULL,
    [PortNumber]  VARCHAR (20) NOT NULL,
    [AccNumber]   NVARCHAR (100) NOT NULL,
    [PolNumber]   NVARCHAR (100) NOT NULL,
    [PolPerilsCovered] NVARCHAR (250) NULL
    PRIMARY KEY CLUSTERED ([PolicyId] ASC)
);
GO

CREATE TABLE [dbo].[_businesskeys_layer] (
    [LayerId] INT         NOT NULL,
    [PortNumber]  VARCHAR (20) NOT NULL,
    [AccNumber]   NVARCHAR (100) NOT NULL,
    [PolNumber]   NVARCHAR (100) NOT NULL,
    [LayerNumber] INT NULL
    PRIMARY KEY CLUSTERED ([LayerId] ASC)
);
GO

CREATE TABLE [dbo].[_businesskeys_location] (
    [LocationId] INT         NOT NULL,
    [PortNumber]  VARCHAR (20) NOT NULL,
    [AccNumber]   NVARCHAR (100) NOT NULL,
    [LocNumber]   NVARCHAR (100) NOT NULL,
    [LocPerilsCovered] NVARCHAR (250) NULL
    PRIMARY KEY CLUSTERED ([LocationId] ASC)
);
GO

CREATE TABLE [dbo].[_businesskeys_condition] (
    [ConditionId] INT        NOT NULL,
    [PortNumber]  VARCHAR (20) NOT NULL,
    [AccNumber]   NVARCHAR (100) NOT NULL,
    [PolNumber]   NVARCHAR (100) NOT NULL,
    [CondNumber]   NVARCHAR (100) NULL
    PRIMARY KEY CLUSTERED ([ConditionId] ASC)
);
GO

------------------------------------------------------------------------------------------------------
-- Views

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW vw_import_location_business_keys
AS
    SELECT  bka.AccountId,
            bkl.LocationId,
            il.*
    FROM    _import_location AS il
    JOIN    _businesskeys_location AS bkl
        ON      il.PortNumber = bkl.PortNumber
        AND     il.AccNumber = bkl.AccNumber
        AND     il.LocNumber = bkl.LocNumber
    JOIN    _businesskeys_account AS bka
        ON      il.PortNumber = bka.PortNumber
        AND     il.AccNumber = bka.AccNumber
GO

/*
should vw_import_account_business_keys be done as 
one big thing, or should we split out layers & 
conditions given that they can be NULL?

I'm not very keen on the "isnull" aspect of the join
*/

CREATE VIEW vw_import_account_business_keys
AS
    SELECT  bka.AccountId,
            bkp.PolicyId,
            bkl.LayerId,
            bkc.ConditionId,
            il.*
    FROM    _import_account AS il
    JOIN    _businesskeys_account AS bka
        ON      il.PortNumber = bka.PortNumber
        AND     il.AccNumber = bka.AccNumber
    JOIN    _businesskeys_policy AS bkp
        ON      il.PortNumber = bkp.PortNumber
        AND     il.AccNumber = bkp.AccNumber
        AND     il.PolNumber = bkp.PolNumber
    JOIN    _businesskeys_layer AS bkl
        ON      il.PortNumber = bkl.PortNumber
        AND     il.AccNumber = bkl.AccNumber
        AND     il.PolNumber = bkl.PolNumber
        AND     isnull(il.LayerNumber,-1) = isnull(bkl.LayerNumber,-1)
    JOIN    _businesskeys_condition AS bkc
        ON      il.PortNumber = bkc.PortNumber
        AND     il.AccNumber = bkc.AccNumber
        AND     il.PolNumber = bkc.PolNumber
        AND     isnull(il.CondNumber,'x') = isnull(bkc.CondNumber,'x')
GO


CREATE VIEW vw_location_terms_1Building
AS
    SELECT  Distinct LocationId,
            LocPeril,
            1 AS TermLevel,
            1 AS TermCoverageType,
            LocDedType1Building AS DedType,
            LocDedCode1Building AS DedCode,
            LocDed1Building AS Deductible,
            LocMinDed1Building AS MinDeductible,
            LocMaxDed1Building AS MaxDeductible,
            LocLimitType1Building AS LimitType,
            LocLimitCode1Building AS LimitCode,
            LocLimit1Building AS [Limit],
            LocParticipation AS Participation
    FROM    vw_import_location_business_keys
    WHERE   LocPeril IS NOT NULL

GO

CREATE VIEW vw_location_terms_2Other
AS
    SELECT  Distinct LocationId,
            LocPeril,
            1 AS TermLevel,
            2 AS TermCoverageType,
            LocDedType2Other AS DedType,
            LocDedCode2Other AS DedCode,
            LocDed2Other AS Deductible,
            LocMinDed2Other AS MinDeductible,
            LocMaxDed2Other AS MaxDeductible,
            LocLimitType2Other AS LimitType,
            LocLimitCode2Other AS LimitCode,
            LocLimit2Other AS [Limit],
            LocParticipation AS Participation
    FROM    vw_import_location_business_keys
    WHERE   LocPeril IS NOT NULL

GO

CREATE VIEW vw_location_terms_3Contents
AS
    SELECT  Distinct LocationId,
            LocPeril,
            1 AS TermLevel,
            3 AS TermCoverageType,
            LocDedType3Contents AS DedType,
            LocDedCode3Contents AS DedCode,
            LocDed3Contents AS Deductible,
            LocMinDed3Contents AS MinDeductible,
            LocMaxDed3Contents AS MaxDeductible,
            LocLimitType3Contents AS LimitType,
            LocLimitCode3Contents AS LimitCode,
            LocLimit3Contents AS [Limit],
            LocParticipation AS Participation
    FROM    vw_import_location_business_keys
    WHERE   LocPeril IS NOT NULL

GO


CREATE VIEW vw_location_terms_4BI
AS
    SELECT  Distinct LocationId,
            LocPeril,
            1 AS TermLevel,
            4 AS TermCoverageType,
            LocDedType4BI AS DedType,
            LocDedCode4BI AS DedCode,
            LocDed4BI AS Deductible,
            LocMinDed4BI AS MinDeductible,
            LocMaxDed4BI AS MaxDeductible,
            LocLimitType4BI AS LimitType,
            LocLimitCode4BI AS LimitCode,
            LocLimit4BI AS [Limit],
            LocParticipation AS Participation
    FROM    vw_import_location_business_keys
    WHERE   LocPeril IS NOT NULL

GO

CREATE VIEW vw_location_terms_5PD
AS
    SELECT  Distinct LocationId,
            LocPeril,
            2 AS TermLevel,
            5 AS TermCoverageType,
            LocDedType5PD AS DedType,
            LocDedCode5PD AS DedCode,
            LocDed5PD AS Deductible,
            LocMinDed5PD AS MinDeductible,
            LocMaxDed5PD AS MaxDeductible,
            LocLimitType5PD AS LimitType,
            LocLimitCode5PD AS LimitCode,
            LocLimit5PD AS [Limit],
            LocParticipation AS Participation
    FROM    vw_import_location_business_keys
    WHERE   LocPeril IS NOT NULL

GO


CREATE VIEW vw_location_terms_6All
AS
    SELECT  Distinct LocationId,
            LocPeril,
            3 AS TermLevel,
            6 AS TermCoverageType,
            LocDedType6All AS DedType,
            LocDedCode6All AS DedCode,
            LocDed6All AS Deductible,
            LocMinDed6All AS MinDeductible,
            LocMaxDed6All AS MaxDeductible,
            LocLimitType6All AS LimitType,
            LocLimitCode6All AS LimitCode,
            LocLimit6All AS [Limit],
            LocParticipation AS Participation
    FROM    vw_import_location_business_keys
    WHERE   LocPeril IS NOT NULL

GO

CREATE VIEW vw_condition_terms_1Building
AS
    SELECT  Distinct ConditionId,
            CondPeril,
            4 AS TermLevel,
            1 AS TermCoverageType,
            CondDedType1Building AS DedType,
            CondDedCode1Building AS DedCode,
            CondDed1Building AS Deductible,
            CondMinDed1Building AS MinDeductible,
            CondMaxDed1Building AS MaxDeductible,
            CondLimitType1Building AS LimitType,
            CondLimitCode1Building AS LimitCode,
            CondLimit1Building AS [Limit],
            LayerParticipation AS Participation
    FROM    vw_import_account_business_keys
    WHERE   CondPeril IS NOT NULL

GO


CREATE VIEW vw_condition_terms_2Other
AS
    SELECT  Distinct ConditionId,
            CondPeril,
            4 AS TermLevel,
            2 AS TermCoverageType,
            CondDedType2Other AS DedType,
            CondDedCode2Other AS DedCode,
            CondDed2Other AS Deductible,
            CondMinDed2Other AS MinDeductible,
            CondMaxDed2Other AS MaxDeductible,
            CondLimitType2Other AS LimitType,
            CondLimitCode2Other AS LimitCode,
            CondLimit2Other AS [Limit],
            LayerParticipation AS Participation
    FROM    vw_import_account_business_keys
    WHERE   CondPeril IS NOT NULL

GO



CREATE VIEW vw_condition_terms_3Contents
AS
    SELECT  Distinct ConditionId,
            CondPeril,
            4 AS TermLevel,
            3 AS TermCoverageType,
            CondDedType3Contents AS DedType,
            CondDedCode3Contents AS DedCode,
            CondDed3Contents AS Deductible,
            CondMinDed3Contents AS MinDeductible,
            CondMaxDed3Contents AS MaxDeductible,
            CondLimitType3Contents AS LimitType,
            CondLimitCode3Contents AS LimitCode,
            CondLimit3Contents AS [Limit],
            LayerParticipation AS Participation
    FROM    vw_import_account_business_keys
    WHERE   CondPeril IS NOT NULL

GO



CREATE VIEW vw_condition_terms_4BI
AS
    SELECT  Distinct ConditionId,
            CondPeril,
            4 AS TermLevel,
            4 AS TermCoverageType,
            CondDedType4BI AS DedType,
            CondDedCode4BI AS DedCode,
            CondDed4BI AS Deductible,
            CondMinDed4BI AS MinDeductible,
            CondMaxDed4BI AS MaxDeductible,
            CondLimitType4BI AS LimitType,
            CondLimitCode4BI AS LimitCode,
            CondLimit4BI AS [Limit],
            LayerParticipation AS Participation
    FROM    vw_import_account_business_keys
    WHERE   CondPeril IS NOT NULL

GO


CREATE VIEW vw_condition_terms_5PD
AS
    SELECT  Distinct ConditionId,
            CondPeril,
            5 AS TermLevel,
            5 AS TermCoverageType,
            CondDedType5PD AS DedType,
            CondDedCode5PD AS DedCode,
            CondDed5PD AS Deductible,
            CondMinDed5PD AS MinDeductible,
            CondMaxDed5PD AS MaxDeductible,
            CondLimitType5PD AS LimitType,
            CondLimitCode5PD AS LimitCode,
            CondLimit5PD AS [Limit],
            LayerParticipation AS Participation
    FROM    vw_import_account_business_keys
    WHERE   CondPeril IS NOT NULL

GO


CREATE VIEW vw_condition_terms_6All
AS
    SELECT  Distinct ConditionId,
            CondPeril,
            6 AS TermLevel,
            6 AS TermCoverageType,
            CondDedType6All AS DedType,
            CondDedCode6All AS DedCode,
            CondDed6All AS Deductible,
            CondMinDed6All AS MinDeductible,
            CondMaxDed6All AS MaxDeductible,
            CondLimitType6All AS LimitType,
            CondLimitCode6All AS LimitCode,
            CondLimit6All AS [Limit],
            LayerParticipation AS Participation
    FROM    vw_import_account_business_keys
    WHERE   CondPeril IS NOT NULL

GO

CREATE VIEW vw_policy_terms_1Building
AS
    SELECT  Distinct PolicyId,
            PolPeril,
            7 AS TermLevel,
            1 AS TermCoverageType,
            PolDedType1Building AS DedType,
            PolDedCode1Building AS DedCode,
            PolDed1Building AS Deductible,
            PolMinDed1Building AS MinDeductible,
            PolMaxDed1Building AS MaxDeductible,
            PolLimitType1Building AS LimitType,
            PolLimitCode1Building AS LimitCode,
            PolLimit1Building AS [Limit],
            LayerParticipation AS Participation
    FROM    vw_import_account_business_keys
    WHERE   PolPeril IS NOT NULL

GO




CREATE VIEW vw_policy_terms_2Other
AS
    SELECT  Distinct PolicyId,
            PolPeril,
            7 AS TermLevel,
            2 AS TermCoverageType,
            PolDedType2Other AS DedType,
            PolDedCode2Other AS DedCode,
            PolDed2Other AS Deductible,
            PolMinDed2Other AS MinDeductible,
            PolMaxDed2Other AS MaxDeductible,
            PolLimitType2Other AS LimitType,
            PolLimitCode2Other AS LimitCode,
            PolLimit2Other AS [Limit],
            LayerParticipation AS Participation
    FROM    vw_import_account_business_keys
    WHERE   PolPeril IS NOT NULL

GO


CREATE VIEW vw_policy_terms_3Contents
AS
    SELECT  Distinct PolicyId,
            PolPeril,
            7 AS TermLevel,
            3 AS TermCoverageType,
            PolDedType3Contents AS DedType,
            PolDedCode3Contents AS DedCode,
            PolDed3Contents AS Deductible,
            PolMinDed3Contents AS MinDeductible,
            PolMaxDed3Contents AS MaxDeductible,
            PolLimitType3Contents AS LimitType,
            PolLimitCode3Contents AS LimitCode,
            PolLimit3Contents AS [Limit],
            LayerParticipation AS Participation
    FROM    vw_import_account_business_keys
    WHERE   PolPeril IS NOT NULL

GO



CREATE VIEW vw_policy_terms_4BI
AS
    SELECT  Distinct PolicyId,
            PolPeril,
            7 AS TermLevel,
            4 AS TermCoverageType,
            PolDedType4BI AS DedType,
            PolDedCode4BI AS DedCode,
            PolDed4BI AS Deductible,
            PolMinDed4BI AS MinDeductible,
            PolMaxDed4BI AS MaxDeductible,
            PolLimitType4BI AS LimitType,
            PolLimitCode4BI AS LimitCode,
            PolLimit4BI AS [Limit],
            LayerParticipation AS Participation
    FROM    vw_import_account_business_keys
    WHERE   PolPeril IS NOT NULL

GO


CREATE VIEW vw_policy_terms_5PD
AS
    SELECT  Distinct PolicyId,
            PolPeril,
            8 AS TermLevel,
            5 AS TermCoverageType,
            PolDedType5PD AS DedType,
            PolDedCode5PD AS DedCode,
            PolDed5PD AS Deductible,
            PolMinDed5PD AS MinDeductible,
            PolMaxDed5PD AS MaxDeductible,
            PolLimitType5PD AS LimitType,
            PolLimitCode5PD AS LimitCode,
            PolLimit5PD AS [Limit],
            LayerParticipation AS Participation
    FROM    vw_import_account_business_keys
    WHERE   PolPeril IS NOT NULL

GO


CREATE VIEW vw_policy_terms_6All
AS
    SELECT  Distinct PolicyId,
            PolPeril,
            9 AS TermLevel,
            6 AS TermCoverageType,
            PolDedType6All AS DedType,
            PolDedCode6All AS DedCode,
            PolDed6All AS Deductible,
            PolMinDed6All AS MinDeductible,
            PolMaxDed6All AS MaxDeductible,
            PolLimitType6All AS LimitType,
            PolLimitCode6All AS LimitCode,
            PolLimit6All AS [Limit],
            LayerParticipation AS Participation
    FROM    vw_import_account_business_keys
    WHERE   PolPeril IS NOT NULL

GO


CREATE VIEW vw_layer_terms
AS
    SELECT  Distinct LayerId,
            PolPeril,
            10 AS TermLevel,
            6 AS TermCoverageType,
            NULL AS DedType,
            NULL AS DedCode,
            LayerAttachment AS Deductible,
            NULL AS MinDeductible,
            NULL AS MaxDeductible,
            NULL AS LimitType,
            NULL AS LimitCode,
            LayerLimit AS [Limit],
            LayerParticipation AS Participation
    FROM    vw_import_account_business_keys
    WHERE   PolPeril IS NOT NULL

GO


CREATE VIEW vw_level_1_term
AS
    SELECT  ROW_NUMBER() OVER (ORDER BY LocationId, TermCoverageType, LocPeril) AS tmpTermId,
            *
    FROM    (
        SELECT * FROM vw_location_terms_1Building
        UNION ALL
        SELECT * FROM vw_location_terms_2Other
        UNION ALL
        SELECT * FROM vw_location_terms_3Contents
        UNION ALL
        SELECT * FROM vw_location_terms_4BI
    ) AS term_level_1

GO

CREATE VIEW vw_level_2_term
AS
    SELECT  ROW_NUMBER() OVER (ORDER BY LocationId, TermCoverageType, LocPeril) AS tmpTermId,
            *
    FROM    vw_location_terms_5PD

GO

CREATE VIEW vw_level_3_term
AS
    SELECT  ROW_NUMBER() OVER (ORDER BY LocationId, TermCoverageType, LocPeril) AS tmpTermId,
            *
    FROM    vw_location_terms_6All

GO

CREATE VIEW vw_level_4_term
AS
    SELECT  ROW_NUMBER() OVER (ORDER BY ConditionId, TermCoverageType, CondPeril) AS tmpTermId,
            *
    FROM    (
        SELECT * FROM vw_condition_terms_1Building
        UNION ALL
        SELECT * FROM vw_condition_terms_2Other
        UNION ALL
        SELECT * FROM vw_condition_terms_3Contents
        UNION ALL
        SELECT * FROM vw_condition_terms_4BI
    ) AS term_level_4

GO

CREATE VIEW vw_level_5_term
AS
    SELECT  ROW_NUMBER() OVER (ORDER BY ConditionId, TermCoverageType, CondPeril) AS tmpTermId,
            *
    FROM    vw_condition_terms_5PD

GO

CREATE VIEW vw_level_6_term
AS
    SELECT  ROW_NUMBER() OVER (ORDER BY ConditionId, TermCoverageType, CondPeril) AS tmpTermId,
            *
    FROM    vw_condition_terms_6All

GO


CREATE VIEW vw_level_7_term
AS
    SELECT  ROW_NUMBER() OVER (ORDER BY PolicyId, TermCoverageType, PolPeril) AS tmpTermId,
            *
    FROM    (
        SELECT * FROM vw_policy_terms_1Building
        UNION ALL
        SELECT * FROM vw_policy_terms_2Other
        UNION ALL
        SELECT * FROM vw_policy_terms_3Contents
        UNION ALL
        SELECT * FROM vw_policy_terms_4BI
    ) AS term_level_7

GO

CREATE VIEW vw_level_8_term
AS
    SELECT  ROW_NUMBER() OVER (ORDER BY PolicyId, TermCoverageType, PolPeril) AS tmpTermId,
            *
    FROM    vw_policy_terms_5PD

GO

CREATE VIEW vw_level_9_term
AS
    SELECT  ROW_NUMBER() OVER (ORDER BY PolicyId, TermCoverageType, PolPeril) AS tmpTermId,
            *
    FROM    vw_policy_terms_6All

GO


CREATE VIEW vw_level_10_term
AS
    SELECT  ROW_NUMBER() OVER (ORDER BY LayerId, TermCoverageType, PolPeril) AS tmpTermId,
            *
    FROM    vw_layer_terms

GO


/*
TO DO - Account Terms
*/


CREATE VIEW vw_item_detail
AS
    SELECT  i.ItemId,
            l.LocationId,
            c.CoverageTypeId,
            P.Peril
    FROM    Item AS i
    JOIN    Coverage AS c on i.CoverageId = c.CoverageId
    JOIN    Peril AS p on i.PerilId = p.PerilId
    JOIN    Location AS l on c.LocationId = l.LocationId
GO


------------------------------------------------------------------------------------------------------

-- populate CoverageType table
INSERT INTO [dbo].[CoverageType] ([CoverageTypeId], [CoverageType]) VALUES
(1, 'Building'),
(2, 'Other'),
(3, 'Contents'),
(4, 'BI'),
(5, 'PD'),
(6, 'All');


INSERT INTO [dbo].[TermCoverageType] ([TermCoverageTypeId], [CoverageTypeId]) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 1),
(5, 2),
(5, 3),
(6, 1),
(6, 2),
(6, 3),
(6, 4);

/*
-- created already?
CREATE TABLE [dbo].[TermCoverageType] (
    [TermCoverageType] INT        NOT NULL,
    [CoverageType]     INT        NOT NULL
);
GO
*/


--populate Peril table
INSERT INTO [dbo].[Peril] ([PerilId], [Peril], [IsGroupPeril]) VALUES
(1, 'QEQ', 0),
(2, 'QFF', 0),
(3, 'QTS', 0),
(4, 'QSL', 0),
(5, 'QLS', 0),
(6, 'QLF', 0),
(7, 'WTC', 0),
(8, 'WEC', 0),
(9, 'WSS', 0),
(10, 'ORF', 0),
(11, 'OSF', 0),
(12, 'XSL', 0),
(13, 'XTD', 0),
(14, 'XHL', 0),
(15, 'ZSN', 0),
(16, 'ZIC', 0),
(17, 'ZFZ', 0),
(18, 'BFR', 0),
(19, 'BBF', 0),
(20, 'MNT', 0),
(21, 'MTR', 0),
(22, 'XLT', 0),
(23, 'ZST', 0),
(24, 'BSK', 0),
(25, 'SSD', 0),
(26, 'XCH', 0),
(27, 'CSB', 0),
(28, 'CPD', 0),
(29, 'PNF', 0),
(30, 'VVA', 0),
(31, 'VVE', 0),
(32, 'VVL', 0),
(33, 'SBU', 0),
(34, 'QQ1', 1),
(35, 'WW2', 1),
(36, 'WW1', 1),
(37, 'OO1', 1),
(38, 'MM1', 1),
(39, 'XX1', 1),
(40, 'ZZ1', 1),
(41, 'XZ1', 1),
(42, 'BB1', 1),
(43, 'PP1', 1),
(44, 'GG1', 1),
(45, 'CC1', 1),
(46, 'VV1', 1),
(47, 'AA1', 1)
    

INSERT INTO [dbo].[PerilGroup] ([PerilGroupID], [PerilId]) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,17),
(18,18),
(19,19),
(20,20),
(21,21),
(22,22),
(23,23),
(24,24),
(25,25),
(26,26),
(27,27),
(28,28),
(29,29),
(30,30),
(31,31),
(32,32),
(33,33),
(34,1),
(34,2),
(34,3),
(34,4),
(34,5),
(34,6),
(35,7),
(35,8),
(36,7),
(36,8),
(36,9),
(37,10),
(37,11),
(38,20),
(38,21),
(39,12),
(39,13),
(39,14),
(39,22),
(40,15),
(40,16),
(40,17),
(40,23),
(41,12),
(41,13),
(41,14),
(41,22),
(41,15),
(41,16),
(41,17),
(41,23),
(42,19),
(42,24),
(44,26),
(45,27),
(45,28),
(43,29),
(46,30),
(46,31),
(46,32),
(47,19),
(47,18),
(47,24),
(47,28),
(47,27),
(47,20),
(47,21),
(47,10),
(47,11),
(47,29),
(47,1),
(47,2),
(47,6),
(47,5),
(47,4),
(47,3),
(47,33),
(47,25),
(47,30),
(47,31),
(47,32),
(47,8),
(47,9),
(47,7),
(47,26),
(47,14),
(47,22),
(47,12),
(47,13),
(47,17),
(47,16),
(47,15),
(47,23);

GO
------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_BusinessKeyAccount_Load]
AS

BEGIN
    SET NOCOUNT ON;

    INSERT INTO [_businesskeys_account] (
        AccountId,
        PortNumber,
        AccNumber
        )

    SELECT ROW_NUMBER() OVER (ORDER BY PortNumber, AccNumber) AS AccountId,
        PortNumber,
        AccNumber
    FROM    (
            SELECT DISTINCT PortNumber,
                AccNumber
            FROM 
                _import_account
            ) AS tmp_account

END

GO


CREATE PROCEDURE [dbo].[usp_BusinessKeyPolicy_Load]
AS

BEGIN
    SET NOCOUNT ON;

    INSERT INTO [_businesskeys_policy] (
        PolicyId,
        PortNumber,
        AccNumber,
        PolNumber,
        PolPerilsCovered
        )

    SELECT ROW_NUMBER() OVER (ORDER BY PortNumber, AccNumber, PolNumber) AS PolicyId,
        PortNumber,
        AccNumber,
        PolNumber,
        PolPerilsCovered
    FROM    (
            SELECT DISTINCT PortNumber,
                AccNumber,
                PolNumber,
                PolPerilsCovered
            FROM 
                _import_account
            ) AS tmp_policy

END

GO

CREATE PROCEDURE [dbo].[usp_BusinessKeyLayer_Load]
AS

BEGIN
    SET NOCOUNT ON;

    INSERT INTO [_businesskeys_layer] (
        LayerId,
        PortNumber,
        AccNumber,
        PolNumber,
        LayerNumber
        )

    SELECT ROW_NUMBER() OVER (ORDER BY PortNumber, AccNumber, PolNumber, LayerNumber) AS LayerId,
        PortNumber,
        AccNumber,
        PolNumber,
        LayerNumber
    FROM (
        SELECT DISTINCT PortNumber,
            AccNumber,
            PolNumber,
            LayerNumber
        FROM 
            _import_account
             ) AS tmp_layer

END

GO

CREATE PROCEDURE [dbo].[usp_BusinessKeyLocation_Load]
AS

BEGIN
    SET NOCOUNT ON;

    INSERT INTO [_businesskeys_location] (
        LocationId,
        PortNumber,
        AccNumber,
        LocNumber,
        LocPerilsCovered
        )

    SELECT DISTINCT ROW_NUMBER() OVER (ORDER BY PortNumber, AccNumber, LocNumber) AS LocationId,
        PortNumber,
        AccNumber,
        LocNumber,
        LocPerilsCovered
    FROM    (
            SELECT DISTINCT
                PortNumber,
                AccNumber,
                LocNumber,
                LocPerilsCovered
            FROM 
                _import_location
            ) AS tmp_location

END

GO


CREATE PROCEDURE [dbo].[usp_BusinessKeyCondition_Load]
AS

BEGIN
    SET NOCOUNT ON;

    INSERT INTO [_businesskeys_condition] (
        ConditionId,
        PortNumber,
        AccNumber,
        PolNumber,
        CondNumber
        )

    SELECT DISTINCT ROW_NUMBER() OVER (ORDER BY PortNumber, AccNumber, PolNumber, CondNumber) AS ConditionId,
        PortNumber,
        AccNumber,
        PolNumber,
        CondNumber
    FROM 
        (SELECT DISTINCT
        PortNumber,
        AccNumber,
        PolNumber,
        CondNumber
    FROM 
        _import_account) as tmp_condition

END

GO



CREATE PROCEDURE usp_SourceTable_Load
    @SourceTable NVARCHAR(128),
    @DestTable NVARCHAR(128)
AS

BEGIN
    SET NOCOUNT ON

    DECLARE @SQL NVARCHAR(MAX)
    DECLARE @ColumnList NVARCHAR(MAX)

    -- Build column list of matching columns between source and destination
    SELECT @ColumnList = STRING_AGG(QUOTENAME(COLUMN_NAME), ', ')
    FROM INFORMATION_SCHEMA.COLUMNS src
    WHERE TABLE_NAME = @SourceTable
        AND COLUMN_NAME IN (
            SELECT COLUMN_NAME 
            FROM INFORMATION_SCHEMA.COLUMNS 
            WHERE TABLE_NAME = @DestTable
        );

    -- Build and execute INSERT statement
    SET @SQL = 'INSERT INTO ' + QUOTENAME(@DestTable) + 
                ' (' + @ColumnList + ') ' +
                'SELECT ' + @ColumnList + 
                ' FROM ' + QUOTENAME(@SourceTable)

    EXEC sp_executesql @SQL
END

GO


CREATE PROCEDURE usp_Portfolio_Load
AS

BEGIN
    SET NOCOUNT ON;

    -- use business keys already generated

    INSERT INTO Portfolio (
        PortfolioId,
        PortNumber, 
        PortName, 
        PortNotes
        )
    SELECT ROW_NUMBER() OVER (ORDER BY PortNumber) AS PortfolioId,
            PortNumber,
            PortName,
            PortNotes
    FROM    (
            SELECT DISTINCT PortNumber,
                PortName,
                PortNotes
            FROM 
                _import_account
    ) AS tmp_pf

END

GO


CREATE PROCEDURE usp_Account_Load
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Account (
        AccountId,
        PortfolioId, 
        AccNumber
        )

    SELECT DISTINCT bka.AccountId,
        p.PortfolioId,
        bka.AccNumber
    FROM 
        _businesskeys_account bka
    JOIN
        Portfolio p ON bka.PortNumber = p.PortNumber
END

GO


CREATE PROCEDURE usp_Policy_Load
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Policy (
        PolicyId,
        AccountId, 
        PolNumber,
        PolPerilsCovered
        )

    SELECT DISTINCT bkp.PolicyId,
        bka.AccountId,
        bkp.PolNumber,
        bkp.PolPerilsCovered
    FROM 
        _businesskeys_policy bkp
    JOIN
        _businesskeys_account bka
            ON bkp.PortNumber = bka.PortNumber
            AND bkp.AccNumber = bka.AccNumber
END

GO


CREATE PROCEDURE usp_Layer_Load
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Layer (
        LayerId,
        PolicyId, 
        LayerNumber
        )

    SELECT DISTINCT bkl.LayerId,
        bkp.PolicyId,
        bkl.LayerNumber
    FROM 
        _businesskeys_layer bkl
    JOIN
        _businesskeys_policy bkp 
        ON      bkl.PortNumber = bkp.PortNumber
        AND     bkl.AccNumber = bkp.AccNumber
        AND     bkl.PolNumber = bkp.PolNumber
END

GO


CREATE PROCEDURE usp_Condition_Load
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Condition (
        ConditionId,
        PolicyId, 
        CondNumber,
        CondName,
        CondPriority,
        CondClass,
        CondTag
        )

    SELECT      DISTINCT bkc.ConditionId,
                bkp.PolicyId,
                ia.CondNumber,
                ia.CondName,
                ia.CondPriority,
                ia.CondClass,
                ia.CondTag
    FROM        _businesskeys_condition bkc
    JOIN        _businesskeys_policy bkp 
        ON      bkc.PortNumber = bkp.PortNumber
        AND     bkc.AccNumber = bkp.AccNumber
        AND     bkc.PolNumber = bkp.PolNumber
    JOIN        _import_account ia
        ON      bkc.PortNumber = ia.PortNumber
        AND     bkc.AccNumber = ia.AccNumber
        AND     bkc.PolNumber = ia.PolNumber
END

GO

CREATE PROCEDURE usp_Location_Load
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Location (
        LocationId,
        AccountId, 
        LocNumber,
        LocPerilsCovered
        )

    SELECT DISTINCT bkl.LocationId,
        bka.AccountId,
        bkl.LocNumber,
        bkl.LocPerilsCovered
    FROM 
        _businesskeys_location bkl
    JOIN
        _businesskeys_account bka
            ON bkl.PortNumber = bka.PortNumber
            AND bkl.AccNumber = bka.AccNumber
END

GO


CREATE PROCEDURE usp_ConditionLocation_Load
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO ConditionLocation (
        ConditionLocationId,
        LocationId, 
        ConditionId,
        CondTag
        )

    SELECT  ROW_NUMBER() OVER (ORDER BY LocationId, ConditionId) AS ConditionLocationId,
            LocationId,
            ConditionId,
            CondTag
    FROM    (
            SELECT  DISTINCT bkl.LocationId,
                    bkc.ConditionId,
                    il.CondTag
            FROM    _import_account AS ia
            JOIN    _import_location AS il
                        ON  il.PortNumber = ia.PortNumber
                        AND il.AccNumber = ia.AccNumber
                        AND il.CondTag = ia.CondTag
            JOIN    _businesskeys_location bkl
                        ON  il.PortNumber = bkl.PortNumber
                        AND il.AccNumber = bkl.AccNumber
                        AND il.LocNumber = bkl.LocNumber
            JOIN    _businesskeys_condition bkc
                        ON  ia.PortNumber = bkc.PortNumber
                        AND ia.AccNumber = bkc.AccNumber
                        AND ia.PolNumber = bkc.PolNumber
                        AND ia.CondNumber = bkc.CondNumber
            ) AS tmpConditionLocation
END

GO


CREATE PROCEDURE usp_Coverage_Load
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Coverage (
        CoverageId,
        LocationId,
        CoverageTypeId, 
        TIV
        )

    SELECT ROW_NUMBER() OVER (ORDER BY LocationId, CoverageTypeId) AS CoverageId,
        LocationId,
        CoverageTypeId,
        TIV
    FROM   (
            SELECT DISTINCT bkl.LocationId,
                1 as CoverageTypeId,
                ISNULL(ia.BuildingTIV,0) AS TIV
            FROM 
                _businesskeys_location bkl
            JOIN
                _import_location ia
                    ON bkl.PortNumber = ia.PortNumber
                    AND bkl.AccNumber = ia.AccNumber
                    AND bkl.LocNumber = ia.LocNumber

            UNION ALL

                SELECT DISTINCT bkl.LocationId,
                2 as CoverageTypeId,
                ISNULL(ia.OtherTIV,0) AS TIV
            FROM 
                _businesskeys_location bkl
            JOIN
                _import_location ia
                    ON bkl.PortNumber = ia.PortNumber
                    AND bkl.AccNumber = ia.AccNumber
                    AND bkl.LocNumber = ia.LocNumber

            UNION ALL

                SELECT DISTINCT bkl.LocationId,
                3 as CoverageTypeId,
                ISNULL(ia.ContentsTIV,0) AS TIV
            FROM 
                _businesskeys_location bkl
            JOIN
                _import_location ia
                    ON bkl.PortNumber = ia.PortNumber
                    AND bkl.AccNumber = ia.AccNumber
                    AND bkl.LocNumber = ia.LocNumber

            UNION ALL

                SELECT DISTINCT bkl.LocationId,
                4 as CoverageTypeId,
                ISNULL(ia.BITIV,0) AS TIV
            FROM 
                _businesskeys_location bkl
            JOIN
                _import_location ia
                    ON bkl.PortNumber = ia.PortNumber
                    AND bkl.AccNumber = ia.AccNumber
                    AND bkl.LocNumber = ia.LocNumber

    ) as tmp_cov
    WHERE   tmp_cov.TIV > 0
END

GO


CREATE PROCEDURE usp_Item_Load
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Item (ItemId, CoverageId, PerilID)
    SELECT
        ROW_NUMBER() OVER (ORDER BY c.CoverageId, p.PerilID) AS ItemId,
        c.CoverageId,
        p.PerilID
    FROM dbo._businesskeys_location AS bkl
    INNER JOIN (
        SELECT DISTINCT
            il.PortNumber,
            il.AccNumber,
            il.LocNumber,
            TRIM(spl.value) AS PerilGroup
        FROM dbo._import_location AS il
        CROSS APPLY STRING_SPLIT(il.LocPerilsCovered, ';') AS spl
        WHERE TRIM(spl.value) <> ''
    ) AS spd
        ON bkl.PortNumber = spd.PortNumber
        AND bkl.AccNumber = spd.AccNumber
        AND bkl.LocNumber = spd.LocNumber
    INNER JOIN dbo.Peril AS pg
        ON pg.Peril = spd.PerilGroup
    INNER JOIN dbo.PerilGroup AS pg_map
        ON pg_map.PerilGroupID = pg.PerilId
    INNER JOIN dbo.Peril AS p
        ON pg_map.PerilId = p.PerilId
    INNER JOIN dbo.Coverage AS c
        ON bkl.LocationId = c.LocationId;
END
GO


CREATE PROCEDURE usp_Terms_Load
AS
BEGIN
    SET NOCOUNT ON;
    CREATE TABLE #tmpterm_denormalised (
        [TermId]           INT,
        [LocationId]       INT, 
        [CoverageTypeId]   INT,
        [Peril]            VARCHAR(3),
        [TermLevel]        INT,
        [TermCoverageType] INT,
        [TermPeril]        VARCHAR(50),
        [DedType]          INT,
        [DedCode]          INT,
        [Deductible]       FLOAT (53),
        [MinDeductible]    FLOAT (53),
        [MaxDeductible]    FLOAT (53),
        [LimitType]        INT,
        [LimitCode]        INT,
        [Limit]            FLOAT (53),
        [Participation]    FLOAT (53)
    )

    DECLARE @StartTermId int

    -- level 1
    SELECT  @StartTermId = ISNULL(MAX(TermId),0) FROM Term

    INSERT INTO #tmpterm_denormalised
    SELECT  tmpTermId + @StartTermId AS TermId,
            LocationId,
            tct.CoverageTypeId,
            spl.value AS Peril,
            TermLevel,
            TermCoverageType,
            LocPeril AS TermPeril,
            DedType,
            DedCode,
            Deductible,
            MinDeductible,
            MaxDeductible,
            LimitType,
            LimitCode,
            Limit,
            Participation
    FROM    vw_level_1_term AS t
    CROSS APPLY STRING_SPLIT(LocPeril, ';') AS spl
    JOIN    TermCoverageType AS tct on t.TermCoverageType = tct.TermCoverageTypeId

    INSERT INTO Term
    SELECT DISTINCT [TermId],
            [TermLevel],
            [TermCoverageType],
            --[TermPeril],
            [DedType],
            [DedCode],
            [Deductible],
            [MinDeductible],
            [MaxDeductible],
            [LimitType],
            [LimitCode],
            [Limit],
            [Participation]
    FROM    #tmpterm_denormalised
    WHERE   TermLevel = 1

    INSERT INTO CoverageTerm
    SELECT  ROW_NUMBER() OVER (ORDER BY CoverageId, TermId) AS CoverageTermId,
            TermId,
            CoverageId
    FROM    (
            SELECT  CoverageId,
                    tmpTermId + @StartTermId AS TermId
            FROM    vw_level_1_term AS t
            JOIN    Coverage AS c
                        ON  t.LocationId = c.LocationId
                        AND t.TermCoverageType = c.CoverageTypeId
            ) AS tmpCoverageTerm


    -- level 2
    SELECT  @StartTermId = ISNULL(MAX(TermId),0) FROM Term

    INSERT INTO #tmpterm_denormalised
    SELECT  tmpTermId + @StartTermId AS TermId,
            LocationId,
            tct.CoverageTypeId,
            spl.value AS Peril,
            TermLevel,
            TermCoverageType,
            LocPeril AS TermPeril,
            DedType,
            DedCode,
            Deductible,
            MinDeductible,
            MaxDeductible,
            LimitType,
            LimitCode,
            Limit,
            Participation
    FROM    vw_level_2_term AS t
    CROSS APPLY STRING_SPLIT(LocPeril, ';') AS spl
    JOIN    TermCoverageType AS tct on t.TermCoverageType = tct.TermCoverageTypeId

    INSERT INTO Term
    SELECT DISTINCT [TermId],
            [TermLevel],
            [TermCoverageType],
            --[TermPeril],
            [DedType],
            [DedCode],
            [Deductible],
            [MinDeductible],
            [MaxDeductible],
            [LimitType],
            [LimitCode],
            [Limit],
            [Participation]
    FROM    #tmpterm_denormalised
    WHERE   TermLevel = 2

    INSERT INTO PDTerm
    SELECT  ROW_NUMBER() OVER (ORDER BY LocationId, tmpTermId) AS PDTermId,
            tmpTermId + @StartTermId AS TermId,
            LocationId
    FROM    vw_level_2_term

    -- level 3
    SELECT  @StartTermId = ISNULL(MAX(TermId),0) FROM Term

    INSERT INTO #tmpterm_denormalised
    SELECT  tmpTermId + @StartTermId AS TermId,
            LocationId,
            tct.CoverageTypeId,
            spl.value AS Peril,
            TermLevel,
            TermCoverageType,
            LocPeril AS TermPeril,
            DedType,
            DedCode,
            Deductible,
            MinDeductible,
            MaxDeductible,
            LimitType,
            LimitCode,
            Limit,
            Participation
    FROM    vw_level_3_term AS t
    CROSS APPLY STRING_SPLIT(LocPeril, ';') AS spl
    JOIN    TermCoverageType AS tct on t.TermCoverageType = tct.TermCoverageTypeId

    INSERT INTO Term
    SELECT DISTINCT [TermId],
            [TermLevel],
            [TermCoverageType],
            --[TermPeril],
            [DedType],
            [DedCode],
            [Deductible],
            [MinDeductible],
            [MaxDeductible],
            [LimitType],
            [LimitCode],
            [Limit],
            [Participation]
    FROM    #tmpterm_denormalised
    WHERE   TermLevel = 3

    INSERT INTO LocTerm
    SELECT  ROW_NUMBER() OVER (ORDER BY LocationId, tmpTermId) AS LocTermId,
            tmpTermId + @StartTermId AS TermId,
            LocationId
    FROM    vw_level_3_term

    -- level 4
    SELECT  @StartTermId = ISNULL(MAX(TermId),0) FROM Term

    INSERT INTO #tmpterm_denormalised
    SELECT  tmpTermId + @StartTermId AS TermId,
            LocationId,
            tct.CoverageTypeId,
            spl.value AS Peril,
            TermLevel,
            TermCoverageType,
            CondPeril AS TermPeril,
            DedType,
            DedCode,
            Deductible,
            MinDeductible,
            MaxDeductible,
            LimitType,
            LimitCode,
            Limit,
            Participation
    FROM    vw_level_4_term AS t
    CROSS APPLY STRING_SPLIT(CondPeril, ';') AS spl
    JOIN    TermCoverageType AS tct on t.TermCoverageType = tct.TermCoverageTypeId
    JOIN    ConditionLocation CL ON t.ConditionId = CL.ConditionId

    INSERT INTO Term
    SELECT DISTINCT [TermId],
            [TermLevel],
            [TermCoverageType],
            --[TermPeril],
            [DedType],
            [DedCode],
            [Deductible],
            [MinDeductible],
            [MaxDeductible],
            [LimitType],
            [LimitCode],
            [Limit],
            [Participation]
    FROM    #tmpterm_denormalised
    WHERE   TermLevel = 4

    INSERT INTO ConditionCoverageTerm
    SELECT  ROW_NUMBER() OVER (ORDER BY ConditionId, tmpTermId, TermCoverageType) AS ConditionCoverageTermId,
            tmpTermId + @StartTermId AS TermId,
            ConditionId,
            TermCoverageType AS CoverageTypeId
    FROM    vw_level_4_term

    -- level 5
    SELECT  @StartTermId = ISNULL(MAX(TermId),0) FROM Term

    INSERT INTO #tmpterm_denormalised
    SELECT  tmpTermId + @StartTermId AS TermId,
            LocationId,
            tct.CoverageTypeId,
            spl.value AS Peril,
            TermLevel,
            TermCoverageType,
            CondPeril AS TermPeril,
            DedType,
            DedCode,
            Deductible,
            MinDeductible,
            MaxDeductible,
            LimitType,
            LimitCode,
            Limit,
            Participation
    FROM    vw_level_5_term AS t
    CROSS APPLY STRING_SPLIT(CondPeril, ';') AS spl
    JOIN    TermCoverageType AS tct on t.TermCoverageType = tct.TermCoverageTypeId
    JOIN    ConditionLocation CL ON t.ConditionId = CL.ConditionId


    INSERT INTO Term
    SELECT DISTINCT [TermId],
            [TermLevel],
            [TermCoverageType],
            --[TermPeril],
            [DedType],
            [DedCode],
            [Deductible],
            [MinDeductible],
            [MaxDeductible],
            [LimitType],
            [LimitCode],
            [Limit],
            [Participation]
    FROM    #tmpterm_denormalised
    WHERE   TermLevel = 5

    INSERT INTO ConditionPDTerm
    SELECT  ROW_NUMBER() OVER (ORDER BY ConditionId, tmpTermId) AS ConditionPDTermId,
            tmpTermId + @StartTermId AS TermId,
            ConditionId
    FROM    vw_level_5_term
        

    -- level 6
    SELECT  @StartTermId = ISNULL(MAX(TermId),0) FROM Term

    INSERT INTO #tmpterm_denormalised
    SELECT  tmpTermId + @StartTermId AS TermId,
            LocationId,
            tct.CoverageTypeId,
            spl.value AS Peril,
            TermLevel,
            TermCoverageType,
            CondPeril AS TermPeril,
            DedType,
            DedCode,
            Deductible,
            MinDeductible,
            MaxDeductible,
            LimitType,
            LimitCode,
            Limit,
            Participation
    FROM    vw_level_6_term AS t
    CROSS APPLY STRING_SPLIT(CondPeril, ';') AS spl
    JOIN    TermCoverageType AS tct on t.TermCoverageType = tct.TermCoverageTypeId
    JOIN    ConditionLocation CL ON t.ConditionId = CL.ConditionId

    INSERT INTO Term
    SELECT DISTINCT [TermId],
            [TermLevel],
            [TermCoverageType],
            --[TermPeril],
            [DedType],
            [DedCode],
            [Deductible],
            [MinDeductible],
            [MaxDeductible],
            [LimitType],
            [LimitCode],
            [Limit],
            [Participation]
    FROM    #tmpterm_denormalised
    WHERE   TermLevel = 6

    INSERT INTO ConditionTerm
    SELECT  ROW_NUMBER() OVER (ORDER BY ConditionId, tmpTermId) AS ConditionTermId,
            tmpTermId + @StartTermId AS TermId,
            ConditionId
    FROM    vw_level_6_term

    -- level 7
    SELECT  @StartTermId = ISNULL(MAX(TermId),0) FROM Term

    INSERT INTO #tmpterm_denormalised
    SELECT  tmpTermId + @StartTermId AS TermId,
            LocationId,
            tct.CoverageTypeId,
            spl.value AS Peril,
            TermLevel,
            TermCoverageType,
            PolPeril AS TermPeril,
            DedType,
            DedCode,
            Deductible,
            MinDeductible,
            MaxDeductible,
            LimitType,
            LimitCode,
            Limit,
            Participation
    FROM    vw_level_7_term AS t
    CROSS APPLY STRING_SPLIT(PolPeril, ';') AS spl
    JOIN    TermCoverageType AS tct on t.TermCoverageType = tct.TermCoverageTypeId
    JOIN    [Policy] p ON t.PolicyId = p.PolicyId
    JOIN    Account a ON p.AccountId = a.AccountId
    JOIN    [Location] l ON a.accountId = l.AccountId

    

    INSERT INTO Term
    SELECT DISTINCT [TermId],
            [TermLevel],
            [TermCoverageType],
            --[TermPeril],
            [DedType],
            [DedCode],
            [Deductible],
            [MinDeductible],
            [MaxDeductible],
            [LimitType],
            [LimitCode],
            [Limit],
            [Participation]
    FROM    #tmpterm_denormalised
    WHERE   TermLevel = 7

    INSERT INTO PolicyCoverageTerm
    SELECT  ROW_NUMBER() OVER (ORDER BY PolicyId, tmpTermId, TermCoverageType) AS PolicyCoverageTermId,
            tmpTermId + @StartTermId AS TermId,
            PolicyId,
            TermCoverageType AS CoverageTypeId
    FROM    vw_level_7_term

    -- level 8
    SELECT  @StartTermId = ISNULL(MAX(TermId),0) FROM Term

    INSERT INTO #tmpterm_denormalised
    SELECT  tmpTermId + @StartTermId AS TermId,
            LocationId,
            tct.CoverageTypeId,
            spl.value AS Peril,
            TermLevel,
            TermCoverageType,
            PolPeril AS TermPeril,
            DedType,
            DedCode,
            Deductible,
            MinDeductible,
            MaxDeductible,
            LimitType,
            LimitCode,
            Limit,
            Participation
    FROM    vw_level_8_term AS t
    CROSS APPLY STRING_SPLIT(PolPeril, ';') AS spl
    JOIN    TermCoverageType AS tct on t.TermCoverageType = tct.TermCoverageTypeId
    JOIN    [Policy] p ON t.PolicyId = p.PolicyId
    JOIN    Account a ON p.AccountId = a.AccountId
    JOIN    [Location] l ON a.accountId = l.AccountId

    

    INSERT INTO Term
    SELECT DISTINCT [TermId],
            [TermLevel],
            [TermCoverageType],
            --[TermPeril],
            [DedType],
            [DedCode],
            [Deductible],
            [MinDeductible],
            [MaxDeductible],
            [LimitType],
            [LimitCode],
            [Limit],
            [Participation]
    FROM    #tmpterm_denormalised
    WHERE   TermLevel = 8

    INSERT INTO PolicyPDTerm
    SELECT  ROW_NUMBER() OVER (ORDER BY PolicyId, tmpTermId) AS PolicyPDTermId,
            tmpTermId + @StartTermId AS TermId,
            PolicyId
    FROM    vw_level_8_term

    -- level 9
    SELECT  @StartTermId = ISNULL(MAX(TermId),0) FROM Term

    INSERT INTO #tmpterm_denormalised
    SELECT  tmpTermId + @StartTermId AS TermId,
            LocationId,
            tct.CoverageTypeId,
            spl.value AS Peril,
            TermLevel,
            TermCoverageType,
            PolPeril AS TermPeril,
            DedType,
            DedCode,
            Deductible,
            MinDeductible,
            MaxDeductible,
            LimitType,
            LimitCode,
            Limit,
            Participation
    FROM    vw_level_9_term AS t
    CROSS APPLY STRING_SPLIT(PolPeril, ';') AS spl
    JOIN    TermCoverageType AS tct on t.TermCoverageType = tct.TermCoverageTypeId
    JOIN    [Policy] p ON t.PolicyId = p.PolicyId
    JOIN    Account a ON p.AccountId = a.AccountId
    JOIN    [Location] l ON a.accountId = l.AccountId

    

    INSERT INTO Term
    SELECT DISTINCT [TermId],
            [TermLevel],
            [TermCoverageType],
            --[TermPeril],
            [DedType],
            [DedCode],
            [Deductible],
            [MinDeductible],
            [MaxDeductible],
            [LimitType],
            [LimitCode],
            [Limit],
            [Participation]
    FROM    #tmpterm_denormalised
    WHERE   TermLevel = 9

    INSERT INTO PolicyTerm
    SELECT  ROW_NUMBER() OVER (ORDER BY PolicyId, tmpTermId) AS PolicyTermId,
            tmpTermId + @StartTermId AS TermId,
            PolicyId
    FROM    vw_level_9_term

    -- level 10
    SELECT  @StartTermId = ISNULL(MAX(TermId),0) FROM Term

    INSERT INTO #tmpterm_denormalised
    SELECT  tmpTermId + @StartTermId AS TermId,
            LocationId,
            tct.CoverageTypeId,
            spl.value AS Peril,
            TermLevel,
            TermCoverageType,
            PolPeril AS TermPeril,
            DedType,
            DedCode,
            Deductible,
            MinDeductible,
            MaxDeductible,
            LimitType,
            LimitCode,
            Limit,
            Participation
    FROM    vw_level_10_term AS t
    CROSS APPLY STRING_SPLIT(PolPeril, ';') AS spl
    JOIN    TermCoverageType AS tct on t.TermCoverageType = tct.TermCoverageTypeId
    JOIN    Layer ly ON t.LayerId = ly.LayerId
    JOIN    [Policy] p ON ly.PolicyId = p.PolicyId
    JOIN    Account a ON p.AccountId = a.AccountId
    JOIN    [Location] l ON a.accountId = l.AccountId

    

    INSERT INTO Term
    SELECT DISTINCT [TermId],
            [TermLevel],
            [TermCoverageType],
            --[TermPeril],
            [DedType],
            [DedCode],
            [Deductible],
            [MinDeductible],
            [MaxDeductible],
            [LimitType],
            [LimitCode],
            [Limit],
            [Participation]
    FROM    #tmpterm_denormalised
    WHERE   TermLevel = 10

    INSERT INTO LayerTerm
    SELECT  ROW_NUMBER() OVER (ORDER BY LayerId, tmpTermId) AS LayerTermId,
            tmpTermId + @StartTermId AS TermId,
            LayerId
    FROM    vw_level_10_term


    INSERT INTO ItemTerm
    SELECT  ROW_NUMBER() OVER (ORDER BY TermId, ItemId) AS ItemTermId,
            TermId,
            ItemId
    FROM    #tmpterm_denormalised ttd
    JOIN    vw_item_detail id 
                ON  ttd.LocationId = id.LocationId
                AND ttd.CoverageTypeId = id.CoverageTypeId
                AND ttd.Peril = id.Peril


    Drop Table #tmpterm_denormalised


END
GO


CREATE PROCEDURE [dbo].[usp_Database_Load]
AS

BEGIN
    SET NOCOUNT ON

    -- load import tables from staging tables
    EXEC usp_SourceTable_Load _staging_location, _import_location
    EXEC usp_SourceTable_Load _staging_account, _import_account

    -- load business keys from import tables
    EXEC usp_BusinessKeyAccount_Load
    EXEC usp_BusinessKeyPolicy_Load
    EXEC usp_BusinessKeyLayer_Load
    EXEC usp_BusinessKeyLocation_Load
    EXEC usp_BusinessKeyCondition_Load

    -- load portfolio table from import tables
    EXEC usp_Portfolio_Load
    EXEC usp_Account_Load
    EXEC usp_Policy_Load
    EXEC usp_Layer_Load
    EXEC usp_Condition_Load
    EXEC usp_Location_Load
    EXEC usp_Coverage_Load
    EXEC usp_Item_Load
    EXEC usp_ConditionLocation_Load

    -- terms
    EXEC usp_Terms_Load

    Select 'Done'

END

GO


-----
--Reference Tables
-----

-- Create tables (INT for numeric codes, VARCHAR for text codes)
CREATE TABLE dbo.Anchorage (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.AddressMatch (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.AppurtenantStructure (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.AttachmentBasis (Code VARCHAR(50) PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.BackUpFreq (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.Basement (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.BIFloodVuln (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.BIPreparedness (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.BIRedundancy (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.BrickVeneer (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.BuildingCondition (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.BuildingExteriorOpening (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.BuildingFloodVuln (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.BuildingShape (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.BuildingType (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.Chimney (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.Cladding (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.CloudVendor (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.CodeProvision (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.CommodityScheme (Code VARCHAR(50) PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.CompanyIDScheme (Code VARCHAR(50) PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.ConstructionQuality (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.ContentsFloodVuln (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.ContentsQuakeVuln (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.ContentsWindVuln (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.CoverageTrigger (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.CrippleWall (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.CRMVendor (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.DiameterOfPipeline (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.DefenseCost (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.EmailVendor (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.EquipmentBracing (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.ExternalDoors (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.Fatigue (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.FEMACompliance (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.Flashing (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.FloodDebrisResilience (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.FoundationConnection (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.FoundationType (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.GeogScheme (Code VARCHAR(50) PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.GlassType (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.GroundEquipment (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.IndustryScheme (Code VARCHAR(50) PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.InternalPartition (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.IsAggregate (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.IsGroupCover (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.IsPackage (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.LatticeType (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.MechanicalEquipmentSide (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.MultiStoryHall (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.OccupantPeriod (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.Ornamentation (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.OSVendor (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.Packaging (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.PatchPolicy (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.PayoutBasis (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.Pounding (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.Protection (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.PumpingCapacity (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.Redundancy (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.ReinsType (Code VARCHAR(50) PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.Retrofit (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.RiskLevel (Code VARCHAR(50) PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.RoofAnchorage (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.RoofAttachedStructures (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.RoofCover (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.RoofCoverAttachment (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.RoofDeck (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.RoofDeckAttachment (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.RoofEquipment (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.RoofFrame (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.RoofGeometry (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.RoofMaintenance (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.RoofPitch (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.SalvageProtection (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.ServiceEquipmentProtection (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.ShapeIrregularity (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.ShortColumn (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.SmallDebris (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.SoftStory (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.SoilLiquefiable (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.SoilType (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.SpecialEQConstruction (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.SprinklerType (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.StaticMotorVehicle (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.Statuses (Code VARCHAR(50) PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.StepTriggerType (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.TallOneStory (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.Tank (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.TerrainRoughness (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.Torsion (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.TreeExposure (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.Units (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.ValuablesStorage (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.VoltageOfEnergy (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.WallAttachedStructure (Code INT PRIMARY KEY, Description VARCHAR(500));
CREATE TABLE dbo.WindowProtection (Code INT PRIMARY KEY, Description VARCHAR(500));
GO

-- Insert data
INSERT INTO dbo.Anchorage (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.Anchorage (Code, Description) VALUES (1, 'Anchored');
INSERT INTO dbo.Anchorage (Code, Description) VALUES (2, 'Unanchored');

INSERT INTO dbo.AddressMatch (Code, Description) VALUES (0, 'Ungeocoded');
INSERT INTO dbo.AddressMatch (Code, Description) VALUES (1, 'User Coordinate');
INSERT INTO dbo.AddressMatch (Code, Description) VALUES (10, 'CRESTA (low res)');
INSERT INTO dbo.AddressMatch (Code, Description) VALUES (2, 'Exact Address - Building');
INSERT INTO dbo.AddressMatch (Code, Description) VALUES (20, 'Country');
INSERT INTO dbo.AddressMatch (Code, Description) VALUES (3, 'Parcel');
INSERT INTO dbo.AddressMatch (Code, Description) VALUES (4, 'Interpolated Street');
INSERT INTO dbo.AddressMatch (Code, Description) VALUES (5, 'High Resolution Postcode');
INSERT INTO dbo.AddressMatch (Code, Description) VALUES (6, 'Block Group / Streetname');
INSERT INTO dbo.AddressMatch (Code, Description) VALUES (7, 'Postal Code');
INSERT INTO dbo.AddressMatch (Code, Description) VALUES (8, 'City Centroid');
INSERT INTO dbo.AddressMatch (Code, Description) VALUES (9, 'Area');

INSERT INTO dbo.AppurtenantStructure (Code, Description) VALUES (0, 'Unknown / Default');
INSERT INTO dbo.AppurtenantStructure (Code, Description) VALUES (1, 'Detached garage');
INSERT INTO dbo.AppurtenantStructure (Code, Description) VALUES (10, 'Pole mount Solar Panels');
INSERT INTO dbo.AppurtenantStructure (Code, Description) VALUES (11, 'Car Port');
INSERT INTO dbo.AppurtenantStructure (Code, Description) VALUES (12, 'Car Port with Storage');
INSERT INTO dbo.AppurtenantStructure (Code, Description) VALUES (2, 'Pool enclosures');
INSERT INTO dbo.AppurtenantStructure (Code, Description) VALUES (3, 'Shed');
INSERT INTO dbo.AppurtenantStructure (Code, Description) VALUES (4, 'Masonry boundary wall');
INSERT INTO dbo.AppurtenantStructure (Code, Description) VALUES (5, 'Other fences');
INSERT INTO dbo.AppurtenantStructure (Code, Description) VALUES (6, 'No appurtenant structures');
INSERT INTO dbo.AppurtenantStructure (Code, Description) VALUES (7, 'No pool enclosures');
INSERT INTO dbo.AppurtenantStructure (Code, Description) VALUES (8, 'Detached screen enclosure / Lanai');
INSERT INTO dbo.AppurtenantStructure (Code, Description) VALUES (9, 'Standard ground mount Solar Panels');

INSERT INTO dbo.AttachmentBasis (Code, Description) VALUES ('LO', 'Losses Occurring During');
INSERT INTO dbo.AttachmentBasis (Code, Description) VALUES ('RA', 'Risk Attaching');

INSERT INTO dbo.BackUpFreq (Code, Description) VALUES (0, 'Cadence of back-up of the main servers  is Unknown');
INSERT INTO dbo.BackUpFreq (Code, Description) VALUES (1, 'Cadence of back-up of the main servers  is Never');
INSERT INTO dbo.BackUpFreq (Code, Description) VALUES (2, 'Cadence of back-up of the main servers  is Daily');
INSERT INTO dbo.BackUpFreq (Code, Description) VALUES (3, 'Cadence of back-up of the main servers  is Weekly');
INSERT INTO dbo.BackUpFreq (Code, Description) VALUES (4, 'Cadence of back-up of the main servers  is Monthly');
INSERT INTO dbo.BackUpFreq (Code, Description) VALUES (5, 'Cadence of back-up of the main servers  is Annually');
INSERT INTO dbo.BackUpFreq (Code, Description) VALUES (6, 'Cadence of back-up of the main servers  is Ad-hoc');

INSERT INTO dbo.Basement (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.Basement (Code, Description) VALUES (1, 'Unfinished basement');
INSERT INTO dbo.Basement (Code, Description) VALUES (2, 'Finished basement (100%)');
INSERT INTO dbo.Basement (Code, Description) VALUES (3, 'Mostly finished basement (> 50%)');
INSERT INTO dbo.Basement (Code, Description) VALUES (4, 'Partially finished basement (<= 50%)');
INSERT INTO dbo.Basement (Code, Description) VALUES (5, 'Basement of unknown finish percent');
INSERT INTO dbo.Basement (Code, Description) VALUES (6, 'No basement');

INSERT INTO dbo.BIFloodVuln (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.BIFloodVuln (Code, Description) VALUES (1, 'No Susceptibility');
INSERT INTO dbo.BIFloodVuln (Code, Description) VALUES (2, 'Very Low');
INSERT INTO dbo.BIFloodVuln (Code, Description) VALUES (3, 'Low');
INSERT INTO dbo.BIFloodVuln (Code, Description) VALUES (4, 'Moderate');
INSERT INTO dbo.BIFloodVuln (Code, Description) VALUES (5, 'High');
INSERT INTO dbo.BIFloodVuln (Code, Description) VALUES (6, 'Very High');
INSERT INTO dbo.BIFloodVuln (Code, Description) VALUES (7, 'Total Susceptibility');

INSERT INTO dbo.BIPreparedness (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.BIPreparedness (Code, Description) VALUES (1, 'Vulnerable');
INSERT INTO dbo.BIPreparedness (Code, Description) VALUES (2, 'Average');
INSERT INTO dbo.BIPreparedness (Code, Description) VALUES (3, 'Resilient');

INSERT INTO dbo.BIRedundancy (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.BIRedundancy (Code, Description) VALUES (1, 'Vulnerable');
INSERT INTO dbo.BIRedundancy (Code, Description) VALUES (2, 'Average');
INSERT INTO dbo.BIRedundancy (Code, Description) VALUES (3, 'Resilient');

INSERT INTO dbo.BrickVeneer (Code, Description) VALUES (0, 'Unknown / default (50-90%)');
INSERT INTO dbo.BrickVeneer (Code, Description) VALUES (1, 'More than 90%');
INSERT INTO dbo.BrickVeneer (Code, Description) VALUES (2, '25-50%');
INSERT INTO dbo.BrickVeneer (Code, Description) VALUES (3, '0-25%');

INSERT INTO dbo.BuildingCondition (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.BuildingCondition (Code, Description) VALUES (1, 'Average');
INSERT INTO dbo.BuildingCondition (Code, Description) VALUES (2, 'Good');
INSERT INTO dbo.BuildingCondition (Code, Description) VALUES (3, 'Poor');

INSERT INTO dbo.BuildingExteriorOpening (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.BuildingExteriorOpening (Code, Description) VALUES (1, 'Less than 50% of wall open');
INSERT INTO dbo.BuildingExteriorOpening (Code, Description) VALUES (2, 'More than 50% of wall open');

INSERT INTO dbo.BuildingFloodVuln (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.BuildingFloodVuln (Code, Description) VALUES (1, 'No Susceptibility');
INSERT INTO dbo.BuildingFloodVuln (Code, Description) VALUES (2, 'Very Low');
INSERT INTO dbo.BuildingFloodVuln (Code, Description) VALUES (3, 'Low');
INSERT INTO dbo.BuildingFloodVuln (Code, Description) VALUES (4, 'Moderate');
INSERT INTO dbo.BuildingFloodVuln (Code, Description) VALUES (5, 'High');
INSERT INTO dbo.BuildingFloodVuln (Code, Description) VALUES (6, 'Very High');
INSERT INTO dbo.BuildingFloodVuln (Code, Description) VALUES (7, 'Total Susceptibility');

INSERT INTO dbo.BuildingShape (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.BuildingShape (Code, Description) VALUES (1, 'Square');
INSERT INTO dbo.BuildingShape (Code, Description) VALUES (2, 'Rectangle');
INSERT INTO dbo.BuildingShape (Code, Description) VALUES (3, 'Circular');
INSERT INTO dbo.BuildingShape (Code, Description) VALUES (4, 'L-shaped');
INSERT INTO dbo.BuildingShape (Code, Description) VALUES (5, 'T-shaped');
INSERT INTO dbo.BuildingShape (Code, Description) VALUES (6, 'U-shaped');
INSERT INTO dbo.BuildingShape (Code, Description) VALUES (7, 'H-shaped');
INSERT INTO dbo.BuildingShape (Code, Description) VALUES (8, 'Complex');
INSERT INTO dbo.BuildingShape (Code, Description) VALUES (9, 'Triangular');

INSERT INTO dbo.BuildingType (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.BuildingType (Code, Description) VALUES (1, 'Manufactured');
INSERT INTO dbo.BuildingType (Code, Description) VALUES (2, 'Cottage');
INSERT INTO dbo.BuildingType (Code, Description) VALUES (3, 'Ranch');
INSERT INTO dbo.BuildingType (Code, Description) VALUES (4, 'Cape Cod Style');
INSERT INTO dbo.BuildingType (Code, Description) VALUES (5, 'Earth house');
INSERT INTO dbo.BuildingType (Code, Description) VALUES (6, 'Dome');

INSERT INTO dbo.Chimney (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.Chimney (Code, Description) VALUES (1, 'No');
INSERT INTO dbo.Chimney (Code, Description) VALUES (2, 'Yes, height <= 2 ft');
INSERT INTO dbo.Chimney (Code, Description) VALUES (3, 'Yes, 2ft <= height <= 5 ft');
INSERT INTO dbo.Chimney (Code, Description) VALUES (4, 'Yes, height > 5 ft');

INSERT INTO dbo.Cladding (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.Cladding (Code, Description) VALUES (1, 'Veneer brick / masonry');
INSERT INTO dbo.Cladding (Code, Description) VALUES (10, 'Stone Veneer');
INSERT INTO dbo.Cladding (Code, Description) VALUES (11, 'Steel');
INSERT INTO dbo.Cladding (Code, Description) VALUES (12, 'Light metal');
INSERT INTO dbo.Cladding (Code, Description) VALUES (13, 'Tile');
INSERT INTO dbo.Cladding (Code, Description) VALUES (14, 'Concrete');
INSERT INTO dbo.Cladding (Code, Description) VALUES (15, 'Fiber cement (Board)');
INSERT INTO dbo.Cladding (Code, Description) VALUES (16, 'Wood siding');
INSERT INTO dbo.Cladding (Code, Description) VALUES (17, 'Gypsum Board');
INSERT INTO dbo.Cladding (Code, Description) VALUES (2, 'Wood shingles / shakes');
INSERT INTO dbo.Cladding (Code, Description) VALUES (3, 'Clapboards');
INSERT INTO dbo.Cladding (Code, Description) VALUES (4, 'Aluminium / vinyl siding');
INSERT INTO dbo.Cladding (Code, Description) VALUES (5, 'Stone panels (real stone)');
INSERT INTO dbo.Cladding (Code, Description) VALUES (6, 'Exterior insulation finishing system (EIFS)');
INSERT INTO dbo.Cladding (Code, Description) VALUES (7, 'Stucco');
INSERT INTO dbo.Cladding (Code, Description) VALUES (8, 'Asbestos');
INSERT INTO dbo.Cladding (Code, Description) VALUES (9, 'Log');

INSERT INTO dbo.CloudVendor (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.CloudVendor (Code, Description) VALUES (1, 'AWS');
INSERT INTO dbo.CloudVendor (Code, Description) VALUES (2, 'MS Azure');
INSERT INTO dbo.CloudVendor (Code, Description) VALUES (3, 'Google Cloud');
INSERT INTO dbo.CloudVendor (Code, Description) VALUES (4, 'IBM Cloud');
INSERT INTO dbo.CloudVendor (Code, Description) VALUES (5, 'Oracle Cloud');
INSERT INTO dbo.CloudVendor (Code, Description) VALUES (6, 'Alibaba Cloud');

INSERT INTO dbo.CodeProvision (Code, Description) VALUES (1, 'No code/non-engineered');
INSERT INTO dbo.CodeProvision (Code, Description) VALUES (2, 'Low Code');
INSERT INTO dbo.CodeProvision (Code, Description) VALUES (3, 'Moderate Code');
INSERT INTO dbo.CodeProvision (Code, Description) VALUES (4, 'High Code');

INSERT INTO dbo.CommodityScheme (Code, Description) VALUES ('HS22', 'HS Nomenclature 2022 Edition');

INSERT INTO dbo.CompanyIDScheme (Code, Description) VALUES ('LEI', 'Legal Entity Identifier scheme');
INSERT INTO dbo.CompanyIDScheme (Code, Description) VALUES ('DUNS', 'Duns & Bradstreet scheme');
INSERT INTO dbo.CompanyIDScheme (Code, Description) VALUES ('BIN', 'Bank Identification Number scheme');

INSERT INTO dbo.ConstructionQuality (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.ConstructionQuality (Code, Description) VALUES (1, 'Fortified Home (IBHS) Bronze Option 1');
INSERT INTO dbo.ConstructionQuality (Code, Description) VALUES (10, 'Low');
INSERT INTO dbo.ConstructionQuality (Code, Description) VALUES (2, 'Fortified Home (IBHS) Bronze Option 2');
INSERT INTO dbo.ConstructionQuality (Code, Description) VALUES (3, 'Fortified Home (IBHS) Silver Option 1');
INSERT INTO dbo.ConstructionQuality (Code, Description) VALUES (4, 'Fortified Home (IBHS) Silver Option 2');
INSERT INTO dbo.ConstructionQuality (Code, Description) VALUES (5, 'Fortified Home (IBHS) Gold Option 1');
INSERT INTO dbo.ConstructionQuality (Code, Description) VALUES (6, 'Fortified Home (IBHS) Gold Option 2');
INSERT INTO dbo.ConstructionQuality (Code, Description) VALUES (7, 'Fortified for Safer Living (IBHS)');
INSERT INTO dbo.ConstructionQuality (Code, Description) VALUES (8, 'High');
INSERT INTO dbo.ConstructionQuality (Code, Description) VALUES (9, 'Medium');

INSERT INTO dbo.ContentsFloodVuln (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.ContentsFloodVuln (Code, Description) VALUES (1, 'No Susceptibility');
INSERT INTO dbo.ContentsFloodVuln (Code, Description) VALUES (2, 'Very Low');
INSERT INTO dbo.ContentsFloodVuln (Code, Description) VALUES (3, 'Low');
INSERT INTO dbo.ContentsFloodVuln (Code, Description) VALUES (4, 'Moderate');
INSERT INTO dbo.ContentsFloodVuln (Code, Description) VALUES (5, 'High');
INSERT INTO dbo.ContentsFloodVuln (Code, Description) VALUES (6, 'Very High');
INSERT INTO dbo.ContentsFloodVuln (Code, Description) VALUES (7, 'Total Susceptibility');

INSERT INTO dbo.ContentsQuakeVuln (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.ContentsQuakeVuln (Code, Description) VALUES (1, 'Low');
INSERT INTO dbo.ContentsQuakeVuln (Code, Description) VALUES (2, 'Moderate');
INSERT INTO dbo.ContentsQuakeVuln (Code, Description) VALUES (3, 'High');
INSERT INTO dbo.ContentsQuakeVuln (Code, Description) VALUES (4, 'Very High');

INSERT INTO dbo.ContentsWindVuln (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.ContentsWindVuln (Code, Description) VALUES (1, 'Low');
INSERT INTO dbo.ContentsWindVuln (Code, Description) VALUES (2, 'Moderate');
INSERT INTO dbo.ContentsWindVuln (Code, Description) VALUES (3, 'High');
INSERT INTO dbo.ContentsWindVuln (Code, Description) VALUES (4, 'Very High');

INSERT INTO dbo.CoverageTrigger (Code, Description) VALUES (0, 'Claims Made (default)');
INSERT INTO dbo.CoverageTrigger (Code, Description) VALUES (1, 'Losses Occurring');
INSERT INTO dbo.CoverageTrigger (Code, Description) VALUES (2, 'Occurrence Reported');

INSERT INTO dbo.CrippleWall (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.CrippleWall (Code, Description) VALUES (1, 'No');
INSERT INTO dbo.CrippleWall (Code, Description) VALUES (2, 'Yes');

INSERT INTO dbo.CRMVendor (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.CRMVendor (Code, Description) VALUES (1, 'Salesforce');
INSERT INTO dbo.CRMVendor (Code, Description) VALUES (2, 'Pipedrive');
INSERT INTO dbo.CRMVendor (Code, Description) VALUES (3, 'Bitrix24');
INSERT INTO dbo.CRMVendor (Code, Description) VALUES (4, 'Pipedrive');
INSERT INTO dbo.CRMVendor (Code, Description) VALUES (5, 'Ontraport');
INSERT INTO dbo.CRMVendor (Code, Description) VALUES (6, 'Nimble');
INSERT INTO dbo.CRMVendor (Code, Description) VALUES (7, 'Nutshell');
INSERT INTO dbo.CRMVendor (Code, Description) VALUES (8, 'Apptivo');

INSERT INTO dbo.DiameterOfPipeline (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.DiameterOfPipeline (Code, Description) VALUES (1, 'Small (<40 cm)');
INSERT INTO dbo.DiameterOfPipeline (Code, Description) VALUES (2, 'Large (≥ 40 cm)');

INSERT INTO dbo.DefenseCost (Code, Description) VALUES (0, 'Outside the limit (default)');
INSERT INTO dbo.DefenseCost (Code, Description) VALUES (1, 'Inside the limit');
INSERT INTO dbo.DefenseCost (Code, Description) VALUES (2, 'Not Covered');

INSERT INTO dbo.EmailVendor (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.EmailVendor (Code, Description) VALUES (1, 'Gmail');
INSERT INTO dbo.EmailVendor (Code, Description) VALUES (2, 'Outlook');
INSERT INTO dbo.EmailVendor (Code, Description) VALUES (3, 'AOL');
INSERT INTO dbo.EmailVendor (Code, Description) VALUES (4, 'Yahoo');
INSERT INTO dbo.EmailVendor (Code, Description) VALUES (5, 'iCloud');
INSERT INTO dbo.EmailVendor (Code, Description) VALUES (6, 'Proton');
INSERT INTO dbo.EmailVendor (Code, Description) VALUES (7, 'Zoho');
INSERT INTO dbo.EmailVendor (Code, Description) VALUES (8, 'Yandex');
INSERT INTO dbo.EmailVendor (Code, Description) VALUES (9, 'GMX');
INSERT INTO dbo.EmailVendor (Code, Description) VALUES (10, 'HubSpot');
INSERT INTO dbo.EmailVendor (Code, Description) VALUES (11, 'Mail.com');
INSERT INTO dbo.EmailVendor (Code, Description) VALUES (12, 'Tutanota');
INSERT INTO dbo.EmailVendor (Code, Description) VALUES (13, '10 Minute Mail');

INSERT INTO dbo.EquipmentBracing (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.EquipmentBracing (Code, Description) VALUES (1, 'Well-Braced');
INSERT INTO dbo.EquipmentBracing (Code, Description) VALUES (2, 'Average Bracing');
INSERT INTO dbo.EquipmentBracing (Code, Description) VALUES (3, 'Unbraced');

INSERT INTO dbo.ExternalDoors (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.ExternalDoors (Code, Description) VALUES (1, 'Single width Doors');
INSERT INTO dbo.ExternalDoors (Code, Description) VALUES (2, 'Double width Doors');
INSERT INTO dbo.ExternalDoors (Code, Description) VALUES (3, 'Reinforced single width doors');
INSERT INTO dbo.ExternalDoors (Code, Description) VALUES (4, 'Reinforced double width doors');
INSERT INTO dbo.ExternalDoors (Code, Description) VALUES (5, 'Sliding doors');
INSERT INTO dbo.ExternalDoors (Code, Description) VALUES (6, 'Reinforced sliding doors');

INSERT INTO dbo.Fatigue (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.Fatigue (Code, Description) VALUES (1, 'Vulnerable');
INSERT INTO dbo.Fatigue (Code, Description) VALUES (2, 'Average');
INSERT INTO dbo.Fatigue (Code, Description) VALUES (3, 'Resilient');

INSERT INTO dbo.FEMACompliance (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.FEMACompliance (Code, Description) VALUES (1, 'Yes');
INSERT INTO dbo.FEMACompliance (Code, Description) VALUES (2, 'No');

INSERT INTO dbo.Flashing (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.Flashing (Code, Description) VALUES (1, 'Vulnerable');
INSERT INTO dbo.Flashing (Code, Description) VALUES (2, 'Average');
INSERT INTO dbo.Flashing (Code, Description) VALUES (3, 'Resilient');

INSERT INTO dbo.FloodDebrisResilience (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.FloodDebrisResilience (Code, Description) VALUES (1, 'Vulnerable');
INSERT INTO dbo.FloodDebrisResilience (Code, Description) VALUES (2, 'Average');
INSERT INTO dbo.FloodDebrisResilience (Code, Description) VALUES (3, 'Resilient');

INSERT INTO dbo.FoundationConnection (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.FoundationConnection (Code, Description) VALUES (1, 'Hurricane ties');
INSERT INTO dbo.FoundationConnection (Code, Description) VALUES (2, 'Nails / Screws');
INSERT INTO dbo.FoundationConnection (Code, Description) VALUES (3, 'Anchor Bolts');
INSERT INTO dbo.FoundationConnection (Code, Description) VALUES (4, 'Gravity / Friction');
INSERT INTO dbo.FoundationConnection (Code, Description) VALUES (5, 'Adhesive / Epoxy');
INSERT INTO dbo.FoundationConnection (Code, Description) VALUES (6, 'Structurally Connected');

INSERT INTO dbo.FoundationType (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.FoundationType (Code, Description) VALUES (1, 'Masonry basement');
INSERT INTO dbo.FoundationType (Code, Description) VALUES (2, 'Concrete basement');
INSERT INTO dbo.FoundationType (Code, Description) VALUES (3, 'Masonry wall');
INSERT INTO dbo.FoundationType (Code, Description) VALUES (4, 'Crawl space cripple wall');
INSERT INTO dbo.FoundationType (Code, Description) VALUES (5, 'Crawl space masonry');
INSERT INTO dbo.FoundationType (Code, Description) VALUES (6, 'Post & pier');
INSERT INTO dbo.FoundationType (Code, Description) VALUES (7, 'Footing');
INSERT INTO dbo.FoundationType (Code, Description) VALUES (8, 'Mat / slab');
INSERT INTO dbo.FoundationType (Code, Description) VALUES (9, 'Pile');
INSERT INTO dbo.FoundationType (Code, Description) VALUES (10, 'No basement');
INSERT INTO dbo.FoundationType (Code, Description) VALUES (11, 'Engineering foundation');
INSERT INTO dbo.FoundationType (Code, Description) VALUES (12, 'Crawlspace - raised (wood)');
INSERT INTO dbo.FoundationType (Code, Description) VALUES (13, 'Monopile (offshore)');
INSERT INTO dbo.FoundationType (Code, Description) VALUES (14, 'Jacket on Caisson (SBJ) (Offshore)');
INSERT INTO dbo.FoundationType (Code, Description) VALUES (15, 'Jacket (offshore)');
INSERT INTO dbo.FoundationType (Code, Description) VALUES (16, 'Jacket on Pin Piles (JPP)');
INSERT INTO dbo.FoundationType (Code, Description) VALUES (17, 'Gravity-based (offshore)');
INSERT INTO dbo.FoundationType (Code, Description) VALUES (18, 'Floating: spar (offshore)');
INSERT INTO dbo.FoundationType (Code, Description) VALUES (19, 'Floating: Semisubmersible (offshore)');
INSERT INTO dbo.FoundationType (Code, Description) VALUES (20, 'Floating: Tension-Leg Platform (offshore)');

INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('CNTY', 'County');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('CRH', 'High Resolution CRESTA');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('CRL', 'Low Resolution CRESTA');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('CRO', 'Old CRESTA');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('CRSL2', 'Province in CatRisk Solutions models');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('CRSL3', 'CRESTA / Province in CatRisk Solutions models');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('CRSL4', 'Municipality / Province in CatRisk Solutions models');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('CRSL5', 'City in CatRisk Solutions models (bespoke list)');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('CRSVG', 'Variable Resolution Grid (VRG) in CatRisk Solutions models');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('GADM1', 'GADM level 1');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('GADM2', 'GADM level 2');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('GADM3', 'GADM level 3');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('GADM4', 'GADM level 4');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('GADM5', 'GADM level 5');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('GNAF', 'Australia''s Geocoded National Address File');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('GPLUS', 'Google Plus');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('ICA', 'Insurance Council of Australia Zones');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('PC2', 'Postcode (2 characters)');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('PC3', 'Postcode (3 characters)');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('PC4', 'Postcode (4 characters)');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('PC5', 'Postcode (5 characters)');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('PC6', 'Postcode (6 characters)');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('PC7', 'Postcode (7 characters)');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('PC8', 'Postcode (8 characters)');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('PC9', 'Postcode (9 characters)');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('PCD', 'Postcode District');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('PCS', 'Postcode Sector');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('PCU', 'Postcode Unit');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('JBA1', 'Admin level 1 - highest resolution for admin boundaries');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('W3W', 'What 3 Words');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('UPRN', 'UK property Reference Number (created by Ordnance Survey)');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('EIRCODE', 'Used in the Republic of Ireland');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('INSEE', 'Used in France but not supported by GADM.');
INSERT INTO dbo.GeogScheme (Code, Description) VALUES ('FTM1', 'Fathom admin boundaries');

INSERT INTO dbo.GlassType (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.GlassType (Code, Description) VALUES (1, 'Annealed');
INSERT INTO dbo.GlassType (Code, Description) VALUES (2, 'Tempered');
INSERT INTO dbo.GlassType (Code, Description) VALUES (3, 'Heat strengthened');
INSERT INTO dbo.GlassType (Code, Description) VALUES (4, 'Laminated');
INSERT INTO dbo.GlassType (Code, Description) VALUES (5, 'Insulating glass units');

INSERT INTO dbo.GroundEquipment (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.GroundEquipment (Code, Description) VALUES (1, 'No equipment');
INSERT INTO dbo.GroundEquipment (Code, Description) VALUES (2, 'Vulnerable');
INSERT INTO dbo.GroundEquipment (Code, Description) VALUES (3, 'Average');
INSERT INTO dbo.GroundEquipment (Code, Description) VALUES (4, 'Resilient');

INSERT INTO dbo.IndustryScheme (Code, Description) VALUES ('NAICS', 'North American Industry Classification System');
INSERT INTO dbo.IndustryScheme (Code, Description) VALUES ('USSIC', 'Standard Industrial Classification (SIC) System');
INSERT INTO dbo.IndustryScheme (Code, Description) VALUES ('UKSIC', 'UK Standard Industrial Classification of Economic Activities');

INSERT INTO dbo.InternalPartition (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.InternalPartition (Code, Description) VALUES (1, 'Wood');
INSERT INTO dbo.InternalPartition (Code, Description) VALUES (2, 'Gypsum boards');
INSERT INTO dbo.InternalPartition (Code, Description) VALUES (3, 'Plastered Masonry');
INSERT INTO dbo.InternalPartition (Code, Description) VALUES (4, 'Brick');
INSERT INTO dbo.InternalPartition (Code, Description) VALUES (5, 'Other');

INSERT INTO dbo.IsAggregate (Code, Description) VALUES (1, 'Is aggregated data using NumberOfBuildings field');
INSERT INTO dbo.IsAggregate (Code, Description) VALUES (0, 'Is not aggregated using on NumberOfBuildings field');

INSERT INTO dbo.IsGroupCover (Code, Description) VALUES (0, 'No (default)');
INSERT INTO dbo.IsGroupCover (Code, Description) VALUES (1, 'Yes');

INSERT INTO dbo.IsPackage (Code, Description) VALUES (0, 'Standalone (default)');
INSERT INTO dbo.IsPackage (Code, Description) VALUES (1, 'Package');

INSERT INTO dbo.LatticeType (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.LatticeType (Code, Description) VALUES (1, 'Full web');
INSERT INTO dbo.LatticeType (Code, Description) VALUES (2, 'Grid');
INSERT INTO dbo.LatticeType (Code, Description) VALUES (3, 'Lattice');

INSERT INTO dbo.MechanicalEquipmentSide (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.MechanicalEquipmentSide (Code, Description) VALUES (1, 'Vulnerable');
INSERT INTO dbo.MechanicalEquipmentSide (Code, Description) VALUES (2, 'Average');
INSERT INTO dbo.MechanicalEquipmentSide (Code, Description) VALUES (3, 'Resilient');

INSERT INTO dbo.MultiStoryHall (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.MultiStoryHall (Code, Description) VALUES (1, 'No');
INSERT INTO dbo.MultiStoryHall (Code, Description) VALUES (2, 'Yes');

INSERT INTO dbo.OccupantPeriod (Code, Description) VALUES (0, 'Unknown/Default');
INSERT INTO dbo.OccupantPeriod (Code, Description) VALUES (1, 'Night');
INSERT INTO dbo.OccupantPeriod (Code, Description) VALUES (2, 'Day');
INSERT INTO dbo.OccupantPeriod (Code, Description) VALUES (3, 'Peak Season');
INSERT INTO dbo.OccupantPeriod (Code, Description) VALUES (4, 'Off-peak Season');
INSERT INTO dbo.OccupantPeriod (Code, Description) VALUES (5, 'Night - peak season');
INSERT INTO dbo.OccupantPeriod (Code, Description) VALUES (6, 'Day - peak season');
INSERT INTO dbo.OccupantPeriod (Code, Description) VALUES (7, 'Night - Off-peak season');
INSERT INTO dbo.OccupantPeriod (Code, Description) VALUES (8, 'Day - Off-peak season');

INSERT INTO dbo.Ornamentation (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.Ornamentation (Code, Description) VALUES (1, 'None');
INSERT INTO dbo.Ornamentation (Code, Description) VALUES (2, 'Average');
INSERT INTO dbo.Ornamentation (Code, Description) VALUES (3, 'Extensive');

INSERT INTO dbo.OSVendor (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.OSVendor (Code, Description) VALUES (1, 'Windows');
INSERT INTO dbo.OSVendor (Code, Description) VALUES (2, 'Linux');
INSERT INTO dbo.OSVendor (Code, Description) VALUES (3, 'Apple Mac');
INSERT INTO dbo.OSVendor (Code, Description) VALUES (4, 'Ubuntu');
INSERT INTO dbo.OSVendor (Code, Description) VALUES (5, 'Fedora');
INSERT INTO dbo.OSVendor (Code, Description) VALUES (6, 'Solaris');
INSERT INTO dbo.OSVendor (Code, Description) VALUES (7, 'Chrome');
INSERT INTO dbo.OSVendor (Code, Description) VALUES (8, 'CentOS');
INSERT INTO dbo.OSVendor (Code, Description) VALUES (9, 'Debian');
INSERT INTO dbo.OSVendor (Code, Description) VALUES (10, 'Deepin');

INSERT INTO dbo.Packaging (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.Packaging (Code, Description) VALUES (1, 'Vulnerable');
INSERT INTO dbo.Packaging (Code, Description) VALUES (2, 'Average');
INSERT INTO dbo.Packaging (Code, Description) VALUES (3, 'Resilient');

INSERT INTO dbo.PatchPolicy (Code, Description) VALUES (0, 'Cadence of patches to the main system is Unknown');
INSERT INTO dbo.PatchPolicy (Code, Description) VALUES (1, 'Cadence of patches to the main system is Never');
INSERT INTO dbo.PatchPolicy (Code, Description) VALUES (2, 'Cadence of patches to the main system is Daily');
INSERT INTO dbo.PatchPolicy (Code, Description) VALUES (3, 'Cadence of patches to the main system is Weekly');
INSERT INTO dbo.PatchPolicy (Code, Description) VALUES (4, 'Cadence of patches to the main system is Monthly');
INSERT INTO dbo.PatchPolicy (Code, Description) VALUES (5, 'Cadence of patches to the main system is Annually');
INSERT INTO dbo.PatchPolicy (Code, Description) VALUES (6, 'Cadence of patches to the main system is Ad-hoc');

INSERT INTO dbo.PayoutBasis (Code, Description) VALUES (0, 'UNK');
INSERT INTO dbo.PayoutBasis (Code, Description) VALUES (1, 'ACV');
INSERT INTO dbo.PayoutBasis (Code, Description) VALUES (2, 'RCV');

INSERT INTO dbo.Pounding (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.Pounding (Code, Description) VALUES (1, '0-0.25 m');
INSERT INTO dbo.Pounding (Code, Description) VALUES (2, '0.25-0.5 m');
INSERT INTO dbo.Pounding (Code, Description) VALUES (3, '0.5-1.0 m');
INSERT INTO dbo.Pounding (Code, Description) VALUES (4, '1.0-2.0 m');
INSERT INTO dbo.Pounding (Code, Description) VALUES (5, '>2.0 m');

INSERT INTO dbo.Protection (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.Protection (Code, Description) VALUES (1, 'Vulnerable');
INSERT INTO dbo.Protection (Code, Description) VALUES (2, 'Average');
INSERT INTO dbo.Protection (Code, Description) VALUES (3, 'Resilient');

INSERT INTO dbo.PumpingCapacity (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.PumpingCapacity (Code, Description) VALUES (1, 'Small pumping capacity (<10 millions gallons per day (MGD)');
INSERT INTO dbo.PumpingCapacity (Code, Description) VALUES (2, 'Medium pumping capacity (10-50 MGD)');
INSERT INTO dbo.PumpingCapacity (Code, Description) VALUES (3, 'Large pumping capacity (>50 MGD)');
INSERT INTO dbo.PumpingCapacity (Code, Description) VALUES (4, 'Small Water Treatment Capacity (<50 MGD)');
INSERT INTO dbo.PumpingCapacity (Code, Description) VALUES (5, 'Medium Water Treatment Capacity (50-200 MGD)');
INSERT INTO dbo.PumpingCapacity (Code, Description) VALUES (6, 'Large Water Treatment Capacity (>200 MGD)');

INSERT INTO dbo.Redundancy (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.Redundancy (Code, Description) VALUES (1, 'No');
INSERT INTO dbo.Redundancy (Code, Description) VALUES (2, 'Yes');

INSERT INTO dbo.ReinsType (Code, Description) VALUES ('AXL', 'Aggregate Excess of Loss');
INSERT INTO dbo.ReinsType (Code, Description) VALUES ('CXL', 'Catastrophe Excess of Loss');
INSERT INTO dbo.ReinsType (Code, Description) VALUES ('FAC', 'Facultative reinsurance');
INSERT INTO dbo.ReinsType (Code, Description) VALUES ('PR', 'Per risk treaty');
INSERT INTO dbo.ReinsType (Code, Description) VALUES ('QS', 'Quota Share');
INSERT INTO dbo.ReinsType (Code, Description) VALUES ('SS', 'Surplus Share');

INSERT INTO dbo.Retrofit (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.Retrofit (Code, Description) VALUES (1, 'Bracing of cripple walls');
INSERT INTO dbo.Retrofit (Code, Description) VALUES (2, 'Bracing of parapets');
INSERT INTO dbo.Retrofit (Code, Description) VALUES (3, 'Bracing of soft-story');
INSERT INTO dbo.Retrofit (Code, Description) VALUES (4, 'Foundation anchorage (bolting)');
INSERT INTO dbo.Retrofit (Code, Description) VALUES (5, 'Glass/window strengthening');
INSERT INTO dbo.Retrofit (Code, Description) VALUES (6, 'Tilt Up');
INSERT INTO dbo.Retrofit (Code, Description) VALUES (7, 'General');

INSERT INTO dbo.RiskLevel (Code, Description) VALUES ('', 'No risk terms');
INSERT INTO dbo.RiskLevel (Code, Description) VALUES ('ACC', 'Account');
INSERT INTO dbo.RiskLevel (Code, Description) VALUES ('LGR', 'Location Group');
INSERT INTO dbo.RiskLevel (Code, Description) VALUES ('LOC', 'Location');
INSERT INTO dbo.RiskLevel (Code, Description) VALUES ('POL', 'Policy');

INSERT INTO dbo.RoofAnchorage (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.RoofAnchorage (Code, Description) VALUES (1, 'Hurricane Ties');
INSERT INTO dbo.RoofAnchorage (Code, Description) VALUES (2, 'Nails / Screws');
INSERT INTO dbo.RoofAnchorage (Code, Description) VALUES (3, 'Anchor bolts');
INSERT INTO dbo.RoofAnchorage (Code, Description) VALUES (4, 'Gravity / friction');
INSERT INTO dbo.RoofAnchorage (Code, Description) VALUES (5, 'Adhesive epoxy');
INSERT INTO dbo.RoofAnchorage (Code, Description) VALUES (6, 'Structurally Connected');
INSERT INTO dbo.RoofAnchorage (Code, Description) VALUES (7, 'Clips');
INSERT INTO dbo.RoofAnchorage (Code, Description) VALUES (8, 'Double wraps');
INSERT INTO dbo.RoofAnchorage (Code, Description) VALUES (9, 'Single wraps');

INSERT INTO dbo.RoofAttachedStructures (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.RoofAttachedStructures (Code, Description) VALUES (1, 'Chimneys');
INSERT INTO dbo.RoofAttachedStructures (Code, Description) VALUES (10, 'Overhang/Rake (> 36 in)');
INSERT INTO dbo.RoofAttachedStructures (Code, Description) VALUES (11, 'Waterproof membrane/fabric');
INSERT INTO dbo.RoofAttachedStructures (Code, Description) VALUES (12, 'Secondary water resistance - Yes');
INSERT INTO dbo.RoofAttachedStructures (Code, Description) VALUES (13, 'Secondary water resistance - No');
INSERT INTO dbo.RoofAttachedStructures (Code, Description) VALUES (14, 'Solar Panels with ballast');
INSERT INTO dbo.RoofAttachedStructures (Code, Description) VALUES (15, 'Solar panels mechanically attached');
INSERT INTO dbo.RoofAttachedStructures (Code, Description) VALUES (2, 'A/C Units');
INSERT INTO dbo.RoofAttachedStructures (Code, Description) VALUES (3, 'Skylights');
INSERT INTO dbo.RoofAttachedStructures (Code, Description) VALUES (4, 'Parapet Walls');
INSERT INTO dbo.RoofAttachedStructures (Code, Description) VALUES (5, 'Overhang/Rake (8-36 in)');
INSERT INTO dbo.RoofAttachedStructures (Code, Description) VALUES (6, 'Dormers');
INSERT INTO dbo.RoofAttachedStructures (Code, Description) VALUES (7, 'Other');
INSERT INTO dbo.RoofAttachedStructures (Code, Description) VALUES (8, 'No Attached Structures');
INSERT INTO dbo.RoofAttachedStructures (Code, Description) VALUES (9, 'Overhang/Rake (< 8 in)');

INSERT INTO dbo.RoofCover (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (1, 'Asphalt shingles');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (10, 'Single ply membrane ballasted');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (11, 'Hurricane Wind-Rated Roof Coverings');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (12, 'Composition (Fiberglass, Asphalt, etc)');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (13, 'Asbestos shakes');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (14, 'Copper');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (15, 'Concrete (not tile)');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (16, 'Reinforced concrete');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (18, 'Plastic');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (19, 'Fiberglass');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (2, 'Wooden shingles');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (20, 'Steel');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (21, 'Plywood');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (22, 'Rubber');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (23, 'Tin');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (24, 'Aluminium');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (25, 'Foam');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (26, 'Thatch');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (27, 'Felt');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (28, 'Zinc');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (3, 'Clay/concrete tiles');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (4, 'Light metal panels');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (5, 'Slate');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (6, 'Built-up roof with gravel');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (7, 'Single ply membrane');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (8, 'Standing seam metal roofs');
INSERT INTO dbo.RoofCover (Code, Description) VALUES (9, 'Built-up roof without gravel');

INSERT INTO dbo.RoofCoverAttachment (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.RoofCoverAttachment (Code, Description) VALUES (1, 'Screws');
INSERT INTO dbo.RoofCoverAttachment (Code, Description) VALUES (2, 'Nails/staples');
INSERT INTO dbo.RoofCoverAttachment (Code, Description) VALUES (3, 'Adhesive/epoxy');
INSERT INTO dbo.RoofCoverAttachment (Code, Description) VALUES (4, 'Mortar');

INSERT INTO dbo.RoofDeck (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.RoofDeck (Code, Description) VALUES (1, 'Plywood');
INSERT INTO dbo.RoofDeck (Code, Description) VALUES (2, 'Wood planks');
INSERT INTO dbo.RoofDeck (Code, Description) VALUES (3, 'Particle board / OSB');
INSERT INTO dbo.RoofDeck (Code, Description) VALUES (4, 'Metal deck with insulation board');
INSERT INTO dbo.RoofDeck (Code, Description) VALUES (5, 'Metal deck with concrete');
INSERT INTO dbo.RoofDeck (Code, Description) VALUES (6, 'Pre-cast concrete slabs');
INSERT INTO dbo.RoofDeck (Code, Description) VALUES (7, 'Reinforced concrete slabs');
INSERT INTO dbo.RoofDeck (Code, Description) VALUES (8, 'Light metal');

INSERT INTO dbo.RoofDeckAttachment (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.RoofDeckAttachment (Code, Description) VALUES (1, 'Screws / bolts');
INSERT INTO dbo.RoofDeckAttachment (Code, Description) VALUES (2, 'Nails');
INSERT INTO dbo.RoofDeckAttachment (Code, Description) VALUES (3, 'Adhesive / epoxy');
INSERT INTO dbo.RoofDeckAttachment (Code, Description) VALUES (4, 'Structurally connected');
INSERT INTO dbo.RoofDeckAttachment (Code, Description) VALUES (5, '6d nails @ 6 spacing, 12 on center');
INSERT INTO dbo.RoofDeckAttachment (Code, Description) VALUES (6, '8d nails @ 6 spacing, 12 on center');
INSERT INTO dbo.RoofDeckAttachment (Code, Description) VALUES (7, '8d nails @ 6 spacing, 6 on center');

INSERT INTO dbo.RoofEquipment (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.RoofEquipment (Code, Description) VALUES (1, 'No equipment');
INSERT INTO dbo.RoofEquipment (Code, Description) VALUES (2, 'Vulnerable');
INSERT INTO dbo.RoofEquipment (Code, Description) VALUES (3, 'Average');
INSERT INTO dbo.RoofEquipment (Code, Description) VALUES (4, 'Resilient');

INSERT INTO dbo.RoofFrame (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.RoofFrame (Code, Description) VALUES (1, 'Reinforced Concrete');
INSERT INTO dbo.RoofFrame (Code, Description) VALUES (2, 'Steel');
INSERT INTO dbo.RoofFrame (Code, Description) VALUES (3, 'Light Metal');
INSERT INTO dbo.RoofFrame (Code, Description) VALUES (4, 'Wood');

INSERT INTO dbo.RoofGeometry (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.RoofGeometry (Code, Description) VALUES (1, 'Flat');
INSERT INTO dbo.RoofGeometry (Code, Description) VALUES (10, 'Gambrel');
INSERT INTO dbo.RoofGeometry (Code, Description) VALUES (11, 'Butterfly');
INSERT INTO dbo.RoofGeometry (Code, Description) VALUES (12, 'Saltbox');
INSERT INTO dbo.RoofGeometry (Code, Description) VALUES (2, 'Gable end without bracing');
INSERT INTO dbo.RoofGeometry (Code, Description) VALUES (3, 'Hip');
INSERT INTO dbo.RoofGeometry (Code, Description) VALUES (4, 'Complex');
INSERT INTO dbo.RoofGeometry (Code, Description) VALUES (5, 'Stepped');
INSERT INTO dbo.RoofGeometry (Code, Description) VALUES (6, 'Shed');
INSERT INTO dbo.RoofGeometry (Code, Description) VALUES (7, 'Mansard');
INSERT INTO dbo.RoofGeometry (Code, Description) VALUES (8, 'Gable end with bracing');
INSERT INTO dbo.RoofGeometry (Code, Description) VALUES (9, 'Pyramid');

INSERT INTO dbo.RoofMaintenance (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.RoofMaintenance (Code, Description) VALUES (1, 'Vulnerable');
INSERT INTO dbo.RoofMaintenance (Code, Description) VALUES (2, 'Average');
INSERT INTO dbo.RoofMaintenance (Code, Description) VALUES (3, 'Resilient');

INSERT INTO dbo.RoofPitch (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.RoofPitch (Code, Description) VALUES (1, 'Low (<10°)');
INSERT INTO dbo.RoofPitch (Code, Description) VALUES (2, 'Medium (10° to 30°)');
INSERT INTO dbo.RoofPitch (Code, Description) VALUES (3, 'High (>30°)');

INSERT INTO dbo.SalvageProtection (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.SalvageProtection (Code, Description) VALUES (1, 'Vulnerable');
INSERT INTO dbo.SalvageProtection (Code, Description) VALUES (2, 'Average');
INSERT INTO dbo.SalvageProtection (Code, Description) VALUES (3, 'Resilient');

INSERT INTO dbo.ServiceEquipmentProtection (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.ServiceEquipmentProtection (Code, Description) VALUES (1, 'Protected for flood (i.e. protected for flood by being elevated and/or flood proofing)');
INSERT INTO dbo.ServiceEquipmentProtection (Code, Description) VALUES (2, 'Unprotected for flood (i.e. not elevated and not flood protected)');

INSERT INTO dbo.ShapeIrregularity (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.ShapeIrregularity (Code, Description) VALUES (2, 'Vertical Offset');
INSERT INTO dbo.ShapeIrregularity (Code, Description) VALUES (3, 'Non-uniform Floor Area');
INSERT INTO dbo.ShapeIrregularity (Code, Description) VALUES (4, 'Discontinuous Shear Wall');
INSERT INTO dbo.ShapeIrregularity (Code, Description) VALUES (5, 'Heavy floor');

INSERT INTO dbo.ShortColumn (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.ShortColumn (Code, Description) VALUES (1, 'No');
INSERT INTO dbo.ShortColumn (Code, Description) VALUES (2, 'Yes');

INSERT INTO dbo.SmallDebris (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.SmallDebris (Code, Description) VALUES (1, 'No');
INSERT INTO dbo.SmallDebris (Code, Description) VALUES (2, 'Yes');

INSERT INTO dbo.SoftStory (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.SoftStory (Code, Description) VALUES (1, 'No');
INSERT INTO dbo.SoftStory (Code, Description) VALUES (2, 'Yes');

INSERT INTO dbo.SoilLiquefiable (Code, Description) VALUES (0, 'Unknown / not applicable');
INSERT INTO dbo.SoilLiquefiable (Code, Description) VALUES (1, 'Soil not susceptible to liquefaction (clay-like soils)');
INSERT INTO dbo.SoilLiquefiable (Code, Description) VALUES (2, 'Soil susceptible to liquefaction (sand-like soils)');

INSERT INTO dbo.SoilType (Code, Description) VALUES (0, 'No soil information (default)');
INSERT INTO dbo.SoilType (Code, Description) VALUES (1, 'Time averaged shear-wave velocity to 30m depth (vs30 (m/s))');

INSERT INTO dbo.SpecialEQConstruction (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.SpecialEQConstruction (Code, Description) VALUES (1, 'Base isolation');
INSERT INTO dbo.SpecialEQConstruction (Code, Description) VALUES (2, 'Visco-elastic dampers');
INSERT INTO dbo.SpecialEQConstruction (Code, Description) VALUES (3, 'Other energy dissipaters');

INSERT INTO dbo.SprinklerType (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.SprinklerType (Code, Description) VALUES (1, 'No sprinkler');
INSERT INTO dbo.SprinklerType (Code, Description) VALUES (2, 'CO2 / Halon sprinkler');
INSERT INTO dbo.SprinklerType (Code, Description) VALUES (3, 'Dry sprinkler');
INSERT INTO dbo.SprinklerType (Code, Description) VALUES (4, 'Standpipe sprinkler');
INSERT INTO dbo.SprinklerType (Code, Description) VALUES (5, 'Wet sprinkler');

INSERT INTO dbo.StaticMotorVehicle (Code, Description) VALUES (0, 'Dynamic motor vehicle that moves from location to location');
INSERT INTO dbo.StaticMotorVehicle (Code, Description) VALUES (1, 'Static motor vehicle');

INSERT INTO dbo.Statuses (Code, Description) VALUES ('B', 'Bound');
INSERT INTO dbo.Statuses (Code, Description) VALUES ('C', 'Cancelled');
INSERT INTO dbo.Statuses (Code, Description) VALUES ('Q', 'Quoted');
INSERT INTO dbo.Statuses (Code, Description) VALUES ('R', 'Rejected');
INSERT INTO dbo.Statuses (Code, Description) VALUES ('S', 'Submitted');

INSERT INTO dbo.StepTriggerType (Code, Description) VALUES (1, 'Building');
INSERT INTO dbo.StepTriggerType (Code, Description) VALUES (2, 'Contents');
INSERT INTO dbo.StepTriggerType (Code, Description) VALUES (3, 'Building and Contents');
INSERT INTO dbo.StepTriggerType (Code, Description) VALUES (4, 'Building, then Contents');
INSERT INTO dbo.StepTriggerType (Code, Description) VALUES (5, 'Building, Contents separately');

INSERT INTO dbo.TallOneStory (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.TallOneStory (Code, Description) VALUES (1, '<= 20 ft');
INSERT INTO dbo.TallOneStory (Code, Description) VALUES (2, '> 20ft and < 40ft');
INSERT INTO dbo.TallOneStory (Code, Description) VALUES (3, '>= 40ft');

INSERT INTO dbo.Tank (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.Tank (Code, Description) VALUES (1, 'No');
INSERT INTO dbo.Tank (Code, Description) VALUES (2, 'Yes');

INSERT INTO dbo.TerrainRoughness (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.TerrainRoughness (Code, Description) VALUES (1, 'Large city centers');
INSERT INTO dbo.TerrainRoughness (Code, Description) VALUES (2, 'Urban and suburban areas, wooded areas');
INSERT INTO dbo.TerrainRoughness (Code, Description) VALUES (3, 'Open terrain with scattered obstruct');
INSERT INTO dbo.TerrainRoughness (Code, Description) VALUES (4, 'Flat, unobstructed areas');

INSERT INTO dbo.Torsion (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.Torsion (Code, Description) VALUES (1, 'Symmetric');
INSERT INTO dbo.Torsion (Code, Description) VALUES (2, 'Asymmetric');
INSERT INTO dbo.Torsion (Code, Description) VALUES (3, 'Corner building');

INSERT INTO dbo.TreeExposure (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.TreeExposure (Code, Description) VALUES (1, 'No');
INSERT INTO dbo.TreeExposure (Code, Description) VALUES (2, 'Yes');

INSERT INTO dbo.Units (Code, Description) VALUES (1, 'Feet (Distance)');
INSERT INTO dbo.Units (Code, Description) VALUES (11, 'Square feet (Area)');
INSERT INTO dbo.Units (Code, Description) VALUES (12, 'Square meters (Area)');
INSERT INTO dbo.Units (Code, Description) VALUES (13, 'Acre (Area)');
INSERT INTO dbo.Units (Code, Description) VALUES (14, 'Hectare (Area)');
INSERT INTO dbo.Units (Code, Description) VALUES (2, 'Meters (Distance)');
INSERT INTO dbo.Units (Code, Description) VALUES (3, 'Kilometers (Distance)');
INSERT INTO dbo.Units (Code, Description) VALUES (4, 'Miles (Distance)');

INSERT INTO dbo.ValuablesStorage (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.ValuablesStorage (Code, Description) VALUES (1, 'Vault');
INSERT INTO dbo.ValuablesStorage (Code, Description) VALUES (2, 'Safe');
INSERT INTO dbo.ValuablesStorage (Code, Description) VALUES (3, 'Strongbox');
INSERT INTO dbo.ValuablesStorage (Code, Description) VALUES (4, 'Unprotected exhibition');
INSERT INTO dbo.ValuablesStorage (Code, Description) VALUES (5, 'Protected exhibition (protection around specific art pieces)');
INSERT INTO dbo.ValuablesStorage (Code, Description) VALUES (6, 'Archive');
INSERT INTO dbo.ValuablesStorage (Code, Description) VALUES (7, 'Special facility');

INSERT INTO dbo.VoltageOfEnergy (Code, Description) VALUES (0, 'Unknown');
INSERT INTO dbo.VoltageOfEnergy (Code, Description) VALUES (1, 'Low Voltage (<115 KV) Substation');
INSERT INTO dbo.VoltageOfEnergy (Code, Description) VALUES (2, 'Medium Voltage (115-500 KV) Substation');
INSERT INTO dbo.VoltageOfEnergy (Code, Description) VALUES (3, 'High Voltage (>500 KV) Substation');

INSERT INTO dbo.WallAttachedStructure (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.WallAttachedStructure (Code, Description) VALUES (1, 'Carports / Canopies / Porches');
INSERT INTO dbo.WallAttachedStructure (Code, Description) VALUES (2, 'Single Door Garages');
INSERT INTO dbo.WallAttachedStructure (Code, Description) VALUES (3, 'Double Door Garages');
INSERT INTO dbo.WallAttachedStructure (Code, Description) VALUES (4, 'Reinforced Single Door Garages');
INSERT INTO dbo.WallAttachedStructure (Code, Description) VALUES (5, 'Reinforced Double Door Garages');
INSERT INTO dbo.WallAttachedStructure (Code, Description) VALUES (6, 'Screened Porches/Glass Patio Doors');
INSERT INTO dbo.WallAttachedStructure (Code, Description) VALUES (7, 'Balcony');
INSERT INTO dbo.WallAttachedStructure (Code, Description) VALUES (8, 'No attached wall structures');
INSERT INTO dbo.WallAttachedStructure (Code, Description) VALUES (9, 'Attached screen enclosure / Lanai');

INSERT INTO dbo.WindowProtection (Code, Description) VALUES (0, 'Unknown / default');
INSERT INTO dbo.WindowProtection (Code, Description) VALUES (1, 'No protection');
INSERT INTO dbo.WindowProtection (Code, Description) VALUES (2, 'Non-engineered shutters');
INSERT INTO dbo.WindowProtection (Code, Description) VALUES (3, 'Engineered shutters');
GO

