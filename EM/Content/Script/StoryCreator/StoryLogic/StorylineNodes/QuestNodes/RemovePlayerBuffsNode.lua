local RemovePlayerBuffsNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function RemovePlayerBuffsNode:Init()
  self.RemoveBuffs = {}
end

function RemovePlayerBuffsNode:Start(Context)
  self.Context = Context
  local GameInstance = GWorld.GameInstance
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  for _, BuffId in pairs(self.RemoveBuffs) do
    Battle(PlayerCharacter):RemoveBuffFromTarget(PlayerCharacter, PlayerCharacter, BuffId, false, -1)
  end
  self:FinishAction()
end

function RemovePlayerBuffsNode:FinishAction()
  self:Finish()
end

return RemovePlayerBuffsNode
