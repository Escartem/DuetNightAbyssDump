require("UnLua")
local M = Class({
  "BluePrints/Item/CombatProp/BP_BombBarrel_C"
})

function M:AuthorityInitInfo(Info)
  M.Super.AuthorityInitInfo(self, Info)
  self.SkillEffect_Monster = self.UnitParams.SkillEffect_Monster
  self.SkillEffect_Player = self.UnitParams.SkillEffect_Player
  self.ActiveRange = self.UnitParams.ActiveRange
end

function M:OnBomb()
  if self.SkillEffect_Monster then
    self.PropUseSkill(self, self.SkillEffect_Monster, self)
  end
  if self.SkillEffect_Player then
    self.PropUseSkill(self, self.SkillEffect_Player, self)
  end
end

return M
