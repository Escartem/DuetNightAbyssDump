require("UnLua")
require("Const")
local GM_Command_Region = {}

function GM_Command_Region:Initialize(Initializer)
  if self.Commands == nil then
    return
  end
  self:Init_Region_Command()
  for k, v in pairs(self.RegionCommands) do
    if nil == self.Commands[string.upper(k)] then
      self.Commands[string.upper(k)] = v
    else
      GWorld.logger.error("Region GM \233\135\141\229\164\141:" .. tostring(k) .. "   " .. tostring(v))
    end
  end
end

function GM_Command_Region:Init_Region_Command()
  self.RegionCommands = {
    PRD = "PrintAllRegionData",
    arcrd = "AddRandomCreatorRegionDatas",
    PrintAllRegionData = "PrintAllRegionData",
    PrintEntityLog = "PrintEntityLog",
    PrintRegionClientCache = "PrintRegionClientCache",
    PrintRegionServerData = "PrintRegionServerData",
    PrintRegionSSData = "PrintRegionSSData",
    PrintCurrentRegionId = "PrintCurrentRegionId",
    PrintQuestChainData = "PrintQuestChainData",
    PrintQuestTracking = "PrintQuestTracking",
    PQCI = "PrintQuestChainInfo",
    PQD = "PrintQuestData",
    PCRA = "PrintCurrentRegionActor",
    PrintSimpleRegionData = "PrintSimpleRegionData",
    PrintFullRegionData = "PrintFullRegionData",
    SkipRegion = "SkipRegion",
    ResetingExplore = "ResetingExplore",
    RegionChangeOpenState = "RegionChangeOpenState",
    RegionDataDead = "RegionDataDead",
    RegionDataDeadByUnitLabel = "RegionDataDeadByUnitLabel",
    SetStoryModeState = "SetStoryModeState",
    ResetStoryModeState = "ResetStoryModeState",
    ActiveExplore = "ActiveExplore",
    CompleteExplore = "CompleteExplore",
    GetAchvReward = "GetAchvReward",
    GAARBT = "GetAllAchvRewardByType",
    RAOE = "ReActiveOneExplore",
    RAAE = "ReActiveAllExplore",
    AADE = "AddAllDeliverMechanism",
    StartBoss = "StartBossBattle",
    EndBoss = "EndBossBattle",
    InActiveStaticCreator = "InActiveStaticCreator",
    HQCD = "HandleQuestChainDoing",
    PrintCharAccessoryDecoration = "PrintCharAccessoryDecoration",
    SetCharShowPartMesh = "SetCharShowPartMesh",
    BTRBD = "BuildTestRegionBaseData",
    AddTeleportPoint = "AddTeleportPoint",
    AddAllTeleportPoint = "AddAllTeleportPoint",
    PISI = "PurchaseImpressionShopItem",
    TCA = "CharAppearance",
    TDS = "DispatchSystem",
    PDS = "PrintDispatchSystem",
    PIR = "PrintImpressionRandom",
    GDR = "GetDispatchReward",
    GADR = "GetAllDispatchReward",
    TIS = "TestImpressionSystem",
    AIPN = "AddImpressionPreNode",
    TSS = "TestSojournsSystem",
    SetViewTargetWithWC = "SetViewTargetWithWC"
  }
end

function GM_Command_Region:PrintEntityLog(Id)
  local SubSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, URegionDataMgrSubsystem:StaticClass())
  if SubSystem then
    SubSystem:PrintRegionLog(Id)
  end
end

function GM_Command_Region:PrintRegionClientCache(bCompare)
  if 1 == tonumber(bCompare) then
    GM_Command_Region:_PrintRegionClientCacheInner()
    GM_Command_Region:PrintRegionServerData()
    local SubSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, URegionDataMgrSubsystem:StaticClass())
    SubSystem.TestGMRegionDataType = Const.TestGMRegionType.CompareServer
  else
    GM_Command_Region:_PrintRegionClientCacheInner()
  end
end

function GM_Command_Region:_PrintRegionClientCacheInner()
  local SubSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, URegionDataMgrSubsystem:StaticClass())
  GWorld.logger.errorlog("======================\230\137\147\229\141\176\229\140\186\229\159\159ClientCache\230\149\176\230\141\174======================")
  
  local function _PrintData(Type, TypeData)
    GWorld.logger.errorlog("======================" .. Const.RegionDataTypeDebugText[tonumber(Type) + 1] .. "======================")
    for SubRegionId, TempData in pairs(TypeData) do
      GWorld.logger.errorlog("======================\229\140\186\229\159\159Id: " .. SubRegionId .. "======================")
      PrintTable(TempData, 10)
    end
  end
  
  for Type, TypeData in pairs(SubSystem.DataLibrary.RegionCacheDatas) do
    _PrintData(Type, TypeData)
  end
  GWorld.logger.errorlog("======================\230\137\147\229\141\176\229\140\186\229\159\159ClientCache\230\149\176\230\141\174 End======================")
end

function GM_Command_Region:PrintRegionSSData()
  local SubSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, URegionDataMgrSubsystem:StaticClass())
  GWorld.logger.errorlog("======================\230\137\147\229\141\176\229\140\186\229\159\159SSData\230\149\176\230\141\174======================")
  
  local function _PrintData(LevelName, LevelData)
    GWorld.logger.errorlog("======================" .. LevelName .. "======================")
    for WorldRegionEid, TempData in pairs(LevelData) do
      PrintTable(TempData, 10)
    end
  end
  
  for LevelName, LevelData in pairs(SubSystem.DataLibrary.RegionSSDatas) do
    _PrintData(LevelName, LevelData)
  end
  GWorld.logger.errorlog("======================\230\137\147\229\141\176\229\140\186\229\159\159SSData\230\149\176\230\141\174 End======================")
end

function GM_Command_Region:PrintRegionServerData()
  local Avatar = GWorld:GetAvatar()
  local SubSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, URegionDataMgrSubsystem:StaticClass())
  if Avatar and SubSystem then
    SubSystem.TestGMRegionDataType = Const.TestGMRegionType.OnlyServer
    Avatar:GMC2S_RequestSynchronizedDataFromServer(CommonConst.GMRegionTargetType.AllData, {
      Avatar:GetSubRegionId2RegionId(Avatar.CurrentRegionId)
    })
  end
end

function GM_Command_Region:PrintAllRegionData()
  self:PrintRegionSSData()
  self:PrintRegionClientCache(0)
end

function GM_Command_Region:PrintCurrentRegionId()
  local Avatar = GWorld:GetAvatar()
  local GameInstance = self:GetGameInstance()
  local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
  local LevelLoader = GameMode:GetLevelLoader()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  if LevelLoader and LevelLoader.IsWorldLoader then
    print(_G.LogTag, "ZJT_ PlayerCharacterLocation Calc RegionId ", Avatar.SyncReason, LevelLoader:GetRegionIdByLocation(PlayerCharacter:K2_GetActorLocation()), LevelLoader:GetLevelIdByLocation(PlayerCharacter:K2_GetActorLocation()))
  end
  if Avatar then
    print(_G.LogTag, "ZJT_ CurrentRegionId And  IsOpenPlayerPositionSync ", Avatar.CurrentRegionId, Avatar.IsOpenPlayerPositionSync)
  end
end

function GM_Command_Region:PrintQuestChainData()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:GMC2S_RequestSynchronizedDataFromServer(CommonConst.GMRegionTargetType.AllQuestData)
  end
end

function GM_Command_Region:PrintCurrentRegionActor(SubRegionId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if SubRegionId then
    SubRegionId = tonumber(SubRegionId)
    if Avatar.WorldRegionEid2Actor[SubRegionId] then
      for LevelName, LevelDatas in pairs(Avatar.WorldRegionEid2Actor[SubRegionId]) do
        for WorldRegionEid, TargetActor in pairs(LevelDatas) do
          if IsValid(TargetActor) then
            DebugPrint("ZJT_ \230\137\147\229\141\176\229\156\168\229\140\186\229\159\159\228\184\173\231\187\159\232\174\161\231\154\132Actor ", WorldRegionEid, TargetActor.RegionDataType, TargetActor:GetName(), TargetActor.SubRegionId, TargetActor:K2_GetActorLocation(), TargetActor.LevelName)
          else
            DebugPrint("ZJT_ \230\137\147\229\141\176\231\154\132Actor\229\183\178\231\187\143\232\162\171\233\148\128\230\175\129 ", WorldRegionEid)
          end
        end
      end
    end
  else
    for SubRegionId, WorldRegionEids in pairs(Avatar.WorldRegionEid2Actor) do
      for LevelName, LevelDatas in pairs(Avatar.WorldRegionEid2Actor[SubRegionId]) do
        DebugPrint("ZJT_ PrintCurrentRegionActor SubRegionId ", SubRegionId, LevelName)
        for WorldRegionEid, TargetActor in pairs(LevelDatas) do
          local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
          if IsValid(TargetActor) then
            DebugPrint("ZJT_ \230\137\147\229\141\176\229\156\168\229\140\186\229\159\159\228\184\173\231\187\159\232\174\161\231\154\132Actor ", TargetActor.CreatorId, WorldRegionEid, TargetActor.RegionDataType, TargetActor:GetName(), TargetActor.SubRegionId, TargetActor.LevelName, GameMode:GetActorLevelName(TargetActor), TargetActor:K2_GetActorLocation())
          else
            DebugPrint("ZJT_ \230\137\147\229\141\176\231\154\132Actor\229\183\178\231\187\143\232\162\171\233\148\128\230\175\129 ", WorldRegionEid)
          end
        end
      end
    end
  end
  DebugPrint("ZJT_ \230\137\147\229\141\176\229\189\147\229\137\141\231\154\132\233\157\158\229\173\152\229\130\168\230\149\176\230\141\174 Start !!!!! ")
  for SubRegionId, RegionDatas in pairs(Avatar.MistakeRegionBaseData) do
    for LevelName, RegionLevelDatas in pairs(RegionDatas) do
      for WorldRegionEid, RegionBaseData in pairs(RegionLevelDatas) do
        DebugPrint("ZJT_ MistakeRegionBaseData \229\173\152\229\156\168  RegionBaseData", RegionBaseData.Eid, RegionBaseData.LevelName, RegionBaseData.Id, RegionBaseData.CreatorId)
      end
    end
  end
  DebugPrint("ZJT_ \230\137\147\229\141\176\229\189\147\229\137\141\231\154\132\233\157\158\229\173\152\229\130\168\230\149\176\230\141\174 End !!!!! ")
  DebugPrint("ZJT_ \230\137\147\229\141\176\229\189\147\229\137\141\231\154\132\230\156\170\230\191\128\230\180\187\231\154\132\233\157\153\230\128\129\229\136\183\230\150\176\231\130\185 Start ")
  for SubRegionId, StaticCreatorId in pairs(Avatar.SerializeStaticCretor) do
    for CreatorId, Count in pairs(StaticCreatorId) do
      DebugPrint("ZJT_ \230\156\170\230\191\128\230\180\187\231\154\132\233\157\153\230\128\129\229\136\183\230\150\176\231\130\185 SubRegionId StaticCreatorId Count ", SubRegionId, CreatorId, Count)
    end
  end
  DebugPrint("ZJT_ \230\137\147\229\141\176\229\189\147\229\137\141\231\154\132\230\156\170\230\191\128\230\180\187\231\154\132\233\157\153\230\128\129\229\136\183\230\150\176\231\130\185 End ")
end

function GM_Command_Region:PrintQuestChainInfo()
  local Avatar = GWorld:GetAvatar()
  DebugPrint("----------------- PrintQuestChainInfo -----------------")
  if Avatar then
    for _, QuestChainId in ipairs(Avatar.QuestChains:Keys()) do
      local QuestChain = Avatar.QuestChains[QuestChainId]
      DebugPrint("ZJT_ PrintQuestChainInfo ", QuestChainId, QuestChain.State)
      DebugPrint(string.format("PrintQuestChainInfo QuestChainId = %d, DoingQuestId = %d , State = %d, Type = %s", QuestChainId, QuestChain.DoingQuestId, QuestChain.State, QuestChain.QuestChainType))
      PrintTable({
        CompleteQuestId = QuestChain.CompleteQuestId
      }, 10)
    end
  end
  DebugPrint("----------------- PrintQuestChainInfo -----------------")
end

function GM_Command_Region:PrintQuestData()
  local Avatar = GWorld:GetAvatar()
  local QuestDatas = Avatar.QuestDatas
  for QuestId, QuestData in pairs(QuestDatas) do
    print(_G.LogTag, "ZJT_ \230\137\147\229\141\176\229\189\147\229\137\141\229\190\133\230\143\144\228\186\164\230\149\176\230\141\174\231\188\147\229\173\152 PrintQuestData QuestId ", QuestId)
    for WorldRegionEid, RegionBaseData in pairs(QuestData) do
      print(_G.LogTag, "ZJT_ PrintQuestData QuestData eid ", WorldRegionEid, RegionBaseData.Eid, RegionBaseData.QuestId, RegionBaseData.Id, RegionBaseData.SubRegionId, RegionBaseData.LevelName, RegionBaseData.CreatorId)
    end
  end
  for QuestId, QuestData in pairs(Avatar.QuestUpdateDatas) do
    print(_G.LogTag, "ZJT_ \230\137\147\229\141\176\228\185\139\229\137\141\229\190\133\230\143\144\228\186\164\228\187\187\229\138\161\230\149\176\230\141\174\231\188\147\229\173\152 PrintQuestData QuestId ", QuestId)
    for WorldRegionEid, RegionBaseData in pairs(QuestData) do
      print(_G.LogTag, "ZJT_ PrintQuestData QuestData eid ", WorldRegionEid, RegionBaseData.Eid, RegionBaseData.QuestId, RegionBaseData.Id, RegionBaseData.SubRegionId, RegionBaseData.LevelName, RegionBaseData.CreatorId)
    end
  end
end

function GM_Command_Region:PrintQuestTracking()
  local Avatar = GWorld:GetAvatar()
  DebugPrint("ZJT_ 11111111111111 PrintQuestTracking ", Avatar.TrackingQuestChainId)
end

function GM_Command_Region:HandleQuestChainDoing(QuestChainId)
  QuestChainId = tonumber(QuestChainId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:HandleQuestChainDoing(QuestChainId)
  end
end

function GM_Command_Region:InActiveStaticCreator(CreatorId)
  local GameState = UE4.UGameplayStatics.GetGameState(self.Player)
  CreatorId = CreatorId or 1580052
  if not GameState then
    return
  end
  local StaticCreator = GameState.StaticCreatorMap:FindRef(CreatorId)
  if not IsValid(StaticCreator) then
    return
  end
  StaticCreator:DestoryOneStaticActor_Lua(EDeathReason.StaticGM)
end

function GM_Command_Region:BuildTestRegionBaseData(RegionDataType, SubRegionId, LevelName, CreatorId, WorldRegionEid)
  local Avatar = GWorld:GetAvatar()
  CreatorId = 1008602
  RegionDataType = 1
  SubRegionId = 100101
  if Avatar then
    local RegionBaseData = {
      RegionDataType = tonumber(RegionDataType),
      SubRegionId = tonumber(SubRegionId),
      LevelName = "LevelName",
      CreatorId = tonumber(CreatorId),
      WorldRegionEid = URuntimeCommonFunctionLibrary.GenerateGUID(),
      RarelyId = 7000029,
      UnitId = "\230\128\170\231\137\169ID",
      UnitType = "Monster"
    }
    DebugPrint("ZJT_ 11111111 BuildTestRegionBaseData ", RegionBaseData.WorldRegionEid)
    
    local function Callback(Ret)
      DebugPrint(string.format("ZJT_ \230\181\139\232\175\149\230\149\176\230\141\174\232\191\148\229\155\158\231\154\132\230\181\139\232\175\149\231\160\129: %d", Ret))
    end
    
    Avatar:CallServer("AddRegionActorData", Callback, RegionBaseData.RegionDataType, RegionBaseData)
  end
end

function GM_Command_Region:SetCharShowPartMesh()
  local Avatar = GWorld:GetAvatar()
  Avatar:SetCharShowPartMesh(nil, 2, true)
end

function GM_Command_Region:PrintCharAccessoryDecoration()
  local Avatar = GWorld:GetAvatar()
  PrintTable({
    CharAccess = Avatar.CharAccessorys:all_dump(Avatar.CharAccessorys)
  })
  local Char = Avatar.Chars[Avatar.CurrentChar]
  PrintTable({
    EquipCharAccess = Char.CharAccessorySuits:all_dump(Char.CharAccessorySuits)
  })
end

function GM_Command_Region:SetCharShowPartMesh()
  local Avatar = GWorld:GetAvatar()
  Avatar:SetCharShowPartMesh(nil, 2, true)
end

function GM_Command_Region:StartBossBattle(BossDungeonId, DifficultyId)
  BossDungeonId = tonumber(BossDungeonId)
  DifficultyId = tonumber(DifficultyId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:EnterHardBoss(BossDungeonId, DifficultyId)
  else
    local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
    GameMode:InitHardBoss(BossDungeonId, DifficultyId)
  end
end

function GM_Command_Region:EndBossBattle()
  local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
  GameMode:EndHardBoss(true)
end

function GM_Command_Region:ActiveExplore(ExploreId)
  ExploreId = tonumber(ExploreId)
  local Avatar = GWorld:GetAvatar()
  local GameState = GameMode.EMGameState
  local ExploreGroup = GameState.ExploreGroupMap:FindRef(ExploreId)
  if Avatar and ExploreGroup then
    Avatar:ExploreIdActive(ExploreId, GameMode:GetRegionIdByLocation(ExploreGroup:K2_GetActorLocation()))
  end
end

function GM_Command_Region:CompleteExplore(ExploreId)
  ExploreId = tonumber(ExploreId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:ExploreIdComplete(ExploreId)
  end
end

function GM_Command_Region:GetAllAchvRewardByType(AchvTypeId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:GetAllAchvRewardByType(tonumber(AchvTypeId))
  end
end

function GM_Command_Region:GetAchvReward(AchvId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:GetAchvReward(tonumber(AchvId))
  end
end

function GM_Command_Region:SkipRegion(ModType, SubRegionId, StartIndex)
  local GameMode = UE.UGameplayStatics.GetGameMode(self.Player)
  GameMode:HandleLevelDeliver(ModType, SubRegionId, StartIndex)
end

function GM_Command_Region:ResetingExplore(RarelyId, SubRegionId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    DebugPrint("ZJT_ ResetingExplore GM ")
    Avatar:ResetingExplore(tonumber(RarelyId), tonumber(SubRegionId))
  end
end

function GM_Command_Region:RegionChangeOpenState(CreatorId)
  local Avatar = GWorld:GetAvatar()
  Avatar:UpdateRegionDataStateByCreatorId(tonumber(CreatorId), {OpenState = true})
end

function GM_Command_Region:RegionDataDead(CreatorId)
  local Avatar = GWorld:GetAvatar()
  Avatar:RegionActorDataDeadByCreatorId(tonumber(CreatorId))
end

function GM_Command_Region:RegionDataDeadByUnitLabel(UnitId, UnitType)
  local Avatar = GWorld:GetAvatar()
  Avatar:RegionActorDataDeadByUnitLabel(tonumber(UnitId), UnitType)
end

function GM_Command_Region:SetStoryModeState()
  local Avatar = GWorld:GetAvatar()
  DebugPrint("ZJT_ 111111111 ", Avatar.RegTime)
end

function GM_Command_Region:ResetStoryModeState()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self.Player, 0)
  PlayerController:SetStoryModeState(false)
end

function GM_Command_Region:CheckAddTeleportPoint(Id, TeleportPointInfo, CommonRegionData)
  if not TeleportPointInfo then
    DebugPrint("ZJT_ \229\143\136\228\184\141\233\133\141\232\161\168 ", Id)
    return false, false, {}
  end
  if not TeleportPointInfo.TeleportPointSubRegion or not DataMgr.SubRegion[TeleportPointInfo.TeleportPointSubRegion] then
    DebugPrint("ZJT_ SubRegion\232\161\168 \228\184\141\229\173\152\229\156\168\232\175\165\229\173\144\229\140\186\229\159\159ID : ", TeleportPointInfo.TeleportPointSubRegion)
    return false, false, {}
  end
  if not TeleportPointInfo.LevelName then
    DebugPrint("ZJT_ \228\184\141\229\173\152\229\156\168\233\133\141\232\161\168LevelName : ", TeleportPointInfo.TeleportPointSubRegion)
    return false, false, {}
  end
  if not TeleportPointInfo.StaticId then
    DebugPrint("ZJT_ \228\184\141\229\173\152\229\156\168\233\133\141\232\161\168CreatorId : ", TeleportPointInfo.CreatorId)
    return false, false, {}
  end
  for WorldRegionEid, RegionBaseData in pairs(CommonRegionData) do
    if RegionBaseData.CreatorId == TeleportPointInfo.StaticId then
      return true, true, RegionBaseData
    end
  end
  return true, false, {}
end

function GM_Command_Region:AddTeleportPoint(Id)
  Id = tonumber(Id)
  local Avatar = GWorld:GetAvatar()
  local TeleportPointInfo = DataMgr.TeleportPoint[Id]
  local GameMode = UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local RegionDataSubsys = GameMode:GetRegionDataMgrSubSystem()
  local CommonRegionData = RegionDataSubsys.DataLibrary:GetFullRegionStoreDatas() or {}
  local CheckResult, IsUpdate, TargetRegionData = self:CheckAddTeleportPoint(Id, TeleportPointInfo, CommonRegionData)
  if CheckResult then
    TargetRegionData.State = {
      StateId = 901001,
      CanOpen = false,
      IsActive = false,
      OpenState = true
    }
    if IsUpdate then
      local function callback(Ret)
        DebugPrint("ZJT_ AddAllTeleportPoint \229\142\159\230\156\137\228\188\160\233\128\129\231\130\185\230\149\176\230\141\174\229\173\152\229\156\168\229\143\170\229\175\185State\230\149\176\230\141\174\232\191\155\232\161\140\230\155\191\230\141\162 ", TargetRegionData.WorldRegionEid, TargetRegionData.CreatorId)
      end
      
      self:CallServer("UpdateRegionActorData", callback, TargetRegionData.WorldRegionEid, TargetRegionData.SubRegionId, 1, TargetRegionData.State, TargetRegionData.LevelName)
    else
      TargetRegionData.WorldRegionEid = URuntimeCommonFunctionLibrary.GenerateGUID()
      TargetRegionData.UnitId = 90100
      TargetRegionData.UnitType = "Mechanism"
      TargetRegionData.SubRegionId = TeleportPointInfo.TeleportPointSubRegion
      TargetRegionData.CreatorId = TeleportPointInfo.StaticId
      TargetRegionData.LevelName = TeleportPointInfo.LevelName
      TargetRegionData.RegionDataType = 1
      TargetRegionData.IsUnlimited = true
      Avatar:AvatarC2SAddRegionActorData(TargetRegionData)
    end
  end
end

function GM_Command_Region:AddAllTeleportPoint()
  local Avatar = GWorld:GetAvatar()
  local GameMode = UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local RegionDataSubsys = GameMode:GetRegionDataMgrSubSystem()
  local CommonRegionData = RegionDataSubsys.DataLibrary:GetFullRegionStoreDatas() or {}
  for Id, TeleportPointInfo in pairs(DataMgr.TeleportPoint) do
    local CheckResult, IsUpdate, TargetRegionData = self:CheckAddTeleportPoint(Id, TeleportPointInfo, CommonRegionData)
    if CheckResult then
      TargetRegionData.State = {
        StateId = 901001,
        CanOpen = false,
        IsActive = false,
        OpenState = true
      }
      if IsUpdate then
        local function callback(Ret)
          Avatar.logger.info("ZJT_ AddAllTeleportPoint \229\142\159\230\156\137\228\188\160\233\128\129\231\130\185\230\149\176\230\141\174\229\173\152\229\156\168\229\143\170\229\175\185State\230\149\176\230\141\174\232\191\155\232\161\140\230\155\191\230\141\162 ", TargetRegionData.WorldRegionEid, TargetRegionData.CreatorId)
        end
        
        Avatar:CallServer("UpdateRegionActorData", callback, TargetRegionData.WorldRegionEid, TargetRegionData.SubRegionId, 1, TargetRegionData.State, TargetRegionData.LevelName)
      else
        TargetRegionData.WorldRegionEid = URuntimeCommonFunctionLibrary.GenerateGUID()
        TargetRegionData.UnitId = 90100
        TargetRegionData.UnitType = "Mechanism"
        TargetRegionData.SubRegionId = TeleportPointInfo.TeleportPointSubRegion
        TargetRegionData.CreatorId = TeleportPointInfo.StaticId
        TargetRegionData.LevelName = TeleportPointInfo.LevelName
        TargetRegionData.RegionDataType = 1
        TargetRegionData.IsUnlimited = true
        Avatar:AvatarC2SAddRegionActorData(TargetRegionData)
      end
    end
  end
end

function GM_Command_Region:AddAllDeliverMechanism()
  local Avatar = GWorld:GetAvatar()
  
  local function Callback(ClientAllRegionBaseDataCache)
    local GameMode = UGameplayStatics.GetGameMode(GWorld.GameInstance)
    local RegionDataSubsys = GameMode:GetRegionDataMgrSubSystem()
    local CommonRegionData = ClientAllRegionBaseDataCache or {}
    
    local function CheckAddDeliverMechanism(Id, DeliverMechanismInfo, CommonRegionData)
      if not DeliverMechanismInfo then
        DebugPrint("ZJT_ \229\143\136\228\184\141\233\133\141\232\161\168 ", Id)
        return false, false, {}
      end
      if not DeliverMechanismInfo.SubRegionId or not DataMgr.SubRegion[DeliverMechanismInfo.SubRegionId] then
        DebugPrint("ZJT_ SubRegion\232\161\168 \228\184\141\229\173\152\229\156\168\232\175\165\229\173\144\229\140\186\229\159\159ID : ", DeliverMechanismInfo.SubRegionId)
        return false, false, {}
      end
      if not DeliverMechanismInfo.LevelName then
        DebugPrint("ZJT_ \228\184\141\229\173\152\229\156\168\233\133\141\232\161\168LevelName : ", DeliverMechanismInfo.TeleportPointSubRegion)
        return false, false, {}
      end
      if not DeliverMechanismInfo.Id then
        DebugPrint("ZJT_ \228\184\141\229\173\152\229\156\168\233\133\141\232\161\168CreatorId : ", DeliverMechanismInfo.Id)
        return false, false, {}
      end
      for WorldRegionEid, RegionBaseData in pairs(CommonRegionData) do
        if RegionBaseData.ManualItemId == DeliverMechanismInfo.Id then
          return true, true, RegionBaseData
        end
      end
      return true, false, {}
    end
    
    local GameState = UE4.UGameplayStatics.GetGameState(self.Player)
    local Struct = GameState.MechanismMap:FindRef("Delivery")
    local TargetDelvierMap = {}
    for i, v in pairs(Struct.Array:ToTable()) do
      if IsValid(v) then
        DebugPrint("ZJT_ 111111111111 GameState ", v.ManualItemId)
        TargetDelvierMap[v.ManualItemId] = v
      end
    end
    for ManualItemId, DeliverMechanismInfo in pairs(DataMgr.DeliverMechanism) do
      local SubRegionId = DeliverMechanismInfo.SubRegionId
      local LevelName = DeliverMechanismInfo.LevelName
      local CheckResult, IsUpdate, TargetRegionData = CheckAddDeliverMechanism(ManualItemId, DeliverMechanismInfo, CommonRegionData)
      if CheckResult then
        TargetRegionData.State = {
          StateId = 26,
          CanOpen = true,
          IsActive = true,
          OpenState = false
        }
        if TargetDelvierMap[ManualItemId] then
          DebugPrint("ZJT_ 1111111111 ", ManualItemId, IsValid(TargetDelvierMap[ManualItemId]))
          if IsValid(TargetDelvierMap[ManualItemId]) then
            TargetDelvierMap[ManualItemId]:GMUnlock()
          end
        end
        if IsUpdate then
          local function callback(Ret)
            Avatar.logger.info("ZJT_ AddAllTeleportPoint \229\142\159\230\156\137\228\188\160\233\128\129\231\130\185\230\149\176\230\141\174\229\173\152\229\156\168\229\143\170\229\175\185State\230\149\176\230\141\174\232\191\155\232\161\140\230\155\191\230\141\162 ", Ret, TargetRegionData.WorldRegionEid, TargetRegionData.CreatorId)
          end
          
          Avatar:CallServer("UpdateRegionActorData", callback, TargetRegionData.WorldRegionEid, TargetRegionData.SubRegionId, 1, TargetRegionData.State, TargetRegionData.LevelName)
        else
          TargetRegionData.WorldRegionEid = URuntimeCommonFunctionLibrary.GenerateGUID()
          TargetRegionData.UnitId = 18
          TargetRegionData.UnitType = "Mechanism"
          TargetRegionData.SubRegionId = SubRegionId
          TargetRegionData.ManualItemId = ManualItemId
          TargetRegionData.LevelName = LevelName
          TargetRegionData.RegionDataType = 1
          Avatar:AvatarC2SAddRegionActorData(TargetRegionData)
        end
      end
    end
  end
  
  Avatar:GMHandleSyncAllRegionDataToClient(Callback)
end

function GM_Command_Region:PurchaseImpressionShopItem(ImpressionShopId, DiceNum)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:PurchaseImpressionShopItem(ImpressionShopId, DiceNum)
  end
end

function GM_Command_Region:PrintSimpleRegionData(WorldRegionEid)
  local SubSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, URegionDataMgrSubsystem:StaticClass())
  SubSystem:PrintSimpleRegionData(WorldRegionEid)
end

function GM_Command_Region:PrintFullRegionData(WorldRegionEid)
  local SubSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, URegionDataMgrSubsystem:StaticClass())
  if SubSystem then
    local Index = SubSystem:GetLuaDataIndex(WorldRegionEid)
    if Index then
      local Data = SubSystem.DataPool:GetRegionEntityData(Index)
      PrintTable(Data, 10)
      return
    end
  end
  DebugPrint("NODATATATATA")
end

function GM_Command_Region:AddRandomCreatorRegionDatas()
  local Avatar = GWorld:GetAvatar()
  local RandomCreatorDatas = {}
  RandomCreatorDatas.RegionDataType = 5
  RandomCreatorDatas.RandomRuleId = 7000002
  RandomCreatorDatas.RegionDatas = {}
  for i = 1, 10 do
    local TargetRegionData = {}
    TargetRegionData.WorldRegionEid = URuntimeCommonFunctionLibrary.GenerateGUID()
    TargetRegionData.LevelName = "TeleportPoint_LevelName"
    TargetRegionData.SubRegionId = Avatar:GetCurrentRegionId()
    TargetRegionData.RandomIdxInRule = math.random(1, 100)
    TargetRegionData.RandomTableId = math.random(1, 100)
    TargetRegionData.Location = {
      X = math.random(1, 100000),
      Y = math.random(1, 100000),
      Z = math.random(1, 100000)
    }
    table.insert(RandomCreatorDatas.RegionDatas, TargetRegionData)
  end
  PrintTable({RandomCreatorDatas = RandomCreatorDatas}, 10)
  Avatar:AddRandomCreatorRegionDatas(RandomCreatorDatas)
  Avatar:AddRandomCreatorRegionDatas(RandomCreatorDatas)
end

function GM_Command_Region:ReActiveOneExplore(RarelyId)
  if not RarelyId then
    return
  end
  RarelyId = tonumber(RarelyId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local GameState = GameMode.EMGameState
  local ExploreGroup = GameState.ExploreGroupMap:FindRef(RarelyId)
  local SubRegionId
  if ExploreGroup then
    SubRegionId = GameMode:GetRegionIdByLocation(ExploreGroup:K2_GetActorLocation())
    ExploreGroup:GMReceiveOnExploreGroupResetUI()
    ExploreGroup:TryDeactive()
    DebugPrint("ZJT_ \229\174\162\230\136\183\231\171\175\230\142\162\231\180\162\231\187\132\233\135\141\231\189\174\230\136\144\229\138\159 \229\136\160\233\153\164\229\175\185\229\186\148\230\149\176\230\141\174 ", RarelyId)
  end
  if Avatar.Explores[RarelyId] then
    local function Callback(Ret)
      if Avatar:CheckRegionErrorCode(Ret) then
        DebugPrint("ZJT_ \230\156\141\229\138\161\231\171\175\233\135\141\231\189\174\230\142\162\231\180\162\231\187\132\229\136\176Doing \230\136\144\229\138\159\239\188\154  ", RarelyId, Ret)
        
        EventManager:FireEvent(EventID.OnExploreGroupDeactive, RarelyId)
        EventManager:FireEvent(EventID.OnExploreGroupReset, RarelyId)
        EventManager:FireEvent(EventID.OnExploreGroupActive, RarelyId)
      else
        DebugPrint("ZJT_ \230\156\141\229\138\161\231\171\175\233\135\141\231\189\174\230\142\162\231\180\162\231\187\132\229\136\176Doing \229\164\177\232\180\165\239\188\154  ", RarelyId, Ret)
      end
    end
    
    Avatar:CallServer("GMResetingExplore2Doing", Callback, RarelyId)
  else
    if not SubRegionId then
      ScreenPrint("\228\184\141\232\131\189\230\191\128\230\180\187\228\184\141\229\156\168\232\175\165\229\140\186\229\159\159\231\154\132\230\142\162\231\180\162\231\187\132\239\188\140\232\175\183\231\167\187\229\138\168\229\136\176\232\175\165\230\142\162\231\180\162\231\187\132\230\137\128\229\156\168\229\140\186\229\159\159\229\156\168\230\191\128\230\180\187 ")
      return
    end
    Avatar:ExploreIdActive(RarelyId, SubRegionId)
  end
end

function GM_Command_Region:ReActiveAllExplore()
  local Avatar = GWorld:GetAvatar()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local GameState = GameMode.EMGameState
  if not Avatar then
    return
  end
  local RarelyIdTable = {}
  for RarelyId, Explore in pairs(Avatar.Explores) do
    if Explore:IsDoing() or Explore:IsComplete() then
      local ExploreGroup = GameState.ExploreGroupMap:FindRef(RarelyId)
      if ExploreGroup then
        ExploreGroup:GMReceiveOnExploreGroupResetUI()
        ExploreGroup:TryDeactive()
      end
      table.insert(RarelyIdTable, RarelyId)
    end
  end
  
  local function Callback(Ret, SuccTable)
    if not Avatar:CheckRegionErrorCode(Ret) then
      DebugPrint("ZJT_ \233\135\141\231\189\174\230\142\162\231\180\162\231\187\132\229\164\177\232\180\165 GM\230\140\135\228\187\164 \233\148\153\232\175\175\231\160\129 \239\188\154 ", Ret)
      return
    end
    if not SuccTable or #SuccTable <= 0 then
      DebugPrint("ZJT_ \233\135\141\231\189\174\230\142\162\231\180\162\231\187\132\229\164\177\232\180\165 GM\230\140\135\228\187\164 \230\178\161\230\156\137\230\142\162\231\180\162\231\187\132\233\135\141\231\189\174\230\136\144\229\138\159 \239\188\154 ", Ret)
      return
    end
    for _, RarelyId in ipairs(SuccTable) do
      DebugPrint("ZJT_ \230\156\141\229\138\161\231\171\175\233\135\141\231\189\174\230\142\162\231\180\162\231\187\132\229\136\176Doing \230\136\144\229\138\159\239\188\154  ", RarelyId, Ret)
      EventManager:FireEvent(EventID.OnExploreGroupDeactive, RarelyId)
      EventManager:FireEvent(EventID.OnExploreGroupActive, RarelyId)
    end
  end
  
  PrintTable({RarelyIdTable = RarelyIdTable}, 10)
  if next(RarelyIdTable) ~= nil then
    Avatar:CallServer("RestingExploreIds", Callback, RarelyIdTable)
  end
  local ActiveIds = {}
  for RarelyId, ExploreGroup in pairs(GameState.ExploreGroupMap:ToTable()) do
    DebugPrint("ZJT_ \230\191\128\230\180\187\230\156\170\230\191\128\230\180\187\230\142\162\231\180\162\231\187\132 ", RarelyId, ExploreGroup:GetStatus())
    if ExploreGroup:GetStatus() == EExploreGroupStatus.EGS_Deactive then
      DebugPrint("ZJT_ 11111111111 EExploreGroupStatus ", RarelyId, ExploreGroup:GetStatus(), EExploreGroupStatus.EGS_Deactive)
      local ExploreGroup = GameState.ExploreGroupMap:FindRef(RarelyId)
      if ExploreGroup then
        ExploreGroup:GMReceiveOnExploreGroupResetUI()
        ExploreGroup:TryDeactive()
        local SubRegionId = GameMode:GetRegionIdByLocation(ExploreGroup:K2_GetActorLocation())
        ActiveIds[RarelyId] = SubRegionId
      end
    end
  end
  PrintTable({ActiveIds = ActiveIds}, 10)
  if next(ActiveIds) ~= nil then
    Avatar:ExploreIdsActive(ActiveIds)
  end
end

function GM_Command_Region:CharAppearance()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local CharUuid = Avatar.CurrentChar
  Avatar:SwitchCurrentCharAppearance(CharUuid, 1)
  Avatar:SwitchCurrentCharAppearance(CharUuid, 2)
  Avatar:SwitchCurrentCharAppearance(CharUuid, 3)
  Avatar:SwitchCurrentCharAppearance(CharUuid, 4)
  Avatar:AddNewCharAppearance()
  Avatar:SwitchCurrentCharAppearance(CharUuid, 4)
  Avatar:SetCharAppearanceAccessory(CharUuid, 1, 10002)
  Avatar:SetCharAppearanceAccessory(CharUuid, 4, 10002)
  Avatar:RemoveCharAppearanceAccessory(CharUuid, 1, 10002)
  Avatar:RemoveCharAppearanceAccessory(CharUuid, 4, 10002)
  Avatar:SetCharShowPart(CharUuid, 1, false)
  Avatar:SetCharShowPart(CharUuid, 1, true)
  Avatar:SetCharShowPart(CharUuid, 2, true)
  Avatar:SetCharShowPart(CharUuid, 3, false)
end

function GM_Command_Region:DispatchSystem(DispatchId)
  DispatchId = tonumber(DispatchId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local CharUuid = Avatar.CurrentChar
  local DispatchCharsList = {}
  table.insert(DispatchCharsList, CharUuid)
  Avatar:CancelDispatch(DispatchId)
end

function GM_Command_Region:GetDispatchReward(DispatchId)
  DispatchId = tonumber(DispatchId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  Avatar:CompleteDispatch(DispatchId)
end

function GM_Command_Region:GetAllDispatchReward(DispatchId1, DispatchId2)
  local Avatar = GWorld:GetAvatar()
  DispatchId1 = tonumber(DispatchId1)
  DispatchId2 = tonumber(DispatchId2)
  local DispatchReward = {}
  table.insert(DispatchReward, DispatchId1)
  table.insert(DispatchReward, DispatchId2)
  if not Avatar then
    return
  end
  Avatar:GetAllDispatchReward({})
  Avatar:GetAllDispatchReward(DispatchReward)
end

function GM_Command_Region:PrintDispatchSystem()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    PrintTable({
      CurrentList = Avatar.CurrentDispatchList:all_dump(Avatar.CurrentDispatchList)
    }, 10)
    PrintTable({
      Dispatches = Avatar.Dispatches:all_dump(Avatar.Dispatches)
    }, 10)
  end
end

function GM_Command_Region:PrintImpressionRandom(Count)
  if not Count then
    return
  end
  Count = tonumber(Count)
  if Count <= 0 then
    return
  end
  for i = 1, Count do
    local function Normal_Random()
      local u1 = math.random()
      
      local u2 = math.random()
      local z0 = math.sqrt(-2 * math.log(u1)) * math.cos(2 * math.pi * u2)
      return DataMgr.GlobalConstant.ImpressionAvgNum.ConstantValue + DataMgr.GlobalConstant.ImpressionStdNum.ConstantValue * z0
    end
    
    local LoopCount = 10
    local Res
    repeat
      Res = Normal_Random()
      LoopCount = LoopCount - 1
    until Res >= 0 and Res < 100 or LoopCount <= 0
    if Res >= 100 then
      DebugPrint("ZJT_ PrintImpressionRandom Index Res1 tens units ", i, Res, 9, 9)
    elseif Res >= 0 and Res < 100 then
      local tens = math.floor(Res / 10) % 10
      local units = math.floor(Res) % 10
      DebugPrint("ZJT_ PrintImpressionRandom Index Res1 tens units ", i, Res, units, tens)
    else
      DebugPrint("ZJT_ PrintImpressionRandom Index Res1 tens units ", i, Res, 0, 0)
    end
  end
end

function GM_Command_Region:TestImpressionSystem(PreDialogueId, CurrentDialogueId, TalkTriggerId)
end

function GM_Command_Region:TestSojournsSystem(PartyId, Level)
  PartyId = tonumber(PartyId)
  Level = tonumber(Level)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:StartSojourns(PartyId, Level)
  end
end

function GM_Command_Region:AddImpressionPreNode(PreDialogueId)
  PreDialogueId = tonumber(PreDialogueId)
  local ErrorCode = ""
  
  local function printError()
    DebugPrint("GM_Command:AddImpressionPreNode@", ErrorCode)
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    UIManager:ShowUITip(UIConst.Tip_CommonToast, ErrorCode, 3)
  end
  
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    ErrorCode = "Avatar\228\184\141\229\173\152\229\156\168"
    printError()
    return
  end
  if Avatar:IsImpressionCheckSuccess(PreDialogueId) then
    ErrorCode = "\229\175\185\229\186\148\231\154\132\233\128\137\233\161\185\229\183\178\232\162\171\232\174\176\229\189\149\239\188\140\230\151\160\230\179\149\233\135\141\229\164\141\233\128\137\230\139\169"
    printError()
    return
  end
  Avatar:GMAddImpressionPreNode(PreDialogueId)
end

function GM_Command_Region:SetViewTargetWithWC(X, Y, Z)
  local Location = FVector(tonumber(X), tonumber(Y), tonumber(Z))
  local Transform = UE4.FTransform(FRotator(), Location)
  local Actor = self.Player:GetWorld():SpawnActor(ACameraActor.StaticClass(), Transform, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self.Player)
  local WCSubsystem = GameMode:GetWCSubSystem()
  WCSubsystem:SetViewTargetWithWC(Actor, {
    self,
    function()
      DebugPrint("LogWC SetViewTargetWithWC Finish")
      self.Player:AddTimer(10, function()
        UGameplayStatics.GetPlayerController(self.Player, 0):SetViewTargetWithBlend(self.Player)
      end)
    end
  })
end

return GM_Command_Region
