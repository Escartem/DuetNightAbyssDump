local T = {}
T.RT_1 = {-500, 2500}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SubRegion", {
  [100101] = {
    RegionId = 1001,
    SubRegionCenter = {3500, 500},
    SubRegionDes = "UI_SUBREGION_DES_100101",
    SubRegionId = 100101,
    SubRegionLevel = "Prologue_Village",
    SubRegionName = "UI_SUBREGION_NAME_100101",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [100102] = {
    RegionId = 1001,
    SubRegionCenter = {23500, 4500},
    SubRegionDes = "UI_SUBREGION_DES_100102",
    SubRegionId = 100102,
    SubRegionLevel = "Prologue_Balcony",
    SubRegionName = "UI_SUBREGION_NAME_100102",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [100103] = {
    RegionId = 1001,
    SubRegionCenter = {27500, 32000},
    SubRegionDes = "UI_SUBREGION_DES_100103",
    SubRegionId = 100103,
    SubRegionLevel = "Prologue_Clouds",
    SubRegionName = "UI_SUBREGION_NAME_100103",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [100104] = {
    RegionId = 1001,
    SubRegionDes = "UI_SUBREGION_DES_100104",
    SubRegionId = 100104,
    SubRegionLevel = "Prologue_Void",
    SubRegionName = "UI_SUBREGION_NAME_100104",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [101101] = {
    RegionId = 1011,
    SubRegionDes = "UI_SUBREGION_DES_101101",
    SubRegionId = 101101,
    SubRegionLevel = "Chapter01_IcelakeCity",
    SubRegionName = "UI_SUBREGION_NAME_101101",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [101103] = {
    RegionId = 1011,
    SubRegionDes = "UI_SUBREGION_DES_101103",
    SubRegionId = 101103,
    SubRegionLevel = "Chapter01_Icelake",
    SubRegionName = "UI_SUBREGION_NAME_101103",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [101104] = {
    NotShowInRegionMap = true,
    RegionId = 1011,
    SubRegionDes = "UI_SUBREGION_DES_101104",
    SubRegionId = 101104,
    SubRegionLevel = "Chapter01_Mee",
    SubRegionName = "UI_SUBREGION_NAME_101104",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [101105] = {
    DefaultQuestPoint = "-1767.0,-12182.0,-4778.969727",
    NotShowInRegionMap = true,
    RegionId = 1011,
    SubRegionDes = "UI_SUBREGION_DES_101105",
    SubRegionId = 101105,
    SubRegionLevel = "Chapter01_OutsidersHome",
    SubRegionName = "UI_SUBREGION_NAME_101105",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [101106] = {
    DefaultQuestPoint = "-2359.0,13571.0,-1880.183105",
    NotShowInRegionMap = true,
    RegionId = 1011,
    SubRegionDes = "UI_SUBREGION_DES_101106",
    SubRegionId = 101106,
    SubRegionLevel = "Chapter01_Sanatorium",
    SubRegionName = "UI_SUBREGION_NAME_101106",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [101107] = {
    DefaultQuestPoint = "-3162.0,-5487.0,-3585.0",
    NotShowInRegionMap = true,
    RegionId = 1011,
    SubRegionDes = "UI_SUBREGION_DES_101107",
    SubRegionId = 101107,
    SubRegionLevel = "Chapter01_Tavern",
    SubRegionName = "UI_SUBREGION_NAME_101107",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [101108] = {
    DefaultQuestPoint = "-36810,4600,-4830",
    NotShowInRegionMap = true,
    RegionId = 1011,
    SubRegionDes = "UI_SUBREGION_DES_101108",
    SubRegionId = 101108,
    SubRegionLevel = "Chapter01_Secr",
    SubRegionName = "UI_SUBREGION_NAME_101108",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [101110] = {
    DefaultQuestPoint = "563,-700,-3688",
    NotShowInRegionMap = true,
    RegionId = 1011,
    SubRegionDes = "UI_SUBREGION_DES_101110",
    SubRegionId = 101110,
    SubRegionLevel = "Chapter01_Sick",
    SubRegionName = "UI_SUBREGION_NAME_101110",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 3
  },
  [101111] = {
    DefaultQuestPoint = "-8023.647949,-7726.219238,-4037",
    NotShowInRegionMap = true,
    RegionId = 1011,
    SubRegionDes = "UI_SUBREGION_DES_101111",
    SubRegionId = 101111,
    SubRegionLevel = "Chapter01_Flow",
    SubRegionName = "UI_SUBREGION_NAME_101111",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [101301] = {
    RegionId = 1013,
    SubRegionDes = "UI_SUBREGION_DES_101301",
    SubRegionId = 101301,
    SubRegionLevel = "Chapter01_Kuangkeng_Part_01",
    SubRegionName = "UI_SUBREGION_NAME_101301",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [101303] = {
    RegionId = 1013,
    SubRegionDes = "UI_SUBREGION_DES_101303",
    SubRegionId = 101303,
    SubRegionLevel = "Chapter01_Kuangkeng_Part_03",
    SubRegionName = "UI_SUBREGION_NAME_101303",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [101304] = {
    RegionId = 1013,
    SubRegionDes = "UI_SUBREGION_DES_101304",
    SubRegionId = 101304,
    SubRegionLevel = "Chapter01_Kuangkeng_Part_04",
    SubRegionName = "UI_SUBREGION_NAME_101304",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [101305] = {
    RegionId = 1013,
    SubRegionDes = "UI_SUBREGION_DES_101305",
    SubRegionId = 101305,
    SubRegionLevel = "Chapter01_Kuangkeng_Part_02",
    SubRegionName = "UI_SUBREGION_NAME_101305",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [101401] = {
    NotShowInRegionMap = true,
    RegionId = 1014,
    SubRegionDes = "UI_SUBREGION_DES_101401",
    SubRegionId = 101401,
    SubRegionLevel = "Chapter01_Won_Part01",
    SubRegionName = "UI_SUBREGION_NAME_101401",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [101402] = {
    NotShowInRegionMap = true,
    RegionId = 1014,
    SubRegionDes = "UI_SUBREGION_DES_101402",
    SubRegionId = 101402,
    SubRegionLevel = "Chapter01_Won_Part02",
    SubRegionName = "UI_SUBREGION_NAME_101402",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [101701] = {
    RegionId = 1017,
    SubRegionCenter = {-20500, 1500},
    SubRegionDes = "UI_SUBREGION_DES_101701",
    SubRegionId = 101701,
    SubRegionLevel = "Chapter01_Sew01",
    SubRegionName = "UI_SUBREGION_NAME_101701",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [101702] = {
    RegionId = 1017,
    SubRegionCenter = {-28500, -15000},
    SubRegionDes = "UI_SUBREGION_DES_101702",
    SubRegionId = 101702,
    SubRegionLevel = "Chapter01_Sew02",
    SubRegionName = "UI_SUBREGION_NAME_101702",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [101703] = {
    RegionId = 1017,
    SubRegionCenter = {-5500, -11500},
    SubRegionDes = "UI_SUBREGION_DES_101703",
    SubRegionId = 101703,
    SubRegionLevel = "Chapter01_Sew03",
    SubRegionName = "UI_SUBREGION_NAME_101703",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [101901] = {
    NpcHideFactor = 10,
    RegionId = 1019,
    SubRegionDes = "UI_SUBREGION_DES_101901",
    SubRegionId = 101901,
    SubRegionLevel = "BH_Thea",
    SubRegionName = "UI_SUBREGION_NAME_101901",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [102101] = {
    RegionId = 1021,
    SubRegionCenter = {14000, -40000},
    SubRegionDes = "UI_SUBREGION_DES_102101",
    SubRegionId = 102101,
    SubRegionLevel = "Haiboliya_Longsha01",
    SubRegionName = "UI_SUBREGION_NAME_102101",
    SubRegionType = "field",
    SwitchPlayer = "EXPlayer",
    SyncPlayerInfo = 1
  },
  [102102] = {
    RegionId = 1021,
    SubRegionCenter = T.RT_1,
    SubRegionDes = "UI_SUBREGION_DES_102102",
    SubRegionId = 102102,
    SubRegionLevel = "Haiboliya_Longsha02",
    SubRegionName = "UI_SUBREGION_NAME_102102",
    SubRegionType = "field",
    SwitchPlayer = "EXPlayer",
    SyncPlayerInfo = 1
  },
  [102103] = {
    RegionId = 1021,
    SubRegionCenter = T.RT_1,
    SubRegionDes = "UI_SUBREGION_DES_102103",
    SubRegionId = 102103,
    SubRegionLevel = "Haiboliya_Longsha03",
    SubRegionName = "UI_SUBREGION_NAME_102103",
    SubRegionType = "field",
    SwitchPlayer = "EXPlayer",
    SyncPlayerInfo = 1
  },
  [102104] = {
    NotShowInRegionMap = true,
    RegionId = 1021,
    SubRegionCenter = T.RT_1,
    SubRegionDes = "UI_SUBREGION_DES_102104",
    SubRegionId = 102104,
    SubRegionLevel = "Haiboliya_Longsha04",
    SubRegionName = "UI_SUBREGION_NAME_102104",
    SubRegionType = "field",
    SwitchPlayer = "EXPlayer",
    SyncPlayerInfo = 1
  },
  [102201] = {
    NotShowInRegionMap = true,
    RegionId = 1022,
    SubRegionDes = "UI_SUBREGION_DES_102201",
    SubRegionId = 102201,
    SubRegionLevel = "EXChapter01_Jail",
    SubRegionName = "UI_SUBREGION_NAME_102201",
    SubRegionType = "field",
    SwitchPlayer = "EXPlayer",
    SyncPlayerInfo = 1
  },
  [103201] = {
    NotShowInRegionMap = true,
    RegionId = 1032,
    SubRegionDes = "UI_SUBREGION_DES_103201",
    SubRegionId = 103201,
    SubRegionLevel = "Chapter01_Alch",
    SubRegionName = "UI_SUBREGION_NAME_103201",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104101] = {
    RegionId = 1041,
    SubRegionDes = "UI_SUBREGION_DES_104101",
    SubRegionId = 104101,
    SubRegionLevel = "Huaxu_Yanjindu_Alt",
    SubRegionName = "UI_SUBREGION_NAME_104101",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104102] = {
    RegionId = 1041,
    SubRegionDes = "UI_SUBREGION_DES_104102",
    SubRegionId = 104102,
    SubRegionLevel = "Huaxu_Yanjindu_Batt",
    SubRegionName = "UI_SUBREGION_NAME_104102",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104103] = {
    RegionId = 1041,
    SubRegionDes = "UI_SUBREGION_DES_104103",
    SubRegionId = 104103,
    SubRegionLevel = "Huaxu_Yanjindu_Cav",
    SubRegionName = "UI_SUBREGION_NAME_104103",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104104] = {
    RegionId = 1041,
    SubRegionDes = "UI_SUBREGION_DES_104104",
    SubRegionId = 104104,
    SubRegionLevel = "Huaxu_Yanjindu_Cen",
    SubRegionName = "UI_SUBREGION_NAME_104104",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104105] = {
    RegionId = 1041,
    SubRegionDes = "UI_SUBREGION_DES_104105",
    SubRegionId = 104105,
    SubRegionLevel = "Huaxu_Yanjindu_Fil",
    SubRegionName = "UI_SUBREGION_NAME_104105",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104106] = {
    RegionId = 1041,
    SubRegionDes = "UI_SUBREGION_DES_104106",
    SubRegionId = 104106,
    SubRegionLevel = "Huaxu_Yanjindu_Hos",
    SubRegionName = "UI_SUBREGION_NAME_104106",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104107] = {
    RegionId = 1041,
    SubRegionDes = "UI_SUBREGION_DES_104107",
    SubRegionId = 104107,
    SubRegionLevel = "Huaxu_Yanjindu_Plai",
    SubRegionName = "UI_SUBREGION_NAME_104107",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104108] = {
    RegionId = 1041,
    SubRegionDes = "UI_SUBREGION_DES_104108",
    SubRegionId = 104108,
    SubRegionLevel = "Huaxu_Yanjindu_Por",
    SubRegionName = "UI_SUBREGION_NAME_104108",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104109] = {
    RegionId = 1041,
    SubRegionDes = "UI_SUBREGION_DES_104109",
    SubRegionId = 104109,
    SubRegionLevel = "Huaxu_Yanjindu_Shi",
    SubRegionName = "UI_SUBREGION_NAME_104109",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104110] = {
    RegionId = 1041,
    SubRegionDes = "UI_SUBREGION_DES_104110",
    SubRegionId = 104110,
    SubRegionLevel = "Huaxu_Yanjindu_Spr",
    SubRegionName = "UI_SUBREGION_NAME_104110",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104201] = {
    RegionId = 1042,
    SubRegionDes = "UI_SUBREGION_DES_104201",
    SubRegionId = 104201,
    SubRegionLevel = "Huaxu_Yanjindu_Batt01",
    SubRegionName = "UI_SUBREGION_NAME_104201",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104301] = {
    RegionId = 1043,
    SubRegionDes = "UI_SUBREGION_DES_104301",
    SubRegionId = 104301,
    SubRegionLevel = "Huaxu_Yanjindu_Nai01",
    SubRegionName = "UI_SUBREGION_NAME_104301",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104401] = {
    RegionId = 1044,
    SubRegionDes = "UI_SUBREGION_DES_104401",
    SubRegionId = 104401,
    SubRegionLevel = "Huaxu_Yanjindu_Nai02",
    SubRegionName = "UI_SUBREGION_NAME_104401",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104501] = {
    RegionId = 1045,
    SubRegionDes = "UI_SUBREGION_DES_104501",
    SubRegionId = 104501,
    SubRegionLevel = "Huaxu_Haojing_Eas",
    SubRegionName = "UI_SUBREGION_NAME_104501",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104502] = {
    RegionId = 1045,
    SubRegionDes = "UI_SUBREGION_DES_104502",
    SubRegionId = 104502,
    SubRegionLevel = "Huaxu_Haojing_Wes",
    SubRegionName = "UI_SUBREGION_NAME_104502",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104503] = {
    RegionId = 1045,
    SubRegionDes = "UI_SUBREGION_DES_104503",
    SubRegionId = 104503,
    SubRegionLevel = "Huaxu_Haojing_Inn",
    SubRegionName = "UI_SUBREGION_NAME_104503",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104504] = {
    RegionId = 1045,
    SubRegionDes = "UI_SUBREGION_DES_104504",
    SubRegionId = 104504,
    SubRegionLevel = "Huaxu_Haojing_Jlc",
    SubRegionName = "UI_SUBREGION_NAME_104504",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104505] = {
    RegionId = 1045,
    SubRegionDes = "UI_SUBREGION_DES_104505",
    SubRegionId = 104505,
    SubRegionLevel = "Huaxu_Haojing_Sub",
    SubRegionName = "UI_SUBREGION_NAME_104505",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104506] = {
    RegionId = 1045,
    SubRegionDes = "UI_SUBREGION_DES_104506",
    SubRegionId = 104506,
    SubRegionLevel = "Huaxu_Haojing_Top",
    SubRegionName = "UI_SUBREGION_NAME_104506",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104601] = {
    RegionId = 1046,
    SubRegionDes = "UI_SUBREGION_DES_104601",
    SubRegionId = 104601,
    SubRegionLevel = "Huaxu_Yanjindu_Batt02",
    SubRegionName = "UI_SUBREGION_NAME_104601",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104701] = {
    RegionId = 1047,
    SubRegionDes = "UI_SUBREGION_DES_104701",
    SubRegionId = 104701,
    SubRegionLevel = "Huaxu_Yanjindu_Batt03",
    SubRegionName = "UI_SUBREGION_NAME_104701",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104801] = {
    RegionId = 1048,
    SubRegionDes = "UI_SUBREGION_DES_104801",
    SubRegionId = 104801,
    SubRegionLevel = "Huaxu_Haojing_YYG",
    SubRegionName = "UI_SUBREGION_NAME_104801",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [104901] = {
    RegionId = 1049,
    SubRegionDes = "UI_SUBREGION_DES_104901",
    SubRegionId = 104901,
    SubRegionLevel = "Huaxu_Yanjindu_Off",
    SubRegionName = "UI_SUBREGION_NAME_104901",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [105001] = {
    RegionId = 1050,
    SubRegionDes = "UI_SUBREGION_DES_105001",
    SubRegionId = 105001,
    SubRegionLevel = "Huaxu_Yanjindu_Nai03",
    SubRegionName = "UI_SUBREGION_NAME_105001",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [105101] = {
    RegionId = 1051,
    SubRegionDes = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionId = 105101,
    SubRegionLevel = "Huaxu_Haojing_Int",
    SubRegionName = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionType = "field",
    SyncPlayerInfo = 1
  },
  [105201] = {
    RegionId = 1052,
    SubRegionDes = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionId = 105201,
    SubRegionLevel = "Huaxu_Haojing_Reb",
    SubRegionName = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionType = "field",
    SyncPlayerInfo = 1
  },
  [105301] = {
    RegionId = 1053,
    SubRegionDes = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionId = 105301,
    SubRegionLevel = "Huaxu_Haojing_TRLM",
    SubRegionName = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionType = "field",
    SyncPlayerInfo = 1
  },
  [105401] = {
    RegionId = 1054,
    SubRegionDes = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionId = 105401,
    SubRegionLevel = "Huaxu_Haojing_TXJ",
    SubRegionName = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionType = "field",
    SyncPlayerInfo = 1
  },
  [105501] = {
    RegionId = 1055,
    SubRegionDes = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionId = 105501,
    SubRegionLevel = "Huaxu_Haojing_YLX",
    SubRegionName = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionType = "field",
    SyncPlayerInfo = 1
  },
  [105601] = {
    RegionId = 1056,
    SubRegionDes = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionId = 105601,
    SubRegionLevel = "Huaxu_Haojing_ZhiLiuHJ",
    SubRegionName = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionType = "field",
    SyncPlayerInfo = 1
  },
  [106001] = {
    RegionId = 1060,
    SubRegionDes = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionId = 106001,
    SubRegionLevel = "Haiboliya_Chezhan01",
    SubRegionName = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [106002] = {
    RegionId = 1060,
    SubRegionDes = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionId = 106002,
    SubRegionLevel = "Haiboliya_Chezhan02",
    SubRegionName = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionType = "field",
    SyncPlayerInfo = 1
  },
  [106003] = {
    RegionId = 1060,
    SubRegionDes = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionId = 106003,
    SubRegionLevel = "Haiboliya_Chezhan03",
    SubRegionName = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionType = "field",
    SyncPlayerInfo = 1
  },
  [106004] = {
    RegionId = 1060,
    SubRegionDes = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionId = 106004,
    SubRegionLevel = "Haiboliya_Chezhan04",
    SubRegionName = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionType = "field",
    SyncPlayerInfo = 1
  },
  [106005] = {
    RegionId = 1060,
    SubRegionDes = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionId = 106005,
    SubRegionLevel = "Haiboliya_Chezhan05",
    SubRegionName = "\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionType = "field",
    SyncPlayerInfo = 1
  },
  [200101] = {
    RegionId = 2001,
    SubRegionDes = "UI_SUBREGION_DES_200101",
    SubRegionId = 200101,
    SubRegionLevel = "Invite_Yeer",
    SubRegionName = "UI_SUBREGION_NAME_200101",
    SubRegionType = "field",
    SwitchPlayer = "Player"
  },
  [210101] = {
    DefaultQuestPoint = "-5213.0,6670.0,-2831.50415",
    NotShowInRegionMap = true,
    RegionId = 2101,
    SubRegionDes = "UI_SUBREGION_DES_210101",
    SubRegionId = 210101,
    SubRegionLevel = "HomeBase",
    SubRegionName = "UI_SUBREGION_NAME_210101",
    SubRegionType = "home",
    SwitchPlayer = "Player"
  },
  [999801] = {
    RegionId = 9998,
    SubRegionDes = "\231\137\185\230\174\138\228\187\187\229\138\161\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionId = 999801,
    SubRegionLevel = "TestSpecialQuest",
    SubRegionName = "\231\137\185\230\174\138\228\187\187\229\138\161\230\181\139\232\175\149\229\140\186\229\159\159",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [999901] = {
    RegionId = 9999,
    SubRegionDes = "\230\181\139\232\175\149\229\140\186\229\159\159\229\133\165\229\143\163",
    SubRegionId = 999901,
    SubRegionLevel = "BattleTest_Enter",
    SubRegionName = "\230\181\139\232\175\149\229\140\186\229\159\159\229\133\165\229\143\163",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [999902] = {
    RegionId = 9999,
    SubRegionDes = "\230\181\139\232\175\149\229\140\186\229\159\159\233\128\154\232\183\175",
    SubRegionId = 999902,
    SubRegionLevel = "BattleTest_Road",
    SubRegionName = "\230\181\139\232\175\149\229\140\186\229\159\159\233\128\154\232\183\175",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  },
  [999903] = {
    RegionId = 9999,
    SubRegionDes = "\230\181\139\232\175\149\229\140\186\229\159\159\229\135\186\229\143\163",
    SubRegionId = 999903,
    SubRegionLevel = "BattleTest_Exit",
    SubRegionName = "\230\181\139\232\175\149\229\140\186\229\159\159\229\135\186\229\143\163",
    SubRegionType = "field",
    SwitchPlayer = "Player",
    SyncPlayerInfo = 1
  }
})
