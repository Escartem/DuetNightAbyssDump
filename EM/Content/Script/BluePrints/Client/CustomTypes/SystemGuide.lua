local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local SystemGuide = Class("SystemGuide", CustomTypes.CustomAttr)
SystemGuide.__Props__ = {
  SystemGuideId = prop.prop("Int", "client save"),
  PreSysGuideId = prop.getter("Data", "PreSysGuideId"),
  FinishQuestChain = prop.getter("Data", "FinishQuestChain"),
  FinishQuest = prop.getter("Data", "FinishQuest"),
  GuideEnd = prop.getter("Data", "GuideEnd"),
  State = prop.prop("Int", "client save", "0"),
  RewardId = prop.getter("Data", "RewardId")
}

function SystemGuide:Init(SystemGuideId)
  if not SystemGuideId then
    return
  end
  self.SystemGuideId = SystemGuideId
end

function SystemGuide:Data()
  return DataMgr.SystemGuide[self.SystemGuideId]
end

function SystemGuide:SetFinishState()
  self.State = CommonConst.SystemGuideState.Finished
end

function SystemGuide:IsFinished()
  if self.State == CommonConst.SystemGuideState.Finished then
    return true
  end
  return false
end

FormatProperties(SystemGuide)
local SystemGuideDict = Class("SystemGuideDict", CustomTypes.CustomDict)
SystemGuideDict.KeyType = BaseTypes.Int
SystemGuideDict.ValueType = SystemGuide

function SystemGuideDict:NewSystemGuide(SystemGuideId)
  return SystemGuide(SystemGuideId)
end

function SystemGuideDict:GetSystemGuide(SystemGuideId)
  if nil == self[SystemGuideId] then
    self[SystemGuideId] = self:NewSystemGuide(SystemGuideId)
  end
  return self[SystemGuideId]
end

return {SystemGuide = SystemGuide, SystemGuideDict = SystemGuideDict}
