local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local CommonConst = require("CommonConst")
local DailyTask = Class("DailyTask", CustomTypes.CustomAttr)
DailyTask.__Props__ = {
  DailyGoalTaskId = prop.prop("Int", "client save"),
  State = prop.prop("Int", "client save", 1),
  QuestReward = prop.getter("Data", "QuestReward"),
  TargetListId = prop.getter("Data", "TargetId"),
  CompletionValue = prop.getter("Data", "CompletionValue")
}

function DailyTask:Data()
  return DataMgr.DailyGoalTask[self.DailyGoalTaskId]
end

function DailyTask:Init(DailyTaskId)
  self.DailyGoalTaskId = DailyTaskId
  self.State = CommonConst.DailyTaskState.Doing
end

function DailyTask:GetDailyGoalTaskId()
  return self.DailyGoalTaskId
end

function DailyTask:GetState()
  return self.State
end

function DailyTask:Resting()
  self.State = CommonConst.DailyTaskState.Doing
end

function DailyTask:SetState_Complete()
  if not self:IsDoing() then
    return false
  end
  self.State = CommonConst.DailyTaskState.Complete
  return true
end

function DailyTask:SetState_GetReward()
  self.State = CommonConst.DailyTaskState.GetReward
end

function DailyTask:IsDoing()
  return self.State == CommonConst.DailyTaskState.Doing
end

function DailyTask:IsComplete()
  return self.State == CommonConst.DailyTaskState.Complete
end

function DailyTask:IsGetReward()
  return self.State == CommonConst.DailyTaskState.GetReward
end

FormatProperties(DailyTask)
local DailyTaskDict = Class("DailyTaskDict", CustomTypes.CustomDict)
DailyTaskDict.KeyType = BaseTypes.Int
DailyTaskDict.ValueType = DailyTask

function DailyTaskDict:GetNewDailyTask(DailyTaskId)
  if not self[DailyTaskId] then
    self[DailyTaskId] = self:NewDailyTask(DailyTaskId)
  end
  return self[DailyTaskId]
end

function DailyTaskDict:GetDailyTask(DailyTaskId)
  return self[DailyTaskId]
end

function DailyTaskDict:NewDailyTask(DailyTaskId)
  return DailyTask(DailyTaskId)
end

return {DailyTask = DailyTask, DailyTaskDict = DailyTaskDict}
