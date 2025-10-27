require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Battle.ExclusiveSkill.Base.Battle_Skill_UI_Base")

function M:Initialize(Initializer)
  self.Super.Initialize(self)
  self.OwnerPlayer = nil
end

function M:OnLoaded(PlayerCharacter, SpecialUIInfo)
  self.Super.OnLoaded(self, PlayerCharacter, SpecialUIInfo)
  local Alpha = SpecialUIInfo.FlashLevel or 1
  self:SetAnim(Alpha)
end

function M:SetAnim(Alpha)
  if 1 == Alpha then
    self.UsedAnim = self.LV_1
  elseif 2 == Alpha then
    self.UsedAnim = self.LV_2
  else
    self.UsedAnim = self.LV_3
  end
  self:PlayAnimation(self.UsedAnim)
end

function M:RemoveSelf()
  self:BindToAnimationFinished(self.UsedAnim, function()
    self:UnbindAllFromAnimationFinished(self.UsedAnim)
    self:Close()
  end)
  self:PlayAnimationReverse(self.UsedAnim)
end

return M
