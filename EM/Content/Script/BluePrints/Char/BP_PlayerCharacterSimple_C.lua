require("UnLua")
require("DataMgr")
local Const = require("Const")
local BP_PlayerCharacterSimple_C = Class("BluePrints.Char.BP_CharacterBase_C")
BP_PlayerCharacterSimple_C._components = {
  "BluePrints.Char.CharacterComponent.PickupComponent",
  "BluePrints.Char.CharacterComponent.CameraComponent",
  "BluePrints.Char.CharacterComponent.CamPostProcessMgrComponent",
  "BluePrints.Char.CharacterComponent.AttackInputComponent",
  "BluePrints.Char.CharacterComponent.PlayerCommonInterface",
  "BluePrints.Char.CharacterComponent.TeamRecoveryComponent"
}
BP_PlayerCharacterSimple_C.IsSimplePlayer = true

function BP_PlayerCharacterSimple_C:Initialize(Initializer)
  self:PlayerCharacterInitialize()
end

function BP_PlayerCharacterSimple_C:ReceiveBeginPlay()
  if self.IsHide == true then
    self:Deactivate()
  elseif self.IsHide == false then
    self:Activate()
  end
  self:BeforeBeginPlay()
  BP_PlayerCharacterSimple_C.Super.ReceiveBeginPlay(self)
  self:AfterBeginPlay()
end

function BP_PlayerCharacterSimple_C:ReceiveTick(DeltaSeconds)
end

function BP_PlayerCharacterSimple_C:IsFlying()
  return false
end

function BP_PlayerCharacterSimple_C:CheckCanShoot(bLoose)
  return false
end

function BP_PlayerCharacterSimple_C:CheckJumpStage(TempJumpInfo)
  local CurrentJumpState = self.PlayerAnimInstance.CurrentJumpState
  local IsMoveOnGround = not self.IsInAir
  local EnterFirstJumpStage = self:CheckFirstJumpCondition(CurrentJumpState, IsMoveOnGround)
  if EnterFirstJumpStage then
    return Const.FirstJump
  end
  return nil
end

function BP_PlayerCharacterSimple_C:GetLogMask()
  return _G.LogTag
end

function BP_PlayerCharacterSimple_C:IsCharacterInAir()
  if not self.PlayerAnimInstance then
    return self.Overridden.IsCharacterInAir(self)
  end
  return self.PlayerAnimInstance.CurrentJumpState ~= Const.Climb and self.Overridden.IsCharacterInAir(self)
end

function BP_PlayerCharacterSimple_C:CheckNoRotationInputTime(DeltaSeconds)
  if self:CanResetCamera() then
    self.fNoControlRotationInputTime = self.fNoControlRotationInputTime + DeltaSeconds
    if self.fNoControlRotationInputTime >= 2 then
      return true
    end
  else
    self.fNoControlRotationInputTime = 0.0
  end
  return false
end

function BP_PlayerCharacterSimple_C:HideDirectSourceBattlePet(IsHide)
  local DirectSource = self:GetDirectSource()
  local BattlePet = DirectSource and DirectSource:GetBattlePet()
  if not BattlePet then
    return
  end
  BattlePet:HideBattlePet("Support", IsHide)
end

function BP_PlayerCharacterSimple_C:LeaveSkillTag(NewTag)
end

function BP_PlayerCharacterSimple_C:EnterSkillTag(NewTag)
end

function BP_PlayerCharacterSimple_C:SetActorShowOrHide(State)
  self:SetActorHiddenInGame(not State)
  self:SetActorTickEnabled(State)
  self.Mesh:SetComponentTickEnabled(State)
  self.Mesh.VisibilityBasedAnimTickOption = State and EVisibilityBasedAnimTickOption.AlwaysTickPose or EVisibilityBasedAnimTickOption.OnlyTickMontagesWhenNotRendered
end

function BP_PlayerCharacterSimple_C:Deactivate()
  self.IsHide = true
  local Movement = self:GetMovementComponent()
  Movement:SetActive(false)
  Movement:SetMovementMode(EMovementMode.MOVE_None)
  self:SetActorShowOrHide(false)
  self.IsInAir = false
end

function BP_PlayerCharacterSimple_C:Activate()
  self.IsHide = false
  local Movement = self:GetMovementComponent()
  Movement:SetMovementMode(EMovementMode.MOVE_None)
  Movement:SetActive(true)
  self:SetActorShowOrHide(true)
end

function BP_PlayerCharacterSimple_C:CheckSkillInActive(SkillName)
  local Controller = self:GetController()
  if Controller:Cast(UE4.ASinglePlayerController) then
    return self:GetController():CheckSkillInActive(SkillName)
  end
  return false
end

AssembleComponents(BP_PlayerCharacterSimple_C, {
  "CheckJumpStage"
})
return BP_PlayerCharacterSimple_C
