local T = {}
T.RT_1 = {2}
T.RT_2 = {2, 5}
T.RT_3 = {1}
T.RT_4 = {1, 5}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MainUI", {
  [1] = {
    ActionName = "OpenArmory",
    EnterId = 1,
    EscShowCondition = {4},
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory",
    Name = "MAIN_UI_ARMORY",
    ReddotNode = "ArmoryMainMenu",
    Sequence = 10,
    ShowCondition = {4, 10},
    SystemUIName = "ArmoryMain",
    UIUnlockRuleName = "Armory"
  },
  [2] = {
    ActionName = "OpenBag",
    EnterId = 2,
    EscShowCondition = T.RT_1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Bag.T_Entrance_Bag",
    Name = "MAIN_UI_BAG",
    Sequence = 20,
    ShowCondition = T.RT_2,
    SystemUIName = "BagMain",
    UIUnlockRuleName = "Bag"
  },
  [3] = {
    EnterId = 3,
    EscShowCondition = T.RT_3,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Invite.T_Entrance_Invite",
    Name = "MAIN_UI_NPCSWITCH",
    Sequence = 225,
    ShowCondition = T.RT_4,
    SystemUIName = "NpcSwitchMain",
    UIUnlockRuleName = "Invite"
  },
  [4] = {
    EnterId = 4,
    EscShowCondition = T.RT_1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Store.T_Entrance_Store",
    Name = "MAIN_UI_SHOP",
    ReddotNode = "Shop",
    Sequence = 90,
    SystemUIName = "ShopMain",
    UIUnlockRuleName = "Shop"
  },
  [5] = {
    ActionName = "OpenGacha",
    EnterId = 5,
    EscShowCondition = T.RT_1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Gacha.T_Entrance_Gacha",
    Name = "MAIN_UI_GACHA",
    ReddotNode = "Gacha",
    Sequence = 80,
    ShowCondition = T.RT_2,
    SystemUIName = "GachaMain",
    UIUnlockRuleName = "Gacha"
  },
  [6] = {
    ActionName = "OpenForge",
    EnterId = 6,
    EscShowCondition = T.RT_1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Forging.T_Entrance_Forging",
    Name = "MAIN_UI_FORGE",
    ReddotNode = "ForgeEntry",
    Sequence = 70,
    ShowCondition = T.RT_4,
    SystemUIName = "ForgeMain",
    UIUnlockRuleName = "Forging"
  },
  [7] = {
    EnterId = 7,
    EscShowCondition = T.RT_1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Achievement.T_Entrance_Achievement",
    Name = "MAIN_UI_ACHIEVEMENT",
    ReddotNode = "AchieveMain",
    Sequence = 30,
    SystemUIName = "AchievementSystem",
    UIUnlockRuleName = "Achievement"
  },
  [8] = {
    ActionName = "OpenPlay",
    EnterId = 8,
    EscShowCondition = T.RT_1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Pve.T_Entrance_Pve",
    Name = "MAIN_UI_PLAY",
    ReddotNode = "Play",
    Sequence = 50,
    ShowCondition = T.RT_2,
    SystemUIName = "StyleOfPlay",
    UIUnlockRuleName = "Play"
  },
  [9] = {
    ActionName = "OpenTask",
    EnterId = 9,
    EscShowCondition = T.RT_1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Task.T_Entrance_Task",
    Name = "MAIN_UI_QUEST",
    ReddotNode = "Quest",
    Sequence = 40,
    ShowCondition = T.RT_2,
    SystemUIName = "TaskPanel",
    UIUnlockRuleName = "Quest"
  },
  [10] = {
    EnterId = 10,
    EscShowCondition = T.RT_1,
    EscShowType = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Mail.T_Entrance_Mail",
    Name = "MAIN_UI_MAIL",
    ReddotNode = "NormalMail",
    Sequence = 100,
    SystemUIName = "MailMain",
    UIUnlockRuleName = "Mail"
  },
  [11] = {
    ActionName = "OpenMenu",
    DungeonIcon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Quit.T_Entrance_Quit",
    EnterId = 11,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Menu.T_Entrance_Menu",
    Name = "MAIN_UI_MENU",
    ReddotNode = "BattleMainMenu"
  },
  [12] = {
    EnterId = 12,
    EscShowCondition = T.RT_1,
    EscShowType = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Announcement.T_Entrance_Announcement",
    Name = "MAIN_UI_NOTICE",
    ReddotNode = "AnnouncementItems",
    Sequence = 110,
    SystemUIName = "AnnouncementMain",
    UIUnlockRuleName = "Announcement"
  },
  [13] = {
    ActionName = "OpenGuideBook",
    EnterId = 13,
    EscShowCondition = T.RT_1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_GuideBook.T_Entrance_GuideBook",
    Name = "MAIN_UI_GUIDEBOOK",
    ReddotNode = "NewGuideNote",
    Sequence = 120,
    SystemUIName = "GuideBook",
    UIUnlockRuleName = "GuideBook"
  },
  [14] = {
    EnterId = 14,
    EscShowCondition = T.RT_1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Friend.T_Entrance_Friend",
    Name = "MAIN_UI_FRIEND",
    ReddotNode = "NewFriendRequest",
    Sequence = 130,
    SystemUIName = "FriendMain",
    UIUnlockRuleName = "FriendMain"
  },
  [15] = {
    EnterId = 15,
    EscShowCondition = T.RT_1,
    EscShowType = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Camera.T_Entrance_Camera",
    Name = "MAIN_UI_PHOTOCAMERA",
    Sequence = 140,
    ShowCondition = {6},
    SystemUIName = "PhotoCameraMain",
    UIUnlockRuleName = "PhotoCameraMain"
  },
  [16] = {
    ActionName = "RougeOpenBag",
    EnterId = 16,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rouge_knapsack.T_Rouge_knapsack",
    Name = "UI_RougeBag_Name",
    Sequence = 150,
    ShowCondition = {3},
    SystemUIName = "RougeBag",
    UIUnlockRuleName = "RougeBag"
  },
  [17] = {
    ActionName = "OpenChat",
    EnterId = 17,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Common/T_Entrance_Chat.T_Entrance_Chat",
    Name = "MAIN_UI_CHAT",
    ReddotNode = "ChatMainMenu",
    SystemUIName = "ChatMain",
    UIUnlockRuleName = "Chat"
  },
  [18] = {
    ActionName = "OpenBattlePass",
    EnterId = 18,
    EscShowCondition = T.RT_1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_BattlePass.T_Entrance_BattlePass",
    Name = "MAIN_UI_BATTLEPASS",
    ReddotNode = "BattlePassMain",
    Sequence = 160,
    ShowCondition = T.RT_2,
    SystemUIName = "BattlePassMain",
    UIUnlockRuleName = "BattlePass"
  },
  [19] = {
    ActionName = "OpenEvent",
    EnterId = 19,
    EscShowCondition = T.RT_1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Activity.T_Entrance_Activity",
    Name = "MAIN_UI_GAMEEVENT",
    ReddotNode = "ActivityHub",
    Sequence = 170,
    ShowCondition = T.RT_2,
    SystemUIName = "ActivityMain",
    UIUnlockRuleName = "GameEvent"
  },
  [20] = {
    ActionName = "OpenMap",
    EnterId = 20,
    EscShowCondition = T.RT_1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Map.T_Entrance_Map",
    Name = "MAIN_UI_MAP",
    ReddotNode = "Map",
    Sequence = 180,
    SystemUIName = "LevelMapMain",
    UIUnlockRuleName = "Map"
  },
  [21] = {
    EnterId = 21,
    EscShowCondition = T.RT_3,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Entertainment",
    Name = "MAIN_UI_ENTERTAINMENT",
    ReddotNode = "Entertainment",
    Sequence = 190,
    ShowCondition = T.RT_4,
    SystemUIName = "Entertainment",
    UIUnlockRuleName = "Entertainment"
  },
  [22] = {
    EnterId = 22,
    EscShowCondition = T.RT_1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Wiki",
    Name = "MAIN_UI_WIKI",
    ReddotNode = "WikiReward",
    Sequence = 200,
    SystemUIName = "Wiki",
    UIUnlockRuleName = "Wiki"
  },
  [23] = {
    EnterId = 23,
    EscShowCondition = T.RT_1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Walnut.T_Entrance_Walnut",
    Name = "MAIN_UI_WALNUTBAG",
    ReddotNode = "WalnutBagItems",
    Sequence = 210,
    SystemUIName = "WalnutBagMain",
    UIUnlockRuleName = "WalnutBag"
  },
  [24] = {
    EnterId = 24,
    EscShowCondition = T.RT_1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Archive.T_Entrance_Archive",
    Name = "MAIN_UI_ARCHIVE",
    ReddotNode = "Archive",
    Sequence = 220,
    SystemUIName = "ArchiveMain",
    UIUnlockRuleName = "Archive"
  },
  [25] = {
    EnterId = 25,
    EscShowCondition = T.RT_1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_ModArchive.T_Entrance_ModArchive",
    Name = "MAIN_UI_MODGUIDEBOOK",
    ReddotNode = "ModArchive",
    Sequence = 171,
    ShowCondition = T.RT_2,
    SystemUIName = "ModArchiveMain",
    UIUnlockRuleName = "ModArchive"
  },
  [26] = {
    EnterId = 26,
    EscShowCondition = T.RT_1,
    EscShowType = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Set.T_Entrance_Set",
    Name = "UI_Esc_CommonSet",
    Sequence = 230,
    SystemUIName = "Setting"
  },
  [27] = {
    EnterId = 27,
    EscShowCondition = T.RT_1,
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_RelatedProduct.T_Entrance_RelatedProduct'",
    IfNoUI = true,
    Link = "RelatedProduct",
    Name = "MAIN_UI_RELATEDPRODUCT",
    Sequence = 221
  },
  [28] = {
    EnterId = 28,
    EscShowCondition = T.RT_1,
    EscShowType = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_TrainingLevel.T_Entrance_TrainingLevel",
    Name = "MAIN_UI_PlayLevel",
    ReddotNode = "ExperienceMain",
    Sequence = 95,
    SystemUIName = "ExperienceMain",
    UIUnlockRuleName = "PlayerLevel"
  }
})
