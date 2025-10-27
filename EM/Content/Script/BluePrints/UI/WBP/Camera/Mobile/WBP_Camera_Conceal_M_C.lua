require("UnLua")
local M = Class("BluePrints.UI.WBP.Camera.WBP_Camera_ComBtn_Base_C")

function M:Construct()
  M.Super.Construct(self)
  self:BindToAnimationFinished(self.Warning, {
    self,
    self.OnWarningAnimationFinished
  })
end

function M:Destruct()
  self:UnbindFromAnimationStarted(self.Warning, {
    self,
    self.OnWarningAnimationFinished
  })
end

function M:SetHiddenState(bHidden)
  self:StopAllAnimations()
  if self.bLocked then
    self:PlayAnimation(self.Lock)
    return
  end
  if bHidden then
    self:PlayAnimation(self.Hide)
  else
    self:PlayAnimation(self.Visual)
  end
end

function M:SetLockState(bLocked)
  self:StopAllAnimations()
  if bLocked then
    self.Image:SetOpacity(0)
    self.VX_Vis:SetOpacity(0)
    self.Icon_Lock:SetRenderOpacity(1)
    self.TextBlock_Name:SetOpacity(0.7)
    self.Btn_Click.OnClicked:Add(self, self.OnBtnClickedLocked)
  else
    self.Image:SetOpacity(1)
    self.VX_Vis:SetOpacity(1)
    self.Icon_Lock:SetRenderOpacity(0)
    self.TextBlock_Name:SetOpacity(1)
  end
  self.bLocked = bLocked
end

function M:SetText(Text)
  self.TextBlock_Name:SetText(Text)
end

function M:OnBtnClickedLocked()
  self:PlayAnimation(self.Warning)
end

function M:OnWarningAnimationFinished()
  self:PlayAnimation(self.Lock)
end

return M
