local RestoreRoleNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function RestoreRoleNode:Init()
  self.Context.RevertRole = false
  self.Context.CurrentRole = nil
end

function RestoreRoleNode:Execute()
  local GameInstance = GWorld.GameInstance
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local GameMode = UE4.UGameplayStatics.GetGameMode(PlayerCharacter)
  if not IsValid(GameMode) then
    return
  end
  GameMode:SwitchToQuestRole(0)
  self.Context.CurrentRole = nil
end

function RestoreRoleNode:OnQuestlineFail()
  if self.Context.RevertRole then
    return
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local GameMode = UE4.UGameplayStatics.GetGameMode(PlayerCharacter)
  if not IsValid(GameMode) then
    return
  end
  GameMode:SwitchToQuestRole(0)
  self.Context.RevertRole = true
  self.Context.CurrentRole = nil
end

return RestoreRoleNode
