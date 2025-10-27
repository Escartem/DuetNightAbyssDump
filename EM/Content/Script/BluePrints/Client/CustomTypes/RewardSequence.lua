local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local RewardSequence = Class("RewardSequence", CustomTypes.CustomAttr)
RewardSequence.__Props__ = {
  RewardId = prop.prop("Int", "save cross"),
  RewardIndex = prop.prop("Int", "save cross", 0),
  Rewards = prop.prop("IntList", "save cross"),
  RandomCount = prop.prop("Int", "save cross", 0)
}
FormatProperties(RewardSequence)
local SequenceDict = Class("SequenceDict", CustomTypes.CustomDict)
SequenceDict.KeyType = BaseTypes.Int
SequenceDict.ValueType = RewardSequence
local RewardSequenceAttr = Class("RewardSequenceAttr", CustomTypes.CustomAttr)
RewardSequenceAttr.__Props__ = {
  SequenceDict = prop.prop("SequenceDict", "save cross"),
  Seed = prop.prop("Int", "save cross", os.time() + os.clock() * math.random(1000, 9999))
}
FormatProperties(RewardSequenceAttr)
return {
  RewardSequence = RewardSequence,
  SequenceDict = SequenceDict,
  RewardSequenceAttr = RewardSequenceAttr
}
