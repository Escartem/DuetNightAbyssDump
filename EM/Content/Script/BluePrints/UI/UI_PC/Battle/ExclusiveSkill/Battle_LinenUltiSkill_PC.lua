require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Battle.ExclusiveSkill.Base.Battle_Skill_UI_Base")

function M:OnLoaded(OwnerPlayer, Params)
  self:StopAllAnimations()
  self.Super.OnLoaded(self)
  self.OwnerPlayer = OwnerPlayer
  self:PlayAnimation(self.Fade_In)
end

function M:RemoveSelf()
  self:StopAllAnimations()
  self:PlayAnimation(self.Fade_Out)
  local EndTime = self.Fade_Out:GetEndTime()
  self:AddTimer(EndTime, function()
    self:Close()
  end, false, 0, "OutAnimFinished")
end

return M
