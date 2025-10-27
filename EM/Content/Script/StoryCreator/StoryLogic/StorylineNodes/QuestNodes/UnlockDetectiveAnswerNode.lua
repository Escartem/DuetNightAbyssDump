local UnlockDetectiveAnswerNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function UnlockDetectiveAnswerNode:Init()
  self.AnswerIds = {}
end

function UnlockDetectiveAnswerNode:Execute()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    for _, Id in pairs(self.AnswerIds) do
      Avatar:DetectiveQuestionUnlockAnswer(Id)
      DebugPrint("UnlockDetectiveAnswerNode AnswerId: " .. Id)
    end
  end
end

return UnlockDetectiveAnswerNode
