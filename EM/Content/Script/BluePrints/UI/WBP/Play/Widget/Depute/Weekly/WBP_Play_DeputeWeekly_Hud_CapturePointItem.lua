require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Init(OccupateProgress)
  self.Progress = OccupateProgress
  self.TargetProgress = 0
  self.LerpAlpha = 0
  self.Text_Percent:SetText(OccupateProgress)
  self.Image_Bar:GetDynamicMaterial():SetScalarParameterValue("Percent", OccupateProgress)
  self.Root:SetRenderOpacity(0)
end

function M:OnProgressChange(NewProgress)
  self.Text_Percent:SetText(math.floor(NewProgress))
  self.Image_Bar:GetDynamicMaterial():SetScalarParameterValue("Percent", NewProgress / 100)
  if NewProgress >= 100 and not self:IsAnimationPlaying(self.Out) then
    self:PlayAnimation(self.Out)
  end
  self.Progress = NewProgress
end

function M:OnPlayerOut()
  self:StopAllAnimations()
  self:PlayAnimation(self.Out)
end

function M:OnPlayerIn()
  self:StopAllAnimations()
  self:PlayAnimation(self.In)
end

function M:OnOccupationPause()
  self:Set_Color(true)
end

function M:OnOccupationContinue()
  self:Set_Color(false)
end

return M
