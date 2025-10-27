require("UnLua")
local M = Class("BluePrints.UI.WBP.Camera.WBP_Camera_ComBtn_Base_C")

function M:Construct()
  M.Super.Construct(self)
  self.Btn_Click.OnUnhovered:Clear()
  self.Btn_Click.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Btn_Click.OnHovered:Clear()
  self.Btn_Click.OnHovered:Add(self, self.OnBtnHovered)
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

function M:OnBtnHovered()
  self:StopAnimation(self.UnHover)
  self:PlayAnimation(self.Hover)
end

function M:OnBtnUnhovered()
  self:StopAnimation(self.Hover)
  self:PlayAnimation(self.UnHover)
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
  self.Btn_Click.OnUnhovered:Clear()
  self.Btn_Click.OnHovered:Clear()
  self.Btn_Click.OnClicked:Clear()
  self.Btn_Click.OnReleased:Clear()
  self.Btn_Click.OnPressed:Clear()
  if bLocked then
    self:PlayAnimation(self.Lock)
    self.Btn_Click.OnClicked:Add(self, self.OnBtnClickedLocked)
  else
    self:PlayAnimation(self.Visual)
    self.Btn_Click.OnPressed:Add(self, self.OnBtnPressed)
    self.Btn_Click.OnUnhovered:Add(self, self.OnBtnUnhovered)
    self.Btn_Click.OnHovered:Add(self, self.OnBtnHovered)
    self.Btn_Click.OnClicked:Add(self, self.OnBtnClicked)
    self.Btn_Click.OnReleased:Add(self, self.OnBtnReleased)
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
