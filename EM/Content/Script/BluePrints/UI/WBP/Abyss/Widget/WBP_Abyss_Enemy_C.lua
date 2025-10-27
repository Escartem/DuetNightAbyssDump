local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.Text_Button:SetText(GText("UI_DUNGEON_MonsterType"))
  self.Text_LvTips:SetText(GText("Abyss_RecLevel"))
  self.Panel_Boss:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:BindButtonPerformances()
end

function M:Destruct()
  self:UnBindButtonPerformances()
end

function M:Init(Parent, Func)
  self.Parent = Parent
  self.Func = Func
end

function M:OnClicked()
  if self.Func then
    self.Func(self.Parent)
  else
    DebugPrint("WBP_Abyss_Enemy_C:OnClicked()\239\188\140self.Func\230\151\160\230\149\136")
  end
end

function M:SetBossInfo(Name, Icon)
  if not Name then
    self.Text_Button:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Text_Button:SetText(Name)
    self.Text_Button:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  if not Icon then
    self.Panel_Boss:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Panel_Boss:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Icon_Boss:SetBrushResourceObject(Icon)
  end
end

function M:SetRecLevel(RecLevel)
  local RecLevel = RecLevel or ""
  self.Text_Lv:SetText("<H>" .. RecLevel .. "</>")
end

function M:SwitchUIType(IsGamePad)
  if IsGamePad then
    self.WS_Type:SetActiveWidgetIndex(1)
  else
    self.WS_Type:SetActiveWidgetIndex(0)
  end
end

function M:BindButtonPerformances()
  self.Button_Area.OnClicked:Add(self, self.OnBtnClicked)
  self.Button_Area.OnPressed:Add(self, self.OnBtnPressed)
  self.Button_Area.OnReleased:Add(self, self.OnBtnReleased)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Button_Area.OnHovered:Add(self, self.OnBtnHovered)
    self.Button_Area.OnUnhovered:Add(self, self.OnBtnUnhovered)
  end
end

function M:UnBindButtonPerformances()
  self.Button_Area.OnClicked:Clear()
  self.Button_Area.OnPressed:Clear()
  self.Button_Area.OnReleased:Clear()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Button_Area.OnHovered:Clear()
    self.Button_Area.OnUnhovered:Clear()
  end
end

function M:SwitchNormalAnimation()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:PlayButtonClickSound()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
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

function M:PlayButtonHoverAnim()
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
