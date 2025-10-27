require("UnLua")
local M = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function M:OnEnergyZero()
  print(_G.LogTag, "LXZ OnEnergyZero")
  self.Overridden.OnEnergyZero(self)
  if 0 == self.EnergyZeroStateId then
    return
  end
  self:ChangeState("Manual", 0, self.EnergyZeroStateId)
end

function M:OnEnergyMax()
  print(_G.LogTag, "LXZ OnEnergyMax")
  self.Overridden.OnEnergyMax(self)
  if 0 == self.EnergyMaxStateId then
    return
  end
  self:ChangeState("Manual", 0, self.EnergyMaxStateId)
end

function M:OnEnergyChange()
  print(_G.LogTag, "LXZ OnEnergyChange", self.Energy)
  self.Overridden.OnEnergyChange(self)
  if self.Energy <= 0 then
    self:OnEnergyZero()
  elseif self.Energy >= self.MaxEnergy then
    self:OnEnergyMax()
  end
end

function M:OnBreakCountDownTag(Tag, SkillId, InSourceEid)
  if 0 ~= self.WeaponEffectType then
    local Source = Battle(self):GetEntity(InSourceEid)
    if Source:IsPlayer() then
      self:SetWeaponEffect(Source)
    end
  end
  self.Overridden.OnBreakCountDownTag(self, Tag, SkillId, InSourceEid)
end

return M
