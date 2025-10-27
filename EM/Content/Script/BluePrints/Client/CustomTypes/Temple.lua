local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local Temple = Class("Temple", CustomTypes.CustomAttr)
Temple.__Props__ = {
  TempleEventId = prop.prop("Int", "client save"),
  FinishStars = prop.prop("Int2IntDict", "client save"),
  ProgressRewardsGot = prop.prop("Int2IntDict", "client save")
}

function Temple:Init(TempleEventId)
  self.TempleEventId = TempleEventId
end

function Temple:GetFinishStars(TempleLevelId)
  return self.FinishStars[TempleLevelId] or 0
end

function Temple:SetFinishStars(TempleLevelId, Stars)
  self.FinishStars[TempleLevelId] = Stars
end

function Temple:GetTotalStarsWithHardMode(IsHard)
  local Total = 0
  for Id, n in pairs(self.FinishStars) do
    local TempleLevelConf = DataMgr.TempleEventLevel[Id]
    if TempleLevelConf then
      local IsHardMode = TempleLevelConf.IsHardMode or false
      if IsHardMode == IsHard then
        Total = Total + n
      end
    end
  end
  return Total
end

function Temple:GetTotalStars()
  local Total = 0
  for Id, n in pairs(self.FinishStars) do
    local TempleLevelConf = DataMgr.TempleEventLevel[Id]
    if TempleLevelConf then
      Total = Total + n
    end
  end
  return Total
end

function Temple:SetTempleRewardsGot(TempleRewardId)
  self.ProgressRewardsGot[TempleRewardId] = 2
end

function Temple:SetTempleRewardsCompleted(TempleRewardId)
  self.ProgressRewardsGot[TempleRewardId] = 1
end

function Temple:IsTempleRewarded(TempleRewardId)
  local ret = self.ProgressRewardsGot[TempleRewardId]
  if 2 == ret then
    return true
  end
  return false
end

function Temple:GetTempleRewardsGot(TempleRewardId)
  return self.ProgressRewardsGot[TempleRewardId] or 0
end

FormatProperties(Temple)
local TempleDict = Class("TempleDict", CustomTypes.CustomDict)
TempleDict.KeyType = BaseTypes.Int
TempleDict.ValueType = Temple

function TempleDict:GetNewTemple(TempleEventId)
  if not self[TempleEventId] then
    self[TempleEventId] = self:NewTemple(TempleEventId)
  end
  return self[TempleEventId]
end

function TempleDict:GetTemple(TempleEventId)
  return self[TempleEventId]
end

function TempleDict:SetTemple(TempleEventId, Temple)
  self[TempleEventId] = Temple
end

function TempleDict:NewTemple(TempleEventId)
  return Temple(TempleEventId)
end

return {Temple = Temple, TempleDict = TempleDict}
