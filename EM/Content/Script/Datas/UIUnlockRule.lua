local T = {}
T.RT_1 = {2, 5}
T.RT_2 = {
  "UI_Disabled_Des_Armory",
  "UI_Disabled_InStoryMode"
}
T.RT_3 = {4, 5}
T.RT_4 = {8028}
T.RT_5 = {
  "UI_Disabled_Des_Play",
  "UI_Disabled_InStoryMode"
}
T.RT_6 = {1, 5}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("UIUnlockRule", {
  Abyss = {
    ConditionId = 8002,
    IsHideUnlockPopup = 1,
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_Abyss"
    },
    UIUnlockName = "Abyss_entry",
    UIUnlockRuleId = "Abyss"
  },
  Achievement = {
    AfterUIUnlockDesc = "System_Des_Achievement",
    ConditionId = 4070,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Achievement.T_Entrance_Achievement",
    IsHideUnlockPopup = 1,
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_Achievement",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Locked_Des_Achievement",
    UIUnlockName = "MAIN_UI_ACHIEVEMENT",
    UIUnlockRuleId = "Achievement",
    UnlockPopupType = "Light"
  },
  Announcement = {
    AfterUIUnlockDesc = "System_Des_Notice",
    ConditionId = 4150,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Announcement.T_Entrance_Announcement",
    IsHideUnlockPopup = 1,
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_Notice",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Locked_Des_Notice",
    UIUnlockName = "MAIN_UI_NOTICE",
    UIUnlockRuleId = "Announcement",
    UnlockPopupType = "Light"
  },
  Archive = {
    AfterUIUnlockDesc = "System_Des_Archive",
    ConditionId = 4070,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Archive.T_Entrance_Archive",
    IsHideUnlockPopup = 1,
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_Archive"
    },
    UIUnlockDesc = "UI_Locked_Des_Archive",
    UIUnlockName = "MAIN_UI_ARCHIVE",
    UIUnlockRuleId = "Archive",
    UnlockPopupType = "Light"
  },
  Armory = {
    AfterUIUnlockDesc = "System_Des_Armory",
    ConditionId = 4020,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory",
    IsHideUnlockPopup = 1,
    OpenConditionId = {4, 10},
    OpenSystemDesc = T.RT_2,
    UIUnlockDesc = "UI_Locked_Des_Armory",
    UIUnlockName = "MAIN_UI_ARMORY",
    UIUnlockRuleId = "Armory",
    UnlockPopupType = "Normal"
  },
  Bag = {
    AfterUIUnlockDesc = "System_Des_Bag_CBT3",
    ConditionId = 4010,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Bag.T_Entrance_Bag",
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_Bag",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Unlock_Des_Bag",
    UIUnlockName = "MAIN_UI_BAG",
    UIUnlockRuleId = "Bag",
    UnlockPopupType = "Light"
  },
  BattlePass = {
    AfterUIUnlockDesc = "System_Des_BattlePass",
    ConditionId = 4310,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_BattlePass.T_Entrance_BattlePass",
    IsHideUnlockPopup = 1,
    OpenConditionId = {
      2,
      5,
      4311
    },
    OpenSystemDesc = {
      "UI_Disabled_Des_BattlePass",
      "UI_Disabled_Des_BattlePass",
      "UI_BattlePass_NotInPeriod"
    },
    UIUnlockDesc = "UI_Locked_Des_BattlePass",
    UIUnlockName = "MAIN_UI_BATTLEPASS",
    UIUnlockRuleId = "BattlePass",
    UnlockPopupType = "Normal"
  },
  BattleWheel = {
    AfterUIUnlockDesc = "System_Des_BattleWheel",
    ConditionId = 4140,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory",
    IsHideUnlockPopup = 1,
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_BattleWheel",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Locked_Des_BattleWheel",
    UIUnlockName = "MAIN_UI_BATTLEWHEEL",
    UIUnlockRuleId = "BattleWheel",
    UnlockPopupType = "Normal"
  },
  CardLevel = {
    AfterUIUnlockDesc = "System_Des_CardLevel",
    ConditionId = 4041,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory",
    IsHideUnlockPopup = 1,
    OpenConditionId = T.RT_3,
    OpenSystemDesc = T.RT_2,
    UIUnlockDesc = "UI_Locked_Des_Armory",
    UIUnlockName = "MAIN_UI_CARDLEVEL",
    UIUnlockRuleId = "CardLevel",
    UnlockPopupType = "Normal"
  },
  Chat = {
    AfterUIUnlockDesc = "System_Des_Chat",
    ConditionId = 4260,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Chat.T_Entrance_Chat",
    IsHideUnlockPopup = 1,
    OpenConditionId = T.RT_4,
    OpenSystemDesc = {
      "UI_Disabled_Des_Chat"
    },
    UIUnlockDesc = "UI_Locked_Des_Chat",
    UIUnlockName = "MAIN_UI_CHAT",
    UIUnlockRuleId = "Chat",
    UnlockPopupType = "Normal"
  },
  DailyGoal = {
    AfterUIUnlockDesc = "System_Des_DailyGoal_CBT3",
    ConditionId = 4320,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_StarterQuest.T_Entrance_StarterQuest",
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_DailyGoal"
    },
    UIUnlockDesc = "UI_Locked_Des_DailyGoal",
    UIUnlockName = "MAIN_UI_DAILYGOAL",
    UIUnlockRuleId = "DailyGoal",
    UnlockPopupType = "Light"
  },
  Dispatch = {
    AfterUIUnlockDesc = "System_Des_Dispatch_CBT3",
    ConditionId = 4330,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Dispatch.T_Entrance_Dispatch",
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_Dispatch"
    },
    UIUnlockDesc = "UI_Locked_Des_Dispatch",
    UIUnlockName = "MAIN_UI_DISPATCH",
    UIUnlockRuleId = "Dispatch",
    UnlockPopupType = "Light"
  },
  Dungeon = {
    AfterUIUnlockDesc = "System_Des_Play",
    ConditionId = 4320,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Pve.T_Entrance_Pve",
    OpenSystemDesc = T.RT_5,
    UIUnlockDesc = "UI_Locked_Des_Play",
    UIUnlockName = "MAIN_UI_PLAY",
    UIUnlockRuleId = "Dungeon",
    UnlockPopupType = "Normal"
  },
  Entertainment = {
    AfterUIUnlockDesc = "System_Des_Enterntainment",
    ConditionId = 4250,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Entertainment.T_Entrance_Entertainment",
    OpenConditionId = T.RT_6,
    OpenSystemDesc = {
      "UI_Disabled_Des_Entertainment",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Locked_Des_Entertainment",
    UIUnlockName = "MAIN_UI_ENTERTAINMENT",
    UIUnlockRuleId = "Entertainment",
    UnlockPopupType = "Normal"
  },
  ExploreBadgeShop = {
    AfterUIUnlockDesc = "System_Des_ExploreBadgeShop",
    ConditionId = 10101001,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Store.T_Entrance_Store",
    IsHideUnlockPopup = 1,
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_ExploreBadgeShop"
    },
    UIUnlockDesc = "UI_Locked_Des_ExploreBadgeShop",
    UIUnlockName = "MAIN_UI_EXPLOREBADGESHOP",
    UIUnlockRuleId = "ExploreBadgeShop",
    UnlockPopupType = "Normal"
  },
  Forging = {
    AfterUIUnlockDesc = "System_Des_Forging",
    ConditionId = 4080,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Forging.T_Entrance_Forging",
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_Forging",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Locked_Des_Forging",
    UIUnlockName = "MAIN_UI_FORGE",
    UIUnlockRuleId = "Forging",
    UnlockPopupType = "Normal"
  },
  FriendMain = {
    AfterUIUnlockDesc = "System_Des_Friend",
    ConditionId = 4190,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Friend.T_Entrance_Friend",
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_Friend",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Locked_Des_Friend",
    UIUnlockName = "MAIN_UI_FRIEND",
    UIUnlockRuleId = "FriendMain",
    UnlockPopupType = "Normal"
  },
  Gacha = {
    AfterUIUnlockDesc = "System_Des_Gacha",
    ConditionId = 4040,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Gacha.T_Entrance_Gacha",
    IsHideUnlockPopup = 1,
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_Gacha",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Locked_Des_Gacha",
    UIUnlockName = "MAIN_UI_GACHA",
    UIUnlockRuleId = "Gacha",
    UnlockPopupType = "Normal"
  },
  GameEvent = {
    AfterUIUnlockDesc = "System_Des_GameEvent",
    ConditionId = 4220,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Activity.T_Entrance_Activity",
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_GameEvent",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Locked_Des_GameEvent",
    UIUnlockName = "MAIN_UI_GAMEEVENT",
    UIUnlockRuleId = "GameEvent",
    UnlockPopupType = "Normal"
  },
  GuideBook = {
    AfterUIUnlockDesc = "System_Des_GuideBook_CBT3",
    ConditionId = 4180,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_GuideBook.T_Entrance_GuideBook",
    OpenConditionId = T.RT_4,
    OpenSystemDesc = {
      "UI_Disabled_Des_GuideBook"
    },
    UIUnlockDesc = "UI_Locked_Des_GuideBook",
    UIUnlockName = "MAIN_UI_GUIDEBOOK",
    UIUnlockRuleId = "GuideBook",
    UnlockPopupType = "Light"
  },
  HardBoss = {
    AfterUIUnlockDesc = "System_Des_HardBoss",
    ConditionId = 4120,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Weelydungeon.T_Entrance_Weelydungeon",
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_HardBoss",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Locked_Des_HardBoss",
    UIUnlockName = "MAIN_UI_HARDBOSS",
    UIUnlockRuleId = "HardBoss",
    UnlockPopupType = "Normal"
  },
  Home = {
    AfterUIUnlockDesc = "System_Des_Forging",
    ConditionId = 4280,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Map.T_Entrance_Map",
    IsHideUnlockPopup = 1,
    OpenConditionId = {7},
    OpenSystemDesc = {
      "UI_TOAST_FORGING_WARNING"
    },
    UIUnlockDesc = "UI_Locked_Des_Forging",
    UIUnlockName = "MAIN_UI_FORGE",
    UIUnlockRuleId = "Home",
    UnlockPopupType = "Normal"
  },
  Invite = {
    AfterUIUnlockDesc = "System_Des_Invite_CBT3",
    ConditionId = 4060,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Invite.T_Entrance_Invite",
    OpenConditionId = T.RT_6,
    OpenSystemDesc = {
      "UI_Disabled_Des_Invite",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Locked_Des_Invite",
    UIUnlockName = "MAIN_UI_NPCSWITCH",
    UIUnlockRuleId = "Invite",
    UnlockPopupType = "Light"
  },
  LonzaFortressShopTab = {
    ConditionId = 322,
    IsHideUnlockPopup = 1,
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Locked_Des_NewMap"
    },
    UIUnlockName = "UI_SHOP_TAB_ExploreBadge_EXChapter01",
    UIUnlockRuleId = "LonzaFortressShopTab"
  },
  Mail = {
    AfterUIUnlockDesc = "System_Des_Mail_CBT3",
    ConditionId = 4100,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Mail.T_Entrance_Mail",
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_Mail",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Locked_Des_Mail",
    UIUnlockName = "MAIN_UI_MAIL",
    UIUnlockRuleId = "Mail",
    UnlockPopupType = "Light"
  },
  Map = {
    AfterUIUnlockDesc = "System_Des_Map",
    ConditionId = 4050,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Map.T_Entrance_Map",
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_Map",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Locked_Des_Map",
    UIUnlockName = "MAIN_UI_MAP",
    UIUnlockRuleId = "Map",
    UnlockPopupType = "Normal"
  },
  Match = {
    AfterUIUnlockDesc = "System_Des_Match",
    ConditionId = 4240,
    IsHideUnlockPopup = 1,
    OpenSystemDesc = {
      "UI_Disabled_Des_Match"
    },
    UIUnlockDesc = "UI_Locked_Des_Match",
    UIUnlockName = "MAIN_UI_MATCH",
    UIUnlockRuleId = "Match",
    UnlockPopupType = "Normal"
  },
  Mod = {
    AfterUIUnlockDesc = "System_Des_Mod",
    ConditionId = 4160,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory",
    OpenConditionId = T.RT_3,
    OpenSystemDesc = {
      "UI_Disabled_Des_Mod",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Locked_Des_Mod",
    UIUnlockName = "UI_Armory_Mod",
    UIUnlockRuleId = "Mod",
    UnlockPopupType = "Normal"
  },
  ModArchive = {
    AfterUIUnlockDesc = "System_Des_ModArchive_CBT3",
    ConditionId = 4350,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_ModArchive.T_Entrance_ModArchive",
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_ModArchive"
    },
    UIUnlockDesc = "UI_Locked_Des_ModArchive",
    UIUnlockName = "MAIN_UI_MODGUIDEBOOK",
    UIUnlockRuleId = "ModArchive",
    UnlockPopupType = "Light"
  },
  ModDungeon = {
    AfterUIUnlockDesc = "System_Des_ModDungeon_CBT3",
    ConditionId = 4360,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Pve.T_Entrance_Pve",
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_ModDungeon",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Locked_Des_ModDungeon",
    UIUnlockName = "MAIN_UI_MODDUNGEON",
    UIUnlockRuleId = "ModDungeon",
    UnlockPopupType = "Light"
  },
  Party = {
    ConditionId = 4230,
    IsHideUnlockPopup = 1,
    UIUnlockName = "MAIN_UI_PARTY",
    UIUnlockRuleId = "Party"
  },
  Pet = {
    AfterUIUnlockDesc = "System_Des_Pet",
    ConditionId = 4090,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Pet.T_Entrance_Pet",
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_Pet",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Locked_Des_Pet",
    UIUnlockName = "MAIN_UI_PET",
    UIUnlockRuleId = "Pet",
    UnlockPopupType = "Normal"
  },
  PetSkill = {
    AfterUIUnlockDesc = "System_Des_Pet",
    ConditionId = 4270,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Pet.T_Entrance_Pet",
    IsHideUnlockPopup = 1,
    OpenSystemDesc = {
      "UI_Disabled_Des_Pet"
    },
    UIUnlockDesc = "UI_Locked_Des_Pet",
    UIUnlockName = "MAIN_UI_PET",
    UIUnlockRuleId = "PetSkill",
    UnlockPopupType = "Normal"
  },
  PhotoCameraMain = {
    AfterUIUnlockDesc = "System_Des_PhotoCamera_CBT3",
    ConditionId = 4200,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Camera.T_Entrance_Camera",
    OpenConditionId = {2},
    OpenSystemDesc = {
      "UI_Disabled_Des_PhotoCamera"
    },
    UIUnlockDesc = "UI_Locked_Des_PhotoCamera",
    UIUnlockName = "MAIN_UI_PHOTOCAMERA",
    UIUnlockRuleId = "PhotoCameraMain",
    UnlockPopupType = "Light"
  },
  Play = {
    AfterUIUnlockDesc = "System_Des_Play",
    ConditionId = 4110,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Pve.T_Entrance_Pve",
    IsHideUnlockPopup = 1,
    OpenConditionId = T.RT_1,
    OpenSystemDesc = T.RT_5,
    UIUnlockDesc = "UI_Locked_Des_Play",
    UIUnlockName = "MAIN_UI_PLAY",
    UIUnlockRuleId = "Play",
    UnlockPopupType = "Normal"
  },
  PlayTaskRoot = {
    AfterUIUnlockDesc = "System_Des_StarterQuest",
    ConditionId = 4380,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_StarterQuest.T_Entrance_StarterQuest",
    IsHideUnlockPopup = 1,
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_PlayTaskRoot"
    },
    UIUnlockDesc = "UI_Locked_Des_PlayTaskRoot",
    UIUnlockName = "MAIN_UI_PLAYTASKROOT",
    UIUnlockRuleId = "PlayTaskRoot",
    UnlockPopupType = "Light"
  },
  PlayerLevel = {
    ConditionId = 4020,
    IsHideUnlockPopup = 1,
    UIUnlockName = "UI_Player_Level",
    UIUnlockRuleId = "PlayerLevel"
  },
  Polarity = {
    AfterUIUnlockDesc = "System_Des_Polarity_CBT3",
    ConditionId = 4210,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory",
    OpenConditionId = T.RT_3,
    OpenSystemDesc = {
      "UI_Disabled_Des_Polarity",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Locked_Des_Polarity",
    UIUnlockName = "MAIN_UI_POLARITY",
    UIUnlockRuleId = "Polarity",
    UnlockPopupType = "Light"
  },
  Quest = {
    AfterUIUnlockDesc = "System_Des_Quest",
    ConditionId = 4130,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Task.T_Entrance_Task",
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_Quest",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Locked_Des_Quest",
    UIUnlockName = "MAIN_UI_QUEST",
    UIUnlockRuleId = "Quest",
    UnlockPopupType = "Normal"
  },
  Rouge = {
    AfterUIUnlockDesc = "System_Des_Rouge",
    ConditionId = 4170,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Permanent.T_Entrance_Permanent",
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_Rouge",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Locked_Des_Rouge",
    UIUnlockName = "MAIN_UI_ROUGE",
    UIUnlockRuleId = "Rouge",
    UnlockPopupType = "Normal"
  },
  RougeBag = {
    AfterUIUnlockDesc = "System_Des_Rouge",
    ConditionId = 4170,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Permanent.T_Entrance_Permanent",
    IsHideUnlockPopup = 1,
    OpenConditionId = {3},
    OpenSystemDesc = {
      "UI_Disabled_Des_Rouge"
    },
    UIUnlockDesc = "UI_Locked_Des_Rouge",
    UIUnlockName = "MAIN_UI_BAG",
    UIUnlockRuleId = "RougeBag",
    UnlockPopupType = "Normal"
  },
  SecretLetterShopTab = {
    ConditionId = 4340,
    IsHideUnlockPopup = 1,
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Locked_Des_WalnutBag"
    },
    UIUnlockName = "MAIN_UI_WALNUTBAG",
    UIUnlockRuleId = "SecretLetterShopTab"
  },
  Shop = {
    AfterUIUnlockDesc = "System_Des_Shop",
    ConditionId = 4030,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Store.T_Entrance_Store",
    IsHideUnlockPopup = 1,
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_Shop",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Locked_Des_Shop",
    UIUnlockName = "MAIN_UI_SHOP",
    UIUnlockRuleId = "Shop",
    UnlockPopupType = "Normal"
  },
  Skill = {
    AfterUIUnlockDesc = "System_Des_Skill",
    ConditionId = 4021,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory",
    IsHideUnlockPopup = 1,
    OpenConditionId = T.RT_3,
    OpenSystemDesc = T.RT_2,
    UIUnlockDesc = "UI_Locked_Des_Armory",
    UIUnlockName = "MAIN_UI_SKILL",
    UIUnlockRuleId = "Skill",
    UnlockPopupType = "Normal"
  },
  Squad = {
    AfterUIUnlockDesc = "System_Des_Play",
    ConditionId = 4320,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Pve.T_Entrance_Pve",
    IsHideUnlockPopup = 1,
    OpenConditionId = T.RT_1,
    OpenSystemDesc = T.RT_5,
    UIUnlockDesc = "UI_Locked_Des_Play",
    UIUnlockName = "UI_Squad",
    UIUnlockRuleId = "Squad",
    UnlockPopupType = "Normal"
  },
  StarterQuest = {
    AfterUIUnlockDesc = "System_Des_StarterQuest",
    ConditionId = 4370,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_StarterQuest.T_Entrance_StarterQuest",
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_StarterQuest"
    },
    UIUnlockDesc = "UI_Locked_Des_StarterQuest",
    UIUnlockName = "MAIN_UI_STARTERQUEST",
    UIUnlockRuleId = "StarterQuest",
    UnlockPopupType = "Normal"
  },
  Swatch = {
    AfterUIUnlockDesc = "System_Des_Armory",
    ConditionId = 4020,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory",
    IsHideUnlockPopup = 1,
    OpenConditionId = T.RT_3,
    OpenSystemDesc = T.RT_2,
    UIUnlockDesc = "UI_Locked_Des_Armory",
    UIUnlockName = "MAIN_UI_ARMORY",
    UIUnlockRuleId = "Swatch",
    UnlockPopupType = "Normal"
  },
  Temple = {
    AfterUIUnlockDesc = "System_Des_Temple_CBT3",
    ConditionId = 4230,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Temple.T_Entrance_Temple",
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_Temple",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Locked_Des_Temple",
    UIUnlockName = "MAIN_UI_Temple",
    UIUnlockRuleId = "Temple",
    UnlockPopupType = "Light"
  },
  UWeapon = {
    AfterUIUnlockDesc = "System_Des_Uweapon",
    ConditionId = 4041,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory",
    IsHideUnlockPopup = 1,
    OpenConditionId = T.RT_3,
    OpenSystemDesc = T.RT_2,
    UIUnlockDesc = "UI_Locked_Des_Armory",
    UIUnlockName = "MAIN_UI_UWEAPON",
    UIUnlockRuleId = "UWeapon",
    UnlockPopupType = "Normal"
  },
  WalnutBag = {
    AfterUIUnlockDesc = "System_Des_WalnutBag_CBT3",
    ConditionId = 4340,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Walnut.T_Entrance_Walnut",
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_WalnutBag",
      "UI_Disabled_InStoryMode"
    },
    UIUnlockDesc = "UI_Locked_Des_WalnutBag",
    UIUnlockName = "MAIN_UI_WALNUTBAG",
    UIUnlockRuleId = "WalnutBag",
    UnlockPopupType = "Light"
  },
  Wiki = {
    AfterUIUnlockDesc = "System_Des_Wiki",
    ConditionId = 4070,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Wiki.T_Entrance_Wiki",
    IsHideUnlockPopup = 1,
    OpenConditionId = T.RT_1,
    OpenSystemDesc = {
      "UI_Disabled_Des_Wiki"
    },
    UIUnlockDesc = "UI_Locked_Des_Wiki",
    UIUnlockName = "MAIN_UI_WIKI",
    UIUnlockRuleId = "Wiki",
    UnlockPopupType = "Light"
  }
})
