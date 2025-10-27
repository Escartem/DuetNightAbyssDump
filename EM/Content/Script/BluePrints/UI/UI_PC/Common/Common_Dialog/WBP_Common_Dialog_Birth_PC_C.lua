require("UnLua")
local WBP_Common_Dialog_Birth_PC_C = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")
local DaysInMonth = {
  31,
  29,
  31,
  30,
  31,
  30,
  31,
  31,
  30,
  31,
  30,
  31
}

function WBP_Common_Dialog_Birth_PC_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
  if self.CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
end

function WBP_Common_Dialog_Birth_PC_C:InitGamepadView()
  self:GamepadFocusMonth()
  self:AddTimer(0.1, function()
    self.Panel_GamepadVX:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end)
end

function WBP_Common_Dialog_Birth_PC_C:InitKeyboardView()
  self.Panel_GamepadVX:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_Common_Dialog_Birth_PC_C:GamepadFocusMonth()
  if self.FocusBirthScrollWidget == self.NumberScroll_Month then
    return
  end
  self:PlayAnimation(self.GamePad_SelectMonth)
  self.FocusBirthScrollWidget = self.NumberScroll_Month
end

function WBP_Common_Dialog_Birth_PC_C:GamepadFocusDay()
  if self.FocusBirthScrollWidget == self.NumberScroll_Day then
    return
  end
  self:PlayAnimation(self.GamePad_SelectDay)
  self.FocusBirthScrollWidget = self.NumberScroll_Day
end

function WBP_Common_Dialog_Birth_PC_C:Handle_PreviewKeyDownOnGamePad(InKeyName)
  if InKeyName == Const.GamepadDPadLeft or InKeyName == Const.LeftStickLeft then
    self:GamepadFocusMonth()
    return true
  elseif InKeyName == Const.GamepadDPadRight or InKeyName == Const.LeftStickRight then
    self:GamepadFocusDay()
    return true
  elseif InKeyName == Const.GamepadDPadUp then
    if self.FocusBirthScrollWidget then
      self.FocusBirthScrollWidget:ScrollToPreviousNumber()
      return true
    end
  elseif InKeyName == Const.GamepadDPadDown and self.FocusBirthScrollWidget then
    self.FocusBirthScrollWidget:ScrollToNextNumber()
    return true
  end
  return false
end

function WBP_Common_Dialog_Birth_PC_C:OnContentPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsHandled = self:Handle_PreviewKeyDownOnGamePad(InKeyName)
  end
  return IsHandled
end

function WBP_Common_Dialog_Birth_PC_C:OnContentAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.LeftAnalogY then
    local DeltaOffset = -1 * UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 20
    if self.FocusBirthScrollWidget then
      self.FocusBirthScrollWidget:AddDeltaOffset(DeltaOffset)
    end
    return UIUtils.Handled
  elseif InKeyName == UIConst.GamePadKey.LeftAnalogX then
    local DeltaOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
    if DeltaOffset <= -1 then
      self:GamepadFocusMonth()
    elseif DeltaOffset >= 1 then
      self:GamepadFocusDay()
    end
  end
  return UIUtils.Unhandled
end

function WBP_Common_Dialog_Birth_PC_C:PreInitContent(Params, PopupData, Owner)
  self.Super.PreInitContent(self, Params, PopupData, Owner)
  self.PackageKey = "Birthday"
end

function WBP_Common_Dialog_Birth_PC_C:InitContent(Params, PopupData, Owner)
  self.NumberScroll_Month:BindOnNumberSelected(self, self.OnMonthSelected)
  self.NumberScroll_Day:BindOnNumberSelected(self, self.OnDaySelected)
  self.NumberScroll_Month:InitContent(12)
  self.NumberScroll_Day:InitContent(31)
  self.Text_Month:SetText(GText("UI_Chardata_Char_Month"))
  self.Text_Day:SetText(GText("UI_Chardata_Char_Day"))
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self.BeforeMonth, self.BeforeDay = Avatar:GetAvatarBirthday()
  end
  self.NumberScroll_Month:NavigateTo(self.BeforeMonth)
  self.NumberScroll_Day:NavigateTo(self.BeforeDay)
  self:OnMonthSelected(self.BeforeMonth)
  self:OnDaySelected(self.BeforeDay)
  self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LH"}
    },
    Desc = GText("UI_Controller_Switch")
  })
  self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LV"}
    },
    Desc = GText("UI_CTL_Adjust")
  })
  self:RefreshOpInfoByInputDevice()
end

function WBP_Common_Dialog_Birth_PC_C:OnMonthSelected(Month)
  local Days = DaysInMonth[Month]
  self.NumberScroll_Day.NumberRequired = Days
  if 1 ~= self.NumberScroll_Day:GetSelectedNumber() then
    self.NumberScroll_Day:NavigateTo(1)
  end
  self:OnDaySelected(1)
end

function WBP_Common_Dialog_Birth_PC_C:OnDaySelected(Day)
  local Month = self.NumberScroll_Month:GetSelectedNumber()
  local Day = self.NumberScroll_Day:GetSelectedNumber()
  if Month == self.BeforeMonth and Day == self.BeforeDay then
    self.Owner:ForbidRightBtn(true)
  else
    self.Owner:ForbidRightBtn(false)
  end
end

function WBP_Common_Dialog_Birth_PC_C:PackageData()
  local PackageResult = {}
  PackageResult.Month = self.NumberScroll_Month:GetSelectedNumber()
  PackageResult.Day = self.NumberScroll_Day:GetSelectedNumber()
  return PackageResult
end

return WBP_Common_Dialog_Birth_PC_C
