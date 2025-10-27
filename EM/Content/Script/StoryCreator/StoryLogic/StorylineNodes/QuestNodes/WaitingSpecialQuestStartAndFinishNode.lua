local WaitingSpecialQuestStartAndFinishNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")
local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")

function WaitingSpecialQuestStartAndFinishNode:Init()
  self.SpecialConfigId = nil
  self.BlackScreenImmediately = nil
end

function WaitingSpecialQuestStartAndFinishNode:Execute(Callback)
  if ClientEventUtils then
    ClientEventUtils:StartSpecialQuestEvent(self.SpecialConfigId, self.BlackScreenImmediately, self.Context.QuestChainId, Callback)
  end
end

function WaitingSpecialQuestStartAndFinishNode:Clear()
  if ClientEventUtils then
    ClientEventUtils:CheckWhenNodeClear(self.SpecialConfigId)
  end
end

return WaitingSpecialQuestStartAndFinishNode
