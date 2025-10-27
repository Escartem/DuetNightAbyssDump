local WBP_Abyss_BtnSave_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_Abyss_BtnSave_C:Construct()
  self.IsForbidden = false
  self:BindButtonPerformances()
end

function WBP_Abyss_BtnSave_C:Destruct()
  self:UnBindButtonPerformances()
end

function WBP_Abyss_BtnSave_C:Init(Parent, Func, ForbidFuc)
  self.Parent = Parent
  self.Func = Func
  self.ForbidFuc = ForbidFuc
end

function WBP_Abyss_BtnSave_C:SetText(Text)
  if self.Text_Save then
    self:PlayAnimation(self.Change)
    self.Text_Save:SetText(Text)
  end
end

function WBP_Abyss_BtnSave_C:OnClicked()
  if self.Func then
    self.Func(self.Parent)
  else
    DebugPrint("WBP_Abyss_BtnSave_C:OnClicked()\239\188\140self.Func\230\151\160\230\149\136")
  end
end

function WBP_Abyss_BtnSave_C:OnForbiddenClicked()
  if self.ForbidFuc then
    self.ForbidFuc(self.Parent)
  else
    DebugPrint("WBP_Abyss_BtnSave_C:OnForbiddenClicked()\239\188\140self.ForbidFuc\230\151\160\230\149\136")
  end
end

function WBP_Abyss_BtnSave_C:BindButtonPerformances()
  self.Btn_Click.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Click.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Click.OnReleased:Add(self, self.OnBtnReleased)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Click.OnHovered:Add(self, self.OnBtnHovered)
    self.Btn_Click.OnUnhovered:Add(self, self.OnBtnUnhovered)
  end
end

function WBP_Abyss_BtnSave_C:UnBindButtonPerformances()
  if not self.Btn_Click then
    return
  end
  self.Btn_Click.OnClicked:Clear()
  self.Btn_Click.OnPressed:Clear()
  self.Btn_Click.OnReleased:Clear()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Click.OnHovered:Clear()
    self.Btn_Click.OnUnhovered:Clear()
  end
end

function WBP_Abyss_BtnSave_C:SwitchNormalAnimation()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function WBP_Abyss_BtnSave_C:PlayButtonClickSound()
  AudioManager(self):PlayUISound(self, "event:/ui/activity/drama_start_btn_click", nil, nil)
end

function WBP_Abyss_BtnSave_C:PlayButtonClickAnimation()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self:PlayAnimation(self.Click)
end

function WBP_Abyss_BtnSave_C:OnBtnClicked()
  if self.IsForbidden == true then
    self:OnForbiddenClicked()
  else
    self:PlayButtonClickAnimation()
    self:OnClicked()
  end
end

function WBP_Abyss_BtnSave_C:PlayForbiddenButtonPressSound()
  UIUtils.PlayCommonForbiddenBtnSe(self)
end

function WBP_Abyss_BtnSave_C:PlayButtonPressAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self:PlayAnimation(self.Press)
end

function WBP_Abyss_BtnSave_C:OnBtnPressed()
  if self.IsForbidden == true then
    self:PlayForbiddenButtonPressSound()
    return
  end
  self:PlayButtonClickSound()
  self.IsPressing = true
  self:PlayButtonPressAnim()
end

function WBP_Abyss_BtnSave_C:PlayButtonHoverAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self:PlayAnimation(self.Hover)
end

function WBP_Abyss_BtnSave_C:OnBtnHovered()
  if self.IsForbidden == true then
    return
  end
  self.IsHovering = true
  self:PlayButtonHoverAnim()
end

function WBP_Abyss_BtnSave_C:SetBtnHovered(IsHovered)
  if IsHovered then
    self:OnBtnHovered()
  else
    self:OnBtnUnhovered()
  end
end

function WBP_Abyss_BtnSave_C:PlayButtonReleaseButHoverAnim()
  self:StopAllAnimations()
  self:PlayButtonHoverAnim()
end

function WBP_Abyss_BtnSave_C:PlayButtonReleaseAndUnHoverAnim()
  self:StopAllAnimations()
  self:SwitchNormalAnimation()
end

function WBP_Abyss_BtnSave_C:OnBtnReleased()
  self.IsPressing = false
  if self.IsForbidden ~= true and not self.IsHovering then
    self:PlayButtonReleaseAndUnHoverAnim()
  elseif self.IsForbidden ~= true then
    self:PlayButtonReleaseButHoverAnim()
  end
end

function WBP_Abyss_BtnSave_C:PlayButtonUnHoverAnim()
  self:StopAllAnimations()
  self:SwitchNormalAnimation()
end

function WBP_Abyss_BtnSave_C:OnBtnUnhovered()
  self.IsHovering = false
  if self.IsForbidden ~= true and not self.IsPressing then
    self:PlayButtonUnHoverAnim()
  end
end

function WBP_Abyss_BtnSave_C:PlayButtonForbidAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Forbidden)
end

function WBP_Abyss_BtnSave_C:PlayButtonUnForbidAnim()
  self:StopAllAnimations()
  if self.IsHovering then
    self:PlayButtonHoverAnim()
  else
    self:SwitchNormalAnimation()
  end
end

function WBP_Abyss_BtnSave_C:SetForbidden(IsForbid)
  if true == IsForbid then
    self.IsForbidden = true
    self:PlayButtonForbidAnim()
  else
    self.IsForbidden = false
    self:PlayButtonUnForbidAnim()
  end
end

return WBP_Abyss_BtnSave_C
