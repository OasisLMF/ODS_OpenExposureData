USE [OED]

DELETE FROM xPerilCodeLookup

SELECT 0 as PerilCode, qeq.EQ as QEQ, qff.EQ as QFF, qts.EQ as QTS, qsl.EQ as QSL, qls.EQ as QLS, qlf.EQ as QLF,
	wtc.eq as WTC, wec.eq as WEC, wss.eq as WSS, orf.eq as ORF, osf.eq as OSF, xsl.eq as XSL,
	xtd.eq as XTD, xhl.eq as XHL, zsn.eq as ZSN, zic.eq as ZIC, zfz.eq as ZFZ, bfr.eq as BFR,
	bbf.eq as BBF, mnt.eq as MNT, mtr.EQ as MTR, xlt.EQ as XLT, zst.EQ as ZST, bsk.EQ as BSK,
	CAST(Null as varchar(100)) as PerilAbbreviation, CAST(Null as varchar(800)) as PerilDescription
INTO #temp
FROM xEQ qeq CROSS JOIN xEQ qff
	CROSS JOIN xEQ qts
	CROSS JOIN xEQ qsl
	CROSS JOIN xEQ qls
	CROSS JOIN xEQ qlf
	CROSS JOIN xEQ wtc
	CROSS JOIN xEQ wec
	CROSS JOIN xEQ wSS
	CROSS JOIN xEQ orf
	CROSS JOIN xEQ osf
	CROSS JOIN xEQ xsl
	CROSS JOIN xEQ xtd
	CROSS JOIN xEQ xhl
	CROSS JOIN xEQ zSN
	CROSS JOIN xEQ zIC
	CROSS JOIN xEQ zFZ
	CROSS JOIN xEQ bfr
	CROSS JOIN xEQ bbf
	CROSS JOIN xEQ mnt
	CROSS JOIN xEQ MTR
	CROSS JOIN xEQ XLT
	CROSS JOIN xEQ ZST
	CROSS JOIN xEQ BSK

UPDATE #temp
SET PerilCode = QEQ * 1 + QFF * 2  + QTS * 4 + QSL * 8 + QLS * 16 + QLF * 32 + WTC * 64 + WEC * 128 + WSS * 256 +
		ORF * 512 + OSF * 1024 + XSL * 2048 + XTD * 4096 + XHL * 8192 + ZSN * 16384 + ZIC * 32768 +
		ZFZ * 65536 + BFR * 131072 + BBF * 262144 + MNT * 524288 + MTR * 1048576 + XLT * 2097152 + ZST * 4194304
		+ BSK * 8388608,
	PerilAbbreviation = CASE QEQ WHEN 0 THEN '' ELSE 'QEQ;' END + 
		 CASE QFF WHEN 0 THEN '' ELSE 'QFF;' END +
		 CASE QTS WHEN 0 THEN '' ELSE 'QTS;' END + 
		 CASE QSL WHEN 0 THEN '' ELSE 'QSL;' END + 
		 CASE QLS WHEN 0 THEN '' ELSE 'QLS;' END + 
		 CASE QLF WHEN 0 THEN '' ELSE 'QLF;' END + 
		 CASE WTC WHEN 0 THEN '' ELSE 'WTC;' END + 
		 CASE WEC WHEN 0 THEN '' ELSE 'WEC;' END + 
		 CASE WSS WHEN 0 THEN '' ELSE 'WSS;' END +
		 CASE ORF WHEN 0 THEN '' ELSE 'ORF;' END + 
		 CASE OSF WHEN 0 THEN '' ELSE 'OSF;' END + 
		 CASE XSL WHEN 0 THEN '' ELSE 'XSL;' END + 
		 CASE XTD WHEN 0 THEN '' ELSE 'XTD;' END + 
		 CASE XHL WHEN 0 THEN '' ELSE 'XHL;' END + 
		 CASE ZSN WHEN 0 THEN '' ELSE 'ZSN;' END + 
		 CASE ZIC WHEN 0 THEN '' ELSE 'ZIC;' END +
		 CASE ZFZ WHEN 0 THEN '' ELSE 'ZFZ;' END + 
		 CASE BFR WHEN 0 THEN '' ELSE 'BFR;' END + 
		 CASE BBF WHEN 0 THEN '' ELSE 'BBF;' END + 
		 CASE MNT WHEN 0 THEN '' ELSE 'MNT;' END +
		 CASE MTR WHEN 0 THEN '' ELSE 'MTR;' END +
		 CASE XLT WHEN 0 THEN '' ELSE 'XLT;' END +
		 CASE ZST WHEN 0 THEN '' ELSE 'ZST;' END + 
		 CASE BSK WHEN 0 THEN '' ELSE 'BSK;' END,
	PerilDescription = CASE QEQ WHEN 0 THEN '' ELSE 'Earthquake - Shake only;' END + 
		 CASE QFF WHEN 0 THEN '' ELSE 'Fire Following;' END +
		 CASE QTS WHEN 0 THEN '' ELSE 'Tsunami;' END + 
		 CASE QSL WHEN 0 THEN '' ELSE 'Sprinkler Leakage;' END + 
		 CASE QLS WHEN 0 THEN '' ELSE 'Landslide;' END + 
		 CASE QLF WHEN 0 THEN '' ELSE 'Liquefaction;' END + 
		 CASE WTC WHEN 0 THEN '' ELSE 'Tropical Cyclone;' END + 
		 CASE WEC WHEN 0 THEN '' ELSE 'Extra Tropical Cyclone;' END + 
		 CASE WSS WHEN 0 THEN '' ELSE 'Storm Surge;' END +
		 CASE ORF WHEN 0 THEN '' ELSE 'River / Fluvial Flood;' END + 
		 CASE OSF WHEN 0 THEN '' ELSE 'Flash / Surface / Pluvial Flood;' END + 
		 CASE XSL WHEN 0 THEN '' ELSE 'Straight-line wind;' END + 
		 CASE XTD WHEN 0 THEN '' ELSE 'Tornado;' END + 
		 CASE XHL WHEN 0 THEN '' ELSE 'Hail;' END + 
		 CASE ZSN WHEN 0 THEN '' ELSE 'Snow;' END + 
		 CASE ZIC WHEN 0 THEN '' ELSE 'Ice;' END +
		 CASE ZFZ WHEN 0 THEN '' ELSE 'Freeze;' END + 
		 CASE BFR WHEN 0 THEN '' ELSE 'NonCat;' END + 
		 CASE BBF WHEN 0 THEN '' ELSE 'Wildfire / Bushfire;' END + 
		 CASE MNT WHEN 0 THEN '' ELSE 'NBCR Terrorism;' END +
		 CASE MTR WHEN 0 THEN '' ELSE 'Conventional Terrorism;' END +
		 CASE XLT WHEN 0 THEN '' ELSE 'Lightning;' END +
		 CASE ZST WHEN 0 THEN '' ELSE 'Winterstorm Wind;' END +
		 CASE BSK WHEN 0 THEN '' ELSE 'Smoke;' END

--remove last semi-colons from each row:
UPDATE #temp
SET PerilAbbreviation = CASE len(PerilAbbreviation) WHEN 0 THEN '' ELSE LEFT(PerilAbbreviation, len(PerilAbbreviation)-1) END,
	PerilDescription = CASE len(PerilDescription) WHEN 0 THEN '' ELSE LEFT(PerilDescription, len(PerilDescription)-1) END


INSERT INTO xPerilCodeLookup
SELECT * 
FROM #temp
ORDER BY PerilCode

DROP TABLE #temp

/*
SELECT * 
FROM xPerilCodeLookup 
--WHERE len(PerilAbbreviation) = 3
ORDER BY PerilCode
*/

-------------------------------------------------------------------------------
--Populate PerilCodes

DELETE FROM xPerilCodes

INSERT INTO xPerilCodes ([PerilCode]
	,[PerilDescription]
	,[Abbreviation]
	,[Grouped])
VALUES (1, 'Earthquake - Shake only', 'QEQ', 'No'),
	(2, 'Fire Following', 'QFF', 'No'),
	(4, 'Tsunami', 'QTS', 'No'),
	(8, 'Sprinkler Leakage', 'QSL', 'No'),
	(16, 'Landslide', 'QLS', 'No'),
	(32, 'Liquefaction', 'QLF', 'No'),
	(64, 'Tropical Cyclone', 'WTC', 'No'),
	(128, 'Extra Tropical Cyclone', 'WEC', 'No'),
	(256, 'Storm Surge', 'WSS', 'No'),
	(512, 'River / Fluvial Flood', 'ORF', 'No'),
	(1024, 'Flash / Surface / Pluvial Flood', 'OSF', 'No'),
	(2048, 'Straight-line wind', 'XSL', 'No'),
	(4096, 'Tornado', 'XTD', 'No'),
	(8192, 'Hail', 'XHL', 'No'),
	(16384, 'Snow', 'ZSN', 'No'),
	(32768, 'Ice', 'ZIC', 'No'),
	(65536, 'Freeze', 'ZFZ', 'No'),
	(131072, 'NonCat', 'BFR', 'No'),
	(262144, 'Wildfire / Bushfire', 'BBF', 'No'),
	(524288, 'NBCR Terrorism', 'MNT', 'No'),
	(1048576, 'Conventional Terrorism', 'MTR', 'No'),
	(2097152, 'Lightning', 'XLT', 'No'),
	(4194304, 'Winterstorm Wind', 'ZST', 'No'),
	(8388608, 'Smoke', 'BSK', 'No'),
	(63, 'All EQ perils', 'QQ1', 'Yes'),
	(448, 'Windstorm with storm surge', 'WW1', 'Yes'),
	(192, 'Windstorm w/o storm surge', 'WW2', 'Yes'),
	(1536, 'Flood w/o storm surge', 'OO1', 'Yes'),
	(4308992, 'Winter storm', 'ZZ1', 'Yes'),
	(2111488, 'Convective Storm', 'XX1', 'Yes'),
	(6420480, 'Convective storm (incl winter storm)', 'XZ1', 'Yes'),
	(1572864, 'Terrorism', 'MM1', 'Yes'),
	(8650752, 'Wildfire with smoke', 'BB1', 'Yes'),
	(16777215, 'All perils', 'AA1', 'Yes')

/*
SELECT *
FROM xPerilCodes
*/
