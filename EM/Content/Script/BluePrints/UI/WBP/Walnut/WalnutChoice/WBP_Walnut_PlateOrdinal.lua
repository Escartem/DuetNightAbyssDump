require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.ProbPercent = 0
  self:BindEvents()
  self:SetVisibility(ESlateVisibility.HitTestInvisible)
end

function M:BindEvents()
  self.Button_Area.OnHovered:Add(self, self.OnHoverOrdinal)
  self.Button_Area.OnUnhovered:Add(self, self.OnUnhoverOrdinal)
  self.Button_Area.OnCheckStateChanged:Add(self, self.OnClickOrdinal)
  self.Tips_MenuAnchor.OnMenuOpenChanged:Add(self, self.OnMenuOpenChanged)
end

function M:OnClickOrdinal()
  self:PlayAnimation(self.Click)
end

function M:OnPressOrdinal()
  self:PlayAnimation(self.Presss)
end

function M:OnHoverOrdinal()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    return
  end
  self:OpenMenuAnchor()
end

function M:OnUnhoverOrdinal()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    return
  end
  self:CloseMenuAnchor()
end

function M:OpenMenuAnchor()
  if self.Tips_MenuAnchor:IsOpen() then
    return
  end
  self.Tips_MenuAnchor:Open(true)
  if self.OrdinalProb then
    self.OrdinalProb:SetProbPercent(self.ProbPercent)
    self.OrdinalProb:PlayAnimation(self.OrdinalProb.In)
  end
end

function M:CloseMenuAnchor()
  if not self.Tips_MenuAnchor:IsOpen() then
    return
  end
  self.Tips_MenuAnchor:Close()
end

function M:SetPercent(Percent)
  self.ProbPercent = Percent
end

function M:OnClickOrdinal(IsChecked)
  if IsChecked then
    self:OpenMenuAnchor()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small_crystal", nil, nil)
  else
    self:CloseMenuAnchor()
  end
end

function M:OnMenuOpenChanged(bIsOpen)
  UIManager(self):SetIsMenuAnchorOpen(bIsOpen)
  if not bIsOpen then
    self:PlayAnimation(self.Normal)
    self:OnMenuClose()
  end
end

function M:OnMenuClose()
  self.Button_Area:SetChecked(false)
end

function M:DoCustomNavigation_Left()
  if self.MainUI then
    self.MainUI.WalnutPlate.Ordinal_3rd.Button_Area:SetFocus()
    self.MainUI.WalnutPlate.Ordinal_3rd:OnClickOrdinal(true)
    self:PlayAnimation(self.UnHover)
    self.MainUI.WalnutPlate.Ordinal_3rd:PlayAnimation(self.MainUI.WalnutPlate.Ordinal_3rd.Click)
  end
  return true
end

function M:DoCustomNavigation_Right()
  if self.MainUI then
    self.MainUI.WalnutPlate.Ordinal_2nd.Button_Area:SetFocus()
    self.MainUI.WalnutPlate.Ordinal_2nd:OnClickOrdinal(true)
    self:PlayAnimation(self.UnHover)
    self.MainUI.WalnutPlate.Ordinal_2nd:PlayAnimation(self.MainUI.WalnutPlate.Ordinal_2nd.Click)
  end
  return true
end

function M:DoCustomNavigation_Up()
  if self.MainUI then
    self.MainUI.WalnutPlate.Ordinal_1st.Button_Area:SetFocus()
    self.MainUI.WalnutPlate.Ordinal_1st:OnClickOrdinal(true)
    self:PlayAnimation(self.UnHover)
    self.MainUI.WalnutPlate.Ordinal_1st:PlayAnimation(self.MainUI.WalnutPlate.Ordinal_1st.Click)
  end
  return true
end

return M
