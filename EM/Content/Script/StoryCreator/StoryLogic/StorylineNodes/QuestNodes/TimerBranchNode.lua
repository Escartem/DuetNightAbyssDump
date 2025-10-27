local M = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")
local TimeUtils = require("Utils.TimeUtils")

function M:Init()
  self.TickInterval = 0.2
  self.LastTime = 0
end

function M:Start(QuestLine, InportName)
  self:Execute(function(ReturnValue)
    self:Finish(ReturnValue)
  end)
end

function M:Execute(Callback)
  self.StartTime = UE4.UGameplayStatics.GetTimeSeconds(GWorld.GameInstance)
  self.Callback = Callback
end

function M:StopRecord()
  if self.IsStopRecord then
    return
  end
  self.IsStopRecord = true
  local PortNameArray = {}
  local LastTime = UE4.UGameplayStatics.GetTimeSeconds(GWorld.GameInstance) - self.StartTime
  for Index, Range in pairs(self.TimerRange) do
    if LastTime >= Range.StartTime and (-1 == Range.EndTime or LastTime < Range.EndTime) then
      table.insert(PortNameArray, "TimerRange_" .. Index)
    end
  end
  if self.Callback then
    self.Callback(PortNameArray)
  end
end

function M:Clear()
  if self.ExecuteTimer then
    GWorld.GameInstance:RemoveTimer(self.ExecuteTimer)
    self.ExecuteTimer = nil
  end
end

function M:Stop()
  self:StopRecord()
  self:Clear()
end

return M
