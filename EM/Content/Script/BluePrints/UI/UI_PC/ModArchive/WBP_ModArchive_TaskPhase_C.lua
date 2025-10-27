require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self.CurInputDeviceType = self.GameInputModeSubsystem:GetCurrentInputType()
  if self.Key_TaskRewardTitle then
    self.Key_TaskRewardTitle:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      }
    })
  end
  if self.Key_TitleLeft then
    self.Key_TitleLeft:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LT"}
      }
    })
  end
  if self.Key_TitleRight then
    self.Key_TitleRight:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RT"}
      }
    })
  end
  self.Btn_Get:SetDefaultGamePadImg("A")
end

function M:OnMouseEnter(MyGeometry, MouseEvent)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if not self.Owner or self.Owner.CurInputDeviceType ~= ECommonInputType.GamePad then
    return
  end
  self:PlayAnimation(self.Hover)
  self.IsHovering = true
end

function M:OnMouseLeave(MyGeometry, MouseEvent)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if not self.Owner or self.Owner.CurInputDeviceType ~= ECommonInputType.GamePad then
    return
  end
  self:PlayAnimation(self.UnHover)
  self.IsHovering = false
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  self.InFocus = true
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.Key_TaskRewardTitle:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if self.Key_TitleLeft and self.Key_TitleRight then
      self.Key_TitleLeft:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Key_TitleRight:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    self.Btn_Get:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
    if self.Owner and self.Owner.Owner then
      self.Owner.Owner:SwitchComKeyTipsState(7)
    end
  end
end

function M:OnFocusLost(InFocusEvent)
  self.InFocus = false
  self.Key_TaskRewardTitle:SetVisibility(ESlateVisibility.Collapsed)
  if self.Key_TitleLeft and self.Key_TitleRight then
    self.Key_TitleLeft:SetVisibility(ESlateVisibility.Collapsed)
    self.Key_TitleRight:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.Btn_Get:SetGamePadVisibility(ESlateVisibility.Collapsed)
  if self.CurInputDeviceType == ECommonInputType.Gamepad and self.Owner and self.Owner.Owner then
    self.Owner.Owner:SwitchComKeyTipsState(3)
  end
end

function M:OnGamePadSelected()
  self.ListView_Rewards:SetFocus()
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
  self:UpdateOnInputDeviceTypeChange()
end

function M:UpdateOnInputDeviceTypeChange()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
  else
    self.Key_TaskRewardTitle:SetVisibility(ESlateVisibility.Collapsed)
    if self.Key_TitleLeft and self.Key_TitleRight then
      self.Key_TitleLeft:SetVisibility(ESlateVisibility.Collapsed)
      self.Key_TitleRight:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end

return M
