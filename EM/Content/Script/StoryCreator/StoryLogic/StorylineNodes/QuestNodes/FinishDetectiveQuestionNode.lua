local FinishDetectiveQuestionNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")
local ReasoningUtils = require("BluePrints.UI.WBP.DetectiveMinigame.ReasoningUtils")

function FinishDetectiveQuestionNode:Init()
  self.QuestionIds = {}
end

function FinishDetectiveQuestionNode:Execute()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    for _, Id in pairs(self.QuestionIds) do
      local Answers = {}
      Avatar:DetectiveQuestionUnlockQuestion(Id, true)
      local NeededAnswers = ReasoningUtils:GetCommitFirstAnswers(Id)
      if NeededAnswers and #NeededAnswers > 0 then
        for _, AnswerId in pairs(NeededAnswers) do
          Avatar:DetectiveQuestionUnlockAnswer(AnswerId)
          table.insert(Answers, AnswerId)
        end
        Avatar:DetectiveQuestionCommit(Id, Answers)
        DebugPrint("FinishDetectiveQuestionNode QuestionId: " .. Id)
      end
      EventManager:FireEvent(EventID.OnNewDetectiveQuestion, Id, true)
    end
  end
end

return FinishDetectiveQuestionNode
