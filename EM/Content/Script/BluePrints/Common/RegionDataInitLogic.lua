require("UnLua")
require("Const")
local M = Class()

function M:SyncFullRegionStoreDataFromServer(FullRegionStoreData)
  self.DataLibrary.FullRegionStoreDatas = FullRegionStoreData
end

function M:SyncPartRegionDataFromServer(PartRegionStoreData)
  self.NewDataReceived = true
  self.PartRegionStoreData = PartRegionStoreData
end

function M:ClearServerRegionData()
  self.DataLibrary:ClearSSData()
  self.DataLibrary:ClearRegionCacheDatas()
  self.DataLibrary:ClearManualItemDatas()
  self:ClearCppRegionData()
  self:MakeManualItemIdMap()
  if self.DataPool then
    self.DataPool:Initialize(self)
  end
  self.DataLibrary.LogHelper.bIsRegionLogEnabled = self.IsRegionLogEnabled
end

function M:MakeManualItemIdMap()
  if not self.PartRegionStoreData then
    return
  end
  for RegionDataType, SubRegionDatas in pairs(self.PartRegionStoreData) do
    for SubRegionId, LevelRegionDatas in pairs(SubRegionDatas) do
      for LevelName, RegionDatas in pairs(LevelRegionDatas) do
        for WorldRegionEid, RegionBaseData in pairs(RegionDatas) do
          if RegionBaseData.ManualItemId ~= nil and RegionBaseData.ManualItemId > 0 then
            self.DataLibrary.ManualItemIdMap[RegionBaseData.ManualItemId] = RegionBaseData
            self.DataLibrary.ManualItemWorldRegionEidExist:Add(RegionBaseData.ManualItemId, RegionBaseData.WorldRegionEid)
          end
        end
      end
    end
  end
end

function M:SyncServerRegionData()
  GWorld.UploadQuestChainData = true
  self.DataLibrary:ClearSSData()
  self.DataLibrary:ClearRegionCacheDatas()
  if not self.PartRegionStoreData or not self.NewDataReceived then
    self.CurRegionDeliverDatas = {}
    self.CurRegionDeliver = {}
    self.CurRegionDeliverNew:Clear()
    self.CurRegionDeliverDatasNew:Clear()
    return
  end
  self.NewDataReceived = false
  for RegionDataType, SubRegionDatas in pairs(self.PartRegionStoreData) do
    for SubRegionId, LevelRegionDatas in pairs(SubRegionDatas) do
      for LevelName, RegionDatas in pairs(LevelRegionDatas) do
        for WorldRegionEid, RegionBaseData in pairs(RegionDatas) do
          if self.DataLibrary.RegionSSDatas[LevelName] == nil then
            self.DataLibrary.RegionSSDatas[LevelName] = {}
          end
          RegionBaseData.ExtraRegionInfo = RegionBaseData.ExtraRegionInfo or {}
          if URuntimeCommonFunctionLibrary.UseCppRegionData(self) then
            self.DataLibrary:SetUnitRegionCacheData(RegionDataType, SubRegionId, LevelName, WorldRegionEid, RegionBaseData)
            self:InitSSDataFromServer(RegionBaseData)
          else
            self.DataLibrary:SetUnitRegionCacheData(RegionDataType, SubRegionId, LevelName, WorldRegionEid, RegionBaseData)
            self.DataLibrary:AddRegionSSDatas(RegionBaseData)
          end
        end
      end
    end
  end
  local SubSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, URegionDataMgrSubsystem:StaticClass())
  if SubSystem then
  end
  GWorld.UploadQuestChainData = false
end

function M:InitSSDataFromServer(RegionBaseData)
  self:InitSubRegionInfoByData(RegionBaseData)
  if RegionBaseData.ManualItemId ~= nil and RegionBaseData.ManualItemId > 0 then
    return
  end
  if RegionBaseData.IsDead then
    self.DataLibrary:SetUnitRegionCacheData(RegionBaseData.RegionDataType, RegionBaseData.SubRegionId, RegionBaseData.LevelName, RegionBaseData.WorldRegionEid, RegionBaseData)
    return
  end
  self.LastState = RegionBaseData.State
  self.LastBornLocation = RegionBaseData.BornLocation
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if nil ~= RegionBaseData.CreatorId and RegionBaseData.CreatorId > 0 then
    if not RegionBaseData.RandomRuleId or 0 == RegionBaseData.RandomRuleId then
      if GameState.StaticCreatorMap:Find(RegionBaseData.CreatorId) then
        self:InitStaticCreatorParams(RegionBaseData.CreatorId, RegionBaseData.QuestChainId, RegionBaseData.ExtraRegionInfo.SpecialQuestId, RegionBaseData.ExtraRegionInfo.DynQuestId)
        self:InitSSDataFromServer_StaticCreator(RegionBaseData.WorldRegionEid, RegionBaseData.LevelName, RegionBaseData.CreatorId)
      else
        GWorld.logger.error("\229\140\186\229\159\159\230\149\176\230\141\174\229\136\157\229\167\139\229\140\150\230\178\161\230\156\137\230\137\190\229\136\176StaticCreator!! \229\183\178\232\183\179\232\191\135\239\188\154" .. RegionBaseData.CreatorId)
      end
    end
  elseif RegionBaseData.RandomRuleId and RegionBaseData.RandomRuleId > 0 then
    RegionBaseData.BornLocation = RegionBaseData.BornLocation or {
      X = 0,
      Y = 0,
      Z = 0
    }
    self:InitSSDataFromServer_RandomCreator(RegionBaseData.WorldRegionEid, RegionBaseData.LevelName, RegionBaseData.RandomCreatorId, RegionBaseData.RandomRuleId, RegionBaseData.RandomTableId, RegionBaseData.RandomIdxInRule, RegionBaseData.BornLocation.X, RegionBaseData.BornLocation.Y, RegionBaseData.BornLocation.Z)
  else
    RegionBaseData.BornLocation = RegionBaseData.BornLocation or {
      X = 0,
      Y = 0,
      Z = 0
    }
    local Location = FVector(RegionBaseData.BornLocation.X, RegionBaseData.BornLocation.Y, RegionBaseData.BornLocation.Z)
    RegionBaseData.Rotation = RegionBaseData.Rotation or {
      Pitch = 0,
      Yaw = 0,
      Roll = 0
    }
    local Rotation = FRotator(RegionBaseData.Rotation.Pitch, RegionBaseData.Rotation.Yaw, RegionBaseData.Rotation.Roll)
    self:InitSSDataFromServer_Raw(RegionBaseData.WorldRegionEid, RegionBaseData.LevelName, RegionBaseData.UnitType, RegionBaseData.UnitId, Location, Rotation, RegionBaseData.RegionDataType)
  end
end

function M:InitStaticCreatorParams(CreatorId, QuestChainId, SpecialQuestId, DynQuestId)
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if not GameState then
    return
  end
  local Creator = GameState.StaticCreatorMap:FindRef(CreatorId)
  if not Creator then
    return
  end
  Creator:SetQuestChainId(QuestChainId)
  Creator.ExtraRegionInfo.SpecialQuestId = SpecialQuestId
  Creator.ExtraRegionInfo.DynQuestId = DynQuestId
end

function M:InitSSDataFromServer_StaticCreator_Lua(LuaTableIndex, CreatorId)
  local Context = AEventMgr.CreateUnitContext()
  Context.IntParams:Add("CreatorId", CreatorId)
  Context.IntParams:Add("Type", 4)
  Context:AddLuaTable("State", self.LastState)
  self:InitRegionDataTable(LuaTableIndex, Context)
  self.LastState = nil
  self.LastBornLocation = nil
  self.DataPool:GetRegionEntityDataNoCopy(LuaTableIndex)
end

function M:InitSSDataFromServer_RandomCreator_Lua(LuaTableIndex, RandomCreatorId, RandomRuleId, RandomTableId, RandomIdxInRule, LevelName)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  GameMode.RandomActorManager:GetCreator(RandomRuleId, LevelName, RandomIdxInRule)
  local Context = AEventMgr.CreateUnitContext()
  Context.IntParams:Add("RandomCreatorId", RandomCreatorId)
  Context.IntParams:Add("RandomRuleId", RandomRuleId)
  Context.IntParams:Add("RandomTableId", RandomTableId)
  Context.IntParams:Add("RandomIdxInRule", RandomIdxInRule)
  Context.VectorParams:Add("BornLocation", FVector(self.LastBornLocation.X, self.LastBornLocation.Y, self.LastBornLocation.Z))
  Context.IntParams:Add("Type", 4)
  Context:AddLuaTable("State", self.LastState)
  self:InitRegionDataTable(LuaTableIndex, Context)
  self.LastState = nil
  self.LastBornLocation = nil
  self.DataPool:GetRegionEntityDataNoCopy(LuaTableIndex)
end

function M:InitSSDataFromServer_Raw_Lua(LuaTableIndex, UnitType, UnitId, Location, Rotation, RegionDataType)
  local Context = AEventMgr.CreateUnitContext()
  Context.UnitId = UnitId
  Context.UnitType = UnitType
  Context.Loc = Location
  Context.Rotation = Rotation
  Context.IntParams:Add("RegionDataType", RegionDataType)
  Context.IntParams:Add("Type", 4)
  Context:AddLuaTable("State", self.LastState)
  self:InitRegionDataTable(LuaTableIndex, Context)
  self.LastState = nil
  self.LastBornLocation = nil
  self.DataPool:GetRegionEntityDataNoCopy(LuaTableIndex)
end

function M:InitCacheByPrepareRegion()
  self:InitRegionDeliverMechanismCache()
  self:InitSpawnActorDataCache()
  self:InitCretorDataCache()
end

function M:InitCretorDataCache()
  self.StaticIdControlCache = {}
  self.RandomIdControlCache = {}
  self:ClearControlCache()
end

function M:InitRegionDeliverMechanismCache()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode then
    self:TryActiveDefaultDeliver()
  end
  self.CurRegionDeliverNew:Clear()
  self.CurRegionDeliverDatasNew:Clear()
  local Avatar = GWorld:GetAvatar()
  self:InitRegionDeliverMechanismCacheCpp(Avatar:GetSubRegionId2RegionId())
end

function M:InitSpawnActorDataCache()
  self.ManualDatas = {}
end

function M:AddManualDataToCache(ManualItemId, WorldRegionEid)
  if not (ManualItemId and WorldRegionEid) or ManualItemId <= 0 then
    return
  end
  if not self:IsExistManualItemId(ManualItemId) and ManualItemId > 0 then
    self.ManualDatas[ManualItemId] = WorldRegionEid
  end
end

function M:IsExistManualItemId(ManualItemId)
  if not ManualItemId then
    return false
  end
  if self.ManualDatas[ManualItemId] then
    return true
  end
  return false
end

function M:InitRegionInfo()
  GWorld.UploadQuestChainData = true
  self.ReadyRegionRecover = true
  self.LoadSubRegionCache = {}
  local Avatar = GWorld:GetAvatar()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if not GameMode:IsInRegion() then
    return
  end
  local WorldLoader = GameMode:GetLevelLoader()
  if WorldLoader and GWorld:GetWorldRegionState() and Avatar:CheckCurrentSubRegion() then
    self:RecoverRegionBpData(Avatar, Avatar.CurrenRegionId)
  end
  GWorld.UploadQuestChainData = false
  if not self.Inited then
    self:OnInitRecoverRegionData(false)
  end
end

function M:RecoverRegionBpData(Avatar, SubRegionId)
  local RegionId = Avatar:GetSubRegionId2RegionId(SubRegionId)
  local RegionData = DataMgr.Region[RegionId]
  if not RegionData then
    DebugPrint("Error! RecoverRegionBpData \230\137\190\228\184\141\229\136\176\229\140\186\229\159\159\230\149\176\230\141\174", RegionId)
    return
  end
  local StorageRegionDataType = {
    1,
    2,
    3,
    5,
    6,
    7
  }
  for RegionDataType, j in ipairs(StorageRegionDataType) do
    for _, SubRegionId in ipairs(RegionData.IsRandom) do
      local Datas = self.DataLibrary:GetRegionCacheDatasByIdType(RegionDataType)
      self:RecoverSubRegionDataCache(Avatar, SubRegionId, RegionDataType, Datas)
    end
  end
  for _, SubRegionId in ipairs(RegionData.IsRandom) do
    self:RecoverRegionRarelyGroupDataCache(Avatar, SubRegionId)
  end
end

function M:RecoverRegionRarelyGroupDataCache(Avatar, SubRegionId)
  if not Avatar then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  for _, RarelyId in pairs(Avatar.Explores:Keys()) do
    local ExploreActor = GameMode.EMGameState.ExploreGroupMap:FindRef(RarelyId)
    local Explore = Avatar.Explores[RarelyId]
    if IsValid(ExploreActor) and Explore and not Explore:IsInActive() and Explore.RegionId == SubRegionId then
      ExploreActor:RealSetExploreGroupStatus(Explore:GetState())
      for ExploreDataKey, ExploreDataValue in pairs(Explore.ExploreData.Props) do
        ExploreActor[ExploreDataKey] = ExploreDataValue
      end
    end
  end
end

function M:InitSubRegionInfoByData(UnitData)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if UnitData.ManualItemId and UnitData.ManualItemId > 0 then
    DebugPrint("RecoverSubRegionDataCache \230\129\162\229\164\141\232\191\153\228\186\155manualitem", UnitData.ManualItemId, UnitData.SubRegionId, UnitData.UnitType, UnitData.UnitId)
    local ManualItemActor = GameMode.BPBornRegionActor:FindRef(UnitData.ManualItemId)
    if ManualItemActor then
      if UnitData.IsDead then
        if ManualItemActor.EMActorDestroy then
          ManualItemActor:EMActorDestroy(EDestroyReason.RecoverSubRegionDataCacheButBpBornHasAlreadyDead)
        else
          DebugPrint("Error! RecoverSubRegionDataCache \230\173\164ACTOR \232\147\157\229\155\190\231\148\159\230\136\144\239\188\140\228\189\134\230\152\175\230\178\161\230\156\137\233\148\128\230\175\129\230\150\185\230\179\149", ManualItemActor)
        end
      else
        local Context = AEventMgr.CreateUnitContext()
        Context.UnitId = UnitData.UnitId
        Context.UnitType = UnitData.UnitType
        Context:AddLuaTable("State", UnitData.State)
        Context.IntParams:Add("RegionDataType", UnitData.RegionDataType)
        Context.NameParams:Add("WorldRegionEid", UnitData.WorldRegionEid)
        Context.IntParams:Add("SubRegionId", UnitData.SubRegionId)
        Context.VectorParams:Add("BornLoc", ManualItemActor:K2_GetActorLocation())
        ManualItemActor:RegisterInfoNew(Context)
      end
      self:AddManualDataToCache(UnitData.ManualItemId, UnitData.WorldRegionEid)
    else
      DebugPrint("Error! \229\140\186\229\159\159\239\188\140\229\173\152\229\156\168\228\184\128\228\184\170\232\147\157\229\155\190\231\148\159\230\136\144\231\154\132actor\239\188\140\228\189\134\230\152\175\229\189\147\229\137\141\229\156\186\230\153\175\229\134\133\230\156\170\230\137\190\229\136\176")
    end
  elseif UnitData.CreatorId then
    local Context = AEventMgr.CreateUnitContext()
    Context.IntParams:Add("CreatorId", UnitData.CreatorId)
    Context.NameParams:Add("WorldRegionEid", UnitData.WorldRegionEid)
    Context.IntParams:Add("SubRegionId", UnitData.SubRegionId)
    self:AddCretorActiveCacheNew(Context)
    self:InitStaticCreatorData(UnitData)
  elseif UnitData.RandomRuleId then
    local WorldLoader = GameMode:GetLevelLoader()
    local LevelName = WorldLoader:GetLevelIdByLocation(FVector(UnitData.BornLocation.X, UnitData.BornLocation.Y, UnitData.BornLocation.Z))
    if "None" == LevelName or "" == LevelName then
      DebugPrint("RandomCreator\228\184\173\228\184\141\229\173\152\229\156\168\229\166\130\228\184\139\230\149\176\230\141\174\239\188\154 Location = ", UnitData.BornLocation.X, UnitData.BornLocation.Y, UnitData.BornLocation.Z)
    end
    local RandomCreatorId = GameMode.RandomActorManager:GetParamActorId(UnitData.RandomRuleId, LevelName, UnitData.RandomIdxInRule)
    UnitData.RandomCreatorId = RandomCreatorId
    local Context = AEventMgr.CreateUnitContext()
    Context.IntParams:Add("RandomCreatorId", UnitData.RandomCreatorId)
    Context.IntParams:Add("RandomRuleId", UnitData.RandomRuleId)
    Context.NameParams:Add("WorldRegionEid", UnitData.WorldRegionEid)
    Context.IntParams:Add("SubRegionId", UnitData.SubRegionId)
    self:AddCretorActiveCacheNew(Context)
  end
end

function M:RecoverSubRegionDataCache(Avatar, SubRegionId, RegionDataType, Datas)
  if not Datas then
    return
  end
  if URuntimeCommonFunctionLibrary.UseCppRegionData(GWorld.GameInstance) then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local SubRegionDatas = Datas[SubRegionId]
  if not SubRegionDatas then
    return
  end
  for LevelName, SubRegionData in pairs(SubRegionDatas) do
    for WorldRegionEid, UnitData in pairs(SubRegionData) do
      self:InitSubRegionInfoByData(UnitData)
    end
  end
end

function M:InitStaticCreatorData(UnitData)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    return
  end
  local StaticCreator = GameState.StaticCreatorMap:FindRef(UnitData.CreatorId)
  if not IsValid(StaticCreator) then
    return
  end
  if not UnitData.WorldRegionEid or UnitData.WorldRegionEid == "" then
    return
  end
  StaticCreator.ChildSerializedWorldRegionEids:Add(UnitData.WorldRegionEid)
end

function M:OnInitRecoverRegionData(IsReRecover)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if not self.ReadyRegionRecover then
    DebugPrint("ZJT_ Recover Region Data Failer !!!")
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local WorldLoader = GameMode:GetLevelLoader()
  if WorldLoader and GWorld:GetWorldRegionState() and Avatar:CheckCurrentSubRegion() then
    if not URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(self) then
      WorldLoader:ArtLevelBindEvent(IsReRecover)
    elseif not IsReRecover then
      GameMode:InitWCEvent()
    else
      GameMode:TriggerLoadedEvent()
    end
  end
  WorldLoader:OpenInitSuit()
  self.Inited = true
end

return M
