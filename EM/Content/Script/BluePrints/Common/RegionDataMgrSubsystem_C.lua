require("Unlua")
require("Const")
local BattleUtils = require("Utils.BattleUtils")
local RegionDataMgrSubsystem_C = Class({
  "BluePrints.Common.RegionDataInitLogic",
  "BluePrints.Common.RegionDataGmLogic"
})

function RegionDataMgrSubsystem_C:Initialize_Lua()
  self.TestGMRegionDataType = Const.TestGMRegionType.NoneTest
  self.DataLibrary:RegionDataLibraryInit()
  self.DataPool:Initialize(self)
  self:InitDestroyReason()
end

function RegionDataMgrSubsystem_C:GetCurSubRegionId()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return 0
  end
  return Avatar.CurrentRegionId
end

function RegionDataMgrSubsystem_C:NotifyAvatarRegionAllReady()
end

function RegionDataMgrSubsystem_C:FillRegionData(Info)
  local Index = self:GetLuaDataIndex(Info.WorldRegionEid)
  self.DataPool:FillRegionData(Index, Info, self)
end

function RegionDataMgrSubsystem_C:InitRegionDataTable(LuaIndex, Info)
  self.DataPool:FillRegionDataNew(LuaIndex, Info)
end

function RegionDataMgrSubsystem_C:OnRegionDataAllocated_Lua(LuaTableIndex, WorldRegionEid)
  self.DataPool:InitRegionDataTable(LuaTableIndex, WorldRegionEid)
end

function RegionDataMgrSubsystem_C:MarkRegionDataDead(LuaTableIndex)
  return self.DataPool:MarkRegionDataDead(LuaTableIndex)
end

function RegionDataMgrSubsystem_C:RemoveQuestChainData(QuestChainId, DestroyReason)
  self.DataPool:RemoveQuestChainData(QuestChainId)
end

function RegionDataMgrSubsystem_C:RemoveDynamicQuestData(DynamicQuestId, DestroyReason)
  self.DataPool:RemoveDynamicQuestData(DynamicQuestId)
end

function RegionDataMgrSubsystem_C:RemoveSpecialQuestData(SpecialQuestId, DestroyReason)
  self.DataPool:RemoveSpecialQuestData(SpecialQuestId)
end

function RegionDataMgrSubsystem_C:GetStateIdByWorldRegionEid(LuaTableIndex)
  return self.DataPool:GetStateIdByWorldRegionEid(LuaTableIndex)
end

function RegionDataMgrSubsystem_C:SetActorRegionInfo(TargetActor, Info)
  local GameMode = UE4.UGameplayStatics.GetGameMode(TargetActor)
  if not GameMode then
    return
  end
  if not GameMode:IsInRegion() then
    return
  end
  if not TargetActor or not Info then
    return
  end
  TargetActor.QuestChainId = Info.QuestChainId
  TargetActor.ExtraRegionInfo.SpecialQuestId = Info.ExtraRegionInfo and Info.ExtraRegionInfo.SpecialQuestId or Info.SpecialQuestId
  TargetActor.ExtraRegionInfo.DynQuestId = Info.ExtraRegionInfo and Info.ExtraRegionInfo.DynQuestId or Info.DynQuestId
  if Info.Creator then
    TargetActor.RarelyId = Info.RarelyId or Info.Creator.RarelyId
    TargetActor:SetAttr("Level", Info.Creator:GetUnitLevel())
  else
    TargetActor.RarelyId = Info.RarelyId or 0
  end
end

function RegionDataMgrSubsystem_C:SetActorRegionInfo_SceneItemBase(TargetActor, Info)
  local Result, Avatar, GameMode = self:IsCanTriggerRegionDataHandle()
  if not Result then
    return
  end
  if not TargetActor or not Info then
    return
  end
  local CppInfo = FActorRegionInfo()
  if not URuntimeCommonFunctionLibrary.UseCppRegionData(self) then
    CppInfo.LevelName = Info.StrParams:Find("LevelName") or GameMode:GetActorLevelName(TargetActor)
    CppInfo.SubRegionId = Info.IntParams:Find("SubRegionId") or GameMode:GetRegionIdByLocation(TargetActor:k2_GetActorLocation())
    CppInfo.WorldRegionEid = Info.StrParams:Find("WorldRegionEid") or URuntimeCommonFunctionLibrary.GenerateGUID()
    CppInfo.RegionDataType = Info.IntParams:Find("RegionDataType")
  end
  CppInfo.QuestChainId = Info.IntParams:Find("QuestChainId")
  CppInfo.ExtraRegionInfo.SpecialQuestId = Info.ExtraRegionInfo and Info.ExtraRegionInfo.SpecialQuestId or Info.IntParams:Find("SpecialQuestId")
  CppInfo.ExtraRegionInfo.DynQuestId = Info.ExtraRegionInfo and Info.ExtraRegionInfo.DynQuestId or Info.IntParams:Find("DynQuestId")
  if IsValid(Info.Creator) then
    CppInfo.RarelyId = Info.IntParams:Find("RarelyId") or Info.Creator.RarelyId
  else
    CppInfo.RarelyId = Info.IntParams:Find("RarelyId") or 0
  end
  URegionDataMgrSubsystem.SetActorRegionInfo_SceneItemBase(TargetActor, CppInfo)
end

function RegionDataMgrSubsystem_C:SetActorRegionCommonInfo(TargetActor, Info)
  TargetActor.BornPos = Info.VectorParams:Find("BornPos") or Info.Loc
  TargetActor.BornRot = Info.RotatorParams:Find("BornRot") or Info.Rotation
  if Info.Creator then
    local GameMode = UE4.UGameplayStatics.GetGameMode(TargetActor)
    local Creator = Info.Creator
    TargetActor.CreatorId = Info.IntParams:Find("CreatorId") or Creator.StaticCreatorId
    TargetActor.RandomCreatorId = Info.IntParams:Find("RandomCreatorId") or 0
    TargetActor.RandomRuleId = Info.IntParams:Find("RandomRuleId") or 0
    TargetActor.RandomTableId = Info.IntParams:Find("RandomTableId") or 0
    TargetActor.RandomIdxInRule = Info.IntParams:Find("RandomIdxInRule") or GameMode.RandomActorManager:GetCreatorRegionDataIdxInRule(Info.RandomRuleId, Info.RandomCreatorId)
  else
    TargetActor.CreatorId = Info.IntParams:Find("CreatorId") or 0
    TargetActor.RandomCreatorId = Info.IntParams:Find("RandomCreatorId") or 0
    TargetActor.RandomRuleId = Info.IntParams:Find("RandomRuleId") or 0
    TargetActor.RandomTableId = Info.IntParams:Find("RandomTableId") or 0
    TargetActor.RandomIdxInRule = Info.IntParams:Find("RandomIdxInRule") or 0
  end
end

function RegionDataMgrSubsystem_C:SetActorRegionCommonInfo_SceneItemBase(TargetActor, Info)
  local CppInfo = FActorRegionCommonInfo()
  CppInfo.BornPos = Info.VectorParams:Find("BornPos") or Info.Loc
  CppInfo.BornRot = Info.RotatorParams:Find("BornRot") or Info.Rotation
  if IsValid(Info.Creator) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(TargetActor)
    local Creator = Info.Creator
    CppInfo.CreatorId = Info.IntParams:Find("CreatorId") or Creator.StaticCreatorId
    CppInfo.RandomCreatorId = Info.IntParams:Find("RandomCreatorId") or 0
    CppInfo.RandomRuleId = Info.IntParams:Find("RandomRuleId") or 0
    CppInfo.RandomTableId = Info.IntParams:Find("RandomTableId") or 0
    CppInfo.RandomIdxInRule = Info.IntParams:Find("RandomIdxInRule") or GameMode.RandomActorManager:GetCreatorRegionDataIdxInRule(Info.RandomRuleId, Info.RandomCreatorId)
  else
    CppInfo.CreatorId = Info.CreatorId or 0
    CppInfo.RandomCreatorId = Info.RandomCreatorId or 0
    CppInfo.RandomRuleId = Info.RandomRuleId or 0
    CppInfo.RandomTableId = Info.RandomTableId or 0
    CppInfo.RandomIdxInRule = Info.RandomIdxInRule or 0
  end
  URegionDataMgrSubsystem.SetActorRegionCommonInfo_SceneItemBase(TargetActor, CppInfo)
end

function RegionDataMgrSubsystem_C:GetUnitRegionCacheDataByActor(TargetActor)
  local RegionDataType = TargetActor.RegionDataType
  local Avatar = GWorld:GetAvatar()
  local TypeRegionDatas = self.DataLibrary:GetRegionCacheDatasByIdType(RegionDataType)
  local UnitRegionData = self.DataLibrary:GetUnitRegionCacheData(TypeRegionDatas, TargetActor.SubRegionId, TargetActor.LevelName, TargetActor.WorldRegionEid)
  if not UnitRegionData then
    GWorld.logger.error("\229\156\168RegionDatas[Type:" .. tostring(RegionDataType) .. "]\228\184\173\230\137\190\228\184\141\229\136\176" .. tostring(UE4.UKismetSystemLibrary.GetDisplayName(TargetActor)) .. "\231\154\132\230\149\176\230\141\174")
  end
  return UnitRegionData
end

function RegionDataMgrSubsystem_C:UpdateUnitRegionCacheDataByActor(TargetActor)
  return self.DataLibrary:UpdateUnitRegionCacheData(TargetActor)
end

function RegionDataMgrSubsystem_C:PreActorCreated(Info)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    DebugPrint("Pre Actor Created Avatar is nil !!")
    PrintTable(Info)
    return
  end
  Avatar:GetWorldRegionEid(Info)
  local GameMode = UGameplayStatics.GetGameMode(self)
  Info.Eid = Info.Eid or GameMode:GetBattleEid()
  DebugPrint("PreActorCreated:", Info.WorldRegionEid, Info.Eid)
  local Creator = Info.Creator
  if (not Info.RandomCreatorId or 0 == Info.RandomCreatorId) and not Creator and Info.CreatorId then
    local GameState = UGameplayStatics.GetGameState(self)
    Creator = GameState.StaticCreatorMap:FindRef(Info.CreatorId)
  end
  if Creator and (not Info.RandomCreatorId or 0 == Info.RandomCreatorId) then
    if not self:SSDataAlreadyExist(Info.LevelName or GameMode:GetActorLevelName(Info.Creator), Info.WorldRegionEid) then
      self:RegionAddDataByStaticCreator(Info.LevelName or GameMode:GetActorLevelName(Creator), Creator, Info.Eid, Info.WorldRegionEid)
    end
    self:MarkSSDataCreating(Info.LevelName or GameMode:GetActorLevelName(Creator), Info.WorldRegionEid)
  end
  if Info.RandomCreatorId and 0 ~= Info.RandomCreatorId then
    local GameMode = UGameplayStatics.GetGameMode(self)
    local Param, CreatorInfo, WCLevelName = GameMode:CreateSnapShotDataByRandomCreator(Info.RandomRuleId, Info.RandomCreatorId)
    if not self:SSDataAlreadyExist(Info.LevelName or WCLevelName, Info.WorldRegionEid) then
      self:RegionAddDataByRandomCreator(Info.LevelName or WCLevelName, Info.RandomRuleId, Param, Info.Eid, CreatorInfo.SpawnRandomTableId, CreatorInfo.SpawnIdxInRule, Info.WorldRegionEid)
    end
    self:MarkSSDataCreating(Info.LevelName or WCLevelName, Info.WorldRegionEid)
  end
end

function RegionDataMgrSubsystem_C:PostActorCreated(Actor)
  local GameMode = UGameplayStatics.GetGameMode(self)
  local WCSubsystem = GameMode:GetWCSubSystem()
  local SSDatasExist = self.DataLibrary:RemoveRegionSSDatas(GameMode:GetActorLevelName(Actor), Actor.WorldRegionEid)
  if not SSDatasExist and not Actor.BpBorn and (not Actor.UnitType or not Actor.UnitType == "Drop") then
    GWorld.logger.error("ERROR @fanyuxiao \231\148\159\230\136\144\228\186\134\228\184\128\228\184\170SSData\233\135\140\233\157\162\230\178\161\230\156\137\231\154\132Actor" .. Actor:GetName() .. "_" .. Actor.UnitId .. "_" .. Actor.WorldRegionEid)
    self.DataLibrary:RemoveRegionSSDatas(GameMode:GetActorLevelName(Actor), Actor.WorldRegionEid)
  end
end

function RegionDataMgrSubsystem_C:OnActorCreationInterrupted(Info)
end

function RegionDataMgrSubsystem_C:AddRegionDataByActor(TargetActor, Info, AddRegionDataType, ActorPath)
  local Creator = Info.Creator
  local Result, Avatar, GameMode = self:IsCanTriggerRegionDataHandle()
  if not Result then
    return
  end
  local WorldLoader = GameMode:GetLevelLoader()
  if not WorldLoader or not WorldLoader.IsWorldLoader then
    return
  end
  if Creator then
  else
  end
  if AddRegionDataType == CommonConst.AddRegionDataType.Random then
  end
  self:RegionAddDataByUnit(TargetActor)
end

function RegionDataMgrSubsystem_C:DeadRegionActorData(TargetActor, DestroyReason)
  local Result, Avatar, GameMode = self:IsCanTriggerRegionDataHandle()
  if not Result then
    return
  end
  Avatar:RegionActorDead(TargetActor, DestroyReason, TargetActor.SubRegionId, TargetActor.LevelName)
end

function RegionDataMgrSubsystem_C:OnActorDead_Lua(LuaTableIndex)
  self.DataPool:RemoveData(LuaTableIndex)
end

function RegionDataMgrSubsystem_C:RegionActorCacheDataDeadByCreatorId(CreatorId)
  local Result, Avatar, GameMode = self:IsCanTriggerRegionDataHandle()
  if not Result then
    return nil
  end
  local BaseRegionDatas = self.DataLibrary:RegionActorCacheDataDeadByCreatorId(CreatorId)
  return BaseRegionDatas
end

function RegionDataMgrSubsystem_C:RegionActorCacheDataDeadByUnitLabel(UnitId, UnitType)
  local Result, Avatar, GameMode = self:IsCanTriggerRegionDataHandle()
  if not Result then
    return nil
  end
  local BaseRegionDatas = self.DataLibrary:RegionActorCacheDataDeadByUnitLabel(UnitId, UnitType)
  return BaseRegionDatas
end

function RegionDataMgrSubsystem_C:UpdateRegionActorData(TargetActor, RegionData)
  local Result, Avatar, GameMode = self:IsCanTriggerRegionDataHandle()
  if not Result then
    return
  end
  if TargetActor.RandomRuleId and self.DataPool.RandomCreatorDatas[TargetActor.RandomRuleId] then
    return
  end
  local bNeedUpdateServer = true
  local LuaTableIndex = TargetActor.RegionDataTableIndex or self:GetLuaDataIndex(TargetActor.WorldRegionEid)
  bNeedUpdateServer = self:UpdateStateInfoByTable(LuaTableIndex, RegionData)
  if bNeedUpdateServer then
    Avatar:RegionActorUpdate(TargetActor, TargetActor.SubRegionId, TargetActor.LevelName, RegionData)
  end
end

function RegionDataMgrSubsystem_C:RecoverRegionActorDataStateValue(WorldRegionEid)
  local ClientCacheState = self.DataLibrary:GetStateValue(WorldRegionEid)
  local LuaTableIndex = self:GetLuaDataIndex(WorldRegionEid)
  if ClientCacheState then
    self:UpdateStateInfoByTable(LuaTableIndex, ClientCacheState)
  else
    self.DataPool:ClearState(LuaTableIndex)
  end
end

function RegionDataMgrSubsystem_C:UpdatePetRegionActorData(TargetActor, PetState)
  local Result, Avatar, GameMode = self:IsCanTriggerRegionDataHandle()
  if not Result then
    return
  end
  local WorldLoader = GameMode:GetLevelLoader()
  if not WorldLoader or not WorldLoader.IsWorldLoader then
    return
  end
  local NewLevelName = GameMode:GetActorLevelName(TargetActor)
  local NewSubRegionId = WorldLoader:GetRegionIdByLocation(TargetActor:K2_GetActorLocation())
end

function RegionDataMgrSubsystem_C:UpdateRegionDataStateCacheByCreatorId(CreatorId, RegionData)
  local Result, Avatar, GameMode = self:IsCanTriggerRegionDataHandle()
  if not Result then
    return nil
  end
  local BaseRegionDatas = self.DataLibrary:UpdateRegionDataStateCacheByCreatorId(CreatorId, RegionData)
  return BaseRegionDatas
end

function RegionDataMgrSubsystem_C:IsCanTriggerRegionDataHandle()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local Avatar = GWorld:GetAvatar()
  return Avatar and GameMode:IsInRegion(), Avatar, GameMode
end

function RegionDataMgrSubsystem_C:ResetRarelyStaticCreator(StaticCreatorId, PrivateEnable, EventName)
  local Result, Avatar, GameMode = self:IsCanTriggerRegionDataHandle()
  if not Result then
    return
  end
  local WorldRegionEids = {}
  if not self:IsCretorIdControlByCacheNew(StaticCreatorId) then
    GWorld.logger.error("\233\135\141\229\136\183\233\157\153\230\128\129\231\130\185\233\148\153\232\175\175\239\188\140\233\157\153\230\128\129\231\130\185\230\156\170\230\191\128\230\180\187! StaticCreatorId:" .. StaticCreatorId)
    return
  end
  WorldRegionEids = self:GetControlWorldRegionEidByCreatorId(StaticCreatorId):ToTable()
  for WorldRegionEid, _ in pairs(WorldRegionEids) do
    local CacheData = self.DataLibrary:GetUnitRegionCacheDataByWorldRegionEid(WorldRegionEid)
    if CacheData and CacheData.RarelyId and CacheData.RarelyId > 0 and CacheData.RegionDataType == ERegionDataType.RDT_RarelyData then
      self.DataLibrary:RemoveRegionSSDatas(CacheData.LevelName, WorldRegionEid)
      self.DataLibrary:RemoveUnitRegionCacheData(WorldRegionEid)
    elseif not CacheData then
      GWorld.logger.error("\233\135\141\229\136\183\233\157\153\230\128\129\231\130\185\233\148\153\232\175\175\239\188\140\233\157\153\230\128\129\231\130\185\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168 StaticCreatorId:" .. StaticCreatorId .. " WorldRegionEid:" .. WorldRegionEid)
    elseif not CacheData.RarelyId or CacheData.RarelyId <= 0 then
      GWorld.logger.error("\233\135\141\229\136\183\233\157\153\230\128\129\231\130\185\233\148\153\232\175\175\239\188\140\233\157\153\230\128\129\231\130\185\230\149\176\230\141\174RarelyId\233\148\153\232\175\175 StaticCreatorId:" .. StaticCreatorId, " WorldRegionEid:" .. WorldRegionEid)
    elseif CacheData.RegionDataType ~= ERegionDataType.RDT_RarelyData then
      GWorld.logger.error("\233\135\141\229\136\183\233\157\153\230\128\129\231\130\185\233\148\153\232\175\175\239\188\140\233\157\153\230\128\129\231\130\185\230\149\176\230\141\174RegionDataType\233\148\153\232\175\175 StaticCreatorId:" .. StaticCreatorId, " WorldRegionEid:" .. WorldRegionEid, " RegionDataType:" .. CacheData.RegionDataType)
    end
  end
  self:RemoveCretorIdContollerByCacheNew(StaticCreatorId)
  Avatar:ResetRarelyStaticCreator(StaticCreatorId, self.ActiveStaticCreatorAfterReset, StaticCreatorId, PrivateEnable, EventName)
end

function RegionDataMgrSubsystem_C:ResetRarelyStaticCreatorClient(WorldRegionEid)
  if "None" == WorldRegionEid then
    return
  end
  local CacheData = self.DataLibrary.WorldEid2RegionCacheData[WorldRegionEid]
  if CacheData and CacheData.RarelyId and CacheData.RarelyId > 0 and CacheData.RegionDataType == ERegionDataType.RDT_RarelyData then
    self.DataLibrary:RemoveRegionSSDatas(CacheData.LevelName, WorldRegionEid)
    self.DataLibrary:RemoveUnitRegionCacheData(WorldRegionEid)
  end
end

function RegionDataMgrSubsystem_C:ActiveStaticCreatorAfterReset(StaticCreatorId, PrivateEnable, EventName)
  local Ids = TArray(0)
  Ids:Add(StaticCreatorId)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  GameMode:TriggerActiveStaticCreator(Ids, EventName, PrivateEnable)
end

function RegionDataMgrSubsystem_C:GetQuestChainData(QuestChainId)
  local Table = self.DataPool.QuestChainId2Data[QuestChainId]
  if not Table then
    return {}
  end
  local CopyTable = CommonUtils.DeepCopy(Table)
  for _, RegionData in ipairs(CopyTable) do
    RegionData.Creator = nil
    for Key, Value in pairs(RegionData) do
      if type(Value) == "userdata" then
        RegionData[Key] = nil
      end
    end
  end
  return CopyTable
end

function RegionDataMgrSubsystem_C:DeleteQuestChainDataNotInClientCache(QuestChainId)
  local Table = self.DataPool.QuestChainId2Data[QuestChainId]
  if not Table then
    return
  end
  for _, RegionData in ipairs(Table) do
    if not self:ClientCacheExist(RegionData.WorldRegionEid) then
      self:DestroyRegionEntity(RegionData.WorldRegionEid, EDestroyReason.QuestChainClear)
    end
  end
end

function RegionDataMgrSubsystem_C:DeleteExceptQuestChainDataNotInClientCache(QuestChainId)
  for ChainId, Table in pairs(self.DataPool.QuestChainId2Data) do
    if Table and ChainId ~= QuestChainId then
      for _, RegionData in ipairs(Table) do
        if not self:ClientCacheExist(RegionData.WorldRegionEid) then
          self:DestroyRegionEntity(RegionData.WorldRegionEid, EDestroyReason.QuestChainClear)
        end
      end
    end
  end
end

function RegionDataMgrSubsystem_C:AddCretorActiveCache(UnitData)
  if UnitData.CreatorId and (not UnitData.RandomCreatorId or 0 == UnitData.RandomCreatorId) then
    DebugPrint("RegionDataMgr: AddCretorActiveCache \230\150\176\231\154\132\230\142\165\229\143\163\230\129\162\229\164\141\233\157\153\230\128\129\231\130\185controlcache ", UnitData.CreatorId, UnitData.RandomCreatorId)
    self:AddStaticCreatorId(UnitData.CreatorId, UnitData.WorldRegionEid, UnitData.SubRegionId)
  elseif UnitData.RandomCreatorId and 0 ~= UnitData.RandomCreatorId then
    DebugPrint("RegionDataMgr: AddCretorActiveCache \230\150\176\231\154\132\230\142\165\229\143\163\230\129\162\229\164\141\233\154\143\230\156\186\231\130\185controlcache ", UnitData.CreatorId, UnitData.RandomCreatorId)
    self:AddRandomStaticCreatorId(UnitData.RandomRuleId, UnitData.RandomCreatorId, UnitData.WorldRegionEid, UnitData.SubRegionId)
  end
end

function RegionDataMgrSubsystem_C:AddStaticCreatorId(CreatorId, WorldRegionEid, SubRegionId)
  if not CreatorId or not WorldRegionEid then
    return
  end
  if self:IsControlCreatorIdByWorldRegionEid(CreatorId, WorldRegionEid) then
    return
  end
  if not self.StaticIdControlCache[CreatorId] then
    self.StaticIdControlCache[CreatorId] = {}
  end
  self.StaticIdControlCache[CreatorId][WorldRegionEid] = SubRegionId
end

function RegionDataMgrSubsystem_C:RemoveCretorIdContollerByCache(CreatorId)
  if not self.StaticIdControlCache[CreatorId] then
    return false
  end
  self.StaticIdControlCache[CreatorId] = nil
  return true
end

function RegionDataMgrSubsystem_C:IsCretorIdControlByCache(CreatorId)
  return self.StaticIdControlCache[CreatorId] ~= nil
end

function RegionDataMgrSubsystem_C:IsControlCreatorIdByWorldRegionEid(CreatorId, WorldRegionEid)
  return self.StaticIdControlCache[CreatorId] and self.StaticIdControlCache[CreatorId][WorldRegionEid]
end

function RegionDataMgrSubsystem_C:AddRandomStaticCreatorId(RandomRuleId, RandomCreatorId, WorldRegionEid, SubRegionId)
  if not (RandomRuleId and RandomCreatorId) or not WorldRegionEid then
    return
  end
  if self:IsRandomIdControlByCache(RandomRuleId, RandomCreatorId) and self:IsControlRandomIdByWorldRegionEid(RandomRuleId, RandomCreatorId, WorldRegionEid) then
    return
  end
  if not self.RandomIdControlCache[RandomRuleId] then
    self.RandomIdControlCache[RandomRuleId] = {}
  end
  if not self.RandomIdControlCache[RandomRuleId][RandomCreatorId] then
    self.RandomIdControlCache[RandomRuleId][RandomCreatorId] = {}
  end
  self.RandomIdControlCache[RandomRuleId][RandomCreatorId][WorldRegionEid] = SubRegionId
end

function RegionDataMgrSubsystem_C:UploadRandomCreatorData(RandomRuleId)
  self.DataPool:UploadRandomCreatorData(RandomRuleId)
end

function RegionDataMgrSubsystem_C:IsRandomIdControlByCache(RandomRuleId, RandomCreatorId)
  if not RandomRuleId or not RandomCreatorId then
    return false
  end
  if not self.RandomIdControlCache[RandomRuleId] then
    return false
  end
  return true
end

function RegionDataMgrSubsystem_C:IsControlRandomIdByWorldRegionEid(RandomRuleId, RandomCreatorId, WorldRegionEid)
  if self.RandomIdControlCache[RandomRuleId] and self.RandomIdControlCache[RandomRuleId][RandomCreatorId] and self.RandomIdControlCache[RandomRuleId][RandomCreatorId][WorldRegionEid] then
    return true
  end
  return false
end

function RegionDataMgrSubsystem_C:ClearDeliverData()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode then
    self:TryActiveDefaultDeliver()
  end
  self.CurRegionDeliverDatas = {}
  self.CurRegionDeliver = {}
  self.CurRegionDeliverNew:Clear()
  self.CurRegionDeliverDatasNew:Clear()
end

function RegionDataMgrSubsystem_C:IsCurrentRegionDeliver(CreatorId)
  if not self.CurRegionDeliverDatas then
    return false
  end
  return self.CurRegionDeliverDatas[CreatorId] ~= nil
end

function RegionDataMgrSubsystem_C:RegisterRegionDeliverMechanism(WorldRegionEid, CreatorId)
  if not self:IsCurrentRegionDeliver(CreatorId) then
    return
  end
  self.CurRegionDeliver[WorldRegionEid] = CreatorId
end

function RegionDataMgrSubsystem_C:ClientCacheExist(WorldRegionEid)
  return self.DataLibrary.WorldEid2RegionCacheData[WorldRegionEid] ~= nil
end

function RegionDataMgrSubsystem_C:TryActiveDefaultDeliver()
  local Deliver = {}
  if 0 == self.CurRegionDeliverNew:Num() then
    return
  end
  Deliver = self.CurRegionDeliverNew:ToTable()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Res, Data
  for WorldRegionEid, CreatorId in pairs(Deliver) do
    local RegionBaseData = self.DataLibrary:GetUnitRegionCacheDataByWorldRegionEid(WorldRegionEid)
    if RegionBaseData then
      if RegionBaseData.State and RegionBaseData.State.OpenState then
        Res = true
        break
      end
      if self:CheckDeliverMechanismIsDefault(CreatorId) then
        Data = RegionBaseData
        break
      end
    end
  end
  if not Res and Data then
    local function callback(Ret)
      self.logger.debug("\232\167\163\233\148\129\233\187\152\232\174\164\228\188\160\233\128\129\231\130\185", Ret, Data.WorldRegionEid)
    end
    
    Avatar:UpdateRegionDataStateByCreatorId(Data.CreatorId, {OpenState = true, StateId = 901002})
  end
end

function RegionDataMgrSubsystem_C:GetManualItemData(ManualItemId)
  return self.DataLibrary.ManualItemIdMap[ManualItemId]
end

function RegionDataMgrSubsystem_C:UpdateStateInfo(LuaTableIndex, DataName, DataValue)
  self.DataPool:UpdateState(LuaTableIndex, DataName, DataValue)
end

function RegionDataMgrSubsystem_C:UpdateState(LuaTableIndex, StateId)
  self:UpdateStateInfo(LuaTableIndex, "StateId", StateId)
end

function RegionDataMgrSubsystem_C:UpdateStateInfoByTable(LuaTableIndex, NewState)
  return self.DataPool:UpdateStateByTable(LuaTableIndex, NewState)
end

function RegionDataMgrSubsystem_C:RegionAddDataByStaticCreator(LevelName, Creator, TempEid, WorldRegionEid)
  if URuntimeCommonFunctionLibrary.UseCppRegionData(self) then
    return
  end
  DebugPrint("RegionDataMgr: RegionAddDataByStaticCreator", LevelName, Creator, TempEid, Creator.StaticCreatorId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local UnitRegionData = self.DataLibrary:ConstructUnitRegionDataByCreatorData(TempEid, LevelName, Creator, WorldRegionEid)
  self.DataLibrary:AddRegionSSDatas(UnitRegionData)
  if self:CheckUnitDataNeedStorage(UnitRegionData) then
    self:AddCretorActiveCache(UnitRegionData)
    self.DataLibrary:AddUnitRegionCacheData(UnitRegionData)
    Avatar:AvatarC2SAddRegionActorData(UnitRegionData)
  end
end

function RegionDataMgrSubsystem_C:RegionAddDataByRandomCreator(LevelName, RuleId, Param, TmpEid, SpawnRandomTableId, SpawnIdxInRule, WorldRegionEid)
  if URuntimeCommonFunctionLibrary.UseCppRegionData(self) then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if type(WorldRegionEid) == "number" then
    WorldRegionEid = nil
  end
  local UnitRegionData = self.DataLibrary:ConstructUnitRegionDataByRandomData(LevelName, RuleId, Param, TmpEid, SpawnRandomTableId, SpawnIdxInRule, WorldRegionEid)
  self.DataLibrary:AddRegionSSDatas(UnitRegionData)
  if self:CheckUnitDataNeedStorage(UnitRegionData) then
    self:AddCretorActiveCache(UnitRegionData)
    self.DataLibrary:AddUnitRegionCacheData(UnitRegionData)
    Avatar:AvatarC2SAddRegionActorData(UnitRegionData)
  end
end

function RegionDataMgrSubsystem_C:RegionAddDataByUnit(TargetActor)
  if URuntimeCommonFunctionLibrary.UseCppRegionData(self) then
    return
  end
  DebugPrint("RegionDataMgr: RegionAddDataByUnit RegionDataType: " .. tostring(TargetActor.RegionDataType) .. "  WorldRegionEid: " .. TargetActor.WorldRegionEid)
  self:PostActorCreated(TargetActor)
  if TargetActor.RegionDataType == ERegionDataType.RDT_QuestData then
    return
  end
  if not TargetActor:CheckUnitNeedStorage() then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local UnitRegionData = self.DataLibrary:ConstructUnitRegionDataByUnit(TargetActor)
  self.DataLibrary:AddUnitRegionCacheData(UnitRegionData)
  self:AddCretorActiveCache(UnitRegionData)
  Avatar:AvatarC2SAddRegionActorData(UnitRegionData)
end

function RegionDataMgrSubsystem_C:MarkSSDataCreating(LevelName, WorldRegionEid)
  local SSData = self.DataLibrary:GetLevelRegionSSDatas(LevelName)
  if not SSData then
    return
  end
  local RegionBaseData = SSData[WorldRegionEid]
  if RegionBaseData then
    RegionBaseData.bIsCreating = true
  end
end

function RegionDataMgrSubsystem_C:SSDataAlreadyExist(LevelName, WorldRegionEid)
  local SSData = self.DataLibrary:GetLevelRegionSSDatas(LevelName)
  if not SSData then
    return false
  end
  local RegionBaseData = SSData[WorldRegionEid]
  if not RegionBaseData then
    return false
  end
  return true
end

function RegionDataMgrSubsystem_C:RecoverRegionDataByIndex(LuaTableIndex)
  local Info = self.DataPool:GetRegionEntityDataNoCopy(LuaTableIndex)
  if not Info.UnitId or not Info.UnitType then
    return
  end
  if not self.DataLibrary:CheckCanCreateWhileSpecialQuest(Info) then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local Context = AEventMgr.CreateUnitContext()
  self:FillCreateUnitContext(Context, Info)
  if Info.Type then
    if 1 == Info.Type then
      self:FillStaticCreatorCreateUnitContext(Context, Info)
    elseif 2 == Info.Type then
      self:FillRandomCreatorCreateUnitContext(Context, Info)
    elseif 3 == Info.Type then
      self:FillCommonCreateUnitContext(Context, Info)
    end
  else
    self:ShowRegionError([[
RecoverRegionDataByIndex Type Nil !
UnitId:]] .. Info.UnitId .. [[
 
UnitType:]] .. Info.UnitTYpe .. "WorldRegionEid:" .. Info.WorldRegionEid, Info)
  end
  GameMode.EMGameState.EventMgr:CreateUnitNew(Context, false)
end

function RegionDataMgrSubsystem_C:FillCreateUnitContext(Context, Info)
  Context.UnitId = Info.UnitId
  Context.UnitType = Info.UnitType
  Context.Loc = FVector(Info.Loc.X, Info.Loc.Y, Info.Loc.Z)
  Context.BornPos = Context.Loc
  Context.Rotation = Info.Rotation
  Context.Creator = Info.Creator
  if Info.WorldRegionEid then
    Context.NameParams:Add("WorldRegionEid", Info.WorldRegionEid)
  end
  if Info.SubRegionId then
    Context.IntParams:Add("SubRegionId", Info.SubRegionId)
  end
  if Info.LevelName then
    Context.StrParams:Add("LevelName", Info.LevelName)
  end
  if Info.RegionDataType then
    Context.IntParams:Add("RegionDataType", Info.RegionDataType)
  end
  if Info.BornLocation then
    Context.VectorParams:Add("BornLocation", Info.BornLocation)
  end
  if Info.State then
    Context:AddLuaTable("State", Info.State)
  end
  if Info.RarelyId then
    Context.IntParams:Add("RarelyId", Info.RarelyId)
  end
  if Info.IsUnlimited then
    Context.BoolParams:Add("IsFullRegionStore", Info.IsUnlimited)
  end
  if Info.QuestChainId then
    Context.IntParams:Add("QuestChainId", Info.QuestChainId)
  end
  if Info.QuestId then
    Context.IntParams:Add("QuestId", Info.QuestId)
  end
  if Info.IsBonus then
    Context.BoolParams:Add("IsBonus", Info.IsBonus)
  end
  if Info.IsDead then
    Context.BoolParams:Add("IsDead", Info.IsDead)
  end
end

function RegionDataMgrSubsystem_C:FillStaticCreatorCreateUnitContext(Context, Info)
  if Info.CreatorId then
    Context.IntParams:Add("CreatorId", Info.CreatorId)
  end
  if Info.Creator then
    Info.Creator:FillCreateUnitContext(Context, nil)
  else
    self:ShowRegionError([[
RecoverRegionDataByIndex For Creator But Creator Is Nil!!!
CreatorId: ]] .. Info.CreatorId, Info)
  end
end

function RegionDataMgrSubsystem_C:FillRandomCreatorCreateUnitContext(Context, Info)
  if Info.RandomTableId then
    Context.IntParams:Add("RandomTableId", Info.RandomTableId)
  end
  if Info.RandomIdxInRule then
    Context.IntParams:Add("RandomIdxInRule", Info.RandomIdxInRule)
  end
  if Info.RandomCreatorId then
    Context.IntParams:Add("RandomCreatorId", Info.RandomCreatorId)
  end
  if Info.RandomRuleId then
    Context.IntParams:Add("RandomRuleId", Info.RandomRuleId)
  end
  if Info.RandomRuleId and Info.RandomTableId then
    local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    local RandomCreator = GameMode.RandomActorManager:GetCreator(Info.RandomRuleId, Info.LevelName, Info.RandomIdxInRule)
    if RandomCreator then
      RandomCreator:FillRandomCreateUnitContext(Context, nil)
    else
      self:ShowRegionError(string.format([[
RecoverRegionDataByIndex For RandomCreator But RandomCreator Is Nil!!! 
RandomRuleId:%d 
RandomTableId:%d 
LevelName:%s 
RandomIdxInRule:%d]], Info.RandomRuleId, Info.RandomTableId, Info.LevelName, Info.RandomIdxInRule), Info)
    end
  end
end

function RegionDataMgrSubsystem_C:FillCommonCreateUnitContext(Context, Info)
  if Info.ManualItemId then
    Context.IntParams:Add("ManualItemId", Info.ManualItemId)
  end
end

function RegionDataMgrSubsystem_C:OnWorldCompositionLevelLoaded_Lua(ProxyInfo)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if Avatar:IsInHardBoss() then
    return
  end
  DebugPrint("RegionDataMgr: OnWorldCompositionLevelLoaded_Lua", ProxyInfo.LevelId)
  if URuntimeCommonFunctionLibrary.UseCppRegionData(self) then
    local LevelName = ProxyInfo.LevelId
    local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    local WorldLoader = GameMode:GetLevelLoader()
    local ParentLevelIds = ProxyInfo:GetAllParentLevelIds()
    for i, ParentLevelId in pairs(ParentLevelIds) do
      local SubRegionId = WorldLoader:GetRegionIdByLevelId(ParentLevelId)
      self:TryGameModeFailEvent(SubRegionId, LevelName)
    end
  else
    local LevelName = ProxyInfo.LevelId
    local ParentLevelId = ProxyInfo.ParentLevelId
    local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    local WorldLoader = GameMode:GetLevelLoader()
    local ParentLevelIds = ProxyInfo.GetAllParentLevelIds()
    for i, ParentLevelId in pairs(ParentLevelIds) do
      local SubRegionId = WorldLoader:GetRegionIdByLevelId(ParentLevelId)
      DebugPrint("RegionDataMgr: OnWorldCompositionLevelLoaded_Lua", LevelName, ParentLevelId, SubRegionId)
      if Avatar:CheckCurrentSubRegion(SubRegionId) then
        local TmpSSData = self.DataLibrary:GetLevelRegionSSDatas(LevelName)
        if nil ~= TmpSSData then
          for WorldRegionEid, UnitRegionData in pairs(TmpSSData) do
            DebugPrint("RegionDataMgr: OnWorldCompositionLevelLoaded_Lua \233\129\141\229\142\134RegionSSDatas", WorldRegionEid, LevelName)
            if not UnitRegionData.bIsCreating and self.DataLibrary:CheckCanCreateWhileSpecialQuest(UnitRegionData) then
              self:WCRecoverActor(UnitRegionData)
            end
          end
        end
        self:TryGameModeFailEvent(SubRegionId, LevelName)
      end
    end
  end
end

function RegionDataMgrSubsystem_C:CommonSpwanRecoverSpawnInfo(RegionBaseData)
  DebugPrint("RegionDataMgr: WCRecoverActor \230\151\162\233\157\158\233\157\153\230\128\129\231\130\185\229\143\136\233\157\158\233\154\143\230\156\186\231\130\185", RegionBaseData.WorldRegionEid)
  local Info = {}
  Info.UnitId = RegionBaseData.UnitId
  Info.UnitType = RegionBaseData.UnitType
  Info.RegionDataType = RegionBaseData.RegionDataType
  Info.LevelName = RegionBaseData.LevelName
  Info.QuestId = RegionBaseData.QuestId
  Info.QuestChainId = RegionBaseData.QuestChainId
  Info.SubRegionId = RegionBaseData.SubRegionId
  Info.WorldRegionEid = RegionBaseData.WorldRegionEid
  Info.State = RegionBaseData.State
  Info.RarelyId = RegionBaseData.RarelyId
  Info.Eid = RegionBaseData.Eid
  local LastLocation = RegionBaseData.Location or RegionBaseData.BornLocation
  Info.Loc = FVector(LastLocation.X, LastLocation.Y, LastLocation.Z)
  Info.BornPos = FVector(RegionBaseData.BornLocation.X, RegionBaseData.BornLocation.Y, RegionBaseData.BornLocation.Z)
  Info.Rotation = FRotator(RegionBaseData.Rotation.pitch, RegionBaseData.Rotation.yaw, RegionBaseData.Rotation.roll)
  Info.ExtraRegionInfo = {
    SpecialQuestId = RegionBaseData.ExtraRegionInfo.SpecialQuestId,
    DynQuestId = RegionBaseData.ExtraRegionInfo.DynQuestId
  }
  return Info
end

function RegionDataMgrSubsystem_C:RandomCreatorRecoverSpawnInfo(RegionBaseData)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  DebugPrint("RegionDataMgr: WCRecoverActor \233\154\143\230\156\186\231\130\185\230\129\162\229\164\141 ", RegionBaseData.WorldRegionEid, RegionBaseData.RandomRuleId, RegionBaseData.RandomCreatorId)
  if not RegionBaseData.RandomRuleId then
    DebugPrint("RandomCreatorRecoverSpawnInfo, No RandomRuleId")
    return {}
  end
  local RandomInfo = DataMgr.RandomCreator[RegionBaseData.RandomRuleId].RandomInfos[RegionBaseData.RandomTableId]
  if not RandomInfo then
    DebugPrint("RandomCreatorRecoverSpawnInfo, No RandomInfo")
    return {}
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local LevelName, LevelGameMode = GameMode:GetLevelGamemModeAndLevelName(RegionBaseData.SubRegionId)
  local Info = {}
  RegionBaseData.RandomCreatorId = LevelGameMode.LevelGameMode.RandomActorManager:GetParamActorId(RegionBaseData.RandomRuleId, LevelName, RegionBaseData.RandomIdxInRule)
  Info.RandomCreatorId = RegionBaseData.RandomCreatorId
  Info.RandomRuleId = RegionBaseData.RandomRuleId
  Info.RandomTableId = RegionBaseData.RandomTableId
  Info.RandomIdxInRule = RegionBaseData.RandomIdxInRule
  Info.RegionDataType = RegionBaseData.RegionDataType
  Info.UnitType = DataMgr.RandomCreator[RegionBaseData.RandomRuleId].UnitType
  Info.UnitId = RandomInfo.UnitId
  Info.Level = (RandomInfo.UnitLevel or 0) + GameMode:GetFixedGamemodeLevel()
  Info.Loc = GameMode.RandomActorManager:GetCreatorRegionDataLoc(Info.RandomRuleId, RegionBaseData.RandomCreatorId)
  Info.Rotation = GameMode.RandomActorManager:GetCreatorRegionDataRot(Info.RandomRuleId, RegionBaseData.RandomCreatorId)
  Info.BornPos = FVector(RegionBaseData.BornLocation.X, RegionBaseData.BornLocation.Y, RegionBaseData.BornLocation.Z)
  Info.Creator = GameMode.RandomActorManager:GetCreator(Info.RandomRuleId, LevelName, Info.RandomIdxInRule)
  Info.LevelName = RegionBaseData.LevelName
  Info.QuestId = RegionBaseData.QuestId
  Info.QuestChainId = RegionBaseData.QuestChainId
  Info.SubRegionId = RegionBaseData.SubRegionId
  Info.WorldRegionEid = RegionBaseData.WorldRegionEid
  Info.State = RegionBaseData.State
  Info.RarelyId = RegionBaseData.RarelyId
  Info.Eid = RegionBaseData.Eid
  return Info
end

function RegionDataMgrSubsystem_C:StaticCreatorRecoverSpawnInfo(RegionBaseData)
  DebugPrint("RegionDataMgr: WCRecoverActor \233\157\153\230\128\129\231\130\185\230\129\162\229\164\141", RegionBaseData.WorldRegionEid)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local Creator = GameMode.EMGameState.StaticCreatorMap:Find(RegionBaseData.CreatorId)
  if not IsValid(Creator) then
    DebugPrint("RegionDataMgr: Error WCRecoverActor \230\137\190\228\184\141\229\136\176\233\157\153\230\128\129\231\130\185\239\188\129", RegionBaseData.CreatorId, RegionBaseData.RandomCreatorId)
    return {}
  end
  local Info = {}
  Info.Creator = Creator
  Info.UnitId = Creator.UnitId
  Info.UnitType = Creator.UnitType
  Info.Level = Creator:GetUnitLevel()
  Info.LevelName = RegionBaseData.LevelName
  Info.RegionDataType = RegionBaseData.RegionDataType
  Info.SubRegionId = RegionBaseData.SubRegionId
  Info.WorldRegionEid = RegionBaseData.WorldRegionEid
  Info.State = RegionBaseData.State
  Info.RarelyId = RegionBaseData.RarelyId
  Info.Eid = RegionBaseData.Eid
  Info.QuestId = RegionBaseData.QuestId
  Info.QuestChainId = RegionBaseData.QuestChainId
  local LastLocation = RegionBaseData.BornLocation or RegionBaseData.Location
  if Info.UnitId == CommonConst.DeliveryAnchorMechanismUnitId and Info.Creator and not LastLocation then
    Info.Loc = Creator:k2_GetActorLocation()
    Info.BornPos = Creator:k2_GetActorLocation()
    Info.Rotation = Creator:K2_GetActorRotation()
  else
    Info.Loc = FVector(LastLocation.X, LastLocation.Y, LastLocation.Z)
    Info.BornPos = FVector(RegionBaseData.BornLocation.X, RegionBaseData.BornLocation.Y, RegionBaseData.BornLocation.Z)
    Info.Rotation = FRotator(RegionBaseData.Rotation.pitch, RegionBaseData.Rotation.yaw, RegionBaseData.Rotation.roll)
  end
  Info.ExtraRegionInfo = {
    SpecialQuestId = RegionBaseData.ExtraRegionInfo.SpecialQuestId,
    DynQuestId = RegionBaseData.ExtraRegionInfo.DynQuestId
  }
  return Info
end

function RegionDataMgrSubsystem_C:OnSpecialQuestFinish()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode then
    GameMode:AllowAllFutureCreate()
    return
  end
end

function RegionDataMgrSubsystem_C:CheckUnitDataNeedStorage(UnitRegionData)
  local RegionDataType = UnitRegionData.RegionDataType
  if RegionDataType and RegionDataType > 0 and RegionDataType ~= ERegionDataType.RDT_HardBossData and RegionDataType ~= ERegionDataType.RDT_QuestData then
    return true
  end
  return false
end

function RegionDataMgrSubsystem_C:GetActorDataInfo(UnitId, UnitType)
  local Result = {}
  Result.UnitId = UnitId
  Result.UnitType = UnitType
  return Result
end

function RegionDataMgrSubsystem_C:GetNpcData(NpcId)
  if self.DataLibrary.SerializedNpcs[NpcId] then
    return true
  end
  return false
end

function RegionDataMgrSubsystem_C:CheckIsDataInitFromServer(WorldRegionEid)
  if not Const.OptimizationRegionRPC then
    return false
  end
  local Res = self.DataLibrary and self.DataLibrary.WorldEid2RegionCacheData and self.DataLibrary.WorldEid2RegionCacheData[WorldRegionEid] ~= nil
  DebugPrint("RegionDataMgrSubsystem_C:CheckIsDataInitFromServer ", WorldRegionEid, Res)
  return Res
end

function RegionDataMgrSubsystem_C:HasRegionSSDDataByKey(LevelName, WorldRegionEid)
  return self.DataLibrary:GetRegionSSDataByKey(LevelName, WorldRegionEid) ~= nil
end

function RegionDataMgrSubsystem_C:TryGameModeFailEvent(SubRegionId, LevelName)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  for Type, Datas in pairs(self.DataLibrary.RegionCacheDatas) do
    if IsEmptyTable(Datas) or IsEmptyTable(Datas[SubRegionId]) then
      self:ExeSubGameModeFailEvent(Avatar, SubRegionId, Type, LevelName)
    end
  end
end

function RegionDataMgrSubsystem_C:ExeSubGameModeFailEvent(Avatar, SubRegionId, RegionDataType, SubLevelName)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if not DataMgr.SubRegion[SubRegionId] then
    SubRegionId = Avatar.CurrentRegionId
  end
  local WorldLoader = GameMode:GetLevelLoader()
  local LevelName = WorldLoader:GetLevelIdByRegionId(SubRegionId)
  if not LevelName then
    return
  end
  if self.LoadSubRegionCache[RegionDataType] ~= nil and self.LoadSubRegionCache[RegionDataType][LevelName] ~= nil then
    return
  end
  self.LoadSubRegionCache[RegionDataType] = self.LoadSubRegionCache[RegionDataType] or {}
  local SubGameMode = GameMode.SubGameModeInfo:FindRef(LevelName)
  if nil ~= CommonConst.RegionDataType[RegionDataType] then
    local CacheName = "OnReload" .. CommonConst.RegionDataType[RegionDataType] .. "Fail"
    if SubGameMode and SubGameMode[CacheName] then
      SubGameMode[CacheName](SubGameMode)
    end
    self.LoadSubRegionCache[RegionDataType][LevelName] = SubRegionId
  end
end

function RegionDataMgrSubsystem_C:CheckUnitIsDeadByWorldRegionEid(WorldRegionEid)
  return self.DataLibrary:CheckUnitIsDeadByWorldRegionEid(WorldRegionEid)
end

function RegionDataMgrSubsystem_C:InitDestroyReason()
  self.DestoryReasonNotToSave:Clear()
  local DestoryReasons = {
    EDestroyReason.LevelUnloadedSaveGame,
    EDestroyReason.LevelNotExsit,
    EDestroyReason.HardBossClear,
    EDestroyReason.SepcialQuestStart,
    EDestroyReason.RegionExploreGroup
  }
  for _, DestoryReason in pairs(DestoryReasons) do
    self.DestoryReasonNotToSave:Add(DestoryReason)
  end
end

function RegionDataMgrSubsystem_C:UpdatePhantomRegionData(Actor)
  local Result, Avatar, GameMode = self:IsCanTriggerRegionDataHandle()
  if not Result then
    return
  end
  local WorldLoader = GameMode:GetLevelLoader()
  if WorldLoader then
    Actor.SubRegionId = WorldLoader:GetRegionIdByLocation(Actor:k2_GetActorLocation())
  end
  self.DataPool:UpdateLevelNameAndSubRegionId(self:GetLuaDataIndex(Actor.WorldRegionEid), Actor)
  local Data = self:UpdateUnitRegionCacheDataByActor(Actor)
  self.DataLibrary.LogHelper:OnClientCacheUpdated(Actor.WorldRegionEid, Actor.Eid, Actor.LevelName)
  if Data then
    Avatar:UpdatePhantomRegionActorData(Data, Data.State or {})
  end
end

function RegionDataMgrSubsystem_C:CheckRecoverRegionDataByIndex(Index)
  local Info = self.DataPool:GetRegionEntityDataNoCopy(Index)
  if not Info.UnitId or not Info.UnitType then
    return
  end
  if not self.CheckRecoverRegionDataByIndexCount then
    self.CheckRecoverRegionDataByIndexCount = {}
  end
  if not self.CheckRecoverRegionDataByIndexCount[Index] then
    self.CheckRecoverRegionDataByIndexCount[Index] = 0
  elseif self.CheckRecoverRegionDataByIndexCount[Index] >= 10 then
    return
  end
  if Info.UnitType == "None" then
    DebugPrint("CheckRecoverRegionDataByIndex UnitType None!!!")
    PrintTable(Info, 3)
  end
  if not self.DataLibrary:CheckCanCreateWhileSpecialQuest(Info) then
    return
  end
  if Info.RegionDataType == ERegionDataType.RDT_RarelyData then
    if Info.UnitType == "Drop" and not Info.CreatorId then
      return
    end
    if not Info.RarelyId then
      self:ShowRegionError([[
CheckRecoverRegionDataByIndex Error: RarelyData But No RarelyId !
CreatorId:]] .. (Info.CreatorId and Info.CreatorId or "nil") .. [[

UnitId:]] .. Info.UnitId .. [[

UnitType:]] .. Info.UnitType, Info)
      self.CheckRecoverRegionDataByIndexCount[Index] = self.CheckRecoverRegionDataByIndexCount[Index] + 1
    else
      local GameState = UGameplayStatics.GetGameState(self)
      local ExploreGroup = GameState.ExploreGroupMap:Find(Info.RarelyId)
      if not ExploreGroup or ExploreGroup.Status == EExploreGroupStatus.EGS_Complete then
      end
    end
  elseif Info.RegionDataType == ERegionDataType.RDT_QuestData then
    if Info.ExtraRegionInfo then
      local Avatar = GWorld:GetAvatar()
      if Info.ExtraRegionInfo.SpecialQuestId and Info.ExtraRegionInfo.SpecialQuestId > 0 then
        if Avatar and (not Avatar.InSpecialQuest or Info.ExtraRegionInfo.SpecialQuestId ~= Avatar.SpecialQuestId) then
          local SpecialQuestConfig = DataMgr.SpecialQuestConfig[Info.ExtraRegionInfo.SpecialQuestId]
          if SpecialQuestConfig and SpecialQuestConfig.TriggerBoxStaticCreatorId == Info.CreatorId then
            return
          end
          self:ShowRegionError([[
CheckRecoverRegionDataByIndex Error: QuestData Is In SpecialQuest But Avatar Is Not In SpecialQuest!
CreatorId:]] .. (Info.CreatorId and Info.CreatorId or "nil") .. [[

UnitId:]] .. Info.UnitId .. [[

UnitType:]] .. Info.UnitType .. [[

SpecialQuestId:]] .. Info.ExtraRegionInfo.SpecialQuestId, Info)
          self.CheckRecoverRegionDataByIndexCount[Index] = self.CheckRecoverRegionDataByIndexCount[Index] + 1
        end
        return
      elseif Info.ExtraRegionInfo.DynQuestId and Info.ExtraRegionInfo.DynQuestId > 0 then
        local DynamicQuest = Avatar.DynamicQuests[Info.ExtraRegionInfo.DynQuestId]
        if not DynamicQuest then
          self:ShowRegionError([[
CheckRecoverRegionDataByIndex Error: QuestData Is In DynamicQuest But Avatar Has No DynamicQuest!
CreatorId:]] .. (Info.CreatorId and Info.CreatorId or "nil") .. [[

UnitId:]] .. Info.UnitId .. [[

UnitType:]] .. Info.UnitType .. [[

DynQuestId:]] .. Info.ExtraRegionInfo.DynQuestId, Info)
          self.CheckRecoverRegionDataByIndexCount[Index] = self.CheckRecoverRegionDataByIndexCount[Index] + 1
        elseif not DynamicQuest:IsDoing() then
          self:ShowRegionError([[
CheckRecoverRegionDataByIndex Error: QuestData Is In DynamicQuest But DynamicQuest Is Not Doing!
CreatorId:]] .. (Info.CreatorId and Info.CreatorId or "nil") .. [[

UnitId:]] .. Info.UnitId .. [[

UnitType:]] .. Info.UnitType .. [[

DynQuestId:]] .. Info.ExtraRegionInfo.DynQuestId, Info)
          self.CheckRecoverRegionDataByIndexCount[Index] = self.CheckRecoverRegionDataByIndexCount[Index] + 1
        end
        return
      end
    end
    if not Info.QuestChainId then
      self:ShowRegionError([[
CheckRecoverRegionDataByIndex Error: QuestData But No QuestChainId !
CreatorId:]] .. (Info.CreatorId and Info.CreatorId or "nil") .. [[

UnitId:]] .. Info.UnitId .. [[

UnitType:]] .. Info.UnitType, Info)
      self.CheckRecoverRegionDataByIndexCount[Index] = self.CheckRecoverRegionDataByIndexCount[Index] + 1
    else
      local Avatar = GWorld:GetAvatar()
      if Avatar and not Avatar:IsQuestChainDoing(Info.QuestChainId) and not Avatar:IsQuestChainUnlock(Info.QuestChainId) then
        self:ShowRegionError([[
CheckRecoverRegionDataByIndex Error: QuestData But QuestChain Is Not Doing !
CreatorId:]] .. (Info.CreatorId and Info.CreatorId or "nil") .. [[

UnitId:]] .. Info.UnitId .. [[

UnitType:]] .. Info.UnitType .. [[

QuestChainId:]] .. Info.QuestChainId, Info)
        self.CheckRecoverRegionDataByIndexCount[Index] = self.CheckRecoverRegionDataByIndexCount[Index] + 1
      end
    end
  end
end

function RegionDataMgrSubsystem_C:CheckOnRegionEntityCreated(Index)
  local Info = self.DataPool:GetRegionEntityDataNoCopy(Index)
  if Info.RegionDataType == ERegionDataType.RDT_RarelyData then
    if Info.UnitType == "Drop" and not Info.CreatorId then
      return
    end
    if not Info.RarelyId then
      self:ShowRegionError([[
CheckOnRegionEntityCreated Error: RarelyData But No RarelyId !
CreatorId:]] .. (Info.CreatorId and Info.CreatorId or "nil") .. [[

UnitId:]] .. Info.UnitId .. [[

UnitType:]] .. Info.UnitType, Info)
    else
      local GameState = UGameplayStatics.GetGameState(self)
      local ExploreGroup = GameState.ExploreGroupMap:Find(Info.RarelyId)
      if not ExploreGroup or ExploreGroup.Status == EExploreGroupStatus.EGS_Complete or ExploreGroup.Status == EExploreGroupStatus.EGS_Deactive then
      end
    end
  elseif Info.RegionDataType == ERegionDataType.RDT_QuestData then
    if Info.ExtraRegionInfo then
      local Avatar = GWorld:GetAvatar()
      if Info.ExtraRegionInfo.SpecialQuestId and Info.ExtraRegionInfo.SpecialQuestId > 0 then
        if Avatar and (not Avatar.InSpecialQuest or Info.ExtraRegionInfo.SpecialQuestId ~= Avatar.SpecialQuestId) then
          local SpecialQuestConfig = DataMgr.SpecialQuestConfig[Info.ExtraRegionInfo.SpecialQuestId]
          if SpecialQuestConfig and SpecialQuestConfig.TriggerBoxStaticCreatorId == Info.CreatorId then
            return
          end
          self:ShowRegionError([[
CheckOnRegionEntityCreated Error: QuestData Is In SpecialQuest But Avatar Is Not In SpecialQuest!
CreatorId:]] .. (Info.CreatorId and Info.CreatorId or "nil") .. [[

UnitId:]] .. Info.UnitId .. [[

UnitType:]] .. Info.UnitType .. [[

SpecialQuestId:]] .. Info.ExtraRegionInfo.SpecialQuestId, Info)
        end
        return
      elseif Info.ExtraRegionInfo.DynQuestId and Info.ExtraRegionInfo.DynQuestId > 0 then
        local DynamicQuest = Avatar.DynamicQuests[Info.ExtraRegionInfo.DynQuestId]
        if not DynamicQuest then
          self:ShowRegionError([[
CheckOnRegionEntityCreated Error: QuestData Is In DynamicQuest But Avatar Has No DynamicQuest!
CreatorId:]] .. (Info.CreatorId and Info.CreatorId or "nil") .. [[

UnitId:]] .. Info.UnitId .. [[

UnitType:]] .. Info.UnitType .. [[

DynQuestId:]] .. Info.ExtraRegionInfo.DynQuestId, Info)
        elseif not DynamicQuest:IsDoing() then
          self:ShowRegionError([[
CheckOnRegionEntityCreated Error: QuestData Is In DynamicQuest But DynamicQuest Is Not Doing!
CreatorId:]] .. (Info.CreatorId and Info.CreatorId or "nil") .. [[

UnitId:]] .. Info.UnitId .. [[

UnitType:]] .. Info.UnitType .. [[

DynQuestId:]] .. Info.ExtraRegionInfo.DynQuestId, Info)
        end
        return
      end
    end
    if not Info.QuestChainId then
      self:ShowRegionError([[
CheckOnRegionEntityCreated Error: QuestData But No QuestChainId !
CreatorId:]] .. (Info.CreatorId and Info.CreatorId or "nil") .. [[

UnitId:]] .. Info.UnitId .. [[

UnitType:]] .. Info.UnitType, Info)
    else
      local Avatar = GWorld:GetAvatar()
      if Avatar and not Avatar:IsQuestChainDoing(Info.QuestChainId) and not Avatar:IsQuestChainUnlock(Info.QuestChainId) then
        self:ShowRegionError([[
CheckOnRegionEntityCreated Error: QuestData But QuestChain Is Not Doing !
CreatorId:]] .. (Info.CreatorId and Info.CreatorId or "nil") .. [[

UnitId:]] .. Info.UnitId .. [[

UnitType:]] .. Info.UnitType .. [[

QuestChainId:]] .. Info.QuestChainId, Info)
      end
      if self.DataPool:CheckQuestDataExist(Info.QuestChainId, Info) then
        self:ShowRegionError([[
CheckOnRegionEntityCreated Error: QuestData Create Repeated !
CreatorId:]] .. (Info.CreatorId and Info.CreatorId or "nil") .. [[

UnitId:]] .. Info.UnitId .. [[

UnitType:]] .. Info.UnitType .. [[

QuestChainId:]] .. Info.QuestChainId, Info)
      end
    end
  end
end

function RegionDataMgrSubsystem_C:ShowRegionError(String, Info)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local WCSubSystem = GameMode:GetWCSubSystem()
  if WCSubSystem then
    WCSubSystem:ShowRegionError_Lua(String)
  end
  if Info then
    PrintTable(Info, 2)
  end
end

return RegionDataMgrSubsystem_C
