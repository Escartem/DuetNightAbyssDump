local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local TargetCounter = require("BluePrints.Client.CustomTypes.TargetCounter")
local CommonQuestDict = Class("CommonQuestDict", CustomTypes.CustomDict)
CommonQuestDict.KeyType = BaseTypes.Int
CommonQuestDict.ValueType = TargetCounter.TargetCounterDict

function CommonQuestDict:NewCommonQuests()
  return TargetCounter.TargetCounterDict()
end

function CommonQuestDict:GetNewCommonQuests(EventId)
  if not self[EventId] then
    self[EventId] = self:NewCommonQuests()
  end
  return self[EventId]
end

function CommonQuestDict:GetCommonQuests(EventId)
  return self[EventId]
end

function CommonQuestDict:SetCommonQuests(EventId, CommonQuests)
  self[EventId] = CommonQuests
end

return {CommonQuestDict = CommonQuestDict}
