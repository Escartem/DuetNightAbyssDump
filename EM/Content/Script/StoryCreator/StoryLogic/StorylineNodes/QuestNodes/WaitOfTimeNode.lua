local WaitOfTimeNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function WaitOfTimeNode:Init()
  self.WaitTime = 0
end

function WaitOfTimeNode:Execute(Callback)
  self.ExecuteTimer = GWorld.GameInstance:AddTimer(self.WaitTime, function()
    Callback()
    UIManager():FallbackAfterLoadingMgr()
  end, false)
end

function WaitOfTimeNode:Stop()
  self:Clear()
end

function WaitOfTimeNode:Clear()
  if self.ExecuteTimer then
    GWorld.GameInstance:RemoveTimer(self.ExecuteTimer)
    self.ExecuteTimer = nil
  end
end

return WaitOfTimeNode
