local PlayerSourceTagBranchNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function PlayerSourceTagBranchNode:Execute()
  if not self.SourceTag then
    return
  end
  local GameInstance = GWorld.GameInstance
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, self.PlayerIndex)
  return Player:CharacterInTag(self.SourceTag) and "True" or "False"
end

return PlayerSourceTagBranchNode
