USE [master]
GO
/****** Object:  Database [OED]    Script Date: 09/04/2020 10:44:56 ******/
CREATE DATABASE [OED]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OED', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\OED.mdf' , SIZE = 4091328KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OED_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\OED_log.ldf' , SIZE = 1114120KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OED] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OED].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OED] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OED] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OED] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OED] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OED] SET ARITHABORT OFF 
GO
ALTER DATABASE [OED] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OED] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OED] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OED] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OED] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OED] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OED] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OED] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OED] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OED] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OED] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OED] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OED] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OED] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OED] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OED] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OED] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OED] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OED] SET  MULTI_USER 
GO
ALTER DATABASE [OED] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OED] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OED] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OED] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OED] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OED] SET QUERY_STORE = OFF
GO
USE [OED]
GO
/****** Object:  UserDefinedFunction [dbo].[BinaryToDecimal]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[BinaryToDecimal]
(
    @Input varchar(255)
)
RETURNS bigint
AS
BEGIN

    DECLARE @Cnt tinyint = 1
    DECLARE @Len tinyint = LEN(@Input)
    DECLARE @Output bigint = CAST(SUBSTRING(@Input, @Len, 1) AS bigint)

    WHILE(@Cnt < @Len) BEGIN
        SET @Output = @Output + POWER(CAST(SUBSTRING(@Input, @Len - @Cnt, 1) * 2 AS bigint), @Cnt)

        SET @Cnt = @Cnt + 1
    END

    RETURN @Output    

END

GO
/****** Object:  UserDefinedFunction [dbo].[DecimalToBinary]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[DecimalToBinary]
(
    @Input bigint
)
RETURNS varchar(255)
AS
BEGIN

    DECLARE @Output varchar(255) = ''

    WHILE @Input > 0 BEGIN

        SET @Output = @Output + CAST((@Input % 2) AS varchar)
        SET @Input = @Input / 2

    END

    RETURN REVERSE(@Output)

END

GO
/****** Object:  Table [dbo].[ConditionFinancials]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConditionFinancials](
	[CondFinID] [bigint] IDENTITY(1,1) NOT NULL,
	[CondID] [bigint] NOT NULL,
	[PerilCode] [int] NOT NULL,
	[DedCode] [tinyint] NOT NULL,
	[DedCov] [tinyint] NOT NULL,
	[DedType] [tinyint] NOT NULL,
	[Ded] [float] NOT NULL,
	[MinDed] [float] NOT NULL,
	[MaxDed] [float] NOT NULL,
	[LimitCode] [tinyint] NOT NULL,
	[LimitCov] [tinyint] NOT NULL,
	[LimitType] [tinyint] NOT NULL,
	[Limit] [float] NOT NULL,
 CONSTRAINT [PK_ConditionFinancials] PRIMARY KEY CLUSTERED 
(
	[CondFinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conditions]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conditions](
	[CondID] [bigint] IDENTITY(1,1) NOT NULL,
	[AccID] [bigint] NOT NULL,
	[CondNumber] [int] NOT NULL,
	[CondName] [varchar](40) NOT NULL,
	[Priority] [tinyint] NOT NULL,
	[Currency] [varchar](3) NOT NULL,
 CONSTRAINT [PK_Conditions] PRIMARY KEY CLUSTERED 
(
	[CondID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vConditionFinancials]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vConditionFinancials]
AS
SELECT        cond.CondID, ISNULL(condf.PerilCode, 0) as PerilCode, cond.Currency, 
	CASE WHEN condf.CondID IS NULL THEN 'No' ELSE 'Yes' END AS CondDedOrLimExists,
	ISNULL(SUM(CASE DedCov WHEN 1 THEN DedCode ELSE 0 END), 0) AS CondDedCode1Building, 
	ISNULL(SUM(CASE DedCov WHEN 1 THEN DedType ELSE 0 END), 0) AS CondDedType1Building, 
    ISNULL(SUM(CASE DedCov WHEN 1 THEN Ded ELSE 0 END), 0) AS CondDed1Building, 
	ISNULL(SUM(CASE DedCov WHEN 1 THEN MinDed ELSE 0 END), 0) AS CondMinDed1Building, 
	ISNULL(SUM(CASE DedCov WHEN 1 THEN MaxDed ELSE 0 END), 0) AS CondMaxDed1Building, 
    ISNULL(SUM(CASE DedCov WHEN 2 THEN DedCode ELSE 0 END), 0) AS CondDedCode2Other, 
	ISNULL(SUM(CASE DedCov WHEN 2 THEN DedType ELSE 0 END), 0) AS CondDedType2Other, 
	ISNULL(SUM(CASE DedCov WHEN 2 THEN Ded ELSE 0 END), 0) AS CondDed2Other, 
    ISNULL(SUM(CASE DedCov WHEN 2 THEN MinDed ELSE 0 END), 0) AS CondMinDed2Other, 
	ISNULL(SUM(CASE DedCov WHEN 2 THEN MaxDed ELSE 0 END), 0) AS CondMaxDed2Other, 
	ISNULL(SUM(CASE DedCov WHEN 3 THEN DedCode ELSE 0 END), 0) AS CondDedCode3Contents, 
	ISNULL(SUM(CASE DedCov WHEN 3 THEN DedType ELSE 0 END), 0) AS CondDedType3Contents, 
	ISNULL(SUM(CASE DedCov WHEN 3 THEN Ded ELSE 0 END), 0) AS CondDed3Contents, 
	ISNULL(SUM(CASE DedCov WHEN 3 THEN MinDed ELSE 0 END), 0) AS CondMinDed3Contents, 
	ISNULL(SUM(CASE DedCov WHEN 3 THEN MaxDed ELSE 0 END), 0) AS CondMaxDed3Contents, 
	ISNULL(SUM(CASE DedCov WHEN 4 THEN DedCode ELSE 0 END), 0) AS CondDedCode4BI, 
    ISNULL(SUM(CASE DedCov WHEN 4 THEN DedType ELSE 0 END), 0) AS CondDedType4BI, 
	ISNULL(SUM(CASE DedCov WHEN 4 THEN Ded ELSE 0 END), 0) AS CondDed4BI, 
	ISNULL(SUM(CASE DedCov WHEN 4 THEN MinDed ELSE 0 END), 0) AS CondMinDed4BI, 
    ISNULL(SUM(CASE DedCov WHEN 4 THEN MaxDed ELSE 0 END), 0) AS CondMaxDed4BI, 
	ISNULL(SUM(CASE DedCov WHEN 5 THEN DedCode ELSE 0 END), 0) AS CondDedCode5PD, 
	ISNULL(SUM(CASE DedCov WHEN 5 THEN DedType ELSE 0 END), 0) AS CondDedType5PD, 
	ISNULL(SUM(CASE DedCov WHEN 5 THEN Ded ELSE 0 END), 0) AS CondDed5PD, 
	ISNULL(SUM(CASE DedCov WHEN 5 THEN MinDed ELSE 0 END), 0) AS CondMinDed5PD, 
	ISNULL(SUM(CASE DedCov WHEN 5 THEN MaxDed ELSE 0 END), 0) AS CondMaxDed5PD, 
	ISNULL(SUM(CASE DedCov WHEN 6 THEN DedCode ELSE 0 END), 0) AS CondDedCode6All, 
	ISNULL(SUM(CASE DedCov WHEN 6 THEN DedType ELSE 0 END), 0) AS CondDedType6All, 
    ISNULL(SUM(CASE DedCov WHEN 6 THEN Ded ELSE 0 END), 0) AS CondDed6All, 
	ISNULL(SUM(CASE DedCov WHEN 6 THEN MinDed ELSE 0 END), 0) AS CondMinDed6All, 
	ISNULL(SUM(CASE DedCov WHEN 6 THEN MaxDed ELSE 0 END), 0) AS CondMaxDed6All, 
    ISNULL(SUM(CASE LimitCov WHEN 1 THEN LimitCode ELSE 0 END), 0) AS CondLimitCode1Building,
	ISNULL(SUM(CASE LimitCov WHEN 1 THEN LimitType ELSE 0 END), 0) AS CondLimitType1Building, 
	ISNULL(SUM(CASE LimitCov WHEN 1 THEN Limit ELSE 0 END), 0) AS CondLimit1Building, 
	ISNULL(SUM(CASE LimitCov WHEN 2 THEN LimitCode ELSE 0 END), 0) AS CondLimitCode2Other, 
	ISNULL(SUM(CASE LimitCov WHEN 2 THEN LimitType ELSE 0 END), 0) AS CondLimitType2Other, 
    ISNULL(SUM(CASE LimitCov WHEN 2 THEN Limit ELSE 0 END), 0) AS CondLimit2Other, 
	ISNULL(SUM(CASE LimitCov WHEN 3 THEN LimitCode ELSE 0 END), 0) AS CondLimitCode3Contents, 
	ISNULL(SUM(CASE LimitCov WHEN 3 THEN LimitType ELSE 0 END), 0) AS CondLimitType3Contents, 
	ISNULL(SUM(CASE LimitCov WHEN 3 THEN Limit ELSE 0 END), 0) AS CondLimit3Contents, 
	ISNULL(SUM(CASE LimitCov WHEN 4 THEN LimitCode ELSE 0 END), 0) AS CondLimitCode4BI, 
    ISNULL(SUM(CASE LimitCov WHEN 4 THEN LimitType ELSE 0 END), 0) AS CondLimitType4BI, 
	ISNULL(SUM(CASE LimitCov WHEN 4 THEN Limit ELSE 0 END), 0) AS CondLimit4BI, 
	ISNULL(SUM(CASE LimitCov WHEN 5 THEN LimitCode ELSE 0 END), 0) AS CondLimitCode5PD, 
	ISNULL(SUM(CASE LimitCov WHEN 5 THEN LimitType ELSE 0 END), 0) AS CondLimitType5PD, 
	ISNULL(SUM(CASE LimitCov WHEN 5 THEN Limit ELSE 0 END), 0) AS CondLimit5PD, 
    ISNULL(SUM(CASE LimitCov WHEN 6 THEN LimitCode ELSE 0 END), 0) AS CondLimitCode6All, 
	ISNULL(SUM(CASE LimitCov WHEN 6 THEN LimitType ELSE 0 END), 0) AS CondLimitType6All, 
	ISNULL(SUM(CASE LimitCov WHEN 6 THEN Limit ELSE 0 END), 0) AS CondLimit6All
FROM  Conditions Cond LEFT JOIN  dbo.ConditionFinancials condf
	ON cond.CondID = condf.CondID
GROUP BY cond.CondID, ISNULL(condf.PerilCode, 0), Cond.Currency, 
	CASE WHEN Condf.CondID IS NULL THEN 'No' ELSE 'Yes' END



GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccID] [bigint] IDENTITY(1,1) NOT NULL,
	[AccNumber] [nvarchar](40) NOT NULL,
	[AccName] [nvarchar](100) NOT NULL,
	[AccGroup] [varchar](40) NULL,
	[AccStatus] [char](1) NOT NULL,
	[ExpiringAccNumber] [nvarchar](40) NULL,
	[CedantID] [bigint] NULL,
	[Currency] [varchar](3) NOT NULL,
	[AccUserDef1] [varchar](20) NULL,
	[AccUserDef2] [varchar](20) NULL,
	[AccUserDef3] [varchar](20) NULL,
	[AccUserDef4] [varchar](20) NULL,
	[AccUserDef5] [varchar](20) NULL,
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[AccID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocCond]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocCond](
	[PolID] [bigint] NOT NULL,
	[LocID] [bigint] NOT NULL,
	[CondID] [bigint] NOT NULL,
 CONSTRAINT [PK_LocCond] PRIMARY KEY CLUSTERED 
(
	[PolID] ASC,
	[LocID] ASC,
	[CondID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policies]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policies](
	[PolID] [bigint] IDENTITY(1,1) NOT NULL,
	[AccID] [bigint] NOT NULL,
	[PolNumber] [varchar](20) NOT NULL,
	[PolStatus] [char](1) NOT NULL,
	[LayerNumber] [int] NOT NULL,
	[InceptionDate] [smalldatetime] NULL,
	[ExpiryDate] [smalldatetime] NULL,
	[ProducerID] [bigint] NULL,
	[Underwriter] [varchar](40) NULL,
	[BranchName] [varchar](20) NULL,
	[LOBID] [bigint] NULL,
	[ExpiringPolNumber] [varchar](20) NULL,
	[PerilsCovered] [int] NOT NULL,
	[GrossPremium] [float] NOT NULL,
	[Tax] [float] NOT NULL,
	[Brokerage] [float] NOT NULL,
	[NetPremium] [float] NOT NULL,
	[LayerParticipation] [float] NOT NULL,
	[LayerLimit] [float] NOT NULL,
	[LayerAttachment] [float] NOT NULL,
	[Currency] [varchar](3) NOT NULL,
	[HoursClause] [int] NULL,
	[PolUserDef1] [varchar](20) NULL,
	[PolUserDef2] [varchar](20) NULL,
	[PolUserDef3] [varchar](20) NULL,
	[PolUserDef4] [varchar](20) NULL,
	[PolUserDef5] [varchar](20) NULL,
 CONSTRAINT [PK_Layers] PRIMARY KEY CLUSTERED 
(
	[PolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vCondPerPolicy]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vCondPerPolicy]
AS
SELECT distinct pol.PolID, vcondf.PerilCode, cond.CondID, cond.CondNumber, cond.CondName,
	vcondf.Currency, vcondf.CondDedOrLimExists, 
	vcondf.CondDedCode1Building, vcondf.CondDedType1Building, vcondf.CondDed1Building, 
	vcondf.CondMinDed1Building, vcondf.CondMaxDed1Building,
	vcondf.CondDedCode2Other, vcondf.CondDedType2Other, vcondf.CondDed2Other, 
	vcondf.CondMinDed2Other, vcondf.CondMaxDed2Other,
	vcondf.CondDedCode3Contents, vcondf.CondDedType3Contents, vcondf.CondDed3Contents, 
	vcondf.CondMinDed3Contents, vcondf.CondMaxDed3Contents,
	vcondf.CondDedCode4BI, vcondf.CondDedType4BI, vcondf.CondDed4BI, vcondf.CondMinDed4BI, vcondf.CondMaxDed4BI,
	vcondf.CondDedCode5PD, vcondf.CondDedType5PD, vcondf.CondDed5PD, vcondf.CondMinDed5PD, vcondf.CondMaxDed5PD,
	vcondf.CondDedCode6All, vcondf.CondDedType6All, vcondf.CondDed6All, vcondf.CondMinDed6All, vcondf.CondMaxDed6All,
	vcondf.CondLimitCode1Building, vcondf.CondLimitType1Building, vcondf.CondLimit1Building, 
	vcondf.CondLimitCode2Other, vcondf.CondLimitType2Other, vcondf.CondLimit2Other,
	vcondf.CondLimitCode3Contents, vcondf.CondLimitType3Contents, vcondf.CondLimit3Contents, 
	vcondf.CondLimitCode4BI, vcondf.CondLimitType4BI, vcondf.CondLimit4BI,
	vcondf.CondLimitCode5PD, vcondf.CondLimitType5PD, vcondf.CondLimit5PD, 
	vcondf.CondLimitCode6All, vcondf.CondLimitType6All, vcondf.CondLimit6All
FROM Accounts acc INNER JOIN Policies pol 
	ON acc.AccID = pol.AccID
		INNER JOIN Conditions cond 
	ON acc.AccID = cond.AccID
		INNER JOIN vConditionFinancials vcondf
	ON cond.CondID = vcondf.CondID
		INNER JOIN LocCond lc
	ON cond.CondID = lc.CondID and pol.PolID = lc.PolID



GO
/****** Object:  Table [dbo].[AccountFinancials]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountFinancials](
	[AccFinID] [bigint] IDENTITY(1,1) NOT NULL,
	[AccID] [bigint] NOT NULL,
	[PerilCode] [int] NOT NULL,
	[DedCode] [tinyint] NOT NULL,
	[DedCov] [tinyint] NOT NULL,
	[DedType] [tinyint] NOT NULL,
	[Ded] [float] NOT NULL,
	[MinDed] [float] NOT NULL,
	[MaxDed] [float] NOT NULL,
	[LimitCode] [tinyint] NOT NULL,
	[LimitCov] [tinyint] NOT NULL,
	[LimitType] [tinyint] NOT NULL,
	[Limit] [float] NOT NULL,
 CONSTRAINT [PK_AccountFinancials] PRIMARY KEY CLUSTERED 
(
	[AccFinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vAccountFinancials]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vAccountFinancials]
AS
SELECT        acc.AccID, ISNULL(PerilCode, 0) AS PerilCode, Acc.Currency, 
	CASE WHEN accf.AccID IS NULL THEN 'No' ELSE 'Yes' END AS DedOrLimExists,
	ISNULL(SUM(CASE DedCov WHEN 1 THEN DedCode ELSE 0 END), 0) AS AccDedCode1Building, 
	ISNULL(SUM(CASE DedCov WHEN 1 THEN DedType ELSE 0 END), 0) AS AccDedType1Building, 
    ISNULL(SUM(CASE DedCov WHEN 1 THEN Ded ELSE 0 END), 0) AS AccDed1Building, 
	ISNULL(SUM(CASE DedCov WHEN 1 THEN MinDed ELSE 0 END), 0) AS AccMinDed1Building, 
	ISNULL(SUM(CASE DedCov WHEN 1 THEN MaxDed ELSE 0 END), 0) AS AccMaxDed1Building, 
    ISNULL(SUM(CASE DedCov WHEN 2 THEN DedCode ELSE 0 END), 0) AS AccDedCode2Other, 
	ISNULL(SUM(CASE DedCov WHEN 2 THEN DedType ELSE 0 END), 0) AS AccDedType2Other, 
	ISNULL(SUM(CASE DedCov WHEN 2 THEN Ded ELSE 0 END), 0) AS AccDed2Other, 
    ISNULL(SUM(CASE DedCov WHEN 2 THEN MinDed ELSE 0 END), 0) AS AccMinDed2Other, 
	ISNULL(SUM(CASE DedCov WHEN 2 THEN MaxDed ELSE 0 END), 0) AS AccMaxDed2Other, 
	ISNULL(SUM(CASE DedCov WHEN 3 THEN DedCode ELSE 0 END), 0) AS AccDedCode3Contents, 
	ISNULL(SUM(CASE DedCov WHEN 3 THEN DedType ELSE 0 END), 0) AS AccDedType3Contents, 
	ISNULL(SUM(CASE DedCov WHEN 3 THEN Ded ELSE 0 END), 0) AS AccDed3Contents, 
	ISNULL(SUM(CASE DedCov WHEN 3 THEN MinDed ELSE 0 END), 0) AS AccMinDed3Contents, 
	ISNULL(SUM(CASE DedCov WHEN 3 THEN MaxDed ELSE 0 END), 0) AS AccMaxDed3Contents, 
	ISNULL(SUM(CASE DedCov WHEN 4 THEN DedCode ELSE 0 END), 0) AS AccDedCode4BI, 
    ISNULL(SUM(CASE DedCov WHEN 4 THEN DedType ELSE 0 END), 0) AS AccDedType4BI, 
	ISNULL(SUM(CASE DedCov WHEN 4 THEN Ded ELSE 0 END), 0) AS AccDed4BI, 
	ISNULL(SUM(CASE DedCov WHEN 4 THEN MinDed ELSE 0 END), 0) AS AccMinDed4BI, 
    ISNULL(SUM(CASE DedCov WHEN 4 THEN MaxDed ELSE 0 END), 0) AS AccMaxDed4BI, 
	ISNULL(SUM(CASE DedCov WHEN 5 THEN DedCode ELSE 0 END), 0) AS AccDedCode5PD, 
	ISNULL(SUM(CASE DedCov WHEN 5 THEN DedType ELSE 0 END), 0) AS AccDedType5PD, 
	ISNULL(SUM(CASE DedCov WHEN 5 THEN Ded ELSE 0 END), 0) AS AccDed5PD, 
	ISNULL(SUM(CASE DedCov WHEN 5 THEN MinDed ELSE 0 END), 0) AS AccMinDed5PD, 
	ISNULL(SUM(CASE DedCov WHEN 5 THEN MaxDed ELSE 0 END), 0) AS AccMaxDed5PD, 
	ISNULL(SUM(CASE DedCov WHEN 6 THEN DedCode ELSE 0 END), 0) AS AccDedCode6All, 
	ISNULL(SUM(CASE DedCov WHEN 6 THEN DedType ELSE 0 END), 0) AS AccDedType6All, 
    ISNULL(SUM(CASE DedCov WHEN 6 THEN Ded ELSE 0 END), 0) AS AccDed6All, 
	ISNULL(SUM(CASE DedCov WHEN 6 THEN MinDed ELSE 0 END), 0) AS AccMinDed6All, 
	ISNULL(SUM(CASE DedCov WHEN 6 THEN MaxDed ELSE 0 END), 0) AS AccMaxDed6All, 
    ISNULL(SUM(CASE LimitCov WHEN 1 THEN LimitCode ELSE 0 END), 0) AS AccLimitCode1Building,
	ISNULL(SUM(CASE LimitCov WHEN 1 THEN LimitType ELSE 0 END), 0) AS AccLimitType1Building, 
	ISNULL(SUM(CASE LimitCov WHEN 1 THEN Limit ELSE 0 END), 0) AS AccLimit1Building, 
	ISNULL(SUM(CASE LimitCov WHEN 2 THEN LimitCode ELSE 0 END), 0) AS AccLimitCode2Other, 
	ISNULL(SUM(CASE LimitCov WHEN 2 THEN LimitType ELSE 0 END), 0) AS AccLimitType2Other, 
    ISNULL(SUM(CASE LimitCov WHEN 2 THEN Limit ELSE 0 END), 0) AS AccLimit2Other, 
	ISNULL(SUM(CASE LimitCov WHEN 3 THEN LimitCode ELSE 0 END), 0) AS AccLimitCode3Contents, 
	ISNULL(SUM(CASE LimitCov WHEN 3 THEN LimitType ELSE 0 END), 0) AS AccLimitType3Contents, 
	ISNULL(SUM(CASE LimitCov WHEN 3 THEN Limit ELSE 0 END), 0) AS AccLimit3Contents, 
	ISNULL(SUM(CASE LimitCov WHEN 4 THEN LimitCode ELSE 0 END), 0) AS AccLimitCode4BI, 
    ISNULL(SUM(CASE LimitCov WHEN 4 THEN LimitType ELSE 0 END), 0) AS AccLimitType4BI, 
	ISNULL(SUM(CASE LimitCov WHEN 4 THEN Limit ELSE 0 END), 0) AS AccLimit4BI, 
	ISNULL(SUM(CASE LimitCov WHEN 5 THEN LimitCode ELSE 0 END), 0) AS AccLimitCode5PD, 
	ISNULL(SUM(CASE LimitCov WHEN 5 THEN LimitType ELSE 0 END), 0) AS AccLimitType5PD, 
	ISNULL(SUM(CASE LimitCov WHEN 5 THEN Limit ELSE 0 END), 0) AS AccLimit5PD, 
    ISNULL(SUM(CASE LimitCov WHEN 6 THEN LimitCode ELSE 0 END), 0) AS AccLimitCode6All, 
	ISNULL(SUM(CASE LimitCov WHEN 6 THEN LimitType ELSE 0 END), 0) AS AccLimitType6All, 
	ISNULL(SUM(CASE LimitCov WHEN 6 THEN Limit ELSE 0 END), 0) AS AccLimit6All
FROM  Accounts acc LEFT JOIN  dbo.AccountFinancials accf
	ON acc.AccID = accf.AccID
GROUP BY acc.AccID, ISNULL(PerilCode, 0), Acc.Currency, CASE WHEN accf.AccID IS NULL THEN 'No' ELSE 'Yes' END



GO
/****** Object:  Table [dbo].[LocationFinancials]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationFinancials](
	[LocFinID] [bigint] IDENTITY(1,1) NOT NULL,
	[LocID] [bigint] NOT NULL,
	[PerilCode] [int] NOT NULL,
	[DedCode] [tinyint] NOT NULL,
	[DedCov] [tinyint] NOT NULL,
	[DedType] [tinyint] NOT NULL,
	[Ded] [float] NOT NULL,
	[MinDed] [float] NOT NULL,
	[MaxDed] [float] NOT NULL,
	[BIWaitingPeriod] [smallint] NOT NULL,
	[LimitCode] [tinyint] NOT NULL,
	[LimitCov] [tinyint] NOT NULL,
	[LimitType] [tinyint] NOT NULL,
	[Limit] [float] NOT NULL,
 CONSTRAINT [PK_LocationFinancials] PRIMARY KEY CLUSTERED 
(
	[LocFinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocID] [bigint] IDENTITY(1,1) NOT NULL,
	[AccID] [bigint] NOT NULL,
	[LocNumber] [nvarchar](20) NOT NULL,
	[LocName] [nvarchar](20) NULL,
	[LocGroup] [nvarchar](20) NULL,
	[CorrelationGroup] [int] NULL,
	[IsPrimary] [bit] NOT NULL,
	[IsTenant] [bit] NOT NULL,
	[BuildingID] [varchar](20) NULL,
	[LocInceptionDate] [smalldatetime] NULL,
	[LocExpiryDate] [smalldatetime] NULL,
	[PercentComplete] [decimal](7, 6) NOT NULL,
	[CompletionDate] [date] NULL,
	[CountryCode] [char](2) NOT NULL,
	[Latitude] [decimal](12, 8) NOT NULL,
	[Longitude] [decimal](12, 8) NOT NULL,
	[StreetAddress] [nvarchar](100) NULL,
	[PostalCode] [nvarchar](20) NULL,
	[City] [nvarchar](50) NULL,
	[AreaCode] [nvarchar](20) NULL,
	[AreaName] [nvarchar](50) NULL,
	[GeogScheme1] [varchar](5) NULL,
	[GeogName1] [nvarchar](50) NULL,
	[GeogScheme2] [varchar](5) NULL,
	[GeogName2] [nvarchar](50) NULL,
	[GeogScheme3] [varchar](5) NULL,
	[GeogName3] [nvarchar](50) NULL,
	[GeogScheme4] [varchar](5) NULL,
	[GeogName4] [nvarchar](50) NULL,
	[GeogScheme5] [varchar](5) NULL,
	[GeogName5] [nvarchar](50) NULL,
	[AddressMatch] [tinyint] NOT NULL,
	[GeocodeQuality] [float] NULL,
	[Geocoder] [varchar](20) NULL,
	[OrgOccupancyScheme] [varchar](10) NULL,
	[OrgOccupancyCode] [varchar](100) NULL,
	[OrgConstructionScheme] [varchar](10) NULL,
	[OrgConstructionCode] [varchar](100) NULL,
	[OccupancyCode] [smallint] NOT NULL,
	[ConstructionCode] [smallint] NOT NULL,
	[YearBuilt] [smallint] NOT NULL,
	[NumberOfStoreys] [tinyint] NOT NULL,
	[NumberOfBuildings] [int] NOT NULL,
	[FloorArea] [float] NOT NULL,
	[FloorAreaUnit] [tinyint] NOT NULL,
	[LocUserDef1] [varchar](20) NULL,
	[LocUserDef2] [varchar](20) NULL,
	[LocUserDef3] [varchar](20) NULL,
	[LocUserDef4] [varchar](20) NULL,
	[LocUserDef5] [varchar](20) NULL,
	[PerilsCovered] [int] NOT NULL,
	[BuildingTIV] [float] NOT NULL,
	[OtherTIV] [float] NOT NULL,
	[ContentsTIV] [float] NOT NULL,
	[BITIV] [float] NOT NULL,
	[BIPOI] [float] NOT NULL,
	[Currency] [varchar](3) NOT NULL,
	[GrossPremium] [float] NOT NULL,
	[Tax] [float] NOT NULL,
	[Brokerage] [float] NOT NULL,
	[NetPremium] [float] NOT NULL,
	[NonCatGroundUpLoss] [float] NOT NULL,
	[Participation] [float] NOT NULL,
	[PayoutBasis] [tinyint] NOT NULL,
	[ReinsTag] [varchar](20) NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vLocationFinancials]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vLocationFinancials]
AS
SELECT        loc.LocID, ISNULL(locf.PerilCode, loc.PerilsCovered) as PerilCode, Loc.Currency, 
	CASE WHEN locf.LocID IS NULL THEN 'No' ELSE 'Yes' END as DedOrLimExists,
	ISNULL(SUM(CASE DedCov WHEN 1 THEN DedCode ELSE 0 END), 0) AS LocDedCode1Building, 
	ISNULL(SUM(CASE DedCov WHEN 1 THEN DedType ELSE 0 END), 0) AS LocDedType1Building, 
    ISNULL(SUM(CASE DedCov WHEN 1 THEN Ded ELSE 0 END), 0) AS LocDed1Building, 
	ISNULL(SUM(CASE DedCov WHEN 1 THEN MinDed ELSE 0 END), 0) AS LocMinDed1Building, 
	ISNULL(SUM(CASE DedCov WHEN 1 THEN MaxDed ELSE 0 END), 0) AS LocMaxDed1Building, 
    ISNULL(SUM(CASE DedCov WHEN 2 THEN DedCode ELSE 0 END), 0) AS LocDedCode2Other, 
	ISNULL(SUM(CASE DedCov WHEN 2 THEN DedType ELSE 0 END), 0) AS LocDedType2Other, 
	ISNULL(SUM(CASE DedCov WHEN 2 THEN Ded ELSE 0 END), 0) AS LocDed2Other, 
    ISNULL(SUM(CASE DedCov WHEN 2 THEN MinDed ELSE 0 END), 0) AS LocMinDed2Other, 
	ISNULL(SUM(CASE DedCov WHEN 2 THEN MaxDed ELSE 0 END), 0) AS LocMaxDed2Other, 
	ISNULL(SUM(CASE DedCov WHEN 3 THEN DedCode ELSE 0 END), 0) AS LocDedCode3Contents, 
	ISNULL(SUM(CASE DedCov WHEN 3 THEN DedType ELSE 0 END), 0) AS LocDedType3Contents, 
	ISNULL(SUM(CASE DedCov WHEN 3 THEN Ded ELSE 0 END), 0) AS LocDed3Contents, 
	ISNULL(SUM(CASE DedCov WHEN 3 THEN MinDed ELSE 0 END), 0) AS LocMinDed3Contents, 
	ISNULL(SUM(CASE DedCov WHEN 3 THEN MaxDed ELSE 0 END), 0) AS LocMaxDed3Contents, 
	ISNULL(SUM(CASE DedCov WHEN 4 THEN DedCode ELSE 0 END), 0) AS LocDedCode4BI, 
    ISNULL(SUM(CASE DedCov WHEN 4 THEN DedType ELSE 0 END), 0) AS LocDedType4BI, 
	ISNULL(SUM(CASE DedCov WHEN 4 THEN Ded ELSE 0 END), 0) AS LocDed4BI, 
	ISNULL(SUM(CASE DedCov WHEN 4 THEN MinDed ELSE 0 END), 0) AS LocMinDed4BI, 
    ISNULL(SUM(CASE DedCov WHEN 4 THEN MaxDed ELSE 0 END), 0) AS LocMaxDed4BI, 
	ISNULL(SUM(CASE DedCov WHEN 5 THEN DedCode ELSE 0 END), 0) AS LocDedCode5PD, 
	ISNULL(SUM(CASE DedCov WHEN 5 THEN DedType ELSE 0 END), 0) AS LocDedType5PD, 
	ISNULL(SUM(CASE DedCov WHEN 5 THEN Ded ELSE 0 END), 0) AS LocDed5PD, 
	ISNULL(SUM(CASE DedCov WHEN 5 THEN MinDed ELSE 0 END), 0) AS LocMinDed5PD, 
	ISNULL(SUM(CASE DedCov WHEN 5 THEN MaxDed ELSE 0 END), 0) AS LocMaxDed5PD, 
	ISNULL(SUM(CASE DedCov WHEN 6 THEN DedCode ELSE 0 END), 0) AS LocDedCode6All, 
	ISNULL(SUM(CASE DedCov WHEN 6 THEN DedType ELSE 0 END), 0) AS LocDedType6All, 
    ISNULL(SUM(CASE DedCov WHEN 6 THEN Ded ELSE 0 END), 0) AS LocDed6All, 
	ISNULL(SUM(CASE DedCov WHEN 6 THEN MinDed ELSE 0 END), 0) AS LocMinDed6All, 
	ISNULL(SUM(CASE DedCov WHEN 6 THEN MaxDed ELSE 0 END), 0) AS LocMaxDed6All,
	ISNULL(MAX(BIWaitingPeriod), 0) AS BIWaitingPeriod,
    ISNULL(SUM(CASE LimitCov WHEN 1 THEN LimitCode ELSE 0 END), 0) AS LocLimitCode1Building,
	ISNULL(SUM(CASE LimitCov WHEN 1 THEN LimitType ELSE 0 END), 0) AS LocLimitType1Building, 
	ISNULL(SUM(CASE LimitCov WHEN 1 THEN Limit ELSE 0 END), 0) AS LocLimit1Building, 
	ISNULL(SUM(CASE LimitCov WHEN 2 THEN LimitCode ELSE 0 END), 0) AS LocLimitCode2Other, 
	ISNULL(SUM(CASE LimitCov WHEN 2 THEN LimitType ELSE 0 END), 0) AS LocLimitType2Other, 
    ISNULL(SUM(CASE LimitCov WHEN 2 THEN Limit ELSE 0 END), 0) AS LocLimit2Other, 
	ISNULL(SUM(CASE LimitCov WHEN 3 THEN LimitCode ELSE 0 END), 0) AS LocLimitCode3Contents, 
	ISNULL(SUM(CASE LimitCov WHEN 3 THEN LimitType ELSE 0 END), 0) AS LocLimitType3Contents, 
	ISNULL(SUM(CASE LimitCov WHEN 3 THEN Limit ELSE 0 END), 0) AS LocLimit3Contents, 
	ISNULL(SUM(CASE LimitCov WHEN 4 THEN LimitCode ELSE 0 END), 0) AS LocLimitCode4BI, 
    ISNULL(SUM(CASE LimitCov WHEN 4 THEN LimitType ELSE 0 END), 0) AS LocLimitType4BI, 
	ISNULL(SUM(CASE LimitCov WHEN 4 THEN Limit ELSE 0 END), 0) AS LocLimit4BI, 
	ISNULL(SUM(CASE LimitCov WHEN 5 THEN LimitCode ELSE 0 END), 0) AS LocLimitCode5PD, 
	ISNULL(SUM(CASE LimitCov WHEN 5 THEN LimitType ELSE 0 END), 0) AS LocLimitType5PD, 
	ISNULL(SUM(CASE LimitCov WHEN 5 THEN Limit ELSE 0 END), 0) AS LocLimit5PD, 
    ISNULL(SUM(CASE LimitCov WHEN 6 THEN LimitCode ELSE 0 END), 0) AS LocLimitCode6All, 
	ISNULL(SUM(CASE LimitCov WHEN 6 THEN LimitType ELSE 0 END), 0) AS LocLimitType6All, 
	ISNULL(SUM(CASE LimitCov WHEN 6 THEN Limit ELSE 0 END), 0) AS LocLimit6All
FROM  Locations loc LEFT JOIN LocationFinancials locf
	ON loc.LocID = locf.LocID
GROUP BY loc.LocID, ISNULL(locf.PerilCode, loc.PerilsCovered), loc.Currency, 
	CASE WHEN locf.LocID IS NULL THEN 'No' ELSE 'Yes' END



GO
/****** Object:  View [dbo].[vLocCond]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vLocCond]
AS
SELECT distinct LocID, CondID
FROM LocCond




GO
/****** Object:  Table [dbo].[PolicyFinancials]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PolicyFinancials](
	[PolFinID] [bigint] IDENTITY(1,1) NOT NULL,
	[PolID] [bigint] NOT NULL,
	[PerilCode] [int] NOT NULL,
	[DedCode] [tinyint] NOT NULL,
	[DedCov] [tinyint] NOT NULL,
	[DedType] [tinyint] NOT NULL,
	[Ded] [float] NOT NULL,
	[MinDed] [float] NOT NULL,
	[MaxDed] [float] NOT NULL,
	[LimitCode] [tinyint] NOT NULL,
	[LimitCov] [tinyint] NOT NULL,
	[LimitType] [tinyint] NOT NULL,
	[Limit] [float] NOT NULL,
 CONSTRAINT [PK_PolicyFinancials] PRIMARY KEY CLUSTERED 
(
	[PolFinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vPolicyFinancials]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vPolicyFinancials]
AS
SELECT        pol.AccID, pol.PolID, ISNULL(polf.PerilCode, pol.PerilsCovered) as PerilCode, Acc.Currency, 
	CASE WHEN polf.PolID IS NULL THEN 'No' ELSE 'Yes' END AS DedOrLimExists,
	ISNULL(SUM(CASE DedCov WHEN 1 THEN DedCode ELSE 0 END), 0) AS PolDedCode1Building, 
	ISNULL(SUM(CASE DedCov WHEN 1 THEN DedType ELSE 0 END), 0) AS PolDedType1Building, 
    ISNULL(SUM(CASE DedCov WHEN 1 THEN Ded ELSE 0 END), 0) AS PolDed1Building, 
	ISNULL(SUM(CASE DedCov WHEN 1 THEN MinDed ELSE 0 END), 0) AS PolMinDed1Building, 
	ISNULL(SUM(CASE DedCov WHEN 1 THEN MaxDed ELSE 0 END), 0) AS PolMaxDed1Building, 
    ISNULL(SUM(CASE DedCov WHEN 2 THEN DedCode ELSE 0 END), 0) AS PolDedCode2Other, 
	ISNULL(SUM(CASE DedCov WHEN 2 THEN DedType ELSE 0 END), 0) AS PolDedType2Other, 
	ISNULL(SUM(CASE DedCov WHEN 2 THEN Ded ELSE 0 END), 0) AS PolDed2Other, 
    ISNULL(SUM(CASE DedCov WHEN 2 THEN MinDed ELSE 0 END), 0) AS PolMinDed2Other, 
	ISNULL(SUM(CASE DedCov WHEN 2 THEN MaxDed ELSE 0 END), 0) AS PolMaxDed2Other, 
	ISNULL(SUM(CASE DedCov WHEN 3 THEN DedCode ELSE 0 END), 0) AS PolDedCode3Contents, 
	ISNULL(SUM(CASE DedCov WHEN 3 THEN DedType ELSE 0 END), 0) AS PolDedType3Contents, 
	ISNULL(SUM(CASE DedCov WHEN 3 THEN Ded ELSE 0 END), 0) AS PolDed3Contents, 
	ISNULL(SUM(CASE DedCov WHEN 3 THEN MinDed ELSE 0 END), 0) AS PolMinDed3Contents, 
	ISNULL(SUM(CASE DedCov WHEN 3 THEN MaxDed ELSE 0 END), 0) AS PolMaxDed3Contents, 
	ISNULL(SUM(CASE DedCov WHEN 4 THEN DedCode ELSE 0 END), 0) AS PolDedCode4BI, 
    ISNULL(SUM(CASE DedCov WHEN 4 THEN DedType ELSE 0 END), 0) AS PolDedType4BI, 
	ISNULL(SUM(CASE DedCov WHEN 4 THEN Ded ELSE 0 END), 0) AS PolDed4BI, 
	ISNULL(SUM(CASE DedCov WHEN 4 THEN MinDed ELSE 0 END), 0) AS PolMinDed4BI, 
    ISNULL(SUM(CASE DedCov WHEN 4 THEN MaxDed ELSE 0 END), 0) AS PolMaxDed4BI, 
	ISNULL(SUM(CASE DedCov WHEN 5 THEN DedCode ELSE 0 END), 0) AS PolDedCode5PD, 
	ISNULL(SUM(CASE DedCov WHEN 5 THEN DedType ELSE 0 END), 0) AS PolDedType5PD, 
	ISNULL(SUM(CASE DedCov WHEN 5 THEN Ded ELSE 0 END), 0) AS PolDed5PD, 
	ISNULL(SUM(CASE DedCov WHEN 5 THEN MinDed ELSE 0 END), 0) AS PolMinDed5PD, 
	ISNULL(SUM(CASE DedCov WHEN 5 THEN MaxDed ELSE 0 END), 0) AS PolMaxDed5PD, 
	ISNULL(SUM(CASE DedCov WHEN 6 THEN DedCode ELSE 0 END), 0) AS PolDedCode6All, 
	ISNULL(SUM(CASE DedCov WHEN 6 THEN DedType ELSE 0 END), 0) AS PolDedType6All, 
    ISNULL(SUM(CASE DedCov WHEN 6 THEN Ded ELSE 0 END), 0) AS PolDed6All, 
	ISNULL(SUM(CASE DedCov WHEN 6 THEN MinDed ELSE 0 END), 0) AS PolMinDed6All, 
	ISNULL(SUM(CASE DedCov WHEN 6 THEN MaxDed ELSE 0 END), 0) AS PolMaxDed6All, 
    ISNULL(SUM(CASE LimitCov WHEN 1 THEN LimitCode ELSE 0 END), 0) AS PolLimitCode1Building,
	ISNULL(SUM(CASE LimitCov WHEN 1 THEN LimitType ELSE 0 END), 0) AS PolLimitType1Building, 
	ISNULL(SUM(CASE LimitCov WHEN 1 THEN Limit ELSE 0 END), 0) AS PolLimit1Building, 
	ISNULL(SUM(CASE LimitCov WHEN 2 THEN LimitCode ELSE 0 END), 0) AS PolLimitCode2Other, 
	ISNULL(SUM(CASE LimitCov WHEN 2 THEN LimitType ELSE 0 END), 0) AS PolLimitType2Other, 
    ISNULL(SUM(CASE LimitCov WHEN 2 THEN Limit ELSE 0 END), 0) AS PolLimit2Other, 
	ISNULL(SUM(CASE LimitCov WHEN 3 THEN LimitCode ELSE 0 END), 0) AS PolLimitCode3Contents, 
	ISNULL(SUM(CASE LimitCov WHEN 3 THEN LimitType ELSE 0 END), 0) AS PolLimitType3Contents, 
	ISNULL(SUM(CASE LimitCov WHEN 3 THEN Limit ELSE 0 END), 0) AS PolLimit3Contents, 
	ISNULL(SUM(CASE LimitCov WHEN 4 THEN LimitCode ELSE 0 END), 0) AS PolLimitCode4BI, 
    ISNULL(SUM(CASE LimitCov WHEN 4 THEN LimitType ELSE 0 END), 0) AS PolLimitType4BI, 
	ISNULL(SUM(CASE LimitCov WHEN 4 THEN Limit ELSE 0 END), 0) AS PolLimit4BI, 
	ISNULL(SUM(CASE LimitCov WHEN 5 THEN LimitCode ELSE 0 END), 0) AS PolLimitCode5PD, 
	ISNULL(SUM(CASE LimitCov WHEN 5 THEN LimitType ELSE 0 END), 0) AS PolLimitType5PD, 
	ISNULL(SUM(CASE LimitCov WHEN 5 THEN Limit ELSE 0 END), 0) AS PolLimit5PD, 
    ISNULL(SUM(CASE LimitCov WHEN 6 THEN LimitCode ELSE 0 END), 0) AS PolLimitCode6All, 
	ISNULL(SUM(CASE LimitCov WHEN 6 THEN LimitType ELSE 0 END), 0) AS PolLimitType6All, 
	ISNULL(SUM(CASE LimitCov WHEN 6 THEN Limit ELSE 0 END), 0) AS PolLimit6All
FROM  Accounts acc INNER JOIN Policies pol 
	ON acc.AccID = pol.AccID 
		LEFT JOIN  dbo.PolicyFinancials polf
	ON pol.PolID = polf.PolID
GROUP BY pol.AccID, pol.PolID, ISNULL(polf.PerilCode, pol.PerilsCovered), Acc.Currency, 
	CASE WHEN polf.PolID IS NULL THEN 'No' ELSE 'Yes' END



GO
/****** Object:  Table [dbo].[Steps]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Steps](
	[StepID] [bigint] IDENTITY(1,1) NOT NULL,
	[StepFuncID] [bigint] NOT NULL,
	[StepNumber] [tinyint] NOT NULL,
	[PayoutType] [tinyint] NOT NULL,
	[TriggerType] [tinyint] NOT NULL,
	[StepTriggerCov] [tinyint] NOT NULL,
	[TriggerStart] [float] NOT NULL,
	[TriggerEnd] [float] NOT NULL,
	[PayoutStart] [float] NOT NULL,
	[PayoutEnd] [float] NOT NULL,
	[Deductible] [float] NOT NULL,
	[PayoutLimit] [float] NOT NULL,
	[ExtraExpenseFactor] [float] NOT NULL,
	[ExtraExpenseLimit] [float] NOT NULL,
	[DebrisRemovalFactor] [float] NOT NULL,
	[MinimumTIV] [float] NOT NULL,
	[ScaleFactor] [float] NOT NULL,
	[IsLimitAtDamage] [bit] NOT NULL,
 CONSTRAINT [PK_Steps] PRIMARY KEY CLUSTERED 
(
	[StepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StepFunctions]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StepFunctions](
	[StepFuncID] [bigint] IDENTITY(1,1) NOT NULL,
	[PolID] [bigint] NOT NULL,
	[StepFunctionName] [varchar](30) NOT NULL,
	[StepTriggerType] [tinyint] NOT NULL,
	[PerilCode] [int] NOT NULL,
 CONSTRAINT [PK_StepFunctions] PRIMARY KEY CLUSTERED 
(
	[StepFuncID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vStepFunctions]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[vStepFunctions]
AS
SELECT        sf.PolID, sf.StepFunctionName, sf.PerilCode, s.StepNumber, sf.StepTriggerType, s.PayoutType, s.TriggerType,
	ISNULL(SUM(CASE WHEN s.StepTriggerCov = 1 AND sf.StepTriggerType in (1, 3, 4, 5) THEN s.TriggerStart ELSE 0 END), 0) 
		AS TriggerBuildingStart, 
	ISNULL(SUM(CASE WHEN s.StepTriggerCov = 1 AND sf.StepTriggerType in (1, 3, 4, 5) THEN s.TriggerEnd ELSE 0 END), 0) 
		AS TriggerBuildingEnd, 
    ISNULL(SUM(CASE WHEN s.StepTriggerCov = 1 AND sf.StepTriggerType in (1, 3, 4, 5) THEN Deductible ELSE 0 END), 0) 
		AS DeductibleBuilding,
	ISNULL(SUM(CASE WHEN s.StepTriggerCov = 1 AND sf.StepTriggerType in (1, 3, 4, 5) THEN s.PayoutStart ELSE 0 END), 0) 
		AS PayoutBuildingStart,
	ISNULL(SUM(CASE WHEN s.StepTriggerCov = 1 AND sf.StepTriggerType in (1, 3, 4, 5) THEN s.PayoutEnd ELSE 0 END), 0) 
		AS PayoutBuildingEnd,
	ISNULL(SUM(CASE WHEN s.StepTriggerCov = 1 AND sf.StepTriggerType in (1, 3, 4, 5) THEN s.PayoutLimit ELSE 0 END), 0) 
		AS PayOutLimitBuilding,
	ISNULL(SUM(CASE WHEN s.StepTriggerCov = 3 AND sf.StepTriggerType in (2, 3, 4, 5) THEN s.TriggerStart ELSE 0 END), 0) 
		AS TriggerContentsStart, 
	ISNULL(SUM(CASE WHEN s.StepTriggerCov = 3 AND sf.StepTriggerType in (2, 3, 4, 5) THEN s.TriggerEnd ELSE 0 END), 0) 
		AS TriggerContentsEnd, 
    ISNULL(SUM(CASE WHEN s.StepTriggerCov = 3 AND sf.StepTriggerType in (2, 3, 4, 5) THEN Deductible ELSE 0 END), 0) 
		AS DeductibleContents,
	ISNULL(SUM(CASE WHEN s.StepTriggerCov = 3 AND sf.StepTriggerType in (2, 3, 4, 5) THEN s.PayoutStart ELSE 0 END), 0) 
		AS PayOutContentsStart,
	ISNULL(SUM(CASE WHEN s.StepTriggerCov = 3 AND sf.StepTriggerType in (2, 3, 4, 5) THEN s.PayoutEnd ELSE 0 END), 0) 
		AS PayOutContentsEnd,
	ISNULL(SUM(CASE WHEN s.StepTriggerCov = 3 AND sf.StepTriggerType in (2, 3, 4, 5) THEN s.PayoutLimit ELSE 0 END), 0) 
		AS PayOutLimitContents,
	ISNULL(SUM(CASE WHEN s.StepTriggerCov = 5 AND sf.StepTriggerType = 3 THEN s.TriggerStart ELSE 0 END), 0) 
		AS TriggerBuildingContentsStart,
	ISNULL(SUM(CASE WHEN s.StepTriggerCov = 5 AND sf.StepTriggerType = 3 THEN s.TriggerEnd ELSE 0 END), 0) 
		AS TriggerBuildingContentsEnd,
	ISNULL(SUM(CASE WHEN s.StepTriggerCov = 5 AND sf.StepTriggerType = 3 THEN Deductible ELSE 0 END), 0) 
		AS DeductibleBuildingContents,
	ISNULL(SUM(CASE WHEN s.StepTriggerCov = 5 AND sf.StepTriggerType = 3 THEN s.PayoutStart ELSE 0 END), 0) 
		AS PayOutBuildingContentsStart,
	ISNULL(SUM(CASE WHEN s.StepTriggerCov = 5 AND sf.StepTriggerType = 3 THEN s.PayoutEnd ELSE 0 END), 0) 
		AS PayOutBuildingContentsEnd,
	ISNULL(SUM(CASE WHEN s.StepTriggerCov = 5 AND sf.StepTriggerType = 3 THEN s.PayoutLimit ELSE 0 END), 0) 
		AS PayOutLimitBuildingContents,
	s.ExtraExpenseFactor, s.ExtraExpenseLimit, s.DebrisRemovalFactor, s.MinimumTIV, s.ScaleFactor, s.IsLimitAtDamage
FROM  StepFunctions sf INNER JOIN Policies pol
	ON sf.PolID = pol.PolID INNER JOIN Steps s
	ON sf.StepFuncID = s.StepFuncID
GROUP BY sf.PolID, sf.StepFunctionName, sf.PerilCode, s.StepNumber, sf.StepTriggerType, s.PayoutType, s.TriggerType,
	s.ExtraExpenseFactor, s.ExtraExpenseLimit, s.DebrisRemovalFactor, s.MinimumTIV, s.ScaleFactor, s.IsLimitAtDamage




GO
/****** Object:  Table [dbo].[Cedants]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cedants](
	[CedantID] [bigint] IDENTITY(1,1) NOT NULL,
	[CedantName] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Cedants] PRIMARY KEY CLUSTERED 
(
	[CedantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlexiAcc]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlexiAcc](
	[FlexiAccID] [bigint] IDENTITY(1,1) NOT NULL,
	[AccID] [bigint] NOT NULL,
	[ModifierName] [varchar](40) NOT NULL,
	[ModifierValue] [varchar](40) NOT NULL,
 CONSTRAINT [PK_FlexiAcc] PRIMARY KEY CLUSTERED 
(
	[FlexiAccID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlexiLoc]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlexiLoc](
	[FlexiLocID] [bigint] IDENTITY(1,1) NOT NULL,
	[LocID] [bigint] NOT NULL,
	[ModifierName] [varchar](40) NOT NULL,
	[ModifierValue] [varchar](40) NOT NULL,
 CONSTRAINT [PK_FlexiLoc] PRIMARY KEY CLUSTERED 
(
	[FlexiLocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlexiPol]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlexiPol](
	[FlexiPolID] [bigint] IDENTITY(1,1) NOT NULL,
	[PolID] [bigint] NOT NULL,
	[ModifierName] [varchar](40) NOT NULL,
	[ModifierValue] [varchar](40) NOT NULL,
 CONSTRAINT [PK_FlexiPol] PRIMARY KEY CLUSTERED 
(
	[FlexiPolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOB]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOB](
	[LOBID] [bigint] IDENTITY(1,1) NOT NULL,
	[LOB] [varchar](20) NOT NULL,
 CONSTRAINT [PK_LOB] PRIMARY KEY CLUSTERED 
(
	[LOBID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationDetails]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationDetails](
	[LocID] [bigint] NOT NULL,
	[YearUpgraded] [smallint] NOT NULL,
	[SurgeLeakage] [float] NOT NULL,
	[SprinklerType] [tinyint] NOT NULL,
	[PercentSprinklered] [float] NOT NULL,
	[RoofCover] [tinyint] NOT NULL,
	[RoofYearBuilt] [smallint] NOT NULL,
	[RoofGeometry] [tinyint] NOT NULL,
	[RoofEquipment] [tinyint] NOT NULL,
	[RoofFrame] [tinyint] NOT NULL,
	[RoofMaintenance] [tinyint] NOT NULL,
	[BuildingCondition] [tinyint] NOT NULL,
	[RoofAttachedStructures] [tinyint] NOT NULL,
	[RoofDeck] [tinyint] NOT NULL,
	[RoofPitch] [tinyint] NOT NULL,
	[RoofAnchorage] [tinyint] NOT NULL,
	[RoofDeckAttachment] [tinyint] NOT NULL,
	[RoofCoverAttachment] [tinyint] NOT NULL,
	[GlassType] [tinyint] NOT NULL,
	[LatticeType] [tinyint] NOT NULL,
	[FloodZone] [varchar](20) NULL,
	[SoftStory] [tinyint] NOT NULL,
	[Basement] [tinyint] NOT NULL,
	[BasementLevelCount] [tinyint] NOT NULL,
	[WindowProtection] [tinyint] NOT NULL,
	[FoundationType] [tinyint] NOT NULL,
	[WallAttachedStructure] [tinyint] NOT NULL,
	[AppurtenantStructure] [tinyint] NOT NULL,
	[ConstructionQuality] [tinyint] NOT NULL,
	[GroundEquipment] [tinyint] NOT NULL,
	[EquipmentBracing] [tinyint] NOT NULL,
	[Flashing] [tinyint] NOT NULL,
	[BuildingShape] [tinyint] NOT NULL,
	[ShapeIrregularity] [tinyint] NOT NULL,
	[Pounding] [tinyint] NOT NULL,
	[Ornamentation] [tinyint] NOT NULL,
	[SpecialEQConstruction] [tinyint] NOT NULL,
	[Retrofit] [tinyint] NOT NULL,
	[CrippleWall] [tinyint] NOT NULL,
	[FoundationConnection] [tinyint] NOT NULL,
	[ShortColumn] [tinyint] NOT NULL,
	[Fatigue] [tinyint] NOT NULL,
	[Cladding] [tinyint] NOT NULL,
	[BIPreparedness] [tinyint] NOT NULL,
	[BIRedundancy] [tinyint] NOT NULL,
	[FirstFloorHeight] [float] NOT NULL,
	[FirstFloorHeightUnit] [tinyint] NOT NULL,
	[Datum] [varchar](20) NULL,
	[GroundElevation] [float] NOT NULL,
	[GroundElevationUnit] [tinyint] NOT NULL,
	[Tank] [tinyint] NULL,
	[Redundancy] [tinyint] NOT NULL,
	[InternalPartition] [tinyint] NOT NULL,
	[ExternalDoors] [tinyint] NOT NULL,
	[Torsion] [tinyint] NOT NULL,
	[MechanicalEquipmentSide] [tinyint] NOT NULL,
	[ContentsWindVuln] [tinyint] NOT NULL,
	[ContentsFloodVuln] [tinyint] NOT NULL,
	[ContentsQuakeVuln] [tinyint] NOT NULL,
	[SmallDebris] [tinyint] NOT NULL,
	[FloorsOccupied] [varchar](255) NULL,
	[FloodDebrisResilience] [tinyint] NOT NULL,
	[BaseFloodElevation] [float] NOT NULL,
	[BaseFloodElevationUnit] [tinyint] NOT NULL,
	[BuildingHeight] [float] NOT NULL,
	[BuildingHeightUnit] [tinyint] NOT NULL,
	[BuildingValuation] [varchar](20) NULL,
	[TreeExposure] [tinyint] NOT NULL,
	[Chimney] [tinyint] NOT NULL,
	[BuildingType] [tinyint] NOT NULL,
	[Packaging] [tinyint] NOT NULL,
	[Protection] [tinyint] NOT NULL,
	[SalvageProtection] [tinyint] NOT NULL,
	[ValuablesStorage] [tinyint] NOT NULL,
	[DaysHeld] [smallint] NOT NULL,
	[BrickVeneer] [tinyint] NOT NULL,
	[FEMACompliance] [tinyint] NOT NULL,
	[CustomFloodSOP] [tinyint] NOT NULL,
	[CustomFloodZone] [varchar](20) NULL,
	[MultiStoryHall] [tinyint] NOT NULL,
	[BuildingExteriorOpening] [tinyint] NOT NULL,
	[ServiceEquipmentProtection] [tinyint] NOT NULL,
	[TallOneStory] [tinyint] NOT NULL,
	[TerrainRoughness] [tinyint] NOT NULL,
	[FloodDefenseHeight] [float] NOT NULL,
	[FloodDefenseHeightUnit] [tinyint] NOT NULL,
 CONSTRAINT [PK_LocationDetails] PRIMARY KEY CLUSTERED 
(
	[LocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocPol]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocPol](
	[PolID] [bigint] NOT NULL,
	[LocID] [bigint] NOT NULL,
	[Priority] [tinyint] NOT NULL,
 CONSTRAINT [PK_LocPol] PRIMARY KEY CLUSTERED 
(
	[PolID] ASC,
	[LocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PortAcc]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PortAcc](
	[PortID] [bigint] NOT NULL,
	[AccID] [bigint] NOT NULL,
 CONSTRAINT [PK_PortAcc] PRIMARY KEY CLUSTERED 
(
	[PortID] ASC,
	[AccID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Portfolios]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Portfolios](
	[PortID] [bigint] IDENTITY(1,1) NOT NULL,
	[PortNumber] [varchar](20) NOT NULL,
	[PortName] [varchar](40) NOT NULL,
	[PortNotes] [varchar](200) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[EditedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Programmes] PRIMARY KEY CLUSTERED 
(
	[PortID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producers]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producers](
	[ProducerID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProducerName] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Producers] PRIMARY KEY CLUSTERED 
(
	[ProducerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReinsAcc]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReinsAcc](
	[ReinsAccID] [bigint] IDENTITY(1,1) NOT NULL,
	[ReinsID] [bigint] NOT NULL,
	[AccID] [bigint] NOT NULL,
	[CededPercent] [float] NULL,
 CONSTRAINT [PK_ReinsAcc] PRIMARY KEY CLUSTERED 
(
	[ReinsAccID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReinsLoc]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReinsLoc](
	[ReinsLocID] [bigint] IDENTITY(1,1) NOT NULL,
	[ReinsID] [bigint] NOT NULL,
	[LocGroup] [nvarchar](20) NULL,
	[LocID] [bigint] NOT NULL,
	[CededPercent] [float] NULL,
	[RiskLevel] [tinyint] NOT NULL,
 CONSTRAINT [PK_ReinsLoc] PRIMARY KEY CLUSTERED 
(
	[ReinsLocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReinsPol]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReinsPol](
	[ReinsPolID] [bigint] IDENTITY(1,1) NOT NULL,
	[ReinsID] [bigint] NOT NULL,
	[PolID] [bigint] NOT NULL,
	[CededPercent] [float] NULL,
 CONSTRAINT [PK_ReinsPol] PRIMARY KEY CLUSTERED 
(
	[ReinsPolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReinsPort]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReinsPort](
	[ReinsPortID] [bigint] NOT NULL,
	[ReinsID] [bigint] NOT NULL,
	[PortID] [bigint] NOT NULL,
	[CededPercent] [float] NULL,
 CONSTRAINT [PK_ReinsPort] PRIMARY KEY CLUSTERED 
(
	[ReinsPortID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReinsReinstatements]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReinsReinstatements](
	[ReinsReinstatID] [bigint] IDENTITY(1,1) NOT NULL,
	[ReinsID] [bigint] NOT NULL,
	[ReinstatementCharge] [float] NOT NULL,
	[ReinstatementOrder] [tinyint] NOT NULL,
 CONSTRAINT [PK_ReinsReinstatements] PRIMARY KEY CLUSTERED 
(
	[ReinsReinstatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReinsuranceInfo]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReinsuranceInfo](
	[ReinsID] [bigint] IDENTITY(1,1) NOT NULL,
	[ReinsNumber] [int] NOT NULL,
	[ReinsName] [varchar](30) NOT NULL,
	[ReinsLayerNumber] [int] NOT NULL,
	[PerilCode] [int] NOT NULL,
	[ReinsInceptionDate] [smalldatetime] NULL,
	[ReinsExpiryDate] [smalldatetime] NULL,
	[CededPercent] [float] NOT NULL,
	[RiskLimit] [float] NOT NULL,
	[RiskAttachment] [float] NOT NULL,
	[OccLimit] [float] NOT NULL,
	[OccAttachment] [float] NOT NULL,
	[OccFranchiseDed] [float] NOT NULL,
	[OccReverseFranchise] [float] NOT NULL,
	[AggLimit] [float] NOT NULL,
	[AggAttachment] [float] NOT NULL,
	[AggPeriod] [float] NOT NULL,
	[Currency] [varchar](3) NOT NULL,
	[InuringPriority] [tinyint] NOT NULL,
	[ReinsType] [varchar](3) NOT NULL,
	[AttachmentBasis] [char](2) NOT NULL,
	[Reinstatement] [tinyint] NOT NULL,
	[ReinstatementCharge] [varchar](50) NOT NULL,
	[ReinsPremium] [float] NOT NULL,
	[PlacedPercent] [float] NOT NULL,
	[DeemedPercentPlaced] [float] NOT NULL,
	[ReinsFXrate] [float] NOT NULL,
	[TreatyShare] [float] NOT NULL,
	[UseReinsDates] [bit] NOT NULL,
 CONSTRAINT [PK_Reinsurance] PRIMARY KEY CLUSTERED 
(
	[ReinsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReinsuranceScope]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReinsuranceScope](
	[ReinsScopeID] [bigint] IDENTITY(1,1) NOT NULL,
	[ReinsID] [bigint] NOT NULL,
	[PortNumber] [varchar](20) NULL,
	[AccNumber] [nvarchar](40) NULL,
	[PolNumber] [varchar](20) NULL,
	[LocGroup] [nvarchar](20) NULL,
	[LocNumber] [nvarchar](20) NULL,
	[CedantName] [varchar](40) NULL,
	[ProducerName] [varchar](40) NULL,
	[LOB] [varchar](20) NULL,
	[CountryCode] [char](2) NULL,
	[ReinsTag] [varchar](20) NULL,
	[CededPercent] [float] NULL,
	[RiskLevel] [tinyint] NOT NULL,
 CONSTRAINT [PK_ReinsuranceScope] PRIMARY KEY CLUSTERED 
(
	[ReinsScopeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkersComp]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkersComp](
	[WorkersCompID] [bigint] IDENTITY(1,1) NOT NULL,
	[LocID] [bigint] NOT NULL,
	[NumberOfEmployees] [int] NOT NULL,
	[Payroll] [int] NOT NULL,
 CONSTRAINT [PK_WorkersComp] PRIMARY KEY CLUSTERED 
(
	[WorkersCompID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xAddressMatch]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xAddressMatch](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xAddressMatch] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xAppurtenantStructure]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xAppurtenantStructure](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xAppurtenantStructure] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xAreaCode]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xAreaCode](
	[CountryCode] [char](2) NOT NULL,
	[AreaCode] [varchar](5) NOT NULL,
	[AreaName] [nvarchar](50) NOT NULL,
	[Resolution] [varchar](30) NOT NULL,
 CONSTRAINT [PK_xAreaCode] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC,
	[AreaCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xAttachmentBasis]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xAttachmentBasis](
	[Code] [char](2) NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xAttachmentBasis] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xBasement]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xBasement](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xBasement] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xBIPreparedness]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xBIPreparedness](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xBIPreparedness] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xBIRedundancy]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xBIRedundancy](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xBIRedundancy] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xBrickVeneer]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xBrickVeneer](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xBrickVeneer] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xBuildingCondition]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xBuildingCondition](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xBuildingCondition] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xBuildingExteriorOpening]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xBuildingExteriorOpening](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xBuildingExteriorOpening] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xBuildingShape]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xBuildingShape](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xBuildingShape] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xBuildingType]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xBuildingType](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xBuildingType] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xChimney]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xChimney](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xChimney] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xCladding]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xCladding](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xCladding] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xConstruction]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xConstruction](
	[Code] [smallint] NOT NULL,
	[ConstructionName] [nvarchar](120) NOT NULL,
	[ConstructionDescription] [nvarchar](2000) NULL,
	[CodeRange] [nvarchar](11) NOT NULL,
	[CategoryName] [nvarchar](40) NOT NULL,
	[AIRcode] [varchar](10) NULL,
 CONSTRAINT [PK_xConstruction] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xConstructionQuality]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xConstructionQuality](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
	[Notes] [varchar](200) NULL,
 CONSTRAINT [PK_xConstructionQuality] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xContentsFloodVuln]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xContentsFloodVuln](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
	[Notes] [varchar](200) NOT NULL,
 CONSTRAINT [PK_xContentsFloodVuln] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xContentsQuakeVuln]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xContentsQuakeVuln](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
	[Notes] [varchar](200) NOT NULL,
 CONSTRAINT [PK_xContentsQuakeVuln] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xContentsWindVuln]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xContentsWindVuln](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
	[Notes] [varchar](200) NOT NULL,
 CONSTRAINT [PK_xContentsWindVuln] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xCountryCodeComments]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xCountryCodeComments](
	[CountryCode] [char](2) NOT NULL,
	[Non_ISO3166_code] [varchar](20) NOT NULL,
	[Offshore] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xCountryCodes]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xCountryCodes](
	[CountryCode] [char](2) NOT NULL,
	[CountryName] [varchar](60) NOT NULL,
	[Land] [tinyint] NOT NULL,
	[Modelled] [tinyint] NOT NULL,
 CONSTRAINT [PK_xCountryCodes] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xCoverages]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xCoverages](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
	[Notes] [varchar](250) NULL,
 CONSTRAINT [PK_xCoverages] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xCrippleWall]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xCrippleWall](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xCrippleWall] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xCurrency]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xCurrency](
	[CurrencyCode] [varchar](3) NOT NULL,
	[CurrencyName] [varchar](40) NOT NULL,
	[CountryName] [varchar](40) NOT NULL,
	[Notes] [varchar](250) NULL,
	[Valid] [bit] NOT NULL,
	[EnteredOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_xCurrency] PRIMARY KEY CLUSTERED 
(
	[CurrencyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xDedCode]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xDedCode](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
	[Notes] [varchar](200) NULL,
 CONSTRAINT [PK_xDedCode] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xDedType]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xDedType](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
	[Notes] [varchar](250) NULL,
 CONSTRAINT [PK_xDedType] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xEQ]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xEQ](
	[EQ] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xEquipmentBracing]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xEquipmentBracing](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xEquipmentBracing] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xExternalDoors]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xExternalDoors](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xExternalDoors] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xFatigue]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xFatigue](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xFatigue] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xFEMACompliance]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xFEMACompliance](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xFEMACompliance] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xFlashing]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xFlashing](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xFlashing] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xFloodDebrisResilience]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xFloodDebrisResilience](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xFloodDebrisResilience] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xFoundationConnection]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xFoundationConnection](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xFoundationConnection] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xFoundationType]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xFoundationType](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xFoundationType] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xFXRates]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xFXRates](
	[CurrencyCode] [char](3) NOT NULL,
	[FXRate] [float] NULL,
	[CurrencyName] [varchar](40) NULL,
	[EnteredOn] [date] NOT NULL,
	[UpdatedOn] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xGeogScheme]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xGeogScheme](
	[Code] [nvarchar](5) NOT NULL,
	[CodeDescription] [nvarchar](60) NOT NULL,
	[Notes] [nvarchar](120) NULL,
 CONSTRAINT [PK_xGeogScheme] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xGlassType]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xGlassType](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xGlassType] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xGroundEquipment]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xGroundEquipment](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xGroundEquipment] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xInternalPartition]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xInternalPartition](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xInternalPartition] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xLatticeType]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xLatticeType](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xLatticeType] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xLimitCode]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xLimitCode](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xLimitCode] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xLimitType]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xLimitType](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
	[Notes] [varchar](200) NOT NULL,
 CONSTRAINT [PK_xLimitType] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xMechanicalEquipmentSide]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xMechanicalEquipmentSide](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xMechanicalEquipmentSide] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xMultiStoryHall]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xMultiStoryHall](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xMultiStoryHall] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xOccupancy]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xOccupancy](
	[Code] [smallint] NOT NULL,
	[OccupancyName] [nvarchar](120) NOT NULL,
	[OccupancyDescription] [nvarchar](2000) NULL,
	[CodeRange] [nvarchar](11) NOT NULL,
	[CategoryName] [nvarchar](40) NOT NULL,
	[AIRcode] [varchar](5) NULL,
 CONSTRAINT [PK_xOccupancy] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xOrnamentation]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xOrnamentation](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xOrnamentation] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xPackaging]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xPackaging](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xPackaging] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xPayoutBasis]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xPayoutBasis](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [char](3) NOT NULL,
	[Notes] [varchar](200) NOT NULL,
 CONSTRAINT [PK_xPayoutBasis] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xPayOutType]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xPayOutType](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
	[Notes] [varchar](200) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xPerilCodeLookup]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xPerilCodeLookup](
	[PerilCode] [int] NOT NULL,
	[QEQ] [bit] NOT NULL,
	[QFF] [bit] NOT NULL,
	[QTS] [bit] NOT NULL,
	[QSL] [bit] NOT NULL,
	[QLS] [bit] NOT NULL,
	[QLF] [bit] NOT NULL,
	[WTC] [bit] NOT NULL,
	[WEC] [bit] NOT NULL,
	[WSS] [bit] NOT NULL,
	[ORF] [bit] NOT NULL,
	[OSF] [bit] NOT NULL,
	[XSL] [bit] NOT NULL,
	[XTD] [bit] NOT NULL,
	[XHL] [bit] NOT NULL,
	[ZSN] [bit] NOT NULL,
	[ZIC] [bit] NOT NULL,
	[ZFZ] [bit] NOT NULL,
	[BFR] [bit] NOT NULL,
	[BBF] [bit] NOT NULL,
	[MNT] [bit] NOT NULL,
	[MTR] [bit] NOT NULL,
	[XLT] [bit] NOT NULL,
	[ZST] [bit] NOT NULL,
	[BSK] [bit] NOT NULL,
	[PerilAbbreviation] [varchar](100) NULL,
	[PerilDescription] [varchar](800) NULL,
 CONSTRAINT [PK_xPerilCodeLookup] PRIMARY KEY CLUSTERED 
(
	[PerilCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xPerilCodes]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xPerilCodes](
	[PerilCode] [int] NOT NULL,
	[PerilDescription] [varchar](50) NOT NULL,
	[Abbreviation] [char](3) NOT NULL,
	[Grouped] [varchar](3) NOT NULL,
 CONSTRAINT [PK_xPerilCodes] PRIMARY KEY CLUSTERED 
(
	[PerilCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xPounding]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xPounding](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xPounding] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xProtection]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xProtection](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xProtection] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xRedundancy]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xRedundancy](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xRedundancy] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xReinsType]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xReinsType](
	[Code] [varchar](3) NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xReinsType] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xRetrofit]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xRetrofit](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xRetrofit] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xRiskLevel]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xRiskLevel](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
	[InputValue] [char](3) NOT NULL,
 CONSTRAINT [PK_xRiskLevel] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xRoofAnchorage]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xRoofAnchorage](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xRoofAnchorage] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xRoofAttachedStructures]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xRoofAttachedStructures](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xRoofAttachedStructures] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xRoofCover]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xRoofCover](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xRoofCover] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xRoofCoverAttachment]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xRoofCoverAttachment](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xRoofCoverAttachment] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xRoofDeck]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xRoofDeck](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xRoofDeck] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xRoofDeckAttachment]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xRoofDeckAttachment](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xRoofDeckAttachment] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xRoofEquipment]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xRoofEquipment](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xRoofEquipment] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xRoofFrame]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xRoofFrame](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xRoofFrame] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xRoofGeometry]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xRoofGeometry](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xRoofGeometry] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xRoofMaintenance]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xRoofMaintenance](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xRoofMaintenance] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xRoofPitch]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xRoofPitch](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xRoofPitch] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xSalvageProtection]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xSalvageProtection](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xSalvageProtection] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xServiceEquipmentProtection]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xServiceEquipmentProtection](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xServiceEquipmentProtection] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xShapeIrregularity]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xShapeIrregularity](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
	[Notes] [varchar](200) NULL,
 CONSTRAINT [PK_xShapeIrregularity] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xShortColumn]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xShortColumn](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xShortColumn] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xSmallDebris]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xSmallDebris](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xSmallDebris] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xSoftStory]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xSoftStory](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xSoftStory] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xSpecialEQConstruction]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xSpecialEQConstruction](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xSpecialEQConstruction] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xSprinklerType]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xSprinklerType](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xSprinklerType] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xStatuses]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xStatuses](
	[Code] [char](1) NOT NULL,
	[CodeDescription] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xStepTriggerType]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xStepTriggerType](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xStepTriggerType] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xTallOneStory]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xTallOneStory](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xTallOneStory] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xTank]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xTank](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xTank] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xTerrainRoughness]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xTerrainRoughness](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
	[Notes] [varchar](500) NULL,
 CONSTRAINT [PK_xTerrainRoughness] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xTorsion]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xTorsion](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xTorsion] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xTreeExposure]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xTreeExposure](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xTreeExposure] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xUnits]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xUnits](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xUnits] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xValuablesStorage]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xValuablesStorage](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xValuablesStorage] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xWallAttachedStructure]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xWallAttachedStructure](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xWallAttachedStructure] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xWindowProtection]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xWindowProtection](
	[Code] [tinyint] NOT NULL,
	[CodeDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_xWindowProtection] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zNotes]    Script Date: 09/04/2020 10:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zNotes](
	[ShortDescription] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountFinancials_AccID]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_AccountFinancials_AccID] ON [dbo].[AccountFinancials]
(
	[AccID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Accounts_AccName]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_Accounts_AccName] ON [dbo].[Accounts]
(
	[AccName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Accounts_Number]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_Accounts_Number] ON [dbo].[Accounts]
(
	[AccNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConditionFinancials_CondID]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_ConditionFinancials_CondID] ON [dbo].[ConditionFinancials]
(
	[CondID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Conditions_AccID]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_Conditions_AccID] ON [dbo].[Conditions]
(
	[AccID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Conditions_CondName]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_Conditions_CondName] ON [dbo].[Conditions]
(
	[CondName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FlexiAcc_AccID]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_FlexiAcc_AccID] ON [dbo].[FlexiAcc]
(
	[AccID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FlexiLoc_LocID]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_FlexiLoc_LocID] ON [dbo].[FlexiLoc]
(
	[LocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FlexiPol_PolID]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_FlexiPol_PolID] ON [dbo].[FlexiPol]
(
	[PolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LocationFinancials_LocID]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_LocationFinancials_LocID] ON [dbo].[LocationFinancials]
(
	[LocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Locations_AccID]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_Locations_AccID] ON [dbo].[Locations]
(
	[AccID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Locations_CountryCode]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_Locations_CountryCode] ON [dbo].[Locations]
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Locations_LocName]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_Locations_LocName] ON [dbo].[Locations]
(
	[LocName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Locations_LocNumber]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_Locations_LocNumber] ON [dbo].[Locations]
(
	[LocNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Policies_AccID]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_Policies_AccID] ON [dbo].[Policies]
(
	[AccID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Policies_PolNumber]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_Policies_PolNumber] ON [dbo].[Policies]
(
	[PolNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PolicyFinancials_PolID]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_PolicyFinancials_PolID] ON [dbo].[PolicyFinancials]
(
	[PolFinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PortAcc_AccID]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_PortAcc_AccID] ON [dbo].[PortAcc]
(
	[AccID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Portfolios_PortName]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_Portfolios_PortName] ON [dbo].[Portfolios]
(
	[PortName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Portfolios_PortNumber]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_Portfolios_PortNumber] ON [dbo].[Portfolios]
(
	[PortNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReinsAcc_AccID]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_ReinsAcc_AccID] ON [dbo].[ReinsAcc]
(
	[AccID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReinsLoc_LocID]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_ReinsLoc_LocID] ON [dbo].[ReinsLoc]
(
	[LocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReinsLoc_ReinsID]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_ReinsLoc_ReinsID] ON [dbo].[ReinsLoc]
(
	[ReinsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReinsPol_PolID]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_ReinsPol_PolID] ON [dbo].[ReinsPol]
(
	[PolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReinsReinstatements_ReinsID]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_ReinsReinstatements_ReinsID] ON [dbo].[ReinsReinstatements]
(
	[ReinsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReinsuranceInfo_ReinsName]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_ReinsuranceInfo_ReinsName] ON [dbo].[ReinsuranceInfo]
(
	[ReinsName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReinsuranceInfo_ReinsNumber]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_ReinsuranceInfo_ReinsNumber] ON [dbo].[ReinsuranceInfo]
(
	[ReinsNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReinsuranceScope_ReinsID]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_ReinsuranceScope_ReinsID] ON [dbo].[ReinsuranceScope]
(
	[ReinsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StepFunctions_PolID]    Script Date: 09/04/2020 10:44:56 ******/
CREATE NONCLUSTERED INDEX [IX_StepFunctions_PolID] ON [dbo].[StepFunctions]
(
	[PolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountFinancials] ADD  CONSTRAINT [DF_AccountFinancials_Dedode]  DEFAULT ((0)) FOR [DedCode]
GO
ALTER TABLE [dbo].[AccountFinancials] ADD  CONSTRAINT [DF_AccountFinancials_DedCov]  DEFAULT ((0)) FOR [DedCov]
GO
ALTER TABLE [dbo].[AccountFinancials] ADD  CONSTRAINT [DF_AccountFinancials_DedType]  DEFAULT ((0)) FOR [DedType]
GO
ALTER TABLE [dbo].[AccountFinancials] ADD  CONSTRAINT [DF_AccountFinancials_Deductible]  DEFAULT ((0)) FOR [Ded]
GO
ALTER TABLE [dbo].[AccountFinancials] ADD  CONSTRAINT [DF_AccountFinancials_MinDed]  DEFAULT ((0)) FOR [MinDed]
GO
ALTER TABLE [dbo].[AccountFinancials] ADD  CONSTRAINT [DF_AccountFinancials_MaxDed]  DEFAULT ((0)) FOR [MaxDed]
GO
ALTER TABLE [dbo].[AccountFinancials] ADD  CONSTRAINT [DF_AccountFinancials_LimitCode]  DEFAULT ((0)) FOR [LimitCode]
GO
ALTER TABLE [dbo].[AccountFinancials] ADD  CONSTRAINT [DF_AccountFinancials_LimitCov]  DEFAULT ((0)) FOR [LimitCov]
GO
ALTER TABLE [dbo].[AccountFinancials] ADD  CONSTRAINT [DF_AccountFinancials_LimitType]  DEFAULT ((0)) FOR [LimitType]
GO
ALTER TABLE [dbo].[AccountFinancials] ADD  CONSTRAINT [DF_AccountFinancials_Limit]  DEFAULT ((0)) FOR [Limit]
GO
ALTER TABLE [dbo].[ConditionFinancials] ADD  CONSTRAINT [DF_ConditionFinancials_DedCode]  DEFAULT ((0)) FOR [DedCode]
GO
ALTER TABLE [dbo].[ConditionFinancials] ADD  CONSTRAINT [DF_ConditionFinancials_DedCov]  DEFAULT ((0)) FOR [DedCov]
GO
ALTER TABLE [dbo].[ConditionFinancials] ADD  CONSTRAINT [DF_ConditionFinancials_DedType]  DEFAULT ((0)) FOR [DedType]
GO
ALTER TABLE [dbo].[ConditionFinancials] ADD  CONSTRAINT [DF_ConditionFinancials_Ded]  DEFAULT ((0)) FOR [Ded]
GO
ALTER TABLE [dbo].[ConditionFinancials] ADD  CONSTRAINT [DF_ConditionFinancials_MinDed]  DEFAULT ((0)) FOR [MinDed]
GO
ALTER TABLE [dbo].[ConditionFinancials] ADD  CONSTRAINT [DF_ConditionFinancials_MaxDed]  DEFAULT ((0)) FOR [MaxDed]
GO
ALTER TABLE [dbo].[ConditionFinancials] ADD  CONSTRAINT [DF_ConditionFinancials_LimitCode]  DEFAULT ((0)) FOR [LimitCode]
GO
ALTER TABLE [dbo].[ConditionFinancials] ADD  CONSTRAINT [DF_ConditionFinancials_LimitCov]  DEFAULT ((0)) FOR [LimitCov]
GO
ALTER TABLE [dbo].[ConditionFinancials] ADD  CONSTRAINT [DF_ConditionFinancials_LimitType]  DEFAULT ((0)) FOR [LimitType]
GO
ALTER TABLE [dbo].[ConditionFinancials] ADD  CONSTRAINT [DF_ConditionFinancials_Limit]  DEFAULT ((0)) FOR [Limit]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_YearUpgraded]  DEFAULT ((0)) FOR [YearUpgraded]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_Sprinkler]  DEFAULT ((-999)) FOR [SurgeLeakage]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_SprinklerType]  DEFAULT ((0)) FOR [SprinklerType]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_PercentSprinkled]  DEFAULT ((-999)) FOR [PercentSprinklered]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_RoofCover]  DEFAULT ((0)) FOR [RoofCover]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_RoofYearBuilt]  DEFAULT ((0)) FOR [RoofYearBuilt]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_RoofGeometry]  DEFAULT ((0)) FOR [RoofGeometry]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_RoofEquipment]  DEFAULT ((0)) FOR [RoofEquipment]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_RoofFrame]  DEFAULT ((0)) FOR [RoofFrame]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_RoofMaintenance]  DEFAULT ((0)) FOR [RoofMaintenance]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_BuildingCondition]  DEFAULT ((0)) FOR [BuildingCondition]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_RoofParapets]  DEFAULT ((0)) FOR [RoofAttachedStructures]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_RoofDeck]  DEFAULT ((0)) FOR [RoofDeck]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_RoofPitch]  DEFAULT ((0)) FOR [RoofPitch]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_RoofAnchorage]  DEFAULT ((0)) FOR [RoofAnchorage]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_RoofDeckAttachment]  DEFAULT ((0)) FOR [RoofDeckAttachment]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_RoofCoverAttachment]  DEFAULT ((0)) FOR [RoofCoverAttachment]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_CladdingType]  DEFAULT ((0)) FOR [GlassType]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_LatticeType]  DEFAULT ((0)) FOR [LatticeType]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_SoftStory]  DEFAULT ((0)) FOR [SoftStory]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_Basement]  DEFAULT ((0)) FOR [Basement]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_BasementLevelCount]  DEFAULT ((0)) FOR [BasementLevelCount]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_WindowProtection]  DEFAULT ((0)) FOR [WindowProtection]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_FoundationType]  DEFAULT ((0)) FOR [FoundationType]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_AttachedStructuresCom]  DEFAULT ((0)) FOR [WallAttachedStructure]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_AttachedStructuresRes]  DEFAULT ((0)) FOR [AppurtenantStructure]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_ConstructionQuality]  DEFAULT ((0)) FOR [ConstructionQuality]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_GroundEquipment]  DEFAULT ((0)) FOR [GroundEquipment]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_EquipmentBracing]  DEFAULT ((0)) FOR [EquipmentBracing]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_Flashing]  DEFAULT ((0)) FOR [Flashing]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_BuildingShape]  DEFAULT ((0)) FOR [BuildingShape]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_Overhangs]  DEFAULT ((0)) FOR [ShapeIrregularity]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_Pounding]  DEFAULT ((0)) FOR [Pounding]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_Ornamentation]  DEFAULT ((0)) FOR [Ornamentation]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_BaseIsolation]  DEFAULT ((0)) FOR [SpecialEQConstruction]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_TiltUpRetrofit]  DEFAULT ((0)) FOR [Retrofit]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_CrippleWall]  DEFAULT ((0)) FOR [CrippleWall]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_FoundationConnection]  DEFAULT ((0)) FOR [FoundationConnection]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_ShortColumn]  DEFAULT ((0)) FOR [ShortColumn]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_Fatigue]  DEFAULT ((0)) FOR [Fatigue]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_Cladding]  DEFAULT ((0)) FOR [Cladding]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_BIPreparedness]  DEFAULT ((0)) FOR [BIPreparedness]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_BIRedundancy]  DEFAULT ((0)) FOR [BIRedundancy]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_BuildingElevation]  DEFAULT ((-999)) FOR [FirstFloorHeight]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_BuildingElevationUnit]  DEFAULT ((1)) FOR [FirstFloorHeightUnit]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_CustomElevation]  DEFAULT ((-999)) FOR [GroundElevation]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_CustomElevationUnit]  DEFAULT ((1)) FOR [GroundElevationUnit]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_Tank]  DEFAULT ((0)) FOR [Tank]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_StructuralRedundancy]  DEFAULT ((0)) FOR [Redundancy]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_URMPartition]  DEFAULT ((0)) FOR [InternalPartition]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_ExternalDoors]  DEFAULT ((0)) FOR [ExternalDoors]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_Torsion]  DEFAULT ((0)) FOR [Torsion]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_MechEquiptSide]  DEFAULT ((0)) FOR [MechanicalEquipmentSide]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_ContentsWindVuln]  DEFAULT ((0)) FOR [ContentsWindVuln]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_ContentsFloodVuln]  DEFAULT ((0)) FOR [ContentsFloodVuln]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_ContensQuakeVuln]  DEFAULT ((0)) FOR [ContentsQuakeVuln]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_SmallDebris]  DEFAULT ((0)) FOR [SmallDebris]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_FloodDebris]  DEFAULT ((0)) FOR [FloodDebrisResilience]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_BaseFloodElevation]  DEFAULT ((-999)) FOR [BaseFloodElevation]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_BaseFloodElevationUnit]  DEFAULT ((1)) FOR [BaseFloodElevationUnit]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_BuildingHeight]  DEFAULT ((-999)) FOR [BuildingHeight]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_BuildingHeightUnit]  DEFAULT ((1)) FOR [BuildingHeightUnit]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_TreeExposure]  DEFAULT ((0)) FOR [TreeExposure]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_Chimney]  DEFAULT ((0)) FOR [Chimney]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_BuildingType]  DEFAULT ((0)) FOR [BuildingType]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_Packaging]  DEFAULT ((0)) FOR [Packaging]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_Protection]  DEFAULT ((0)) FOR [Protection]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_SalvageProtection]  DEFAULT ((0)) FOR [SalvageProtection]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_SpecieStorage]  DEFAULT ((0)) FOR [ValuablesStorage]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_DaysAtPort]  DEFAULT ((365)) FOR [DaysHeld]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_BrickVeneer]  DEFAULT ((0)) FOR [BrickVeneer]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_FEMACompliance]  DEFAULT ((0)) FOR [FEMACompliance]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_CustomFloodSOP]  DEFAULT ((0)) FOR [CustomFloodSOP]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_MultiStoryHall]  DEFAULT ((0)) FOR [MultiStoryHall]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_BuildingExteriorOpening]  DEFAULT ((0)) FOR [BuildingExteriorOpening]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_ServiceEquipmentProtection]  DEFAULT ((0)) FOR [ServiceEquipmentProtection]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_TallOneStory]  DEFAULT ((0)) FOR [TallOneStory]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_TerrainRoughness]  DEFAULT ((0)) FOR [TerrainRoughness]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_FloodDefenseHeight]  DEFAULT ((-999)) FOR [FloodDefenseHeight]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_FloodDefenseHeightUnit]  DEFAULT ((1)) FOR [FloodDefenseHeightUnit]
GO
ALTER TABLE [dbo].[LocationFinancials] ADD  CONSTRAINT [DF_LocationFinancials_DedCode]  DEFAULT ((0)) FOR [DedCode]
GO
ALTER TABLE [dbo].[LocationFinancials] ADD  CONSTRAINT [DF_LocationFinancials_DedCov]  DEFAULT ((0)) FOR [DedCov]
GO
ALTER TABLE [dbo].[LocationFinancials] ADD  CONSTRAINT [DF_LocationFinancials_DedType]  DEFAULT ((0)) FOR [DedType]
GO
ALTER TABLE [dbo].[LocationFinancials] ADD  CONSTRAINT [DF_LocationFinancials_Ded]  DEFAULT ((0)) FOR [Ded]
GO
ALTER TABLE [dbo].[LocationFinancials] ADD  CONSTRAINT [DF_LocationFinancials_MinDed]  DEFAULT ((0)) FOR [MinDed]
GO
ALTER TABLE [dbo].[LocationFinancials] ADD  CONSTRAINT [DF_LocationFinancials_MaxDed]  DEFAULT ((0)) FOR [MaxDed]
GO
ALTER TABLE [dbo].[LocationFinancials] ADD  CONSTRAINT [DF_LocationFinancials_BIWaitingPeriod]  DEFAULT ((0)) FOR [BIWaitingPeriod]
GO
ALTER TABLE [dbo].[LocationFinancials] ADD  CONSTRAINT [DF_LocationFinancials_LimitCode]  DEFAULT ((0)) FOR [LimitCode]
GO
ALTER TABLE [dbo].[LocationFinancials] ADD  CONSTRAINT [DF_LocationFinancials_LimitCov]  DEFAULT ((0)) FOR [LimitCov]
GO
ALTER TABLE [dbo].[LocationFinancials] ADD  CONSTRAINT [DF_LocationFinancials_LimitType]  DEFAULT ((0)) FOR [LimitType]
GO
ALTER TABLE [dbo].[LocationFinancials] ADD  CONSTRAINT [DF_LocationFinancials_Limit]  DEFAULT ((0)) FOR [Limit]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_IsPrimary]  DEFAULT ((1)) FOR [IsPrimary]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_IsTenant]  DEFAULT ((0)) FOR [IsTenant]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_PercentComplete]  DEFAULT ((1)) FOR [PercentComplete]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_Latitude]  DEFAULT ((0)) FOR [Latitude]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_Longitude]  DEFAULT ((0)) FOR [Longitude]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_AddressMatch]  DEFAULT ((0)) FOR [AddressMatch]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_OccupancyCode]  DEFAULT ((1000)) FOR [OccupancyCode]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_ConstructionCode]  DEFAULT ((5000)) FOR [ConstructionCode]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_YearBuilt]  DEFAULT ((0)) FOR [YearBuilt]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_NumberOfStories]  DEFAULT ((0)) FOR [NumberOfStoreys]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_NumberOfBuildings]  DEFAULT ((1)) FOR [NumberOfBuildings]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_FloorArea]  DEFAULT ((0)) FOR [FloorArea]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_FloorAreaUnit]  DEFAULT ((11)) FOR [FloorAreaUnit]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_BIPOI]  DEFAULT ((365)) FOR [BIPOI]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_Premium]  DEFAULT ((0)) FOR [GrossPremium]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_Tax]  DEFAULT ((0)) FOR [Tax]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_Brokerage]  DEFAULT ((0)) FOR [Brokerage]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_NetPremium]  DEFAULT ((0)) FOR [NetPremium]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_NonCatGroundUpLoss]  DEFAULT ((0)) FOR [NonCatGroundUpLoss]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_Participation]  DEFAULT ((1)) FOR [Participation]
GO
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_PayoutBasis]  DEFAULT ((0)) FOR [PayoutBasis]
GO
ALTER TABLE [dbo].[Policies] ADD  CONSTRAINT [DF_Policies_LayerNumber]  DEFAULT ((1)) FOR [LayerNumber]
GO
ALTER TABLE [dbo].[Policies] ADD  CONSTRAINT [DF_Policies_PolicyPremium]  DEFAULT ((0)) FOR [GrossPremium]
GO
ALTER TABLE [dbo].[Policies] ADD  CONSTRAINT [DF_Policies_Tax]  DEFAULT ((0)) FOR [Tax]
GO
ALTER TABLE [dbo].[Policies] ADD  CONSTRAINT [DF_Policies_Brokerage]  DEFAULT ((0)) FOR [Brokerage]
GO
ALTER TABLE [dbo].[Policies] ADD  CONSTRAINT [DF_Policies_NetPremium]  DEFAULT ((0)) FOR [NetPremium]
GO
ALTER TABLE [dbo].[Policies] ADD  CONSTRAINT [DF_Policies_LayerParticipation]  DEFAULT ((1)) FOR [LayerParticipation]
GO
ALTER TABLE [dbo].[Policies] ADD  CONSTRAINT [DF_Policies_TotalLimit]  DEFAULT ((0)) FOR [LayerLimit]
GO
ALTER TABLE [dbo].[Policies] ADD  CONSTRAINT [DF_Policies_AttachmentPoint]  DEFAULT ((0)) FOR [LayerAttachment]
GO
ALTER TABLE [dbo].[PolicyFinancials] ADD  CONSTRAINT [DF_PolicyFinancials_DedCode]  DEFAULT ((0)) FOR [DedCode]
GO
ALTER TABLE [dbo].[PolicyFinancials] ADD  CONSTRAINT [DF_PolicyFinancials_DedCov]  DEFAULT ((0)) FOR [DedCov]
GO
ALTER TABLE [dbo].[PolicyFinancials] ADD  CONSTRAINT [DF_PolicyFinancials_DedType]  DEFAULT ((0)) FOR [DedType]
GO
ALTER TABLE [dbo].[PolicyFinancials] ADD  CONSTRAINT [DF_PolicyFinancials_Ded]  DEFAULT ((0)) FOR [Ded]
GO
ALTER TABLE [dbo].[PolicyFinancials] ADD  CONSTRAINT [DF_PolicyFinancials_MinDed]  DEFAULT ((0)) FOR [MinDed]
GO
ALTER TABLE [dbo].[PolicyFinancials] ADD  CONSTRAINT [DF_PolicyFinancials_MaxDed]  DEFAULT ((0)) FOR [MaxDed]
GO
ALTER TABLE [dbo].[PolicyFinancials] ADD  CONSTRAINT [DF_PolicyFinancials_LimitCode]  DEFAULT ((0)) FOR [LimitCode]
GO
ALTER TABLE [dbo].[PolicyFinancials] ADD  CONSTRAINT [DF_PolicyFinancials_LimitCov]  DEFAULT ((0)) FOR [LimitCov]
GO
ALTER TABLE [dbo].[PolicyFinancials] ADD  CONSTRAINT [DF_PolicyFinancials_LimitType]  DEFAULT ((0)) FOR [LimitType]
GO
ALTER TABLE [dbo].[PolicyFinancials] ADD  CONSTRAINT [DF_PolicyFinancials_Limit]  DEFAULT ((0)) FOR [Limit]
GO
ALTER TABLE [dbo].[Portfolios] ADD  CONSTRAINT [DF_Portfolios_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Portfolios] ADD  CONSTRAINT [DF_Portfolios_EditedOn]  DEFAULT (getdate()) FOR [EditedOn]
GO
ALTER TABLE [dbo].[ReinsuranceInfo] ADD  CONSTRAINT [DF_Reinsurance_ReinsLimit]  DEFAULT ((0)) FOR [RiskLimit]
GO
ALTER TABLE [dbo].[ReinsuranceInfo] ADD  CONSTRAINT [DF_Reinsurance_ReinsAttachmentPoint]  DEFAULT ((0)) FOR [RiskAttachment]
GO
ALTER TABLE [dbo].[ReinsuranceInfo] ADD  CONSTRAINT [DF_ReinsuranceInfo_OccurenceLimit1]  DEFAULT ((0)) FOR [OccLimit]
GO
ALTER TABLE [dbo].[ReinsuranceInfo] ADD  CONSTRAINT [DF_ReinsuranceInfo_OccAttachment]  DEFAULT ((0)) FOR [OccAttachment]
GO
ALTER TABLE [dbo].[ReinsuranceInfo] ADD  CONSTRAINT [DF_ReinsuranceInfo_OccFranchiseDed]  DEFAULT ((0)) FOR [OccFranchiseDed]
GO
ALTER TABLE [dbo].[ReinsuranceInfo] ADD  CONSTRAINT [DF_ReinsuranceInfo_OccReverseFranchise]  DEFAULT ((0)) FOR [OccReverseFranchise]
GO
ALTER TABLE [dbo].[ReinsuranceInfo] ADD  CONSTRAINT [DF_ReinsuranceInfo_AggLimit]  DEFAULT ((0)) FOR [AggLimit]
GO
ALTER TABLE [dbo].[ReinsuranceInfo] ADD  CONSTRAINT [DF_ReinsuranceInfo_AggAttachment]  DEFAULT ((0)) FOR [AggAttachment]
GO
ALTER TABLE [dbo].[ReinsuranceInfo] ADD  CONSTRAINT [DF_ReinsuranceInfo_AggPeriod]  DEFAULT ((365)) FOR [AggPeriod]
GO
ALTER TABLE [dbo].[ReinsuranceInfo] ADD  CONSTRAINT [DF_ReinsuranceInfo_AttachmentBasis]  DEFAULT ('LO') FOR [AttachmentBasis]
GO
ALTER TABLE [dbo].[ReinsuranceInfo] ADD  CONSTRAINT [DF_Reinsurance_ReinsPremium]  DEFAULT ((0)) FOR [ReinsPremium]
GO
ALTER TABLE [dbo].[ReinsuranceInfo] ADD  CONSTRAINT [DF_ReinsuranceInfo_DeemedPercentPlaced]  DEFAULT ((0)) FOR [DeemedPercentPlaced]
GO
ALTER TABLE [dbo].[ReinsuranceInfo] ADD  CONSTRAINT [DF_Reinsurance_ReinsFXrate]  DEFAULT ((1)) FOR [ReinsFXrate]
GO
ALTER TABLE [dbo].[ReinsuranceInfo] ADD  CONSTRAINT [DF_ReinsuranceInfo_TreatyShare]  DEFAULT ((1)) FOR [TreatyShare]
GO
ALTER TABLE [dbo].[ReinsuranceInfo] ADD  CONSTRAINT [DF_ReinsuranceInfo_UseReinsDates]  DEFAULT ((1)) FOR [UseReinsDates]
GO
ALTER TABLE [dbo].[Steps] ADD  CONSTRAINT [DF_Steps_StepTriggerCov]  DEFAULT ((0)) FOR [StepTriggerCov]
GO
ALTER TABLE [dbo].[Steps] ADD  CONSTRAINT [DF_Steps_StartTrigger]  DEFAULT ((0)) FOR [TriggerStart]
GO
ALTER TABLE [dbo].[Steps] ADD  CONSTRAINT [DF_Steps_EndTrigger]  DEFAULT ((0)) FOR [TriggerEnd]
GO
ALTER TABLE [dbo].[Steps] ADD  CONSTRAINT [DF_Steps_Payout]  DEFAULT ((0)) FOR [PayoutStart]
GO
ALTER TABLE [dbo].[Steps] ADD  CONSTRAINT [DF_Steps_PayoutEnd]  DEFAULT ((0)) FOR [PayoutEnd]
GO
ALTER TABLE [dbo].[Steps] ADD  CONSTRAINT [DF_Steps_Deductible]  DEFAULT ((0)) FOR [Deductible]
GO
ALTER TABLE [dbo].[Steps] ADD  CONSTRAINT [DF_Steps_PayoutLimit]  DEFAULT ((0)) FOR [PayoutLimit]
GO
ALTER TABLE [dbo].[Steps] ADD  CONSTRAINT [DF_Steps_ExtraExpenseFactor]  DEFAULT ((1)) FOR [ExtraExpenseFactor]
GO
ALTER TABLE [dbo].[Steps] ADD  CONSTRAINT [DF_Steps_ExtraExpenseLimit]  DEFAULT ((0)) FOR [ExtraExpenseLimit]
GO
ALTER TABLE [dbo].[Steps] ADD  CONSTRAINT [DF_Steps_DebrisRemovalFactor]  DEFAULT ((1)) FOR [DebrisRemovalFactor]
GO
ALTER TABLE [dbo].[Steps] ADD  CONSTRAINT [DF_Steps_MinimumTIV]  DEFAULT ((0)) FOR [MinimumTIV]
GO
ALTER TABLE [dbo].[Steps] ADD  CONSTRAINT [DF_Steps_ScaleFactor]  DEFAULT ((1)) FOR [ScaleFactor]
GO
ALTER TABLE [dbo].[Steps] ADD  CONSTRAINT [DF_Steps_IsLimitAtDamage]  DEFAULT ((0)) FOR [IsLimitAtDamage]
GO
ALTER TABLE [dbo].[AccountFinancials]  WITH CHECK ADD  CONSTRAINT [FK_AccountFinancials_Accounts] FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts] ([AccID])
GO
ALTER TABLE [dbo].[AccountFinancials] CHECK CONSTRAINT [FK_AccountFinancials_Accounts]
GO
ALTER TABLE [dbo].[AccountFinancials]  WITH CHECK ADD  CONSTRAINT [FK_AccountFinancials_xCoveragesDC] FOREIGN KEY([DedCov])
REFERENCES [dbo].[xCoverages] ([Code])
GO
ALTER TABLE [dbo].[AccountFinancials] CHECK CONSTRAINT [FK_AccountFinancials_xCoveragesDC]
GO
ALTER TABLE [dbo].[AccountFinancials]  WITH CHECK ADD  CONSTRAINT [FK_AccountFinancials_xCoveragesLC] FOREIGN KEY([LimitCov])
REFERENCES [dbo].[xCoverages] ([Code])
GO
ALTER TABLE [dbo].[AccountFinancials] CHECK CONSTRAINT [FK_AccountFinancials_xCoveragesLC]
GO
ALTER TABLE [dbo].[AccountFinancials]  WITH CHECK ADD  CONSTRAINT [FK_AccountFinancials_xDedCode] FOREIGN KEY([DedCode])
REFERENCES [dbo].[xDedCode] ([Code])
GO
ALTER TABLE [dbo].[AccountFinancials] CHECK CONSTRAINT [FK_AccountFinancials_xDedCode]
GO
ALTER TABLE [dbo].[AccountFinancials]  WITH CHECK ADD  CONSTRAINT [FK_AccountFinancials_xDedType] FOREIGN KEY([DedType])
REFERENCES [dbo].[xDedType] ([Code])
GO
ALTER TABLE [dbo].[AccountFinancials] CHECK CONSTRAINT [FK_AccountFinancials_xDedType]
GO
ALTER TABLE [dbo].[AccountFinancials]  WITH CHECK ADD  CONSTRAINT [FK_AccountFinancials_xLimitCode] FOREIGN KEY([LimitCode])
REFERENCES [dbo].[xLimitCode] ([Code])
GO
ALTER TABLE [dbo].[AccountFinancials] CHECK CONSTRAINT [FK_AccountFinancials_xLimitCode]
GO
ALTER TABLE [dbo].[AccountFinancials]  WITH CHECK ADD  CONSTRAINT [FK_AccountFinancials_xLimitType] FOREIGN KEY([LimitType])
REFERENCES [dbo].[xLimitType] ([Code])
GO
ALTER TABLE [dbo].[AccountFinancials] CHECK CONSTRAINT [FK_AccountFinancials_xLimitType]
GO
ALTER TABLE [dbo].[AccountFinancials]  WITH CHECK ADD  CONSTRAINT [FK_AccountFinancials_xPerilCodeLookup] FOREIGN KEY([PerilCode])
REFERENCES [dbo].[xPerilCodeLookup] ([PerilCode])
GO
ALTER TABLE [dbo].[AccountFinancials] CHECK CONSTRAINT [FK_AccountFinancials_xPerilCodeLookup]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_xCurrency] FOREIGN KEY([Currency])
REFERENCES [dbo].[xCurrency] ([CurrencyCode])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_xCurrency]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Cedants] FOREIGN KEY([CedantID])
REFERENCES [dbo].[Cedants] ([CedantID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Contracts_Cedants]
GO
ALTER TABLE [dbo].[ConditionFinancials]  WITH CHECK ADD  CONSTRAINT [FK_ConditionFinancials_Conditions] FOREIGN KEY([CondID])
REFERENCES [dbo].[Conditions] ([CondID])
GO
ALTER TABLE [dbo].[ConditionFinancials] CHECK CONSTRAINT [FK_ConditionFinancials_Conditions]
GO
ALTER TABLE [dbo].[ConditionFinancials]  WITH CHECK ADD  CONSTRAINT [FK_ConditionFinancials_xCoveragesDC] FOREIGN KEY([DedCov])
REFERENCES [dbo].[xCoverages] ([Code])
GO
ALTER TABLE [dbo].[ConditionFinancials] CHECK CONSTRAINT [FK_ConditionFinancials_xCoveragesDC]
GO
ALTER TABLE [dbo].[ConditionFinancials]  WITH CHECK ADD  CONSTRAINT [FK_ConditionFinancials_xCoveragesLC] FOREIGN KEY([LimitCov])
REFERENCES [dbo].[xCoverages] ([Code])
GO
ALTER TABLE [dbo].[ConditionFinancials] CHECK CONSTRAINT [FK_ConditionFinancials_xCoveragesLC]
GO
ALTER TABLE [dbo].[ConditionFinancials]  WITH CHECK ADD  CONSTRAINT [FK_ConditionFinancials_xDedCode] FOREIGN KEY([DedCode])
REFERENCES [dbo].[xDedCode] ([Code])
GO
ALTER TABLE [dbo].[ConditionFinancials] CHECK CONSTRAINT [FK_ConditionFinancials_xDedCode]
GO
ALTER TABLE [dbo].[ConditionFinancials]  WITH CHECK ADD  CONSTRAINT [FK_ConditionFinancials_xDedType] FOREIGN KEY([DedType])
REFERENCES [dbo].[xDedType] ([Code])
GO
ALTER TABLE [dbo].[ConditionFinancials] CHECK CONSTRAINT [FK_ConditionFinancials_xDedType]
GO
ALTER TABLE [dbo].[ConditionFinancials]  WITH CHECK ADD  CONSTRAINT [FK_ConditionFinancials_xLimitCode] FOREIGN KEY([LimitCode])
REFERENCES [dbo].[xLimitCode] ([Code])
GO
ALTER TABLE [dbo].[ConditionFinancials] CHECK CONSTRAINT [FK_ConditionFinancials_xLimitCode]
GO
ALTER TABLE [dbo].[ConditionFinancials]  WITH CHECK ADD  CONSTRAINT [FK_ConditionFinancials_xLimitType] FOREIGN KEY([LimitType])
REFERENCES [dbo].[xLimitType] ([Code])
GO
ALTER TABLE [dbo].[ConditionFinancials] CHECK CONSTRAINT [FK_ConditionFinancials_xLimitType]
GO
ALTER TABLE [dbo].[ConditionFinancials]  WITH CHECK ADD  CONSTRAINT [FK_ConditionFinancials_xPerilCodeLookup] FOREIGN KEY([PerilCode])
REFERENCES [dbo].[xPerilCodeLookup] ([PerilCode])
GO
ALTER TABLE [dbo].[ConditionFinancials] CHECK CONSTRAINT [FK_ConditionFinancials_xPerilCodeLookup]
GO
ALTER TABLE [dbo].[Conditions]  WITH CHECK ADD  CONSTRAINT [FK_Conditions_Accounts] FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts] ([AccID])
GO
ALTER TABLE [dbo].[Conditions] CHECK CONSTRAINT [FK_Conditions_Accounts]
GO
ALTER TABLE [dbo].[Conditions]  WITH CHECK ADD  CONSTRAINT [FK_Conditions_xCurrency] FOREIGN KEY([Currency])
REFERENCES [dbo].[xCurrency] ([CurrencyCode])
GO
ALTER TABLE [dbo].[Conditions] CHECK CONSTRAINT [FK_Conditions_xCurrency]
GO
ALTER TABLE [dbo].[FlexiAcc]  WITH CHECK ADD  CONSTRAINT [FK_FlexiAcc_Accounts] FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts] ([AccID])
GO
ALTER TABLE [dbo].[FlexiAcc] CHECK CONSTRAINT [FK_FlexiAcc_Accounts]
GO
ALTER TABLE [dbo].[FlexiLoc]  WITH CHECK ADD  CONSTRAINT [FK_FlexiLoc_Locations] FOREIGN KEY([LocID])
REFERENCES [dbo].[Locations] ([LocID])
GO
ALTER TABLE [dbo].[FlexiLoc] CHECK CONSTRAINT [FK_FlexiLoc_Locations]
GO
ALTER TABLE [dbo].[FlexiPol]  WITH CHECK ADD  CONSTRAINT [FK_FlexiPol_Policies] FOREIGN KEY([PolID])
REFERENCES [dbo].[Policies] ([PolID])
GO
ALTER TABLE [dbo].[FlexiPol] CHECK CONSTRAINT [FK_FlexiPol_Policies]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_Locations] FOREIGN KEY([LocID])
REFERENCES [dbo].[Locations] ([LocID])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_Locations]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xAppurtenantStructure] FOREIGN KEY([AppurtenantStructure])
REFERENCES [dbo].[xAppurtenantStructure] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xAppurtenantStructure]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xBasement] FOREIGN KEY([Basement])
REFERENCES [dbo].[xBasement] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xBasement]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xBIPreparedness] FOREIGN KEY([BIPreparedness])
REFERENCES [dbo].[xBIPreparedness] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xBIPreparedness]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xBIRedundancy] FOREIGN KEY([BIRedundancy])
REFERENCES [dbo].[xBIRedundancy] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xBIRedundancy]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xBrickVeneer] FOREIGN KEY([BrickVeneer])
REFERENCES [dbo].[xBrickVeneer] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xBrickVeneer]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xBuildingCondition] FOREIGN KEY([BuildingCondition])
REFERENCES [dbo].[xBuildingCondition] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xBuildingCondition]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xBuildingExteriorOpening] FOREIGN KEY([BuildingExteriorOpening])
REFERENCES [dbo].[xBuildingExteriorOpening] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xBuildingExteriorOpening]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xBuildingShape] FOREIGN KEY([BuildingShape])
REFERENCES [dbo].[xBuildingShape] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xBuildingShape]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xBuildingType] FOREIGN KEY([BuildingType])
REFERENCES [dbo].[xBuildingType] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xBuildingType]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xChimney] FOREIGN KEY([Chimney])
REFERENCES [dbo].[xChimney] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xChimney]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xCladding] FOREIGN KEY([Cladding])
REFERENCES [dbo].[xCladding] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xCladding]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xConstructionQuality] FOREIGN KEY([ConstructionQuality])
REFERENCES [dbo].[xConstructionQuality] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xConstructionQuality]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xContentsFloodVuln] FOREIGN KEY([ContentsFloodVuln])
REFERENCES [dbo].[xContentsFloodVuln] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xContentsFloodVuln]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xContentsQuakeVuln] FOREIGN KEY([ContentsQuakeVuln])
REFERENCES [dbo].[xContentsQuakeVuln] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xContentsQuakeVuln]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xContentsWindVuln] FOREIGN KEY([ContentsWindVuln])
REFERENCES [dbo].[xContentsWindVuln] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xContentsWindVuln]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xCrippleWall] FOREIGN KEY([CrippleWall])
REFERENCES [dbo].[xCrippleWall] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xCrippleWall]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xEquipmentBracing] FOREIGN KEY([EquipmentBracing])
REFERENCES [dbo].[xEquipmentBracing] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xEquipmentBracing]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xExternalDoors] FOREIGN KEY([ExternalDoors])
REFERENCES [dbo].[xExternalDoors] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xExternalDoors]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xFatigue] FOREIGN KEY([Fatigue])
REFERENCES [dbo].[xFatigue] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xFatigue]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xFEMACompliance] FOREIGN KEY([FEMACompliance])
REFERENCES [dbo].[xFEMACompliance] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xFEMACompliance]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xFlashing] FOREIGN KEY([Flashing])
REFERENCES [dbo].[xFlashing] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xFlashing]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xFloodDebrisResilience] FOREIGN KEY([FloodDebrisResilience])
REFERENCES [dbo].[xFloodDebrisResilience] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xFloodDebrisResilience]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xFoundationConnection] FOREIGN KEY([FoundationConnection])
REFERENCES [dbo].[xFoundationConnection] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xFoundationConnection]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xFoundationType] FOREIGN KEY([FoundationType])
REFERENCES [dbo].[xFoundationType] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xFoundationType]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xGlassType] FOREIGN KEY([GlassType])
REFERENCES [dbo].[xGlassType] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xGlassType]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xGroundEquipment] FOREIGN KEY([GroundEquipment])
REFERENCES [dbo].[xGroundEquipment] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xGroundEquipment]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xInternalPartition] FOREIGN KEY([InternalPartition])
REFERENCES [dbo].[xInternalPartition] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xInternalPartition]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xLatticeType] FOREIGN KEY([LatticeType])
REFERENCES [dbo].[xLatticeType] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xLatticeType]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xMechanicalEquipmentSide] FOREIGN KEY([MechanicalEquipmentSide])
REFERENCES [dbo].[xMechanicalEquipmentSide] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xMechanicalEquipmentSide]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xMultiStoryHall] FOREIGN KEY([MultiStoryHall])
REFERENCES [dbo].[xMultiStoryHall] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xMultiStoryHall]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xOrnamentation] FOREIGN KEY([Ornamentation])
REFERENCES [dbo].[xOrnamentation] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xOrnamentation]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xPackaging] FOREIGN KEY([Packaging])
REFERENCES [dbo].[xPackaging] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xPackaging]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xPounding] FOREIGN KEY([Pounding])
REFERENCES [dbo].[xPounding] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xPounding]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xProtection] FOREIGN KEY([Protection])
REFERENCES [dbo].[xProtection] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xProtection]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xRedundancy] FOREIGN KEY([Redundancy])
REFERENCES [dbo].[xRedundancy] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xRedundancy]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xRetrofit] FOREIGN KEY([Retrofit])
REFERENCES [dbo].[xRetrofit] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xRetrofit]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xRoofAnchorage] FOREIGN KEY([RoofAnchorage])
REFERENCES [dbo].[xRoofAnchorage] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xRoofAnchorage]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xRoofAttachedStructures] FOREIGN KEY([RoofAttachedStructures])
REFERENCES [dbo].[xRoofAttachedStructures] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xRoofAttachedStructures]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xRoofCover] FOREIGN KEY([RoofCover])
REFERENCES [dbo].[xRoofCover] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xRoofCover]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xRoofCoverAttachment] FOREIGN KEY([RoofCoverAttachment])
REFERENCES [dbo].[xRoofCoverAttachment] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xRoofCoverAttachment]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xRoofDeck] FOREIGN KEY([RoofDeck])
REFERENCES [dbo].[xRoofDeck] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xRoofDeck]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xRoofDeckAttachment] FOREIGN KEY([RoofDeckAttachment])
REFERENCES [dbo].[xRoofDeckAttachment] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xRoofDeckAttachment]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xRoofEquipment] FOREIGN KEY([RoofEquipment])
REFERENCES [dbo].[xRoofEquipment] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xRoofEquipment]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xRoofFrame] FOREIGN KEY([RoofFrame])
REFERENCES [dbo].[xRoofFrame] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xRoofFrame]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xRoofGeometry] FOREIGN KEY([RoofGeometry])
REFERENCES [dbo].[xRoofGeometry] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xRoofGeometry]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xRoofMaintenance] FOREIGN KEY([RoofMaintenance])
REFERENCES [dbo].[xRoofMaintenance] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xRoofMaintenance]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xRoofPitch] FOREIGN KEY([RoofPitch])
REFERENCES [dbo].[xRoofPitch] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xRoofPitch]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xSalvageProtection] FOREIGN KEY([SalvageProtection])
REFERENCES [dbo].[xSalvageProtection] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xSalvageProtection]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xServiceEquipmentProtection] FOREIGN KEY([ServiceEquipmentProtection])
REFERENCES [dbo].[xServiceEquipmentProtection] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xServiceEquipmentProtection]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xShapeIrregularity] FOREIGN KEY([ShapeIrregularity])
REFERENCES [dbo].[xShapeIrregularity] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xShapeIrregularity]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xShortColumn] FOREIGN KEY([ShortColumn])
REFERENCES [dbo].[xShortColumn] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xShortColumn]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xSmallDebris] FOREIGN KEY([SmallDebris])
REFERENCES [dbo].[xSmallDebris] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xSmallDebris]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xSoftStory] FOREIGN KEY([SoftStory])
REFERENCES [dbo].[xSoftStory] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xSoftStory]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xSpecialEQConstruction] FOREIGN KEY([SpecialEQConstruction])
REFERENCES [dbo].[xSpecialEQConstruction] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xSpecialEQConstruction]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xSprinklerType] FOREIGN KEY([SprinklerType])
REFERENCES [dbo].[xSprinklerType] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xSprinklerType]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xTallOneStory] FOREIGN KEY([TallOneStory])
REFERENCES [dbo].[xTallOneStory] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xTallOneStory]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xTank] FOREIGN KEY([Tank])
REFERENCES [dbo].[xTank] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xTank]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xTerrainRoughness] FOREIGN KEY([TerrainRoughness])
REFERENCES [dbo].[xTerrainRoughness] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xTerrainRoughness]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xTorsion] FOREIGN KEY([Torsion])
REFERENCES [dbo].[xTorsion] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xTorsion]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xTreeExposure] FOREIGN KEY([TreeExposure])
REFERENCES [dbo].[xTreeExposure] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xTreeExposure]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xUnitsBFEU] FOREIGN KEY([BaseFloodElevationUnit])
REFERENCES [dbo].[xUnits] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xUnitsBFEU]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xUnitsBHU] FOREIGN KEY([BuildingHeightUnit])
REFERENCES [dbo].[xUnits] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xUnitsBHU]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xUnitsFDHU] FOREIGN KEY([FloodDefenseHeightUnit])
REFERENCES [dbo].[xUnits] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xUnitsFDHU]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xUnitsFFHU] FOREIGN KEY([FirstFloorHeightUnit])
REFERENCES [dbo].[xUnits] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xUnitsFFHU]
GO
ALTER TABLE [dbo].[LocationDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocationDetails_xUnitsGEU] FOREIGN KEY([GroundElevationUnit])
REFERENCES [dbo].[xUnits] ([Code])
GO
ALTER TABLE [dbo].[LocationDetails] CHECK CONSTRAINT [FK_LocationDetails_xUnitsGEU]
GO
ALTER TABLE [dbo].[LocationFinancials]  WITH CHECK ADD  CONSTRAINT [FK_LocationFinancials_Locations] FOREIGN KEY([LocID])
REFERENCES [dbo].[Locations] ([LocID])
GO
ALTER TABLE [dbo].[LocationFinancials] CHECK CONSTRAINT [FK_LocationFinancials_Locations]
GO
ALTER TABLE [dbo].[LocationFinancials]  WITH CHECK ADD  CONSTRAINT [FK_LocationFinancials_xCoveragesDC] FOREIGN KEY([DedCov])
REFERENCES [dbo].[xCoverages] ([Code])
GO
ALTER TABLE [dbo].[LocationFinancials] CHECK CONSTRAINT [FK_LocationFinancials_xCoveragesDC]
GO
ALTER TABLE [dbo].[LocationFinancials]  WITH CHECK ADD  CONSTRAINT [FK_LocationFinancials_xCoveragesLC] FOREIGN KEY([LimitCov])
REFERENCES [dbo].[xCoverages] ([Code])
GO
ALTER TABLE [dbo].[LocationFinancials] CHECK CONSTRAINT [FK_LocationFinancials_xCoveragesLC]
GO
ALTER TABLE [dbo].[LocationFinancials]  WITH CHECK ADD  CONSTRAINT [FK_LocationFinancials_xDedCode] FOREIGN KEY([DedCode])
REFERENCES [dbo].[xDedCode] ([Code])
GO
ALTER TABLE [dbo].[LocationFinancials] CHECK CONSTRAINT [FK_LocationFinancials_xDedCode]
GO
ALTER TABLE [dbo].[LocationFinancials]  WITH CHECK ADD  CONSTRAINT [FK_LocationFinancials_xDedType] FOREIGN KEY([DedType])
REFERENCES [dbo].[xDedType] ([Code])
GO
ALTER TABLE [dbo].[LocationFinancials] CHECK CONSTRAINT [FK_LocationFinancials_xDedType]
GO
ALTER TABLE [dbo].[LocationFinancials]  WITH CHECK ADD  CONSTRAINT [FK_LocationFinancials_xLimitCode] FOREIGN KEY([LimitCode])
REFERENCES [dbo].[xLimitCode] ([Code])
GO
ALTER TABLE [dbo].[LocationFinancials] CHECK CONSTRAINT [FK_LocationFinancials_xLimitCode]
GO
ALTER TABLE [dbo].[LocationFinancials]  WITH CHECK ADD  CONSTRAINT [FK_LocationFinancials_xLimitType] FOREIGN KEY([LimitType])
REFERENCES [dbo].[xLimitType] ([Code])
GO
ALTER TABLE [dbo].[LocationFinancials] CHECK CONSTRAINT [FK_LocationFinancials_xLimitType]
GO
ALTER TABLE [dbo].[LocationFinancials]  WITH CHECK ADD  CONSTRAINT [FK_LocationFinancials_xPerilCodeLookup] FOREIGN KEY([PerilCode])
REFERENCES [dbo].[xPerilCodeLookup] ([PerilCode])
GO
ALTER TABLE [dbo].[LocationFinancials] CHECK CONSTRAINT [FK_LocationFinancials_xPerilCodeLookup]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Accounts] FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts] ([AccID])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_Accounts]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_xAddressMatch] FOREIGN KEY([AddressMatch])
REFERENCES [dbo].[xAddressMatch] ([Code])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_xAddressMatch]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_xConstruction] FOREIGN KEY([ConstructionCode])
REFERENCES [dbo].[xConstruction] ([Code])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_xConstruction]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_xCountryCodes] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[xCountryCodes] ([CountryCode])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_xCountryCodes]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_xCurrency] FOREIGN KEY([Currency])
REFERENCES [dbo].[xCurrency] ([CurrencyCode])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_xCurrency]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_xOccupancy] FOREIGN KEY([OccupancyCode])
REFERENCES [dbo].[xOccupancy] ([Code])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_xOccupancy]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_xPayoutBasis] FOREIGN KEY([PayoutBasis])
REFERENCES [dbo].[xPayoutBasis] ([Code])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_xPayoutBasis]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_xPerilCodeLookup] FOREIGN KEY([PerilsCovered])
REFERENCES [dbo].[xPerilCodeLookup] ([PerilCode])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_xPerilCodeLookup]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_xUnits] FOREIGN KEY([FloorAreaUnit])
REFERENCES [dbo].[xUnits] ([Code])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_xUnits]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_xUnits1] FOREIGN KEY([FloorAreaUnit])
REFERENCES [dbo].[xUnits] ([Code])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_xUnits1]
GO
ALTER TABLE [dbo].[LocCond]  WITH CHECK ADD  CONSTRAINT [FK_LocCond_Conditions] FOREIGN KEY([CondID])
REFERENCES [dbo].[Conditions] ([CondID])
GO
ALTER TABLE [dbo].[LocCond] CHECK CONSTRAINT [FK_LocCond_Conditions]
GO
ALTER TABLE [dbo].[LocCond]  WITH CHECK ADD  CONSTRAINT [FK_LocCond_Locations] FOREIGN KEY([LocID])
REFERENCES [dbo].[Locations] ([LocID])
GO
ALTER TABLE [dbo].[LocCond] CHECK CONSTRAINT [FK_LocCond_Locations]
GO
ALTER TABLE [dbo].[LocCond]  WITH CHECK ADD  CONSTRAINT [FK_LocCond_Policies] FOREIGN KEY([PolID])
REFERENCES [dbo].[Policies] ([PolID])
GO
ALTER TABLE [dbo].[LocCond] CHECK CONSTRAINT [FK_LocCond_Policies]
GO
ALTER TABLE [dbo].[LocPol]  WITH CHECK ADD  CONSTRAINT [FK_LocPol_Locations] FOREIGN KEY([LocID])
REFERENCES [dbo].[Locations] ([LocID])
GO
ALTER TABLE [dbo].[LocPol] CHECK CONSTRAINT [FK_LocPol_Locations]
GO
ALTER TABLE [dbo].[LocPol]  WITH CHECK ADD  CONSTRAINT [FK_LocPol_Policies] FOREIGN KEY([PolID])
REFERENCES [dbo].[Policies] ([PolID])
GO
ALTER TABLE [dbo].[LocPol] CHECK CONSTRAINT [FK_LocPol_Policies]
GO
ALTER TABLE [dbo].[Policies]  WITH CHECK ADD  CONSTRAINT [FK_Layers_Layers] FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts] ([AccID])
GO
ALTER TABLE [dbo].[Policies] CHECK CONSTRAINT [FK_Layers_Layers]
GO
ALTER TABLE [dbo].[Policies]  WITH CHECK ADD  CONSTRAINT [FK_Policies_LOB] FOREIGN KEY([LOBID])
REFERENCES [dbo].[LOB] ([LOBID])
GO
ALTER TABLE [dbo].[Policies] CHECK CONSTRAINT [FK_Policies_LOB]
GO
ALTER TABLE [dbo].[Policies]  WITH CHECK ADD  CONSTRAINT [FK_Policies_Producers] FOREIGN KEY([ProducerID])
REFERENCES [dbo].[Producers] ([ProducerID])
GO
ALTER TABLE [dbo].[Policies] CHECK CONSTRAINT [FK_Policies_Producers]
GO
ALTER TABLE [dbo].[Policies]  WITH CHECK ADD  CONSTRAINT [FK_Policies_xCurrency] FOREIGN KEY([Currency])
REFERENCES [dbo].[xCurrency] ([CurrencyCode])
GO
ALTER TABLE [dbo].[Policies] CHECK CONSTRAINT [FK_Policies_xCurrency]
GO
ALTER TABLE [dbo].[Policies]  WITH CHECK ADD  CONSTRAINT [FK_Policies_xPerilCodeLookup] FOREIGN KEY([PerilsCovered])
REFERENCES [dbo].[xPerilCodeLookup] ([PerilCode])
GO
ALTER TABLE [dbo].[Policies] CHECK CONSTRAINT [FK_Policies_xPerilCodeLookup]
GO
ALTER TABLE [dbo].[PolicyFinancials]  WITH CHECK ADD  CONSTRAINT [FK_PolicyFinancials_Policies] FOREIGN KEY([PolID])
REFERENCES [dbo].[Policies] ([PolID])
GO
ALTER TABLE [dbo].[PolicyFinancials] CHECK CONSTRAINT [FK_PolicyFinancials_Policies]
GO
ALTER TABLE [dbo].[PolicyFinancials]  WITH CHECK ADD  CONSTRAINT [FK_PolicyFinancials_xCoveragesDC] FOREIGN KEY([DedCov])
REFERENCES [dbo].[xCoverages] ([Code])
GO
ALTER TABLE [dbo].[PolicyFinancials] CHECK CONSTRAINT [FK_PolicyFinancials_xCoveragesDC]
GO
ALTER TABLE [dbo].[PolicyFinancials]  WITH CHECK ADD  CONSTRAINT [FK_PolicyFinancials_xCoveragesLC] FOREIGN KEY([LimitCov])
REFERENCES [dbo].[xCoverages] ([Code])
GO
ALTER TABLE [dbo].[PolicyFinancials] CHECK CONSTRAINT [FK_PolicyFinancials_xCoveragesLC]
GO
ALTER TABLE [dbo].[PolicyFinancials]  WITH CHECK ADD  CONSTRAINT [FK_PolicyFinancials_xDedCode] FOREIGN KEY([DedCode])
REFERENCES [dbo].[xDedCode] ([Code])
GO
ALTER TABLE [dbo].[PolicyFinancials] CHECK CONSTRAINT [FK_PolicyFinancials_xDedCode]
GO
ALTER TABLE [dbo].[PolicyFinancials]  WITH CHECK ADD  CONSTRAINT [FK_PolicyFinancials_xDedType] FOREIGN KEY([DedType])
REFERENCES [dbo].[xDedType] ([Code])
GO
ALTER TABLE [dbo].[PolicyFinancials] CHECK CONSTRAINT [FK_PolicyFinancials_xDedType]
GO
ALTER TABLE [dbo].[PolicyFinancials]  WITH CHECK ADD  CONSTRAINT [FK_PolicyFinancials_xLimitCode] FOREIGN KEY([LimitCode])
REFERENCES [dbo].[xLimitCode] ([Code])
GO
ALTER TABLE [dbo].[PolicyFinancials] CHECK CONSTRAINT [FK_PolicyFinancials_xLimitCode]
GO
ALTER TABLE [dbo].[PolicyFinancials]  WITH CHECK ADD  CONSTRAINT [FK_PolicyFinancials_xLimitType] FOREIGN KEY([LimitType])
REFERENCES [dbo].[xLimitType] ([Code])
GO
ALTER TABLE [dbo].[PolicyFinancials] CHECK CONSTRAINT [FK_PolicyFinancials_xLimitType]
GO
ALTER TABLE [dbo].[PolicyFinancials]  WITH CHECK ADD  CONSTRAINT [FK_PolicyFinancials_xPerilCodeLookup] FOREIGN KEY([PerilCode])
REFERENCES [dbo].[xPerilCodeLookup] ([PerilCode])
GO
ALTER TABLE [dbo].[PolicyFinancials] CHECK CONSTRAINT [FK_PolicyFinancials_xPerilCodeLookup]
GO
ALTER TABLE [dbo].[PortAcc]  WITH CHECK ADD  CONSTRAINT [FK_PortAcc_Accounts] FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts] ([AccID])
GO
ALTER TABLE [dbo].[PortAcc] CHECK CONSTRAINT [FK_PortAcc_Accounts]
GO
ALTER TABLE [dbo].[PortAcc]  WITH CHECK ADD  CONSTRAINT [FK_ProgAcc_Portfolios] FOREIGN KEY([PortID])
REFERENCES [dbo].[Portfolios] ([PortID])
GO
ALTER TABLE [dbo].[PortAcc] CHECK CONSTRAINT [FK_ProgAcc_Portfolios]
GO
ALTER TABLE [dbo].[ReinsAcc]  WITH CHECK ADD  CONSTRAINT [FK_ReinsAcc_Accounts] FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts] ([AccID])
GO
ALTER TABLE [dbo].[ReinsAcc] CHECK CONSTRAINT [FK_ReinsAcc_Accounts]
GO
ALTER TABLE [dbo].[ReinsAcc]  WITH CHECK ADD  CONSTRAINT [FK_ReinsAcc_ReinsAcc] FOREIGN KEY([ReinsID])
REFERENCES [dbo].[ReinsuranceInfo] ([ReinsID])
GO
ALTER TABLE [dbo].[ReinsAcc] CHECK CONSTRAINT [FK_ReinsAcc_ReinsAcc]
GO
ALTER TABLE [dbo].[ReinsLoc]  WITH CHECK ADD  CONSTRAINT [FK_ReinsLoc_Locations] FOREIGN KEY([LocID])
REFERENCES [dbo].[Locations] ([LocID])
GO
ALTER TABLE [dbo].[ReinsLoc] CHECK CONSTRAINT [FK_ReinsLoc_Locations]
GO
ALTER TABLE [dbo].[ReinsLoc]  WITH CHECK ADD  CONSTRAINT [FK_ReinsLoc_ReinsLoc] FOREIGN KEY([ReinsID])
REFERENCES [dbo].[ReinsuranceInfo] ([ReinsID])
GO
ALTER TABLE [dbo].[ReinsLoc] CHECK CONSTRAINT [FK_ReinsLoc_ReinsLoc]
GO
ALTER TABLE [dbo].[ReinsLoc]  WITH CHECK ADD  CONSTRAINT [FK_ReinsLoc_xRiskLevel] FOREIGN KEY([RiskLevel])
REFERENCES [dbo].[xRiskLevel] ([Code])
GO
ALTER TABLE [dbo].[ReinsLoc] CHECK CONSTRAINT [FK_ReinsLoc_xRiskLevel]
GO
ALTER TABLE [dbo].[ReinsPol]  WITH CHECK ADD  CONSTRAINT [FK_ReinsPol_ReinsPol] FOREIGN KEY([PolID])
REFERENCES [dbo].[Policies] ([PolID])
GO
ALTER TABLE [dbo].[ReinsPol] CHECK CONSTRAINT [FK_ReinsPol_ReinsPol]
GO
ALTER TABLE [dbo].[ReinsPol]  WITH CHECK ADD  CONSTRAINT [FK_ReinsPol_ReinsuranceInfo] FOREIGN KEY([ReinsID])
REFERENCES [dbo].[ReinsuranceInfo] ([ReinsID])
GO
ALTER TABLE [dbo].[ReinsPol] CHECK CONSTRAINT [FK_ReinsPol_ReinsuranceInfo]
GO
ALTER TABLE [dbo].[ReinsPort]  WITH CHECK ADD  CONSTRAINT [FK_ReinsPort_Portfolios] FOREIGN KEY([PortID])
REFERENCES [dbo].[Portfolios] ([PortID])
GO
ALTER TABLE [dbo].[ReinsPort] CHECK CONSTRAINT [FK_ReinsPort_Portfolios]
GO
ALTER TABLE [dbo].[ReinsPort]  WITH CHECK ADD  CONSTRAINT [FK_ReinsPort_ReinsuranceInfo] FOREIGN KEY([ReinsID])
REFERENCES [dbo].[ReinsuranceInfo] ([ReinsID])
GO
ALTER TABLE [dbo].[ReinsPort] CHECK CONSTRAINT [FK_ReinsPort_ReinsuranceInfo]
GO
ALTER TABLE [dbo].[ReinsReinstatements]  WITH CHECK ADD  CONSTRAINT [FK_ReinsReinstatements_ReinsReinstatements] FOREIGN KEY([ReinsID])
REFERENCES [dbo].[ReinsuranceInfo] ([ReinsID])
GO
ALTER TABLE [dbo].[ReinsReinstatements] CHECK CONSTRAINT [FK_ReinsReinstatements_ReinsReinstatements]
GO
ALTER TABLE [dbo].[ReinsuranceInfo]  WITH CHECK ADD  CONSTRAINT [FK_ReinsuranceInfo_xAttachmentBasis] FOREIGN KEY([AttachmentBasis])
REFERENCES [dbo].[xAttachmentBasis] ([Code])
GO
ALTER TABLE [dbo].[ReinsuranceInfo] CHECK CONSTRAINT [FK_ReinsuranceInfo_xAttachmentBasis]
GO
ALTER TABLE [dbo].[ReinsuranceInfo]  WITH CHECK ADD  CONSTRAINT [FK_ReinsuranceInfo_xCurrency] FOREIGN KEY([Currency])
REFERENCES [dbo].[xCurrency] ([CurrencyCode])
GO
ALTER TABLE [dbo].[ReinsuranceInfo] CHECK CONSTRAINT [FK_ReinsuranceInfo_xCurrency]
GO
ALTER TABLE [dbo].[ReinsuranceInfo]  WITH CHECK ADD  CONSTRAINT [FK_ReinsuranceInfo_xPerilCodeLookup] FOREIGN KEY([PerilCode])
REFERENCES [dbo].[xPerilCodeLookup] ([PerilCode])
GO
ALTER TABLE [dbo].[ReinsuranceInfo] CHECK CONSTRAINT [FK_ReinsuranceInfo_xPerilCodeLookup]
GO
ALTER TABLE [dbo].[ReinsuranceInfo]  WITH CHECK ADD  CONSTRAINT [FK_ReinsuranceInfo_xReinsType] FOREIGN KEY([ReinsType])
REFERENCES [dbo].[xReinsType] ([Code])
GO
ALTER TABLE [dbo].[ReinsuranceInfo] CHECK CONSTRAINT [FK_ReinsuranceInfo_xReinsType]
GO
ALTER TABLE [dbo].[ReinsuranceScope]  WITH CHECK ADD  CONSTRAINT [FK_ReinsuranceScope_ReinsuranceInfo] FOREIGN KEY([ReinsID])
REFERENCES [dbo].[ReinsuranceInfo] ([ReinsID])
GO
ALTER TABLE [dbo].[ReinsuranceScope] CHECK CONSTRAINT [FK_ReinsuranceScope_ReinsuranceInfo]
GO
ALTER TABLE [dbo].[ReinsuranceScope]  WITH CHECK ADD  CONSTRAINT [FK_ReinsuranceScope_ReinsuranceScope] FOREIGN KEY([RiskLevel])
REFERENCES [dbo].[xRiskLevel] ([Code])
GO
ALTER TABLE [dbo].[ReinsuranceScope] CHECK CONSTRAINT [FK_ReinsuranceScope_ReinsuranceScope]
GO
ALTER TABLE [dbo].[StepFunctions]  WITH CHECK ADD  CONSTRAINT [FK_StepFunctions_Policies] FOREIGN KEY([PolID])
REFERENCES [dbo].[Policies] ([PolID])
GO
ALTER TABLE [dbo].[StepFunctions] CHECK CONSTRAINT [FK_StepFunctions_Policies]
GO
ALTER TABLE [dbo].[StepFunctions]  WITH CHECK ADD  CONSTRAINT [FK_StepFunctions_xStepTriggerType] FOREIGN KEY([StepTriggerType])
REFERENCES [dbo].[xStepTriggerType] ([Code])
GO
ALTER TABLE [dbo].[StepFunctions] CHECK CONSTRAINT [FK_StepFunctions_xStepTriggerType]
GO
ALTER TABLE [dbo].[Steps]  WITH CHECK ADD  CONSTRAINT [FK_Steps_StepFunctions] FOREIGN KEY([StepFuncID])
REFERENCES [dbo].[StepFunctions] ([StepFuncID])
GO
ALTER TABLE [dbo].[Steps] CHECK CONSTRAINT [FK_Steps_StepFunctions]
GO
ALTER TABLE [dbo].[Steps]  WITH CHECK ADD  CONSTRAINT [FK_Steps_xCoverages] FOREIGN KEY([StepTriggerCov])
REFERENCES [dbo].[xCoverages] ([Code])
GO
ALTER TABLE [dbo].[Steps] CHECK CONSTRAINT [FK_Steps_xCoverages]
GO
ALTER TABLE [dbo].[Steps]  WITH CHECK ADD  CONSTRAINT [FK_Steps_xLimitType_PayoutType] FOREIGN KEY([PayoutType])
REFERENCES [dbo].[xLimitType] ([Code])
GO
ALTER TABLE [dbo].[Steps] CHECK CONSTRAINT [FK_Steps_xLimitType_PayoutType]
GO
ALTER TABLE [dbo].[Steps]  WITH CHECK ADD  CONSTRAINT [FK_Steps_xLimitType_TriggerType] FOREIGN KEY([TriggerType])
REFERENCES [dbo].[xLimitType] ([Code])
GO
ALTER TABLE [dbo].[Steps] CHECK CONSTRAINT [FK_Steps_xLimitType_TriggerType]
GO
ALTER TABLE [dbo].[WorkersComp]  WITH CHECK ADD  CONSTRAINT [FK_WorkersComp_WorkersComp] FOREIGN KEY([LocID])
REFERENCES [dbo].[Locations] ([LocID])
GO
ALTER TABLE [dbo].[WorkersComp] CHECK CONSTRAINT [FK_WorkersComp_WorkersComp]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "PolicyFinancials"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 4590
         Alias = 2085
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPolicyFinancials'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPolicyFinancials'
GO
USE [master]
GO
ALTER DATABASE [OED] SET  READ_WRITE 
GO
