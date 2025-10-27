local M = Class("BluePrints/Item/CombatProp/BP_CombatPropBase_C")

function M:AuthorityInitInfo(Info)
  M.Super.AuthorityInitInfo(self, Info)
  self.Box.OnComponentBeginOverlap:Add(self, self.CollisionBeginOverlap)
end

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.BuffBlockTime = self.UnitParams.BuffBlockTime or 15
  self.BoxRespawnTime = self.UnitParams.BoxRespawnTime or 10
  self.bCanAddBuff = true
end

function M:CollisionBeginOverlap(Component, OtherActor)
  if not OtherActor:IsPlayer() or not self.bCanAddBuff then
    return
  end
  local DelayBuff = Battle(self):FindBuffById(OtherActor, 5000209, 0, false)
  if DelayBuff then
    self:OnPartyBuffBoxTriggered(false, OtherActor)
    return
  end
  local BuffId, Time, Idx = self:GetBuffId(OtherActor.Eid)
  local TargetType = DataMgr.ParkourSkill[Idx].Target
  self:AddBuff(BuffId, TargetType, OtherActor, Time)
  local ClientToast = DataMgr.ParkourSkill[Idx].ShowToast
  if ClientToast and "" ~= ClientToast then
    self:ClientShowBuffToast(ClientToast, OtherActor, OtherActor.Eid)
  end
  self:OnPartyBuffBoxTriggered(true, OtherActor)
  self.bCanAddBuff = false
  self:AddTimer(self.BoxRespawnTime, self.BoxRespawn, false)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:OnPlayerGetBuff(OtherActor.Eid, BuffId, DataMgr.ParkourSkill[Idx].IsPositiveBuff, Time)
  end
end

function M:BoxRespawn()
  self.bCanAddBuff = true
  self:OnPartyBuffBoxRespawn()
end

function M:GetBuffId(PlayerEid)
  local GameState = UGameplayStatics.GetGameState(self)
  local Percent = GameState.PartyPlayerDisPercentValues:Find(PlayerEid)
  local Total = 0
  for i, v in pairs(GameState.PartyPlayerDisPercentValues) do
    Total = Total + v
  end
  local AveragePercent = Total / GameState.PartyPlayerDisPercentValues:Length()
  local WeightList = {}
  local WeightSum = 0
  for i, Data in pairs(DataMgr.ParkourSkill) do
    local Weight = 0
    local MultiplayerOnly = Data.MultiplayerOnly and 1 == Data.MultiplayerOnly
    if not IsStandAlone(self) then
      Weight = Data.WeightBasic * (Data.WeightFactor * (Percent - AveragePercent) + Data.WeightConstant)
      WeightList[Data.EffectID] = {Weight = Weight, Idx = i}
      WeightSum = WeightSum + Weight
    elseif IsStandAlone(self) and not MultiplayerOnly then
      Weight = Data.WeightBasic
      WeightList[Data.EffectID] = {Weight = Weight, Idx = i}
      WeightSum = WeightSum + Weight
    end
  end
  WeightSum = math.ceil(WeightSum)
  for BuffId, WeightData in pairs(WeightList) do
    local RandomNumber = math.random(1, WeightSum)
    print(_G.LogTag, "LXZ GetBuffId", BuffId, WeightSum, RandomNumber)
    if RandomNumber <= WeightData.Weight then
      local Data = DataMgr.ParkourSkill[WeightData.Idx]
      local Time = 0
      if not IsStandAlone(self) then
        Time = Data.EffectBasic * (Data.EffectFactor * (Percent - AveragePercent) + Data.EffectConstatnce)
      else
        Time = Data.EffectBasic
      end
      return BuffId, Time, WeightData.Idx
    else
      WeightSum = math.ceil(WeightSum - WeightData.Weight)
    end
  end
end

function M:AddBuff(BuffId, TargetType, TriggerPlayer, Time)
  local GameState = UGameplayStatics.GetGameState(self)
  local Targets = {}
  if 1 == TargetType then
    local FirstEid = GameState.PartyPlayerOrdinal:GetRef(1)
    if FirstEid ~= TriggerPlayer.Eid then
      local TmpTarget = Battle(self):GetEntity(FirstEid)
      table.insert(Targets, TmpTarget)
    end
  elseif 2 == TargetType then
    for i, v in pairs(GameState.PartyPlayerOrdinal) do
      if v ~= TriggerPlayer.Eid then
        local TmpTarget = Battle(self):GetEntity(v)
        table.insert(Targets, TmpTarget)
      else
        break
      end
    end
  elseif 3 == TargetType then
    for i, v in pairs(GameState.PartyPlayerOrdinal) do
      if v ~= TriggerPlayer.Eid then
        local TmpTarget = Battle(self):GetEntity(v)
        table.insert(Targets, TmpTarget)
      end
    end
  else
    table.insert(Targets, TriggerPlayer)
  end
  for i, v in pairs(Targets) do
    Battle(self):AddBuffToTarget(TriggerPlayer, v, BuffId, Time, 0, nil, 1)
  end
  Battle(self):AddBuffToTarget(TriggerPlayer, TriggerPlayer, 5000209, self.BuffBlockTime, 0, nil, 1)
end

return M
