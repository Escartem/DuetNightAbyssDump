local RefreshPlayerNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function RefreshPlayerNode:Execute()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  PlayerCharacter:InitCharacterInfo(PlayerCharacter.InfoForInit)
end

return RefreshPlayerNode
