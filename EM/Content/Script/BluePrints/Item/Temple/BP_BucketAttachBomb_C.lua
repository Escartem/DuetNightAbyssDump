require("UnLua")
local M = Class({
  "BluePrints.Item.Temple.BP_BucketBomb_C"
})

function M:ActiveCombat()
  self.ChestInteractiveComponent.bCanUsed = false
  self:OnAttach()
end

function M:OnPadLanuch(Dir)
  self.Dir = Dir
  self.Dir:Normalize()
  self.IsActive = true
  self.ChestInteractiveComponent.bCanUsed = false
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
