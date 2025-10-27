local DynamicQuestSuccessNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function DynamicQuestSuccessNode:Execute(Callback)
  local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")
  local CurrentEvent = ClientEventUtils:GetCurrentDoingDynamicEvent()
  assert(CurrentEvent, "\229\174\162\230\136\183\231\171\175\228\184\141\229\173\152\229\156\168\229\138\168\230\128\129\228\187\187\229\138\161")
  
  local function CompositeCallback()
    if self.UseTalkFadeOut and self.TalkFadeOutTime then
      local TalkContext = GWorld.GameInstance:GetTalkContext()
      if TalkContext then
        local TalkBlackUI = TalkContext:GetSimpleBlackUI()
        if TalkBlackUI then
          TalkBlackUI:FadeOut(self.TalkFadeOutTime)
        end
      end
    end
    if Callback then
      Callback()
    end
  end
  
  CurrentEvent:TryFinishEvent(true, CompositeCallback, self.NodeId, self.DialogueId)
end

return DynamicQuestSuccessNode
