local M = Class("BluePrints/Item/BP_CombatItemBase_C")

function M:ReceiveBeginPlay()
  self.Super.ReceiveBeginPlay(self)
  self.InitRotate = self:K2_GetActorRotation()
end

function M:ReceiveTick(DeltaSeconds)
  self.Overridden.ReceiveTick(self, DeltaSeconds)
  local CurYaw = self.CurRotate.Yaw
  local TargetYaw = self.InitRotate.Yaw
  local NewYaw = UE4.UKismetMathLibrary.FixedTurn(CurYaw, TargetYaw, self.ReturnSpeed * DeltaSeconds)
  self.CurRotate.Yaw = NewYaw
  self:K2_SetActorRotation(self.CurRotate, false, nil, false)
end

function M:CheckAngle(RotateFactor)
  local CurYaw = self:K2_GetActorRotation().Yaw
  local InitYaw = self.InitRotate.Yaw
  local YawDifference = InitYaw - CurYaw
  YawDifference = (YawDifference + 180) % 360 - 180
  if math.abs(YawDifference) <= self.MaxAngle or self.RotateFactor ~= RotateFactor then
    self.RotateFactor = RotateFactor
    return true
  end
  self.RotateFactor = RotateFactor
  return false
end

function M:ActiveCombat()
  self.Super.ActiveCombat(self)
  self:SetActorTickEnabled(false)
end

function M:DeActiveCombat()
  self.Super.DeActiveCombat(self)
  self.CurRotate = self:K2_GetActorRotation()
  self:SetActorTickEnabled(true)
end

return M
