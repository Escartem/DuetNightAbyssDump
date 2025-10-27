local M = Class("BluePrints.UI.UI_PC.Battle.ExclusiveSkill.Base.Battle_Skill_UI_Base")

function M:OnLoaded(OwnerPlayer)
  self.Super.OnLoaded(self)
  self.OwnerPlayer = OwnerPlayer
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:PlayAnimation(self.In)
end

function M:RemoveSelf()
  self:PlayAnimation(self.Out)
  local EndTime = self.Out:GetEndTime()
  self:AddTimer(EndTime, function()
    self:Close()
  end, false, 0, "OutAnimFinished")
end

return M
