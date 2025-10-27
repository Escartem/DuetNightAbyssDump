local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.IsForbidden = false
  self:BindButtonPerformances()
  self.Btn_Entry:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  end)
end

function M:Destruct()
  self:UnBindButtonPerformances()
end

function M:SetText(Text)
  if self.Text_Save then
    self:PlayAnimation(self.Change)
    self.Text_Save:SetText(Text)
  end
end

function M:BindButtonPerformances()
  self.Btn_Entry_L.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Entry_L.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Entry_L.OnReleased:Add(self, self.OnBtnReleased)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Entry_L.OnHovered:Add(self, self.OnBtnHovered)
    self.Btn_Entry_L.OnUnhovered:Add(self, self.OnBtnUnhovered)
  end
end

function M:UnBindButtonPerformances()
  if not self.Btn_Entry_L then
    return
  end
  self.Btn_Entry_L.OnClicked:Clear()
  self.Btn_Entry_L.OnPressed:Clear()
  self.Btn_Entry_L.OnReleased:Clear()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Entry_L.OnHovered:Clear()
    self.Btn_Entry_L.OnUnhovered:Clear()
  end
end

function M:SwitchNormalAnimation()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:PlayButtonClickAnimation()
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
end

function M:OnBtnClicked()
  self:PlayButtonClickAnimation()
  self.Btn_Entry:OnBtnClicked()
end

function M:PlayButtonPressAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnBtnPressed()
  self.IsPressing = true
  self:PlayButtonPressAnim()
  self.Btn_Entry:OnBtnPressed()
end

function M:PlayButtonHoverAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function M:OnBtnHovered()
  self.IsHovering = true
  self:PlayButtonHoverAnim()
  self.Btn_Entry:OnBtnHovered()
end

function M:PlayButtonReleaseButHoverAnim()
  self:StopAllAnimations()
  self:PlayButtonHoverAnim()
end

function M:PlayButtonReleaseAndUnHoverAnim()
  self:StopAllAnimations()
  self:SwitchNormalAnimation()
end

function M:OnBtnReleased()
  self.IsPressing = false
  if not self.IsHovering then
    self:PlayButtonReleaseAndUnHoverAnim()
  else
    self:PlayButtonReleaseButHoverAnim()
  end
  self.Btn_Entry:OnBtnReleased()
end

function M:PlayButtonUnHoverAnim()
  self:StopAllAnimations()
  self:SwitchNormalAnimation()
end

function M:OnBtnUnhovered()
  self.IsHovering = false
  if not self.IsPressing then
    self:PlayButtonUnHoverAnim()
  end
  self.Btn_Entry:OnBtnUnhovered()
end

return M
