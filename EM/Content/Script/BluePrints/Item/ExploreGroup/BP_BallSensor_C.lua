require("UnLua")
local M = Class({
  "BluePrints.Item.BP_CombatItemBase_C",
  "BluePrints.Common.TimerMgr"
})

function M:OnGravityBallIn(Ball)
  if not self.IsActive then
    return
  end
  self.GravityBall = Ball
  self:SetActorTickEnabled(true)
end

function M:OnGravityBallOut()
  if not self.IsActive then
    return
  end
  self.GravityBall = nil
  self:SetActorTickEnabled(false)
end

function M:ReceiveTick(DeltaSeconds)
  self.Overridden.ReceiveTick(self, DeltaSeconds)
  if not self.GravityBall then
    return
  end
  local Velocity = self.GravityBall.Ball:GetComponentVelocity()
  if UE4.UKismetMathLibrary.VSize(Velocity) <= self.MinVelocity then
    self:OnComplete()
    self:SetActorTickEnabled(false)
  end
end

function M:OnComplete()
  self:ChangeState("Manual", 0, self.CompleteStateId)
  if self.GravityBall then
    self.GravityBall:OnComplete()
  end
end

return M
