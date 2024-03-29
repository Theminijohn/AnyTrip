require 'json'
require 'ruby-progressbar'

desc 'Import Airlines'

task import_airlines: :environment do
  progress = ProgressBar.create( format:         '%a %bᗧ%i %p%% %t',
                                 progress_mark:  ' ',
                                 remainder_mark: '･',
                                 total:          nil,
                                 title:          'Importing Airlines')


  ### BIG ASS AIRLINES LIST - 1352 ###
  active_airlines = [
    {
     "fs": "LCI",
     "iata": "LF",
     "icao": "LCI",
     "name": "Lao Central Airlines ",
     "active": true
    },
    {
     "fs": "TGU",
     "iata": "5U",
     "icao": "TGU",
     "name": "TAG",
     "active": true
    },
    {
     "fs": "BT",
     "iata": "BT",
     "icao": "BTI",
     "name": "Air Baltic",
     "active": true
    },
    {
     "fs": "9J",
     "iata": "9J",
     "icao": "DAN",
     "name": "Dana Airlines",
     "active": true
    },
    {
     "fs": "2O",
     "iata": "2O",
     "icao": "RNE",
     "name": "Island Air Service",
     "active": true
    },
    {
     "fs": "IW*",
     "iata": "IW",
     "icao": "OAN",
     "name": "Aerospace One",
     "active": true
    },
    {
     "fs": "DP*",
     "iata": "DP",
     "name": "Pobeda",
     "active": true
    },
    {
     "fs": "NPT",
     "icao": "NPT",
     "name": "Atlantic Airlines",
     "active": true
    },
    {
     "fs": "C8",
     "iata": "C8",
     "icao": "ICV",
     "name": "Cargolux Italia",
     "active": true
    },
    {
     "fs": "FK",
     "iata": "FK",
     "icao": "WTA",
     "name": "Africa West",
     "active": true
    },
    {
     "fs": "DH*",
     "iata": "DH",
     "name": "Norwegian Air Norway",
     "active": true
    },
    {
     "fs": "8K",
     "iata": "8K",
     "icao": "EVS",
     "name": "EVAS Air Charters",
     "active": true
    },
    {
     "fs": "FP*",
     "iata": "FP",
     "name": "S.A.C.",
     "active": true
    },
    {
     "fs": "W8",
     "iata": "W8",
     "icao": "CJT",
     "name": "Cargojet",
     "active": true
    },
    {
     "fs": "KLS",
     "iata": "KD",
     "icao": "KLS",
     "name": "Kal Star Aviation",
     "active": true
    },
    {
     "fs": "JBW",
     "iata": "3J",
     "icao": "JBW",
     "name": "Jubba Airways (Kenya)",
     "active": true
    },
    {
     "fs": "TNU",
     "iata": "M8",
     "icao": "TNU",
     "name": "TransNusa",
     "active": true
    },
    {
     "fs": "HCC",
     "iata": "HC",
     "icao": "HCC",
     "name": "Holidays Czech Airlines",
     "active": true
    },
    {
     "fs": "APJ",
     "iata": "MM",
     "icao": "APJ",
     "name": "Peach Aviation",
     "active": true
    },
    {
     "fs": "TUY",
     "iata": "L4",
     "icao": "TUY",
     "name": "LTA",
     "active": true
    },
    {
     "fs": "LAE",
     "iata": "L7",
     "icao": "LAE",
     "name": "LANCO",
     "active": true
    },
    {
     "fs": "L5*",
     "iata": "L5",
     "icao": "LTR",
     "name": "Lufttransport",
     "active": true
    },
    {
     "fs": "QA",
     "iata": "QA",
     "icao": "CIM",
     "name": "Cimber",
     "active": true
    },
    {
     "fs": "KBZ",
     "iata": "K7",
     "icao": "KBZ",
     "name": "Air KBZ",
     "active": true
    },
    {
     "fs": "UK*",
     "iata": "UK",
     "name": "Vistara",
     "active": true
    },
    {
     "fs": "L2",
     "iata": "L2",
     "icao": "LYC",
     "name": "Lynden Air Cargo",
     "active": true
    },
    {
     "fs": "2F*",
     "iata": "2F",
     "icao": "AFU",
     "name": "Afrinat International",
     "active": true
    },
    {
     "fs": "MPK",
     "iata": "I6",
     "icao": "MPK",
     "name": "Air Indus",
     "active": true
    },
    {
     "fs": "CAO",
     "icao": "CAO",
     "name": "Air China Cargo ",
     "active": true
    },
    {
     "fs": "BEK",
     "iata": "Z9",
     "icao": "BEK",
     "name": "Bek Air",
     "active": true
    },
    {
     "fs": "IAE",
     "iata": "IO",
     "icao": "IAE",
     "name": "IrAero",
     "active": true
    },
    {
     "fs": "GL*",
     "iata": "GL",
     "name": "Airglow Aviation Services",
     "active": true
    },
    {
     "fs": "ATN",
     "iata": "8C",
     "icao": "ATN",
     "name": "ATI",
     "active": true
    },
    {
     "fs": "GU",
     "iata": "GU",
     "icao": "GUG",
     "name": "Aviateca Guatemala",
     "active": true
    },
    {
     "fs": "GHY",
     "icao": "GHY",
     "name": "German Sky Airlines ",
     "active": true
    },
    {
     "fs": "SS",
     "iata": "SS",
     "icao": "CRL",
     "name": "Corsair",
     "active": true
    },
    {
     "fs": "XK",
     "iata": "XK",
     "icao": "CCM",
     "name": "Air Corsica",
     "active": true
    },
    {
     "fs": "W9*",
     "iata": "W9",
     "icao": "JAB",
     "name": "Air Bagan",
     "active": true
    },
    {
     "fs": "Z8*",
     "iata": "Z8",
     "icao": "AZN",
     "name": "Amaszonas",
     "active": true
    },
    {
     "fs": "D2",
     "iata": "D2",
     "icao": "SSF",
     "name": "Severstal Aircompany",
     "active": true
    },
    {
     "fs": "SNC",
     "iata": "2Q",
     "icao": "SNC",
     "name": "Air Cargo Carriers",
     "active": true
    },
    {
     "fs": "UI*",
     "iata": "UI",
     "icao": "AUK",
     "name": "Auric Air",
     "active": true
    },
    {
     "fs": "PST",
     "iata": "7P",
     "icao": "PST",
     "name": "Air Panama",
     "active": true
    },
    {
     "fs": "VV",
     "iata": "VV",
     "icao": "AEW",
     "name": "Aerosvit Airlines",
     "active": true
    },
    {
     "fs": "UJ",
     "iata": "UJ",
     "icao": "LMU",
     "name": "AlMasria",
     "active": true
    },
    {
     "fs": "9U",
     "iata": "9U",
     "icao": "MLD",
     "name": "Air Moldova",
     "active": true
    },
    {
     "fs": "NF",
     "iata": "NF",
     "icao": "AVN",
     "name": "Air Vanuatu",
     "phoneNumber": "678 238 48",
     "active": true
    },
    {
     "fs": "NJS",
     "iata": "NC",
     "icao": "NJS",
     "name": "Cobham Aviation",
     "active": true
    },
    {
     "fs": "1B",
     "iata": "1B",
     "name": "British Airways Cargo",
     "active": true
    },
    {
     "fs": "2S*",
     "iata": "2S",
     "icao": "KJA",
     "name": "Kinda Airlines",
     "active": true
    },
    {
     "fs": "BSX",
     "iata": "5B",
     "icao": "BSX",
     "name": "Bassaka Air",
     "active": true
    },
    {
     "fs": "GEC",
     "icao": "GEC",
     "name": "Lufthansa Cargo ",
     "active": true
    },
    {
     "fs": "CND",
     "iata": "CD",
     "icao": "CND",
     "name": "Corendon Dutch Airlines",
     "active": true
    },
    {
     "fs": "AI",
     "iata": "AI",
     "icao": "AIC",
     "name": "Air India",
     "active": true
    },
    {
     "fs": "TAH",
     "icao": "TAH",
     "name": "Air Moorea",
     "active": true
    },
    {
     "fs": "AG",
     "iata": "AG",
     "icao": "ABR",
     "name": "Air Contractors",
     "active": true
    },
    {
     "fs": "AP",
     "iata": "AP",
     "icao": "ADH",
     "name": "Air One",
     "active": true
    },
    {
     "fs": "4G",
     "iata": "4G",
     "icao": "GZP",
     "name": "Gazpromavia",
     "active": true
    },
    {
     "fs": "D8*",
     "iata": "D8",
     "icao": "IBK",
     "name": "Norwegian Air International",
     "active": true
    },
    {
     "fs": "PRW",
     "iata": "6F",
     "icao": "PRW",
     "name": "Primera Air Nordic",
     "active": true
    },
    {
     "fs": "RAC",
     "icao": "RAC",
     "name": "Ryukyu Air Commuter",
     "active": true
    },
    {
     "fs": "NS",
     "iata": "NS",
     "icao": "HBH",
     "name": "Hebei Airlines",
     "active": true
    },
    {
     "fs": "J0",
     "iata": "J0",
     "icao": "JLX",
     "name": "Jet Link Express",
     "active": true
    },
    {
     "fs": "UW*",
     "iata": "UW",
     "name": "Uni-Top Airlines",
     "active": true
    },
    {
     "fs": "5F*",
     "iata": "5F",
     "icao": "ODM",
     "name": "Pan African Airways",
     "active": true
    },
    {
     "fs": "UMK",
     "iata": "2N",
     "icao": "UMK",
     "name": "Yuzmashavia",
     "active": true
    },
    {
     "fs": "EAK",
     "iata": "6Z",
     "icao": "EAK",
     "name": "Euro-Asia Air",
     "active": true
    },
    {
     "fs": "SE",
     "iata": "SE",
     "icao": "XLF",
     "name": "XL Airways France",
     "active": true
    },
    {
     "fs": "TBZ",
     "icao": "TBZ",
     "name": "ATA Airlines",
     "active": true
    },
    {
     "fs": "MHV",
     "iata": "M2",
     "icao": "MHV",
     "name": "MHS Aviation",
     "active": true
    },
    {
     "fs": "SHT",
     "icao": "SHT",
     "name": "British Airways Shuttle",
     "active": true
    },
    {
     "fs": "NC",
     "iata": "NC",
     "icao": "NAC",
     "name": "Northern Air Cargo",
     "active": true
    },
    {
     "fs": "RV*",
     "iata": "RV",
     "icao": "ROU",
     "name": "Air Canada rouge",
     "active": true
    },
    {
     "fs": "YB*",
     "iata": "YB",
     "icao": "BRJ",
     "name": "Bora Jet",
     "active": true
    },
    {
     "fs": "GX*",
     "iata": "GX",
     "name": "Guangxi Beibu Gulf Airlines",
     "active": true
    },
    {
     "fs": "BGM",
     "iata": "2B",
     "icao": "BGM",
     "name": "Ak Bars Aero",
     "active": true
    },
    {
     "fs": "2L",
     "iata": "2L",
     "icao": "OAW",
     "name": "Helvetic Airways",
     "active": true
    },
    {
     "fs": "NE*",
     "iata": "NE",
     "icao": "NMA",
     "name": "Nesma Airlines",
     "active": true
    },
    {
     "fs": "OC",
     "iata": "OC",
     "icao": "ORC",
     "name": "Oriental Air Bridge",
     "active": true
    },
    {
     "fs": "RXP",
     "icao": "RXP",
     "name": "RAM Express",
     "active": true
    },
    {
     "fs": "SLD",
     "icao": "SLD",
     "name": "Silver Air",
     "active": true
    },
    {
     "fs": "PE*",
     "iata": "PE",
     "icao": "PAQ",
     "name": "Pacific Air Express",
     "active": true
    },
    {
     "fs": "AJI",
     "iata": "7Z",
     "icao": "AJI",
     "name": "Ameristar Jet Charter",
     "active": true
    },
    {
     "fs": "TEZ",
     "icao": "TEZ",
     "name": "Tez Jet",
     "active": true
    },
    {
     "fs": "VJC",
     "iata": "VJ",
     "icao": "VJC",
     "name": "VietJet Air",
     "active": true
    },
    {
     "fs": "ACP",
     "iata": "8V",
     "icao": "ACP",
     "name": "Astral Aviation",
     "active": true
    },
    {
     "fs": "AB",
     "iata": "AB",
     "icao": "BER",
     "name": "Air Berlin",
     "active": true
    },
    {
     "fs": "ATV",
     "icao": "ATV",
     "name": "Avanti Air",
     "active": true
    },
    {
     "fs": "SYA",
     "iata": "FS",
     "icao": "SYA",
     "name": "Syphax Airlines",
     "active": true
    },
    {
     "fs": "ETR",
     "iata": "E4",
     "icao": "ETR",
     "name": "Estelar",
     "active": true
    },
    {
     "fs": "ECO",
     "iata": "8J",
     "icao": "ECO",
     "name": "EcoJet",
     "active": true
    },
    {
     "fs": "XG",
     "iata": "XG",
     "icao": "SXD",
     "name": "SunExpress Deutschland",
     "active": true
    },
    {
     "fs": "MML",
     "iata": "MR",
     "icao": "MML",
     "name": "Hunnu Air",
     "active": true
    },
    {
     "fs": "CA",
     "iata": "CA",
     "icao": "CCA",
     "name": "Air China",
     "phoneNumber": "1-800-986-1985",
     "active": true
    },
    {
     "fs": "I5*",
     "iata": "I5",
     "name": "AirAsia India",
     "active": true
    },
    {
     "fs": "GM*",
     "iata": "GM",
     "icao": "GSW",
     "name": "Germania Flug",
     "active": true
    },
    {
     "fs": "3H",
     "iata": "3H",
     "icao": "AIE",
     "name": "Air Inuit",
     "active": true
    },
    {
     "fs": "WJ",
     "iata": "WJ",
     "icao": "LAL",
     "name": "Air Labrador",
     "active": true
    },
    {
     "fs": "AC",
     "iata": "AC",
     "icao": "ACA",
     "name": "Air Canada",
     "phoneNumber": "1-800-247-2262",
     "active": true
    },
    {
     "fs": "MD",
     "iata": "MD",
     "icao": "MDG",
     "name": "Air Madagascar",
     "active": true
    },
    {
     "fs": "FJ",
     "iata": "FJ",
     "icao": "FJI",
     "name": "Fiji Airways",
     "phoneNumber": "1-800-227-4446",
     "active": true
    },
    {
     "fs": "CW",
     "iata": "CW",
     "icao": "MRS",
     "name": "Air Marshall Islands",
     "phoneNumber": "1-692-625-3733",
     "active": true
    },
    {
     "fs": "HAY",
     "iata": "HK",
     "icao": "HAY",
     "name": "Hamburg Airways",
     "active": true
    },
    {
     "fs": "TVP",
     "iata": "3Z",
     "icao": "TVP",
     "name": "Travel Service Polska",
     "active": true
    },
    {
     "fs": "VOE",
     "iata": "V7",
     "icao": "VOE",
     "name": "Volotea",
     "active": true
    },
    {
     "fs": "AMF",
     "iata": "A8",
     "icao": "AMF",
     "name": "Ameriflight",
     "active": true
    },
    {
     "fs": "U7",
     "iata": "U7",
     "icao": "UGB",
     "name": "Air Uganda",
     "active": true
    },
    {
     "fs": "QD*",
     "iata": "QD",
     "name": "Dobrolet",
     "active": true
    },
    {
     "fs": "VGO",
     "iata": "E3",
     "icao": "VGO",
     "name": "NewGen Airways",
     "active": true
    },
    {
     "fs": "TRQ",
     "iata": "3T",
     "icao": "TRQ",
     "name": "Tarco Air",
     "active": true
    },
    {
     "fs": "ASY",
     "icao": "ASY",
     "name": "Royal Australian Air Force",
     "active": true
    },
    {
     "fs": "NZ",
     "iata": "NZ",
     "icao": "ANZ",
     "name": "Air New Zealand",
     "phoneNumber": "1-800-262-1234",
     "active": true
    },
    {
     "fs": "PX",
     "iata": "PX",
     "icao": "ANG",
     "name": "Air Niugini",
     "active": true
    },
    {
     "fs": "YW",
     "iata": "YW",
     "icao": "ANE",
     "name": "Air Nostrum",
     "active": true
    },
    {
     "fs": "FL",
     "iata": "FL",
     "icao": "TRS",
     "name": "AirTran",
     "phoneNumber": "1-800-247-8726",
     "active": true
    },
    {
     "fs": "ED*",
     "iata": "ED",
     "icao": "AXE",
     "name": "Air Explore",
     "active": true
    },
    {
     "fs": "XOJ",
     "icao": "XOJ",
     "name": "XOJET",
     "active": true
    },
    {
     "fs": "WW*",
     "iata": "WW",
     "icao": "WOW",
     "name": "WOW Air",
     "active": true
    },
    {
     "fs": "BG",
     "iata": "BG",
     "icao": "BBC",
     "name": "Biman Bangladesh Airlines",
     "active": true
    },
    {
     "fs": "CLJ",
     "icao": "CLJ",
     "name": "Cello Aviation",
     "active": true
    },
    {
     "fs": "AS",
     "iata": "AS",
     "icao": "ASA",
     "name": "Alaska Airlines",
     "phoneNumber": "1-800-252-7522",
     "active": true
    },
    {
     "fs": "B5",
     "iata": "B5",
     "icao": "EXZ",
     "name": "Fly SAX",
     "active": true
    },
    {
     "fs": "DJT",
     "iata": "B0",
     "icao": "DJT",
     "name": "La Compagnie",
     "active": true
    },
    {
     "fs": "BM",
     "iata": "BM",
     "icao": "BMR",
     "name": "bmi Regional",
     "active": true
    },
    {
     "fs": "EH",
     "iata": "EH",
     "icao": "AKX",
     "name": "ANA Wings",
     "active": true
    },
    {
     "fs": "JN*",
     "iata": "JN",
     "icao": "NLV",
     "name": "New Livingston",
     "active": true
    },
    {
     "fs": "DFL",
     "icao": "DFL",
     "name": "Directflight Limited",
     "active": true
    },
    {
     "fs": "AQ*",
     "iata": "AQ",
     "name": "9 Air Co",
     "active": true
    },
    {
     "fs": "S9",
     "iata": "S9",
     "icao": "IKM",
     "name": "Starbow",
     "active": true
    },
    {
     "fs": "BC",
     "iata": "BC",
     "icao": "SKY",
     "name": "Skymark Airlines",
     "active": true
    },
    {
     "fs": "OS",
     "iata": "OS",
     "icao": "AUA",
     "name": "Austrian",
     "active": true
    },
    {
     "fs": "LB*",
     "iata": "LB",
     "name": "Air Costa",
     "active": true
    },
    {
     "fs": "CJ",
     "iata": "CJ",
     "icao": "CFE",
     "name": "BA CityFlyer",
     "active": true
    },
    {
     "fs": "Z7*",
     "iata": "Z7",
     "icao": "FZW",
     "name": "Fly Africa Zimbabwe",
     "active": true
    },
    {
     "fs": "BA",
     "iata": "BA",
     "icao": "BAW",
     "name": "British Airways",
     "phoneNumber": "1-800-AIRWAYS",
     "active": true
    },
    {
     "fs": "0B",
     "iata": "0B",
     "icao": "BMS",
     "name": "Blue Air",
     "active": true
    },
    {
     "fs": "EVE",
     "iata": "E9",
     "icao": "EVE",
     "name": "Evelop Airlines",
     "active": true
    },
    {
     "fs": "C5",
     "iata": "C5",
     "icao": "UCA",
     "name": "CommutAir",
     "active": true
    },
    {
     "fs": "NT",
     "iata": "NT",
     "icao": "IBB",
     "name": "Binter Canarias",
     "active": true
    },
    {
     "fs": "CUO",
     "icao": "CUO",
     "name": "Aero Cuahonte",
     "active": true
    },
    {
     "fs": "SO*",
     "iata": "SO",
     "name": "Apex Airline",
     "active": true
    },
    {
     "fs": "KF",
     "iata": "KF",
     "icao": "BLF",
     "name": "Blue1",
     "active": true
    },
    {
     "fs": "SBW",
     "icao": "SBW",
     "name": "Snowbird Airlines",
     "active": true
    },
    {
     "fs": "D9",
     "iata": "D9",
     "icao": "DNV",
     "name": "Donavia",
     "active": true
    },
    {
     "fs": "JA",
     "iata": "JA",
     "icao": "BON",
     "name": "B&H Airlines",
     "active": true
    },
    {
     "fs": "CX",
     "iata": "CX",
     "icao": "CPA",
     "name": "Cathay Pacific",
     "active": true
    },
    {
     "fs": "SN",
     "iata": "SN",
     "icao": "BEL",
     "name": "Brussels Airlines",
     "active": true
    },
    {
     "fs": "I4*",
     "iata": "I4",
     "name": "Island Air Express",
     "active": true
    },
    {
     "fs": "C6",
     "iata": "C6",
     "icao": "CJA",
     "name": "CanJet Airlines",
     "active": true
    },
    {
     "fs": "MU",
     "iata": "MU",
     "icao": "CES",
     "name": "China Eastern Airlines",
     "active": true
    },
    {
     "fs": "GK",
     "iata": "GK",
     "icao": "JJP",
     "name": "Jetstar Japan",
     "active": true
    },
    {
     "fs": "4C*",
     "iata": "C4",
     "icao": "CGK",
     "name": "Click Airways",
     "active": true
    },
    {
     "fs": "CL",
     "iata": "CL",
     "icao": "CLH",
     "name": "Lufthansa CityLine",
     "active": true
    },
    {
     "fs": "CN",
     "iata": "CN",
     "icao": "GDC",
     "name": "Grand China Air",
     "active": true
    },
    {
     "fs": "CZ",
     "iata": "CZ",
     "icao": "CSN",
     "name": "China Southern Airlines",
     "active": true
    },
    {
     "fs": "FIV",
     "icao": "FIV",
     "name": "CitationAir",
     "active": true
    },
    {
     "fs": "BS*",
     "iata": "BS",
     "name": "US-Bangla Airlines",
     "active": true
    },
    {
     "fs": "DE",
     "iata": "DE",
     "icao": "CFG",
     "name": "Condor",
     "active": true
    },
    {
     "fs": "AGY",
     "iata": "EO",
     "icao": "AGY",
     "name": "Air Go Egypt",
     "active": true
    },
    {
     "fs": "A2",
     "iata": "A2",
     "icao": "CIU",
     "name": "Cielos Del Peru",
     "active": true
    },
    {
     "fs": "OK",
     "iata": "OK",
     "icao": "CSA",
     "name": "CSA",
     "active": true
    },
    {
     "fs": "GTA",
     "iata": "E8",
     "icao": "GTA",
     "name": "City Airways",
     "active": true
    },
    {
     "fs": "D7",
     "iata": "D7",
     "icao": "XAX",
     "name": "AirAsia X",
     "active": true
    },
    {
     "fs": "KEM",
     "iata": "5Z",
     "icao": "KEM",
     "name": "CemAir",
     "active": true
    },
    {
     "fs": "O3",
     "iata": "O3",
     "icao": "CSS",
     "name": "SF Airlines",
     "active": true
    },
    {
     "fs": "DTS",
     "iata": "DH",
     "icao": "DTS",
     "name": "Douniah Airlines",
     "active": true
    },
    {
     "fs": "EB",
     "iata": "EB",
     "icao": "PLM",
     "name": "Pullmantur Air",
     "active": true
    },
    {
     "fs": "U2",
     "iata": "U2",
     "icao": "EZY",
     "name": "easyJet",
     "active": true
    },
    {
     "fs": "EXT",
     "icao": "EXT",
     "name": "Nightexpress",
     "active": true
    },
    {
     "fs": "PTG",
     "icao": "PTG",
     "name": "PrivatAir Germany",
     "active": true
    },
    {
     "fs": "KTK",
     "iata": "ZF",
     "icao": "KTK",
     "name": "Katekavia",
     "active": true
    },
    {
     "fs": "NIN",
     "iata": "6N",
     "icao": "NIN",
     "name": "Niger Airlines",
     "active": true
    },
    {
     "fs": "FTZ",
     "iata": "FN",
     "icao": "FTZ",
     "name": "Fastjet",
     "active": true
    },
    {
     "fs": "M4*",
     "iata": "M4",
     "icao": "SME",
     "name": "Smart Aviation",
     "active": true
    },
    {
     "fs": "DAT",
     "icao": "DAT",
     "name": "Dart Airlines",
     "active": true
    },
    {
     "fs": "OBS",
     "iata": "6O",
     "icao": "OBS",
     "name": "Orbest S.A.",
     "active": true
    },
    {
     "fs": "7Z",
     "iata": "7Z",
     "icao": "HCV",
     "name": "Halcyonair",
     "active": true
    },
    {
     "fs": "HR",
     "iata": "HR",
     "icao": "HHN",
     "name": "Hahn Air",
     "active": true
    },
    {
     "fs": "OMT",
     "iata": "CC",
     "icao": "OMT",
     "name": "CM Airlines",
     "active": true
    },
    {
     "fs": "3R",
     "iata": "3R",
     "icao": "GAI",
     "name": "Moskovia Airlines",
     "active": true
    },
    {
     "fs": "GBQ",
     "iata": "3G",
     "icao": "GBQ",
     "name": "Gambia Bird",
     "active": true
    },
    {
     "fs": "M7",
     "iata": "M7",
     "icao": "MSL",
     "name": "Marsland Aviation",
     "active": true
    },
    {
     "fs": "6P",
     "iata": "6P",
     "icao": "GRF",
     "name": "Gryphon Airlines",
     "active": true
    },
    {
     "fs": "JY",
     "iata": "JY",
     "icao": "IWY",
     "name": "interCaribbean Airways",
     "active": true
    },
    {
     "fs": "SPN",
     "iata": "H8",
     "icao": "SPN",
     "name": "Sepahan Airlines",
     "active": true
    },
    {
     "fs": "PL*",
     "iata": "PL",
     "name": "Southern Air Charter",
     "active": true
    },
    {
     "fs": "GV",
     "iata": "GV",
     "icao": "GUN",
     "name": "Grant Aviation",
     "active": true
    },
    {
     "fs": "HN*",
     "iata": "HN",
     "icao": "HVY",
     "name": "Heavylift Cargo",
     "active": true
    },
    {
     "fs": "ENT",
     "iata": "E4",
     "icao": "ENT",
     "name": "Enter Air",
     "active": true
    },
    {
     "fs": "HTG",
     "icao": "HTG",
     "name": "Grossman Air Service",
     "active": true
    },
    {
     "fs": "H3",
     "iata": "H3",
     "name": "Harbour Air",
     "active": true
    },
    {
     "fs": "HKI",
     "icao": "HKI",
     "name": "Hawkaire",
     "active": true
    },
    {
     "fs": "YO",
     "iata": "YO",
     "icao": "MCM",
     "name": "Heli Air Monaco",
     "active": true
    },
    {
     "fs": "LIZ",
     "iata": "Q9",
     "icao": "LIZ",
     "name": "Air Liaison",
     "active": true
    },
    {
     "fs": "KH",
     "iata": "KH",
     "icao": "AAH",
     "name": "Aloha Air Cargo",
     "active": true
    },
    {
     "fs": "RJD",
     "iata": "RG",
     "icao": "RJD",
     "name": "Rotana Jet",
     "active": true
    },
    {
     "fs": "RQ",
     "iata": "RQ",
     "icao": "KMF",
     "name": "Kam Air",
     "active": true
    },
    {
     "fs": "QX",
     "iata": "QX",
     "icao": "QXE",
     "name": "Horizon Air",
     "active": true
    },
    {
     "fs": "IB",
     "iata": "IB",
     "icao": "IBE",
     "name": "Iberia",
     "active": true
    },
    {
     "fs": "IRQ",
     "iata": "QB",
     "icao": "IRQ",
     "name": "Qeshm Air",
     "active": true
    },
    {
     "fs": "CMV",
     "iata": "3C",
     "icao": "CMV",
     "name": "Calima Aviacion",
     "active": true
    },
    {
     "fs": "ID*",
     "iata": "ID",
     "icao": "BTK",
     "name": "Batik Air",
     "active": true
    },
    {
     "fs": "KHK",
     "iata": "KW",
     "icao": "KHK",
     "name": "Kharkiv Airlines",
     "active": true
    },
    {
     "fs": "P2",
     "iata": "P2",
     "icao": "XAK",
     "name": "Airkenya",
     "active": true
    },
    {
     "fs": "LZ",
     "iata": "LZ",
     "icao": "LBY",
     "name": "Belle Air",
     "active": true
    },
    {
     "fs": "JL",
     "iata": "JL",
     "icao": "JAL",
     "name": "JAL",
     "active": true
    },
    {
     "fs": "EKA",
     "iata": "E7",
     "icao": "EKA",
     "name": "Equaflight Service",
     "active": true
    },
    {
     "fs": "JC",
     "icao": "JEX",
     "name": "JAL Express",
     "active": true
    },
    {
     "fs": "MBB",
     "iata": "ZM",
     "icao": "MBB",
     "name": "Air Manas",
     "active": true
    },
    {
     "fs": "TL*",
     "iata": "TL",
     "icao": "ANO",
     "name": "Airnorth",
     "active": true
    },
    {
     "fs": "5A",
     "iata": "5A",
     "icao": "AIP",
     "name": "Alpine Air Express",
     "active": true
    },
    {
     "fs": "LLP",
     "iata": "P7",
     "icao": "LLP",
     "name": "Small Planet Airlines Polska",
     "active": true
    },
    {
     "fs": "B6",
     "iata": "B6",
     "icao": "JBU",
     "name": "JetBlue Airways",
     "active": true
    },
    {
     "fs": "6L",
     "iata": "6L",
     "icao": "AKK",
     "name": "Aklak Air",
     "active": true
    },
    {
     "fs": "CQN",
     "iata": "OQ",
     "icao": "CQN",
     "name": "Chongqing Airlines",
     "active": true
    },
    {
     "fs": "MXD",
     "iata": "OD",
     "icao": "MXD",
     "name": "Malindo Air",
     "active": true
    },
    {
     "fs": "X5*",
     "iata": "X5",
     "icao": "OTJ",
     "name": "Ten Airways",
     "active": true
    },
    {
     "fs": "KL",
     "iata": "KL",
     "icao": "KLM",
     "name": "KLM",
     "active": true
    },
    {
     "fs": "LA",
     "iata": "LA",
     "icao": "LAN",
     "name": "LAN Airlines",
     "active": true
    },
    {
     "fs": "VVC",
     "iata": "5Z",
     "icao": "VVC",
     "name": "VivaColombia",
     "active": true
    },
    {
     "fs": "P8",
     "iata": "P8",
     "icao": "MKG",
     "name": "Air Mekong",
     "active": true
    },
    {
     "fs": "P3",
     "iata": "2Z",
     "icao": "PTB",
     "name": "Passaredo",
     "active": true
    },
    {
     "fs": "J5",
     "iata": "J5",
     "name": "Alaska Seaplanes",
     "active": true
    },
    {
     "fs": "2D*",
     "iata": "2D",
     "icao": "DYA",
     "name": "Dynamic Airways",
     "active": true
    },
    {
     "fs": "Q2",
     "iata": "Q2",
     "icao": "DQA",
     "name": "Maldivian",
     "active": true
    },
    {
     "fs": "LO",
     "iata": "LO",
     "icao": "LOT",
     "name": "LOT - Polish Airlines",
     "active": true
    },
    {
     "fs": "4M",
     "iata": "4M",
     "icao": "DSM",
     "name": "Lan Argentina",
     "active": true
    },
    {
     "fs": "AAZ",
     "icao": "AAZ",
     "name": "Aeolus Air",
     "active": true
    },
    {
     "fs": "YV",
     "iata": "YV",
     "icao": "ASH",
     "name": "Mesa Airlines",
     "active": true
    },
    {
     "fs": "TTW",
     "iata": "IT",
     "icao": "TTW",
     "name": "Tigerair Taiwan",
     "active": true
    },
    {
     "fs": "SJO",
     "iata": "IJ",
     "icao": "SJO",
     "name": "Spring Airlines Japan",
     "active": true
    },
    {
     "fs": "MH",
     "iata": "MH",
     "icao": "MAS",
     "name": "Malaysia Airlines",
     "active": true
    },
    {
     "fs": "P9",
     "iata": "P9",
     "icao": "PVN",
     "name": "Peruvian Airlines",
     "active": true
    },
    {
     "fs": "PAO",
     "icao": "PAO",
     "name": "Polynesian Airlines",
     "active": true
    },
    {
     "fs": "BRH",
     "icao": "BRH",
     "name": "Star Air",
     "active": true
    },
    {
     "fs": "HG",
     "iata": "HG",
     "icao": "NLY",
     "name": "NIKI",
     "active": true
    },
    {
     "fs": "PD",
     "iata": "PD",
     "icao": "POE",
     "name": "Porter Airlines",
     "active": true
    },
    {
     "fs": "CTV",
     "iata": "QG",
     "icao": "CTV",
     "name": "Citilink",
     "active": true
    },
    {
     "fs": "I2",
     "iata": "I2",
     "icao": "IBS",
     "name": "Iberia Express",
     "active": true
    },
    {
     "fs": "HN",
     "iata": "HN",
     "name": "Afghan Jet International",
     "active": true
    },
    {
     "fs": "MMZ",
     "iata": "YU",
     "icao": "MMZ",
     "name": "euroAtlantic Airways",
     "active": true
    },
    {
     "fs": "T2*",
     "iata": "T2",
     "name": "Nakina Air Service",
     "active": true
    },
    {
     "fs": "UE",
     "iata": "UE",
     "name": "NasAir (Eritrea)",
     "active": true
    },
    {
     "fs": "8M",
     "iata": "8M",
     "icao": "MMA",
     "name": "Myanmar Airways International",
     "active": true
    },
    {
     "fs": "ZB",
     "iata": "ZB",
     "icao": "MON",
     "name": "Monarch Airlines",
     "active": true
    },
    {
     "fs": "RA",
     "iata": "RA",
     "icao": "RNA",
     "name": "Nepal Airlines",
     "active": true
    },
    {
     "fs": "EJ",
     "iata": "EJ",
     "icao": "NEA",
     "name": "New England Airlines",
     "active": true
    },
    {
     "fs": "MWA",
     "iata": "WV",
     "icao": "MWA",
     "name": "Midwest Airlines",
     "active": true
    },
    {
     "fs": "QL",
     "iata": "QL",
     "icao": "LER",
     "name": "LASER Airlines",
     "active": true
    },
    {
     "fs": "PEV",
     "iata": "PE",
     "icao": "PEV",
     "name": "Peoples Viennaline",
     "active": true
    },
    {
     "fs": "PO",
     "iata": "PO",
     "icao": "PAC",
     "name": "Polar Air Cargo",
     "active": true
    },
    {
     "fs": "EG*",
     "iata": "EG",
     "icao": "ENJ",
     "name": "Enerjet",
     "active": true
    },
    {
     "fs": "O8*",
     "iata": "O8",
     "icao": "SQM",
     "name": "Siam Air",
     "active": true
    },
    {
     "fs": "JT*",
     "iata": "JT",
     "icao": "LNI",
     "name": "Lion Air",
     "active": true
    },
    {
     "fs": "PN",
     "iata": "PN",
     "icao": "CHB",
     "name": "West Air (China)",
     "active": true
    },
    {
     "fs": "PM",
     "iata": "PM",
     "icao": "CNF",
     "name": "Canary Fly",
     "active": true
    },
    {
     "fs": "R2",
     "iata": "R2",
     "icao": "ORB",
     "name": "ORENAIR",
     "active": true
    },
    {
     "fs": "P0",
     "iata": "P0",
     "icao": "PFZ",
     "name": "Proflight Zambia",
     "active": true
    },
    {
     "fs": "RIE",
     "icao": "RIE",
     "name": "Ariella Airlines",
     "active": true
    },
    {
     "fs": "PSW",
     "icao": "PSW",
     "name": "Pskovavia",
     "active": true
    },
    {
     "fs": "QH",
     "iata": "QH",
     "icao": "LYN",
     "name": "Air Kyrgyzstan",
     "active": true
    },
    {
     "fs": "PDT",
     "icao": "PDT",
     "name": "Piedmont Airlines",
     "active": true
    },
    {
     "fs": "QF",
     "iata": "QF",
     "icao": "QFA",
     "name": "Qantas",
     "active": true
    },
    {
     "fs": "WH*",
     "iata": "WH",
     "icao": "WSF",
     "name": "Westair Benin",
     "active": true
    },
    {
     "fs": "9E",
     "iata": "9E",
     "icao": "FLG",
     "name": "Endeavor Air",
     "active": true
    },
    {
     "fs": "WE*",
     "iata": "WE",
     "icao": "THD",
     "name": "Thai Smile",
     "active": true
    },
    {
     "fs": "VY",
     "iata": "VY",
     "icao": "VLG",
     "name": "Vueling",
     "active": true
    },
    {
     "fs": "RX",
     "iata": "RX",
     "icao": "RGE",
     "name": "Regent Airways",
     "active": true
    },
    {
     "fs": "YS",
     "iata": "YS",
     "icao": "RAE",
     "name": "HOP!-REGIONAL",
     "active": true
    },
    {
     "fs": "8L*",
     "iata": "8L",
     "icao": "RHC",
     "name": "Redhill Aviation",
     "active": true
    },
    {
     "fs": "PAG",
     "iata": "YP",
     "icao": "PAG",
     "name": "Perimeter Aviation",
     "active": true
    },
    {
     "fs": "M8*",
     "iata": "M8",
     "name": "Skyjet",
     "active": true
    },
    {
     "fs": "JIA",
     "icao": "JIA",
     "name": "PSA Airlines",
     "active": true
    },
    {
     "fs": "MTL",
     "icao": "MTL",
     "name": "RAF-Avia",
     "active": true
    },
    {
     "fs": "RKM",
     "iata": "RT",
     "icao": "RKM",
     "name": "RAK Airways",
     "active": true
    },
    {
     "fs": "RIG",
     "icao": "RIG",
     "name": "Riga Airlines",
     "active": true
    },
    {
     "fs": "R0",
     "iata": "R0",
     "icao": "RPK",
     "name": "Royal Airlines",
     "active": true
    },
    {
     "fs": "RSC",
     "icao": "RSC",
     "name": "Canarias Airlines",
     "active": true
    },
    {
     "fs": "RR",
     "iata": "RR",
     "icao": "RFR",
     "name": "Royal Air Force",
     "active": true
    },
    {
     "fs": "XZ",
     "iata": "XZ",
     "icao": "EXY",
     "name": "SA Express",
     "active": true
    },
    {
     "fs": "4Q",
     "iata": "4Q",
     "icao": "SFW",
     "name": "Safi Airways",
     "active": true
    },
    {
     "fs": "4Z",
     "iata": "4Z",
     "icao": "LNK",
     "name": "Airlink (South Africa)",
     "active": true
    },
    {
     "fs": "RFJ",
     "iata": "RL",
     "icao": "RFJ",
     "name": "Royal Falcon",
     "active": true
    },
    {
     "fs": "7R",
     "iata": "7R",
     "icao": "RLU",
     "name": "RusLine",
     "active": true
    },
    {
     "fs": "AT",
     "iata": "AT",
     "icao": "RAM",
     "name": "Royal Air Maroc",
     "active": true
    },
    {
     "fs": "VU*",
     "iata": "VU",
     "icao": "VAR",
     "name": "VECA",
     "active": true
    },
    {
     "fs": "RZA",
     "icao": "RZA",
     "name": "Royal Zimbabwe Airlines",
     "active": true
    },
    {
     "fs": "RU",
     "iata": "RU",
     "icao": "ABW",
     "name": "AirBridgeCargo",
     "active": true
    },
    {
     "fs": "SK",
     "iata": "SK",
     "icao": "SAS",
     "name": "SAS",
     "active": true
    },
    {
     "fs": "KDS",
     "icao": "KDS",
     "name": "Makani Kai Air",
     "active": true
    },
    {
     "fs": "RI",
     "iata": "RI",
     "icao": "MDL",
     "name": "Tigerair Mandala",
     "active": true
    },
    {
     "fs": "FR",
     "iata": "FR",
     "icao": "RYR",
     "name": "Ryanair",
     "active": true
    },
    {
     "fs": "IW",
     "iata": "IW",
     "icao": "WON",
     "name": "Wings Air (Indonesia)",
     "active": true
    },
    {
     "fs": "5S*",
     "iata": "5S",
     "icao": "PSV",
     "name": "S.A.P.",
     "active": true
    },
    {
     "fs": "4A",
     "iata": "4A",
     "icao": "AMP",
     "name": "ATSA",
     "active": true
    },
    {
     "fs": "SGX",
     "icao": "SGX",
     "name": "Saga Airlines",
     "active": true
    },
    {
     "fs": "SIR",
     "icao": "SIR",
     "name": "Salair",
     "active": true
    },
    {
     "fs": "SV",
     "iata": "SV",
     "icao": "SVA",
     "name": "Saudia",
     "active": true
    },
    {
     "fs": "SNA",
     "icao": "SNA",
     "name": "Senator Aviation Charter",
     "active": true
    },
    {
     "fs": "I5",
     "iata": "I5",
     "icao": "CMM",
     "name": "Societe Nouvelle Air Mali",
     "active": true
    },
    {
     "fs": "SKK",
     "icao": "SLL",
     "name": "Skylink Aviation",
     "active": true
    },
    {
     "fs": "SMR",
     "iata": "SZ",
     "icao": "SMR",
     "name": "Somon Air",
     "active": true
    },
    {
     "fs": "8D*",
     "iata": "8D",
     "name": "Servant Air",
     "active": true
    },
    {
     "fs": "SNM",
     "icao": "SNM",
     "name": "Servizi Aerei",
     "active": true
    },
    {
     "fs": "OLS",
     "iata": "8R",
     "icao": "OLS",
     "name": "SOL",
     "active": true
    },
    {
     "fs": "G2*",
     "iata": "G2",
     "name": "Guinea Lineas Aereas",
     "active": true
    },
    {
     "fs": "JG*",
     "iata": "JG",
     "name": "JetGo Australia",
     "active": true
    },
    {
     "fs": "DKT",
     "icao": "DKT",
     "name": "Encore Air Cargo",
     "active": true
    },
    {
     "fs": "RD",
     "iata": "RN",
     "icao": "RYN",
     "name": "Ryan International Airlines",
     "active": true
    },
    {
     "fs": "SUA",
     "icao": "SUA",
     "name": "Silesia Air",
     "active": true
    },
    {
     "fs": "IK",
     "iata": "2G",
     "icao": "AGU",
     "name": "Angara Airlines",
     "active": true
    },
    {
     "fs": "SGG",
     "iata": "DN",
     "icao": "SGG",
     "name": "Senegal Airlines",
     "active": true
    },
    {
     "fs": "NP",
     "iata": "NP",
     "icao": "NIA",
     "name": "Nile Air",
     "active": true
    },
    {
     "fs": "SX",
     "iata": "SX",
     "icao": "SRK",
     "name": "SkyWork Airlines",
     "active": true
    },
    {
     "fs": "SIO",
     "icao": "SIO",
     "name": "Sirio",
     "active": true
    },
    {
     "fs": "JW*",
     "iata": "JW",
     "name": "Skippers Aviation",
     "active": true
    },
    {
     "fs": "SQ",
     "iata": "SQ",
     "icao": "SIA",
     "name": "Singapore Airlines",
     "active": true
    },
    {
     "fs": "UQ*",
     "iata": "UQ",
     "icao": "CUH",
     "name": "Urumqi Airlines",
     "active": true
    },
    {
     "fs": "SKL",
     "icao": "SKL",
     "name": "Skycharter",
     "active": true
    },
    {
     "fs": "OO",
     "iata": "OO",
     "icao": "SKW",
     "name": "SkyWest Airlines",
     "active": true
    },
    {
     "fs": "SSG",
     "icao": "SSG",
     "name": "Slovak Government Flying Service",
     "active": true
    },
    {
     "fs": "6Y",
     "iata": "6Y",
     "icao": "ART",
     "name": "SmartLynx Airlines",
     "active": true
    },
    {
     "fs": "RSE",
     "icao": "RSE",
     "name": "SNAS Aviation",
     "active": true
    },
    {
     "fs": "HH",
     "iata": "HH",
     "icao": "TBM",
     "name": "Taban Airlines",
     "active": true
    },
    {
     "fs": "EZ*",
     "iata": "EZ",
     "icao": "SUS",
     "name": "Sun-Air",
     "active": true
    },
    {
     "fs": "SUB",
     "icao": "SUB",
     "name": "Suburban Air Freight",
     "active": true
    },
    {
     "fs": "MAV",
     "icao": "MAV",
     "name": "Minoan Air",
     "active": true
    },
    {
     "fs": "SJ",
     "iata": "SJ",
     "icao": "SJY",
     "name": "Sriwijaya Air",
     "active": true
    },
    {
     "fs": "8F",
     "iata": "8F",
     "icao": "STP",
     "name": "STP Airways",
     "active": true
    },
    {
     "fs": "2I",
     "iata": "2I",
     "icao": "SRU",
     "name": "Star Peru",
     "active": true
    },
    {
     "fs": "SPW",
     "icao": "SPW",
     "name": "Speedwings",
     "active": true
    },
    {
     "fs": "SWQ",
     "iata": "Q7",
     "icao": "SWQ",
     "name": "Swift Air",
     "active": true
    },
    {
     "fs": "SG",
     "iata": "SG",
     "icao": "SEJ",
     "name": "SpiceJet",
     "active": true
    },
    {
     "fs": "P6*",
     "iata": "P6",
     "icao": "PVG",
     "name": "Privilege Style",
     "active": true
    },
    {
     "fs": "CNK",
     "icao": "CNK",
     "name": "Sunwest Aviation",
     "active": true
    },
    {
     "fs": "SO",
     "iata": "SO",
     "icao": "HKA",
     "name": "Superior Aviation",
     "active": true
    },
    {
     "fs": "TWB",
     "iata": "TW",
     "icao": "TWB",
     "name": "T'Way Air",
     "active": true
    },
    {
     "fs": "QY",
     "iata": "QY",
     "icao": "BCS",
     "name": "EAT Leipzig",
     "active": true
    },
    {
     "fs": "SWU",
     "icao": "SWU",
     "name": "Swiss Global Air Lines",
     "active": true
    },
    {
     "fs": "2U",
     "iata": "2U",
     "name": "Sun d'Or",
     "active": true
    },
    {
     "fs": "EKG",
     "iata": "L8",
     "icao": "EKG",
     "name": "Afric Aviation",
     "active": true
    },
    {
     "fs": "SRY",
     "iata": "VC",
     "icao": "SRY",
     "name": "Charter Air Transport",
     "active": true
    },
    {
     "fs": "TXZ",
     "iata": "EX",
     "icao": "TXZ",
     "name": "Thai Express",
     "active": true
    },
    {
     "fs": "KD*",
     "iata": "KD",
     "name": "Western Global",
     "active": true
    },
    {
     "fs": "AL*",
     "iata": "AL",
     "icao": "ALD",
     "name": "Air Leisure",
     "active": true
    },
    {
     "fs": "XQ",
     "iata": "XQ",
     "icao": "SXS",
     "name": "SunExpress",
     "active": true
    },
    {
     "fs": "WN",
     "iata": "WN",
     "icao": "SWA",
     "name": "Southwest Airlines",
     "phoneNumber": "1-800-435-9792",
     "active": true
    },
    {
     "fs": "TT",
     "iata": "TT",
     "name": "Tigerair Australia",
     "active": true
    },
    {
     "fs": "T0",
     "iata": "T0",
     "icao": "TPU",
     "name": "TACA Peru",
     "active": true
    },
    {
     "fs": "PZ",
     "iata": "PZ",
     "icao": "LAP",
     "name": "TAM",
     "active": true
    },
    {
     "fs": "MYX",
     "icao": "MYX",
     "name": "SmartLynx Airlines Estonia",
     "active": true
    },
    {
     "fs": "9D",
     "iata": "9D",
     "icao": "THE",
     "name": "Toumai Air",
     "active": true
    },
    {
     "fs": "UN",
     "iata": "UN",
     "icao": "TSO",
     "name": "Transaero Airlines",
     "active": true
    },
    {
     "fs": "3P",
     "iata": "3P",
     "icao": "TNM",
     "name": "Tiara Air Aruba",
     "active": true
    },
    {
     "fs": "7J",
     "iata": "7J",
     "icao": "TJK",
     "name": "Tajik Air",
     "active": true
    },
    {
     "fs": "TQ",
     "iata": "TQ",
     "icao": "TDM",
     "name": "Tandem Aero",
     "active": true
    },
    {
     "fs": "AX",
     "iata": "AX",
     "icao": "LOF",
     "name": "Trans States Airlines",
     "active": true
    },
    {
     "fs": "TP",
     "iata": "TP",
     "icao": "TAP",
     "name": "TAP Portugal",
     "active": true
    },
    {
     "fs": "SF",
     "iata": "SF",
     "icao": "DTH",
     "name": "Tassili Airlines",
     "active": true
    },
    {
     "fs": "TOM",
     "iata": "BY",
     "icao": "TOM",
     "name": "Thomson",
     "active": true
    },
    {
     "fs": "FC",
     "iata": "FC",
     "icao": "FCM",
     "name": "Flybe. Nordic",
     "active": true
    },
    {
     "fs": "TVR",
     "iata": "T6",
     "icao": "TVR",
     "name": "Tavrey Air Company",
     "active": true
    },
    {
     "fs": "PQ",
     "iata": "PQ",
     "icao": "APG",
     "name": "Philippines AirAsia",
     "active": true
    },
    {
     "fs": "TG",
     "iata": "TG",
     "icao": "THA",
     "name": "Thai Airways International",
     "active": true
    },
    {
     "fs": "7U*",
     "iata": "7U",
     "name": "Commercial Aviation Services",
     "active": true
    },
    {
     "fs": "JJ",
     "iata": "JJ",
     "icao": "TAM",
     "name": "TAM Linhas Aereas",
     "active": true
    },
    {
     "fs": "3V",
     "iata": "3V",
     "icao": "TAY",
     "name": "TNT Airways",
     "active": true
    },
    {
     "fs": "T7",
     "iata": "T7",
     "icao": "TJT",
     "name": "Twin Jet",
     "active": true
    },
    {
     "fs": "GE",
     "iata": "GE",
     "icao": "TNA",
     "name": "TransAsia Airways",
     "active": true
    },
    {
     "fs": "TO",
     "iata": "TO",
     "icao": "TVF",
     "name": "Transavia France",
     "active": true
    },
    {
     "fs": "7O",
     "iata": "7O",
     "icao": "TVL",
     "name": "Travel Service Hungary",
     "active": true
    },
    {
     "fs": "VQ*",
     "iata": "VQ",
     "icao": "NVQ",
     "name": "Novoair",
     "active": true
    },
    {
     "fs": "TGO",
     "icao": "TGO",
     "name": "Transport Canada",
     "active": true
    },
    {
     "fs": "HV",
     "iata": "HV",
     "icao": "TRA",
     "name": "Transavia",
     "active": true
    },
    {
     "fs": "T4",
     "iata": "T4",
     "icao": "TIB",
     "name": "TRIP Linhas Aereas",
     "active": true
    },
    {
     "fs": "ZR",
     "iata": "ZR",
     "name": "Punto Azul",
     "active": true
    },
    {
     "fs": "8S",
     "iata": "8S",
     "name": "Turbojet",
     "active": true
    },
    {
     "fs": "TWJ",
     "icao": "TWJ",
     "name": "Twinjet Aviation",
     "active": true
    },
    {
     "fs": "TMG",
     "iata": "GM",
     "icao": "TMG",
     "name": "Tri-MG Intra Asia Airlines",
     "active": true
    },
    {
     "fs": "O3*",
     "iata": "O3",
     "name": "Orange Air",
     "active": true
    },
    {
     "fs": "TK",
     "iata": "TK",
     "icao": "THY",
     "name": "Turkish Airlines",
     "active": true
    },
    {
     "fs": "VRE",
     "iata": "HF",
     "icao": "VRE",
     "name": "Air Cote D'Ivoire",
     "active": true
    },
    {
     "fs": "EAB",
     "iata": "E2",
     "icao": "EAB",
     "name": "Eagle Atlantic Airlines",
     "active": true
    },
    {
     "fs": "US",
     "iata": "US",
     "icao": "AWE",
     "name": "US Airways",
     "phoneNumber": "1-800-943-5436",
     "active": true
    },
    {
     "fs": "LOG",
     "iata": "LM",
     "icao": "LOG",
     "name": "Loganair",
     "active": true
    },
    {
     "fs": "XW*",
     "iata": "XW",
     "icao": "NCT",
     "name": "NokScoot",
     "active": true
    },
    {
     "fs": "FGE",
     "iata": "9Y",
     "icao": "FGE",
     "name": "Fly Georgia",
     "active": true
    },
    {
     "fs": "F5*",
     "iata": "F5",
     "name": "Fly540 Angola",
     "active": true
    },
    {
     "fs": "BU*",
     "iata": "BU",
     "name": "CAA",
     "active": true
    },
    {
     "fs": "IY",
     "iata": "IY",
     "icao": "IYE",
     "name": "Yemenia",
     "active": true
    },
    {
     "fs": "W6",
     "iata": "W6",
     "icao": "WZZ",
     "name": "Wizz Air",
     "active": true
    },
    {
     "fs": "GHN",
     "iata": "AG",
     "icao": "GHN",
     "name": "Air Ghana",
     "active": true
    },
    {
     "fs": "WEW",
     "icao": "WEW",
     "name": "Pronto Airways",
     "active": true
    },
    {
     "fs": "WM",
     "iata": "WM",
     "icao": "WIA",
     "name": "Winair",
     "active": true
    },
    {
     "fs": "WSG",
     "iata": "WT",
     "icao": "WSG",
     "name": "Wasaya Airways",
     "active": true
    },
    {
     "fs": "WU",
     "iata": "WU",
     "icao": "WAU",
     "name": "Wizz Air Ukraine",
     "active": true
    },
    {
     "fs": "ANR",
     "iata": "YE",
     "icao": "ANR",
     "name": "YanAir",
     "active": true
    },
    {
     "fs": "9Q*",
     "iata": "9Q",
     "icao": "CXE",
     "name": "Caicos Express Airways",
     "active": true
    },
    {
     "fs": "WS",
     "iata": "WS",
     "icao": "WJA",
     "name": "WestJet",
     "active": true
    },
    {
     "fs": "WF",
     "iata": "WF",
     "icao": "WIF",
     "name": "Wideroe",
     "active": true
    },
    {
     "fs": "MF",
     "iata": "MF",
     "icao": "CXA",
     "name": "Xiamen Airlines",
     "active": true
    },
    {
     "fs": "IP*",
     "iata": "IP",
     "name": "Apsara International",
     "active": true
    },
    {
     "fs": "LC*",
     "iata": "LC",
     "name": "ECAir",
     "active": true
    },
    {
     "fs": "WHT",
     "iata": "WI",
     "icao": "WHT",
     "name": "White Airways",
     "active": true
    },
    {
     "fs": "IN*",
     "iata": "IN",
     "name": "Nam Air",
     "active": true
    },
    {
     "fs": "X7",
     "iata": "X7",
     "name": "Exec Air",
     "active": true
    },
    {
     "fs": "B9*",
     "iata": "BD",
     "name": "Cambodia Bayon Airlines",
     "active": true
    },
    {
     "fs": "ELB",
     "iata": "EL",
     "icao": "ELB",
     "name": "Ellinair",
     "active": true
    },
    {
     "fs": "Z5*",
     "iata": "Z5",
     "name": "Global Africa Aviation",
     "active": true
    },
    {
     "fs": "JI*",
     "iata": "JI",
     "name": "Meraj Air",
     "active": true
    },
    {
     "fs": "VAP",
     "icao": "VAP",
     "name": "Phuket Air",
     "active": true
    },
    {
     "fs": "TVQ",
     "iata": "6D",
     "icao": "TVQ",
     "name": "Travel Service Slovakia",
     "active": true
    },
    {
     "fs": "MEM",
     "icao": "MEM",
     "name": "ICAR",
     "active": true
    },
    {
     "fs": "ACT",
     "icao": "ACT",
     "name": "Flight Line",
     "active": true
    },
    {
     "fs": "A4",
     "iata": "A4",
     "icao": "AEK",
     "name": "Aerocon",
     "active": true
    },
    {
     "fs": "2Y*",
     "iata": "2Y",
     "name": "My Indo Airlines",
     "active": true
    },
    {
     "fs": "SLC",
     "iata": "SO",
     "icao": "SLC",
     "name": "SALSA d Haiti",
     "active": true
    },
    {
     "fs": "OJ*",
     "iata": "OJ",
     "name": "Fly Jamaica Airways",
     "active": true
    },
    {
     "fs": "6U",
     "iata": "6U",
     "icao": "ACX",
     "name": "ACG",
     "active": true
    },
    {
     "fs": "5G*",
     "iata": "5G",
     "icao": "FOX",
     "name": "Fly540 Ghana",
     "active": true
    },
    {
     "fs": "AAS",
     "iata": "Q3",
     "icao": "AXL",
     "name": "Anguilla Air Services",
     "active": true
    },
    {
     "fs": "CAC",
     "iata": "QC",
     "icao": "CRC",
     "name": "Camair-Co",
     "active": true
    },
    {
     "fs": "TWG",
     "iata": "TZ",
     "icao": "TWG",
     "name": "Air-Taxi Europe",
     "active": true
    },
    {
     "fs": "BVI",
     "iata": "XV",
     "icao": "BVI",
     "name": "BVI Airways",
     "active": true
    },
    {
     "fs": "KND",
     "iata": "K8",
     "icao": "KND",
     "name": "Kan Air",
     "active": true
    },
    {
     "fs": "EPA",
     "iata": "DZ",
     "icao": "EPA",
     "name": "Donghai Airlines",
     "active": true
    },
    {
     "fs": "FCV",
     "icao": "FCV",
     "name": "Nav Air Charter",
     "active": true
    },
    {
     "fs": "9GR",
     "iata": "9G",
     "name": "9G Rail",
     "active": true
    },
    {
     "fs": "P4",
     "iata": "P4",
     "icao": "NSO",
     "name": "Aerolineas Sosa",
     "active": true
    },
    {
     "fs": "RUC",
     "iata": "5R",
     "icao": "RUC",
     "name": "Rutaca Airlines",
     "active": true
    },
    {
     "fs": "6U*",
     "iata": "6U",
     "name": "Unique Air",
     "active": true
    },
    {
     "fs": "KGO",
     "iata": "ZC",
     "icao": "KGO",
     "name": "Korongo Airlines",
     "active": true
    },
    {
     "fs": "FAO",
     "icao": "FAO",
     "name": "Falcon Air",
     "active": true
    },
    {
     "fs": "RVP",
     "iata": "WV",
     "icao": "RVP",
     "name": "Aero Vip (Portugal)",
     "active": true
    },
    {
     "fs": "S8*",
     "iata": "S8",
     "icao": "SWZ",
     "name": "Skywise",
     "active": true
    },
    {
     "fs": "KRN",
     "iata": "U5",
     "icao": "KRN",
     "name": "Karinou Airlines",
     "active": true
    },
    {
     "fs": "PAU",
     "iata": "P7",
     "icao": "PAU",
     "name": "Palau Airways",
     "active": true
    },
    {
     "fs": "GZQ",
     "iata": "Z4",
     "icao": "GZQ",
     "name": "ZagrosJet",
     "active": true
    },
    {
     "fs": "A3",
     "iata": "A3",
     "icao": "AEE",
     "name": "Aegean Airlines",
     "active": true
    },
    {
     "fs": "3Z",
     "iata": "5V",
     "icao": "VTS",
     "name": "Everts Air Cargo",
     "active": true
    },
    {
     "fs": "TDR",
     "iata": "C3",
     "icao": "TDR",
     "name": "Trade Air",
     "active": true
    },
    {
     "fs": "SHY",
     "iata": "ZY",
     "icao": "SHY",
     "name": "Sky Airlines",
     "active": true
    },
    {
     "fs": "HFY",
     "iata": "5K",
     "icao": "HFY",
     "name": "Hi Fly",
     "active": true
    },
    {
     "fs": "C7*",
     "iata": "C7",
     "icao": "CIN",
     "name": "Cinnamon Air",
     "active": true
    },
    {
     "fs": "ZH",
     "iata": "ZH",
     "icao": "CSZ",
     "name": "Shenzhen Airlines",
     "phoneNumber": "+86 755 95080-8",
     "active": true
    },
    {
     "fs": "UU",
     "iata": "UU",
     "icao": "REU",
     "name": "Air Austral",
     "active": true
    },
    {
     "fs": "HY",
     "iata": "HY",
     "icao": "UZB",
     "name": "Uzbekistan Airways",
     "active": true
    },
    {
     "fs": "7T",
     "iata": "7T",
     "icao": "TNT",
     "name": "Trans North Aviation",
     "active": true
    },
    {
     "fs": "QK",
     "iata": "QK",
     "icao": "JZA",
     "name": "Jazz",
     "active": true
    },
    {
     "fs": "NO",
     "iata": "NO",
     "icao": "NOS",
     "name": "Neos",
     "active": true
    },
    {
     "fs": "GB",
     "iata": "GB",
     "icao": "ABX",
     "name": "ABX Air",
     "active": true
    },
    {
     "fs": "VIL",
     "iata": "V6",
     "icao": "VIL",
     "name": "VI Airlink",
     "active": true
    },
    {
     "fs": "RE",
     "iata": "RE",
     "icao": "REA",
     "name": "Stobart Air",
     "active": true
    },
    {
     "fs": "LYM",
     "iata": "KG",
     "icao": "LYM",
     "name": "Key Lime Air",
     "active": true
    },
    {
     "fs": "PTR",
     "iata": "9P",
     "icao": "PTR",
     "name": "Air Arabia Jordan",
     "active": true
    },
    {
     "fs": "AF",
     "iata": "AF",
     "icao": "AFR",
     "name": "Air France",
     "phoneNumber": "1-800-237-2747",
     "active": true
    },
    {
     "fs": "EV",
     "iata": "EV",
     "icao": "ASQ",
     "name": "ExpressJet",
     "active": true
    },
    {
     "fs": "MQ",
     "iata": "MQ",
     "icao": "ENY",
     "name": "Envoy Air",
     "active": true
    },
    {
     "fs": "MDM",
     "iata": "N5",
     "icao": "MDM",
     "name": "Medavia",
     "active": true
    },
    {
     "fs": "JS",
     "iata": "JS",
     "icao": "KOR",
     "name": "Air Koryo",
     "active": true
    },
    {
     "fs": "AA",
     "iata": "AA",
     "icao": "AAL",
     "name": "American Airlines",
     "phoneNumber": "1-800-433-7300",
     "active": true
    },
    {
     "fs": "LH",
     "iata": "LH",
     "icao": "DLH",
     "name": "Lufthansa",
     "active": true
    },
    {
     "fs": "AD",
     "iata": "AD",
     "icao": "AZU",
     "name": "Azul",
     "active": true
    },
    {
     "fs": "SU",
     "iata": "SU",
     "icao": "AFL",
     "name": "Aeroflot",
     "active": true
    },
    {
     "fs": "CO",
     "iata": "CO",
     "icao": "COA",
     "name": "Continental Airlines",
     "phoneNumber": "1-800-523-3273",
     "active": true
    },
    {
     "fs": "DL",
     "iata": "DL",
     "icao": "DAL",
     "name": "Delta Air Lines",
     "phoneNumber": "1-800-221-1212",
     "active": true
    },
    {
     "fs": "LY",
     "iata": "LY",
     "icao": "ELY",
     "name": "El Al",
     "active": true
    },
    {
     "fs": "AY",
     "iata": "AY",
     "icao": "FIN",
     "name": "Finnair",
     "active": true
    },
    {
     "fs": "AR",
     "iata": "AR",
     "icao": "ARG",
     "name": "Aerolineas Argentinas",
     "phoneNumber": "1-800-333-0276",
     "active": true
    },
    {
     "fs": "AG*",
     "iata": "AG",
     "icao": "ARU",
     "name": "Aruba Airlines",
     "active": true
    },
    {
     "fs": "LX",
     "iata": "LX",
     "icao": "SWR",
     "name": "SWISS",
     "active": true
    },
    {
     "fs": "UA",
     "iata": "UA",
     "icao": "UAL",
     "name": "United Airlines",
     "phoneNumber": "1-800-864-8331",
     "active": true
    },
    {
     "fs": "NH",
     "iata": "NH",
     "icao": "ANA",
     "name": "ANA",
     "phoneNumber": "1-800-235-9262",
     "active": true
    },
    {
     "fs": "JP",
     "iata": "JP",
     "icao": "ADR",
     "name": "Adria Airways",
     "active": true
    },
    {
     "fs": "EI",
     "iata": "EI",
     "icao": "EIN",
     "name": "Aer Lingus",
     "phoneNumber": "1-800-IRISHAIR",
     "active": true
    },
    {
     "fs": "AM",
     "iata": "AM",
     "icao": "AMX",
     "name": "Aeromexico",
     "phoneNumber": "1-800-237-6639",
     "active": true
    },
    {
     "fs": "AH",
     "iata": "AH",
     "icao": "DAH",
     "name": "Air Algerie",
     "active": true
    },
    {
     "fs": "MK",
     "iata": "MK",
     "icao": "MAU",
     "name": "Air Mauritius",
     "active": true
    },
    {
     "fs": "AZ",
     "iata": "AZ",
     "icao": "AZA",
     "name": "Alitalia",
     "active": true
    },
    {
     "fs": "GL",
     "iata": "GL",
     "icao": "GRL",
     "name": "Air Greenland",
     "active": true
    },
    {
     "fs": "KM",
     "iata": "KM",
     "icao": "AMC",
     "name": "Air Malta",
     "active": true
    },
    {
     "fs": "TZ",
     "iata": "TZ",
     "icao": "SCO",
     "name": "Scoot",
     "phoneNumber": "1-800-435-9282",
     "active": true
    },
    {
     "fs": "UX",
     "iata": "UX",
     "icao": "AEA",
     "name": "Air Europa",
     "active": true
    },
    {
     "fs": "OZ",
     "iata": "OZ",
     "icao": "AAR",
     "name": "Asiana Airlines",
     "active": true
    },
    {
     "fs": "VIT",
     "iata": "MV",
     "icao": "VIT",
     "name": "Aviastar",
     "active": true
    },
    {
     "fs": "AV",
     "iata": "AV",
     "icao": "AVA",
     "name": "AVIANCA",
     "active": true
    },
    {
     "fs": "RP",
     "iata": "RP",
     "icao": "CHQ",
     "name": "Chautauqua Airlines",
     "active": true
    },
    {
     "fs": "CI",
     "iata": "CI",
     "icao": "CAL",
     "name": "China Airlines",
     "active": true
    },
    {
     "fs": "4C",
     "iata": "4C",
     "icao": "ARE",
     "name": "LAN Colombia",
     "active": true
    },
    {
     "fs": "EW",
     "iata": "EW",
     "icao": "EWG",
     "name": "Eurowings",
     "active": true
    },
    {
     "fs": "EFY",
     "icao": "EFY",
     "name": "EasyFly",
     "active": true
    },
    {
     "fs": "HU",
     "iata": "HU",
     "icao": "CHH",
     "name": "Hainan Airlines",
     "active": true
    },
    {
     "fs": "PBI",
     "icao": "PBN",
     "name": "Virgin Australia (NZ)",
     "active": true
    },
    {
     "fs": "SA",
     "iata": "SA",
     "icao": "SAA",
     "name": "South African Airways",
     "active": true
    },
    {
     "fs": "WX",
     "iata": "WX",
     "icao": "BCY",
     "name": "Cityjet",
     "active": true
    },
    {
     "fs": "G3",
     "iata": "G3",
     "icao": "GLO",
     "name": "Gol",
     "active": true
    },
    {
     "fs": "GF",
     "iata": "GF",
     "icao": "GFA",
     "name": "Gulf Air",
     "active": true
    },
    {
     "fs": "6G",
     "iata": "6G",
     "icao": "FDY",
     "name": "Sun Air Express",
     "active": true
    },
    {
     "fs": "KA",
     "iata": "KA",
     "icao": "HDA",
     "name": "Dragonair",
     "active": true
    },
    {
     "fs": "DS",
     "iata": "DS",
     "icao": "EZS",
     "name": "Easyjet Switzerland",
     "active": true
    },
    {
     "fs": "QW*",
     "iata": "QW",
     "icao": "QDA",
     "name": "Qingdao Airlines",
     "active": true
    },
    {
     "fs": "GP",
     "iata": "GP",
     "icao": "PTN",
     "name": "Pantanal Linhas Aereas",
     "active": true
    },
    {
     "fs": "BE",
     "iata": "BE",
     "icao": "BEE",
     "name": "Flybe",
     "active": true
    },
    {
     "fs": "LS",
     "iata": "LS",
     "icao": "EXS",
     "name": "Jet2",
     "active": true
    },
    {
     "fs": "GJ*",
     "iata": "GJ",
     "icao": "CDC",
     "name": "Zhejiang Loong Airlines",
     "active": true
    },
    {
     "fs": "MN",
     "iata": "MN",
     "icao": "CAW",
     "name": "Comair",
     "active": true
    },
    {
     "fs": "EK",
     "iata": "EK",
     "icao": "UAE",
     "name": "Emirates",
     "active": true
    },
    {
     "fs": "ET",
     "iata": "ET",
     "icao": "ETH",
     "name": "Ethiopian Airlines",
     "active": true
    },
    {
     "fs": "EY",
     "iata": "EY",
     "icao": "ETD",
     "name": "Etihad Airways",
     "active": true
    },
    {
     "fs": "MS",
     "iata": "MS",
     "icao": "MSR",
     "name": "EgyptAir",
     "active": true
    },
    {
     "fs": "BR",
     "iata": "BR",
     "icao": "EVA",
     "name": "EVA Air",
     "active": true
    },
    {
     "fs": "P5",
     "iata": "P5",
     "icao": "RPB",
     "name": "Copa Airlines Colombia",
     "active": true
    },
    {
     "fs": "F9",
     "iata": "F9",
     "icao": "FFT",
     "name": "Frontier Airlines",
     "active": true
    },
    {
     "fs": "GA",
     "iata": "GA",
     "icao": "GIA",
     "name": "Garuda Indonesia",
     "active": true
    },
    {
     "fs": "4U",
     "iata": "4U",
     "icao": "GWI",
     "name": "Germanwings",
     "active": true
    },
    {
     "fs": "U3",
     "iata": "U3",
     "icao": "AIA",
     "name": "Avies",
     "active": true
    },
    {
     "fs": "QR",
     "iata": "QR",
     "icao": "QTR",
     "name": "Qatar Airways",
     "active": true
    },
    {
     "fs": "CM",
     "iata": "CM",
     "icao": "CMP",
     "name": "Copa Airlines",
     "active": true
    },
    {
     "fs": "JQ",
     "iata": "JQ",
     "icao": "JST",
     "name": "Jetstar",
     "active": true
    },
    {
     "fs": "9W",
     "iata": "9W",
     "icao": "JAI",
     "name": "Jet Airways (India)",
     "active": true
    },
    {
     "fs": "KE",
     "iata": "KE",
     "icao": "KAL",
     "name": "Korean Air",
     "active": true
    },
    {
     "fs": "MI",
     "iata": "MI",
     "icao": "SLK",
     "name": "SilkAir",
     "active": true
    },
    {
     "fs": "SC",
     "iata": "SC",
     "icao": "CDG",
     "name": "Shandong Airlines",
     "active": true
    },
    {
     "fs": "CB*",
     "iata": "CB",
     "name": "Trans Caribbean Air",
     "active": true
    },
    {
     "fs": "0Q",
     "iata": "0Q",
     "icao": "HYD",
     "name": "Hydro - Quebec",
     "active": true
    },
    {
     "fs": "DY",
     "iata": "DY",
     "icao": "NAX",
     "name": "Norwegian Air Shuttle",
     "active": true
    },
    {
     "fs": "RJ",
     "iata": "RJ",
     "icao": "RJA",
     "name": "Royal Jordanian",
     "active": true
    },
    {
     "fs": "S7",
     "iata": "S7",
     "icao": "SBI",
     "name": "S7 Airlines",
     "active": true
    },
    {
     "fs": "VG",
     "iata": "VG",
     "icao": "VLM",
     "name": "VLM",
     "active": true
    },
    {
     "fs": "G4",
     "iata": "G4",
     "icao": "AAY",
     "name": "Allegiant Air",
     "active": true
    },
    {
     "fs": "NK",
     "iata": "NK",
     "icao": "NKS",
     "name": "Spirit Airlines",
     "active": true
    },
    {
     "fs": "ZW",
     "iata": "ZW",
     "icao": "AWI",
     "name": "Air Wisconsin",
     "active": true
    },
    {
     "fs": "TA",
     "iata": "TA",
     "icao": "TAI",
     "name": "TACA",
     "active": true
    },
    {
     "fs": "VN",
     "iata": "VN",
     "icao": "HVN",
     "name": "Vietnam Airlines",
     "active": true
    },
    {
     "fs": "2P",
     "iata": "2P",
     "icao": "GAP",
     "name": "PAL Express",
     "active": true
    },
    {
     "fs": "AJA",
     "icao": "AJA",
     "name": "AnadoluJet",
     "active": true
    },
    {
     "fs": "BP",
     "iata": "BP",
     "icao": "BOT",
     "name": "Air Botswana",
     "active": true
    },
    {
     "fs": "TX",
     "iata": "TX",
     "icao": "FWI",
     "name": "Air Caraibes",
     "active": true
    },
    {
     "fs": "9C",
     "iata": "9C",
     "icao": "CQH",
     "name": "Spring Airlines",
     "active": true
    },
    {
     "fs": "HD",
     "iata": "HD",
     "icao": "ADO",
     "name": "Air Do",
     "active": true
    },
    {
     "fs": "2K",
     "iata": "2K",
     "icao": "GLG",
     "name": "AeroGal",
     "active": true
    },
    {
     "fs": "OB",
     "iata": "OB",
     "icao": "BOV",
     "name": "BoA",
     "active": true
    },
    {
     "fs": "TV",
     "iata": "TV",
     "icao": "TBA",
     "name": "Tibet Airlines",
     "active": true
    },
    {
     "fs": "G9",
     "iata": "G9",
     "icao": "ABY",
     "name": "Air Arabia",
     "active": true
    },
    {
     "fs": "CH",
     "iata": "CH",
     "icao": "BMJ",
     "name": "Bemidji Aviation",
     "active": true
    },
    {
     "fs": "FLY",
     "iata": "I4",
     "icao": "FLY",
     "name": "I-Fly",
     "active": true
    },
    {
     "fs": "RV",
     "iata": "IV",
     "icao": "CPN",
     "name": "Caspian Airlines",
     "active": true
    },
    {
     "fs": "NY",
     "iata": "NY",
     "icao": "FXI",
     "name": "Air Iceland",
     "active": true
    },
    {
     "fs": "YN",
     "iata": "YN",
     "icao": "CRQ",
     "name": "Air Creebec",
     "active": true
    },
    {
     "fs": "ABQ",
     "iata": "PA",
     "icao": "ABQ",
     "name": "Airblue",
     "active": true
    },
    {
     "fs": "EN",
     "iata": "EN",
     "icao": "DLA",
     "name": "Air Dolomiti",
     "active": true
    },
    {
     "fs": "VX",
     "iata": "VX",
     "icao": "VRD",
     "name": "Virgin America",
     "active": true
    },
    {
     "fs": "NX",
     "iata": "NX",
     "icao": "AMU",
     "name": "Air Macau",
     "active": true
    },
    {
     "fs": "QM",
     "iata": "QM",
     "icao": "AML",
     "name": "Air Malawi",
     "active": true
    },
    {
     "fs": "SB",
     "iata": "SB",
     "icao": "ACI",
     "name": "Aircalin",
     "active": true
    },
    {
     "fs": "TN",
     "iata": "TN",
     "icao": "THT",
     "name": "Air Tahiti Nui",
     "active": true
    },
    {
     "fs": "TS",
     "iata": "TS",
     "icao": "TSC",
     "name": "Air Transat",
     "active": true
    },
    {
     "fs": "BX",
     "iata": "BX",
     "icao": "ABL",
     "name": "Air Busan",
     "active": true
    },
    {
     "fs": "UM",
     "iata": "UM",
     "icao": "AZW",
     "name": "Air Zimbabwe",
     "active": true
    },
    {
     "fs": "IZ",
     "iata": "IZ",
     "icao": "AIZ",
     "name": "Arkia Israeli Airlines",
     "active": true
    },
    {
     "fs": "VH",
     "iata": "VH",
     "icao": "ALV",
     "name": "Aeropostal",
     "active": true
    },
    {
     "fs": "DV",
     "iata": "DV",
     "icao": "VSV",
     "name": "SCAT Airlines",
     "active": true
    },
    {
     "fs": "FG",
     "iata": "FG",
     "icao": "AFG",
     "name": "Ariana Afghan Airlines",
     "active": true
    },
    {
     "fs": "VS",
     "iata": "VS",
     "icao": "VIR",
     "name": "Virgin Atlantic",
     "active": true
    },
    {
     "fs": "AK",
     "iata": "AK",
     "icao": "AXM",
     "name": "AirAsia",
     "active": true
    },
    {
     "fs": "R7",
     "iata": "R7",
     "icao": "OCA",
     "name": "Aserca Airlines",
     "active": true
    },
    {
     "fs": "IQ",
     "iata": "IQ",
     "icao": "AUB",
     "name": "Augsburg Airways",
     "active": true
    },
    {
     "fs": "AU",
     "iata": "AU",
     "icao": "AUT",
     "name": "Austral",
     "active": true
    },
    {
     "fs": "U8",
     "iata": "U8",
     "icao": "RNV",
     "name": "Armavia",
     "active": true
    },
    {
     "fs": "FB",
     "iata": "FB",
     "icao": "LZB",
     "name": "Bulgaria Air",
     "active": true
    },
    {
     "fs": "V3",
     "iata": "V3",
     "icao": "KRP",
     "name": "Carpatair",
     "active": true
    },
    {
     "fs": "G8",
     "iata": "G8",
     "icao": "GOW",
     "name": "GoAir",
     "active": true
    },
    {
     "fs": "EU",
     "iata": "EU",
     "icao": "UEA",
     "name": "Chengdu Airlines",
     "active": true
    },
    {
     "fs": "3K",
     "iata": "3K",
     "icao": "JSA",
     "name": "Jetstar Asia",
     "active": true
    },
    {
     "fs": "VD",
     "iata": "VD",
     "icao": "KPA",
     "name": "Henan Airlines",
     "active": true
    },
    {
     "fs": "3X",
     "iata": "JC",
     "icao": "JAC",
     "name": "Japan Air Commuter",
     "active": true
    },
    {
     "fs": "LXA",
     "icao": "LXA",
     "name": "Luxaviation",
     "active": true
    },
    {
     "fs": "CY",
     "iata": "CY",
     "icao": "CYP",
     "name": "Cyprus Airways",
     "active": true
    },
    {
     "fs": "5J",
     "iata": "5J",
     "icao": "CEB",
     "name": "Cebu Pacific Air",
     "active": true
    },
    {
     "fs": "CP",
     "iata": "CP",
     "icao": "CPZ",
     "name": "Compass Airlines",
     "active": true
    },
    {
     "fs": "WA",
     "iata": "WA",
     "icao": "KLC",
     "name": "KLM Cityhopper",
     "active": true
    },
    {
     "fs": "QFA",
     "icao": "EAQ",
     "name": "Eastern Australia",
     "active": true
    },
    {
     "fs": "OV",
     "iata": "OV",
     "icao": "ELL",
     "name": "Estonian Air",
     "active": true
    },
    {
     "fs": "HA",
     "iata": "HA",
     "icao": "HAL",
     "name": "Hawaiian Airlines",
     "active": true
    },
    {
     "fs": "LJ",
     "iata": "LJ",
     "icao": "JNA",
     "name": "Jin Air",
     "active": true
    },
    {
     "fs": "FZ",
     "iata": "FZ",
     "icao": "FDB",
     "name": "Flydubai",
     "active": true
    },
    {
     "fs": "A9",
     "iata": "A9",
     "icao": "TGZ",
     "name": "Georgian Airways",
     "active": true
    },
    {
     "fs": "QZ",
     "iata": "QZ",
     "icao": "AWQ",
     "name": "Indonesia AirAsia",
     "active": true
    },
    {
     "fs": "LN",
     "iata": "LN",
     "icao": "LAA",
     "name": "Libyan Airlines",
     "active": true
    },
    {
     "fs": "FI",
     "iata": "FI",
     "icao": "ICE",
     "name": "Icelandair",
     "active": true
    },
    {
     "fs": "3M",
     "iata": "3M",
     "icao": "SIL",
     "name": "Silver Airways",
     "active": true
    },
    {
     "fs": "3L",
     "iata": "3L",
     "icao": "ISK",
     "name": "InterSky",
     "active": true
    },
    {
     "fs": "7C*",
     "iata": "7C",
     "icao": "JJA",
     "name": "Jeju Air",
     "active": true
    },
    {
     "fs": "QNZ",
     "icao": "QNZ",
     "name": "Jetconnect",
     "active": true
    },
    {
     "fs": "HX",
     "iata": "HX",
     "icao": "CRK",
     "name": "Hong Kong Airlines ",
     "active": true
    },
    {
     "fs": "T3",
     "iata": "T3",
     "icao": "EZE",
     "name": "Eastern Airways",
     "active": true
    },
    {
     "fs": "6J",
     "iata": "6J",
     "icao": "JUB",
     "name": "Jubba Airways",
     "active": true
    },
    {
     "fs": "XL",
     "iata": "XL",
     "icao": "LNE",
     "name": "Lan Ecuador",
     "active": true
    },
    {
     "fs": "KQ",
     "iata": "KQ",
     "icao": "KQA",
     "name": "Kenya Airways",
     "active": true
    },
    {
     "fs": "ZE",
     "iata": "ZE",
     "icao": "ESR",
     "name": "EASTAR JET",
     "active": true
    },
    {
     "fs": "8L",
     "iata": "8L",
     "icao": "LKE",
     "name": "Lucky Air",
     "active": true
    },
    {
     "fs": "KU",
     "iata": "KU",
     "icao": "KAC",
     "name": "Kuwait Airways",
     "active": true
    },
    {
     "fs": "LR",
     "iata": "LR",
     "icao": "LRC",
     "name": "LACSA",
     "active": true
    },
    {
     "fs": "AMV",
     "iata": "MZ",
     "icao": "AMV",
     "name": "AMC Airlines",
     "active": true
    },
    {
     "fs": "V0",
     "iata": "V0",
     "icao": "VCV",
     "name": "Conviasa",
     "active": true
    },
    {
     "fs": "LP",
     "iata": "LP",
     "icao": "LPE",
     "name": "Lan Peru",
     "active": true
    },
    {
     "fs": "KB",
     "iata": "KB",
     "icao": "DRK",
     "name": "Drukair",
     "active": true
    },
    {
     "fs": "EF",
     "iata": "FE",
     "icao": "FEA",
     "name": "Far Eastern Air Transport",
     "active": true
    },
    {
     "fs": "QV",
     "iata": "QV",
     "icao": "LAO",
     "name": "Lao Airlines",
     "active": true
    },
    {
     "fs": "9H",
     "iata": "9H",
     "icao": "DNL",
     "name": "Dutch Antilles Express",
     "active": true
    },
    {
     "fs": "6W",
     "iata": "6W",
     "icao": "SOV",
     "name": "Saravia",
     "active": true
    },
    {
     "fs": "O6",
     "iata": "O6",
     "icao": "ONE",
     "name": "Avianca Brazil",
     "active": true
    },
    {
     "fs": "FD",
     "iata": "FD",
     "icao": "AIQ",
     "name": "Thai AirAsia",
     "active": true
    },
    {
     "fs": "LG",
     "iata": "LG",
     "icao": "LGL",
     "name": "Luxair",
     "active": true
    },
    {
     "fs": "AJ",
     "iata": "NG",
     "icao": "NIG",
     "name": "Aero",
     "active": true
    },
    {
     "fs": "TF",
     "iata": "TF",
     "icao": "SCW",
     "name": "Malmo Aviation",
     "active": true
    },
    {
     "fs": "MP",
     "iata": "MP",
     "icao": "MPH",
     "name": "Martinair",
     "active": true
    },
    {
     "fs": "IG",
     "iata": "IG",
     "icao": "ISS",
     "name": "Meridiana",
     "active": true
    },
    {
     "fs": "YX",
     "iata": "YX",
     "icao": "RPA",
     "name": "Republic Airlines",
     "active": true
    },
    {
     "fs": "T5",
     "iata": "T5",
     "icao": "TUA",
     "name": "Turkmenistan Airlines",
     "active": true
    },
    {
     "fs": "TU",
     "iata": "TU",
     "icao": "TAR",
     "name": "Tunisair",
     "active": true
    },
    {
     "fs": "WY",
     "iata": "WY",
     "icao": "OMA",
     "name": "Oman Air",
     "active": true
    },
    {
     "fs": "Y4",
     "iata": "Y4",
     "icao": "VOI",
     "name": "Volaris",
     "active": true
    },
    {
     "fs": "PK",
     "iata": "PK",
     "icao": "PIA",
     "name": "Pakistan International Airlines",
     "active": true
    },
    {
     "fs": "PR",
     "iata": "PR",
     "icao": "PAL",
     "name": "Philippine Airlines",
     "active": true
    },
    {
     "fs": "NI",
     "iata": "NI",
     "icao": "PGA",
     "name": "Portugalia Airlines",
     "active": true
    },
    {
     "fs": "XF",
     "iata": "XF",
     "icao": "VLK",
     "name": "Vladavia",
     "active": true
    },
    {
     "fs": "S3",
     "iata": "S3",
     "icao": "BBR",
     "name": "SBA Airlines",
     "active": true
    },
    {
     "fs": "3U",
     "iata": "3U",
     "icao": "CSC",
     "name": "Sichuan Airlines",
     "active": true
    },
    {
     "fs": "8K*",
     "iata": "8K",
     "icao": "KMI",
     "name": "K-Mile Air",
     "active": true
    },
    {
     "fs": "OHY",
     "iata": "8Q",
     "icao": "OHY",
     "name": "Onur Air",
     "active": true
    },
    {
     "fs": "DR*",
     "iata": "DR",
     "name": "Ruili Airlines",
     "active": true
    },
    {
     "fs": "TWN",
     "iata": "V2",
     "icao": "TWN",
     "name": "Avialeasing",
     "active": true
    },
    {
     "fs": "SSQ",
     "icao": "SSQ",
     "name": "Sunstate Airlines",
     "active": true
    },
    {
     "fs": "SWG",
     "iata": "WG",
     "icao": "SWG",
     "name": "Sunwing",
     "active": true
    },
    {
     "fs": "VO",
     "iata": "VO",
     "icao": "TYR",
     "name": "Tyrolean Airways",
     "active": true
    },
    {
     "fs": "MNG",
     "iata": "M0",
     "icao": "MNG",
     "name": "Aero Mongolia",
     "active": true
    },
    {
     "fs": "XR",
     "iata": "XR",
     "icao": "OZW",
     "name": "Virgin Australia Regional",
     "active": true
    },
    {
     "fs": "TR",
     "iata": "TR",
     "icao": "TGW",
     "name": "Tigerair Singapore",
     "active": true
    },
    {
     "fs": "OA",
     "iata": "OA",
     "icao": "OAL",
     "name": "Olympic Air",
     "active": true
    },
    {
     "fs": "5N",
     "iata": "5N",
     "icao": "AUL",
     "name": "Nordavia Regional Airlines",
     "active": true
    },
    {
     "fs": "RO",
     "iata": "RO",
     "icao": "ROT",
     "name": "TAROM",
     "active": true
    },
    {
     "fs": "VF",
     "iata": "VF",
     "icao": "VLU",
     "name": "Valuair",
     "active": true
    },
    {
     "fs": "5P",
     "iata": "5P",
     "icao": "PCP",
     "name": "PAL Airlines",
     "active": true
    },
    {
     "fs": "MZ",
     "iata": "MZ",
     "icao": "MNA",
     "name": "Merpati",
     "active": true
    },
    {
     "fs": "W5",
     "iata": "W5",
     "icao": "IRM",
     "name": "Mahan Air",
     "active": true
    },
    {
     "fs": "UL",
     "iata": "UL",
     "icao": "ALK",
     "name": "SriLankan Airlines",
     "active": true
    },
    {
     "fs": "7L",
     "iata": "7L",
     "icao": "CRN",
     "name": "Aerocaribbean",
     "active": true
    },
    {
     "fs": "GS",
     "iata": "GS",
     "icao": "GCR",
     "name": "Tianjin Airlines",
     "active": true
    },
    {
     "fs": "5D",
     "iata": "5D",
     "icao": "SLI",
     "name": "AeroMexico Connect",
     "active": true
    },
    {
     "fs": "8U",
     "iata": "8U",
     "icao": "AAW",
     "name": "Afriqiyah Airways",
     "active": true
    },
    {
     "fs": "ZI",
     "iata": "ZI",
     "icao": "AAF",
     "name": "Aigle Azur",
     "active": true
    },
    {
     "fs": "A6",
     "iata": "A6",
     "icao": "LPV",
     "name": "Air Alps Aviation",
     "active": true
    },
    {
     "fs": "Z7",
     "iata": "YK",
     "icao": "AVJ",
     "name": "Avia Traffic Company",
     "active": true
    },
    {
     "fs": "RBG",
     "iata": "E5",
     "icao": "RBG",
     "name": "Air Arabia Egypt",
     "active": true
    },
    {
     "fs": "3O",
     "iata": "3O",
     "icao": "MAC",
     "name": "Air Arabia Maroc",
     "active": true
    },
    {
     "fs": "5T",
     "iata": "5T",
     "icao": "MPE",
     "name": "Canadian North",
     "active": true
    },
    {
     "fs": "2J",
     "iata": "2J",
     "icao": "VBW",
     "name": "Air Burkina",
     "active": true
    },
    {
     "fs": "TY",
     "iata": "TY",
     "icao": "TPC",
     "name": "Air Caledonie",
     "active": true
    },
    {
     "fs": "HOP",
     "iata": "A5",
     "icao": "HOP",
     "name": "HOP!",
     "active": true
    },
    {
     "fs": "KK",
     "iata": "KK",
     "icao": "KKK",
     "name": "Atlasjet",
     "active": true
    },
    {
     "fs": "JM",
     "iata": "JM",
     "icao": "AJM",
     "name": "Air Jamaica",
     "active": true
    },
    {
     "fs": "DB",
     "iata": "DB",
     "icao": "BZH",
     "name": "HOP!-BRIT AIR",
     "active": true
    },
    {
     "fs": "4T",
     "iata": "4T",
     "icao": "BHP",
     "name": "Belair Airlines",
     "active": true
    },
    {
     "fs": "SW",
     "iata": "SW",
     "icao": "NMB",
     "name": "Air Namibia",
     "active": true
    },
    {
     "fs": "IX",
     "iata": "IX",
     "icao": "AXB",
     "name": "Air India Express",
     "active": true
    },
    {
     "fs": "RLK",
     "icao": "RLK",
     "name": "Air Nelson",
     "active": true
    },
    {
     "fs": "3N",
     "iata": "3N",
     "icao": "URG",
     "name": "Air Urga",
     "active": true
    },
    {
     "fs": "CD",
     "iata": "9I",
     "icao": "LLR",
     "name": "Alliance Air",
     "active": true
    },
    {
     "fs": "9K",
     "iata": "9K",
     "icao": "KAP",
     "name": "Cape Air",
     "active": true
    },
    {
     "fs": "6T",
     "iata": "6T",
     "name": "Air Mandalay",
     "active": true
    },
    {
     "fs": "BQB",
     "iata": "5Q",
     "icao": "BQB",
     "name": "BQB Lineas Aereas",
     "active": true
    },
    {
     "fs": "UP",
     "iata": "UP",
     "icao": "BHS",
     "name": "Bahamasair",
     "active": true
    },
    {
     "fs": "9V",
     "iata": "9V",
     "icao": "ROI",
     "name": "Avior",
     "active": true
    },
    {
     "fs": "PG",
     "iata": "PG",
     "icao": "BKP",
     "name": "Bangkok Airways",
     "active": true
    },
    {
     "fs": "GR",
     "iata": "GR",
     "icao": "AUR",
     "name": "Aurigny Air Services",
     "active": true
    },
    {
     "fs": "KP",
     "iata": "KP",
     "icao": "SKK",
     "name": "ASKY",
     "active": true
    },
    {
     "fs": "G5",
     "iata": "G5",
     "icao": "HXA",
     "name": "China Express Air",
     "active": true
    },
    {
     "fs": "B2",
     "iata": "B2",
     "icao": "BRU",
     "name": "Belavia",
     "active": true
    },
    {
     "fs": "BV",
     "iata": "BV",
     "icao": "BPA",
     "name": "Blue Panorama Airlines",
     "active": true
    },
    {
     "fs": "J2",
     "iata": "J2",
     "icao": "AHY",
     "name": "AZAL Azerbaijan Airlines",
     "active": true
    },
    {
     "fs": "IK*",
     "iata": "IK",
     "icao": "KAR",
     "name": "Ikar",
     "active": true
    },
    {
     "fs": "BHA",
     "iata": "U4",
     "icao": "BHA",
     "name": "Buddha Air",
     "active": true
    },
    {
     "fs": "UZ",
     "iata": "UZ",
     "icao": "BRQ",
     "name": "Buraq Air",
     "active": true
    },
    {
     "fs": "XM",
     "iata": "XM",
     "icao": "SMX",
     "name": "C.A.I. First",
     "active": true
    },
    {
     "fs": "VE",
     "iata": "VE",
     "icao": "VLE",
     "name": "CAI Second",
     "active": true
    },
    {
     "fs": "FA",
     "iata": "FA",
     "icao": "HYR",
     "name": "Private Sky",
     "active": true
    },
    {
     "fs": "JD",
     "iata": "JD",
     "icao": "CBJ",
     "name": "Beijing Capital Airlines",
     "active": true
    },
    {
     "fs": "BW",
     "iata": "BW",
     "icao": "BWA",
     "name": "Caribbean Airlines",
     "active": true
    },
    {
     "fs": "K6",
     "iata": "K6",
     "icao": "KHV",
     "name": "Cambodia Angkor Air",
     "active": true
    },
    {
     "fs": "KN",
     "iata": "KN",
     "icao": "CUA",
     "name": "China United Airlines",
     "active": true
    },
    {
     "fs": "OU",
     "iata": "OU",
     "icao": "CTN",
     "name": "Croatia Airlines",
     "active": true
    },
    {
     "fs": "CU",
     "iata": "CU",
     "icao": "CUB",
     "name": "Cubana de Aviacion",
     "active": true
    },
    {
     "fs": "INJ",
     "icao": "INJ",
     "name": "InterJet Hellenic",
     "active": true
    },
    {
     "fs": "D3",
     "iata": "D3",
     "icao": "DAO",
     "name": "Daallo Airlines",
     "active": true
    },
    {
     "fs": "QB",
     "iata": "QB",
     "icao": "GFG",
     "name": "Sky Georgia",
     "active": true
    },
    {
     "fs": "DUB",
     "icao": "DUB",
     "name": "Dubai Air Wing",
     "active": true
    },
    {
     "fs": "HO",
     "iata": "HO",
     "icao": "DKH",
     "name": "Juneyao Airlines",
     "active": true
    },
    {
     "fs": "ZK",
     "iata": "ZK",
     "icao": "GLA",
     "name": "Great Lakes Airlines",
     "active": true
    },
    {
     "fs": "FO",
     "iata": "FO",
     "icao": "FXX",
     "name": "Felix Airways",
     "active": true
    },
    {
     "fs": "FRN",
     "icao": "FRN",
     "name": "FirstNation Airways",
     "active": true
    },
    {
     "fs": "6H",
     "iata": "6H",
     "icao": "ISR",
     "name": "Israir Airlines",
     "active": true
    },
    {
     "fs": "2F",
     "iata": "2F",
     "icao": "FTA",
     "name": "Frontier Flying Service",
     "active": true
    },
    {
     "fs": "JU",
     "iata": "JU",
     "icao": "JAT",
     "name": "Air Serbia",
     "active": true
    },
    {
     "fs": "UO",
     "iata": "UO",
     "icao": "HKE",
     "name": "Hong Kong Express",
     "active": true
    },
    {
     "fs": "DC",
     "iata": "DC",
     "icao": "BRX",
     "name": "Braathens Regional",
     "active": true
    },
    {
     "fs": "JAF",
     "iata": "TB",
     "icao": "JAF",
     "name": "Jetairfly",
     "active": true
    },
    {
     "fs": "G7",
     "iata": "G7",
     "icao": "GJS",
     "name": "GoJet Airlines",
     "active": true
    },
    {
     "fs": "A5",
     "iata": "AN",
     "icao": "RLA",
     "name": "HOP!-AIRLINAIR",
     "active": true
    },
    {
     "fs": "XAU",
     "iata": "A8",
     "icao": "XAU",
     "name": "Aerolink Uganda",
     "active": true
    },
    {
     "fs": "Z6",
     "iata": "Z6",
     "icao": "UDN",
     "name": "Dniproavia",
     "active": true
    },
    {
     "fs": "D6",
     "iata": "D6",
     "icao": "ILN",
     "name": "Interair South Africa",
     "active": true
    },
    {
     "fs": "UD",
     "iata": "UD",
     "icao": "HER",
     "name": "Hex'Air",
     "active": true
    },
    {
     "fs": "Y9",
     "iata": "Y9",
     "icao": "IRK",
     "name": "Kish Air",
     "active": true
    },
    {
     "fs": "J9",
     "iata": "J9",
     "icao": "JZR",
     "name": "Jazeera Airways",
     "active": true
    },
    {
     "fs": "6E",
     "iata": "6E",
     "icao": "IGO",
     "name": "IndiGo",
     "active": true
    },
    {
     "fs": "IR",
     "iata": "IR",
     "icao": "IRA",
     "name": "Iran Air",
     "active": true
    },
    {
     "fs": "IA",
     "iata": "IA",
     "icao": "IAW",
     "name": "Iraqi Airways",
     "active": true
    },
    {
     "fs": "DWT",
     "iata": "F7",
     "icao": "DWT",
     "name": "Darwin Airline",
     "active": true
    },
    {
     "fs": "ZY",
     "iata": "EF",
     "icao": "EZA",
     "name": "Eznis Airways",
     "active": true
    },
    {
     "fs": "4O",
     "iata": "4O",
     "icao": "AIJ",
     "name": "Interjet",
     "active": true
    },
    {
     "fs": "I3",
     "iata": "I3",
     "icao": "IVN",
     "name": "Ivoirienne de Transport Aerien",
     "active": true
    },
    {
     "fs": "SL*",
     "iata": "SL",
     "icao": "LTM",
     "name": "Thai Lion Air",
     "active": true
    },
    {
     "fs": "NU",
     "iata": "NU",
     "icao": "JTA",
     "name": "Japan Transocean Air",
     "active": true
    },
    {
     "fs": "JR",
     "iata": "JR",
     "icao": "JOY",
     "name": "Joy Air",
     "active": true
    },
    {
     "fs": "JAV",
     "iata": "R5",
     "icao": "JAV",
     "name": "Jordan Aviation",
     "active": true
    },
    {
     "fs": "RB",
     "iata": "RB",
     "icao": "SYR",
     "name": "Syrian Air",
     "active": true
    },
    {
     "fs": "X3",
     "iata": "X3",
     "icao": "TUI",
     "name": "TUIfly",
     "active": true
    },
    {
     "fs": "KY",
     "iata": "KY",
     "icao": "KNA",
     "name": "Kunming Airlines",
     "active": true
    },
    {
     "fs": "7V",
     "iata": "7V",
     "icao": "FDR",
     "name": "Federal Air",
     "active": true
    },
    {
     "fs": "PS",
     "iata": "PS",
     "icao": "AUI",
     "name": "UIA",
     "active": true
    },
    {
     "fs": "J3",
     "iata": "J3",
     "icao": "PLR",
     "name": "Northwestern  Air",
     "active": true
    },
    {
     "fs": "SNJ",
     "iata": "6J",
     "icao": "SNJ",
     "name": "Solaseed Air",
     "active": true
    },
    {
     "fs": "RKA",
     "iata": "PI",
     "icao": "RKA",
     "name": "Polar Airlines",
     "active": true
    },
    {
     "fs": "9R",
     "iata": "9R",
     "icao": "NSE",
     "name": "SATENA",
     "active": true
    },
    {
     "fs": "TJ",
     "iata": "TJ",
     "icao": "GPD",
     "name": "Tradewind Aviation",
     "active": true
    },
    {
     "fs": "W4",
     "iata": "W4",
     "icao": "LCB",
     "name": "LC Peru",
     "active": true
    },
    {
     "fs": "U9",
     "iata": "U9",
     "icao": "TAK",
     "name": "Tatarstan Aircompany",
     "active": true
    },
    {
     "fs": "MYD",
     "iata": "MY",
     "icao": "MYD",
     "name": "Maya Island Air",
     "active": true
    },
    {
     "fs": "ME",
     "iata": "ME",
     "icao": "MEA",
     "name": "Middle East Airlines",
     "active": true
    },
    {
     "fs": "OX",
     "iata": "OX",
     "icao": "OEA",
     "name": "Orient Thai Airlines",
     "active": true
    },
    {
     "fs": "BL",
     "iata": "BL",
     "icao": "PIC",
     "name": "Jetstar Pacific",
     "active": true
    },
    {
     "fs": "H2",
     "iata": "H2",
     "icao": "SKU",
     "name": "Sky Airline",
     "active": true
    },
    {
     "fs": "7K",
     "iata": "7K",
     "icao": "KGL",
     "name": "Kolavia",
     "active": true
    },
    {
     "fs": "WB",
     "iata": "WB",
     "icao": "RWD",
     "name": "RwandAir",
     "active": true
    },
    {
     "fs": "UG",
     "iata": "UG",
     "icao": "TUX",
     "name": "TunisAir Express",
     "active": true
    },
    {
     "fs": "TOS",
     "iata": "9N",
     "icao": "TOS",
     "name": "Tropic Air",
     "active": true
    },
    {
     "fs": "H9",
     "iata": "H9",
     "icao": "HTH",
     "name": "Helitt",
     "active": true
    },
    {
     "fs": "BI",
     "iata": "BI",
     "icao": "RBA",
     "name": "Royal Brunei Airlines",
     "active": true
    },
    {
     "fs": "P7",
     "iata": "P7",
     "icao": "ESL",
     "name": "Russian Sky Airlines",
     "active": true
    },
    {
     "fs": "TGN",
     "iata": "IL",
     "icao": "TGN",
     "name": "Trigana Air",
     "active": true
    },
    {
     "fs": "5U",
     "iata": "5U",
     "icao": "LDE",
     "name": "LADE",
     "active": true
    },
    {
     "fs": "K5",
     "iata": "K5",
     "icao": "SQH",
     "name": "SeaPort Airlines",
     "active": true
    },
    {
     "fs": "SY",
     "iata": "SY",
     "icao": "SCX",
     "name": "Sun Country Airlines",
     "active": true
    },
    {
     "fs": "NL",
     "iata": "NL",
     "icao": "SAI",
     "name": "Shaheen Air International",
     "active": true
    },
    {
     "fs": "S5",
     "iata": "S5",
     "icao": "TCF",
     "name": "Shuttle America",
     "active": true
    },
    {
     "fs": "LU",
     "iata": "LU",
     "icao": "LXP",
     "name": "LanExpress",
     "active": true
    },
    {
     "fs": "LNQ",
     "icao": "LNQ",
     "name": "Links Air",
     "active": true
    },
    {
     "fs": "KSM",
     "icao": "KSM",
     "name": "Kosmos Airlines",
     "active": true
    },
    {
     "fs": "YG",
     "iata": "YG",
     "icao": "OTL",
     "name": "South Airlines",
     "active": true
    },
    {
     "fs": "Q4",
     "iata": "Q4",
     "icao": "TLK",
     "name": "Starlink Aviation",
     "active": true
    },
    {
     "fs": "H3*",
     "iata": "H3",
     "icao": "HRM",
     "name": "Hermes Airlines",
     "active": true
    },
    {
     "fs": "FV",
     "iata": "FV",
     "icao": "SDM",
     "name": "Rossiya Airlines",
     "active": true
    },
    {
     "fs": "NA",
     "iata": "NA",
     "icao": "NAO",
     "name": "North American Airlines",
     "active": true
    },
    {
     "fs": "W3",
     "iata": "W3",
     "icao": "ARA",
     "name": "Arik Air",
     "active": true
    },
    {
     "fs": "O4",
     "iata": "O4",
     "icao": "ABV",
     "name": "Antrak Air",
     "active": true
    },
    {
     "fs": "VB",
     "iata": "VB",
     "icao": "VIV",
     "name": "VivaAerobus",
     "active": true
    },
    {
     "fs": "QD",
     "iata": "QD",
     "name": "AeroVIP (Uruguay)",
     "active": true
    },
    {
     "fs": "U6",
     "iata": "U6",
     "icao": "SVR",
     "name": "Ural Airlines",
     "active": true
    },
    {
     "fs": "ZU",
     "iata": "ZU",
     "icao": "BBT",
     "name": "Bashkortavia",
     "active": true
    },
    {
     "fs": "B7",
     "iata": "B7",
     "icao": "UIA",
     "name": "UNI Air",
     "active": true
    },
    {
     "fs": "3S",
     "iata": "3S",
     "icao": "GUY",
     "name": "Air Antilles Express",
     "active": true
    },
    {
     "fs": "R3",
     "iata": "R3",
     "icao": "SYL",
     "name": "Yakutia",
     "active": true
    },
    {
     "fs": "KG",
     "iata": "KG",
     "icao": "GTV",
     "name": "Aerogaviota",
     "active": true
    },
    {
     "fs": "TD",
     "iata": "TD",
     "icao": "LUR",
     "name": "Atlantis European Airways",
     "active": true
    },
    {
     "fs": "BRP",
     "icao": "BRP",
     "name": "AeroBratsk",
     "active": true
    },
    {
     "fs": "KC",
     "iata": "KC",
     "icao": "KZR",
     "name": "Air Astana",
     "active": true
    },
    {
     "fs": "VW",
     "iata": "VW",
     "icao": "TAO",
     "name": "Aeromar",
     "active": true
    },
    {
     "fs": "YT",
     "iata": "YT",
     "icao": "NYT",
     "name": "Yeti Airlines",
     "active": true
    },
    {
     "fs": "AFW",
     "iata": "AW",
     "icao": "AFW",
     "name": "Africa World Airlines",
     "active": true
    },
    {
     "fs": "IS*",
     "iata": "IS",
     "icao": "PNX",
     "name": "AIS Airlines",
     "active": true
    },
    {
     "fs": "VL*",
     "iata": "VL",
     "icao": "MEV",
     "name": "Med View Airlines",
     "active": true
    },
    {
     "fs": "ATM",
     "icao": "ATM",
     "name": "Par Avion Airlines",
     "active": true
    },
    {
     "fs": "CC",
     "iata": "CC",
     "icao": "ABD",
     "name": "Air Atlanta Icelandic",
     "active": true
    },
    {
     "fs": "AOS",
     "icao": "AOS",
     "name": "Aeros Flight Training",
     "active": true
    },
    {
     "fs": "QU",
     "iata": "QU",
     "icao": "UTN",
     "name": "UTair-Ukraine",
     "active": true
    },
    {
     "fs": "PJ",
     "iata": "PJ",
     "icao": "SPM",
     "name": "Air Saint-Pierre",
     "active": true
    },
    {
     "fs": "CG",
     "iata": "CG",
     "icao": "TOK",
     "name": "Airlines PNG",
     "active": true
    },
    {
     "fs": "UT",
     "iata": "UT",
     "icao": "UTA",
     "name": "UTair",
     "active": true
    },
    {
     "fs": "4N",
     "iata": "4N",
     "icao": "ANT",
     "name": "Air North",
     "active": true
    },
    {
     "fs": "UJX",
     "iata": "UH",
     "icao": "UJX",
     "name": "Atlasjet Ukraine",
     "active": true
    },
    {
     "fs": "XU",
     "iata": "XU",
     "icao": "AXK",
     "name": "African Express Airways",
     "active": true
    },
    {
     "fs": "DO",
     "iata": "VK",
     "icao": "RVL",
     "name": "Air Vallee",
     "active": true
    },
    {
     "fs": "I4A",
     "iata": "I4",
     "name": "Airlink",
     "active": true
    },
    {
     "fs": "4H",
     "iata": "4H",
     "icao": "UBD",
     "name": "United Airways (BD)",
     "active": true
    },
    {
     "fs": "OR",
     "iata": "OR",
     "icao": "TFL",
     "name": "ArkeFly",
     "active": true
    },
    {
     "fs": "D4",
     "iata": "D4",
     "icao": "LID",
     "name": "Alidaunia",
     "active": true
    },
    {
     "fs": "OY",
     "iata": "OY",
     "icao": "ANS",
     "name": "Andes Lineas Aereas",
     "active": true
    },
    {
     "fs": "5F",
     "iata": "5F",
     "icao": "CIR",
     "name": "Arctic Circle Air",
     "active": true
    },
    {
     "fs": "VT",
     "iata": "VT",
     "icao": "VTA",
     "name": "Air Tahiti",
     "active": true
    },
    {
     "fs": "UF",
     "iata": "UF",
     "icao": "UKM",
     "name": "UM Air",
     "active": true
    },
    {
     "fs": "YQ",
     "iata": "YQ",
     "icao": "POT",
     "name": "Aircompany Polet",
     "active": true
    },
    {
     "fs": "L4*",
     "iata": "L4",
     "icao": "LGC",
     "name": "Legacy Air",
     "active": true
    },
    {
     "fs": "KX",
     "iata": "KX",
     "icao": "CAY",
     "name": "Cayman Airways",
     "active": true
    },
    {
     "fs": "JV",
     "iata": "JV",
     "icao": "BLS",
     "name": "Bearskin Airlines",
     "active": true
    },
    {
     "fs": "4I",
     "iata": "4I",
     "icao": "IZM",
     "name": "IZAir",
     "active": true
    },
    {
     "fs": "7I",
     "iata": "7I",
     "icao": "INC",
     "name": "InselAir",
     "active": true
    },
    {
     "fs": "WC",
     "iata": "WC",
     "icao": "ISV",
     "name": "Islena Airlines",
     "active": true
    },
    {
     "fs": "9M",
     "iata": "9M",
     "icao": "GLR",
     "name": "Central Mountain Air",
     "active": true
    },
    {
     "fs": "5B",
     "iata": "5B",
     "icao": "NCH",
     "name": "Chanchangi Airlines",
     "active": true
    },
    {
     "fs": "5H",
     "iata": "5H",
     "icao": "FFV",
     "name": "Fly540",
     "active": true
    },
    {
     "fs": "DQ",
     "iata": "DQ",
     "icao": "CXT",
     "name": "Coastal Air",
     "active": true
    },
    {
     "fs": "TLG",
     "iata": "IN",
     "icao": "TLG",
     "name": "InvestAvia",
     "active": true
    },
    {
     "fs": "DX",
     "iata": "DX",
     "icao": "DTR",
     "name": "Danish Air",
     "active": true
    },
    {
     "fs": "V5",
     "iata": "V5",
     "icao": "VPA",
     "name": "DanubeWings",
     "active": true
    },
    {
     "fs": "MZA",
     "iata": "IH",
     "icao": "MZA",
     "name": "Sapsan Air",
     "active": true
    },
    {
     "fs": "H7",
     "iata": "H7",
     "icao": "EGU",
     "name": "Eagle Air",
     "active": true
    },
    {
     "fs": "EAG",
     "icao": "EAG",
     "name": "Eagle Airways",
     "active": true
    },
    {
     "fs": "4L",
     "iata": "4L",
     "icao": "GIL",
     "name": "Georgian International Airlines",
     "active": true
    },
    {
     "fs": "I8",
     "iata": "I8",
     "icao": "IZA",
     "name": "Izhavia",
     "active": true
    },
    {
     "fs": "FDA",
     "iata": "JH",
     "icao": "FDA",
     "name": "Fuji Dream Airlines",
     "active": true
    },
    {
     "fs": "F2*",
     "iata": "F2",
     "icao": "XLK",
     "name": "Safarilink",
     "active": true
    },
    {
     "fs": "R6",
     "iata": "R6",
     "icao": "DNU",
     "name": "DOT LT",
     "active": true
    },
    {
     "fs": "EP",
     "iata": "EP",
     "icao": "IRC",
     "name": "Iran Aseman Airlines",
     "active": true
    },
    {
     "fs": "ST",
     "iata": "ST",
     "icao": "GMI",
     "name": "Germania",
     "active": true
    },
    {
     "fs": "IRY",
     "icao": "IRY",
     "name": "Eram Air",
     "active": true
    },
    {
     "fs": "IBT",
     "icao": "IBT",
     "name": "Ibertrans Aerea",
     "active": true
    },
    {
     "fs": "7N",
     "iata": "7N",
     "name": "Inland Aviation",
     "active": true
    },
    {
     "fs": "ZQ",
     "iata": "K8",
     "name": "Caribbean Sun Airlines",
     "active": true
    },
    {
     "fs": "7F",
     "iata": "7F",
     "icao": "FAB",
     "name": "First Air",
     "active": true
    },
    {
     "fs": "GOZ",
     "iata": "ZG",
     "icao": "GOZ",
     "name": "Groznyy Avia",
     "active": true
    },
    {
     "fs": "WP",
     "iata": "WP",
     "icao": "MKU",
     "name": "Island Air",
     "active": true
    },
    {
     "fs": "IS",
     "iata": "IS",
     "icao": "ISA",
     "name": "Island Airlines",
     "active": true
    },
    {
     "fs": "S2",
     "iata": "S2",
     "icao": "JLL",
     "name": "JetKonnect",
     "active": true
    },
    {
     "fs": "BPS",
     "icao": "BPS",
     "name": "Base Kft",
     "active": true
    },
    {
     "fs": "FK*",
     "iata": "FK",
     "name": "Kivalliq Air",
     "active": true
    },
    {
     "fs": "FXR",
     "icao": "FXR",
     "name": "Foxair",
     "active": true
    },
    {
     "fs": "DO*",
     "iata": "DO",
     "icao": "DCV",
     "name": "Discovery Airways",
     "active": true
    },
    {
     "fs": "M5",
     "iata": "M5",
     "icao": "KEN",
     "name": "Kenmore Air",
     "active": true
    },
    {
     "fs": "4K",
     "iata": "4K",
     "icao": "KBA",
     "name": "Kenn Borek Air",
     "active": true
    },
    {
     "fs": "SP",
     "iata": "SP",
     "icao": "SAT",
     "name": "SATA - Air Acores",
     "active": true
    },
    {
     "fs": "HZ",
     "iata": "HZ",
     "icao": "SHU",
     "name": "Aurora",
     "active": true
    },
    {
     "fs": "TM",
     "iata": "TM",
     "icao": "LAM",
     "name": "LAM",
     "active": true
    },
    {
     "fs": "LI",
     "iata": "LI",
     "icao": "LIA",
     "name": "LIAT",
     "active": true
    },
    {
     "fs": "MW",
     "iata": "MW",
     "icao": "MUL",
     "name": "Mokulele Airlines",
     "active": true
    },
    {
     "fs": "ZL",
     "iata": "ZL",
     "icao": "RXA",
     "name": "Rex Regional Express ",
     "active": true
    },
    {
     "fs": "Z8",
     "iata": "Z8",
     "name": "Mali Airways",
     "active": true
    },
    {
     "fs": "PTI",
     "iata": "PV",
     "icao": "PTI",
     "name": "PrivatAir Switzerland",
     "active": true
    },
    {
     "fs": "AE",
     "iata": "AE",
     "icao": "MDA",
     "name": "Mandarin Airlines",
     "active": true
    },
    {
     "fs": "6V",
     "iata": "6V",
     "icao": "MRW",
     "name": "Mars RK",
     "active": true
    },
    {
     "fs": "MAU",
     "iata": "L6",
     "icao": "MAI",
     "name": "Mauritania Airlines International",
     "active": true
    },
    {
     "fs": "MJ",
     "iata": "MJ",
     "icao": "MLR",
     "name": "Mihin Lanka",
     "active": true
    },
    {
     "fs": "OM",
     "iata": "OM",
     "icao": "MGL",
     "name": "Miat - Mongolian Airlines",
     "active": true
    },
    {
     "fs": "7Y",
     "iata": "7Y",
     "icao": "NYL",
     "name": "Mid Airlines",
     "active": true
    },
    {
     "fs": "JZ*",
     "iata": "JZ",
     "name": "Jatayu Air",
     "active": true
    },
    {
     "fs": "NHG",
     "iata": "N7",
     "icao": "NHG",
     "name": "Brava Linhas Aereas",
     "active": true
    },
    {
     "fs": "NZM",
     "iata": "NM",
     "icao": "NZM",
     "name": "Mount Cook Airlines",
     "active": true
    },
    {
     "fs": "NOK",
     "iata": "5E",
     "icao": "SGN",
     "name": "Nok Mini",
     "active": true
    },
    {
     "fs": "NVR",
     "iata": "N9",
     "icao": "NVR",
     "name": "Novair",
     "active": true
    },
    {
     "fs": "FNA",
     "icao": "FNA",
     "name": "Norlandair",
     "active": true
    },
    {
     "fs": "NRC",
     "icao": "NRC",
     "name": "North Sea Airways",
     "active": true
    },
    {
     "fs": "HW",
     "iata": "HW",
     "icao": "NWL",
     "name": "North-Wright Airways",
     "active": true
    },
    {
     "fs": "7M",
     "iata": "7M",
     "icao": "MYI",
     "name": "MAYAir",
     "active": true
    },
    {
     "fs": "KGZ",
     "iata": "LK",
     "icao": "KGZ",
     "name": "Kyrgyz Airlines",
     "active": true
    },
    {
     "fs": "EC",
     "iata": "EC",
     "icao": "BOS",
     "name": "OpenSkies",
     "active": true
    },
    {
     "fs": "OJ",
     "iata": "OJ",
     "icao": "OLA",
     "name": "Overland Airways",
     "active": true
    },
    {
     "fs": "3F",
     "iata": "3F",
     "name": "Pacific Airways",
     "active": true
    },
    {
     "fs": "8P",
     "iata": "8P",
     "icao": "PCO",
     "name": "Pacific Coastal Airlines",
     "active": true
    },
    {
     "fs": "HI",
     "iata": "HI",
     "name": "Papillon Airways",
     "active": true
    },
    {
     "fs": "P6",
     "iata": "P6",
     "icao": "PSC",
     "name": "Pascan Aviation",
     "active": true
    },
    {
     "fs": "PB",
     "iata": "PB",
     "icao": "SPR",
     "name": "Provincial Airlines",
     "active": true
    },
    {
     "fs": "WZ",
     "iata": "WZ",
     "icao": "RWZ",
     "name": "Red Wings",
     "active": true
    },
    {
     "fs": "RZ",
     "iata": "RZ",
     "icao": "LRS",
     "name": "SANSA Regional",
     "active": true
    },
    {
     "fs": "ON",
     "iata": "ON",
     "icao": "RON",
     "name": "Our Airline",
     "active": true
    },
    {
     "fs": "KS",
     "iata": "KS",
     "icao": "PEN",
     "name": "PenAir",
     "active": true
    },
    {
     "fs": "PW",
     "iata": "PW",
     "icao": "PRF",
     "name": "Precision Air",
     "active": true
    },
    {
     "fs": "TYA",
     "iata": "Y7",
     "icao": "TYA",
     "name": "NordStar Airlines",
     "active": true
    },
    {
     "fs": "PV",
     "iata": "PV",
     "icao": "SBU",
     "name": "Saint Barth Commuter",
     "active": true
    },
    {
     "fs": "S6",
     "iata": "S6",
     "name": "Salmon Air",
     "active": true
    },
    {
     "fs": "ACS",
     "icao": "ACS",
     "name": "ASSL",
     "active": true
    },
    {
     "fs": "UR",
     "iata": "UR",
     "icao": "UTX",
     "name": "UTair-Express",
     "active": true
    },
    {
     "fs": "3E",
     "iata": "3E",
     "icao": "WBR",
     "name": "Air Choice One",
     "active": true
    },
    {
     "fs": "S4",
     "iata": "S4",
     "icao": "RZO",
     "name": "SATA Internacional",
     "active": true
    },
    {
     "fs": "QS",
     "iata": "QS",
     "icao": "TVS",
     "name": "SmartWings",
     "active": true
    },
    {
     "fs": "DG",
     "iata": "DG",
     "icao": "SRQ",
     "name": "Tigerair Philippines",
     "active": true
    },
    {
     "fs": "PI",
     "iata": "PI",
     "icao": "SUF",
     "name": "Fiji Link",
     "active": true
    },
    {
     "fs": "YR",
     "iata": "YR",
     "icao": "SCE",
     "name": "Scenic Airlines",
     "active": true
    },
    {
     "fs": "SD",
     "iata": "SD",
     "icao": "SUD",
     "name": "Sudan Airways",
     "active": true
    },
    {
     "fs": "PY",
     "iata": "PY",
     "icao": "SLM",
     "name": "Surinam Airways",
     "active": true
    },
    {
     "fs": "Q6",
     "iata": "Q6",
     "icao": "SKP",
     "name": "Skytrans",
     "active": true
    },
    {
     "fs": "DT",
     "iata": "DT",
     "icao": "DTA",
     "name": "TAAG",
     "active": true
    },
    {
     "fs": "VR",
     "iata": "VR",
     "icao": "TCV",
     "name": "TACV",
     "active": true
    },
    {
     "fs": "9T",
     "iata": "9T",
     "icao": "ABS",
     "name": "Transwest Air",
     "active": true
    },
    {
     "fs": "V2",
     "iata": "V2",
     "icao": "RBY",
     "name": "Vision Airlines",
     "active": true
    },
    {
     "fs": "AAI",
     "icao": "AAI",
     "name": "Air Aurora",
     "active": true
    },
    {
     "fs": "UNF",
     "icao": "UNF",
     "name": "Union Flights",
     "active": true
    },
    {
     "fs": "IE",
     "iata": "IE",
     "icao": "SOL",
     "name": "Solomon Airlines",
     "active": true
    },
    {
     "fs": "TYJ",
     "icao": "TJS",
     "name": "Tyrolean Jet Service",
     "active": true
    },
    {
     "fs": "VES",
     "iata": "V4",
     "icao": "VES",
     "name": "Vieques Air Link",
     "active": true
    },
    {
     "fs": "BDI",
     "icao": "BDI",
     "name": "BenAir",
     "active": true
    },
    {
     "fs": "WDA",
     "iata": "9C",
     "icao": "WDA",
     "name": "Wimbi Dira",
     "active": true
    },
    {
     "fs": "DVR",
     "icao": "DVR",
     "name": "Divi Divi Air",
     "active": true
    },
    {
     "fs": "TAN",
     "iata": "B4",
     "icao": "TAN",
     "name": "ZanAir",
     "active": true
    },
    {
     "fs": "AAB",
     "icao": "AAB",
     "name": "Abelag Aviation",
     "active": true
    },
    {
     "fs": "BOX",
     "iata": "3S",
     "icao": "BOX",
     "name": "AeroLogic",
     "active": true
    },
    {
     "fs": "M3",
     "iata": "M3",
     "icao": "TUS",
     "name": "ABSA",
     "active": true
    },
    {
     "fs": "QO",
     "iata": "QO",
     "icao": "MPX",
     "name": "AeroMexico Cargo",
     "active": true
    },
    {
     "fs": "ADN",
     "icao": "ADN",
     "name": "Aero Dienst",
     "active": true
    },
    {
     "fs": "3W*",
     "iata": "3W",
     "name": "Malawian Airlines",
     "active": true
    },
    {
     "fs": "BF*",
     "iata": "BF",
     "icao": "RSR",
     "name": "Aero-Service",
     "active": true
    },
    {
     "fs": "Q7",
     "iata": "Q7",
     "icao": "SBM",
     "name": "SkyBahamas",
     "active": true
    },
    {
     "fs": "VTM",
     "icao": "VTM",
     "name": "Aeronaves TSM",
     "active": true
    },
    {
     "fs": "MY",
     "iata": "M7",
     "icao": "MAA",
     "name": "MasAir",
     "active": true
    },
    {
     "fs": "6R",
     "iata": "6R",
     "icao": "TNO",
     "name": "AeroUnion",
     "active": true
    },
    {
     "fs": "CV*",
     "iata": "CV",
     "icao": "CVA",
     "name": "Air Chathams",
     "active": true
    },
    {
     "fs": "GQ",
     "iata": "GQ",
     "icao": "SEH",
     "name": "Sky Express",
     "active": true
    },
    {
     "fs": "QQ",
     "iata": "QQ",
     "icao": "UTY",
     "name": "Alliance Airlines",
     "active": true
    },
    {
     "fs": "7T*",
     "iata": "7T",
     "icao": "AGV",
     "name": "Air Glaciers",
     "active": true
    },
    {
     "fs": "6O",
     "iata": "6O",
     "icao": "ASJ",
     "name": "Exact Air",
     "active": true
    },
    {
     "fs": "O9",
     "iata": "O9",
     "icao": "NOV",
     "name": "Nova Airways",
     "active": true
    },
    {
     "fs": "4A*",
     "iata": "4A",
     "icao": "AKL",
     "name": "Air Kiribati",
     "active": true
    },
    {
     "fs": "DR",
     "iata": "DR",
     "name": "Air Link",
     "active": true
    },
    {
     "fs": "AEY",
     "iata": "I9",
     "icao": "AEY",
     "name": "Air Italy",
     "active": true
    },
    {
     "fs": "VIM",
     "iata": "VL",
     "icao": "VIM",
     "name": "Air Via",
     "active": true
    },
    {
     "fs": "GZ",
     "iata": "GZ",
     "name": "Air Rarotonga",
     "active": true
    },
    {
     "fs": "HM",
     "iata": "HM",
     "icao": "SEY",
     "name": "Air Seychelles",
     "active": true
    },
    {
     "fs": "4D",
     "iata": "4D",
     "icao": "ASD",
     "name": "Air Sinai",
     "active": true
    },
    {
     "fs": "YI",
     "iata": "YI",
     "icao": "RSI",
     "name": "Air Sunshine",
     "active": true
    },
    {
     "fs": "APF",
     "iata": "HP",
     "icao": "APF",
     "name": "Amapola",
     "active": true
    },
    {
     "fs": "8T",
     "iata": "8T",
     "name": "Air Tindi",
     "active": true
    },
    {
     "fs": "LTD",
     "iata": "9X",
     "icao": "LTD",
     "name": "Southern Airways Express",
     "active": true
    },
    {
     "fs": "MHS",
     "iata": "E9",
     "icao": "MHS",
     "name": "Air Memphis",
     "active": true
    },
    {
     "fs": "MC",
     "iata": "MC",
     "icao": "RCH",
     "name": "Air Mobility Command",
     "active": true
    },
    {
     "fs": "WAF",
     "iata": "F4",
     "icao": "WAF",
     "name": "Air Flamenco",
     "active": true
    },
    {
     "fs": "4P*",
     "iata": "4P",
     "name": "Travel Air",
     "active": true
    },
    {
     "fs": "HE",
     "iata": "HE",
     "icao": "LGW",
     "name": "LGW",
     "active": true
    },
    {
     "fs": "APC",
     "icao": "APC",
     "name": "Airpac Airlines",
     "active": true
    },
    {
     "fs": "NQ",
     "iata": "NQ",
     "icao": "AJX",
     "name": "Air Japan",
     "active": true
    },
    {
     "fs": "ZK*",
     "iata": "ZK",
     "icao": "ZAV",
     "name": "Aircompany ZetAvia",
     "active": true
    },
    {
     "fs": "AWK",
     "icao": "AWK",
     "name": "Airwork (NZ)",
     "active": true
    },
    {
     "fs": "6N",
     "iata": "NR",
     "icao": "MHK",
     "name": "Al-Naser Airlines",
     "active": true
    },
    {
     "fs": "N6",
     "iata": "N6",
     "icao": "AYL",
     "name": "Alpine Air",
     "active": true
    },
    {
     "fs": "KO",
     "iata": "KO",
     "icao": "AER",
     "name": "ACE Air Cargo",
     "active": true
    },
    {
     "fs": "BBG",
     "iata": "BZ",
     "icao": "BBG",
     "name": "Blue Bird Airways",
     "active": true
    },
    {
     "fs": "AJK",
     "iata": "4W",
     "icao": "AJK",
     "name": "Allied Air",
     "active": true
    },
    {
     "fs": "3A",
     "iata": "3A",
     "name": "Alliance Airlines",
     "active": true
    },
    {
     "fs": "X4",
     "iata": "X4",
     "name": "Air Excursions",
     "active": true
    },
    {
     "fs": "USC",
     "icao": "USC",
     "name": "AirNet",
     "active": true
    },
    {
     "fs": "ALC",
     "icao": "ALC",
     "name": "American Linehaul Corporation",
     "active": true
    },
    {
     "fs": "SMJ",
     "iata": "Z3",
     "icao": "SMJ",
     "name": "Avient Aviation",
     "active": true
    },
    {
     "fs": "M6",
     "iata": "M6",
     "icao": "AJT",
     "name": "Amerijet International",
     "active": true
    },
    {
     "fs": "X9",
     "iata": "X9",
     "icao": "NVD",
     "name": "JSC Avion Express",
     "active": true
    },
    {
     "fs": "JW",
     "iata": "JW",
     "icao": "VNL",
     "name": "Vanilla Air",
     "active": true
    },
    {
     "fs": "RC",
     "iata": "RC",
     "icao": "FLI",
     "name": "Atlantic Airways",
     "active": true
    },
    {
     "fs": "1N",
     "iata": "1N",
     "name": "ANA Cargo",
     "active": true
    },
    {
     "fs": "NGF",
     "icao": "NGF",
     "name": "Angel Flight America",
     "active": true
    },
    {
     "fs": "AGO",
     "icao": "AGO",
     "name": "Angola Air Charter",
     "active": true
    },
    {
     "fs": "ADB",
     "icao": "ADB",
     "name": "Antonov Airlines",
     "active": true
    },
    {
     "fs": "AWS",
     "icao": "AWS",
     "name": "Arab Wings",
     "active": true
    },
    {
     "fs": "PF",
     "iata": "PF",
     "icao": "PRI",
     "name": "Primera Air Scandinavia",
     "active": true
    },
    {
     "fs": "OE*",
     "iata": "OE",
     "icao": "AOT",
     "name": "Asia Overnight Express",
     "active": true
    },
    {
     "fs": "XM*",
     "iata": "XM",
     "icao": "XME",
     "name": "Qantas Freight",
     "active": true
    },
    {
     "fs": "1H",
     "iata": "1H",
     "name": "Asiana Airways Cargo",
     "active": true
    },
    {
     "fs": "ER",
     "iata": "ER",
     "icao": "DHL",
     "name": "Astar Air Cargo",
     "active": true
    },
    {
     "fs": "TLB",
     "icao": "TLB",
     "name": "Atlantique Air Assistance",
     "active": true
    },
    {
     "fs": "AZI",
     "iata": "A2",
     "icao": "AZI",
     "name": "Astra Airlines",
     "active": true
    },
    {
     "fs": "OL",
     "iata": "OL",
     "icao": "OLT",
     "name": "OLT Express Germany",
     "active": true
    },
    {
     "fs": "ZR*",
     "iata": "ZR",
     "icao": "AZS",
     "name": "Aviacon Zitotrans",
     "active": true
    },
    {
     "fs": "GT*",
     "iata": "GT",
     "icao": "AJD",
     "name": "Vista Georgia",
     "active": true
    },
    {
     "fs": "6I",
     "iata": "6I",
     "icao": "VVA",
     "name": "Aviast Air",
     "active": true
    },
    {
     "fs": "CKL",
     "icao": "CKL",
     "name": "Aviation Charter Services",
     "active": true
    },
    {
     "fs": "TCX",
     "iata": "MT",
     "icao": "TCX",
     "name": "Thomas Cook Airlines",
     "active": true
    },
    {
     "fs": "VSR",
     "icao": "VSR",
     "name": "Aviostart",
     "active": true
    },
    {
     "fs": "AHC",
     "icao": "AHC",
     "name": "AZAL Avia Cargo",
     "active": true
    },
    {
     "fs": "9K*",
     "iata": "9K",
     "icao": "AMZ",
     "name": "Amiyi Airlines",
     "active": true
    },
    {
     "fs": "8Q",
     "iata": "8Q",
     "icao": "BAJ",
     "name": "Baker Aviation",
     "active": true
    },
    {
     "fs": "B4*",
     "iata": "B4",
     "icao": "BKA",
     "name": "Bankair",
     "active": true
    },
    {
     "fs": "8N",
     "iata": "8N",
     "icao": "NEF",
     "name": "Barents AirLink",
     "active": true
    },
    {
     "fs": "BVN",
     "icao": "BVN",
     "name": "Baron Aviation Services",
     "active": true
    },
    {
     "fs": "7S",
     "iata": "7S",
     "icao": "RYA",
     "name": "Ryan Air",
     "active": true
    },
    {
     "fs": "V8",
     "iata": "V8",
     "icao": "VAS",
     "name": "Atran",
     "active": true
    },
    {
     "fs": "5Y",
     "iata": "5Y",
     "icao": "GTI",
     "name": "Atlas Air",
     "active": true
    },
    {
     "fs": "8E",
     "iata": "8E",
     "icao": "BRG",
     "name": "Bering Air",
     "active": true
    },
    {
     "fs": "SI",
     "iata": "SI",
     "icao": "BCI",
     "name": "Blue Islands",
     "active": true
    },
    {
     "fs": "HS",
     "iata": "HS",
     "icao": "HSV",
     "name": "Direktflyg",
     "active": true
    },
    {
     "fs": "CE",
     "iata": "CE",
     "icao": "CLG",
     "name": "Chalair",
     "active": true
    },
    {
     "fs": "RLR",
     "icao": "RLR",
     "name": "AirNow",
     "active": true
    },
    {
     "fs": "BF",
     "iata": "BF",
     "icao": "BBD",
     "name": "Bluebird Cargo",
     "active": true
    },
    {
     "fs": "BZ*",
     "iata": "BZ",
     "icao": "BDA",
     "name": "Blue Dart Aviation",
     "active": true
    },
    {
     "fs": "CAI",
     "iata": "XC",
     "icao": "CAI",
     "name": "Corendon Air",
     "active": true
    },
    {
     "fs": "1X",
     "iata": "1X",
     "name": "Buzz Airways",
     "active": true
    },
    {
     "fs": "8N*",
     "iata": "8N",
     "icao": "DNJ",
     "name": "Aerodynamics Inc.",
     "active": true
    },
    {
     "fs": "FQ",
     "iata": "FQ",
     "name": "Brindabella Airlines",
     "active": true
    },
    {
     "fs": "BHL",
     "icao": "BHL",
     "name": "Bristow Helicopters",
     "active": true
    },
    {
     "fs": "BS",
     "iata": "BS",
     "icao": "BIH",
     "name": "British International",
     "active": true
    },
    {
     "fs": "5Z",
     "iata": "5Z",
     "icao": "BML",
     "name": "Bismillah Airlines",
     "active": true
    },
    {
     "fs": "BUC",
     "iata": "H6",
     "icao": "BUC",
     "name": "Bulgarian Air Charter",
     "active": true
    },
    {
     "fs": "J4",
     "iata": "J4",
     "icao": "BFL",
     "name": "Buffalo Airways",
     "active": true
    },
    {
     "fs": "CV",
     "iata": "CV",
     "icao": "CLX",
     "name": "Cargolux",
     "active": true
    },
    {
     "fs": "BCC",
     "iata": "8B",
     "icao": "BCC",
     "name": "Business Air",
     "active": true
    },
    {
     "fs": "YC*",
     "iata": "YC",
     "icao": "CJR",
     "name": "Caverton Helicopters Ltd.",
     "active": true
    },
    {
     "fs": "5C",
     "iata": "5C",
     "icao": "ICL",
     "name": "C.A.L. Cargo Airlines",
     "active": true
    },
    {
     "fs": "BID",
     "icao": "BID",
     "name": "BinAir",
     "active": true
    },
    {
     "fs": "CUT",
     "icao": "CUT",
     "name": "Court Helicopters",
     "active": true
    },
    {
     "fs": "BAI",
     "iata": "4B",
     "name": "Boutique Air",
     "active": true
    },
    {
     "fs": "CCQ",
     "icao": "CCQ",
     "name": "Mustang Aviation",
     "active": true
    },
    {
     "fs": "CSJ",
     "icao": "CSJ",
     "name": "Castle Aviation",
     "active": true
    },
    {
     "fs": "CFA",
     "icao": "CFA",
     "name": "China Flying Dragon Aviation",
     "active": true
    },
    {
     "fs": "CLS",
     "icao": "CLS",
     "name": "Challenge Air",
     "active": true
    },
    {
     "fs": "6Q",
     "iata": "6Q",
     "icao": "SAW",
     "name": "Cham Wings Airlines",
     "active": true
    },
    {
     "fs": "CGD",
     "icao": "CGD",
     "name": "Charlotte, NC Air National Guard",
     "active": true
    },
    {
     "fs": "1M",
     "iata": "1M",
     "name": "China Airlines Cargo",
     "active": true
    },
    {
     "fs": "CK",
     "iata": "CK",
     "icao": "CKK",
     "name": "China Cargo",
     "active": true
    },
    {
     "fs": "BGH",
     "iata": "8H",
     "icao": "BGH",
     "name": "BH Air",
     "active": true
    },
    {
     "fs": "CPT",
     "icao": "CPT",
     "name": "Corporate Air",
     "active": true
    },
    {
     "fs": "CHI",
     "icao": "CHI",
     "name": "Cougar Helicopters",
     "active": true
    },
    {
     "fs": "7C",
     "iata": "7C",
     "icao": "COY",
     "name": "Coyne Airways",
     "active": true
    },
    {
     "fs": "IRO",
     "icao": "IRO",
     "name": "CSA Air",
     "active": true
    },
    {
     "fs": "WE",
     "iata": "WE",
     "icao": "CWC",
     "name": "Centurion Cargo",
     "active": true
    },
    {
     "fs": "LXJ",
     "icao": "LXJ",
     "name": "Flexjet",
     "active": true
    },
    {
     "fs": "HB*",
     "iata": "HB",
     "icao": "AAQ",
     "name": "Asia Atlantic Airlines",
     "active": true
    },
    {
     "fs": "DGX",
     "icao": "DGX",
     "name": "Dasnair",
     "active": true
    },
    {
     "fs": "KI*",
     "iata": "KI",
     "icao": "KCA",
     "name": "Aviatrans K",
     "active": true
    },
    {
     "fs": "LT*",
     "iata": "LT",
     "icao": "LTU",
     "name": "Air Lituanica",
     "active": true
    },
    {
     "fs": "DCS",
     "icao": "DCS",
     "name": "DC Aviation",
     "active": true
    },
    {
     "fs": "L3*",
     "iata": "L3",
     "icao": "JOS",
     "name": "DHL de Guatemala",
     "active": true
    },
    {
     "fs": "EPS",
     "icao": "EPS",
     "name": "Epps Air Service",
     "active": true
    },
    {
     "fs": "8D",
     "iata": "8D",
     "icao": "EXV",
     "name": "FitsAir",
     "active": true
    },
    {
     "fs": "1L",
     "iata": "1L",
     "name": "Dragonair Cargo",
     "active": true
    },
    {
     "fs": "D5",
     "iata": "D5",
     "icao": "DAE",
     "name": "DHL Aero Expreso",
     "active": true
    },
    {
     "fs": "ETJ",
     "iata": "EG",
     "icao": "ETJ",
     "name": "East Air",
     "active": true
    },
    {
     "fs": "3D",
     "iata": "J7",
     "icao": "DNM",
     "name": "Denim Air",
     "active": true
    },
    {
     "fs": "4Y",
     "iata": "4Y",
     "icao": "TUD",
     "name": "Yute Air Alaska",
     "active": true
    },
    {
     "fs": "GI*",
     "iata": "GI",
     "icao": "GMQ",
     "name": "Germania Express",
     "active": true
    },
    {
     "fs": "EM",
     "iata": "EM",
     "icao": "CFS",
     "name": "Empire Airlines",
     "active": true
    },
    {
     "fs": "B8",
     "iata": "B8",
     "icao": "ERT",
     "name": "Eritrean Airlines",
     "active": true
    },
    {
     "fs": "FAT",
     "iata": "FT",
     "icao": "FAT",
     "name": "Farnair Switzerland",
     "active": true
    },
    {
     "fs": "W2",
     "iata": "W2",
     "icao": "FXT",
     "name": "FlexFlight",
     "active": true
    },
    {
     "fs": "K2",
     "iata": "K2",
     "icao": "ELO",
     "name": "EuroLot",
     "active": true
    },
    {
     "fs": "5O",
     "iata": "5O",
     "icao": "FPO",
     "name": "Europe Airpost",
     "active": true
    },
    {
     "fs": "EDW",
     "iata": "WK",
     "icao": "EDW",
     "name": "Edelweiss Air",
     "active": true
    },
    {
     "fs": "1G",
     "iata": "1G",
     "name": "Eva Airways Cargo",
     "active": true
    },
    {
     "fs": "FAH",
     "icao": "FAH",
     "name": "Farnair Hungary",
     "active": true
    },
    {
     "fs": "EZ",
     "iata": "EZ",
     "icao": "EIA",
     "name": "Evergreen International",
     "active": true
    },
    {
     "fs": "ES*",
     "iata": "ES",
     "icao": "DHX",
     "name": "DHL Aviation EEMEA",
     "active": true
    },
    {
     "fs": "FC*",
     "iata": "FC",
     "icao": "FCX",
     "name": "Falcon Express Cargo",
     "active": true
    },
    {
     "fs": "OW",
     "iata": "OW",
     "icao": "EXK",
     "name": "Executive Airlines",
     "active": true
    },
    {
     "fs": "EJM",
     "icao": "EJM",
     "name": "Executive Jet Management",
     "active": true
    },
    {
     "fs": "Z2",
     "iata": "Z2",
     "icao": "EZD",
     "name": "AirAsia Zest",
     "active": true
    },
    {
     "fs": "FY",
     "iata": "FY",
     "icao": "FFM",
     "name": "Firefly",
     "active": true
    },
    {
     "fs": "E7*",
     "iata": "E7",
     "icao": "ESF",
     "name": "Estafeta",
     "active": true
    },
    {
     "fs": "ERA",
     "icao": "ERA",
     "name": "Aerotaxis Tucan",
     "active": true
    },
    {
     "fs": "D0",
     "iata": "D0",
     "icao": "DHK",
     "name": "DHL Air",
     "active": true
    },
    {
     "fs": "IFA",
     "iata": "F3",
     "icao": "IFA",
     "name": "FAI rent-a-jet",
     "active": true
    },
    {
     "fs": "FX",
     "iata": "FX",
     "icao": "FDX",
     "name": "FedEx",
     "active": true
    },
    {
     "fs": "FLX",
     "icao": "FLX",
     "name": "Flight Express",
     "active": true
    },
    {
     "fs": "OPT",
     "icao": "OPT",
     "name": "Flight Options",
     "active": true
    },
    {
     "fs": "RF",
     "iata": "RF",
     "icao": "FWL",
     "name": "Florida West International Airways",
     "active": true
    },
    {
     "fs": "FHY",
     "iata": "FH",
     "icao": "FHY",
     "name": "Freebird Airlines",
     "active": true
    },
    {
     "fs": "FYG",
     "icao": "FYG",
     "name": "Flying Service",
     "active": true
    },
    {
     "fs": "1F",
     "iata": "1F",
     "name": "Forward Air",
     "active": true
    },
    {
     "fs": "FRG",
     "icao": "FRG",
     "name": "Freight Runners Express",
     "active": true
    },
    {
     "fs": "PP",
     "iata": "PP",
     "icao": "PJS",
     "name": "Jet Aviation",
     "active": true
    },
    {
     "fs": "GMA",
     "icao": "GMA",
     "name": "Gama Aviation",
     "active": true
    },
    {
     "fs": "GP*",
     "iata": "G5",
     "icao": "GES",
     "name": "Gestair",
     "active": true
    },
    {
     "fs": "9I",
     "iata": "9I",
     "icao": "HTA",
     "name": "Helitrans AS",
     "active": true
    },
    {
     "fs": "GBG",
     "iata": "7G",
     "icao": "GBG",
     "name": "Global Jet",
     "active": true
    },
    {
     "fs": "GSS",
     "iata": "XH",
     "icao": "GSS",
     "name": "Global Supply Systems",
     "active": true
    },
    {
     "fs": "XM1",
     "iata": "XM",
     "icao": "JLJ",
     "name": "J-Air",
     "active": true
    },
    {
     "fs": "5M",
     "iata": "5M",
     "icao": "MNT",
     "name": "FlyMontserrat ",
     "active": true
    },
    {
     "fs": "JB",
     "iata": "JB",
     "icao": "JBA",
     "name": "Helijet International",
     "active": true
    },
    {
     "fs": "GH",
     "iata": "GH",
     "icao": "GLP",
     "name": "Globus",
     "active": true
    },
    {
     "fs": "QP",
     "iata": "QP",
     "icao": "SLT",
     "name": "Starlight Airlines",
     "active": true
    },
    {
     "fs": "IMP",
     "iata": "HT",
     "icao": "IMP",
     "name": "Hellenic Imperial Airways",
     "active": true
    },
    {
     "fs": "IU",
     "iata": "IU",
     "name": "Hevi Lift (PNG)",
     "active": true
    },
    {
     "fs": "GY*",
     "iata": "GY",
     "icao": "BIS",
     "name": "Sky Bishkek",
     "active": true
    },
    {
     "fs": "NTH",
     "icao": "NTH",
     "name": "Hokkaido Air System",
     "active": true
    },
    {
     "fs": "UV",
     "iata": "UV",
     "icao": "INR",
     "name": "INAER",
     "active": true
    },
    {
     "fs": "HB",
     "iata": "HB",
     "name": "Homer Air",
     "active": true
    },
    {
     "fs": "B9",
     "iata": "B9",
     "icao": "IRB",
     "name": "Iran Airtour Airline",
     "active": true
    },
    {
     "fs": "II",
     "iata": "II",
     "icao": "CSQ",
     "name": "IBC Airways",
     "active": true
    },
    {
     "fs": "IFL",
     "icao": "IFL",
     "name": "IFL Group",
     "active": true
    },
    {
     "fs": "V8*",
     "iata": "V8",
     "icao": "IAR",
     "name": "Iliamna Air Taxi",
     "active": true
    },
    {
     "fs": "IFT",
     "icao": "IFT",
     "name": "Interflight",
     "active": true
    },
    {
     "fs": "5Y*",
     "iata": "5Y",
     "icao": "IOS",
     "name": "Isles Of Scilly Skybus",
     "active": true
    },
    {
     "fs": "JF*",
     "iata": "JF",
     "icao": "JAA",
     "name": "Jet Asia Airways",
     "active": true
    },
    {
     "fs": "1J",
     "iata": "1J",
     "name": "JAL Cargo",
     "active": true
    },
    {
     "fs": "QJ",
     "iata": "QJ",
     "name": "Jet Airways",
     "active": true
    },
    {
     "fs": "JAG",
     "icao": "JAG",
     "name": "Jetalliance Flugbetriebs",
     "active": true
    },
    {
     "fs": "JEF",
     "icao": "JEF",
     "name": "Jetflite",
     "active": true
    },
    {
     "fs": "H4",
     "iata": "H4",
     "icao": "HLI",
     "name": "Heli Securite",
     "active": true
    },
    {
     "fs": "MG",
     "iata": "MG",
     "icao": "MIX",
     "name": "Midex Airlines",
     "active": true
    },
    {
     "fs": "MVI",
     "icao": "MVI",
     "name": "Harrods Aviation",
     "active": true
    },
    {
     "fs": "6R*",
     "iata": "6R",
     "icao": "DRU",
     "name": "Alrosa Air",
     "active": true
    },
    {
     "fs": "MSA",
     "iata": "7M",
     "icao": "MSA",
     "name": "Mistral Air",
     "active": true
    },
    {
     "fs": "KHO",
     "iata": "KO",
     "icao": "KHO",
     "name": "Aircompany KHORS",
     "active": true
    },
    {
     "fs": "JG",
     "iata": "JO",
     "icao": "JTG",
     "name": "Jet Time",
     "active": true
    },
    {
     "fs": "K4",
     "iata": "K4",
     "icao": "CKS",
     "name": "Kalitta Air",
     "active": true
    },
    {
     "fs": "KT",
     "iata": "KT",
     "name": "Katami Air",
     "active": true
    },
    {
     "fs": "KFA",
     "iata": "KW",
     "icao": "KFA",
     "name": "Kelowna Flightcraft Air Charter",
     "active": true
    },
    {
     "fs": "BZ",
     "iata": "BZ",
     "icao": "KEE",
     "name": "Keystone Air",
     "active": true
    },
    {
     "fs": "BEZ",
     "icao": "BEZ",
     "name": "Kingfisher Air Service",
     "active": true
    },
    {
     "fs": "1K",
     "iata": "1K",
     "name": "Korean Air Cargo",
     "active": true
    },
    {
     "fs": "KTS",
     "icao": "KTS",
     "name": "Kotlas Air",
     "active": true
    },
    {
     "fs": "LYD",
     "icao": "LYD",
     "name": "LyddAir",
     "active": true
    },
    {
     "fs": "BSK",
     "iata": "LL",
     "icao": "BSK",
     "name": "Miami Air International",
     "active": true
    },
    {
     "fs": "MNL",
     "icao": "MNL",
     "name": "MiniLiner",
     "active": true
    },
    {
     "fs": "XC",
     "iata": "XC",
     "icao": "KDC",
     "name": "KD Air",
     "active": true
    },
    {
     "fs": "SKQ",
     "icao": "SKQ",
     "name": "LabCorp",
     "active": true
    },
    {
     "fs": "LE",
     "iata": "LE",
     "name": "Laparkan Airways",
     "active": true
    },
    {
     "fs": "J6",
     "iata": "J6",
     "name": "Larry's Flying Service",
     "active": true
    },
    {
     "fs": "LAU",
     "icao": "LAU",
     "name": "Lineas Aereas Suramericanas",
     "active": true
    },
    {
     "fs": "3B",
     "iata": "3B",
     "icao": "JBR",
     "name": "Central Connect Airlines",
     "active": true
    },
    {
     "fs": "LNX",
     "icao": "LNX",
     "name": "London Executive Aviation",
     "active": true
    },
    {
     "fs": "M2",
     "icao": "MZS",
     "name": "Mahfooz Aviation",
     "active": true
    },
    {
     "fs": "UC",
     "iata": "UC",
     "icao": "LCO",
     "name": "LAN Cargo",
     "active": true
    },
    {
     "fs": "M2*",
     "iata": "M2",
     "name": "Millon Express",
     "active": true
    },
    {
     "fs": "4R*",
     "iata": "4R",
     "icao": "ABG",
     "name": "Royal Flight Airlines",
     "active": true
    },
    {
     "fs": "MDH",
     "iata": "3Y",
     "icao": "MDH",
     "name": "Madina Air",
     "active": true
    },
    {
     "fs": "EAA",
     "iata": "KR",
     "icao": "EAA",
     "name": "Air Bishkek",
     "active": true
    },
    {
     "fs": "KN*",
     "iata": "KN",
     "name": "Maroomba Airlines",
     "active": true
    },
    {
     "fs": "MRA",
     "icao": "MRA",
     "name": "Martinaire",
     "active": true
    },
    {
     "fs": "FQ*",
     "iata": "HQ",
     "icao": "TCW",
     "name": "Thomas Cook Belgium",
     "active": true
    },
    {
     "fs": "JE",
     "iata": "JE",
     "icao": "MNO",
     "name": "Mango",
     "active": true
    },
    {
     "fs": "4X*",
     "iata": "4X",
     "icao": "MEC",
     "name": "Mercury World Cargo",
     "active": true
    },
    {
     "fs": "N9",
     "iata": "N9",
     "icao": "QNK",
     "name": "Kabo Air",
     "active": true
    },
    {
     "fs": "MEI",
     "icao": "MEI",
     "name": "Merlin Airways",
     "active": true
    },
    {
     "fs": "KFS",
     "iata": "K9",
     "icao": "KFS",
     "name": "Kalitta Charters",
     "active": true
    },
    {
     "fs": "MB",
     "iata": "MB",
     "icao": "MNB",
     "name": "MNG Airlines",
     "active": true
    },
    {
     "fs": "2M",
     "iata": "2M",
     "icao": "MDV",
     "name": "Moldavian Airlines",
     "active": true
    },
    {
     "fs": "YM",
     "iata": "YM",
     "icao": "MGX",
     "name": "Montenegro Airlines",
     "active": true
    },
    {
     "fs": "MAI",
     "icao": "MAX",
     "name": "Max Aviation",
     "active": true
    },
    {
     "fs": "MAL",
     "icao": "MAL",
     "name": "Morningstar Air Express",
     "active": true
    },
    {
     "fs": "XY",
     "iata": "XY",
     "icao": "KNE",
     "name": "flynas",
     "active": true
    },
    {
     "fs": "N8",
     "iata": "N8",
     "icao": "NCR",
     "name": "National Airlines",
     "active": true
    },
    {
     "fs": "UB",
     "iata": "UB",
     "icao": "UBA",
     "name": "Myanma Airways",
     "active": true
    },
    {
     "fs": "ZN",
     "iata": "ZN",
     "icao": "NAY",
     "name": "NAYSA",
     "active": true
    },
    {
     "fs": "KZ",
     "iata": "KZ",
     "icao": "NCA",
     "name": "NCA - Nippon Cargo Airlines",
     "active": true
    },
    {
     "fs": "GO*",
     "iata": "GO",
     "icao": "KZU",
     "name": "ULS Airlines Cargo",
     "active": true
    },
    {
     "fs": "5C*",
     "iata": "5C",
     "icao": "NRR",
     "name": "Nature Air",
     "active": true
    },
    {
     "fs": "NAS",
     "icao": "NAS",
     "name": "NASA",
     "active": true
    },
    {
     "fs": "CAD",
     "iata": "8F",
     "icao": "CAD",
     "name": "Cardig Air",
     "active": true
    },
    {
     "fs": "M3*",
     "iata": "M3",
     "icao": "NFA",
     "name": "Air Norway",
     "active": true
    },
    {
     "fs": "NJE",
     "icao": "NJE",
     "name": "NetJets Europe",
     "active": true
    },
    {
     "fs": "BK",
     "iata": "BK",
     "icao": "OKA",
     "name": "Okay Airways",
     "active": true
    },
    {
     "fs": "PC",
     "iata": "PC",
     "icao": "PGT",
     "name": "Pegasus",
     "active": true
    },
    {
     "fs": "YH*",
     "iata": "YH",
     "name": "Sunsplash Aviation",
     "active": true
    },
    {
     "fs": "5K",
     "iata": "5K",
     "icao": "ODS",
     "name": "Odessa Airlines",
     "active": true
    },
    {
     "fs": "OAE",
     "iata": "OY",
     "icao": "OAE",
     "name": "Omni Air International",
     "active": true
    },
    {
     "fs": "BJ",
     "iata": "BJ",
     "icao": "LBT",
     "name": "Nouvelair Tunisie",
     "active": true
    },
    {
     "fs": "RCY",
     "icao": "RCY",
     "name": "Package Express, Inc.",
     "active": true
    },
    {
     "fs": "6I*",
     "iata": "6I",
     "icao": "MMD",
     "name": "Air Alsie",
     "active": true
    },
    {
     "fs": "MTN",
     "iata": "C2",
     "icao": "MTN",
     "name": "Mountain Air Cargo",
     "active": true
    },
    {
     "fs": "PE",
     "iata": "PE",
     "icao": "PHB",
     "name": "Phoebus Apollo Aviation",
     "active": true
    },
    {
     "fs": "NCB",
     "icao": "NCB",
     "name": "North Cariboo Air",
     "active": true
    },
    {
     "fs": "3X*",
     "iata": "3X",
     "name": "Premier Trans Aire",
     "active": true
    },
    {
     "fs": "8W",
     "iata": "8W",
     "icao": "PWF",
     "name": "Private Wings",
     "active": true
    },
    {
     "fs": "PWA",
     "icao": "PWA",
     "name": "Priester Aviation",
     "active": true
    },
    {
     "fs": "ZP*",
     "iata": "ZP",
     "icao": "AZQ",
     "name": "Silk Way Airlines",
     "active": true
    },
    {
     "fs": "LW",
     "iata": "LW",
     "icao": "NMI",
     "name": "Pacific Wings",
     "active": true
    },
    {
     "fs": "Z3",
     "iata": "Z3",
     "name": "Promech Air",
     "active": true
    },
    {
     "fs": "6D",
     "iata": "6D",
     "icao": "PAS",
     "name": "PT. Pelita Air",
     "active": true
    },
    {
     "fs": "LBQ",
     "icao": "LBQ",
     "name": "Quest Diagnostics",
     "active": true
    },
    {
     "fs": "M9",
     "iata": "M9",
     "icao": "MSI",
     "name": "Motor Sich Airlines",
     "active": true
    },
    {
     "fs": "1I",
     "iata": "1I",
     "icao": "EJA",
     "name": "NetJets Aviation",
     "active": true
    },
    {
     "fs": "RAX",
     "icao": "RAX",
     "name": "Royal Air Charter",
     "active": true
    },
    {
     "fs": "FA*",
     "iata": "FA",
     "icao": "SFR",
     "name": "Safair",
     "active": true
    },
    {
     "fs": "SQC",
     "icao": "SQC",
     "name": "Singapore Airlines Cargo",
     "active": true
    },
    {
     "fs": "SKG",
     "iata": "GV",
     "icao": "SKG",
     "name": "Sky Gabon",
     "active": true
    },
    {
     "fs": "5X",
     "iata": "5X",
     "icao": "UPS",
     "name": "UPS",
     "active": true
    },
    {
     "fs": "W9",
     "iata": "W9",
     "name": "Sky Service",
     "active": true
    },
    {
     "fs": "2E",
     "iata": "2E",
     "name": "Smokey Bay Air",
     "active": true
    },
    {
     "fs": "HJ",
     "iata": "HJ",
     "icao": "TMN",
     "name": "Tasman Cargo Airlines",
     "active": true
    },
    {
     "fs": "F3*",
     "iata": "5K",
     "icao": "SGB",
     "name": "Sky King",
     "active": true
    },
    {
     "fs": "SOO",
     "iata": "9S",
     "icao": "SOO",
     "name": "Southern Air",
     "active": true
    },
    {
     "fs": "QT",
     "iata": "QT",
     "icao": "TPA",
     "name": "Avianca Cargo",
     "active": true
    },
    {
     "fs": "VAL",
     "iata": "BF",
     "icao": "VIN",
     "name": "Vincent Aviation",
     "active": true
    },
    {
     "fs": "TAG",
     "icao": "TAG",
     "name": "TAG Aviation USA",
     "active": true
    },
    {
     "fs": "V4",
     "iata": "V4",
     "icao": "VEC",
     "name": "Vensecar International",
     "active": true
    },
    {
     "fs": "4E",
     "iata": "4E",
     "icao": "TNR",
     "name": "Tanana Air Service",
     "active": true
    },
    {
     "fs": "BNC",
     "icao": "BNC",
     "name": "Sundance Air",
     "active": true
    },
    {
     "fs": "6B",
     "iata": "6B",
     "icao": "BLX",
     "name": "TUIfly Nordic",
     "phoneNumber": "1-800-538-2583",
     "active": true
    },
    {
     "fs": "Q8*",
     "iata": "Q8",
     "icao": "TSG",
     "name": "Trans Air Congo",
     "active": true
    },
    {
     "fs": "JUS",
     "iata": "UJ",
     "icao": "JUS",
     "name": "USA Jet Airlines",
     "active": true
    },
    {
     "fs": "DK",
     "iata": "DK",
     "icao": "VKG",
     "name": "Thomas Cook Airlines Scandinavia",
     "active": true
    },
    {
     "fs": "PBL",
     "icao": "PBL",
     "name": "Virgin Samoa",
     "active": true
    },
    {
     "fs": "K3",
     "iata": "K3",
     "icao": "TQN",
     "name": "Taquan Air",
     "active": true
    },
    {
     "fs": "7E",
     "iata": "7E",
     "icao": "AWU",
     "name": "Sylt Air",
     "active": true
    },
    {
     "fs": "RTM",
     "iata": "7T",
     "icao": "RTM",
     "name": "Trans AM",
     "active": true
    },
    {
     "fs": "UJT",
     "icao": "JNY",
     "name": "Journey Aviation",
     "active": true
    },
    {
     "fs": "TH",
     "iata": "TH",
     "icao": "RMY",
     "name": "Raya Airways",
     "active": true
    },
    {
     "fs": "TL",
     "iata": "N2",
     "icao": "TMA",
     "name": "TMA Cargo",
     "active": true
    },
    {
     "fs": "TST",
     "icao": "TST",
     "name": "Trast",
     "active": true
    },
    {
     "fs": "B3*",
     "iata": "B3",
     "icao": "BTN",
     "name": "Tashi Air",
     "active": true
    },
    {
     "fs": "TRA",
     "iata": "6T",
     "name": "Turks Air",
     "active": true
    },
    {
     "fs": "TYW",
     "icao": "TYW",
     "name": "Tyrol Air Ambulance",
     "active": true
    },
    {
     "fs": "0V",
     "iata": "0V",
     "icao": "VFC",
     "name": "VASCO",
     "active": true
    },
    {
     "fs": "AWC",
     "iata": "ZT",
     "icao": "AWC",
     "name": "Titan Airways",
     "active": true
    },
    {
     "fs": "VIB",
     "icao": "VIB",
     "name": "Vibro Air Flugservice",
     "active": true
    },
    {
     "fs": "VPB",
     "icao": "VPB",
     "name": "Veteran Air",
     "active": true
    },
    {
     "fs": "NN",
     "iata": "NN",
     "icao": "MOV",
     "name": "VIM Airlines",
     "active": true
    },
    {
     "fs": "VI",
     "iata": "VI",
     "icao": "VDA",
     "name": "Volga-Dnepr",
     "active": true
    },
    {
     "fs": "VTK",
     "icao": "VTK",
     "name": "Vostok Airlines",
     "active": true
    },
    {
     "fs": "VC*",
     "iata": "VC",
     "icao": "VAL",
     "name": "Voyageur Airways",
     "active": true
    },
    {
     "fs": "2N",
     "iata": "2N",
     "icao": "NTJ",
     "name": "NextJet ",
     "active": true
    },
    {
     "fs": "Y8",
     "iata": "Y8",
     "icao": "YZR",
     "name": "Yangtze River Express",
     "active": true
    },
    {
     "fs": "WDL",
     "icao": "WDL",
     "name": "WDL Aviation",
     "active": true
    },
    {
     "fs": "2W",
     "iata": "2W",
     "icao": "WLC",
     "name": "Welcome Air",
     "active": true
    },
    {
     "fs": "PT",
     "iata": "PT",
     "icao": "SWN",
     "name": "West Air",
     "active": true
    },
    {
     "fs": "WLX",
     "icao": "WLX",
     "name": "West Air Luxembourg",
     "active": true
    },
    {
     "fs": "8O",
     "iata": "8O",
     "name": "West Coast Air",
     "active": true
    },
    {
     "fs": "YC",
     "iata": "YC",
     "icao": "LLM",
     "name": "Yamal Airlines",
     "active": true
    },
    {
     "fs": "WAE",
     "icao": "WAE",
     "name": "Western Air Express",
     "active": true
    },
    {
     "fs": "WEN",
     "icao": "WEN",
     "name": "WestJet Encore",
     "active": true
    },
    {
     "fs": "WIG",
     "icao": "WIG",
     "name": "Wiggins Airways",
     "active": true
    },
    {
     "fs": "QGA",
     "icao": "QGA",
     "name": "Windrose Air",
     "active": true
    },
    {
     "fs": "WO",
     "iata": "WO",
     "icao": "WOA",
     "name": "World Airways",
     "active": true
    },
    {
     "fs": "8V",
     "iata": "8V",
     "icao": "WRT",
     "name": "Wright Air",
     "active": true
    },
    {
     "fs": "OVA",
     "icao": "OVA",
     "name": "Aeronova",
     "active": true
    },
    {
     "fs": "XP",
     "iata": "XP",
     "icao": "CXP",
     "name": "Xtra Airways",
     "active": true
    },
    {
     "fs": "RS",
     "iata": "RS",
     "icao": "SKV",
     "name": "Sky Regional",
     "active": true
    },
    {
     "fs": "M5*",
     "iata": "M5",
     "icao": "MGC",
     "name": "Air Cargo Mongolia",
     "active": true
    },
    {
     "fs": "7W",
     "iata": "7W",
     "icao": "WRC",
     "name": "Wind Rose Aviation Company",
     "active": true
    },
    {
     "fs": "Q5",
     "iata": "Q5",
     "icao": "MLA",
     "name": "40-Mile Air",
     "active": true
    },
    {
     "fs": "CTA",
     "icao": "CTA",
     "name": "Aero Charter and Transport",
     "active": true
    },
    {
     "fs": "LET",
     "icao": "LET",
     "name": "Aerolineas Ejecutivas",
     "active": true
    },
    {
     "fs": "4W",
     "iata": "4W",
     "icao": "WAV",
     "name": "Warbelow's Air Ventures",
     "active": true
    },
    {
     "fs": "AEP",
     "icao": "AEP",
     "name": "AEROTEC",
     "active": true
    },
    {
     "fs": "PCM",
     "icao": "PCM",
     "name": "West Air (USA)",
     "active": true
    },
    {
     "fs": "AAG",
     "icao": "AAG",
     "name": "Air Atlantique",
     "active": true
    },
    {
     "fs": "8Y",
     "iata": "8Y",
     "icao": "PBU",
     "name": "Air Burundi",
     "active": true
    },
    {
     "fs": "LLC",
     "iata": "S5",
     "icao": "LLC",
     "name": "Small Planet Airlines",
     "active": true
    },
    {
     "fs": "VTE",
     "icao": "VTE",
     "name": "Corporate Flight Management",
     "active": true
    },
    {
     "fs": "AIB",
     "icao": "AIB",
     "name": "Airbus Industrie",
     "active": true
    },
    {
     "fs": "CT",
     "iata": "CT",
     "icao": "CYL",
     "name": "Alitalia CityLiner",
     "active": true
    },
    {
     "fs": "DM*",
     "iata": "DM",
     "icao": "DEX",
     "name": "Asian Air",
     "active": true
    },
    {
     "fs": "XA",
     "iata": "XA",
     "icao": "XAA",
     "name": "ARINC",
     "active": true
    },
    {
     "fs": "RSY",
     "iata": "H5",
     "icao": "RSY",
     "name": "iFly Airlines",
     "active": true
    },
    {
     "fs": "L9",
     "iata": "L9",
     "icao": "BAL",
     "name": "Belle Air Europe",
     "active": true
    },
    {
     "fs": "BGA",
     "iata": "4Y",
     "icao": "BGA",
     "name": "Airbus Transport International",
     "active": true
    },
    {
     "fs": "FUA",
     "iata": "FU",
     "name": "BudgetAir",
     "active": true
    },
    {
     "fs": "MO",
     "iata": "MO",
     "icao": "CAV",
     "name": "Calm Air International",
     "active": true
    },
    {
     "fs": "XW",
     "iata": "XW",
     "icao": "CXH",
     "name": "China Xinhua Airlines",
     "active": true
    },
    {
     "fs": "FYN",
     "icao": "FYN",
     "name": "Comfort Air",
     "active": true
    },
    {
     "fs": "CON",
     "icao": "CON",
     "name": "ConocoPhillips",
     "active": true
    },
    {
     "fs": "H6",
     "iata": "H6",
     "icao": "HAG",
     "name": "Ravn Connect",
     "active": true
    },
    {
     "fs": "THU",
     "icao": "THU",
     "name": "Thunder Airlines",
     "active": true
    },
    {
     "fs": "GAF",
     "icao": "GAF",
     "name": "Luftwaffe",
     "active": true
    },
    {
     "fs": "7Y*",
     "iata": "7Y",
     "name": "Mann Yadanarpon Airlines",
     "active": true
    },
    {
     "fs": "UJC",
     "iata": "UE",
     "icao": "UJC",
     "name": "Ultimate Jetcharters",
     "active": true
    },
    {
     "fs": "FP",
     "iata": "FP",
     "icao": "FRE",
     "name": "Freedom Air",
     "active": true
    },
    {
     "fs": "QUE",
     "icao": "QUE",
     "name": "Gouvernement Du Quebec",
     "active": true
    },
    {
     "fs": "BH",
     "iata": "BH",
     "name": "Hawkair Aviation",
     "active": true
    },
    {
     "fs": "IL",
     "iata": "IL",
     "name": "LankAir",
     "active": true
    },
    {
     "fs": "FW",
     "iata": "FW",
     "icao": "IBX",
     "name": "IBEX Airlines",
     "active": true
    },
    {
     "fs": "4V",
     "iata": "4V",
     "icao": "LCG",
     "name": "Lignes Aeriennes Congolaises",
     "active": true
    },
    {
     "fs": "Y5*",
     "iata": "Y5",
     "icao": "GMR",
     "name": "Golden Myanmar Airlines",
     "active": true
    },
    {
     "fs": "S6*",
     "iata": "S6",
     "icao": "KSZ",
     "name": "Sunrise Airways",
     "active": true
    },
    {
     "fs": "LLY",
     "icao": "LLY",
     "name": "Let's Fly",
     "active": true
    },
    {
     "fs": "VM",
     "iata": "VM",
     "icao": "MCJ",
     "name": "Macair Jet",
     "active": true
    },
    {
     "fs": "GW*",
     "iata": "GW",
     "icao": "SGR",
     "name": "Skygreece Airlines",
     "active": true
    },
    {
     "fs": "SVW",
     "icao": "SVW",
     "name": "Global Jet Luxembourg",
     "active": true
    },
    {
     "fs": "LIS",
     "icao": "LIS",
     "name": "Luk Aero",
     "active": true
    },
    {
     "fs": "2A",
     "iata": "2A",
     "icao": "DBB",
     "name": "Deutsche Bahn",
     "active": true
    },
    {
     "fs": "AYD",
     "icao": "AYD",
     "name": "AB Aviation",
     "active": true
    },
    {
     "fs": "YH",
     "iata": "YH",
     "icao": "AYG",
     "name": "Yangon Airways",
     "active": true
    },
    {
     "fs": "LAV",
     "iata": "JQ",
     "icao": "LAV",
     "name": "AlbaStar",
     "active": true
    },
    {
     "fs": "TWI",
     "iata": "TI",
     "icao": "TWI",
     "name": "Tailwind",
     "active": true
    },
    {
     "fs": "2R",
     "iata": "2R",
     "icao": "VRR",
     "name": "VIA Rail Canada",
     "active": true
    },
    {
     "fs": "9L*",
     "iata": "9L",
     "icao": "WLN",
     "name": "West Link Airlines",
     "active": true
    },
    {
     "fs": "9B",
     "iata": "9B",
     "name": "AccesRail",
     "active": true
    },
    {
     "fs": "2V",
     "iata": "2V",
     "name": "Amtrak",
     "active": true
    },
    {
     "fs": "ERL",
     "iata": "5Y",
     "name": "Express Rail LInk",
     "active": true
    },
    {
     "fs": "NSH",
     "name": "NS Hispeed",
     "active": true
    },
    {
     "fs": "SFR",
     "name": "Swiss Federal Railways",
     "active": true
    },
    {
     "fs": "SRN",
     "icao": "SRN",
     "name": "Sprint Air",
     "active": true
    },
    {
     "fs": "3AC",
     "iata": "3A",
     "name": "Chu Kong Passenger Transport",
     "active": true
    },
    {
     "fs": "2H*",
     "iata": "2H",
     "name": "Thalys International",
     "active": true
    },
    {
     "fs": "9F",
     "iata": "9F",
     "name": "Eurostar",
     "active": true
    },
    {
     "fs": "P1",
     "iata": "P1",
     "name": "PublicCharters.com",
     "active": true
    },
    {
     "fs": "EWR",
     "iata": "ZD",
     "icao": "EWR",
     "name": "EWA Air",
     "active": true
    },
    {
     "fs": "H5*",
     "iata": "H5",
     "name": "Haiti Aviation",
     "active": true
    },
    {
     "fs": "AO*",
     "iata": "AO",
     "name": "Air One Aviation",
     "active": true
    },
    {
     "fs": "TE*",
     "iata": "TE",
     "icao": "IGA",
     "name": "Sky Taxi",
     "active": true
    },
    {
     "fs": "SH",
     "iata": "SH",
     "name": "Sharp Airlines",
     "active": true
    },
    {
     "fs": "GMT",
     "icao": "GMT",
     "name": "Magnicharters",
     "active": true
    },
    {
     "fs": "EX*",
     "iata": "EX",
     "icao": "BJK",
     "name": "Atlantic Airlines",
     "active": true
    },
    {
     "fs": "SWT",
     "iata": "WT",
     "icao": "SWT",
     "name": "Swiftair",
     "active": true
    },
    {
     "fs": "UV*",
     "iata": "UV",
     "icao": "UVA",
     "name": "Universal Airways",
     "active": true
    },
    {
     "fs": "YJ*",
     "iata": "YJ",
     "icao": "AWM",
     "name": "Asian Wings Airways",
     "active": true
    },
    {
     "fs": "VP*",
     "iata": "VP",
     "icao": "VQI",
     "name": "Flyme",
     "active": true
    },
    {
     "fs": "BQ*",
     "iata": "BQ",
     "icao": "BKV",
     "name": "Bukovyna Airlines",
     "active": true
    },
    {
     "fs": "YI*",
     "iata": "YI",
     "icao": "AYE",
     "name": "Yunnan Ying'An Airlines",
     "active": true
    },
    {
     "fs": "XO*",
     "iata": "XO",
     "icao": "SGD",
     "name": "South East Asian Airlines (SEAIR)",
     "active": true
    },
    {
     "fs": "DU*",
     "iata": "DU",
     "icao": "NLH",
     "name": "Norwegian Long Haul",
     "active": true
    },
    {
     "fs": "NWG",
     "icao": "NWG",
     "name": "AirWing",
     "active": true
    },
    {
     "fs": "V9*",
     "iata": "V9",
     "name": "Citywing",
     "active": true
    },
    {
     "fs": "ZX",
     "iata": "ZX",
     "icao": "GGN",
     "name": "Air Georgian",
     "active": true
    },
    {
     "fs": "MEG",
     "iata": "LV",
     "icao": "MEG",
     "name": "MEGA Maldives Airlines",
     "active": true
    },
    {
     "fs": "UY*",
     "iata": "UY",
     "icao": "CSG",
     "name": "Air Caucasus",
     "active": true
    },
    {
     "fs": "MSC",
     "iata": "SM",
     "icao": "MSC",
     "name": "Air Cairo",
     "active": true
    },
    {
     "fs": "SHE",
     "icao": "SHE",
     "name": "Shell Aircraft",
     "active": true
    },
    {
     "fs": "8I*",
     "iata": "8I",
     "icao": "NLU",
     "name": "InselAir Aruba",
     "active": true
    },
    {
     "fs": "7B*",
     "iata": "7B",
     "icao": "MWG",
     "name": "MASwings",
     "active": true
    },
    {
     "fs": "Y6*",
     "iata": "DI",
     "name": "Cambodia Airlines",
     "active": true
    },
    {
     "fs": "BO*",
     "iata": "BO",
     "icao": "BGY",
     "name": "Bingo Airways",
     "active": true
    },
    {
     "fs": "0G",
     "iata": "G6",
     "icao": "GHT",
     "name": "Ghadames Air",
     "active": true
    },
    {
     "fs": "TOW",
     "iata": "T2",
     "icao": "TOW",
     "name": "AirTanker Services Limited",
     "active": true
    },
    {
     "fs": "GAL",
     "icao": "GAL",
     "name": "Alianza Glancelot C.A.",
     "active": true
    },
    {
     "fs": "J4*",
     "iata": "J4",
     "icao": "BDR",
     "name": "Badr Airlines",
     "active": true
    },
    {
     "fs": "FM",
     "iata": "FM",
     "icao": "CSH",
     "name": "Shanghai Airlines",
     "active": true
    },
    {
     "fs": "Y2*",
     "iata": "Y2",
     "icao": "RGN",
     "name": "Cygnus Air",
     "active": true
    },
    {
     "fs": "CRA",
     "iata": "C8",
     "icao": "CRA",
     "name": "Cronos Airlines",
     "active": true
    },
    {
     "fs": "5S",
     "iata": "5S",
     "icao": "GAK",
     "name": "Global Aviation Services",
     "active": true
    },
    {
     "fs": "KMA",
     "iata": "KO",
     "icao": "KMA",
     "name": "Komiaviatrans",
     "active": true
    },
    {
     "fs": "7Q*",
     "iata": "7Q",
     "icao": "MNU",
     "name": "Elite Airways",
     "active": true
    },
    {
     "fs": "VA",
     "iata": "VA",
     "icao": "VOZ",
     "name": "Virgin Australia",
     "active": true
    },
    {
     "fs": "ZA*",
     "iata": "ZA",
     "icao": "SWM",
     "name": "Skywings Asia",
     "active": true
    },
    {
     "fs": "LD",
     "iata": "LD",
     "icao": "AHK",
     "name": "AHK",
     "active": true
    },
    {
     "fs": "VNE",
     "iata": "AW",
     "icao": "VNE",
     "name": "Venezolana",
     "active": true
    },
    {
     "fs": "OI*",
     "iata": "OI",
     "icao": "HND",
     "name": "Hinterland Aviation",
     "active": true
    },
    {
     "fs": "DW",
     "iata": "DW",
     "icao": "UCR",
     "name": "Aero-Charter",
     "active": true
    },
    {
     "fs": "ZS*",
     "iata": "ZS",
     "icao": "KZS",
     "name": "Kazaviaspas",
     "active": true
    },
    {
     "fs": "ALS",
     "iata": "K4",
     "icao": "ALW",
     "name": "ALS",
     "active": true
    },
    {
     "fs": "R4*",
     "iata": "R4",
     "icao": "RLB",
     "name": "RUS Aviation",
     "active": true
    },
    {
     "fs": "N3",
     "iata": "N3",
     "icao": "MAF",
     "name": "Aerolineas MAS",
     "active": true
    },
    {
     "fs": "BIE",
     "iata": "ML",
     "icao": "BIE",
     "name": "Air Mediterranee",
     "active": true
    },
    {
     "fs": "EA*",
     "iata": "EA",
     "icao": "EHN",
     "name": "East Horizon Airlines",
     "active": true
    },
    {
     "fs": "KAI",
     "iata": "KI",
     "icao": "KAI",
     "name": "Kaiser Air",
     "active": true
    },
    {
     "fs": "LCT",
     "icao": "LCT",
     "name": "TAR Aerolineas",
     "active": true
    },
    {
     "fs": "E8",
     "iata": "E8",
     "icao": "SMK",
     "name": "JSC Semeyavia",
     "active": true
    },
    {
     "fs": "7G*",
     "iata": "7G",
     "icao": "SFJ",
     "name": "StarFlyer",
     "active": true
    },
    {
     "fs": "XJ*",
     "iata": "XJ",
     "icao": "TAX",
     "name": "Thai AirAsia X",
     "active": true
    },
    {
     "fs": "EQ",
     "iata": "EQ",
     "icao": "TAE",
     "name": "TAME",
     "active": true
    },
    {
     "fs": "J8",
     "iata": "J8",
     "icao": "BVT",
     "name": "Berjaya Air",
     "active": true
    },
    {
     "fs": "OG",
     "iata": "OG",
     "icao": "ONX",
     "name": "Air Onix",
     "active": true
    },
    {
     "fs": "TC",
     "iata": "TC",
     "icao": "ATC",
     "name": "Air Tanzania",
     "active": true
    },
    {
     "fs": "XT*",
     "iata": "XT",
     "name": "Indonesia AirAsia X",
     "active": true
    },
    {
     "fs": "4B",
     "iata": "4B",
     "icao": "TUP",
     "name": "Aviastar-TU",
     "active": true
    },
    {
     "fs": "T6",
     "iata": "T6",
     "icao": "RNX",
     "name": "1time",
     "active": true
    },
    {
     "fs": "SDA",
     "iata": "S8",
     "icao": "SDA",
     "name": "Sounds Air",
     "active": true
    },
    {
     "fs": "QN*",
     "iata": "QN",
     "icao": "ARR",
     "name": "Air Armenia",
     "active": true
    },
    {
     "fs": "BB",
     "iata": "BB",
     "icao": "SBS",
     "name": "Seaborne Airlines",
     "active": true
    },
    {
     "fs": "ZM*",
     "iata": "ZM",
     "icao": "CNB",
     "name": "Cityline Hungary",
     "active": true
    },
    {
     "fs": "9M*",
     "iata": "9M",
     "icao": "MIH",
     "name": "Massy Airlines",
     "active": true
    },
    {
     "fs": "7Q",
     "iata": "7N",
     "icao": "PWD",
     "name": "Pan American Dominicana",
     "active": true
    },
    {
     "fs": "7H",
     "iata": "7H",
     "icao": "RVF",
     "name": "Ravn Alaska",
     "active": true
    },
    {
     "fs": "DD",
     "iata": "DD",
     "icao": "NOK",
     "name": "Nok Air",
     "active": true
    },
    {
     "fs": "FU*",
     "iata": "FU",
     "name": "Fuzhou Airlines",
     "active": true
    },
    {
     "fs": "8Y*",
     "iata": "CF",
     "icao": "CYZ",
     "name": "China Postal Airlines",
     "active": true
    },
    {
     "fs": "VAX",
     "iata": "ZV",
     "icao": "VAX",
     "name": "V Air",
     "active": true
    },
    {
     "fs": "XN",
     "iata": "XN",
     "icao": "XAR",
     "name": "Xpressair",
     "active": true
    }
  ]

  progress.total = active_airlines.count

  active_airlines.each do |a|
    Airline.create(
      fs:     a[:fs],
      iata:   a[:iata],
      icao:   a[:icao],
      name:   a[:name],
      active: a[:active],
      phone_number: a[:phoneNumber]
    )
    progress.increment
  end
end