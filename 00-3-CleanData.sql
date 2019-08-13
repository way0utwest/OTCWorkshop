/**************************************************************************

Redgate On the Cog Workshop - 2 hour

Setup 00-1-Prod-Setup

Fix some data after Data Generator has run

***************************************************************************/
USE SimpleTalk_5_Prod
go
-- clean up emails
UPDATE
    dbo.Contacts
 SET
    Email = SUBSTRING(ContactFullName, 1, CHARINDEX(' ', ContactFullName) - 1) + '@'
            + SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email));
GO

UPDATE dbo.Users SET NTAuthAccount = 'MyDomain\\' + Username;
GO
TRUNCATE TABLE dbo.CountryCodes
GO
INSERT INTO [dbo].[CountryCodes] ([CountryCode], [CountryName]) 
 VALUES
  (N'AE', N'UNITED ARAB EMIRATES')
, (N'AF', N'AFGHANISTAN')
, (N'AG', N'ANTIGUA AND BARBUDA')
, (N'AI', N'ANGUILLA')
, (N'AL', N'ALBANIA')
, (N'AM', N'ARMENIA')
, (N'AO', N'ANGOLA')
, (N'AQ', N'ANTARCTICA')
, (N'AR', N'ARGENTINA')
, (N'AS', N'AMERICAN SAMOA')
, (N'AT', N'AUSTRIA')
, (N'AU', N'AUSTRALIA')
, (N'AW', N'ARUBA')
, (N'AX', N'�LAND ISLANDS')
, (N'AZ', N'AZERBAIJAN')
, (N'BA', N'BOSNIA AND HERZEGOVINA')
, (N'BB', N'BARBADOS')
, (N'BD', N'BANGLADESH')
, (N'BE', N'BELGIUM')
, (N'BF', N'BURKINA FASO')
, (N'BG', N'BULGARIA')
, (N'BH', N'BAHRAIN')
, (N'BI', N'BURUNDI')
, (N'BJ', N'BENIN')
, (N'BL', N'SAINT BARTH�LEMY')
, (N'BM', N'BERMUDA')
, (N'BN', N'BRUNEI DARUSSALAM')
, (N'BO', N'BOLIVIA')
, (N'BQ', N'BONAIRE')
, (N'BR', N'BRAZIL')
, (N'BS', N'BAHAMAS')
, (N'BT', N'BHUTAN')
, (N'BV', N'BOUVET ISLAND')
, (N'BW', N'BOTSWANA')
, (N'BY', N'BELARUS')
, (N'BZ', N'BELIZE')
, (N'CA', N'CANADA')
, (N'CC', N'COCOS (KEELING) ISLANDS')
, (N'CD', N'CONGO')
, (N'CF', N'CENTRAL AFRICAN REPUBLIC')
, (N'CG', N'CONGO')
, (N'CH', N'SWITZERLAND')
, (N'CI', N'C�TE D''IVOIRE')
, (N'CK', N'COOK ISLANDS')
, (N'CL', N'CHILE')
, (N'CM', N'CAMEROON')
, (N'CN', N'CHINA')
, (N'CO', N'COLOMBIA')
, (N'CR', N'COSTA RICA')
, (N'CU', N'CUBA')
, (N'CV', N'CAPE VERDE')
, (N'CW', N'CURA�AO')
, (N'CX', N'CHRISTMAS ISLAND')
, (N'CY', N'CYPRUS')
, (N'CZ', N'CZECH REPUBLIC')
, (N'DA', N'ANDORRA')
, (N'DE', N'GERMANY')
, (N'DJ', N'DJIBOUTI')
, (N'DK', N'DENMARK')
, (N'DM', N'DOMINICA')
, (N'DO', N'DOMINICAN REPUBLIC')
, (N'DZ', N'ALGERIA')
, (N'EC', N'ECUADOR')
, (N'EE', N'ESTONIA')
, (N'EG', N'EGYPT')
, (N'EH', N'WESTERN SAHARA')
, (N'ER', N'ERITREA')
, (N'ES', N'SPAIN')
, (N'ET', N'ETHIOPIA')
, (N'FI', N'FINLAND')
, (N'FJ', N'FIJI')
, (N'FK', N'FALKLAND ISLANDS (MALVINAS)')
, (N'FM', N'MICRONESIA')
, (N'FO', N'FAROE ISLANDS')
, (N'FR', N'FRANCE')
, (N'GA', N'GABON')
, (N'GB', N'UNITED KINGDOM')
, (N'GD', N'GRENADA')
, (N'GE', N'GEORGIA')
, (N'GF', N'FRENCH GUIANA')
, (N'GG', N'GUERNSEY')
, (N'GH', N'GHANA')
, (N'GI', N'GIBRALTAR')
, (N'GL', N'GREENLAND')
, (N'GM', N'GAMBIA')
, (N'GN', N'GUINEA')
, (N'GP', N'GUADELOUPE')
, (N'GQ', N'EQUATORIAL GUINEA')
, (N'GR', N'GREECE')
, (N'GS', N'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS')
, (N'GT', N'GUATEMALA')
, (N'GU', N'GUAM')
, (N'GW', N'GUINEA-BISSAU')
, (N'GY', N'GUYANA')
, (N'HK', N'HONG KONG')
, (N'HM', N'HEARD ISLAND AND MCDONALD ISLANDS')
, (N'HN', N'HONDURAS')
, (N'HR', N'CROATIA')
, (N'HT', N'HAITI')
, (N'HU', N'HUNGARY')
, (N'ID', N'INDONESIA')
, (N'IE', N'IRELAND')
, (N'IL', N'ISRAEL')
, (N'IM', N'ISLE OF MAN')
, (N'IN', N'INDIA')
, (N'IO', N'BRITISH INDIAN OCEAN TERRITORY')
, (N'IQ', N'IRAQ')
, (N'IR', N'IRAN')
, (N'IS', N'ICELAND')
, (N'IT', N'ITALY')
, (N'JE', N'JERSEY')
, (N'JM', N'JAMAICA')
, (N'JO', N'JORDAN')
, (N'JP', N'JAPAN')
, (N'KE', N'KENYA')
, (N'KG', N'KYRGYZSTAN')
, (N'KH', N'CAMBODIA')
, (N'KI', N'KIRIBATI')
, (N'KM', N'COMOROS')
, (N'KN', N'SAINT KITTS AND NEVIS')
, (N'KP', N'KOREA')
, (N'KR', N'KOREA')
, (N'KW', N'KUWAIT')
, (N'KY', N'CAYMAN ISLANDS')
, (N'KZ', N'KAZAKHSTAN')
, (N'LA', N'LAO PEOPLE''S DEMOCRATIC REPUBLIC')
, (N'LB', N'LEBANON')
, (N'LC', N'SAINT LUCIA')
, (N'LI', N'LIECHTENSTEIN')
, (N'LK', N'SRI LANKA')
, (N'LR', N'LIBERIA')
, (N'LS', N'LESOTHO')
, (N'LT', N'LITHUANIA')
, (N'LU', N'LUXEMBOURG')
, (N'LV', N'LATVIA')
, (N'LY', N'LIBYA')
, (N'MA', N'MOROCCO')
, (N'MC', N'MONACO')
, (N'MD', N'MOLDOVA')
, (N'ME', N'MONTENEGRO')
, (N'MF', N'SAINT MARTIN (FRENCH PART)')
, (N'MG', N'MADAGASCAR')
, (N'MH', N'MARSHALL ISLANDS')
, (N'MK', N'MACEDONIA')
, (N'ML', N'MALI')
, (N'MM', N'MYANMAR')
, (N'MN', N'MONGOLIA')
, (N'MO', N'MACAO')
, (N'MP', N'NORTHERN MARIANA ISLANDS')
, (N'MQ', N'MARTINIQUE')
, (N'MR', N'MAURITANIA')
, (N'MS', N'MONTSERRAT')
, (N'MT', N'MALTA')
, (N'MU', N'MAURITIUS')
, (N'MV', N'MALDIVES')
, (N'MW', N'MALAWI')
, (N'MX', N'MEXICO')
, (N'MY', N'MALAYSIA')
, (N'MZ', N'MOZAMBIQUE')
, (N'NA', N'NAMIBIA')
, (N'NC', N'NEW CALEDONIA')
, (N'NE', N'NIGER')
, (N'NF', N'NORFOLK ISLAND')
, (N'NG', N'NIGERIA')
, (N'NI', N'NICARAGUA')
, (N'NL', N'NETHERLANDS')
, (N'NO', N'NORWAY')
, (N'NP', N'NEPAL')
, (N'NR', N'NAURU')
, (N'NU', N'NIUE')
, (N'NZ', N'NEW ZEALAND')
, (N'OM', N'OMAN')
, (N'PA', N'PANAMA')
, (N'PE', N'PERU')
, (N'PF', N'FRENCH POLYNESIA')
, (N'PG', N'PAPUA NEW GUINEA')
, (N'PH', N'PHILIPPINES')
, (N'PK', N'PAKISTAN')
, (N'PL', N'POLAND')
, (N'PM', N'SAINT PIERRE AND MIQUELON')
, (N'PN', N'PITCAIRN')
, (N'PR', N'PUERTO RICO')
, (N'PS', N'PALESTINIAN TERRITORY')
, (N'PT', N'PORTUGAL')
, (N'PW', N'PALAU')
, (N'PY', N'PARAGUAY')
, (N'QA', N'QATAR')
, (N'RE', N'R�UNION')
, (N'RO', N'ROMANIA')
, (N'RS', N'SERBIA')
, (N'RU', N'RUSSIAN FEDERATION')
, (N'RW', N'RWANDA')
, (N'SA', N'SAUDI ARABIA')
, (N'SB', N'SOLOMON ISLANDS')
, (N'SC', N'SEYCHELLES')
, (N'SD', N'SUDAN')
, (N'SE', N'SWEDEN')
, (N'SG', N'SINGAPORE')
, (N'SH', N'SAINT HELENA')
, (N'SI', N'SLOVENIA')
, (N'SJ', N'SVALBARD AND JAN MAYEN')
, (N'SK', N'SLOVAKIA')
, (N'SL', N'SIERRA LEONE')
, (N'SM', N'SAN MARINO')
, (N'SN', N'SENEGAL')
, (N'SO', N'SOMALIA')
, (N'SR', N'SURINAME')
, (N'SS', N'SOUTH SUDAN')
, (N'ST', N'SAO TOME AND PRINCIPE')
, (N'SV', N'EL SALVADOR')
, (N'SX', N'SINT MAARTEN (DUTCH PART)')
, (N'SY', N'SYRIAN ARAB REPUBLIC')
, (N'SZ', N'SWAZILAND')
, (N'TC', N'TURKS AND CAICOS ISLANDS')
, (N'TD', N'CHAD')
, (N'TF', N'FRENCH SOUTHERN TERRITORIES')
, (N'TG', N'TOGO')
, (N'TH', N'THAILAND')
, (N'TJ', N'TAJIKISTAN')
, (N'TK', N'TOKELAU')
, (N'TL', N'TIMOR-LESTE')
, (N'TM', N'TURKMENISTAN')
, (N'TN', N'TUNISIA')
, (N'TO', N'TONGA')
, (N'TR', N'TURKEY')
, (N'TT', N'TRINIDAD AND TOBAGO')
, (N'TV', N'TUVALU')
, (N'TW', N'TAIWAN')
, (N'TZ', N'TANZANIA')
, (N'UA', N'UKRAINE')
, (N'UG', N'UGANDA')
, (N'UM', N'UNITED STATES MINOR OUTLYING ISLANDS')
, (N'US', N'UNITED STATES')
, (N'UY', N'URUGUAY')
, (N'UZ', N'UZBEKISTAN')
, (N'VA', N'HOLY SEE (VATICAN CITY STATE)')
, (N'VC', N'SAINT VINCENT AND THE GRENADINES')
, (N'VE', N'VENEZUELA')
, (N'VG', N'VIRGIN ISLANDS')
, (N'VI', N'VIRGIN ISLANDS')
, (N'VN', N'VIET NAM')
, (N'VU', N'VANUATU')
, (N'WF', N'WALLIS AND FUTUNA')
, (N'WS', N'SAMOA')
, (N'YE', N'YEMEN')
, (N'YT', N'MAYOTTE')
, (N'ZA', N'SOUTH AFRICA')
, (N'ZM', N'ZAMBIA')
, (N'ZW', N'ZIMBABWE')
go
