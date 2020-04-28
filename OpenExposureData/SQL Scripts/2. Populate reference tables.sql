USE [OED]
GO
INSERT [dbo].[xAddressMatch] ([Code], [CodeDescription]) VALUES (0, N'Ungeocoded')
GO
INSERT [dbo].[xAddressMatch] ([Code], [CodeDescription]) VALUES (1, N'User Coordinate')
GO
INSERT [dbo].[xAddressMatch] ([Code], [CodeDescription]) VALUES (2, N'Exact Address - Building')
GO
INSERT [dbo].[xAddressMatch] ([Code], [CodeDescription]) VALUES (3, N'Parcel')
GO
INSERT [dbo].[xAddressMatch] ([Code], [CodeDescription]) VALUES (4, N'Interpolated Street')
GO
INSERT [dbo].[xAddressMatch] ([Code], [CodeDescription]) VALUES (5, N'High Resolution Postcode')
GO
INSERT [dbo].[xAddressMatch] ([Code], [CodeDescription]) VALUES (6, N'Block Group / Streetname')
GO
INSERT [dbo].[xAddressMatch] ([Code], [CodeDescription]) VALUES (7, N'Postal Code')
GO
INSERT [dbo].[xAddressMatch] ([Code], [CodeDescription]) VALUES (8, N'City Centroid')
GO
INSERT [dbo].[xAddressMatch] ([Code], [CodeDescription]) VALUES (9, N'Area')
GO
INSERT [dbo].[xAddressMatch] ([Code], [CodeDescription]) VALUES (10, N'CRESTA (low res)')
GO
INSERT [dbo].[xAddressMatch] ([Code], [CodeDescription]) VALUES (20, N'Country')
GO
INSERT [dbo].[xAppurtenantStructure] ([Code], [CodeDescription]) VALUES (0, N'Unknown / Default')
GO
INSERT [dbo].[xAppurtenantStructure] ([Code], [CodeDescription]) VALUES (1, N'Detached garage')
GO
INSERT [dbo].[xAppurtenantStructure] ([Code], [CodeDescription]) VALUES (2, N'Pool enclosures')
GO
INSERT [dbo].[xAppurtenantStructure] ([Code], [CodeDescription]) VALUES (3, N'Shed')
GO
INSERT [dbo].[xAppurtenantStructure] ([Code], [CodeDescription]) VALUES (4, N'Masonry boundary wall')
GO
INSERT [dbo].[xAppurtenantStructure] ([Code], [CodeDescription]) VALUES (5, N'Other fences')
GO
INSERT [dbo].[xAppurtenantStructure] ([Code], [CodeDescription]) VALUES (6, N'No appurtenant structures')
GO
INSERT [dbo].[xAppurtenantStructure] ([Code], [CodeDescription]) VALUES (7, N'No pool enclosures')
GO
INSERT [dbo].[xAppurtenantStructure] ([Code], [CodeDescription]) VALUES (8, N'Detached screen enclosure / Lanai')
GO
INSERT [dbo].[xAppurtenantStructure] ([Code], [CodeDescription]) VALUES (9, N'Standard ground mount Solar Panels')
GO
INSERT [dbo].[xAppurtenantStructure] ([Code], [CodeDescription]) VALUES (10, N'Pole mount Solar Panels')
GO
INSERT [dbo].[xAppurtenantStructure] ([Code], [CodeDescription]) VALUES (11, N'Car Port')
GO
INSERT [dbo].[xAppurtenantStructure] ([Code], [CodeDescription]) VALUES (12, N'Car Port with Storage')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'101', N'Eisenstadt (Stadt)', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'102', N'Rust', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'103', N'Eisenstadt (Land)', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'104', N'Güssing', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'105', N'Jennersdorf', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'106', N'Mattersburg', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'107', N'Neusiedl am See', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'108', N'Oberpullendorf', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'109', N'Oberwart', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'201', N'Klagenfurt (Stadt)', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'202', N'Villach (Stadt)', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'203', N'Hermagor', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'204', N'Klagenfurt Land', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'205', N'Sankt Veit an der Glan', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'206', N'Spittal an der Drau', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'207', N'Villach Land', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'208', N'Völkermarkt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'209', N'Wolfsberg', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'210', N'Feldkirchen', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'301', N'Krems an der Donau (Stadt)', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'302', N'St. Pölten (Stadt)', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'303', N'Waidhofen an der Ybbs', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'304', N'Wiener Neustadt (Stadt)', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'305', N'Amstetten', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'306', N'Baden', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'307', N'Bruck an der Leitha', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'308', N'Gänserndorf', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'309', N'Gmünd', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'310', N'Hollabrunn', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'311', N'Horn', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'312', N'Korneuburg', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'313', N'Krems an der Donau (Land)', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'314', N'Lilienfeld', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'315', N'Melk', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'316', N'Mistelbach', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'317', N'Mödling', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'318', N'Neunkirchen', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'319', N'St. Pölten (Land)', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'320', N'Scheibbs', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'321', N'Tulln', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'322', N'Waidhofen an der Thaya', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'323', N'Wiener Neustadt (Land)', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'324', N'Wien-Umgebung', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'325', N'Zwettl', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'401', N'Linz', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'402', N'Steyr', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'403', N'Wels', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'404', N'Braunau am Inn', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'405', N'Eferding', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'406', N'Freistadt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'407', N'Gmunden', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'408', N'Grieskirchen', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'409', N'Kirchdorf an der Krems', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'410', N'Linz-Land', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'411', N'Perg', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'412', N'Ried im Innkreis', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'413', N'Rohrbach', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'414', N'Schärding', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'415', N'Steyr-Land', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'416', N'Urfahr-Umgebung', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'417', N'Vöcklabruck', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'418', N'Wels-Land', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'501', N'Salzburg', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'502', N'Hallein', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'503', N'Salzburg-Umgebung', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'504', N'Sankt Johann im Pongau', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'505', N'Tamsweg', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'506', N'Zell am See', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'601', N'Graz', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'602', N'Bruck an der Mur', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'603', N'Deutschlandsberg', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'604', N'Feldbach', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'605', N'Fürstenfeld', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'606', N'Graz-Umgebung', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'607', N'Hartberg', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'608', N'Judenburg', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'609', N'Knittelfeld', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'610', N'Leibnitz', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'611', N'Leoben', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'612', N'Liezen', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'613', N'Mürzzuschlag', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'614', N'Murau', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'615', N'Bad Radkersburg', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'616', N'Voitsberg', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'617', N'Weiz', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'701', N'Innsbruck-Stadt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'702', N'Imst', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'703', N'Innsbruck-Land', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'704', N'Kitzbühel', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'705', N'Kufstein', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'706', N'Landeck', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'707', N'Lienz', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'708', N'Reutte', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'709', N'Schwaz', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'801', N'Bludenz', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'802', N'Bregenz', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'803', N'Dornbirn', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'804', N'Feldkirch', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'901', N'Wien I Innere Stadt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'902', N'Wien II Leopoldstadt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'903', N'Wien III Landstraße', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'904', N'Wien IV Wieden', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'905', N'Wien V Margareten', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'906', N'Wien VI Mariahilf', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'907', N'Wien VII Neubau', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'908', N'Wien VIII Josefstadt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'909', N'Wien IX Alsergrund', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'910', N'Wien X Favoriten', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'911', N'Wien XI Simmering', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'912', N'Wien XII Meidling', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'913', N'Wien XIII Hietzing', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'914', N'Wien XIV Penzing', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'915', N'Wien XV Rudolfsheim-Fünfhaus', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'916', N'Wien XVI Ottakring', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'917', N'Wien XVII Hernals', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'918', N'Wien XVIII Währing', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'919', N'Wien XIX Döbling', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'920', N'Wien XX Brigittenau', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'921', N'Wien XXI Floridsdorf', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'922', N'Wien XXII Dounaustadt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AT', N'923', N'Wien XXIII Liesing', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AU', N'ACT', N'Australian Capital Territory', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AU', N'NSW', N'New South Wales', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AU', N'NT', N'Northern Territory', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AU', N'QDL', N'Queensland', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AU', N'SA', N'South Australia', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AU', N'TAS', N'Tasmania', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AU', N'VIC', N'Victoria', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'AU', N'WA', N'Western Australia', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BB', N'1', N'Christ Church', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BB', N'10', N'St. Philip', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BB', N'11', N'St. Thomas', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BB', N'2', N'St. Andrew', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BB', N'3', N'St. George', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BB', N'4', N'St. James', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BB', N'5', N'St. John', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BB', N'6', N'St. Joseph', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BB', N'7', N'St. Lucy', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BB', N'8', N'St. Michael', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BB', N'9', N'St. Peter', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'11', N'Antwerpen', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'12', N'Mechelen', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'13', N'Turnhout', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'21', N'Brussel-Hoofdstad', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'23', N'Halle-Vilvoorde', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'24', N'Leuven', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'25', N'Nijvel', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'31', N'Brugge', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'32', N'Diksmuide', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'33', N'Ieper', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'34', N'Kortrijk', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'35', N'Oostende', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'36', N'Roeselare', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'37', N'Tielt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'38', N'Veurne', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'41', N'Aalst', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'42', N'Dendermonde', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'43', N'Eeklo', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'44', N'Gent', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'45', N'Oudenaarde', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'46', N'Sint-Niklaas', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'51', N'Aat', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'52', N'Charleroi', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'53', N'Bergen', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'54', N'Moeskroen', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'55', N'Zinnik', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'56', N'Thuin', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'57', N'Doornik', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'61', N'Hoei', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'62', N'Luik', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'63', N'Verviers', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'64', N'Borgworm', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'71', N'Hasselt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'72', N'Maaseik', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'73', N'Tongeren', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'81', N'Aarlen', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'82', N'Bastenaken', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'83', N'Marche-en-Famenne', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'84', N'Neufchâteau', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'85', N'Virton', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'91', N'Dinant', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'92', N'Namen', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BE', N'93', N'Philippeville', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BH', N'1', N'New Providence', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BH', N'10', N'Eleuthra', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BH', N'11', N'Exuma and Cays', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BH', N'12', N'Long Island', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BH', N'13', N'Harbour Island', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BH', N'14', N'Inagua', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BH', N'15', N'Mayaguana', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BH', N'16', N'Ragged Island', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BH', N'17', N'Rum Cay', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BH', N'18', N'San Salvador', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BH', N'19', N'Spanish Wells', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BH', N'2', N'Grand Bahama', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BH', N'3', N'Abaco', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BH', N'4', N'Acklins', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BH', N'5', N'Andros', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BH', N'6', N'Berry Islands', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BH', N'7', N'Biminis', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BH', N'8', N'Cat Island', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BH', N'9', N'Crooked Island', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BM', N'1', N'Sandys', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BM', N'2', N'Southampton', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BM', N'3', N'Warwick', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BM', N'4', N'Paget', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BM', N'5', N'Pembroke', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BM', N'6', N'Devonshire', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BM', N'7', N'Smith''s', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BM', N'8', N'Hamilton', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'BM', N'9', N'St.George''s', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CA', N'10', N'Newfoundland', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CA', N'11', N'Prince Edward Island', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CA', N'12', N'Nova Scotia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CA', N'13', N'New Brunswick', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CA', N'24', N'Quebec', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CA', N'35', N'Ontario', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CA', N'46', N'Manitoba', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CA', N'47', N'Saskatchewan', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CA', N'48', N'Alberta', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CA', N'59', N'British Columbia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CA', N'60', N'Yukon', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CA', N'61', N'North West Territories', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CA', N'62', N'Nunavut', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'01', N'Zürich', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'02', N'Bern', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'03', N'Luzern', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'04', N'Uri', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'05', N'Schwyz', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'06', N'Obwalden', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'07', N'Nidwalden', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'08', N'Glarus', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'09', N'Zug', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'10', N'Fribourg', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'11', N'Solothurn', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'12', N'Basel-Stadt', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'13', N'Basel-Land', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'14', N'Schaffhausen', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'15', N'Appenzell A.Rh.', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'16', N'Appenzell I.Rh.', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'17', N'St. Gallen', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'18', N'Graubünden', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'19', N'Aargau', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'20', N'Thurgau', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'21', N'Ticino', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'22', N'Vaud', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'23', N'Valais', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'24', N'Neuchâtel', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'25', N'Genève', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CH', N'26', N'Jura', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CL', N'01', N'Tarapacá', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CL', N'02', N'Antofagasta', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CL', N'03', N'Atacama', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CL', N'04', N'Coquimbo', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CL', N'05', N'Valparaíso', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CL', N'06', N'O''Higgins', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CL', N'07', N'Maule', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CL', N'08', N'Biobío', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CL', N'09', N'Araucanía', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CL', N'10', N'Los Lagos', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CL', N'11', N'Aisén', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CL', N'12', N'Magallanes y la Antártica', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CL', N'13', N'Metropolitana', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'11', N'Beijing', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'12', N'Tianjin', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'13', N'Hebei', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'14', N'Shanxi', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'15', N'Inner Mongolia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'21', N'Liaoning', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'22', N'Jilin', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'23', N'Heilongjiang', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'31', N'Shanghai', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'32', N'Jiangsu', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'33', N'Zhejiang', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'34', N'Anhui', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'35', N'Fujian', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'36', N'Jiangxi', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'37', N'Shandong', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'41', N'Henan', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'42', N'Hubei', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'43', N'Hunan', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'44', N'Guangdong', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'45', N'Guangxi', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'46', N'Hainan', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'50', N'Chongqing', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'51', N'Sichuan', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'52', N'Guizhou', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'53', N'Yunnan', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'54', N'Xizang', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'61', N'Shaanxi', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'62', N'Gansu', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'63', N'Qinghai', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'64', N'Ningxia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CN', N'65', N'Xinjiang', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'05', N'Antioquia', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'08', N'Atlántico', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'11', N'Bogotá', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'13', N'Bolívar', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'15', N'Boyacá', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'17', N'Caldas', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'18', N'Caquetá', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'19', N'Cauca', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'20', N'Cesar', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'23', N'Córdoba', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'25', N'Cundinamarca', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'27', N'Chocó', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'41', N'Huila', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'44', N'Guajira', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'47', N'Magdalena', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'50', N'Meta', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'52', N'Nariño', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'54', N'Norte de Santander', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'63', N'Quindío', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'66', N'Risaralda', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'68', N'Santander', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'70', N'Sucre', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'73', N'Tolima', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'76', N'Valle del Cauca', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'81', N'Arauca', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'85', N'Casanare', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'86', N'Putumayo', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'88', N'San Andrés and Providenci', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'91', N'Amazonas', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'94', N'Guainía', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'95', N'Guaviare', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'97', N'Vaupés', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CO', N'99', N'Vichada', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CU', N'1', N'Camagüey', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CU', N'10', N'Matanzas', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CU', N'11', N'Pinar del Rio', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CU', N'12', N'Sancti Spíritus', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CU', N'13', N'Santiago de Cuba', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CU', N'14', N'Villa Clara', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CU', N'2', N'Ciego de Avila', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CU', N'3', N'Cienfuegos', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CU', N'4', N'Granma', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CU', N'5', N'Guantánamo', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CU', N'6', N'Holguin', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CU', N'7', N'Isla de la Juventud', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CU', N'8', N'La Habana', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'CU', N'9', N'Las Tunas', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DE', N'01', N'Schleswig-Holstein', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DE', N'02', N'Hamburg', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DE', N'03', N'Niedersachsen', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DE', N'04', N'Bremen', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DE', N'05', N'Nordrhein-Westfalen', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DE', N'06', N'Hessen', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DE', N'07', N'Rheinland-Pfalz', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DE', N'08', N'Baden-Württemberg', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DE', N'09', N'Bayern', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DE', N'10', N'Saarland', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DE', N'11', N'Berlin', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DE', N'12', N'Brandenburg', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DE', N'13', N'Mecklenburg-Vorpommern', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DE', N'14', N'Sachsen', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DE', N'15', N'Sachsen-Anhalt', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DE', N'16', N'Thueringen', N'Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DK', N'101', N'København', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DK', N'102', N'Frederiksberg', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DK', N'150', N'Københavns Amt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DK', N'200', N'Frederiksborg Amt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DK', N'250', N'Roskilde Amt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DK', N'300', N'Vestsjællands Amt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DK', N'350', N'Storstrøms Amt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DK', N'400', N'Bornholms Amt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DK', N'420', N'Fyns Amt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DK', N'500', N'Sønderjyllands Amt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DK', N'550', N'Ribe Amt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DK', N'600', N'Vejle Amt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DK', N'650', N'Ringkøbing Amt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DK', N'700', N'Århus Amt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DK', N'760', N'Viborg Amt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DK', N'800', N'Nordjyllands Amt', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'1', N'Azua', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'10', N'Hato Mayor', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'11', N'Independencia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'12', N'La Altagracia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'13', N'La Romana', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'14', N'La Vega', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'15', N'Maria Trinidad Sánchez', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'16', N'Monsenor Nouel', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'17', N'Monte Cristi', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'18', N'Monte Plata', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'19', N'Pedernales', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'2', N'Bahoruco', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'20', N'Peravia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'21', N'Puerto Plata', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'22', N'Salcedo', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'23', N'Samana', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'24', N'Sánchez Ramirez', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'25', N'San Cristobal', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'26', N'San Juan', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'27', N'San Pedro de Macoris', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'28', N'Santiago', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'29', N'Santiago Rodriguez', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'3', N'Barahona', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'30', N'Valverde', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'4', N'Dajabon', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'5', N'Distrito National', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'6', N'Duarte', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'7', N'Elias Pina', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'8', N'El Seibo', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'DO', N'9', N'Espaillat', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'01', N'Azuay', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'02', N'Bolivar', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'03', N'Canar', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'04', N'Carchi', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'05', N'Cotopaxi', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'06', N'Chimborazo', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'07', N'El Oro', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'08', N'Esmeraldas', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'09', N'Guayas', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'10', N'Imbabura', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'11', N'Loja', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'12', N'Los Rios', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'13', N'Manabi', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'14', N'Morona Santiago', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'15', N'Napo', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'16', N'Pastaza', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'17', N'Pichincha', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'18', N'Tungurahua', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'19', N'Zamora Chinchipe', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'20', N'Galapagos', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'21', N'Sucumbios', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'22', N'Orellana', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'23', N'Santo Domingo de los Tsachilas', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'24', N'Santa Elena', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'EC', N'90', N'Zonas No Delimitadas', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'01', N'Ain', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'02', N'Aisne', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'03', N'Allier', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'04', N'Alpes-de-Haute-Provence', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'05', N'Hautes-Alpes', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'06', N'Alpes-Maritimes', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'07', N'Ardèche', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'08', N'Ardennes', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'09', N'Ariège', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'10', N'Aube', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'11', N'Aude', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'12', N'Aveyron', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'13', N'Bouches-du-Rhône', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'14', N'Calvados', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'15', N'Cantal', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'16', N'Charente', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'17', N'Charente-Maritime', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'18', N'Cher', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'19', N'Corrèze', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'21', N'Côte-d''Or', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'22', N'Côtes-du-Nord', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'23', N'Creuse', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'24', N'Dordogne', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'25', N'Doubs', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'26', N'Drôme', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'27', N'Eure', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'28', N'Eure-et-Loir', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'29', N'Finistère', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'2A', N'Corse-du-Sud', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'2B', N'Haute-Corse', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'30', N'Gard', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'31', N'Haute-Garonne', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'32', N'Gers', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'33', N'Gironde', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'34', N'Hérault', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'35', N'Ille-et-Vilaine', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'36', N'Indre', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'37', N'Indre-et-Loire', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'38', N'Isère', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'39', N'Jura', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'40', N'Landes', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'41', N'Loir-et-Cher', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'42', N'Loire', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'43', N'Haute-Loire', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'44', N'Loire-Atlantique', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'45', N'Loiret', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'46', N'Lot', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'47', N'Lot-et-Garonne', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'48', N'Lozère', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'49', N'Maine-et-Loire', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'50', N'Manche', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'51', N'Marne', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'52', N'Haute-Marne', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'53', N'Mayenne', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'54', N'Meurthe-et-Moselle', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'55', N'Meuse', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'56', N'Morbihan', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'57', N'Moselle', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'58', N'Nièvre', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'59', N'Nord', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'60', N'Oise', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'61', N'Orne', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'62', N'Pas-de-Calais', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'63', N'Puy-de-Dôme', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'64', N'Pyrénées-Atlantiques', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'65', N'Hautes-Pyrénées', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'66', N'Pyrénées-Orientales', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'67', N'Bas-Rhin', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'68', N'Haut-Rhin', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'69', N'Rhône', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'70', N'Haute-Saône', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'71', N'Saône-et-Loire', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'72', N'Sarthe', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'73', N'Savoie', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'74', N'Haute-Savoie', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'75', N'Ville-de-Paris', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'76', N'Seine-Maritime', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'77', N'Seine-et-Marne', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'78', N'Yvelines', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'79', N'Deux-Sèvres', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'80', N'Somme', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'81', N'Tarn', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'82', N'Tarn-et-Garonne', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'83', N'Var', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'84', N'Vaucluse', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'85', N'Vendée', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'86', N'Vienne', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'87', N'Haute-Vienne', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'88', N'Vosges', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'89', N'Yonne', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'90', N'Territoire-de-Belfort', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'91', N'Essonne', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'92', N'Hauts-de-Seine', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'93', N'Seine-Saint-Denis', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'94', N'Val-de-Marne', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'95', N'Val-d''Oise', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'FR', N'99', N'Monaco', N'County')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'G2', N'01', N'Alabama', N'Administrative Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'G2', N'12', N'Florida', N'Administrative Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'G2', N'22', N'Louisiana', N'Administrative Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'G2', N'28', N'Mississippi', N'Administrative Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'G2', N'48', N'Texas', N'Administrative Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'G2', N'OCS', N'Outer Continental Shelf', N'Administrative Region')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'AB', N'Aberdeen', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'AL', N'St Albans', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'B', N'Birmingham', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'BA', N'Bath', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'BB', N'Blackburn', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'BD', N'Bradford', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'BH', N'Bournemouth', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'BL', N'Bolton', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'BN', N'Brighton', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'BR', N'Bromley', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'BS', N'Bristol', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'BT', N'Northern Ireland', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'CA', N'Carlisle', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'CB', N'Cambridge', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'CF', N'Cardiff', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'CH', N'Chester', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'CM', N'Chelmsford', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'CO', N'Colchester', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'CR', N'Croydon', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'CT', N'Canterbury', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'CV', N'Coventry', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'CW', N'Crewe', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'DA', N'Dartford', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'DD', N'Dundee', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'DE', N'Derby', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'DG', N'Dumfries', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'DH', N'Durham', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'DL', N'Darlington', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'DN', N'Doncaster', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'DT', N'Dorchester', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'DY', N'Dudley', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'E', N'London E', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'EC', N'London EC', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'EH', N'Edinburgh', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'EN', N'Enfield', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'EX', N'Exeter', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'FK', N'Falkirk', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'FY', N'Blackpool', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'G', N'Glasgow', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'GL', N'Gloucester', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'GU', N'Guildford', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'GY', N'Guernsey', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'HA', N'Harrow', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'HD', N'Huddersfield', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'HG', N'Harrogate', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'HP', N'Hemel Hempstead', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'HR', N'Hereford', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'HS', N'Outer Hebrides', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'HU', N'Hull', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'HX', N'Halifax', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'IC', N'Channel Islands', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'IG', N'Ilford', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'IM', N'Isle of Man', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'IP', N'Ipswich', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'IV', N'Inverness', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'JE', N'Jersey', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'KA', N'Kilmarnock', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'KT', N'Kingston upon Thames', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'KW', N'Kirkwall', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'KY', N'Kirkcaldy', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'L', N'Liverpool', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'LA', N'Lancaster', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'LD', N'Llandrindod Wells', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'LE', N'Leicester', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'LL', N'Llandudno', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'LN', N'Lincoln', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'LS', N'Leeds', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'LU', N'Luton', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'M', N'Manchester', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'ME', N'Medway', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'MK', N'Milton Keynes', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'ML', N'Motherwell', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'N', N'London N', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'NE', N'Newcastle upon Tyne', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'NG', N'Nottingham', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'NN', N'Northampton', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'NP', N'Newport', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'NR', N'Norwich', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'NW', N'London NW', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'OL', N'Oldham', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'OX', N'Oxford', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'PA', N'Paisley', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'PE', N'Peterborough', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'PH', N'Perth', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'PL', N'Plymouth', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'PO', N'Portsmouth', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'PR', N'Preston', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'RG', N'Reading', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'RH', N'Redhill', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'RM', N'Romford', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'S', N'Sheffield', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'SA', N'Swansea', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'SE', N'London SE', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'SG', N'Stevenage', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'SK', N'Stockport', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'SL', N'Slough', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'SM', N'Sutton', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'SN', N'Swindon', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'SO', N'Southampton', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'SP', N'Salisbury', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'SR', N'Sunderland', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'SS', N'Southend-on-Sea', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'ST', N'Stoke-on-Trent', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'SW', N'London SW', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'SY', N'Shrewsbury', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'TA', N'Taunton', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'TD', N'Galashiels', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'TF', N'Telford', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'TN', N'Tonbridge', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'TQ', N'Torquay', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'TR', N'Truro', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'TS', N'Cleveland', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'TW', N'Twickenham', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'UB', N'Southall', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'W', N'London W', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'WA', N'Warrington', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'WC', N'London WC', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'WD', N'Watford', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'WF', N'Wakefield', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'WN', N'Wigan', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'WR', N'Worcester', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'WS', N'Walsall', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'WV', N'Wolverhampton', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'YO', N'York', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GB', N'ZE', N'Lerwick', N'Postcode Area')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'01', N'Aitolias Kai Akarnanias', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'03', N'Voiotia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'04', N'Eivoias', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'05', N'Evritania', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'06', N'Fthiotida', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'07', N'Fokida', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'11', N'Argolidos', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'12', N'Arkadias', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'13', N'Ahaia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'14', N'Ilia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'15', N'Korinthos', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'16', N'Lakonia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'17', N'Messinia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'21', N'Zakinthos', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'22', N'Kerkira (Corfu)', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'23', N'Kefallonia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'24', N'Lefkada', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'31', N'Arta', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'32', N'Thesprotia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'33', N'Ioannina', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'34', N'Preveza', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'41', N'Karditsa', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'42', N'Larissa', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'43', N'Magnisias', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'44', N'Trikala', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'51', N'Grevena', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'52', N'Drama', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'53', N'Imathia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'54', N'Thessaloniki', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'55', N'Kavala', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'56', N'Kastoria', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'57', N'Kilkis', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'58', N'Kozani', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'59', N'Pela', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'61', N'Pieria', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'62', N'Seres', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'63', N'Florina', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'64', N'Halkida', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'65', N'Agion Opos', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'71', N'Evros', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'72', N'Xanthi', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'73', N'Rodopi', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'81', N'Dodekanissa (Dodecanese)', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'82', N'Kiklades (Cyclades)', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'83', N'Lesvos', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'84', N'Samos', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'85', N'Hios', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'91', N'Iraklio', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'92', N'Lasithioi', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'93', N'Rethimno', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'94', N'Hania', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'A1', N'Athina (Athens)', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'A2', N'Anatoliki Attiki', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'A3', N'Ditiki Attiki', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'GR', N'A4', N'Peiria', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'HT', N'1', N'Artibonite', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'HT', N'2', N'Centre', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'HT', N'3', N'Grand'' Anse', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'HT', N'4', N'Nord', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'HT', N'5', N'Nord-Est', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'HT', N'6', N'Nord-Ouest', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'HT', N'7', N'Ouest', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'HT', N'8', N'Sud', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'HT', N'9', N'Sud-Est', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'11', N'Nanggroe Aceh Darussalam', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'12', N'Sumatera Utara', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'13', N'Sumatera Barat', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'14', N'Riau', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'15', N'Jambi', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'16', N'Sumatera Selatan', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'17', N'Bengkulu', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'18', N'Lampung', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'19', N'Kepulauan Bangka Belitung', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'21', N'Kepulauan Riau', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'31', N'DKI Jakarta', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'32', N'Jawa Barat', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'33', N'Jawa Tengah', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'34', N'DI Yogyakarta', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'35', N'Jawa Timur', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'36', N'Banten', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'51', N'Bali', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'52', N'Nusa Tenggara Barat', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'53', N'Nusa Tenggara Timur', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'61', N'Kalimantan Barat', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'62', N'Kalimantan Tengah', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'63', N'Kalimantan Selatan', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'64', N'Kalimantan Timur', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'71', N'Sulawesi Utara', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'72', N'Sulawesi Tengah', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'73', N'Sulawesi Selatan', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'74', N'Sulawesi Tenggara', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'75', N'Gorontalo', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'76', N'Sulawesi Barat', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'81', N'Maluku', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'82', N'Maluku Utara', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'91', N'Papua Barat', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'ID', N'94', N'Papua', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'01', N'Carlow', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'02', N'Dublin County Borough', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'03', N'South Dublin', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'04', N'Fingal', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'05', N'Dun Laoghaire-Rathdown', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'06', N'Kildare', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'07', N'Kilkenny', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'08', N'Laoighis', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'09', N'Longford', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'10', N'Louth', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'11', N'Meath', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'12', N'Offaly', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'13', N'Westmeath', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'14', N'Wexford', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'15', N'Wicklow', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'16', N'Clare', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'18', N'Cork County Borough', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'19', N'Cork', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'20', N'Kerry', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'22', N'Limerick County Borough', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'23', N'Limerick', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'24', N'Tipperary North Riding', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'25', N'Tipperay South Riding', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'27', N'Waterford County Borough', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'28', N'Waterford', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'29', N'Galway', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'30', N'Leitrim', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'31', N'Mayo', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'32', N'Roscommon', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'33', N'Sligo', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'34', N'Cavan', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'35', N'Donegal', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'36', N'Monaghan', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IE', N'37', N'Galway County Borough', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IL', N'01', N'Akko', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IL', N'02', N'Ashqelon', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IL', N'03', N'Beer Sheva', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IL', N'04', N'Gaza Area', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IL', N'05', N'Golan', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IL', N'06', N'Hadera', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IL', N'07', N'Haifa', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IL', N'08', N'Jericho', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IL', N'09', N'Jerusalem', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IL', N'10', N'Kinneret', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IL', N'11', N'Petah Tiqwa', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IL', N'12', N'Ramla', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IL', N'13', N'Rehovot', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IL', N'14', N'Sharon', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IL', N'15', N'Tel Aviv', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IL', N'16', N'Yizreel', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IL', N'17', N'Zefat', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'001', N'Torino', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'002', N'Vercelli', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'003', N'Novara', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'004', N'Cuneo', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'005', N'Asti', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'006', N'Alessandria', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'007', N'Valle dAosta', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'008', N'Imperia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'009', N'Savona', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'010', N'Genova', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'011', N'La Spezia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'012', N'Varese', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'013', N'Como', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'014', N'Sondrio', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'015', N'Milano', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'016', N'Bergamo', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'017', N'Brescia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'018', N'Pavia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'019', N'Cremona', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'020', N'Mantova', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'021', N'Bolzano', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'022', N'Trento', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'023', N'Verona', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'024', N'Vicenza', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'025', N'Belluno', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'026', N'Treviso', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'027', N'Venezia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'028', N'Padova', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'029', N'Rovigo', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'030', N'Udine', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'031', N'Gorizia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'032', N'Trieste', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'033', N'Piacenza', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'034', N'Parma', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'035', N'Reggio Emilia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'036', N'Modena', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'037', N'Bologna', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'038', N'Ferrara', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'039', N'Ravenna', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'040', N'Forli-Cesena', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'041', N'Pesaro E Urbino', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'042', N'Ancona', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'043', N'Macerata', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'044', N'Ascoli Piceno', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'045', N'Massa Carrara', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'046', N'Lucca', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'047', N'Pistoia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'048', N'Firenze', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'049', N'Livorno', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'050', N'Pisa', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'051', N'Arezzo', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'052', N'Siena', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'053', N'Grosseto', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'054', N'Perugia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'055', N'Terni', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'056', N'Viterbo', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'057', N'Rieti', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'058', N'Roma', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'059', N'Latina', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'060', N'Frosinone', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'061', N'Caserta', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'062', N'Benevento', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'063', N'Napoli', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'064', N'Avellino', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'065', N'Salerno', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'066', N'L''Aquila', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'067', N'Teramo', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'068', N'Pescara', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'069', N'Chieti', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'070', N'Campobasso', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'071', N'Foggia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'072', N'Bari', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'073', N'Taranto', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'074', N'Brindisi', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'075', N'Lecce', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'076', N'Potenza', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'077', N'Matera', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'078', N'Cosenza', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'079', N'Catanzaro', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'080', N'Reggio Calabria', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'081', N'Trapani', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'082', N'Palermo', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'083', N'Messina', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'084', N'Agrigento', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'085', N'Caltanissetta', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'086', N'Enna', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'087', N'Catania', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'088', N'Ragusa', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'089', N'Siracusa', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'090', N'Sassari', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'091', N'Nuoro', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'092', N'Cagliari', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'093', N'Pordenone', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'094', N'Isernia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'095', N'Oristano', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'096', N'Biella', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'097', N'Lecco', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'098', N'Lodi', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'099', N'Rimini', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'100', N'Prato', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'101', N'Crotone', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'102', N'Vibo Valentia', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'103', N'Verbano-Cusio-Ossola', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'104', N'Olbia-Tempio', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'105', N'Ogliastra', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'106', N'Medio Campidano', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'107', N'Carbonia-Iglesias', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'888', N'Citta del Vaticano', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'IT', N'999', N'San Marino', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JM', N'1', N'Clarendon', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JM', N'10', N'St. James', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JM', N'11', N'St. Mary', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JM', N'12', N'St. Thomas', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JM', N'13', N'Trelawny', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JM', N'14', N'Westmoreland', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JM', N'2', N'Hanover', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JM', N'3', N'Kingston', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JM', N'4', N'Manchester', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JM', N'5', N'Portland', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JM', N'6', N'St. Andrew', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JM', N'7', N'St. Ann', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JM', N'8', N'St. Catherine', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JM', N'9', N'St. Elizabeth', N'Parish')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'100', N'Hokkaido', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'1010', N'Kagawa', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'1020', N'Tokushima', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'1030', N'Ehime', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'1040', N'Kochi', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'1110', N'Fukuoka', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'1120', N'Saga', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'1130', N'Nagasaki', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'1140', N'Kumamoto', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'1150', N'Oita', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'1160', N'Miyazaki', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'1170', N'Kagoshima', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'1200', N'Okinawa', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'210', N'Aomori', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'220', N'Akita', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'230', N'Yamagata', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'240', N'Niigata', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'310', N'Iwate', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'320', N'Miyagi', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'330', N'Fukushima', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'410', N'Gumma', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'420', N'Tochigi', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'430', N'Saitama', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'440', N'Ibaraki', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'510', N'Chiba', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'520', N'Tokyo', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'530', N'Kanagawa', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'610', N'Gifu', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'620', N'Nagano', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'630', N'Yamanashi', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'640', N'Shizuoka', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'650', N'Aichi', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'660', N'Mie', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'710', N'Toyama', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'720', N'Ishikawa', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'730', N'Fukui', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'810', N'Hyogo', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'820', N'Kyoto', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'830', N'Shiga', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'840', N'Osaka', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'850', N'Nara', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'860', N'Wakayama', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'910', N'Tottori', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'920', N'Okayama', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'930', N'Hiroshima', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'940', N'Shimane', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'JP', N'950', N'Yamaguchi', N'Prefecture')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KR', N'11', N'Seoul', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KR', N'21', N'Busan', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KR', N'22', N'Daegu', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KR', N'23', N'Incheon', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KR', N'24', N'Gwangju', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KR', N'25', N'Daejeon', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KR', N'26', N'Ulsan', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KR', N'31', N'Gyeonggi-do', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KR', N'32', N'Gangwon-do', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KR', N'33', N'Chungcheongbuk-do', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KR', N'34', N'Chungcheongnam-do', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KR', N'35', N'Jeollabuk-do', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KR', N'36', N'Jeollanam-do', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KR', N'37', N'Gyeongsangbuk-do', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KR', N'38', N'Gyeongsangnam-do', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KR', N'39', N'Jeju-do', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KY', N'1', N'Bodden Town', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KY', N'2', N'East End', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KY', N'3', N'George Town', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KY', N'4', N'North Side', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KY', N'5', N'West Bay', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KY', N'6', N'Little Cayman', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'KY', N'7', N'Cayman Brac', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'LU', N'01', N'Luxembourg-ville', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'LU', N'02', N'Capellen', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'LU', N'03', N'Esch-Alzette', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'LU', N'05', N'Mersch', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'LU', N'06', N'Clervaux', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'LU', N'07', N'Diekirch', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'LU', N'08', N'Redange', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'LU', N'09', N'Wiltz', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'LU', N'10', N'Vianden', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'LU', N'11', N'Echternach', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'LU', N'12', N'Grevenmacher', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'LU', N'13', N'Remich', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'LU', N'40', N'Luxembourg-Campagne', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'01', N'Aguascalientes', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'02', N'Baja California', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'03', N'Baja California Sur', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'04', N'Campeche', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'05', N'Coahuila', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'06', N'Colima', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'07', N'Chiapas', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'08', N'Chihuahua', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'09', N'Mexico City / Distrito Federal', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'10', N'Durango', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'11', N'Guanajuato', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'12', N'Guerrero', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'13', N'Hidalgo', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'14', N'Jalisco', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'15', N'Mexico', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'16', N'Michoacan', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'17', N'Morelos', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'18', N'Nayarit', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'19', N'Nuevo Leon', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'20', N'Oaxaca', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'21', N'Puebla', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'22', N'Queretaro', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'23', N'Quintana Roo', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'24', N'San Luis Potosi', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'25', N'Sinaloa', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'26', N'Sonora', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'27', N'Tabasco', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'28', N'Tamaulipas', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'29', N'Tlaxcala', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'30', N'Veracruz', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'31', N'Yucatan', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'MX', N'32', N'Zacatecas', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NL', N'20', N'Groningen', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NL', N'21', N'Friesland', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NL', N'22', N'Drenthe', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NL', N'23', N'Overijssel', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NL', N'24', N'Flevoland', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NL', N'25', N'Gelderland', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NL', N'26', N'Utrecht', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NL', N'27', N'Noord-Holland', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NL', N'28', N'Zuid-Holland', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NL', N'29', N'Zeeland', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NL', N'30', N'Noord-Brabant', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NL', N'31', N'Limburg', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NO', N'01', N'Østfold', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NO', N'02', N'Akershus', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NO', N'03', N'Oslo', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NO', N'04', N'Hedmark', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NO', N'05', N'Oppland', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NO', N'06', N'Buskerud', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NO', N'07', N'Vestfold', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NO', N'08', N'Telemark', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NO', N'09', N'Aust-Agder', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NO', N'10', N'Vest-Agder', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NO', N'11', N'Rogaland', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NO', N'12', N'Hordaland', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NO', N'14', N'Sogn og Fjordane', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NO', N'15', N'Møre og Romsdal', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NO', N'16', N'Sør-Trøndelag', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NO', N'17', N'Nord-Trøndelag', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NO', N'18', N'Nordland', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NO', N'19', N'Troms', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NO', N'20', N'Finnmark', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'NO', N'SJ', N'Svalbard and Jan Mayen Islands', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'01', N'Amazonas', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'02', N'Ancash', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'03', N'Apurímac', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'04', N'Arequipa', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'05', N'Ayacucho', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'06', N'Cajamarca', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'07', N'Callao', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'08', N'Cusco', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'09', N'Huancavelica', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'10', N'Huánuco', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'11', N'Ica', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'12', N'Junín', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'13', N'La Libertad', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'14', N'Lambayeque', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'15', N'Lima', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'16', N'Loreto', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'17', N'Madre de Dios', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'18', N'Moquegua', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'19', N'Pasco', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'20', N'Piura', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'21', N'Puno', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'22', N'San Martín', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'23', N'Tacna', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'24', N'Tumbes', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PE', N'25', N'Ucayali', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PH', N'01', N'Ilocos Region', N'Region/State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PH', N'02', N'Cagayan Valley', N'Region/State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PH', N'03', N'Central Luzon', N'Region/State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PH', N'04', N'Calabarzon', N'Region/State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PH', N'05', N'Bicol Region', N'Region/State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PH', N'06', N'Western Visayas', N'Region/State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PH', N'07', N'Central Visayas', N'Region/State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PH', N'08', N'Eastern Visayas', N'Region/State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PH', N'09', N'Zamboanga Peninsula', N'Region/State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PH', N'10', N'Northern Mindanao', N'Region/State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PH', N'11', N'Davao Region', N'Region/State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PH', N'12', N'Soccsksargen', N'Region/State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PH', N'13', N'National Capital Region (NCR)', N'Region/State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PH', N'14', N'Cordillera Administrative Region (CAR)', N'Region/State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PH', N'15', N'Autonomous Region In Muslim Mindanao (ARMM)', N'Region/State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PH', N'16', N'Caraga', N'Region/State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PH', N'17', N'Mimaropa', N'Region/State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'1', N'Adjuntas', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'101', N'Morovis', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'103', N'Naguabo', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'105', N'Naranjito', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'107', N'Orocovis', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'109', N'Patillas', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'11', N'Anasco', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'111', N'Penuelas', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'113', N'Ponce', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'115', N'Quebradillas', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'117', N'Rincon', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'119', N'Rio Grande', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'121', N'Sabana Grande', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'123', N'Salinas', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'125', N'San German', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'127', N'San Juan', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'129', N'San Lorenzo', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'13', N'Arecibo', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'131', N'San Sebastian', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'133', N'Santa Isabel', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'135', N'Toa Alta', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'137', N'Toa Baja', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'139', N'Trujillo Alto', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'141', N'Utuado', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'143', N'Vega Alta', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'145', N'Vega Baja', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'147', N'Vieques', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'149', N'Villalba', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'15', N'Arroyo', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'151', N'Yabucoa', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'153', N'Yauco', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'17', N'Barceloneta', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'19', N'Barranquitas', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'21', N'Bayamon', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'23', N'Cabo Rojo', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'25', N'Caguas', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'27', N'Camuy', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'29', N'Canovanas', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'3', N'Aguada', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'31', N'Carolina', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'33', N'Catano', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'35', N'Cayey', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'37', N'Ceiba', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'39', N'Ciales', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'41', N'Cidra', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'43', N'Coamo', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'45', N'Comerio', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'47', N'Corozal', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'49', N'Culebra', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'5', N'Aguadilla', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'51', N'Dorado', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'53', N'Fajardo', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'54', N'Florida', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'55', N'Guanica', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'57', N'Guayama', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'59', N'Guayanilla', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'61', N'Guaynabo', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'63', N'Gurabo', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'65', N'Hatillo', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'67', N'Hormigueros', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'69', N'Humacao', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'7', N'Aguas Buenas', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'71', N'Isabela', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'73', N'Jayuya', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'75', N'Juana Diaz', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'77', N'Juncos', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'79', N'Lajas', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'81', N'Lares', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'83', N'Las Marias', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'85', N'Las Piedras', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'87', N'Loiza', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'89', N'Luquillo', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'9', N'Aibonito', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'91', N'Manati', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'93', N'Maricao', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'95', N'Maunabo', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'97', N'Mayaguez', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PR', N'99', N'Moca', N'Municipality')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'01', N'Aveiro', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'02', N'Beja', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'03', N'Braga', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'04', N'Braganta', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'05', N'Castelo Branco', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'06', N'Coimbra', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'07', N'Évora', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'08', N'Faro', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'09', N'Guarda', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'10', N'Leiria', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'11', N'Lisboa', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'12', N'Portalegre', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'13', N'Porto', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'14', N'SantarTm', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'15', N'Setúbal', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'16', N'Viana do Castelo', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'17', N'Vila Real', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'18', N'Viseu', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'31', N'Ilha da Madeira', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'32', N'Ilha de Porto Santo', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'41', N'Ilha de Santa Maria', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'42', N'Ilha de Spo Miguel', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'43', N'Ilha Terceira', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'44', N'Ilha da Graciosa', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'45', N'Ilha de Spo Jorge', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'46', N'Ilha do Pico', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'47', N'Ilha do Faial', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'48', N'Ilha das Flores', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'PT', N'49', N'Ilha do Corvo', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'SE', N'01', N'Stockholms län', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'SE', N'02', N'Uppsala län', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'SE', N'04', N'Södermanlands län', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'SE', N'05', N'Östergötlands län', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'SE', N'06', N'Jönköpings län', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'SE', N'07', N'Kronobergs län', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'SE', N'08', N'Kalmar län', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'SE', N'09', N'Gotlands län', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'SE', N'10', N'Blekinge län', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'SE', N'12', N'Skåne län', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'SE', N'13', N'Hallands län', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'SE', N'14', N'Västra Götalands län', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'SE', N'17', N'Värmlands län', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'SE', N'18', N'Örebro län', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'SE', N'19', N'Västmanlands län', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'SE', N'20', N'Dalarnas län', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'SE', N'21', N'Gävleborgs län', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'SE', N'22', N'Västernorrlands län', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'SE', N'23', N'Jämtlands län', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'SE', N'24', N'Västerbottens län', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'SE', N'25', N'Norrbottens län', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TC', N'1', N'Caicos', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TC', N'2', N'Grand Turk Island', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TC', N'3', N'Salt Cay', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'01', N'Adana', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'02', N'Adýyaman', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'03', N'Afyonkarahisar', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'04', N'Aðrý', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'05', N'Amasya', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'06', N'Ankara', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'07', N'Antalya', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'08', N'Artvin', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'09', N'Aydýn', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'10', N'Balýkesir', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'11', N'Bilecik', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'12', N'Bingöl', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'13', N'Bitlis', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'14', N'Bolu', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'15', N'Burdur', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'16', N'Bursa', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'17', N'Çanakkale', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'18', N'Çankýrý', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'19', N'Çorum', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'20', N'Denizli', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'21', N'Diyarbakýr', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'22', N'Edirne', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'23', N'Elazýð', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'24', N'Erzincan', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'25', N'Erzurum', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'26', N'Eskiþehir', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'27', N'Gaziantep', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'28', N'Giresun', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'29', N'Gümüþhane', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'30', N'Hakkari', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'31', N'Hatay', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'32', N'Isparta', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'33', N'Mersin', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'34', N'Ýstanbul', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'35', N'Ýzmir', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'36', N'Kars', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'37', N'Kastamonu', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'38', N'Kayseri', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'39', N'Kýrklareli', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'40', N'Kýrþehir', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'41', N'Kocaeli', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'42', N'Konya', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'43', N'Kütahya', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'44', N'Malatya', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'45', N'Manisa', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'46', N'Kahramanmaraþ', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'47', N'Mardin', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'48', N'Muðla', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'49', N'Muþ', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'50', N'Nevþehir', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'51', N'Niðde', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'52', N'Ordu', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'53', N'Rize', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'54', N'Sakarya', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'55', N'Samsun', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'56', N'Siirt', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'57', N'Sinop', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'58', N'Sivas', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'59', N'Tekirdað', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'60', N'Tokat', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'61', N'Trabzon', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'62', N'Tunceli', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'63', N'Þanlýurfa', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'64', N'Uþak', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'65', N'Van', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'66', N'Yozgat', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'67', N'Zonguldak', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'68', N'Aksaray', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'69', N'Bayburt', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'70', N'Karaman', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'71', N'Kýrýkkale', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'72', N'Batman', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'73', N'Þýrnak', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'74', N'Bartýn', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'75', N'Ardahan', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'76', N'Iðdýr', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'77', N'Yalova', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'78', N'Karabük', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'79', N'Kilis', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'80', N'Osmaniye', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TR', N'81', N'Düzce', N'Province')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TT', N'1', N'Caroni', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TT', N'2', N'Mayaro', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TT', N'3', N'Nariva', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TT', N'4', N'St. Andrew', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TT', N'5', N'St. David', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TT', N'6', N'St. George', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TT', N'7', N'St. Patrick', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TT', N'8', N'Victoria', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TT', N'9', N'Tobago', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'01', N'Taipei County', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'02', N'Yilan County', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'03', N'Taoyuan County', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'04', N'Hsinchu County', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'05', N'Miaoli County', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'06', N'Taichung County', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'07', N'Changhua County', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'08', N'Nantou County', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'09', N'Yunlin County', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'10', N'Chiayi County', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'11', N'Tainan County', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'12', N'Kaohsiung County', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'13', N'Pingtung County', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'14', N'Taitung County', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'15', N'Hualien County', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'16', N'Penghu County', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'17', N'Keelung City', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'18', N'Hsinchu City', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'19', N'Taichung City', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'20', N'Chiayi City', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'21', N'Tainan City', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'63', N'Taipei City', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'64', N'Kaohsiung City', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'71', N'Lienchiang County', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'TW', N'72', N'Kinmen County', N'County/Sector')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'AK', N'Alaska', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'AL', N'Alabama', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'AR', N'Arkansas', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'AZ', N'Arizona', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'CA', N'California', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'CO', N'Colorado', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'CT', N'Connecticut', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'DC', N'Dist of Columbia', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'DE', N'Delaware', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'FL', N'Florida', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'GA', N'Georgia', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'HI', N'Hawaii', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'IA', N'Iowa', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'ID', N'Idaho', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'IL', N'Illinois', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'IN', N'Indiana', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'KS', N'Kansas', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'KY', N'Kentucky', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'LA', N'Louisiana', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'MA', N'Massachusetts', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'MD', N'Maryland', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'ME', N'Maine', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'MI', N'Michigan', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'MN', N'Minnesota', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'MO', N'Missouri', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'MS', N'Mississippi', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'MT', N'Montana', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'NC', N'North Carolina', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'ND', N'North Dakota', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'NE', N'Nebraska', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'NH', N'New Hampshire', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'NJ', N'New Jersey', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'NM', N'New Mexico', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'NV', N'Nevada', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'NY', N'New York', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'OH', N'Ohio', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'OK', N'Oklahoma', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'OR', N'Oregon', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'PA', N'Pennsylvania', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'RI', N'Rhode Island', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'SC', N'South Carolina', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'SD', N'South Dakota', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'TN', N'Tennessee', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'TX', N'Texas', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'UT', N'Utah', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'VA', N'Virginia', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'VT', N'Vermont', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'WA', N'Washington', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'WI', N'Wisconsin', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'WV', N'West Virginia', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'US', N'WY', N'Wyoming', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VC', N'1', N'Saint Vincent', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VC', N'2', N'The Grenadines', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'01', N'Distrito Capital', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'02', N'Amazonas', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'03', N'Anzoátegui', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'04', N'Apure', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'05', N'Aragua', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'06', N'Barinas', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'07', N'Bolívar', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'08', N'Carabobo', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'09', N'Cojedes', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'10', N'Delta Amacuro', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'11', N'Falcón', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'12', N'Guárico', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'13', N'Lara', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'14', N'Mérida', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'15', N'Miranda', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'16', N'Monagas', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'17', N'Nueva Esparta', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'18', N'Portuguesa', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'19', N'Sucre', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'20', N'Táchira', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'21', N'Trujillo', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'22', N'Yaracuy', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'23', N'Zulia', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VE', N'24', N'Vargas', N'State')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VG', N'1', N'Anegada', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VG', N'2', N'Cooper Island', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VG', N'3', N'Great Camanoe', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VG', N'4', N'Jost van Dyke', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VG', N'5', N'Peter Island', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VG', N'6', N'Tortola', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VG', N'7', N'Virgin Gorda', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VI', N'10', N'St. Croix', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VI', N'20', N'St. John', N'District')
GO
INSERT [dbo].[xAreaCode] ([CountryCode], [AreaCode], [AreaName], [Resolution]) VALUES (N'VI', N'30', N'St. Thomas', N'District')
GO
INSERT [dbo].[xAttachmentBasis] ([Code], [CodeDescription]) VALUES (N'LO', N'Losses Occuring During')
GO
INSERT [dbo].[xAttachmentBasis] ([Code], [CodeDescription]) VALUES (N'RA', N'Risk Attaching')
GO
INSERT [dbo].[xBasement] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xBasement] ([Code], [CodeDescription]) VALUES (1, N'Unfinished basement')
GO
INSERT [dbo].[xBasement] ([Code], [CodeDescription]) VALUES (2, N'Finished basement (100%)')
GO
INSERT [dbo].[xBasement] ([Code], [CodeDescription]) VALUES (3, N'Mostly finished basement (> 50%)')
GO
INSERT [dbo].[xBasement] ([Code], [CodeDescription]) VALUES (4, N'Partially finished basement (<= 50%)')
GO
INSERT [dbo].[xBasement] ([Code], [CodeDescription]) VALUES (5, N'Basement of unknown finish percent')
GO
INSERT [dbo].[xBasement] ([Code], [CodeDescription]) VALUES (6, N'No basement')
GO
INSERT [dbo].[xBIPreparedness] ([Code], [CodeDescription]) VALUES (0, N'Unknown')
GO
INSERT [dbo].[xBIPreparedness] ([Code], [CodeDescription]) VALUES (1, N'Vulnerable')
GO
INSERT [dbo].[xBIPreparedness] ([Code], [CodeDescription]) VALUES (2, N'Average')
GO
INSERT [dbo].[xBIPreparedness] ([Code], [CodeDescription]) VALUES (3, N'Resilient')
GO
INSERT [dbo].[xBIRedundancy] ([Code], [CodeDescription]) VALUES (0, N'Unknown')
GO
INSERT [dbo].[xBIRedundancy] ([Code], [CodeDescription]) VALUES (1, N'Vulnerable')
GO
INSERT [dbo].[xBIRedundancy] ([Code], [CodeDescription]) VALUES (2, N'Average')
GO
INSERT [dbo].[xBIRedundancy] ([Code], [CodeDescription]) VALUES (3, N'Resilient')
GO
INSERT [dbo].[xBrickVeneer] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default (50-90%)')
GO
INSERT [dbo].[xBrickVeneer] ([Code], [CodeDescription]) VALUES (1, N'More than 90%')
GO
INSERT [dbo].[xBrickVeneer] ([Code], [CodeDescription]) VALUES (2, N'25-50%')
GO
INSERT [dbo].[xBrickVeneer] ([Code], [CodeDescription]) VALUES (3, N'0-25%')
GO
INSERT [dbo].[xBuildingCondition] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xBuildingCondition] ([Code], [CodeDescription]) VALUES (1, N'Average')
GO
INSERT [dbo].[xBuildingCondition] ([Code], [CodeDescription]) VALUES (2, N'Good')
GO
INSERT [dbo].[xBuildingCondition] ([Code], [CodeDescription]) VALUES (3, N'Poor')
GO
INSERT [dbo].[xBuildingExteriorOpening] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xBuildingExteriorOpening] ([Code], [CodeDescription]) VALUES (1, N'Less than 50% of wall open')
GO
INSERT [dbo].[xBuildingExteriorOpening] ([Code], [CodeDescription]) VALUES (2, N'More than 50% of wall open')
GO
INSERT [dbo].[xBuildingShape] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xBuildingShape] ([Code], [CodeDescription]) VALUES (1, N'Square')
GO
INSERT [dbo].[xBuildingShape] ([Code], [CodeDescription]) VALUES (2, N'Rectangle')
GO
INSERT [dbo].[xBuildingShape] ([Code], [CodeDescription]) VALUES (3, N'Circular')
GO
INSERT [dbo].[xBuildingShape] ([Code], [CodeDescription]) VALUES (4, N'L-shaped')
GO
INSERT [dbo].[xBuildingShape] ([Code], [CodeDescription]) VALUES (5, N'T-shaped')
GO
INSERT [dbo].[xBuildingShape] ([Code], [CodeDescription]) VALUES (6, N'U-shaped')
GO
INSERT [dbo].[xBuildingShape] ([Code], [CodeDescription]) VALUES (7, N'H-shaped')
GO
INSERT [dbo].[xBuildingShape] ([Code], [CodeDescription]) VALUES (8, N'Complex')
GO
INSERT [dbo].[xBuildingShape] ([Code], [CodeDescription]) VALUES (9, N'Triangular')
GO
INSERT [dbo].[xBuildingType] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xBuildingType] ([Code], [CodeDescription]) VALUES (1, N'Detached')
GO
INSERT [dbo].[xBuildingType] ([Code], [CodeDescription]) VALUES (2, N'Semi-detached')
GO
INSERT [dbo].[xBuildingType] ([Code], [CodeDescription]) VALUES (3, N'Mid-terrace')
GO
INSERT [dbo].[xBuildingType] ([Code], [CodeDescription]) VALUES (4, N'End terrace')
GO
INSERT [dbo].[xBuildingType] ([Code], [CodeDescription]) VALUES (5, N'Bungalow')
GO
INSERT [dbo].[xBuildingType] ([Code], [CodeDescription]) VALUES (6, N'Manufactured')
GO
INSERT [dbo].[xBuildingType] ([Code], [CodeDescription]) VALUES (7, N'Cottage')
GO
INSERT [dbo].[xBuildingType] ([Code], [CodeDescription]) VALUES (8, N'Ranch')
GO
INSERT [dbo].[xBuildingType] ([Code], [CodeDescription]) VALUES (9, N'Cape Cod Style')
GO
INSERT [dbo].[xBuildingType] ([Code], [CodeDescription]) VALUES (10, N'Earth house')
GO
INSERT [dbo].[xBuildingType] ([Code], [CodeDescription]) VALUES (11, N'Dome')
GO
INSERT [dbo].[xChimney] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xChimney] ([Code], [CodeDescription]) VALUES (1, N'No')
GO
INSERT [dbo].[xChimney] ([Code], [CodeDescription]) VALUES (2, N'Yes, height <= 2 ft')
GO
INSERT [dbo].[xChimney] ([Code], [CodeDescription]) VALUES (3, N'Yes, 2ft <= height <= 5 ft')
GO
INSERT [dbo].[xChimney] ([Code], [CodeDescription]) VALUES (4, N'Yes, height > 5 ft')
GO
INSERT [dbo].[xCladding] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xCladding] ([Code], [CodeDescription]) VALUES (1, N'Veneer brick / masonry')
GO
INSERT [dbo].[xCladding] ([Code], [CodeDescription]) VALUES (2, N'Wood shingles / shakes')
GO
INSERT [dbo].[xCladding] ([Code], [CodeDescription]) VALUES (3, N'Clapboards')
GO
INSERT [dbo].[xCladding] ([Code], [CodeDescription]) VALUES (4, N'Aluminum / vinyl siding')
GO
INSERT [dbo].[xCladding] ([Code], [CodeDescription]) VALUES (5, N'Stone panels (real stone)')
GO
INSERT [dbo].[xCladding] ([Code], [CodeDescription]) VALUES (6, N'Exterior insulation finishing system (EIFS)')
GO
INSERT [dbo].[xCladding] ([Code], [CodeDescription]) VALUES (7, N'Stucco')
GO
INSERT [dbo].[xCladding] ([Code], [CodeDescription]) VALUES (8, N'Asbestos')
GO
INSERT [dbo].[xCladding] ([Code], [CodeDescription]) VALUES (9, N'Log')
GO
INSERT [dbo].[xCladding] ([Code], [CodeDescription]) VALUES (10, N'Stone Veneer')
GO
INSERT [dbo].[xCladding] ([Code], [CodeDescription]) VALUES (11, N'Steel')
GO
INSERT [dbo].[xCladding] ([Code], [CodeDescription]) VALUES (12, N'Light metal')
GO
INSERT [dbo].[xCladding] ([Code], [CodeDescription]) VALUES (13, N'Tile')
GO
INSERT [dbo].[xCladding] ([Code], [CodeDescription]) VALUES (14, N'Concrete')
GO
INSERT [dbo].[xCladding] ([Code], [CodeDescription]) VALUES (15, N'Fiber cement (Board)')
GO
INSERT [dbo].[xCladding] ([Code], [CodeDescription]) VALUES (16, N'Wood siding')
GO
INSERT [dbo].[xCladding] ([Code], [CodeDescription]) VALUES (17, N'Gypsum Board')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5000, N'Unknown', N'The construction class is not known.', N'5000', N'Unknown', N'100')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5050, N'Wood, Wood frame', N'Wood frame (modern) structures tend to be mostly low rise (one to three stories, occasionally four). Stud walls are typically constructed of 2x4 or 2x6 inch wood members vertically set 16 or 24 inches apart. These walls are braced by plywood or by diagonals made of wood or steel. Many detached single and low-rise multiple family residences in the United States are of stud wall wood frame construction.', N'5050 - 5099', N'Wood', N'101')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5051, N'Wood, Light wood frame', N'Light wood frame structures are typically not built in the United States but would be found in other countries, such as Japan. In Hawaii, this classification would include single wall (studless) construction framed with light timber trusses.', N'5050 - 5099', N'Wood', N'102')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5052, N'Wood, Masonry veneer', N'A wood-framed structure faced with a single width of non-load-bearing concrete, stone, or clay brick attached to the stud wall.', N'5050 - 5099', N'Wood', N'103')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5053, N'Wood, Heavy timber', N'Heavy Timber structures typically have masonry walls with heavy wood column supports, and floor and roof decks are 2-3 inch tongue-and-groove planks.', N'5050 - 5099', N'Wood', N'104')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5054, N'Wood, Okabe', N'', N'5050 - 5099', N'Wood', N'105')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5055, N'Wood, Shinkabe', N'', N'5050 - 5099', N'Wood', N'106')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5056, N'Wood, Lightweight Cladding', N'Non-structural cladding and linings (e.g., fiber cement, plywood) used in lightweight construction that uses timber or light gauge steel framing as the structural support system.', N'5050 - 5099', N'Wood', N'107')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5057, N'Wood, Hawaii indigenous material', N'Indigenous Hawaiian construction.', N'5050 - 5099', N'Wood', N'108')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5100, N'Masonry, Masonry', N'Use this option when the exterior walls are constructed of masonry materials, but detailed construction information is unavailable or unknown.', N'5100 - 5149', N'Masonry', N'111')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5101, N'Masonry, Adobe', N'Adobe construction uses adobe (clay) blocks with cement or cement-clay mixture as mortar. The roof consists of a timber frame with clay tiles or, in some cases, metal roofing.', N'5100 - 5149', N'Masonry', N'112')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5102, N'Masonry, Rubble stone masonry', N'Rubble stone masonry consists of low-rise perimeter load bearing walls composed of irregular stones laid as coursed or uncoursed rubble in a cement mortar bed, with floor and roof joists constructed with wood framing.', N'5100 - 5149', N'Masonry', N'113')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5103, N'Masonry, Unreinforced masonry bearing wall', N'Unreinforced masonry buildings consist of structures in which there is no steel reinforcing within a load bearing masonry wall. Floors, roofs, and internal partitions in these bearing wall buildings are usually of wood.', N'5100 - 5149', N'Masonry', N'114')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5104, N'Masonry, Unreinforced masonry bearing frame', N'Unreinforced masonry is used for infill walls of buildings with a bearing frame. In this structure type, the masonry is intended to be used not to support gravity loads, but to assist with lateral loads.', N'5100 - 5149', N'Masonry', N'115')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5105, N'Masonry, Reinforced masonry', N'Reinforced masonry construction consists of load bearing walls of reinforced brick or concrete-block masonry. Floor and roof joists constructed with wood framing are common.', N'5100 - 5149', N'Masonry', N'116')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5106, N'Masonry, Reinforced masonry shear wall with mrf', N'Reinforced masonry construction consists of load bearing walls of reinforced brick or concrete-block masonry. Reinforced masonry buildings with "Moment Resisting Frames" carry lateral loads by bending. "Shear Walls" are continuous reinforced brick or reinforced hollow concrete block walls extending from the foundation to the roof and can be exterior walls or interior walls.', N'5100 - 5149', N'Masonry', N'117')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5107, N'Masonry, Reinforced masonry shear wall w/o mrf', N'Reinforced masonry construction consists of load bearing walls of reinforced brick or concrete-block masonry. "Shear Walls" are continuous reinforced brick or reinforced hollow concrete block walls extending from the foundation to the roof and can be exterior walls or interior walls.', N'5100 - 5149', N'Masonry', N'118')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5108, N'Masonry, Joisted masonry', N'Masonry exterior walls with roof of combustible materials on non-combustible supports.', N'5100 - 5149', N'Masonry', N'119')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5109, N'Masonry, Confined Masonry', N'Confined masonry is a construction system in which plain masonry walls are confined on all four sides by reinforced concrete or reinforced masonry members. The walls themselves, however, carry all of the gravity and lateral loads.', N'5100 - 5149', N'Masonry', N'120')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5110, N'Masonry, Cavity Double Brick', N'An unreinforced masonry construction type composed of two layers of bricks, common in many cities in Australia.', N'5100 - 5149', N'Masonry', N'121')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5150, N'Concrete, Reinforced concrete', N'Reinforced concrete buildings consist of reinforced concrete columns and beams. Use this if the other technical characteristics of the building are unknown.', N'5150 - 5199', N'Concrete', N'131')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5151, N'Concrete, Reinforced concrete shear wall w/ mrf', N'Building constructed with reinforced concrete columns and beams, as well as reinforced concrete floor and roof. "Moment Resisting Frames" carry lateral loads by bending. "Shear Walls" are continuous reinforced concrete extending from the foundation to the roof and can be exterior walls or interior walls.', N'5150 - 5199', N'Concrete', N'132')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5152, N'Concrete, Reinforced concrete shear wall w/o mrf', N'Building constructed with reinforced concrete columns and beams, as well as reinforced concrete floor and roof. Reinforced concrete Shear Walls are continuous reinforced concrete, extending from the foundation to the roof and can be exterior walls or interior walls. This category typically consists of buildings with a concrete box structural system with shear walls. The entire structure, along with the usual concrete diaphragm, is typically cast in place.', N'5150 - 5199', N'Concrete', N'133')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5153, N'Concrete, Reinforced concrete mrf ductile', N'Buildings constructed with reinforced concrete columns, beams, and slabs. Moment Resisting Frames carry lateral loads due to earthquakes by bending. This kind of structural system can sustain large deformations and absorb energy without brittle failure.', N'5150 - 5199', N'Concrete', N'134')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5154, N'Concrete, Reinforced concrete mrf non-ductile', N'Buildings constructed with reinforced concrete columns, beams, and slabs. Moment Resisting Frames carry lateral loads due to earthquakes by bending. These structures have insufficient reinforcing steel embedded in the concrete and thus display low ductility.', N'5150 - 5199', N'Concrete', N'135')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5155, N'Concrete, Tilt-up', N'Tilt-up buildings are constructed with reinforced concrete wall panels that are cast on the ground and then tilted upward into their final positions. These wall units are then anchored to the foundation and attached to each other. The roof and floor decks are typically wood. More recently, the wall panels are fabricated off-site and trucked in. These buildings tend to be one or two stories in height.', N'5150 - 5199', N'Concrete', N'136')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5156, N'Concrete, Pre-cast concrete', N'The pre-cast frame is essentially a post and beam system in concrete in which columns, beams, and slabs are prefabricated and assembled on site.', N'5150 - 5199', N'Concrete', N'137')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5157, N'Concrete, Pre-cast concrete w/ shear wall', N'The pre-cast frame is essentially a post and beam system in concrete in which columns, beams, and slabs are prefabricated and assembled on site. Lateral loads due to earthquakes are carried by cast-in-place concrete "shear" walls.', N'5150 - 5199', N'Concrete', N'138')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5158, N'Concrete, Reinforced concrete mrf', N'A building constructed with reinforced concrete columns, beams, and slabs. "Moment-resisting frames" carry lateral loads due to earthquakes by bending. Information on the reinforcing steels is not sufficient to determine the building level of ductility.', N'5150 - 5199', N'Concrete', N'139')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5159, N'Concrete, Reinforced concrete mrf with URM', N'Reinforced concrete columns and beams form "moment-resisting frames" to carry lateral loads due to earthquakes. Unreinforced masonry walls are used as infills between the columns to add lateral load resistance, but are not intended to serve as gravity load-bearing elements.', N'5150 - 5199', N'Concrete', N'140')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5200, N'Steel, Steel', N'Steel frame buildings consist of steel columns and beams. Use this if the other technical characteristics of the building are unknown.', N'5200 - 5249', N'Steel', N'151')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5201, N'Steel, Light metal', N'Light metal buildings are made of light gauge steel frame and are usually clad with lightweight metal or asbestos siding and roof, often corrugated. They typically are low-rise structures.', N'5200 - 5249', N'Steel', N'152')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5202, N'Steel, Braced steel frame', N'Buildings constructed with steel columns and beams that are braced with diagonal steel members to resist lateral forces.', N'5200 - 5249', N'Steel', N'153')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5203, N'Steel, Steel mrf perimeter', N'Buildings constructed with steel columns and beams that are braced with diagonal steel members to resist lateral forces.', N'5200 - 5249', N'Steel', N'154')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5204, N'Steel, Steel mrf distributed', N'Buildings constructed with steel columns and beams to carry lateral loads distributed throughout the building. The diaphragms are usually concrete, sometimes over steel decking. This structural type is seldom used for low-rise buildings.', N'5200 - 5249', N'Steel', N'155')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5205, N'Steel, Steel mrf', N'Steel MRF buildings consist of structural steel columns and beams. Lateral loads due to earthquakes are carried by the "moment-resisting frames," but the locations of the moment-resisting frames in the building are unknown.', N'5200 - 5249', N'Steel', N'156')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5206, N'Steel, Steel frame w/ URM', N'Structural steel columns and beams form "moment-resisting frames" to carry lateral loads due to earthquakes. Unreinforced masonry walls are used as infills between the columns to add lateral load resistance, but are not intended to serve as vertical load-bearing elements. Sometimes the steel frames are completely hidden in the masonry walls.', N'5200 - 5249', N'Steel', N'157')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5207, N'Steel, Steel frame w/ concrete shear wall', N'Structural steel columns and beams form exterior frames, but the joints are not designed for moment resistance. Lateral loads due to earthquakes are carried by reinforced concrete "shear" walls. The concrete walls are continuous from the foundation to the roof.', N'5200 - 5249', N'Steel', N'158')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5208, N'Steel, Steel reinforced concrete', N'Structural steel sections (beams and columns) are encased in reinforced concrete. The encased structural steel columns are sometimes discontinued in the upper portions of the buildings, making the columns in the upper floor regular reinforced concrete columns.', N'5200 - 5249', N'Steel', N'159')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5209, N'Steel, Steel long span', N'Steel long-span buildings create unobstructed, column-free spaces greater than 100 feet for a variety of activities or functions. These include activities where visibility is important for large audiences (e.g., auditoriums and covered stadiums), where flexibility is important (e.g., exhibition halls and certain types of manufacturing facilities), and where large movable objects are housed. Two-hinge (made of a single member hinged at each end) and three-hinge (made of two members hinged at each end and at the meeting point at the crown) trussed arches are widely used.', N'5200 - 5249', N'Steel', N'160')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5251, N'Composite, FM – Fire res RC Apt. Masonry dwellings', N'New residential fire code; concrete, concrete block, masonry, stone, fire-resistant dwellings.', N'5250 - 5299', N'Composite - Japan', N'161')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5252, N'Composite, FT – Fire res non-apt dwl RC mas/stl', N'New residential fire code; steel, semi-fire-resistant.', N'5250 - 5299', N'Composite - Japan', N'162')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5253, N'Composite, FH – Dwellings other than FM, FT', N'New residential fire code; other dwellings.', N'5250 - 5299', N'Composite - Japan', N'163')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5254, N'Composite, F1 – Fire res RC and masonry bldg', N'New commercial fire code; concrete, concrete block, masonry, stone, fire-resistant dwellings.', N'5250 - 5299', N'Composite - Japan', N'164')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5255, N'Composite, F2 – Semi-fire res and steel bldg', N'New commercial fire code; steel, semi-fire-resistant.', N'5250 - 5299', N'Composite - Japan', N'165')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5256, N'Composite, F3 – Buildings other than F1,F2', N'New commercial fire code; other dwellings.', N'5250 - 5299', N'Composite - Japan', N'166')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5257, N'Composite, A: Fire-resistive dwellings', N'Main structure (column, beam, and floor) is constructed of concrete or steel covered with noncombustible material. Roof and external walls are built using nonflammable material.', N'5250 - 5299', N'Composite - Japan', N'171')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5258, N'Composite, B: Semi-fire-resistive dwellings', N'(1) External walls consist of any one of the following: concrete, concrete material, brick or stone masonry. (2) Steel structure with external walls of nonflammable material or covered with noncombustible material.', N'5250 - 5299', N'Composite - Japan', N'172')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5259, N'Composite, C: Slow-burning dwellings', N'(1) Wood frame with external walls of any of the following: cement or mortar plating, stone pitching or tile hinging. (2) Steel structure that does not come under Class B. Excluding building with external walls of boarding and/or synthetic resin hanging and/or cloth hanging.', N'5250 - 5299', N'Composite - Japan', N'173')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5260, N'Composite, D: Dwelling other than A, B or C', N'Building other than Class A, B, and C.', N'5250 - 5299', N'Composite - Japan', N'174')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5261, N'Composite, Sp: Fire-resistive concrete buildings', N'Main structure (column, beam, and floor) is constructed of concrete and all external walls are of any one of the following: concrete, concrete material, brick, or stone masonry.', N'5250 - 5299', N'Composite - Japan', N'175')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5262, N'Composite, 1: Fire-resistive buildings other', N'(1) Main structure (column, beam, and floor) is constructed of concrete or steel covered with noncombustible material. Roof and external walls are built using nonflammable material. (2) Main structure (column, beam, and floor) is constructed of wood and/or steel covered with noncombustible material. Roof and external walls are built of or covered by nonflammable and/or semi-nonflammable material. Column, beam, floor, and external walls are to be resistant against the heat under normal fire conditions for at least 1 hour.', N'5250 - 5299', N'Composite - Japan', N'176')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5263, N'Composite, 2: Semi-fire-resistive buildings', N'(1) External walls consist of any one of the following: concrete / concrete block / brick / stone masonry. (2) Steel structure with external walls of nonflammable and/or semi-nonflammable material or covered with noncombustible material. (3) Main structure (column, beam, and floor) is constructed of wood and/or steel covered with noncombustible material. Roof and external walls consist of or are covered by nonflammable and/or semi-nonflammable materials. Column, beam, floor, and external walls to be resistant against the heat under normal fire conditions for at least 45 minutes.', N'5250 - 5299', N'Composite - Japan', N'177')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5264, N'Composite, 3: Slow-burning buildings', N'(1) Wood frame (and not applicable to Class 1 or 2) with external walls of nonflammable and/or semi-nonflammable material or covered with noncombustible material. (2) Steel structure that does not come under Class 1 or 2. Excluding building with external walls of boarding and/or synthetic resin hanging and/or cloth hanging.', N'5250 - 5299', N'Composite - Japan', N'178')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5265, N'Composite, 4: Other than Sp, 1, 2, or 3', N'Buildings other than Class SP, 1, 2, and 3.', N'5250 - 5299', N'Composite - Japan', N'179')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5301, N'Special, Long-span', N'Building constructed with steel frame and metal siding and roof of wood or other combustible material. Typically gymnasiums or auditoriums.', N'5300 - 5349', N'Special', N'181')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5302, N'Special, Semi-wind resistive', N'A building for which a licensed engineer does not design the structure, but an attempt is made to build in accordance with an accepted wind building code; code compliance is not assured. Some engineering input may have occurred. Most of the details in a wind resistive structure are found in a semi-wind resistive structure, but not all components are wind resistive.', N'5300 - 5349', N'Special', N'182')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5303, N'Special, Wind resistive', N'A structure that was designed by a licensed engineer to comply with the wind code. Characterized by the presence of properly sized wind-resistant connectors, adequate bracing, and a continuous load path from the roof to the foundation (i.e., the roof is tied to the walls, the floors are attached to each other, and the walls are tied to the foundation).', N'5300 - 5349', N'Special', N'183')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5304, N'Special, Unknown glass', N'Code for the U.S. Hurricane Plate Glass Module when the type of glass is unknown', N'5300 - 5349', N'Special', N'185')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5305, N'Special, Safety glass', N'Safety glass includes fully tempered and laminated glass. Fully tempered glass is created by heating common annealed glass uniformly to make a high-strengthened glass. Laminated glass is made by sandwiching a plastic sheet between two glass panels, which prevents shattering and helps maintains the integrity of the building envelop even after its breakage.', N'5300 - 5349', N'Special', N'186')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5306, N'Special, Impact resistance glass', N'Impact-resistant glass similar to laminated glass (as described above), which has been tested to resist breakage from flying debris during hurricanes. Impact-resistant glass is typically thicker than safety glass and is packaged as a unit that includes a special frame.', N'5300 - 5349', N'Special', N'187')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5350, N'Mobile Homes, Mobile Homes', N'Represents a weighted average of tie-down types, including no tie-downs. Use this code for a mobile home (manufactured home) when the tie-down information is unknown.', N'5350 - 5399', N'Mobile Homes', N'191')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5351, N'Mobile Homes, Mobile homes no tie down', N'Use this code for a mobile home (manufactured home) with no anchoring systems present.', N'5350 - 5399', N'Mobile Homes', N'192')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5352, N'Mobile Homes, Mobile homes part tie down', N'Use this code for a mobile home (manufactured home) when the tie-downs are either over-the-top ties or frame ties, but not both, or with fewer ties than recommended by the manufacturer.', N'5350 - 5399', N'Mobile Homes', N'193')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5353, N'Mobile Homes, Mobile homes full tie down', N'Use this code for a mobile home (manufactured home) when the anchoring system uses both over-the-top ties and frame ties. Typically, ten frame ties and seven over-the-top ties are required for full tie-down in single-wide mobile homes.', N'5350 - 5399', N'Mobile Homes', N'194')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5400, N'Bridges, Unknown Bridge', N'Seismically or non-seismically designed highway bridges with individual span length less than 500 feet with unknown material of construction, unknown number of spans, and unknown support conditions, or other unknown bridges that cannot be mapped to any of the other bridge construction class codes.', N'5400 - 5449', N'Bridges', N'2010')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5401, N'Bridges, Conventional multiple span bridges', N'Bridges having multiple simple spans with each span being less than 500 feet. These bridges may be constructed of concrete, steel, or timber.', N'5400 - 5449', N'Bridges', N'201')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5402, N'Bridges, Conventional continuous bridges', N'Bridges having continuous spans of less than 500 feet. These bridges may be constructed of concrete, steel, or timber.', N'5400 - 5449', N'Bridges', N'202')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5403, N'Bridges, Major bridges', N'Bridges having individual spans of 500 feet or more. These bridges may be constructed of concrete or steel.', N'5400 - 5449', N'Bridges', N'203; 2031')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5404, N'Bridges, Multispan simply supported CONCRETE', N'Seismically or non-seismically designed highway bridges constructed of concrete and consisting of multiple simply supported spans, with individual span length less than 500 feet, spanning between consecutive piers and between abutments and piers.', N'5400 - 5449', N'Bridges', N'2011')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5405, N'Bridges, Multispan simply supported STEEL', N'Seismically or non-seismically designed highway bridges constructed of steel and consisting of multiple simply supported spans, with individual span length less than 500 feet, spanning between consecutive piers and between abutments and piers.', N'5400 - 5449', N'Bridges', N'2012')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5406, N'Bridges, Single Span Bridge', N'Seismically or non-seismically designed highway bridges constructed of steel or concrete and with a single span less than 500 feet spanning between abutments without intermediate piers. For single span bridges, the construction material does not matter.', N'5400 - 5449', N'Bridges', N'2013')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5407, N'Bridges, General Concrete', N'Seismically or non-seismically designed highway bridges constructed of concrete with individual span length less than 500 feet, unknown number of spans, and unknown support conditions.', N'5400 - 5449', N'Bridges', N'2015')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5408, N'Bridges, General Steel', N'Seismically or non-seismically designed highway bridges constructed of steel with individual span length less than 500 feet, unknown number of spans, and unknown support conditions.', N'5400 - 5449', N'Bridges', N'2016')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5409, N'Bridges, Multispan continuous CONCRETE', N'Seismically or non-seismically designed highway bridges constructed of concrete and consisting of multiple continuously supported spans, with individual span length less than 500 feet, spanning between consecutive piers and between abutments and piers.', N'5400 - 5449', N'Bridges', N'2021')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5410, N'Bridges, Multispan continuous STEEL', N'Seismically or non-seismically designed highway bridges constructed of steel and consisting of multiple continuously supported spans, with individual span length less than 500 feet, spanning between consecutive piers and between abutments and piers.', N'5400 - 5449', N'Bridges', N'2022')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5451, N'Pavements, Railroads', N'Railroads of any kind used to carry trains.', N'5450 - 5499', N'Pavements', N'204')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5452, N'Pavements, Highways', N'Concrete, asphalt, or gravel highways.', N'5450 - 5499', N'Pavements', N'205')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5453, N'Pavements, Runways', N'Concrete or asphalt airport runways.', N'5450 - 5499', N'Pavements', N'206')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5501, N'Dams, Concrete dams', N'Poured in place reinforced concrete dams.', N'5500 - 5549', N'Dams', N'211')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5502, N'Dams, Earthfill dams', N'Dams constructed from earth.', N'5500 - 5549', N'Dams', N'212')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5550, N'Tunnels, Unknown Tunnel', N'Lined or unlined tunnels with unknown material and unknown method of construction, or other tunnels that cannot be mapped to any of the other tunnel construction class codes.', N'5550 - 5599', N'Tunnels', N'2150')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5551, N'Tunnels, Alluvium tunnels', N'Tunnels that were drilled through unconsolidated sedimentary deposits and then typically lined with concrete.', N'5550 - 5599', N'Tunnels', N'213; 2131')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5552, N'Tunnels, Rock tunnels', N'Rock tunnels are lined or unlined tunnels that were drilled through rock.', N'5550 - 5599', N'Tunnels', N'214; 2141')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5553, N'Tunnels, Cut and cover tunnels', N'Tunnels that were constructed by cutting a trench, installing a liner, and then covering the liner with earth.', N'5550 - 5599', N'Tunnels', N'215')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5554, N'Tunnels, Rock Cut and Cover Tunnels', N'Lined or unlined rock tunnels constructed after excavating a trench and roofing over with an overhead support system.', N'5550 - 5599', N'Tunnels', N'2151')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5555, N'Tunnels, Alluvial Cut and Cover Tunnels', N'Lined or unlined alluvium tunnels constructed after excavating a trench and roofing over with an overhead support system.', N'5550 - 5599', N'Tunnels', N'2152')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5556, N'Tunnels, Alluvial Bored Tunnels', N'Lined or unlined tunnels constructed through alluvium soil using a boring machine.', N'5550 - 5599', N'Tunnels', N'2132')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5557, N'Tunnels, Rock Bored Tunnels', N'Lined or unlined tunnels drilled through rock using a boring machine.', N'5550 - 5599', N'Tunnels', N'2142')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5600, N'Tanks, Unknown Tanks', N'Storage tanks with an unknown material, unknown location, and unknown contents, or other unknowns that cannot be mapped to any of the other storage tank construction class codes.', N'5600 - 5649', N'Tanks', N'2210')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5601, N'Tanks, Underground Liquid Tanks', N'Storage tanks made of steel or concrete for holding liquids and located under the ground.', N'5600 - 5649', N'Tanks', N'221; 2211')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5602, N'Tanks, Underground Solid Tanks', N'Storage tanks made of steel or concrete for holding solid material and located under the ground.', N'5600 - 5649', N'Tanks', N'222; 2221')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5603, N'Tanks, On Ground Liquid Tanks', N'Storage tanks located on the ground surface for holding liquids with an unknown material of construction.', N'5600 - 5649', N'Tanks', N'223; 2231')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5604, N'Tanks, On Ground Steel liquid Tanks', N'Storage tanks made of steel for holding liquids and located on the ground surface.', N'5600 - 5649', N'Tanks', N'2232')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5605, N'Tanks, On Ground Concrete liquid Tanks', N'Storage tanks made of concrete for holding liquids and located on the ground surface.', N'5600 - 5649', N'Tanks', N'2233')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5606, N'Tanks, On Ground Solid Tanks', N'Storage tanks located on the ground surface for holding solid material with an unknown material of construction.', N'5600 - 5649', N'Tanks', N'224; 2241')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5607, N'Tanks, On Ground Steel solid Tanks', N'Storage tanks made of steel for holding solid material and located on the ground surface.', N'5600 - 5649', N'Tanks', N'2242')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5608, N'Tanks, On Ground Concrete solid Tanks', N'Storage tanks made of concrete for holding solid material and located on the ground surface.', N'5600 - 5649', N'Tanks', N'2243')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5609, N'Tanks, Elevated Liquid Tanks', N'Storage tanks located above the ground surface for holding liquids with an unknown material of construction.', N'5600 - 5649', N'Tanks', N'225; 2251')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5610, N'Tanks, Elevated Steel liquid Tanks', N'Storage tanks made of steel for holding liquids and located above the ground surface.', N'5600 - 5649', N'Tanks', N'2252')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5611, N'Tanks, Elevated Concrete liquid Tanks', N'Storage tanks made of concrete for holding liquids and located above the ground surface.', N'5600 - 5649', N'Tanks', N'2253')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5612, N'Tanks, Elevated Solid Tanks', N'Storage tanks located above the ground surface for holding solid material with an unknown material of construction.', N'5600 - 5649', N'Tanks', N'226; 2261')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5613, N'Tanks, Elevated Steel solid Tanks', N'Storage tanks made of steel for holding solid material and located above the ground surface.', N'5600 - 5649', N'Tanks', N'2262')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5614, N'Tanks, Elevated Concrete solid Tanks', N'Storage tanks made of concrete for holding solid material and located above the ground surface.', N'5600 - 5649', N'Tanks', N'2263')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5650, N'Pipelines, Unknown Pipeline', N'Pipelines with an unknown location and material, or other unknown pipelines that cannot be mapped to any of the other pipeline construction class codes.', N'5650 - 5699', N'Pipelines', N'2270')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5651, N'Pipelines, General Underground Pipelines', N'Pipelines located under the surface of the ground with an unknown material of construction.', N'5650 - 5699', N'Pipelines', N'227; 2271')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5652, N'Pipelines, Underground Cast Iron Pipelines', N'Pipelines located under the surface of the ground and made of cast iron material.', N'5650 - 5699', N'Pipelines', N'2272')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5653, N'Pipelines, Underground Asbestos Cement Pipelines', N'Pipelines located under the surface of the ground and made of asbestos-cement material.', N'5650 - 5699', N'Pipelines', N'2273')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5654, N'Pipelines, Underground Concrete Pipelines', N'Pipelines located under the surface of the ground and made of concrete material.', N'5650 - 5699', N'Pipelines', N'2274')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5655, N'Pipelines, Underground PVC Pipelines', N'Pipelines located under the surface of the ground and made of PVC material.', N'5650 - 5699', N'Pipelines', N'2275')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5656, N'Pipelines, Underground Ductile Iron Pipelines', N'Pipelines located under the surface of the ground and made of ductile iron material.', N'5650 - 5699', N'Pipelines', N'2276')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5657, N'Pipelines, General At Grade Pipelines', N'Pipelines located at the surface of the ground with an unknown material of construction.', N'5650 - 5699', N'Pipelines', N'228; 2281')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5658, N'Pipelines, At Grade Cast Iron Pipelines', N'Pipelines located at the surface of the ground and made of cast iron material.', N'5650 - 5699', N'Pipelines', N'2282')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5659, N'Pipelines, At Grade Asbestos Cement Pipelines', N'Pipelines located at the surface of the ground and made of asbestos-cement material.', N'5650 - 5699', N'Pipelines', N'2283')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5660, N'Pipelines, At Grade Concrete Pipelines', N'Pipelines located at the surface of the ground and made of concrete material.', N'5650 - 5699', N'Pipelines', N'2284')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5661, N'Pipelines, At Grade PVC Pipelines', N'Pipelines located at the surface of the ground and made of PVC material.', N'5650 - 5699', N'Pipelines', N'2285')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5662, N'Pipelines, At Grade Ductile Iron Pipelines', N'Pipelines located at the surface of the ground and made of ductile iron material.', N'5650 - 5699', N'Pipelines', N'2286')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5701, N'Chimneys, Masonry chimneys', N'Masonry chimneys over 30 feet high.', N'5700 - 5749', N'Chimneys', N'231')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5702, N'Chimneys, Concrete chimneys', N'Reinforced concrete chimneys over 30 feet high.', N'5700 - 5749', N'Chimneys', N'232')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5703, N'Chimneys, Steel chimneys', N'Steel chimneys over 30 feet high.', N'5700 - 5749', N'Chimneys', N'233')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5751, N'Towers, Electrical transmission conventional', N'Steel towers under 100 feet high designed to hold up electrical transmission lines.', N'5750 - 5799', N'Towers', N'234')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5752, N'Towers, Electrical transmission major', N'Steel towers over 100 feet high designed to hold up electrical transmission lines.', N'5750 - 5799', N'Towers', N'235')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5753, N'Towers, Broadcast towers', N'Steel towers designed to carry radio, TV, or cell phone transmission equipment.', N'5750 - 5799', N'Towers', N'236')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5754, N'Towers, Observation towers', N'Elevated towers designed for people to look out of, such as airport control or fire observation towers.', N'5750 - 5799', N'Towers', N'237')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5755, N'Towers, Offshore towers', N'Offshore towers are towers with a platform that are anchored to the ground under the ocean.', N'5750 - 5799', N'Towers', N'238')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5801, N'Equipment, Residential equipment', N'Residential furnishings including furniture and appliances.', N'5800 - 5849', N'Equipment', N'241')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5802, N'Equipment, Office equipment', N'Office furniture, file cabinets, PCs, etc.', N'5800 - 5849', N'Equipment', N'242')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5803, N'Equipment, Electrical equipment', N'Non-high tech electrical equipment other than electrical equipment included as part of the function of the building.', N'5800 - 5849', N'Equipment', N'243')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5804, N'Equipment, Mechanical equipment', N'All equipment not otherwise classified in a building.', N'5800 - 5849', N'Equipment', N'244')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5805, N'Equipment, High-technology equipment', N'Sensitive equipment easily damaged by shaking.', N'5800 - 5849', N'Equipment', N'245')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5806, N'Equipment, Trains, trucks, airplanes etc.', N'Any type of train, truck, or airplane.', N'5800 - 5849', N'Equipment', N'246')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5807, N'Equipment, Thermal Power Plant', N'Thermal power plants are energy centers that convert heat energy into electrical energy. In Japan, heat is usually generated by fuel, coal, or nuclear. Plants typically include components, such as boilers (or reactors), gas turbines, pumps, generators, cooling towers, power transmission lines, substations, transformers, bushings, circuit breakers/switches, waste management facilities, and building structures supporting operation of the plant or for administrative purposes.', N'5800 - 5849', N'Equipment', N'247')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5850, N'Automobiles, Unknown HAZUS', N'Typically a four-wheeled automotive vehicle designed for passenger transportation. Use this code for unknown automobiles in general or for HAZUS unknown classification.', N'5850 - 5899', N'Automobiles', N'261')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5851, N'Automobiles, Personal', N'Typically a four-wheeled personal automotive vehicle designed for passenger transportation.', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5852, N'Automobiles, Dealers', N'Typically a four-wheeled dealers (part of the fleet) automotive vehicle designed for passenger transportation.', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5853, N'Automobiles, 4 Wheeler', N'Typically a four-wheeled automotive vehicle designed for passenger transportation.', N'5850 - 5899', N'Automobiles', N'262')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5854, N'Automobiles, 2 Wheeler', N'Typically a two-wheeled automotive vehicle designed for passenger transportation; may include a side car with a third wheel.', N'5850 - 5899', N'Automobiles', N'263')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5855, N'Automobiles, G', N'Off-road personal vehicle', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5856, N'Motorcycles, Small', N'A two-wheeled or three-wheeled vehicle with a maximum design speed of not more than 50 km/h', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5857, N'Motorcycles, Large', N'Mopeds, Motorcycles, Motor Tricycles and Quadricycles with a maximum design speed of more than 50 km/h', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5858, N'Automobiles, M1', N'Vehicles designed and constructed for the carriage of passengers and comprising no more than eight seats in addition to the driver’s seat, and having a maximum mass (“technically permissible maximum laden mass”) not exceeding 3.5 tons', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5859, N'Buses, M2 + M3', N'Vehicles designed and constructed for the carriage of passengers, comprising more than eight seats in addition to the driver’s seat', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5860, N'Automobiles, M1 Low cost', N'M1 type vehicle with value lower than average M1 car.', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5861, N'Automobiles, M1 High cost', N'M1 type vehicle with value higher than average M1 car.', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5862, N'Automobiles, M1 Large fleet', N'Typically a fleet from 51 up to 100 vehicles of M1 type.', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5863, N'Automobiles, M1 Mid-size fleet', N'Typically a fleet from 21 up to 50 vehicles of M1 type.', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5864, N'Automobiles, M1 Small fleet', N'Typically a fleet with up to 20 vehicles of M1 type.', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5865, N'Cargo, N', N'Power-driven vehicles having at least four wheels and used for the carriage of goods', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5866, N'Trailers, O', N'Trailers (including semi-trailers)', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5867, N'Tractor trailers, OT', N'Tractor trailers', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5868, N'Mobile industrial machines, S', N'Self-propelled industrial machines. Trailer industrial machines. Tractor trailer industrial machines.', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5869, N'Tractors, T', N'Agricultural and Forestry tractors', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5870, N'Cars GEC, unknown GEC', N'Typically a four-wheeled automotive vehicle designed for passenger transportation.', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5871, N'Cars GEC, Compact', N'Typically a four-wheeled automotive vehicle designed for passenger transportation with passenger and cargo volume between 100 cu. ft. (2830 l) and 109 cu. ft. (3110 l)', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5872, N'Cars GEC, Large', N'Typically a four-wheeled automotive vehicle designed for passenger transportation with passenger and cargo volume higher than 120 cu. ft. (3400 l)', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5873, N'Cars GEC, Mid-Size', N'Typically a four-wheeled automotive vehicle designed for passenger transportation with passenger and cargo volume between 110 cu. ft. (3110 l) and 119 cu. ft. (3395 l)', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5874, N'Cars GEC, Pick-Up & Trucks and SUV', N'Pick-Up & Trucks and SUV', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5875, N'Cars GEC, Sub-Compact', N'Typically a four-wheeled automotive vehicle designed for passenger transportation with passenger and cargo volume less than 99 cu. ft. (2830 l)', N'5850 - 5899', N'Automobiles', N'N/A')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5900, N'Marine Craft, Pleasure Boats & Yachts', N'Typically privately-owned boats that can be used for recreation, fishing, or cruising. This description is meant to exclude commercial vessels, such as cargo ships or tugboats. Use this construction code if the boat power/sail classification is unknown.', N'5900 - 5949', N'Marine Craft', N'265')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5901, N'Marine Craft, Pleasure Boats & Yachts - Power Boats', N'A pleasure boat that is powered only by a motor (no sails).', N'5900 - 5949', N'Marine Craft', N'266')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5902, N'Marine Craft, Pleasure Boats & Yachts - Sail Boats', N'A pleasure boat that is capable of being powered by wind through the use of sails. Boats that have both sails and a motor should be modeled under this code.', N'5900 - 5949', N'Marine Craft', N'267')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5951, N'Miscellaneous, Railway Property', N'Railway properties are composed of major components of railway systems, which include railway stations, railway tunnels, railway bridges, railway tracks, and cables along the tracks but excluding trains.', N'5950 - 5999', N'Miscellaneous', N'250')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5952, N'Miscellaneous, Pumping Station', N'Pumping stations are structures with mechanical devices that are used typically when a fluid material must be raised from a low point to a point of higher elevation, or where the topography prevents downhill gravity flow.', N'5950 - 5999', N'Miscellaneous', N'251')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5953, N'Miscellaneous, Compressor stations', N'Compressor stations are structures with mechanical devices that are used for increasing the pressure of a gas by mechanically decreasing its volume.', N'5950 - 5999', N'Miscellaneous', N'252')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5954, N'Miscellaneous, Cranes', N'A machine for raising, shifting, and lowering heavy weights by means of a projecting swinging arm or with the hoisting apparatus supported on an overhead track.', N'5950 - 5999', N'Miscellaneous', N'253')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5955, N'Miscellaneous, Conveyor systems', N'Devices used for moving loose material (typically on a belt, on rollers, or in an auger).', N'5950 - 5999', N'Miscellaneous', N'254')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5956, N'Miscellaneous, Canals', N'An artificial waterway of any depth used for draining or irrigating land or for navigation.', N'5950 - 5999', N'Miscellaneous', N'255')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5957, N'Miscellaneous, Earth retaining structures', N'Earth retaining structures taller than 20 feet high.', N'5950 - 5999', N'Miscellaneous', N'256')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5958, N'Miscellaneous, Waterfront structures', N'Wharves or docks built next to the shore of navigable waters so that ships may receive and discharge cargo and passengers or walls of artificially enclosed basins into which vessels are brought for inspection and repair.', N'5950 - 5999', N'Miscellaneous', N'257')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5959, N'Miscellaneous, Transit Warehouse', N'Transit warehouses often refer to distribution centers that temporarily store various commodities for further distribution, including wholesale stores. The commodities can be light (e.g., food, drug, light fabrication of clothing, high technology electricals) and heavy (e.g., heavy construction machineries). Warehouses are typically one story steel frame or SRC (steel reinforced concrete) construction with high ceilings. Most of the commodities are well packed and can be stacked during storage.', N'5950 - 5999', N'Miscellaneous', N'259')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (5960, N'Miscellaneous, Marine Hull', N'Marine hull insurance covers the hull and machinery of a vessel. Specific ports or docks include loading or unloading (port risk), under construction (builders risk), and repair (repairing risk).', N'5950 - 5999', N'Miscellaneous', N'260')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (6000, N'Marine Cargo, Unknown / General', N'General / unknown marine cargo code.', N'6000', N'Marine Cargo Unknown', N'276')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (6051, N'Marine Cargo, Carpool', N'Open areas close to harbors where thousands of cars are gridded before being shipped on Personal Car Carriers (PCCs).', N'6051 - 6099', N'Marine Cargo General', N'270')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (6052, N'Marine Cargo, General and Containerized Cargo', N'Cubicles 8 feet in width, 8.5 feet in height, and 20 or 40 feet in length in which commodities are packed. Cubicles are usually stacked on ships, trains, or airplanes for long-distance transportation.', N'6051 - 6099', N'Marine Cargo General', N'271')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (6053, N'Marine Cargo, Heavy Cargo', N'Heavy cargos are usually heavy machinery that cannot be fit into a standard container, such as jack-up and semi-submersible rigs, dredging equipment, luxury yachts, offshore production modules and sub-sea structures, construction machinery, container cranes and harbor equipment, and complete factories. Vessels used for this type of cargo are usually semi-submersible heavy lift ships, conventional heavy lift ships, tow barges and dockships. Heavy cargo is sometimes containerized.', N'6051 - 6099', N'Marine Cargo General', N'272')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (6054, N'Marine Cargo, Refrigerated Cargo', N'Refrigerated cargo is similar to general containerized cargo, but with additional cooling equipment to keep commodities fresh. Commodities are commonly fruits and frozen goods. This type of containerized cargo requires an external source of power to maintain a temperature-controlled environment.', N'6051 - 6099', N'Marine Cargo General', N'273')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (6055, N'Marine Cargo, Dry Bulk Cargo', N'Dry bulk cargo refers to bare solid materials, such as coal, metal ore, lumber, and grains.', N'6051 - 6099', N'Marine Cargo General', N'274')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (6056, N'Marine Cargo, Liquid Bulk Cargo', N'Liquid bulk cargo refers to bare liquid material, such as oil, liquefied natural gas, and liquid chemicals. Liquid bulk cargo is generally stored in tank farms on shore.', N'6051 - 6099', N'Marine Cargo General', N'275')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (6100, N'Marine Cargo, Combustible: Unknown Cargo', N'Unknown marine cargo, Combustible.', N'6100 - 6149', N'Marine Cargo', N'286')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (6101, N'Marine Cargo, Combustible: Carpool', N'Open areas close to harbors where thousands of cars are gridded before being shipped on Personal Car Carriers (PCCs).', N'6100 - 6149', N'Marine Cargo', N'280')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (6102, N'Marine Cargo, Combustible: General and Containerized', N'Cubicles 8 feet in width, 8.5 feet in height, and 20 or 40 feet in length in which commodities are packed. Cubicles are usually stacked on ships, trains, or airplanes for long-distance transportation.', N'6100 - 6149', N'Marine Cargo', N'281')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (6103, N'Marine Cargo, Combustible: Heavy Cargo', N'Heavy cargos are usually heavy machinery that cannot be fit into a standard container, such as jack-up and semi-submersible rigs, dredging equipment, luxury yachts, offshore production modules and sub-sea structures, construction machinery, container cranes and harbor equipment, and complete factories. Vessels used for this type of cargo are usually semi-submersible heavy lift ships, conventional heavy lift ships, tow barges, and dockships. Heavy cargo is sometimes containerized.', N'6100 - 6149', N'Marine Cargo', N'282')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (6104, N'Marine Cargo, Combustible: Refrigerated Cargo', N'Refrigerated cargo is similar to general containerized cargo, but with additional cooling equipment to keep commodities fresh. Commodities are commonly fruits and frozen goods. This type of containerized cargo requires an external source of power to maintain a temperature-controlled environment.', N'6100 - 6149', N'Marine Cargo', N'283')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (6105, N'Marine Cargo, Combustible: Dry Bulk Cargo', N'Dry bulk cargo refers to bare solid materials, such as coal, metal ore, lumber, and grains.', N'6100 - 6149', N'Marine Cargo', N'284')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (6106, N'Marine Cargo, Combustible: Liquid Bulk Cargo', N'Liquid bulk cargo refers to bare liquid material, such as oil, liquefied natural gas, and liquid chemicals. Liquid bulk cargo is generally stored in tank farms on shore.', N'6100 - 6149', N'Marine Cargo', N'285')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (6150, N'Marine Cargo, Non-Combustible: Unknown Cargo', N'Unknown marine cargo, Non-Combustible.', N'6150 - 6199', N'Marine Cargo', N'296')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (6151, N'Marine Cargo, Non-Combustible: Carpool', N'Open areas close to harbors where thousands of cars are gridded before being shipped on Personal Car Carriers (PCCs).', N'6150 - 6199', N'Marine Cargo', N'290')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (6152, N'Marine Cargo, Non-Combustible: General and Container', N'Cubicles 8 feet in width, 8.5 feet in height, and 20 or 40 feet in length in which commodities are packed. Cubicles are usually stacked on ships, trains, or airplanes for long-distance transportation.', N'6150 - 6199', N'Marine Cargo', N'291')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (6153, N'Marine Cargo, Non-Combustible: Heavy Cargo', N'Heavy cargos are usually heavy machinery that cannot be fit into a standard container, such as jack-up and semi-submersible rigs, dredging equipment, luxury yachts, offshore production modules and sub-sea structures, construction machinery, container cranes and harbor equipment, and complete factories. Vessels used for this type of cargo are usually semi-submersible heavy lift ships, conventional heavy lift ships, tow barges, and dockships. Heavy cargo is sometimes containerized.', N'6150 - 6199', N'Marine Cargo', N'292')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (6154, N'Marine Cargo, Non-Combustible: Refrigerated Cargo', N'Refrigerated cargo is similar to general containerized cargo, but with additional cooling equipment to keep commodities fresh. Commodities are commonly fruits and frozen goods. This type of containerized cargo requires an external source of power to maintain a temperature-controlled environment.', N'6150 - 6199', N'Marine Cargo', N'293')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (6155, N'Marine Cargo, Non-Combustible: Dry Bulk Cargo', N'Dry bulk cargo refers to bare solid materials, such as coal, metal ore, lumber, and grains.', N'6150 - 6199', N'Marine Cargo', N'294')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (6156, N'Marine Cargo, Non-Combustible: Liquid Bulk Cargo', N'Liquid bulk cargo refers to bare liquid material, such as oil, liquefied natural gas, and liquid chemicals. Liquid bulk cargo is generally stored in tank farms on shore.', N'6150 - 6199', N'Marine Cargo', N'295')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (7000, N'Offshore, Unknown', N'A structure that is anchored to the ground under the ocean. Platform construction class is unknown.', N'7000', N'Offshore Unknown', N'258; 800')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (7001, N'Offshore, Caisson', N'Caisson platforms use large diameter caissons to support a single well completion with a minimal deck. The deck is capable of supporting limited production, control equipment, and navigational aids. Caisson platform completions are limited to water depths of 100 feet or less.', N'7001 - 7999', N'Offshore', N'801')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (7002, N'Offshore, Compliant Tower', N'Compliant Towers consist of narrow, flexible towers and piled foundations that can support a conventional deck for drilling and production operations. Unlike fixed platforms, Compliant Towers withstand large lateral forces by sustaining significant lateral deflections and are usually used in water depths between 1,000 and 2,000 feet.', N'7001 - 7999', N'Offshore', N'802')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (7003, N'Offshore, Fixed Jacket Platform', N'Fixed platforms consist of jackets (a tall vertical section made of tubular steel members supported by piles driven into the seabed) with a deck placed on top, providing space for crew quarters, a drilling rig, and production facilities. Fixed platforms are economically feasible for installation in water depths up to 1,500 feet.', N'7001 - 7999', N'Offshore', N'803')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (7004, N'Offshore, Jack-up', N'Jackups are platforms that can be jacked up above the sea using legs that can be lowered like jacks. These platforms, used in relatively low depths, are designed to move from place to place and then anchor themselves by deploying the jack-like legs.', N'7001 - 7999', N'Offshore', N'804')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (7005, N'Offshore, Mini Tension Leg Platform', N'Mini Tension Leg Platforms (MTLP) are floating platforms of relatively low cost developed for production of smaller deepwater reserves that would be uneconomic to produce using more conventional deepwater production systems. They can also be used as a utility, satellite, or early production platform for larger deepwater discoveries.', N'7001 - 7999', N'Offshore', N'805')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (7006, N'Offshore, Drill Rig', N'Drill rig.', N'7001 - 7999', N'Offshore', N'806')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (7007, N'Offshore, Semi Submersible Floating Production', N'Semi-submersible floating production platforms have legs of sufficient buoyancy to cause the structure to float, but weight sufficient to keep the structure upright. These rigs can be moved from place to place and ballasted up or down by altering the amount of flooding in buoyancy tanks. They are generally anchored by cable anchors during drilling operations, though they can also be kept in place by the use of dynamic positioning. Semi-submersibles can be used in depths from 200 to 6,000 feet.', N'7001 - 7999', N'Offshore', N'807')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (7008, N'Offshore, Drill Ship', N'Drill ships are maritime vessels that have been fitted with drilling apparatuses. They are most often used for exploratory drilling of new oil or gas wells in deep water, but can also be used for scientific drilling. They are often built on modified tanker hulls and outfitted with dynamic positioning systems to maintain their position over a well. Drill ships are able to drill in water depths of over 6,500 feet.', N'7001 - 7999', N'Offshore', N'808')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (7009, N'Offshore, SPAR Floating Production System', N'SPARs consist of a large diameter single vertical cylinder supporting a deck. They have typical fixed platform topsides (surface decks with drilling and production equipment), three types of risers (production, drilling, and export), and hulls moored with taut caternary systems of six to 20 lines anchored into the seafloor. SPARs are generally used in water depths up to 3,000 feet.', N'7001 - 7999', N'Offshore', N'809')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (7010, N'Offshore, Submersible Production System', N'Floating vessels, usually used as mobile offshore drilling units (MODUs), that are supported primarily on large pontoon-like structures submerged below the sea surface. The operating decks are elevated 100 or more feet above the pontoons on large steel columns. Once on the desired location, this type of structure is slowly flooded until it rests on the sea floor. After the well is completed, the water is pumped out of the buoyancy tanks, and the vessel is refloated and towed to the next location. Submersibles operate in relatively shallow water, since they must rest on the seafloor.', N'7001 - 7999', N'Offshore', N'810')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (7011, N'Offshore, Underwater Production Units, Completion', N'Subsea Systems range from single subsea wells producing to a nearby platform, FPS, or TLP to multiple wells producing through a manifold and pipeline system to a distant production facility. These systems are presently used in water depths greater than 5,000 feet.', N'7001 - 7999', N'Offshore', N'811')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (7012, N'Offshore, Tension Leg Platform', N'Tension Leg Platforms (TLPs) consist of a floating structure held in place by vertical, tensioned tendons connected to the sea floor by pile-secured templates. Tensioned tendons provide for the use of a TLP in a broad water depth range with limited vertical motion. Larger TLPs have been successfully deployed in water depths approaching 4,000 feet.', N'7001 - 7999', N'Offshore', N'812')
GO
INSERT [dbo].[xConstruction] ([Code], [ConstructionName], [ConstructionDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (7013, N'Offshore, Well Protector', N'Well head protection structures.', N'7001 - 7999', N'Offshore', N'813')
GO
INSERT [dbo].[xConstructionQuality] ([Code], [CodeDescription], [Notes]) VALUES (0, N'Unknown / default', NULL)
GO
INSERT [dbo].[xConstructionQuality] ([Code], [CodeDescription], [Notes]) VALUES (1, N'Fortified Home (IBHS) Bronze Option 1', NULL)
GO
INSERT [dbo].[xConstructionQuality] ([Code], [CodeDescription], [Notes]) VALUES (2, N'Fortified Home (IBHS) Bronze Option 2', NULL)
GO
INSERT [dbo].[xConstructionQuality] ([Code], [CodeDescription], [Notes]) VALUES (3, N'Fortified Home (IBHS) Silver Option 1', NULL)
GO
INSERT [dbo].[xConstructionQuality] ([Code], [CodeDescription], [Notes]) VALUES (4, N'Fortified Home (IBHS) Silver Option 2', NULL)
GO
INSERT [dbo].[xConstructionQuality] ([Code], [CodeDescription], [Notes]) VALUES (5, N'Fortified Home (IBHS) Gold Option 1', NULL)
GO
INSERT [dbo].[xConstructionQuality] ([Code], [CodeDescription], [Notes]) VALUES (6, N'Fortified Home (IBHS) Gold Option 2', NULL)
GO
INSERT [dbo].[xConstructionQuality] ([Code], [CodeDescription], [Notes]) VALUES (7, N'Fortified for Safer Living (IBHS)', NULL)
GO
INSERT [dbo].[xConstructionQuality] ([Code], [CodeDescription], [Notes]) VALUES (8, N'High', N'Code level design and best construction practice, structural survey information available indicating good condition without  signs of damage')
GO
INSERT [dbo].[xConstructionQuality] ([Code], [CodeDescription], [Notes]) VALUES (9, N'Medium', N'No structural survey information available but visual inspection shows no signs of damage')
GO
INSERT [dbo].[xConstructionQuality] ([Code], [CodeDescription], [Notes]) VALUES (10, N'Low', N'No structural survey information available but visual inspection shows obvious signs of damage')
GO
INSERT [dbo].[xContentsFloodVuln] ([Code], [CodeDescription], [Notes]) VALUES (0, N'Unknown / default', N'Level of vulnerability is unknown')
GO
INSERT [dbo].[xContentsFloodVuln] ([Code], [CodeDescription], [Notes]) VALUES (1, N'Low', N'An unusually large percentage of the contents is water-resistant or protected')
GO
INSERT [dbo].[xContentsFloodVuln] ([Code], [CodeDescription], [Notes]) VALUES (2, N'Moderate', N'A typical percentage or the contents is water-resistance or protected')
GO
INSERT [dbo].[xContentsFloodVuln] ([Code], [CodeDescription], [Notes]) VALUES (3, N'High', N'A low percentage of the contents is water-resistant or protected')
GO
INSERT [dbo].[xContentsFloodVuln] ([Code], [CodeDescription], [Notes]) VALUES (4, N'Very High', N'Almost none of the contents are water-resistant or protected')
GO
INSERT [dbo].[xContentsQuakeVuln] ([Code], [CodeDescription], [Notes]) VALUES (0, N'Unknown / default', N'Level of vulnerability is unknown')
GO
INSERT [dbo].[xContentsQuakeVuln] ([Code], [CodeDescription], [Notes]) VALUES (1, N'Low', N'An unusually large percentage of the contents is quake-resistant or protected')
GO
INSERT [dbo].[xContentsQuakeVuln] ([Code], [CodeDescription], [Notes]) VALUES (2, N'Moderate', N'A typical percentage or the contents is quake-resistance or protected')
GO
INSERT [dbo].[xContentsQuakeVuln] ([Code], [CodeDescription], [Notes]) VALUES (3, N'High', N'A low percentage of the contents is quake-resistant or protected')
GO
INSERT [dbo].[xContentsQuakeVuln] ([Code], [CodeDescription], [Notes]) VALUES (4, N'Very High', N'Almost none of the contents are quake-resistant or protected')
GO
INSERT [dbo].[xContentsWindVuln] ([Code], [CodeDescription], [Notes]) VALUES (0, N'Unknown / default', N'Level of vulnerability is unknown')
GO
INSERT [dbo].[xContentsWindVuln] ([Code], [CodeDescription], [Notes]) VALUES (1, N'Low', N'An unusually large percentage of the contents is wind-resistant or protected')
GO
INSERT [dbo].[xContentsWindVuln] ([Code], [CodeDescription], [Notes]) VALUES (2, N'Moderate', N'A typical percentage or the contents is wind-resistance or protected')
GO
INSERT [dbo].[xContentsWindVuln] ([Code], [CodeDescription], [Notes]) VALUES (3, N'High', N'A low percentage of the contents is wind-resistant or protected')
GO
INSERT [dbo].[xContentsWindVuln] ([Code], [CodeDescription], [Notes]) VALUES (4, N'Very High', N'Almost none of the contents are wind-resistant or protected')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'A1', N'In AIR: ALO', N'Arctic, Bering, North Pacific')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'A2', N'In AIR: ANO', N'South Atlantic')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'A3', N'In AIR: ARO', N'Arctic')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'A4', N'In AIR: AUO', N'South Pacific, North Pacific, Indian')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'B1', N'In AIR: BCO', N'Gulf of Mexico')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'B2', N'In AIR: BRO', N'South Atlantic, North atlantic')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'B3', N'In AIR: BSO', N'Baltic Sea')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'C1', N'In AIR: CAO', N'North Pacific, North Atlantic, Hudson Bay')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'C3', N'In AIR: CNO', N'North Pacific')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'E1', N'In AIR: EAO', N'Indian')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'E2', N'In AIR: EGO', N'Mediterranean Sea, Red Sea')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'F1', N'In AIR: FAO', N'North Pacific, Arctic')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'G1', N'In AIR: GAO', N'North Atlantic, South Atlantic')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'I1', N'In AIR: INO', N'Indian')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'J1', N'In AIR: JKO', N'Sea of Japan, North Pacific')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'M1', N'In AIR: MEO', N'Mediterranean Sea')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'M2', N'In AIR: MIO', N'India, Mediterranean Sea')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'M3', N'In AIR: MXO', N'Gulf of Mexico, North Pacific')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'N1', N'In AIR: NIO', N'North Atlantic')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'N2', N'In AIR: NOO', N'Norwegian Sea, Barents Sea')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'N3', N'In AIR: NSO', N'North Sea')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'R1', N'In AIR: RUO', N'Barents, Kara Sea, East Siberian Sea')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'S1', N'In AIR: SAO', N'South Atlantic, North Atlantic, South Pacific, North Pacific')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'S2', N'In AIR: SEO', N'North Sea, Baltic Sea')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'S3', N'In AIR: SSO', N'Gulf of Thailand, South China Sea')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'T1', N'In AIR: TTO', N'North Atlantic')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'U1', N'In AIR: UKO', N'North Sea, English Channel, North Atlantic')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'V1', N'In AIR: VEO', N'Atlantic Ocean')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'V2', N'In AIR: VNO', N'Gulf of Thailand, South China Sea')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'W4', N'In AIR: WAO', N'North Atlantic, South Atlantic')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'W5', N'In AIR: WUO', N'North Pacific')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'XB', N'OED defined code', N'')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'XS', N'OED defined code', N'')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'XE', N'OED defined code', N'')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'XW', N'OED defined code', N'')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'G2', N'In AIR: GOM', N'Gulf of Mexico')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'C2', N'In AIR: CAS', N'Caspian Sea')
GO
INSERT [dbo].[xCountryCodeComments] ([CountryCode], [Non_ISO3166_code], [Offshore]) VALUES (N'XK', N'OED defined code', N'')
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'A1', N'Alaska Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'A2', N'Angola Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'A3', N'Arctic Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'A4', N'Australasia Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'AD', N'Andorra', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'AE', N'United Arab Emirates', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'AF', N'Afghanistan', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'AG', N'Antigua and Barbuda', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'AI', N'Anguilla', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'AL', N'Albania', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'AM', N'Armenia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'AO', N'Angola', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'AQ', N'Antarctica', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'AR', N'Argentina', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'AS', N'American Samoa', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'AT', N'Austria', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'AU', N'Australia', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'AW', N'Aruba', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'AX', N'Aland Islands', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'AZ', N'Azerbaijan', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'B1', N'Bay of Campeche Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'B2', N'Brazil Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'B3', N'Baltic Sea Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'BA', N'Bosnia and Herzegovina', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'BB', N'Barbados', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'BD', N'Bangladesh', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'BE', N'Belgium', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'BF', N'Burkina Faso', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'BG', N'Bulgaria', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'BH', N'Bahrain', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'BI', N'Burundi', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'BJ', N'Benin', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'BL', N'Saint Barthélemy', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'BM', N'Bermuda', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'BN', N'Brunei', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'BO', N'Bolivia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'BR', N'Brazil', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'BS', N'Bahamas', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'BT', N'Bhutan', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'BV', N'Bouvet Island', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'BW', N'Botswana', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'BY', N'Belarus', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'BZ', N'Belize', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'C1', N'Canada Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'C2', N'Caspian Sea', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'C3', N'China Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'CA', N'Canada', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'CC', N'Cocos Islands', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'CD', N'Congo  Republic Of', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'CF', N'Central African Republic', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'CG', N'Congo', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'CH', N'Switzerland', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'CI', N'Cote D Ivoire', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'CK', N'Cook Islands', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'CL', N'Chile', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'CM', N'Cameroon', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'CN', N'China', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'CO', N'Colombia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'CR', N'Costa Rica', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'CU', N'Cuba', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'CV', N'Cape Verde', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'CW', N'Curacao', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'CX', N'Christmas Island', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'CY', N'Cyprus', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'CZ', N'Czech Republic', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'DE', N'Germany', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'DJ', N'Djibouti', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'DK', N'Denmark', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'DM', N'Dominica', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'DO', N'Dominican Republic', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'DZ', N'Algeria', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'E1', N'East Africa Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'E2', N'Egypt Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'EC', N'Ecuador', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'EE', N'Estonia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'EG', N'Egypt', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'EH', N'Western Sahara', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'ER', N'Eritrea', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'ES', N'Spain', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'ET', N'Ethiopia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'F1', N'Far East Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'FI', N'Finland', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'FJ', N'Fiji', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'FK', N'Falkland Islands', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'FM', N'Micronesia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'FO', N'Faeroe Islands', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'FR', N'France', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'G1', N'Gabon Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'G2', N'Gulf Of Mexico', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'GA', N'Gabon', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'GB', N'United Kingdom', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'GD', N'Grenada', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'GE', N'Georgia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'GF', N'French Guiana', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'GG', N'Guernsey', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'GH', N'Ghana', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'GI', N'Gibraltar', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'GL', N'Greenland', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'GM', N'Gambia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'GN', N'Guinea', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'GP', N'Guadeloupe', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'GQ', N'Equatorial Guinea', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'GR', N'Greece', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'GS', N'South Georgia and the South Sandwich Islands', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'GT', N'Guatemala', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'GU', N'Guam', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'GW', N'Guinea-Bissau', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'GY', N'Guyana', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'HK', N'Hong Kong', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'HM', N'Heard Island and Mcdonald Islands', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'HN', N'Honduras', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'HR', N'Croatia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'HT', N'Haiti', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'HU', N'Hungary', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'I1', N'Indian Subcontinent Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'ID', N'Indonesia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'IE', N'Ireland', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'IL', N'Israel', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'IM', N'Isle Of Man', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'IN', N'India', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'IO', N'British Indian Ocean Territory', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'IQ', N'Iraq', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'IR', N'Iran', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'IS', N'Iceland', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'IT', N'Italy', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'J1', N'Japan/Korea Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'JE', N'Jersey', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'JM', N'Jamaica', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'JO', N'Jordan', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'JP', N'Japan', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'KE', N'Kenya', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'KG', N'Kyrgyzstan', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'KH', N'Cambodia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'KI', N'Kiribati', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'KM', N'Comoros', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'KN', N'Saint Kitts and Nevis', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'KP', N'Korea', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'KR', N'South Korea', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'KW', N'Kuwait', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'KY', N'Cayman Islands', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'KZ', N'Kazakhstan', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'LA', N'Lao Peoples Democratic Republic', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'LB', N'Lebanon', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'LC', N'Saint Lucia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'LI', N'Liechtenstein', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'LK', N'Sri Lanka', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'LR', N'Liberia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'LS', N'Lesotho', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'LT', N'Lithuania', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'LU', N'Luxembourg', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'LV', N'Latvia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'LY', N'Libya', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'M1', N'Mediterranean Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'M2', N'Middle East Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'M3', N'Mexico Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'MA', N'Morocco', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'MC', N'Monaco', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'MD', N'Moldova', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'ME', N'Montenegro', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'MF', N'St. Martin (French Part)', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'MG', N'Madagascar', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'MH', N'Marshall Islands', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'MK', N'Macedonia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'ML', N'Mali', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'MM', N'Myanmar', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'MN', N'Mongolia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'MO', N'Macau / Macao', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'MP', N'Northern Mariana Islands / Saipan', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'MQ', N'Martinique', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'MR', N'Mauritania', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'MS', N'Montserrat', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'MT', N'Malta', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'MU', N'Mauritius', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'MV', N'Maldives', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'MW', N'Malawi', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'MX', N'Mexico', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'MY', N'Malaysia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'MZ', N'Mozambique', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'N1', N'Nigeria Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'N2', N'Norway Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'N3', N'North Sea Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'NA', N'Namibia', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'NC', N'New Caledonia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'NE', N'Niger', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'NF', N'Norfolk Island', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'NG', N'Nigeria', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'NI', N'Nicaragua', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'NL', N'Netherlands', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'NO', N'Norway', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'NP', N'Nepal', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'NR', N'Nauru', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'NU', N'Niue', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'NZ', N'New Zealand', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'OM', N'Oman', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'PA', N'Panama', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'PE', N'Peru', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'PF', N'French Polynesia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'PG', N'Papua New Guinea', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'PH', N'Philippines', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'PK', N'Pakistan', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'PL', N'Poland', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'PM', N'Saint Pierre and Miquelon', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'PN', N'Pitcairn', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'PR', N'Puerto Rico', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'PS', N'Palestinian Territories', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'PT', N'Portugal', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'PW', N'Palau', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'PY', N'Paraguay', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'QA', N'Qatar', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'R1', N'Russia Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'RE', N'Reunion', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'RO', N'Romania', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'RS', N'Serbia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'RU', N'Russian Federation', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'RW', N'Rwanda', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'S1', N'South America Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'S2', N'Sweden Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'S3', N'South Asia Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'SA', N'Saudi Arabia', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'SB', N'Solomon Islands', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'SC', N'Seychelles', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'SD', N'Sudan', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'SE', N'Sweden', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'SG', N'Singapore', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'SH', N'Saint Helena', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'SI', N'Slovenia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'SJ', N'Svalbard and Jan Mayen', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'SK', N'Slovakia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'SL', N'Sierra Leone', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'SM', N'San Marino', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'SN', N'Senegal', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'SO', N'Somalia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'SR', N'Suriname', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'SS', N'South Sudan', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'ST', N'Sao Tome and Principe', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'SV', N'El Salvador', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'SX', N'St. Maarten (Dutch part)', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'SY', N'Syrian Arab Republic', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'SZ', N'Swaziland', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'T1', N'Trinidad and Tobago Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'TC', N'Turks and Caicos Islands', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'TD', N'Chad', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'TF', N'French Southern Territories', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'TG', N'Togo', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'TH', N'Thailand', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'TJ', N'Tajikistan', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'TK', N'Tokelau', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'TL', N'Timor-leste', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'TM', N'Turkmenistan', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'TN', N'Tunisia', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'TO', N'Tonga', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'TR', N'Turkey', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'TT', N'Trinidad and Tobago', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'TV', N'Tuvalu', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'TW', N'Taiwan', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'TZ', N'Tanzania', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'U1', N'United Kingdom Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'UA', N'Ukraine', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'UG', N'Uganda', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'UM', N'United States Minor Outlying Islands', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'US', N'United States', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'UY', N'Uruguay', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'UZ', N'Uzbekistan', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'V1', N'Venezuela Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'V2', N'Vietnam Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'VA', N'Vatican City', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'VC', N'Saint Vincent and the Grenadines', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'VE', N'Venezuela', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'VG', N'Virgin Islands British', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'VI', N'Virgin Islands (US)', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'VN', N'Vietnam', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'VU', N'Vanuatu', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'W4', N'West Africa Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'W5', N'West US/California Offshore', 0, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'WF', N'Wallis and Futuna', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'WS', N'Samoa', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'XB', N'Bonaire', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'XE', N'St. Eustatius', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'XK', N'Kosavo', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'XS', N'Saba', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'XW', N'Worldwide exposure - not used for modelling', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'YE', N'Yemen', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'YT', N'Mayotte', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'ZA', N'South Africa', 1, 1)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'ZM', N'Zambia', 1, 0)
GO
INSERT [dbo].[xCountryCodes] ([CountryCode], [CountryName], [Land], [Modelled]) VALUES (N'ZW', N'Zimbabwe ', 1, 0)
GO
INSERT [dbo].[xCoverages] ([Code], [CodeDescription], [Notes]) VALUES (0, N'No Deductible / Limit', NULL)
GO
INSERT [dbo].[xCoverages] ([Code], [CodeDescription], [Notes]) VALUES (1, N'Building', NULL)
GO
INSERT [dbo].[xCoverages] ([Code], [CodeDescription], [Notes]) VALUES (2, N'Other Building', NULL)
GO
INSERT [dbo].[xCoverages] ([Code], [CodeDescription], [Notes]) VALUES (3, N'Contents', NULL)
GO
INSERT [dbo].[xCoverages] ([Code], [CodeDescription], [Notes]) VALUES (4, N'BI', NULL)
GO
INSERT [dbo].[xCoverages] ([Code], [CodeDescription], [Notes]) VALUES (5, N'Property Damage - PD', N'PD = Building + Other Building + Contents')
GO
INSERT [dbo].[xCoverages] ([Code], [CodeDescription], [Notes]) VALUES (6, N'Site/ Blanket', N'PD + BI')
GO
INSERT [dbo].[xCrippleWall] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xCrippleWall] ([Code], [CodeDescription]) VALUES (1, N'No')
GO
INSERT [dbo].[xCrippleWall] ([Code], [CodeDescription]) VALUES (2, N'Yes')
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'AED', N'United Arab Emirates Dirham', N'Arab Emirates', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'AFA', N'Afghan Afghani (Retired)', N'Afghanistan', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'AFN', N'Afghanistan Afghani', N'Afghanistan', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'ALL', N'Albania Lek', N'Albania', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'AMD', N'Armenia Dram', N'Armenia', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'ANG', N'Netherlands Antillean Guilder', N'Netherlands', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'AOA', N'Angola Kwanza', N'Angola', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'AON', N'Novo kwanza (Retired)', N'Angola', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'ARS', N'Argentina Peso', N'Argentina', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'ATS', N'Austrian Schilling', N'Austria', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'AUD', N'Australia Dollar', N'Australia', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'AWG', N'Aruba Guilder', N'Netherlands', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'AZM', N'Old Azerbaijan Manat', N'Azerbaijan', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'AZN', N'Azerbaijan Manat', N'Azerbaijan', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'BAM', N'Bosnia Convertible Marks', N'Bosnia and Herzegovina', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'BBD', N'Barbados Dollar', N'Barbados', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'BDT', N'Bangladesh Taka', N'Bangladesh', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'BEF', N'Belgian Franc', N'Belgium', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'BGL', N'Bulgarian Lev', N'Bulgaria', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'BGN', N'Bulgaria Lev', N'Bulgaria', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'BHD', N'Bahrain Dinar', N'Bahrain', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'BIF', N'Burundi Franc', N'Burundi', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'BMD', N'Bermuda Dollar', N'Bermuda', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'BND', N'Brunei Dollar', N'Brunei', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'BOB', N'Bolivia Boliviano', N'Bolivia', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'BOV', N'Bolivia Mvdol', N'Bolivia', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'BRL', N'Brazil Real', N'Brazil', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'BSD', N'Bahamas Dollar', N'Bahamas', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'BTN', N'Bhutan Ngultrum', N'Bhutan', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'BWP', N'Botswana Pula', N'Botswana', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'BYN', N'Belarus Ruble', N'Belarus', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'BZD', N'Belize Dollar', N'Belize', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'CAD', N'Canada Dollar', N'Canada', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'CDF', N'DR Congo Franc Congolais', N'Congo, Dem Rep of / Zaire', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'CHF', N'Switzerland Franc', N'Switzerland', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'CLF', N'(Chile) Unidad de fomento', N'Chile', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'CLP', N'Chile Peso', N'Chile', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'CNY', N'Chinese Yuan', N'China', NULL, 1, CAST(N'2018-10-02T17:49:18.037' AS DateTime), CAST(N'2018-10-02T17:49:18.037' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'COP', N'Colombia Peso', N'Colombia', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'CRC', N'Costa Rica Colon', N'Costa Rica', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'CUP', N'Cuba Peso', N'Cuba', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'CVE', N'Cape Verde Escudo', N'Cape Verde', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'CYP', N'Cypriot Pound', N'Cyprus', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'CZK', N'Czech Republic Koruna', N'Czech Republic', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'DEM', N'Deutsche Mark', N'Germany', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'DJF', N'Djibouti Franc', N'Djibouti', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'DKK', N'Denmark Krone', N'Denmark', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'DOP', N'Dominican Rep. Peso', N'Dominican', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'DZD', N'Algeria Dinar', N'Algeria', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'EEK', N'Estonia Kroon', N'Estonia', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'EGP', N'Egypt Pound', N'Egypt', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'ERN', N'Eritrea Nakfa', N'Eritrea', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'ETB', N'Ethiopia Birr', N'Ethiopia', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'EUR', N'Euro', N'Europe', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'FJD', N'Fiji Dollar', N'Fiji', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'FKP', N'Falkland Islands Pound', N'Falkland Islands (Islas Malvinas)', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'FRF', N'French Franc', N'France', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'GBP', N'Great Britain Pound', N'United Kingdom', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'GEL', N'Georgia Lari', N'Georgia', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'GHC', N'Ghana Cedi (Old)', N'Ghana', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'GHS', N'Ghana Cedi', N'Ghana', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'GIP', N'Gibraltar Pound', N'Gibraltar', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'GMD', N'Gambia Dalasi', N'Gambia, The', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'GNF', N'Guinea Franc', N'Guinea', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'GRD', N'Greek Drachmas', N'Greece', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'GTQ', N'Guatemala Quetzal', N'Guatemala', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'GYD', N'Guyana Dollar', N'Guyana', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'HKD', N'Hong Kong Dollar', N'Hong Kong', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'HNL', N'Honduras Lempira', N'Honduras', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'HRK', N'Croatia Kuna', N'Croatia', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'HTG', N'Haiti Gourde', N'Haiti', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'HUF', N'Hungary Forint', N'Hungary', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'IDR', N'Indonesia Rupiah', N'Indonesia', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'IEP', N'Ireland Pound', N'Ireland', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'ILS', N'Israel New Shekel', N'Israel', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'INR', N' India Rupee', N'India', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'IQD', N'Iraq Dinar', N'Iraq', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'IRR', N'Iran Rial', N'Iran', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'ISK', N'Iceland Krona', N'Iceland', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'ITL', N'Italian Lira', N'Italy', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'JMD', N'Jamaica Dollar', N'Jamaica', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'JOD', N'Jordan Dinar', N'Jordan', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'JPY', N'Japan Yen', N'Japan', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'KES', N'Kenya Shilling', N'Kenya', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'KGS', N'Kyrgyzstan Som', N'Kyrgyzstan', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'KHR', N'Cambodia Riel', N'Cambodia', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'KMF', N'Comoro Franc', N'Comoros', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'KPW', N'North Korea Won', N'Korea, North', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'KRW', N'South Korea Won', N'Republic of Korea', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'KWD', N' Kuwait Dinar', N'Kuwait', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'KYD', N'Cayman Islands Dollar', N'Cayman Islands', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'KZT', N'Kazakhstan Tenge', N'Kazakhstan', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'LAK', N'Laos Kip', N'Laos', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'LBP', N'Lebanon Pound', N'Lebanon', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'LKR', N'Sri Lanka Rupee', N'Sri Lanka', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'LRD', N'Liberia Dollar', N'Liberia', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'LSL', N'Lesotho Loti', N'Lesotho', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'LTL', N'Lithuania Litas', N'Lithuania', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'LUF', N'Luxembourg Franc', N'Luxembourg', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'LVL', N'Latvia Lats', N'Latvia', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'LYD', N'Libya Dinar', N'Libya', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'MAD', N'Morocco Dirham', N'Morocco', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'MDL', N'Moldova Leu', N'Moldova', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'MGA', N'Madagascar Malagasy Ariary', N'Madagascar', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'MKD', N'Macedonia Denar', N'Macedonia, The Republic of', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'MMK', N'Myanmar Kyat', N'Burma / Myanmar', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'MNT', N'Mongolia Tugrik', N'Mongolia', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'MOP', N'Macau Pataca', N'Macau', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'MRO', N'Mauritania Ouguiya (old)', N'Mauritania', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'MRU', N'Mauritania Ouguiya', N'Mauritania', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'MTL', N'Malta Lira', N'Malta', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'MUR', N'Mauritius Rupee', N'Mauritius', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'MVR', N'Maldives Rufiyaa', N'Maldives', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'MWK', N'Malawi Kwacha', N'Malawi', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'MXN', N'Mexico Peso', N'Mexico', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'MXP', N'Mexico Peso', N'Mexico', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'MXV', N'Mexico Unidad de Inversion', N'Mexico', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'MYR', N'Malaysia Ringgit', N'Malaysia', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'MZM', N'Mozambican Metical (Retired)', N'Mozambique', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'MZN', N'Mozambique Metical', N'Mozambique', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'NAD', N'Namibia Dollar', N'Namibia', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'NGN', N'Nigeria Naira', N'Nigeria', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'NIO', N'Nicaragua Cordoba Oro', N'Nicaragua', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'NIS', N'Israeli New Shekel', N'Israel', N'Unofficial currency code', 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'NLG', N'Dutch Guilder', N'Netherlands', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'NOK', N'Norway Kroner', N'Norway', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'NPR', N'Nepal Rupee', N'Nepal', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'NZD', N'New Zealand Dollar', N'New Zealand', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'OMR', N'Oman Rial', N'Oman', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'PAB', N'Panama Balboa', N'Panama', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'PEN', N'Peru Nuevo Sol', N'Peru', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'PGK', N'Papua New Guinea Kina', N'Papua New Guinea', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'PHP', N'Philippines Peso', N'Philippines', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'PKR', N'Pakistan Rupee', N'Pakistan', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'PLN', N'Poland Zloty', N'Poland', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'PTE', N'Portuguese Escudo', N'Portugal', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'PYG', N'Paraguay Guarani', N'Paraguay', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'QAR', N'Qatar Rial', N'Qatar', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'ROL', N'Romanian Leu', N'Romania', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'RON', N'Romania New Leu', N'Romania', NULL, 1, CAST(N'2018-10-02T17:49:18.053' AS DateTime), CAST(N'2018-10-02T17:49:18.053' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'RSD', N'Serbia Dinar', N'Serbia', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'RUB', N'Russia Ruble', N'Russia', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'RWF', N'Rwanda Franc', N'Rwanda', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'SAR', N'Saudi Arabia Riyal', N'Saudi Arabia', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'SBD', N'Solomon Islands Dollar', N'Solomon Islands', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'SCR', N'Seychelles Rupee', N'Seychelles', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'SDD', N'Sudan Dinar', N'Sudan', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'SDG', N'Sudan Pound', N'Sudan', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'SEK', N'Sweden Krona', N'Sweden', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'SGD', N'Singapore Dollar', N'SINGAPORE', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'SHP', N'Saint Helena Pound', N'St. Helena', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'SIT', N'Slovenia Tolar', N'Slovenia', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'SKK', N'Slovak Koruna', N'Slovakia', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'SLL', N'Sierra Leone, Leone', N'Sierra Leone', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'SOS', N'Somalia Shilling', N'Somalia', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'SRD', N'Suriname Dollar', N'Suriname', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'SSP', N'South Sudanese pound', N'South Sudan', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'STD', N'Sao Tome and Principe Dobra (Old)', N'Sao Tome & Principe', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'STN', N'Sao Tome and Principe Dobra', N'Sao Tome & Principe', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'SVC', N'El Salvador Colon', N'El Salvador', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'SYP', N'Syria Pound', N'Syria', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'SZL', N'Swaziland Lilangeni', N'Swaziland', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'THB', N'Thailand Baht', N'Thailand', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'TJS', N'Tajikistan Somoni', N'Tajikistan', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'TMM', N'Turkmen Manat (Retired)', N'Turkmenistan', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'TMT', N'Turkmenistani  Manat', N'Turkmenistan', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'TND', N'Tunisia Dinar', N'Tunisia', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'TOP', N'Tonga Paanga', N'Tonga', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'TRL', N'Turkish Lira', N'Turkey', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'TRY', N'Turkey New Lira', N'Turkey', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'TTD', N'Trinidad and Tobago Dollar', N'Trinidad & Tobago', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'TWD', N'Taiwan Dollar', N'Taiwan', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'TZS', N'Tanzania Shilling', N'Tanzania', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'UAH', N'Ukraine Hryvnia', N'Ukraine', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'UF', N'(Chile) Unidades de fomento', N'Chile', N'Not in ISO4217 standard', 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'UGX', N'Uganda Shilling', N'Uganda', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'USD', N'U.S. Dollar', N'United States', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'UYU', N'Uruguay Peso', N'Uruguay', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'UZS', N'Uzbekistan Som', N'Uzbekistan', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'VEB', N'Venezuelan Bolivar (Retired)', N'Venezuela', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'VEF', N'Venezuela Bolivar Fuerte', N'Venezuela', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'VES', N'Venezuelan Bolivar Soberano', N'Venezuela', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'VND', N'Vietnam Dong', N'Vietnam', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'VUV', N'Vanuatu Vatu', N'Vanuatu', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'WST', N'Samoa Tala', N'Western Samoa', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'XAF', N'CFA Franc BEAC', N'Central Africa', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'XCD', N'Eastern Caribbean Dollar', N'Caribbean', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'XOF', N'CFA Franc BCEAO', N'West Africa', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'XPF', N'CFP Franc', N'Pacific Franc Exchange', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'YER', N'Yemen Rial', N'Yemen', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'ZAR', N'South Africa Rand', N'South Africa', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'ZMK', N'Zambia Kwacha', N'Zambia', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'ZMW', N'Zambian Kwacha', N'Zambia', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'ZWD', N'Zimbabwean Dollar', N'Zimbabwe', N'Historic ISO4217 standard code', 0, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xCurrency] ([CurrencyCode], [CurrencyName], [CountryName], [Notes], [Valid], [EnteredOn], [UpdatedOn]) VALUES (N'ZWL', N'Zimbabwe Dollar', N'Zimbabwe', NULL, 1, CAST(N'2018-10-02T17:49:18.067' AS DateTime), CAST(N'2018-10-02T17:49:18.067' AS DateTime))
GO
INSERT [dbo].[xDedCode] ([Code], [CodeDescription], [Notes]) VALUES (0, N'Regular Deductible', NULL)
GO
INSERT [dbo].[xDedCode] ([Code], [CodeDescription], [Notes]) VALUES (1, N'Annual Aggregate Deductible', NULL)
GO
INSERT [dbo].[xDedCode] ([Code], [CodeDescription], [Notes]) VALUES (2, N'Franchise Deductible', NULL)
GO
INSERT [dbo].[xDedCode] ([Code], [CodeDescription], [Notes]) VALUES (3, N'Non ranking excess Deductible', N'Deductible that does not rank (or count) toward a maximum aggregate deductible')
GO
INSERT [dbo].[xDedCode] ([Code], [CodeDescription], [Notes]) VALUES (4, N'Residual Deductible', N'A (normally lower) deductible that applies once a maximum aggregate deductible is exceeded')
GO
INSERT [dbo].[xDedCode] ([Code], [CodeDescription], [Notes]) VALUES (5, N'Homeowner''s Deductible (CEA)', NULL)
GO
INSERT [dbo].[xDedCode] ([Code], [CodeDescription], [Notes]) VALUES (6, N'Homeowner''s Choice Deductible (CEA)', NULL)
GO
INSERT [dbo].[xDedType] ([Code], [CodeDescription], [Notes]) VALUES (0, N'Amount', NULL)
GO
INSERT [dbo].[xDedType] ([Code], [CodeDescription], [Notes]) VALUES (1, N'% of loss', N'Values <= 1 only')
GO
INSERT [dbo].[xDedType] ([Code], [CodeDescription], [Notes]) VALUES (2, N'% of TIV', N'Values <= 1 only')
GO
INSERT [dbo].[xEQ] ([EQ]) VALUES (0)
GO
INSERT [dbo].[xEQ] ([EQ]) VALUES (1)
GO
INSERT [dbo].[xEquipmentBracing] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xEquipmentBracing] ([Code], [CodeDescription]) VALUES (1, N'Well-Braced')
GO
INSERT [dbo].[xEquipmentBracing] ([Code], [CodeDescription]) VALUES (2, N'Average Bracing')
GO
INSERT [dbo].[xEquipmentBracing] ([Code], [CodeDescription]) VALUES (3, N'Unbraced')
GO
INSERT [dbo].[xExternalDoors] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xExternalDoors] ([Code], [CodeDescription]) VALUES (1, N'Single width Doors')
GO
INSERT [dbo].[xExternalDoors] ([Code], [CodeDescription]) VALUES (2, N'Double width Doors')
GO
INSERT [dbo].[xExternalDoors] ([Code], [CodeDescription]) VALUES (3, N'Reinforced single width doors')
GO
INSERT [dbo].[xExternalDoors] ([Code], [CodeDescription]) VALUES (4, N'Reinforced double width doors')
GO
INSERT [dbo].[xExternalDoors] ([Code], [CodeDescription]) VALUES (5, N'Sliding doors')
GO
INSERT [dbo].[xExternalDoors] ([Code], [CodeDescription]) VALUES (6, N'Reinforced sliding doors')
GO
INSERT [dbo].[xFatigue] ([Code], [CodeDescription]) VALUES (0, N'Unknown')
GO
INSERT [dbo].[xFatigue] ([Code], [CodeDescription]) VALUES (1, N'Vulnerable')
GO
INSERT [dbo].[xFatigue] ([Code], [CodeDescription]) VALUES (2, N'Average')
GO
INSERT [dbo].[xFatigue] ([Code], [CodeDescription]) VALUES (3, N'Resilient')
GO
INSERT [dbo].[xFEMACompliance] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xFEMACompliance] ([Code], [CodeDescription]) VALUES (1, N'Yes')
GO
INSERT [dbo].[xFEMACompliance] ([Code], [CodeDescription]) VALUES (2, N'No')
GO
INSERT [dbo].[xFlashing] ([Code], [CodeDescription]) VALUES (0, N'Unknown')
GO
INSERT [dbo].[xFlashing] ([Code], [CodeDescription]) VALUES (1, N'Vulnerable')
GO
INSERT [dbo].[xFlashing] ([Code], [CodeDescription]) VALUES (2, N'Average')
GO
INSERT [dbo].[xFlashing] ([Code], [CodeDescription]) VALUES (3, N'Resilient')
GO
INSERT [dbo].[xFloodDebrisResilience] ([Code], [CodeDescription]) VALUES (0, N'Unknown')
GO
INSERT [dbo].[xFloodDebrisResilience] ([Code], [CodeDescription]) VALUES (1, N'Vulnerable')
GO
INSERT [dbo].[xFloodDebrisResilience] ([Code], [CodeDescription]) VALUES (2, N'Average')
GO
INSERT [dbo].[xFloodDebrisResilience] ([Code], [CodeDescription]) VALUES (3, N'Resilient')
GO
INSERT [dbo].[xFoundationConnection] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xFoundationConnection] ([Code], [CodeDescription]) VALUES (1, N'Hurricane ties')
GO
INSERT [dbo].[xFoundationConnection] ([Code], [CodeDescription]) VALUES (2, N'Nails / Screws')
GO
INSERT [dbo].[xFoundationConnection] ([Code], [CodeDescription]) VALUES (3, N'Anchor Bolts')
GO
INSERT [dbo].[xFoundationConnection] ([Code], [CodeDescription]) VALUES (4, N'Gravity / Friction')
GO
INSERT [dbo].[xFoundationConnection] ([Code], [CodeDescription]) VALUES (5, N'Adhesive / Epoxy')
GO
INSERT [dbo].[xFoundationConnection] ([Code], [CodeDescription]) VALUES (6, N'Structurally Connected')
GO
INSERT [dbo].[xFoundationType] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xFoundationType] ([Code], [CodeDescription]) VALUES (1, N'Masonry basement')
GO
INSERT [dbo].[xFoundationType] ([Code], [CodeDescription]) VALUES (2, N'Concrete basement')
GO
INSERT [dbo].[xFoundationType] ([Code], [CodeDescription]) VALUES (3, N'Masonry wall')
GO
INSERT [dbo].[xFoundationType] ([Code], [CodeDescription]) VALUES (4, N'Crawl space cripple wall')
GO
INSERT [dbo].[xFoundationType] ([Code], [CodeDescription]) VALUES (5, N'Crawl space masonry')
GO
INSERT [dbo].[xFoundationType] ([Code], [CodeDescription]) VALUES (6, N'Post & pier')
GO
INSERT [dbo].[xFoundationType] ([Code], [CodeDescription]) VALUES (7, N'Footing')
GO
INSERT [dbo].[xFoundationType] ([Code], [CodeDescription]) VALUES (8, N'Mat / slab')
GO
INSERT [dbo].[xFoundationType] ([Code], [CodeDescription]) VALUES (9, N'Pile')
GO
INSERT [dbo].[xFoundationType] ([Code], [CodeDescription]) VALUES (10, N'No basement')
GO
INSERT [dbo].[xFoundationType] ([Code], [CodeDescription]) VALUES (11, N'Engineering foundation')
GO
INSERT [dbo].[xFoundationType] ([Code], [CodeDescription]) VALUES (12, N'Crawlspace - raised (wood)')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'CNTY', N'County', N'Example: Miami-Dade (US)')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'CRH', N'High Resolution CRESTA', N'Example: GBR_SO31 8 (Southampton)')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'CRL', N'Low Resolution CRESTA', N'Example: GBR_SO (Southampton)')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'CRO', N'Old CRESTA', N'Example: 25 (Mexico City (earthquake))')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'CRSL2', N'Province in CatRisk Solutions models', N'used in CatRisk Solutions models only')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'CRSL3', N'CRESTA / Province in CatRisk Solutions models', N'used in CatRisk Solutions models only')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'CRSL4', N'Municipality / Province in CatRisk Solutions models', N'used in CatRisk Solutions models only')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'CRSL5', N'City in CatRisk Solutions models (bespoke list)', N'used in CatRisk Solutions models only')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'CRSVG', N'Variable Resolution Grid (VRG) in CatRisk Solutions models', N'used in CatRisk Solutions models only')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'GADM1', N'GADM level 1', N'Example: Badakhshan (https://gadm.org/index.html; e.g. province in Afghanistan)')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'GADM2', N'GADM level 2', N'Example: Berzirk (https://gadm.org/index.html; e.g. district in Austria)')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'GADM3', N'GADM level 3', N'Example: Zala (https://gadm.org/index.html; e.g. commune in Angola)')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'GADM4', N'GADM level 4', N'Example: Merksplas (https://gadm.org/index.html; e.g. commune in Belgium)')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'GADM5', N'GADM level 5', N'Example: Vitray (https://gadm.org/index.html; e.g. commune in France)')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'GNAF', N'Australia''s Geocoded National Address File', N'Example: Australia')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'GPLUS', N'Google Plus', N'Example: 9C3XGW72+GG (https://plus.codes/howitworks; e.g. center of the dome of St.Pauls cathedral in London, UK)')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'ICA', N'Insurance Council of Australia Zones', N'Example: Australia')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'PC2', N'Postcode (2 characters)', N'Example: 80 (Europe, Germany)')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'PC3', N'Postcode (3 characters)', N'Example: A2X (Canada)')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'PC4', N'Postcode (4 characters)', N'Example: 2050 (Europe, Australia)')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'PC5', N'Postcode (5 characters)', N'Example: 80801 (Germany)')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'PC6', N'Postcode (6 characters)', N'Example: A2X A33 (Canada)')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'PC7', N'Postcode (7 characters)', N'Example: Turkey, Japan')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'PC8', N'Postcode (8 characters)', NULL)
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'PC9', N'Postcode (9 characters)', N'Example: 80210-1121 (US zip + 4)')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'PCD', N'Postcode District', N'Example: EC3A (UK)')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'PCS', N'Postcode Sector', N'Example: EC3A 5 (UK)')
GO
INSERT [dbo].[xGeogScheme] ([Code], [CodeDescription], [Notes]) VALUES (N'PCU', N'Postcode Unit', N'Example: EC3A 5NR (UK)')
GO
INSERT [dbo].[xGlassType] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xGlassType] ([Code], [CodeDescription]) VALUES (1, N'Annealed')
GO
INSERT [dbo].[xGlassType] ([Code], [CodeDescription]) VALUES (2, N'Tempered')
GO
INSERT [dbo].[xGlassType] ([Code], [CodeDescription]) VALUES (3, N'Heat strengthened')
GO
INSERT [dbo].[xGlassType] ([Code], [CodeDescription]) VALUES (4, N'Laminated')
GO
INSERT [dbo].[xGlassType] ([Code], [CodeDescription]) VALUES (5, N'Insulating glass units')
GO
INSERT [dbo].[xGroundEquipment] ([Code], [CodeDescription]) VALUES (0, N'Unknown')
GO
INSERT [dbo].[xGroundEquipment] ([Code], [CodeDescription]) VALUES (1, N'No equipment')
GO
INSERT [dbo].[xGroundEquipment] ([Code], [CodeDescription]) VALUES (2, N'Vulnerable')
GO
INSERT [dbo].[xGroundEquipment] ([Code], [CodeDescription]) VALUES (3, N'Average')
GO
INSERT [dbo].[xGroundEquipment] ([Code], [CodeDescription]) VALUES (4, N'Resilient')
GO
INSERT [dbo].[xInternalPartition] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xInternalPartition] ([Code], [CodeDescription]) VALUES (1, N'Wood')
GO
INSERT [dbo].[xInternalPartition] ([Code], [CodeDescription]) VALUES (2, N'Gypsum boards')
GO
INSERT [dbo].[xInternalPartition] ([Code], [CodeDescription]) VALUES (3, N'Plastered Masonry')
GO
INSERT [dbo].[xInternalPartition] ([Code], [CodeDescription]) VALUES (4, N'Brick')
GO
INSERT [dbo].[xInternalPartition] ([Code], [CodeDescription]) VALUES (5, N'Other')
GO
INSERT [dbo].[xLatticeType] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xLatticeType] ([Code], [CodeDescription]) VALUES (1, N'Full web')
GO
INSERT [dbo].[xLatticeType] ([Code], [CodeDescription]) VALUES (2, N'Grid')
GO
INSERT [dbo].[xLatticeType] ([Code], [CodeDescription]) VALUES (3, N'Lattice')
GO
INSERT [dbo].[xLimitCode] ([Code], [CodeDescription]) VALUES (0, N'Regular Limit')
GO
INSERT [dbo].[xLimitCode] ([Code], [CodeDescription]) VALUES (1, N'Annual Aggregate Limit')
GO
INSERT [dbo].[xLimitType] ([Code], [CodeDescription], [Notes]) VALUES (0, N'Amount', N'For limits, 0 = unlimited')
GO
INSERT [dbo].[xLimitType] ([Code], [CodeDescription], [Notes]) VALUES (1, N'% of loss', N'Values <= 1 only')
GO
INSERT [dbo].[xLimitType] ([Code], [CodeDescription], [Notes]) VALUES (2, N'% of TIV', N'Values <= 1 only')
GO
INSERT [dbo].[xMechanicalEquipmentSide] ([Code], [CodeDescription]) VALUES (0, N'Unknown')
GO
INSERT [dbo].[xMechanicalEquipmentSide] ([Code], [CodeDescription]) VALUES (1, N'Vulnerable')
GO
INSERT [dbo].[xMechanicalEquipmentSide] ([Code], [CodeDescription]) VALUES (2, N'Average')
GO
INSERT [dbo].[xMechanicalEquipmentSide] ([Code], [CodeDescription]) VALUES (3, N'Resilient')
GO
INSERT [dbo].[xMultiStoryHall] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xMultiStoryHall] ([Code], [CodeDescription]) VALUES (1, N'No')
GO
INSERT [dbo].[xMultiStoryHall] ([Code], [CodeDescription]) VALUES (2, N'Yes')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1000, N'Unknown', N'Unknown occupancy', N'1000', N'Unknown', N'300')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1050, N'Residential, General residential', N'General Residential is a composite of all other Residential Occupancies. You can select this occupancy class code if you have no specific information about the risk.', N'1050 - 1099', N'Residential', N'301')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1051, N'Residential, Permanent dwelling: single-family', N'Single-unit detached dwellings usually occupied by a single family.', N'1050 - 1099', N'Residential', N'302')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1052, N'Residential, Permanent dwelling: multi-family', N'Multiple-unit dwellings usually occupied by more than one family.', N'1050 - 1099', N'Residential', N'303')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1053, N'Residential, Temporary lodging', N'Commercial establishments known to the public as hotels, motels, motor hotels, or tourist courts primarily engaged in providing lodging or lodging and meals to the general public. This category includes hotels that are operated by organizations for members only. Also, establishments primarily engaged in renting, such as boarding houses, lodging houses, or rooming houses.', N'1050 - 1099', N'Residential', N'304')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1054, N'Residential, Group institutional housing', N'Residential units under institutional control. Examples include college dormitories, nursing homes, and retirement centers where medical care is incidental.', N'1050 - 1099', N'Residential', N'305')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1055, N'Residential, Apartment/Condo', N'Attached, multi-unit housing usually occupied by one family per unit.', N'1050 - 1099', N'Residential', N'306')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1056, N'Residential, Terraced Housing', N'Attached residential unit. Also referred to as townhouses, row houses, row homes, or brownstones. Usually more than one story and built close to the street.', N'1050 - 1099', N'Residential', N'307')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1100, N'Commercial, General commercial', N'General Commercial is a composite of all other Commercial Occupancies. You can select this occupancy class code if you have no specific information about the risk.', N'1100 - 1149', N'Commercial', N'311')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1101, N'Commercial, Retail trade', N'Retail stores including those establishments that sell building materials and hardware, general merchandise, food, apparel and accessories, home furniture, furnishings and appliances, and prepared food and drinks. Includes automotive dealers, gasoline service stations, and motorcycle, boat, and recreational vehicle dealers. Includes other retail such as drug stores, liquor stores, bookstores, used merchandise, jewelry stores, and piece goods stores. Also includes non-store retailers and fuel dealers.', N'1100 - 1149', N'Commercial', N'312')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1102, N'Commercial, Wholesale trade', N'Includes wholesale distribution of durable goods including motor vehicles and parts, home furnishings, lumber and construction materials, professional and commercial equipment, metals and minerals, electrical goods, hardware, plumbing and heating equipment, machinery, equipment and supplies, and other miscellaneous durable goods. Also includes wholesale distribution of non-durable goods including paper and paper products, drugs, apparel, groceries, farm-product raw materials, chemicals, petroleum and petroleum related products, alcoholic beverages, and other miscellaneous non-durable goods.', N'1100 - 1149', N'Commercial', N'313')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1103, N'Commercial, Personal and repair services', N'Includes personal services such as laundry and dry cleaning services, beauty and barbershops, shoe repair shops, photographic studios, and funeral services, as well as automotive rental and leasing, automotive repair shops, and other automotive service including car washes and miscellaneous repair services.', N'1100 - 1149', N'Commercial', N'314')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1104, N'Commercial, Professional,  technical and business', N'Occupancies involved in the financial industry including depository institutions, non-depository credit institutions, security and commodity brokers, dealers and exchanges, insurance carriers, insurance agents and brokers, and real estate and other investment offices. Includes business services such as advertising agencies, consumer credit reporting agencies, mailing services, reproduction services, commercial art services, building cleaning and pest control services, equipment rental/leasing operations, employment agencies, computer programming, and computer rental/maintenance services. Also included in this occupancy class are legal services, engineering and architectural services, accounting services, research and development services, and management/public relations services. Executive offices, legislative bodies, and government offices are included in this occupancy class as are government establishments engaged in finance and taxation, in environmental quality and housing programs, and in the administration of economic programs including transportation, communications and utilities, agriculture, space and technology, national security and internal affairs, as well as government establishments engaged in human resource programs such as public health, veterans affairs, education, and social and human resources.', N'1100 - 1149', N'Commercial', N'315')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1105, N'Commercial, Health care services - General', N'Occupancies include medical, surgical, and other health services including clinics, laboratories and other health services. For hospitals, use 1106.', N'1100 - 1149', N'Commercial', N'316')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1106, N'Commercial, Hospital', N'', N'1100 - 1149', N'Commercial', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1107, N'Commercial, Nursing Home', N'', N'1100 - 1149', N'Commercial', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1108, N'Commercial, Entertainment and recreation - General', N'This occupancy class includes motion picture production and distribution facilities including motion picture theaters and video tape rental establishments, dance studios, theatrical production (other than motion picture), bowling centers, sports clubs, and physical fitness facilities, as well as art galleries, arboreta, and botanical and zoological gardens.', N'1100 - 1149', N'Commercial', N'317')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1109, N'Commercial, Amusement park', N'', N'1100 - 1149', N'Commercial', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1110, N'Commercial, Cinema, concert hall, theatre', N'', N'1100 - 1149', N'Commercial', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1111, N'Commercial, Stadium, arena', N'', N'1100 - 1149', N'Commercial', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1112, N'Commercial, Temporary exhibition facility or circus', N'', N'1100 - 1149', N'Commercial', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1113, N'Commercial, Parking', N'Automobile parking facilities.', N'1100 - 1149', N'Commercial', N'318')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1114, N'Commercial, Golf Courses', N'Golf courses and related buildings and facilities.', N'1100 - 1149', N'Commercial', N'319')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1115, N'Commercial, Hotel - Small & Medium', N'', N'1100 - 1149', N'Commercial', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1116, N'Commercial, Hotel - Large', N'', N'1100 - 1149', N'Commercial', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1117, N'Commercial, Casino', N'', N'1100 - 1149', N'Commercial', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1118, N'Commercial, Floating Casino', N'', N'1100 - 1149', N'Commercial', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1119, N'Commercial, Restaurant, café, bar, pub, club, tavern, discotheque', N'This occupancy includes restaurants, fast food centers, and cafés.', N'1100 - 1149', N'Commercial', N'331')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1120, N'Commercial, Gasoline Station', N'Retail establishments selling gasoline for use in motor vehicles, including associated retail stores and service bays.', N'1100 - 1149', N'Commercial', N'335')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1121, N'Commercial, Automotive repair services and carwash', N'Includes car washes and motor vehicle repair and service businesses that do not also sell gasoline. If the repair service is part of a gasoline station, with gasoline pumps under a canopy, use occupancy Commercial, Gasoline Station - 1120.', N'1100 - 1149', N'Commercial', N'336')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1122, N'Commercial,  Warehouse', N'Warehouse', N'1100 - 1149', N'Commercial', N'366')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1123, N'Commercial, Communication', N'Includes establishments furnishing point-to-point communications services, whether intended to be received aurally or visually, as well as radio and television broadcasting.', N'1100 - 1149', N'Commercial', N'371')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1150, N'Industrial, General industrial', N'General industrial is a composite of all other industrial occupancies. You can select this occupancy class code if you have no specific information about the risk.', N'1150 - 1199', N'Industrial', N'321')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1151, N'Industrial,  Heavy fabrication and assembly', N'Includes commercial fishing, hunting and trapping, operation of timber tracts, tree farms, forestry, nurseries and related activities, and establishments engaged in the cutting of timber and pulpwood. Includes the manufacture of furniture and other wood products, pulps from wood and other sources, tires and various other rubber and plastic products, glass products, cement, structural clay products, pottery, concrete and gypsum products, cut stone, and abrasive and asbestos products. Includes the manufacture of industrial and commercial machinery and equipment such as engines and turbines, farm and garden machinery, construction and mining equipment, metalworking machinery, special industry machinery, general industrial machinery, computer and office equipment, refrigeration machinery, and miscellaneous industrial machinery. Also includes the manufacture of motor vehicles, aircraft and aircraft parts, ship/boat building and repair, railroad equipment, motorcycles and bicycles, guided missiles, space vehicles, and transport equipment.', N'1150 - 1199', N'Industrial', N'322')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1152, N'Industrial, Light fabrication and assembly', N'Occupancies involved in the preparation and manufacture of yarn, thread, twine, and cordage, in the manufacture of fabrics, carpets, and rugs, and in the dyeing and finishing of fiber, yarn, and fabrics. Includes the manufacture of apparel, felt goods, lace goods, non-woven fabrics, miscellaneous textiles, and textile products. Includes the manufacture of household, office, and restaurant furniture, as well as office and store fixtures. Includes occupancies involved in the publishing and/or printing trade and in service industries related to the printing trade. This occupancy class also includes tanning, currying, and finishing of hides and skins, manufacturing of finished leather and artificial leather products, jewelry, musical instruments, dolls, and toys, as well as other miscellaneous manufacturing.', N'1150 - 1199', N'Industrial', N'323')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1153, N'Industrial, Food and drug processing', N'Includes food and beverage manufacturing and processing and the manufacturing of cigarettes, cigars, and chewing and smoking tobacco.', N'1150 - 1199', N'Industrial', N'324')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1154, N'Industrial, Chemical processing', N'Establishments involved in the manufacture of basic chemicals including acids, alkalis, salts, and organic chemicals, as well as chemical products that are to be used in further manufacturing including synthetic fibers, plastic materials, dry colors, and pigments. Includes the manufacture of finished products used for ultimate consumption including drugs, cosmetics, and soaps, as well as products used as supplies in other industries including paints, fertilizers, and explosives.', N'1150 - 1199', N'Industrial', N'325')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1155, N'Industrial, Metal and minerals processing', N'Includes the smelting and refining of metals, the manufacture of castings, other basic metal products, nails, spikes, insulated wire, and cable, the production of coke, the fabrication of metal products including metal cans, tin ware, hand tools, cutlery, and general hardware, and metal forging.', N'1150 - 1199', N'Industrial', N'326')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1156, N'Industrial, High technology', N'Includes occupancies involved in the manufacture of machinery and supplies for the generation, storage, transmission, transformation, and utilization of electrical energy including electricity distribution equipment, industrial apparatus, household appliances, electrical lighting, and wiring equipment. Includes manufacturing instruments for measuring, testing, analyzing, and controlling, optical instruments and lenses, surveying and drafting instruments, hydrological, meteorological, navigational, surgical, medical, ophthalmic, and photographic equipment. Also included are watches and clocks.', N'1150 - 1199', N'Industrial', N'327')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1157, N'Industrial, Construction', N'This occupancy includes general contractors and builders of residential, farm, industrial, commercial, and other buildings, as well as general contractors involved in heavy construction including highways, streets, bridges, tunnels, etc. Also included are special trade contractors including painting, electrical work, carpentry work, plumbing, heating, roofing, etc.', N'1150 - 1199', N'Industrial', N'328')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1158, N'Industrial, Petroleum', N'Establishments involved in petroleum refining, in the manufacture of paving and roofing materials, of compounding and lubricating oils and greases. Also includes the transportation of petroleum and other commodities, other than natural gas, through pipelines.', N'1150 - 1199', N'Industrial', N'329')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1159, N'Industrial, Mining', N'Includes mining and exploring for metallic and nonmetallic minerals, as well as the mining and preparation of coal. Includes the extraction of oil from sand and shale and the production of natural gasoline.', N'1150 - 1199', N'Industrial', N'330')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1200, N'Religion and Nonprofit, Religion and nonprofit', N'Includes organizations operating on a membership basis for the promotion of the interests of their members. Included are organizations such as trade associations, professional membership organizations, labor unions and similar labor organizations, and political and religious organizations.', N'1200 - 1249', N'Religion / Government / Education', N'341')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1201, N'Religion and Nonprofit,  Church', N'Establishments of religious organizations operated for worship, religious training or study, government or administration of an organized religion, or promotion of religious activities.', N'1200 - 1249', N'Religion / Government / Education', N'342')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1210, N'Government, General services', N'Includes offices of executives, legislative bodies, and general government offices, not elsewhere classified.', N'1200 - 1249', N'Religion / Government / Education', N'343')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1211, N'Government, Museum', N'', N'1200 - 1249', N'Religion / Government / Education', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1212, N'Government, Convention centre', N'', N'1200 - 1249', N'Religion / Government / Education', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1213, N'Government, Exhibition hall', N'', N'1200 - 1249', N'Religion / Government / Education', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1214, N'Government, Library', N'', N'1200 - 1249', N'Religion / Government / Education', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1215, N'Government, Prison / jail', N'', N'1200 - 1249', N'Religion / Government / Education', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1220, N'Government, Emergency services', N'Includes government establishments engaged in justice, public order, and safety.', N'1200 - 1249', N'Religion / Government / Education', N'344')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1230, N'Education, Universities,  colleges and technical schools', N'Establishments providing academic or technical instruction. Also included are establishments providing educational services such as libraries, student exchange programs, and curriculum development.', N'1200 - 1249', N'Religion / Government / Education', N'345')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1231, N'Education, Primary and secondary schools', N'Includes institutions engaged in instruction at primary and secondary level.', N'1200 - 1249', N'Religion / Government / Education', N'346')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1250, N'Transportation, Highway', N'Establishments primarily engaged in furnishing highway passenger transportation and establishments furnishing highway passenger terminal or maintenance facilities.', N'1250-1299', N'Transportation', N'351')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1251, N'Transportation, Railroad', N'Includes establishments furnishing transportation by line-haul railroad, as well as switching and terminal establishments.', N'1250-1299', N'Transportation', N'352')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1252, N'Transportation, Air', N'Establishments furnishing services incidental to transportation, such as forwarding and packing services, as well as the arrangement of passenger and freight transportation', N'1250-1299', N'Transportation', N'353')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1253, N'Transportation, Sea and inland waterways', N'Businesses engaged in freight and passenger transportation on the open seas or inland waters and establishments furnishing such incidental services as lighterage, towing, and canal operation. Also includes excursion and sightseeing boats and water taxis.', N'1250-1299', N'Transportation', N'354')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1254, N'Transportation, Aircraft Hangars', N'Aircraft parking facilities.', N'1250-1299', N'Transportation', N'355')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1255, N'Transportation,  Aircrafts at ramps or boarding gates', N'Aircraft at ramps or boarding gates.', N'1250-1299', N'Transportation', N'356')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1300, N'Utilities, Electrical', N'Establishments engaged in the generation, transmission, and/or distribution of electric energy for sale. Includes electric power generation, transmission, or distribution.', N'1300 - 1349', N'Utilities', N'361')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1301, N'Utilities, Water', N'Establishments primarily engaged in distributing water for sale for domestic, commercial, and industrial use.', N'1300 - 1349', N'Utilities', N'362')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1302, N'Utilities, Sanitary sewer', N'Establishments primarily engaged in the collection and disposal of wastes conducted through a sewer system, including such treatment processes as may be provided and establishments primarily engaged in the collection and disposal of refuse by processing or destruction or in the operation of incinerators, waste treatment plants, landfills, or other sites for disposal of such materials.', N'1300 - 1349', N'Utilities', N'363')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1303, N'Utilities, Natural gas', N'Establishments engaged in the transmission and distribution and/or storage of natural gas for sale.', N'1300 - 1349', N'Utilities', N'364')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1304, N'Utilities,  Telephone and telegraph', N'Establishments primarily engaged in providing paging and beeper services and those engaged in leasing telephone lines or other methods of telephone transmission, such as optical fiber lines and microwave or satellite facilities, as well as reselling the use of such methods to others.', N'1300 - 1349', N'Utilities', N'365')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1350, N'Flood control', N'Government establishments primarily engaged in regulation, planning, protection, and conservation of air and water resources, solid waste management, water and air pollution control and prevention, flood control, drainage development, consumption of water resources, as well as coordination of these activities at intergovernmental levels and research necessary for air pollution abatement and control and conservation of water resources.', N'1350 - 1399', N'Miscellaneous', N'372')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1351, N'Agriculture', N'Establishments primarily engaged in performing soil preparation services, crop services, veterinary services, other animal services, farm labor and management services, and landscape and horticultural services for others on a contract or fee basis.', N'1350 - 1399', N'Miscellaneous', N'373')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1352, N'Green House', N'Includes establishments (e.g., farms, orchards, greenhouses, and nurseries) primarily engaged in the production of crops, plants, vines, and trees (excluding forestry operations). This major group also includes establishments primarily engaged in the operation of sod farms and cranberry bogs, in the production of mushrooms, bulbs, flower seeds, and vegetable seeds, and in the growing of hydroponic crops.', N'1350 - 1399', N'Miscellaneous', N'374')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1353, N'Forestry', N'Forestry', N'1350 - 1399', N'Miscellaneous', N'375')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1354, N'Forestry, Spruce', N'Forestry, Spruce', N'1350 - 1399', N'Miscellaneous', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1355, N'Forestry, Birch', N'Forestry, Birch', N'1350 - 1399', N'Miscellaneous', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (1356, N'Forestry, Pine', N'Forestry, Pine', N'1350 - 1399', N'Miscellaneous', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2000, N'Industrial Facilities Model,  IFM: Unknown', N'Unknown industrial facility.', N'2000', N'IFM Unknown', N'400')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2050, N'Industrial Facilities Model, IFM: Heavy Fabrication and Assembly - General', N'Includes manufacturing and processing of automobiles, fabricated metals, machinery/equipment for industry, transportation equipment, pulp/paper and allied products, textile products, lumber and wood products, and stone/glass/clay/ceramics products.', N'2050 - 2099', N'IFM Heavy Fabrication', N'401')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2051, N'Industrial Facilities Model, IFM: Automotive Manufacturing', N'', N'2050 - 2099', N'IFM Heavy Fabrication', N'402')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2052, N'Industrial Facilities Model, IFM: Fabricated Metal Products', N'', N'2050 - 2099', N'IFM Heavy Fabrication', N'403')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2053, N'Industrial Facilities Model, IFM: Industrial and commercial machinery and equipment', N'', N'2050 - 2099', N'IFM Heavy Fabrication', N'404')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2054, N'Industrial Facilities Model, IFM: Transportation Equipment Assembly', N'', N'2050 - 2099', N'IFM Heavy Fabrication', N'405')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2055, N'Industrial Facilities Model,  IFM: Pulp/Paper and Allied Products Manufacturing', N'', N'2050 - 2099', N'IFM Heavy Fabrication', N'406')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2056, N'Industrial Facilities Model,  IFM: Textile Mill Product', N'', N'2050 - 2099', N'IFM Heavy Fabrication', N'407')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2057, N'Industrial Facilities Model, IFM: Lumber and wood products (excluding furniture)', N'', N'2050 - 2099', N'IFM Heavy Fabrication', N'408')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2058, N'Industrial Facilities Model, IFM: Stone/Clay/Glass/Ceramics products', N'', N'2050 - 2099', N'IFM Heavy Fabrication', N'409')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2100, N'Industrial Facilities Model, IFM: Light Fabrication and Assembly - General', N'Includes manufacturing and processing of furniture/fixtures, apparel, printing/publishing/allied products, rubber, miscellaneous products, leather/leather products, electronic/other electronic equipment (except computer equipment), measuring/controlling instruments, photographic/medical/optical goods, watches/clocks, tire manufacturers, and miscellaneous manufacturing industries.', N'2100 - 2149', N'IFM Light Fabrication', N'414')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2101, N'Industrial Facilities Model, IFM: Furniture and Fixtures', N'', N'2100 - 2149', N'IFM Light Fabrication', N'415')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2102, N'Industrial Facilities Model, IFM: Apparel and finished products from fabrics', N'', N'2100 - 2149', N'IFM Light Fabrication', N'416')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2103, N'Industrial Facilities Model, IFM: Print/Publishing and allied industry', N'', N'2100 - 2149', N'IFM Light Fabrication', N'417')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2104, N'Industrial Facilities Model,  IFM: Rubber and miscellaneous plastics products', N'', N'2100 - 2149', N'IFM Light Fabrication', N'418')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2105, N'Industrial Facilities Model, IFM: Leather and Leather products', N'', N'2100 - 2149', N'IFM Light Fabrication', N'419')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2106, N'Industrial Facilities Model, IFM: Electronic and other electrical equipment (except computer equipment)', N'', N'2100 - 2149', N'IFM Light Fabrication', N'420')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2107, N'Industrial Facilities Model, IFM: Measuring analyzing and controlling instruments', N'', N'2100 - 2149', N'IFM Light Fabrication', N'421')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2108, N'Industrial Facilities Model,  IFM: Photographic medical and optical goods', N'', N'2100 - 2149', N'IFM Light Fabrication', N'422')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2109, N'Industrial Facilities Model, IFM: Watches and clocks', N'', N'2100 - 2149', N'IFM Light Fabrication', N'423')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2110, N'Industrial Facilities Model, IFM: Miscellaneous Light Manufacturing Industries', N'', N'2100 - 2149', N'IFM Light Fabrication', N'424')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2111, N'Industrial Facilities Model, IFM: Tire manufacturers', N'', N'2100 - 2149', N'IFM Light Fabrication', N'425')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2150, N'Industrial Facilities Model, IFM: Food and Drug Processing- General', N'Includes food and beverage manufacturing and processing and the manufacturing of cigarettes, cigars, chewing tobacco, pharmaceuticals, biological products, wineries, and smoking tobacco.', N'2150 - 2199', N'IFM Instruments', N'429')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2151, N'Industrial Facilities Model, IFM: Food and kindred products', N'', N'2150 - 2199', N'IFM Instruments', N'430')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2152, N'Industrial Facilities Model, IFM: Tobacco products', N'', N'2150 - 2199', N'IFM Instruments', N'431')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2153, N'Industrial Facilities Model, IFM: Pharmaceutical plants', N'', N'2150 - 2199', N'IFM Instruments', N'432')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2154, N'Industrial Facilities Model, IFM: Biological Products(except diagnostic) - Medicinals/Botanical/Biomedical', N'', N'2150 - 2199', N'IFM Instruments', N'433')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2155, N'Industrial Facilities Model, IFM: Wineries', N'', N'2150 - 2199', N'IFM Instruments', N'434')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2200, N'Industrial Facilities Model, IFM: Chemical Processing - General', N'Establishments involved in the manufacture of basic chemicals including acids, alkalis, salts, and organic chemicals and of chemical products that are to be used in further manufacturing including synthetic fibers, plastic materials, dry colors, and pigments. Includes the manufacture of finished products used for ultimate consumption including drugs, cosmetics, and soaps, as well as products used as supplies in other industries including paints, fertilizers, and explosives.', N'2200 - 2249', N'IFM Chemical Processing', N'438')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2201, N'Industrial Facilities Model, IFM: Chlorine plants ', N'', N'2200 - 2249', N'IFM Chemical Processing', N'439')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2202, N'Industrial Facilities Model, IFM: Vinyl plants', N'', N'2200 - 2249', N'IFM Chemical Processing', N'440')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2203, N'Industrial Facilities Model, IFM: Light hydrocarbon or aromatics plants', N'', N'2200 - 2249', N'IFM Chemical Processing', N'441')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2204, N'Industrial Facilities Model, IFM: Plastics plants', N'', N'2200 - 2249', N'IFM Chemical Processing', N'442')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2205, N'Industrial Facilities Model, IFM: Chlorhydrin plants', N'', N'2200 - 2249', N'IFM Chemical Processing', N'443')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2206, N'Industrial Facilities Model, IFM: Fertilizer plants', N'', N'2200 - 2249', N'IFM Chemical Processing', N'444')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2207, N'Industrial Facilities Model, IFM: Cement plants/Cement Mills', N'', N'2200 - 2249', N'IFM Chemical Processing', N'445')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2208, N'Industrial Facilities Model, IFM: Other Chemical and Allied Products', N'', N'2200 - 2249', N'IFM Chemical Processing', N'446')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2250, N'Industrial Facilities Model, IFM: Metal and Minerals Processing- General', N'Includes the smelting and refining of metals, the manufacture of castings, other basic metal products, nails, spikes, insulated wire, and cable, the production of coke, the fabrication of metal products including metal cans, tin ware, hand tools, cutlery, and general hardware, and metal forging.', N'2250 - 2299', N'IFM Metal Processing', N'449')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2251, N'Industrial Facilities Model, IFM: Primary metal industry', N'', N'2250 - 2299', N'IFM Metal Processing', N'450')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2252, N'Industrial Facilities Model, IFM: Steel Mills', N'', N'2250 - 2299', N'IFM Metal Processing', N'451')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2253, N'Industrial Facilities Model, IFM: Smelters', N'', N'2250 - 2299', N'IFM Metal Processing', N'452')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2300, N'Industrial Facilities Model, IFM: High Technology - General', N'Includes occupancies involved in the manufacture of machinery and supplies for the generation, storage, transmission, transformation, and utilization of electrical energy including electricity distribution equipment, industrial apparatus, household appliances, electrical lighting, and wiring equipment. Includes manufacturing instruments for measuring, testing, analyzing, and controlling, optical instruments and lenses, surveying and drafting instruments, hydrological, meteorological, navigational, surgical, medical, ophthalmic, and photographic equipment, semi-conductor, computer/electronic devices, and allied products.', N'2300 - 2349', N'IFM High Technology', N'455')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2301, N'Industrial Facilities Model, IFM: Semi-conductor and related devices', N'', N'2300 - 2349', N'IFM High Technology', N'456')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2302, N'Industrial Facilities Model, IFM: Electronic computer devices', N'', N'2300 - 2349', N'IFM High Technology', N'457')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2303, N'Industrial Facilities Model, IFM: Computer storage devices', N'', N'2300 - 2349', N'IFM High Technology', N'458')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2304, N'Industrial Facilities Model, IFM: Electron tubes', N'', N'2300 - 2349', N'IFM High Technology', N'459')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2305, N'Industrial Facilities Model, IFM: Printed circuit boards', N'', N'2300 - 2349', N'IFM High Technology', N'460')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2350, N'Industrial Facilities Model, IFM: General building/ construction contractors', N'This occupancy includes general contractors and builders of residential, farm, industrial, commercial, and other buildings, as well as general contractors involved in heavy construction including highways, streets, bridges, tunnels, etc. Also included are special trade contractors including painting, electrical work, carpentry work, plumbing, heating, roofing, etc.', N'2350 - 2399', N'IFM Contractors', N'463')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2351, N'Industrial Facilities Model, IFM: Heavy Constructions', N'', N'2350 - 2399', N'IFM Contractors', N'464')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2352, N'Industrial Facilities Model, IFM: Special Trade Contractors', N'', N'2350 - 2399', N'IFM Contractors', N'465')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2400, N'Industrial Facilities Model, IFM: Mining - General', N'Includes mining and exploring for metallic and nonmetallic minerals, as well as mining and preparation of coal. Includes the extraction of oil from sand and shale and the production of natural gasoline.', N'2400 - 2449', N'IFM Mining', N'470')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2401, N'Industrial Facilities Model, IFM: Mining operations', N'', N'2400 - 2449', N'IFM Mining', N'471')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2402, N'Industrial Facilities Model, IFM: Metal mining', N'', N'2400 - 2449', N'IFM Mining', N'472')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2403, N'Industrial Facilities Model, IFM: Coal mining', N'', N'2400 - 2449', N'IFM Mining', N'473')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2404, N'Industrial Facilities Model, IFM: Mining /Quarrying - Non-metallic mineral (except fuels)', N'', N'2400 - 2449', N'IFM Mining', N'474')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2450, N'Industrial Facilities Model, IFM: Oil Refinery Systems - General', N'An oil refinery is an industrial process plant where crude oil is processed and refined into more useful petroleum products, such as gasoline, diesel fuel, asphalt base, heating oil, kerosene, and liquefied petroleum gas. Oil refineries are typically large sprawling industrial complexes with extensive piping running throughout, carrying streams of fluids between large chemical processing units. Includes establishments involved in petroleum refining, in the manufacture of paving and roofing materials, of compounding and lubricating oils and greases. Also includes the transportation of petroleum and other commodities, other than natural gas, through pipelines.', N'2450 - 2499', N'IFM Oil Refinery', N'475')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2500, N'Industrial Facilities Model, IFM: Hydro-Electric Power Systems- General', N'Establishments engaged in the generation, transmission, and/or distribution of electric energy for sale. Includes electric power generation, transmission, dams, or distribution.', N'2500-2549', N'IFM Electric', N'476')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2510, N'Industrial Facilities Model, IFM: Thermo-Electric Power Systems- General', N'Establishments engaged in the generation, transmission, and/or distribution of electric energy for sale. Includes electric power generation, transmission, or distribution.', N'2500-2549', N'IFM Electric', N'477')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2520, N'Industrial Facilities Model, IFM: Nuclear Power Systems All- General', N'', N'2500-2549', N'IFM Electric', N'478')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2530, N'Industrial Facilities Model, IFM: Electric Substation - General', N'Substations generally contain one or more transformers and have switching, protection, and control equipment. Circuit breakers are used to interrupt any short-circuits or overload currents that may occur on the network. Substations here do not have generators, although a power plant may have a substation nearby. A typical substation will contain line termination structures, high-voltage switch gear, power transformers, switch gear, surge protection, controls, grounding (earthing) system, lightning arrester, and metering. Other devices such as power factor correction capacitors and voltage regulators may also be located at a substation.', N'2500-2549', N'IFM Electric', N'479')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2541, N'Industrial Facilities Model, IFM: Solar panel plant', N'', N'2500-2549', N'IFM Electric', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2542, N'Industrial Facilities Model, IFM: Wind plant', N'', N'2500-2549', N'IFM Electric', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2550, N'Industrial Facilities Model, IFM: Potable water Systems- General', N'Establishments primarily engaged in distributing water for sale for domestic, commercial, and industrial use.', N'2550 - 2599', N'IFM Water', N'480')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2560, N'Industrial Facilities Model, IFM: Waste water treatment Systems- General', N'Establishments primarily engaged in the collection and disposal of wastes conducted through a sewer system, including such treatment processes as may be provided and establishments primarily engaged in the collection and disposal of refuse by processing or destruction or in the operation of incinerators, waste treatment plants, landfills, or other sites for disposal of such materials.', N'2550 - 2599', N'IFM Water', N'481')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2600, N'Industrial Facilities Model, IFM: Gas Processing Systems - General', N'Establishments engaged in the transmission and distribution and/or storage of natural gas for sale.', N'2600 - 2649', N'IFM Gass Processing', N'482')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2650, N'Industrial Facilities Model, IFM Communication Systems -General', N'', N'2650 - 2699', N'IFM Communications', N'483')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2700, N'Agriculture Systems - General', N'', N'2700 - 2749', N'IFM Agriculture', N'484')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2750, N'Industrial Facilities Model, IFM: Bus Systems - General', N'', N'2750 - 2799', N'IFM transportation', N'485')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2760, N'Industrial Facilities Model, IFM: Port Systems', N'', N'2750 - 2799', N'IFM transportation', N'486')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2770, N'Industrial Facilities Model, IFM: Ferry Systems', N'', N'2750 - 2799', N'IFM transportation', N'487')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (2780, N'Industrial Facilities Model, IFM: Airport Systems - General', N'', N'2750 - 2799', N'IFM transportation', N'488')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3000, N'Offshore, Unknown', N'The offshore platform occupancy is unknown.', N'3000', N'Offshore unknown', N'900')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3001, N'Offshore, Oil production only', N'Offshore platforms that produce oil only.', N'3001 - 3999', N'Offshore', N'901')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3002, N'Offshore, Gas production only', N'Offshore platforms that produce gas only.', N'3001 - 3999', N'Offshore', N'902')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3003, N'Offshore, No production', N'Offshore platforms that do not produce oil or gas.', N'3001 - 3999', N'Offshore', N'903')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3004, N'Offshore, Oil and gas production', N'Offshore platforms that produce oil and gas.', N'3001 - 3999', N'Offshore', N'904')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3005, N'Offshore, Drilling', N'Platforms used for drilling.', N'3001 - 3999', N'Offshore', N'905')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3006, N'Offshore, Workover', N'Platforms that repair or stimulate existing production wells for the purpose of restoring, prolonging, or enhancing the production of hydrocarbons.', N'3001 - 3999', N'Offshore', N'906')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3007, N'Offshore, Ready stacked', N'Rigs that are not under contract but generally are ready for service.', N'3001 - 3999', N'Offshore', N'907')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3008, N'Offshore, Waiting on location', N'Waiting on location.', N'3001 - 3999', N'Offshore', N'908')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3009, N'Offshore, Pipelines', N'Pipelines', N'3001 - 3999', N'Offshore', N'909')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3010, N'Barge, support vessel, seismic vessel', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3011, N'Buoy (single point mooring - SPM, catenary anchor leg mooring - CALM)', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3012, N'Crane barge or pipelay vessel', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3013, N'Drill ship', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3014, N'Floating liquefied natural gas (LNG), gas to liquid (GTL) vessel', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3015, N'Floating, production, storage and off-loading vessel (FPSO)', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3016, N'Floating, storage and off-loading vessel (FSO)', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3017, N'Offshore complex (bridge linked fixed steel structures)', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3018, N'Offshore concrete gravity based structure', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3019, N'Offshore fixed steel structure', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3020, N'Other floating production systems', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3021, N'Self elevating jack-up with independent legs', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3022, N'Self elevating jack-up with mat base', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3023, N'Semi submersible drilling rig', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3024, N'Semi submersible production platform', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3025, N'Spar or tension leg platform', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3026, N'Subsea equipment: deep (> 200m and <= 1500m)', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3027, N'Subsea equipment: shallow (< 200 m)', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3028, N'Subsea equipment: ultra deep ( > 1500m)', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3029, N'Offshore pipeline: deep (> 200m and <= 1500m)', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3030, N'Offshore pipeline: shallow (<= 200m)', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOccupancy] ([Code], [OccupancyName], [OccupancyDescription], [CodeRange], [CategoryName], [AIRcode]) VALUES (3031, N'Offshore pipeline: ultra deep ( > 1500m)', N'', N'3001 - 3999', N'Offshore', N'N/A')
GO
INSERT [dbo].[xOrnamentation] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xOrnamentation] ([Code], [CodeDescription]) VALUES (1, N'None')
GO
INSERT [dbo].[xOrnamentation] ([Code], [CodeDescription]) VALUES (2, N'Average')
GO
INSERT [dbo].[xOrnamentation] ([Code], [CodeDescription]) VALUES (3, N'Extensive')
GO
INSERT [dbo].[xPackaging] ([Code], [CodeDescription]) VALUES (0, N'Unknown')
GO
INSERT [dbo].[xPackaging] ([Code], [CodeDescription]) VALUES (1, N'Vulnerable')
GO
INSERT [dbo].[xPackaging] ([Code], [CodeDescription]) VALUES (2, N'Average')
GO
INSERT [dbo].[xPackaging] ([Code], [CodeDescription]) VALUES (3, N'Resilient')
GO
INSERT [dbo].[xPayoutBasis] ([Code], [CodeDescription], [Notes]) VALUES (0, N'UNK', N'Unknown / default')
GO
INSERT [dbo].[xPayoutBasis] ([Code], [CodeDescription], [Notes]) VALUES (1, N'ACV', N'Actual Cost Values')
GO
INSERT [dbo].[xPayoutBasis] ([Code], [CodeDescription], [Notes]) VALUES (2, N'RCV', N'Replacement Cost Value')
GO
INSERT [dbo].[xPayOutType] ([Code], [CodeDescription], [Notes]) VALUES (0, N'Amount', N'For limits, 0 = unlimited')
GO
INSERT [dbo].[xPayOutType] ([Code], [CodeDescription], [Notes]) VALUES (1, N'% of loss', N'Values <= 1 only')
GO
INSERT [dbo].[xPayOutType] ([Code], [CodeDescription], [Notes]) VALUES (2, N'% of TIV', N'Values <= 1 only')
GO
INSERT [dbo].[xPayOutType] ([Code], [CodeDescription], [Notes]) VALUES (3, N'% of Limit', N'Values <= 1 only')
GO
INSERT [dbo].[xPounding] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xPounding] ([Code], [CodeDescription]) VALUES (1, N'0-0.25 m')
GO
INSERT [dbo].[xPounding] ([Code], [CodeDescription]) VALUES (2, N'0.25-0.5 m')
GO
INSERT [dbo].[xPounding] ([Code], [CodeDescription]) VALUES (3, N'0.5-1.0 m')
GO
INSERT [dbo].[xPounding] ([Code], [CodeDescription]) VALUES (4, N'1.0-2.0 m')
GO
INSERT [dbo].[xPounding] ([Code], [CodeDescription]) VALUES (5, N'>2.0 m')
GO
INSERT [dbo].[xProtection] ([Code], [CodeDescription]) VALUES (0, N'Unknown')
GO
INSERT [dbo].[xProtection] ([Code], [CodeDescription]) VALUES (1, N'Vulnerable')
GO
INSERT [dbo].[xProtection] ([Code], [CodeDescription]) VALUES (2, N'Average')
GO
INSERT [dbo].[xProtection] ([Code], [CodeDescription]) VALUES (3, N'Resilient')
GO
INSERT [dbo].[xRedundancy] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xRedundancy] ([Code], [CodeDescription]) VALUES (1, N'No')
GO
INSERT [dbo].[xRedundancy] ([Code], [CodeDescription]) VALUES (2, N'Yes')
GO
INSERT [dbo].[xReinsType] ([Code], [CodeDescription]) VALUES (N'AXL', N'Aggregate Excess of Loss')
GO
INSERT [dbo].[xReinsType] ([Code], [CodeDescription]) VALUES (N'CXL', N'Catastrophe Excess of Loss')
GO
INSERT [dbo].[xReinsType] ([Code], [CodeDescription]) VALUES (N'FAC', N'Facultative reinsurance')
GO
INSERT [dbo].[xReinsType] ([Code], [CodeDescription]) VALUES (N'PR', N'Per risk treaty')
GO
INSERT [dbo].[xReinsType] ([Code], [CodeDescription]) VALUES (N'QS', N'Quota Share')
GO
INSERT [dbo].[xReinsType] ([Code], [CodeDescription]) VALUES (N'SS', N'Surplus Share')
GO
INSERT [dbo].[xRetrofit] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xRetrofit] ([Code], [CodeDescription]) VALUES (1, N'Bracing of cripple walls')
GO
INSERT [dbo].[xRetrofit] ([Code], [CodeDescription]) VALUES (2, N'Bracing of parapets')
GO
INSERT [dbo].[xRetrofit] ([Code], [CodeDescription]) VALUES (3, N'Bracing of soft-story')
GO
INSERT [dbo].[xRetrofit] ([Code], [CodeDescription]) VALUES (4, N'Foundation anchorage (bolting)')
GO
INSERT [dbo].[xRetrofit] ([Code], [CodeDescription]) VALUES (5, N'Glass/window strengthening')
GO
INSERT [dbo].[xRetrofit] ([Code], [CodeDescription]) VALUES (6, N'Tilt Up')
GO
INSERT [dbo].[xRetrofit] ([Code], [CodeDescription]) VALUES (7, N'General')
GO
INSERT [dbo].[xRiskLevel] ([Code], [CodeDescription], [InputValue]) VALUES (0, N'No risk terms', N'   ')
GO
INSERT [dbo].[xRiskLevel] ([Code], [CodeDescription], [InputValue]) VALUES (1, N'Location', N'LOC')
GO
INSERT [dbo].[xRiskLevel] ([Code], [CodeDescription], [InputValue]) VALUES (2, N'Location Group', N'LGR')
GO
INSERT [dbo].[xRiskLevel] ([Code], [CodeDescription], [InputValue]) VALUES (3, N'Policy', N'POL')
GO
INSERT [dbo].[xRiskLevel] ([Code], [CodeDescription], [InputValue]) VALUES (4, N'Account', N'ACC')
GO
INSERT [dbo].[xRoofAnchorage] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xRoofAnchorage] ([Code], [CodeDescription]) VALUES (1, N'Hurricane Ties')
GO
INSERT [dbo].[xRoofAnchorage] ([Code], [CodeDescription]) VALUES (2, N'Nails / Screws')
GO
INSERT [dbo].[xRoofAnchorage] ([Code], [CodeDescription]) VALUES (3, N'Anchor bolts')
GO
INSERT [dbo].[xRoofAnchorage] ([Code], [CodeDescription]) VALUES (4, N'Gravity / friction')
GO
INSERT [dbo].[xRoofAnchorage] ([Code], [CodeDescription]) VALUES (5, N'Adhesive epoxy')
GO
INSERT [dbo].[xRoofAnchorage] ([Code], [CodeDescription]) VALUES (6, N'Structurally Connected')
GO
INSERT [dbo].[xRoofAnchorage] ([Code], [CodeDescription]) VALUES (7, N'Clips')
GO
INSERT [dbo].[xRoofAnchorage] ([Code], [CodeDescription]) VALUES (8, N'Double wraps')
GO
INSERT [dbo].[xRoofAnchorage] ([Code], [CodeDescription]) VALUES (9, N'Single wraps')
GO
INSERT [dbo].[xRoofAttachedStructures] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xRoofAttachedStructures] ([Code], [CodeDescription]) VALUES (1, N'Chimneys')
GO
INSERT [dbo].[xRoofAttachedStructures] ([Code], [CodeDescription]) VALUES (2, N'A/C Units')
GO
INSERT [dbo].[xRoofAttachedStructures] ([Code], [CodeDescription]) VALUES (3, N'Skylights')
GO
INSERT [dbo].[xRoofAttachedStructures] ([Code], [CodeDescription]) VALUES (4, N'Parapet Walls')
GO
INSERT [dbo].[xRoofAttachedStructures] ([Code], [CodeDescription]) VALUES (5, N'Overhang/Rake (8-36 in)')
GO
INSERT [dbo].[xRoofAttachedStructures] ([Code], [CodeDescription]) VALUES (6, N'Dormers')
GO
INSERT [dbo].[xRoofAttachedStructures] ([Code], [CodeDescription]) VALUES (7, N'Other')
GO
INSERT [dbo].[xRoofAttachedStructures] ([Code], [CodeDescription]) VALUES (8, N'No Attached Structures')
GO
INSERT [dbo].[xRoofAttachedStructures] ([Code], [CodeDescription]) VALUES (9, N'Overhang/Rake (< 8 in)')
GO
INSERT [dbo].[xRoofAttachedStructures] ([Code], [CodeDescription]) VALUES (10, N'Overhang/Rake (> 36 in)')
GO
INSERT [dbo].[xRoofAttachedStructures] ([Code], [CodeDescription]) VALUES (11, N'Waterproof membrane/fabric')
GO
INSERT [dbo].[xRoofAttachedStructures] ([Code], [CodeDescription]) VALUES (12, N'Secondary water resistance - Yes')
GO
INSERT [dbo].[xRoofAttachedStructures] ([Code], [CodeDescription]) VALUES (13, N'Secondary water resistance - No')
GO
INSERT [dbo].[xRoofAttachedStructures] ([Code], [CodeDescription]) VALUES (14, N'Solar Panels with ballast')
GO
INSERT [dbo].[xRoofAttachedStructures] ([Code], [CodeDescription]) VALUES (15, N'Solar panels mechanically attached')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (1, N'Asphalt shingles')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (2, N'Wooden shingles')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (3, N'Clay/concrete tiles')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (4, N'Light metal panels')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (5, N'Slate')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (6, N'Built-up roof with gravel')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (7, N'Single ply membrane')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (8, N'Standing seam metal roofs')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (9, N'Built-up roof without gravel')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (10, N'Single ply membrane ballasted')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (11, N'Hurricane Wind-Rated Roof Coverings')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (12, N'Composition (Fiberglass, Asphalt, etc)')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (13, N'Asbestos shakes')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (14, N'Copper')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (15, N'Concrete (not tile)')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (16, N'Reinforced concrete')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (18, N'Plastic')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (19, N'Fiberglass')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (20, N'Steel')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (21, N'Plywood')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (22, N'Rubber')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (23, N'Tin')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (24, N'Aluminium')
GO
INSERT [dbo].[xRoofCover] ([Code], [CodeDescription]) VALUES (25, N'Foam')
GO
INSERT [dbo].[xRoofCoverAttachment] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xRoofCoverAttachment] ([Code], [CodeDescription]) VALUES (1, N'Screws')
GO
INSERT [dbo].[xRoofCoverAttachment] ([Code], [CodeDescription]) VALUES (2, N'Nails/staples')
GO
INSERT [dbo].[xRoofCoverAttachment] ([Code], [CodeDescription]) VALUES (3, N'Adhesive/epoxy')
GO
INSERT [dbo].[xRoofCoverAttachment] ([Code], [CodeDescription]) VALUES (4, N'Mortar')
GO
INSERT [dbo].[xRoofDeck] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xRoofDeck] ([Code], [CodeDescription]) VALUES (1, N'Plywood')
GO
INSERT [dbo].[xRoofDeck] ([Code], [CodeDescription]) VALUES (2, N'Wood planks')
GO
INSERT [dbo].[xRoofDeck] ([Code], [CodeDescription]) VALUES (3, N'Particle board / OSB')
GO
INSERT [dbo].[xRoofDeck] ([Code], [CodeDescription]) VALUES (4, N'Metal deck with insulation board')
GO
INSERT [dbo].[xRoofDeck] ([Code], [CodeDescription]) VALUES (5, N'Metal deck with concrete')
GO
INSERT [dbo].[xRoofDeck] ([Code], [CodeDescription]) VALUES (6, N'Pre-cast concrete slabs')
GO
INSERT [dbo].[xRoofDeck] ([Code], [CodeDescription]) VALUES (7, N'Reinforced concrete slabs')
GO
INSERT [dbo].[xRoofDeck] ([Code], [CodeDescription]) VALUES (8, N'Light metal')
GO
INSERT [dbo].[xRoofDeckAttachment] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xRoofDeckAttachment] ([Code], [CodeDescription]) VALUES (1, N'Screws / bolts')
GO
INSERT [dbo].[xRoofDeckAttachment] ([Code], [CodeDescription]) VALUES (2, N'Nails')
GO
INSERT [dbo].[xRoofDeckAttachment] ([Code], [CodeDescription]) VALUES (3, N'Adhesive / epoxy')
GO
INSERT [dbo].[xRoofDeckAttachment] ([Code], [CodeDescription]) VALUES (4, N'Structurally connected')
GO
INSERT [dbo].[xRoofDeckAttachment] ([Code], [CodeDescription]) VALUES (5, N'6d nails @ 6 spacing, 12 on center')
GO
INSERT [dbo].[xRoofDeckAttachment] ([Code], [CodeDescription]) VALUES (6, N'8d nails @ 6 spacing, 12 on center')
GO
INSERT [dbo].[xRoofDeckAttachment] ([Code], [CodeDescription]) VALUES (7, N'8d nails @ 6 spacing, 6 on center')
GO
INSERT [dbo].[xRoofEquipment] ([Code], [CodeDescription]) VALUES (0, N'Unknown')
GO
INSERT [dbo].[xRoofEquipment] ([Code], [CodeDescription]) VALUES (1, N'No equipment')
GO
INSERT [dbo].[xRoofEquipment] ([Code], [CodeDescription]) VALUES (2, N'Vulnerable')
GO
INSERT [dbo].[xRoofEquipment] ([Code], [CodeDescription]) VALUES (3, N'Average')
GO
INSERT [dbo].[xRoofEquipment] ([Code], [CodeDescription]) VALUES (4, N'Resilient')
GO
INSERT [dbo].[xRoofFrame] ([Code], [CodeDescription]) VALUES (0, N'Unknown')
GO
INSERT [dbo].[xRoofFrame] ([Code], [CodeDescription]) VALUES (1, N'Reinforcet Concrete')
GO
INSERT [dbo].[xRoofFrame] ([Code], [CodeDescription]) VALUES (2, N'Steel')
GO
INSERT [dbo].[xRoofFrame] ([Code], [CodeDescription]) VALUES (3, N'Light Metal')
GO
INSERT [dbo].[xRoofFrame] ([Code], [CodeDescription]) VALUES (4, N'Wood')
GO
INSERT [dbo].[xRoofGeometry] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xRoofGeometry] ([Code], [CodeDescription]) VALUES (1, N'Flat')
GO
INSERT [dbo].[xRoofGeometry] ([Code], [CodeDescription]) VALUES (2, N'Gable end without bracing')
GO
INSERT [dbo].[xRoofGeometry] ([Code], [CodeDescription]) VALUES (3, N'Hip')
GO
INSERT [dbo].[xRoofGeometry] ([Code], [CodeDescription]) VALUES (4, N'Complex')
GO
INSERT [dbo].[xRoofGeometry] ([Code], [CodeDescription]) VALUES (5, N'Stepped')
GO
INSERT [dbo].[xRoofGeometry] ([Code], [CodeDescription]) VALUES (6, N'Shed')
GO
INSERT [dbo].[xRoofGeometry] ([Code], [CodeDescription]) VALUES (7, N'Mansard')
GO
INSERT [dbo].[xRoofGeometry] ([Code], [CodeDescription]) VALUES (8, N'Gable end with bracing')
GO
INSERT [dbo].[xRoofGeometry] ([Code], [CodeDescription]) VALUES (9, N'Pyramid')
GO
INSERT [dbo].[xRoofGeometry] ([Code], [CodeDescription]) VALUES (10, N'Gambrel')
GO
INSERT [dbo].[xRoofGeometry] ([Code], [CodeDescription]) VALUES (11, N'Butterfly')
GO
INSERT [dbo].[xRoofGeometry] ([Code], [CodeDescription]) VALUES (12, N'Saltbox')
GO
INSERT [dbo].[xRoofMaintenance] ([Code], [CodeDescription]) VALUES (0, N'Unknown')
GO
INSERT [dbo].[xRoofMaintenance] ([Code], [CodeDescription]) VALUES (1, N'Vulnerable')
GO
INSERT [dbo].[xRoofMaintenance] ([Code], [CodeDescription]) VALUES (2, N'Average')
GO
INSERT [dbo].[xRoofMaintenance] ([Code], [CodeDescription]) VALUES (3, N'Resilient')
GO
INSERT [dbo].[xRoofPitch] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xRoofPitch] ([Code], [CodeDescription]) VALUES (1, N'Low (<10°)')
GO
INSERT [dbo].[xRoofPitch] ([Code], [CodeDescription]) VALUES (2, N'Medium (10° to 30°)')
GO
INSERT [dbo].[xRoofPitch] ([Code], [CodeDescription]) VALUES (3, N'High (>30°)')
GO
INSERT [dbo].[xSalvageProtection] ([Code], [CodeDescription]) VALUES (0, N'Unknown')
GO
INSERT [dbo].[xSalvageProtection] ([Code], [CodeDescription]) VALUES (1, N'Vulnerable')
GO
INSERT [dbo].[xSalvageProtection] ([Code], [CodeDescription]) VALUES (2, N'Average')
GO
INSERT [dbo].[xSalvageProtection] ([Code], [CodeDescription]) VALUES (3, N'Resilient')
GO
INSERT [dbo].[xServiceEquipmentProtection] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xServiceEquipmentProtection] ([Code], [CodeDescription]) VALUES (1, N'Protected for flood (i.e. protected for flood by being elevated and/or flood proofing)')
GO
INSERT [dbo].[xServiceEquipmentProtection] ([Code], [CodeDescription]) VALUES (2, N'Unprotected for flood (i.e. not elevated and not flood protected)')
GO
INSERT [dbo].[xShapeIrregularity] ([Code], [CodeDescription], [Notes]) VALUES (0, N'Unknown / default', NULL)
GO
INSERT [dbo].[xShapeIrregularity] ([Code], [CodeDescription], [Notes]) VALUES (2, N'Vertical Offset', NULL)
GO
INSERT [dbo].[xShapeIrregularity] ([Code], [CodeDescription], [Notes]) VALUES (3, N'Non-uniform Floor Area', N'E.g., a sudden change in floor area along the height')
GO
INSERT [dbo].[xShapeIrregularity] ([Code], [CodeDescription], [Notes]) VALUES (4, N'Discontinuous Shear Wall', N'I.e., the main load-resisting components are not provided in a regular, symmetric pattern')
GO
INSERT [dbo].[xShapeIrregularity] ([Code], [CodeDescription], [Notes]) VALUES (5, N'Heavy floor', N'E.g., placement of heavy equipment on higher floors')
GO
INSERT [dbo].[xShortColumn] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xShortColumn] ([Code], [CodeDescription]) VALUES (1, N'No')
GO
INSERT [dbo].[xShortColumn] ([Code], [CodeDescription]) VALUES (2, N'Yes')
GO
INSERT [dbo].[xSmallDebris] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xSmallDebris] ([Code], [CodeDescription]) VALUES (1, N'No')
GO
INSERT [dbo].[xSmallDebris] ([Code], [CodeDescription]) VALUES (2, N'Yes')
GO
INSERT [dbo].[xSoftStory] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xSoftStory] ([Code], [CodeDescription]) VALUES (1, N'No')
GO
INSERT [dbo].[xSoftStory] ([Code], [CodeDescription]) VALUES (2, N'Yes')
GO
INSERT [dbo].[xSpecialEQConstruction] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xSpecialEQConstruction] ([Code], [CodeDescription]) VALUES (1, N'Base isolation')
GO
INSERT [dbo].[xSpecialEQConstruction] ([Code], [CodeDescription]) VALUES (2, N'Visco-elastic dampers')
GO
INSERT [dbo].[xSpecialEQConstruction] ([Code], [CodeDescription]) VALUES (3, N'Other energy dissipaters')
GO
INSERT [dbo].[xSprinklerType] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xSprinklerType] ([Code], [CodeDescription]) VALUES (1, N'No sprinkler')
GO
INSERT [dbo].[xSprinklerType] ([Code], [CodeDescription]) VALUES (2, N'CO2 / Halon sprinkler')
GO
INSERT [dbo].[xSprinklerType] ([Code], [CodeDescription]) VALUES (3, N'Dry sprinkler')
GO
INSERT [dbo].[xSprinklerType] ([Code], [CodeDescription]) VALUES (4, N'Standpipe sprinkler')
GO
INSERT [dbo].[xSprinklerType] ([Code], [CodeDescription]) VALUES (5, N'Wet sprinkler')
GO
INSERT [dbo].[xStatuses] ([Code], [CodeDescription]) VALUES (N'B', N'Bound')
GO
INSERT [dbo].[xStatuses] ([Code], [CodeDescription]) VALUES (N'C', N'Cancelled')
GO
INSERT [dbo].[xStatuses] ([Code], [CodeDescription]) VALUES (N'Q', N'Quoted')
GO
INSERT [dbo].[xStatuses] ([Code], [CodeDescription]) VALUES (N'R', N'Rejected')
GO
INSERT [dbo].[xStatuses] ([Code], [CodeDescription]) VALUES (N'S', N'Submitted')
GO
INSERT [dbo].[xStepTriggerType] ([Code], [CodeDescription]) VALUES (1, N'Building')
GO
INSERT [dbo].[xStepTriggerType] ([Code], [CodeDescription]) VALUES (2, N'Contents')
GO
INSERT [dbo].[xStepTriggerType] ([Code], [CodeDescription]) VALUES (3, N'Building and Contents')
GO
INSERT [dbo].[xStepTriggerType] ([Code], [CodeDescription]) VALUES (4, N'Building, then Contents')
GO
INSERT [dbo].[xStepTriggerType] ([Code], [CodeDescription]) VALUES (5, N'Building, Contents separately')
GO
INSERT [dbo].[xTallOneStory] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xTallOneStory] ([Code], [CodeDescription]) VALUES (1, N'<= 20 ft')
GO
INSERT [dbo].[xTallOneStory] ([Code], [CodeDescription]) VALUES (2, N'> 20ft and < 40ft')
GO
INSERT [dbo].[xTallOneStory] ([Code], [CodeDescription]) VALUES (3, N'>= 40ft')
GO
INSERT [dbo].[xTank] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xTank] ([Code], [CodeDescription]) VALUES (1, N'No')
GO
INSERT [dbo].[xTank] ([Code], [CodeDescription]) VALUES (2, N'Yes')
GO
INSERT [dbo].[xTerrainRoughness] ([Code], [CodeDescription], [Notes]) VALUES (0, N'Unknown / default', NULL)
GO
INSERT [dbo].[xTerrainRoughness] ([Code], [CodeDescription], [Notes]) VALUES (1, N'Large city centers', N'Large city centers with at least 50% of the buildings having a height in excess of 70 feet (21.3 m). You should limit the use of this exposure category to areas for which terrain representative of this category prevails in the upward direction for a distance of at least 0.5 mi. (0.8 km) or 10 times the height of the building or other structure, whichever is greater. Possible channeling effect on building will be taken into account.')
GO
INSERT [dbo].[xTerrainRoughness] ([Code], [CodeDescription], [Notes]) VALUES (2, N'Urban and suburban areas, wooded areas', N'Urban and suburban areas, wooded areas, or other terrain with numerous closely spaced obstructions having the size of single-family dwellings or larger. You should limit the use of this exposure category to areas for which terrain representative of this category prevails in the upwind direction for a distance of at least 1,500 feet (460 m) or 10 times the height of the building or other structure, whichever is greater.')
GO
INSERT [dbo].[xTerrainRoughness] ([Code], [CodeDescription], [Notes]) VALUES (3, N'Open terrain with scattered obstruct', N'Open terrain with scattered obstructions having heights generally less than 30 feet (9.1 m). This category includes flat, open country and grasslands.')
GO
INSERT [dbo].[xTerrainRoughness] ([Code], [CodeDescription], [Notes]) VALUES (4, N'Flat, unobstructed areas', N'Flat, unobstructed areas exposed to winds flowing over open water for a distance of at least 1 mile (1.61 km). This exposure category applies only to buildings and other structures exposed to the winds coming off the water. This exposure category extends inland from the shoreline a distance of 1,500 feet (460 m) or 10 times the height of the building or structure, whichever is greater.')
GO
INSERT [dbo].[xTorsion] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xTorsion] ([Code], [CodeDescription]) VALUES (1, N'Symmetric')
GO
INSERT [dbo].[xTorsion] ([Code], [CodeDescription]) VALUES (2, N'Asymmetric')
GO
INSERT [dbo].[xTorsion] ([Code], [CodeDescription]) VALUES (3, N'Corner building')
GO
INSERT [dbo].[xTreeExposure] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xTreeExposure] ([Code], [CodeDescription]) VALUES (1, N'No')
GO
INSERT [dbo].[xTreeExposure] ([Code], [CodeDescription]) VALUES (2, N'Yes')
GO
INSERT [dbo].[xUnits] ([Code], [CodeDescription]) VALUES (1, N'Feet (Distance)')
GO
INSERT [dbo].[xUnits] ([Code], [CodeDescription]) VALUES (2, N'Meters (Distance)')
GO
INSERT [dbo].[xUnits] ([Code], [CodeDescription]) VALUES (3, N'Kilometers (Distance)')
GO
INSERT [dbo].[xUnits] ([Code], [CodeDescription]) VALUES (4, N'Miles (Distance)')
GO
INSERT [dbo].[xUnits] ([Code], [CodeDescription]) VALUES (11, N'Square feet (Area)')
GO
INSERT [dbo].[xUnits] ([Code], [CodeDescription]) VALUES (12, N'Square meters (Area)')
GO
INSERT [dbo].[xUnits] ([Code], [CodeDescription]) VALUES (13, N'Acre (Area)')
GO
INSERT [dbo].[xUnits] ([Code], [CodeDescription]) VALUES (14, N'Hectare (Area)')
GO
INSERT [dbo].[xValuablesStorage] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xValuablesStorage] ([Code], [CodeDescription]) VALUES (1, N'Vault')
GO
INSERT [dbo].[xValuablesStorage] ([Code], [CodeDescription]) VALUES (2, N'Safe')
GO
INSERT [dbo].[xValuablesStorage] ([Code], [CodeDescription]) VALUES (3, N'Strongbox')
GO
INSERT [dbo].[xValuablesStorage] ([Code], [CodeDescription]) VALUES (4, N'Unprotected exhibition')
GO
INSERT [dbo].[xValuablesStorage] ([Code], [CodeDescription]) VALUES (5, N'Protected exhibition (protection around specific art pieces)')
GO
INSERT [dbo].[xValuablesStorage] ([Code], [CodeDescription]) VALUES (6, N'Archive')
GO
INSERT [dbo].[xValuablesStorage] ([Code], [CodeDescription]) VALUES (7, N'Special facility')
GO
INSERT [dbo].[xWallAttachedStructure] ([Code], [CodeDescription]) VALUES (0, N'Unkown / default')
GO
INSERT [dbo].[xWallAttachedStructure] ([Code], [CodeDescription]) VALUES (1, N'Carports / Canopies / Porches')
GO
INSERT [dbo].[xWallAttachedStructure] ([Code], [CodeDescription]) VALUES (2, N'Single Door Garages')
GO
INSERT [dbo].[xWallAttachedStructure] ([Code], [CodeDescription]) VALUES (3, N'Double Door Garages')
GO
INSERT [dbo].[xWallAttachedStructure] ([Code], [CodeDescription]) VALUES (4, N'Reinforced Single Door Garages')
GO
INSERT [dbo].[xWallAttachedStructure] ([Code], [CodeDescription]) VALUES (5, N'Reinforced Double Door Garages')
GO
INSERT [dbo].[xWallAttachedStructure] ([Code], [CodeDescription]) VALUES (6, N'Screened Porches/Glass Patio Doors')
GO
INSERT [dbo].[xWallAttachedStructure] ([Code], [CodeDescription]) VALUES (7, N'Balcony')
GO
INSERT [dbo].[xWallAttachedStructure] ([Code], [CodeDescription]) VALUES (8, N'No attached wall structures')
GO
INSERT [dbo].[xWallAttachedStructure] ([Code], [CodeDescription]) VALUES (9, N'Attached screen enclosure / Lanai')
GO
INSERT [dbo].[xWindowProtection] ([Code], [CodeDescription]) VALUES (0, N'Unknown / default')
GO
INSERT [dbo].[xWindowProtection] ([Code], [CodeDescription]) VALUES (1, N'No protection')
GO
INSERT [dbo].[xWindowProtection] ([Code], [CodeDescription]) VALUES (2, N'Non-engineered shutters')
GO
INSERT [dbo].[xWindowProtection] ([Code], [CodeDescription]) VALUES (3, N'Engineered shutters')
GO
INSERT [dbo].[zNotes] ([ShortDescription], [Notes]) VALUES (N'FloorsOccupied', N'A separate table will be added to DB if any model providers are using this information. Otherwise, we will store semi-colon separated values')
GO
