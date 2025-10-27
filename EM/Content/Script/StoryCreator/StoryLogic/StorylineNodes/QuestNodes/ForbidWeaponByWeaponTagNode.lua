local ForbidWeaponByWeaponTagNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function ForbidWeaponByWeaponTagNode:Init()
  self.WeaponTags = {}
  self.bForbid = true
  self.ForbidTag = "ForbidDefault"
  self.bHidewhenForbid = true
end

function ForbidWeaponByWeaponTagNode:Execute()
  self.RealWeaponTags = {}
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  local PlayerCharacter = PlayerController:GetMyPawn()
  if PlayerController and PlayerCharacter then
    for _, WeaponTag in pairs(self.WeaponTags) do
      if PlayerCharacter:CheckWeaponForbidByWeaponTag(WeaponTag) then
        if not self.bForbid then
          table.insert(self.RealWeaponTags, WeaponTag)
        end
      elseif self.bForbid then
        table.insert(self.RealWeaponTags, WeaponTag)
      end
    end
    PlayerController:SetAndForbidWeaponByWeaponTag(self.RealWeaponTags, self.bForbid, self.ForbidTag, self.bHidewhenForbid)
  end
end

function ForbidWeaponByWeaponTagNode:OnQuestlineSuccess()
  DebugPrint("ZJT_ ForbidWeaponByWeaponTagNode ", self.bForbid, self.ForbidTag, self.bHidewhenForbid)
end

function ForbidWeaponByWeaponTagNode:OnQuestlineFail()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  PlayerController:SetAndForbidWeaponByWeaponTag(self.RealWeaponTags, not self.bForbid, self.ForbidTag, self.bHidewhenForbid)
end

return ForbidWeaponByWeaponTagNode
