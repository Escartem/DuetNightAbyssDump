local T = {}
T.RT_1 = {3002}
T.RT_2 = {3003}
T.RT_3 = {3001, 125}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SelectDungeon", {
  [1] = {
    ChapterContent = "UI_DUNGEON_CONTENT_SURVIVAL_1",
    ChapterId = 1,
    ChapterName = "UI_DUNGEON_TYPE_SURVIVAL",
    ChapterSubName = "UI_DUNGEON_DROP_CHARBREAK",
    Condition = T.RT_1,
    DungeonList = {
      90401,
      90407,
      90413,
      90419,
      90425,
      90431,
      90437
    },
    GuidanceTitle = 200001,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Permanent/T_Permanent_IconMaterial.T_Permanent_IconMaterial",
    Path = "/Game/UI/Texture/Dynamic/Image/Play/T_Play_Depute_Survival.T_Play_Depute_Survival",
    RewardViewId = 90007,
    Sequence = 40
  },
  [2] = {
    ChapterContent = "UI_DUNGEON_CONTENT_EXCAVATION_1",
    ChapterId = 2,
    ChapterName = "UI_DUNGEON_TYPE_EXCAVATION",
    ChapterSubName = "UI_DUNGEON_DROP_COIN",
    Condition = T.RT_2,
    DungeonList = {
      90201,
      90202,
      90203,
      90204,
      90205,
      90206,
      90207
    },
    GuidanceTitle = 200001,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Permanent/T_Permanent_IconCoin.T_Permanent_IconCoin",
    Path = "/Game/UI/Texture/Dynamic/Image/Play/T_Play_Depute_Excavation.T_Play_Depute_Excavation",
    RewardViewId = 90000,
    Sequence = 10
  },
  [3] = {
    ChapterContent = "UI_DUNGEON_CONTENT_DEFENCE_2",
    ChapterId = 3,
    ChapterName = "UI_DUNGEON_TYPE_DEFENCE",
    ChapterSubName = "UI_DUNGEON_DROP_SKILL",
    Condition = T.RT_3,
    DungeonList = {
      90106,
      90108,
      90110,
      90112,
      90114
    },
    GuidanceTitle = 200001,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Permanent/T_Permanent_IconMaterial.T_Permanent_IconMaterial",
    Path = "/Game/UI/Texture/Dynamic/Image/Play/T_Play_Depute_DefencePro.T_Play_Depute_DefencePro",
    RewardViewId = 90010,
    Sequence = 70
  },
  [4] = {
    ChapterContent = "UI_DUNGEON_CONTENT_SABOTAGE_1",
    ChapterId = 4,
    ChapterName = "UI_DUNGEON_TYPE_SABOTAGE",
    ChapterSubName = "UI_DUNGEON_DROP_WEAPONBREAK",
    Condition = T.RT_1,
    DungeonList = {
      90501,
      90502,
      90503,
      90504,
      90505,
      90506,
      90507
    },
    GuidanceTitle = 200001,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Permanent/T_Permanent_IconMaterial.T_Permanent_IconMaterial",
    Path = "/Game/UI/Texture/Dynamic/Image/Play/T_Play_Depute_Sabotage.T_Play_Depute_Sabotage",
    RewardViewId = 90008,
    Sequence = 41
  },
  [5] = {
    ChapterContent = "UI_DUNGEON_CONTENT_SURVIVALPRO_1",
    ChapterId = 5,
    ChapterName = "UI_DUNGEON_TYPE_SURVIVALPRO",
    ChapterSubName = "UI_DUNGEON_DROP_CHAREXP",
    Condition = T.RT_2,
    DungeonList = {
      90601,
      90602,
      90603,
      90604,
      90605,
      90606,
      90607
    },
    GuidanceTitle = 200001,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Permanent/T_Permanent_IconExp.T_Permanent_IconExp",
    Path = "/Game/UI/Texture/Dynamic/Image/Play/T_Play_Depute_SurvivalPro.T_Play_Depute_SurvivalPro",
    RewardViewId = 90001,
    Sequence = 20
  },
  [6] = {
    ChapterContent = "UI_DUNGEON_CONTENT_HIJACK_1",
    ChapterId = 6,
    ChapterName = "UI_DUNGEON_TYPE_HIJACK",
    ChapterSubName = "UI_DUNGEON_DROP_RESOURCE",
    Condition = T.RT_3,
    DungeonList = {
      90702,
      90703,
      90704,
      90705,
      90706,
      90707
    },
    GuidanceTitle = 200001,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Permanent/T_Permanent_IconMaterial.T_Permanent_IconMaterial",
    Path = "/Game/UI/Texture/Dynamic/Image/Play/T_Play_Depute_Hijack.T_Play_Depute_Hijack",
    RewardViewId = 90011,
    Sequence = 80
  },
  [7] = {
    ChapterContent = "UI_DUNGEON_CONTENT_EXTERMINATE_1",
    ChapterId = 7,
    ChapterName = "UI_DUNGEON_TYPE_EXTERMINATE",
    ChapterSubName = "UI_DUNGEON_DROP_WEAPONEXP",
    Condition = T.RT_2,
    DungeonList = {
      90801,
      90802,
      90803,
      90804,
      90805,
      90806,
      90807
    },
    GuidanceTitle = 200001,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Permanent/T_Permanent_IconExp.T_Permanent_IconExp",
    Path = "/Game/UI/Texture/Dynamic/Image/Play/T_Play_Depute_Exterminate.T_Play_Depute_Exterminate",
    RewardViewId = 90002,
    Sequence = 21
  },
  [8] = {
    ChapterContent = "UI_DUNGEON_CONTENT_RESCUE_1",
    ChapterId = 8,
    ChapterName = "UI_DUNGEON_TYPE_RESCUE",
    ChapterSubName = "UI_DUNGEON_DROP_MODCOIN",
    Condition = T.RT_1,
    DungeonList = {
      90902,
      90903,
      90904,
      90905,
      90906,
      90907
    },
    GuidanceTitle = 200001,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Permanent/T_Permanent_IconCoin.T_Permanent_IconCoin",
    Path = "/Game/UI/Texture/Dynamic/Image/Play/T_Play_Depute_Rescue.T_Play_Depute_Rescue",
    RewardViewId = 90009,
    Sequence = 54
  },
  [9] = {
    ChapterContent = "UI_DUNGEON_CONTENT_CAPTURE_1",
    ChapterId = 9,
    ChapterName = "UI_DUNGEON_TYPE_CAPTURE",
    ChapterSubName = "UI_DUNGEON_DROP_SKILL",
    Condition = T.RT_3,
    DungeonList = {
      90307,
      90308,
      90309,
      90310,
      90311
    },
    GuidanceTitle = 200001,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Permanent/T_Permanent_IconMaterial.T_Permanent_IconMaterial",
    Path = "/Game/UI/Texture/Dynamic/Image/Play/T_Play_Depute_Capture.T_Play_Depute_Capture",
    RewardViewId = 90004,
    Sequence = 65
  },
  [10] = {
    ChapterContent = "UI_DUNGEON_DES_TESTING_1",
    ChapterId = 10,
    ChapterName = "UI_DUNGEON_TYPE_DEF_EXTERMINATE",
    ChapterSubName = "UI_DUNGEON_DROP_MOD",
    Condition = T.RT_1,
    DungeonList = {
      91008,
      91009,
      91010,
      91011
    },
    GuidanceTitle = 200001,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Permanent/T_Permanent_IconMod.T_Permanent_IconMod",
    Path = "/Game/UI/Texture/Dynamic/Image/Play/T_Play_Depute_ExterminatePro.T_Play_Depute_ExterminatePro",
    RewardViewId = 90006,
    Sequence = 42
  }
})
