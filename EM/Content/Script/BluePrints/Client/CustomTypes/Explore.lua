local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local CommonConst = require("CommonConst")
local ExploreBaseAttr = Class("ExploreBaseAttr", CustomTypes.CustomAttr)
ExploreBaseAttr.__Props__ = {
  bGroupInLimit = prop.prop("Bool", "client save", false)
}
FormatProperties(ExploreBaseAttr)
local Explore = Class("Explore", CustomTypes.CustomAttr)
Explore.__Props__ = {
  RarelyId = prop.prop("Int", "client save"),
  ExploreState = prop.prop("Int", "client save", 0),
  ExploreData = prop.prop("ExploreBaseAttr", "client save"),
  RegionId = prop.prop("Int", "client save", 0),
  IsBonus = prop.prop("Bool", "client save", 0),
  RewardId = prop.getter("ExploreGroupReward", "RewardId"),
  IfOnlyOnce = prop.getter("ExploreGroupReward", "IfOnlyOnce")
}

function Explore:ExploreGroupReward()
  return DataMgr.ExploreGroupReward[self.RarelyId]
end

function Explore:Init(RarelyId, RegionId)
  self.RarelyId = RarelyId
  self.ExploreState = CommonConst.ExploreState.InActive
  self.RegionId = RegionId
end

function Explore:RestingState()
  if self.ExploreState == CommonConst.ExploreState.InActive then
    return
  end
  self.ExploreState = CommonConst.ExploreState.InActive
  self.ExploreData.bGroupInLimit = false
end

function Explore:SetActive()
  if self.ExploreState == CommonConst.ExploreState.Doing then
    return true
  end
  if not self:IsInActive() then
    return false
  end
  self.ExploreState = CommonConst.ExploreState.Doing
  return true
end

function Explore:SetChallageComplete()
  if self.ExploreState == CommonConst.ExploreState.ChallageComplete then
    return true
  end
  if not self:IsDoing() then
    return false
  end
  self.ExploreState = CommonConst.ExploreState.ChallageComplete
  return true
end

function Explore:SetSpecialActive()
  if self.ExploreState == CommonConst.ExploreState.SpecialActive then
    return true
  end
  if not self:IsDoing() then
    return false
  end
  self.ExploreState = CommonConst.ExploreState.SpecialActive
  return true
end

function Explore:IsCanComplete()
  return self:IsDoing() or self:IsChallageComplete() or self:IsSpecialActive()
end

function Explore:Complete()
  if self.ExploreState == CommonConst.ExploreState.Complete then
    return true
  end
  if not self:IsCanComplete() then
    return false
  end
  self.ExploreState = CommonConst.ExploreState.Complete
  return true
end

function Explore:GetState()
  return self.ExploreState
end

function Explore:IsInActive()
  return self.ExploreState == CommonConst.ExploreState.InActive
end

function Explore:IsDoing()
  return self.ExploreState == CommonConst.ExploreState.Doing
end

function Explore:IsChallageComplete()
  return self.ExploreState == CommonConst.ExploreState.ChallageComplete
end

function Explore:IsComplete()
  return self.ExploreState == CommonConst.ExploreState.Complete
end

function Explore:IsSpecialActive()
  return self.ExploreState == CommonConst.ExploreState.SpecialActive
end

function Explore:UpdateExploreData(data_key, data_value)
  if not data_key then
    return false
  end
  self.ExploreData[data_key] = data_value
  return true
end

FormatProperties(Explore)
local ExploreDict = Class("ExploreDict", CustomTypes.CustomDict)
ExploreDict.KeyType = BaseTypes.Int
ExploreDict.ValueType = Explore

function ExploreDict:NewExplore(RarelyId, SubRegionId)
  local Explore = Explore(RarelyId, SubRegionId)
  Explore:Init(RarelyId)
  Explore.RegionId = SubRegionId
  Explore.RarelyId = RarelyId
  return Explore
end

function ExploreDict:GetExplore(RarelyId)
  return self[RarelyId]
end

function ExploreDict:GetNewExplore(RarelyId, SubRegionId)
  if not self[RarelyId] then
    return self:NewExplore(RarelyId, SubRegionId)
  end
  return self[RarelyId]
end

function ExploreDict:UpdateExploreDataByExploreId(RarelyId, data_key, data_value)
  if not self[RarelyId] then
    return false
  end
  return self[RarelyId]:UpdateExploreData(data_key, data_value)
end

return {
  ExploreBaseAttr = ExploreBaseAttr,
  Explore = Explore,
  ExploreDict = ExploreDict
}
