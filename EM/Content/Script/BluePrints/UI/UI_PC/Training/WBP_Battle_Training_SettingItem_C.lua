local WBP_Battle_Training_SettingItem_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Battle_Training_SettingItem_C:BindEventOnHovered(Obj, Callback)
  self.OnHovered = {Obj, Callback}
end

function WBP_Battle_Training_SettingItem_C:BindEventOnUnHovered(Obj, Callback)
  self.OnUnHovered = {Obj, Callback}
end

function WBP_Battle_Training_SettingItem_C:Construct()
  self.OnHovered = nil
  self.MaskGamepad.OnClicked:Clear()
  self.MaskGamepad.OnClicked:Add(self, function()
    self.Btn_Setting:OnBtnClicked()
  end)
  self.MaskGamepad.OnHovered:Clear()
  self.MaskGamepad.OnHovered:Add(self, function()
    self.Imgae_Select:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if self.OnHovered then
      self.OnHovered[2](self.OnHovered[1])
    end
  end)
  self.MaskGamepad.OnUnhovered:Clear()
  self.MaskGamepad.OnUnhovered:Add(self, function()
    self.Imgae_Select:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if self.OnUnHovered then
      self.OnUnHovered[2](self.OnUnHovered[1])
    end
  end)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
  self:RefreshOpInfoByInputDevice()
end

function WBP_Battle_Training_SettingItem_C:RefreshOpInfoByInputDevice()
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
  if self.CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    self.MaskGamepad:SetVisibility(UE4.ESlateVisibility.Visible)
  else
    self.MaskGamepad:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

return WBP_Battle_Training_SettingItem_C
