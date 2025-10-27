require("UnLua")
local M = Class({
  "BluePrints.Item.CombatProp.BP_CombatPropBase_C",
  "BluePrints.Common.TimerMgr"
})

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.ShouldShowDirection = false
  self.PlayerEffect = self.UnitParams.PlayerEffect
  self.MonEffect = self.UnitParams.MonEffect
  self.SpecialEffect = self.UnitParams.SpecialEffect
  self.OnHitMonsterEffect = self.UnitParams.OnHitMonsterEffect
end

function M:ReceiveBeginPlay()
  M.Super.ReceiveBeginPlay(self)
  self.DefaultInteractiveComponent.OnInteractiveTriggerEnter:Add(self, self.TriggerEnter)
  self.DefaultInteractiveComponent.OnInteractiveTriggerExit:Add(self, self.TriggerExit)
  self.IsTouchBomb = true
end

function M:TriggerEnter(PlayerActor)
  if not self.ShouldDirection then
    return
  end
  self:AddTimer(0.2, self.CheckDistance, true, 0, "CheckDistance", false, PlayerActor)
  self.Player = PlayerActor
end

function M:TriggerExit(PlayerActor)
  self:RemoveTimer("CheckDistance")
  self.Player = nil
end

function M:CheckDistance(PlayerActor)
  if self.IsActive then
    self:OnHideEffect()
    return
  end
  if PlayerActor and self.ChestInteractiveComponent then
    local InRange = self.ChestInteractiveComponent.DistanceCheckComponent(self.ChestInteractiveComponent, PlayerActor, self.ChestInteractiveComponent.InteractiveDistance, false)
    if InRange and not self.ShouldShowDirection then
      self.ShouldShowDirection = true
      self:OnShowEffect()
    elseif not InRange and self.ShouldShowDirection then
      self.ShouldShowDirection = false
      self:OnHideEffect()
    end
  end
end

function M:ShowArrowDirection()
  if not self.Player then
    self.Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  end
  if self.ShouldShowDirection and self.Scene and self.Player then
    self.Scene:K2_SetWorldRotation(self.Player:K2_GetActorRotation(), false, nil, false)
  end
end

function M:GetDirection()
  if not self.Player then
    self.Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  end
  local Direction = self.Player:GetActorForwardVector()
  Direction.Z = 0
  Direction:Normalize()
  return Direction
end

function M:CalcRotation()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local ComponentLocation = self.Scene:K2_GetComponentLocation()
  local Direction = ComponentLocation - Player:K2_GetActorLocation()
  Direction.Z = 0
  Direction:Normalize()
  local LookAtRotation = UKismetMathLibrary.MakeRotFromX(Direction)
  return LookAtRotation
end

function M:ReceiveEndPlay()
  M.Super.ReceiveEndPlay(self)
  self:RemoveTimer("CheckDistance")
end

function M:OnInteractived()
  if self.Owner and self.Owner.OnBombInteractived then
    self.Owner:OnBombInteractived()
  end
end

return M
