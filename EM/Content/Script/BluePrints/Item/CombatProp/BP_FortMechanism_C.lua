require("UnLua")
local M = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function M:OnActiveStateChange()
  self.Super.OnActiveStateChange(self)
  if self.IsActive then
    self:SetActorTickEnabled(true)
  else
    self:FindTarget()
    self:SetActorTickEnabled(false)
  end
end

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.AttackRange = self.UnitParams.AttackRange
  self.AttackCD = self.UnitParams.AttackCD
  if self.UnitParams.AttackSkillEffect then
    for i, v in pairs(self.UnitParams.AttackSkillEffect) do
      self.AttackSkillEffects:Add(v)
    end
  end
end

function M:OnTargetCanBeAttack(Target)
  if self.bCDOver then
    for i, Id in pairs(self.AttackSkillEffects) do
      self:PropUseSkill(Id, Target)
    end
    self.bCDOver = false
    self:AddTimer(self.AttackCD, self.ResetCD)
  end
  self.Overridden.OnTargetCanBeAttack(self, Target)
end

function M:ResetCD()
  self.bCDOver = true
end

function M:OnDead(KillMineRoleEid, KillMineSkillId, DeathReason)
  M.Super.OnDead(self, KillMineRoleEid, KillMineSkillId, DeathReason)
  self:SetActorTickEnabled(false)
  self:EMActorDestroy(EDestroyReason.MechanismDead)
end

return M
