local BP_FallingPlatformMechanism_C = Class({
  "BluePrints.Item.BP_CombatItemBase_C"
})

function BP_FallingPlatformMechanism_C:OnPlayerIn(Player)
  if self.OnBreak then
    return
  end
  if not self.IsInside then
    self:ChangeState("Manual", 0, self.BrokenStateId)
  end
  self.IsInside = true
end

function BP_FallingPlatformMechanism_C:OnPlayerOut(Player)
  self.IsInside = false
end

function BP_FallingPlatformMechanism_C:FallDown()
  self.IsInside = false
  self.Cube:SetVisibility(false, true)
  self:AddTimer(self.ReplaceTime, self.FallUp)
  self.Cube:SetCollisionEnabled(0)
end

function BP_FallingPlatformMechanism_C:FallUp()
  self:ChangeState("Manual", 0, self.RecoverStateId)
end

function BP_FallingPlatformMechanism_C:ResetCollision()
  self.Cube:SetCollisionEnabled(3)
end

function BP_FallingPlatformMechanism_C:MoveDown()
  local Loc = self:K2_GetActorLocation()
  Loc.Z = Loc.Z - 1000
  self:K2_SetActorLocation(Loc, false, nil, false)
end

function BP_FallingPlatformMechanism_C:OnEnterState(NowStateId)
  self.Overridden.OnEnterState(self, NowStateId)
  if NowStateId == self.BrokenStateId and not self.OnBreak then
    self:OnPlatformBreak()
    self.OnPlayerInHandle = self:AddTimer(self.WarningTime, self.FallDown)
  elseif NowStateId == self.RecoverStateId then
    self:OnPlatformReplace()
    self.Cube:SetVisibility(true, true)
  end
end

return BP_FallingPlatformMechanism_C
