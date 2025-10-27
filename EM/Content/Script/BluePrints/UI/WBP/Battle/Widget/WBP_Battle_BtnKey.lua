require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Button_Area.OnClicked:Add(self, self.OnBtnAreaClick)
  local CurMode = UIUtils.UtilsGetCurrentInputType()
  self.KeyWidget = nil
  if CurMode == ECommonInputType.Gamepad then
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(1)
    self.KeyWidget = self.Key_GamePad
  else
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(0)
    self.KeyWidget = self.Key_PC
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
end

function M:OnBtnAreaClick()
  if self.BtnAreaCb then
    self.BtnAreaCb()
  end
end

function M:Destruct()
  self.Button_Area.OnClicked:Remove(self, self.OnBtnAreaClick)
  self.BtnAreaCb = nil
end

function M:SetBtnNormalCallback(Cb)
  self.BtnAreaCb = Cb
end

function M:SetForbid(bOn)
  self.Button_Area:SetForbidden(bOn)
end

function M:SetText(Text)
  self.Text_Button:SetText(Text)
end

function M:SetImg(GamepadPath, KeyboardPath)
  if GamepadPath then
    self.Key_GamePad:SetImage("Image", GamepadPath)
  end
  if KeyboardPath then
    self.Key_PC:SetImage("Text", KeyboardPath)
  end
end

function M:GetKeyWidget()
  return self.KeyWidget
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(0)
    self.KeyWidget = self.Key_PC
  else
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(1)
    self.KeyWidget = self.Key_GamePad
  end
end

return M
