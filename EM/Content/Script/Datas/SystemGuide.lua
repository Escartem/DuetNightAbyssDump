local T = {}
T.RT_1 = {SelectedTargetId = 3301}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SystemGuide", {
  [1001] = {
    EnterDungeon = 19,
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideInfo = {Disarm = 2},
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_PartialDamage.story",
    SysGuideId = 1001
  },
  [1002] = {
    EnterDungeon = 10,
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_PartialDamage_Shijingzhe.story",
    SysGuideId = 1002
  },
  [2001] = {
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Delivery.story",
    IsInRegion = 1,
    PlayerInControl = 1,
    SysGuideId = 2001,
    UIUnlockRule = "Map"
  },
  [2002] = {
    FinishQuest = 10020101,
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideInfo = T.RT_1,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Armory_ChangeWeapon.story",
    IsInRegion = 1,
    OpenInterface = "BattleMain",
    PlayerInControl = 1,
    SysGuideId = 2002
  },
  [2007] = {
    ConditionCheck = 4160,
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 1,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Mod.story",
    IsInRegion = 1,
    OpenInterface = "BattleMain",
    PlayerInControl = 1,
    PreSysGuideId = 2008,
    SysGuideId = 2007
  },
  [2008] = {
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Dungeon.story",
    IsInRegion = 1,
    OpenInterface = "BattleMain",
    PlayerInControl = 1,
    SysGuideId = 2008,
    UIUnlockRule = "Dungeon"
  },
  [2009] = {
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Quest.story",
    IsInRegion = 1,
    OpenInterface = "BattleMain",
    PlayerInControl = 1,
    SysGuideId = 2009,
    UIUnlockRule = "Quest"
  },
  [2010] = {
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Forge.story",
    IsInRegion = 1,
    OpenInterface = "ForgeMain",
    SysGuideId = 2010,
    UIUnlockRule = "Forging"
  },
  [2011] = {
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideInfo = T.RT_1,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_BattleBag.story",
    IsInRegion = 1,
    OpenInterface = "BattleMain",
    PlayerInControl = 1,
    PreSysGuideId = 2010,
    SysGuideId = 2011,
    UIUnlockRule = "BattleWheel"
  },
  [2013] = {
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_ModTendency.story",
    IsInRegion = 1,
    OpenInterface = "ArmoryMod",
    SysGuideId = 2013,
    UIUnlockRule = "Polarity"
  },
  [2014] = {
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_HardBoss.story",
    IsInRegion = 1,
    PlayerInControl = 1,
    PreSysGuideId = 2075,
    SysGuideId = 2014,
    UIUnlockRule = "HardBoss"
  },
  [2015] = {
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Impression.story",
    IsInRegion = 1,
    SpecialCondition = "ImpressionTalk",
    SysGuideId = 2015
  },
  [2016] = {
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_BattleBag_2.story",
    IsInRegion = 1,
    PlayerInControl = 1,
    PreSysGuideId = 2011,
    SysGuideId = 2016
  },
  [2019] = {
    EnterDungeon = 900001,
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_TrainingGround_1.story",
    SysGuideId = 2019
  },
  [2020] = {
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_TrainingGround_2.story",
    OpenInterface = "TrainingGroundSetup",
    SysGuideId = 2020
  },
  [2021] = {
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_TrainingGround_3.story",
    PlayerInControl = 1,
    PreSysGuideId = 2020,
    SysGuideId = 2021
  },
  [2022] = {
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Modlevelup.story",
    IsInRegion = 1,
    PreSysGuideId = 2007,
    SysGuideId = 2022
  },
  [2023] = {
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Rouge.story",
    IsInRegion = 1,
    OpenInterface = "BattleMain",
    PlayerInControl = 1,
    SysGuideId = 2023,
    UIUnlockRule = "Rouge"
  },
  [2024] = {
    ConditionCheck = 5057,
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Rouge_Lantern.story",
    OpenInterface = "RougeMain",
    PreSysGuideId = 2064,
    SysGuideId = 2024
  },
  [2026] = {
    FinishQuest = 10020108,
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Shop.story",
    OpenInterface = "ShopMain",
    SysGuideId = 2026
  },
  [2027] = {
    FinishQuestChain = 200209,
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Maer_EmptyQuest_1.story",
    IsInRegion = 1,
    PlayerInControl = 1,
    SysGuideId = 2027
  },
  [2028] = {
    FinishQuestChain = 200219,
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Maer_EmptyQuest_2.story",
    IsInRegion = 1,
    PlayerInControl = 1,
    SysGuideId = 2028
  },
  [2029] = {
    FinishQuestChain = 200208,
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Maer_EmptyQuest_3.story",
    IsInRegion = 1,
    PlayerInControl = 1,
    SysGuideId = 2029
  },
  [2031] = {
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 1,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Pet2.story",
    IsInRegion = 1,
    OpenInterface = "PetCapture",
    SysGuideId = 2031
  },
  [2032] = {
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Rouge_3Choose1.story",
    OpenInterface = "Rouge_Blessing_3Choose1",
    SysGuideId = 2032
  },
  [2036] = {
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Temple.story",
    IsInRegion = 1,
    PlayerInControl = 1,
    SysGuideId = 2036,
    UIUnlockRule = "Temple"
  },
  [2038] = {
    FinishQuest = 10020101,
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_SkillPress.story",
    IsInRegion = 1,
    PlayerInControl = 1,
    PreSysGuideId = 2002,
    SysGuideId = 2038
  },
  [2039] = {
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_GroupOnlineRule.story",
    IsInRegion = 1,
    PlayerInControl = 1,
    PreSysGuideId = 2074,
    SysGuideId = 2039,
    UIUnlockRule = "FriendMain"
  },
  [2044] = {
    FinishQuest = 20021501,
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Fish.story",
    IsInRegion = 1,
    OpenInterface = "AnglingMain",
    SysGuideId = 2044
  },
  [2051] = {
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_DynStory.story",
    IsInRegion = 1,
    PlayerInControl = 1,
    SpecialCondition = "FirstDynQuest",
    SysGuideId = 2051
  },
  [2052] = {
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Pan.story",
    IsInRegion = 1,
    PlayerInControl = 1,
    SpecialCondition = "FirstPanFixTalk",
    SysGuideId = 2052
  },
  [2054] = {
    FinishQuest = 20022902,
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_ChangeColor.story",
    IsInRegion = 1,
    PlayerInControl = 1,
    SysGuideId = 2054
  },
  [2055] = {
    FinishQuest = 10020105,
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_WIKI.story",
    IsInRegion = 1,
    PlayerInControl = 1,
    SysGuideId = 2055
  },
  [2056] = {
    EnterDungeon = 80201,
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_SideWaysJump.story",
    SysGuideId = 2056
  },
  [2057] = {
    ConditionCheck = 4330,
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideStart = 1,
    GuideStoryline = "Guide/Guide_Dispatch.story",
    IsInRegion = 1,
    OpenInterface = "LevelMapMain",
    SysGuideId = 2057,
    UIUnlockRule = "Dispatch"
  },
  [2058] = {
    ConditionCheck = 1,
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Sojourns.story",
    IsInRegion = 1,
    PlayerInControl = 1,
    SysGuideId = 2058,
    UIUnlockRule = "Entertainment"
  },
  [2060] = {
    ConditionCheck = 4320,
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_DailyGoalUI.story",
    IsInRegion = 1,
    OpenInterface = "BattleMain",
    PlayerInControl = 1,
    SysGuideId = 2060
  },
  [2061] = {
    ConditionCheck = 4360,
    FinishQuest = 20023501,
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_ModArchiveUI.story",
    IsInRegion = 1,
    OpenInterface = "BattleMain",
    PlayerInControl = 1,
    PreSysGuideId = 2022,
    SysGuideId = 2061
  },
  [2062] = {
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_AbyssUI.story",
    IsInRegion = 1,
    OpenInterface = "AbyssMain",
    SysGuideId = 2062
  },
  [2063] = {
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Rouge_UIGuide.story",
    PlayerInControl = 1,
    PreSysGuideId = 2032,
    SysGuideId = 2063
  },
  [2064] = {
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Rouge_Settlement.story",
    OpenInterface = "RougeSettlement",
    SysGuideId = 2064
  },
  [2065] = {
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Rouge_Contract.story",
    OpenInterface = "RougeLikeContractPanel",
    SysGuideId = 2065
  },
  [2066] = {
    ConditionCheck = 6013,
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Abyss.story",
    SysGuideId = 2066
  },
  [2067] = {
    FinishQuest = 10020101,
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Tracking.story",
    IsInRegion = 1,
    PlayerInControl = 1,
    SysGuideId = 2067
  },
  [2068] = {
    FinishQuestChain = 200103,
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_PetTrain.story",
    IsInRegion = 1,
    SysGuideId = 2068,
    UIUnlockRule = "Pet"
  },
  [2069] = {
    FinishQuestChain = 200103,
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_DungeonSec.story",
    IsInRegion = 1,
    OpenInterface = "BattleMain",
    PlayerInControl = 1,
    PreSysGuideId = 2068,
    SysGuideId = 2069,
    UIUnlockRule = "WalnutBag"
  },
  [2070] = {
    ConditionCheck = 4390,
    FinishQuest = 10020502,
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Dungeon_2.story",
    IsInRegion = 1,
    OpenInterface = "StyleOfPlay",
    SysGuideId = 2070
  },
  [2071] = {
    FinishQuest = 10020108,
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 1,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Mail.story",
    IsInRegion = 1,
    PlayerInControl = 1,
    SysGuideId = 2071,
    UIUnlockRule = "Mail"
  },
  [2072] = {
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 1,
    GuideStart = 1,
    GuideStoryline = "Guide/Guide_DungeonSec_2.story",
    PreSysGuideId = 2069,
    SysGuideId = 2072
  },
  [2073] = {
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_WalnutShop.story",
    IsInRegion = 1,
    OpenInterface = "BattleMain",
    PlayerInControl = 1,
    PreSysGuideId = 2069,
    SysGuideId = 2073,
    UIUnlockRule = "WalnutBag"
  },
  [2074] = {
    FinishQuestChain = 100208,
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 1,
    GuideStoryline = "Guide/Guide_OnlineArea.story",
    IsInRegion = 1,
    PlayerInControl = 1,
    SysGuideId = 2074
  },
  [2075] = {
    FinishQuestChain = 200104,
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_PetTraits.story",
    IsInRegion = 1,
    OpenInterface = "BattleMain",
    PlayerInControl = 1,
    SysGuideId = 2075
  },
  [2076] = {
    FinishQuestChain = 200236,
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideInfo = {SelectedTargetId = 5101},
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Intron.story",
    IsInRegion = 1,
    OpenInterface = "BattleMain",
    PlayerInControl = 1,
    PreSysGuideId = 2014,
    SysGuideId = 2076
  },
  [2077] = {
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_PetTraits_2.story",
    IsInRegion = 1,
    OpenInterface = "PetMix",
    PreSysGuideId = 2075,
    SysGuideId = 2077
  },
  [2078] = {
    GuideChannel = "SystemGuideWithUI",
    GuideEnd = 0,
    GuideInfo = {SelectedTargetId = 2101},
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Mail_2.story",
    IsInRegion = 1,
    OpenInterface = "BattleMain",
    PlayerInControl = 1,
    PreSysGuideId = 2071,
    SysGuideId = 2078
  },
  [2079] = {
    FinishQuestChain = 200220,
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Badge.story",
    IsInRegion = 1,
    PlayerInControl = 1,
    SysGuideId = 2079
  },
  [2080] = {
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_TrialRank.story",
    IsInRegion = 1,
    OpenInterface = "ExperienceMain",
    SysGuideId = 2080
  },
  [2081] = {
    GuideChannel = "SystemGuideWithoutUI",
    GuideEnd = 0,
    GuideStart = 0,
    GuideStoryline = "Guide/Guide_Detective.story",
    IsInRegion = 1,
    OpenInterface = "DetectiveMinigame",
    SysGuideId = 2081
  }
})
