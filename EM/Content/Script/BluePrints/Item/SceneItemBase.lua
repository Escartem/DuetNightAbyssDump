require("UnLua")
local SceneItemBase = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.Combat.Components.EffectSourceInterface"
})
SceneItemBase._components = {
  "BluePrints.Combat.Components.ActorTypeComponent",
  "BluePrints.Char.CharacterComponent.AddGuideComponent"
}

function SceneItemBase:ReceiveBeginPlay()
  EventManager:AddEvent(EventID.OnBattleReady, self, self.OnBattleReady_TryInitCharacterInfo)
  self.Overridden.ReceiveBeginPlay(self)
  if self.BpBorn and IsAuthority(self) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    GameMode.BPBornActor:AddUnique(self)
    if -1 ~= self.ManualItemId then
      GameMode.BPBornRegionActor:Add(self.ManualItemId, self)
    end
    if GameMode:IsInRegion() then
      self:RegionInitBpActor()
      self:SetCachedMaxDrawDistance(10000)
    else
      local Context = AEventMgr.CreateUnitContext()
      Context.UnitType = self.UnitType
      Context.UnitId = self.UnitId
      self:RegisterInfoNew(Context)
    end
  end
  self.IsDestroied = false
end

function SceneItemBase:OnBattleReady_TryInitCharacterInfo(_Battle)
  if Battle(self) == _Battle then
    self:TryInitActorInfo("Battle")
  end
end

function SceneItemBase:RegionInitBpActor()
  local BpBornRegionActorID = self.ManualItemId
  local SubSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, URegionDataMgrSubsystem:StaticClass())
  local ManualItemData = SubSystem:GetManualItemData(BpBornRegionActorID)
  if not ManualItemData then
    local Context = AEventMgr.CreateUnitContext()
    Context.UnitType = self.UnitType
    Context.UnitId = self.UnitId
    Context.IntParams:Add("RegionDataType", self.RegionDataType)
    Context.IntParams:Add("QuestChainId", self.QuestChainId)
    Context.BoolParams:Add("IsFullRegionStore", self.IsFullRegionStore)
    Context.VectorParams:Add("BornLoc", self:K2_GetActorLocation())
    Context.ExtraRegionInfo = {
      SpecialQuestId = self.ExtraRegionInfo.SpecialQuestId,
      DynQuestId = self.ExtraRegionInfo.DynQuestId
    }
    self:RegisterInfoNew(Context)
  end
end

function SceneItemBase:RegisterInfo(Info)
  if Info then
    self.InfoForInit = Info
  end
  self:TryInitActorInfo("InitInfo")
end

function SceneItemBase:OnRep_ServerInitSuccess()
  if self.ServerInitSuccess then
    self.InfoForInitNew.UnitId = self.UnitId
    self.InfoForInitNew.UnitType = self.UnitType
    self:TryInitActorInfo("InitInfo")
  else
    self.InitSuccess = false
  end
end

function SceneItemBase:BeginInitInfo()
  if self.InitSuccess then
    return
  end
  self:InitActorInfo_New()
end

function SceneItemBase:OnEMActorDestroy(DestroyReason)
  self.Overridden.OnEMActorDestroy(self, DestroyReason)
end

function SceneItemBase:RegionOnEMActorDestroy(DestroyReason, GameMode)
  if GameMode:IsInDungeon() then
    return
  end
  if self.BpBorn and (not self:CheckManuItemRegionStorage() or DestroyReason == EDestroyReason.RecoverSubRegionDataCacheButBpBornHasAlreadyDead) then
    return
  end
  if self.WorldRegionEid == "" then
    if self.Data then
      GWorld.logger.errorlog("Error : Actor\229\156\168Destroy\230\151\182\230\178\161\230\156\137\232\181\139\229\128\188WorldRegionEid", self.UnitId, self.UnitType, self.Eid)
    end
  else
    GameMode:GetRegionDataMgrSubSystem():DeadRegionActorData(self, DestroyReason)
  end
  local WCSubSystem = GameMode:GetWCSubSystem()
  if not IsValid(WCSubSystem) then
    return
  end
  WCSubSystem:UnregisterEntryToWorldComposition(self)
end

function SceneItemBase:InitActorInfo(Info)
end

function SceneItemBase:CreateMechanismData_Lua(UnitType, UnitId)
  self.Data = DataMgr[UnitType][UnitId]
  if self.Data then
    return true
  else
    return false
  end
end

function SceneItemBase:PreInitInfo(Info)
end

function SceneItemBase:InitGamePlayTags()
  self.GameplayTagsInitSuccess = true
end

function SceneItemBase:OnActorReady(Info)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode and GameMode:IsInRegion() then
    self:CreateRegionData()
  end
end

function SceneItemBase:CommonInitInfo(Info)
end

function SceneItemBase:AuthorityInitInfo(Info)
end

function SceneItemBase:ClientInitInfo()
end

function SceneItemBase:GetShowGuideDis(InitGuideInfo)
  self.ShowGuideDistance = InitGuideInfo
  return true
end

function SceneItemBase:CreateGuideHandle(bInit)
  if not IsAuthority(self) then
    return
  end
  if self.FixTryToAddGuideHandle or bInit and self.HasGuideClose then
    return
  end
  if not self.Data.GuideInfo then
    self.FixTryToAddGuideHandle = self:AddTimer(1, self.TryToAddGuide, true, 0, nil, false)
    return
  end
  self.ShowGuideMinDistance = self.Data.GuideInfo[1]
  self.ShowGuideMaxDistance = self.Data.GuideInfo[2]
  if self.ShowGuideMinDistance * self.ShowGuideMaxDistance < 0 then
    print(_G.LogTag, "LXZ  Error: CombatItemBase Guide Distance Error")
    return
  end
  if self.ShowGuideMaxDistance > 0 then
    self.FixTryToAddGuideHandle = self:AddTimer(1, self.TryToAddRangeGuide, true, 0, nil, false, "in")
  end
  if self.ShowGuideMinDistance < 0 then
    local tmp = self.ShowGuideMaxDistance
    self.ShowGuideMaxDistance = -self.ShowGuideMinDistance
    self.ShowGuideMinDistance = -tmp
    self.FixTryToAddGuideHandle = self:AddTimer(1, self.TryToAddRangeGuide, true, 0, nil, false, "out")
  end
end

function SceneItemBase:StopTryToAddGuideTimer()
  if not IsValid(self) then
    self:StopAddGuideTimer()
    return true
  end
  return false
end

function SceneItemBase:InitCreatorInfo(Info)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode:IsInRegion() then
    local DungeonState = Info:GetLuaTable("DungeonState")
    if DungeonState then
      self:RecoverSavedData(DungeonState)
    end
  else
    local State = Info:GetLuaTable("State")
    if State then
      self:RecoverSavedData(State)
    end
  end
end

function SceneItemBase:GetUnitRealType()
  return ""
end

function SceneItemBase:SetRegionState()
end

function SceneItemBase:GetManualItemId()
  return self.ManualItemId or -1
end

function SceneItemBase:CheckUnitNeedStorage()
  if self.RegionDataType and CommonUtils.HasValue(Const.RegionDataStorageType, self.RegionDataType) then
    return true
  end
  return false
end

function SceneItemBase:IsBpbornRegionStorage()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return false
  end
  local BPBornActor = GameMode.BPBornRegionActor:FindRef(self.ManualItemId)
  return self.BpBorn and IsValid(BPBornActor)
end

function SceneItemBase:CreateRegionData()
end

function SceneItemBase:UpdateRegionData(DataName, DataValue)
  self[DataName] = DataValue
  if self.BpBorn and not self:CheckManuItemRegionStorage() then
    return
  end
  if not self.RegionData or self.RegionData[DataName] == nil then
    return
  end
  self.RegionData[DataName] = DataValue
  local GameMode = UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:GetRegionDataMgrSubSystem():UpdateRegionActorData(self, self.RegionData)
  end
end

function SceneItemBase:UpdateRegionDataByTable(DataTable)
  for DataName, DataValue in pairs(DataTable) do
    self[DataName] = DataValue
  end
  if self.BpBorn and not self:CheckManuItemRegionStorage() then
    return
  end
  if not self.RegionData then
    return
  end
  for DataName, DataValue in pairs(DataTable) do
    self.RegionData[DataName] = DataValue
  end
  local GameMode = UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:GetRegionDataMgrSubSystem():UpdateRegionActorData(self, self.RegionData)
  end
end

function SceneItemBase:OnRegionDataAllocated_Lua(LuaTableIndex, LevelName, RegionDataType, SubRegionId, UnitType, UnitId, Location)
  local GameMode = UGameplayStatics.GetGameMode(self)
  if GameMode then
    local Context = AEventMgr.CreateUnitContext()
    Context.StrParams:Add("LevelName", LevelName)
    Context.IntParams:Add("RegionDataType", RegionDataType)
    Context.IntParams:Add("SubRegionId", SubRegionId)
    Context.UnitType = UnitType
    Context.UnitId = UnitId
    Context.Loc = Location
    Context.IntParams:Add("ManualItemId", self.ManualItemId)
    Context.IntParams:Add("QuestChainId", self.QuestChainId)
    Context.BoolParams:Add("IsFullRegionStore", self.IsFullRegionStore)
    GameMode:GetRegionDataMgrSubSystem():InitRegionDataTable(LuaTableIndex, Context)
  end
end

function SceneItemBase:RecoverSavedData(DataTable)
  if not DataTable then
    return
  end
  for i, v in pairs(DataTable) do
    if nil ~= self[i] then
      self[i] = v
    end
  end
end

function SceneItemBase:GetDungeonSaveData()
  return {}
end

function SceneItemBase:OnRep_CurrentLevelId()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local SceneMgr
  if GameInstance and GameInstance.GetSceneManager then
    SceneMgr = GameInstance:GetSceneManager()
  end
  if nil ~= SceneMgr and SceneMgr:GetLevelLoader().LevelPathfinding then
    SceneMgr:GetLevelLoader().LevelPathfinding:UpdatePathfindingByEid(self.Eid, self.CurrentLevelId, false)
  end
end

function SceneItemBase:RecoverBpBornData()
  print(_G.LogTag, "LXZ RecoverBpBornData", self:GetName())
end

function SceneItemBase:ReceiveEndPlay()
  EventManager:RemoveEvent(EventID.OnBattleReady, self)
  EventManager:RemoveEvent(EventID.OnInitReady, self)
  if self.CleanTimer then
    self:CleanTimer()
  end
  self.IsDestroied = true
end

AssembleComponents(SceneItemBase)
return SceneItemBase
