local T = {}
T.RT_1 = {
  163,
  10,
  122
}
T.RT_2 = {
  Boy = T.RT_1,
  Girl = T.RT_1,
  Loli = T.RT_1,
  Man = T.RT_1,
  Woman = T.RT_1
}
T.RT_3 = {
  0,
  40,
  0
}
T.RT_4 = {
  -150,
  -70,
  0
}
T.RT_5 = {
  -70,
  170,
  0
}
T.RT_6 = {
  -70,
  -165,
  0
}
T.RT_7 = {
  [1] = T.RT_3,
  [2] = T.RT_4,
  [3] = T.RT_5,
  [4] = T.RT_6
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("HardBossMain", {
  [1] = {
    AirWallStaticId = 1610010620,
    CameraParam = T.RT_2,
    DifficultyId = {
      1001,
      1002,
      1003,
      1004,
      1005,
      1006
    },
    DisplayPriority = 1,
    GameModePath = "/Game/AssetDesign/GameMode/HardBoss/BP_EMGameMode_HardBoss00_BossXibi.BP_EMGameMode_HardBoss00_BossXibi",
    GuidanceTitle = 100001,
    HardBossDes = "UI_HardBoss_Des_1",
    HardBossId = 1,
    HardBossName = "UI_HardBoss_Name_1",
    MainIcon = "/Game/UI/Texture/Dynamic/Image/Permanent/T_Permanent_HardBoss_Xibi.T_Permanent_HardBoss_Xibi",
    MonsterIcon = "/Game/UI/Texture/Dynamic/Image/Permanent/T_Permanent_HardBoss_Xibi_S.T_Permanent_HardBoss_Xibi_S",
    MonsterId = 8500002,
    MonsterStaticId = 1310010602,
    OpenTitleWidgetName = "HardBossOpenTitle_Xibi",
    PosDisplayName = "BP_HardBoss_PlayerStart",
    SettlementOffset = T.RT_7,
    StorylinePath = "HardBoss/Xibi",
    TeleportId = 9000,
    TitleBp = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/PlayHardBossTitle/WBP_Play_HardBoss_Title_Xibi.WBP_Play_HardBoss_Title_Xibi'",
    UnlockCondition = 4120
  },
  [2] = {
    AirWallStaticId = 1440064,
    CameraParam = T.RT_2,
    DifficultyId = {
      1011,
      1012,
      1013,
      1014,
      1015,
      1016
    },
    DisplayPriority = 2,
    GameModePath = "/Game/AssetDesign/GameMode/HardBoss/BP_EMGameMode_HardBoss01_BossShijingzhe.BP_EMGameMode_HardBoss01_BossShijingzhe",
    GuidanceTitle = 100001,
    HardBossDes = "UI_HardBoss_Des_2",
    HardBossId = 2,
    HardBossName = "UI_HardBoss_Name_2",
    MainIcon = "/Game/UI/Texture/Dynamic/Image/Permanent/T_Permanent_HardBoss_ShiJingZhe.T_Permanent_HardBoss_ShiJingZhe",
    MonsterIcon = "/Game/UI/Texture/Dynamic/Image/Permanent/T_Permanent_HardBoss_ShiJingZhe_S.T_Permanent_HardBoss_ShiJingZhe_S",
    MonsterId = 8503002,
    MonsterStaticId = 1440052,
    OpenTitleWidgetName = "HardBossOpenTitle_Shijingzhe",
    PosDisplayName = "BP_HardBoss_PlayerStart",
    SettlementOffset = T.RT_7,
    StorylinePath = "HardBoss/Shijingzhe",
    TeleportId = 9001,
    TitleBp = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/PlayHardBossTitle/WBP_Play_HardBoss_Title_ShiJingZhe.WBP_Play_HardBoss_Title_ShiJingZhe'",
    UnlockCondition = 4120
  },
  [3] = {
    AirWallStaticId = 1240025,
    CameraParam = T.RT_2,
    DifficultyId = {
      1021,
      1022,
      1023,
      1024,
      1025,
      1026
    },
    DisplayPriority = 3,
    GameModePath = "/Game/AssetDesign/GameMode/HardBoss/BP_EMGameMode_HardBoss02_BossSaiqi.BP_EMGameMode_HardBoss02_BossSaiqi",
    GuidanceTitle = 100001,
    HardBossDes = "UI_HardBoss_Des_3",
    HardBossId = 3,
    HardBossName = "UI_HardBoss_Name_3",
    MainIcon = "/Game/UI/Texture/Dynamic/Image/Permanent/T_Permanent_HardBoss_Saiqi.T_Permanent_HardBoss_Saiqi",
    MonsterIcon = "/Game/UI/Texture/Dynamic/Image/Permanent/T_Permanent_HardBoss_Saiqi_S.T_Permanent_HardBoss_Saiqi_S",
    MonsterId = 8502002,
    MonsterStaticId = 1240027,
    OpenTitleWidgetName = "HardBossOpenTitle_Saiqi",
    PosDisplayName = "BP_HardBoss_PlayerStart",
    SettlementOffset = T.RT_7,
    StorylinePath = "HardBoss/Saiqi",
    TeleportId = 9002,
    TitleBp = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/PlayHardBossTitle/WBP_Play_HardBoss_Title_Saiqi.WBP_Play_HardBoss_Title_Saiqi'",
    UnlockCondition = 4120
  },
  [4] = {
    AirWallStaticId = 1660120,
    CameraParam = T.RT_2,
    DifficultyId = {
      1031,
      1032,
      1033,
      1034,
      1035,
      1036
    },
    DisplayPriority = 4,
    GameModePath = "/Game/AssetDesign/GameMode/HardBoss/BP_EMGameMode_HardBoss03_BossLianhuo.BP_EMGameMode_HardBoss03_BossLianhuo",
    GuidanceTitle = 100001,
    HardBossDes = "UI_HardBoss_Des_4",
    HardBossId = 4,
    HardBossName = "UI_HardBoss_Name_4",
    MainIcon = "/Game/UI/Texture/Dynamic/Image/Permanent/T_Permanent_HardBoss_Haier.T_Permanent_HardBoss_Haier",
    MonsterIcon = "/Game/UI/Texture/Dynamic/Image/Permanent/T_Permanent_HardBoss_Haier_S.T_Permanent_HardBoss_Haier_S",
    MonsterId = 8505002,
    MonsterStaticId = 1660121,
    OpenTitleWidgetName = "HardBossOpenTitle_Haier",
    PosDisplayName = "BP_HardBoss_PlayerStart",
    SettlementOffset = T.RT_7,
    StorylinePath = "HardBoss/Haier",
    TeleportId = 9003,
    TitleBp = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/PlayHardBossTitle/WBP_Play_HardBoss_Title_Haier.WBP_Play_HardBoss_Title_Haier'",
    UnlockCondition = 2037
  },
  [5] = {
    AirWallStaticId = 1969947,
    CameraParam = T.RT_2,
    DifficultyId = {
      1041,
      1042,
      1043,
      1044,
      1045,
      1046
    },
    DisplayPriority = 5,
    GameModePath = "/Game/AssetDesign/GameMode/HardBoss/BP_EMGameMode_HardBoss04_BossLinen.BP_EMGameMode_HardBoss04_BossLinen",
    GuidanceTitle = 100001,
    HardBossDes = "UI_HardBoss_Des_5",
    HardBossId = 5,
    HardBossName = "UI_HardBoss_Name_5",
    MainIcon = "/Game/UI/Texture/Dynamic/Image/Permanent/T_Permanent_HardBoss_Linen.T_Permanent_HardBoss_Linen",
    MonsterIcon = "/Game/UI/Texture/Dynamic/Image/Permanent/T_Permanent_HardBoss_Linen_S.T_Permanent_HardBoss_Linen_S",
    MonsterId = 8512002,
    MonsterStaticId = 1969946,
    OpenTitleWidgetName = "HardBossOpenTitle_Linen",
    PosDisplayName = "BP_HardBoss_PlayerStart",
    SettlementOffset = T.RT_7,
    StorylinePath = "HardBoss/Linen",
    TeleportId = 9004,
    TitleBp = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/PlayHardBossTitle/WBP_Play_HardBoss_Title_Linen.WBP_Play_HardBoss_Title_Linen'",
    UnlockCondition = 2047
  }
})
