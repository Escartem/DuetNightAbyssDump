local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Region", {
  [1001] = {
    AlertDisable = true,
    IsRandom = {
      100101,
      100102,
      100103,
      100104
    },
    RegionDispCondition = 110109,
    RegionId = 1001,
    RegionJsonFile = "/Game/Script/Datas/Houdini_data/Prologue/Main/prologue",
    RegionMapFile = "/Game/Maps/Levels/Prologue/Prologue_Main_01/Prologue_Main_01",
    RegionMapId = 100,
    RegionMapImage = "/Game/UI/WBP/Map/Widget/RegionMap/WBP_Map_Reg_Prologue.WBP_Map_Reg_Prologue",
    RegionMapImageCenter = {16600, 13500},
    RegionName = "UI_REGION_NAME_1001",
    RegionRotation = 270,
    RegionType = "Main",
    ResetTime = {MONTH = 1}
  },
  [1011] = {
    AlertDisable = true,
    IsRandom = {
      101101,
      101103,
      101104,
      101105,
      101106,
      101107,
      101108,
      101110,
      101111
    },
    RegionDispCondition = 110109,
    RegionId = 1011,
    RegionJsonFile = "/Game/Script/Datas/Houdini_data/Chapter01/Main/Chapter01",
    RegionMapFile = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Chapter01",
    RegionMapId = 200,
    RegionMapImage = "/Game/UI/WBP/Map/Widget/RegionMap/WBP_Map_Reg_Chapter01.WBP_Map_Reg_Chapter01",
    RegionMapImageCenter = {-18300, 15700},
    RegionName = "UI_REGION_NAME_1011",
    RegionRotation = 180,
    RegionType = "Main",
    ResetTime = {DAY = 1}
  },
  [1013] = {
    AlertDisable = true,
    IsRandom = {
      101301,
      101303,
      101304,
      101305
    },
    RegionDispCondition = 110109,
    RegionId = 1013,
    RegionJsonFile = "/Game/Script/Datas/Houdini_data/Chapter01/Main/Chapter01_KuangKeng",
    RegionMapFile = "/Game/Maps/Levels/Chapter01/Chapter01_KuangKeng_Main/Chapter01_KuangKeng",
    RegionMapId = 202,
    RegionMapImage = "/Game/UI/WBP/Map/Widget/RegionMap/WBP_Map_Reg_Chapter01_KK.WBP_Map_Reg_Chapter01_KK",
    RegionMapImageCenter = {9000, 14600},
    RegionName = "UI_REGION_NAME_1013",
    RegionRotation = 270,
    RegionType = "Main"
  },
  [1014] = {
    IsRandom = {101401, 101402},
    RegionId = 1014,
    RegionJsonFile = "/Game/Script/Datas/Houdini_data/Chapter01/Main/Chapter01_Saiqi_Wonderland",
    RegionMapFile = "/Game/Maps/Levels/Chapter01/Chapter01_Won/Chapter01_Won_Main",
    RegionName = "UI_REGION_NAME_1014",
    RegionType = "Fantasy"
  },
  [1017] = {
    AlertDisable = true,
    IsRandom = {
      101701,
      101702,
      101703
    },
    RegionDispCondition = 110109,
    RegionId = 1017,
    RegionJsonFile = "/Game/Script/Datas/Houdini_data/Chapter01/Main/Chapter01_Sew",
    RegionMapFile = "/Game/Maps/Levels/Chapter01/Chapter01_Sew_Main/Chapter_Sew_Main",
    RegionMapId = 201,
    RegionMapImage = "/Game/UI/WBP/Map/Widget/RegionMap/WBP_Map_Reg_Chapter01_Sew.WBP_Map_Reg_Chapter01_Sew",
    RegionMapImageCenter = {-20360, -7102},
    RegionName = "UI_REGION_NAME_1017",
    RegionType = "Main",
    ResetTime = {WEEK = 1}
  },
  [1019] = {
    AlertDisable = true,
    CloseBlock = true,
    IsRandom = {101901},
    RegionId = 1019,
    RegionMapFile = "/Game/Maps/Levels/Chapter01/BH_Thea_Main/BH_Thea_Main",
    RegionMapId = 204,
    RegionMapImage = "/Game/UI/WBP/Map/Widget/RegionMap/WBP_Map_Reg_Chapter01_Thea.WBP_Map_Reg_Chapter01_Thea",
    RegionMapImageCenter = {20500, 3300},
    RegionName = "UI_REGION_NAME_1019",
    RegionType = "Main"
  },
  [1021] = {
    AlertDisable = true,
    IsRandom = {
      102101,
      102102,
      102103,
      102104
    },
    RegionDispCondition = 110109,
    RegionId = 1021,
    RegionJsonFile = "/Game/Script/Datas/Houdini_data/Ex01/Main/Ex01",
    RegionMapFile = "/Game/Maps/Levels/Haiboliya/Haiboliya_Longsha_Main/Haiboliya_Longsha_Main",
    RegionMapId = 300,
    RegionMapImage = "/Game/UI/WBP/Map/Widget/RegionMap/WBP_Map_Reg_EXChapter01.WBP_Map_Reg_EXChapter01",
    RegionMapImageCenter = {5500, -15000},
    RegionName = "UI_REGION_NAME_1021",
    RegionType = "EX"
  },
  [1022] = {
    IsRandom = {102201},
    RegionId = 1022,
    RegionJsonFile = "/Game/Script/Datas/Houdini_data/Ex01/Main/Ex01_Jail",
    RegionMapFile = "/Game/Maps/Levels/EXChapter01/EXChapter01_Jail/EXChapter01_Jail_Main",
    RegionName = "UI_REGION_NAME_1022",
    RegionType = "EX"
  },
  [1032] = {
    IsRandom = {103201},
    RegionId = 1032,
    RegionMapFile = "/Game/Maps/Levels/Chapter01/Chapter01_Alch_Main/Chapter01_Alch_Main",
    RegionName = "UI_REGION_NAME_1032",
    RegionType = "Main"
  },
  [1041] = {
    AlertDisable = true,
    IsRandom = {
      104101,
      104102,
      104103,
      104104,
      104105,
      104106,
      104107,
      104108,
      104109,
      104110
    },
    RegionDispCondition = 120106,
    RegionId = 1041,
    RegionMapFile = "/Game/Maps/Levels/Huaxu/Huaxu_Yanjindu_Main/Huaxu_Yanjindu_Main",
    RegionMapId = 400,
    RegionMapImage = "/Game/UI/WBP/Map/Widget/RegionMap/WBP_Map_Reg_Chapter01.WBP_Map_Reg_Chapter01",
    RegionMapImageCenter = {20000, 20000},
    RegionName = "UI_REGION_NAME_1041",
    RegionType = "Main"
  },
  [1042] = {
    IsRandom = {104201},
    RegionId = 1042,
    RegionMapFile = "/Game/Maps/Levels/Huaxu/Huaxu_Yanjindu_Batt01/Huaxu_Yanjindu_Batt01_Main",
    RegionName = "UI_REGION_NAME_1042",
    RegionType = "Main"
  },
  [1043] = {
    IsRandom = {104301},
    RegionId = 1043,
    RegionMapFile = "/Game/Maps/Levels/Huaxu/Huaxu_Yanjindu_Nai01/Huaxu_Yanjindu_Nai01_Main",
    RegionName = "UI_REGION_NAME_1043",
    RegionType = "Main"
  },
  [1044] = {
    IsRandom = {104401},
    RegionId = 1044,
    RegionMapFile = "/Game/Maps/Levels/Huaxu/Huaxu_Yanjindu_Nai02/Huaxu_Yanjindu_Nai02_Main",
    RegionName = "UI_REGION_NAME_1044",
    RegionType = "Main"
  },
  [1045] = {
    IsRandom = {
      104501,
      104502,
      104503,
      104504,
      104505,
      104506
    },
    RegionId = 1045,
    RegionMapFile = "/Game/Maps/Levels/Huaxu/Huaxu_Haojing_Main/Huaxu_Haojing_Main",
    RegionName = "UI_REGION_NAME_1045",
    RegionType = "Main"
  },
  [1046] = {
    IsRandom = {104601},
    RegionId = 1046,
    RegionMapFile = "/Game/Maps/Levels/Huaxu/Huaxu_Yanjindu_Batt02/Huaxu_Yanjindu_Batt02_Main",
    RegionName = "UI_REGION_NAME_1046",
    RegionType = "Main"
  },
  [1047] = {
    IsRandom = {104701},
    RegionId = 1047,
    RegionMapFile = "/Game/Maps/Levels/Huaxu/Huaxu_Yanjindu_Batt03/Huaxu_Yanjindu_Batt03_Main",
    RegionName = "UI_REGION_NAME_1047",
    RegionType = "Main"
  },
  [1048] = {
    IsRandom = {104801},
    RegionId = 1048,
    RegionMapFile = "/Game/Maps/Levels/Huaxu/Huaxu_Haojing_YYG/Huaxu_Haojing_YYG_Main",
    RegionName = "UI_REGION_NAME_1048",
    RegionType = "Main"
  },
  [1049] = {
    IsRandom = {104901},
    RegionId = 1049,
    RegionMapFile = "/Game/Maps/Levels/Huaxu/Huaxu_Yanjindu_Off/Huaxu_Yanjindu_Off_Main",
    RegionName = "UI_REGION_NAME_1049",
    RegionType = "Main"
  },
  [1050] = {
    IsRandom = {105001},
    RegionId = 1050,
    RegionMapFile = "/Game/Maps/Levels/Huaxu/Huaxu_Yanjindu_Nai03/Huaxu_Yanjindu_Nai03_Main",
    RegionName = "UI_REGION_NAME_1050",
    RegionType = "Main"
  },
  [1051] = {
    IsRandom = {105101},
    RegionId = 1051,
    RegionMapFile = "/Game/Maps/Levels/Huaxu/Huaxu_Haojing_Int/Huaxu_Haojing_Int_Main",
    RegionName = "UI_REGION_NAME_1051"
  },
  [1052] = {
    IsRandom = {105201},
    RegionId = 1052,
    RegionMapFile = "/Game/Maps/Levels/Huaxu/Huaxu_Haojing_Reb/Huaxu_Haojing_Reb_Main",
    RegionName = "UI_REGION_NAME_1052"
  },
  [1053] = {
    IsRandom = {105301},
    RegionId = 1053,
    RegionMapFile = "/Game/Maps/Levels/Huaxu/Huaxu_Haojing_TRLM/Huaxu_Haojing_TRLM_Main",
    RegionName = "UI_REGION_NAME_1053"
  },
  [1054] = {
    IsRandom = {105401},
    RegionId = 1054,
    RegionMapFile = "/Game/Maps/Levels/Huaxu/Huaxu_Haojing_TXJ/Huaxu_Haojing_TXJ_Main",
    RegionName = "UI_REGION_NAME_1054"
  },
  [1055] = {
    IsRandom = {105501},
    RegionId = 1055,
    RegionMapFile = "/Game/Maps/Levels/Huaxu/Huaxu_Haojing_YLX/Huaxu_Haojing_YLX_Main",
    RegionName = "UI_REGION_NAME_1055"
  },
  [1056] = {
    IsRandom = {105601},
    RegionId = 1056,
    RegionMapFile = "/Game/Maps/Levels/Huaxu/Huaxu_Haojing_ZhiLiuHJ/Huaxu_Haojing_ZhiLiuHJ_Main",
    RegionName = "UI_REGION_NAME_1056"
  },
  [1060] = {
    IsRandom = {
      106001,
      106002,
      106003
    },
    RegionId = 1060,
    RegionMapFile = "/Game/Maps/Levels/Haiboliya/Haiboliya_Chezhan_Main/Haiboliya_Chezhan_Main",
    RegionName = "\231\172\172\228\184\137\231\171\160\230\181\139\232\175\149",
    RegionType = "Main"
  },
  [2001] = {
    IsRandom = {200101},
    RegionId = 2001,
    RegionMapFile = "/Game/Maps/Levels/Home/Invite_Main/Invite_Main",
    RegionName = "UI_REGION_NAME_2001",
    RegionType = "Main"
  },
  [2101] = {
    AlertDisable = true,
    IsRandom = {210101},
    RegionId = 2101,
    RegionJsonFile = "/Game/Script/Datas/Houdini_data/Chapter01/Main/Chapter01_HomeBase",
    RegionMapFile = "/Game/Maps/Levels/Home/HomeBase/HomeBase_Main",
    RegionMapId = 200,
    RegionName = "UI_REGION_NAME_2101",
    RegionType = "Main"
  },
  [9998] = {
    AlertDisable = true,
    IsRandom = {999801},
    RegionId = 9998,
    RegionMapFile = "/Game/Maps/Levels/Test/TestLevel/SpecialQuestTest/TestSpecialQuest",
    RegionName = "\231\137\185\230\174\138\228\187\187\229\138\161\230\181\139\232\175\149\229\140\186\229\159\159"
  },
  [9999] = {
    AlertDisable = true,
    IsRandom = {
      999901,
      999902,
      999903
    },
    RegionId = 9999,
    RegionJsonFile = "/Game/Script/Datas/Houdini_data/Test/NewTestRoom/BattleTest/BattleTest01",
    RegionMapFile = "/Game/Maps/Misc_Test/RegionWCTest/RegionTest_Main",
    RegionName = "\229\140\186\229\159\159\230\181\139\232\175\149"
  }
})
