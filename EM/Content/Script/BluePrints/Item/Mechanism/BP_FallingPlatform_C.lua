local BP_FallingPlatform_C = Class({
  "BluePrints.Common.TimerMgr"
})

function BP_FallingPlatform_C:OnPlayerIn(Player)
  if self.OnBreak then
    return
  end
  if not self.IsInside then
    self:OnPlatformBreak()
    self.OnPlayerInHandle = self:AddTimer(self.WarningTime, self.FallDown)
  end
  self.IsInside = true
end

function BP_FallingPlatform_C:OnPlayerOut(Player)
  self.IsInside = false
end

function BP_FallingPlatform_C:FallDown()
  self.IsInside = false
  self.Cube:SetVisibility(false, true)
  self:AddTimer(self.ReplaceTime, self.FallUp)
  self.Cube:SetCollisionEnabled(0)
end

function BP_FallingPlatform_C:FallUp()
  self:OnPlatformReplace()
  self.Cube:SetVisibility(true, true)
end

function BP_FallingPlatform_C:ResetCollision()
  self.Cube:SetCollisionEnabled(3)
end

function BP_FallingPlatform_C:MoveDown()
  local Loc = self:K2_GetActorLocation()
  Loc.Z = Loc.Z - 1000
  self:K2_SetActorLocation(Loc, false, nil, false)
end

return BP_FallingPlatform_C
