local GameModeRewardParseComponent = {}

function GameModeRewardParseComponent:ParseReward(UnitId, RewardReason, ExtraInfo)
  local func = self["ParseReward_" .. RewardReason]
  assert(func, string.format("ParseReward cannot find function for RewardReason: %s", RewardReason))
  return func(self, UnitId, ExtraInfo)
end

function GameModeRewardParseComponent:ParseReward_Chest(UnitId, ExtraInfo)
  return self:MechanismReward(UnitId, ExtraInfo)
end

function GameModeRewardParseComponent:MechanismReward(UnitId, ExtraInfo)
  local MechanismInfo = DataMgr.Mechanism[UnitId]
  if not MechanismInfo then
    return false
  end
  local RewardId = MechanismInfo.RewardId
  local UnitParams = MechanismInfo.UnitParams
  if ExtraInfo.bRare and UnitParams then
    local RareRewardId = UnitParams.RareRewardId
    if RareRewardId then
      RewardId = RareRewardId
    end
  end
  return true, {RewardId}
end

function GameModeRewardParseComponent:ParseReward_BreakableItem(UnitId, ExtraInfo)
  return self:MechanismReward(UnitId, ExtraInfo)
end

function GameModeRewardParseComponent:ParseReward_MonsterDead(UnitId)
  local MonsterInfo = DataMgr.Monster[UnitId]
  if not MonsterInfo then
    return false
  end
  local RewardId = MonsterInfo.RewardId
  return true, {RewardId}
end

function GameModeRewardParseComponent:ParseReward_PickUp(UnitId)
  local DropInfo = DataMgr.Drop[UnitId]
  if not DropInfo then
    return false
  end
  local UseEffect = DropInfo.UseEffectType
  if not UseEffect then
    return false
  end
  return true, {}
end

function GameModeRewardParseComponent:ParseReward_Repeated(UnitId, ExtraInfo)
  return self:MechanismReward(UnitId, ExtraInfo)
end

return GameModeRewardParseComponent
