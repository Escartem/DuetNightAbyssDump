local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local PartyTopic = Class("PartyTopic", CustomTypes.CustomAttr)
PartyTopic.__Props__ = {
  PartyTopicId = prop.prop("Int", "client save"),
  State = prop.prop("Int", "client save", 0),
  ConditionId = prop.getter("Data", "ConditionId"),
  PartyTopicConsume = prop.getter("Data", "PartyTopicConsume"),
  PartyTopicReward = prop.getter("Data", "PartyTopicReward")
}

function PartyTopic:Init(PartyTopicId)
  if not PartyTopicId then
    return
  end
  self.PartyTopicId = PartyTopicId
end

function PartyTopic:Data()
  return DataMgr.PartyTopic[self.PartyTopicId]
end

function PartyTopic:IsLocked()
  return 0 == self.State
end

function PartyTopic:IsUnLock()
  return 1 == self.State
end

function PartyTopic:IsCompleted()
  return 2 == self.State
end

function PartyTopic:UnLock()
  if self:IsLocked() then
    self.State = 1
  end
end

function PartyTopic:Complete()
  if self:IsUnLock() then
    self.State = 2
  end
end

FormatProperties(PartyTopic)
local PartyTopicList = Class("PartyTopicList", CustomTypes.CustomList)
PartyTopicList.ValueType = PartyTopic

function PartyTopicList:NewPartyTopic(PartyTopicId)
  local _PartyTopic = PartyTopic(PartyTopicId)
  return _PartyTopic
end

return {PartyTopic = PartyTopic, PartyTopicList = PartyTopicList}
