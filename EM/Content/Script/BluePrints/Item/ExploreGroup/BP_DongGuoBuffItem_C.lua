local M = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.BuffId = self.UnitParams.BuffId
  self.Duration = self.UnitParams.Duration
  self.RecoverTime = self.UnitParams.RecoverTime
end

function M:OnActorReady(Info)
  M.Super.OnActorReady(self, Info)
  self.Box.OnComponentBeginOverlap:Add(self, self.CollisionBeginOverlap)
  self.Box.OnComponentEndOverlap:Add(self, self.CollisionEndOverlap)
  self.Box:SetCollisionProfileName("OnlyPlayer", true)
end

function M:CollisionBeginOverlap(Component, OtherActor)
  if not OtherActor.IsPlayer or not OtherActor:IsPlayer() then
    return
  end
  Battle(self):AddBuffToTarget(self, OtherActor, self.BuffId, self.Duration, nil, nil)
  self:AddTimer(self.RecoverTime, self.OnRecoverTimeEnd, false, 0, "RecoverTimer")
  self:OnPlayerGetBuff(OtherActor)
end

function M:CollisionEndOverlap(Component, OtherActor)
end

function M:OnRecoverTimeEnd()
  self:OnRecover()
end

return M
