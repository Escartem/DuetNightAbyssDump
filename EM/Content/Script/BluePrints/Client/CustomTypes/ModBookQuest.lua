local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local ModBookQuest = Class("ModBookQuest", CustomTypes.CustomAttr)
ModBookQuest.__Props__ = {
  UniqueID = prop.prop("Int", "client save"),
  Status = prop.prop("Int", "client save", 0),
  FinishedTargets = prop.prop("Int2IntDict", "client save"),
  Progress = prop.prop("Int", "client save", 0),
  FinishTime = prop.prop("Int", "client save"),
  RewardsGot = prop.prop("Bool", "client save", false),
  UniqueRecords = prop.prop("Str2IntDict", "client save"),
  TargetIds = prop.getter("Data", "TargetId"),
  TargetNeedCount = prop.getter("Data", "Target"),
  TaskReward = prop.getter("Data", "TaskReward"),
  ConditionId = prop.getter("Data", "ConditionId"),
  NoRepeatField = prop.getter("Data", "NoRepeatField"),
  CompletionValue = prop.getter("Data", "CompletionValue"),
  QuestPhaseId = prop.getter("Data", "QuestPhaseId")
}

function ModBookQuest:Init(UniqueID)
  self.UniqueID = UniqueID
end

function ModBookQuest:Data()
  return DataMgr.ModGuideBookTask[self.UniqueID]
end

function ModBookQuest:IsLock()
  return 0 == self.Status
end

function ModBookQuest:IsUnlock()
  return 1 == self.Status
end

function ModBookQuest:Unlock()
  if not self:IsUnlock() then
    self.Status = 1
  end
end

function ModBookQuest:Reset()
  self.FinishedTargets = {}
  self.Progress = 0
  self.FinishTime = 0
  self.RewardsGot = false
  self.UniqueRecords = {}
end

function ModBookQuest:GetUniqueID()
  return self.UniqueID
end

function ModBookQuest:IsComplete()
  return self.Progress >= self.TargetNeedCount
end

function ModBookQuest:IndividualRule(TargetId, Count)
  local Target = DataMgr.Target[TargetId]
  local rule = Target.IndividualRule
  if rule and self.CompletionValue then
    if "greater" == rule and Count >= self.CompletionValue then
      return true
    elseif "less" == rule and Count <= self.CompletionValue then
      return true
    end
  end
  return false
end

function ModBookQuest:TargetRefreshProgress(TargetId, UniqueAttr, Count)
  if self:IsComplete() then
    return
  end
  if not CommonUtils.HasValue(self.TargetIds, TargetId) then
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
    if self.UniqueRecords[UniqueAttr] then
      return
    end
    self.UniqueRecords[UniqueAttr] = TimeUtils.NowTime()
  end
  for _, Tid in ipairs(self.TargetIds) do
    if Tid == TargetId then
      self.FinishedTargets:SetDefault(Tid, 0)
      self.FinishedTargets[Tid] = self.FinishedTargets[Tid] + Count
      break
    end
  end
  self.Progress = self.Progress + Count
  if self:IsComplete() then
    self.FinishTime = TimeUtils.NowTime()
  end
end

function ModBookQuest:CanRecvReward()
  return not self.RewardsGot
end

function ModBookQuest:HasRecvReward()
  return self.RewardsGot
end

function ModBookQuest:RecvReward()
  self.RewardsGot = true
end

function ModBookQuest:GetCurrentCount(ConditionId)
  return self.Progress
end

FormatProperties(ModBookQuest)
local ModBookQuestDict = Class("ModBookQuestDict", CustomTypes.CustomDict)
ModBookQuestDict.KeyType = BaseTypes.Int
ModBookQuestDict.ValueType = ModBookQuest

function ModBookQuestDict:NewModBookQuest(UniqueID)
  self[UniqueID] = ModBookQuest(UniqueID)
  return self[UniqueID]
end

function ModBookQuestDict:GetModBookQuest(UniqueID)
  if not self[UniqueID] then
    self[UniqueID] = ModBookQuest(UniqueID)
  end
  return self[UniqueID]
end

return {ModBookQuest = ModBookQuest, ModBookQuestDict = ModBookQuestDict}
