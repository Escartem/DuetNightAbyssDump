require("UnLua")
local StringUtils = require("Utils.StringUtils")
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local WBP_Common_Dialog_ChatReport_C = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function WBP_Common_Dialog_ChatReport_C:Construct()
  WBP_Common_Dialog_ChatReport_C.Super.Construct(self)
  self.bTipsShowed = false
  self.TipsText = ""
  self.CheckedTypes = {}
end

function WBP_Common_Dialog_ChatReport_C:Destruct()
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
    if IsValid(GameInputModeSubsystem) then
      GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
    end
  end
end

function WBP_Common_Dialog_ChatReport_C:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  self.ChatMessage = Params.ChatMassage
  self.Owner = Owner
  self.Owner:GetButtonBar().Btn_Yes:BindEventOnReleased(self, self.OnBtnYes)
  self.Owner:GetButtonBar().Btn_Yes:ForbidBtn(true)
  self.Owner:GetButtonBar().Btn_Quit:BindEventOnReleased(self, self.OnBtnNo)
  self.Text_Title:SetText(string.format("%s: ", GText("UI_COMMONPOP_TEXT_100090_1")))
  self.Text_PlayerName:SetText(string.format("%s ", Params.PlayerName))
  self.Text_PlayerUID:SetText(string.format(" UID%s", Params.UID))
  self.Text_ReportTypeTitle:SetText(GText("UI_COMMONPOP_TEXT_100090_2"))
  self.List_Report:ClearListItems()
  for Id, value in pairs(CommonConst.ReportType) do
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.Owner = self
    Obj.Id = Id
    Obj.value = value
    self.List_Report:AddItem(Obj)
  end
  self.Text_ReportDescTitle:SetText(GText("UI_COMMONPOP_TEXT_100090_11"))
  Params.OwnerDialog = Owner
  local EditTextConfig = Params.EditTextConfig or {}
  EditTextConfig.Events = EditTextConfig.Events or {}
  if not EditTextConfig.Events.OnTextChanged then
    function EditTextConfig.Events.OnTextChanged(Owner, InText)
      self:RefreshForbidBtn(nil, InText)
    end
  end
  self.Com_Input_Multiline_Light:Init(EditTextConfig, Params)
  self.Btn_Yes = self.Owner:GetButtonBar().Btn_Yes
  self.Btn_Yes:SetGamePadImg("Y")
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
    if IsValid(GameInputModeSubsystem) then
      GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
      self:RefreshOpInfoByInputDevice(GameInputModeSubsystem:GetCurrentInputType(), GameInputModeSubsystem:GetCurrentGamepadName())
    end
    self.GamepadAKeyIndex = self:ShowGamepadShortcutBtn({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
          Owner = self
        }
      },
      Desc = GText("UI_CTL_Select"),
      bLongPress = false
    })
    self.Com_Input_Multiline_Light:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
    self.Com_Input_Multiline_Light:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  end
end

function WBP_Common_Dialog_ChatReport_C:OnTextComposing()
  if self.bTipsShowed then
    self.Owner:HideDialogTip(2, false)
    self.bTipsShowed = false
  end
end

function WBP_Common_Dialog_ChatReport_C:OnCheckTextLegality(InText)
end

function WBP_Common_Dialog_ChatReport_C:OnTextChange(InText)
  if self.Com_Input_Multiline_Light:Utf8StrLen(InText) >= self.Com_Input_Multiline_Light.TextLimit then
    self:ShowTips(InText, 1, 1.5)
  end
end

function WBP_Common_Dialog_ChatReport_C:OnChatItemChange(CheckState, Obj)
  if CheckState then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_checkbox_check", nil, nil)
    self:AddSelection(Obj)
  else
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_checkbox_uncheck", nil, nil)
    self:RemoveSelection(Obj)
  end
end

function WBP_Common_Dialog_ChatReport_C:AddSelection(Obj)
  if not self.CheckedTypes[Obj.Id] then
    self.CheckedTypes[Obj.Id] = true
  end
  self:RefreshForbidBtn(false, nil)
end

function WBP_Common_Dialog_ChatReport_C:RemoveSelection(Obj)
  if self.CheckedTypes[Obj.Id] then
    self.CheckedTypes[Obj.Id] = nil
  end
  if self:_isDictionaryEmpty(self.CheckedTypes) then
    self:RefreshForbidBtn(true, nil)
  end
end

function WBP_Common_Dialog_ChatReport_C:RefreshForbidBtn(IsEmptyChecked, InText)
  if nil == IsEmptyChecked then
    IsEmptyChecked = self:_isDictionaryEmpty(self.CheckedTypes)
  end
  if nil == InText then
    InText = self.Com_Input_Multiline_Light:GetText()
  end
  local IsForbidBtn = IsEmptyChecked or "" == InText
  self.Owner:GetButtonBar().Btn_Yes:ForbidBtn(IsForbidBtn)
  self.Owner.ForbidRightBtn = IsForbidBtn
end

function WBP_Common_Dialog_ChatReport_C:_isDictionaryEmpty(dict)
  for _ in pairs(dict) do
    return false
  end
  return true
end

function WBP_Common_Dialog_ChatReport_C:GetCheckedTypes(CheckedTypes)
  local CheckedTypesStr = {}
  for Index, _ in pairs(CheckedTypes) do
    local TypeIndex = tonumber(Index)
    local TypeId = DataMgr.ChatReportType[TypeIndex].Id
    table.insert(CheckedTypesStr, TypeId)
  end
  return table.concat(CheckedTypesStr, "&")
end

function WBP_Common_Dialog_ChatReport_C:OnBtnYes()
  if self.Owner.ForbidRightBtn then
    UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Chat_Report_None"))
    return
  end
  local reportDesc = self.Com_Input_Multiline_Light:GetText()
  local CheckedTypesStr = self:GetCheckedTypes(self.CheckedTypes)
  local BannedHint = GText("UI_REGISTER_BANNEDINPUT")
  ChatController:CheckTextValid(reportDesc, function(bValid, Text)
    if bValid then
      reportDesc = Text
      GWorld:GetAvatar():ReportChat(CheckedTypesStr, reportDesc, self.ChatMessage)
      self.Owner.DontCloseWhenRightBtnClicked = false
      self.Owner:OnClose()
    end
  end, function(TipText)
    if #reportDesc > 0 then
      self:ShowTips("UI_REGISTER_BANNEDINPUT", 1, 0)
    end
  end, {}, true)
end

function WBP_Common_Dialog_ChatReport_C:ShowTips(TipText, Style, Time)
  self.Com_Input_Multiline_Light:ShowTips(TipText, Style)
  if self.bTipsShowed and self.TipsText == TipText then
    return
  end
  self.TipsText = TipText
  if self:IsExistTimer(self.TipTimerKey) then
    self:RemoveTimer(self.TipTimerKey)
    self.Owner:HideDialogTip(1, false)
    self.Owner:HideDialogTip(2, false)
  end
  local TipIndex = 1 == Style and 1 or 2
  local Params = {
    DialogItemIndex = TipIndex,
    bHideDialogItem = false,
    bShouldPlayAnim = true,
    Tips = {TipText, TipText}
  }
  AudioManager(self):PlayUISound(self, "event:/ui/common/input_err", nil, nil)
  self.Owner:BroadcastDialogEvent("UpdateDialogTipText", Params)
  self.Owner:BroadcastDialogEvent(DialogEvent.HideDialogItem, Params)
  self.bTipsShowed = true
  self:AddTimer(1.5, function()
    if Time and 0 ~= Time then
      self.Owner:HideDialogTip(TipIndex, false)
      self.bTipsShowed = false
    end
  end, false, 0, self.TipTimerKey)
end

function WBP_Common_Dialog_ChatReport_C:CloseTip(TipText)
  local Params = {
    DialogItemIndex = 2,
    bHideDialogItem = true,
    bShouldPlayAnim = true,
    Tips = {TipText, TipText}
  }
  self.Owner:BroadcastDialogEvent(DialogEvent.HideDialogItem, Params)
  self.bTipsShowed = false
end

function WBP_Common_Dialog_ChatReport_C:OnBtnNo()
  self.Owner:OnClose()
end

function WBP_Common_Dialog_ChatReport_C:OnClose()
  self.Owner:GetButtonBar().Btn_Yes:UnbindEventOnReleased(self)
  self.Owner:GetButtonBar().Btn_Quit:UnbindEventOnReleased(self)
end

function WBP_Common_Dialog_ChatReport_C:OnContentFocusReceived()
  self.List_Report:SetFocus()
end

function WBP_Common_Dialog_ChatReport_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  end
  if IsEventHandled then
    return UWidgetBlueprintLibrary.Handled()
  end
  return UWidgetBlueprintLibrary.UnHandled()
end

function WBP_Common_Dialog_ChatReport_C:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == Const.GamepadFaceButtonUp then
    if not self.Owner.ForbidRightBtn then
      self:OnBtnYes()
    end
    IsEventHandled = true
  elseif InKeyName == Const.GamepadFaceButtonLeft then
    self.Com_Input_Multiline_Light:FocusInputField()
    self:UpdateUIStyleInPlatform()
    IsEventHandled = true
  elseif InKeyName == Const.GamepadLeftThumbstick then
    self.Com_Input_Multiline_Light:OnDeleteBtnClicked()
    self.Com_Input_Multiline_Light:FocusInputField()
    IsEventHandled = true
  end
  return IsEventHandled
end

function WBP_Common_Dialog_ChatReport_C:OnUpdateUIStyleByInputTypeChange(CurInputDeviceType, CurGamepadName)
  if CurInputDeviceType == ECommonInputType.Gamepad then
    if self.Com_Input_Multiline_Light:HasFocusedDescendants() then
      self.Com_Input_Multiline_Light:FocusInputField()
    else
      self.List_Report:SetFocus()
    end
  end
  self.CurInputDeviceType = CurInputDeviceType
  self:UpdateUIStyleInPlatform()
end

function WBP_Common_Dialog_ChatReport_C:UpdateUIStyleInPlatform()
  if not self.GamepadAKeyIndex then
    return
  end
  local IsGamepad = self.CurInputDeviceType == ECommonInputType.Gamepad
  if IsGamepad and self.List_Report:HasFocusedDescendants() then
    self:ShowGamepadShortcut(self.GamepadAKeyIndex)
  else
    self:HideGamepadShortcut(self.GamepadAKeyIndex)
  end
end

return WBP_Common_Dialog_ChatReport_C
