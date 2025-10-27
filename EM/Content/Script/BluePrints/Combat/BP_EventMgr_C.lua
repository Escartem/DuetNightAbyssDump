require("UnLua")
require("DataMgr")
require("Const")
local MiscUtils = require("Utils.MiscUtils")
local Utils = require("Utils")
local EventTrigger = require("BluePrints.Combat.EventTrigger")
local BP_EventMgr_C = Class()

function BP_EventMgr_C:Initialize(Initializer)
  self.EventTriggers = {}
  self.FramingCreateUintQueue = {}
  self.AysncQueueChangedDelegates = {}
  self.AsyncCreateActorNum = 0
  self.LoadingClassMonsterQueue = {}
  self.InitializeMonsterQueue = {}
  self.AsyncQueueIndex = 1
  self.AsyncQueueTypeArray = {}
  for Key, Value in pairs(Const.OpenFramingCreateUnit) do
    if Value then
      table.insert(self.AsyncQueueTypeArray, Key)
      self.FramingCreateUintQueue[Key] = {}
    end
  end
end

function BP_EventMgr_C:InitializeSummonCacheParams()
  local PlatformName = UE4.UUIFunctionLibrary.GetDevicePlatformName()
  self.bCustomNpcOpenCreateOpt = Const.CustomNpcCreateOpt
end

function BP_EventMgr_C:InitAIUnitCacheParams()
  self.bStandAloneMonsterCanCache = Const.StandAloneMonsterCanCache
  self.bOnlineMonsterCanCache = Const.OnlineMonsterCanCache
  self.bMonsterCanSpawnFromCache = Const.MonsterCanSpawnFromCache
end

function BP_EventMgr_C:AddTrigger(TriggerId)
  local NewTrigger = EventTrigger:New({}, TriggerId)
  table.insert(self.EventTriggers, NewTrigger)
end

function BP_EventMgr_C:ReceiveBeginPlay()
  local PlatformName = UE4.UUIFunctionLibrary.GetDevicePlatformName()
  if "Android" == PlatformName then
    self.bEnableCreateUnitCtrlOpt = true
  else
    self.bEnableCreateUnitCtrlOpt = false
  end
end

function BP_EventMgr_C:TryEndLoading()
  for UnitType, FramingQueue in pairs(self.FramingCreateUintQueue) do
    if #FramingQueue > 0 then
      return false
    end
  end
  if self.AsyncCreateActorNum > 0 then
    return false
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    return false
  end
  if not GameState.bRegionPreCreateUnitReady then
    GameState.bRegionPreCreateUnitReady = true
    GameState:TryEndLoading("RegionPreCreateUnitReady")
  end
  return true
end

function BP_EventMgr_C:CheckTriggers()
  local i = 1
  while i <= #self.EventTriggers do
    if self.EventTriggers[i].IsTriggered() then
      self:TriggerATrigger(self.EventTriggers[i])
      table.remove(self.EventTriggers, i)
    else
      i = i + 1
    end
  end
end

function BP_EventMgr_C:TriggerATrigger(Trigger)
  for Index, EventId in Trigger.Events, nil, nil, nil do
    self:TriggerEvent(EventId)
  end
end

function BP_EventMgr_C:TriggerEvent(EventId)
end

function BP_EventMgr_C:GMCreateNpc(UnitId, Num, Level, CreatorType)
  DebugPrint(UE4.UKismetSystemLibrary.GetFrameCount(), "==========GMCreateNpc============================")
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local Location = FVector(0, 0, 0)
  if IsValid(Player) then
    Location = Player:K2_GetActorLocation() + Player:GetActorForwardVector() * 100
  end
  local Creator, MonsterSpawn
  if "StaticCreator" == CreatorType then
    Creator = UE4.UGameplayStatics.GetGameMode(self).FixedCreator
  elseif "MonsterSpawn" == CreatorType then
    MonsterSpawn = UE4.UGameplayStatics.GetGameMode(self).FixedMonsterSpawn
  end
  for i = 1, Num do
    local Context = AEventMgr.CreateUnitContext()
    Context.UnitId = tonumber(UnitId)
    Context.UnitType = "Npc"
    Context.Loc = Location
    Context.IntParams:Add("Level", tonumber(Level) or 1)
    Context.Creator = Creator
    Context.MonsterSpawn = MonsterSpawn
    Context.BoolParams:Add("FixLocation", true)
    self:CreateUnitNew(Context, false)
  end
end

function BP_EventMgr_C:GMCreatePet(UnitId, Num)
  DebugPrint(UE4.UKismetSystemLibrary.GetFrameCount(), "==========GMCreatePet============================")
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local Location = FVector(0, 0, 0)
  if IsValid(Player) then
    Location = Player:K2_GetActorLocation() + Player:GetActorForwardVector() * 100
  end
  for i = 1, Num do
    local Context = AEventMgr.CreateUnitContext()
    Context.UnitId = tonumber(UnitId)
    Context.UnitType = "Pet"
    Context.Loc = Location
    Context.IntParams:Add("Level", 1)
    Context.IntParams:Add("RegionDataType", 1)
    Context.BoolParams:Add("FixLocation", false)
    self:CreateUnitNew(Context, false)
  end
end

function BP_EventMgr_C:GMCreateMonster(Eid, UnitId, Num, Level, CreatorType)
  local Player = Battle(self):GetEntity(Eid)
  local Location = FVector(0, 0, 0)
  if IsValid(Player) then
    Location = Player:K2_GetActorLocation() + Player:GetActorForwardVector() * 100
  end
  local Creator, MonsterSpawn
  if "StaticCreator" == CreatorType then
    Creator = UE4.UGameplayStatics.GetGameMode(self).FixedCreator
  elseif "MonsterSpawn" == CreatorType then
    MonsterSpawn = UE4.UGameplayStatics.GetGameMode(self).FixedMonsterSpawn
  end
  for i = 1, Num do
    local Context = AEventMgr.CreateUnitContext()
    Context.UnitId = tonumber(UnitId)
    Context.UnitType = "Monster"
    Context.Loc = Location
    Context.IntParams:Add("Level", tonumber(Level) or 1)
    Context.Creator = Creator
    Context.MonsterSpawn = MonsterSpawn
    Context.BoolParams:Add("FixLocation", true)
    self:CreateUnitNew(Context, false)
  end
end

function BP_EventMgr_C:GMCreateTestMonster(Eid, Id, Num, Loc, Callback, Args)
  local ActorType = "Monster"
  local UnitId = tonumber(Id)
  local ActorData = DataMgr[ActorType][UnitId]
  local ActorPath = ActorData.UnitBPPath
  local Player = Battle(self):GetEntity(Eid)
  local Location = Loc or FVector(0, 0, 0)
  if IsValid(Player) and not Loc then
    Location = Player:K2_GetActorLocation() + Player:GetActorForwardVector() * 100
  end
  local Unit
  for i = 1, Num do
    local function LoadClassFinished(self, UnitBlueprint)
      local BTObject = LoadObject("/Game/AssetDesign/AI/Z_Misc_Test/BT/TestNew.TestNew") or nil
      
      Unit = URuntimeCommonFunctionLibrary.SpawnAIFromClass(self, UnitBlueprint, BTObject, Location, FRotator(0, 0, 0), UE4.ESpawnActorCollisionHandlingMethod.AdjustIfPossibleButAlwaysSpawn, nil)
      
      local function LoadFinishCallback(Unit)
        Unit:SetAttr("MaxHp", 999999999)
        Unit:SetAttr("MaxES", 5000)
        Unit:SetAttr("ES", 5000)
        if Callback then
          Callback(Unit)
        end
      end
      
      local function LoadFinishCallbackNew(_, Unit)
        Unit:SetAttr("MaxHp", 999999999)
        Unit:SetAttr("MaxES", 5000)
        Unit:SetAttr("ES", 5000)
        if Callback then
          Callback(Unit)
        end
      end
      
      local Eid = UE4.UGameplayStatics.GetGameMode(self):GetBattleEid()
      local Context = AEventMgr.CreateUnitContext()
      Context.UnitId = UnitId
      Context.UnitType = "Monster"
      Context.Loc = Location
      Context:AddObjectParams("BTObject", BTObject)
      Context:AddLuaTable("Args", Args)
      Context.OnUnitInitCreateReadyDynamic:Add(self, LoadFinishCallbackNew)
      Context.Unit = Unit
      Unit.UnitId = UnitId
      Unit:SetEid(Eid)
      self:RegisterCreateData(Eid, Context)
      Unit:RegisterInfoNew(Context)
    end
    
    local UnitClass = MiscUtils.GetCacheClass(ActorPath)
    if UnitClass then
      LoadClassFinished(self, UnitClass)
    else
      UE4.UResourceLibrary.LoadClassAsync(self, ActorPath, {self, LoadClassFinished})
    end
  end
end

function BP_EventMgr_C:GMCreateMechanismSummon(Eid, UnitId, Num, Level)
  local Player = Battle(self):GetEntity(Eid)
  local Location = FVector(0, 0, 0)
  if IsValid(Player) then
    Location = Player:K2_GetActorLocation() + Player:GetActorForwardVector() * 100
  end
  for i = 1, Num do
    local Context = AEventMgr.CreateUnitContext()
    Context.UnitId = tonumber(UnitId)
    Context.UnitType = "MechanismSummon"
    Context.Loc = Location
    Context.IntParams:Add("Level", tonumber(Level) or 1)
    Context.DirectSource = Player
    Context.BoolParams:Add("FixLocation", true)
    self:CreateUnitNew(Context, false)
  end
end

function BP_EventMgr_C:CreateAIUnitFromCache(Info)
  if not Const.StandAloneMonsterCanCache and IsStandAlone(self) then
    return false
  end
  if not Const.OnlineMonsterCanCache and not IsStandAlone(self) then
    return false
  end
  if not Const.MonsterCanSpawnFromCache then
    return false
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if Info.MonsterSpawn ~= nil and GameState:HasMonsterCache(Info.UnitId) then
    local BTObject = Info.BT and LoadObject(Info.BT) or nil
    local Unit = GameState:CreateAIUnitFromCache(Info.UnitId, BTObject, Info.Loc, Info.Rotation)
    Info.BTObject = BTObject
    Info.InitType = "FromCache"
    self:AddInitializeMonsterQueue(Info)
    Unit:RegisterInfo(Info)
    self:FixPawnLocation(Unit, Info, Unit:IsAIControlled() == true and Unit:IsSummonMonster() == false)
    return true
  end
  if Info.MonsterSpawn ~= nil and GameState:HasMonsterInPool(Info.UnitId) then
    local BTObject = Info.BT and LoadObject(Info.BT) or nil
    local Unit = GameState:GetMonsterFromPool(Info.UnitId, BTObject, Info.Loc, Info.Rotation)
    if nil == Unit then
      return false
    end
    Info.BTObject = BTObject
    if Info.SkillLevelSource then
      Unit:SetSkillLevelInfo(Info.SkillLevelSource:GetSkillLevelInfo())
    end
    if Info.SourceSkillId and Unit.SetSourceSkillId then
      Unit:SetSourceSkillId(Info.SourceSkillId)
    end
    Info.InitType = "FromCache"
    self:AddInitializeMonsterQueue(Info)
    Unit:RegisterInfo(Info)
    self:FixPawnLocation(Unit, Info, Unit:IsAIControlled() == true and Unit:IsSummonMonster() == false)
    return true
  end
  if GameState:HasMonsterInStaticPool(Info.UnitId) then
    local BTObject = Info.BT and LoadObject(Info.BT) or nil
    local Unit = GameState:GetMonsterFromStaticPool(Info.UnitId, BTObject, Info.Loc, Info.Rotation)
    if nil == Unit then
      return false
    end
    Info.BTObject = BTObject
    if Info.SkillLevelSource then
      Unit:SetSkillLevelInfo(Info.SkillLevelSource:GetSkillLevelInfo())
    end
    if Info.SourceSkillId and Unit.SetSourceSkillId then
      Unit:SetSourceSkillId(Info.SourceSkillId)
    end
    Info.InitType = "FromCache"
    self:AddInitializeMonsterQueue(Info)
    Unit:RegisterInfo(Info)
    self:FixPawnLocation(Unit, Info, Unit:IsAIControlled() == true and Unit:IsSummonMonster() == false)
    return true
  end
  if self.bPlayerCanPreloadSummon and nil ~= Info.DirectSource and GameState:HasSummonMonsterInPool(Info.UnitId) then
    local BTObject = Info.BT and LoadObject(Info.BT) or nil
    local Unit = GameState:GetSummonMonFromPool(Info.UnitId, BTObject, Info.Loc, Info.Rotation)
    if nil == Unit then
      return false
    end
    Info.BTObject = BTObject
    if Info.SkillLevelSource then
      Unit:SetSkillLevelInfo(Info.SkillLevelSource:GetSkillLevelInfo())
    end
    if Info.SourceSkillId and Unit.SetSourceSkillId then
      Unit:SetSourceSkillId(Info.SourceSkillId)
    end
    Info.InitType = "FromCache"
    self:AddInitializeMonsterQueue(Info)
    Unit:RegisterInfo(Info)
    return true
  end
  if self.bSummonCanDeadCache and nil ~= Info.DirectSource and GameState:HasSummonsterInDeadCache(Info.UnitId) then
    local BTObject = Info.BT and LoadObject(Info.BT) or nil
    local Unit = GameState:GetSummonFromDeadCache(Info.UnitId, BTObject, Info.Loc, Info.Rotation)
    Info.BTObject = BTObject
    Info.InitType = "FromCache"
    self:AddInitializeMonsterQueue(Info)
    Unit:RegisterInfo(Info)
    return true
  end
  return false
end

function BP_EventMgr_C:SnapShotCreateUnit(SpawnData, Creator)
  local Location = FVector(SpawnData.Trans.Translation.X, SpawnData.Trans.Translation.Y, SpawnData.Trans.Translation.Z)
  local BornPos = FVector(SpawnData.BornPos.X, SpawnData.BornPos.Y, SpawnData.BornPos.Z)
  local Context = AEventMgr.CreateUnitContext()
  Context.StrParams:Add("LevelName", SpawnData.LevelName)
  Context.UnitId = SpawnData.UnitId
  Context.UnitType = SpawnData.UnitType
  Context.IntParams:Add("Eid", SpawnData.SnapShotId)
  Context.Loc = Location
  Context.IntParams:Add("Level", SpawnData.Level)
  Context.Rotation = SpawnData.Trans.Rotation:ToRotator()
  Context.Creator = Creator
  Context:AddObjectParams("BTObject", Creator and Creator.BornChangeBT)
  Context.IntParams:Add("RandomCreatorId", SpawnData.RandomCreatorId)
  Context.IntParams:Add("RandomRuleId", SpawnData.RuleId)
  Context.IntParams:Add("RandomTableId", SpawnData.RandomTableId)
  Context.VectorParams:Add("BornPos", BornPos)
  self:CreateUnitNew(Context, false)
  DebugPrint("SnapShot: \229\137\175\230\156\172\229\186\143\229\136\151\229\140\150\230\129\162\229\164\141, LevelName:", SpawnData.LevelName, "UnitId:", SpawnData.UnitId, "UnitType:", SpawnData.UnitType, "Eid:", SpawnData.SnapShotId, "Location:", Location, "CreatorId:", SpawnData.CreatorId, "BornPos:", SpawnData.BornPos, "PrivateEnable:", SpawnData.PrivateEnable, "RandomCreatorId:", SpawnData.RandomCreatorId, "RandomRuleId:", SpawnData.RuleId, "RandomTableId", SpawnData.RandomTableId)
end

function BP_EventMgr_C:PostProcessInfo(Info)
  local function CheckRarity(Info)
    return DataMgr.Drop[Info.UnitId].Rarity >= 3
  end
  
  if Info.UnitType == "Drop" and Info.UnitId then
    local Avatar = GWorld:GetAvatar()
    if Avatar and Avatar:IsInHardBoss() then
      Info.RegionDataType = ERegionDataType.RDT_HardBossData
      return
    end
    if Info.RegionDataType and Info.RegionDataType ~= ERegionDataType.RDT_RarelyData and Info.RegionDataType ~= ERegionDataType.RDT_QuestData and not CheckRarity(Info) then
      Info.RegionDataType = ERegionDataType.RDT_None
    end
  end
end

function BP_EventMgr_C:OnRegionDataClaimed_Lua(WorldRegionEid)
  for UnitType, AsyncTable in pairs(self.FramingCreateUintQueue) do
    for i, AsyncInfo in ipairs(AsyncTable) do
      if AsyncInfo.WorldRegionEid == WorldRegionEid then
        table.remove(AsyncTable, i)
        return
      end
    end
  end
  if self.LoadingClassMonsterQueue[WorldRegionEid] then
    self.LoadingClassMonsterQueue[WorldRegionEid] = nil
  end
end

function BP_EventMgr_C:OnSpecialQuestBegin()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode or not GameMode:GetRegionDataMgrSubSystem() then
    return
  end
  local RegionDataMgrSubsystem = GameMode:GetRegionDataMgrSubSystem()
  local RegionDataLibrary = RegionDataMgrSubsystem.DataLibrary
  if not RegionDataLibrary then
    return
  end
  for UnitType, AsyncTable in pairs(self.FramingCreateUintQueue) do
    local WaitingRemove = {}
    for _, AsyncInfo in pairs(AsyncTable) do
      if not RegionDataLibrary:CheckCanCreateWhileSpecialQuest(AsyncInfo.Creator or AsyncInfo) then
        DebugPrint("BP_EventMgr_C:OnSpecialQuestBegin ", UnitType, AsyncInfo.WorldRegionEid)
        RegionDataMgrSubsystem:ClaimRegionData(AsyncInfo.WorldRegionEid)
        table.insert(WaitingRemove, AsyncInfo.WorldRegionEid)
      end
    end
    for _, WorldRegionEid in pairs(WaitingRemove) do
      self:OnRegionDataClaimed_Lua(WorldRegionEid)
    end
  end
  for Eid, Info in pairs(self.LoadingClassMonsterQueue) do
    if Info.WorldRegionEid and not RegionDataLibrary:CheckCanCreateWhileSpecialQuest(Info.Creator) then
      RegionDataMgrSubsystem:ClaimRegionData(Info.WorldRegionEid)
      self:OnRegionDataClaimed_Lua(Info.WorldRegionEid)
      self.LoadingClassMonsterQueue[Info.WorldRegionEid] = nil
      DebugPrint("BP_EventMgr_C:OnSpecialQuestBegin LoadingClassMonsterQueue", Info.WorldRegionEid)
    end
  end
  for Eid, Info in pairs(self.InitializeMonsterQueue) do
    if not RegionDataLibrary:CheckCanCreateWhileSpecialQuest(Info.Creator) then
      Info.DestroySelf = true
      Info.DestroySelfReason = EDestroyReason.SepcialQuestStart
    end
  end
end

function BP_EventMgr_C:PreCreateRegionInfo(Info, bForceSync)
  if type(Info) ~= "table" then
    DebugPrint("NOINFO")
    return
  end
  if Info.ExtraCreateInfo then
    for k, v in pairs(Info.ExtraCreateInfo) do
      Info[k] = v
    end
  end
  if Info.UnitType == "Gizmo" then
    Info.UnitType = "Mechanism"
  end
  if 0 == Info.UnitId then
    return
  end
  if Info.UnitType == "Monster" and Info.UnitId ~= 7007002 then
    return
  end
  self:PostProcessInfo(Info)
end

function BP_EventMgr_C:CanRegionSerialize(Info)
  if Const.RegionSerializeUnitType[Info.UnitType] == nil then
    return false
  end
  if Info.UnitType == "Phantom" and not Info.IsNPCPhantom then
    return false
  end
  return true
end

function BP_EventMgr_C:PostCreateRegionInfo(Info, bForceSync)
  if not bForceSync then
    if not self.FramingCreateUintQueue[Info.UnitType] then
      self.FramingCreateUintQueue[Info.UnitType] = {}
      table.insert(self.AsyncQueueTypeArray, Info.UnitType)
    end
    if not table.findValue(self.AsyncQueueTypeArray, Info.UnitType) then
      table.insert(self.AsyncQueueTypeArray, Info.UnitType)
    end
    table.insert(self.FramingCreateUintQueue[Info.UnitType], Info)
  else
    self:RealCreateUnit(Info, bForceSync)
  end
end

function BP_EventMgr_C:ChangeNpcInfoByGender(Info)
  if DataMgr.NPC[Info.UnitId] == nil or 1 ~= DataMgr.NPC[Info.UnitId].PlayerInfo then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    Utils.ScreenPrint("Error ChangeNpcInfoByGender Avatar == nil, NPCId:" .. Info.UnitId)
    return
  end
  local FakeNpcInfo
  for _, value in pairs(DataMgr.GenderToNpcId) do
    if value.NpcId and value.NpcId == Info.UnitId then
      FakeNpcInfo = value
      break
    end
  end
  if nil == FakeNpcInfo then
    Utils.ScreenPrint("Error ChangeNpcInfoByGender FakeNpcInfo == nil, NPCId:" .. Info.UnitId)
    return
  end
  local FakeNpcInfo2
  for _, value in pairs(DataMgr.GenderToNpcId) do
    if value.GroupId and value.GroupId == FakeNpcInfo.GroupId and value.Gender ~= FakeNpcInfo.Gender then
      FakeNpcInfo2 = value
      break
    end
  end
  if nil == FakeNpcInfo2 then
    Utils.ScreenPrint("Error ChangeNpcInfoByGender FakeNpcInfo2 == nil, NPCId:" .. Info.UnitId)
    return
  end
  local AvatarGender
  if FakeNpcInfo2.SwitchPlayer == "Player" then
    AvatarGender = Avatar.Sex
  elseif FakeNpcInfo2.SwitchPlayer == "EXPlayer" then
    AvatarGender = Avatar.WeitaSex
  end
  if nil == AvatarGender then
    Utils.ScreenPrint("Error ChangeNpcInfoByGender AvatarGender == nil, NPCId:" .. Info.UnitId)
    return
  end
  local RealNpcInfo
  if AvatarGender == FakeNpcInfo2.Gender then
    RealNpcInfo = FakeNpcInfo2
  elseif AvatarGender == FakeNpcInfo.Gender then
    RealNpcInfo = FakeNpcInfo
  end
  if nil == RealNpcInfo then
    Utils.ScreenPrint("Error ChangeNpcInfoByGender RealNpcInfo == nil, NPCId:" .. Info.UnitId)
    return
  end
  DebugPrint("FakeNpcId:", Info.UnitId, "RealNpcId:", RealNpcInfo.NpcId, "Gender:", RealNpcInfo.SwitchPlayer, AvatarGender)
  Info.UnitId = RealNpcInfo.NpcId
end

function BP_EventMgr_C:ServerCreateDrop(Info)
  self:PreCreateRegionInfo(Info)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode and GameMode:GetWCSubSystem() then
    self:PreServerCreateDrop(Info.WorldRegionEid, GameMode:GetWCSubSystem():GetLocationLevelName(Info.Loc))
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode and URuntimeCommonFunctionLibrary.UseCppRegionData(self) and (GameMode:IsInRegion() or not GWorld:GetAvatar()) then
    if Info.WorldRegionEid then
      self:PreActorCreated(Info.WorldRegionEid)
    else
      Info.WorldRegionEid = self:PreActorCreated_Raw(Info.Loc)
    end
    GameMode:GetRegionDataMgrSubSystem():FillRegionData(Info)
  end
  self:PostCreateRegionInfo(Info)
end

function BP_EventMgr_C:RealCreateUnit(Info, bForceSync)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if not Info.UnitType or not Info.UnitId then
    GameMode:GetRegionDataMgrSubSystem():PrintEntityData(Info.WorldRegionEid)
  end
  local ActorData = DataMgr[Info.UnitType][Info.UnitId]
  if nil == ActorData then
    if not Info.Creator then
      GWorld.logger.error("\229\136\183\230\128\170\230\149\176\230\141\174\232\142\183\229\143\150\229\164\177\232\180\165    UnitId:   " .. Info.UnitId .. "   UnitType:  " .. Info.UnitType)
      return
    end
    local ExploreActor = GameMode.EMGameState.ExploreGroupMap:FindRef(Info.Creator.RarelyId)
    local LevelName = GameMode:GetActorLevelName(Info.Creator)
    if ExploreActor then
      GWorld.logger.error("\229\136\183\230\128\170\230\149\176\230\141\174\232\142\183\229\143\150\229\164\177\232\180\165    UnitId:   " .. Info.UnitId .. "   UnitType:  " .. Info.UnitType .. "  CreatorId: " .. Info.Creator.StaticCreatorId .. "  LevelName: " .. tostring(Info.LevelName) .. "  ExploreActorName: " .. ExploreActor:GetName() .. " StaticCreatorActor: " .. Info.Creator:GetName())
    else
      GWorld.logger.error("\229\136\183\230\128\170\230\149\176\230\141\174\232\142\183\229\143\150\229\164\177\232\180\165    UnitId:   " .. Info.UnitId .. "   UnitType:  " .. Info.UnitType .. "  CreatorId: " .. Info.Creator.StaticCreatorId .. "  LevelName: " .. tostring(LevelName) .. " StaticCreatorActor: " .. Info.Creator:GetName())
    end
    return
  end
  Info.ActorPath = ActorData.UnitBPPath
  if Info.UnitType ~= "Monster" then
    Info.BT = ActorData.BT
    if Info.BTIndex then
      Info.BT = Info.BT[Info.BTIndex]
    end
  end
  if 1 == Const.CreateType[Info.UnitType] then
    self:CreateAIUnit(Info, bForceSync)
  else
    self:CreateActorUnit(Info, bForceSync)
  end
end

function BP_EventMgr_C:NeedApplySubsidenceAdjust(Unit)
  if Unit:IsAIControlled() == false then
    return false
  end
  local UnitId = Unit.UnitId
  if DataMgr.Monster[UnitId] and DataMgr.Monster[UnitId].DontApplySubsidenceAdjust then
    return false
  end
  return true
end

function BP_EventMgr_C:CreateAIUnit(Info, bForceSync, bFromMonsterLimitQueue)
  if Const.EnableCreateUnitLog then
    print(_G.LogTag, "CreateAIUnit", Info.UnitId)
    PrintTable(Info)
  end
  if not bFromMonsterLimitQueue and not self:CheckCreateAIUnit(Info) then
    table.insert(self.MonsterInfoQueue, Info)
    return
  end
  if Info.UnitType == "Monster" and Info.DirectSource and Info.CreateUnitId and not self:PreCheckDirectSourceHadUnit(Info.DirectSource, Info.CreateUnitId) then
    DebugPrint("BP_EventMgr_C CreateAIUnit DirectSource", Info.DirectSource:GetName(), "don't have CreateUnitId", Info.CreateUnitId, "return")
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  Info.Eid = Info.Eid or GameMode:GetBattleEid()
  if Info.UnitType == "Monster" and self:CreateAIUnitFromCache(Info) then
    return
  end
  if Info.WorldRegionEid then
    self.LoadingClassMonsterQueue[Info.WorldRegionEid] = Info
  end
  
  local function LoadClassFinished(self, UnitBlueprint)
    if Info.UnitType == "Monster" and Info.DirectSource and Info.CreateUnitId and not self:PreCheckDirectSourceHadUnit(Info.DirectSource, Info.CreateUnitId) then
      DebugPrint("BP_EventMgr_C CreateAIUnit LoadClassFinished DirectSource", Info.DirectSource:GetName(), "don't have CreateUnitId", Info.CreateUnitId, "return")
      return
    end
    if Info.WorldRegionEid and not self.LoadingClassMonsterQueue[Info.WorldRegionEid] then
      DebugPrint("BP_EventMgr_C LoadClassFinished but", Info.WorldRegionEid, "\229\183\178\231\187\143\232\162\171\233\148\128\230\175\129\228\186\134")
      return
    end
    if Info.WorldRegionEid then
      self.LoadingClassMonsterQueue[Info.WorldRegionEid] = nil
    end
    GameMode.RegionDataIniting = true
    local Unit = URuntimeCommonFunctionLibrary.SpawnAIFromClass(self, UnitBlueprint, nil, Info.Loc, Info.Rotation, UE4.ESpawnActorCollisionHandlingMethod.AdjustIfPossibleButAlwaysSpawn, nil)
    if IsValid(Unit) == false then
      DebugPrint("BP_EventMgr_C CreateAIUnit Failed Please Check BPPath", Info.UnitId, Info.ActorPath)
      GWorld.logger.error("\229\136\183\230\128\170\229\164\177\232\180\165!\232\175\183\230\163\128\230\159\165\232\147\157\229\155\190\232\183\175\229\190\132    UnitId:   " .. Info.UnitId .. "   UnitType:  " .. Info.UnitType)
      return
    end
    if Info.UnitType == "Npc" then
      local NeedReset = true ~= DataMgr.Npc[Info.UnitId].IgnoreFixLocation
      self:FixPawnLocation(Unit, Info, NeedReset)
    end
    if Info.SkillLevelSource then
      Unit:SetSkillLevelInfo(Info.SkillLevelSource:GetSkillLevelInfo())
    end
    if Info.SourceSkillId and Unit.SetSourceSkillId then
      Unit:SetSourceSkillId(Info.SourceSkillId)
    end
    Info.InitType = "First"
    self:AddInitializeMonsterQueue(Info)
    Unit:RegisterInfo(Info)
    if Info.UnitType ~= "Npc" then
      self:FixPawnLocation(Unit, Info, self:NeedApplySubsidenceAdjust(Unit))
    end
  end
  
  local UnitClass = MiscUtils.GetCacheClass(Info.ActorPath)
  if UnitClass then
    LoadClassFinished(self, UnitClass)
  elseif not self:UseAsyncCreate(Info.UnitType, Info.UnitId) or bForceSync then
    local BPClass = LoadClass(Info.ActorPath)
    LoadClassFinished(self, BPClass)
  else
    UE4.UResourceLibrary.LoadClassAsync(self, Info.ActorPath, {self, LoadClassFinished})
  end
end

function BP_EventMgr_C:RemoveUnitInQueue(WorldRegionEid, DestroyReason)
  self.LoadingClassMonsterQueue[WorldRegionEid] = nil
  if self.InitializeMonsterQueue[WorldRegionEid] then
    DebugPrint("Remove From InitializeMonsterQueue:", WorldRegionEid, DestroyReason)
    self.InitializeMonsterQueue[WorldRegionEid].DestroySelf = true
    self.InitializeMonsterQueue[WorldRegionEid].DestroySelfReason = DestroyReason
  end
end

function BP_EventMgr_C:CheckCreateAIUnit(Info)
  if Info.UnitType == "Monster" and not Info.SourceSkillId then
    return self:CheckCreateMonster(Info.UnitId)
  end
  return true
end

function BP_EventMgr_C:GetMaxDungeonMonNum()
  return Const.MaxDungeonMonNum
end

function BP_EventMgr_C:UseAsyncCreate(UnitType, UnitId)
  if "Monster" ~= UnitType then
    return true
  end
  if DataMgr.Monster[UnitId] and DataMgr.Monster[UnitId].DontApplyAsyncCreate == true then
    return false
  end
  return true
end

function BP_EventMgr_C:CreateActorUnit(Info, bForceSync)
  local TraceType = Info.FixTraceChannel or "TraceCreatureHit"
  Info.Loc = self:FixLocation(Info.Loc, Info.FixLocation, Info.FixLocationZ or 50, Info.FixLocationStartZ or 200, Info.FixLocationEndZ or -1500, Const.FixTraceChannel[TraceType])
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if Info.UnitType == "Drop" then
    local GameMode = UE.UGameplayStatics.GetGameMode(self)
    local ItemLevelId = GameMode:GetItemLevelId(Info.Loc)
    Info.ItemLevelId = ItemLevelId
    if GameState:HasPickupCache(Info.ActorPath) then
      local Rotation = Info.Rotation or FRotator(0, 0, 0)
      local Transform = UKismetMathLibrary.MakeTransform(Info.Loc, Rotation, UE4.FVector(1, 1, 1))
      local Unit = GameState:CreatePickUpUnitFromCache(Info.ActorPath, Transform)
      Unit:RegisterInfo(Info)
      return
    else
      DebugPrint("Crack", "New Drop Unit: ", Info.UnitId)
    end
  end
  local UnitType = Info.UnitType
  local DirectSource = Info.DirectSource
  local CreateUnitId = Info.CreateUnitId
  if "MechanismSummon" == UnitType and DirectSource and CreateUnitId and not self:PreCheckDirectSourceHadUnit(Info.DirectSource, Info.CreateUnitId) then
    DebugPrint("BP_EventMgr_C CreateActorUnit DirectSource", Info.DirectSource:GetName(), "don't have CreateUnitId", Info.CreateUnitId, "return")
    return
  end
  
  local function LoadClassFinished(self, UnitBlueprint)
    if "MechanismSummon" == UnitType and DirectSource and CreateUnitId and not self:PreCheckDirectSourceHadUnit(DirectSource, CreateUnitId) then
      DebugPrint("BP_EventMgr_C CreateActorUnit DirectSource", DirectSource:GetName(), "don't have CreateUnitId", CreateUnitId, "return")
      return
    end
    print(_G.LogTag, "LXZ LoadClassFinished00000")
    if IsValid(UnitBlueprint) == false then
      GWorld.logger.error("\229\136\183\230\156\186\229\133\179\229\164\177\232\180\165!UnitBlueprint\233\148\153\232\175\175 \232\175\183\230\163\128\230\159\165\232\147\157\229\155\190\232\183\175\229\190\132    UnitId:   " .. Info.UnitId .. "   UnitType:  " .. Info.UnitType .. "   ActorPath   " .. Info.ActorPath)
      return
    end
    local GameMode = UE.UGameplayStatics.GetGameMode(self)
    if not URuntimeCommonFunctionLibrary.UseCppRegionData(self) and GameMode and GameMode:IsInRegion() and Info.WorldRegionEid and Info.LevelName and GameMode:GetRegionDataMgrSubSystem().DataLibrary:GetRegionSSDataByKey(Info.LevelName, Info.WorldRegionEid) == nil then
      return
    end
    local Rotation = Info.Rotation or FRotator(0, 0, 0)
    local Transform = UE4.FTransform(Rotation:ToQuat(), Info.Loc)
    GameMode.RegionDataIniting = true
    local Unit = self:GetWorld():SpawnActor(UnitBlueprint, Transform, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
    if IsValid(Unit) == false then
      GWorld.logger.error("\229\136\183\230\156\186\229\133\179\229\164\177\232\180\165!\232\175\183\230\163\128\230\159\165\232\147\157\229\155\190\232\183\175\229\190\132    UnitId:   " .. Info.UnitId .. "   UnitType:  " .. Info.UnitType)
      return
    end
    if Info.SkillLevelSource and Unit.SetSkillLevelInfo then
      Unit:SetSkillLevelInfo(Info.SkillLevelSource:GetSkillLevelInfo())
    end
    if Info.SourceSkillId and Unit.SetSourceSkillId then
      Unit:SetSourceSkillId(Info.SourceSkillId)
    end
    print(_G.LogTag, "LXZ LoadClassFinished", Unit:GetName())
    if Unit.RegisterInfo then
      Unit:RegisterInfo(Info)
    else
      DebugPrint("CreateUnit: \229\136\155\229\187\186\228\186\134\228\184\128\228\184\170\230\178\161\230\156\137RegisterInfo\230\150\185\230\179\149\231\154\132Actor Name:", Unit:GetName())
    end
  end
  
  if not bForceSync then
    UE4.UResourceLibrary.LoadClassAsync(self, Info.ActorPath, {self, LoadClassFinished})
  else
    local BPClass = LoadClass(Info.ActorPath)
    LoadClassFinished(self, BPClass)
  end
end

function BP_EventMgr_C:FixPawnLocation(Pawn, Info, IsNeedReset)
  DebugPrint("BP_EventMgr_C:FixPawnLocation   ", Pawn:GetName(), Info.UnitId, Pawn.Eid, Info.Loc, Info.FixLocation, Info.FormationId, Info.FixNavLocation, IsNeedReset)
  local TraceType = Info.FixTraceChannel or "TraceCreatureHit"
  Info.Loc = self:FixLocation(Info.Loc, Info.FixLocation, Info.FixLocationZ or 50, Info.FixLocationStartZ or 200, Info.FixLocationEndZ or -1500, Const.FixTraceChannel[TraceType])
  Info.Loc = self:FixEliteLocation(Info.Loc, Info.FormationId or -1, Info.DirectSource)
  Info.Loc = self:FixNavLocation(Info.Loc, Info.FixNavLocation ~= nil)
  Pawn:K2_SetActorLocation(Info.Loc, false, nil, false)
  if false == IsNeedReset then
    return
  end
  URuntimeCommonFunctionLibrary.ResetCharacterBaseLocation(Pawn, Info.Loc)
end

function BP_EventMgr_C:GetDropRegionDataType(UnitId, TargetRegionDataType)
  local function CheckRarity()
    return DataMgr.Drop[UnitId].Rarity >= 3
  end
  
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar:IsInHardBoss() then
    return ERegionDataType.RDT_HardBossData
  end
  if TargetRegionDataType then
    if TargetRegionDataType == ERegionDataType.RDT_RarelyData then
      return ERegionDataType.RDT_RarelyData
    end
    if TargetRegionDataType == ERegionDataType.RDT_QuestData then
      return ERegionDataType.RDT_QuestData
    end
    if not CheckRarity() then
      return ERegionDataType.RDT_None
    end
    return TargetRegionDataType
  end
  return ERegionDataType.RDT_None
end

function BP_EventMgr_C:BuildDropInfo_Region(ItemId, Transform, Reason, ExtraInfo, bExtra, CreateIndex, DropRegionDatas)
  local Info = self:BuildDropInfo_Normal(ItemId, Transform, Reason, ExtraInfo, bExtra)
  if not DropRegionDatas or next(DropRegionDatas) == nil then
    local RegionDataType = self:GetDropRegionDataType(ItemId, ExtraInfo and ExtraInfo.RegionDataType or nil)
    Info.IntParams:Add("RegionDataType", RegionDataType)
    return Info
  end
  local RegionDatas = DropRegionDatas[ItemId]
  if not RegionDatas then
    local RegionDataType = self:GetDropRegionDataType(ItemId, ExtraInfo.RegionDataType)
    Info.IntParams:Add("RegionDataType", RegionDataType)
  else
    local RegionBaseData = RegionDatas[CreateIndex]
    if not RegionBaseData then
      local RegionDataType = self:GetDropRegionDataType(ItemId, ExtraInfo.RegionDataType)
      Info.IntParams:Add("RegionDataType", RegionDataType)
    else
      Info.NameParams:Add("WorldRegionEid", RegionBaseData.WorldRegionEid)
      Info.IntParams:Add("SubRegionId", RegionBaseData.SubRegionId)
      Info.IntParams:Add("RarelyId", RegionBaseData.RarelyId)
      Info.IntParams:Add("QuestChainId", RegionBaseData.QuestChainId)
      Info.IntParams:Add("RegionDataType", RegionBaseData.RegionDataType)
    end
  end
  return Info
end

function BP_EventMgr_C:BuildDropInfo_Normal(ItemId, Transform, Reason, ExtraInfo, bExtra, ActorPath)
  local Context = AEventMgr.CreateUnitContext()
  Context.UnitType = "Drop"
  Context.UnitId = ItemId
  Context.Loc = Transform.Translation
  Context.Rotation = Transform.Rotation:ToRotator()
  Context.StrParams:Add("ReasonType", Reason)
  Context.IntParams:Add("ParentEid", nil ~= ExtraInfo and ExtraInfo.ParentEid or nil)
  Context.BoolParams:Add("bExtra", bExtra)
  Context.BoolParams:Add("ActorPath", ActorPath)
  return Context
end

function BP_EventMgr_C:CheckSpawnDrop(ItemId, Count)
  local ActorPath
  local ItemInfo = DataMgr.Drop[ItemId]
  if not ItemInfo then
    return false, ActorPath, Count
  end
  local ActorPath = ItemInfo.UnitBPPath
  Count = math.min(ItemInfo.DropMaxNum or 0, Count)
  if not ActorPath then
    return false, ActorPath, Count
  end
  return true, ActorPath, Count
end

function BP_EventMgr_C:CreateTalkObject(Info)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    return
  end
  GameState:AddLoadingNpcId(Info.UnitId)
  
  local function LoadClassFinished(self, UnitBlueprint)
    local Rotation = Info.Rotation or FRotator(0, 0, 0)
    local Transform = UE4.FTransform(Rotation:ToQuat(), Info.Loc)
    local Unit = self:GetWorld():SpawnActor(UnitBlueprint, Transform, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
    if IsValid(Unit) == false then
      GWorld.logger.error("\229\136\155\229\187\186TalkObject\229\164\177\232\180\165!\232\175\183\230\163\128\230\159\165\232\147\157\229\155\190\232\183\175\229\190\132    UnitId:   " .. Info.UnitId .. "   UnitType:  " .. Info.UnitType)
      return
    end
    Unit:Init(Info)
    GameState:AddNpcInfo_Lua(Unit)
    GameState.NpcLoadingArray:Remove(Info.UnitId)
  end
  
  local Path = DataMgr.NPC[Info.UnitId].UnitBPPath
  UE4.UResourceLibrary.LoadClassAsync(self, Path, {self, LoadClassFinished})
end

function BP_EventMgr_C:RealSpawnDrop_Normal(ActorPath, Count, ItemId, Transform, Reason, ExtraInfo, bExtra)
  for j = 1, Count do
    local Info = self:BuildDropInfo_Normal(ItemId, Transform, Reason, ExtraInfo, bExtra, ActorPath)
    self:CreateUnitNew(Info, false)
  end
end

function BP_EventMgr_C:RealSpawnDrop_Region(ActorPath, Count, CreateIndex, ItemId, Transform, Reason, ExtraInfo, bExtra, DropRegionDatas)
  local function LoadClassFinished(self, UnitBlueprint)
    for j = 1, Count do
      CreateIndex = CreateIndex + 1
      
      local Info = self:BuildDropInfo_Region(ItemId, Transform, Reason, ExtraInfo, bExtra, CreateIndex, DropRegionDatas)
      self:ServerCreateDropNew(Info)
    end
  end
  
  UE4.UResourceLibrary.LoadClassAsync(self, ActorPath, {self, LoadClassFinished})
end

function BP_EventMgr_C:RealSpawnRewards_Normal(ItemId, Count, Transform, Reason, ExtraInfo, bExtra)
  local Res, ActorPath, UpdateCount = self:CheckSpawnDrop(ItemId, Count)
  if not Res then
    return
  end
  self:RealSpawnDrop_Normal(ActorPath, UpdateCount, ItemId, Transform, Reason, ExtraInfo, bExtra)
end

function BP_EventMgr_C:RealSpawnRewards_Region(ItemId, Count, Transform, Reason, ExtraInfo, bExtra, CreateIndex, DropRegionDatas)
  local Res, ActorPath, UpdateCount = self:CheckSpawnDrop(ItemId, Count)
  DebugPrint("ZJT_ CreateRes ", Res, ActorPath, UpdateCount)
  if not Res then
    return
  end
  self:RealSpawnDrop_Region(ActorPath, UpdateCount, CreateIndex, ItemId, Transform, Reason, ExtraInfo, bExtra, DropRegionDatas)
end

function BP_EventMgr_C:RandomPointInCircle(Source, MinRadius, MaxRadius, MinAngle, MaxAngle)
  local RandAngle = math.rad(math.random() * MaxAngle + MinAngle)
  local RandRadius = math.sqrt(math.rad(math.random() * (MaxRadius * MaxRadius - MinRadius * MinRadius) + MinRadius * MinRadius))
  local x = math.cos(RandAngle) * RandRadius
  local y = math.sin(RandAngle) * RandRadius
  local RandomLocationInRadius = Source + FVector(x, y, 0)
  return RandomLocationInRadius
end

function BP_EventMgr_C:AddInitializeMonsterQueue(Info)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode or not GameMode:IsInRegion() then
    return
  end
  if not Info or not Info.WorldRegionEid then
    if Info.UnitType == "Monster" then
      GWorld.logger.error("\229\156\168\229\140\186\229\159\159\229\134\133\231\154\132\230\128\170\231\137\169\230\178\161\230\156\137\229\136\157\229\167\139\229\140\150\230\149\176\230\141\174\230\136\150WorldRegionEid!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    end
    return
  end
  
  function Info.AfterInitializeCallback_EventMgr(Monster, WorldRegionEid)
    local MonInfo = self.InitializeMonsterQueue[WorldRegionEid]
    if MonInfo and MonInfo.DestroySelf and MonInfo.DestroySelfReason and Monster then
      DebugPrint("AfterInitializeCallback_EventMgr", Monster.Eid, WorldRegionEid, Monster.RegionDataType)
      Monster:EMActorDestroy(MonInfo.DestroySelfReason)
    end
    MonInfo.IsDestroied = true
    self.InitializeMonsterQueue[WorldRegionEid] = nil
  end
  
  self.InitializeMonsterQueue[Info.WorldRegionEid] = Info
end

function BP_EventMgr_C:GetConstParamCheckDungeonMonId()
  return Const.CheckDungeonMonId
end

function BP_EventMgr_C:GetConstPreFrameRealInitNum()
  return Const.PreFrameRealInitNum
end

function BP_EventMgr_C:GetAvatarGender(SwitchPlayer)
  local AvatarGender = -1
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return AvatarGender
  end
  if "Player" == SwitchPlayer then
    AvatarGender = Avatar.Sex
  elseif "EXPlayer" == SwitchPlayer then
    AvatarGender = Avatar.WeitaSex
  end
  return AvatarGender
end

function BP_EventMgr_C:GetRegionSerializeUnitType()
  return Const.RegionSerializeUnitType
end

function BP_EventMgr_C:GetCreateType()
  return Const.CreateType
end

function BP_EventMgr_C:GetFixTraceChannel()
  return Const.FixTraceChannel
end

function BP_EventMgr_C:FindPhantomAysncLoadingAndConsiderDestroy(RoleId, bWantToDestroy, DestroyReason)
  if not RoleId then
    return false
  end
  local FramingQueue = self.FramingCreateUintQueue.Phantom
  if FramingQueue then
    for Index, Info in ipairs(FramingQueue) do
      if Info.RoleId == RoleId then
        if bWantToDestroy then
          table.remove(FramingQueue, Index)
        end
        return true
      end
    end
  end
  for Key, Info in pairs(self.LoadingClassMonsterQueue) do
    if Info.RoleId == RoleId and "Phantom" == Info.UnitType then
      if bWantToDestroy then
        self.LoadingClassMonsterQueue[Key] = nil
      end
      return true
    end
  end
  for Key, Info in pairs(self.InitializeMonsterQueue) do
    if Info.RoleId == RoleId and "Phantom" == Info.UnitType then
      if bWantToDestroy then
        Info.DestroySelf = true
        Info.DestroySelfReason = DestroyReason
      end
      return true
    end
  end
  return false
end

function BP_EventMgr_C:CleanAllAsyncLoadingPhantom(DestroyReason)
  self.FramingCreateUintQueue.Phantom = {}
  for Key, Info in pairs(self.LoadingClassMonsterQueue) do
    if "Phantom" == Info.UnitType then
      self.LoadingClassMonsterQueue[Key] = nil
    end
  end
  for Key, Info in pairs(self.InitializeMonsterQueue) do
    if "Phantom" == Info.UnitType then
      Info.DestroySelf = true
      Info.DestroySelfReason = DestroyReason
    end
  end
end

function BP_EventMgr_C:GetConstMonDeathTaskNumPreFrame()
  return Const.MonDeathTaskNumPreFrame or 0
end

AssembleComponents(BP_EventMgr_C)
return BP_EventMgr_C
