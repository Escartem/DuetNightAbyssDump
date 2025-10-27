local PlayerSwitchWalkRunNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function PlayerSwitchWalkRunNode:Init()
  self.Rate = 0.25
  self.Mode = "EWT_Normal"
end

function PlayerSwitchWalkRunNode:Execute()
  DebugPrint("------------ PlayerSwitchWalkRunNode Start------------------")
  self.ListenTarget = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not self.ListenTarget then
    return
  end
  local AnimInstance = self.ListenTarget.PlayerAnimInstance
  self.DefaultWalkState = AnimInstance.IsWalking
  self.DefaultWalkType = AnimInstance.WalkType
  self.MoveRate = self.ListenTarget:GetMoveRate()
  local WalkType = UE4.EWalkType[self.Mode]
  if -1 ~= WalkType then
    self.ListenTarget:SetPlayerMaxMovingSpeed(self.Rate)
    AnimInstance.IsWalking = true
    self.ListenTarget:SetWalkType(WalkType)
    if WalkType == UE4.EWalkType.EWT_Normal then
      self.ListenTarget:SetEmoIdleEnabled(true)
    else
      self.ListenTarget:SetEmoIdleEnabled(false, true)
    end
  elseif self.Mode == "ToRun" then
    self.ListenTarget:RecoverPlayerMovingSpeed()
    AnimInstance.IsWalking = false
    self.ListenTarget:SetWalkType(UE4.EWalkType.EWT_Normal)
    self.ListenTarget:SetEmoIdleEnabled(true)
    if AnimInstance.RootMotionMode ~= ERootMotionMode.RootMotionFromMontagesOnly then
      AnimInstance:SetRootMotionMode(ERootMotionMode.RootMotionFromMontagesOnly)
    end
  else
    error("PlayerSwitchWalkRunNode:Invalid mode")
  end
end

function PlayerSwitchWalkRunNode:OnQuestlineFail()
  if not self.ListenTarget then
    return
  end
  local AnimInstance = self.ListenTarget.PlayerAnimInstance
  if not AnimInstance then
    return
  end
  local IsWalking = AnimInstance.IsWalking
  if self.DefaultWalkState ~= IsWalking then
    if self.DefaultWalkState then
      AnimInstance.IsWalking = true
    else
      AnimInstance.IsWalking = false
      if AnimInstance.RootMotionMode ~= ERootMotionMode.RootMotionFromMontagesOnly then
        AnimInstance:SetRootMotionMode(ERootMotionMode.RootMotionFromMontagesOnly)
      end
    end
  elseif self.DefaultWalkState and self.DefaultWalkType ~= UE4.EWalkType[self.Mode] then
    self.ListenTarget:SetWalkType(self.DefaultWalkType)
  end
  if self.DefaultWalkState and self.DefaultWalkType == UE4.EWalkType.EWT_Normal or not self.DefaultWalkState then
    self.ListenTarget:SetEmoIdleEnabled(true)
  else
    self.ListenTarget:SetEmoIdleEnabled(false, true)
  end
  self.ListenTarget:SetPlayerMaxMovingSpeed(self.MoveRate)
end

return PlayerSwitchWalkRunNode
