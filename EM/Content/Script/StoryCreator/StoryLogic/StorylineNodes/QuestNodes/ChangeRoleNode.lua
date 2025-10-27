local ChangeRoleNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function ChangeRoleNode:Init()
  self.Context.RevertRole = false
  self.Context.CurrentRole = nil
end

function ChangeRoleNode:Execute()
  if not DataMgr.QuestRoleInfo[self.QuestRoleId] then
    local Message = "QuestRoleId\228\184\141\229\173\152\229\156\168" .. "\n\t\229\156\168\232\176\131\231\148\168SwitchToQuestRole\231\154\132\230\151\182\229\128\153\239\188\140\228\188\160\229\133\165\231\154\132\229\143\130\230\149\176QuestRoleId \227\128\144" .. tostring(self.QuestRoleId) .. "\227\128\145 \229\156\168QuestRoleInfo\232\161\168\228\184\173\228\184\141\229\173\152\229\156\168\239\188\140\232\175\183\230\159\165\233\152\133QuestRoleInfo\232\161\168\230\160\188"
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "QuestRoleId\228\184\141\229\173\152\229\156\168", Message)
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local GameInstance = GWorld.GameInstance
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  if not PlayerCharacter then
    return
  end
  if PlayerCharacter.AvatarQuestRoleID == self.QuestRoleId and PlayerCharacter.AvatarSex == Avatar.Sex then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(PlayerCharacter)
  if not IsValid(GameMode) then
    return
  end
  GameMode:SwitchToQuestRole(self.QuestRoleId, self.IsPlayFX)
  PlayerCharacter.AvatarSex = Avatar.Sex
  self.Context.CurrentRole = self.QuestRoleId
end

function ChangeRoleNode:OnQuestlineFail()
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

return ChangeRoleNode
