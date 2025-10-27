local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local TargetCounter = Class("TargetCounter", CustomTypes.CustomAttr)
TargetCounter.__Props__ = {
  UniqueID = prop.prop("Int", "client save"),
  TargetIds = prop.prop("Int2IntDict", "client save", {}),
  Target = prop.prop("Int", "client save", 0),
  Progress = prop.prop("Int", "client save", 0),
  FinishTime = prop.prop("Int", "client save"),
  RewardsGot = prop.prop("Bool", "client save", false),
  CompletionValue = prop.prop("Int", "client save"),
  NoRepeatField = prop.prop("Str", "save"),
  TargetRecords = prop.prop("Str2IntDict", "client save")
}

function TargetCounter:Reset()
  self.Progress = 0
  self.RewardsGot = false
  self.TargetRecords = {}
end

function TargetCounter:Init(UniqueID, ExcelConf)
  self.UniqueID = UniqueID
  for _, TargetId in pairs(ExcelConf.TargetId) do
    self.TargetIds[TargetId] = 0
  end
  self.Target = ExcelConf.Target
  self.CompletionValue = ExcelConf.CompletionValue
  self.NoRepeatField = ExcelConf.NoRepeatField
end

function TargetCounter:GetUniqueID()
  return self.UniqueID
end

function TargetCounter:IsComplete()
  return self.Progress >= self.Target
end

function TargetCounter:IndividualRule(TargetId, Count)
  local Target = DataMgr.Target[TargetId]
  if not Target then
    DebugPrint("TargetCounter:IndividualRule TargetId not exist", TargetId)
    return false
  end
  local rule = Target.IndividualRule
  if "greater" == rule and Count >= self.CompletionValue then
    return true
  elseif "less" == rule and Count <= self.CompletionValue then
    return true
  end
  return false
end

function TargetCounter:TargetRefreshProgress(TargetId, UniqueAttr, Count)
  if self:IsComplete() then
    return
  end
  if not self.TargetIds[TargetId] then
    return
  end
  if self.CompletionValue and self:IndividualRule(TargetId, Count) then
    Count = 1
  end
  if self.NoRepeatField and self.NoRepeatField ~= "" then
    UniqueAttr = tostring(UniqueAttr)
    if not UniqueAttr then
      return
    end
    if self.TargetRecords[UniqueAttr] then
      return
    end
    self.TargetRecords[UniqueAttr] = TimeUtils.NowTime()
  end
  self.Progress = math.min(self.Progress + Count, self.Target)
end

function TargetCounter:CanRecvReward()
  return not self.RewardsGot
end

function TargetCounter:GetCurrentCount(ConditionId)
  return self.Progress
end

FormatProperties(TargetCounter)
local TargetCounterDict = Class("TargetCounterDict", CustomTypes.CustomDict)
TargetCounterDict.KeyType = BaseTypes.Int
TargetCounterDict.ValueType = TargetCounter

function TargetCounterDict:NewTargetCounter(UniqueID, ExcelConf)
  self[UniqueID] = TargetCounter(UniqueID, ExcelConf)
  return self[UniqueID]
end

return {TargetCounter = TargetCounter, TargetCounterDict = TargetCounterDict}
