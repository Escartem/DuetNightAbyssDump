require("UnLua")
local TalkTaskFactory = require("BluePrints.Story.Talk.Controller.TalkTaskFactory")
local TalkTaskDataProcesser = {}

function TalkTaskDataProcesser.New()
  local TalkTaskDataComponent = setmetatable({}, {__index = TalkTaskDataProcesser})
  TalkTaskDataComponent:Initialize()
  return TalkTaskDataComponent
end

function TalkTaskDataProcesser:Initialize()
  self.DataKey = 0
end

function TalkTaskDataProcesser:GenerateDataKey()
  self.DataKey = self.DataKey + 1
  return self.DataKey
end

function TalkTaskDataProcesser:Clear()
end

function TalkTaskDataProcesser:ProcessRawTalkData(RawData)
  if not RawData and not RawData.Key then
    RawData.Key = self:GenerateDataKey()
  end
  local Task, TaskData = TalkTaskFactory:CreateTalkTask(RawData)
  TaskData.TalkTriggerId = RawData.TalkTriggerId
  TaskData.Key = RawData.Key
  return Task, TaskData
end

return TalkTaskDataProcesser
