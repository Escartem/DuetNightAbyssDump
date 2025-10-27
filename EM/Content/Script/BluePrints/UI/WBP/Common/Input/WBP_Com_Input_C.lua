require("UnLua")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})
M._components = {
  "BluePrints.UI.WBP.Common.Input.WBP_Com_Input_Base_Component_C"
}

function M:Construct()
  self.Group_ControllerChoose:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_ControllerControl:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.WS_Btn:GetWidgetAtIndex(0):SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Paste.OnClicked:Clear()
  self.Btn_Paste.OnClicked:Add(self, self.OnPasteBtnClicked)
  self.Btn_Delete.OnClicked:Clear()
  self.Btn_Delete.OnClicked:Add(self, self.OnDeleteBtnClicked)
  self.bIsFocusable = true
end

function M:UpdateBtns()
  if self.bNeedPasteBtn then
    self.WS_Btn:GetWidgetAtIndex(0):SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.WS_Btn:GetWidgetAtIndex(0):SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self:GetText() ~= "" then
    self.WS_Btn:SetActiveWidgetIndex(1)
  else
    self.WS_Btn:SetActiveWidgetIndex(0)
  end
  self:UpdateGamePadKey()
  if self.WS_Btn:GetActiveWidget():IsVisible() or self.Group_ControllerControl:IsVisible() then
    self.HB_Btn:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.HB_Btn:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:UpdateGamePadKey()
  self:UpdateGamePadFocusKey()
  self:UpdateGamePadPasteKey()
end

function M:UpdateGamePadFocusKey()
  if self.IsShowGamPadKey and self.CurInputDeviceType == ECommonInputType.Gamepad then
    if self.Text_Input:HasAnyUserFocus() then
      self.Group_ControllerChoose:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.Group_ControllerChoose:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    end
  else
    self.Group_ControllerChoose:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:UpdateGamePadPasteKey()
  if self.IsShowGamPadKey and self.CurInputDeviceType == ECommonInputType.Gamepad then
    if self.WS_Btn:GetActiveWidget():IsVisible() then
      self.Group_ControllerControl:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    else
      self.Group_ControllerControl:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  else
    self.Group_ControllerControl:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnEditTextFocusReceived()
  self:UpdateGamePadFocusKey()
end

function M:OnEditTextFocusLost()
  self:UpdateGamePadFocusKey()
  if self.IsLastInputDeviceTypeGamepad then
    self.IsLastInputDeviceTypeGamepad = false
    self:UpdateBtns()
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if not self.Text_Input:HasAnyUserFocus() then
    self:FocusInputField()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

AssembleComponents(M)
return M
