require("UnLua")
local M = Class({
  "BluePrints.Item.Temple.BP_TouchBomb_C"
})

function M:SphereOverlap(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex, bFromSweep, SweepResult)
  if self.IsActive and self.OnHitMonsterEffect and self.OnHitMonsterEffect > 0 and not OtherActor:IsDead() then
    self.Super.PropUseSkill(self, self.OnHitMonsterEffect, OtherActor)
  end
end

function M:ActiveCombat()
  self.IsActive = true
  self.ChestInteractiveComponent.bCanUsed = false
  self.Dir = self:GetDirection()
  self:OnInteractived()
  local Actors = self.Sphere:GetOverlappingActors()
  if Actors:Length() > 0 and self.OnHitMonsterEffect and self.OnHitMonsterEffect > 0 then
    for i = 1, Actors:Length() do
      if not Actors[i]:IsDead() then
        self.Super.PropUseSkill(self, self.OnHitMonsterEffect, Actors[i])
      end
    end
  end
end

return M
