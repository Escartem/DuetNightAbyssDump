local Component = {}

function Component:OnAddBuff(BuffId, Duration, BuffLevel)
  local Battle = Battle(GWorld.GameInstance)
  if not Battle then
    return
  end
  BuffLevel = BuffLevel or 1
  if self:IsInDungeon() or self:IsInHardBoss() then
    return
  end
  self.logger.debug("OnAddBuff", BuffId, Duration, BuffLevel)
  local PlayerController = UE.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if PlayerController then
    local PlayerCharacter = PlayerController:GetMyPawn()
    if IsAuthority(PlayerCharacter) then
      Battle:AddAvatarBuffToTarget(PlayerCharacter, PlayerCharacter, BuffId, -1, 0, BuffLevel)
    end
  end
end

function Component:OnRemoveBuff(BuffId)
  local Battle = Battle(GWorld.GameInstance)
  if not Battle then
    return
  end
  if self:IsInDungeon() or self:IsInHardBoss() then
    return
  end
  self.logger.debug("OnRemoveBuff", BuffId)
  local PlayerController = UE.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if PlayerController then
    local PlayerCharacter = PlayerController:GetMyPawn()
    if IsAuthority(PlayerCharacter) then
      Battle:RemoveAvatarBuffFromTarget(PlayerCharacter, PlayerCharacter, BuffId, false, -1)
    end
  end
end

function Component:OnBuffFinished(BuffId)
  self.logger.debug("OnBuffFinished", BuffId)
  local Battle = Battle(GWorld.GameInstance)
  if not Battle then
    return
  end
  if self:IsInDungeon() or self:IsInHardBoss() then
    return
  end
  local PlayerController = UE.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if PlayerController then
    local PlayerCharacter = PlayerController:GetMyPawn()
    if IsAuthority(PlayerCharacter) then
      Battle:RemoveAvatarBuffFromTarget(PlayerCharacter, PlayerCharacter, BuffId, false, -1)
    end
  end
end

return Component
