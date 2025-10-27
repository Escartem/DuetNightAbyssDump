require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:InitBaseInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
  DebugPrint("thy    CurInputDeviceType is", self.CurInputDeviceType)
  self:UpdateUIVisibility()
end

function M:SetGamePadImg(ImgShortPath, ImgLongPath)
  local ImgPath, Img
  if ImgShortPath and "None" ~= ImgShortPath then
    ImgPath = UIUtils.UtilsGetKeyIconPathInGamepad(ImgShortPath, "XBOX")
    Img = LoadObject(ImgPath)
  elseif ImgLongPath then
    Img = LoadObject(ImgLongPath)
  end
  if not IsValid(Img) then
    DebugPrint("\231\188\186\229\176\145\229\155\190\231\137\135\232\181\132\230\186\144: ImgPath = ", ImgPath, ImgShortPath, ImgLongPath)
    return Img
  end
  return Img
end

function M:UpdateUIVisibility()
  if 1 == self.CurInputDeviceType then
    self.Switcher_Text:SetActiveWidgetIndex(1)
    self.Gamepad_Shortcut01:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_CharTrial_ClosePop")
    })
    self.Gamepad_Shortcut02:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Switcher_Text:SetActiveWidgetIndex(0)
    self.Text_Tips:SetText(self.Tips)
  end
end

function M:Handle_OnGamePadDown(InKeyName)
  DebugPrint("thy    Handle_OnGamePadDown", InKeyName)
  if "Gamepad_FaceButton_Right" == InKeyName then
    self:Exit()
    return true
  end
  return false
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  DebugPrint("thy   InKeyName ", InKeyName)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    DebugPrint("thy    Key_IsGamepadKey", InKeyName)
    IsEventHandled = self:Handle_OnGamePadDown(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:Exit()
  self:Close()
end

function M:InitContent()
  self.Text_Title:SetText(self.Title)
  self.Text_Describe:SetText(self.Describe)
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self.Btn_FullScreen.OnClicked:Add(self, self.Exit)
  self.Title, self.Describe, self.Tips = ...
  self:InitContent()
  self:InitBaseInfo()
  self:InitListenEvent()
end

function M:OnLoaded(...)
end

return M
