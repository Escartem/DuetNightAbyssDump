local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ReddotNode", {
  AbyssEntry1 = {
    CacheType = 1,
    IsLeaf = true,
    Name = "AbyssEntry1",
    Type = 0
  },
  AbyssEntry2 = {
    CacheType = 1,
    IsLeaf = true,
    Name = "AbyssEntry2",
    Type = 0
  },
  AbyssMain = {
    Childs = {
      "AbyssReward",
      "AbyssEntry1",
      "AbyssEntry2"
    },
    Name = "AbyssMain"
  },
  AbyssReward = {
    CacheType = 1,
    IsLeaf = true,
    Name = "AbyssReward",
    Type = 0,
    bInvokeEveryTime = true
  },
  AchieveMain = {
    Name = "AchieveMain"
  },
  Acti_Abyss01 = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Acti_Abyss01",
    NodeModuleName = "Activity.Abyss",
    Type = 0
  },
  Acti_Abyss02 = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Acti_Abyss02",
    NodeModuleName = "Activity.Abyss",
    Type = 0
  },
  Acti_BetaAward = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Acti_BetaAward",
    NodeModuleName = "Activity.ConditionReward",
    Type = 0
  },
  Acti_ChallengeLevel = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Acti_ChallengeLevel",
    NodeModuleName = "Activity.ChallengeLevel",
    Type = 0
  },
  Acti_Community = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Acti_Community",
    NodeModuleName = "Activity.Community",
    Type = 0
  },
  Acti_FeinaEvent = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Acti_FeinaEvent",
    NodeModuleName = "Activity.FeinaEvent",
    Type = 0
  },
  Acti_GiveAoge = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Acti_GiveAoge",
    NodeModuleName = "Activity.ActivityBase",
    Type = 0
  },
  Acti_GiveBaonu = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Acti_GiveBaonu",
    NodeModuleName = "Activity.ActivityBase",
    Type = 0
  },
  Acti_GiveDafunie = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Acti_GiveDafunie",
    NodeModuleName = "Activity.ActivityBase",
    Type = 0
  },
  Acti_GiveSonglu = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Acti_GiveSonglu",
    NodeModuleName = "Activity.ActivityBase",
    Type = 0
  },
  Acti_JJGame = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Acti_JJGame",
    NodeModuleName = "Activity.JJGame",
    Type = 0
  },
  Acti_MidTerm = {
    Childs = {
      "Acti_JJGame",
      "JJGameTask_Normal_Reddot",
      "JJGameTask_Challenge_Reddot",
      "JJGameTask_Normal_New",
      "JJGameTask_Challenge_New"
    },
    Name = "Acti_MidTerm",
    bInvokeEveryTime = true
  },
  Acti_MultiDeviceLogin = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Acti_MultiDeviceLogin",
    NodeModuleName = "Activity.ConditionReward",
    Type = 0
  },
  Acti_RegionOnline = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Acti_RegionOnline",
    NodeModuleName = "Activity.ConditionReward",
    Type = 0
  },
  Acti_Rouge = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Acti_Rouge",
    NodeModuleName = "Activity.Rouge",
    Type = 0
  },
  Acti_SignInFeina = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Acti_SignInFeina",
    NodeModuleName = "Activity.DailySignIn",
    Type = 0
  },
  Acti_SignInSaiqi = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Acti_SignInSaiqi",
    NodeModuleName = "Activity.DailySignIn",
    Type = 0
  },
  Acti_TrailFeinaChar = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Acti_TrailFeinaChar",
    NodeModuleName = "Activity.TrialChar",
    Type = 1
  },
  Acti_TrailSaiqiSkin01 = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Acti_TrailSaiqiSkin01",
    NodeModuleName = "Activity.TrialChar",
    Type = 1
  },
  Acti_TrailShuimuSkin01 = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Acti_TrailShuimuSkin01",
    NodeModuleName = "Activity.TrialChar",
    Type = 1
  },
  Acti_TrailSkin01 = {
    Childs = {
      "Acti_TrailSaiqiSkin01",
      "Acti_TrailSongluSkin01",
      "Acti_TrailShuimuSkin01"
    },
    Name = "Acti_TrailSkin01",
    bInvokeEveryTime = true
  },
  Acti_TrailSongluSkin01 = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Acti_TrailSongluSkin01",
    NodeModuleName = "Activity.TrialChar",
    Type = 1
  },
  Acti_ZhiliuEvent = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Acti_ZhiliuEvent",
    NodeModuleName = "Activity.ZhiliuEvent",
    Type = 0
  },
  ActivityAnnouncement = {
    CacheType = 0,
    IsLeaf = true,
    Name = "ActivityAnnouncement",
    Type = 1,
    bInvokeEveryTime = true
  },
  ActivityHub = {
    Childs = {
      "Acti_Rouge",
      "Acti_SignInSaiqi",
      "Acti_Abyss01",
      "Acti_GiveAoge",
      "Acti_GiveDafunie",
      "Acti_ZhiliuEvent",
      "Acti_ChallengeLevel",
      "Acti_TrailSkin01",
      "Acti_MidTerm",
      "Acti_TrailFeinaChar",
      "Acti_Community",
      "Acti_BetaAward",
      "Acti_MultiDeviceLogin",
      "Acti_FeinaEvent",
      "Acti_SignInFeina",
      "Acti_GiveBaonu",
      "Acti_Abyss02",
      "Acti_GiveSonglu",
      "Acti_RegionOnline"
    },
    Name = "ActivityHub",
    bInvokeEveryTime = true
  },
  AnglingMap = {
    CacheType = 1,
    IsLeaf = true,
    Name = "AnglingMap",
    Type = 0
  },
  AnnouncementDirty = {
    CacheType = 0,
    IsLeaf = true,
    Name = "AnnouncementDirty",
    Type = 1,
    bInvokeEveryTime = true
  },
  AnnouncementItems = {
    Childs = {
      "SystemAnnouncement",
      "ActivityAnnouncement",
      "NewsAnnouncement",
      "AnnouncementDirty"
    },
    Name = "AnnouncementItems"
  },
  Archive = {
    Childs = {
      "ArchiveReward"
    },
    Name = "Archive"
  },
  ArchiveNewChar = {
    CacheType = 1,
    IsLeaf = true,
    Name = "ArchiveNewChar",
    Type = 0,
    bInvokeEveryTime = true
  },
  ArchiveNewMelee = {
    CacheType = 1,
    IsLeaf = true,
    Name = "ArchiveNewMelee",
    Type = 0,
    bInvokeEveryTime = true
  },
  ArchiveNewMonster = {
    CacheType = 1,
    IsLeaf = true,
    Name = "ArchiveNewMonster",
    Type = 0,
    bInvokeEveryTime = true
  },
  ArchiveNewRanged = {
    CacheType = 1,
    IsLeaf = true,
    Name = "ArchiveNewRanged",
    Type = 0,
    bInvokeEveryTime = true
  },
  ArchiveNewReadBook = {
    CacheType = 1,
    IsLeaf = true,
    Name = "ArchiveNewReadBook",
    Type = 0,
    bInvokeEveryTime = true
  },
  ArchiveNewResource = {
    CacheType = 1,
    IsLeaf = true,
    Name = "ArchiveNewResource",
    Type = 0,
    bInvokeEveryTime = true
  },
  ArchiveReward = {
    CacheType = 1,
    IsLeaf = true,
    Name = "ArchiveReward",
    Type = 0,
    bInvokeEveryTime = true
  },
  ArmoryBattleItem = {
    CacheType = 1,
    IsLeaf = true,
    Name = "ArmoryBattleItem",
    Type = 1
  },
  ArmoryMainMenu = {
    Childs = {
      "NewChar",
      "PromoteChar",
      "UnlockableChar",
      "ArmoryReward"
    },
    Name = "ArmoryMainMenu"
  },
  ArmoryReward = {
    Childs = {
      "CharReward",
      "MeleeReward",
      "RangedReward"
    },
    Name = "ArmoryReward"
  },
  BattleMainMenu = {
    Childs = {
      "AnnouncementItems",
      "ArmoryMainMenu",
      "NormalMail",
      "NewFriendRequest",
      "NewGuideNote",
      "ActivityHub",
      "EscPortrait",
      "Map",
      "ExperienceMain",
      "Shop",
      "Quest",
      "ModArchive",
      "Gacha",
      "AchieveMain"
    },
    Name = "BattleMainMenu",
    NodeModuleName = "BattleMainMenu"
  },
  BattlePassMain = {
    Childs = {
      "BattlePassNewVision",
      "BattlePassReward",
      "BattlePassMission",
      "BattlePassPetSelection"
    },
    Name = "BattlePassMain"
  },
  BattlePassMission = {
    CacheType = 1,
    IsLeaf = true,
    Name = "BattlePassMission",
    Type = 0,
    bInvokeEveryTime = true
  },
  BattlePassNewVision = {
    CacheType = 1,
    IsLeaf = true,
    Name = "BattlePassNewVision",
    Type = 0
  },
  BattlePassPetSelection = {
    CacheType = 1,
    IsLeaf = true,
    Name = "BattlePassPetSelection",
    Type = 0
  },
  BattlePassReward = {
    CacheType = 1,
    IsLeaf = true,
    Name = "BattlePassReward",
    Type = 0
  },
  CharReward = {
    CacheType = -1,
    IsLeaf = true,
    Name = "CharReward",
    Type = 0
  },
  ChatMainMenu = {
    Name = "ChatMainMenu"
  },
  DailyMain = {
    CacheType = 1,
    IsLeaf = true,
    Name = "DailyMain",
    Type = 0
  },
  DetectiveAnswer = {
    CacheType = 1,
    IsLeaf = true,
    Name = "DetectiveAnswer",
    Type = 1
  },
  DetectiveQuestion = {
    CacheType = 1,
    IsLeaf = true,
    Name = "DetectiveQuestion",
    Type = 1
  },
  Dispatch = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Dispatch",
    Type = 0
  },
  EditBtn = {
    Childs = {
      "EscPortrait",
      "TitleBtn"
    },
    Name = "EditBtn"
  },
  Entertainment = {
    Childs = {
      "Entertainment_Char"
    },
    Name = "Entertainment"
  },
  Entertainment_Char = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Entertainment_Char",
    Type = 0
  },
  EscPortrait = {
    Childs = {
      "Portrait",
      "PortraitFrame"
    },
    Name = "EscPortrait"
  },
  ExperienceItem = {
    CacheType = 1,
    IsLeaf = true,
    Name = "ExperienceItem",
    Type = 0,
    bInvokeEveryTime = true
  },
  ExperienceMain = {
    Childs = {
      "ExperienceItem"
    },
    Name = "ExperienceMain"
  },
  FeinaEventReward = {
    CacheType = 1,
    IsLeaf = true,
    Name = "FeinaEventReward",
    Type = 0
  },
  ForgeEntry = {Name = "ForgeEntry"},
  Gacha = {
    Childs = {
      "Gacha_Normal",
      "Gacha_Special"
    },
    Name = "Gacha"
  },
  Gacha_Normal = {
    CacheType = -1,
    IsLeaf = true,
    Name = "Gacha_Normal",
    NodeModuleName = "Gacha",
    Type = 0
  },
  Gacha_Special = {
    CacheType = -1,
    IsLeaf = true,
    Name = "Gacha_Special",
    NodeModuleName = "Gacha",
    Type = 0
  },
  HardBossItem = {
    CacheType = 1,
    IsLeaf = true,
    Name = "HardBossItem",
    Type = 1
  },
  HardBossMain = {
    CacheType = 1,
    IsLeaf = true,
    Name = "HardBossMain",
    Type = 0
  },
  JJGameTask_Challenge_New = {
    CacheType = 1,
    IsLeaf = true,
    Name = "JJGameTask_Challenge_New",
    Type = 1
  },
  JJGameTask_Challenge_Reddot = {
    CacheType = 1,
    IsLeaf = true,
    Name = "JJGameTask_Challenge_Reddot",
    Type = 0
  },
  JJGameTask_Normal_New = {
    CacheType = 1,
    IsLeaf = true,
    Name = "JJGameTask_Normal_New",
    Type = 1
  },
  JJGameTask_Normal_Reddot = {
    CacheType = 1,
    IsLeaf = true,
    Name = "JJGameTask_Normal_Reddot",
    Type = 0
  },
  Map = {
    Childs = {"Dispatch"},
    Name = "Map"
  },
  MeleeReward = {
    CacheType = -1,
    IsLeaf = true,
    Name = "MeleeReward",
    Type = 0
  },
  ModArchive = {
    Childs = {
      "ModArchive_Task",
      "ModArchive_Archive"
    },
    Name = "ModArchive"
  },
  ModArchive_Archive = {
    Childs = {
      "ModArchive_Archive_Char",
      "ModArchive_Archive_Melee",
      "ModArchive_Archive_Range",
      "ModArchive_Archive_MeleeUltra",
      "ModArchive_Archive_RangeUltra"
    },
    Name = "ModArchive_Archive"
  },
  ModArchive_Archive_Char = {
    CacheType = 1,
    IsLeaf = true,
    Name = "ModArchive_Archive_Char",
    NodeModuleName = "ModArchive",
    Type = 1
  },
  ModArchive_Archive_Melee = {
    CacheType = 1,
    IsLeaf = true,
    Name = "ModArchive_Archive_Melee",
    NodeModuleName = "ModArchive",
    Type = 1
  },
  ModArchive_Archive_MeleeUltra = {
    CacheType = 1,
    IsLeaf = true,
    Name = "ModArchive_Archive_MeleeUltra",
    NodeModuleName = "ModArchive",
    Type = 1
  },
  ModArchive_Archive_Range = {
    CacheType = 1,
    IsLeaf = true,
    Name = "ModArchive_Archive_Range",
    NodeModuleName = "ModArchive",
    Type = 1
  },
  ModArchive_Archive_RangeUltra = {
    CacheType = 1,
    IsLeaf = true,
    Name = "ModArchive_Archive_RangeUltra",
    NodeModuleName = "ModArchive",
    Type = 1
  },
  ModArchive_Task = {
    CacheType = 1,
    IsLeaf = true,
    Name = "ModArchive_Task",
    NodeModuleName = "ModArchive",
    Type = 1
  },
  NewChar = {
    CacheType = 1,
    IsLeaf = true,
    Name = "NewChar",
    Type = 1
  },
  NewFriendRequest = {
    CacheType = 1,
    IsLeaf = true,
    Name = "NewFriendRequest",
    Type = 0
  },
  NewGuideNote = {
    CacheType = 1,
    IsLeaf = true,
    Name = "NewGuideNote",
    Type = 1
  },
  NewsAnnouncement = {
    CacheType = 0,
    IsLeaf = true,
    Name = "NewsAnnouncement",
    Type = 1,
    bInvokeEveryTime = true
  },
  NormalMail = {
    CacheType = -1,
    IsLeaf = true,
    Name = "NormalMail",
    Type = 3,
    bInvokeEveryTime = true
  },
  PaotaiEventReward = {
    CacheType = 1,
    IsLeaf = true,
    Name = "PaotaiEventReward",
    Type = 0
  },
  Play = {
    Childs = {
      "HardBossMain",
      "PlayCommon",
      "PlayTaskRoot"
    },
    Name = "Play"
  },
  PlayCommon = {
    Childs = {"RougeMain", "AbyssMain"},
    Name = "PlayCommon"
  },
  PlayTaskRoot = {
    Childs = {
      "StarterQuest",
      "DailyMain"
    },
    Name = "PlayTaskRoot"
  },
  Portrait = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Portrait",
    Type = 1
  },
  PortraitFrame = {
    CacheType = 1,
    IsLeaf = true,
    Name = "PortraitFrame",
    Type = 1
  },
  PromoteChar = {
    CacheType = 1,
    IsLeaf = true,
    Name = "PromoteChar",
    Type = 0
  },
  Quest = {
    Childs = {
      "UI_QUEST_SUBTAB_NAME_ALL",
      "UI_QUEST_SUBTAB_NAME_MAIN",
      "UI_QUEST_SUBTAB_NAME_Activity",
      "UI_QUEST_SUBTAB_NAME_LimitedtimeActivity",
      "UI_QUEST_SUBTAB_NAME_SpecialSlide",
      "UI_QUEST_SUBTAB_NAME_SIDE"
    },
    Name = "Quest"
  },
  RangedReward = {
    CacheType = -1,
    IsLeaf = true,
    Name = "RangedReward",
    Type = 0
  },
  RougeArchiveBlessing = {
    CacheType = 1,
    IsLeaf = true,
    Name = "RougeArchiveBlessing",
    Type = 1
  },
  RougeArchiveEvent = {
    CacheType = 1,
    IsLeaf = true,
    Name = "RougeArchiveEvent",
    Type = 1
  },
  RougeArchiveMain = {
    Childs = {
      "RougeArchiveReward"
    },
    Name = "RougeArchiveMain"
  },
  RougeArchiveNew = {
    Childs = {
      "RougeArchiveTreasure",
      "RougeArchiveBlessing",
      "RougeArchiveRoom",
      "RougeArchiveStory"
    },
    Name = "RougeArchiveNew"
  },
  RougeArchiveReward = {
    CacheType = 1,
    IsLeaf = true,
    Name = "RougeArchiveReward",
    Type = 0,
    bInvokeEveryTime = true
  },
  RougeArchiveStory = {
    CacheType = 1,
    IsLeaf = true,
    Name = "RougeArchiveStory",
    Type = 1
  },
  RougeArchiveTreasure = {
    CacheType = 1,
    IsLeaf = true,
    Name = "RougeArchiveTreasure",
    Type = 1
  },
  RougeLikeReward = {
    CacheType = 1,
    IsLeaf = true,
    Name = "RougeLikeReward",
    Type = 0
  },
  RougeMain = {
    Childs = {
      "RougeLikeReward",
      "RougeArchiveMain"
    },
    Name = "RougeMain"
  },
  Shop = {
    Childs = {
      "Shop_Item",
      "Shop_Skin",
      "Shop_Gacha",
      "Shop_Pack",
      "Shop_Walnut"
    },
    Name = "Shop"
  },
  Shop_Gacha = {
    Childs = {
      "Shop_Gacha_Higth",
      "Shop_Gacha_Low"
    },
    Name = "Shop_Gacha"
  },
  Shop_Gacha_Higth = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Shop_Gacha_Higth",
    NodeModuleName = "Shop",
    Type = 1
  },
  Shop_Gacha_Low = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Shop_Gacha_Low",
    NodeModuleName = "Shop",
    Type = 1
  },
  Shop_Item = {
    Childs = {
      "Shop_Item_Yueshi",
      "Shop_Item_Yueshijingpei",
      "Shop_Item_CharPiece",
      "Shop_Item_Weapon"
    },
    Name = "Shop_Item"
  },
  Shop_Item_CharPiece = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Shop_Item_CharPiece",
    NodeModuleName = "Shop",
    Type = 1
  },
  Shop_Item_Weapon = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Shop_Item_Weapon",
    NodeModuleName = "Shop",
    Type = 1
  },
  Shop_Item_Yueshi = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Shop_Item_Yueshi",
    NodeModuleName = "Shop",
    Type = 1
  },
  Shop_Item_Yueshijingpei = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Shop_Item_Yueshijingpei",
    NodeModuleName = "Shop",
    Type = 1
  },
  Shop_Pack = {
    Childs = {
      "Shop_Pack_Limit",
      "Shop_Pack_Skin",
      "Shop_Pack_Item",
      "Shop_Pack_Month",
      "Shop_Pack_Week"
    },
    Name = "Shop_Pack"
  },
  Shop_Pack_Item = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Shop_Pack_Item",
    NodeModuleName = "Shop",
    Type = 1
  },
  Shop_Pack_Limit = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Shop_Pack_Limit",
    NodeModuleName = "Shop",
    Type = 1
  },
  Shop_Pack_Month = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Shop_Pack_Month",
    NodeModuleName = "Shop",
    Type = 1
  },
  Shop_Pack_Skin = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Shop_Pack_Skin",
    NodeModuleName = "Shop",
    Type = 1
  },
  Shop_Pack_Week = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Shop_Pack_Week",
    NodeModuleName = "Shop",
    Type = 1
  },
  Shop_Skin = {
    Childs = {
      "Shop_Skin_Head",
      "Shop_Skin_Face",
      "Shop_Skin_Waist",
      "Shop_Skin_Back",
      "Shop_Skin_Weapon",
      "Shop_Skin_Suit"
    },
    Name = "Shop_Skin"
  },
  Shop_Skin_Back = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Shop_Skin_Back",
    NodeModuleName = "Shop",
    Type = 1
  },
  Shop_Skin_Face = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Shop_Skin_Face",
    NodeModuleName = "Shop",
    Type = 1
  },
  Shop_Skin_Head = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Shop_Skin_Head",
    NodeModuleName = "Shop",
    Type = 1
  },
  Shop_Skin_Suit = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Shop_Skin_Suit",
    NodeModuleName = "Shop",
    Type = 1
  },
  Shop_Skin_Waist = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Shop_Skin_Waist",
    NodeModuleName = "Shop",
    Type = 1
  },
  Shop_Skin_Weapon = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Shop_Skin_Weapon",
    NodeModuleName = "Shop",
    Type = 1
  },
  Shop_Walnut = {
    Childs = {
      "Shop_Walnut_3",
      "Shop_Walnut_1",
      "Shop_Walnut_2"
    },
    Name = "Shop_Walnut"
  },
  Shop_Walnut_1 = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Shop_Walnut_1",
    NodeModuleName = "Shop",
    RuleId = "SecretLetterShopTab",
    Type = 1
  },
  Shop_Walnut_2 = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Shop_Walnut_2",
    NodeModuleName = "Shop",
    RuleId = "SecretLetterShopTab",
    Type = 1
  },
  Shop_Walnut_3 = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Shop_Walnut_3",
    NodeModuleName = "Shop",
    RuleId = "SecretLetterShopTab",
    Type = 1
  },
  StarterQuest = {
    CacheType = 1,
    IsLeaf = true,
    Name = "StarterQuest",
    Type = 0
  },
  SystemAnnouncement = {
    CacheType = 0,
    IsLeaf = true,
    Name = "SystemAnnouncement",
    Type = 1,
    bInvokeEveryTime = true
  },
  TheaterEventReward = {
    CacheType = 1,
    IsLeaf = true,
    Name = "TheaterEventReward",
    Type = 0
  },
  Title = {
    CacheType = 1,
    IsLeaf = true,
    Name = "Title",
    Type = 1
  },
  TitleBtn = {
    CacheType = 1,
    IsLeaf = true,
    Name = "TitleBtn",
    Type = 1
  },
  TitleFrame = {
    CacheType = 1,
    IsLeaf = true,
    Name = "TitleFrame",
    Type = 1
  },
  TitleFrameTab = {
    Childs = {"TitleFrame"},
    Name = "TitleFrameTab"
  },
  TitleTab = {
    Childs = {"Title"},
    Name = "TitleTab"
  },
  UI_QUEST_SUBTAB_NAME_ALL = {
    Childs = {
      "UI_QUEST_SUBTAB_NAME_MAIN",
      "UI_QUEST_SUBTAB_NAME_Activity",
      "UI_QUEST_SUBTAB_NAME_LimitedtimeActivity",
      "UI_QUEST_SUBTAB_NAME_SpecialSlide",
      "UI_QUEST_SUBTAB_NAME_SIDE"
    },
    Name = "UI_QUEST_SUBTAB_NAME_ALL"
  },
  UI_QUEST_SUBTAB_NAME_Activity = {
    CacheType = 1,
    IsLeaf = true,
    Name = "UI_QUEST_SUBTAB_NAME_Activity",
    NodeModuleName = "Quest",
    Type = 1
  },
  UI_QUEST_SUBTAB_NAME_LimitedtimeActivity = {
    CacheType = 1,
    IsLeaf = true,
    Name = "UI_QUEST_SUBTAB_NAME_LimitedtimeActivity",
    NodeModuleName = "Quest",
    Type = 1
  },
  UI_QUEST_SUBTAB_NAME_MAIN = {
    CacheType = 1,
    IsLeaf = true,
    Name = "UI_QUEST_SUBTAB_NAME_MAIN",
    NodeModuleName = "Quest",
    Type = 1
  },
  UI_QUEST_SUBTAB_NAME_SIDE = {
    CacheType = 1,
    IsLeaf = true,
    Name = "UI_QUEST_SUBTAB_NAME_SIDE",
    NodeModuleName = "Quest",
    Type = 1
  },
  UI_QUEST_SUBTAB_NAME_SpecialSlide = {
    CacheType = 1,
    IsLeaf = true,
    Name = "UI_QUEST_SUBTAB_NAME_SpecialSlide",
    NodeModuleName = "Quest",
    Type = 1
  },
  UnlockableChar = {
    CacheType = -1,
    IsLeaf = true,
    Name = "UnlockableChar",
    Type = 0
  },
  WalnutBagItems = {
    CacheType = 1,
    IsLeaf = true,
    Name = "WalnutBagItems",
    Type = 1
  },
  WikiEntrance = {
    Childs = {"WikiItems"},
    Name = "WikiEntrance"
  },
  WikiItems = {
    CacheType = 1,
    IsLeaf = true,
    Name = "WikiItems",
    Type = 1
  },
  WikiReward = {
    CacheType = 1,
    IsLeaf = true,
    Name = "WikiReward",
    Type = 0
  }
})
