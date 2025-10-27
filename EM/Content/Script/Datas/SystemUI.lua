local T = {}
T.RT_1 = {
  "JumpToRogueMain"
}
T.RT_2 = {IsAllowEscape = 1}
T.RT_3 = {201, 202}
T.RT_4 = {"Talk"}
T.RT_5 = {
  "GuideBook_Tips"
}
T.RT_6 = {
  "MainLineQuest"
}
T.RT_7 = {
  "SkillFeature"
}
T.RT_8 = {
  "CharLevelUp_System"
}
T.RT_9 = {
  "TriggerGuide",
  "SystemUnlock",
  "MainLineQuest"
}
T.RT_10 = {101, 102}
T.RT_11 = {
  "QuestBeginEnd"
}
T.RT_12 = {
  BlockedUIName = T.RT_11
}
T.RT_13 = {
  "OpenForcePopup"
}
T.RT_14 = {203}
T.RT_15 = {205}
T.RT_16 = {
  100,
  101,
  102,
  110,
  111
}
T.RT_17 = {
  "SystemUnlock"
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SystemUI", {
  RougeUpgradeTip = {
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Mobile/Shop/WBP_Rouge_ItemUpgrade_M.WBP_Rouge_ItemUpgrade_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/Shop/WBP_Rouge_ItemUpgrade_P.WBP_Rouge_ItemUpgrade_P'",
    UIName = " RougeUpgradeTip",
    ZOrder = 101
  },
  AbyssEntry = {
    ConfigName = "OnlyUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/Widget/WBP_Abyss_Entry.WBP_Abyss_Entry'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/Widget/WBP_Abyss_Entry.WBP_Abyss_Entry'",
    Popup = true,
    UIName = "AbyssEntry",
    ZOrder = 57
  },
  AbyssMain = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Abyss",
    IsHideBattleUnit = 1,
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/Mobile/WBP_Abyss_Main_M.WBP_Abyss_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/PC/WBP_Abyss_Main_P.WBP_Abyss_Main_P'",
    PauseAfterLoadingState = T.RT_1,
    Popup = true,
    System = "Abyss",
    TabCoin = {214},
    UIName = "AbyssMain",
    ZOrder = 50
  },
  AbyssMod = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Abyss",
    IsHideBattleUnit = 1,
    IsHideDrop = true,
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/Mobile/WBP_Abyss_Mod_M.WBP_Abyss_Mod_M\226\128\152",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/PC/WBP_Abyss_Mod_P.WBP_Abyss_Mod_P\226\128\152",
    Params = T.RT_2,
    Popup = true,
    System = "Abyss",
    TabCoin = T.RT_3,
    UIName = "AbyssMod",
    ZOrder = 51
  },
  AbyssSettlement = {
    ConfigName = "StackAndUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/Mobile/WBP_Abyss_Settle_M.WBP_Abyss_Settle_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/PC/WBP_Abyss_Settle_P.WBP_Abyss_Settle_P'",
    Popup = true,
    System = "Abyss",
    UIName = "AbyssSettlement"
  },
  Abyss_BattleProgress = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/WBP_Abyss_CountBar.WBP_Abyss_CountBar'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/WBP_Abyss_CountBar.WBP_Abyss_CountBar'",
    UIName = "Abyss_BattleProgress"
  },
  Abyss_CountDown = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/Widget/WBP_Abyss_CountDown.WBP_Abyss_CountDown'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/Widget/WBP_Abyss_CountDown.WBP_Abyss_CountDown'",
    UIName = "Abyss_CountDown"
  },
  Abyss_CountDown_Progress = {
    GlobalGameUITag = "Abyss",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/Widget/WBP_Abyss_Progress.WBP_Abyss_Progress'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/Widget/WBP_Abyss_Progress.WBP_Abyss_Progress'",
    System = "Abyss",
    UIName = "Abyss_CountDown_Progress"
  },
  AchievementPanel = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Achievement/Widget/WBP_Achievement_Hud.WBP_Achievement_Hud'",
    System = "Battle",
    UIName = "AchievementPanel",
    ZOrder = 19
  },
  AchievementSystem = {
    ConfigName = "StackAndUIMode",
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Achievement/Mobile/WBP_Achievement_M.WBP_Achievement_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Achievement/PC/WBP_Achievement_P.WBP_Achievement_P'",
    Popup = true,
    UIName = "AchievementSystem"
  },
  ActivityEastTask = {
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Mobile/East/Season01/WBP_Activity_East_Sason01_Task_M.WBP_Activity_East_Sason01_Task_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/PC/East/Season01/WBP_Activity_East_Sason01_Task_P.WBP_Activity_East_Sason01_Task_P'",
    UIName = "ActivityEastTask",
    ZOrder = 56
  },
  ActivityFeinaEventLevelSelect = {
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Mobile/FeinaEvent/WBP_Activity_FeinaEvent_LevelSelect_M.WBP_Activity_FeinaEvent_LevelSelect_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/PC/FeinaEvent/WBP_Activity_FeinaEvent_LevelSelect_P.WBP_Activity_FeinaEvent_LevelSelect_P'",
    UIName = "ActivityFeinaEventLevelSelect",
    ZOrder = 56
  },
  ActivityFortTask = {
    ConfigName = "OnlyUIMode",
    IsHideBattleUnit = 1,
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Mobile/Fort/WBP_Activity_Fort_Task_M.WBP_Activity_Fort_Task_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/PC/Fort/WBP_Activity_Fort_Task_P.WBP_Activity_Fort_Task_P'",
    Popup = true,
    UIName = "ActivityFortTask",
    ZOrder = 56
  },
  ActivityJJGameTask = {
    ConfigName = "StackAndUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Mobile/JJGame/WBP_Activity_JJGame_Task_M.WBP_Activity_JJGame_Task_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/PC/JJGame/WBP_Activity_JJGame_Task_P.WBP_Activity_JJGame_Task_P'",
    Params = T.RT_2,
    UIName = "ActivityJJGameTask",
    ZOrder = 56
  },
  ActivityMain = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Activity",
    IsHideBattleUnit = 11,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Mobile/WBP_Activity_Entry_M.WBP_Activity_Entry_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/PC/WBP_Activity_Entry_P.WBP_Activity_Entry_P'",
    Popup = true,
    System = "Activity",
    UIName = "ActivityMain",
    ZOrder = 55
  },
  ActivitySettlement = {
    ConditionShowStateTags = T.RT_4,
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Mobile/WBP_Activity_Settlement_M.WBP_Activity_Settlement_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/PC/WBP_Activity_Settlement_P.WBP_Activity_Settlement_P'",
    UIName = "ActivitySettlement"
  },
  ActivityShop = {
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Mobile/Shop/WBP_Activity_Shop_M.WBP_Activity_Shop_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/PC/Shop/WBP_Activity_Shop_P.WBP_Activity_Shop_P'",
    Popup = true,
    UIName = "ActivityShop"
  },
  ActivityTheaterTask = {
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Mobile/TheaterOnline/WBP_Activity_Theater_Task_M.WBP_Activity_Theater_Task_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/PC/TheaterOnline/WBP_Activity_Theater_Task_P.WBP_Activity_Theater_Task_P'",
    UIName = "ActivityTheaterTask",
    ZOrder = 56
  },
  AimLock = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_AimLocked.WBP_Battle_AimLocked'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_AimLocked.WBP_Battle_AimLocked'",
    System = "Battle",
    UIName = "AimLock"
  },
  AnglingMain = {
    ConfigName = "StackAndUIMode",
    IsHideBattleUnit = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Angling/Mobile/WBP_Angling_Panel_M.WBP_Angling_Panel_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Angling/PC/WBP_AngLing_Panel_P.WBP_AngLing_Panel_P'",
    Popup = true,
    TabCoin = {210},
    UIName = "AnglingMain"
  },
  AnglingMap = {
    ConfigName = "StackAndUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Angling/Mobile/WBP_Angling_FishMap_M.WBP_Angling_FishMap_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Angling/PC/WBP_Angling_FishMap_P.WBP_Angling_FishMap_P'",
    Popup = true,
    UIName = "AnglingMap"
  },
  AnglingNewFish = {
    ConfigName = "StackAndUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Angling/Widget/WBP_Angling_FishUnlock.WBP_Angling_FishUnlock'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Angling/Widget/WBP_Angling_FishUnlock.WBP_Angling_FishUnlock'",
    Popup = true,
    UIName = "AnglingNewFish"
  },
  AnnouncementMain = {
    ConfigName = "StackAndUIMode",
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Announcement/Widget/WBP_Announcement_Main.WBP_Announcement_Main'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Announcement/Widget/WBP_Announcement_Main.WBP_Announcement_Main'",
    Params = T.RT_2,
    Popup = true,
    System = "Announcement",
    UIName = "AnnouncementMain"
  },
  ArchiveBookDetail = {
    ConfigName = "OnlyUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Archive/Widget/WBP_Archive_BookDetail.WBP_Archive_BookDetail'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Archive/Widget/WBP_Archive_BookDetail.WBP_Archive_BookDetail'",
    UIName = "ArchiveBookDetail"
  },
  ArchiveMain = {
    ConfigName = "StackAndUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Archive/Mobile/WBP_Archive_Main_M.WBP_Archive_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Archive/PC/WBP_Archive_Main_P.WBP_Archive_Main_P'",
    Popup = true,
    UIName = "ArchiveMain"
  },
  ArchivePageChar = {
    ConfigName = "StackAndUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Archive/Mobile/WBP_Archive_PageChar_M.WBP_Archive_PageChar_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Archive/PC/WBP_Archive_PageChar_P.WBP_Archive_PageChar_P'",
    Popup = true,
    UIName = "ArchivePageChar"
  },
  ArchivePageItem = {
    ConfigName = "StackAndUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Archive/Mobile/WBP_Archive_PageItem_M.WBP_Archive_PageItem_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Archive/PC/WBP_Archive_PageItem_P.WBP_Archive_PageItem_P'",
    Popup = true,
    UIName = "ArchivePageItem"
  },
  ArchiveReward = {
    ConfigName = "OnlyUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Archive/Widget/WBP_Archive_Reward.WBP_Archive_Reward'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Archive/Widget/WBP_Archive_Reward.WBP_Archive_Reward'",
    UIName = "ArchiveReward"
  },
  ArmoryCardLevelWeapon = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Armory",
    IsHideDrop = true,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_Intensify_M.WBP_Armory_Intensify_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_Intensify_P.WBP_Armory_Intensify_P\226\128\153",
    Params = T.RT_2,
    Popup = true,
    SpecialUINameList = T.RT_5,
    StateTag = 1,
    System = "Armory",
    UIName = "ArmoryCardLevelWeapon",
    ZOrder = 55
  },
  ArmoryDetail = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Armory",
    IsHideBattleUnit = 1,
    IsHideDrop = true,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_Main_M.WBP_Armory_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_Main_P.WBP_Armory_Main_P'",
    Popup = true,
    SpecialUINameList = T.RT_5,
    StateTag = 1,
    System = "Armory",
    UIName = "ArmoryDetail",
    ZOrder = 55
  },
  ArmoryDye = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Armory",
    IsHideDrop = true,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_Dye_M.WBP_Armory_Dye_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_Dye_P.WBP_Armory_Dye_P'",
    Popup = true,
    SpecialUINameList = T.RT_5,
    StateTag = 1,
    System = "Armory",
    UIName = "ArmoryDye",
    ZOrder = 55
  },
  ArmoryFile = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Armory",
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_File_M.WBP_Armory_File_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_File_P.WBP_Armory_File_P'",
    Params = T.RT_2,
    Popup = true,
    System = "Armory",
    UIName = "ArmoryFile",
    ZOrder = 55
  },
  ArmoryMain = {
    CombatconditionIdList = {11, 21},
    ConditiontextList = {
      "UI_Toast_OpenSys_InCombat",
      "UI_Toast_Armory_Forbid"
    },
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Armory",
    IsHideBattleUnit = 1,
    IsHideDrop = true,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_Main_M.WBP_Armory_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_Main_P.WBP_Armory_Main_P'",
    Popup = true,
    SpecialUINameList = T.RT_5,
    StateTag = 1,
    System = "Armory",
    UIName = "ArmoryMain",
    ZOrder = 55
  },
  ArmoryMod = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Armory",
    IsHideBattleUnit = 1,
    IsHideDrop = true,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_Mod_M.WBP_Armory_Mod_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_Mod_P.WBP_Armory_Mod_P'",
    Params = T.RT_2,
    Popup = true,
    SpecialUINameList = T.RT_5,
    StateTag = 1,
    System = "Armory",
    TabCoin = T.RT_3,
    UIName = "ArmoryMod",
    ZOrder = 55
  },
  ArmoryModImport = {
    ConfigName = "OnlyUIMode",
    GlobalGameUITag = "Armory",
    IsHideDrop = true,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_ModImport_M.WBP_Armory_ModImport_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_ModImport_P.WBP_Armory_ModImport_P'",
    Popup = true,
    SpecialUINameList = T.RT_5,
    StateTag = 1,
    System = "Armory",
    UIName = "ArmoryModImport",
    ZOrder = 56
  },
  ArmoryModIntensify = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Armory",
    IsHideDrop = true,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_Intensify_M.WBP_Armory_Intensify_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_Intensify_P.WBP_Armory_Intensify_P\226\128\153",
    Params = T.RT_2,
    Popup = true,
    SpecialUINameList = T.RT_5,
    StateTag = 1,
    System = "Armory",
    UIName = "ArmoryModIntensify",
    ZOrder = 55
  },
  ArmorySkin = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Armory",
    IsHideBattleUnit = 1,
    IsHideDrop = true,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_Skin_M.WBP_Armory_Skin_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_Skin_P.WBP_Armory_Skin_P'",
    Popup = true,
    SpecialUINameList = T.RT_5,
    StateTag = 1,
    System = "Armory",
    TabCoin = {
      99,
      100,
      110
    },
    UIName = "ArmorySkin",
    ZOrder = 55
  },
  ArmoryTraceDetails = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Armory",
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_InronDetail_M.WBP_Armory_InronDetail_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_InronDetail_P.WBP_Armory_InronDetail_P'",
    Popup = true,
    System = "Armory",
    UIName = "ArmoryTraceDetails",
    ZOrder = 54
  },
  BagMain = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Bag",
    IsHideBattleUnit = 11,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Bag/Mobile/WBP_Bag_Main_M.WBP_Bag_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Bag/PC/WBP_Bag_Main_P.WBP_Bag_Main_P'",
    Popup = true,
    System = "Bag",
    TabCoin = {
      100,
      101,
      102
    },
    UIName = "BagMain",
    ZOrder = 55
  },
  BattleBeharmed = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_Beharmed.WBP_Battle_Beharmed'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_Beharmed.WBP_Battle_Beharmed'",
    Params = {AnimPlayHPPercentage = 0.15},
    System = "Battle",
    UIName = "BattleBeharmed",
    ZOrder = -9
  },
  BattleCombo = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/WBP_Battle_Combo_M.WBP_Battle_Combo_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/WBP_Battle_Combo_P.WBP_Battle_Combo_P'",
    System = "Battle",
    UIName = "BattleCombo",
    ZOrder = 25
  },
  BattleFort = {
    ConfigName = "OnlyForceShow",
    KeyboardSetName = "BattleFort",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/WBP_Battle_Fort_M.WBP_Battle_Fort_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/WBP_Battle_Fort_P.WBP_Battle_Fort_P'",
    SpecialUINameList = {
      "BattleMain",
      "BattleHitDirection",
      "DungeonSabotageFloat",
      "DungenonDefenseProFloat",
      "DungenonSurviveFloat",
      "DungeonHijackFloat",
      "DungenonExcavation",
      "DungeonRescueFloat",
      "DungeonExterminateFloat",
      "DestoryAlarm",
      "DungeonSabotageChallenge",
      "BattleBeharmed",
      "NearDeathBlood",
      "BrokenShieldEffect",
      "BossBlood",
      "TaskIndicator",
      "ExploreToastTips",
      "ExploreToastFail",
      "ExploreToastSuccess",
      "TeamToast",
      "GuideMain",
      "GuideIconMain",
      "DungeonBlackScreen",
      "DungeonSettlement",
      "MenuLevel",
      "TalkGuideUI"
    },
    StateTag = 4,
    System = "BattleSubsystem",
    UIName = "BattleFort"
  },
  BattleHitDirection = {
    ConfigName = "BattleHitDirection",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_HitDirection.WBP_Battle_HitDirection'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_HitDirection.WBP_Battle_HitDirection'",
    System = "Battle",
    UIName = "BattleHitDirection",
    ZOrder = -9
  },
  BattleMain = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/WBP_Battle_M.WBP_Battle_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/WBP_Battle_P.WBP_Battle_P'",
    System = "Battle",
    UIName = "BattleMain",
    ZOrder = -3
  },
  BattlePassGetItemPage = {
    ConditionShowStateTags = T.RT_4,
    ConfigName = "OnlyUIMode",
    IsBanAccess = true,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/BattlePass/Mobile/WBP_BattlePass_GetItem_Paid_M.WBP_BattlePass_GetItem_Paid_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/BattlePass/PC/WBP_BattlePass_GetItem_Paid_P.WBP_BattlePass_GetItem_Paid_P'",
    PauseAfterLoadingState = T.RT_6,
    System = "BattlePass",
    UIName = "BattlePassGetItemPage",
    ZOrder = 101
  },
  BattlePassLevelUp = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/BattlePass/Widget/WBP_BattlePass_LevelUp.WBP_BattlePass_LevelUp'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/BattlePass/Widget/WBP_BattlePass_LevelUp.WBP_BattlePass_LevelUp'",
    UIName = "BattlePassLevelUp"
  },
  BattlePassMain = {
    ConfigName = "StackAndUIMode",
    IsHideBattleUnit = 1,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/BattlePass/Mobile/WBP_BattlePass_Main_M.WBP_BattlePass_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/BattlePass/PC/WBP_BattlePass_Main_P.WBP_BattlePass_Main_P'",
    Popup = true,
    System = "BattlePass",
    UIName = "BattlePassMain"
  },
  BattlePassPurchase = {
    ConfigName = "StackAndUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/BattlePass/Mobile/WBP_BattlePass_PurchasePage_M.WBP_BattlePass_PurchasePage_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/BattlePass/PC/WBP_BattlePass_PurchasePage_P.WBP_BattlePass_PurchasePage_P'",
    Params = T.RT_2,
    System = "BattlePass",
    UIName = "BattlePassPurchase"
  },
  BattleResurgence = {
    KeyboardSetName = "Dead",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_Resurrection.WBP_Battle_Resurrection'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_Resurrection.WBP_Battle_Resurrection'",
    SpecialUINameList = {
      "BattleMain",
      "MenuLevel",
      "MenuWorld",
      "DungeonBlackScreen",
      "DungeonSettlement",
      "Setting",
      "TaskIndicator",
      "Vote",
      "SkillDetails",
      "LoadingReconnect",
      "HardBossBattleOpen",
      "RougeSettlement",
      "DungeonSabotageChallenge",
      "Rouge_Blessing_3Choose1",
      "Rouge_Treasure_3Choose1",
      "GuideMain",
      "CommonDialog"
    },
    StateTag = 4,
    System = "Battle",
    UIName = "BattleResurgence",
    ZOrder = 50
  },
  BlackScreeCharChange = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/ChapterStart/Widget/WBP_Chapter_CharChange.WBP_Chapter_CharChange'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/ChapterStart/Widget/WBP_Chapter_CharChange.WBP_Chapter_CharChange'",
    UIName = "BlackScreeCharChange ",
    ZOrder = 105
  },
  BlackScreenHeadPhone = {
    ConfigName = "StackAndUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Widget/WBP_BlackScreen_HeadPhone.WBP_BlackScreen_HeadPhone'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Widget/WBP_BlackScreen_HeadPhone.WBP_BlackScreen_HeadPhone'",
    System = "Story",
    UIName = "BlackScreenHeadPhone",
    ZOrder = 102
  },
  BlackScreenXiaobai = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Loading/Widget/WBP_Com_Loading_XiaoBai.WBP_Com_Loading_XiaoBai'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Loading/Widget/WBP_Com_Loading_XiaoBai.WBP_Com_Loading_XiaoBai'",
    UIName = "BlackScreenXiaobai",
    ZOrder = 105
  },
  BlackTalkUI = {
    ConditionShowStateTags = T.RT_4,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Mobile/WBP_BlackScreenTalk_M.WBP_BlackScreenTalk_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/PC/WBP_BlackScreenTalk_P.WBP_BlackScreenTalk_P'",
    System = "Story",
    UIName = "BlackTalkUI",
    ZOrder = 53
  },
  BossBlood = {
    IsHideInImmersionMode = true,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/Lifebar/WBP_Battle_BossBar_M.WBP_Battle_BossBar_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/Lifebar/WBP_Battle_BossBar_P.WBP_Battle_BossBar_P'",
    System = "Battle",
    UIName = "BossBlood",
    ZOrder = 30
  },
  BossSkillToast = {
    ConditionShowStateTags = T.RT_4,
    IgnoreHideTags = T.RT_7,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/Mobile/WBP_Com_ToastBossSkill_M.WBP_Com_ToastBossSkill_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/PC/WBP_Com_ToastBossSkill_P.WBP_Com_ToastBossSkill_P'",
    UIName = "BossSkillToast"
  },
  BranchTaskReceiveTips = {
    ConditionShowStateTags = T.RT_4,
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Task/Widget/SideTask/WBP_Task_NpcSideTaskTips.WBP_Task_NpcSideTaskTips'",
    Popup = true,
    UIName = "BranchTaskReceiveTips",
    ZOrder = 55
  },
  BrokenShieldEffect = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/WBP_Battle_BrokenShield_M.WBP_Battle_BrokenShield_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/WBP_Battle_BrokenShield_P.WBP_Battle_BrokenShield_P'",
    Params = {
      AnimName = "BrokenShield_All",
      ShieldUIResetRate = 0.3
    },
    System = "Battle",
    UIName = "BrokenShieldEffect",
    ZOrder = 8
  },
  ChapterStart_IceLakeCity = {
    ConditionShowStateTags = T.RT_4,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/ChapterStart/Widget/WBP_ChapterStart_IceLakeCity.WBP_ChapterStart_IceLakeCity'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/ChapterStart/Widget/WBP_ChapterStart_IceLakeCity.WBP_ChapterStart_IceLakeCity'",
    UIName = "ChapterStart_IceLakeCity"
  },
  ChapterStart_SandySea = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/ChapterStart/Widget/WBP_ChapterStart_SandySea.WBP_ChapterStart_SandySea'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/ChapterStart/Widget/WBP_ChapterStart_SandySea.WBP_ChapterStart_SandySea'",
    UIName = "ChapterStart_SandySea"
  },
  Chapter_Transition02 = {
    ConditionShowStateTags = T.RT_4,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/ChapterStart/Widget/WBP_Chapter_Transition02.WBP_Chapter_Transition02'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/ChapterStart/Widget/WBP_Chapter_Transition02.WBP_Chapter_Transition02'",
    UIName = "Chapter_Transition02",
    ZOrder = 60
  },
  CharLevelUp = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Char_LevelUp.WBP_Char_LevelUp'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Char_LevelUp.WBP_Char_LevelUp'",
    System = "Battle",
    UIName = "CharLevelUp",
    ZOrder = -9
  },
  CharLevelUp_System = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Char_LevelUp.WBP_Char_LevelUp'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Char_LevelUp.WBP_Char_LevelUp'",
    Params = {
      SupportUIName = {
        "ArmoryMain",
        "ForgeMain",
        "ShopMain"
      }
    },
    System = "BattleSubsystem",
    UIName = "CharLevelUp_System",
    ZOrder = 56
  },
  CharSkinPreview = {
    ConfigName = "StackAndUIMode",
    IsHideBattleUnit = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/BattlePass/Mobile/WBP_BattlePass_SkinPreview_M.WBP_BattlePass_SkinPreview_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/BattlePass/PC/WBP_BattlePass_SkinPreview_P.WBP_BattlePass_SkinPreview_P'",
    System = "BattlePass",
    UIName = "CharSkinPreview"
  },
  ChatMain = {
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Chat/Mobile/WBP_Chat_Main_M.WBP_Chat_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Chat/PC/WBP_Chat_Main_P.WBP_Chat_Main_P'",
    Params = T.RT_2,
    System = "Chat",
    UIName = "ChatMain",
    ZOrder = 99
  },
  CinematicUI = {
    ConditionShowStateTags = T.RT_4,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Mobile/WBP_Story_Cinema_M.WBP_Story_Cinema_M_C'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/PC/WBP_Story_Cinema_P.WBP_Story_Cinema_P_C'",
    System = "Story",
    UIName = "CinematicUI",
    ZOrder = 10
  },
  CommonBlackScreen = {
    ConditionShowStateTags = T.RT_4,
    ConfigName = "OnlyAllowMulti",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/WBP_Com_BlackScreen.WBP_Com_BlackScreen'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/WBP_Com_BlackScreen.WBP_Com_BlackScreen'",
    SpecialUINameList = {
      "CommonHudReward"
    },
    StateTag = 3,
    System = "Common",
    UIName = "CommonBlackScreen",
    ZOrder = 30
  },
  CommonDarkScreen = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/WBP_Com_DarkScreen.WBP_Com_DarkScreen'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/WBP_Com_DarkScreen.WBP_Com_DarkScreen'",
    System = "Common",
    UIName = "CommonDarkScreen"
  },
  CommonDialog = {
    ConditionShowStateTags = T.RT_4,
    ConfigName = "UIModeAndForceShow",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Dialog/WBP_Com_Dialog.WBP_Com_Dialog'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Dialog/WBP_Com_Dialog.WBP_Com_Dialog'",
    System = "Common",
    UIName = "CommonDialog",
    ZOrder = 100
  },
  CommonDialogTip = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Dialog/Widget/WBP_Com_Dialog_Tip.WBP_Com_Dialog_Tip'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Dialog/Widget/WBP_Com_Dialog_Tip.WBP_Com_Dialog_Tip'",
    System = "Common",
    UIName = "CommonDialogTip",
    ZOrder = 101
  },
  CommonHudReward = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_Reward.WBP_Battle_Reward'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_Reward.WBP_Battle_Reward'",
    PauseAfterLoadingState = T.RT_6,
    SpecialUINameList = {
      "SubSystemUnlock",
      "GuideBook_Tips",
      "CommonNewMonster",
      "AchievementPanel"
    },
    StateTag = 1,
    System = "Battle",
    UIName = "CommonHudReward",
    ZOrder = 21
  },
  CommonNewMonster = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_NewMonster.WBP_Battle_NewMonster'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_NewMonster.WBP_Battle_NewMonster'",
    SpecialUINameList = {
      "AchievementPanel"
    },
    StateTag = 1,
    System = "Battle",
    UIName = "CommonNewMonster",
    ZOrder = 20
  },
  CommonStoryToast = {
    ConfigName = "OnlyForceShow",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/Mobile/WBP_Com_ToastStory_M.WBP_Com_ToastStory_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/PC/WBP_Com_ToastStory_P.WBP_Com_ToastStory_P'",
    System = "Common",
    UIName = "CommonStoryToast",
    ZOrder = 102
  },
  CommonTopToastList = {
    ConfigName = "OnlyForceShow",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/Mobile/WBP_Com_ToastList_M.WBP_Com_ToastList_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/PC/WBP_Com_ToastList_P.WBP_Com_ToastList_P'",
    System = "Common",
    UIName = "CommonTopToastList",
    ZOrder = 103
  },
  ConnectLine = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Mobile/WBP_MiniGame_MiGongMain_M.WBP_MiniGame_MiGongMain_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/PC/WBP_MiniGame_MiGongMain_P.WBP_MiniGame_MiGongMain_P'",
    System = "Battle",
    UIName = "ConnectLine",
    ZOrder = 50
  },
  DefeatedInteract = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/WBP_Battle_Execute_P.WBP_Battle_Execute_P_C'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/WBP_Battle_Execute_P.WBP_Battle_Execute_P_C'",
    System = "Battle",
    UIName = "DefeatedInteract",
    ZOrder = 22
  },
  DefenseLowHealth = {
    ConfigName = "OnlyForceShow",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_DefenseLowHealth.WBP_Dungeon_DefenseLowHealth'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_DefenseLowHealth.WBP_Dungeon_DefenseLowHealth'",
    System = "Battle",
    UIName = "DefenseLowHealth",
    ZOrder = -9
  },
  DestoryAlarm = {
    ConfigName = "OnlyForceShow",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Sabotage/WBP_Dungeon_SabotageAlarm.WBP_Dungeon_SabotageAlarm'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Sabotage/WBP_Dungeon_SabotageAlarm.WBP_Dungeon_SabotageAlarm'",
    UIName = "DestoryAlarm"
  },
  DetectiveAssociate = {
    ConfigName = "OnlyUIMode",
    IsHideBattleUnit = 1,
    IsHideDrop = true,
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Reasoning/Mobile/WBP_Reasoning_Associate_M.WBP_Reasoning_Associate_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Reasoning/PC/WBP_Reasoning_Associate_P.WBP_Reasoning_Associate_P'",
    Popup = true,
    UIName = "DetectiveAssociate",
    ZOrder = 61
  },
  DetectiveAssociateSuccess = {
    ConfigName = "OnlyUIMode",
    IsHideBattleUnit = 1,
    IsHideDrop = true,
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Reasoning/Widget/WBP_Reasoning_AssociateSuccess.WBP_Reasoning_AssociateSuccess'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Reasoning/Widget/WBP_Reasoning_AssociateSuccess.WBP_Reasoning_AssociateSuccess'",
    Popup = true,
    UIName = "DetectiveAssociateSuccess",
    ZOrder = 61
  },
  DetectiveMinigame = {
    ConditionShowStateTags = T.RT_4,
    ConfigName = "StackAndUIMode",
    IsHideDrop = true,
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Reasoning/Mobile/WBP_Reasoning_Main_M.WBP_Reasoning_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Reasoning/PC/WBP_Reasoning_Main_P.WBP_Reasoning_Main_P'",
    Params = T.RT_2,
    Popup = true,
    SpecialUINameList = T.RT_5,
    UIName = "DetectiveMinigame",
    ZOrder = 60
  },
  DetectiveMinigameTips = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/WBP_Com_QuickCheck_Tips.WBP_Com_QuickCheck_Tips'",
    SpecialUINameList = T.RT_5,
    StateTag = 1,
    System = "Battle",
    UIName = "DetectiveMinigameTips"
  },
  DetectiveReasoningAni = {
    ConfigName = "OnlyUIMode",
    IsHideBattleUnit = 1,
    IsHideDrop = true,
    IsStopGame = 1,
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Reasoning/Widget/WBP_Reasoning_Ani.WBP_Reasoning_Ani'",
    Popup = true,
    SpecialUINameList = T.RT_5,
    UIName = "DetectiveReasoningAni",
    ZOrder = 61
  },
  DetectiveReasoningDetail = {
    ConfigName = "OnlyUIMode",
    IsHideBattleUnit = 1,
    IsHideDrop = true,
    IsStopGame = 1,
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Reasoning/Widget/WBP_Reasoning_Detail.WBP_Reasoning_Detail'",
    Popup = true,
    SpecialUINameList = T.RT_5,
    UIName = "DetectiveReasoningDetail",
    ZOrder = 61
  },
  DialogueReview = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Review/Mobile/WBP_Com_DialogueReview_M.WBP_Com_DialogueReview_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Review/PC/WBP_Com_DialogueReview_P.WBP_Com_DialogueReview_P'",
    UIName = "DialogueReview",
    ZOrder = 48
  },
  DoubleBossBlood = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/Lifebar/WBP_Battle_DoubleBossBar_M.WBP_Battle_DoubleBossBar_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/Lifebar/WBP_Battle_DoubleBossBar_P.WBP_Battle_DoubleBossBar_P'",
    System = "Battle",
    UIName = "DoubleBossBlood"
  },
  DungenonDefenseFloat = {
    ConfigName = "OnlyForceShow",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_Defense.WBP_Dungeon_Defense'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_Defense.WBP_Dungeon_Defense'",
    UIName = "DungenonDefenseFloat"
  },
  DungenonDefenseProFloat = {
    ConfigName = "OnlyForceShow",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_DefensePro.WBP_Dungeon_DefensePro'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_DefensePro.WBP_Dungeon_DefensePro'",
    UIName = "DungenonDefenseProFloat"
  },
  DungenonExcavation = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Excavation/WBP_Dungeon_Excavation.WBP_Dungeon_Excavation'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Excavation/WBP_Dungeon_Excavation.WBP_Dungeon_Excavation'",
    UIName = "DungenonExcavation"
  },
  DungenonSurviveFloat = {
    ConfigName = "OnlyForceShow",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Survival/WBP_Dungeon_Survival.WBP_Dungeon_Survival'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Survival/WBP_Dungeon_Survival.WBP_Dungeon_Survival'",
    UIName = "DungenonSurviveFloat"
  },
  DungeonBlackScreen = {
    ConfigName = "OnlyUIMode",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Settlement/Widget/WBP_Settlement_BlackScreen.WBP_Settlement_BlackScreen'",
    System = "Battle",
    UIName = "DungeonBlackScreen",
    ZOrder = 30
  },
  DungeonCaptureFloat = {
    ConfigName = "OnlyForceShow",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Capture/WBP_Dungeon_CaptureTime.WBP_Dungeon_CaptureTime'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Capture/WBP_Dungeon_CaptureTime.WBP_Dungeon_CaptureTime'",
    UIName = "DungeonCaptureFloat"
  },
  DungeonExterminateFloat = {
    ConfigName = "OnlyForceShow",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Annihilate/WBP_Battle_Annihilate.WBP_Battle_Annihilate'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Annihilate/WBP_Battle_Annihilate.WBP_Battle_Annihilate'",
    UIName = "DungeonExterminateFloat"
  },
  DungeonFirstGuide = {
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Guide/Mobile/WBP_Guide_Image_Main_M.WBP_Guide_Image_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Guide/PC/WBP_Guide_Image_Main_P.WBP_Guide_Image_Main_P'",
    PauseAfterLoadingState = {
      "DungeonUI",
      "TriggerGuide"
    },
    UIName = "DungeonFirstGuide",
    ZOrder = 55
  },
  DungeonHijackFloat = {
    ConfigName = "OnlyForceShow",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Hijack/WBP_Dungeon_HijackTask.WBP_Dungeon_HijackTask'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Hijack/WBP_Dungeon_HijackTask.WBP_Dungeon_HijackTask'",
    UIName = "DungeonHijackFloat"
  },
  DungeonHijackFloatPanel = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Hijack/WBP_Dungeon_HijackMain.WBP_Dungeon_HijackMain'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Hijack/WBP_Dungeon_HijackMain.WBP_Dungeon_HijackMain'",
    UIName = "DungeonHijackFloatPanel"
  },
  DungeonMatchTimingBar = {
    ConfigName = "OnlyForceShow",
    KeyboardSetName = "PopupConfirm",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Team/Widget/WBP_Team_Timing.WBP_Team_Timing_C'",
    UIName = "DungeonMatchTimingBar",
    ZOrder = 101
  },
  DungeonRescueFloat = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_Defense.WBP_Dungeon_Defense'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_Defense.WBP_Dungeon_Defense'",
    UIName = "DungeonRescueFloat"
  },
  DungeonRescueTimeFloat = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Rescue/PC/WBP_Dungeon_RescueTime_P.WBP_Dungeon_RescueTime_P'",
    UIName = "DungeonRescueTimeFloat"
  },
  DungeonSabotageChallenge = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Sabotage/WBP_Dungeon_DestroyTaskBar.WBP_Dungeon_DestroyTaskBar_C'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Sabotage/WBP_Dungeon_DestroyTaskBar.WBP_Dungeon_DestroyTaskBar_C'",
    UIName = "DungeonSabotageChallenge",
    ZOrder = -4
  },
  DungeonSabotageFloat = {
    ConfigName = "OnlyForceShow",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Sabotage/WBP_Dungeon_Sabotage.WBP_Dungeon_Sabotage'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Sabotage/WBP_Dungeon_Sabotage.WBP_Dungeon_Sabotage'",
    UIName = "DungeonSabotageFloat"
  },
  DungeonSettlement = {
    ConfigName = "StackAndUIMode",
    IsBanAccess = true,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Settlement/Mobile/WBP_Settlement_M.WBP_Settlement_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Settlement/PC/WBP_Settlement_P.WBP_Settlement_P'",
    System = "Battle",
    UIName = "DungeonSettlement",
    ZOrder = 10
  },
  DungeonSurvivalLowSerum = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Survival/WBP_Dungeon_SurvivalLowSerum.WBP_Dungeon_SurvivalLowSerum'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Survival/WBP_Dungeon_SurvivalLowSerum.WBP_Dungeon_SurvivalLowSerum'",
    UIName = "DungeonSurvivalLowSerum",
    ZOrder = -5
  },
  DungeonSynthesisCrack = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/Weekly/WBP_Play_DeputeWeekly_Hud_KeyItem.WBP_Play_DeputeWeekly_Hud_KeyItem'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/Weekly/WBP_Play_DeputeWeekly_Hud_KeyItem.WBP_Play_DeputeWeekly_Hud_KeyItem'",
    UIName = "DungeonSynthesisCrack"
  },
  DungeonSynthesisFloat = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/Weekly/WBP_Play_DeputeWeekly_Hud_ClueProgressItem.WBP_Play_DeputeWeekly_Hud_ClueProgressItem'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/Weekly/WBP_Play_DeputeWeekly_Hud_ClueProgressItem.WBP_Play_DeputeWeekly_Hud_ClueProgressItem'",
    UIName = "DungeonSynthesisFloat"
  },
  DungeonTempleFloat = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Temple/WBP_Dungeon_Temple_Left.WBP_Dungeon_Temple_Left'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Temple/WBP_Dungeon_Temple_Left.WBP_Dungeon_Temple_Left'",
    UIName = "DungeonTempleFloat"
  },
  Entertainment = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Entertainment",
    IsHideBattleUnit = 11,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Entertainment/Mobile/WBP_Entertainment_M.WBP_Entertainment_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Entertainment/PC/WBP_entertainment_P.WBP_Entertainment_P'",
    Popup = true,
    TabCoin = {19000},
    UIName = "Entertainment",
    ZOrder = 55
  },
  ExperienceMain = {
    ConfigName = "StackAndUIMode",
    IsHideBattleUnit = 1,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Experience/Mobile/WBP_Experience_Main_M.WBP_Experience_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Experience/PC/WBP_Experience_Main_P.WBP_Experience_Main_P'",
    Popup = true,
    UIName = "ExperienceMain",
    ZOrder = 55
  },
  ExploreToastFail = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/Mobile/WBP_Com_ToastFail_M.WBP_Com_ToastFail_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/PC/WBP_Com_ToastFail_P.WBP_Com_ToastFail_P'",
    UIName = "ExploreToastFail",
    ZOrder = 10
  },
  ExploreToastSuccess = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/Mobile/WBP_Com_ToastSuccess_M.WBP_Com_ToastSuccess_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/PC/WBP_Com_ToastSuccess_P.WBP_Com_ToastSuccess_P'",
    SpecialUINameList = {
      "WarningToast"
    },
    StateTag = 1,
    UIName = "ExploreToastSuccess",
    ZOrder = 10
  },
  ExploreToastTips = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/Mobile/WBP_Com_ToastTitle_M.WBP_Com_ToastTitle_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/PC/WBP_Com_ToastTitle_P.WBP_Com_ToastTitle_P'",
    UIName = "ExploreToastTips",
    ZOrder = 10
  },
  FaultBlackTalkUI = {
    ConditionShowStateTags = T.RT_4,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Widget/WBP_Story_FaultBlack.WBP_Story_FaultBlack'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Widget/WBP_Story_FaultBlack.WBP_Story_FaultBlack'",
    System = "Story",
    UIName = "FaultBlackTalkUI",
    ZOrder = 53
  },
  FeinaChangeScene = {
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Widget/FeinaEvent/WBP_Activity_FeinaEvent_ChangeScene.WBP_Activity_FeinaEvent_ChangeScene'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Widget/FeinaEvent/WBP_Activity_FeinaEvent_ChangeScene.WBP_Activity_FeinaEvent_ChangeScene'",
    Popup = true,
    UIName = "FeinaChangeScene",
    ZOrder = 60
  },
  FeinaEventHUD = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Mobile/FeinaEvent/WBP_Activity_FeinaEvent_Hud_M.WBP_Activity_FeinaEvent_Hud_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/PC/FeinaEvent/WBP_Activity_FeinaEvent_Hud_P.WBP_Activity_FeinaEvent_Hud_P'",
    System = "BattleSubsystem",
    UIName = "FeinaEventHUD"
  },
  FeinaEventReward = {
    ConfigName = "OnlyUIMode",
    IsBanAccess = true,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Widget/FeinaEvent/Reward/WBP_Activity_FeinaEvent_Reward.WBP_Activity_FeinaEvent_Reward'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Widget/FeinaEvent/Reward/WBP_Activity_FeinaEvent_Reward.WBP_Activity_FeinaEvent_Reward'",
    UIName = "FeinaEventReward",
    ZOrder = 59
  },
  ForgeCompenduim = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Forge",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Forging/Mobile/WBP_Forging_Compendium_M.WBP_Forging_Compendium_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Forging/PC/WBP_Forging_Compendium_P.WBP_Forging_Compendium_P'",
    System = "Forge",
    UIName = "ForgeCompenduim",
    ZOrder = 56
  },
  ForgeMain = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Forge",
    IsHideBattleUnit = 11,
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Forging/Mobile/WBP_Forging_Main_M.WBP_Forging_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Forging/PC/WBP_Forging_Main_P.WBP_Forging_Main_P'",
    Popup = true,
    System = "Forge",
    TabCoin = {101, 1002},
    UIName = "ForgeMain",
    ZOrder = 55
  },
  ForgePathView = {
    ConfigName = "OnlyUIMode",
    GlobalGameUITag = "Forge",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Forging/Mobile/WBP_Forging_Compendium_ForgingPath_M.WBP_Forging_Compendium_ForgingPath_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Forging/PC/WBP_Forging_Compendium_ForgingPath_P.WBP_Forging_Compendium_ForgingPath_P'",
    System = "Forge",
    UIName = "ForgePathView",
    ZOrder = 57
  },
  FortActivitySettlement = {
    ConditionShowStateTags = T.RT_4,
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Mobile/Fort/WBP_Activity_Fort_Settlement_M.WBP_Activity_Fort_Settlement_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/PC/Fort/WBP_Activity_Fort_Settlement_P.WBP_Activity_Fort_Settlement_P'",
    UIName = "FortActivitySettlement",
    ZOrder = 59
  },
  FriendDialog = {
    ConfigName = "UIModeAndForceShow",
    IsChat = true,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Friend/Widget/WBP_Friend_Window.WBP_Friend_Window'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Friend/Widget/WBP_Friend_Window.WBP_Friend_Window'",
    Params = T.RT_2,
    System = "Friend",
    UIName = "FriendDialog"
  },
  FriendMain = {
    ConfigName = "StackAndUIMode",
    IsChat = true,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Friend/Mobile/WBP_Friend_Main_M.WBP_Friend_Main_M\226\128\153",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Friend/PC/WBP_Friend_Main_P.WBP_Friend_Main_P'",
    Params = T.RT_2,
    Popup = true,
    System = "Friend",
    UIName = "FriendMain"
  },
  GachaGetItemPage = {
    ConditionShowStateTags = T.RT_4,
    ConfigName = "OnlyUIMode",
    IsBanAccess = true,
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/GachaNew/Widget/WBP_Gacha_NormalDraw.WBP_Gacha_NormalDraw'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/GachaNew/Widget/WBP_Gacha_NormalDraw.WBP_Gacha_NormalDraw'",
    PauseAfterLoadingState = T.RT_6,
    System = "Common",
    UIName = "GachaGetItemPage",
    ZOrder = 101
  },
  GachaGetItemPageSP = {
    ConditionShowStateTags = T.RT_4,
    ConfigName = "OnlyUIMode",
    IsBanAccess = true,
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/GachaNew/Mobile/WBP_Gacha_ExclusiveDraw_M.WBP_Gacha_ExclusiveDraw_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/GachaNew/PC/WBP_Gacha_ExclusiveDraw_P.WBP_Gacha_ExclusiveDraw_P'",
    PauseAfterLoadingState = T.RT_6,
    System = "Common",
    UIName = "GachaGetItemPageSP",
    ZOrder = 101
  },
  GachaMain = {
    ConfigName = "StackAndUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/GachaNew/Mobile/WBP_Gacha_M.WBP_Gacha_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/GachaNew/PC/WBP_Gacha_P.WBP_Gacha_P'",
    Popup = true,
    System = "Gacha",
    TabCoin = {99, 100},
    UIName = "GachaMain"
  },
  GetCharPage = {
    ConditionShowStateTags = T.RT_4,
    ConfigName = "OnlyUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Get/Mobile/WBP_Get_Avatar_M.WBP_Get_Avatar_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Get/PC/WBP_Get_Avatar_P.WBP_Get_Avatar_P'",
    SpecialUINameList = T.RT_8,
    StateTag = 1,
    System = "Common",
    UIName = "GetCharPage",
    ZOrder = 99
  },
  GetItemPage = {
    ConditionShowStateTags = T.RT_4,
    ConfigName = "OnlyUIMode",
    IsBanAccess = true,
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/WBP_Com_GetItem_M.WBP_Com_GetItem_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/WBP_Com_GetItem_P.WBP_Com_GetItem_P'",
    PauseAfterLoadingState = T.RT_6,
    SpecialUINameList = {
      "CharLevelUp_System",
      "SystemUnlockGuide"
    },
    StateTag = 1,
    System = "Common",
    UIName = "GetItemPage",
    ZOrder = 101
  },
  GetItemPageSP = {
    ConditionShowStateTags = T.RT_4,
    ConfigName = "OnlyUIMode",
    IsBanAccess = true,
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/WBP_Com_GetItem_SP_M.WBP_Com_GetItem_SP_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/WBP_Com_GetItem_SP_P.WBP_Com_GetItem_SP_P'",
    PauseAfterLoadingState = T.RT_6,
    SpecialUINameList = T.RT_8,
    StateTag = 1,
    System = "Common",
    UIName = "GetItemPageSP",
    ZOrder = 101
  },
  GetWeaponPage = {
    ConditionShowStateTags = T.RT_4,
    ConfigName = "OnlyUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Get/Mobile/WBP_Get_Weapon_M.WBP_Get_Weapon_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Get/PC/WBP_Get_Weapon_P.WBP_Get_Weapon_P'",
    SpecialUINameList = T.RT_8,
    StateTag = 1,
    System = "Common",
    UIName = "GetWeaponPage",
    ZOrder = 99
  },
  GuideBook = {
    ConfigName = "OnlyUIMode",
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Guide/Mobile/WBP_Guide_GuideBook_Main_M.WBP_Guide_GuideBook_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Guide/PC/WBP_Guide_GuideBook_Main_P.WBP_Guide_GuideBook_Main_P'",
    Popup = true,
    UIName = "GuideBook"
  },
  GuideBook_Tips = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Guide/Widget/WBP_Guide_GuideBook_HUDTips.WBP_Guide_GuideBook_HUDTips'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Guide/Widget/WBP_Guide_GuideBook_HUDTips.WBP_Guide_GuideBook_HUDTips'",
    SpecialUINameList = {
      "CommonNewMonster",
      "AchievementPanel"
    },
    StateTag = 1,
    System = "Battle",
    UIName = "GuideBook_Tips",
    ZOrder = 20
  },
  GuideCountDown = {
    ConfigName = "OnlyForceShow",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_DefenseCountDown.WBP_Dungeon_DefenseCountDown'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_DefenseCountDown.WBP_Dungeon_DefenseCountDown'",
    UIName = "GuideCountDown",
    ZOrder = 5
  },
  GuideGesture = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/UI_PC/Guide/Guide_Beginner_Phone.Guide_Beginner_Phone'",
    PauseAfterLoadingState = T.RT_9,
    System = "Guide",
    UIName = "GuideGesture",
    ZOrder = 102
  },
  GuideIconMain = {
    IsHideInImmersionMode = true,
    PCBPPath = "WidgetBlueprint'/Game/UI/UI_PC/Guide/Guide_Point/WBP_Guide_Icon_Main.WBP_Guide_Icon_Main'",
    UIName = "GuideIconMain"
  },
  GuideMain = {
    ConditionShowStateTags = T.RT_4,
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Guide/Mobile/WBP_Guide_Image_Main_M.WBP_Guide_Image_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Guide/PC/WBP_Guide_Image_Main_P.WBP_Guide_Image_Main_P'",
    PauseAfterLoadingState = T.RT_9,
    SpecialUINameList = {
      "CommonNewMonster"
    },
    StateTag = 1,
    System = "Guide",
    UIName = "GuideMain",
    ZOrder = 31
  },
  GuideTextBox = {
    ConditionShowStateTags = T.RT_4,
    ConfigName = "OnlyForceShow",
    MobileBPPath = "WidgetBlueprint'/Game/UI/UI_PC/Guide/Guide_UICharacter_PC.Guide_UICharacter_PC_C'",
    PCBPPath = "WidgetBlueprint'/Game/UI/UI_PC/Guide/Guide_UICharacter_PC.Guide_UICharacter_PC_C'",
    PauseAfterLoadingState = T.RT_9,
    System = "Guide",
    UIName = "GuideTextBox",
    ZOrder = 102
  },
  GuideTextFloatList = {
    PauseAfterLoadingState = T.RT_9,
    System = "Guide",
    UIName = "GuideTextFloatList"
  },
  GuideTouch = {
    ConfigName = "OnlyAllowMulti",
    MobileBPPath = "WidgetBlueprint'/Game/UI/UI_PC/Guide/Guide_HighLightBox_Dark_PC.Guide_HighLightBox_Dark_PC'",
    PCBPPath = "WidgetBlueprint'/Game/UI/UI_PC/Guide/Guide_HighLightBox_Dark_PC.Guide_HighLightBox_Dark_PC'",
    PauseAfterLoadingState = T.RT_9,
    System = "Guide",
    UIName = "GuideTouch",
    ZOrder = 103
  },
  HardBossBattleOpen = {
    ConfigName = "UIModeAndNotAddToStack",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/WBP_Play_HardBoss_BattleOpen.WBP_Play_HardBoss_BattleOpen'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/WBP_Play_HardBoss_BattleOpen.WBP_Play_HardBoss_BattleOpen'",
    System = "Hardboss",
    UIName = "HardBossBattleOpen",
    ZOrder = 66
  },
  HardBossLevelChoose = {
    ConfigName = "StackAndUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/WBP_Play_HardBoss_HardLevelChoose.WBP_Play_HardBoss_HardLevelChoose'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/WBP_Play_HardBoss_HardLevelChoose.WBP_Play_HardBoss_HardLevelChoose'",
    Popup = true,
    System = "Hardboss",
    TabCoin = T.RT_10,
    UIName = "HardBossLevelChoose",
    ZOrder = -2
  },
  HardBossMain = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/WBP_Play_HardBoss_Main.WBP_Play_HardBoss_Main'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/WBP_Play_HardBoss_Main.WBP_Play_HardBoss_Main'",
    Popup = true,
    System = "Hardboss",
    TabCoin = T.RT_10,
    UIName = "HardBossMain"
  },
  HardBossMapTips = {
    IsBanAccess = true,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/WBP_Play_HardBoss_MapTips.WBP_Play_HardBoss_MapTips'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/WBP_Play_HardBoss_MapTips.WBP_Play_HardBoss_MapTips'",
    System = "Hardboss",
    TabCoin = T.RT_10,
    UIName = "HardBossMapTips",
    ZOrder = 5
  },
  HookInteractive = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/Unit/WBP_Battle_HookLock_M.WBP_Battle_HookLock_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/WBP_Battle_HookLock_P.WBP_Battle_HookLock_P'",
    UIName = "HookInteractive"
  },
  HudBubbleL = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/WBP_Com_HudBubble_L.WBP_Com_HudBubble_L'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/WBP_Com_HudBubble_L.WBP_Com_HudBubble_L'",
    System = "Guide",
    UIName = "HudBubbleL",
    ZOrder = 10
  },
  ImpressionDimensionResult = {
    ConditionShowStateTags = T.RT_4,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Impression/Widget/WBP_Impression_DimensionResult.WBP_Impression_DimensionResult'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Impression/Widget/WBP_Impression_DimensionResult.WBP_Impression_DimensionResult'",
    UIName = "ImpressionDimensionResult ",
    ZOrder = 10
  },
  ImpressionMainUI = {
    ConditionShowStateTags = T.RT_4,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Impression/Mobile/WBP_Impression_M.WBP_Impression_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Impression/PC/WBP_Impression_P.WBP_Impression_P'",
    System = "Story",
    UIName = "ImpressionMainUI",
    ZOrder = 10
  },
  ImpressionShop = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Shop",
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Impression/Mobile/Shop/WBP_Impression_Shop_M.WBP_Impression_Shop_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Impression/PC/Shop/WBP_Impression_Shop_P.WBP_Impression_Shop_P_C'",
    Popup = true,
    UIName = "ImpressionShop"
  },
  InBattleWheelMenu = {
    KeyboardSetName = "InBattleWheel",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/WBP_Battle_Menu_M.WBP_Battle_Menu_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/WBP_Battle_Menu_P.WBP_Battle_Menu_P'",
    Params = {BehaviourType = 1},
    System = "Battle",
    UIName = "InBattleWheelMenu",
    ZOrder = 50
  },
  InteractiveUI = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/WBP_Battle_Interactive_M.WBP_Battle_Interactive_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/WBP_Battle_Interactive_P.WBP_Battle_Interactive_P'",
    System = "Battle",
    UIName = "InteractiveUI",
    ZOrder = 20
  },
  ItemInformation = {
    ConfigName = "UIModeAndNotAddToStack",
    IsStopGame = 1,
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Dialog/WBP_Com_DialogStory.WBP_Com_DialogStory'",
    System = "Battle",
    UIName = "ItemInformation",
    ZOrder = 102
  },
  LevelMapMain = {
    ConfigName = "StackAndFullScreen",
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Mobile/WBP_Map_M.WBP_Map_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Map/PC/WBP_Map_P.WBP_Map_P'",
    Popup = true,
    UIName = "LevelMapMain",
    ZOrder = 50
  },
  Loading = {UIName = "Loading", ZOrder = 105},
  LoadingReconnect = {
    ConditionShowStateTags = T.RT_4,
    ConfigName = "OnlyForceShow",
    IsStopGame = 1,
    KeyboardSetName = "LoadingReconnect",
    MobileBPPath = "WidgetBlueprint'/Game/UI/UI_PC/Login/Loading_Reconnect.Loading_Reconnect'",
    PCBPPath = "WidgetBlueprint'/Game/UI/UI_PC/Login/Loading_Reconnect.Loading_Reconnect'",
    System = "Battle",
    UIName = "LoadingReconnect",
    ZOrder = 106
  },
  LoginMainPage = {
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Login/Widget/WBP_Login_Main.WBP_Login_Main'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Login/Widget/WBP_Login_Main.WBP_Login_Main'",
    Popup = true,
    UIName = "LoginMainPage"
  },
  LoginPatchPage = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/UI_PC/Login/Login_Patch_PC.Login_Patch_PC'",
    PCBPPath = "WidgetBlueprint'/Game/UI/UI_PC/Login/Login_Patch_PC.Login_Patch_PC'",
    UIName = "LoginPatchPage"
  },
  MailMain = {
    ConfigName = "StackAndUIMode",
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Mail/Mobile/WBP_Mail_Main_M.WBP_Mail_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Mail/PC/WBP_Mail_Main_P.WBP_Mail_Main_P'",
    Popup = true,
    UIName = "MailMain",
    ZOrder = 55
  },
  MenuBattle = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Menu/Mobile/WBP_Menu_Battle_M.WBP_Menu_Battle_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Menu/PC/WBP_Menu_Battle_P.WBP_Menu_Battle_P'",
    UIName = "MenuBattle",
    ZOrder = 52
  },
  MenuLevel = {
    ConfigName = "StackAndUIMode",
    IsBanAccess = true,
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Menu/Mobile/WBP_Menu_Battle_M.WBP_Menu_Battle_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Menu/PC/WBP_Menu_Battle_P.WBP_Menu_Battle_P'",
    Params = T.RT_12,
    UIName = "MenuLevel",
    ZOrder = 52
  },
  MenuWorld = {
    ConfigName = "StackAndUIMode",
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Menu/Mobile/WBP_Menu_World_M.WBP_Menu_World_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Menu/PC/WBP_Menu_World_P.WBP_Menu_World_P'",
    Params = T.RT_12,
    UIName = "MenuWorld",
    ZOrder = 52
  },
  ModArchiveMain = {
    ConfigName = "StackAndUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/ModArchive/Mobile/WBP_ModArchive_Main_M.WBP_ModArchive_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/ModArchive/PC/WBP_ModArchive_Main_P.WBP_ModArchive_Main_P'",
    Popup = true,
    System = "ModArchive",
    TabCoin = {211},
    UIName = "ModArchiveMain"
  },
  ModArchiveTaskTips = {
    ConfigName = "OnlyAllowMulti",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/ModArchive/Widget/WBP_ModArchive_HudTips.WBP_ModArchive_HudTips'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/ModArchive/Widget/WBP_ModArchive_HudTips.WBP_ModArchive_HudTips'",
    SpecialUINameList = {
      "SubSystemUnlock",
      "GuideBook_Tips"
    },
    StateTag = 1,
    System = "ModArchive",
    UIName = "ModArchiveTaskTips"
  },
  ModArchiveUpdateTips = {
    ConfigName = "OnlyUIMode",
    IsBanAccess = true,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/ModArchive/Widget/WBP_ModArchive_UpdateTips.WBP_ModArchive_UpdateTips'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/ModArchive/Widget/WBP_ModArchive_UpdateTips.WBP_ModArchive_UpdateTips'",
    Popup = true,
    System = "ModArchive",
    UIName = "ModArchiveUpdateTips"
  },
  MonsterDetailInfo = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/WBP_Play_DeputeMonsterInfo.WBP_Play_DeputeMonsterInfo'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/WBP_Play_DeputeMonsterInfo.WBP_Play_DeputeMonsterInfo'",
    UIName = "MonsterDetailInfo",
    ZOrder = 56
  },
  MonthCardPop = {
    ConfigName = "StackAndUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/Widget/MonthCardPopUp/WBP_MonthCard_PopUp.WBP_MonthCard_PopUp'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/Widget/MonthCardPopUp/WBP_MonthCard_PopUp.WBP_MonthCard_PopUp'",
    PauseAfterLoadingState = T.RT_13,
    UIName = "MonthCardPop",
    ZOrder = 51
  },
  Morse = {
    ConfigName = "StackAndUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Mobile/WBP_MiniGame_Mima_M.WBP_MiniGame_Mima_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/PC/WBP_MiniGame_Mima_P.WBP_MiniGame_Mima_P'",
    Popup = true,
    UIName = "Morse"
  },
  NearDeathBlood = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/WBP_Battle_NearDeath_M.WBP_Battle_NearDeath_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/WBP_Battle_NearDeath_P.WBP_Battle_NearDeath_P'",
    Params = {
      FirstLevelFactor = 1.0,
      SecondLevelBloodStrength = 0.15,
      SecondLevelFactor = 2.0,
      ShowUIBloodStrength = 0.3
    },
    System = "Battle",
    UIName = "NearDeathBlood",
    ZOrder = 8
  },
  NetDisConnectedDialog = {
    ConditionShowStateTags = T.RT_4,
    ConfigName = "UIModeAndForceShow",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Dialog/WBP_Com_Dialog.WBP_Com_Dialog'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Dialog/WBP_Com_Dialog.WBP_Com_Dialog'",
    System = "Common",
    UIName = "NetDisConnectedDialog",
    ZOrder = 110
  },
  NpcBiography = {
    ConditionShowStateTags = T.RT_4,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Widget/WBP_Story_NPC.WBP_Story_NPC_C'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Widget/WBP_Story_NPC.WBP_Story_NPC_C'",
    UIName = "NpcBiography",
    ZOrder = 40
  },
  NpcSwitchMain = {
    ConfigName = "StackAndUIMode",
    IsHideBattleUnit = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Invitation/Mobile/WBP_Invitation_M.WBP_Invitation_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Invitation/PC/WBP_Invitation_P.WBP_Invitation_P'",
    Popup = true,
    UIName = "NpcSwitchMain",
    ZOrder = 55
  },
  PayGiftPopup_Purple = {
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/Mobile/WBP_Shop_Gift_PopUp_Purple_M.WBP_Shop_Gift_PopUp_Purple_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/PC/WBP_Shop_Gift_PopUp_Purple_P.WBP_Shop_Gift_PopUp_Purple_P'",
    System = "Shop",
    UIName = "PayGiftPopup_Purple",
    ZOrder = 56
  },
  PayGiftPopup_Yellow = {
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/Mobile/WBP_Shop_Gift_PopUp_Yellow_M.WBP_Shop_Gift_PopUp_Yellow_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/PC/WBP_Shop_Gift_PopUp_Yellow_P.WBP_Shop_Gift_PopUp_Yellow_P'",
    System = "Shop",
    UIName = "PayGiftPopup_Yellow",
    ZOrder = 56
  },
  PersonInfoPageMain = {
    ConfigName = "StackAndUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/PersonalInfo/Mobile/WBP_PersonalInfo_Root_M.WBP_PersonalInfo_Root_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/PersonalInfo/PC/WBP_PersonalInfo_Root_P.WBP_PersonalInfo_Root_P'",
    Popup = true,
    SpecialUINameList = {"ChatMain"},
    StateTag = 1,
    System = "PersonInfo",
    UIName = "PersonInfoPageMain",
    ZOrder = 55
  },
  PetCapture = {
    ConfigName = "OnlyUIMode",
    IsBanAccess = true,
    IsHideBattleUnit = 1,
    IsHideDrop = true,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Pet_Capture/Mobile/WBP_Pet_Capture_M.WBP_Pet_Capture_M_C'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Pet_Capture/PC/WBP_Pet_Capture_P.WBP_Pet_Capture_P_C'",
    Popup = true,
    UIName = "PetCapture",
    ZOrder = -2
  },
  PetCaptureDetail = {
    IsHideBattleUnit = 1,
    IsHideDrop = true,
    IsStopGame = 1,
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Pet_Capture/Widget/WBP_Pet_Capture_Detail.WBP_Pet_Capture_Detail_C'",
    UIName = "PetCaptureDetail",
    ZOrder = 28
  },
  PetEnhance = {
    ConfigName = "StackAndUIMode",
    IsHideBattleUnit = 1,
    IsHideDrop = true,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_PetEnhance_M.WBP_Armory_PetEnhance_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_PetEnhance_P.WBP_Armory_PetEnhance_P'",
    Popup = true,
    UIName = "PetEnhance"
  },
  PetEntry = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Armory",
    IsHideBattleUnit = 1,
    IsHideDrop = true,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_PetArchive_M.WBP_Armory_PetArchive_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_PetArchive_P.WBP_Armory_PetArchive_P'",
    Popup = true,
    System = "Armory",
    UIName = "PetEntry"
  },
  PetMix = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Armory",
    IsHideBattleUnit = 1,
    IsHideDrop = true,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_PetMix_M.WBP_Armory_PetMix_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_PetMix_P.WBP_Armory_PetMix_P'",
    Params = T.RT_2,
    Popup = true,
    System = "Armory",
    UIName = "PetMix"
  },
  PetMixEntry = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Armory",
    IsHideBattleUnit = 1,
    IsHideDrop = true,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_PetArchive_M.WBP_Armory_PetArchive_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_PetArchive_P.WBP_Armory_PetArchive_P'",
    Popup = true,
    System = "Armory",
    UIName = "PetMixEntry"
  },
  PhotoCameraMain = {
    ConfigName = "StackAndUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Camera/Mobile/WBP_Camera_M.WBP_Camera_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Camera/PC/WBP_Camera_P.WBP_Camera_P'",
    Popup = true,
    UIName = "PhotoCameraMain",
    ZOrder = 55
  },
  PianoSystem = {
    ConfigName = "StackAndUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Piano/Mobile/WBP_Piano_Main_M.WBP_Piano_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Piano/PC/WBP_Piano_Main_P.WBP_Piano_Main_P'",
    System = "Piano",
    UIName = "PianoSystem"
  },
  QTE = {
    ConditionShowStateTags = T.RT_4,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Mobile/WBP_Story_QTE_M.WBP_Story_QTE_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/PC/WBP_Story_QTE_P.WBP_Story_QTE_P'",
    UIName = "QTE"
  },
  ReasoningCollect = {
    ConditionShowStateTags = T.RT_4,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Reasoning/Mobile/WBP_Reasoning_Collect_M.WBP_Reasoning_Collect_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Reasoning/PC/WBP_Reasoning_Collect_P.WBP_Reasoning_Collect_P'",
    UIName = "ReasoningCollect",
    ZOrder = 50
  },
  ReasoningItemInformation = {
    ConfigName = "UIModeAndNotAddToStack",
    IsStopGame = 1,
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Reasoning/Widget/WBP_Reasoning_Dialog.WBP_Reasoning_Dialog'",
    System = "Battle",
    UIName = "ReasoningItemInformation",
    ZOrder = 102
  },
  RechargeRebateTips = {
    ConfigName = "OnlyUIMode",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Widget/RechargeRebate/WBP_Activity_RechargeRebate_Tips.WBP_Activity_RechargeRebate_Tips'",
    UIName = "RechargeRebateTips"
  },
  RecoverUI = {
    ConfigName = "UIModeAndForceShow",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/ActionPoint/WBP_AP_Dialog.WBP_AP_Dialog'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/ActionPoint/WBP_AP_Dialog.WBP_AP_Dialog'",
    UIName = "RecoverUI",
    ZOrder = 99
  },
  RegionCoDefenceProgress = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessEscape.WBP_Battle_ProcessEscape'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessEscape.WBP_Battle_ProcessEscape'",
    UIName = "RegionCoDefenceProgress"
  },
  RegionHijackFloatPanel = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessEscort.WBP_Battle_ProcessEscort'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessEscort.WBP_Battle_ProcessEscort'",
    UIName = "RegionHijackFloatPanel"
  },
  RegionMapImpression = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Mobile/WBP_Map_ImpressionPage_M.WBP_Map_ImpressionPage_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Map/PC/WBP_Map_ImpressionPage_P.WBP_Map_ImpressionPage_P'",
    UIName = "RegionMapImpression",
    ZOrder = 59
  },
  RegionMultiDestroyProgress = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessOverload.WBP_Battle_ProcessOverload'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessOverload.WBP_Battle_ProcessOverload'",
    UIName = "RegionMultiDestroyProgress"
  },
  RegionOnlineFloat = {
    ConfigName = "OnlyForceShow",
    IsHideInImmersionMode = true,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/Mobile/WBP_Com_ToastOnline_M.WBP_Com_ToastOnline_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/PC/WBP_Com_ToastOnline_P.WBP_Com_ToastOnline_P'",
    System = "Common",
    UIName = "RegionOnlineFloat"
  },
  RegionResurgence = {
    KeyboardSetName = "DeadInRegion",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_Resurrection.WBP_Battle_Resurrection'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_Resurrection.WBP_Battle_Resurrection'",
    SpecialUINameList = {
      "BattleMain",
      "MenuLevel",
      "MenuWorld",
      "DungeonBlackScreen",
      "DungeonSettlement",
      "Setting",
      "TaskIndicator",
      "Vote",
      "SkillDetails",
      "LoadingReconnect",
      "HardBossBattleOpen",
      "RougeSettlement",
      "DungeonSabotageChallenge",
      "CommonBlackScreen",
      "GuideMain",
      "CommonDialog"
    },
    StateTag = 4,
    System = "Battle",
    UIName = "RegionResurgence",
    ZOrder = 50
  },
  RougeArchiveEvent = {
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Mobile/Archive/WBP_Rougelike_Archive_Event_M.WBP_Rougelike_Archive_Event_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/Archive/WBP_Rougelike_Archive_Event_P.WBP_Rougelike_Archive_Event_P'",
    UIName = "RougeArchiveEvent",
    ZOrder = 56
  },
  RougeArchiveReward = {
    ConfigName = "OnlyUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Archive/WBP_RougeLike_ArchiveReward.WBP_RougeLike_ArchiveReward'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Archive/WBP_RougeLike_ArchiveReward.WBP_RougeLike_ArchiveReward'",
    UIName = "RougeArchiveReward",
    ZOrder = 100
  },
  RougeArchiveStory = {
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Mobile/Archive/WBP_RougeLike_Archive_StoryLine_M.WBP_RougeLike_Archive_StoryLine_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/Archive/WBP_RougeLike_Archive_StoryLine_P.WBP_RougeLike_Archive_StoryLine_P'",
    UIName = "RougeArchiveStory",
    ZOrder = 56
  },
  RougeBag = {
    ConfigName = "OnlyUIMode",
    GlobalGameUITag = "RougeBag",
    IsHideBattleUnit = 1,
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Mobile/CheckDetail/WBP_Rouge_CheckDetail_M.WBP_Rouge_CheckDetail_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/CheckDetail/WBP_Rouge_CheckDetail_P.WBP_Rouge_CheckDetail_P'",
    Popup = true,
    TabCoin = T.RT_14,
    UIName = "RougeBag",
    ZOrder = 60
  },
  RougeBagItemPopUp = {
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Mobile/CheckDetail/WBP_Rouge_CheckDetailPopUp_M.WBP_Rouge_CheckDetailPopUp_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/CheckDetail/WBP_Rouge_CheckDetailPopUp_P.WBP_Rouge_CheckDetailPopUp_P'",
    UIName = "RougeBagItemPopUp",
    ZOrder = 62
  },
  RougeGameSettlement = {
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Mobile/WBP_Rouge_GameSettlement_M.WBP_Rouge_GameSettlement_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/WBP_Rouge_GameSettlement_P.WBP_Rouge_GameSettlement_P'",
    UIName = "RougeGameSettlement",
    ZOrder = 102
  },
  RougeGetItemsTip = {
    ConfigName = "OnlyUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Mobile/GetItemTips/WBP_Rouge_GetItemTips_M.WBP_Rouge_GetItemTips_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/GetItemTips/WBP_Rouge_GetItemTips_P.WBP_Rouge_GetItemTips_P'",
    UIName = "RougeGetItemsTip",
    ZOrder = 101
  },
  RougeItemDetailPopUp = {
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Mobile/CheckDetail/WBP_Rouge_CheckDetail_PopUp_M.WBP_Rouge_CheckDetail_PopUp_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/CheckDetail/WBP_Rouge_CheckDetail_PopUp_P.WBP_Rouge_CheckDetail_PopUp_P'",
    UIName = "RougeItemDetailPopUp",
    ZOrder = 62
  },
  RougeLikeContractPanel = {
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Mobile/WBP_Rouge_Heat_M.WBP_Rouge_Heat_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/WBP_Rouge_Heat_P.WBP_Rouge_Heat_P'",
    UIName = "RougeLikeContractPanel",
    ZOrder = 99
  },
  RougeLikeEnterToastUI = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_EnterToast.WBP_Rouge_EnterToast_C'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_EnterToast.WBP_Rouge_EnterToast_C'",
    SpecialUINameList = {
      "CharLevelUp"
    },
    StateTag = 1,
    System = "Battle",
    UIName = "RougeLikeEnterToastUI",
    ZOrder = 5
  },
  RougeLikeMenuContractPanel = {
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Mobile/WBP_Rouge_MenuHeatPage_M.WBP_Rouge_MenuHeatPage_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/WBP_Rouge_MenuHeatPage_P.WBP_Rouge_MenuHeatPage_P'",
    UIName = "RougeLikeMenuContractPanel",
    ZOrder = 53
  },
  RougeMain = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/WBP_Rouge_Main_P.WBP_Rouge_Main_P'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/WBP_Rouge_Main_P.WBP_Rouge_Main_P'",
    TabCoin = T.RT_15,
    UIName = "RougeMain",
    ZOrder = 98
  },
  RougeReward = {
    ConfigName = "OnlyUIMode",
    IsBanAccess = true,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Reward/WBP_Rouge_Reward.WBP_Rouge_Reward'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Reward/WBP_Rouge_Reward.WBP_Rouge_Reward'",
    UIName = "RougeReward",
    ZOrder = 59
  },
  RougeSettlement = {
    ConfigName = "OnlyUIMode",
    IsBanAccess = true,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Mobile/WBP_Rouge_Settlement_M.WBP_Rouge_Settlement_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/WBP_Rouge_Settlement_P.WBP_Rouge_Settlement_P'",
    UIName = "RougeSettlement",
    ZOrder = 102
  },
  RougeShop = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "RougeShop",
    IsHideBattleUnit = 1,
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Mobile/Shop/WBP_Rouge_Shop_M.WBP_Rouge_Shop_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/Shop/WBP_Rouge_Shop_P.WBP_Rouge_Shop_P'",
    Popup = true,
    TabCoin = T.RT_14,
    UIName = "RougeShop",
    ZOrder = 60
  },
  RougeTalentMenu = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/TalentTree/WBP_Rouge_TalentMenu_P.WBP_Rouge_TalentMenu_P'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/TalentTree/WBP_Rouge_TalentMenu_P.WBP_Rouge_TalentMenu_P'",
    TabCoin = T.RT_15,
    UIName = "RougeTalentMenu"
  },
  RougeTalentPage = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Mobile/TalentTree/WBP_Rouge_TalentPage_M.WBP_Rouge_TalentPage_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/TalentTree/WBP_Rouge_TalentPage_P.WBP_Rouge_TalentPage_P'",
    TabCoin = T.RT_15,
    UIName = "RougeTalentPage"
  },
  RougeTransition = {
    KeyboardSetName = "InDeliver",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_Transition.WBP_Rouge_Transition'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_Transition.WBP_Rouge_Transition'",
    Popup = true,
    UIName = "RougeTransition"
  },
  RougeTransitionBoss = {
    KeyboardSetName = "InDeliver",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_Transition_Boss.WBP_Rouge_Transition_Boss'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_Transition_Boss.WBP_Rouge_Transition_Boss'",
    Popup = true,
    UIName = "RougeTransitionBoss"
  },
  Rouge_BattleProgress = {
    ConfigName = "OnlyForceShow",
    MobileBPPath = "/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_Annihilate.WBP_Rouge_Annihilate_C",
    PCBPPath = "/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_Annihilate.WBP_Rouge_Annihilate_C",
    UIName = "Rouge_BattleProgress"
  },
  Rouge_Blessing_3Choose1 = {
    ConfigName = "OnlyUIMode",
    IsStopGame = 1,
    MobileBPPath = "/Game/UI/WBP/RougeLike/Mobile/3Choose1/WBP_Rouge_Blessing3Choose1_M.WBP_Rouge_Blessing3Choose1_M_C",
    PCBPPath = "/Game/UI/WBP/RougeLike/PC/3Choose1/WBP_Rouge_Blessing3Choose1_P.WBP_Rouge_Blessing3Choose1_P_C",
    UIName = "Rouge_Blessing_3Choose1",
    ZOrder = 58
  },
  Rouge_Definition = {
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Mobile/CheckDetail/WBP_Rouge_CheckDetail_Definition_PopUp_M.WBP_Rouge_CheckDetail_Definition_PopUp_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/CheckDetail/WBP_Rouge_CheckDetail_Definition_PopUp_P.WBP_Rouge_CheckDetail_Definition_PopUp_P'",
    UIName = "Rouge_Definition",
    ZOrder = 105
  },
  Rouge_Event_Main = {
    ConfigName = "OnlyUIMode",
    IsStopGame = 1,
    MobileBPPath = "/Game/UI/WBP/RougeLike/Mobile/Event/WBP_Rouge_Event_New_M.WBP_Rouge_Event_New_M_C",
    PCBPPath = "/Game/UI/WBP/RougeLike/PC/Event/WBP_Rouge_Event_New_P.WBP_Rouge_Event_New_P_C",
    UIName = "Rouge_Event_Main",
    ZOrder = 57
  },
  Rouge_SuitActivate = {
    ConfigName = "OnlyUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Mobile/Suit/WBP_Rouge_Suit_Activate_M.WBP_Rouge_Suit_Activate_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/Suit/WBP_Rouge_Suit_Activate_P.WBP_Rouge_Suit_Activate_P'",
    UIName = "Rouge_SuitActivate",
    ZOrder = 65
  },
  Rouge_SuitDetail = {
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Suit/WBP_Rouge_SuitDetail.WBP_Rouge_SuitDetail'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Suit/WBP_Rouge_SuitDetail.WBP_Rouge_SuitDetail'",
    UIName = "Rouge_SuitDetail",
    ZOrder = 65
  },
  Rouge_Treasure_3Choose1 = {
    ConfigName = "OnlyUIMode",
    IsStopGame = 1,
    MobileBPPath = "/Game/UI/WBP/RougeLike/Mobile/3Choose1/WBP_Rouge_Treasure3Choose1_M.WBP_Rouge_Treasure3Choose1_M_C",
    PCBPPath = "/Game/UI/WBP/RougeLike/PC/3Choose1/WBP_Rouge_Treasure3Choose1_P.WBP_Rouge_Treasure3Choose1_P_C",
    UIName = "Rouge_Treasure_3Choose1",
    ZOrder = 58
  },
  SaiqiFantasy = {
    ConditionShowStateTags = T.RT_4,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Widget/WBP_Story_Transition_SaiqiFantasy.WBP_Story_Transition_SaiqiFantasy'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Widget/WBP_Story_Transition_SaiqiFantasy.WBP_Story_Transition_SaiqiFantasy'",
    UIName = "SaiqiFantasy"
  },
  SelectRole = {
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/SelectRole/Mobile/WBP_SelectRole_M.WBP_SelectRole_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/SelectRole/PC/WBP_SelectRole_P.WBP_SelectRole_P'",
    UIName = "SelectRole"
  },
  Setting = {
    ConfigName = "StackAndUIMode",
    IsHideBattleUnit = 1,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Set/Mobile/WBP_Set_Main_M.WBP_Set_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Set/PC/WBP_Set_Main_P.WBP_Set_Main_P'",
    Popup = true,
    System = "Set",
    UIName = "Setting",
    ZOrder = 55
  },
  ShopActivity = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Shop",
    IsHideBattleUnit = 1,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Mobile/Shop/WBP_Activity_Store_M.WBP_Activity_Store_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/PC/Shop/WBP_Activity_Store_P.WBP_Activity_Store_P'",
    Popup = true,
    System = "Shop",
    TabCoin = T.RT_16,
    UIName = "ShopActivity",
    ZOrder = 55
  },
  ShopMain = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Shop",
    IsHideBattleUnit = 11,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/Mobile/WBP_Shop_Main_M.WBP_Shop_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/PC/WBP_Shop_Main_P.WBP_Shop_Main_P'",
    Popup = true,
    System = "Shop",
    TabCoin = T.RT_16,
    UIName = "ShopMain",
    ZOrder = 55
  },
  ShuiFa = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Mobile/WBP_MiniGame_ShuifaMain_M.WBP_MiniGame_ShuifaMain_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/PC/WBP_MiniGame_ShuifaMain_P.WBP_MiniGame_ShuifaMain_P'",
    System = "Battle",
    UIName = "ShuiFa",
    ZOrder = 50
  },
  SimpleTalkUI = {
    ConditionShowStateTags = T.RT_4,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Mobile/WBP_Story_SimpleTalk_M.WBP_Story_SimpleTalk_M_C'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/PC/WBP_Story_SimpleTalk_P.WBP_Story_SimpleTalk_P_C'",
    System = "Story",
    UIName = "SimpleTalkUI",
    ZOrder = 10
  },
  SkillDetails = {
    ConfigName = "StackAndUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_CharSkillDetail_M.WBP_Armory_CharSkillDetail_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_CharSkillDetail_P.WBP_Armory_CharSkillDetail_P'",
    Popup = true,
    System = "BattleSubsystem",
    UIName = "SkillDetails",
    ZOrder = 55
  },
  SkinPreview = {
    ConfigName = "StackAndUIMode",
    IsHideBattleUnit = 1,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/Mobile/WBP_Shop_SkinPreview_M.WBP_Shop_SkinPreview_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/PC/WBP_Shop_SkinPreview_P.WBP_Shop_SkinPreview_P'",
    UIName = "SkinPreview",
    ZOrder = 61
  },
  SpecialBossSkillToast = {
    ConditionShowStateTags = T.RT_4,
    IgnoreHideTags = T.RT_7,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/Widget/WBP_Com_ToastBossSpecialSkillWarning.WBP_Com_ToastBossSpecialSkillWarning'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/Widget/WBP_Com_ToastBossSpecialSkillWarning.WBP_Com_ToastBossSpecialSkillWarning'",
    UIName = "SpecialBossSkillToast"
  },
  SquadMainUI = {
    ConfigName = "StackAndUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Build/Mobile/WBP_Build_Main_M.WBP_Build_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Build/PC/WBP_Build_Main_P.WBP_Build_Main_P'",
    System = "Armory",
    UIName = "SquadMainUI"
  },
  SquadMainUINew = {
    ConfigName = "StackAndUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Build/Mobile/WBP_Build_Main_New_M.WBP_Build_Main_New_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Build/PC/WBP_Build_Main_New_P.WBP_Build_Main_New_P'",
    System = "Armory",
    UIName = "SquadMainUINew"
  },
  StoryBattleFail = {
    ConfigName = "StackAndUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Settlement/Mobile/WBP_Settlement_BossFail_M.WBP_Settlement_BossFail_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Settlement/PC/WBP_Settlement_BossFail_P.WBP_Settlement_BossFail_P'",
    Popup = true,
    UIName = "StoryBattleFail"
  },
  StoryInteractiveUI = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Mobile/WBP_Story_Interactive_M.WBP_Story_Interactive_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/PC/WBP_Story_Interactive_P.WBP_Story_Interactive_P'",
    Popup = true,
    UIName = "StoryInteractiveUI"
  },
  StoryReviewMain = {
    ConditionShowStateTags = T.RT_4,
    ConfigName = "StackAndUIMode",
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Story_Review/Mobile/WBP_Story_Review_Main_M.WBP_Story_Review_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Story_Review/PC/WBP_Story_Review_Main_P.WBP_Story_Review_Main_P'",
    Popup = true,
    UIName = "StoryReviewMain",
    ZOrder = 54
  },
  StoryWeaponSelect = {
    ConditionShowStateTags = T.RT_4,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Widget/BP_Story_WeaponSelect.BP_Story_WeaponSelect'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Widget/BP_Story_WeaponSelect.BP_Story_WeaponSelect'",
    UIName = "StoryWeaponSelect"
  },
  StyleOfPlay = {
    CombatconditionIdList = {21},
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "Play",
    IsChat = true,
    IsHideBattleUnit = 11,
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Mobile/WBP_Play_Entry_M.WBP_Play_Entry_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/PC/WBP_Play_Entry_P.WBP_Play_Entry_P'",
    PauseAfterLoadingState = T.RT_1,
    Popup = true,
    System = "Play",
    TabCoin = T.RT_10,
    UIName = "StyleOfPlay",
    ZOrder = 56
  },
  SubSystemUnlock = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Guide/Widget/WBP_Guide_SubSystemUnlock.WBP_Guide_SubSystemUnlock'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Guide/Widget/WBP_Guide_SubSystemUnlock.WBP_Guide_SubSystemUnlock'",
    PauseAfterLoadingState = T.RT_17,
    SpecialUINameList = {
      "GuideBook_Tips",
      "CommonNewMonster",
      "AchievementPanel"
    },
    StateTag = 1,
    System = "Guide",
    UIName = "SubSystemUnlock"
  },
  SynthesisSuccessEffect = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/ScreenEffects/PC/WBP_ScreenEffects.WBP_ScreenEffects'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/ScreenEffects/PC/WBP_ScreenEffects.WBP_ScreenEffects'",
    UIName = "SynthesisSuccessEffect"
  },
  SystemUnlockGuide = {
    ConfigName = "OnlyUIMode",
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Guide/Mobile/WBP_Guide_NewSystemUnlock_M.WBP_Guide_NewSystemUnlock_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Guide/PC/WBP_Guide_NewSystemUnlock_P.WBP_Guide_NewSystemUnlock_P'",
    PauseAfterLoadingState = T.RT_17,
    System = "Guide",
    UIName = "SystemUnlockGuide",
    ZOrder = 104
  },
  TalkGuideUI = {
    ConditionShowStateTags = T.RT_4,
    IsPreloadBP = true,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Mobile/WBP_Story_GuideMan_M.WBP_Story_GuideMan_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/PC/WBP_Story_GuideMan_P.WBP_Story_GuideMan_P'",
    UIName = "TalkGuideUI"
  },
  TaskChapterBeginEndTip = {
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Guide/Mobile/WBP_Guide_ChapterBegin_M.WBP_Guide_ChapterBegin_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Guide/PC/WBP_Guide_ChapterBegin_P.WBP_Guide_ChapterBegin_P'",
    PauseAfterLoadingState = T.RT_6,
    UIName = "TaskChapterBeginEndTip"
  },
  TaskIndicator = {
    PCBPPath = "WidgetBlueprint'/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Task.Guide_Icon_Task'",
    System = "Battle",
    UIName = "TaskIndicator",
    ZOrder = 22
  },
  TaskPanel = {
    ConfigName = "StackAndUIMode",
    IsStopGame = 2,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Task/Mobile/WBP_Task_Main_M.WBP_Task_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Task/PC/WBP_Task_Main_P.WBP_Task_Main_P'",
    Popup = true,
    UIName = "TaskPanel",
    ZOrder = 56
  },
  TeamBattleInfo = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Team/Mobile/WBP_Team_PlayerList_M.WBP_Team_PlayerList_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Team/PC/WBP_Team_PlayerList_P.WBP_Team_PlayerList_P'",
    System = "Team",
    UIName = "TeamBattleInfo",
    ZOrder = -3
  },
  TeamInSystem = {
    ConfigName = "OnlyAllowMulti",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Team/Mobile/WBP_Team_Main_M.WBP_Team_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Team/PC/WBP_Team_Main_P.WBP_Team_Main_P'",
    System = "Team",
    UIName = "TeamInSystem",
    ZOrder = 20
  },
  TeamInviteTip = {
    ConfigName = "Default",
    KeyboardSetName = "PopupConfirm",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Team/Widget/WBP_Team_Invite.WBP_Team_Invite'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Team/Widget/WBP_Team_Invite.WBP_Team_Invite'",
    System = "Team",
    UIName = "TeamInviteTip",
    ZOrder = 101
  },
  TeamToast = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Team/Widget/WBP_Team_Toast.WBP_Team_Toast_C'",
    UIName = "TeamToast",
    ZOrder = 100
  },
  TiaoPin = {
    ConfigName = "StackAndUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Mobile/WBP_MiniGame_Tiaopin_M.WBP_MiniGame_Tiaopin_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/PC/WBP_MiniGame_Tiaopin_P.WBP_MiniGame_Tiaopin_P'",
    Popup = true,
    UIName = "TiaoPin",
    ZOrder = 55
  },
  ToughnessWeak = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/HUD_Bar/WBP_Battle_HUD_ToughnessWeak.WBP_Battle_HUD_ToughnessWeak_C'",
    UIName = "ToughnessWeak"
  },
  TrainingGroundSetup = {
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/Training/WBP_Battle_Training_Main_M.WBP_Battle_Training_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/Training/WBP_Battle_Training_Main_P.WBP_Battle_Training_Main_P'",
    Popup = true,
    System = "Training",
    UIName = "TrainingGroundSetup",
    ZOrder = 1
  },
  TreasureToast = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/Mobile/WBP_Com_ToastTreasure_M.WBP_Com_ToastTreasure_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/PC/WBP_Com_ToastTreasure_P.WBP_Com_ToastTreasure_P'",
    System = "Common",
    UIName = "TreasureToast"
  },
  Trial_BattleProgress = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/TryOut/WBP_TryOut_CountBar.WBP_TryOut_CountBar'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/TryOut/WBP_TryOut_CountBar.WBP_TryOut_CountBar'",
    UIName = "Trial_BattleProgress"
  },
  TryOutMain = {
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/TryOut/Mobile/WBP_TryOut_Main_M.WBP_TryOut_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/TryOut/PC/WBP_TryOut_Main_P.WBP_TryOut_Main_P'",
    PauseAfterLoadingState = T.RT_13,
    Popup = true,
    UIName = "TryOutMain",
    ZOrder = 50
  },
  TryOut_Victory = {
    ConfigName = "StackAndUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/TryOut/Widget/WBP_TryOut_Victory.WBP_TryOut_Victory'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/TryOut/Widget/WBP_TryOut_Victory.WBP_TryOut_Victory'",
    Popup = true,
    UIName = "TryOut_Victory"
  },
  UIChapterStart = {
    ConditionShowStateTags = T.RT_4,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/ChapterStart/Widget/WBP_ChapterStart_PurgatorioIsland.WBP_ChapterStart_PurgatorioIsland'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/ChapterStart/Widget/WBP_ChapterStart_PurgatorioIsland.WBP_ChapterStart_PurgatorioIsland'",
    UIName = "UIChapterStart"
  },
  UIFushuNearDeath = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/WBP_Battle_NearDeath_Test_P.WBP_Battle_NearDeath_Test_P'",
    UIName = "UIFushuNearDeath"
  },
  UISKillFushu = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_FushuSkill.WBP_Battle_FushuSkill'",
    System = "Battle",
    UIName = "UISKillFushu"
  },
  UISkilYeerUlti = {
    ConfigName = "OnlyForceShow",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_YeErUltiSkill.WBP_Battle_YeerUltiSkill'",
    System = "Battle",
    UIName = "UISkilYeerUlti",
    ZOrder = -6
  },
  UISkill2Linen = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_LinenUltiSkill.WBP_Battle_LinenUltiSkill'",
    System = "Battle",
    UIName = "UISkill2Linen",
    ZOrder = -3
  },
  UISkill2Tuosi = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_TuosiUltiSkill.WBP_Battle_TuosiUltiSkill'",
    System = "Battle",
    UIName = "UISkill2Tuosi",
    ZOrder = -6
  },
  UISkillBaonu = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_BaonuSkill.WBP_Battle_BaonuSkill'",
    System = "Battle",
    UIName = "UISkillBaonu"
  },
  UISkillFeina = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_FeinaSkill.WBP_Battle_FeinaSkill'",
    System = "Battle",
    UIName = "UISkillFeina",
    ZOrder = -3
  },
  UISkillHeilong = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_HeilongSkill.WBP_Battle_HeilongSkill'",
    System = "Battle",
    UIName = "UISkillHeilong",
    ZOrder = -3
  },
  UISkillKezhou = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_KezhouSkill.WBP_Battle_KezhouSkill'",
    System = "Battle",
    UIName = "UISkillKezhou",
    ZOrder = -3
  },
  UISkillLandi = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_LandiSkill.WBP_Battle_LandiSkill'",
    System = "Battle",
    UIName = "UISkillLandi",
    ZOrder = -3
  },
  UISkillLinen = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_LinenSkill.WBP_Battle_LinenSkill'",
    System = "Battle",
    UIName = "UISkillLinen",
    ZOrder = -3
  },
  UISkillLise = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_LiseSkill.WBP_Battle_LiseSkill'",
    System = "Battle",
    UIName = "UISkillLise",
    ZOrder = -3
  },
  UISkillNvzhu = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_PerfectDodge.WBP_Battle_PerfectDodge'",
    System = "Battle",
    UIName = "UISkillNvzhu",
    ZOrder = -3
  },
  UISkillSaqiUlti = {
    ConfigName = "OnlyForceShow",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_SaiqiUltiSkill.WBP_Battle_SaiqiUltiSkill'",
    System = "Battle",
    UIName = "UISkillSaqiUlti",
    ZOrder = -6
  },
  UISkillSaqiUltiSkin1 = {
    ConfigName = "OnlyForceShow",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_SaiqiUltiSkill_Skin01.WBP_Battle_SaiqiUltiSkill_Skin01'",
    System = "Battle",
    UIName = "UISkillSaqiUltiSkin1",
    ZOrder = -6
  },
  UISkillShuimu = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_ShuimuSkill.WBP_Battle_ShuimuSkill'",
    System = "Battle",
    UIName = "UISkillShuimu",
    ZOrder = -3
  },
  UISkillSonglu = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_SongluSkill.WBP_Battle_SongluSkill'",
    System = "Battle",
    UIName = "UISkillSonglu",
    ZOrder = -3
  },
  UISkillSpade = {
    ConfigName = "OnlyForceShow",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_SpadeSkill.WBP_Battle_SpadeSkill'",
    System = "Battle",
    UIName = "UISkillSpade",
    ZOrder = -6
  },
  UISkillTuosi = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_TuosiSkill.WBP_Battle_TuosiSkill'",
    System = "Battle",
    UIName = "UISkillTuosi",
    ZOrder = -3
  },
  UISkillXibi = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_XibiSkill.WBP_Battle_XibiSkill'",
    System = "Battle",
    UIName = "UISkillXibi",
    ZOrder = -3
  },
  UISkillXier = {
    ConfigName = "OnlyForceShow",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_XierSkill.WBP_Battle_XierSkill'",
    System = "Battle",
    UIName = "UISkillXier"
  },
  UISkillXierUlti = {
    ConfigName = "OnlyForceShow",
    IgnoreHideTags = T.RT_7,
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_XierUltiSkill.WBP_Battle_XierUltiSkill'",
    System = "Battle",
    UIName = "UISkillXierUlti"
  },
  UISkillZhiliu = {
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_ZhiliuSKill.WBP_Battle_ZhiliuSKill'",
    System = "Battle",
    UIName = "UISkillZhiliu",
    ZOrder = -3
  },
  UISkillZhiliuUlti = {
    ConfigName = "OnlyForceShow",
    IgnoreHideTags = T.RT_7,
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_ZhiliuUltiSkill.WBP_Battle_ZhiliuUltiSkill'",
    System = "Battle",
    UIName = "UISkillZhiliuUlti"
  },
  VideoPlayer = {
    ConfigName = "StackAndUIMode",
    GlobalGameUITag = "VideoPlayer",
    IsStopGame = 1,
    MobileBPPath = "/Game/UI/WBP/Video/WBP_VideoPlayer.WBP_VideoPlayer_C",
    PCBPPath = "/Game/UI/WBP/Video/WBP_VideoPlayer.WBP_VideoPlayer_C",
    Popup = true,
    UIName = "VideoPlayer"
  },
  Vote = {
    ConfigName = "UIModeAndForceShow",
    IsBanAccess = true,
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Vote/Mobile/WBP_Vote_M.WBP_Vote_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Vote/PC/WBP_Vote_P.WBP_Vote_P'",
    System = "Battle",
    UIName = "Vote",
    ZOrder = 48
  },
  WalnutBagMain = {
    ConfigName = "StackAndUIMode",
    IsHideBattleUnit = 1,
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Walnut/Mobile/WBP_Walnut_Bag_M.WBP_Walnut_Bag_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Walnut/PC/WBP_Walnut_Bag_P.WBP_Walnut_Bag_P'",
    Popup = true,
    System = "WalnutBag",
    UIName = "WalnutBagMain",
    ZOrder = 55
  },
  WalnutChoice = {
    ConfigName = "UIModeAndForceShow",
    IsBanAccess = true,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Walnut/Mobile/WBP_Walnut_Choice_M.WBP_Walnut_Choice_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Walnut/PC/WBP_Walnut_Choice_P.WBP_Walnut_Choice_P'",
    System = "Walnut",
    UIName = "WalnutChoice",
    ZOrder = 100
  },
  WalnutReward = {
    ConfigName = "UIModeAndForceShow",
    IsBanAccess = true,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Walnut/Mobile/WBP_Walnut_Reward_M.WBP_Walnut_Reward_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Walnut/PC/WBP_Walnut_Reward_P.WBP_Walnut_Reward_P'",
    System = "Walnut",
    UIName = "WalnutReward",
    ZOrder = 100
  },
  WalnutRewardDialog = {
    ConfigName = "UIModeAndForceShow",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Walnut/Mobile/WBP_Walnut_RewardDialog_M.WBP_Walnut_RewardDialog_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Walnut/PC/WBP_Walnut_RewardDialog_P.WBP_Walnut_RewardDialog_P'",
    Params = T.RT_2,
    System = "Walnut",
    UIName = "WalnutRewardDialog",
    ZOrder = 102
  },
  WarningToast = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/Mobile/WBP_Com_ToastWarning_M.WBP_Com_ToastWarning_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/PC/WBP_Com_ToastWarning_P.WBP_Com_ToastWarning_P'",
    SpecialUINameList = {
      "ExploreToastSuccess"
    },
    StateTag = 1,
    System = "Common",
    UIName = "WarningToast",
    ZOrder = 51
  },
  WaveStartBP = {
    ConfigName = "OnlyForceShow",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_DefenseWaveStart.WBP_Dungeon_DefenseWaveStart'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_DefenseWaveStart.WBP_Dungeon_DefenseWaveStart'",
    UIName = "WaveStartBP",
    ZOrder = 5
  },
  WhiteTalkUI = {
    ConditionShowStateTags = T.RT_4,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Mobile/WBP_WhiteScreenTalk_M.WBP_WhiteScreenTalk_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/PC/WBP_WhiteScreenTalk_P.WBP_WhiteScreenTalk_P'",
    System = "Story",
    UIName = "WhiteTalkUI",
    ZOrder = 53
  },
  Wiki = {
    ConfigName = "OnlyUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Encyclopedia/Mobile/WBP_Encyclopedia_Entrance_M.WBP_Encyclopedia_Entrance_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Encyclopedia/PC/WBP_Encyclopedia_Entrance_P.WBP_Encyclopedia_Entrance_P'",
    Popup = true,
    System = "Wiki",
    UIName = "Wiki"
  },
  Wiki_Main = {
    ConditionShowStateTags = T.RT_4,
    ConfigName = "OnlyUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Encyclopedia/Mobile/WBP_Encyclopedia_Main_M.WBP_Encyclopedia_Main_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Encyclopedia/PC/WBP_Encyclopedia_Main_P.WBP_Encyclopedia_Main_P'",
    Popup = true,
    System = "Wiki",
    UIName = "Wiki_Main",
    ZOrder = 54
  },
  ZhiliuEventTask = {
    ConfigName = "StackAndUIMode",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Mobile/ZhiliuEvent/WBP_Activity_ZhiliuEvent_Task_M.WBP_Activity_ZhiliuEvent_Task_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/PC/ZhiliuEvent/WBP_Activity_ZhiliuEvent_Task_P.WBP_Activity_ZhiliuEvent_Task_P'",
    Params = T.RT_2,
    Popup = true,
    UIName = "ZhiliuEventTask"
  },
  ZhuanQuanQuan = {
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Mobile/WBP_MiniGame_ZhuanQuanQuan_M.WBP_MiniGame_ZhuanQuanQuan_M'",
    PCBPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/PC/WBP_MiniGame_ZhuanQuanQuan_P.WBP_MiniGame_ZhuanQuanQuan_P'",
    System = "Battle",
    UIName = "ZhuanQuanQuan",
    ZOrder = 50
  }
})
