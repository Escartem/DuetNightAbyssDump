require("UnLua")
local BP_RandomCreateActor_C = Class({
  "BluePrints/Char/BP_StaticCreateActor_C"
})

function BP_RandomCreateActor_C:Initialize(Initializer)
  local m = FRandomActorTemplate()
  local t = FRandomCreateActorParam()
end

function BP_RandomCreateActor_C:ReceiveBeginPlay()
  self.Overridden.ReceiveBeginPlay(self)
  self:AddRandomCreatorInfo()
end

function BP_RandomCreateActor_C:InitRandomSpawnInfo(ParamsNum, Manager, Idx)
  self.UnitType = DataMgr.RandomCreator[self.RandomRuleId].UnitType
  self.NotOverLap = DataMgr.RandomCreator[self.RandomRuleId].NotOverLap
  self.RuleType = DataMgr.RandomCreator[self.RandomRuleId].RuleType
  self.Count = math.min(DataMgr.RandomCreator[self.RandomRuleId].Count, ParamsNum)
  self.CanEscapeBattle = 1 ~= DataMgr.RandomCreator[self.RandomRuleId].CannotEscapeBattle
  self.UnitInfoWeight = {}
  self.UnitLevel = {}
  self.UnitIdList = {}
  self.UnitIdToTableId = {}
  self.WeightSum = 0
  if not self.ProportionList then
    self.ProportionList = {}
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if nil == GameMode then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function Callback(Ret, Res)
      if 0 ~= Ret then
        return
      end
      self.UnitId = Res.UnitId
      self.UnitType = Res.UnitType
      self.Level = Res.Level
      self.CurrentTableId = Res.CurrentTableId
      Manager:EmplaceRandomCreator(self.RandomRuleId, Idx)
    end
    
    Avatar:ActiveRandomCreator(self.RandomRuleId, ParamsNum, Callback)
  elseif IsDedicatedServer(self) and IsAuthority(self) then
    local bSuccess, Res = AvatarUtils:HandleActiveRandomCreator(self.RandomRuleId, ParamsNum, self.ProportionList)
    self.UnitId = Res.UnitId
    self.UnitType = Res.UnitType
    self.Level = Res.Level
    self.CurrentTableId = Res.CurrentTableId
    Manager:EmplaceRandomCreator(self.RandomRuleId, Idx)
  elseif 1 == self.RuleType then
    self:SetInfoRandom()
  elseif 2 == self.RuleType then
    self:SetInfoProportion(ParamsNum)
  end
end

function BP_RandomCreateActor_C:SetInfoRandom()
  local MaxTableId = 0
  for _, Info in ipairs(DataMgr.RandomCreator[self.RandomRuleId].RandomInfos) do
    self.UnitInfoWeight[Info.UnitId] = Info.Weight
    self.UnitLevel[Info.UnitId] = Info.UnitLevel or 1
    self.WeightSum = self.WeightSum + Info.Weight
    MaxTableId = MaxTableId + 1
    self.UnitIdToTableId[Info.UnitId] = MaxTableId
  end
  local WeightSum = self.WeightSum
  for UnitId, Weight in pairs(self.UnitInfoWeight) do
    local RandomNumber = math.random(1, WeightSum)
    if Weight >= RandomNumber then
      self.UnitId = UnitId
      self.Level = self.UnitLevel[UnitId]
      self.CurrentTableId = self.UnitIdToTableId[UnitId]
      break
    else
      WeightSum = WeightSum - Weight
    end
  end
end

function BP_RandomCreateActor_C:SetInfoProportion()
  local MaxTableId = 0
  for _, Info in ipairs(DataMgr.RandomCreator[self.RandomRuleId].RandomInfos) do
    self.UnitInfoWeight[Info.UnitId] = Info.Weight
    self.UnitLevel[Info.UnitId] = Info.UnitLevel or 1
    self.WeightSum = self.WeightSum + Info.Weight
    MaxTableId = MaxTableId + 1
    self.UnitIdList[MaxTableId] = Info.UnitId
    self.UnitIdToTableId[Info.UnitId] = MaxTableId
  end
  local CurrentTableId = 1
  PrintTable(self.UnitInfoWeight, 3)
  for Id, Num in pairs(self.UnitInfoWeight) do
    if self.ProportionList[Id] == nil then
      self.ProportionList[Id] = 0
    end
    if self.ProportionList[Id] ~= math.floor(Num / self.WeightSum * self.Count) then
      self.ProportionList[Id] = self.ProportionList[Id] + 1
      self.UnitId = Id
      self.Level = self.UnitLevel[Id]
      self.CurrentTableId = self.UnitIdToTableId[Id]
      break
    end
    CurrentTableId = CurrentTableId + 1
    if MaxTableId < CurrentTableId then
      self.CurrentTableId = math.random(1, MaxTableId)
      self.UnitId = self.UnitIdList[CurrentTableId]
      self.Level = self.UnitLevel[Id]
    end
  end
end

function BP_RandomCreateActor_C:AddRandomCreatorInfo()
  if not IsAuthority(self) then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not IsValid(GameMode) then
    return
  end
  GameMode.RandomCreatorArray:Add(self)
  self.StaticCreatorId = 2000000000 + GameMode:GetRandomCreateActorManager().Templates:Length()
  GameState.StaticCreatorMap:Add(self.StaticCreatorId, self)
  GameState.StaticCreatorStringNameMap:Add(self.DisplayName, self)
end

function BP_RandomCreateActor_C:AddSerializedEid_Lua(Eid)
  self.RandomActorArray:Add(Eid)
end

function BP_RandomCreateActor_C:RemoveActorToChildEids(Eid)
  self.RandomActorArray:RemoveItem(Eid)
end

function BP_RandomCreateActor_C:SetCreatorQuestId(QuestId)
end

function BP_RandomCreateActor_C:GetOutBattleBehaviorInfo(LevelName, RandomCreatorId)
  if not RandomCreatorId then
    return
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local DataManager = GameState.RandomCreatorDataMap:Find(LevelName)
  local Param = GameState.RandomCreatorIdMap:Find(RandomCreatorId)
  local res = {}
  if DataManager then
    res.OutBattleBehaviorType = DataManager:GetBattleTypeInfo(RandomCreatorId)
  end
  if Param then
    res.PatrolId = Param.PatrolId
    res.StrollRange = Param.StrollRange
    res.LoopMontageId = Param.LoopMontageId
    res.MontageList = Param.MontageList
  end
  return res
end

function BP_RandomCreateActor_C:ActiveRandomCreator(Param)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not IsValid(GameMode) then
    return
  end
  print(_G.LogTag, "LXZ ActiveRandomCreator", Param.UnitType, Param.UnitId)
  local ManagerRot = Param.DataManager:K2_GetActorRotation()
  local Rot = FRotator(Param.ActorRot.Pitch + ManagerRot.Pitch, Param.ActorRot.Yaw + ManagerRot.Yaw, Param.ActorRot.Roll + ManagerRot.Roll)
  local Context = AEventMgr.CreateUnitContext()
  Context.UnitType = Param.UnitType
  Context.UnitId = Param.UnitId
  Context.Loc = Param:GetLoc()
  Context.Rotation = Rot
  Context.Creator = self
  Context.IntParams:Add("RandomCreatorId", Param.Actorid)
  Context.IntParams:Add("RandomRuleId", self.RandomRuleId)
  Context.IntParams:Add("RandomTableId", Param.CurrentTableId)
  Context.NameParams:Add("WorldRegionEid", self.LastWorldRegionEid)
  self:FillRandomCreateUnitContext(Context, Param)
  GameMode.EMGameState.EventMgr:CreateUnitNew(Context, false)
end

function BP_RandomCreateActor_C:FillRandomCreateUnitContext(Context, Param)
  if not Param then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    local RandomRuleId = Context.IntParams:Find("RandomRuleId")
    local RandomCreatorId = Context.IntParams:Find("RandomCreatorId")
    local Params = GameState.RandomCreatorRuleMap:FindRef(RandomRuleId)
    if Params and RandomRuleId and RandomCreatorId then
      for _, TempParam in pairs(Params.Params:ToTable()) do
        if TempParam.Actorid == RandomCreatorId then
          Param = TempParam
          break
        end
      end
    end
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local Level = self.Level + GameMode:GetFixedGamemodeLevel()
  Context.IntParams:Add("Level", Level)
  if Param then
    local BornChangeBT = Param.BornChangeBT
    if "None" ~= BornChangeBT then
      local BT = LoadObject(BornChangeBT)
      Context:AddObjectParams("BTObject", BT)
    end
  end
end

function BP_RandomCreateActor_C:OnRandomCreatorRegionDataAllocated_Lua(LuaTableIndex, RandomCreatorId, RandomRuleId, RandomTableId, RandomIdxInRule)
  local GameMode = UGameplayStatics.GetGameMode(self)
  local RegionDataSubsys = GameMode:GetRegionDataMgrSubSystem()
  local Context = AEventMgr.CreateUnitContext()
  Context.Creator = self
  Context.IntParams:Add("RandomCreatorId", RandomCreatorId)
  Context.IntParams:Add("RandomRuleId", RandomRuleId)
  Context.IntParams:Add("RandomTableId", RandomTableId)
  RegionDataSubsys:InitRegionDataTable(LuaTableIndex, Context)
end

function BP_RandomCreateActor_C:AddSnapShotSpawnInfo(Eid, RuleId, ParamId, TableId)
  self:AddSpawnInfo(Eid, RuleId, ParamId, TableId)
end

function BP_RandomCreateActor_C:RecoverSpawnInfo_Lua(Actor, RuleId, ParamId, TableId)
  Actor.RandomRuleId = RuleId
  Actor.RandomCreatorId = ParamId
  Actor.RandomTableId = TableId
end

return BP_RandomCreateActor_C
