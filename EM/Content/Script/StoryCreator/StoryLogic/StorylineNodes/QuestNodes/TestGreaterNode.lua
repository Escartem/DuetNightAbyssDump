local TestGreaterNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function TestGreaterNode:Init()
  self.Delay = 0
  self.A = 0
  self.B = 0
end

function TestGreaterNode:Execute(Callback)
  ScreenPrint("\229\188\128\229\167\139\229\128\146\232\174\161\230\151\182:Delay:" .. tostring(self.Delay))
  self.ExecuteTimer = GWorld.GameInstance:AddTimer(self.Delay, function(...)
    local Result = self.A > self.B
    ScreenPrint("\232\174\161\230\151\182\231\187\147\230\157\159:A:" .. tostring(self.A) .. "\228\184\142B:" .. tostring(self.B) .. "\231\154\132\230\175\148\232\190\131\231\187\147\230\158\156\230\152\175:" .. tostring(Result))
    if Callback then
      Callback(Result)
    end
  end)
end

function TestGreaterNode:Clear()
  if self.ExecuteTimer then
    GWorld.GameInstance:RemoveTimer(self.ExecuteTimer)
    self.ExecuteTimer = nil
  end
end

function TestGreaterNode:OnQuestlineFinish()
end

function TestGreaterNode:OnQuestlineSuccess()
end

function TestGreaterNode:OnQuestlineFail()
end

return TestGreaterNode
