local SpecialQuestSuccessNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")
local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")

function SpecialQuestSuccessNode:Execute(Callback)
  local CurrentEvent = ClientEventUtils:GetCurrentEvent()
  if not CurrentEvent or CurrentEvent.Type ~= "SpecialQuest" then
    local Message = "\229\174\162\230\136\183\231\171\175\228\184\141\229\173\152\229\156\168\231\137\185\230\174\138\228\187\187\229\138\161" .. [[

FileName:]] .. self.Context.FileName .. [[

NodeInfo:]] .. self:ToString()
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\174\162\230\136\183\231\171\175\228\184\141\229\173\152\229\156\168\231\137\185\230\174\138\228\187\187\229\138\161", Message)
  end
  DebugPrint("gyy@SpecialQuestSuccess,ExecuteSpecialQuestSuccessNode ", CurrentEvent.SpecialQuestId)
  
  local function FinishNodeCallback()
    Callback()
  end
  
  CurrentEvent:AddSuccessNodeCallback(self, FinishNodeCallback)
  CurrentEvent:TryFinishEvent("SuccessNode")
end

function SpecialQuestSuccessNode:Clear()
  local CurrentEvent = ClientEventUtils:GetCurrentEvent()
  if CurrentEvent and CurrentEvent.Type == "SpecialQuest" then
    CurrentEvent:RemoveSuccessNodeCallback(self)
  end
end

return SpecialQuestSuccessNode
