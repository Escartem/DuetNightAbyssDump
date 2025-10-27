local T = {}
T.RT_1 = {4020}
T.RT_2 = {4170}
T.RT_3 = {8002}
T.RT_4 = {4030}
T.RT_5 = {3003}
T.RT_6 = {3002}
T.RT_7 = {3001, 125}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("InterfaceJump", {
  [1] = {
    InterfaceJumpId = 1,
    JumpParameter1 = "AchievementSystem",
    JumpType = "MereJump",
    PortalUnlockCondition = {4070},
    PortalUnlockTips = "UI_Locked_Des_Achievement"
  },
  [3] = {
    InterfaceJumpId = 3,
    JumpParameter1 = "TaskPanel",
    JumpParameter3 = "100103",
    JumpType = "QuestChain",
    PortalUnlockCondition = {100102},
    PortalUnlockTips = "UI_Locked_Des_Quest"
  },
  [4] = {
    InterfaceJumpId = 4,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Attr",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [5] = {
    InterfaceJumpId = 5,
    JumpParameter1 = "GachaMain",
    JumpType = "MereJump",
    PortalUnlockCondition = {4040},
    PortalUnlockTips = "UI_Locked_Des_Gacha"
  },
  [6] = {
    InterfaceJumpId = 6,
    JumpParameter1 = "TaskPanel",
    JumpType = "QuestChain",
    PortalUnlockCondition = {100103},
    PortalUnlockTips = "UI_Locked_Des_Quest"
  },
  [8] = {
    InterfaceJumpId = 8,
    JumpParameter1 = "TaskPanel",
    JumpParameter3 = "200101",
    JumpType = "QuestChain",
    PortalUnlockCondition = {100201},
    PortalUnlockTips = "UI_Locked_Des_Quest"
  },
  [9] = {
    InterfaceJumpId = 9,
    JumpParameter1 = "TaskPanel",
    JumpParameter3 = "100202",
    JumpType = "QuestChain",
    PortalUnlockCondition = {200101},
    PortalUnlockTips = "UI_Locked_Des_Quest"
  },
  [10] = {
    InterfaceJumpId = 10,
    JumpParameter1 = "TaskPanel",
    JumpParameter3 = "100204",
    JumpType = "QuestChain",
    PortalUnlockCondition = {100203},
    PortalUnlockTips = "UI_Locked_Des_Quest"
  },
  [11] = {
    InterfaceJumpId = 11,
    JumpParameter1 = "TaskPanel",
    JumpParameter3 = "100208",
    JumpType = "QuestChain",
    PortalUnlockCondition = {100207},
    PortalUnlockTips = "UI_Locked_Des_Quest"
  },
  [13] = {
    InterfaceJumpId = 13,
    JumpParameter1 = "JumpToRougeMain",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_2,
    PortalUnlockTips = "UI_Locked_Des_Rouge"
  },
  [14] = {
    InterfaceJumpId = 14,
    JumpParameter1 = "AbyssMain",
    JumpType = "MereJump",
    PortalUnlockCondition = T.RT_3,
    PortalUnlockTips = "UI_Locked_Des_Abyss"
  },
  [15] = {
    InterfaceJumpId = 15,
    JumpParameter1 = "AnglingMain",
    JumpType = "MereJump"
  },
  [16] = {
    InterfaceJumpId = 16,
    JumpParameter1 = "AnglingMap",
    JumpType = "MereJump"
  },
  [17] = {
    InterfaceJumpId = 17,
    JumpParameter1 = "TaskPanel",
    JumpParameter3 = "110107",
    JumpType = "QuestChain",
    PortalUnlockCondition = {110105},
    PortalUnlockTips = "UI_Locked_Des_Quest"
  },
  [18] = {
    InterfaceJumpId = 18,
    JumpParameter1 = "ZhiliuEventTask",
    JumpType = "MereJump"
  },
  [19] = {
    InterfaceJumpId = 19,
    JumpParameter1 = "JumpToStyleOfPlaySubUI",
    JumpParameter2 = "NewDeputeRoot",
    JumpParameter3 = "Regular",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = {4110},
    PortalUnlockTips = "UI_Locked_Des_Comission"
  },
  [20] = {
    InterfaceJumpId = 20,
    JumpParameter1 = "JumpToStyleOfPlaySubUI",
    JumpParameter2 = "NewDeputeRoot",
    JumpParameter3 = "NightBook",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = {4360},
    PortalUnlockTips = "UI_Locked_Des_ModDungeon"
  },
  [21] = {
    InterfaceJumpId = 21,
    JumpParameter1 = "JumpToStyleOfPlaySubUI",
    JumpParameter2 = "NewDeputeRoot",
    JumpParameter3 = "Walnut",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = {4340},
    PortalUnlockTips = "UI_Locked_Des_WalnutBag"
  },
  [22] = {
    InterfaceJumpId = 22,
    JumpParameter1 = "JumpToStyleOfPlaySubUI",
    JumpParameter2 = "HardBossMain",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = {4120},
    PortalUnlockTips = "UI_Locked_Des_HardBoss"
  },
  [23] = {
    InterfaceJumpId = 23,
    JumpParameter1 = "JumpToTaskPanelByQuestChainId",
    JumpType = "SelfDefinedJump"
  },
  [24] = {
    InterfaceJumpId = 24,
    JumpParameter1 = "JumpToRegionMapByTeleportId",
    JumpParameter2 = "1012",
    JumpType = "SelfDefinedJump"
  },
  [25] = {
    InterfaceJumpId = 25,
    JumpParameter1 = "JumpToRegionMapByRegionPointId",
    JumpParameter2 = "2002",
    JumpType = "SelfDefinedJump"
  },
  [26] = {
    InterfaceJumpId = 26,
    JumpParameter1 = "JumpToShopPage",
    JumpParameter2 = "160",
    JumpParameter3 = "1602",
    JumpParameter4 = "nil",
    JumpParameter5 = "Shop",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_4,
    PortalUnlockTips = "UI_Locked_Des_Shop"
  },
  [27] = {
    InterfaceJumpId = 27,
    JumpParameter1 = "JumpToShopPage",
    JumpParameter2 = "160",
    JumpParameter3 = "1602",
    JumpParameter4 = "160201",
    JumpParameter5 = "Shop",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_4,
    PortalUnlockTips = "UI_Locked_Des_Shop"
  },
  [28] = {
    InterfaceJumpId = 28,
    JumpParameter1 = "JumpToShopPage",
    JumpParameter2 = "10000",
    JumpParameter3 = "100001",
    JumpParameter4 = "nil",
    JumpParameter5 = "AbyssShop",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_3,
    PortalUnlockTips = "UI_Locked_Des_AbyssShop"
  },
  [29] = {
    InterfaceJumpId = 29,
    JumpParameter1 = "JumpToRegionMapByRegionPointId",
    JumpParameter2 = "2612",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = {101103},
    PortalUnlockTips = "UI_Locked_Des_ImpressionShop"
  },
  [30] = {
    InterfaceJumpId = 30,
    JumpParameter1 = "ForgeMain",
    JumpType = "MereJump",
    PortalUnlockCondition = {4080},
    PortalUnlockTips = "UI_Locked_Des_Forging"
  },
  [31] = {
    InterfaceJumpId = 31,
    JumpParameter1 = "JumpToStyleOfPlaySubUI",
    JumpParameter2 = "DailyMain",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = {4320},
    PortalUnlockTips = "UI_Locked_Des_DailyGoal"
  },
  [32] = {
    InterfaceJumpId = 32,
    JumpParameter1 = "JumpToStyleOfPlaySubUI",
    JumpParameter2 = "StarterQuest",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = {4370},
    PortalUnlockTips = "UI_Locked_Des_StarterQuest"
  },
  [33] = {
    InterfaceJumpId = 33,
    JumpParameter1 = "JumpToShopPage",
    JumpParameter2 = "180",
    JumpParameter3 = "1801",
    JumpParameter4 = "nil",
    JumpParameter5 = "Shop",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_4,
    PortalUnlockTips = "UI_Locked_Des_Shop"
  },
  [34] = {
    InterfaceJumpId = 34,
    JumpParameter1 = "LevelMapMain",
    JumpType = "MereJump",
    PortalUnlockCondition = {4330},
    PortalUnlockTips = "UI_Locked_Des_Dispatch"
  },
  [35] = {
    InterfaceJumpId = 35,
    JumpParameter1 = "JumpToShopPage",
    JumpParameter2 = "10001",
    JumpParameter3 = "100011",
    JumpParameter4 = "nil",
    JumpParameter5 = "ZhiLiuEntrust",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = {8001},
    PortalUnlockTips = "UI_Locked_Des_ZhiLiuShop"
  },
  [36] = {
    InterfaceJumpId = 36,
    JumpParameter1 = "JumpToRegionMapByRegionPointId",
    JumpParameter2 = "2817",
    JumpType = "SelfDefinedJump"
  },
  [37] = {
    InterfaceJumpId = 37,
    JumpParameter1 = "TaskPanel",
    JumpParameter3 = "100205",
    JumpType = "QuestChain",
    PortalUnlockCondition = {100204},
    PortalUnlockTips = "UI_Locked_Des_Quest"
  },
  [38] = {
    InterfaceJumpId = 38,
    JumpParameter1 = "JumpToDungeonPage",
    JumpParameter2 = "90201",
    JumpParameter3 = "1",
    JumpParameter4 = "nil",
    JumpParameter5 = "True",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_5,
    PortalUnlockTips = "UI_Locked_Des_CurrentComission"
  },
  [39] = {
    InterfaceJumpId = 39,
    JumpParameter1 = "JumpToDungeonPage",
    JumpParameter2 = "90601",
    JumpParameter3 = "1",
    JumpParameter4 = "nil",
    JumpParameter5 = "True",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_5,
    PortalUnlockTips = "UI_Locked_Des_CurrentComission"
  },
  [40] = {
    InterfaceJumpId = 40,
    JumpParameter1 = "JumpToDungeonPage",
    JumpParameter2 = "90801",
    JumpParameter3 = "1",
    JumpParameter4 = "nil",
    JumpParameter5 = "True",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_5,
    PortalUnlockTips = "UI_Locked_Des_CurrentComission"
  },
  [41] = {
    InterfaceJumpId = 41,
    JumpParameter1 = "JumpToDungeonPage",
    JumpParameter2 = "90401",
    JumpParameter3 = "1",
    JumpParameter4 = "nil",
    JumpParameter5 = "True",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_6,
    PortalUnlockTips = "UI_Locked_Des_CurrentComission"
  },
  [42] = {
    InterfaceJumpId = 42,
    JumpParameter1 = "JumpToDungeonPage",
    JumpParameter2 = "90501",
    JumpParameter3 = "1",
    JumpParameter4 = "nil",
    JumpParameter5 = "True",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_6,
    PortalUnlockTips = "UI_Locked_Des_CurrentComission"
  },
  [43] = {
    InterfaceJumpId = 43,
    JumpParameter1 = "JumpToDungeonPage",
    JumpParameter2 = "90902",
    JumpParameter3 = "1",
    JumpParameter4 = "nil",
    JumpParameter5 = "True",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_6,
    PortalUnlockTips = "UI_Locked_Des_CurrentComission"
  },
  [44] = {
    InterfaceJumpId = 44,
    JumpParameter1 = "JumpToDungeonPage",
    JumpParameter2 = "90307",
    JumpParameter3 = "1",
    JumpParameter4 = "nil",
    JumpParameter5 = "True",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_7,
    PortalUnlockTips = "UI_Locked_Des_CurrentComission"
  },
  [45] = {
    InterfaceJumpId = 45,
    JumpParameter1 = "JumpToDungeonPage",
    JumpParameter2 = "90106",
    JumpParameter3 = "1",
    JumpParameter4 = "nil",
    JumpParameter5 = "True",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_7,
    PortalUnlockTips = "UI_Locked_Des_CurrentComission"
  },
  [46] = {
    InterfaceJumpId = 46,
    JumpParameter1 = "JumpToDungeonPage",
    JumpParameter2 = "90702",
    JumpParameter3 = "1",
    JumpParameter4 = "nil",
    JumpParameter5 = "True",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_7,
    PortalUnlockTips = "UI_Locked_Des_CurrentComission"
  },
  [47] = {
    InterfaceJumpId = 47,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = {4160},
    PortalUnlockTips = "UI_Locked_Des_Mod"
  },
  [48] = {
    InterfaceJumpId = 48,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Skill",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [49] = {
    InterfaceJumpId = 49,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Attr",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [50] = {
    InterfaceJumpId = 50,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Pet",
    JumpParameter3 = "Attr",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = {4090},
    PortalUnlockTips = "UI_Locked_Des_Pet"
  },
  [51] = {
    InterfaceJumpId = 51,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Accessory",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [52] = {
    InterfaceJumpId = 52,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Attr",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [53] = {
    InterfaceJumpId = 53,
    JumpParameter1 = "ActivityFortTask",
    JumpType = "MereJump"
  },
  [54] = {
    InterfaceJumpId = 54,
    JumpParameter1 = "ActivityFeinaEventLevelSelect",
    JumpType = "MereJump"
  },
  [55] = {
    InterfaceJumpId = 55,
    JumpParameter1 = "JumpToShopPage",
    JumpParameter2 = "10002",
    JumpParameter3 = "100021",
    JumpParameter4 = "nil",
    JumpParameter5 = "Rouge",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_2,
    PortalUnlockTips = "UI_Locked_Des_Rouge"
  },
  [56] = {
    InterfaceJumpId = 56,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "BattleWheel",
    JumpParameter3 = "nil",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = {4140},
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [57] = {
    InterfaceJumpId = 57,
    JumpParameter1 = "JumpToShopPage",
    JumpParameter2 = "150",
    JumpParameter3 = "1502",
    JumpParameter4 = "nil",
    JumpParameter5 = "Shop",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_4,
    PortalUnlockTips = "UI_Locked_Des_Shop"
  },
  [58] = {
    InterfaceJumpId = 58,
    JumpParameter1 = "ImpressionShop",
    JumpType = "MereJump"
  },
  [59] = {
    InterfaceJumpId = 59,
    JumpParameter1 = "JumpToShopPage",
    JumpParameter2 = "801.0",
    JumpParameter3 = "8010",
    JumpParameter4 = "nil",
    JumpParameter5 = "FishingShop",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = {82001},
    PortalUnlockTips = "UI_Locked_Des_Shop"
  },
  [60] = {
    InterfaceJumpId = 60,
    JumpParameter1 = "JumpToShopPage",
    JumpParameter2 = "701.0",
    JumpParameter3 = "7010",
    JumpParameter4 = "nil",
    JumpParameter5 = "ExploreBadgeShop",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = {10101001},
    PortalUnlockTips = "UI_Locked_Des_Shop"
  },
  [61] = {
    InterfaceJumpId = 61,
    JumpParameter1 = "ActivityTheaterTask",
    JumpType = "MereJump"
  },
  [62] = {
    InterfaceJumpId = 62,
    JumpParameter1 = "JumpToShopPage",
    JumpParameter2 = "150",
    JumpParameter3 = "1501",
    JumpParameter4 = "nil",
    JumpParameter5 = "Shop",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_4
  },
  [63] = {
    InterfaceJumpId = 63,
    JumpParameter1 = "JumpToStyleOfPlaySubUI",
    JumpParameter2 = "NewDeputeRoot",
    JumpParameter3 = "WeeklySelectDungeon",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = {4240},
    PortalUnlockTips = "UI_Locked_Des_CurrentComission"
  },
  [66] = {
    InterfaceJumpId = 66,
    JumpParameter1 = "WalnutBagMain",
    JumpType = "MereJump"
  },
  [67] = {
    InterfaceJumpId = 67,
    JumpParameter1 = "TaskPanel",
    JumpParameter3 = "200103",
    JumpType = "QuestChain",
    PortalUnlockCondition = {100202},
    PortalUnlockTips = "UI_Locked_Des_Quest"
  },
  [1101] = {
    InterfaceJumpId = 1101,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "1101.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [1103] = {
    InterfaceJumpId = 1103,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "1103.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [1501] = {
    InterfaceJumpId = 1501,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "1501.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [1502] = {
    InterfaceJumpId = 1502,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "1502.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [1503] = {
    InterfaceJumpId = 1503,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "1503.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [1601] = {
    InterfaceJumpId = 1601,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "1601.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [1801] = {
    InterfaceJumpId = 1801,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "1801.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [2101] = {
    InterfaceJumpId = 2101,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "2101.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [2301] = {
    InterfaceJumpId = 2301,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "2301.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [2401] = {
    InterfaceJumpId = 2401,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "2401.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [3101] = {
    InterfaceJumpId = 3101,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "3101.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [3102] = {
    InterfaceJumpId = 3102,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "3102.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [3103] = {
    InterfaceJumpId = 3103,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "3103.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [3201] = {
    InterfaceJumpId = 3201,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "3201.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [3301] = {
    InterfaceJumpId = 3301,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "3301.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [4101] = {
    InterfaceJumpId = 4101,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "4101.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [4102] = {
    InterfaceJumpId = 4102,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "4102.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [4201] = {
    InterfaceJumpId = 4201,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "4201.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [4202] = {
    InterfaceJumpId = 4202,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "4202.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [4301] = {
    InterfaceJumpId = 4301,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "4301.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [5101] = {
    InterfaceJumpId = 5101,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "5101.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [5102] = {
    InterfaceJumpId = 5102,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "5102.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [5301] = {
    InterfaceJumpId = 5301,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "5301.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [5401] = {
    InterfaceJumpId = 5401,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "5401.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10101] = {
    InterfaceJumpId = 10101,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10101.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10102] = {
    InterfaceJumpId = 10102,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10102.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10103] = {
    InterfaceJumpId = 10103,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10103.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10104] = {
    InterfaceJumpId = 10104,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10104.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10105] = {
    InterfaceJumpId = 10105,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10105.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10201] = {
    InterfaceJumpId = 10201,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10201.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10202] = {
    InterfaceJumpId = 10202,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10202.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10203] = {
    InterfaceJumpId = 10203,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10203.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10204] = {
    InterfaceJumpId = 10204,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10204.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10206] = {
    InterfaceJumpId = 10206,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10206.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10301] = {
    InterfaceJumpId = 10301,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10301.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10302] = {
    InterfaceJumpId = 10302,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10302.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10303] = {
    InterfaceJumpId = 10303,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10303.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10304] = {
    InterfaceJumpId = 10304,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10304.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10401] = {
    InterfaceJumpId = 10401,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10401.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10402] = {
    InterfaceJumpId = 10402,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10402.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10403] = {
    InterfaceJumpId = 10403,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10403.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10501] = {
    InterfaceJumpId = 10501,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10501.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10502] = {
    InterfaceJumpId = 10502,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10502.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10503] = {
    InterfaceJumpId = 10503,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10503.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10504] = {
    InterfaceJumpId = 10504,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10504.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10601] = {
    InterfaceJumpId = 10601,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10601.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10602] = {
    InterfaceJumpId = 10602,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10602.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [10603] = {
    InterfaceJumpId = 10603,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "MeeleWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "10603.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20101] = {
    InterfaceJumpId = 20101,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20101.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20102] = {
    InterfaceJumpId = 20102,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20102.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20103] = {
    InterfaceJumpId = 20103,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20103.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20201] = {
    InterfaceJumpId = 20201,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20201.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20203] = {
    InterfaceJumpId = 20203,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20203.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20205] = {
    InterfaceJumpId = 20205,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20205.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20301] = {
    InterfaceJumpId = 20301,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20301.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20302] = {
    InterfaceJumpId = 20302,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20302.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20303] = {
    InterfaceJumpId = 20303,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20303.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20304] = {
    InterfaceJumpId = 20304,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20304.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20305] = {
    InterfaceJumpId = 20305,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20305.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20401] = {
    InterfaceJumpId = 20401,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20401.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20402] = {
    InterfaceJumpId = 20402,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20402.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20403] = {
    InterfaceJumpId = 20403,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20403.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20405] = {
    InterfaceJumpId = 20405,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20405.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20501] = {
    InterfaceJumpId = 20501,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20501.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20502] = {
    InterfaceJumpId = 20502,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20502.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20503] = {
    InterfaceJumpId = 20503,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20503.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20504] = {
    InterfaceJumpId = 20504,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20504.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20507] = {
    InterfaceJumpId = 20507,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20507.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20509] = {
    InterfaceJumpId = 20509,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20509.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20510] = {
    InterfaceJumpId = 20510,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20510.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20601] = {
    InterfaceJumpId = 20601,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20601.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20602] = {
    InterfaceJumpId = 20602,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20602.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20603] = {
    InterfaceJumpId = 20603,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20603.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [20604] = {
    InterfaceJumpId = 20604,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "RangedWeapon",
    JumpParameter3 = "Mod",
    JumpParameter4 = "20604.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  },
  [160101] = {
    InterfaceJumpId = 160101,
    JumpParameter1 = "JumpToArmory",
    JumpParameter2 = "Character",
    JumpParameter3 = "Mod",
    JumpParameter4 = "160101.0",
    JumpType = "SelfDefinedJump",
    PortalUnlockCondition = T.RT_1,
    PortalUnlockTips = "UI_Locked_Des_Armory"
  }
})
