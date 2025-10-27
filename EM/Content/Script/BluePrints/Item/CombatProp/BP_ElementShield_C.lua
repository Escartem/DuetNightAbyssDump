require("UnLua")
local BP_SaiqiShield_C = Class({
  "BluePrints.Item.BP_CombatItemBase_C"
})

function BP_SaiqiShield_C:AuthorityInitInfo(Info)
  BP_SaiqiShield_C.Super.AuthorityInitInfo(self, Info)
  local BreakCountDef = self.UnitParams.BreakCountDef or 0
  self.BuffId = self.UnitParams.BuffId or 850201
  self.PlayerBuffId = self.UnitParams.PlayerBuffId or 850203
  self.BreakCount = 3
end

function BP_SaiqiShield_C:PlayerTouchSphere(Player, Sphere)
  self:K2_DestroyComponent(Sphere)
  self:OnPlayerTouchSphere(Player, Sphere)
  self.BreakCount = self.BreakCount - 1
  if 0 == self.BreakCount then
    self:ShowDeath()
  end
end

function BP_SaiqiShield_C:OnPlayerTouchSphere(Player, Sphere)
end

function BP_SaiqiShield_C:OnDead(KillMineRoleEid, KillMineSkillId)
  BP_SaiqiShield_C.Super.OnDead(self, KillMineRoleEid, KillMineSkillId)
  self:EMActorDestroy(EDestroyReason.MechanismDead)
end

return BP_SaiqiShield_C
