local SwitchPlayerBattlePetNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function SwitchPlayerBattlePetNode:Execute()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  PlayerCharacter:ServerSetBattlePetByBattlePetId(self.BattlePetId, 1, false, true)
end

return SwitchPlayerBattlePetNode
