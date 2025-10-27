local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local RewardUtils = require("Utils.RewardUtils")
local LevelSequenceState = Class("LevelSequenceState", CustomTypes.CustomAttr)
LevelSequenceState.__Props__ = {
  RegionId = prop.prop("Int", "client save"),
  RecorderId = prop.prop("Int", "client save"),
  SequenceState = prop.prop("Int", "client save"),
  PlayState = prop.prop("Int", "client save")
}

function LevelSequenceState:Init(RegionId, RecorderId)
  self.RegionId = RegionId
  self.RecorderId = RecorderId
end

FormatProperties(LevelSequenceState)
local LevelSequenceStateDict = Class("LevelSequenceStateDict", CustomTypes.CustomDict)
LevelSequenceStateDict.KeyType = BaseTypes.Int
LevelSequenceStateDict.ValueType = LevelSequenceState

function LevelSequenceStateDict:Add(RegionId, RecorderId)
  local UniqueId = CommonUtils.MathConcat(RegionId, RecorderId)
  self[UniqueId] = LevelSequenceState(RegionId, RecorderId)
  return self[UniqueId]
end

function LevelSequenceStateDict:Query(RegionId, RecorderId)
  local UniqueId = CommonUtils.MathConcat(RegionId, RecorderId)
  return self[UniqueId]
end

return {LevelSequenceState = LevelSequenceState, LevelSequenceStateDict = LevelSequenceStateDict}
