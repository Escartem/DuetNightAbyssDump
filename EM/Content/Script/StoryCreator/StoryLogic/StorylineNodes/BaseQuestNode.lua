local BaseQuestNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function BaseQuestNode:Start()
  local ReturnValue = self:Execute()
  self:Finish(nil ~= ReturnValue and tostring(ReturnValue) or nil)
end

function BaseQuestNode:Init()
end

function BaseQuestNode:Execute(Callback)
end

function BaseQuestNode:Clear()
end

function BaseQuestNode:OnQuestlineFinish()
end

function BaseQuestNode:OnQuestlineSuccess()
end

function BaseQuestNode:OnQuestlineFail()
end

return BaseQuestNode
