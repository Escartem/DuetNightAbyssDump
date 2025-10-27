local GM_Command = {}

function GM_Command:Initialize(Initializer)
  self:Init_Command()
  self.NewCommands = {}
  for k, v in pairs(self.Commands) do
    self.NewCommands[string.upper(k)] = v
  end
  for k, v in pairs(self.NewCommands) do
    self.Commands[k] = v
  end
end

function GM_Command:AutoExecuteGM()
  local EMCache = require("EMCache.EMCache")
  if EMCache:Get("GM_MockAllSystemCondition", true) then
    self:MockAllSystemCondition()
  end
end

function GM_Command:Init_Command()
  self.Commands = {
    R = "ReloadAll",
    Hotfix = "Hotfix",
    GA = "GetAvatar",
    GSA = "GetServerAvatar",
    CM = "CreateMonster",
    CMSM = "CreateMonsterSpawnMonster",
    CTM = "CreateTestMonster",
    CP = "CreatePhantom",
    CMS = "CreateMechanismSummon",
    CN = "CreateNpc",
    CPet = "CreatePet",
    TriggerLoadedEvent = "TriggerLoadedEvent",
    LowQuality = "LowQuality",
    ShowFlag = "ShowFlag",
    QualityLevel = "QualityLevel",
    OpenUI = "OpenUI",
    HideUI = "HideUI",
    CloseUI = "CloseUI",
    ShowGuideUI = "ShowGuideUI",
    FallAttackPoint = "FallAttackPoint",
    FallAttackPointPos = "FallAttackPointPos",
    SwitchKawaiiDebug = "SwitchKawaiiDebug",
    HeadScale = "HeadScale",
    UpperArmScale = "UpperArmScale",
    LowerArmScale = "LowerArmScale",
    HandScale = "HandScale",
    Debug = "Debug",
    UpdateVLM = "UpdateVLM",
    GlobalTimeDilation = "GlobalTimeDilation",
    EnterDungeon = "EnterDungeon",
    ExitBattle = "ExitBattle",
    PlayerEnd = "PlayerEnd",
    InitGM = "InitGameMode",
    RequireAndEnterDS = "RequireAndEnterDS",
    ExitDS = "ExitDS",
    EnterLocalDS = "EnterLocalDS",
    EnterLocalDungeon = "EnterLocalDungeon",
    EnterNewDS = "EnterNewDS",
    DSLog = "DSLog",
    KickPlayer = "KickPlayer",
    KickSelf = "KickSelf",
    BlockEntrance = "BlockEntrance",
    UseMinimumLoad = "UseMinimumLoad",
    GameModeEnable = "GameModeEnable",
    DSC = "DedicatedServerCommand",
    DungeonDoubleCost = "DungeonDoubleCost",
    Tel = "Tel",
    FreezeWorldComposition = "FreezeWorldComposition",
    BreakableItemNavEnableInLower = "BreakableItemNavEnableInLower",
    Recovery = "RecoverySelf",
    RecoverPlayer = "RecoverPlayer",
    KM = "KillMonster",
    RTL = "ResetTrollyLoc",
    DMS = "DebugMonsterSpawn",
    DPMS = "DebugPrintMonsterSpawn",
    GAM = "GuideAllMonster",
    RSS = "RequestSnapShotInfo",
    RMC = "RequestMonsterCacheInfo",
    RSC = "RequestStaticCreatorInfo",
    NPCRotate = "NPCRotate",
    NPCRotate90 = "NPCRotate90",
    NPCTalkAgree = "NPCTalkAgree",
    NPCAgree = "NPCAgree",
    NPCTalk03 = "NPCTalk03",
    YXD = "YXDTEST",
    THY = "THYTEST",
    JTY = "JTYTEST",
    LJL = "LJLTEST",
    HTY = "HTYTEST",
    LHQ = "LHQTEST",
    LJH = "LJHTEST",
    DungeonEventTest = "DungeonEventTest",
    SwitchSurvivalValueChange = "SwitchSurvivalValueChange",
    PrintLevelDebugInfo = "PrintLevelDebugInfo",
    PrintPlayerInfoOnScreen = "PrintPlayerInfoOnScreen",
    PrintGameModeInfoOnScreen = "PrintGameModeInfoOnScreen",
    PrintGetCover = "PrintGetCover",
    PrintUpdateCover = "PrintUpdateCover",
    TrainingCreateMonster = "TrainingCreateMonster",
    TrainingSetMonsterAI = "TrainingSetMonsterAI",
    TrainingRemoveMonster = "TrainingRemoveMonster",
    TrainingClearCreateInfo = "TrainingClearCreateInfo",
    CNPCCache = "PrintCustomNPCCacheInfo",
    StartVote = "StartVote",
    SpawnPet = "SpawnPet",
    PostCustomEvent = "PostCustomEvent",
    SetFeinaStar = "SetFeinaStar",
    EnterAbyss = "EnterAbyss",
    EnterAbyssNew = "EnterAbyssNew",
    AbyssPassRoom = "AbyssPassRoom",
    padt = "PrintAllDailyTask",
    MonsterMaxHp = "MonsterMaxHp",
    HMC = "HideMonsterCapsule",
    HM = "HideMonster",
    ShowCapsule = "ShowCapsule",
    GetMonster = "GetMonster",
    StopAI = "StopAI",
    StartAI = "StartAI",
    MoveTo = "MoveTo",
    Target = "Target",
    TargetAll = "TargetAll",
    MoveDebug = "MoveDebug",
    PerMonsterDebug = "PerMonsterDebug",
    StopMonsterSkill = "StopMonsterSkill",
    BTTest = "BTTest",
    ChangeCL = "ChangeCrossLevel",
    DrawCL = "DrawCrossLevel",
    ReuseSkill = "ReuseSkill",
    SetMonsterCrouch = "SetMonsterCrouch",
    GetBlackboardValue = "GetBlackboardValue",
    MonsterTimeDilation = "MonsterTimeDilation",
    ControlAllMonsterBTTickEnable = "ControlAllMonsterBTTickEnable",
    TestTriggerAbyssOnEnd = "TestTriggerAbyssOnEnd",
    ForbidDamage = "ForbidDamage",
    ForbidPlay = "ForbidPlay",
    TestBattle = "TestBattle",
    NoDamage = "NoDamage",
    Attr = "GetOrSetPlayerAttr",
    WeaponAttr = "GetOrSetPlayerWeaponAttr",
    PinAttr = "PinAttr",
    MaxBullet = "MaxBullet",
    MaxMagazineBullet = "MaxMagazineBullet",
    MaxAttack = "MaxAttack",
    MaxDefence = "MaxDefence",
    MaxSp = "MaxSp",
    AddSp = "AddSp",
    MaxHp = "MaxHp",
    MaxTriggerProbability = "MaxTriggerProbability",
    SetNickname = "SetNickname",
    SetSex = "SetSex",
    AddHp = "AddHp",
    MaxES = "MaxES",
    AddES = "AddES",
    God = "God",
    DefCoreGod = "DefCoreGod",
    UnlimitFire = "UnlimitFire",
    GAW = "GetAllWeapons",
    GAC = "GetAllChars",
    IsCrit = "IsCrit",
    IsFloat = "IsFloat",
    CharacterTag = "CharacterTag",
    CalcAttrOpt = "CalcAttrOpt",
    AddMod = "AddMod",
    DebugMod = "DebugMod",
    TestEvent = "TestEvent",
    ShowDamageDetails = "ShowDamageDetails",
    DSShowDetails = "DSShowDetails",
    ShowRealAttr = "ShowRealAttr",
    StatDamage = "StatDamage",
    Buff = "Printbuff",
    BuffDebug = "BuffDebug",
    AddBuff = "AddBuff",
    RemoveBuff = "RemoveBuff",
    AddMonsterBuff = "AddMonsterBuff",
    AddMonsterBuffDuration = "AddMonsterBuffDuration",
    RemoveMonsterBuff = "RemoveMonsterBuff",
    AddGP = "AddGP",
    RemoveAllGP = "RemoveAllGP",
    PrintGP = "PrintGP",
    PrintMarks = "PrintMarks",
    MSPDT = "MonsterSpawnPointDistributeLogicTest",
    StartXibiBoss = "StartXibiBoss",
    UnlockHardBoss = "UnlockHardBoss",
    UnlockRegionTeleport = "UnlockRegionTeleport",
    UnlockRegionDelivery = "UnlockRegionDelivery",
    AddRougeLikeCurrency = "AddRougeLikeCurrency",
    GetRougeLikeCurrency = "GetRougeLikeCurrency",
    RGPassRoom = "RougeLikePassRoom",
    StartQuestChain = "StartQuestChain",
    SuccQuestChain = "SuccQuestChain",
    CleanQuestChain = "CleanQuestChain",
    CleanAllQuest = "CleanAllQuest",
    StartQuest = "StartQuest",
    SuccQuest = "SuccQuest",
    FailQuest = "FailQuest",
    IsQuestChainLock = "IsQuestChainLock",
    IsQuestChainUnlock = "IsQuestChainUnlock",
    ShowUseCountSkill = "ShowUseCountSkill",
    ShowCacheUseCountSkill = "ShowCacheUseCountSkill",
    SCRQ = "SkipCurrentRunningQuest",
    PrintCurrentTaskGuideInfo = "PrintCurrentTaskGuideInfo",
    SetTaskGuidePointDebugMode = "SetTaskGuidePointDebugMode",
    ChangeToNewModel = "ChangeToNewModel",
    bn = "GetOrSetRangedWeaponBulletNum",
    ChangeWeapon = "ChangeWeapon",
    rct = "RandomCreateTest",
    ChangeMod = "ChangeMod",
    TakeOffMod = "TakeOffMod",
    ChangeModSuit = "ChangeModSuit",
    ModLevelUp = "ModLevelUp",
    WLU = "WeaponLevelUp",
    WB = "WeaponBreak",
    CLU = "CharLevelUp",
    CGLU = "CharGradeLevelUp",
    CB = "CharBreak",
    SetDefaultWeapon = "SetDefaultWeapon",
    clearmonsterdes = "ClearFirstMonsterRecords",
    UnlockMonsterGallery = "UnlockMonsterGallery",
    clearmonguide = "ClearMonGuide",
    RL = "ResetLoc",
    CCCV = "ChangeCharCornerVisibility",
    UWGL = "UpWeaponGradeLevel",
    ChangeWeaponColor = "ChangeWeaponColor",
    CleanWeaponColor = "CleanWeaponColor",
    NOCD = "NoCDForSkill",
    UpdateMonCd = "UpdateMonCd",
    FireDanmaku = "FireDanmaku",
    PrintSkill = "PrintCurrentSkillID",
    PrintMonsterSkill = "PrintMonsterSkill",
    CTN = "CutToughnessValue",
    PlayLightHit = "PlayLightHit",
    PlayLightHitRanged = "PlayLightHitRanged",
    PlayHeavyHit = "PlayHeavyHit",
    PlayHitFly = "PlayHitFly",
    PlayHitFly_Force = "PlayHitFly_Force",
    TakeRecorderCapture = "TakeRecorderCapture",
    UseDungeonLevelBounds = "UseDungeonLevelBounds",
    EnemyVisionDebug = "EnemyVisionDebug",
    TargetLocDebug = "TargetLocDebug",
    TestStory = "TestStory",
    TestStory1 = "TestStory1",
    RunStory = "RunStoryline",
    StopStory = "StopStoryline",
    RunQuest = "RunQuest",
    SkipQuest = "SkipQuest",
    SuccessAllQuest = "SuccessAllQuest",
    PrintStorylineInfo = "PrintStorylineInfo",
    PrintStorylinesNeedRestartInfo = "PrintStorylinesNeedRestartInfo",
    RemoveAllImpression = "RemoveAllImpression",
    CIS = "CompleteImpressionSystem",
    PlayTalk = "PlayTalk",
    PT = "PlayTalk",
    ScanForDuplicatedTalk = "ScanForDuplicatedTalk",
    ST = "ScanForDuplicatedTalk",
    ForceSetStorySkipable = "ForceSetStorySkipable",
    NPCLookAtDebug = "ShowLookAtDebug",
    StartNPCLookAt = "StartLookAt",
    LookAtBySlerp = "LookAtBySlerp",
    TestSTLNode = "TestSTLNode",
    TIP = "TestImpression",
    FinishImpressionTalk = "FinishImpressionTalk",
    ImpressionCheckByEnumId = "ImpressionCheckByEnumId",
    ImpressionAddByEnumId = "ImpressionAddByEnumId",
    MAULookAt = "MAULookAt",
    QuitMAU = "QuitMAU",
    UseSkill = "UseSkill",
    Focus = "Focus",
    SetSpeed = "SetSpeed",
    CCSpeed = "ChangeCreatureSpeed",
    ShowSkillCreature = "ShowSkillCreature",
    ShowRayCreature = "ShowRayCreature",
    AnimCacheEnableState = "AnimCacheEnableState",
    GetDrop = "GetDrop",
    DS = "DisconnectServer",
    CS = "ConnectServer",
    LS = "ListenServer",
    NetMode = "NetMode",
    Re0 = "Reconnect",
    TestNetworkFailure = "TestNetworkFailure",
    TestCrash = "TestCrash",
    ForbidEntityMessage = "ForbidEntityMessage",
    smgi = "ShowOrHideMonsterGuideIcon",
    CMBS = "CreateMonstersBatches",
    ScanLevel = "ScanLevel",
    ShowPreloadFX = "ShowPreloadFX",
    DebugAchvUI = "DebugAchvUI",
    SpeedUp = "SpeedUp",
    EnableJetJump = "EnableJetJump",
    EnableJetRush = "EnableJetRush",
    EnableSplineMove = "EnableSplineMove",
    EnableSplatoonMove = "EnableSplatoonMove",
    PlayAllNiagaraArround = "PlayAllNiagaraArround",
    DestroyAllMonster = "DestroyAllMonster",
    DSVersion = "DSVersion",
    MGC = "ManualGC",
    sctime = "SetClientTime",
    EnableBuffMesh = "EnableBuffMesh",
    PSOP = "PSOPrepare",
    pcmv = "PrintCharModVolume",
    ChangeSpeed = "ChangeSpeed",
    SetWalk = "SetWalk",
    GetSceneSoundPause = "GetSceneSoundPause",
    SetBGMVolume = "SetBGMVolume",
    SetAudioListenerOpenDebug = "SetAudioListenerOpenDebug",
    SetEMPreviewMute = "SetEMPreviewMute",
    SetBGMOpenDebug = "SetBGMOpenDebug",
    PrintBGMInfo = "PrintBGMInfo",
    GetAllBusVolume = "GetAllBusVolume",
    GetAllBusPauseState = "GetAllBusPauseState",
    ReloadAllBank = "ReloadAllBank",
    SetDrawDebugEnabled = "SetDrawDebugEnabled",
    SetSoundPointCompDebugEnabled = "SetSoundPointCompDebugEnabled",
    SetSoundSplineDrawDebug = "SetSoundSplineDrawDebug",
    ShowCacheSe = "ShowCachedFMODEventAndFrequency",
    SetReverbDebug = "SetReverLogicOpenbDebug",
    PrintHeadPhonePlugIn = "PrintHeadPhonePlugIn",
    SetAudioManagerTestRegionId = "SetAudioManagerTestRegionId",
    SimulateBGMEnterNewRegion = "SimulateBGMEnterNewRegion",
    SetLineSoundDebug = "SetLineSoundDebug",
    SectorSoundDebug = "SectorSoundDebug",
    CircularSoundDebug = "CircularSoundDebug",
    PrintEventsMap = "PrintEventsMap",
    MechanismStateDebug = "MechanismStateDebug",
    StartSpecialQuest = "StartSpecialQuest",
    SuccessSpecialQuest = "SuccessSpecialQuest",
    FailerSpecialQuest = "FailerSpecialQuest",
    PrintDynamicEventInfo = "PrintDynamicEventInfo",
    ForceStartDynQuest = "ForceStartDynQuest",
    CADC = "CompleteAllDispatchCondion",
    ChangeToMaster = "ChangeToMaster",
    ChangeBackToHero = "ChangeBackToHero",
    ActiveExplores = "ActiveExploreStaticCreator",
    TestRealtimeContentValidate = "TestRealtimeContentValidate",
    TestUploadChat = "TestUploadChat",
    TestUploadReport = "TestUploadReport",
    TestUploadBanLog = "TestUploadBanLog",
    TestDrawGacha = "TestDrawGacha",
    ShowGachaParams = "ShowGachaParams",
    GachaSelfSelect = "GachaSelfSelect",
    TestDrawSkinGacha = "TestDrawSkinGacha",
    FSG = "FinishSystemGuide",
    PSI = "PurchaseShopItem",
    SPSUI = "ShowPurchaseShopUI",
    UnLoadChangeUI = "UnLoadChangeUI",
    SBP = "StartBlueProduct",
    CBP = "CompleteBlueProduct",
    CTime = "ShowClientTime",
    STime = "ShowServerTime",
    StartBattle = "StartBattle",
    LoadSmallObj = "LoadSmallObjects",
    SetPlayerDilation = "SetPlayerDilation",
    Mem = "Mem",
    CleanLuaTable = "CleanLuaTable",
    ShowAvatarStatus = "ShowAvatarStatus",
    CheckCondition = "CheckCondition",
    ServerCheckCondition = "ServerCheckCondition",
    StatMonster = "StatMonster",
    StatMonsterMem = "StatMonsterMem",
    StatFX = "StatFX",
    StatLevel = "StatLevel",
    StatRecordLevel = "StatRecordLevel",
    GenerateStripMesh = "GenerateStripMesh",
    UWAUpLoad = "UWAUpLoad",
    PreviewPopup = "PreviewPopup",
    ShowPopup = "ShowPopup",
    ShowRecoverUI = "ShowRecoverUI",
    TestGetCharWeapon = "TestGetCharWeapon",
    DisableCheckBox = "DisableCheckBox",
    EnableCheckBox = "EnableCheckBox",
    TouchSpeedPitch = "TouchSpeedPitch",
    TouchSpeedYaw = "TouchSpeedYaw",
    TouchLimitPitch = "TouchLimitPitch",
    TouchLimitYaw = "TouchLimitYaw",
    SetInvincible = "SetInvincible",
    ClearPhantoms = "ClearPhantoms",
    KillAllPhantoms = "KillAllPhantoms",
    CompleteCondition = "CompleteCondition",
    CompleteSystemCondition = "CompleteSystemCondition",
    ShowSystemUnlock = "ShowSystemUnlock",
    FakeUIUnlockConditionComplete = "FakeUIUnlockConditionComplete",
    MockAllSystemCondition = "MockAllSystemCondition",
    MockSystemCondition = "MockSystemCondition",
    UnLockAllDungeonSelectLevels = "UnLockAllDungeonSelectLevels",
    UnLockAllDungeonLevels = "UnLockAllDungeonLevels",
    PlaySequence = "PlaySequence",
    FSMDebug = "FSMDebug",
    SystemGuideSwitch = "SystemGuideSwitch",
    SuccessAllSystemGuide = "SuccessAllSystemGuide",
    SwitchCullModifier = "SwitchCullModifier",
    I18Time = "I18Time",
    GBFS = "GuideBookFinishSomething",
    EchoAvatar = "EchoAvatar",
    PrintGuideBook = "PrintGuideBook",
    GuideBookGetReward = "GuideBookGetReward",
    ResetEMCache = "ResetEMCache",
    TestWarningToast = "TestWarningToast",
    StartAutoTest = "StartAutoTest",
    ABTS = "AutoBattleTestServer",
    ABTC = "AutoBattleTestClient",
    StopABT = "StopAutoBattleTest",
    ChangeBuffLastTime = "ChangeBuffLastTime",
    ReduceBuffLayer = "ReduceBuffLayer",
    TestTrackingQuest = "TestTrackingQuest",
    EnterRougeLike = "EnterRougeLike",
    UpgradeAward = "UpgradeAward",
    RogueShopTest = "RogueShopTest",
    RougeDetailsTest = "RougeDetailsTest",
    ShowRougeManual = "ShowRougeManual",
    ShowGetItemsTip = "ShowGetItemsTip",
    ShowUpgradeTip = "ShowUpgradeTip",
    DisableBattleWheel = "DisableBattleWheel",
    EnableBattleWheel = "EnableBattleWheel",
    FillBattleWheel = "FillBattleWheel",
    PrintBattleWheel = "PrintBattleWheel",
    AddPet = "AddPet",
    RemovePet = "RemovePet",
    AddPetAffix = "AddPetAffix",
    RemovePetAffix = "RemovePetAffix",
    PrintPlayers = "PrintPlayers",
    PrintTeammates = "PrintTeammates",
    ShowCountdownToast = "ShowCountdownToast",
    AddCountdownTime = "AddCountdownTime",
    EnableChatCheck = "EnableChatCheck",
    ChatToOtherPlayer = "ChatToOtherPlayer",
    ForceUseSkill = "ForceUseSkill",
    ShowHudReward = "ShowHudReward",
    CInitTeamTest = "CInitTeamTest",
    CAddTeammateTest = "CAddTeammateTest",
    CDelTeammateTest = "CDelTeammateTest",
    CTeamInviteTest = "CTeamInviteTest",
    CTestTeamBloodBar = "CTestTeamBloodBar",
    CTestDelBloodBar = "CTestDelBloodBar",
    FXTest = "FXPriorityTest",
    FXTestChar = "FXPriorityTest_Char",
    FXTestOne = "FXPriorityTest_One",
    PrintAllFXPath = "PrintAllFXPath",
    ClearFXTest = "ClearFXTest",
    LevelFXTest = "LevelFXTest",
    PrintAllAssetPath = "PrintAllAssetPath",
    PrintAllPreloadCacheInfo = "PrintAllPreloadCacheInfo",
    UseDebug = "UseDebug",
    obj = "obj",
    PUA = "PlayUMGAnimation",
    UAT = "UMGAnimationsTime",
    cdk = "GMUseCDK",
    EMPWA = "EMPlayWidgetAnimation",
    HideAllUI = "HideAllUI",
    UseMobileUnitBudget = "UseMobileUnitBudget",
    DebugTickUnitBudget = "DebugTickUnitBudget",
    OpenMonsterDebug = "OpenMonsterDebug",
    EnableSkillPrediction = "EnableSkillPrediction",
    ForceSimPredictionFailed = "ForceSimPredictionFailed",
    PrintPredictionDebugInfo = "PrintPredictionDebugInfo",
    CrashTest = "CrashTest",
    SetGamepad = "SetGamepad",
    History = "PrintBattleHistory",
    TractedMonsterToPlayer = "TractedMonsterToPlayer",
    TestTractedPlayer = "TestTractedPlayer",
    SkipAngling = "SkipAngling",
    SSRPlaySequence = "SSRPlaySequence",
    NewDeputeTest = "NewDeputeTest",
    DetectiveMinigame = "DetectiveMinigame",
    StartFlow = "StartFlow",
    StopFlow = "StopFlow",
    OpenWalnutRewardDialog = "OpenWalnutRewardDialog",
    CreateSquad = "CreateSquad",
    QuitGame = "QuitGame",
    SyncTest = "SyncTest",
    GM_SkipMonthCardPay = "GM_SkipMonthCardPay",
    GetWorldRegionEidByCreatorId = "GetWorldRegionEidByCreatorId",
    GetWorldRegionEidByManualItemId = "GetWorldRegionEidByManualItemId",
    GetWorldRegionEidByRandomRuleId = "GetWorldRegionEidByRandomRuleId",
    ShowUI = "ShowUI",
    EnablePropEffect = "EnablePropEffect",
    ShowSequenceTime = "ShowSequenceTime",
    CommonActivitySettlement = "CommonActivitySettlement",
    EnterPaotai = "EnterPaotai",
    PrintLevelbound = "PrintLevelbound",
    ShowScenarioPerformanceData = "ShowScenarioPerformanceData",
    ShowScenarioDataOnTick = "ShowScenarioDataOnTick",
    ShowBattleError = "ShowBattleError",
    ShowUIError = "ShowUIError",
    ShowPersonalInfoPage = "ShowPersonalInfoPage",
    VerifyArrayTest = "VerifyArrayTest",
    FloatVerifyArrayTest = "FloatVerifyArrayTest",
    EnableRegionPlayerRandomRoleId = "EnableRegionPlayerRandomRoleId",
    EnableRegionPlayerOnlyShowHeadUI = "EnableRegionPlayerOnlyShowHeadUI",
    NPCSubSystemOnline = "NPCSubSystemOnline",
    ShowGlobalVersion = "ShowGlobalVersion",
    HideGlobalVersion = "HideGlobalVersion"
  }
end

function GM_Command:GMUseCDK(CDK)
  local Avatar = self:GetClientAvatar()
  Avatar:UseCDK(CDK)
end

function GM_Command:ShowScenarioDataOnTick()
  local GameInstance = GWorld.GameInstance
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  UE4.UKismetSystemLibrary.ExecuteConsoleCommand(Player, "stat unit", nil)
  UE4.UKismetSystemLibrary.ExecuteConsoleCommand(Player, "DumpMeshLODData", nil)
  if Player:IsExistTimer("DataOnTick") then
    Player:RemoveTimer("DataOnTick")
    URuntimeCommonFunctionLibrary.RemoveOnScreenDebugMessage(28)
  else
    Player:AddTimer(0.5, self.ShowScenarioPerformanceData, true, 0.1, "DataOnTick", true)
    self:ShowScenarioPerformanceData()
  end
end

function GM_Command:ShowScenarioPerformanceData()
  local GameInstance = GWorld.GameInstance
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local LODDataArr = URuntimeCommonFunctionLibrary.GetStaticMeshTrianglesTopTen(Player:GetWorld()):ToTable()
  local BigSpace = string.rep(" ", 100)
  local SmallSpace = string.rep(" ", 10)
  local Message = "" .. BigSpace
  for Index, StaticMeshLODData in ipairs(LODDataArr) do
    Message = Message .. "StaticMeshName: " .. StaticMeshLODData.ActorName .. SmallSpace .. "StaticMeshNum: " .. StaticMeshLODData.ActorNum
    Message = Message .. "\n" .. BigSpace
    for i = 1, StaticMeshLODData.LODNum do
      if StaticMeshLODData.CurLODIndex and StaticMeshLODData.CurLODIndex >= 0 and StaticMeshLODData.CurLODIndex + 1 == i then
        Message = Message .. "->->-> LOD" .. i - 1 .. "(Triangles: " .. StaticMeshLODData.NumTriangles[i] / StaticMeshLODData.ActorNum .. ", Vertices: " .. StaticMeshLODData.NumVertices[i] / StaticMeshLODData.ActorNum .. ")" .. "<-<-<-" .. SmallSpace
      else
        Message = Message .. " LOD" .. i - 1 .. "(Triangles: " .. StaticMeshLODData.NumTriangles[i] / StaticMeshLODData.ActorNum .. ", Vertices: " .. StaticMeshLODData.NumVertices[i] / StaticMeshLODData.ActorNum .. ")" .. SmallSpace
      end
    end
    Message = Message .. [[


]] .. BigSpace
  end
  URuntimeCommonFunctionLibrary.AddOnScreenDebugMessage(28, 3600, FColor(255, 255, 255), Message, false, FVector2D(1, 1))
end

function GM_Command:UseDebug(bOn)
  if nil == bOn then
    bOn = "1"
  end
  local LuaPanda = require("LuaPanda")
  if "1" == bOn then
    LuaPanda.reGetSock()
    LuaPanda.start()
  else
    LuaPanda.stopAttach()
  end
end

function GM_Command:CTestDelBloodBar(Eid)
  local UIMgr = UIManager(self:GetGameInstance())
  Eid = tonumber(Eid)
  local BattleView = UIMgr:GetUIObj("BattleMain")
  BattleView.VB_PlayerBar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  BattleView:RemoveBattleTeamBloodBar(Eid)
end

function GM_Command:CTestTeamBloodBar(Eid)
  Eid = tonumber(Eid)
  local UIMgr = UIManager(self:GetGameInstance())
  local BattleView = UIMgr:GetUIObj("BattleMain")
  BattleView.VB_PlayerBar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  BattleView:AddBattleTeamBloodBar(Eid, true, true)
end

function GM_Command:CTeamInviteTest()
  local InviteInfo = {
    Uid = 23333,
    HeadIconId = TeamController:GetAvatar().HeadIconId,
    IsOnline = true,
    Nickname = "test2",
    Level = 3
  }
  TeamController:RecvTeamBeInvited(InviteInfo)
end

function GM_Command:CInitTeamTest()
  local FakeTeam = {
    TeamId = 2,
    LeaderId = TeamController:GetAvatar().Uid,
    Hostnum = 101,
    Members = {
      {
        Uid = 23333,
        HeadIconId = TeamController:GetAvatar().HeadIconId,
        IsOnline = true,
        Nickname = "test2"
      },
      TeamController:GetAvatar(),
      {
        Uid = 23335,
        HeadIconId = TeamController:GetAvatar().HeadIconId,
        IsOnline = true,
        Nickname = "test2"
      },
      {
        Uid = 23336,
        HeadIconId = TeamController:GetAvatar().HeadIconId,
        IsOnline = true,
        Nickname = "test2"
      }
    }
  }
  TeamController:RecvTeamOnInit(FakeTeam)
end

function GM_Command:CAddTeammateTest(Uid)
  local FakeMember = {
    Uid = tonumber(Uid),
    HeadIconId = TeamController:GetAvatar().HeadIconId,
    IsOnline = true,
    Nickname = "test2"
  }
  TeamController:RecvTeamOnAddPlayer(FakeMember)
end

function GM_Command:CDelTeammateTest(Uid)
  if "0" ~= Uid then
    TeamController:RecvTeamOnDelPlayer(tonumber(Uid), CommonConst.LeaveTeamReason.Willing)
  else
    TeamController:RecvTeamOnDelPlayer(23333, CommonConst.LeaveTeamReason.Willing)
    local FakeMember = {
      Uid = 23336,
      HeadIconId = TeamController:GetAvatar().HeadIconId,
      IsOnline = true,
      Nickname = "test2"
    }
    TeamController:RecvTeamOnAddPlayer(FakeMember)
    TeamController:RecvTeamOnDelPlayer(23335, CommonConst.LeaveTeamReason.Willing)
    FakeMember = {
      Uid = 23337,
      HeadIconId = TeamController:GetAvatar().HeadIconId,
      IsOnline = true,
      Nickname = "test2"
    }
    TeamController:RecvTeamOnAddPlayer(FakeMember)
    FakeMember = {
      Uid = 23338,
      HeadIconId = TeamController:GetAvatar().HeadIconId,
      IsOnline = true,
      Nickname = "test2",
      TeamController:RecvTeamOnAddPlayer(FakeMember)
    }
  end
end

function GM_Command:EnableChatCheck(bOn)
  bOn = tonumber(bOn)
  ChatCommon.IgnoreSensitiveCheck = 0 == bOn
end

function GM_Command:ChatToOtherPlayer(Uid, Count, Content)
  Count = Count or 60
  for i = 1, tonumber(Count) do
    Content = Content or "2333"
    GWorld:GetAvatar():ChatToPlayer(tonumber(Uid), Content .. i)
  end
end

function GM_Command:ResetEMCache()
  local EMCache = require("EMCache.EMCache")
  EMCache:Reset()
end

function GM_Command:ExecuteGM(WorldContextObject, FunctionName, Args, IsClient, IsDedicatedServer)
  if IsDedicatedServer then
    self:DedicatedServerGM(WorldContextObject, FunctionName, Args)
  elseif IsClient then
    self:ClientGM(WorldContextObject, FunctionName, Args)
  else
    self:ServerGM(FunctionName, Args)
  end
end

function GM_Command:DedicatedServerGM(WorldContextObject, FunctionName, Args)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(WorldContextObject)
  assert(GameInstance, "\230\137\190\228\184\141\229\136\176GameInstance")
  self.Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local _Battle = Battle(self.Player)
  assert(_Battle, "\230\178\161\230\137\190\229\136\176Battle")
  assert(not IsStandAlone(self.Player), "\228\184\141\232\131\189\229\156\168\229\141\149\230\156\186\230\131\133\229\134\181\228\184\139\228\189\191\231\148\168DSGM")
  local EffectResults = require("BluePrints.Combat.BattleLogic.EffectResults")
  local Result = EffectResults.Result()
  Result:Add(FunctionName, Args)
  Result = Result:ToEffectStruct()
  self.Player:GMServerBattleCommand(Result)
end

function GM_Command:ClientGM(WorldContextObject, FunctionName, Args)
  local function SplitArgs(_Args)
    if type(_Args) == "string" then
      local ReturnArgs = {}
      
      for Arg in string.gmatch(_Args, "%S+") do
        table.insert(ReturnArgs, Arg)
      end
      return ReturnArgs
    end
    return _Args
  end
  
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(WorldContextObject) or GWorld.GameInstance
  assert(GameInstance, "\230\137\190\228\184\141\229\136\176GameInstance")
  self.Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local Result
  local GMIntegrationData = DataMgr.GMIntegration[FunctionName]
  if GMIntegrationData then
    for _, Command in pairs(GMIntegrationData.GMCommands) do
      UE4.UKismetSystemLibrary.ExecuteConsoleCommand(GameInstance, Command)
    end
  else
    local RealFunctionName = self.Commands[string.upper(FunctionName)]
    if RealFunctionName then
      local Func = self[RealFunctionName]
      assert(Func, "\233\148\153\232\175\175\231\154\132\229\135\189\230\149\176\229\144\141:" .. RealFunctionName)
      FunctionName = RealFunctionName
      if Args then
        FunctionName = FunctionName .. " " .. tostring(Args)
      end
      Result = Func(self, table.unpack(SplitArgs(Args)))
    else
      if Args then
        FunctionName = FunctionName .. " " .. Args
      end
      local LocalFunctionStr = [[
                local A = self.Avatar
                local P = self.Player
                local W = self.Player:GetCurrentWeapon()
                local B = Battle(self.Player)
                local GameMode = UE4.UGameplayStatics.GetGameMode(P)
                local GameState = UE4.UGameplayStatics.GetGameState(P)
                local GameInstance = UE4.UGameplayStatics.GetGameInstance(P)
                local UIManager = GameInstance:GetGameUIManager()
                local E = function(eid)
                    return B:GetEntity(eid)
                end
                local ObjectId = function (obj_str)
                    return CommonUtils.Str2ObjId("ObjectId(\""..obj_str.."\")")
                end
            ]]
      local ExecStr = "return function(self) " .. LocalFunctionStr .. "return " .. FunctionName .. " end"
      local Func = load(ExecStr)
      if not Func then
        ExecStr = "return function(self) " .. LocalFunctionStr .. FunctionName .. " end"
        Func = load(ExecStr)
      end
      assert(Func, "\233\148\153\232\175\175\231\154\132\228\187\163\231\160\129:" .. ExecStr)
      local RealFunc = Func()
      Result = RealFunc(self)
    end
  end
  if nil == Result then
    Result = "nil"
  end
  PrintTable({FunctionName = FunctionName, Result = Result}, 1, "GM\230\140\135\228\187\164\230\137\167\232\161\140\231\187\147\230\158\156")
end

function GM_Command:ServerGM(FunctionName, Args)
  DebugPrint(string.format("ServerGM, %s, %s", FunctionName, Args))
  local args = {}
  for arg in string.gmatch(Args, "%S+") do
    table.insert(args, arg)
  end
  self:Server_Command(FunctionName, args)
end

function GM_Command:ServerBattleCommand(FunctionName, ...)
  local battle = Battle(self.Player)
  assert(battle, "\230\178\161\230\137\190\229\136\176battle")
  local func = battle["GM_" .. FunctionName]
  assert(func, "\230\178\161\230\137\190\229\136\176\229\135\189\230\149\176:GM_" .. FunctionName)
  local Args = (...)
  if type(Args) ~= "table" then
    Args = {
      ...
    }
  end
  if IsStandAlone(self.Player) then
    func(battle, table.unpack(Args))
    return
  end
  local EffectResults = require("BluePrints.Combat.BattleLogic.EffectResults")
  local Result = EffectResults.Result()
  Result:Add(FunctionName, Args)
  Result = Result:ToEffectStruct()
  self.Player:GMServerBattleCommand(Result)
end

function GM_Command:DedicatedServerCommand(Func, ...)
  local MyPlayerController = UE4.UGameplayStatics.GetPlayerController(self:GetGameInstance(), 0)
  assert(MyPlayerController, "\233\157\158\230\179\149PlayerController")
  local func = MyPlayerController["GM_" .. Func]
  assert(func, "\230\178\161\230\137\190\229\136\176\229\135\189\230\149\176:GM_" .. Func)
  local Args = {
    ...
  }
  local msgpack = require("msgpack_core")
  local ArgsStr = msgpack.pack(Args)
  local ArgsMessage = FMessage()
  ArgsMessage:SetBytes(ArgsStr, #ArgsStr)
  if IsStandAlone(self.Player) then
    func(MyPlayerController, ArgsMessage)
    return
  end
  MyPlayerController:GMDedicatedServerCommand(Func, ArgsMessage)
end

function GM_Command:Server_Command(FunctionName, Args)
  local Avatar = self:GetClientAvatar()
  if nil == Avatar then
    ScreenPrint("can not find avatar")
    return
  end
  
  local function callback(Ret, ...)
    DebugPrint("ServerGM Callback", FunctionName, Ret)
    local t = {
      ...
    }
    DebugPrintTable(t, 5)
    if Ret == ErrorCode.RET_FAIL then
      return
    end
    if "scl" == FunctionName then
      self:ClientGM("attr", "Level " .. table.unpack(Args))
    end
    EventManager:FireEvent(EventID.ServerGMSucceed, FunctionName)
  end
  
  Avatar:CallServer("DoGmCommand", callback, FunctionName, table.unpack(Args))
end

function GM_Command:ReloadAll(...)
  UUnLuaFunctionLibrary.HotReload()
end

function GM_Command:Hotfix(...)
  local HotfixData = require("Datas.HotfixData")
  assert(HotfixData.index, "\233\156\128\232\166\129\229\161\171\229\134\153HotfixData.index")
  assert(HotfixData.script, "\233\156\128\232\166\129\229\161\171\229\134\153HotfixData.script")
  local UnLuaHotReload = require("UnLuaHotReload")
  require("HotFix").ExecHotFix(HotfixData.index, HotfixData.script)
  GWorld.HotfixDataIndex = HotfixData.index
  self:ServerBattleCommand("Hotfix")
end

function GM_Command:GetAvatar(...)
  local Args = {
    ...
  }
  local length = #Args
  local avatar = self:GetClientAvatar()
  if not avatar then
    return
  end
  local client_attr = avatar:GetClientAttrs()
  local result = client_attr
  if length > 0 then
    for i = 1, length do
      result = result[Args[i]]
    end
  end
  PrintTable({result = result}, 10)
end

function GM_Command:GetServerAvatar(...)
  local avatar = self:GetClientAvatar()
  if not avatar then
    return
  end
  avatar:GetServerAvatar(...)
end

function GM_Command:LowQuality()
  local GameInstance = self:GetGameInstance()
  assert(GameInstance, "\230\137\190\228\184\141\229\136\176GameInstance")
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local Controller = Player:GetController()
  Controller:ShowFlags("DynamicShadows", false)
  Controller:ShowFlags("VolumetricFog", false)
  Controller:ShowFlags("PointLights", false)
  Controller:ShowFlags("InstancedFoliage", false)
  Controller:ShowFlags("InstancedGrass", false)
  Player.CharacterFashion:HideHairCapture()
end

function GM_Command:ShowFlag(Name, bShow)
  local GameInstance = self:GetGameInstance()
  assert(GameInstance, "\230\137\190\228\184\141\229\136\176GameInstance")
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local Controller = Player:GetController()
  if "1" == bShow then
    Controller:ShowFlags(Name, true)
  elseif "0" == bShow then
    Controller:ShowFlags(Name, false)
  end
end

function GM_Command:QualityLevel(Level)
  local GameInstance = self:GetGameInstance()
  UEMGameInstance.SetOverallScalabilityLevel(Level and tonumber(Level) or -1)
  Const.ScalabilityUpdateTime = Const.ScalabilityUpdateTime + 1
end

function GM_Command:OpenUI(UIName, ...)
  local GameInstance = self:GetGameInstance()
  local UIManager = GameInstance:GetGameUIManager()
  local SystemUIConfig = DataMgr.SystemUI[UIName]
  if nil ~= SystemUIConfig then
    return UIManager:LoadUINew(UIName, ...)
  end
  local UIConfig = UIConst.AllUIConfig[UIName]
  if nil == UIConfig then
    ScreenPrint(string.format("Not find UIConfig Which Name is %s", UIName))
    return
  end
  return UIManager:LoadUI(UIConfig.resource, UIName, UIConfig.zorder)
end

function GM_Command:HideUI(UIName, IsShow, HideTag)
  local GameInstance = self:GetGameInstance()
  local UIManager = GameInstance:GetGameUIManager()
  local UIWidget = UIManager:GetUIObj(UIName, true)
  if nil == UIWidget then
    ScreenPrint(string.format("Not find UIWidget Which Name is %s", UIName))
    return
  end
  if "1" == IsShow then
    if type(UIWidget.Show) == "function" then
      UIWidget:Show(HideTag)
    else
      UIWidget:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  elseif "function" == type(UIWidget.Hide) then
    UIWidget:Hide(HideTag)
  else
    UIWidget:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function GM_Command:CloseUI(UIName)
  local GameInstance = self:GetGameInstance()
  local UIManager = GameInstance:GetGameUIManager()
  local UIWidget = UIManager:GetUIObj(UIName)
  if nil == UIWidget then
    ScreenPrint(string.format("Not find UIWidget Which Name is %s", UIName))
    return
  end
  if type(UIWidget.Close) == "function" then
    UIWidget:Close()
  end
end

function GM_Command:ShowGuideUI(GuideId)
  local GameInstance = self:GetGameInstance()
  UE4.UUIStateAsyncActionBase.ShowGuideUI(GameInstance, tonumber(GuideId))
end

function GM_Command:CreateNpc(UnitId, Num, Level)
  self:ServerBattleCommand("CreateNpc", UnitId, Num, Level, "StaticCreator")
end

function GM_Command:CreatePet(UnitId, Num, Level)
  self:ServerBattleCommand("CreatePet", UnitId, Num, Level, "StaticCreator")
end

function GM_Command:CreateMonster(UnitId, Num, Level)
  self:ServerBattleCommand("CreateMonster", self.Player.Eid, UnitId, Num, Level, "StaticCreator")
end

function GM_Command:CreateMonsterSpawnMonster(UnitId, Num, Level)
  self:ServerBattleCommand("CreateMonster", self.Player.Eid, UnitId, Num, Level, "MonsterSpawn")
end

function GM_Command:CreateTestMonster(UnitId, Num)
  self:ServerBattleCommand("CreateTestMonster", self.Player.Eid, UnitId, Num)
end

function GM_Command:GuideBookFinishSomething(Type, Id)
  local Avatar = GWorld:GetAvatar()
  print(_G.LogTag, "GMGuideBookFinishSomething", Type, Id)
  if tonumber(Id) ~= nil then
    Id = tonumber(Id)
  end
  Avatar:GuideBookFinishSomething(Type, Id)
end

function GM_Command:EchoAvatar(Index)
  local Avatar = GWorld:GetAvatar()
  Avatar:EchoAvatar(Index)
end

function GM_Command:CreatePhantom(RoleId, Num, BTIndex, Level, SkillPhantomLevel, SkillPhantomGrade, SkipInitWaitCheck)
  if not RoleId or 0 == RoleId then
    RoleId = self.Player.CurrentRoleId
  end
  if SkipInitWaitCheck and "0" == SkipInitWaitCheck then
    SkipInitWaitCheck = false
  else
    SkipInitWaitCheck = true
  end
  if not SkillPhantomLevel or not SkillPhantomGrade then
    self:ServerBattleCommand("CreatePhantom", self.Player.Eid, RoleId, Num, BTIndex, Level, false, false)
    return
  else
    Const.DefaultPhantomSkillLevel = tonumber(SkillPhantomLevel)
    Const.DefaultPhantomSkillGrade = tonumber(SkillPhantomGrade)
    self:ServerBattleCommand("CreatePhantom", self.Player.Eid, RoleId, Num, BTIndex, Level, SkipInitWaitCheck, SkipInitWaitCheck)
  end
  Const.DefaultPhantomSkillLevel = 1
  Const.DefaultPhantomSkillGrade = 0
end

function GM_Command:ClearPhantoms()
  local Avatar = GWorld:GetAvatar()
  self:ServerBattleCommand("ClearPhantoms", self.Player.Eid)
end

function GM_Command:KillAllPhantoms()
  self:ServerBattleCommand("KillAllPhantoms")
end

function GM_Command:CreateMechanismSummon(UnitId, Num)
  if not UnitId or 0 == UnitId then
    ScreenPrint(string.format("CreateMechanismSummon Error,UnitId:%s", tostring(UnitId)))
    return
  end
  self:ServerBattleCommand("CreateMechanismSummon", self.Player.Eid, UnitId, Num)
end

function GM_Command:KillMonster(Eid)
  self:ServerBattleCommand("KillMonster", self.Player.Eid, Eid)
end

function GM_Command:RecoverySelf()
  self:ServerBattleCommand("RecoverySelf", self.Player.Eid)
end

function GM_Command:RecoverPlayer(TargetEid, IsBegin, OverrideSpeed)
  self:ServerBattleCommand("RecoverPlayer", self.Player.Eid, TargetEid, IsBegin, OverrideSpeed)
end

function GM_Command:HideMonsterCapsule(IsEnable)
  local NewHidden = false
  if nil ~= IsEnable and string.lower(IsEnable) == "true" then
    NewHidden = true
  end
  local Entities = Battle(self.Player):GetAllEntities()
  for eid, ent in pairs(Entities) do
    if ent and ent.IsMonster and ent:IsMonster() then
      ent.CapsuleComponent:SetHiddenInGame(NewHidden, false)
    end
  end
  ScreenPrint(string.format("HideMonsterCapsule %s", NewHidden))
end

function GM_Command:HideMonster(IsEnable)
  local NewHidden = false
  if nil ~= IsEnable and string.lower(IsEnable) == "true" then
    NewHidden = true
  end
  local Entities = Battle(self.Player):GetAllEntities()
  for eid, ent in pairs(Entities) do
    if ent and ent.IsMonster and ent:IsMonster() then
      ent:SetActorHideTag("GMHideMonster", NewHidden)
    end
  end
end

function GM_Command:StartQuestChain(QuestChainId)
  if not QuestChainId then
    ScreenPrint(string.format("QuestChainId %s is invalid", QuestChainId))
    return
  end
  QuestChainId = tonumber(QuestChainId)
  local avatar = GWorld:GetAvatar()
  if avatar then
    avatar:GMStartQuestChain(QuestChainId)
  end
end

function GM_Command:FallAttackPoint(ActorName)
  local GameInstance = self:GetGameInstance()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local FallAttackObject = PlayerCharacter:GetOrAddFallAttackObject()
  if nil == ActorName then
    FallAttackObject.bFallAttackPoint = false
    FallAttackObject.FallAttackPoint = FVector(0, 0, 0)
    ScreenPrint(string.format("FallAttackPoint is closed"))
    return
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self.Player)
  local TargetPoint = GameState:GetTargetPoint(ActorName)
  if not TargetPoint then
    ScreenPrint(string.format("FallAttackPoint Setting Failed", ActorName))
    return
  end
  if TargetPoint.IsActive then
    FallAttackObject.bFallAttackPoint = true
    FallAttackObject.FallAttackPoint = TargetPoint:K2_GetActorLocation()
    print("FallAttackPoint is open at", FallAttackObject.FallAttackPoint)
  end
end

function GM_Command:SwitchKawaiiDebug(Enabled)
  if not self.Player then
    return
  end
  if not self.Player.PlayerAnimInstance then
    return
  end
  Enabled = tonumber(Enabled)
  Enabled = 1 == Enabled
  self.Player.PlayerAnimInstance.ArtDebugSwitch = Enabled
end

function GM_Command:FallAttackPointPos(X, Y, Z)
  local GameInstance = self:GetGameInstance()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local FallAttackObject = PlayerCharacter:GetOrAddFallAttackObject()
  if nil == X and nil == Y and nil == Z then
    FallAttackObject.bFallAttackPoint = false
    FallAttackObject.FallAttackPoint = FVector(0, 0, 0)
    ScreenPrint(string.format("FallAttackPoint is closed"))
    return
  end
  if nil == Y then
    Y = "0"
  end
  if nil == Z then
    Z = "0"
  end
  print("FallAttackPoint is open at", X, Y, Z)
  X = tonumber(X)
  Y = tonumber(Y)
  Z = tonumber(Z)
  FallAttackObject.bFallAttackPoint = true
  FallAttackObject.FallAttackPoint = FVector(X, Y, Z)
  print("FallAttackPoint is open at", FallAttackObject.FallAttackPoint)
end

function GM_Command:SuccQuestChain(QuestChainId)
  if not QuestChainId then
    ScreenPrint(string.format("QuestChainId %s is invalid", QuestChainId))
    return
  end
  QuestChainId = tonumber(QuestChainId)
  local avatar = GWorld:GetAvatar()
  if avatar then
    avatar:GMSuccQuestChain(QuestChainId)
  end
  self:StopStoryline(QuestChainId)
end

function GM_Command:CleanQuestChain(QuestChainId)
  if not QuestChainId then
    return
  end
  QuestChainId = tonumber(QuestChainId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:GMCleanQuestChain(QuestChainId)
  end
  self:StopStoryline(QuestChainId)
end

function GM_Command:CleanAllQuest()
  local avatar = GWorld:GetAvatar()
  avatar:GMCleanAllQuest()
end

function GM_Command:ChangeToNewModel(RoleId)
  if not RoleId then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    ScreenPrint("\232\191\158\230\142\165\230\156\141\229\138\161\229\153\168\230\131\133\229\134\181\228\184\139\239\188\140\232\175\183\229\156\168\229\134\155\230\162\176\229\186\147\230\155\180\230\141\162\232\167\146\232\137\178")
    return
  end
  RoleId = tonumber(RoleId)
  if self.Player.ChangeRole then
    self.Player:ChangeRole(RoleId)
  end
end

function GM_Command:ChangeWeapon(WeaponId)
  if not WeaponId then
    ScreenPrint("\233\156\128\232\166\129\228\188\160\229\133\165\230\173\166\229\153\168\231\188\150\229\143\183\230\137\141\229\143\175\228\187\165\232\191\155\232\161\140\230\173\166\229\153\168\230\155\180\230\141\162\229\147\166~")
    return
  end
  if self.Player then
    self.Player:ChangeToNewWeapon(tonumber(WeaponId))
    EventManager:FireEvent(EventID.OnSwitchWeapon)
  end
end

function GM_Command:GetOrSetRangedWeaponBulletNum(BulletNum)
  if nil == BulletNum then
    ScreenPrint(string.format("\229\189\147\229\137\141\232\191\156\231\168\139\230\173\166\229\153\168\229\137\169\228\189\153\229\173\144\229\188\185\230\149\176\233\135\143: %s", self.Player.RangedWeapon:GetAttr("BulletNum")))
  else
    BulletNum = tonumber(BulletNum)
    self.Player.RangedWeapon:SetAttr("BulletNum", BulletNum)
  end
end

function GM_Command:ForbidDamage()
  local Current = false
  if self.Player then
    Current = require("EMLuaConst").bForbidDamage
  end
  self:ServerBattleCommand("ForbidDamage", not Current)
end

function GM_Command:ForbidPlay()
  local Current = false
  if self.Player then
    Current = require("EMLuaConst").bForbidPlay
  end
  self:ServerBattleCommand("ForbidPlay", not Current)
end

function GM_Command:TestBattle(Eid)
  self:ServerBattleCommand("TestBattle", Eid)
end

function GM_Command:NoDamage()
  local _Battle = Battle(self.Player)
  if _Battle.SavedApplyDamage then
    _Battle.ApplyDamage = _Battle.SavedApplyDamage
    _Battle.ApplyHeal = _Battle.SavedApplyHeal
  else
    _Battle.SavedApplyDamage = _Battle.ApplyDamage
    _Battle.SavedApplyHeal = _Battle.ApplyHeal
    _Battle.ApplyDamage = EmptyFunction
    _Battle.ApplyHeal = EmptyFunction
  end
end

function GM_Command:GetOrSetPlayerAttr(AttrName, Value)
  if not AttrName then
    ScreenPrint(string.format("\232\135\179\229\176\145\233\156\128\232\166\129\228\188\160\229\133\165\229\177\158\230\128\167\229\144\141\230\137\141\229\143\175\232\191\155\232\161\140\230\159\165\232\175\162\230\147\141\228\189\156"))
  else
    self:ServerBattleCommand("GetOrSetPlayerAttr", self.Player.Eid, AttrName, Value)
  end
end

function GM_Command:GetOrSetPlayerWeaponAttr(WeaponId, AttrName, Value)
  if not WeaponId or not AttrName then
    ScreenPrint(string.format("\232\135\179\229\176\145\233\156\128\232\166\129\228\188\160\229\133\165\230\173\166\229\153\168\231\188\150\229\143\183\229\146\140\229\177\158\230\128\167\229\144\141\230\137\141\229\143\175\232\191\155\232\161\140\230\159\165\232\175\162\230\147\141\228\189\156"))
  else
    self:ServerBattleCommand("GetOrSetPlayerWeaponAttr", self.Player.Eid, WeaponId, AttrName, Value)
  end
end

function GM_Command:RandomCreateTest(RandomId, test_count)
  local RandomId = RandomId or 1
  local test_count = test_count or 1000000
  local Result = {}
  local UnitInfo = {}
  local WeightSum = 0
  local UnitInfoWeight = {}
  for _, Info in pairs(DataMgr.RandomCreator[RandomId].RandomInfos) do
    UnitInfo[Info.UnitId] = 0
    UnitInfoWeight[Info.UnitId] = Info.Weight
    WeightSum = WeightSum + Info.Weight
  end
  
  local function randUnit(totalWeight)
    for UnitId, Weight in pairs(UnitInfoWeight) do
      local RandomNumber = math.random(1, totalWeight)
      if Weight >= RandomNumber then
        return UnitId
      else
        totalWeight = totalWeight - Weight
      end
    end
  end
  
  for i = 1, test_count do
    local UnitId = randUnit(WeightSum)
    if nil == Result[UnitId] then
      rawset(Result, UnitId, 1)
    else
      local cur_count = rawget(Result, UnitId)
      cur_count = cur_count + 1
      rawset(Result, UnitId, cur_count)
    end
  end
  for UnitId, count in pairs(Result) do
    rawset(Result, UnitId, count / test_count)
  end
  PrintTable(Result)
end

function GM_Command:MaxBullet()
  self:ServerBattleCommand("MaxBullet", self.Player.Eid)
  Battle(self.Player):GM_MaxBullet(self.Player.Eid)
end

function GM_Command:MaxMagazineBullet()
  self:ServerBattleCommand("MaxMagazineBullet", self.Player.Eid)
end

function GM_Command:MaxAttack()
  self:ServerBattleCommand("MaxAttack", self.Player.Eid)
end

function GM_Command:MaxDefence()
  self:ServerBattleCommand("MaxDefence", self.Player.Eid)
end

function GM_Command:MaxSp()
  self:ServerBattleCommand("MaxSp", self.Player.Eid)
end

function GM_Command:AddSp(Value)
  self:ServerBattleCommand("AddSp", self.Player.Eid, tonumber(Value))
end

function GM_Command:MaxHp()
  self:ServerBattleCommand("MaxHp", self.Player.Eid)
end

function GM_Command:AddHp(Value)
  self:ServerBattleCommand("AddHp", self.Player.Eid, tonumber(Value))
end

function GM_Command:MaxES()
  self:ServerBattleCommand("MaxES", self.Player.Eid)
end

function GM_Command:AddES(Value)
  self:ServerBattleCommand("AddES", self.Player.Eid, tonumber(Value))
end

function GM_Command:God()
  self:MaxBullet()
  self:MaxAttack()
  self:MaxDefence()
  self:MaxSp()
  self:MaxHp()
  self:MaxES()
  self:NoCDForSkill()
  self:MaxTriggerProbability()
end

function GM_Command:MaxTriggerProbability()
  if Battle(self.Player).IsFullTriggerProbability then
    Battle(self.Player).IsFullTriggerProbability = false
  else
    Battle(self.Player).IsFullTriggerProbability = true
  end
end

function GM_Command:AddMod(ModId, ModLevel, ApplicationType)
  ModLevel = ModLevel or 0
  ApplicationType = ApplicationType or 1
  ModId = tonumber(ModId)
  assert(DataMgr.Mod[ModId], "\230\137\190\228\184\141\229\136\176\231\188\150\229\143\183\228\184\186\227\128\144" .. tostring(ModId) .. "\227\128\145\231\154\132Mod")
  ApplicationType = tonumber(ApplicationType)
  assert(ApplicationType >= 1 and ApplicationType <= 4, "\232\175\183\229\161\171\229\134\1531~4\228\185\139\233\151\180\231\154\132Type,1=\232\167\146\232\137\178\239\188\1402=\232\191\145\230\136\152\230\173\166\229\153\168\239\188\1403=\232\191\156\231\168\139\230\173\166\229\153\168, 4=\230\152\190\232\181\171\230\173\166\229\153\168")
  self:ServerBattleCommand("AddMod", tonumber(ModId), self.Player.Eid, ModLevel, ApplicationType)
end

function GM_Command:DebugMod(bOn)
  bOn = tonumber(bOn)
  ModCommon.DebugMode = 1 == bOn
end

function GM_Command:DefCoreGod()
  local GameState = UE.UGameplayStatics.GetGameState(self.Player)
  if not GameState then
    return
  end
  local DefCoreEid = GameState.DefBaseMap:Keys():ToTable()[1]
  self:ServerBattleCommand("MaxHp", DefCoreEid)
  self:ServerBattleCommand("MaxDefence", DefCoreEid)
  self:ServerBattleCommand("MaxES", DefCoreEid)
end

function GM_Command:UnlimitFire()
  self:MaxBullet()
  self:MaxMagazineBullet()
end

function GM_Command:NoCDForSkill()
  for SkillId, Skill in pairs(self.Player.Skills) do
    Skill:ResetSkillCd()
  end
  Battle(self.Player):GM_NoCDForSkill(self.Player.Eid)
  self:ServerBattleCommand("NoCDForSkill", self.Player.Eid)
end

function GM_Command:UpdateMonCd()
  Battle(self.Player):GM_UpdateMonSkillCd()
  self:ServerBattleCommand("UpdateMonSkillCd")
end

function GM_Command:FireDanmaku(DanmakuTemplateId, Duration)
  DanmakuTemplateId = tonumber(DanmakuTemplateId)
  Duration = tonumber(Duration)
  assert(DataMgr.DanmakuTemplate[DanmakuTemplateId], "\229\188\185\229\185\149\230\168\161\230\157\191\231\188\150\229\143\183\228\184\141\229\173\152\229\156\168")
  self:ServerBattleCommand("FireDanmaku", self.Player.Eid, DanmakuTemplateId, Duration, "")
end

function GM_Command:MonsterMaxHp()
  self:ServerBattleCommand("MonsterMaxHp")
end

function GM_Command:DebugMonsterSpawn()
  local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
  GameMode.DebugMonsterSpawn = not GameMode.DebugMonsterSpawn
end

function GM_Command:DebugPrintMonsterSpawn()
  local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
  GameMode.DebugPrintMonsterSpawn = not GameMode.DebugPrintMonsterSpawn
end

function GM_Command:GuideAllMonster()
  local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
  for i, j in pairs(GameMode.EMGameState.MonsterMap) do
    if IsValid(j) and not j:IsDead() then
      GameMode.EMGameState:AddGuideEid(i)
    end
  end
end

function GM_Command:PrintLevelDebugInfo()
  local FinalMsgTable = {}
  local LongSpace = "================="
  local ShortSpace = "====="
  if IsStandAlone(GWorld.GameInstance) then
    table.insert(FinalMsgTable, LongSpace .. " PrintLevelDebugInfo " .. LongSpace .. "\n")
    table.insert(FinalMsgTable, ShortSpace .. " PrintGameStateInfo " .. ShortSpace .. "\n")
    self:FillGameStateInfo(FinalMsgTable)
    table.insert(FinalMsgTable, ShortSpace .. " PrintGameModeInfo " .. ShortSpace .. "\n")
    self:FillGameModeInfo(FinalMsgTable)
    table.insert(FinalMsgTable, ShortSpace .. " PrintPlayerInfo " .. ShortSpace .. "\n")
    self:FillPlayerInfo(FinalMsgTable)
    table.insert(FinalMsgTable, LongSpace .. LongSpace .. LongSpace .. "\n")
  else
    self:DedicatedServerCommand("PrintLevelDebugInfo")
    table.insert(FinalMsgTable, LongSpace .. " PrintLevelDebugInfo  Client " .. LongSpace .. "\n")
    table.insert(FinalMsgTable, ShortSpace .. " PrintGameStateInfo Client " .. ShortSpace .. "\n")
    self:FillGameStateInfo(FinalMsgTable)
    table.insert(FinalMsgTable, ShortSpace .. " PrintPlayerInfo Client " .. ShortSpace .. "\n")
    self:FillPlayerInfo(FinalMsgTable)
    table.insert(FinalMsgTable, LongSpace .. LongSpace .. LongSpace .. "\n")
  end
  local FinalMsg = table.concat(FinalMsgTable)
  DebugPrint(FinalMsg)
  UUIFunctionLibrary.ClipboardCopy(FinalMsg)
end

function GM_Command:FillGameStateInfo(FinalMsgTable)
  local GameState = UE.UGameplayStatics.GetGameState(self.Player)
  table.insert(FinalMsgTable, "DungeonId\t" .. tostring(GameState.DungeonId) .. "\n")
  table.insert(FinalMsgTable, "GameModeType\t" .. GameState.GameModeType .. "\n")
  table.insert(FinalMsgTable, "GameModeState\t" .. EGameModeState:GetNameByValue(GameState.GameModeState) .. "\n")
  table.insert(FinalMsgTable, "DungeonUIState\t" .. EDungeonUIState:GetNameByValue(GameState.DungeonUIState) .. "\n")
  table.insert(FinalMsgTable, "GameModeLevel\t" .. tostring(GameState.GameModeLevel) .. "\n")
  table.insert(FinalMsgTable, "DungeonProgress\t" .. tostring(GameState.DungeonProgress) .. "\n")
  table.insert(FinalMsgTable, "InDungeon\t" .. tostring(GameState:IsInDungeon()) .. "\n")
  table.insert(FinalMsgTable, "InCommonAlert\t" .. tostring(GameState.InCommonAlert) .. "\n")
  local EventString = ""
  for i = 1, GameState.DungeonEvent:Num() do
    local Event = GameState.DungeonEvent:GetValueByIdx(i - 1)
    EventString = EventString .. Event .. ", "
  end
  table.insert(FinalMsgTable, "DungeonEvent\t" .. EventString .. "\n")
  local GuideEidString = ""
  for i = 1, GameState.GuideEids.Items:Num() do
    local Eid = GameState.GuideEids.Items:GetRef(i).IntProperty
    GuideEidString = GuideEidString .. Eid .. ", "
  end
  table.insert(FinalMsgTable, "GuideEids\t" .. GuideEidString .. "\n")
  local PlayerState = self.Player.PlayerState
  local PlayerEidString = ""
  for Index = 1, PlayerState.PlayerGuideEids.Items:Num() do
    local Eid = PlayerState.PlayerGuideEids.Items:GetRef(Index).IntProperty
    PlayerEidString = PlayerEidString .. Eid .. ", "
  end
  table.insert(FinalMsgTable, "PlayerGuideEids\t" .. PlayerEidString .. "\n")
end

function GM_Command:FillGameModeInfo(FinalMsgTable)
  local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
  local MonsterSpawnString = ""
  for Id, _ in pairs(GameMode.MonsterSpawnMap) do
    MonsterSpawnString = MonsterSpawnString .. Id .. ", "
  end
  table.insert(FinalMsgTable, "MonsterSpawnMap\t" .. MonsterSpawnString .. "\n")
  table.insert(FinalMsgTable, "SubGameModeInfo\t LevelName\t IsActive\n")
  for LevelName, SubGameMode in pairs(GameMode.SubGameModeInfo) do
    table.insert(FinalMsgTable, "...............\t " .. LevelName .. "\t " .. tostring(SubGameMode.IsActive) .. "\n")
  end
  GameMode:TriggerDungeonComponentFun("Print" .. GameMode.EMGameState.GameModeType .. "DebugInfo", FinalMsgTable)
  local LevelName = GameMode:GetActorLevelName(self.Player)
  table.insert(FinalMsgTable, "Player_LevelName\t" .. LevelName .. "\n")
end

function GM_Command:FillPlayerInfo(FinalMsgTable)
  local GameState = UE.UGameplayStatics.GetGameState(self.Player)
  if GameState:IsInDungeon() then
    try({
      exec = function()
        self:FillScanLevelInfo(FinalMsgTable)
      end
    })
  end
  local PlayerLocation = self.Player:K2_GetActorLocation()
  table.insert(FinalMsgTable, "Player Location \t" .. tostring(PlayerLocation) .. "\n")
  local FrameRate = 1 / UE4.UGameplayStatics.GetWorldDeltaSeconds(self.Player)
  table.insert(FinalMsgTable, "FrameRate \t" .. tostring(FrameRate) .. "\n")
  local PlayerState = self.Player.PlayerState
  local PlayerPing = PlayerState:GetPlayerPing()
  table.insert(FinalMsgTable, "PlayerPing \t" .. tostring(PlayerPing) .. "\n")
end

function GM_Command:FillScanLevelInfo(FinalMsgTable)
  local Level_shortname = UE4.URuntimeCommonFunctionLibrary.GetLevelLoadJsonName(self.Player)
  
  local function JsonLoads(shortname)
    local pro_path = UE4.UKismetSystemLibrary.GetProjectContentDirectory()
    local path = pro_path .. "Script/Datas/Houdini_data/" .. shortname .. ".json"
    local info = UE4.URuntimeCommonFunctionLibrary.LoadFile(path)
    local json = require("rapidjson")
    local res = json.decode(info)
    return res
  end
  
  local level_ids = self.Player.CurrentLevelId
  table.insert(FinalMsgTable, "\229\189\147\229\137\141\231\142\169\229\174\182\232\191\155\231\154\132\230\139\188\230\142\165\229\133\179\229\141\161 \t" .. Level_shortname .. "\n")
  local LevelData = JsonLoads(Level_shortname)
  for _, point in pairs(LevelData.points) do
    for i = 1, level_ids:Length() do
      local cur_id = level_ids:Get(i)
      if tostring(point.id) == cur_id then
        local cur_artLevel = point.art_path
        if "" == cur_artLevel then
          cur_artLevel = string.gsub(point.struct, "Data_Design", "Data_Art", 1)
        end
        table.insert(FinalMsgTable, "\230\137\128\229\156\168\231\154\132\231\190\142\230\156\175\229\133\179\229\141\161 \t" .. cur_artLevel .. "\t\229\133\179\229\141\161id\t" .. cur_id .. "\n")
      end
    end
  end
  return LevelInfo
end

function GM_Command:PrintPlayerInfoOnScreen()
  local ct = {}
  Battle(GWorld.GameInstance):FillBattleLog(ct)
  local Message = "---------------\231\142\169\229\174\182\228\191\161\230\129\175-------------\n"
  for _, value in ipairs(ct) do
    Message = Message .. value
  end
  local AllPlayer = {}
  if IsDedicatedServer(GWorld.GameInstance) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    AllPlayer = GameMode:GetAllPlayer()
  else
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    table.insert(AllPlayer, Player)
  end
  local GameState = UE.UGameplayStatics.GetGameState(GWorld.GameInstance)
  for _, Player in pairs(AllPlayer) do
    if GameState:IsInDungeon() then
    end
    local PlayerLocation = Player:K2_GetActorLocation()
    Message = Message .. "\231\142\169\229\174\182\228\189\141\231\189\174" .. tostring(PlayerLocation) .. "\n"
    local FrameRate = 1 / UE4.UGameplayStatics.GetWorldDeltaSeconds(Player)
    Message = Message .. "\229\184\167\231\142\135" .. FrameRate .. "\n"
    local PlayerState = Player.PlayerState
    local PlayerPing = PlayerState:GetPlayerPing()
    Message = Message .. "\229\187\182\232\191\159" .. PlayerPing .. "\n"
  end
  URuntimeCommonFunctionLibrary.AddOnScreenDebugMessage(-1, 5, FColor(255, 255, 255), Message, false, FVector2D(1, 1))
  DebugPrint(Message)
end

function GM_Command:PrintGameModeInfoOnScreen()
  local Message = "-------GameModeInfo----------\n"
  Message = Message .. "\231\142\175\229\162\131\239\188\154\232\129\148\230\156\186"
  if IsStandAlone(GWorld.GameInstance) then
    Message = Message .. "\231\142\175\229\162\131\239\188\154\229\141\149\230\156\186\n"
  end
  local GameState = UE.UGameplayStatics.GetGameState(GWorld.GameInstance)
  Message = Message .. "DungeonId: " .. GameState.DungeonId .. "\n"
  Message = Message .. "GameModeType: " .. GameState.GameModeType .. "\n"
  Message = Message .. "GameModeState: " .. EGameModeState:GetNameByValue(GameState.GameModeState) .. "\n"
  Message = Message .. "DungeonUIState: " .. EDungeonUIState:GetNameByValue(GameState.DungeonUIState) .. "\n"
  Message = Message .. "GameModeLevel: " .. GameState.GameModeLevel .. "\n"
  Message = Message .. "DungeonProgress: " .. GameState.DungeonProgress .. "\n"
  Message = Message .. "InDungeon: " .. tostring(GameState:IsInDungeon()) .. "\n"
  Message = Message .. "InCommonAlert: " .. tostring(GameState.InCommonAlert) .. "\n"
  local EventString = ""
  for i = 1, GameState.DungeonEvent:Num() do
    local Event = GameState.DungeonEvent:GetValueByIdx(i - 1)
    EventString = EventString .. Event .. ", "
  end
  Message = Message .. "DungeonEvent: " .. EventString .. "\n"
  URuntimeCommonFunctionLibrary.AddOnScreenDebugMessage(-1, 5, FColor(255, 255, 255), Message, false, FVector2D(1, 1))
  DebugPrint(Message)
end

function GM_Command:RequestSnapShotInfo()
  self.Player.RPCComponent:RequestSnapShotInfo()
end

function GM_Command:RequestMonsterCacheInfo()
  self.Player.RPCComponent:RequestMonsterCacheInfo()
end

function GM_Command:RequestStaticCreatorInfo()
  self.Player.RPCComponent:RequestStaticCreatorInfo()
end

function GM_Command:LJLTEST(arg)
  if "1" == arg then
    local MyWidget = UIManager(self.GameInstance):CreateWidget("WidgetBlueprint'/Game/UI/WBP/Activity/Widget/ZhiliuEvent/WBP_Activity_Jump_ZhiliuEvent_Reward.WBP_Activity_Jump_ZhiliuEvent_Reward'", true)
    MyWidget:InitPage(103005)
  elseif "2" == arg then
    local MyWidget = UIManager(self.GameInstance):CreateWidget("WidgetBlueprint'/Game/UI/WBP/Activity/Widget/PreTask/WBP_Activity_PreTask_Item.WBP_Activity_PreTask_Item'", true)
    MyWidget:InitPage(103005)
  elseif "3" == arg then
    PageJumpUtils:JumpToTargetPageByJumpId(24)
  elseif "4" == arg then
    PageJumpUtils:JumpToTargetPageByJumpId(25)
  end
end

function GM_Command:YXDTEST(type)
  local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
  local LoadString = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Art_Data/Chapter01_IcelakeCity_Art/Chapter01_IcelakeCity_Temp_Art_Foliage.Chapter01_IcelakeCity_Temp_Art_Foliage"
  local LoadArray = TArray(FString)
  LoadArray:Add(LoadString)
  local UnloadString = "/Game/Maps/Levels/Chapter01/Chapter01_Main/Art_Data/Chapter01_IcelakeCity_Art/Chapter01_IcelakeCity_Art_Foliage.Chapter01_IcelakeCity_Art_Foliage"
  local UnloadArray = TArray(FString)
  UnloadArray:Add(UnloadString)
  GameMode:ChangeLevelLoadingState(LoadArray, UnloadArray)
  if "1" == type then
    local Params = {
      TestVar1 = {OldValue = 0, NewValue = 1}
    }
    GameMode:TriggerQuestArtLevelChange(Params)
  elseif "2" == type then
    local Params = {
      TestVar1 = {OldValue = 1, NewValue = 0}
    }
    GameMode:TriggerQuestArtLevelChange(Params)
  end
  if "3" == type then
    local UnitIdArray = TArray(0)
    UnitIdArray:Add(-1)
    GameMode:TriggerCreateMonsterSpawn(UnitIdArray, false)
  end
  if "5" == type then
    local qqq = GameMode.EMGameState:GetStaticCreatorInfo(1432)
    local www = URuntimeCommonFunctionLibrary.GetStaticCreatorChildEids(qqq)
    local eee = URuntimeCommonFunctionLibrary.GetStaticCreatorLocation(qqq)
    local ttt = qqq:GetChildEids()
    DebugPrint("yxd @@@@@@@@@@@@@@@@@@@@@@@@", qqq, www, www:Num(), eee, ttt, ttt:Num())
  end
end

function GM_Command:THYTEST(type, TaskId, Arg)
  DebugPrint("THY  THYTEST ")
  local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
  local Avatar = GWorld:GetAvatar()
  if not GameMode then
    return
  end
  if "1" == type then
    GameMode:ShowTrialTask(TaskId)
  elseif "2" == type then
    Avatar:EnterCharTrial(nil, 900002, 105101011)
  elseif "3" == type then
    DebugPrint("thy    GameMode.GameState.GameModeType", GameMode.GameState.GameModeType)
  elseif "4" == type then
    DebugPrint("thy   RoomIndex", GWorld.RougeLikeManager.RoomIndex)
    DebugPrint("thy   IsCurRougeLikeRoomClear", GWorld.RougeLikeManager:IsCurRougeLikeRoomClear())
    DebugPrint("thy   GetCurRougeLikeRoomType", GWorld.RougeLikeManager:GetCurRougeLikeRoomType())
  elseif "5" == type then
    DebugPrint("thy     gm", TaskId, Arg)
    local EventName = TaskId .. "#" .. Arg
    DebugPrint("thy     EventName", EventName)
    GameMode:PostCustomEvent(EventName)
  elseif "6" == type then
    GameMode:ResetRegionSpecialQuest()
  elseif "7" == type then
    GameMode:UpdateProgressToTarget(TaskId)
  elseif "8" == type then
    UIManager(GWorld.GameInstance):LoadUINew("RegionCoDefenceProgress")
  elseif "9" == type then
    UIManager(GWorld.GameInstance):LoadUINew("TiaoPin")
  elseif "10" == type then
    local Obj = UIManager(GWorld.GameInstance):GetUIObj("TiaoPin")
    Obj:PrintBindMessage()
  elseif "11" == type then
    DebugPrint("thy   IsInRegion", GameMode:IsInRegion())
  end
end

function GM_Command:JTYTEST(Value)
  local Data = {
    TitleName = GText("MAIN_UI_FORGE"),
    LeftKey = "Q",
    RightKey = "E",
    StyleName = "Text",
    Tabs = {
      {Text = "\230\181\139\232\175\1491", TabId = 1},
      {Text = "\230\181\139\232\175\1492", TabId = 2}
    },
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BottomKeyInfo = {},
    OwnerPanel = self,
    ChildWidgetBPPath = "WidgetBlueprint'/Game/UI/WBP/Announcement/Widget/WBP_Announcement_TabItem.WBP_Announcement_TabItem'"
  }
  UIManager(self):ShowCommonPopupUI(100000, {TabConfigData = Data})
end

function GM_Command:HTYTEST(type, Id)
  if "1" == type then
    local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
    GameMode:OpenGuideIconDungeon("Mechanism", 11201)
    GameMode:OpenGuideIconDungeon("Mechanism", 10613)
  elseif "2" == type then
    local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
    GameMode:CloseGuideIconDungeon("Mechanism", 11201)
    GameMode:CloseGuideIconDungeon("Mechanism", 10613)
  elseif "3" == type then
    UIManager(self):LoadUINew("GuideBook_Tips", 1001)
  elseif "4" == type then
    local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
    local UnitIdArray = TArray(0)
    UnitIdArray:Add(-1)
    GameMode:TriggerCreateMonsterSpawn(UnitIdArray, false)
  elseif "PrintPlayArray" == type then
    local GameState = UE4.UGameplayStatics.GetGameState(self.Player)
    local PlayerArray = GameState.PlayerArray
    for Index, PlayerState in pairs(PlayerArray) do
      DebugPrint("PLAYER ARRAY INFO: ", Index, PlayerState.Eid)
    end
  elseif "UnlockAnswer" == type then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Avatar:DetectiveQuestionUnlockAnswer(tonumber(Id))
    end
  end
end

function GM_Command:DungeonEventTest(oper, str)
  if not IsStandAlone(GWorld.GameInstance) then
    self:DedicatedServerCommand("DungeonEventTest", oper, str)
  else
    local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
    if "add" == oper or "Add" == oper then
      GameMode:AddDungeonEvent(str)
      return
    end
    if "remove" == oper or "Remove" == oper then
      GameMode:RemoveDungeonEvent(str)
      return
    end
  end
end

function GM_Command:Printbuff(Eid)
  local Entity
  if not Eid then
    Entity = self.Player
  else
    Eid = tonumber(Eid)
    Entity = Battle(self.Player):GetEntity(Eid)
  end
  Entity.BuffManager:DebugPrint()
end

function GM_Command:BuffDebug(Eid)
  local Entity
  if not Eid then
    Entity = self.Player
  else
    Eid = tonumber(Eid)
    Entity = Battle(self.Player):GetEntity(Eid)
  end
  local Panel = UIManager(self.Player):LoadUI(UIConst.BUFFDEBUGPANEL, "BuffDebugPanel", UIConst.ZORDER_ABOVE_ALL, Entity)
  Panel:SetEntity(Entity)
end

function GM_Command:AddBuff(BuffId, LastTime, Value)
  BuffId = tonumber(BuffId)
  assert(BuffId, "BuffId\232\166\129\229\161\171\230\149\176\229\173\151")
  assert(DataMgr.Buff[BuffId], "\230\137\190\228\184\141\229\136\176[" .. tostring(BuffId) .. "]\229\175\185\229\186\148\231\154\132Buff")
  LastTime = tonumber(LastTime)
  assert(LastTime and 0 ~= LastTime, "LastTime\232\166\129\229\161\171\230\149\176\229\173\151\228\184\148\228\184\141\232\131\189\228\184\1860")
  Value = Value and tonumber(Value)
  self:ServerBattleCommand("AddBuff", self.Player.Eid, BuffId, tonumber(LastTime), Value)
end

function GM_Command:AddGP(GlobalPassiveId, Level)
  GlobalPassiveId = tonumber(GlobalPassiveId)
  Level = tonumber(Level)
  Battle(self.Player):AddGlobalPassive(GlobalPassiveId, self.Player, Level)
end

function GM_Command:RemoveAllGP()
  Battle(self.Player):RemoveAllGlobalPassives()
end

function GM_Command:PrintGP()
  Battle(self.Player):PrintCurrentGlobalPassives()
end

function GM_Command:PrintMarks(Eid)
  local Entity = self.Player
  if Eid then
    Entity = Battle(self.Player):GetEntity(tonumber(Eid))
  end
  Battle(self):PrintMarksFromTarget(Entity)
end

function GM_Command:RemoveBuff(BuffId)
  BuffId = tonumber(BuffId)
  assert(BuffId, "BuffId\232\166\129\229\161\171\230\149\176\229\173\151")
  assert(DataMgr.Buff[BuffId], "\230\137\190\228\184\141\229\136\176[" .. tostring(BuffId) .. "]\229\175\185\229\186\148\231\154\132Buff")
  self:ServerBattleCommand("RemoveBuff", self.Player.Eid, BuffId)
end

function GM_Command:AddMonsterBuff(BuffId, Value)
  self:AddMonsterBuffDuration(BuffId, -1, Value)
end

function GM_Command:AddMonsterBuffDuration(BuffId, LastTime, Value)
  BuffId = tonumber(BuffId)
  assert(BuffId, "BuffId\232\166\129\229\161\171\230\149\176\229\173\151")
  assert(DataMgr.Buff[BuffId], "\230\137\190\228\184\141\229\136\176[" .. tostring(BuffId) .. "]\229\175\185\229\186\148\231\154\132Buff")
  Value = Value and tonumber(Value)
  LastTime = tonumber(LastTime)
  self:ServerBattleCommand("AddMonsterBuff", BuffId, LastTime, Value)
end

function GM_Command:RemoveMonsterBuff(BuffId)
  BuffId = tonumber(BuffId)
  assert(BuffId, "BuffId\232\166\129\229\161\171\230\149\176\229\173\151")
  assert(DataMgr.Buff[BuffId], "\230\137\190\228\184\141\229\136\176[" .. tostring(BuffId) .. "]\229\175\185\229\186\148\231\154\132Buff")
  self:ServerBattleCommand("RemoveMonsterBuff", BuffId)
end

function GM_Command:StartXibiBoss()
  local function NodeCallback(...)
    self:SuccQuestChain(100102)
    
    self:StartQuest(10010306)
  end
  
  self:SuccessAllSystemGuide()
  local RegionId = 100103
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  Avatar:AddRegionSkipCallback(RegionId, self, NodeCallback)
  self:SkipRegion(1, RegionId, 1)
end

function GM_Command:UnlockHardBoss(bAll)
  print(_G.LogTag, "UnlockHardBoss", bAll)
  
  local function FillCondition(Info)
    local ConditionList = {}
    for _, InnerInfo in pairs(Info) do
      local Condition = InnerInfo.UnlockCondition
      if Condition then
        if type(Condition) == "table" then
          table.move(Condition, 1, #Condition, #ConditionList + 1, ConditionList)
        else
          ConditionList[#ConditionList + 1] = Condition
        end
      end
    end
    return ConditionList
  end
  
  self:CompleteCondition(FillCondition(DataMgr.HardBossMain))
  if bAll then
    self:CompleteCondition(FillCondition(DataMgr.HardBossDifficulty))
  end
  if not Const.UnlockRegionTeleport then
    Const.UnlockRegionTeleport = true
  end
  self:CompleteSystemCondition()
  SystemGuideManager:GMEnforceFinishAllSysGuide()
end

function GM_Command:UnlockRegionTeleport(bEnabled)
  Const.UnlockRegionTeleport = "1" == bEnabled
  local GameState = UE4.UGameplayStatics.GetGameState(self.Player)
  local Struct = GameState.MechanismMap:FindRef("TeleportMechanism")
  if not Struct then
    return
  end
  for i, v in pairs(Struct.Array:ToTable()) do
    v:GMUnlock()
  end
end

function GM_Command:UnlockRegionDelivery(bEnabled)
  _G.UnlockRegionDelivery = "1" == bEnabled
  local GameState = UE4.UGameplayStatics.GetGameState(self.Player)
  local Struct = GameState.MechanismMap:FindRef("Delivery")
  if not Struct then
    return
  end
  for i, v in pairs(Struct.Array:ToTable()) do
    v:GMUnlock()
  end
end

function GM_Command:AddRougeLikeToken(Count, SeasonId)
  local GMFunctionLibrary = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
  local Cmd = "sgm AddRougeLikeToken " .. Count
  if SeasonId then
    Cmd = Cmd .. " " .. SeasonId
  end
  GMFunctionLibrary.ExecConsoleCommand(self:GetGameInstance(), Cmd)
end

function GM_Command:GetRougeLikeToken()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    print(_G.LogTag, "GetRougeLikeCurrency", Avatar:GetCurrentRougeLikeToken())
  end
end

function GM_Command:RougeLikePassRoom(Value)
  local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
  for i, MonsterSpawn in pairs(GameMode.MonsterSpawnMap) do
    MonsterSpawn:ClearMonsterSpawnInfo()
    if IsValid(GameMode.MonsterSpawnMap:Find(MonsterSpawn.UnitSpawnId)) then
      GameMode.MonsterSpawnMap:Remove(MonsterSpawn.UnitSpawnId)
    end
    MonsterSpawn:K2_DestroyActor()
  end
  self:ServerBattleCommand("KillMonster", self.Player.Eid)
  GameMode:TriggerRougeLikeEnd(true)
end

function GM_Command:Debug()
  _G.DrawDebugTest = not _G.DrawDebugTest
  Battle(self.Player).DrawDebugTest = _G.DrawDebugTest
end

function GM_Command:ResetLoc()
  local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
  GameMode:SetPlayerSafeLoction(self.Player.Eid)
end

function GM_Command:ChangeCharCornerVisibility(IsVisible)
  if "true" == IsVisible or "1" == IsVisible then
    IsVisible = true
  elseif "false" == IsVisible or "0" == IsVisible then
    IsVisible = false
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local Char = Avatar.Chars[Avatar.CurrentChar]
    local CharUuid = Char.Uuid
    Avatar:ChangeCharCornerVisibility(CharUuid, IsVisible)
  end
end

function GM_Command:Tel()
  self.Player:TeleportToCloestTeleportPoint()
end

function GM_Command:UpWeaponGradeLevel(WeaponUuid, CurrentGradeLevel, Uuid1, Uuid2, Uuid3, Uuid4, Uuid5)
  local GL = tonumber(CurrentGradeLevel)
  local Avatar = GWorld:GetAvatar()
  local Uuids = {}
  if Uuid1 then
    table.insert(Uuids, CommonUtils.Str2ObjId(Uuid1))
  end
  if Uuid2 then
    table.insert(Uuids, CommonUtils.Str2ObjId(Uuid2))
  end
  if Uuid3 then
    table.insert(Uuids, CommonUtils.Str2ObjId(Uuid3))
  end
  if Uuid4 then
    table.insert(Uuids, CommonUtils.Str2ObjId(Uuid4))
  end
  if Uuid5 then
    table.insert(Uuids, CommonUtils.Str2ObjId(Uuid5))
  end
  if Avatar then
    local Uuid = CommonUtils.Str2ObjId(WeaponUuid)
    Avatar:UpWeaponGradeLevel(Uuid, GL, Uuids)
  end
end

function GM_Command:ChangeWeaponColor(WeaponUuid, Part1, Color1, Part2, Color2, Part3, Color3, Part4, Color4)
  local Avatar = GWorld:GetAvatar()
  local NewColorWithPart = {}
  if Part1 and Color1 then
    NewColorWithPart[tonumber(Part1)] = tonumber(Color1)
  end
  if Part2 and Color2 then
    NewColorWithPart[tonumber(Part2)] = tonumber(Color2)
  end
  if Part3 and Color3 then
    NewColorWithPart[tonumber(Part3)] = tonumber(Color3)
  end
  if Part4 and Color4 then
    NewColorWithPart[tonumber(Part4)] = tonumber(Color4)
  end
  if Avatar then
    local Uuid = CommonUtils.Str2ObjId(WeaponUuid)
    Avatar:ChangeWeaponColors(Uuid, NewColorWithPart)
  end
end

function GM_Command:CleanWeaponColor(WeaponUuid)
  local Avatar = GWorld:GetAvatar()
  local NewColorWithPart = {
    [1] = -1,
    [2] = -1,
    [3] = -1,
    [4] = -1
  }
  if Avatar then
    local Uuid = CommonUtils.Str2ObjId(WeaponUuid)
    Avatar:ChangeWeaponColors(Uuid, NewColorWithPart)
  end
end

function GM_Command:ChangeMod(Tag, Uuid, ModSuitIndex, ModSlotId, ModUuid)
  if not (Tag and Uuid and ModSuitIndex and ModSlotId) or not ModUuid then
    return
  end
  Uuid = CommonUtils.Str2ObjId(Uuid)
  ModSuitIndex = tonumber(ModSuitIndex)
  ModSlotId = tonumber(ModSlotId)
  ModUuid = CommonUtils.Str2ObjId(ModUuid)
  local avatar = self:GetClientAvatar()
  if string.lower(Tag) == "char" then
    avatar:ChangeCharMod(nil, Uuid, ModSuitIndex, ModSlotId, ModUuid)
  elseif string.lower(Tag) == "weapon" then
    avatar:ChangeWeaponMod(nil, Uuid, ModSuitIndex, ModSlotId, ModUuid)
  end
end

function GM_Command:TakeOffMod(Tag, Uuid, ModSuitIndex, ModSlotId)
  if not (Tag and Uuid and ModSuitIndex) or not ModSlotId then
    return
  end
  Uuid = CommonUtils.Str2ObjId(Uuid)
  ModSuitIndex = tonumber(ModSuitIndex)
  ModSlotId = tonumber(ModSlotId)
  local avatar = self:GetClientAvatar()
  if string.lower(Tag) == "char" then
    avatar:TakeOffCharMod(nil, Uuid, ModSuitIndex, ModSlotId)
  elseif string.lower(Tag) == "weapon" then
    avatar:TakeOffWeaponMod(nil, Uuid, ModSuitIndex, ModSlotId)
  end
end

function GM_Command:ChangeModSuit(Tag, Uuid, TargetModSuitIndex)
  if not (Tag and Uuid) or not TargetModSuitIndex then
    return
  end
  Uuid = CommonUtils.Str2ObjId(Uuid)
  TargetModSuitIndex = tonumber(TargetModSuitIndex)
  local avatar = self:GetClientAvatar()
  if string.lower(Tag) == "char" then
    avatar:ChangeCharModSuit(nil, Uuid, TargetModSuitIndex)
  elseif string.lower(Tag) == "weapon" then
    avatar:ChangeWeaponModSuit(nil, Uuid, TargetModSuitIndex)
  end
end

function GM_Command:ModLevelUp(ModUuid, CurrentLevel, TargetLevel, InActive)
  if not (ModUuid and CurrentLevel and TargetLevel) or not InActive then
    return
  end
  ModUuid = CommonUtils.Str2ObjId(ModUuid)
  CurrentLevel = tonumber(CurrentLevel)
  TargetLevel = tonumber(TargetLevel)
  InActive = "true" == InActive
  local avatar = self:GetClientAvatar()
  avatar:ModLevelUp(nil, ModUuid, CurrentLevel, TargetLevel, InActive)
end

function GM_Command:SetDefaultWeapon()
  local avatar = self:GetClientAvatar()
  if avatar then
    avatar:SetDefaultWeapon()
  end
end

function GM_Command:GetAllWeapons()
  local avatar = self:GetClientAvatar()
  if not avatar then
    return
  end
  local Weapon = avatar.Weapons
  local result = {}
  for key, value in pairs(Weapon) do
    result[CommonUtils.ObjId2Str(key)] = {
      value.WeaponId,
      value.Level,
      value.MaxLevel,
      value.EnhanceLevel
    }
  end
  PrintTable({result = result}, 10)
end

function GM_Command:WeaponLevelUp(WeaponUuid, CurrentLevel, TargetLevel)
  if not (WeaponUuid and CurrentLevel) or not TargetLevel then
    return
  end
  WeaponUuid = CommonUtils.Str2ObjId(WeaponUuid)
  CurrentLevel = tonumber(CurrentLevel)
  TargetLevel = tonumber(TargetLevel)
  local avatar = self:GetClientAvatar()
  if not avatar then
    return
  end
  avatar:WeaponLevelUp(WeaponUuid, CurrentLevel, TargetLevel)
end

function GM_Command:WeaponBreak(WeaponUuid, TargetBreakLevel)
  if not WeaponUuid or not TargetBreakLevel then
    return
  end
  WeaponUuid = CommonUtils.Str2ObjId(WeaponUuid)
  TargetBreakLevel = tonumber(TargetBreakLevel)
  local avatar = self:GetClientAvatar()
  if not avatar then
    return
  end
  avatar:WeaponBreakLevelUp(WeaponUuid, TargetBreakLevel)
end

function GM_Command:GetAllChars()
  local avatar = self:GetClientAvatar()
  if not avatar then
    return
  end
  local Char = avatar.Chars
  local result = {}
  for key, value in pairs(Char) do
    result[CommonUtils.ObjId2Str(key)] = {
      value.CharId,
      value.Level,
      value.MaxLevel,
      value.EnhanceLevel
    }
  end
  PrintTable({result = result}, 10)
end

function GM_Command:CharLevelUp(CharUuid, CurrentLevel, TargetLevel)
  if not (CharUuid and CurrentLevel) or not TargetLevel then
    return
  end
  CharUuid = CommonUtils.Str2ObjId(CharUuid)
  CurrentLevel = tonumber(CurrentLevel)
  TargetLevel = tonumber(TargetLevel)
  local avatar = self:GetClientAvatar()
  if not avatar then
    return
  end
  avatar:CharLevelUp(CharUuid, CurrentLevel, TargetLevel)
end

function GM_Command:CharGradeLevelUp()
  local Avatar = self:GetClientAvatar()
  local Char = Avatar.Chars[Avatar.CurrentChar]
  if not Avatar then
    return
  end
  local CharUuid = Char.Uuid
  local CurrentGradeLevel = tonumber(Char.GradeLevel)
  Avatar:UpCharGradeLevel(CharUuid, CurrentGradeLevel)
end

function GM_Command:CharBreak(CharUuid, TargetBreakLevel)
  if not CharUuid or not TargetBreakLevel then
    return
  end
  CharUuid = CommonUtils.Str2ObjId(CharUuid)
  TargetBreakLevel = tonumber(TargetBreakLevel)
  local avatar = self:GetClientAvatar()
  if not avatar then
    return
  end
  avatar:CharBreakLevelUp(CharUuid, TargetBreakLevel)
end

function GM_Command:GetMonster(...)
  local Entities = Battle(self.Player):GetAllEntities()
  local NearestMonster
  local NearestDis = 9999999
  local PlayerLocation = self.Player:K2_GetActorLocation()
  for eid, ent in pairs(Entities) do
    if ent and ent.IsMonster and ent:IsMonster() then
      local EntLocation = ent:K2_GetActorLocation()
      local Dis = UE4.UKismetMathLibrary.Vector_Distance(PlayerLocation, EntLocation)
      if NearestDis > Dis then
        NearestDis = Dis
        NearestMonster = ent
      end
    end
  end
  if NearestMonster then
    self.Monster = NearestMonster
    local GameState = UE4.UGameplayStatics.GetGameState(self.Player)
    if GameState then
      GameState.DebugMonster = NearestMonster
    end
    print(_G.LogTag, "Get NearestMonster, Eid:", self.Monster.Eid)
  end
end

function GM_Command:GlobalTimeDilation(val)
  UE4.UGameplayStatics.SetGlobalTimeDilation(self.Player, tonumber(val))
end

function GM_Command:MonsterTimeDilation(val)
  if self:HasTargetMonster() == false or not val then
    return
  end
  if 0 == val then
    self.Player:RemoveTimer("MonsterTimeDilationTimer", true)
    self.Monster.CustomTimeDilation = 1
  else
    self.Player:AddTimer(0.01, function()
      self.Monster.CustomTimeDilation = tonumber(val)
    end, true, 0, "MonsterTimeDilationTimer", true)
  end
end

function GM_Command:SetMonsterCrouch(val)
  if self:HasTargetMonster() == false or not val then
    return
  end
  local IsCrouch = tonumber(val) > 0 and true or false
  self:ServerBattleCommand("SetMonsterCrouch", self.Monster.Eid, IsCrouch)
end

function GM_Command:GetBlackboardValue(type, name)
  local GameState = UE4.UGameplayStatics.GetGameState(self.Player)
  for Index, Character in pairs(GameState.MonsterMap) do
    local BBComponent = Character:GetOwnBlackBoardComponent()
    local BBFunction = BBComponent["GetValueAs" .. type]
    if nil ~= BBFunction then
      local Result = BBFunction(BBComponent, name)
      DebugPrint("Monster Eid =", Character.Eid, ", BBValue =", Result)
    else
      DebugPrint("TypeError type =", type)
    end
  end
end

function GM_Command:StopAI(...)
  if self:HasTargetMonster() == false then
    return
  end
  self.Monster:StopBT("GM")
end

function GM_Command:StartAI(...)
  if self:HasTargetMonster() == false then
    return
  end
  self.Monster:StartBT()
end

function GM_Command:Target(...)
  if self:HasTargetMonster() == false then
    return
  end
  self.Monster:BBSetTarget(Battle(self.Player):GetCharacter(self.Player.Eid))
end

function GM_Command:TargetAll(...)
  local ents = Battle(self.Player):GetAllEntities()
  for eid, ent in pairs(ents) do
    if ent and ent.IsMonster and ent:IsMonster() then
      ent:BBSetTarget(Battle(self.Player):GetCharacter(self.Player.Eid))
    end
  end
end

function GM_Command:MoveTo(...)
  if self:HasTargetMonster() == false then
    return
  end
  local AICtrl = self.Monster:GetController()
  local Movement = self.Monster:GetMovementComponent()
  Movement:SetAvoidanceEnabled(true)
  AICtrl:MoveToLocation(self.Player:K2_GetActorLocation(), 1, true, true, false, true, nil, true)
end

function GM_Command:ReuseSkill(UnitId, SkillIndex)
  local Entities = Battle(self.Player):GetAllEntities()
  for eid, ent in pairs(Entities) do
    if ent and ent.IsMonster and ent:IsMonster() and ent.UnitId == tonumber(UnitId) then
      ent:StopBT("GM")
      ent:BBSetTarget(Battle(self.Player):GetCharacter(self.Player.Eid))
      ent:ReuseSkill(tonumber(SkillIndex))
    end
  end
end

function GM_Command:HasTargetMonster()
  local bHas = true
  if self.Monster == nil then
    bHas = false
  end
  if nil == Battle(self.Player):GetEntity(self.Monster.Eid) then
    self.Monster = nil
    bHas = false
  end
  if false == bHas then
    print(_G.LogTag, "No Target Monster")
  end
  return bHas
end

function GM_Command:TakeRecorderCapture(Capturing)
  local GMFunctionLibrary = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
  local isSet = "1" == Capturing
  GMFunctionLibrary.SetTakeRecorderCapture(self.Player, isSet)
end

function GM_Command:UseDungeonLevelBounds(IsEnable)
  _G.UseDungeonLevelBounds = "1" == IsEnable
end

function GM_Command:UseMinimumLoad(IsEnable)
  _G.UseMinimumLoad = "0" ~= IsEnable
end

function GM_Command:GameModeEnable(IsEnable)
  self:GetGameInstance().IsGameModeEnable = "false" ~= IsEnable
  DebugPrint("GM_GameMode\233\128\187\232\190\145\232\174\190\231\189\174\230\152\175\229\144\166\229\144\175\231\148\168", self:GetGameInstance().IsGameModeEnable)
end

function GM_Command:MoveDebug(val)
  local GameState = UE4.UGameplayStatics.GetGameState(self.Player)
  if GameState then
    val = tonumber(val)
    if val > 0 then
      GameState.MonsterMoveDebug = true
    else
      GameState.MonsterMoveDebug = false
    end
  end
end

function GM_Command:StopMonsterSkill(val)
  local GameState = UE4.UGameplayStatics.GetGameState(self.Player)
  if GameState then
    val = tonumber(val)
    if val > 0 then
      GameState.MonsterStopSkillDebug = true
    else
      GameState.MonsterStopSkillDebug = false
    end
  end
end

function GM_Command:BTTest(val)
  local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
  if not GameMode then
    return
  end
  val = tonumber(val)
  if val > 0 then
    GameMode.DebugTestBT = true
  else
    GameMode.DebugTestBT = false
  end
end

function GM_Command:ChangeCrossLevel(val)
  val = tonumber(val)
  local GameState = UE4.UGameplayStatics.GetGameState(self.Player)
  for i, v in pairs(GameState.MonsterMap) do
    local Controller = v:GetController()
    if Controller then
      Controller.CrossLevelEnable = val > 0
    end
  end
end

function GM_Command:DrawCrossLevel(val)
  val = tonumber(val)
  local GameState = UE4.UGameplayStatics.GetGameState(self.Player)
  for i, v in pairs(GameState.MonsterMap) do
    local Controller = v:GetController()
    if Controller then
      Controller.DrawCrossLevel = val > 0
    end
  end
end

function GM_Command:TestStory(path, QuestId, NodeId)
  self:RunStoryline("test_czc.story")
end

function GM_Command:TestStory1(path, QuestId, NodeId)
  self:RunStoryline("test_czc1.story")
end

function GM_Command:RunStoryline(path, QuestId, NodeId)
  GWorld.StoryMgr:RunStory(path, QuestId, NodeId)
end

function GM_Command:StopStoryline(QuestChainId)
  local QuestChainInfo = DataMgr.QuestChain[QuestChainId]
  if nil == QuestChainInfo then
    UIManager(GWorld.GameInstance):ShowError(6001)
    return
  end
  if GWorld.StoryMgr:IsRunningStoryline(QuestChainInfo.StoryPath) then
    GWorld.StoryMgr:StopStoryline(QuestChainInfo.StoryPath)
  end
end

function GM_Command:RunQuest(QuestId)
  GWorld.StoryMgr:RunQuest(tonumber(QuestId))
end

function GM_Command:SkipQuest(QuestId)
  GWorld.StoryMgr:CompleteQuest(tonumber(QuestId))
end

function GM_Command:RemoveAllImpression()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function Callback(Ret)
      self.logger.debug("ZJT_ GMRemoveAllmpressionRegionData ", Ret)
    end
    
    Avatar:CallServer("GMRemoveAllmpressionRegionData", Callback)
  end
end

function GM_Command:TestImpression()
end

function GM_Command:FinishImpressionTalk(TalkTriggerId)
  TalkTriggerId = tonumber(TalkTriggerId)
  local ErrorCode = ""
  
  local function printError()
    DebugPrint("GM_Command:FinishImpressionTalk@", ErrorCode)
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    UIManager:ShowUITip(UIConst.Tip_CommonToast, ErrorCode, 3)
  end
  
  if not TalkTriggerId then
    ErrorCode = "TalkTriggerId\228\184\186\231\169\186"
    printError()
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    ErrorCode = "Avatar\228\184\141\229\173\152\229\156\168"
    printError()
    return
  end
  if Avatar.ImpressionTalkTriggers[TalkTriggerId] then
    ErrorCode = "\229\175\185\229\186\148\231\154\132\229\175\185\232\175\157\229\183\178\229\174\140\230\136\144\239\188\140\230\151\160\230\179\149\233\135\141\229\164\141\229\174\140\230\136\144"
    printError()
    return
  end
  Avatar:SetTalkTriggerComplete_New(TalkTriggerId, {
    self,
    function()
      DebugPrint("Log: Impression Talk Finished", TalkTriggerId)
    end
  })
end

function GM_Command:ImpressionCheckByEnumId(DialogueChain, CurrentDialogueId, TalkTriggerId, RegionId)
  local Avatar = GWorld:GetAvatar()
  local ErrorCode = ""
  
  local function printError()
    DebugPrint("GM_Command:ImpressionCheckByEnumId@", ErrorCode)
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    UIManager:ShowUITip(UIConst.Tip_CommonToast, ErrorCode, 3)
  end
  
  if not Avatar then
    ErrorCode = "Avatar\228\184\141\229\173\152\229\156\168"
    printError()
  end
  DialogueChain = DialogueChain or {741148230}
  CurrentDialogueId = CurrentDialogueId or 7411482301
  TalkTriggerId = TalkTriggerId or 74114730
  RegionId = RegionId or 1011
  if Avatar:IsImpressionCheckSuccess(CurrentDialogueId) then
    ErrorCode = "\229\175\185\229\186\148\231\154\132\233\128\137\233\161\185\229\183\178\232\162\171\232\174\176\229\189\149\239\188\140\230\151\160\230\179\149\233\135\141\229\164\141\233\128\137\230\139\169"
    printError()
  end
  Avatar:ImpressionCheckByEnumId_New(DialogueChain, CurrentDialogueId, TalkTriggerId, RegionId)
end

function GM_Command:ImpressionAddByEnumId(DialogueChain, CurrentDialogueId)
  local Avatar = GWorld:GetAvatar()
  local ErrorCode = ""
  
  local function printError()
    DebugPrint("GM_Command:ImpressionAddByEnumId@", ErrorCode)
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    UIManager:ShowUITip(UIConst.Tip_CommonToast, ErrorCode, 3)
  end
  
  if not Avatar then
    ErrorCode = "Avatar\228\184\141\229\173\152\229\156\168"
    printError()
    return
  end
  DialogueChain = DialogueChain or {741148229}
  CurrentDialogueId = CurrentDialogueId or 7411482291
  if Avatar:IsImpressionCheckSuccess(CurrentDialogueId) then
    ErrorCode = "\229\175\185\229\186\148\231\154\132\233\128\137\233\161\185\229\183\178\232\162\171\232\174\176\229\189\149\239\188\140\230\151\160\230\179\149\233\135\141\229\164\141\233\128\137\230\139\169"
    printError()
    return
  end
  Avatar:ImpressionAddByEnumId_New(DialogueChain, CurrentDialogueId)
end

function GM_Command:ForceSetStorySkipable(bSet)
  local TS = TalkSubsystem()
  if TS then
    TS:ForceSetStorySkipable(bSet)
    return true
  end
end

function GM_Command:PlayTalk(FindKey, bIncludeFilterFiles)
  bIncludeFilterFiles = not not bIncludeFilterFiles
  local pro_path = UE4.UKismetSystemLibrary.GetProjectContentDirectory()
  local Path = pro_path .. "../Tools/storycreator/talk_nodes.json"
  local a, Info = URuntimeCommonFunctionLibrary.ParseTalkNodesJson(GWorld.GameInstance, Path, FindKey, bIncludeFilterFiles)
  if Info and "" ~= Info then
    local JsonLib = require("rapidjson")
    local TalkNodeInfo = JsonLib.decode(Info)
    TalkNodeInfo.props = TalkNodeInfo.props or {}
    if TalkNodeInfo.props.IsNpcNode then
      local NpcId = TalkNodeInfo.props.NpcId
      if NpcId then
        self:CreateNpc(NpcId)
      end
    end
    local StorylineUtils = require("StoryCreator.StoryLogic.StorylineUtils")
    local TalkNode = StorylineUtils.CreateQuestNode("TalkNode", {
      FinishNode = function(self, OutPortNames, Result)
      end
    })
    TalkNode:BuildNode(TalkNodeInfo.nodeId, {
      key = TalkNodeInfo.nodeId,
      type = "TalkNode",
      name = "TalkNode_Temp",
      propsData = TalkNodeInfo.props
    }, {})
    TalkNode.GuideUIEnable = false
    TalkNode:Execute(function()
      TalkNode:Finish()
      DebugPrint("PlayTalk\230\137\167\232\161\140\231\187\147\230\157\159")
    end)
  else
    UE4.UPlayTalkAsyncAction.PlayTalk(GWorld.GameInstance, tonumber(FindKey), nil)
  end
end

function GM_Command:ScanForDuplicatedTalk(bIncludeFilterFiles)
  DebugPrint("lhr@ScanForDuplicatedTalk")
  bIncludeFilterFiles = not not bIncludeFilterFiles
  local pro_path = UE4.UKismetSystemLibrary.GetProjectContentDirectory()
  local Path = pro_path .. "../Tools/storycreator/talk_nodes.json"
  local Message = URuntimeCommonFunctionLibrary.ScanForDuplicatedTalk(GWorld.GameInstance, Path, bIncludeFilterFiles)
  local TimeUtils = require("Utils.TimeUtils")
  local TimeStr = TimeUtils.TimeToYMDHMSStr(TimeUtils.RealTime(), false, "_", "_")
  local FilePath = UEMPathFunctionLibrary.GetProjectSavedDirectory() .. "Talk/" .. "DuplicatedTalkData_" .. tostring(TimeStr) .. ".txt"
  UE.URuntimeCommonFunctionLibrary.SaveFile(FilePath, Message)
end

function GM_Command:CreateSTLNode(NodeType, Args)
  local QuestNodeCoreInfo = DataMgr.QuestNodeCore[NodeType]
  local RealArgs = {}
  if QuestNodeCoreInfo and QuestNodeCoreInfo.TestArgs then
    for k, v in pairs(QuestNodeCoreInfo.TestArgs) do
      RealArgs[k] = v
    end
  end
  if Args then
    local LuaStr = "return " .. tostring(Args)
    local load_fun = loadstring or load
    Args = load_fun(LuaStr)()
    for k, v in pairs(Args) do
      RealArgs[k] = v
    end
  end
  RealArgs.Type = NodeType
  PrintTable({NodeType = NodeType, RealArgs = RealArgs}, 10)
  local StorylineUtils = require("StoryCreator.StoryLogic.StorylineUtils")
  local NodeCore = StorylineUtils.GMCreateQuestNode(NodeType, RealArgs)
  return NodeCore
end

function GM_Command:TestSTLNode(NodeType, Args, Res)
  local NodeCore = self:CreateSTLNode(NodeType, Args)
  local Callback
  local OldFinish = NodeCore.Finish
  if Res then
    local RealRes = string.lower(Res)
    if "success" == RealRes then
      function Callback(...)
        OldFinish(NodeCore)
        
        NodeCore:ClearWhenQuestSuccess()
      end
    elseif "fail" == RealRes then
      function Callback(...)
        OldFinish(NodeCore)
        
        NodeCore:ClearWhenQuestFail()
      end
    end
  end
  if Callback then
    NodeCore.Finish = Callback
  end
  NodeCore:Start()
end

function GM_Command:ShowCapsule(bShow)
  bShow = bShow or 0
  local NewHidden = true
  if "0" ~= bShow then
    NewHidden = false
  end
  self:HideMonsterCapsule(bShow)
  self.Player.CapsuleComponent:SetHiddenInGame(NewHidden, false)
  self.Player.CapsuleComponent:SetVisibility(not NewHidden, false)
  local Entities = Battle(self.Player):GetAllEntities()
  for eid, ent in pairs(Entities) do
    if ent and ent.IsMonster and ent:IsMonster() then
      ent.CapsuleComponent:SetHiddenInGame(NewHidden, false)
      ent.CapsuleComponent:SetVisibility(not NewHidden, false)
    end
  end
  UCharacterFunctionLibrary.SetNewCharacterCapsuleVisibility(NewHidden)
end

function GM_Command:MAULookAt(Eid)
  local MAUtils = require("Utils.MonsterAnimationUtils")
  MAUtils:LookAtMonster(Eid)
end

function GM_Command:QuitMAU()
  local MAUtils = require("Utils.MonsterAnimationUtils")
  MAUtils:QuitMAUtil()
end

function GM_Command:UseSkill(Eid, SkillId)
  local MAUtils = require("Utils.MonsterAnimationUtils")
  MAUtils:UseSkill(Eid, SkillId)
end

function GM_Command:Focus(IsFocus)
  local MAUtils = require("Utils.MonsterAnimationUtils")
  MAUtils:Focus(tonumber(IsFocus))
end

function GM_Command:SetSpeed(Value)
  local MAUtils = require("Utils.MonsterAnimationUtils")
  MAUtils:SetSpeed(tonumber(Value))
end

function GM_Command:HeadScale(Eid, Scale)
  local B = Battle(self.Player)
  local Entity = B:GetEntity(tonumber(Eid))
  if Entity.EMAnimInstance then
    Entity.EMAnimInstance.HeadScale = Scale
  end
end

function GM_Command:UpperArmScale(Scale)
  self.Player.PlayerAnimInstance.UpperArmScale = Scale
end

function GM_Command:LowerArmScale(Scale)
  self.Player.PlayerAnimInstance.LowerArmScale = Scale
end

function GM_Command:HandScale(Scale)
  self.Player.PlayerAnimInstance.TargetHandScale = Scale
end

function GM_Command:UpdateVLM()
  URuntimeCommonFunctionLibrary.UpdateFoliageVLM(self.Player)
end

function GM_Command:ChangeCreatureSpeed(Speed)
  Const.SkillCreatureSpeed = Speed
  require("EMLuaConst").SkillCreatureSpeed = Const.SkillCreatureSpeed
  self:ServerBattleCommand("ChangeCreatureSpeed", Speed)
end

function GM_Command:ShowSkillCreature()
  UE4.URuntimeCommonFunctionLibrary.ShowSkillCreature()
end

function GM_Command:ShowRayCreature()
  Const.IsShowRayCreature = not Const.IsShowRayCreature
  require("EMLuaConst").IsShowRayCreature = Const.IsShowRayCreature
end

function GM_Command:AnimCacheEnableState(IsEnable)
  UE4.URuntimeCommonFunctionLibrary.EnableGlobalAnimCache(self.Player, tonumber(IsEnable) > 0)
end

function GM_Command:DisconnectServer()
  local Avatar = self:GetClientAvatar()
  if Avatar then
    Avatar:DisconnectServer()
  end
end

function GM_Command:ExitBattle(IsWin)
  IsWin = tonumber(IsWin)
  IsWin = 1 == IsWin and true or false
  if IsStandAlone(self:GetGameInstance()) then
    local avatar = self:GetClientAvatar()
    if avatar then
      avatar:ExitBattle(IsWin)
    end
  elseif IsWin then
    self:DedicatedServerCommand("DungeonWin")
  else
    self:DedicatedServerCommand("DungeonFailed")
  end
end

function GM_Command:PlayerEnd(IsWin)
  IsWin = tonumber(IsWin)
  IsWin = 1 == IsWin and true or false
  if IsStandAlone(self:GetGameInstance()) then
    local avatar = self:GetClientAvatar()
    if avatar then
      avatar:ExitBattle(IsWin)
    end
  elseif IsWin then
    self:DedicatedServerCommand("PlayerWin")
  else
    self:DedicatedServerCommand("PlayerFailed")
  end
end

function GM_Command:SetInvincible(Eid)
  local GameInstance = self:GetGameInstance()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local Monster = Battle(PlayerCharacter):GetEntity(tonumber(Eid))
  Monster:SetInvincible(true, "GM")
end

function GM_Command:GetDrop(DropId, Count)
  DropId = tonumber(DropId)
  Count = tonumber(Count)
  local GameInstance = self:GetGameInstance()
  local ScenceManager = GameInstance:GetSceneManager()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GameInstance)
  local DropInfo = DataMgr.Drop[DropId]
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local Rotation = PlayerCharacter:K2_GetActorRotation()
  local SpawnLocation = PlayerCharacter:K2_GetActorLocation() + FVector(400, 0, 0)
  if not DropInfo or Count <= 0 then
    print(_G.LogTag, "ZJT_ DropInfo Battle DropCount ", not DropInfo, not ScenceManager:IsDungeonScene(), Count)
    return
  end
  local Avatar = self:GetClientAvatar()
  if Avatar and not Avatar:IsInDungeon() and not Avatar:CheckCurrentSubRegion() then
    print(_G.LogTag, "ZJT_ Avatar not Avatar:IsInDungeon() ", Avatar, Avatar:IsInDungeon())
    return
  end
  local Transform = UE4.UKismetMathLibrary.MakeTransform(SpawnLocation, Rotation, UE4.FVector(1, 1, 1))
  local RewardBox = require("BluePrints.Client.CustomTypes.SimpleRewardBox")
  local Drops = {}
  local DropCountTable = {}
  local NormalTag = RewardBox:GetTag("Normal")
  DropCountTable[tostring(NormalTag)] = Count
  Drops[DropId] = DropCountTable
  if IsStandAlone(self.Player) then
    GameMode:HandleRewardDrop(Drops, CommonConst.RewardReason.REASON_GM_SPAWN, Transform, {}, nil)
  elseif IsClient(self.Player) then
    self.Player.RPCComponent:GMServerGetDrop(DropId, Count)
  end
end

function GM_Command:PerMonsterDebug(bShow)
  local bHide = false
  if "0" == bShow then
    bHide = true
  end
  local Entities = Battle(self.Player):GetAllEntities()
  local CompArray
  for eid, ent in pairs(Entities) do
    if ent and ent.IsMonster and ent:IsMonster() then
      CompArray = ent:K2_GetComponentsByClass(UCharDebugWidgetComponent:StaticClass())
      for i = 1, CompArray:Length() do
        CompArray[i]:SetHiddenInGame(bHide)
      end
    end
  end
  CompArray = self.Player:K2_GetComponentsByClass(UCharDebugWidgetComponent:StaticClass())
  for i = 1, CompArray:Length() do
    CompArray[i]:SetHiddenInGame(bHide)
  end
end

function GM_Command:ShowOrHideMonsterGuideIcon(isShow)
  local isShow = tonumber(isShow) or 0
  isShow = 0 ~= isShow
  local UnitLabels = TArray(FUnitLabel)
  local label = FUnitLabel()
  label.UnitId = 0
  label.UnitType = "Monster"
  UnitLabels:Add(label)
  local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
  if not GameMode then
    return
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self.Player)
  if not GameInstance then
    return
  end
  local UIManager = GameInstance:GetGameUIManager()
  local ResourceMgr = GameInstance:GetSceneManager()
  if nil == UIManager then
    return
  end
  
  local function ShowOrHide(isShow)
    ResourceMgr.IsSceneGuideShow = isShow
    local num = isShow and 1.0 or 0.0
    for k, v in pairs(ResourceMgr.CurSceneGuideEids) do
      local GuideIcon = UIManager:GetUIObj(k)
      if nil ~= GuideIcon then
        GuideIcon:SetRenderOpacity(num)
      end
    end
  end
  
  if isShow then
    GameMode:ShowGuideIcon(UnitLabels)
  end
  ShowOrHide(isShow)
end

function GM_Command:ScanLevel()
  local Level_shortname = UE4.URuntimeCommonFunctionLibrary.GetLevelLoadJsonName(self.Player)
  
  local function JsonLoads(shortname)
    local pro_path = UE4.UKismetSystemLibrary.GetProjectContentDirectory()
    local path = pro_path .. "Script/Datas/Houdini_data/" .. shortname .. ".json"
    local info = UE4.URuntimeCommonFunctionLibrary.LoadFile(path)
    local json = require("rapidjson")
    local res = json.decode(info)
    return res
  end
  
  local level_ids = self.Player.CurrentLevelId
  local LevelInfo = string.format("\229\189\147\229\137\141\231\142\169\229\174\182\232\191\155\231\154\132\230\139\188\230\142\165\229\133\179\229\141\161: %s", Level_shortname)
  local LevelData = JsonLoads(Level_shortname)
  for _, point in pairs(LevelData.points) do
    for i = 1, level_ids:Length() do
      local cur_id = level_ids:Get(i)
      if tostring(point.id) == cur_id then
        local cur_artLevel = point.art_path
        if "" == cur_artLevel then
          cur_artLevel = string.gsub(point.struct, "Data_Design", "Data_Art", 1)
        end
        LevelInfo = LevelInfo .. string.format("\239\188\140\230\137\128\229\156\168\231\154\132\231\190\142\230\156\175\229\133\179\229\141\161\230\152\175: %s\239\188\140 \229\133\179\229\141\161id\230\152\175\239\188\154 %s", cur_artLevel, cur_id)
      end
    end
  end
  return LevelInfo
end

function GM_Command:DebugAchvUI(AchvId)
  local UIManager = self:GetGameInstance():GetGameUIManager()
  AchvId = tonumber(AchvId)
  if not AchvId then
    print(LogTag, "\229\191\133\232\166\129\229\143\130\230\149\176\231\188\186\229\164\177~")
    return
  end
  local Achv = DataMgr.Achievement[AchvId]
  if not Achv or not Achv.TargetProgress then
    return
  end
  local CurrentCount = Achv.TargetProgress
  local index = 1
  if Achv.TargetProgressRenew then
    index = #Achv.TargetProgressRenew + 1
  end
  local UI = UIManager:GetUIObjAsync("AchievementPanel", function(UIObj)
    if UIObj then
      UIObj:AddQuene(AchvId, CurrentCount, Achv.TargetProgress, index)
    end
  end)
  if not UI and not UIManager:GetUIObjIsAsyncLoading("AchievementPanel") then
    if Achv.CompletionValue then
      CurrentCount = Achv.CompletionValue
    end
    UI = UIManager:LoadUIAsync("AchievementPanel", function()
    end, AchvId, CurrentCount, Achv.TargetProgress, index)
  end
end

function GM_Command:EnableJetRush(IsJet, LimitYaw, LimiPitch)
  local IsJet = tonumber(IsJet)
  if not IsJet then
    return
  end
  LimitYaw = tonumber(LimitYaw) or 100
  LimiPitch = tonumber(LimiPitch) or 100
  local Player = self.Player
  if 1 == IsJet then
    Player:StartJetRush(LimitYaw, LimiPitch)
  else
    Player:EndJetRush()
  end
end

function GM_Command:EnableBuffMesh(bOn)
  local bOn = tonumber(bOn)
  if not bOn then
    return
  end
  local Player = self.Player
  if 1 == bOn then
    Player:EnableRimLightModel(true)
  else
    Player:EnableRimLightModel(false)
  end
end

function GM_Command:EnableJetJump(IsJet)
  local IsJet = tonumber(IsJet)
  if not IsJet then
    return
  end
  local Player = self.Player
  if 1 == IsJet then
    Player.bJetJump = true
  else
    Player.bJetJump = false
  end
end

function GM_Command:EnableSplineMove(IsMove)
  local IsMove = tonumber(IsMove)
  if not IsMove then
    return
  end
  local Player = self.Player
  local Splines = UE4.UGameplayStatics.GetAllActorsOfClass(Player, ACinemaMoveSpline:StaticClass())
  if 0 == Splines:Length() then
    print(_G.LogTag, "\230\178\161\230\156\137\230\137\190\229\136\176CinemaMoveSpline")
    return
  end
  local Spline = Splines[1]
  Player:SetWalkType(2)
  Player:SetPlayerMaxMovingSpeed(0.16)
  if 1 == IsMove then
    Player:StartMoveAlongSpline(Spline.SplineComponent)
  else
    Player:EndMoveAlongSpline()
  end
end

function GM_Command:EnableSplatoonMove(IsMove)
  local IsMove = tonumber(IsMove)
  if not IsMove then
    return
  end
  local Player = self.Player
  if 1 == IsMove then
    Player:StartSplatoonMove()
  else
    Player:EndSplatoonMove()
  end
end

function GM_Command:SpeedUp(Rate)
  Rate = tonumber(Rate)
  if not Rate then
    return
  end
  if not self.Player.CurrentSpeedRate then
    self.Player.CurrentSpeedRate = 1
  end
  local MaxSpeed = DataMgr.PlayerRotationRates.NormalWalkSpeed.ParamentValue[1]
  local MaxCrouch = DataMgr.PlayerRotationRates.CrouchWalkSpeed.ParamentValue[1]
  self.Player.PlayerSlideAtttirbute.NormalWalkSpeed = MaxSpeed * Rate
  self.Player.PlayerSlideAtttirbute.CrouchWalkSpeed = MaxCrouch * Rate
  local Movementcomp = self.Player:GetMovementComponent()
  local CurrentMaxFlySpeed = Movementcomp.MaxFlySpeed / self.Player.CurrentSpeedRate
  Movementcomp.MaxFlySpeed = CurrentMaxFlySpeed * Rate
  self.Player.CurrentSpeedRate = Rate
end

function GM_Command:SetWalk(IsWalk, WalkType)
  local _IsWalk = tonumber(IsWalk)
  local _WalkType = tonumber(WalkType)
  if not _IsWalk then
    return
  end
  local Player = self.Player
  if not Player.PlayerAnimInstance then
    return
  end
  if 1 == _IsWalk then
    Player.PlayerAnimInstance.IsWalking = true
  else
    Player.PlayerAnimInstance.IsWalking = false
  end
  Player.PlayerAnimInstance.WalkType = _WalkType or 0
end

function GM_Command:ChangeSpeed(Rate)
  Rate = tonumber(Rate)
  if not Rate then
    return
  end
  self.Player:SetPlayerMaxMovingSpeed(Rate)
end

function GM_Command:ShowPreloadFX()
  local FXPreloadGameInstanceSubsystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self.Player, UFXPreloadGameInstanceSubsystem)
  if not FXPreloadGameInstanceSubsystem then
    return
  end
  local Msg = [[

CommonNiagara:
]]
  local CommonNiagaras = FXPreloadGameInstanceSubsystem.CommonNiagaraSystems:ToArray()
  for i = 1, CommonNiagaras:Length() do
    Msg = Msg .. UKismetSystemLibrary.GetObjectName(CommonNiagaras:GetRef(i)) .. ","
  end
  Msg = Msg .. [[

PlayerNiagara
]]
  local CharacterNiagaras = FXPreloadGameInstanceSubsystem.CharacterNiagaraSystems:ToArray()
  for i = 1, CharacterNiagaras:Length() do
    Msg = Msg .. UKismetSystemLibrary.GetObjectName(CharacterNiagaras:GetRef(i)) .. ","
  end
  DebugPrint(Msg)
end

function GM_Command:GetSceneSoundPause(SoundType)
  print(_G.LogTag, "GetSceneSoundPause \231\154\132\232\190\147\229\135\186\229\128\188\230\152\175", SoundType, AudioManager(self.Player):GetSceneSoundPause(tonumber(SoundType)))
end

function GM_Command:EnterDungeon(DungeonId)
  DungeonId = tonumber(DungeonId)
  if not DungeonId then
    return
  end
  local avatar = self:GetClientAvatar()
  if avatar then
    avatar:EnterDungeon(DungeonId)
  end
end

function GM_Command:EnterPaotai(DungeonId, PaotaiId)
  DungeonId = tonumber(DungeonId)
  PaotaiId = tonumber(PaotaiId)
  if not DungeonId or not PaotaiId then
    return
  end
  local avatar = self:GetClientAvatar()
  if avatar then
    avatar:EnterDungeon(DungeonId, nil, nil, nil, nil, {PaotaiId = PaotaiId})
  end
end

function GM_Command:EnterLocalDungeon(DungeonId)
  DungeonId = tonumber(DungeonId)
  local avatar = self:GetClientAvatar()
  if avatar then
    avatar:CallServerMethod("GMEnterLocalDungeon", DungeonId)
  end
end

function GM_Command:EnterNewDS(DungeonId, DSVersion)
  DungeonId = tonumber(DungeonId)
  DSVersion = DSVersion and tonumber(DSVersion)
  if not DungeonId then
    return
  end
  local avatar = self:GetClientAvatar()
  if avatar then
    avatar:CallServerMethod("GMEnterMultiDungeon", DungeonId, DSVersion)
  end
end

function GM_Command:DSLog()
  local avatar = self:GetClientAvatar()
  if avatar then
    avatar:GetDSLogPath()
  end
end

function GM_Command:SetNickname(nickname)
  local nickname_arg = tostring(nickname)
  local avatar = self:GetClientAvatar()
  if avatar then
    avatar:SetAvatarNickname(nickname_arg)
  end
end

function GM_Command:SetSex(name, newSex, exsex)
  local newSex_str = tostring(newSex)
  local avatar = self:GetClientAvatar()
  if avatar then
    avatar:AvatarCreateRole(name, tonumber(newSex), function()
      DebugPrint("AvatarCreateRole Callback")
      AudioManager(self):SetVoiceGender()
    end)
    avatar:SetWeitaInfo(name, tonumber(exsex), function()
      DebugPrint("SetWeitaInfo Callback")
      AudioManager(self):SetVoiceGender()
    end)
  end
end

function GM_Command:SetBGMVolume(Volume)
  local bus_name = "bus:/bgm"
  local bus = UE4.UFMODBlueprintStatics.FindAssetByName(bus_name)
  UE4.UFMODBlueprintStatics.BusSetVolume(bus:Cast(UE4.UFMODBus), tonumber(Volume))
end

function GM_Command:SetAudioListenerOpenDebug(bOpen)
  if self.Player and self.Player.AudioListener then
    if "true" == bOpen then
      self.Player.AudioListener.OpenDebug = true
    elseif "false" == bOpen then
      self.Player.AudioListener.OpenDebug = false
    end
  end
end

function GM_Command:SetEMPreviewMute(bMute)
  if "true" == bMute then
    AudioManager(self.Player):SetCinePreviewSoundMute(true)
  elseif "false" == bMute then
    AudioManager(self.Player):SetCinePreviewSoundMute(false)
  end
end

function GM_Command:StartSpecialQuest(SpecialQuestId)
  assert(SpecialQuestId, "\228\184\128\229\174\154\232\166\129\228\188\160\229\133\165\229\143\130\230\149\176:SpecialQuestId")
  SpecialQuestId = tonumber(SpecialQuestId)
  local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")
  ClientEventUtils:StartSpecialQuestEvent(SpecialQuestId)
end

function GM_Command:SuccessSpecialQuest()
  local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")
  local CurrentEvent = ClientEventUtils:GetCurrentEvent()
  assert(CurrentEvent, "\229\174\162\230\136\183\231\171\175\228\184\141\229\173\152\229\156\168\231\137\185\230\174\138\228\187\187\229\138\161")
  assert(CurrentEvent.Type == "SpecialQuest", "\229\174\162\230\136\183\231\171\175\228\184\141\229\173\152\229\156\168\231\137\185\230\174\138\228\187\187\229\138\161")
  CurrentEvent:TryFinishEvent(true)
end

function GM_Command:FailerSpecialQuest()
  local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")
  local CurrentEvent = ClientEventUtils:GetCurrentEvent()
  assert(CurrentEvent, "\229\174\162\230\136\183\231\171\175\228\184\141\229\173\152\229\156\168\231\137\185\230\174\138\228\187\187\229\138\161")
  assert(CurrentEvent.Type == "SpecialQuest", "\229\174\162\230\136\183\231\171\175\228\184\141\229\173\152\229\156\168\231\137\185\230\174\138\228\187\187\229\138\161")
  CurrentEvent:TryFinishEvent(false)
end

function GM_Command:ChangeToMaster()
  if self.Player then
    self.Player:ChangeToMaster(true)
  end
end

function GM_Command:ChangeBackToHero()
  if self.Player then
    self.Player:ChangeBackToHero()
  end
end

function GM_Command:ActiveExploreStaticCreator()
  local GameState = UE4.UGameplayStatics.GetGameState(self.Player)
  for Id, ExploreGroup in pairs(GameState.ExploreGroupMap) do
    print(_G.LogTag, "LXZ ActiveExploreStaticCreator", Id)
    ExploreGroup:ActiveExploreGroupGM()
  end
end

function GM_Command:PrintRegionTypeData(QuestRegionDatas, Type)
  PrintTable({Type = QuestRegionDatas}, 10)
end

function GM_Command:InitGameMode(DungeonId)
  local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
  if not GameMode then
    return
  end
  GameMode:GMInitGameModeInfo(tonumber(DungeonId))
end

function GM_Command:TestRealtimeContentValidate(ChatContent)
  HeroUSDKSubsystem():RequestRealTimeContentValidate(ChatContent, {
    self,
    function(self, ResponseData)
      DebugPrint("TestRealtimeContentValidateResponse", ResponseData.Code, ResponseData.Msg, ResponseData.Data)
    end
  }, {
    self,
    function(self)
      DebugPrint("TestRealtimeContentValidateResponseFail")
    end
  })
end

function GM_Command:TestUploadChat(...)
  local ChatContents = {
    ...
  }
  HeroUSDKSubsystem():RequestUploadChatData_Lua(ChatContents, self, function(self, ResponseData)
    DebugPrint("TestUploadChatResponse", ResponseData.Code, ResponseData.Msg, ResponseData.Data)
  end)
end

function GM_Command:TestUploadReport()
  local ReportData = {
    {
      FromServerId = 1,
      FromRoleId = 2,
      FromRoleName = "TestName",
      Text = "TestText",
      Remark = "TestRemark",
      Reason = "TestReason"
    }
  }
  HeroUSDKSubsystem():RequestUploadReportData_Lua(ReportData, self, function(self, ResponseData)
    DebugPrint("TestUploadReportResponse", ResponseData.Code, ResponseData.Msg, ResponseData.Data)
  end)
end

function GM_Command:TestUploadBanLog()
  local LogData = {
    {
      BanType = 1,
      BanReason = "Reason1",
      BanBeginTime = 1,
      BanEndTime = 2
    },
    {
      BanType = 2,
      BanReason = "Reason2",
      BanBeginTime = 1,
      BanEndTime = 2
    }
  }
  HeroUSDKSubsystem():RequestUploadBanLog_Lua(LogData, self, function(self, ResponseData)
    DebugPrint("TestUploadBanLogResponse", ResponseData.Code, ResponseData.Msg, ResponseData.Data)
  end)
end

function GM_Command:UnLoadChangeUI()
  local GameInstance = self:GetGameInstance()
  GameInstance:CloseLoadingUI()
end

function GM_Command:PrintQuestData()
  local Avatar = GWorld:GetAvatar()
  for QuestId, QuestData in pairs(Avatar.QuestUpdateDatas) do
    print(_G.LogTag, "ZJT_ \230\137\147\229\141\176\228\185\139\229\137\141\229\190\133\230\143\144\228\186\164\228\187\187\229\138\161\230\149\176\230\141\174\231\188\147\229\173\152 PrintQuestData QuestId ", QuestId)
    for WorldRegionEid, RegionBaseData in pairs(QuestData) do
      print(_G.LogTag, "ZJT_ PrintQuestData QuestData eid ", WorldRegionEid, RegionBaseData.Eid, RegionBaseData.QuestId, RegionBaseData.Id, RegionBaseData.SubRegionId, RegionBaseData.LevelName, RegionBaseData.CreatorId)
    end
  end
end

function GM_Command:RequireAndEnterDS(DungeonId, Reason)
  local Avatar = GWorld:GetAvatar()
  
  local function callback(ret)
    if ErrorCode:Check(ret) then
      Avatar:ConnectAndEnterDS()
    end
  end
  
  Avatar:RequireDS(tonumber(DungeonId), Reason, callback)
end

function GM_Command:LoadSmallObjects()
  URuntimeCommonFunctionLibrary.LoadStreamingLevel(self.Player)
end

function GM_Command:ExitDS()
  local Avatar = GWorld:GetAvatar()
  Avatar:ExitDS()
end

function GM_Command:EnterLocalDS()
  local Avatar = GWorld:GetAvatar()
  self:GetGameInstance():ConnectDedicatedServer_Lua("127.0.0.1", 17777, Avatar.Account, Avatar.Eid)
end

function GM_Command:StartBlueProduct(DraftId)
  local Avatar = GWorld:GetAvatar()
  Avatar:StartProduct(DraftId)
end

function GM_Command:CompleteBlueProduct(DraftId)
  local Avatar = GWorld:GetAvatar()
  Avatar:CompleteProduct(DraftId)
end

function GM_Command:AccelerateBlueProduct(DraftId)
  local Avatar = GWorld:GetAvatar()
  Avatar:AccelerateProduct(DraftId)
end

function GM_Command:KickPlayer(AvatarEid)
  local Avatar = GWorld:GetAvatar()
  Avatar:KickPlayer(AvatarEid)
end

function GM_Command:KickSelf(Reason)
  GM_Command:DedicatedServerCommand("KickSelf", Reason)
end

function GM_Command:ShowClientTime()
  local TimeUtils = require("Utils.TimeUtils")
  DebugPrint("Current Time is", TimeUtils.TimeToStr())
end

function GM_Command:ShowServerTime()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:GetServerTime()
  end
end

function GM_Command:StartBattle()
  local MyPlayerController = UE4.UGameplayStatics.GetPlayerController(self:GetGameInstance(), 0)
  MyPlayerController:StartBattle()
end

function GM_Command:TestDrawGacha(GachaId, Counts)
  local Avatar = GWorld:GetAvatar()
  Avatar:DrawGacha(tonumber(GachaId), tonumber(Counts))
end

function GM_Command:TestDrawSkinGacha(GachaId, Counts)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  Avatar:DrawSkinGacha(tonumber(GachaId), tonumber(Counts))
end

function GM_Command:ShowGachaParams()
  local Avatar = GWorld:GetAvatar()
  
  local function cb(params)
    PrintTable(params, 3)
  end
  
  Avatar:CallServer("GMGachaParams", cb)
end

function GM_Command:GachaSelfSelect(GachaId, ItemId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  Avatar:SetGachaSelfSelect(nil, tonumber(GachaId), tonumber(ItemId))
end

function GM_Command:FinishSystemGuide(SystemGuideId)
  local Avatar = GWorld:GetAvatar()
  Avatar:FinishSystemGuide(tonumber(SystemGuideId))
end

function GM_Command:PurchaseShopItem(ShopItemId, Count)
  local Avatar = GWorld:GetAvatar()
  Avatar:PurchaseShopItem(tonumber(ShopItemId), tonumber(Count))
end

function GM_Command:ShowPurchaseShopUI()
  UIManger:LoadUI(UIConst.SHOPMAIN, "ShopMain", UIConst.ZORDER_FOR_DESKTOP_TEMP)
end

function GM_Command:PlayAllNiagaraArround()
  URuntimeCommonFunctionLibrary.PlayAllNiagaraArround(self:GetGameInstance())
end

function GM_Command:EnemyVisionDebug()
  local SelectedActors = UGameplayStatics.GetAllActorsOfClass(self.Player, AMonsterCharacter:StaticClass()):ToTable()
  for _, Actor in ipairs(SelectedActors) do
    local Comp = Actor:GetComponentByClass(UCharDebugWidgetComponent:StaticClass())
    if Comp then
      Comp.bEnemyVisionDebug = not Comp.bEnemyVisionDebug
    end
  end
end

function GM_Command:TargetLocDebug()
  local SelectedActors = UGameplayStatics.GetAllActorsOfClass(self.Player, AMonsterCharacter:StaticClass()):ToTable()
  for _, Actor in ipairs(SelectedActors) do
    local Comp = Actor:GetComponentByClass(UCharDebugWidgetComponent:StaticClass())
    if Comp then
      Comp.bTargetLocDebug = not Comp.bTargetLocDebug
    end
  end
end

function GM_Command:ConnectServer()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:TestConnectLS()
  end
end

function GM_Command:ListenServer(DungeonId)
  print(_G.LogTag, "ListenServer", DungeonId)
  WorldTravelSubsystem():ChangeDungeonByDungeonId(DungeonId, CommonConst.DungeonNetMode.ListenServer)
end

function GM_Command:NetMode()
  local Mode = self:GetGameInstance():GetNetMode()
  if 0 == Mode then
    print(_G.LogTag, "Current NetMode StandAlone")
  elseif 1 == Mode then
    print(_G.LogTag, "Current NetMode DedicatedServer")
  elseif 2 == Mode then
    print(_G.LogTag, "Current NetMode ListenServer")
  elseif 3 == Mode then
    print(_G.LogTag, "Current NetMode Client")
  else
    print(_G.LogTag, "Unknown Current NetMode", Mode)
  end
end

function GM_Command:Reconnect()
  local NetworkManager = self:GetGameInstance():GetNetworkManager()
  NetworkManager:TestReconnect()
end

function GM_Command:TestNetworkFailure(FailureType)
  self:GetGameInstance():HandleNetworkError(tonumber(FailureType), false)
end

function GM_Command:TestCrash()
  local Controller = UE.UGameplayStatics.GetPlayerController(self:GetGameInstance(), 0)
  Controller:TestCrash()
end

function GM_Command:ForbidEntityMessage(flag)
  GWorld:ForbidEntityMessage(flag)
end

function GM_Command:DestroyAllMonster()
  local AllActors = TArray(AActor)
  UE4.UGameplayStatics.GetAllActorsOfClass(self.Player, AMonsterCharacter, AllActors)
  for i = 1, AllActors:Length() do
    local Monster = AllActors:Get(i)
    if Monster then
      Monster:EMActorDestroy(EDestroyReason.GM)
    end
  end
end

function GM_Command:DSVersion()
  local MiscUtils = require("Utils.MiscUtils")
  local DSVersion = MiscUtils.GetGameCofingSettings("DSVersion")
  return DSVersion
end

function GM_Command:ManualGC()
  collectgarbage("collect")
  UE4.UKismetSystemLibrary.CollectGarbage()
end

function GM_Command:SetClientTime(year, month, day, hour, minute, second)
  local TimeUtils = require("Utils.TimeUtils")
  local t = TimeUtils.DataToTimestamp(tonumber(year), tonumber(month), tonumber(day), tonumber(hour), tonumber(minute), tonumber(second))
  TimeUtils.TimeOffset = math.floor(t - os.time())
end

function GM_Command:PSOPrepare(QualityLevel, UnitType)
  local PSOManager = require("Test.PSOPrepare")
  PSOManager:Initialize(self)
  PSOManager:DoPrepare(QualityLevel, UnitType)
end

function GM_Command:ResetTrollyLoc(NowId, NextId)
  local NowPathId = tonumber(NowId)
  local NextPathId = tonumber(NextId)
  local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
  if not GameMode:GetDungeonComponent() then
    DebugPrint("\229\189\147\229\137\141\230\156\170\230\137\190\229\136\176\229\137\175\230\156\172\231\187\132\228\187\182")
    return
  end
  GameMode.EMGameState.NowPathId = NowPathId
  GameMode.EMGameState.NextPathId = NextPathId
  for Eid, DefenceCore in pairs(GameMode.EMGameState.DefBaseMap) do
    if IsValid(DefenceCore) then
      DefenceCore.NowPathId = NowPathId
      DefenceCore.NextPathId = NextPathId
      DefenceCore.Percent = 0
      DefenceCore.Spline.Spline:ClearSplinePoints(false)
      DefenceCore:AddNewPath()
      local Transform = DefenceCore.Spline:GetMoveTransform(DefenceCore.Percent)
      Transform = FTransform(Transform.Rotation, Transform.Translation + FVector(0, 0, 200), DefenceCore:GetActorScale3D())
      DefenceCore:K2_SetActorTransform(Transform, false, nil, false)
      local TmpPlayerTransform = FTransform(Transform.Rotation, Transform.Translation + FVector(0, 0, 400), DefenceCore:GetActorScale3D())
      self.Player:K2_SetActorLocation(TmpPlayerTransform.Translation, false, nil, false)
    end
  end
end

function GM_Command:ClearFirstMonsterRecords()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  Avatar:CallServerMethod("GMClearFirstMonsterRecords")
  local GameState = self:GetGameInstance():GetCurrentGameMode().EMGameState
  GameState.FirstSeen = {}
  GameState.MonstersNeedCheck = {}
end

function GM_Command:ClearMonGuide()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  Avatar:CallServerMethod("GMClearFirstStrongMonsterRecords")
end

function GM_Command:StartQuest(QuestId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local QuestChainId = tonumber(string.sub(QuestId, 1, 6))
  print(_G.LogTag, "QuestChainId", QuestChainId)
  local QuestChain = Avatar.QuestChains[QuestChainId]
  if QuestChain and QuestChain:IsFinish() then
    DebugPrint("ZJT_ \228\187\187\229\138\161\233\147\190\229\183\178\231\187\143\229\174\140\230\136\144 ", QuestChainId)
    return
  end
  if QuestChain and QuestChain:CheckQuestIdComplete(QuestId) then
    DebugPrint("ZJT_ \228\187\187\229\138\161\229\183\178\231\187\143\229\174\140\230\136\144 ", QuestId)
    return
  end
  if QuestChain and QuestChain.DoingQuestId == QuestId then
    DebugPrint("\228\187\187\229\138\161\230\173\163\229\156\168\232\191\155\232\161\140 ", QuestId)
    return
  end
  Avatar:GMStartQuest(tonumber(QuestChainId), tonumber(QuestId), true)
end

function GM_Command:SuccQuest(QuestId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local QuestChainId = tonumber(string.sub(QuestId, 1, 6))
  QuestId = tonumber(QuestId)
  local QuestChain = Avatar.QuestChains[QuestChainId]
  if QuestChain and QuestChain:IsFinish() then
    DebugPrint("ZJT_ \228\187\187\229\138\161\233\147\190\229\183\178\231\187\143\229\174\140\230\136\144 ", QuestChainId)
    return
  end
  if QuestChain and QuestChain:CheckQuestIdComplete(QuestId) then
    DebugPrint("ZJT_ \228\187\187\229\138\161\229\183\178\231\187\143\229\174\140\230\136\144 ", QuestId)
    return
  end
  
  local function Callback(Ret, TargetCompleteQuestIds, RewardBox, TargetClientVarParams)
    PrintTable({RewardBox = RewardBox}, 10)
    local TaskChainConfig = DataMgr.QuestChain[QuestChainId]
    if next(RewardBox) and TaskChainConfig.QuestReward and TaskChainConfig.QuestReward[QuestId] and nil ~= RewardBox and next(RewardBox) ~= nil and not RewardBox.bEmpty then
      UIUtils.ShowGetItemPage(nil, nil, nil, RewardBox)
    end
    Avatar:HandleClientQuestCompleteEvent(Ret, false, QuestId, QuestChainId, TargetCompleteQuestIds, TargetClientVarParams)
  end
  
  Avatar:CallServer("GMSuccestQuest", Callback, QuestChainId, QuestId)
end

function GM_Command:SkipCurrentRunningQuest()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local TrackingQuestChainId = Avatar.TrackingQuestChainId
  if 0 == TrackingQuestChainId then
    DebugPrint("ZJT_ \229\189\147\229\137\141\230\156\170\232\191\189\232\184\170\228\187\187\228\189\149\228\187\187\229\138\161\233\147\190 ", TrackingQuestChainId)
    return
  end
  local QuestChain = Avatar.QuestChains[TrackingQuestChainId]
  if QuestChain and QuestChain:IsFinish() then
    DebugPrint("ZJT_ \228\187\187\229\138\161\233\147\190\229\183\178\231\187\143\229\174\140\230\136\144 ", TrackingQuestChainId)
    return
  end
  local DoingQuestId = QuestChain.DoingQuestId
  if QuestChain and QuestChain:CheckQuestIdComplete(DoingQuestId) then
    DebugPrint("ZJT_ \228\187\187\229\138\161\229\183\178\231\187\143\229\174\140\230\136\144 ", DoingQuestId)
    return
  end
  self:SuccQuest(DoingQuestId)
end

function GM_Command:FailQuest(QuestId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local QuestChainId = string.sub(QuestId, 1, 6)
  QuestChainId = tonumber(QuestChainId)
  print(_G.LogTag, "QuestChainId", QuestChainId)
  if not Avatar.QuestChains[QuestChainId] then
    self:StartQuestChain(QuestChainId)
  end
  Avatar:RecoverDataByQuestChainId(QuestChainId)
end

function GM_Command:ShowUseCountSkill()
  local EMCache = require("EMCache.EMCache")
  local NeedCountPlayerSkillUsedTimesList = EMCache:Get("bNeedCountPlayerSkillUsedTimesList", true) or {}
  local NeedCountSkillTypeList = {}
  for SkillType, v in pairs(NeedCountPlayerSkillUsedTimesList) do
    table.insert(NeedCountSkillTypeList, SkillType)
  end
  local Str = table.concat(NeedCountSkillTypeList, ",")
  DebugPrint("CountSkillUsedTime->\229\189\147\229\137\141\232\167\146\232\137\178\231\154\132\230\156\172\229\156\176\229\173\152\229\130\168\229\133\129\232\174\184\229\147\170\228\186\155\230\138\128\232\131\189\231\177\187\228\188\188\229\143\175\228\187\165\232\174\161\231\174\151:", Str)
  local CountPlayerSkillUsedTimesList = EMCache:Get("CountPlayerSkillUsedTimesList", true) or {}
  DebugPrint("CountSkillUsedTime->\229\189\147\229\137\141\230\138\128\232\131\189\231\154\132\228\189\191\231\148\168\230\172\161\230\149\176:")
  DebugPrint("CountSkillUsedTime->----------------------------")
  for SkillType, Count in pairs(CountPlayerSkillUsedTimesList) do
    DebugPrint("CountSkillUsedTime->\230\138\128\232\131\189\231\177\187\229\158\139", SkillType, "\228\189\191\231\148\168\230\172\161\230\149\176", Count)
  end
  DebugPrint("CountSkillUsedTime->----------------------------")
end

function GM_Command:ShowCacheUseCountSkill()
  local NeedCountPlayerSkillUsedTimesList = self.Player and self.Player.NeedCountPlayerSkillUsedTimesList or {}
  local NeedCountSkillTypeList = {}
  for SkillType, v in pairs(NeedCountPlayerSkillUsedTimesList) do
    table.insert(NeedCountSkillTypeList, SkillType)
  end
  local Str = table.concat(NeedCountSkillTypeList, ",")
  DebugPrint("CountSkillUsedTime->\229\189\147\229\137\141\232\167\146\232\137\178\231\154\132\231\188\147\229\173\152\229\133\129\232\174\184\229\147\170\228\186\155\230\138\128\232\131\189\231\177\187\228\188\188\229\143\175\228\187\165\232\174\161\231\174\151:", Str)
  local CountPlayerSkillUsedTimesList = self.Player and self.Player.CountPlayerSkillUsedTimesList or {}
  DebugPrint("CountSkillUsedTime->\229\189\147\229\137\141\230\138\128\232\131\189\231\154\132\228\189\191\231\148\168\230\172\161\230\149\176:")
  DebugPrint("CountSkillUsedTime->----------------------------")
  for SkillType, Count in pairs(CountPlayerSkillUsedTimesList) do
    DebugPrint("CountSkillUsedTime->\230\138\128\232\131\189\231\177\187\229\158\139", SkillType, "\228\189\191\231\148\168\230\172\161\230\149\176", Count)
  end
  DebugPrint("CountSkillUsedTime->----------------------------")
end

function GM_Command:SuccessAllQuest()
  GWorld.StoryMgr:SuccessAllQuest()
end

function GM_Command:PrintStorylineInfo()
  GWorld.StoryMgr:PrintStorylineInfo()
end

function GM_Command:PrintStorylinesNeedRestartInfo()
  GWorld.StoryMgr:PrintStorylinesNeedRestartInfo()
end

function GM_Command:SetPlayerDilation(Dilation)
  if self.Player then
    self.Player:SetTimeDilation(tonumber(Dilation))
  end
end

function GM_Command:Mem()
  local m = require("MemDump")
  m = nil
  collectgarbage("collect")
end

function GM_Command:CleanLuaTable()
  DataMgr.CleanAllTable()
end

function GM_Command:PrintCurrentSkillID()
  local Type_2_Skills = {}
  for i, v in pairs(self.Player.Type_2_Skills) do
    Type_2_Skills[i] = v
  end
  local ForceSkills = self.Player.ForceSkills
  for Index, Skill in pairs(Type_2_Skills) do
    if ForceSkills:Find(Skill) then
      Type_2_Skills[Index] = ForceSkills:Find(Skill)
    end
  end
  PrintTable(Type_2_Skills, 10, "\229\189\147\229\137\141\230\140\137\233\148\174\230\138\128\232\131\189\228\184\186")
end

function GM_Command:PrintMonsterSkill(Eid)
  local GameInstance = self:GetGameInstance()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local Entity = Battle(PlayerCharacter):GetEntity(tonumber(Eid))
  if not Entity then
    DebugPrint("Tianyi@ \230\137\190\228\184\141\229\136\176\229\175\185\229\186\148\230\128\170\231\137\169")
    return
  end
  Entity.DebugPrintSkillId = true
end

function GM_Command:ShowAvatarStatus()
  local Avatar = GWorld:GetAvatar()
  local PrintStr = "CurrentAvatarStatus: "
  if Avatar then
    Avatar:PrintAvatarStatus()
  end
end

function GM_Command:StatMonster()
  local tmp = require("StatMonster")
  tmp:Stat(self)
  tmp = nil
end

function GM_Command:StatMonsterMem()
  local tmp = require("StatMonster")
  tmp:StatMem(self)
  tmp = nil
end

function GM_Command:StatFX(NiagaraCount)
  require("StatFX"):Stat(self, NiagaraCount)
end

function GM_Command:StatLevel()
  local tmp = require("StatLevel")
  tmp:Stat(self)
  tmp = nil
end

function GM_Command:StatRecordLevel()
  local tmp = require("StatRecordLevel")
  tmp:Stat(self)
  tmp = nil
end

function GM_Command:PreviewPopup(StyleId)
  local GameInstance = self:GetGameInstance()
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:PreviewCommonPopupStyle(StyleId)
end

function GM_Command:ShowPopup(PopupId)
  local GameInstance = self:GetGameInstance()
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:ShowCommonPopupUI(tonumber(PopupId), {})
end

function GM_Command:ShowRecoverUI()
  UIUtils.ShowActionRecover(self)
end

function GM_Command:TestGetCharWeapon(Type, ...)
  local Ids = {
    ...
  }
  local TargetTable = {}
  TargetTable[Type .. "s"] = {}
  for k, v in ipairs(Ids) do
    if not TargetTable[Type .. "s"][tonumber(v)] then
      TargetTable[Type .. "s"][tonumber(v)] = 0
    end
    TargetTable[Type .. "s"][tonumber(v)] = TargetTable[Type .. "s"][tonumber(v)] + 1
  end
  UIUtils.ShowGetCharWeaponPage(TargetTable, nil, nil, false)
end

function GM_Command:DisableCheckBox()
  local GameInstance = self:GetGameInstance()
  local UIManager = GameInstance:GetGameUIManager()
  local Widget = UIManager:GetUIObj("TrainingGroundSetup")
  Widget.WBP_Training_Root.WBP_Com_CheckBox_LeftText:ForbidBtn(true)
end

function GM_Command:EnableCheckBox()
  local GameInstance = self:GetGameInstance()
  local UIManager = GameInstance:GetGameUIManager()
  local Widget = UIManager:GetUIObj("TrainingGroundSetup")
  Widget.WBP_Training_Root.WBP_Com_CheckBox_LeftText:ForbidBtn(false)
end

function GM_Command:IsCrit()
  if require("EMLuaConst").IsCanCrit == false then
    require("EMLuaConst").IsCanCrit = true
  else
    require("EMLuaConst").IsCanCrit = false
  end
end

function GM_Command:IsFloat()
  if require("EMLuaConst").IsCanFloat == false then
    require("EMLuaConst").IsCanFloat = true
  else
    require("EMLuaConst").IsCanFloat = false
  end
end

function GM_Command:TestEvent()
  self.Player:TestTriggerBattleEvent(30)
end

function GM_Command:ShowDamageDetails()
  Const.bShowDamageDetails = not Const.bShowDamageDetails
  require("EMLuaConst").bShowDamageDetails = Const.bShowDamageDetails
end

function GM_Command:DSShowDetails()
  self:ServerBattleCommand("DSShowDetails")
end

function GM_Command:ShowRealAttr()
  local GameInstance = GWorld.GameInstance
  self.Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local ATK = self.Player:GetAttr("ATK")
  local ATK_Char = self.Player:GetAttr("ATK_Char")
  local ATK_Wepon = ATK - ATK_Char
  local SkillIntensity = self.Player:GetAttr("SkillIntensity")
  local SkillSustain = self.Player:GetAttr("SkillSustain")
  local SkillRange = self.Player:GetAttr("SkillRange")
  local SkillEfficiency = self.Player:GetAttr("SkillEfficiency")
  local StrongValue = string.format("%.2f", (1 + self.Player:GetAttr("StrongValue")) * 100)
  local EnmityValue = string.format("%.2f", (1 + self.Player:GetAttr("EnmityValue")) * 100)
  ScreenPrint("\232\131\140\230\176\180\239\188\154" .. EnmityValue .. "%")
  ScreenPrint("\230\152\130\230\137\172\239\188\154" .. StrongValue .. "%")
  local Weapon = self.Player:GetCurrentWeapon()
  if Weapon then
    local CRI = string.format("%.2f", Weapon:GetAttr("CRI") * 100)
    local CRD = string.format("%.2f", Weapon:GetAttr("CRD") * 100)
    local TRI = string.format("%.2f", Weapon:GetAttr("TriggerProbability") * 100)
    local MultiShoot = string.format("%.2f", Weapon:GetAttr("MultiShoot") * 100)
    ScreenPrint("\229\164\154\233\135\141\229\176\132\229\135\187\239\188\154" .. MultiShoot .. "%")
    ScreenPrint("\232\167\166\229\143\145\230\166\130\231\142\135\239\188\154" .. TRI .. "%")
    ScreenPrint("\231\136\134\228\188\164\239\188\154" .. CRD .. "%")
    ScreenPrint("\230\154\180\229\135\187\239\188\154" .. CRI .. "%")
  end
  ScreenPrint("\230\138\128\232\131\189\230\149\136\231\155\138\239\188\154" .. string.format("%.2f", SkillEfficiency * 100) .. "%")
  ScreenPrint("\230\138\128\232\131\189\232\128\144\228\185\133\239\188\154" .. string.format("%.2f", SkillSustain * 100) .. "%")
  ScreenPrint("\230\138\128\232\131\189\232\140\131\229\155\180\239\188\154" .. string.format("%.2f", SkillRange * 100) .. "%")
  ScreenPrint("\230\138\128\232\131\189\229\188\186\229\186\166\239\188\154" .. string.format("%.2f", SkillIntensity * 100) .. "%")
  ScreenPrint("\230\173\166\229\153\168\230\148\187\229\135\187\239\188\154" .. ATK_Wepon)
  ScreenPrint("\232\167\146\232\137\178\230\148\187\229\135\187\239\188\154" .. ATK_Char)
  ScreenPrint("\230\128\187\230\148\187\229\135\187\239\188\154" .. ATK)
end

function GM_Command:StatDamage()
  if not Const.bShowDamageDetails then
    ScreenPrint("\230\156\170\229\188\128\229\144\175\228\188\164\229\174\179\232\175\166\231\187\134\228\191\161\230\129\175")
    return
  end
  if Const.bStatDamage then
    Const.bStatDamage = false
    ScreenPrint("\232\175\165\230\172\161\231\187\159\232\174\161\230\128\187\232\174\161\228\188\164\229\174\179\239\188\154" .. string.format("%.5f", Const.TotalDamage))
    if Const.EndTime and Const.StartTime then
      ScreenPrint("\232\175\165\230\172\161\231\187\159\232\174\161\230\128\187\232\174\161\228\188\164\229\174\179\230\151\182\233\149\191\239\188\154" .. string.format("%.5f", Const.EndTime - Const.StartTime))
    end
    Const.TotalDamage = 0
  else
    ScreenPrint("\231\187\159\232\174\161\230\128\187\232\174\161\228\188\164\229\174\179\229\188\128\229\167\139\239\188\129\239\188\129\239\188\129")
    Const.TotalDamage = 0
    Const.bStatDamage = true
    Const.StartTime = nil
    Const.EndTime = nil
  end
end

function GM_Command:CheckCondition(ConditionId, bShowFailed)
  bShowFailed = bShowFailed or false
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    print(_G.LogTag, "CheckCondition Result: ", ConditionUtils.CheckCondition(Avatar, tonumber(ConditionId), bShowFailed))
  end
end

function GM_Command:ServerCheckCondition(ConditionId, bShowFailed)
  bShowFailed = bShowFailed or false
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function cb(ret)
      print(_G.LogTag, "ServerCheckCondition Result: ", ret)
    end
    
    ConditionUtils.ServerCheckCondition(Avatar, tonumber(ConditionId), cb, bShowFailed)
  end
end

function GM_Command:PrintGetCover(DoPrint)
end

function GM_Command:PrintUpdateCover(DoPrint)
end

function GM_Command:TrainingCreateMonster(...)
  local Params, CreateInfo = {
    ...
  }, {}
  for i = 1, #Params, 3 do
    table.insert(CreateInfo, {
      tonumber(Params[i]),
      tonumber(Params[i + 1]),
      tonumber(Params[i + 2])
    })
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self.Player)
  if nil ~= GameMode then
    GameMode:TriggerDungeonComponentFun("CreateMonster", CreateInfo)
  end
end

function GM_Command:TrainingSetMonsterAI(Flag)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self.Player)
  if nil ~= GameMode then
    local Param = false
    if "true" == Flag then
      Param = true
    end
    GameMode:TriggerDungeonComponentFun("SetMonsterAI", Param)
  end
end

function GM_Command:TrainingRemoveMonster()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self.Player)
  if nil ~= GameMode then
    GameMode:TriggerDungeonComponentFun("RemoveMonster")
  end
end

function GM_Command:TrainingClearCreateInfo()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self.Player)
  if nil ~= GameMode then
    GameMode:TriggerDungeonComponentFun("ClearCreateInfo")
  end
end

function GM_Command:TouchSpeedPitch(speed)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self:GetGameInstance(), 0)
  speed = tonumber(speed)
  Player.TurnSpeedPitch = speed
end

function GM_Command:TouchSpeedYaw(speed)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self:GetGameInstance(), 0)
  speed = tonumber(speed)
  Player.TurnSpeedYaw = speed
end

function GM_Command:TouchLimitPitch(TurnLimit)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self:GetGameInstance(), 0)
  TurnLimit = tonumber(TurnLimit)
  Player.TurnLimitPitch = math.pi / 180 * TurnLimit
end

function GM_Command:TouchLimitYaw(TurnLimit)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self:GetGameInstance(), 0)
  TurnLimit = tonumber(TurnLimit)
  Player.TurnLimitYaw = math.pi / 180 * TurnLimit
end

local CC = {}

function CC.PlayerLevelMin(Avatar, Params)
  if not Avatar then
    return
  end
  Avatar:GMSetPlayerLevel(Params)
end

function CC.DynamicEventCompleteTimes(Avatar, Params)
  PrintTable({Params = Params}, 10)
  Avatar:CallServerMethod("GMSetDynamicQuestCompleteTimes", table.unpack(Params))
end

function CC.PlayerLevelMax(Avatar, Params)
  if not Avatar then
    return
  end
  Avatar:GMSetPlayerLevel(Params)
end

function CC.QuestChain(Avatar, Params)
  GM_Command:SuccQuestChain(Params)
end

function CC.Impression(Avatar, Params)
  if type(Params) == "table" then
    GM_Command:CompleteImpressionSystem(tonumber(Params[1]))
  end
end

function CC.HaveResource(Avatar, Params)
  if not Avatar then
    return
  end
  local GMFunctionLibrary = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
  GMFunctionLibrary.ExecConsoleCommand(self:GetGameInstance(), "sgm ar " .. Params[1] .. " " .. Params[2])
end

function CC.Quest(Avatar, Params)
  GM_Command:SuccQuest(Params)
end

function CC.MechanismState(Avatar, Params)
  GM_Command:DedicatedServerCommand("TriggerMechanism", table.unpack(Params))
end

function CC.DungeonComplete(Avatar, Params)
  Avatar:CallServerMethod("GMDungeonComplete", table.unpack(Params))
end

function CC.HardBossComplete(Avatar, Params)
  Avatar:CallServerMethod("GMHardBossComplete", table.unpack(Params))
end

function CC.RougeLikeComplete(Avatar, Params)
  Avatar:CallServerMethod("GMRougeLikeComplete", Params)
end

function GM_Command:CompleteCondition(ConditionIdList)
  if not ConditionIdList then
    return
  end
  if type(ConditionIdList) ~= "table" then
    ConditionIdList = {
      tonumber(ConditionIdList)
    }
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Index = 1
  
  local function UnlockMgrOnConditionComplete(_, ConditionId)
    if ConditionId == ConditionIdList[Index] and Index < #ConditionIdList then
      Index = Index + 1
      while Index < #ConditionIdList and ConditionUtils.CheckCondition(Avatar, ConditionIdList[Index]) do
        Index = Index + 1
      end
      self:CompleteSingleCondition(ConditionIdList[Index])
    end
  end
  
  EventManager:AddEvent(EventID.ConditionComplete, self, UnlockMgrOnConditionComplete)
  local FirstCondition = ConditionIdList[1]
  if ConditionUtils.CheckCondition(Avatar, FirstCondition) then
    UnlockMgrOnConditionComplete(nil, FirstCondition)
  else
    self:CompleteSingleCondition(FirstCondition)
  end
end

function GM_Command:FreezeWorldComposition(bFreeze)
  bFreeze = bFreeze or 1
  bFreeze = tonumber(bFreeze)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self:GetGameInstance())
  local WCSubsystem = GameMode:GetWCSubSystem()
  if not WCSubsystem then
    return
  end
  if bFreeze > 0 then
    WCSubsystem:FreezeWorldComposition()
  else
    WCSubsystem:UnFreezeWorldComposition()
  end
end

function GM_Command:BreakableItemNavEnableInLower(IsEnable)
  UE4.URuntimeCommonFunctionLibrary.EnableBreakableItemNavModifyInLower(tonumber(IsEnable) > 0)
end

function GM_Command:CompleteSingleCondition(ConditionId)
  if not ConditionId then
    return
  end
  ConditionId = tonumber(ConditionId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if ConditionUtils.CheckCondition(Avatar, ConditionId) then
    return
  end
  local ConditionInfo = DataMgr.Condition[ConditionId]
  local ConditionMap = ConditionInfo.ConditionMap
  local ConditionLogic = string.lower(ConditionInfo.ConditionLogic)
  for k, v in pairs(ConditionMap) do
    for i = 1, #v do
      if not ConditionUtils["Judge" .. k](Avatar, v[i]) then
        if CC[k] then
          CC[k](Avatar, v[i])
          if "or" == ConditionLogic then
            return
          end
        else
          print(_G.LogTag, string.format("\230\157\161\228\187\182\229\174\140\230\136\144\229\135\189\230\149\176\227\128\144%s\227\128\145\228\184\141\229\173\152\229\156\168", k))
        end
      end
    end
  end
end

function GM_Command:CompleteSystemCondition()
  local GMFunctionLibrary = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
  GMFunctionLibrary.ExecConsoleCommand(self:GetGameInstance(), "sgm sysu")
  self:SuccessAllSystemGuide()
end

function GM_Command:MockAllSystemCondition(bSave)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar.bCrackUnlockAllSystems = true
  end
  local GameInstance = self:GetGameInstance()
  local UIManager = GameInstance:GetGameUIManager()
  local BattleMainUI = UIManager:GetUIObj("BattleMain")
  if BattleMainUI then
    BattleMainUI:InitBtnList()
    BattleMainUI.Btn_Esc:LoadImage(11)
    BattleMainUI.Battle_Map:OnChangeKeyBoardSet()
    BattleMainUI:EndChat()
    BattleMainUI:InitChat()
    BattleMainUI:_RefreshEscReddot()
  end
  if "1" == bSave then
    local EMCache = require("EMCache.EMCache")
    EMCache:Set("GM_MockAllSystemCondition", true, true)
  end
end

function GM_Command:MockSystemCondition(UIUnlockRuleId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar.CrackedUnlockSystems[UIUnlockRuleId] = true
  end
  local GameInstance = self:GetGameInstance()
  local UIManager = GameInstance:GetGameUIManager()
  local BattleMainUI = UIManager:GetUIObj("BattleMain")
  if BattleMainUI then
    BattleMainUI:InitBtnList()
  end
end

function GM_Command:ShowSystemUnlock(ID)
  local Avatar = GWorld:GetAvatar()
  Avatar:OnSystemFirstTimeUnlock_Internal(ID, function()
    UIManager(GWorld.GameInstance):UnLoadUINew("SystemUnlockGuide")
    local BattleMainUI = UIManager(GWorld.GameInstance):GetUIObj("BattleMain")
    if nil ~= BattleMainUI and nil ~= BattleMainUI.Pos_SubSystemUnlock then
      BattleMainUI.Pos_SubSystemUnlock:ClearChildren()
      BattleMainUI.Pos_SubSystemUnlock:SetVisibility(ESlateVisibility.Collapsed)
    end
  end)
end

function GM_Command:FakeUIUnlockConditionComplete(...)
  local ConditionIds = {
    ...
  }
  local Length = #ConditionIds
  local Avatar = GWorld:GetAvatar()
  if Avatar and Length > 0 then
    for i = 1, Length do
      Avatar:UIUnlockMgrOnConditionComplete(tonumber(ConditionIds[i]))
    end
  end
end

function GM_Command:UnLockAllDungeonSelectLevels()
  local SelectDungeonData = DataMgr.SelectDungeon
  local AllDungeonConditions = {}
  local Avatar = GWorld:GetAvatar()
  for _, Data in pairs(SelectDungeonData) do
    local ConditionList = Data.Condition
    if ConditionList then
      for _, ConditionId in pairs(ConditionList) do
        if not ConditionUtils.CheckCondition(Avatar, ConditionId) then
          table.insert(AllDungeonConditions, ConditionId)
        end
      end
    end
  end
  self:CompleteCondition(AllDungeonConditions)
end

function GM_Command:UnLockAllDungeonLevels()
  local DungeonData = DataMgr.Dungeon
  local AllDungeonConditions = {}
  local Avatar = GWorld:GetAvatar()
  for _, Data in pairs(DungeonData) do
    local ConditionList = Data.Condition
    if ConditionList then
      for _, ConditionId in pairs(ConditionList) do
        if not ConditionUtils.CheckCondition(Avatar, ConditionId) then
          table.insert(AllDungeonConditions, ConditionId)
        end
      end
    end
  end
  self:CompleteCondition(AllDungeonConditions)
end

function GM_Command:PlaySequence(Path)
  local SequenceAsset = LoadObject(Path)
  if not SequenceAsset then
    DebugPrint("error GM\230\146\173\230\148\190sequence\228\188\160\229\133\165\232\183\175\229\190\132\233\148\153\232\175\175", Path)
    return
  end
  local SA, SP = UE4.ULevelSequencePlayer.CreateLevelSequencePlayer(self:GetGameInstance(), SequenceAsset, UE4.FMovieSceneSequencePlaybackSettings())
  SP:Play()
end

function GM_Command:FSMDebug(EidOrTag)
  if nil ~= EidOrTag and nil == tonumber(EidOrTag) then
    UE4.UCharacterFSM.EnableTagDebug(EidOrTag)
    return
  end
  local GameInstance = self:GetGameInstance()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  if not EidOrTag then
    PlayerCharacter.CharFSMComp.bDebugMode = not PlayerCharacter.CharFSMComp.bDebugMode
  else
    local Entity = Battle(PlayerCharacter):GetEntity(tonumber(EidOrTag))
    if Entity then
      Entity.CharFSMComp.bDebugMode = not Entity.CharFSMComp.bDebugMode
    end
  end
end

function GM_Command:CompleteImpressionSystem(TalkTriggerId, State)
  TalkTriggerId = tonumber(TalkTriggerId)
  local ErrorCode = ""
  
  local function printError()
    DebugPrint("GM_Command:CompleteImpressionSystem@", ErrorCode)
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    UIManager:ShowUITip(UIConst.Tip_CommonToast, ErrorCode, 3)
  end
  
  if not TalkTriggerId then
    ErrorCode = "TalkTriggerId\228\184\186\231\169\186"
    printError()
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    ErrorCode = "Avatar\228\184\141\229\173\152\229\156\168"
    printError()
    return
  end
  if Avatar.ImpressionTalkTriggers[TalkTriggerId] then
    ErrorCode = "\229\175\185\229\186\148\231\154\132\229\175\185\232\175\157\229\183\178\229\174\140\230\136\144\239\188\140\230\151\160\230\179\149\233\135\141\229\164\141\229\174\140\230\136\144"
    printError()
    return
  end
  Avatar:SetTalkTriggerComplete_New(TalkTriggerId)
end

function GM_Command:SystemGuideSwitch(val)
  if "Open" == val then
    SystemGuideManager.Invalid = false
    DebugPrint("\231\179\187\231\187\159\229\188\149\229\175\188\230\137\147\229\188\128")
    return
  end
  if "Close" == val then
    SystemGuideManager.Invalid = true
    DebugPrint("\231\179\187\231\187\159\229\188\149\229\175\188\229\133\179\233\151\173")
    return
  end
end

function GM_Command:SuccessAllSystemGuide()
  DebugPrint("GM_Command:SuccessAllSystemGuide:Success all SystemGuide")
  SystemGuideManager:GMEnforceFinishAllSysGuide()
end

function GM_Command:SwitchCullModifier(TurnOn)
  if "true" == TurnOn then
    DebugPrint("UE4.AEMRecastNavMesh.SwitchCullModifier(true)")
    UE4.AEMRecastNavMesh.SwitchCullModifier(true)
  else
    DebugPrint("UE4.AEMRecastNavMesh.SwitchCullModifier(false)")
    UE4.AEMRecastNavMesh.SwitchCullModifier(false)
  end
end

function GM_Command:I18Time(FormatID, Language)
  Language = string.lower(Language)
  if "cn" == Language then
    DebugPrint("Current I18Time: " .. GDate(FormatID, nil, CommonConst.SystemLanguages.CN))
  elseif "en" == Language then
    DebugPrint("Current I18Time: " .. GDate(FormatID, nil, CommonConst.SystemLanguages.EN))
  elseif "jp" == Language then
    DebugPrint("Current I18Time: " .. GDate(FormatID, nil, CommonConst.SystemLanguages.JP))
  elseif "kr" == Language then
    DebugPrint("Current I18Time: " .. GDate(FormatID, nil, CommonConst.SystemLanguages.KR))
  else
    DebugPrint("Current I18Time: " .. GDate(FormatID, nil, CommonConst.SystemLanguages.CN))
  end
end

function GM_Command:PrintGuideBook()
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar.GuideBook then
    for i, v in pairs(Avatar.GuideBook) do
      local info = 1 == v.Reward and "\230\156\170\233\162\134\229\143\150" or "\229\183\178\233\162\134\229\143\150"
      DebugPrint("\230\149\153\229\173\166\230\157\161\231\155\174Id:", i, "\231\138\182\230\128\129:", info)
    end
  end
end

function GM_Command:GuideBookGetReward(GuideId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:GuideBookGetReward(tonumber(GuideId))
  end
end

function GM_Command:TestWarningToast(Context, LastTime)
  local GameInstance = self:GetGameInstance()
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:ShowUITip(UIConst.Tip_CommonWarning, Context, tonumber(LastTime))
end

function GM_Command:PlayLightHit(IsSelf, HitRule)
  local GameState = UE4.UGameplayStatics.GetGameState(self.Player)
  for _, Target in pairs(GameState.MonsterMap) do
    if Target:GetCamp() == ECampName.Monster then
      local HitParams = UE4.FHitParams()
      HitParams.CauseHitName = HitRule or "LightHit_120"
      HitParams.CauseHitType = Const.CauseHitTypeNormal
      Target:SetCharacterTag("LightHit")
      Target:ProcessHit("LightHit", self.Player, HitParams)
    end
  end
  if 1 == tonumber(IsSelf) then
    local HitParams = UE4.FHitParams()
    HitParams.CauseHitName = HitRule or "LightHit_120"
    HitParams.CauseHitType = Const.CauseHitTypeNormal
    self.Player:SetCharacterTag("LightHit")
    self.Player:ProcessHit("LightHit", self.Player, HitParams)
  end
end

function GM_Command:PlayLightHitRanged(IsSelf, HitRule)
  local GameState = UE4.UGameplayStatics.GetGameState(self.Player)
  for _, Target in pairs(GameState.MonsterMap) do
    if Target:GetCamp() == ECampName.Monster then
      local HitParams = UE4.FHitParams()
      HitParams.CauseHitName = HitRule or "RangedWeapon_Common"
      HitParams.CauseHitType = Const.CauseHitTypeNormal
      Target:SetCharacterTag("LightHitRanged")
      Target:ProcessHit("LightHitRanged", self.Player, HitParams)
    end
  end
  if 1 == tonumber(IsSelf) then
    local HitParams = UE4.FHitParams()
    HitParams.CauseHitName = HitRule or "RangedWeapon_Common"
    HitParams.CauseHitType = Const.CauseHitTypeNormal
    self.Player:SetCharacterTag("LightHitRanged")
    self.Player:ProcessHit("LightHitRanged", self.Player, HitParams)
  end
end

function GM_Command:PlayHeavyHit(IsSelf, HitRule)
  local GameState = UE4.UGameplayStatics.GetGameState(self.Player)
  for _, Target in pairs(GameState.MonsterMap) do
    if Target:GetCamp() == ECampName.Monster then
      local HitParams = UE4.FHitParams()
      HitParams.CauseHitName = HitRule or "HeavyHit_30"
      HitParams.CauseHitType = Const.CauseHitTypeNormal
      Target:SetCharacterTag("HeavyHit")
      Target:ProcessHit("HeavyHit", self.Player, HitParams)
    end
  end
  if 1 == tonumber(IsSelf) then
    local HitParams = UE4.FHitParams()
    HitParams.CauseHitName = HitRule or "HeavyHit_30"
    HitParams.CauseHitType = Const.CauseHitTypeNormal
    self.Player:SetCharacterTag("HeavyHit")
    self.Player:ProcessHit("HeavyHit", self.Player, HitParams)
  end
end

function GM_Command:PlayHitFly(IsSelf, HitRule)
  local GameState = UE4.UGameplayStatics.GetGameState(self.Player)
  for _, Target in pairs(GameState.MonsterMap) do
    local HitParams = UE4.FHitParams()
    HitParams.CauseHitName = HitRule or "HitFly_XY500Z1000"
    HitParams.CauseHitType = Const.CauseHitTypeNormal
    Target:SetCharacterTag("HitFly")
    Target:ProcessHitFly(self.Player, HitParams)
  end
  if 1 == tonumber(IsSelf) then
    local HitParams = UE4.FHitParams()
    HitParams.CauseHitName = HitRule or "HitFly_XY400Z300"
    HitParams.CauseHitType = Const.CauseHitTypeNormal
    self.Player:SetCharacterTag("HitFly")
    self.Player:ProcessHitFly(self.Player, HitParams)
  end
end

function GM_Command:PlayHitFly_Force(HitRule)
  local GameState = UE4.UGameplayStatics.GetGameState(self.Player)
  for _, Target in pairs(GameState.MonsterMap) do
    if Target:GetCamp() == ECampName.Monster then
      local HitParams = UE4.FHitParams()
      HitParams.CauseHitName = HitRule or "HitFly_Force_Common"
      HitParams.CauseHitType = Const.CauseHitTypeNormal
      Target:SetCharacterTag("HitFly")
      Target:ProcessHitFly(self.Player, HitParams)
    end
  end
end

function GM_Command:EnterRougeLike(SeasonId, Difficulty, SquadId)
  print(_G.LogTag, "EnterRougeLike", SeasonId, Difficulty, SquadId)
  
  local function cb(ret)
    if not ErrorCode:Check(ret) then
      return
    end
  end
  
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:CallServer("GMEnterRougeLike", cb, tonumber(SeasonId), tonumber(Difficulty), tonumber(SquadId))
  end
end

function GM_Command:UpgradeAward(AwardType, AwardId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:UpgradeAward(AwardType, AwardId)
  end
end

function GM_Command:StartAutoTest()
  local RoleId = self.Player.CurrentRoleId
  local GameMode = UE4.UGameplayStatics.GetGameMode(self.Player)
  local Location = self.Player:K2_GetActorLocation()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self.Player, 0)
  local AvatarInfo = PlayerController:GetAvatarInfo()
  local Context = AEventMgr.CreateUnitContext()
  Context.UnitId = 1
  Context.IntParams:Add("RoleId", RoleId)
  Context.UnitType = "Phantom"
  Context.Loc = Location
  Context.NameParams:Add("Camp", "Player")
  Context.BoolParams:Add("FixLocation", true)
  Context:AddLuaTable("AvatarInfo", AvatarInfo)
  GameMode.EMGameState.EventMgr:CreateUnitNew(Context, false)
end

function GM_Command:AutoBattleTestServer(Id)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:CallServerMethod("GMTestAutoBattle", Id)
  end
end

function GM_Command:AutoBattleTestClient(Id)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:CallServerMethod("GMTestAutoBattle", Id, true)
  end
end

function GM_Command:StopAutoBattleTest(bClientMode)
  local ret = false
  if bClientMode then
    ret = true
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:CallServerMethod("GMStopAutoBattleTest", ret)
  end
end

function GM_Command:StartVote()
  if IsStandAlone(self:GetGameInstance()) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self.Player)
    GameMode:TriggerActiveGameModeState(5)
  else
    self:DedicatedServerCommand("StartVote")
  end
  UIManager(self.Player):LoadUINew("Vote")
end

function GM_Command:SpawnPet()
  if IsStandAlone(self:GetGameInstance()) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self.Player)
    GameMode:TriggerSpawnPet()
  else
    self:DedicatedServerCommand("SpawnPet")
  end
end

function GM_Command:PostCustomEvent(EventName)
  DebugPrint("GM PostCustomEvent", EventName)
  if IsStandAlone(self:GetGameInstance()) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self.Player)
    GameMode:PostCustomEvent(EventName)
  else
    self:DedicatedServerCommand("PostCustomEvent", EventName)
  end
end

function GM_Command:SetFeinaStar(NewStar)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self.Player)
  GameMode:TriggerDungeonComponentFun("SetStar", tonumber(NewStar))
end

function GM_Command:EnterAbyss(_AbyssDungeonId, _AbyssDifficulty)
  local AbyssDungeonId = tonumber(_AbyssDungeonId)
  local DungeonId = DataMgr.AbyssDungeon[AbyssDungeonId].DungeonId
  local AbyssDifficulty = tonumber(_AbyssDifficulty)
  local CustomPreInitInfo = {AbyssDungeonId = AbyssDungeonId, AbyssDifficulty = AbyssDifficulty}
  GWorld.GameInstance.TempAbyssInfo = CustomPreInitInfo
  DebugPrint("GM_EnterAbyss AbyssDungeonId", AbyssDungeonId, "DungeonId", DungeonId, "AbyssDifficulty", AbyssDifficulty)
  self:EnterDungeon(DungeonId)
end

function GM_Command:EnterAbyssNew(AbyssId, AbyssLevelId, AbyssDungeonIndex)
  local Avatar = self:GetClientAvatar()
  if Avatar then
    Avatar:TriggerEnterAbyss(Callback, tonumber(AbyssId), tonumber(AbyssLevelId), tonumber(AbyssDungeonIndex))
  end
end

function GM_Command:PrintAllDailyTask()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  PrintTable({
    DailyTasks = Avatar.DailyTasks:all_dump(Avatar.DailyTasks)
  }, 10)
  PrintTable({
    DailyTaskProgress = Avatar.DailyTaskProgress:all_dump(Avatar.DailyTaskProgress)
  }, 10)
  PrintTable({
    DailyTaskAchvs = Avatar.DailyTaskAchvs:all_dump(Avatar.DailyTaskAchvs)
  }, 10)
  PrintTable({
    CurrentTaskProgress = Avatar.CurrentTaskProgress
  }, 10)
end

function GM_Command:AbyssPassRoom()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self.Player)
  for i, MonsterSpawn in pairs(GameMode.MonsterSpawnMap) do
    MonsterSpawn:ClearMonsterSpawnInfo()
    if IsValid(GameMode.MonsterSpawnMap:Find(MonsterSpawn.UnitSpawnId)) then
      GameMode.MonsterSpawnMap:Remove(MonsterSpawn.UnitSpawnId)
    end
    MonsterSpawn:K2_DestroyActor()
  end
  self:ServerBattleCommand("KillMonster", self.Player.Eid)
  for _, SubGameMode in pairs(GameMode.SubGameModeInfo) do
    SubGameMode:BpDelTimer("AbyssBattle", false, Const.GameModeEventServerClient)
    SubGameMode:AbyssRoomEnd(EAbyssRoomEndReason.MissionClear)
    SubGameMode:TeleportToNextRoom()
    return
  end
end

function GM_Command:ReduceBuffLayer(BuffId, Layer)
  local GameInstance = self:GetGameInstance()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  Player:ReduceBuffLayer(Player, tonumber(BuffId), tonumber(Layer))
end

function GM_Command:ChangeBuffLastTime(BuffId, LastTimeValue, bIsExpand)
  local GameInstance = self:GetGameInstance()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  Player:ChangeBuffLastTime(tonumber(BuffId), 0, tonumber(LastTimeValue), bIsExpand)
end

function GM_Command:TestTrackingQuest(QuestIdStr)
  local QuestId = tonumber(QuestIdStr)
  local Avatar = GWorld:GetAvatar()
  if Avatar and QuestId then
    Avatar:SetQuestTracking(QuestId)
  end
end

function GM_Command:SetBGMOpenDebug(bOpenDebug)
  if "true" == bOpenDebug then
    AudioManager(self.Player):SetBGMDebugValue(true)
  elseif "false" == bOpenDebug then
    AudioManager(self.Player):SetBGMDebugValue(false)
  end
end

function GM_Command:PrintBGMInfo()
  AudioManager(self.Player):PrintBGMInfo()
end

function GM_Command:GetAllBusVolume()
  AudioManager(self.Player):GetAllBusVolume()
end

function GM_Command:GetAllBusPauseState()
  AudioManager(self.Player):GetAllBusPauseState()
end

function GM_Command:ReloadAllBank()
  UE4.UFMODBlueprintStatics.ReloadAllBank()
end

function GM_Command:TriggerLoadedEvent()
  DebugPrint("TriggerLoadedEvent")
  local GameMode = UE4.UGameplayStatics.GetGameMode(self:GetGameInstance())
  if GameMode then
    GameMode:TriggerLoadedEvent()
    return
  end
end

function GM_Command:SetDrawDebugEnabled(bEnabled)
  if "true" == bEnabled then
    AudioManager(self.Player).DrawDebug = true
  elseif "false" == bEnabled then
    AudioManager(self.Player).DrawDebug = false
  end
end

function GM_Command:SetSoundPointCompDebugEnabled(bEnabled)
  if not self.Player.SoundPointManagerComp then
    return
  end
  if "true" == bEnabled then
    self.Player.SoundPointManagerComp.EnableDebug = true
  elseif "false" == bEnabled then
    self.Player.SoundPointManagerComp.EnableDebug = false
  end
end

function GM_Command:SetSoundSplineDrawDebug(bEnabled)
  local Enable
  if "true" == bEnabled then
    Enable = true
  elseif "false" == bEnabled then
    Enable = false
  end
  local SoundSplines = UGameplayStatics.GetAllActorsOfClass(self.Player, ASoundSpline:StaticClass()):ToTable()
  for _, SoundSpline in pairs(SoundSplines) do
    SoundSpline.SplineDrawDebug = Enable
  end
end

function GM_Command:ShowCachedFMODEventAndFrequency()
  AudioManager(self.Player):GetCachedFMODEventLRU()
end

function GM_Command:SetReverLogicOpenbDebug(bOpenDebug)
  if "true" == bOpenDebug then
    AudioManager(self.Player).ReverbLogicDebug = true
  elseif "false" == bOpenDebug then
    AudioManager(self.Player).ReverbLogicDebug = false
  end
end

function GM_Command:PrintHeadPhonePlugIn()
  AudioManager(self.Player):DebugPrintHeadPhonePlugInParam()
end

function GM_Command:SetAudioManagerTestRegionId(InRegionId)
  AudioManager(self.Player).TestRegionId = tonumber(InRegionId)
end

function GM_Command:SimulateBGMEnterNewRegion(NewRegionId)
  AudioManager(self.Player).TestRegionId = tonumber(NewRegionId)
  AudioManager(self.Player):CheckLevelSoundAndRegionId(tonumber(NewRegionId))
end

function GM_Command:SetLineSoundDebug(bOpenDebug)
  if "true" == bOpenDebug then
    AudioManager(self.Player).LineSound_DrawDebug = true
  elseif "false" == bOpenDebug then
    AudioManager(self.Player).LineSound_DrawDebug = false
  end
end

function GM_Command:SectorSoundDebug(bOpenDebug)
  if "true" == bOpenDebug then
    AudioManager(self.Player).SectorSound_DrawDebug = true
  elseif "false" == bOpenDebug then
    AudioManager(self.Player).SectorSound_DrawDebug = false
  end
end

function GM_Command:CircularSoundDebug(bOpenDebug)
  if "true" == bOpenDebug then
    AudioManager(self.Player).Circular_DrawDebug = true
  elseif "false" == bOpenDebug then
    AudioManager(self.Player).Circular_DrawDebug = false
  end
end

function GM_Command:PrintEventsMap()
  AudioManager(self.Player):PrintEventsMap()
end

function GM_Command:RogueShopTest()
  local UIManager = self:GetGameInstance():GetGameUIManager()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local RougeLikeManager = GWorld.RougeLikeManager
  if not RougeLikeManager then
    return
  end
  local Shop = RougeLikeManager.Shop:Keys()
  local ShopId
  if Shop:Length() > 0 then
    ShopId = Shop[1]
  end
  UIManager:LoadUINew("RougeShop", ShopId)
end

function GM_Command:RougeDetailsTest()
  local UIManager = self:GetGameInstance():GetGameUIManager()
  UIManager:LoadUINew("RougeBag")
end

function GM_Command:ShowRougeManual()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    PrintTable(Avatar.RougeLike.Manual, 5)
  end
end

function GM_Command:DisableBattleWheel()
  local MyPlayerController = UE4.UGameplayStatics.GetPlayerController(self:GetGameInstance(), 0)
  DebugPrint("gmy@GM_Command:DisableBattleWheel", MyPlayerController.bEnableBattleWheel)
  MyPlayerController.bEnableBattleWheel = false
  if self.Player then
    self.Player:RefreshBattleWheelEnableState()
  end
end

function GM_Command:EnableBattleWheel()
  local MyPlayerController = UE4.UGameplayStatics.GetPlayerController(self:GetGameInstance(), 0)
  DebugPrint("gmy@GM_Command:EnableBattleWheel", MyPlayerController.bEnableBattleWheel)
  MyPlayerController.bEnableBattleWheel = true
  if self.Player then
    self.Player:RefreshBattleWheelEnableState()
  end
end

function GM_Command:FillBattleWheel()
  local Avatar = GWorld:GetAvatar()
  local ResourceList = {
    40001,
    40002,
    40003,
    40011,
    40012,
    40013,
    41001,
    41002,
    41003,
    41004,
    41005,
    41006,
    41007,
    41008,
    41009,
    41010,
    41011,
    41012,
    41013,
    41014
  }
  for Index, ResourceId in ipairs(ResourceList) do
    Avatar:ChangeBattleWheel(1, Index, ResourceId)
  end
end

function GM_Command:PrintBattleWheel()
  local Avatar = GWorld:GetAvatar()
  local Wheels = Avatar.Wheels
  for i = 1, 24 do
    DebugPrint("gmy@GM_Command GM_Command:PrintBattleWheel", i, Wheels[1][i].ResourceId)
  end
end

function GM_Command:AddPet(PetId)
  self:ServerBattleCommand("AddPet", PetId)
end

function GM_Command:AddPetAffix(AffixId)
  self:ServerBattleCommand("AddPetAffix", AffixId)
end

function GM_Command:RemovePet()
  self:ServerBattleCommand("RemovePet")
end

function GM_Command:RemovePetAffix(AffixId)
  self:ServerBattleCommand("RemovePetAffix", AffixId)
end

function GM_Command:PrintTeammates()
  local Players = self.Player:GetAllTeammates()
  for Index, Player in pairs(Players) do
    DebugPrint("gmy@GM_Command:PrintTeammates", Index, Player:GetName())
  end
end

function GM_Command:PrintPlayers()
  local GameState = UE4.UGameplayStatics.GetGameState(self.Player)
  local Players = GameState:GetAllPlayer()
  for Index, Player in pairs(Players) do
    DebugPrint("gmy@GM_Command:PrintPlayers", Index, Player:GetName())
  end
end

function GM_Command:ShowCountdownToast(TotalTime, WarningTime)
  TotalTime = tonumber(TotalTime)
  WarningTime = tonumber(WarningTime)
  local GameInstance = self:GetGameInstance()
  local UIManager = GameInstance:GetGameUIManager()
  if UIManager then
    local UI = UIManager:LoadUINew("DungeonCaptureFloat", TotalTime, WarningTime)
    UI:UIStateChange_OnTarget()
  end
end

function GM_Command:AddCountdownTime(Time)
  Time = tonumber(Time)
  local GameInstance = self:GetGameInstance()
  local UIManager = GameInstance:GetGameUIManager()
  if UIManager then
    local UI = UIManager:GetUIObj("DungeonCaptureFloat")
    UI:AddRemainingTime(Time)
  end
end

function GM_Command:ForceUseSkill(Eid, SkillId)
  if DrawDebugTest then
    local _SkillId = tonumber(SkillId)
    local _OtherPlayerId = tonumber(Eid)
    self.Player:ServerUseSkillTest(_OtherPlayerId, _SkillId)
  end
end

function GM_Command:UnlockMonsterGallery()
  local Avatar = GWorld:GetAvatar()
  for RuleId, GalleryData in pairs(DataMgr.GalleryRule) do
    if not GalleryData.DisableTrainingGround then
      local UnitId = GalleryData.PreferredMonsterId
      Avatar:CheckFirstMonster(UnitId, true)
    end
  end
end

function GM_Command:ShowHudReward(Type, Id, Count)
  local Rewards = {}
  Id = tonumber(Id)
  if "Quest" == Type then
    if DataMgr.QuestChain[Id] == nil or nil == DataMgr.QuestChain[Id].QuestChainReward then
      DebugPrint("QuestChainId is error or QuestChainReward is nil")
      return
    end
    local RewardList = DataMgr.QuestChain[Id].QuestChainReward
    for _, RewardId in pairs(RewardList) do
      local RewardInfo = DataMgr.Reward[RewardId]
      if RewardInfo then
        local Ids = RewardInfo.Id or {}
        local RewardCount = RewardInfo.Count or {}
        local TableName = RewardInfo.Type or {}
        for i = 1, #Ids do
          local ItemId = Ids[i]
          local Count = RewardUtils:GetCount(RewardCount[i])
          local Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
          local ItemType = TableName[i]
          local RewardContent = {
            ItemType = ItemType,
            ItemId = ItemId,
            Count = Count,
            Rarity = Rarity
          }
          table.insert(Rewards, RewardContent)
        end
      end
    end
  elseif "Reward" == Type then
    local RewardInfo = DataMgr.Reward[Id]
    local RewardList = {}
    if RewardInfo then
      local RewardIds = RewardInfo.Id or {}
      local RewardCounts = RewardInfo.Count or {}
      local RewardTypes = RewardInfo.Type or {}
      for i = 1, #RewardIds do
        local ItemId = RewardIds[i]
        local Count = RewardUtils:GetCount(RewardCounts[i])
        local Rarity = ItemUtils.GetItemRarity(ItemId, RewardTypes[i])
        local ItemType = RewardTypes[i]
        local RewardContent = {
          ItemType = ItemType,
          ItemId = ItemId,
          Count = Count,
          Rarity = Rarity
        }
        table.insert(Rewards, RewardContent)
      end
    end
  else
    local RewardContent = {
      ItemType = Type,
      ItemId = Id,
      Count = Count,
      Rarity = ItemUtils.GetItemRarity(Id, Type)
    }
    table.insert(Rewards, RewardContent)
  end
  
  local function SortByRarity(a, b)
    return a.Rarity > b.Rarity
  end
  
  table.sort(Rewards, SortByRarity)
  UIUtils.ShowHudReward("\230\181\139\232\175\149", Rewards)
end

function GM_Command:FXPriorityTest()
  local path1 = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack01_dg_Pro.NS_Huipo_RunAttack01_dg_Pro"
  local path2 = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack01_dg_Pro.NS_Huipo_RunAttack01_dg_Pro"
  local path3 = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack01_dg_Pro.NS_Huipo_RunAttack01_dg_Pro"
  self.Player.FXComponent:PlayFX(LoadObject(path1), self.Player.Mesh, nil, self.Player:K2_GetActorLocation(), FRotator(0, 0, 0), true, false, false, false, EAttachLocation.KeepWorldPosition, EFXPriorityType.Lowest)
  self.Player:AddTimer(0.1, function()
    self.Player.FXComponent:PlayFX(LoadObject(path2), self.Player.Mesh, nil, self.Player:K2_GetActorLocation() + FVector(0, 300, 0), FRotator(0, 0, 0), true, false, false, false, EAttachLocation.KeepWorldPosition, EFXPriorityType.Dead)
  end, false, 0, "FXTest1", false)
  self.Player:AddTimer(0.2, function()
    self.Player.FXComponent:PlayFX(LoadObject(path3), self.Player.Mesh, nil, self.Player:K2_GetActorLocation() + FVector(0, 500, 0), FRotator(0, 0, 0), true, false, false, false, EAttachLocation.KeepWorldPosition, EFXPriorityType.Born)
  end, false, 0, "FXTest2", false)
end

local FXPriorityTest_CharName = {
  "Baiheng",
  "Feina",
  "Haier",
  "Heitao",
  "Landi",
  "Linen",
  "Maer",
  "Nvzhu",
  "Saiqi",
  "Shuimu",
  "Songlu",
  "Xibi",
  "Xier",
  "Yeer",
  "Yuming",
  "Zhangyu"
}
local AllFXTestObj = {}

function GM_Command:FXPriorityTest_Char(Index)
  local FXPreloadGameInstanceSubsystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self.Player, UFXPreloadGameInstanceSubsystem)
  local PlayerLoc = self.Player:K2_GetActorLocation()
  local XBiasDis = FVector(100, 0, 0)
  local XBiasCount = 0
  local YBiasDis = FVector(0, 100, 0)
  local YBiasCount = 0
  
  local function PlayCharFX(Name)
    if not Name then
      return
    end
    FXPreloadGameInstanceSubsystem:PreloadCharacterFX(Name)
    local CharacterNiagaras = FXPreloadGameInstanceSubsystem.CharacterNiagaraSystems:ToArray()
    for key, Obj in pairs(CharacterNiagaras) do
      local FXObj = self.Player.FXComponent:PlayFX(Obj, self.Player.Mesh, nil, PlayerLoc, FRotator(0, 0, 0), true, false, false, false, EAttachLocation.KeepWorldPosition, EFXPriorityType.Lowest)
      table.insert(AllFXTestObj, FXObj)
      XBiasCount = XBiasCount + 1
    end
    YBiasCount = YBiasCount + 1
  end
  
  if Index and tonumber(Index) > 0 then
    local Name = FXPriorityTest_CharName[tonumber(Index)]
    PlayCharFX(Name)
  else
    for idx, Name in pairs(FXPriorityTest_CharName) do
      PlayCharFX(Name)
    end
  end
end

function GM_Command:ClearFXTest()
  for _, FXObj in pairs(AllFXTestObj) do
    if IsValid(FXObj) then
      UE4.UCharacterFunctionLibrary.DeactivateNiagaraImmediately(FXObj)
    end
  end
  AllFXTestObj = {}
  self:ManualGC()
end

function GM_Command:PrintAllFXPath()
  local Folder = "Asset/Effect/Niagara/"
  local PreloadSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self.Player, UE4.URolePreloadGameInstanceSubsystem)
  local _, NiagaraPaths = PreloadSystem.GetFolderAssetPaths(Folder)
  for _, path in ipairs(NiagaraPaths:ToTable()) do
    print(_G.LogTag, path)
  end
end

function GM_Command:LevelFXTest(Path)
  self.Player.FXComponent:SpawnFXAtLocation_Level(Path, "Test", true, self.Player:K2_GetActorLocation())
  self.Player.FXComponent:SpawnFXAtLocation_Level(Path, "Test", true, self.Player:K2_GetActorLocation())
  
  local function cb(obj)
    print(_G.LogTag, "------------", obj)
  end
end

function GM_Command:FXPriorityTest_One(Path, Count)
  if not Path then
    return
  end
  for _, FXObj in pairs(AllFXTestObj) do
    if IsValid(FXObj) then
      UE4.UCharacterFunctionLibrary.DeactivateNiagaraImmediately(FXObj)
    end
  end
  AllFXTestObj = {}
  local Asset = LoadObject(Path)
  Count = Count or 30
  for i = 1, Count do
    local FXObj = self.Player.FXComponent:PlayFX(Asset, self.Player.Mesh, nil, self.Player:K2_GetActorLocation(), FRotator(0, 0, 0), true, false, false, false, EAttachLocation.KeepWorldPosition, EFXPriorityType.Lowest)
    table.insert(AllFXTestObj, FXObj)
  end
end

function GM_Command:CharacterTag()
  DebugPrint("Tianyi@ CurrentTag: " .. self.Player:GetCharacterTag())
end

function GM_Command:CalcAttrOpt(Value)
  local NumValue = tonumber(Value)
  if not NumValue then
    return
  end
  local AttributesSetSubSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UAttributesSetSubsystem:StaticClass())
  if 0 == NumValue then
    AttributesSetSubSystem:SwitchCalcAttrOptimization(false)
  elseif 1 == NumValue then
    AttributesSetSubSystem:SwitchCalcAttrOptimization(true)
  end
end

function GM_Command:IsQuestChainLock(QuestChainId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if Avatar:IsQuestChainLock(tonumber(QuestChainId)) then
    DebugPrint("Lock", QuestChainId)
  else
    DebugPrint("Not Lock", QuestChainId)
  end
end

function GM_Command:IsQuestChainUnlock(QuestChainId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if Avatar:IsQuestChainUnlock(tonumber(QuestChainId)) then
    DebugPrint("UnLock", QuestChainId)
  else
    DebugPrint("Not UnLock", QuestChainId)
  end
end

function GM_Command:MonsterSpawnPointDistributeLogicTest()
  AMonsterSpawn.GMTestDistributedMonsterLogic(self.Player)
end

function GM_Command:UMGAnimationsTime(WidgetPath)
  local GameInstance = self:GetGameInstance()
  local UIManager = GameInstance:GetGameUIManager()
  UWidgetLayoutLibrary.RemoveAllWidgets(GameInstance)
  local NewWidget = UIManager:CreateWidget(WidgetPath, true)
  if nil == NewWidget then
    ScreenPrint("can not find Widget")
    return
  end
  local AllAnimations = UE4.UUIFunctionLibrary.GetAllAnimationOfUserWidget(NewWidget)
  for _UIName, TargetAnimation in pairs(AllAnimations) do
    local AnimationTime = TargetAnimation:GetEndTime()
    DebugPrint("UMGAnimationsTime Widget:", WidgetPath, "AnimationName: ", _UIName, "Time: ", AnimationTime)
  end
end

function GM_Command:EMPlayWidgetAnimation(WidgetPath, AnimName)
  local GameInstance = self:GetGameInstance()
  local UIManager = GameInstance:GetGameUIManager()
  UWidgetLayoutLibrary.RemoveAllWidgets(GameInstance)
  local NewWidget = UIManager:CreateWidget(WidgetPath, true)
  if nil == NewWidget then
    ScreenPrint("can not find Widget")
    return
  end
  local AllAnimations = UE4.UUIFunctionLibrary.GetAllAnimationOfUserWidget(NewWidget)
  local TargetAnimation = AllAnimations:Find(AnimName)
  if nil == TargetAnimation then
    ScreenPrint("can not find Animation")
    return
  end
  EMUIAnimationSubsystem:EMPlayAnimation(NewWidget, TargetAnimation)
end

function GM_Command:HideAllUI(IsHide)
  local HideUI = true
  if "0" == IsHide then
    HideUI = false
  end
  local GameInstance = self:GetGameInstance()
  GameInstance.ImmersionModel = HideUI
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:HideAllUI(HideUI, "DefaultTag", true)
end

function GM_Command:PlayUMGAnimation(WidgetPath, Times, AnimName, CreatCount)
  local GameInstance = self:GetGameInstance()
  local UIManager = GameInstance:GetGameUIManager()
  UWidgetLayoutLibrary.RemoveAllWidgets(GameInstance)
  if nil == CreatCount then
    CreatCount = 1
  end
  for i = 1, CreatCount do
    local NewWidget = UIManager:CreateWidget(WidgetPath, true)
    if nil == NewWidget then
      ScreenPrint("can not find Widget")
      return
    end
    if nil == Times then
      Times = 1
    end
    local AllAnimations = UE4.UUIFunctionLibrary.GetAllAnimationOfUserWidget(NewWidget)
    if nil == AnimName then
      local co
      co = coroutine.create(function()
        for i = 1, Times do
          for _UIName, TargetAnimation in pairs(AllAnimations) do
            DebugPrint("Play Current Animation ", _UIName)
            local _, Proxy = UWidgetAnimationPlayCallbackProxy.CreatePlayAnimationProxyObject(nil, NewWidget, TargetAnimation, 0, 1, 0)
            Proxy.Finished:Add(self, function()
              coroutine.resume(co)
            end)
            coroutine.yield()
          end
        end
      end)
      coroutine.resume(co)
    else
      local TargetAnimation = AllAnimations:Find(AnimName)
      if nil == TargetAnimation then
        ScreenPrint("can not find Animation")
        return
      end
      local co
      co = coroutine.create(function()
        for i = 1, Times do
          DebugPrint("Play Animation ", AnimName, " Times: ", i)
          local _, Proxy = UWidgetAnimationPlayCallbackProxy.CreatePlayAnimationProxyObject(nil, NewWidget, TargetAnimation, 0, 1, 0)
          Proxy.Finished:Add(self, function()
            coroutine.resume(co)
          end)
          coroutine.yield()
        end
      end)
      coroutine.resume(co)
    end
  end
end

function GM_Command:obj()
  URuntimeCommonFunctionLibrary.LogMaximumUObject()
end

function GM_Command:SwitchSurvivalValueChange()
  if IsStandAlone(self:GetGameInstance()) then
    local GameInstance = self:GetGameInstance()
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
    local GameState = UE4.UGameplayStatics.GetGameState(Player)
    if not Player then
      return
    end
    if Player.AddSurvivalValueTimer then
      Player:RemoveTimer(Player.AddSurvivalValueTimer)
      Player.AddSurvivalValueTimer = nil
    end
    Player.AddSurvivalValueTimer = Player:AddTimer(1, function()
      GameState:SetSurvivalValue(GameState.SurvivalValue + 100)
    end, true)
  else
    self:DedicatedServerCommand("SwitchSurvivalValueChange")
  end
end

function GM_Command:CreateMonstersBatches(list, number, level)
  local result = {}
  for word in string.gmatch(list, "([^,]+)") do
    table.insert(result, word)
  end
  for _, i in pairs(result) do
    self:ServerBattleCommand("CreateMonster", self.Player.Eid, i, number, level, "StaticCreator")
  end
end

function GM_Command:CutToughnessValue(Value)
  Value = Value and tonumber(Value) or 1000000
  local _Battle = Battle(self.Player)
  if _Battle then
    _Battle:SetGMCuttoughnessValue(Value)
  end
end

function GM_Command:PrintCurrentTaskGuideInfo()
  DebugPrint("PrintCurrentTaskGuideInfo start===")
  local UIMgr = UIManager(self:GetGameInstance())
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self:GetGameInstance(), 0)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local GuidePointLocData = require("BluePrints.UI.TaskPanel/QuestGuidePointLocData")
  local PlayerRegionId
  PlayerRegionId = Avatar.CurrentRegionId
  DebugPrint("PlayerRegionId:", PlayerRegionId)
  DebugPrint("PlayerLoc:", Player:k2_GetActorLocation())
  local Objs = MissionIndicatorManager:GetAllIndicatorUIObjs()
  if not IsEmptyTable(Objs) then
    local Index = 1
    for Name, Obj in pairs(Objs) do
      DebugPrint("========================")
      local ShowText = "\230\138\152\229\143\160"
      if Obj.Visibility ~= UE4.ESlateVisibility.Collapsed and Obj.Guide_Node.Visibility == UE4.ESlateVisibility.SelfHitTestInvisible then
        ShowText = "\230\152\190\231\164\186"
      end
      local STLNodeId = 0
      if Obj.GuideInfoCache and Obj.GuideInfoCache.QuestNode and Obj.GuideInfoCache.QuestNode.QuestId then
        STLNodeId = Obj.GuideInfoCache.QuestNode.QuestId
      end
      DebugPrint("Indicator[" .. Index .. "]\239\188\154" .. ShowText)
      DebugPrint("WidgetName:", Name)
      DebugPrint("STLIndicatorType:", Obj.STLIndicatorType)
      if Obj.GuideInfoCache then
        DebugPrint("QuestChainId:", Obj.CurGuideChainId, " STLNode:", STLNodeId)
        DebugPrint("PointType", Obj.GuideInfoCache.PointType, "TargetPointName:", Obj.GuideInfoCache.PointName, "MapPointName:", Obj.GuideInfoCache.PointOrStaticCreatorName)
        DebugPrint("Location:", Obj.TargetPointPos)
        DebugPrint("TaskRegionId:", Obj.TaskRegionId)
        if GuidePointLocData[Obj.GuideInfoCache.PointOrStaticCreatorName] then
          local Data = GuidePointLocData[Obj.GuideInfoCache.PointOrStaticCreatorName]
          DebugPrint("GuidePointLocData: X:", Data.X, ",Y:", Data.Y, ",Z:", Data.Z, ",R:", Data.R, ",SubRegionId:", Data.SubRegionId)
        else
          DebugPrint("GuidePointLocData is nil")
        end
      end
      DebugPrint("========================")
      Index = Index + 1
    end
  end
  DebugPrint("PrintCurrentTaskGuideInfo end===")
end

function GM_Command:SetTaskGuidePointDebugMode(InNumger)
  local UIMgr = UIManager(GWorld.GameInstance)
  local Objs = MissionIndicatorManager:GetAllIndicatorUIObjs()
  if not IsEmptyTable(Objs) then
    for Name, Obj in pairs(Objs) do
      if 1 == tonumber(InNumger) then
        Obj.IsDebugMode = true
      else
        Obj.IsDebugMode = false
      end
    end
  end
end

function GM_Command:PrintAllAssetPath(EObjectType, UnitId)
  local _ObjType = tonumber(EObjectType)
  local _Id = tonumber(UnitId)
  local MeshNum = 0
  local MontageNum = 0
  local WeaponNum = 0
  local PreloadSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self.Player, UE4.URolePreloadGameInstanceSubsystem)
  DebugPrint("Montage:")
  local Temp = PreloadSystem:CommonPrepareAllBattleMontage(_ObjType, _Id)
  for _, Path in pairs(Temp) do
    MeshNum = MeshNum + 1
    DebugPrint(Path:GetOriginPath())
  end
  DebugPrint("Mesh:")
  Temp = PreloadSystem:CommonPrepareAllMesh(_ObjType, _Id)
  for _, Path in pairs(Temp) do
    MontageNum = MontageNum + 1
    DebugPrint(Path:GetOriginPath())
  end
  DebugPrint("Weapon:")
  local WeaponTags = {}
  for k, _ in pairs(DataMgr.WeaponTag) do
    table.insert(WeaponTags, k)
  end
  Temp = PreloadSystem:CommonPrepareAllWeaponMontage(WeaponTags, _ObjType, _Id)
  for _, Path in pairs(Temp) do
    WeaponNum = WeaponNum + 1
    DebugPrint(Path:GetOriginPath())
  end
  DebugPrint("End!!! Find MeshNum = ", MeshNum, " MontageNum = ", MontageNum, " Weapon = ", WeaponNum)
end

function GM_Command:PrintAllPreloadCacheInfo()
  UCharPreloadEMComponent.PrintAllCacheDebugInfo()
  URolePreloadGameInstanceSubsystem.PrintAllDebugInfo()
end

function GM_Command:PrintDynamicEventInfo(Id)
  local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")
  local Message = ClientEventUtils.GetDynEventInfo(Id)
  URuntimeCommonFunctionLibrary.AddOnScreenDebugMessage(-1, 5, FColor(255, 255, 255), Message, false, FVector2D(1, 1))
  DebugPrint(Message)
end

function GM_Command:UseMobileUnitBudget(bEnable)
  local UnitBudgetMgr = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self.Player, UUnitBudgetAllocatorSubsystem)
  if UnitBudgetMgr then
    if 0 == tonumber(bEnable) then
      UnitBudgetMgr.bUseMobile = false
    else
      UnitBudgetMgr.bUseMobile = true
    end
  end
end

function GM_Command:DebugTickUnitBudget()
  local UnitBudgetMgr = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self.Player, UUnitBudgetAllocatorSubsystem)
  if UnitBudgetMgr then
    UnitBudgetMgr:Debug_TickUnitBudget()
  end
end

function GM_Command:OpenMonsterDebug()
  local Battle = UIManager(GWorld.GameInstance):GetUIObj("BattleMain")
  Battle.TakeAimIndicator.bOpenMonsterDebug = not Battle.TakeAimIndicator.bOpenMonsterDebug
  local GMFunctionLibrary = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
  GMFunctionLibrary.ExecConsoleCommand(self:GetGameInstance(), "EnableGDT")
end

function GM_Command:CrashTest(CrashName)
  CrashName = CrashName or "IllegalAccess"
  ScreenPrint("CrashTest CrashTest CrashTest", CrashName)
  URuntimeCommonFunctionLibrary.CrashTest(CrashName)
end

function GM_Command:EnableSkillPrediction()
  GM_Command.bEnableSkillPrediction = not Battle(self.Player).bEnableSkillPrediction
  Battle(self.Player).bEnableSkillPrediction = GM_Command.bEnableSkillPrediction
  self:ServerBattleCommand("EnableSkillPrediction", GM_Command.bEnableSkillPrediction)
end

function GM_Command:ForceSimPredictionFailed()
  GM_Command.bSimPredictionFailed = not Battle(self.Player).bSimPredictionFailed
  Battle(self.Player).bSimPredictionFailed = GM_Command.bSimPredictionFailed
  DebugPrint("gmy@GM_Command GM_Command:ForceSimPredictionFailed", GM_Command.bSimPredictionFailed)
  self:ServerBattleCommand("ForceSimPredictionFailed", GM_Command.bSimPredictionFailed)
end

function GM_Command:PrintPredictionDebugInfo(EidStr)
  if self.Player then
    if EidStr then
      local Eid = tonumber(EidStr)
      local Entity = Battle(self.Player):GetEntity(Eid)
      if Entity and Entity.PrintPredictionDebugInfo then
        Entity:PrintPredictionDebugInfo()
      end
    else
      self.Player:PrintPredictionDebugInfo()
    end
  end
end

function GM_Command:SetGamepad(KeySet)
  local GameInstance = self:GetGameInstance()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  if Player then
    Player:SwitchGamepadSet(tonumber(KeySet))
  end
end

function GM_Command:PrintBattleHistory(Verbosity, ...)
  Verbosity = Verbosity and tonumber(Verbosity) or 0
  local Tags = {
    ...
  }
  local Filter = UE4.FBattleHistoryFilter()
  if Verbosity and 1 == Verbosity then
    Filter.Verbosity = UE4.EBattleRecordVerbosity.Verbose
  else
    Filter.Verbosity = UE4.EBattleRecordVerbosity.Normal
  end
  for _, Tag in ipairs(Tags) do
    Filter.TargetTags:Add(Tag)
  end
  Battle(self.Player):BP_PrintBattleHistory(Filter)
end

function GM_Command:ShowGetItemsTip(Type, Islose)
  local Params = {}
  Params.InfoDataList = {}
  if "Blessing" == Type then
    table.insert(Params.InfoDataList, DataMgr.RougeLikeBlessing[101])
    table.insert(Params.InfoDataList, DataMgr.RougeLikeBlessing[102])
    table.insert(Params.InfoDataList, DataMgr.RougeLikeBlessing[105])
  else
    table.insert(Params.InfoDataList, DataMgr.RougeLikeTreasure[14201])
    table.insert(Params.InfoDataList, DataMgr.RougeLikeTreasure[10102])
    table.insert(Params.InfoDataList, DataMgr.RougeLikeTreasure[10103])
  end
  if Islose then
    Params.Islose = true
  else
    Params.Islose = false
  end
  Params.ItemId = 101
  Params.OldLevel = 1
  Params.NewLevel = 2
  UIManager(self):LoadUINew(UIConst.GetItemsTip, Params)
end

function GM_Command:TestTriggerAbyssOnEnd()
  self.AbyssLogicServerInfo = {}
  self.AbyssLogicServerInfo.AbyssLevelId = 3
  self.AbyssLogicServerInfo.AbyssId = 1012
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local AbyssInfo = Avatar.Abysses[self.AbyssLogicServerInfo.AbyssId]
  if not AbyssInfo then
    return
  end
  local AbyssLevelInfo = AbyssInfo.AbyssLevelList[self.AbyssLogicServerInfo.AbyssLevelId]
  if not AbyssLevelInfo then
    return
  end
  local IsPassed = AbyssLevelInfo:IsAbyssLevelPass()
  if IsPassed then
    return
  end
  local AbyssLevel = DataMgr.AbyssLevel
  local PreLevel = self.AbyssLogicServerInfo.AbyssLevelId
  local NowLevel = PreLevel + 1
  local DungeonId1 = AbyssLevel[PreLevel].AbyssDungeon1
  local NewDungeon1BuffIds = {}
  local NewDungeon2BuffIds = {}
  if DungeonId1 then
    local PreDungeon1BuffIds = {}
    local NowDungeon1BuffIds = {}
    if AbyssLevel[NowLevel] then
      local NowDungeonId1 = AbyssLevel[NowLevel].AbyssDungeon1
      NowDungeon1BuffIds = DataMgr.AbyssDungeon[NowDungeonId1].AbyssBuffID
    end
    if AbyssLevel[PreLevel] then
      do
        local PreDungeonId1 = AbyssLevel[PreLevel].AbyssDungeon1
        PreDungeon1BuffIds = DataMgr.AbyssDungeon[PreDungeonId1].AbyssBuffID
      end
    end
    for _, Buff2Id in pairs(NowDungeon1BuffIds) do
      local Isfind = false
      for _, Buff1Id in pairs(PreDungeon1BuffIds) do
        if Buff2Id == Buff1Id then
          Isfind = true
          goto lbl_85
        end
      end
      ::lbl_85::
      if not Isfind then
        table.insert(NewDungeon1BuffIds, Buff2Id)
      end
    end
  end
  local DungeonId2 = AbyssLevel[PreLevel].AbyssDungeon2
  if DungeonId2 then
    local PreDungeon2BuffIds = {}
    local NowDungeon2BuffIds = {}
    if AbyssLevel[NowLevel] then
      local NowDungeonId2 = AbyssLevel[NowLevel].AbyssDungeon2
      NowDungeon2BuffIds = DataMgr.AbyssDungeon[NowDungeonId2].AbyssBuffID
    end
    if AbyssLevel[PreLevel] then
      do
        local PreDungeonId2 = AbyssLevel[PreLevel].AbyssDungeon2
        PreDungeon2BuffIds = DataMgr.AbyssDungeon[PreDungeonId2].AbyssBuffID
      end
    end
    for _, Buff2Id in pairs(NowDungeon2BuffIds) do
      local Isfind = false
      for _, Buff1Id in pairs(PreDungeon2BuffIds) do
        if Buff2Id == Buff1Id then
          Isfind = true
          goto lbl_138
        end
      end
      ::lbl_138::
      if not Isfind then
        table.insert(NewDungeon2BuffIds, Buff2Id)
      end
    end
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("AbyssEntry1")
  local HasNew = false
  for _, Value in ipairs(NewDungeon1BuffIds) do
    local CacheKey = tostring(Value)
    if not CacheDetail[self.AbyssLogicServerInfo.AbyssId] then
      CacheDetail[self.AbyssLogicServerInfo.AbyssId] = {}
    end
    if not CacheDetail[self.AbyssLogicServerInfo.AbyssId][CacheKey] then
      CacheDetail[self.AbyssLogicServerInfo.AbyssId][CacheKey] = true
      HasNew = true
    end
  end
  if HasNew then
    ReddotManager.IncreaseLeafNodeCount("AbyssEntry1")
  end
  HasNew = false
  CacheDetail = ReddotManager.GetLeafNodeCacheDetail("AbyssEntry2")
  for _, Value in ipairs(NewDungeon2BuffIds) do
    local CacheKey = tostring(Value)
    if not CacheDetail[self.AbyssLogicServerInfo.AbyssId] then
      CacheDetail[self.AbyssLogicServerInfo.AbyssId] = {}
    end
    if not CacheDetail[self.AbyssLogicServerInfo.AbyssId][CacheKey] then
      CacheDetail[self.AbyssLogicServerInfo.AbyssId][CacheKey] = true
      HasNew = true
    end
  end
  if HasNew then
    ReddotManager.IncreaseLeafNodeCount("AbyssEntry2")
  end
end

function GM_Command:ShowUpgradeTip(Id, BeforeLevel)
  local Params = {}
  Params.ItemId = 105
  Params.OldLevel = 1
  Params.NewLevel = 2
  UIManager(self):LoadUINew(UIConst.UpgradeTip, Params)
end

function GM_Command:ForceStartDynQuest(DynQuestId)
  if DynQuestId then
    local DynQuest = DataMgr.DynQuest[tonumber(DynQuestId)]
    local RegionId = DynQuest.RegionId
    local TriggerBoxID = DynQuest.TriggerBoxID
    local GameMode = UE4.UGameplayStatics.GetGameMode(self.Player)
    local SubRegionId
    if DataMgr.Region and DataMgr.Region[RegionId] then
      local SubRegions = DataMgr.Region[RegionId].IsRandom
      if SubRegions then
        SubRegionId = SubRegions[1]
      end
    end
    if GameMode and SubRegionId then
      if DataMgr.DispatchUI[tonumber(DynQuestId)] then
        local TeleportPoint = DataMgr.DispatchUI[tonumber(DynQuestId)].TeleportPointPos
        if TeleportPoint then
          SubRegionId = DataMgr.DynQuest[tonumber(DynQuestId)].SubRegionId
          GameMode:HandleLevelDeliver(UE4.EModeType.ModeRegion, SubRegionId, TeleportPoint, nil, nil, true)
          return
        end
      end
      local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameMode, 0)
      local Avatar = GWorld:GetAvatar()
      if not Avatar then
        return
      end
      
      local function TelCallBack(...)
        local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")
        ClientEventUtils:StartDynamicEvent(tonumber(DynQuestId))
        local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
        if not GameState then
          return
        end
        local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
        local StaticCreator = GameState.StaticCreatorMap:FindRef(TriggerBoxID)
        if StaticCreator then
          local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
          local WCSubsystem = GameMode:GetWCSubSystem()
          if not WCSubsystem then
            return
          end
          local TargetTransform = StaticCreator:GetTransform()
          TargetTransform.Translation = UE4.UNavigationFunctionLibrary.ProjectPointToNavigation3D(TargetTransform.Translation, WCSubsystem)
          WCSubsystem:RequestAsyncTravel(Player, TargetTransform, {
            Player,
            function()
            end
          })
        end
      end
      
      if Avatar:GetCurrentRegionId() ~= SubRegionId then
        Avatar:StartJumpRegion(SubRegionId, TelCallBack)
        self:SkipRegion(1, SubRegionId, 1)
      else
        TelCallBack()
      end
    end
  else
  end
end

function GM_Command:CompleteAllDispatchCondion()
  for DispatchId, Dispatch in pairs(DataMgr.Dispatch) do
    self:CompleteSingleCondition(Dispatch.DispatchCondition)
  end
end

function GM_Command:TractedMonsterToPlayer(Speed, Time)
  local _Speed = tonumber(Speed) or 2000
  local _Time = tonumber(Time) or 500000
  local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
  local Eids = TArray(0)
  for _, Mon in pairs(GameMode.EMGameState.MonsterMap) do
    Eids:Add(Mon.Eid)
  end
  URuntimeCommonFunctionLibrary.TractionActorsToCenter(ESourceTags.Skill, self.Player:K2_GetActorLocation(), _Speed, _Time, Eids, self.Player)
end

function GM_Command:TestTractedPlayer(Speed, Time)
  local _Speed = tonumber(Speed) or 200
  local _Time = tonumber(Time) or 500000
  local Eids = TArray(0)
  Eids:Add(self.Player.Eid)
  local Center = self.Player:K2_GetActorLocation()
  URuntimeCommonFunctionLibrary.TractionActorsToCenter(ESourceTags.Skill, Center, _Speed, _Time, Eids, self.Player)
end

function GM_Command:SkipAngling(bSkip)
  if not _G.bSkipAngling and bSkip then
    _G.bSkipAngling = true
  elseif _G.bSkipAngling and not bSkip then
    _G.bSkipAngling = false
  end
end

function GM_Command:ShowRegionmapPane(bEnabled)
  _G.ShowRegionmapPane = "1" == bEnabled
end

function GM_Command:SSRPlaySequence(RecorderId, StateId)
  local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
  if GameMode.LevelSequenceStateRecorder then
    GameMode.LevelSequenceStateRecorder:PlaySequence(tonumber(RecorderId), tonumber(StateId))
  end
end

function GM_Command:SSRPlaySequence(RecorderId, StateId)
  local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
  if GameMode.LevelSequenceStateRecorder then
    GameMode.LevelSequenceStateRecorder:PlaySequence(tonumber(RecorderId), tonumber(StateId))
  end
end

function GM_Command:StartFlow(Owner, FlowAsset)
  Owner = Owner or self.Player
  FlowAsset = FlowAsset or LoadObject("/Game/TestFlowAsset.TestFlowAsset")
  if UE.UEMFlowFunctionLibrary then
    local FlowSubsystem = UE.UEMFlowFunctionLibrary.GetFlowSubsystem(self.Player)
    if FlowSubsystem then
      FlowSubsystem:StartRootFlow(Owner, FlowAsset)
    end
  end
end

function GM_Command:StopFlow(Owner, FlowAsset)
  Owner = Owner or self.Player
  FlowAsset = FlowAsset or LoadObject("/Game/TestFlowAsset.TestFlowAsset")
  local FlowSubsystem = UE.UFlowFunctionLibray.GetFlowSubsystem()
  if FlowSubsystem then
    FlowSubsystem:StopRootFlow(Owner, FlowAsset)
  end
end

function GM_Command:NewDeputeTest()
  Const.IsOpenNewDepute = true
end

function GM_Command:PrintCharModVolume()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  for CharUuid, Char in pairs(Avatar.Chars) do
    DebugPrint("ZJT_ 11111111 PrintCharModVolume ", Char.CharId, Char:GetModVolume(), Char.ModVolume, Char.ExtralModVolume or 0)
  end
end

function GM_Command:DetectiveMinigame(type, Id)
  if "UnlockQuestion" == type then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Avatar:DetectiveQuestionUnlockQuestion(tonumber(Id))
    end
  elseif "UnlockAnswer" == type then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Avatar:DetectiveQuestionUnlockAnswer(tonumber(Id))
    end
  elseif "OpenUI" == type then
    local UIManager = self:GetGameInstance():GetGameUIManager()
    UIManager:LoadUINew("DetectiveMinigame")
  elseif "OpenDetailUI" == type then
    UIManager(self):LoadUINew("DetectiveReasoningAni", function()
      UIManager(self):LoadUINew("DetectiveReasoningDetail", Id)
    end)
  end
end

function GM_Command:CommonActivitySettlement()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local Params = {
    LevelScore = 500,
    IsWin = true,
    LevelTitle = "\229\133\179\229\141\161\230\160\135\233\162\152",
    Text_Title = "\230\160\135\233\162\152\230\150\135\230\156\172",
    Text_GetReward = "\232\142\183\229\190\151\229\165\150\229\138\177111",
    TitleColor = UE4.UUIFunctionLibrary.StringToSlateColor("FFFF00"),
    ScoreLineColor = UE4.UUIFunctionLibrary.StringToSlateColor("FFFF00"),
    ActivityId = 1030103
  }
  Params.ScoreInfo = {
    {
      text = "\233\128\154\229\133\179\230\151\182\232\190\190\229\136\17612300",
      isFinish = true
    },
    {
      text = "\233\128\154\229\133\179\230\151\182\232\190\190\229\136\17621330",
      isFinish = false
    },
    {
      text = "\233\128\154\229\133\179\230\151\182\232\190\190\229\136\17631330",
      isFinish = true
    },
    {
      text = "\233\128\154\229\133\179\230\151\182\232\190\190\229\136\17612",
      isFinish = true
    },
    {
      text = "\233\128\154\229\133\179\230\151\182\232\190\190\229\136\176210",
      isFinish = false
    },
    {
      text = "\233\128\154\229\133\179\230\151\182\232\190\190\229\136\1763130",
      isFinish = true
    }
  }
  Params.RewardIds = {
    1016,
    1017,
    1018
  }
  
  function Params.ExitCallback()
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    UIManager:ShowUITip("CommonToastMain", GText("Minigame_Textmap_100305"))
  end
  
  UIManager:LoadUINew("ActivitySettlement", Params)
end

function GM_Command:EnterTiaoPinGame()
  UIManager(GWorld.GameInstance):LoadUINew("TiaoPin")
end

function GM_Command:PinAttr(AttrName, Eid)
  local Panel = UIManager(self.Player):LoadUI(UIConst.ATTRDEBUGPANEL, "AttrDebugPanel", UIConst.ZORDER_ABOVE_ALL)
  Panel:AddAttrWatcher(AttrName, Eid)
end

function GM_Command:OpenWalnutRewardDialog(Id)
  if not UIManager(self):GetUIObj("WalnutRewardDialog") then
    self.DetailWidget = UIManager(self):LoadUINew("WalnutRewardDialog", tonumber(Id))
  end
end

function GM_Command:VerifyArrayTest()
  local GameInstance = GWorld.GameInstance
  GameInstance:GmChangeVerifyArray()
end

function GM_Command:FloatVerifyArrayTest()
  local GameInstance = GWorld.GameInstance
  GameInstance:GmChangeFloatVerifyArray()
end

function GM_Command:CreateSquad(SquadName)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  Avatar:CallServerMethod("GMCreateSquad", SquadName)
end

function GM_Command:QuitGame(bForce)
  if bForce then
    GWorld.GameInstance.ForceQuitGame()
  else
    UKismetSystemLibrary.QuitGame(self.Player, nil, EQuitPreference.Quit, false)
  end
end

function GM_Command:SyncTest()
  local Paths = {
    "/Game/AssetDesign/Char/Monster/Jt_Pizhuo/BP_Mon_Jt_Pizhuo.BP_Mon_Jt_Pizhuo",
    "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_Pizhuo/ABP_Mon_Jt_Pizhuo.ABP_Mon_Jt_Pizhuo_C'",
    "/Game/AssetDesign/AI/Monster/Jt_Pizhuo/BT_7Pizhuo.BT_7Pizhuo",
    "/Game/AssetDesign/Weapon/Monster/Melee/BP_Jt_Pizhuo.BP_Jt_Pizhuo",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Mesh/JT_Pizhuo_Physics",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Mesh/Jt_Pizhuo_SM",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Mesh/JT_Pizhuo_WP02_Physics",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Mesh/JT_Pizhuo_WP02_SM",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Mesh/JT_Pizhuo_WP_SK",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Mesh/JT_Pizhuo_WP_SM",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Mesh/JT_Pizhuo_WP_SM_Physics",
    "/Game/Asset/Char/Monster/Common/Part/Mesh/JT_Part02F_SM.JT_Part02F_SM",
    "/Game/Asset/Char/Monster/Common/Part/Mesh/JT_Part01L_SM.JT_Part01L_SM",
    "/Game/Asset/Char/Monster/Common/Part/Mesh/JT_Part01R_SM.JT_Part01R_SM",
    "/Game/Asset/Char/Monster/Common/Part/Mesh/JT_Part02B_SM.JT_Part02B_SM",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_CaughtDie_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_Die_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_GetUpBack_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_GetUpFront_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_HeavyHit_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_HitFly_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_HitFlyDie_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_LightHit1_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_LightHit2_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_LightHitRanged_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_StunBlind_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_StunBound_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_StunFire_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_StunParalysis_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_Alarm01_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_Attack01_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_Attack02_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_C01_Attack01_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_C01_Attack02_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_C01_Skill01_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_DYZAlarmTest_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_ShakeIdle_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_Skill01_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_Skill02_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_Skill03_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Locomotion/JT_Pizhuo_Rotation_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/SpecialIdle/JT_Pizhuo_SpecialAlert_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/SpecialIdle/JT_Pizhuo_SpecialIdle01_End_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/SpecialIdle/JT_Pizhuo_SpecialIdle01_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/SpecialIdle/JT_Pizhuo_SpecialIdle02_Montage"
  }
  for _, Path in pairs(Paths) do
    UE4.UResourceLibrary.LoadObjectAsync(self.Player, Path, {})
  end
  LoadObject("NiagaraSystem'/Game/Asset/Effect/Niagara/Monster/A_Common/NS_Common_Part_Smash.NS_Common_Part_Smash'")
end

function GM_Command:ShowLookAtDebug(InNpcId, IsEnable)
  local enable = tonumber(IsEnable)
  local npcId = tonumber(InNpcId)
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if enable > 0 then
    if GameState then
      local TargetNpc = GameState.NpcCharacterMap:FindRef(npcId)
      if TargetNpc and TargetNpc.NpcAnimInstance then
        TargetNpc.NpcAnimInstance.IsLookAtDebug = true
      end
    end
  elseif GameState then
    local TargetNpc = GameState.NpcCharacterMap:FindRef(npcId)
    if TargetNpc and TargetNpc.NpcAnimInstance then
      TargetNpc.NpcAnimInstance.IsLookAtDebug = false
    end
  end
end

function GM_Command:StartLookAt(InNpcId, InLookatedNpcId, IsEnable)
  local enable = tonumber(IsEnable)
  local sourcenpcId = tonumber(InNpcId)
  local targetnpcId = tonumber(InLookatedNpcId)
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if enable > 0 then
    if GameState then
      local sourceNpc = GameState.NpcCharacterMap:FindRef(sourcenpcId)
      local targetnpc = GameState.NpcCharacterMap:FindRef(InLookatedNpcId)
      if 1 == targetnpcId then
        local GameMode = UE4.UGameplayStatics.GetGameMode(self.Player)
        targetnpc = UE4.UGameplayStatics.GetPlayerCharacter(GameMode, 0)
      end
      if sourceNpc and sourceNpc.NpcAnimInstance and targetnpc then
        sourceNpc.NpcAnimInstance:SetLookAtActor(targetnpc, "head")
      end
    end
  elseif GameState then
    local sourceNpc = GameState.NpcCharacterMap:FindRef(sourcenpcId)
    if sourceNpc and sourceNpc.NpcAnimInstance then
      sourceNpc.NpcAnimInstance:ResetNormalLookAt()
    end
  end
end

function GM_Command:LookAtBySlerp(InNpcId, InLookatedNpcId, IsEnable, InTime)
  local enable = tonumber(IsEnable)
  local sourcenpcId = tonumber(InNpcId)
  local targetnpcId = tonumber(InLookatedNpcId)
  local Time = tonumber(InTime)
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if enable > 0 then
    if GameState then
      local sourceNpc = GameState.NpcCharacterMap:FindRef(sourcenpcId)
      local targetnpc = GameState.NpcCharacterMap:FindRef(InLookatedNpcId)
      if 1 == targetnpcId then
        local GameMode = UE4.UGameplayStatics.GetGameMode(self.Player)
        targetnpc = UE4.UGameplayStatics.GetPlayerCharacter(GameMode, 0)
      end
      if sourceNpc and sourceNpc.NpcAnimInstance and targetnpc then
        sourceNpc.NpcAnimInstance.PitchSlerpAlpha.TotalTime = 10.0
        sourceNpc.NpcAnimInstance.YawSlerpAlpha.TotalTime = 1.0
        sourceNpc.NpcAnimInstance:SetLookAtActor(targetnpc, "head", true)
        sourceNpc.NpcAnimInstance.IsLookAtDebug = true
        sourceNpc.NpcAnimInstance:StartSlerpLookAt()
      end
    end
  elseif GameState then
    local sourceNpc = GameState.NpcCharacterMap:FindRef(sourcenpcId)
    if sourceNpc and sourceNpc.NpcAnimInstance then
      sourceNpc.NpcAnimInstance:ResetNormalLookAt()
      sourceNpc.NpcAnimInstance.IsLookAtDebug = false
    end
  end
end

function GM_Command:ControlAllMonsterBTTickEnable(bEnable)
  local GameState = UE4.UGameplayStatics.GetGameState(self.Player)
  if false == bEnable then
    bEnable = false
  end
  for _, Target in pairs(GameState.MonsterMap) do
    Target:SetTickEnabled(ETickCtrlType.UnitBudget, ETickObjectFlag.FLAG_BTCOMPONENT, bEnable)
  end
end

function GM_Command:LJHTEST()
  UIManager(self.Player):LoadUINew("FeinaEventReward")
end

function GM_Command:LHQTEST(InNpcId, InFlag)
  local npcId = tonumber(InNpcId)
  local flag = tonumber(InFlag)
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if GameState then
    local TargetNpc = GameState.NpcCharacterMap:FindRef(npcId)
    local AssetPath1 = "AnimMontage'/Game/Asset/Char/Player/Char009_Xibi/Animation/Montage/Interactive/MechInteractive/Xibi_Interactive_Sit_F_Montage.Xibi_Interactive_Sit_F_Montage'"
    local AnimationAsset1 = LoadObject(AssetPath1)
    local AssetPath2 = "AnimMontage'/Game/Asset/Char/Player/Char010_Saiqi/Animation/Montage/Interactive/MechInteractive/Saiqi_Interactive_Sit_F_Montage.Saiqi_Interactive_Sit_F_Montage'"
    local AnimationAsset2 = LoadObject(AssetPath1)
    if TargetNpc and TargetNpc.NpcAnimInstance and 1 == flag then
      TargetNpc:RotateOffset(60)
    else
      TargetNpc:RotateOffset(-120)
    end
  end
end

function GM_Command:NPCRotate90(InNpcId, InAngle)
  local Angle = tonumber(InAngle)
  local NpcId = tonumber(InNpcId)
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if GameState then
    local TargetNpc = GameState.NpcCharacterMap:FindRef(NpcId)
    TargetNpc.NpcAnimInstance:SetTurnInPlace90(TargetNpc.ModelId)
    TargetNpc:RotateOffset(Angle)
  end
end

function GM_Command:NPCRotate(InNpcId, InAngle)
  local Angle = tonumber(InAngle)
  local NpcId = tonumber(InNpcId)
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if GameState then
    local TargetNpc = GameState.NpcCharacterMap:FindRef(NpcId)
    TargetNpc.NpcAnimInstance:SetTurnInPlace45()
    TargetNpc:RotateOffset(Angle)
  end
end

function GM_Command:NPCTalkAgree(InNpcId, InAgree)
  local NpcId = tonumber(InNpcId)
  local Agree = tonumber(InAgree)
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if GameState then
    local TargetNpc = GameState.NpcCharacterMap:FindRef(NpcId)
    local AgreeAssetPath = "AnimMontage'/Game/Asset/Char/Player/Char028_Kajia/Animation/Montage/Locomotion/Kajia_Agree_Montage_Only_For_Test.Kajia_Agree_Montage_Only_For_Test'"
    local AgreeAsset = LoadObject(AgreeAssetPath)
    TargetNpc.NpcAnimInstance:Montage_Play(AgreeAsset)
    if 0 == Agree then
      TargetNpc.NpcAnimInstance:Montage_JumpToSection("Disagree", AgreeAsset)
    end
  end
end

function GM_Command:NPCTalk03(InNpcId)
  local NpcId = tonumber(InNpcId)
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if GameState then
    local TargetNpc = GameState.NpcCharacterMap:FindRef(NpcId)
    local Talk03AssetPath = "AnimMontage'/Game/Asset/Char/Player/Char028_Kajia/Animation/Montage/Interactive/Kajia_Emo_Talk03_Montage.Kajia_Emo_Talk03_Montage'"
    local TalkAsset = LoadObject(Talk03AssetPath)
    TargetNpc.NpcAnimInstance:Montage_Play(TalkAsset)
  end
end

function GM_Command:NPCAgree(InNpcId, InAgree)
  local NpcId = tonumber(InNpcId)
  local Agree = tonumber(InAgree)
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if GameState then
    local TargetNpc = GameState.NpcCharacterMap:FindRef(NpcId)
    local AgreeAssetPath = "AnimMontage'/Game/Asset/Char/Player/Char028_Kajia/Animation/Montage/Locomotion/Kajia_Agree_Montage_Only_For_Test.Kajia_Agree_Montage_Only_For_Test'"
    local AgreeAsset = LoadObject(AgreeAssetPath)
    TargetNpc.NpcAnimInstance.bEnableAgreeTest = true
    TargetNpc.NpcAnimInstance:Montage_Play(AgreeAsset)
    if 0 == Agree then
      TargetNpc.NpcAnimInstance:Montage_JumpToSection("Disagree", AgreeAsset)
    end
  end
end

function GM_Command:GM_SkipMonthCardPay()
  DebugPrint("GM_SkipMonthCardPay")
  local MonthCardController = require("BluePrints.UI.WBP.Perk.MonthCard.MonthCardController")
  
  function MonthCardController.TryPurchaseMonthCard()
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Avatar:BuyMonthlyCard()
    end
  end
end

function GM_Command:DungeonDoubleCost(bDouble)
  local boolValue = bDouble and true or false
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:SetDungeonDoubleCost(boolValue)
  end
end

function GM_Command:GetWorldRegionEidByCreatorId(CreatorId)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self.Player)
  local RegionData = GameMode:GetRegionDataMgrSubSystem().DataPool.RegionData
  if not RegionData then
    return
  end
  local Eid
  for _, value in pairs(RegionData) do
    if value.CreatorId == tonumber(CreatorId) then
      Eid = value.WorldRegionEid
      break
    end
  end
  if not Eid then
    ScreenPrint("can not find Eid")
    return
  end
  DebugPrint(CreatorId .. "\231\154\132Eid\228\184\186 " .. Eid)
end

function GM_Command:GetWorldRegionEidByManualItemId(ManualItemId)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self.Player)
  local RegionData = GameMode:GetRegionDataMgrSubSystem().DataPool.RegionData
  if not RegionData then
    return
  end
  local Eid
  for _, value in pairs(RegionData) do
    if value.ManualItemId == tonumber(ManualItemId) then
      Eid = value.WorldRegionEid
      break
    end
  end
  if not Eid then
    ScreenPrint("can not find Eid")
    return
  end
  DebugPrint(ManualItemId .. "\231\154\132Eid\228\184\186 " .. Eid)
end

function GM_Command:GetWorldRegionEidByRandomRuleId(RandomRuleId)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self.Player)
  local RegionData = GameMode:GetRegionDataMgrSubSystem().DataPool.RegionData
  if not RegionData then
    return
  end
  local EidTable = {}
  for _, value in pairs(RegionData) do
    if value.RandomRuleId == tonumber(RandomRuleId) then
      table.insert(EidTable, value.WorldRegionEid)
    end
  end
  if not EidTable then
    ScreenPrint("can not find Eid")
    return
  end
  for _, value in pairs(EidTable) do
    DebugPrint(RandomRuleId .. "\231\154\132Eid\228\184\186 " .. value)
  end
end

function GM_Command:EnablePropEffect(PropEffectId, IsOn)
  local PropEffectId = tonumber(PropEffectId)
  local IsOn = tonumber(IsOn)
  if not IsOn or not PropEffectId then
    return
  end
  if not DataMgr.PropEffect[PropEffectId] then
    return
  end
  local BPPath = DataMgr.PropEffect[PropEffectId].BPPath
  if 1 == IsOn then
    self.Player.PropEffectComponent:LoadPropEffect(BPPath)
  else
    self.Player.PropEffectComponent:UnloadPropEffect()
  end
end

function GM_Command:ShowSequenceTime(bOpen)
  if "true" == bOpen then
    ULevelSequenceCommonFunctionLibrary.CreateRunTimeSequenceTimeWidget(self.Player, self.Player)
  else
    ULevelSequenceCommonFunctionLibrary.DestroyRunTimeSequenceTimeWidget(self.Player, self.Player)
  end
end

function GM_Command:UWAUpLoad()
  local UserName = "17357126837"
  local Password = "yingxiongwudi123"
  local ProjectId = 11211
  UUWABlueprintFunctionLibrary.UpLLoad(UserName, Password, ProjectId)
end

function GM_Command:GenerateStripMesh(Number, XCount, YCount, UnitSize)
  local GameInstance = self:GetGameInstance()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local BaseLocation = PlayerCharacter:K2_GetActorLocation()
  local ActorClass = UE4.UClass.Load("/Game/BluePrints/Test/TestProceduralMesh.TestProceduralMesh")
  if not ActorClass then
    DebugPrint("Failed to load ProceduralMesh actor class.")
    return
  end
  for i = 1, Number do
    local Offset = 300 * (i - 1)
    local Location = FVector(BaseLocation.X + Offset, BaseLocation.Y, BaseLocation.Z)
    local SpawnTransform = UE4.FTransform(FRotator(0, 0, 0), Location)
    local Actor = GWorld.GameInstance:GetWorld():SpawnActor(ActorClass, SpawnTransform, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn, nil, self, nil)
    if Actor and Actor.GenerateStripMesh then
      Actor:GenerateStripMesh(XCount, YCount, UnitSize)
    else
      DebugPrint("Failed to spawn actor or GenerateStripMesh is nil.")
    end
  end
end

function GM_Command:PrintLevelbound(levelName)
  if nil == levelName then
    levelName = "Prologue_Clouds_Art"
  end
  local Player = self.Player
  local AllActors = UE4.UGameplayStatics.GetAllActorsOfClass(Player, ALevelBounds.StaticClass())
  local StreamingLevel = UE4.UGameplayStatics.GetStreamingLevel(Player, "Prologue_Clouds_Art")
  for _, Actor in pairs(AllActors) do
    local ActorLevel = UE4.URuntimeCommonFunctionLibrary.GetLevel(Actor)
    local LoadedLevel = StreamingLevel:GetLoadedLevel()
    if ActorLevel == LoadedLevel then
      local Transform = Actor:GetTransform()
      local Location = Transform.Translation
      local Rotation = Transform.Rotation
      local Scale = Transform.Scale3D
      DebugPrint(levelName .. " Levelbound Location:", Location.X, Location.Y, Location.Z)
      DebugPrint(levelName .. " Levelbound Rotation:", Rotation.X, Rotation.Y, Rotation.Z)
      DebugPrint(levelName .. " Levelbound Scale:", Scale.X, Scale.Y, Scale.Z)
    end
  end
end

if UE and UE.URuntimeCommonFunctionLibrary.IsDistribution() then
  for k, v in pairs(GM_Command) do
    if type(v) == "function" then
      GM_Command[k] = function()
      end
    end
  end
end

function GM_Command:PrintCustomNPCCacheInfo()
  local NPCCreateSubSystem = UE4.USubsystemBlueprintLibrary.GetWorldSubsystem(self.Player, UE4.UNPCCreateSubSystem)
  if NPCCreateSubSystem then
    NPCCreateSubSystem:CustomNPCCacheDebug()
  end
end

function GM_Command:MechanismStateDebug(val)
  local GameState = UE4.UGameplayStatics.GetGameState(self.Player)
  if GameState then
    val = tonumber(val)
    if val > 0 then
      GameState.MechanismStateChangeDebug = true
    else
      GameState.MechanismStateChangeDebug = false
    end
  end
end

function GM_Command:ShowBattleError(num)
  local battle = GWorld.Battle
  if not battle then
    ScreenPrint("Error:\230\137\190\228\184\141\229\136\176GWorld.Battle")
    return
  end
  num = tonumber(num) or 1
  if num < 1 or num > 2 then
    ScreenPrint("\229\143\130\230\149\176\233\148\153\232\175\175\239\188\140num\229\186\148\228\184\1861-2\228\185\139\233\151\180\231\154\132\230\149\180\230\149\176")
    return
  end
  if 1 == num then
    battle:ShowBattleError("GM\230\181\139\232\175\149\232\135\170\229\174\154\228\185\137\228\191\161\230\129\175", false)
  else
    battle:StandardShowBattleErrorLua(UE.EShowBattleErrorType.Weapon, "GM\230\181\139\232\175\149\229\176\143\231\177\187")
  end
end

function GM_Command:ShowUIError(Text)
  local battle = GWorld.Battle
  if not battle then
    ScreenPrint("Error:\230\137\190\228\184\141\229\136\176GWorld.Battle")
    return
  end
  battle:ShowError_UI_Inner_Lua("GM\230\181\139\232\175\149: " .. Text)
end

function GM_Command:ShowPersonalInfoPage(IsOtherPageKind)
  if IsOtherPageKind then
    GWorld:GetAvatar():CheckOtherPlayerPersonallInfo(GWorld:GetAvatar().Uid, true)
  else
    local PersonInfoController = require("BluePrints.UI.WBP.PersonInfo.PersonInfoController")
    PersonInfoController:OpenView()
  end
end

function GM_Command:EnableRegionPlayerRandomRoleId(Enable)
  local GameInstance = GWorld.GameInstance
  local bEnable = "1" == Enable
  GameInstance.RandomClientRegionPlayerRoleId = bEnable
end

function GM_Command:EnableRegionPlayerOnlyShowHeadUI(Enable, Num)
  local GameInstance = GWorld.GameInstance
  local bEnable = "1" == Enable
  local AllowCreateNum = tonumber(Num)
  GameInstance.bRegionClientOnlyShowUI = bEnable
  UE4.URegionPlayerManagerSubsystem.SetIsOnlyShowPlayerHeadUI(bEnable)
  if AllowCreateNum then
    UE4.UKismetSystemLibrary.ExecuteConsoleCommand(Player, "p.EM_RegionAllowCreatePlayerNum " .. Num, nil)
  end
end

function GM_Command:NPCSubSystemOnline(bOnline)
  local NPCCreateSubSystem = UE4.USubsystemBlueprintLibrary.GetWorldSubsystem(self.Player, UE4.UNPCCreateSubSystem)
  if bOnline then
    NPCCreateSubSystem:SetIsOnlineState(true)
  else
    NPCCreateSubSystem:SetIsOnlineState(false)
  end
end

function GM_Command:ShowGlobalVersion()
  UIManager(self):ShowGlobalVersion()
end

function GM_Command:HideGlobalVersion()
  UIManager(self):HideGlobalVersion()
end

return GM_Command
