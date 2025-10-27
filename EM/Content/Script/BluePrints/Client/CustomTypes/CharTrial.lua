local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local CharTrial = Class("CharTrial", CustomTypes.CustomAttr)
CharTrial.__Props__ = {
  TrialId = prop.prop("Int", "client save"),
  bFinished = prop.prop("Int", "client save", 0),
  bGetReward = prop.prop("Int", "client save", 0)
}

function CharTrial:Init(TrialId)
  if not TrialId then
    return
  end
  self.TrialId = TrialId
end

function CharTrial:IsFinished()
  return 1 == self.bFinished
end

function CharTrial:SetFinished()
  if 1 == self.bFinished then
    return
  end
  self.bFinished = 1
end

function CharTrial:IsGetReward()
  return 1 == self.bGetReward
end

function CharTrial:SetGetReward()
  if 1 == self.bGetReward then
    return
  end
  self.bGetReward = 1
end

FormatProperties(CharTrial)
local CharTrialDict = Class("CharTrialDict", CustomTypes.CustomDict)
CharTrialDict.KeyType = BaseTypes.Int
CharTrialDict.ValueType = CharTrial

function CharTrialDict:GetOrInit(EventId)
  if not self[EventId] then
    self[EventId] = CharTrial(EventId)
  end
  return self[EventId]
end

return {CharTrial = CharTrial, CharTrialDict = CharTrialDict}
