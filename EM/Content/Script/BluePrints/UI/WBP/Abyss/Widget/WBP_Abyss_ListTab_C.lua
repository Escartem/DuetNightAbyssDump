local WBP_Abyss_ListTab_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_Abyss_ListTab_C:Construct()
  self:BindButtonPerformances()
end

function WBP_Abyss_ListTab_C:Destruct()
  self:UnBindButtonPerformances()
end

function WBP_Abyss_ListTab_C:Init(Type, LineupPage)
  self.Type = Type
  self.Checked = false
  self.LineupPage = LineupPage
end

function WBP_Abyss_ListTab_C:OnClicked()
  if self.LineupPage then
    self.LineupPage:PhantomWeaponTypeChanged(self.Type)
  else
    DebugPrint("lhr@WBP_Abyss_ListTab_C:OnClicked\239\188\140\233\152\181\229\174\185\233\133\141\231\189\174\231\149\140\233\157\162\229\164\177\230\149\136")
  end
end

function WBP_Abyss_ListTab_C:BindButtonPerformances()
  self.Btn_Click.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Click.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Click.OnReleased:Add(self, self.OnBtnReleased)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Click.OnHovered:Add(self, self.OnBtnHovered)
    self.Btn_Click.OnUnhovered:Add(self, self.OnBtnUnhovered)
  end
end

function WBP_Abyss_ListTab_C:UnBindButtonPerformances()
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

function WBP_Abyss_ListTab_C:SwitchNormalAnimation()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function WBP_Abyss_ListTab_C:PlayButtonClickSound()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_sort_tab", nil, nil)
end

function WBP_Abyss_ListTab_C:PlayButtonClickAnimation()
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
end

function WBP_Abyss_ListTab_C:OnBtnClicked()
  if self.Checked == false then
    self:OnClicked()
  end
end

function WBP_Abyss_ListTab_C:PlayButtonPressAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function WBP_Abyss_ListTab_C:OnBtnPressed()
  if self.Checked == true then
    return
  end
  self:PlayButtonClickSound()
  self.IsPressing = true
  self:PlayButtonPressAnim()
end

function WBP_Abyss_ListTab_C:PlayButtonHoverAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self:PlayAnimation(self.Hover)
end

function WBP_Abyss_ListTab_C:OnBtnHovered()
  if self.Checked == true then
    return
  end
  self.IsHovering = true
  self:PlayButtonHoverAnim()
end

function WBP_Abyss_ListTab_C:SetBtnHovered(IsHovered)
  if IsHovered then
    self:OnBtnHovered()
  else
    self:OnBtnUnhovered()
  end
end

function WBP_Abyss_ListTab_C:PlayButtonReleaseButHoverAnim()
  self:StopAllAnimations()
  self:PlayButtonHoverAnim()
end

function WBP_Abyss_ListTab_C:PlayButtonReleaseAndUnHoverAnim()
  self:StopAllAnimations()
  self:SwitchNormalAnimation()
end

function WBP_Abyss_ListTab_C:OnBtnReleased()
  self.IsPressing = false
  if self.Checked == true then
    return
  end
  if not self.IsHovering then
    self:PlayButtonReleaseAndUnHoverAnim()
  else
    self:PlayButtonReleaseButHoverAnim()
  end
end

function WBP_Abyss_ListTab_C:PlayButtonUnHoverAnim()
  self:StopAllAnimations()
  self:SwitchNormalAnimation()
end

function WBP_Abyss_ListTab_C:OnBtnUnhovered()
  self.IsHovering = false
  if self.Checked == true then
    return
  end
  if not self.IsPressing then
    self:PlayButtonUnHoverAnim()
  end
end

function WBP_Abyss_ListTab_C:SetIsChecked(IsChecked, IsPlaySound)
  if self.Checked == false and true == IsChecked then
    self.Checked = true
    if IsPlaySound then
      self:PlayCheckSound(true)
    end
    self:PlayButtonClickAnimation()
  elseif self.Checked == true and false == IsChecked then
    self.Checked = false
    if IsPlaySound then
      self:PlayCheckSound(false)
    end
    self:SwitchNormalAnimation()
  end
end

function WBP_Abyss_ListTab_C:PlayCheckSound(IsChecked)
  if IsChecked then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_sort_tab", nil, nil)
  else
  end
end

function WBP_Abyss_ListTab_C:PlayRemindAnim()
  self:PlayAnimation(self.Remind)
end

function WBP_Abyss_ListTab_C:PlaySelectAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Select)
end

return WBP_Abyss_ListTab_C
