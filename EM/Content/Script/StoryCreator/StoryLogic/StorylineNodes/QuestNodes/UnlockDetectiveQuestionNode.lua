local UnlockDetectiveQuestionNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function UnlockDetectiveQuestionNode:Init()
  self.QuestionIds = {}
  self.OpenToast = true
end

function UnlockDetectiveQuestionNode:Execute()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    for _, Id in pairs(self.QuestionIds) do
      Avatar:DetectiveQuestionUnlockQuestion(Id, not self.OpenToast)
      DebugPrint("UnlockDetectiveQuestionNode QuestionId: " .. Id)
    end
  end
end

return UnlockDetectiveQuestionNode
