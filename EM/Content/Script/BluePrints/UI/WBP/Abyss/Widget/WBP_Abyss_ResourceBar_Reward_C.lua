local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self:BindButtonPerformances()
end

function M:Destruct()
  self:UnBindButtonPerformances()
end

function M:Init(Parent, Func, NowValue, MaxValue)
  self.Parent = Parent
  self.Func = Func
  self.NowValue = NowValue
  self.MaxValue = MaxValue
  self.Num_Progress_Now:SetText(NowValue)
  self.Num_Progress_Total:SetText(MaxValue)
end

function M:OnClicked()
  if self.Func then
    self.Func(self.Parent, self.NowValue, self.MaxValue)
  else
    DebugPrint("WBP_Abyss_ResourceBar_Reward:OnClicked()\239\188\140self.Func\230\151\160\230\149\136")
  end
end

function M:BindButtonPerformances()
  self.Btn_Item.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Item.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Item.OnReleased:Add(self, self.OnBtnReleased)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Item.OnHovered:Add(self, self.OnBtnHovered)
    self.Btn_Item.OnUnhovered:Add(self, self.OnBtnUnhovered)
  end
end

function M:UnBindButtonPerformances()
  self.Btn_Item.OnClicked:Clear()
  self.Btn_Item.OnPressed:Clear()
  self.Btn_Item.OnReleased:Clear()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Item.OnHovered:Clear()
    self.Btn_Item.OnUnhovered:Clear()
  end
end

function M:SwitchNormalAnimation()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:PlayButtonClickSound()
  AudioManager(self):PlayUISound(self, "event:/ui/activity/drama_gift_btn_click", nil, nil)
end

function M:PlayButtonClickAnimation()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self:PlayAnimation(self.Click)
end

function M:OnBtnClicked()
  self:PlayButtonClickSound()
  self:PlayButtonClickAnimation()
  self:OnClicked()
end

function M:PlayButtonPressAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self:PlayAnimation(self.Press)
end

function M:OnBtnPressed()
  self.IsPressing = true
  self:PlayButtonPressAnim()
end

function M:PlayButtonHoverSound()
  AudioManager(self):PlayUISound(self, "event:/ui/activity/drama_gift_btn_hover", nil, nil)
end

function M:PlayButtonHoverAnim()
  self:PlayButtonHoverSound()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self:PlayAnimation(self.Hover)
end

function M:OnBtnHovered()
  self.IsHovering = true
  self:PlayButtonHoverAnim()
end

function M:SetBtnHovered(IsHovered)
  if IsHovered then
    self:OnBtnHovered()
  else
    self:OnBtnUnhovered()
  end
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
end

return M
