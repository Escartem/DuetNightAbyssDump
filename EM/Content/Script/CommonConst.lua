local CommonConst = {
  CONN_TYPE_NORMAL = 1,
  CONN_TYPE_REQUEST_AVATAR = 2,
  ConnectServerRequestType = {
    NEW_CONNECTION = 0,
    RE_CONNECTION = 1,
    BIND_AVATAR = 2,
    DS_NEW_CONNECTION = 3
  },
  OnlineShowWeapon = {Melee = "Melee", Ranged = "Ranged"},
  ConnectServerReplyType = {
    BUSY = 0,
    CONNECTED = 1,
    RECONNECT_SUCCEEDED = 2,
    RECONNECT_FAILED = 3,
    FORBIDDEN = 4,
    MAX_CONNECTION = 5
  },
  KickAvatarType = {
    KICK_AVATAR_RELAY = 1,
    KICK_AVATAR_FORCE_GM = 2,
    KICK_AVATAR_NONSTOP = 3,
    KICK_AVATAR_BAN = 4,
    KICK_AVATAR_ANTI_DULGENCE = 5,
    KICK_AVATAR_REGISTER_REAL_NAME = 6,
    KICK_AVATAR_FORCE_PATCH = 7,
    KICK_AVATAR_LOADMETAFROMDB_FAIL = 8
  },
  CLIENT_LOSE_DESTROY_DELAY_TIME = 300,
  DEFAULT_SAVE_TIME = 900,
  ConnectTimeout = 5,
  MAX_PLAYER_NUMS = 4,
  ONLINE_MATCH_TIME = 10,
  ONLINE_TEAM_VOTE_TIME = 10,
  AddCollectorTime = 0.5,
  UpdateCollectorTime = 0.5,
  DeadCollectorTime = 0.5,
  RewardReason = {
    MonsterDead = "MonsterDead",
    Chest = "Chest",
    BreakableItem = "BreakableItem",
    MonsterAnim = "MonsterAnim",
    PickUp = "PickUp",
    Repeated = "Repeated"
  },
  DSType = {
    Root = 0,
    Child = 1,
    Leaf = 2
  },
  DSRunningStatus = {
    Init = 0,
    Patching = 1,
    Preloading = 2,
    Running = 3,
    Destroyed = 4
  },
  WeaponType = {
    MeleeWeapon = "Melee",
    RangedWeapon = "Ranged",
    UltraWeapon = "Ultra"
  },
  ItemType = {
    Resource = "Resource",
    Material = "Material",
    GetThenUse = "GetThenUse"
  },
  SkillType = {
    WeaponPassive = "WeaponPassive"
  },
  DungeonNetMode = {
    Standalone = 1,
    DedicatedServer = 2,
    ListenServer = 3
  },
  H5RwardOpenDay = {
    2025,
    10,
    30,
    12,
    0,
    0
  },
  H5RwardCloseDay = {
    2025,
    11,
    28,
    5,
    0,
    0
  },
  DungeonUINameMap = {
    Survival = "DungenonSurviveFloat",
    SurvivalPro = "DungenonSurviveFloat",
    SurvivalMini = "DungenonSurviveFloat",
    SurvivalMiniPro = "DungenonSurviveFloat",
    Defence = "DungenonDefenseFloat",
    DefenceMove = "DungenonDefenseFloat",
    DefencePro = "DungenonDefenseProFloat",
    Capture = "DungeonCaptureFloat",
    Training = "Disable",
    Hijack = "DungeonHijackFloat",
    Sabotage = "DungeonSabotageFloat",
    SabotagePro = "Disable",
    Exterminate = "DungeonExterminateFloat",
    ExtermPro = "DungeonExterminateFloat",
    Excavation = "DungenonExcavation",
    Rescue = "DungeonRescueFloat",
    Temple = "DungeonTempleFloat",
    Party = "DungeonTempleFloat",
    Synthesis = "DungenonDefenseFloat",
    Rouge = "Rouge_BattleProgress",
    Abyss = "Abyss_BattleProgress",
    Trial = "Trial_BattleProgress",
    MultiDestroy = "RegionMultiDestroyProgress",
    CoDefence = "RegionCoDefenceProgress"
  },
  DungeonType = {
    Survival = "Survival",
    Defence = "Defence",
    Excavation = "Excavation",
    Capture = "Capture",
    Temple = "Temple",
    Training = "Training",
    Rouge = "Rouge",
    Trial = "Trial",
    Abyss = "Abyss",
    Party = "Party",
    Paotai = "Paotai",
    FeiNa = "FeinaEvent",
    MonsterRush = "MonsterRush"
  },
  SubRegionType = {Field = "field", Home = "home"},
  AvatarStatus = {
    Normal = 1,
    InBigWorld = 2,
    Matching = 3,
    EnterSingleDungeon = 4,
    InSingleDungeon = 5,
    EnterBigWorld = 6,
    InMultiDungeon = 7,
    InHardBoss = 8,
    EnterRougeLike = 9,
    InRougeLike = 10,
    EnterMultiDungeon = 11,
    DynamicEvent = 12,
    InExploreChanllenge = 13,
    InTeam = 14,
    InSpecialQuest = 15,
    InRegionOnline = 16
  },
  CommonStatus = {UnLock = 0, Lock = 1},
  AllType = {
    Char = 1,
    Weapon = 2,
    Resource = 3,
    Mod = 4
  },
  ActorType = {
    Player = 1,
    Monster = 2,
    CombatItemBase = 3
  },
  DataType = {
    Weapon = "Weapon",
    Char = "Char",
    Mod = "Mod",
    Resource = "Resource",
    Skin = "Skin",
    WeaponSkin = "WeaponSkin",
    CharAccessory = "CharAccessory",
    WeaponAccessory = "WeaponAccessory",
    Pet = "Pet"
  },
  RegionDataType = {
    [0] = "Mistake",
    [1] = "Common",
    [2] = "Quest",
    [3] = "Rarely",
    [5] = "CommonDaily",
    [6] = "CommonTriduum",
    [7] = "CommonWeekly",
    [8] = "CommonQuest"
  },
  AvatarOnlineStatus = {
    NotInOnline = 0,
    EnteringOnline = 1,
    InOnline = 2,
    LeavingOnline = 3
  },
  FeiNaState = {
    Doing = 0,
    Complete = 1,
    GetReward = 2
  },
  ExploreState = {
    InActive = 0,
    Doing = 1,
    ChallageComplete = 2,
    SpecialActive = 3,
    Complete = 4
  },
  SystemGuideState = {UnFinished = 0, Finished = 1},
  ShopRefreshBeginTime = {
    2023,
    1,
    1,
    5,
    0,
    0
  },
  ShopBannerPCPath = "/Game/UI/WBP/Shop/PC/Banner/",
  ShopBannerMobilePath = "/Game/UI/WBP/Shop/Mobile/Banner/",
  ShopOncePurchaseLimit = 10000000,
  PlatinumItemId = 100,
  ExpItemId = 101,
  CharExpItemId = 102,
  MeleeWeaponExpItemId = 103,
  RangedWeaponExpItemId = 104,
  PlayerExpId = 105,
  Coins = {
    Coin1 = 100,
    Coin2 = 101,
    Coin3 = 102,
    Coin4 = 99
  },
  PhysicalStrengthId = 103,
  CoinsList = {
    100,
    101,
    102,
    99
  },
  MonthlyCard = 121,
  ResourceSType = {
    Fish = "Fish",
    Event = "Event",
    Coin = "Coin",
    Read = "Read",
    PhantomItem = "PhantomItem",
    BattleItem = "BattleItem"
  },
  CorrectReason = {3001, 4001},
  ResUseEffectType = {
    SelectCharacter = "SelectCharacter",
    SelectWeapon = "SelectWeapon",
    SelectPet = "SelectPet",
    SelectResource = "SelectResource",
    ResourcePack = "ResourcePack",
    SelectSkin = "SelectSkin",
    SelectGeneralSkin = "SelectGeneralSkin",
    SelectWeaponSkin = "SelectWeaponSkin",
    SelectCharAccessory = "SelectCharAccessory",
    SelectWeaponAccessory = "SelectWeaponAccessory"
  },
  OptRewardType = {
    Char = "Char",
    Weapon = "Weapon",
    Pet = "Pet",
    Resource = "Resource",
    Skin = "Skin",
    GeneralSkin = "GeneralSkin",
    WeaponSkin = "WeaponSkin",
    CharAccessory = "CharAccessory",
    WeaponAccessory = "WeaponAccessory"
  },
  RougeLikeRoomType = {
    Combat = 1,
    EliteCombat = 2,
    Event = 3,
    Rest = 4,
    Boss = 5
  },
  RougeLikeAwardType = {
    AutoRandomOne = 1,
    ManualRandomThree = 2,
    SpecifyOne = 3
  },
  RougeLikeEventType = {
    DialogueAward = "DialogueAward",
    Battle = "Battle",
    Game = "Game"
  },
  RougeLikeManualType = {
    Blessing = 100002,
    Treasure = 100001,
    Event = 100003,
    StoryEvent = 100004
  },
  RougeLikeStoryEventMoment = {
    PassRoom = 0,
    Win = 1,
    Lose = 2,
    NewStart = 3
  },
  ActionPoint = 103,
  RagdollStateHitFly = 1,
  RagdollStateGrab = 2,
  RagdollStateDead = 3,
  ROLE_Authority = 3,
  ROLE_AutonomousProxy = 2,
  ROLE_SimulatedProxy = 1,
  BOSS_BLOOD_PART_MAX = 5,
  GACHA_PROBABILITY_BASE = 10000,
  GachaRegionId = 101101,
  GachaOneResult = 1,
  GachaTenResults = 10,
  GachaCharType = 0,
  GachaWeaponType = 1,
  GachaRarityMax = 5,
  GachaSelectCount = 6,
  GachaVideoRarity5 = "/Game/Asset/UIVideo/Video_ChouKa_jin.Video_ChouKa_jin",
  GachaVideoRarity4 = "/Game/Asset/UIVideo/Video_ChouKa_zi.Video_ChouKa_zi",
  GachaVideoRarity3 = "/Game/Asset/UIVideo/Video_ChouKa_lan.Video_ChouKa_lan",
  GachaVideoRarity5_Mobile = "/Game/Asset/UIVideo/Video_ChouKa_jin_Mobile.Video_ChouKa_jin_Mobile",
  GachaVideoRarity4_Mobile = "/Game/Asset/UIVideo/Video_ChouKa_zi_Mobile.Video_ChouKa_zi_Mobile",
  GachaVideoRarity3_Mobile = "/Game/Asset/UIVideo/Video_ChouKa_lan_Mobile.Video_ChouKa_lan_Mobile",
  GachaVideoMaleRarity6_PC = "/Game/Asset/UIVideo/Gacha/Gacha_S_Movie_PC.Gacha_S_Movie_PC",
  GachaVideoMaleRarity5_PC = "/Game/Asset/UIVideo/Gacha/Gacha_S_Movie_PC.Gacha_S_Movie_PC",
  GachaVideoMaleRarity4_PC = "/Game/Asset/UIVideo/Gacha/Gacha_R_Movie_PC.Gacha_R_Movie_PC",
  GachaVideoMaleRarity3_PC = "/Game/Asset/UIVideo/Gacha/Gacha_N_Movie_PC.Gacha_N_Movie_PC",
  GachaVideoFemaleRarity6_PC = "/Game/Asset/UIVideo/Gacha/Gacha_S_Movie_PC.Gacha_S_Movie_PC",
  GachaVideoFemaleRarity5_PC = "/Game/Asset/UIVideo/Gacha/Gacha_S_Movie_PC.Gacha_S_Movie_PC",
  GachaVideoFemaleRarity4_PC = "/Game/Asset/UIVideo/Gacha/Gacha_R_Movie_PC.Gacha_R_Movie_PC",
  GachaVideoFemaleRarity3_PC = "/Game/Asset/UIVideo/Gacha/Gacha_N_Movie_PC.Gacha_N_Movie_PC",
  GachaVideoMaleRarity6_Mobile = "/Game/Asset/UIVideo/Gacha/Gacha_S_Movie_Mobile.Gacha_S_Movie_Mobile",
  GachaVideoMaleRarity5_Mobile = "/Game/Asset/UIVideo/Gacha/Gacha_S_Movie_Mobile.Gacha_S_Movie_Mobile",
  GachaVideoMaleRarity4_Mobile = "/Game/Asset/UIVideo/Gacha/Gacha_R_Movie_Mobile.Gacha_R_Movie_Mobile",
  GachaVideoMaleRarity3_Mobile = "/Game/Asset/UIVideo/Gacha/Gacha_N_Movie_Mobile.Gacha_N_Movie_Mobile",
  GachaVideoFemaleRarity6_Mobile = "/Game/Asset/UIVideo/Gacha/Gacha_S_Movie_Mobile.Gacha_S_Movie_Mobile",
  GachaVideoFemaleRarity5_Mobile = "/Game/Asset/UIVideo/Gacha/Gacha_S_Movie_Mobile.Gacha_S_Movie_Mobile",
  GachaVideoFemaleRarity4_Mobile = "/Game/Asset/UIVideo/Gacha/Gacha_R_Movie_Mobile.Gacha_R_Movie_Mobile",
  GachaVideoFemaleRarity3_Mobile = "/Game/Asset/UIVideo/Gacha/Gacha_N_Movie_Mobile.Gacha_N_Movie_Mobile",
  GuideGachaVoice = "voice/$Locale$/story/1002/100127/1910D59A",
  GachaBackgroundAddrPC = "/Game/UI/WBP/Get/Widget/Avatar/",
  GachaBackgroundAddrMobile = "/Game/UI/WBP/Get/Widget/Avatar/",
  GachaJumpToShopMainTabId = 110,
  Sex = {Male = 0, Female = 1},
  DynamicQuest_Probability_Head = 1,
  DynamicQuest_Probability_Tail = 100,
  ChangeCharQuestChainId = 100201,
  SignBoardUnset = -1,
  SignBoardThird = 3,
  PartySaiQi = 5301,
  Community = {JJJCN = 1, JJJAboard = 4},
  BuffType = {
    Buff = 1,
    Debuff = 2,
    Weakness = 100
  },
  AvatarBuffPermanent = -1,
  NET_PING_TIME = 5,
  NET_DELAY_TIPS_INTERVAL = 2,
  NET_DELAY_TIMEOUT_TIME = 100,
  NET_DELAY_CHECK_INTERVAL = 4,
  NET_Player_UPDATE_INFO = 5,
  TargetTypeRougeLikeFinish = 9001,
  TargetTypeRougeLikeTalentBranch = 9002,
  TargetTypeRougeLikeGetBlessing = 9003,
  TargetTypeRougeLikeGetTreasure = 9004,
  TargetTypeRougeLikeEnterRoom = 9005,
  TargetTypeRougeLikeGetToken = 9006,
  TargetTypeRougeLikeCurrentToken = 9007,
  TargetTypeRougeLikeToken = 9008,
  TargetTypeRougeLikeContract = 9009,
  TargetTypeAvatarLevel = 10001,
  TargetTypeTotalLoginDays = 10002,
  TargetTypeConsecutiveLoginDays = 10003,
  TargetTypeConsumeActionPoint = 10004,
  TargetTypeAccumulatedNumberOfFriendsAdded = 10801,
  TargetTypeGetReource = 10101,
  TargetTypeCostResource = 10102,
  TargetTypeGetResourceSTypeRarity = 10103,
  TargetTypeGetResourceForAutoUseWhenAdd = 10104,
  TargetTypeCostResourceForBattleItem = 10105,
  TargetTypeMosterAll = 10201,
  TargetTypeMosterId = 10202,
  TargetTypeModAll = 10301,
  TargetTypeModId = 10302,
  TargetTypeModType = 10303,
  TargetTypeCharModNum = 10304,
  TargetTypeWeaponTagModNum = 10305,
  TargetTypeModRarityLevel = 10306,
  TargetTypeModCountRarityLevel = 10307,
  TargetTypeWeaponAll = 10401,
  TargetTypeWeaponLevel = 10402,
  TargetTypeWeaponEnchance = 10403,
  TargetTypeWeaponRarityModSlotPolarity = 10404,
  TargetTypeWeaponModSlotPolarity = 10405,
  TargetTypeWeaponRarityGrade = 10406,
  TargetTypeWeaponGrade = 10407,
  TargetTypeMechanismId = 10501,
  TargetTypeDungeonId = 10502,
  TargetTypeDungeonIdAndTime = 10503,
  TargetTypeDungeonIdAndProgress = 10504,
  TargetTypeExploreId = 10505,
  TargetTypeExploreIdInTime = 10507,
  TargetTypeDungeonIdFirst = 10509,
  TargetTypeDungeonsCharId = 10511,
  TargetTypeDungeonCharId = 10512,
  TargetTypeDungeonTime = 10513,
  TargetTypeDungeonTypeTime = 10514,
  TargetTypeMultiDungeonTime = 10515,
  TargetTypeDynamicEventTime = 10516,
  TargetTypeTempleTime = 10517,
  TargetTypeSpecialTemple = 10518,
  TargetTypeCreatorIdAndStateId = 10520,
  TargetTypeModDungeon = 10523,
  TargetTypeCharLevel = 10601,
  TargetTypeCharEnchance = 10602,
  TargetTypeCharId = 10603,
  TargetTypeCharAllModSlotPolarity = 10604,
  TargetTypeCharIdModSlotPolarity = 10605,
  TargetTypeCharRarityGrade = 10606,
  TargetTypeCharIdGrade = 10607,
  TargetTypeCharIdRarity = 10608,
  TargetTypeCharSkillLevel = 10609,
  TargetTypeQuestChainId = 10701,
  TargetTypeCompleteQuestId = 10702,
  TargetTypeQuestChainType = 10703,
  TargetTypeQuestOnlyCondition = 10704,
  TargetTypeDrawGacha = 11001,
  TargetTypeBlueTypeCount = 10901,
  TargetTypeImpressionCheckCount = 12001,
  TargetTypeImpressionValue = 12002,
  TargetTypeCharAccessoryCount = 13001,
  TargetTypeAllImpressionValue = 12003,
  TargetTypeImpressionShop = 12004,
  TargetTypeTalkTriggerComplete = 12005,
  TargetDispatchCompleteCount = 10519,
  TargetDispatchCompleteGrade = 10521,
  TargetPetCaptureSuccessDungeon = 10522,
  TargetPetCaptureSuccessCount = 14001,
  TargetPetBreakCount = 14002,
  TargetPetBreaknumCount = 14003,
  TargetTakePhotoCount = 21001,
  TargetTypePassAbyssTypeTimes = 15001,
  TargetTypeWikiEntryUnlockCount = 16001,
  TargetTypeStarterQuestPhaseFinish = 18001,
  TargetTypePartyTopicUnlockCount = 17001,
  TargetTypeTryPetCaptureCreatorId = 14004,
  TargetTypeZhiliuCompleteCount = 22003,
  TargetTypeWalnutType = 19001,
  TargetTypeWalnutId = 19002,
  TargetTypeChangeColor = 20001,
  TargetTypeTempleStarsGet = 22001,
  TargetTypeWYSStarsGet = 22002,
  TargetTypeCommonQuestFinish = 22004,
  TargetTypeCollectFeiNaCount = 22005,
  TargetTypeMidTermScoreGet = 22006,
  TargetTypePassHardBoss = 23001,
  MaxGradeLevel = 6,
  MailMaxDueTime = 9999,
  GMMailTimeLimit = 30,
  MailTabMaxRedNums = 99,
  DoubleModDropEventID = 103009001,
  AbyssEventId = 103002,
  FeinaEventId = 103010,
  TheaterEventId = 103011,
  ZhiliuEventId = 103005,
  TargetCheckAll = {
    9001,
    9002,
    9003,
    9004,
    9005,
    10103,
    10105,
    10305,
    10307,
    10501,
    10512,
    10606,
    11001,
    10513,
    10514,
    10515,
    10516,
    10517,
    10518,
    10901,
    13001,
    12003,
    10519,
    10520,
    14003,
    18001,
    19001,
    19002,
    23001,
    22005,
    10704
  },
  TargetCheckFirst = {
    10001,
    10002,
    10003,
    10101,
    10102,
    10104,
    10202,
    10302,
    10303,
    10304,
    10402,
    10403,
    10404,
    10405,
    10502,
    10505,
    10509,
    10511,
    10601,
    10602,
    10603,
    10605,
    10607,
    10608,
    10609,
    10701,
    10702,
    10703,
    12001,
    12005,
    10521,
    14004,
    20001,
    22004,
    12004
  },
  TargetCheckFisrtAndLess = {10503, 10507},
  TargetCheckFisrtAndMore = {
    9009,
    10306,
    10406,
    10407,
    10504,
    22002
  },
  TargetCheckLastAndMore = {
    12002,
    15001,
    22001
  },
  SystemLanguages = {
    Default = "TextMapContent",
    CN = "TextMapContent",
    EN = "ContentEN",
    JP = "ContentJP",
    KR = "ContentKR",
    TC = "ContentTC",
    DE = "ContentDE",
    FR = "ContentFR",
    ES = "ContentES"
  },
  SystemLanguage = "TextMapContent",
  SystemVoices = {
    Default = "CN",
    CN = "CN",
    EN = "EN",
    JP = "JP",
    KR = "KR"
  },
  SystemVoice = "CN",
  ASC = 1,
  DESC = 2,
  ArmoryVoice = nil,
  SECOND_IN_MINUTE = 60,
  SECOND_IN_HOUR = 3600,
  SECOND_IN_DAY = 86400,
  SECOND_IN_WEEKDAY = 604800,
  MINUTE_IN_HOUR = 60,
  GAME_REFRESH_HMS = {
    5,
    0,
    0
  },
  SALOG_TIME = 8,
  DungeonExitRule = {OVERLAP_EXIT = 1, ALL_EXIT = 2},
  RateIndex = {
    Default = 1,
    GlobalATK = 2,
    ExcelWeapon = 3
  },
  SuitType = {
    GameModeSuit = "GameModeSuit",
    PlayerCharacterSuit = "PlayerCharacterSuit"
  },
  GameModeSuit = {DropRule = "DropRule"},
  PlayerCharacterSuit = {
    DisableSkill = "DisableSkill",
    SwitchRole = "SwitchRole",
    SwitchStoryMode = "SwitchStoryMode",
    HideUIInScreen = "HideUIInScreen",
    MonsterFirstSeenGuide = "MonsterFirstSeenGuide",
    BGM = "BGM",
    ContinuedGuide = "ContinuedGuide",
    NpcHideShowTag = "NpcHideShowTag",
    BGMParams = "BGMParams"
  },
  ImpressionType = {
    Benefit = "Benefit",
    Morality = "Morality",
    Wisdom = "Wisdom",
    Empathy = "Empathy",
    Chaos = "Chaos"
  },
  ImpressionState = {
    Failer = 0,
    Success = 1,
    Complete = 2
  },
  ResourceUseEffectDrop = {
    AddHPValue = 1001,
    AddSPValue = 1002,
    AddAmmo = 1003
  },
  EnterRegionType = {
    GM = "GM",
    Recover = "Recover",
    SelectMap = "SelectMap",
    Deliver = "Deliver",
    FirstRegion = "FirstRegion",
    Sojourns = "Sojourns"
  },
  DropProjectileSe = {
    [0] = "event:/ui/common/dropItem_normal_open",
    [1] = "event:/ui/common/dropItem_purple_open",
    [2] = "event:/ui/common/dropItem_gold_open"
  },
  DropIdleSe = {
    [0] = "event:/ui/common/dropItem_normal_drop",
    [1] = "event:/ui/common/dropItem_purple_drop",
    [2] = "event:/ui/common/dropItem_gold_drop"
  },
  DropFlyingSe = {
    [0] = "event:/ui/common/dropItem_whoosh",
    [1] = "event:/ui/common/dropItem_whoosh",
    [2] = "event:/ui/common/dropItem_whoosh"
  },
  DropPickupSe = {
    [0] = "event:/ui/common/dropItem_normal_pick",
    [1] = "event:/ui/common/dropItem_purple_pick",
    [2] = "event:/ui/common/dropItem_gold_pick"
  },
  CannotAsyncEventPath = {
    [0] = "event:/cine",
    [1] = "event:/sfx/common/story"
  },
  NoNeedCacheEventPath = {
    [0] = "event:/bgm",
    [1] = "event:/cine",
    [2] = "event:/voice/ch/inv",
    [3] = "event:/voice/ch/story",
    [4] = "event:/voice/en/inv",
    [5] = "event:/voice/en/story",
    [6] = "event:/voice/jp/inv",
    [7] = "event:/voice/jp/story",
    [8] = "event:/voice/kr/inv",
    [9] = "event:/voice/kr/story",
    [10] = "event:/sfx/common/story"
  },
  AddRegionDataType = {
    Normal = "Normal",
    Static = "Static",
    Random = "Random"
  },
  ArmoryType = {
    Char = "Char",
    Skill = "Skill",
    Weapon = "Weapon",
    Trace = "Trace",
    Grade = "Grade",
    Mod = "Mod",
    Pet = "Pet"
  },
  ArmoryTag = {
    Char = "Char",
    Skill = "Skill",
    Melee = "Melee",
    Ranged = "Ranged",
    Trace = "Trace",
    Grade = "Grade",
    Condemn = "Condemn",
    Prominent = "Prominent",
    UWeapon = "UWeapon",
    Appearance = "Appearance",
    Files = "Files",
    Pet = "Pet",
    Color = "Color"
  },
  EPreviewSceneType = {
    PreviewArmory = 1,
    PersonInfo = 2,
    BattlePass = 3,
    PreviewCommon = 4
  },
  PreviewScenePaths = {
    "/Game/UI/LevelMap/Armory_BGSkySphere.Armory_BGSkySphere",
    "/Game/UI/LevelMap/Map_Preview.Map_Preview'",
    "/Game/UI/LevelMap/Map_BattleOrder.Map_BattleOrder",
    "/Game/UI/LevelMap/UI_Background_Art.UI_Background_Art"
  },
  NonePolarity = -1,
  ModSlotUnequipped = "",
  CharAccessoryTypes = {
    Back = "Back",
    Head = "Head",
    Waist = "Waist",
    Face = "Face",
    Ear = "Ear",
    Fx = "Fx",
    Special = "Special",
    FX_Body = "FX_Body",
    FX_Footprint = "FX_Footprint",
    FX_Teleport = "FX_Teleport",
    FX_Dead = "FX_Dead"
  },
  NewCharAccessoryTypes = {
    Back = 1,
    Head = 2,
    Waist = 3,
    Face = 4,
    Fx = 5,
    FX_Footprint = 6,
    FX_Body = 7,
    FX_Teleport = 8,
    FX_Dead = 9,
    Special = 10,
    Ear = 11
  },
  RobberMonsterDungeonType = {
    Sabotage = "Sabotage",
    Excavation = "Excavation",
    Survival = "Survival",
    Capture = "Capture"
  },
  RobberMonsterId = 9500001,
  OverallPerformanceCustom = -1,
  OverallPerformanceHigh = 3,
  AntiAliasingClose = 0,
  FullscreenMode = 0,
  WindowMode = 2,
  ScreenScale = 9,
  DefaultScreenScale = 16,
  DefaultWindowResolution = {X = 1600, Y = 900},
  ResolutionTable = {
    [1] = {
      {2048, 1536},
      {1920, 1440},
      {1600, 1200},
      {1440, 1080},
      {1280, 960},
      {1152, 864},
      {1024, 768},
      {800, 600}
    },
    [2] = {
      {3840, 2160},
      {2560, 1440},
      {1920, 1080},
      {1600, 900},
      {1366, 768},
      {1280, 720}
    },
    [3] = {
      {3440, 1440},
      {2560, 1080},
      {1792, 768}
    },
    [4] = {
      {3680, 1440},
      {1840, 720}
    }
  },
  SpecialHideNoWhere = 0,
  SpecialHideAboard = 1,
  SpecialHideCN = 2,
  SpecialHideAnyWhere = 99,
  MaxFPS = 9999,
  SensorHeight = 20.25,
  FocusMethod = 0,
  UnsetState = -1,
  PartySaiQi = 5301,
  ArchiveType = {
    Char = "Char",
    Weapon = "Weapon",
    Resource = "Resource",
    Monster = "Monster"
  },
  ArchiveType2ArchiveId = {
    Char = 1001,
    MeleeWeapon = 1002,
    RangedWeapon = 1003,
    NormalResource = 1004,
    ReadResource = 1005,
    Monster = 1006
  },
  ItemArchiveTypeList = {1, 2},
  ArchiveInfo_Weapon = {MaxEnhanceLevel = 1, MaxGradeLevel = 2},
  FishSizeScale = 10,
  FishSystemNoParam = -1,
  RareFishLevel = 4,
  FishingLureEffect = {
    Hook = "AccelerateHook",
    Variant = "AddVariationProb",
    Weight = "AddRareFishProb"
  },
  ArmoryEnterId = 1,
  GachaEnterId = 5,
  AbyssTeamNoChar = "",
  AbyssTeamNoPet = -1,
  AbyssTeamDataType = {
    "Char",
    "MeleeWeapon",
    "RangedWeapon",
    "Phantom1",
    "PhantomWeapon1",
    "Phantom2",
    "PhantomWeapon2",
    "Pet"
  },
  DefaultNoHeadFrame = -1,
  CharSkillTreeCount = 3,
  FilterRewardRarity = 3,
  DungeonWinMode = {
    Endless = 1,
    Single = 2,
    Disable = 3
  },
  DungeonUnCostItems = {
    ActionPoint = 1,
    Ticket = 2,
    Walnut = 3
  },
  WalnutUser = {
    Depute = "Depute",
    Dungeon = "Dungeon",
    Settlement = "Settlement"
  },
  ClientStatus = {
    None = 0,
    InRegion = 1,
    InDungeon = 2
  },
  SyncReason = {
    Normal = "Normal",
    InElevator = "InElevator",
    DSOnline = "DSOnline"
  },
  DailyTaskState = {
    Doing = 1,
    Complete = 2,
    GetReward = 3
  },
  DynamicQuestState = {
    inactive = 0,
    active = 1,
    doing = 2,
    success = 3,
    fail = 4,
    dispatch = 5
  },
  DispatchState = {
    Unlock = 0,
    CanDispatch = 1,
    Doing = 2,
    Perfect = 3,
    Success = 4,
    Qualified = 5,
    Disqualified = 6,
    Failer = 7,
    Cooling = 8
  },
  ExeModeType = {GM = "GM", Normal = "Normal"},
  DispatchRewardIndex = {
    Perfect = 0,
    Success = 1,
    Qualified = 2,
    Disqualified = 3
  },
  DispatchEffect = {
    Workaholic = "Workaholic",
    Rigorous = "Rigorous",
    Skilled = "Skilled",
    Lucky = "Lucky"
  },
  DraftState = {
    ToBeProduced = 0,
    Doing = 1,
    Complete = 2
  },
  SkinType = {Char = 0, Weapon = 1},
  QuestState = {
    Start = 1,
    Success = 2,
    Failer = 3
  },
  QuestCompleteType = {
    Normal = "Normal",
    GM = "GM",
    TargetTrigger = "TargetTrigger"
  },
  SpecialQuestState = {
    NoneStart = 0,
    Doing = 1,
    Success = 2,
    Failer = 3
  },
  QuestChainState = {
    lock = 0,
    unlock = 1,
    doing = 2,
    finish = 3,
    preQuest = 4
  },
  MESSAGE_TYPE_SELF = 0,
  MESSAGE_TYPE_WORLD = 1,
  MESSAGE_TYPE_SYSTEM = 2,
  MESSAGE_TYPE_PRIVATE = 3,
  MESSAGE_TYPE_LEAGUE = 4,
  MESSAGE_TYPE_TEAM = 5,
  MAX_MESSAGE_COUNT = 50,
  ChatChannel = {
    Name = 0,
    TeamUp = 1,
    Help = 2,
    InTeam = 3,
    Friend = 4,
    RegionOnline = 5,
    SettlementOnline = 6,
    Signature = 7
  },
  INIT_WORLD_CHANNEL_COUNT = 1,
  MAX_WORLD_CHANNEL_MEMBER = 200,
  CHAT_INTERVAL = 0.5,
  MAX_QUICK_MESSAGE_COUNT = 8,
  MAX_EMOTION_COUNT = 10,
  ReportType = {
    "UI_COMMONPOP_TEXT_100090_3",
    "UI_COMMONPOP_TEXT_100090_4",
    "UI_COMMONPOP_TEXT_100090_5",
    "UI_COMMONPOP_TEXT_100090_6",
    "UI_COMMONPOP_TEXT_100090_7",
    "UI_COMMONPOP_TEXT_100090_8",
    "UI_COMMONPOP_TEXT_100090_9",
    "UI_COMMONPOP_TEXT_100090_10"
  },
  AvatarInfoProps = {
    "Account",
    "Eid",
    "Uid",
    "Nickname",
    "Hostnum",
    "Level",
    "HeadIconId",
    "LastLogoutTime",
    "LastLoginTime",
    "Signature",
    "CurrentRegionId",
    "ChannelId",
    "IsOnline",
    "HeadFrameId",
    "TitleBefore",
    "TitleAfter",
    "TitleFrame"
  },
  FriendShortInfoProps = {
    "Account",
    "Eid",
    "Uid",
    "Nickname",
    "Hostnum",
    "Level",
    "HeadIconId",
    "LastLogoutTime",
    "LastLoginTime",
    "Signature",
    "CurrentRegionId",
    "Friends",
    "Blacklist",
    "ChannelId"
  },
  FriendDetailInfoProps = {
    "Account",
    "Eid",
    "Uid",
    "Nickname",
    "Hostnum",
    "Level",
    "HeadIconId",
    "LastLogoutTime",
    "LastLoginTime",
    "Signature",
    "CurrentRegionId",
    "ChannelId",
    "Friends",
    "Blacklist"
  },
  ImpressionCheckType = {
    Normal = 0,
    Success = 1,
    Failed = 2
  },
  GMRegionTargetType = {AllData = 1, AllQuestData = 2},
  QuestChainType = {
    Main = 1,
    Daily = 2,
    Branch = 3,
    ActiveBranch = 5,
    MainActive = 6
  },
  QuestTypeName = {
    [1] = "UI_QUEST_SUBTAB_NAME_MAIN",
    [3] = "UI_QUEST_SUBTAB_NAME_SIDE",
    [4] = "UI_QUEST_SUBTAB_NAME_SpecialSlide",
    [5] = "UI_QUEST_SUBTAB_NAME_LimitedtimeActivity",
    [6] = "UI_QUEST_SUBTAB_NAME_Activity"
  },
  ActionPointReason = {
    Auto = "auto",
    Purchase = "purchase",
    Item = "item",
    Dungeon = "dungeon"
  },
  TeamOrientation = {
    Public = 1,
    OnlyFriend = 2,
    RefuseAll = 3
  },
  LeaveTeamReason = {
    OffLine = 1,
    Willing = 2,
    Kick = 3
  },
  NpcPetState = {
    None = 0,
    Active = 1,
    InteractiveSuccess = 2,
    InteractiveFail = 3
  },
  SagLogType = {
    Track = "track",
    Monitor = "monitor",
    Set = "user_set",
    SetOnce = "user_setOnce",
    Add = "user_add",
    Unset = "user_unset",
    Append = "user_append",
    UniqAppend = "user_uniqAppend",
    Del = "user_del"
  },
  SagLogUserType = {
    Account = 1,
    Char = 2,
    AccountAndChar = 3,
    Device = 4,
    AccountAndDevice = 5,
    CharAndDevice = 6,
    AccountCharAndDevice = 7
  },
  WarningLogLength = 12000,
  SaLogClickTrack = {
    "user_login",
    "create_role",
    "role_login",
    "role_logout",
    "charge_info"
  },
  SaLogTrackProperties = {
    "#channel_id",
    "#app_channel_id",
    "#img_channel_id",
    "#oaid",
    "#gaid",
    "#ads_json",
    "#sdk_version",
    "#os",
    "#user_agent",
    "#device_key",
    "#android_id",
    "#idfa",
    "#idfv"
  },
  SaLogUserProperties = {
    "#user_ip",
    "#click_id",
    "#img_channel_id",
    "#channel_id",
    "#app_channel_id",
    "#oaid",
    "#gaid",
    "#ads_json",
    "#sdk_version",
    "#os",
    "#user_agent",
    "#device_key",
    "#wegame_distribute_id",
    "#android_id",
    "#idfa",
    "#idfv"
  },
  SaLogTrackNeedWeGame = {
    "user_login",
    "role_login",
    "role_logout",
    "create_role",
    "charge_info",
    "charge_deliver"
  },
  PetAutoLockBreakNum = 3,
  PetAutoLockRarity = 5,
  ResourceType = {
    Mod = "Mod",
    Weapon = "Weapon",
    Resource = "Resource",
    Char = "Char"
  },
  BagResourceType = {
    Weapon = 1,
    Mod = 2,
    Resource = 3,
    QuestResource = 4,
    ReadResource = 5
  },
  BattlePassTaskType = {
    Daily = "Daily",
    Weekly = "Weekly",
    Version = "Version"
  },
  PetNameLenghtLimit = 14,
  PetType = {Normal = 1, Consumable = 2},
  DynamicQuestPetToBeCapturedMaxCount = 100,
  LauncherSwitchConf = {
    [1] = "\230\139\166\230\136\170\229\133\172\229\145\138\229\188\128\229\133\179"
  },
  BattlePassPayType = {
    RANK2 = 1,
    RANK3 = 2,
    RANK2_UPGRADE_RANK3 = 3
  },
  QueryPayRetType = {
    Normal = 0,
    First = 1,
    Limit = 2
  },
  WhitelistType = {
    Internal = "\229\134\133\233\131\168\231\153\189\229\144\141\229\141\149",
    Player = "\231\142\169\229\174\182\231\153\189\229\144\141\229\141\149"
  },
  CHANNEL_OS = {
    IOS = "ios",
    ANDROID = "android",
    WINDOWS = "windows"
  },
  DEVICE_TYPE = {MOBILE = "mobile", PC = "pc"},
  CLIENT_DEVICE_TYPE = {
    MOBILE = "Mobile",
    PC = "PC",
    OTHER = "Other"
  },
  CHANNEL_PROVIDER = {OFFICAL = "hero", BILI = "bilibili"},
  IMG_CHANNEL_PROVIDER = {
    TapTap = "TapTap",
    HaoYouKuaiBao = "HaoYouKuaiBao",
    Lenovo = "Lenovo"
  },
  CHANNEL_REGION = {CHINA = "china", GLOBAL = "global"},
  CDKType = {
    Reusable = "Reusable",
    NonReusable = "NonReusable"
  },
  CrashSightNum = {
    [101] = {PC = 1, MB = 1},
    [102] = {PC = 1, MB = 1}
  },
  MonthlyCardValidDay = 30,
  DayTime = 86400,
  OnlineClientMessageType = {
    Move = true,
    Action = true,
    StopAction = true,
    Hide = true,
    SwitchShowWeapon = true
  },
  OnlineClientItemMessageType = {
    OnDeadRegionOnlineItem = "OnDeadRegionOnlineItem",
    OnChangeRegionOnlineItemState = "OnChangeRegionOnlineItemState",
    OnLevelRegionOnlineItem = "OnLevelRegionOnlineItem",
    OnUseRegionOnlineItem = "OnUseRegionOnlineItem"
  },
  MidTermTaskType = {
    DailyHigh = 1,
    DailyLow = 2,
    Cycle = 3,
    Achv = 4
  },
  RewardRateType = {Bonus = "Bonus", Exp = "Exp"},
  PersonalInfoVisibleType = {
    All = 1,
    FriendOnly = 2,
    Self = 3
  },
  DeliveryAnchorMechanismUnitId = 90100
}
CommonConst.IndependentModMultiplier = {"Normal"}
CommonConst.CONFIG = {
  expire_time = 10800,
  check_interval = 600,
  hash_algorithm = "sha1",
  max_log_size = 1024,
  collision_check = false,
  max_data_length = 10000
}
CommonConst.SVONKeepDataWorld = {
  [0] = "Chapter01_Won",
  [1] = "Ailixian_Paotai01"
}
CommonConst.CheckTimeAccelerationInterval = 30
CommonConst.TimeAccelerationWarningInterval = 300
CommonConst.WeaponTypes = {
  Ultra = 1,
  Polearm = 1,
  Claymore = 1,
  Broadsword = 1,
  Katana = 1,
  Crossbow = 1,
  Funnel = 1,
  Cannon = 1,
  Sword = 1,
  Dualblade = 1,
  Swordwhip = 1,
  Scythe = 1,
  Machinegun = 1,
  Bow = 1,
  Pistol = 1,
  Shotgun = 1
}
CommonConst.RougeLikeEventType2ManualType = {
  [1] = CommonConst.RougeLikeManualType.Event,
  [2] = CommonConst.RougeLikeManualType.StoryEvent
}
CommonConst.SERVER_AREA_TO_TIMEZONE = {
  China = 8,
  HMT = 8,
  Asian = 8,
  America = -5,
  Europe = 1,
  SEA = 8
}
CommonConst.UnrestrictedPayMoney2CoinNum = {TWD = 1.818, USD = 59.46181704}
CommonConst.WeaponCardLevelResourceId = 1006
return CommonConst
