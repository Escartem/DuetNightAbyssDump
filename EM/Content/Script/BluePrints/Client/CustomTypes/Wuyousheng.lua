local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local Wuyousheng = Class("Wuyousheng", CustomTypes.CustomAttr)
Wuyousheng.__Props__ = {
  WuyoushengEventId = prop.prop("Int", "client save"),
  TotalStars = prop.prop("Int", "client save"),
  ProgressRewardsGot = prop.prop("Int2IntDict", "client save")
}

function Wuyousheng:Init(WuyoushengEventId)
  self.WuyoushengEventId = WuyoushengEventId
end

function Wuyousheng:AddTotalStars(Num)
  self.TotalStars = self.TotalStars + Num
end

function Wuyousheng:IsRewarded(RewardKey)
  return 1 == self.ProgressRewardsGot[RewardKey]
end

function Wuyousheng:IsCompleted(RewardKey, RequiredNum)
  return RequiredNum <= self.TotalStars
end

function Wuyousheng:SetRewardGot(RewardKey)
  self.ProgressRewardsGot[RewardKey] = 1
end

FormatProperties(Wuyousheng)
local WuyoushengDict = Class("WuyoushengDict", CustomTypes.CustomDict)
WuyoushengDict.KeyType = BaseTypes.Int
WuyoushengDict.ValueType = Wuyousheng

function WuyoushengDict:GetNewWuyousheng(WuyoushengEventId)
  if not self[WuyoushengEventId] then
    self[WuyoushengEventId] = self:NewWuyousheng(WuyoushengEventId)
  end
  return self[WuyoushengEventId]
end

function WuyoushengDict:GetWuyousheng(WuyoushengEventId)
  return self[WuyoushengEventId]
end

function WuyoushengDict:SetWuyousheng(WuyoushengEventId, Wuyousheng)
  self[WuyoushengEventId] = Wuyousheng
end

function WuyoushengDict:NewWuyousheng(WuyoushengEventId)
  return Wuyousheng(WuyoushengEventId)
end

return {Wuyousheng = Wuyousheng, WuyoushengDict = WuyoushengDict}
