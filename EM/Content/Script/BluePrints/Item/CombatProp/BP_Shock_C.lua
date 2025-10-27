require("UnLua")
local BP_Shock_C = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function BP_Shock_C:AuthorityInitInfo(Info)
  BP_Shock_C.Super.AuthorityInitInfo(self, Info)
  self.ActiveRange = self.UnitParams.ActiveRange
  self.SkillRange = 0
end

function BP_Shock_C:CommonInitInfo(Info)
  BP_Shock_C.Super.CommonInitInfo(self, Info)
  self.SkillEffect = self.UnitParams.SkillEffect
  self.ShockWidth = self.UnitParams.ShockWidth
  self.InCD = false
  self.MaxRadius = self.UnitParams.MaxRadius
  self.ShockInterval = self.UnitParams.AttackCD
  self.Speed = self.MaxRadius / self.ShockInterval
  self.ShockRange:SetBoxExtent(FVector(self.MaxRadius, self.MaxRadius, 10))
  self.SkillRange = 0
end

function BP_Shock_C:SetActiveType()
  self.ActiveType = "Distance"
end

function BP_Shock_C:OnActiveStateChange()
  self.Super.OnActiveStateChange(self)
  if self.IsActive then
    self:PlayActiveMontage()
  else
    self.HitedCDMap:Clear()
  end
  self:PlaySound("event:/sfx/common/scene/laser_gear_open")
end

function BP_Shock_C:ReceiveBeginPlay()
  BP_Shock_C.Super.ReceiveBeginPlay(self)
  self.HitMap = UE4.TMap(AActor, AActor)
  self:DeActiveFX(self.ShockFX)
end

function BP_Shock_C:ChangeCD()
  self.InCD = false
end

function BP_Shock_C:AddHitMap(Actor)
  if not IsAuthority(self) then
    return
  end
  if Actor.Eid and Actor.Eid == self.Eid then
    return
  end
  self.HitMap:Add(Actor.Eid, Actor.Eid)
end

function BP_Shock_C:RemoveHitMap(Actor)
  if not IsAuthority(self) then
    return
  end
  self.HitMap:Remove(Actor.Eid)
end

function BP_Shock_C:ShowDeath()
  self:RemoveTimer("DistanceDeActiveTimer")
  self:DeActiveFX(self.ShockFX)
  self:PlayDeadMontage()
  self:PlaySound("event:/sfx/common/scene/laser_gear_break")
  BP_Shock_C.Super.ShowDeath(self)
end

function BP_Shock_C:DeActive()
  BP_Shock_C.Super.DeActive(self)
  self.SkillRange = 0
  if not IsAuthority(self) or IsStandAlone(self) then
    self:DeActiveFX(self.ShockFX)
  end
  self:PlayDeactiveMontage()
end

return BP_Shock_C
