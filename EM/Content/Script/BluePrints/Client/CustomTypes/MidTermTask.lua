local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local MidTermTask = Class("MidTermTask", CustomTypes.CustomAttr)
MidTermTask.__Props__ = {
  MidTermTaskId = prop.prop("Int", "client save"),
  FinishCount = prop.prop("Int", "client save", 0),
  EnableDay = prop.getter("Data", "EnableDay"),
  TaskType = prop.getter("Data", "TaskType")
}

function MidTermTask:Data()
  return DataMgr.MidTermTask[self.MidTermTaskId]
end

function MidTermTask:Init(MidTermTaskId)
  self.MidTermTaskId = MidTermTaskId
  self.FinishCount = 0
end

function MidTermTask:GetMidTermTaskId()
  return self.MidTermTaskId
end

function MidTermTask:Reset()
  self.FinishCount = 0
end

function MidTermTask:AddCount(Count)
  Count = Count or 1
  self.FinishCount = self.FinishCount + Count
end

FormatProperties(MidTermTask)
local MidTermTaskDict = Class("MidTermTaskDict", CustomTypes.CustomDict)
MidTermTaskDict.KeyType = BaseTypes.Int
MidTermTaskDict.ValueType = MidTermTask

function MidTermTaskDict:GetNewMidTermTask(MidTermTaskId)
  if not self[MidTermTaskId] then
    self[MidTermTaskId] = self:NewMidTermTask(MidTermTaskId)
  end
  return self[MidTermTaskId]
end

function MidTermTaskDict:GetMidTermTask(MidTermTaskId)
  return self[MidTermTaskId]
end

function MidTermTaskDict:SetMidTermTask(MidTermTaskId, TaskRecord)
  self[MidTermTaskId] = TaskRecord
end

function MidTermTaskDict:NewMidTermTask(MidTermTaskId)
  return MidTermTask(MidTermTaskId)
end

return {MidTermTask = MidTermTask, MidTermTaskDict = MidTermTaskDict}
