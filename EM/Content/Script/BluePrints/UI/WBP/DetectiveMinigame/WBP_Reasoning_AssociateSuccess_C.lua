require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:OnLoaded(...)
  M.Super:OnLoaded(...)
  self.AnswerId = (...)
  self:InitUI()
  self.Btn_Close.OnClicked:Add(self, self.BtnClickClose)
  self:SetFocus()
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
end

function M:InitUI()
  local DetectiveAnswerData = DataMgr.DetectiveAnswer[self.AnswerId]
  self.Icon_Clue:SetBrushResourceObject(LoadObject(DetectiveAnswerData.Icon))
  self.Text_Name:SetText(GText(DetectiveAnswerData.Name))
  self.Text_Tip:SetText(GText("Minigame_Textmap_100311"))
  self.Key01:CreateCommonKey({
    KeyInfoList = {
      {ImgShortPath = "B", Type = "Img"}
    },
    bLongPress = false,
    Desc = GText("UI_AntiAliasing_Close")
  })
end

function M:BtnClickClose()
  self:Close()
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    DebugPrint("thy    \229\183\178\231\187\143\230\152\190\231\164\186\231\154\132\230\152\175\232\175\165\232\190\147\229\133\165\230\168\161\229\188\143\239\188\140\228\184\141\233\156\128\232\166\129\232\191\155\232\161\140\229\136\183\230\150\176")
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
  self.IsSwitchDevice = true
  if self.CurInputDeviceType == ECommonInputType.MouseAndKeyboard then
    DebugPrint("thy   IsPC")
    self.WS_Type:SetActiveWidgetIndex(0)
  else
    DebugPrint("thy   IsGamePad")
    self.WS_Type:SetActiveWidgetIndex(1)
    self:SetFocus()
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_FaceButton_Right" == InKeyName then
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
    self:Close()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

return M
