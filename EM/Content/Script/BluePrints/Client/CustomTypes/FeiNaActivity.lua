local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local FeiNa = Class("FeiNa", CustomTypes.CustomAttr)
FeiNa.__Props__ = {
  FeiNaId = prop.prop("Int", "client save"),
  CurrentProgress = prop.prop("Int", "client save"),
  MaxProgress = prop.prop("Int", "client save"),
  RewardsGot = prop.prop("Int2IntDict", "client save"),
  StartTime = prop.getter("Data", "StartTime"),
  Reward = prop.getter("Data", "Reward"),
  Level = prop.getter("Data", "Level")
}

function FeiNa:Init(FeiNaId)
  self.FeiNaId = FeiNaId
  self:InitRewardsGot()
end

function FeiNa:InitRewardsGot()
  for Index, _ in ipairs(self.Level) do
    if not self.RewardsGot[Index] then
      self.RewardsGot[Index] = CommonConst.FeiNaState.Doing
    end
  end
end

function FeiNa:SetProgrssRewardsGot(Index, NewState)
  self.RewardsGot[Index] = NewState
end

function FeiNa:SetRewardStateByProgress(NewProgress)
  for Index, Progress in ipairs(self.Level) do
    if Progress <= NewProgress and self:IsDoing(Index) then
      self:SetProgrssRewardsGot(Index, CommonConst.FeiNaState.Complete)
    end
  end
end

function FeiNa:SetCurrentProgress(NewProgress)
  if NewProgress <= 0 then
    return
  end
  self.CurrentProgress = NewProgress
  self:SetRewardStateByProgress(NewProgress)
  self:SetMaxProgress(NewProgress)
end

function FeiNa:IsComplete(Index)
  if self.RewardsGot[Index] == nil then
    return false
  end
  return CommonConst.FeiNaState.Complete == self.RewardsGot[Index]
end

function FeiNa:IsDoing(Index)
  if self.RewardsGot[Index] == nil then
    return false
  end
  return CommonConst.FeiNaState.Doing == self.RewardsGot[Index]
end

function FeiNa:GetCurrentProgress()
  return self.CurrentProgress
end

function FeiNa:Data()
  return DataMgr.FeinaEventDungeon[self.FeiNaId]
end

function FeiNa:GetMaxProgress()
  return self.MaxProgress
end

function FeiNa:GetCurrentProgressReward(Index)
  if self.RewardsGot[Index] == nil then
    return false
  end
  return self.RewardsGot[Index]
end

function FeiNa:SetMaxProgress(MaxProgress)
  if MaxProgress > self.MaxProgress then
    self.MaxProgress = MaxProgress
  end
end

FormatProperties(FeiNa)
local FeiNaDict = Class("FeiNaDict", CustomTypes.CustomDict)
FeiNaDict.KeyType = BaseTypes.Int
FeiNaDict.ValueType = FeiNa

function FeiNaDict:GetFeiNa(FeiNaId)
  return self[FeiNaId]
end

function FeiNaDict:NewFeiNa(FeiNaId)
  return FeiNa(FeiNaId)
end

function FeiNaDict:GetNewFeiNa(FeiNaId)
  if not self:GetFeiNa() then
    self[FeiNaId] = self:NewFeiNa(FeiNaId)
  end
  return self[FeiNaId]
end

return {FeiNa = FeiNa, FeiNaDict = FeiNaDict}
