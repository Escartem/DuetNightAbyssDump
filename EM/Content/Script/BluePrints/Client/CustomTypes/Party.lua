local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local Party = Class("Party", CustomTypes.CustomAttr)
Party.__Props__ = {
  PartyId = prop.prop("Int", "client save"),
  Level = prop.prop("Int", "client save", 1),
  MaxLevel = prop.prop("Int", "client save"),
  PartyTopics = prop.prop("PartyTopic.PartyTopicList", "client save"),
  PartyTopicList = prop.getter("Data", "PartyTopicList")
}

function Party:Init(PartyId, Level)
  self.PartyId = PartyId
  self.Level = Level or 1
  self:InitPartyTopics()
end

function Party:InitPartyTopics()
  self.MaxLevel = #self.PartyTopicList or 1
  for index, PartyTopicId in pairs(self.PartyTopicList) do
    local PartyTopic = self.PartyTopics:NewPartyTopic(PartyTopicId)
    self.PartyTopics:Append(PartyTopic)
  end
end

function Party:Data()
  return DataMgr.PartyNpc[self.PartyId]
end

function Party:IsMaxLevel()
  if self.Level == self.MaxLevel then
    return true
  end
  return false
end

function Party:UpLevel()
  if self:IsMaxLevel() then
    return
  end
  self.Level = self.Level + 1
end

FormatProperties(Party)
local PartyDict = Class("PartyDict", CustomTypes.CustomDict)
PartyDict.KeyType = BaseTypes.Int
PartyDict.ValueType = Party

function PartyDict:NewParty(PartyId, Level)
  return Party(PartyId, Level)
end

function PartyDict:GetParty(PartyId)
  if not self[PartyId] then
    return self:NewParty(PartyId, 1)
  end
  return self[PartyId]
end

return {Party = Party, PartyDict = PartyDict}
