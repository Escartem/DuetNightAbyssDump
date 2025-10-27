local BaseAsynQuestNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function BaseAsynQuestNode:Start(Context, InPortName)
  self.InPortName = InPortName
  self:Execute(function(ReturnValue)
    self:Finish(nil ~= ReturnValue and tostring(ReturnValue) or nil)
  end)
end

function BaseAsynQuestNode:Init()
end

function BaseAsynQuestNode:Execute(Callback)
end

function BaseAsynQuestNode:Stop()
  self:Clear()
end

function BaseAsynQuestNode:Clear()
end

function BaseAsynQuestNode:OnQuestlineFinish()
end

function BaseAsynQuestNode:OnQuestlineSuccess()
end

function BaseAsynQuestNode:OnQuestlineFail()
end

return BaseAsynQuestNode
