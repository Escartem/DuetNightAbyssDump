require("UnLua")
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function M:PreInitContent(Params, PopupData, Owner)
  self.Super.PreInitContent(self, Params, PopupData, Owner)
  if not Params then
    return
  end
  if Params.UseGenaral then
    self._components = {
      "BluePrints.UI.UI_PC.Common.Common_Dialog.WBP_CommonDialog_InputGenaral_C"
    }
  elseif Params.UseReName then
    self._components = {
      "BluePrints.UI.UI_PC.Common.Common_Dialog.WBP_CommonDialog_Input_PC_C"
    }
  end
  AssembleComponents(self)
end

function M:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  self.PackageKey = "ComDialogInput"
  self.Params = Params
  self.bNeedCheckStringSensitive = false
  self.OnCheckStringSensitive = nil
  Owner.bShoulFocusToLastFocusedWidget = false
  Params.OwnerDialog = Owner
  local EditTextConfig = Params.EditTextConfig or {}
  self.bNeedCheckStringSensitive = EditTextConfig.bNeedCheckStringSensitive
  self.OnCheckStringSensitive = EditTextConfig.OnCheckStringSensitive
  self.bNotAllowEmpty = EditTextConfig.bNotAllowEmpty
  Params.OwnerDialog = Owner
  if Params.IsMultiLine then
    self.WS_Input:SetActiveWidgetIndex(0)
    self.CurrentInputWidget = self.Input_Multiline
    self.Input_Multiline:Init(EditTextConfig, Params)
  else
    self.WS_Input:SetActiveWidgetIndex(1)
    self.CurrentInputWidget = self.Input
    self.Input:Init(EditTextConfig, Params)
  end
  if self.bNeedCheckStringSensitive then
    self.bSuccess = false
    Owner.DontCloseWhenRightBtnClicked = true
    self:BindDialogEvent(DialogEvent.OnRightBtnClicked, self.OnDialogRightBtnClicked)
  end
  self:InitContentComp(Params, PopupData, Owner)
end

function M:OnDialogRightBtnClicked()
  local Str = self:GetText()
  if self.bNotAllowEmpty then
    local TrimStr = string.trim(Str)
    if "" == TrimStr then
      self:ShowTips(GText("UI_REGISTER_EMPTY"), 2)
      return
    end
  end
  if self.bNeedCheckStringSensitive then
    HeroUSDKUtils.CheckStringSensitive(self, Str, function()
      self.bSuccess = false
      self:ShowTips(GText("UI_REGISTER_BANNEDINPUT"), 1)
      if self.OnCheckStringSensitive then
        self.OnCheckStringSensitive(self.Params.Owner, self.bSuccess, self:GetText())
      end
    end, function()
      self.bSuccess = true
      if self.OnCheckStringSensitive then
        self.OnCheckStringSensitive(self.Params.Owner, self.bSuccess, self:GetText())
      end
      self.Params.OwnerDialog:OnClose()
    end, false)
  end
end

function M:PackageData()
  return {
    Text = self:GetText(),
    bSuccess = self.bSuccess
  }
end

function M:InitContentComp(Params, PopupData, Owner)
end

function M:SetGamePadKey(FocusKeyName, PasteKeyName)
  self.CurrentInputWidget:SetGamePadKey(FocusKeyName, PasteKeyName)
end

function M:BindEvent(Events)
  self.CurrentInputWidget:BindEvent(Events)
end

function M:SetHintText(Text)
  self.CurrentInputWidget:SetHintText(Text)
end

function M:SetText(Text)
  self.CurrentInputWidget:SetText(Text)
end

function M:InsertText(InStr, Position)
  self.CurrentInputWidget:InsertText(InStr, Position)
end

function M:GetText()
  return self.CurrentInputWidget:GetText()
end

function M:SetTextLimit(TextLimit)
  self.CurrentInputWidget:SetTextLimit(TextLimit)
end

function M:ShowTips(TipText, Style)
  self.CurrentInputWidget:ShowTips(TipText, Style)
end

function M:SetResidentTips(TipText)
  self.CurrentInputWidget:SetResidentTips(TipText)
end

function M:HideTips()
  self.CurrentInputWidget:HideTips()
end

function M:OnContentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_LeftThumbstick" == InKeyName then
      self.CurrentInputWidget:SetText("")
    elseif "Gamepad_FaceButton_Left" == InKeyName then
      self.CurrentInputWidget:SetFocus()
    end
  end
end

function M:OnContentFocusReceived()
end

return M
