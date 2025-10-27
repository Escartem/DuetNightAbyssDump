local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local RewardParams = Class("RewardParams", CustomTypes.CustomAttr)
RewardParams.__Props__ = {
  RewardSequences = prop.prop("RewardSequence.RewardSequenceAttr", "save cross"),
  OnceReward = prop.prop("Int2IntDict", "save cross"),
  BonusRate = prop.prop("Int", "cross", 0),
  BonusRateTag = prop.prop("Str2IntDict", "cross save"),
  ExpRate = prop.prop("Int", "cross", 0),
  ExpRateTag = prop.prop("Str2IntDict", "cross save")
}
FormatProperties(RewardParams)
return {RewardParams = RewardParams}
