require("UnLua")
local StringUtils = require("Utils.StringUtils")
local M = {}

function M:Construct()
  self.Group_InputTips:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_Input:SetText("")
  self.Text_Input.OnFocusReceived:Add(self, self.OnEditTextFocusReceived)
  self.Text_Input.OnFocusLost:Add(self, self.OnEditTextFocusLost)
  self.Text_Input.OnCursorMoved:Add(self, self.OnEditTextCursorMoved)
  self.Text_Input.OnDoubleClicked:Add(self, self.OnDoubleClicked)
  self.Text_Input.OnTextChanged:Add(self, self.HandleOnTextChanged)
  self.Text_Input.OnTextComposing:Add(self, self.HandleOnTextComposing)
  self.Text_Input.OnTextCommitted:Add(self, self.HandleOnTextCommitted)
  self.TextLimit = 9999
  self.bNeedPasteBtn = false
  self:SetHintText(GText("UI_Chat_InputHint"))
  self.NewText = ""
  self.CurrentText = ""
  self.ComposingText = ""
  self.bTipsShowed = false
  self.CursorLineIdx = 0
  self.CursorOffset = 0
  self.IgnoredSpaceCount = 0
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self:GetOwningPlayer())
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
  self.DefaultFocusKeyName = "X"
  self.DefaultPasteKeyName = "LS"
  self:PlayAnimation(self.Normal)
end

function M:Destruct()
  self.Text_Input.OnFocusReceived:Clear()
  self.Text_Input.OnFocusLost:Clear()
  self.Text_Input.OnCursorMoved:Clear()
  self.Text_Input.OnDoubleClicked:Clear()
  self.Text_Input.OnTextChanged:Clear()
  self.Text_Input.OnTextComposing:Clear()
  self.Text_Input.OnTextCommitted:Clear()
  self.Text_Input.OnReleased:Clear()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:Init(Config, DialogParams)
  Config = Config or {}
  self.Owner = Config.Owner
  self:SetText(Config.Text or "")
  self:BindEvent(Config.Events or {})
  self.HintText = Config.HintText or GText("UI_Chat_InputHint")
  self.bLimitBr = Config.bLimitBr
  self.TextLimit = Config.TextLimit or 9999
  self.bLimitSpaces = Config.bLimitSpaces
  self.bNeedPasteBtn = Config.bNeedPasteBtn
  self.DialogParams = DialogParams
  self.OnGetBackFocusWidget = Config.OnGetBackFocusWidget
  self.BackFocusWidget = Config.BackFocusWidget or self.DialogParams and self.DialogParams.OwnerDialog or self.Owner
  self:SetHintText(self.HintText)
  self:SetResidentTips(Config.ResidentTipText)
  self.CurrentText = self:GetText()
  self.ComposingText = self.CurrentText
  self.FocusKey = Config.FocusKey or Const.GamepadFaceButtonLeft
  local FocusKeyName = Config.FocusKeyName or self.DefaultFocusKeyName
  local PasteKeyName = Config.PasteKeyName or self.DefaultPasteKeyName
  self:SetGamePadKey(FocusKeyName, PasteKeyName)
end

function M:SetGamePadKey(FocusKeyName, PasteKeyName)
  if FocusKeyName and PasteKeyName then
    self.IsShowGamPadKey = true
    local FocusKeyImgPath = UIUtils.UtilsGetKeyIconPathInGamepad(FocusKeyName)
    self.Image_ControllerChooseKey:SetBrushFromTexture(LoadObject(FocusKeyImgPath))
    local PasteKeyImgPath = UIUtils.UtilsGetKeyIconPathInGamepad(PasteKeyName)
    self.Image_ControllerControlKey:SetBrushFromTexture(LoadObject(PasteKeyImgPath))
  else
    self.IsShowGamPadKey = false
  end
  self:UpdateBtns()
  self:UpdateGamePadFocusKey()
end

function M:BindEvent(Events)
  Events = Events or {}
  self.OnTextChanged = Events.OnTextChanged
  self.OnTextComposing = Events.OnTextComposing
  self.OnTextCommitted = Events.OnTextCommitted
  self.OnEditTextFocusEvent = Events.OnFocusReceived
  self.OnEditTextFocusLostEvent = Events.OnFocusLost
  self.OnCheckTextLegality = Events.OnCheckTextLegality
  self.OnTextLengthExceedLimit = Events.OnTextLengthExceedLimit
end

function M:SetHintText(Text)
  self.Text_Input:SetHintText(Text)
end

function M:SetText(Text)
  Text = Text or ""
  self:TrySetText(Text)
end

function M:InsertText(InStr, Position)
  InStr = InStr or ""
  local NewCursotPos
  if nil == Position then
    NewCursotPos = self.CursorOffset + UKismetStringLibrary.Len(InStr)
  end
  Position = Position or self.CursorOffset
  local SelfStr = self.Text_Input:GetText()
  local LeftStr = UE4.UKismetStringLibrary.GetSubstring(SelfStr, 0, Position)
  local RightStr = UE4.UKismetStringLibrary.GetSubstring(SelfStr, Position, UE4.UKismetStringLibrary.Len(SelfStr))
  local Text = LeftStr .. InStr .. RightStr
  self:TrySetText(Text)
  if NewCursotPos then
    self:SetCursorPosition(self.CursorLineIdx, NewCursotPos)
  end
end

function M:GetText()
  return self.Text_Input:GetText()
end

function M:SetTextLimit(TextLimit)
  self.TextLimit = TextLimit
end

function M:ShowTips(TipText, Style, Time)
  if not TipText then
    return
  end
  if self.bTipsShowed and self.TipsText == TipText then
    return
  end
  self.TipsText = TipText
  Style = Style or 1
  if self.DialogParams then
    if self.HasResidentTips or self.bTipsShowed then
      self.DialogParams.bHideDialogItem = true
      self.DialogParams.OwnerDialog:BroadcastDialogEvent(DialogEvent.HideDialogItem, self.DialogParams)
    end
    self.DialogParams.bHideDialogItem = false
    self.DialogParams.DialogItemIndex = Style
    self.DialogParams.Tips = self.DialogParams.Tips or {}
    self.DialogParams.Tips[self.DialogParams.DialogItemIndex] = TipText
    self.DialogParams.OwnerDialog:BroadcastDialogEvent("UpdateDialogTipText", self.DialogParams)
    self.DialogParams.OwnerDialog:BroadcastDialogEvent(DialogEvent.HideDialogItem, self.DialogParams)
  else
    self.Group_InputTips:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.InputTips:StopAnimation(self.InputTips.Remind_Out)
    self.InputTips:PlayAnimation(self.InputTips.Remind_In)
    if 1 == Style then
      self.InputTips.Group_Forbbiden:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      self.InputTips.Group_Limit:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.InputTips.Group_Forbbiden:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.InputTips.Group_Limit:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    end
    self.InputTips.Text_InputTips:SetText(TipText)
  end
  self.bTipsShowed = true
  self:RemoveTimer("DelayHideTips")
  if Time and 0 ~= Time then
    self:AddTimer(Time, function()
      self:HideTips()
    end, false, 0, "DelayHideTips", true)
  end
end

function M:SetResidentTips(TipText)
  if TipText and "" ~= TipText then
    self.HasResidentTips = true
  else
    self.HasResidentTips = false
  end
  if self.DialogParams then
    if self.HasResidentTips then
      self.DialogParams.Tips = self.DialogParams.Tips or {}
      self.DialogParams.Tips[3] = TipText
      self.DialogParams.OwnerDialog:BroadcastDialogEvent("UpdateDialogTipText", self.DialogParams)
    end
    if not self.bTipsShowed then
      self.DialogParams.DialogItemIndex = 3
      self.DialogParams.bHideDialogItem = false
      self.DialogParams.OwnerDialog:BroadcastDialogEvent(DialogEvent.HideDialogItem, self.DialogParams)
    end
  end
end

function M:HideTips()
  if self.bTipsShowed then
    self.bTipsShowed = false
    if self.DialogParams then
      self.DialogParams.bHideDialogItem = true
      self.DialogParams.OwnerDialog:BroadcastDialogEvent(DialogEvent.HideDialogItem, self.DialogParams)
      if self.HasResidentTips then
        self.DialogParams.DialogItemIndex = 3
        self.DialogParams.bHideDialogItem = false
        self.DialogParams.OwnerDialog:BroadcastDialogEvent(DialogEvent.HideDialogItem, self.DialogParams)
      end
    else
      self.InputTips:StopAnimation(self.InputTips.Remind_In)
      self.InputTips:PlayAnimation(self.InputTips.Remind_Out)
    end
  end
end

function M:PasteText()
  self:OnPasteBtnClicked()
end

function M:ChangeKeyByInputDevice(InputDevice)
  self:RefreshOpInfoByInputDevice(InputDevice)
end

function M:CheckTextLegality(Text, NeedLengthTips)
  local bLegal = true
  local ResText = Text
  local Len = self:Utf8StrLen(Text)
  if Len < self.TextLimit then
    self:HideTips()
  else
    if NeedLengthTips then
      self:ShowTips(GText("UI_REGISTER_OVERLENGTH"), 2, self.LengthLimitTipsDuration or 1.5)
    end
    local NeedClampText
    if self.OnTextLengthExceedLimit then
      NeedClampText = self.OnTextLengthExceedLimit(self.Owner, ResText)
    end
    if NeedClampText or nil == NeedClampText then
      ResText = self:ClampText(ResText, self.TextLimit)
    end
  end
  if self.OnCheckTextLegality then
    bLegal, ResText = self.OnCheckTextLegality(self.Owner, ResText)
  end
  return bLegal, ResText
end

function M:Utf8StrLen(Str)
  local Len = 0
  local TextTable = StringUtils.Utf8ToTable(Str)
  for _, value in ipairs(TextTable) do
    if string.len(value) <= 1 then
      Len = Len + 1
    else
      Len = Len + 2
    end
  end
  return Len
end

function M:ClampText(Text, MaxLen)
  local Len = 0
  local ResText = ""
  local TextTable = StringUtils.Utf8ToTable(Text)
  local CharLen = 0
  for _, value in ipairs(TextTable) do
    CharLen = string.len(value)
    if CharLen > 1 then
      CharLen = 2
    end
    if MaxLen >= CharLen + Len then
      Len = CharLen + Len
      ResText = ResText .. value
    else
      break
    end
  end
  return ResText
end

function M:FilterSpaceAndBr(Text)
  if not self.bLimitSpaces and not self.bLimitBr then
    return Text
  end
  if self.bLimitBr then
    Text = string.gsub(Text, "\n", "")
    Text = string.gsub(Text, "\r", "")
  end
  local DeletedSpaceCount = 0
  local DeletedBrCount = 0
  local Res = ""
  local TextTable = StringUtils.Utf8ToTable(Text)
  local bIsLastCharSpace = false
  for _, value in ipairs(TextTable) do
    if self.bLimitSpaces and (" " == value or "\227\128\128" == value) then
      if not bIsLastCharSpace then
        Res = Res .. value
      else
        DeletedSpaceCount = DeletedSpaceCount + 1
      end
      bIsLastCharSpace = true
    else
      Res = Res .. value
      bIsLastCharSpace = false
    end
  end
  return Res, DeletedSpaceCount, DeletedBrCount
end

function M:HandleOnTextChanged(Text)
  self.NewText = Text
  self.bHasNewText = true
  self.bCursorMoveByComposing = false
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    local InputSetting = UE4.UInputSettings.GetInputSettings()
    if InputSetting and not InputSetting.bUseMouseForTouch then
      self:OnEditTextCursorMoved(0, UKismetStringLibrary.Len(self.NewText))
    end
  end
end

function M:CorrectText(Text, NeedLengthTips)
  Text, self.IgnoredSpaceCount, self.IgnoredBrCount = self:FilterSpaceAndBr(Text)
  local bLegal, LegalText = self:CheckTextLegality(Text, NeedLengthTips)
  if not bLegal then
    self:RealSetText(self.CurrentText)
    return false, self.CurrentText
  else
    self:RealSetText(LegalText)
  end
  return true, LegalText
end

function M:HandleOnTextComposing(Text)
  self.bCursorMoveByComposing = true
  self.ComposingText = Text
  self:UpdateBtns()
  if self.OnTextComposing then
    self.OnTextComposing(self.Owner, Text)
  end
end

function M:HandleOnTextCommitted(Text, CommitMethod)
  if self.OnTextCommitted then
    self.OnTextCommitted(self.Owner, Text, CommitMethod)
  end
end

function M:OnPasteBtnClicked()
  local Str = ULowEntryExtendedStandardLibrary.ClipboardGet()
  Str = string.gsub(Str, "^[%s\n\r\t]*(.-)[%s\n\r\t]*$", "%1")
  self:TrySetText(Str)
  self:FocusInputField()
end

function M:FocusInputField()
  self._bFocusing = true
  self.Text_Input:SetFocus()
  self._bFocusing = false
end

function M:OnDeleteBtnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  self:TrySetText("")
  self:FocusInputField()
end

function M:TrySetText(Text)
  self.Text_Input:SetText(Text)
  self:SetCursorPosition(self.CursorLineIdx, self.CursorOffset + UKismetStringLibrary.Len(Text))
  self:UpdateBtns()
end

function M:RealSetText(Text)
  self.Text_Input.OnTextChanged:Clear()
  self.Text_Input.OnCursorMoved:Clear()
  self.Text_Input:SetText(Text)
  self.Text_Input.OnCursorMoved:Add(self, self.OnEditTextCursorMoved)
  self.Text_Input.OnTextChanged:Add(self, self.HandleOnTextChanged)
  self.CurrentText = Text
  self.ComposingText = Text
  self:UpdateBtns()
end

function M:OnEditTextFocusReceived()
  if self._bFocusing then
    self:StopAnimation(self.Normal)
    self:PlayAnimation(self.Press)
    self:PlayAnimation(self.Click)
  end
  self:HideTips()
  if self.OnEditTextFocusEvent then
    self.OnEditTextFocusEvent(self.Owner)
  end
end

function M:OnFocusLost(InFocusEvent)
end

function M:OnEditTextFocusLost()
  if self.bHasNewText and CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self:OnEditTextCursorMoved(0, UKismetStringLibrary.Len(self.NewText))
  end
  if self.OnEditTextFocusLostEvent then
    self.OnEditTextFocusLostEvent(self.Owner)
  end
end

function M:OnEditTextCursorMoved(LineIdx, Offset)
  if self.bHasNewText then
    self.bHasNewText = false
    local OldText = self.CurrentText
    local bNeedCallback, CorrectedText = self:CorrectText(self.NewText, true)
    if bNeedCallback then
      if self.OnTextChanged then
        self.OnTextChanged(self.Owner, CorrectedText)
      end
    else
      self:SetCursorPosition(self.CursorLineIdx, self.CursorOffset)
      return
    end
    if CorrectedText ~= OldText and (self.CursorLineIdx ~= LineIdx or self.CursorOffset ~= Offset) then
      self.CursorLineIdx = LineIdx
      self.CursorOffset = Offset - (self.IgnoredSpaceCount or 0)
      self.IgnoredSpaceCount = 0
    end
    self:SetCursorPosition(self.CursorLineIdx, self.CursorOffset)
    return
  end
  if self.bCursorMoveByComposing then
    return
  end
  self.CursorLineIdx = LineIdx
  self.CursorOffset = Offset
end

function M:SetCursorPosition(LineIdx, Offset)
  self.Text_Input:CursorGoto(LineIdx, Offset)
end

function M:OnDoubleClicked()
  self.Text_Input:SelectAllText()
end

function M:UpdateBtns()
end

function M:UpdateGamePadFocusKey()
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  if CurInputDevice == ECommonInputType.Gamepad then
    self.Text_Input.HoverAnimName = ""
  else
    self.Text_Input.HoverAnimName = "Hover"
  end
  if self.Text_Input:HasAnyUserFocus() and self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.Text_Input.HoverAnimName = ""
    self.IsLastInputDeviceTypeGamepad = true
  else
    self.IsLastInputDeviceTypeGamepad = false
  end
  self.CurInputDeviceType = CurInputDevice
  self:UpdateBtns()
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if (InKeyName == Const.GamepadFaceButtonRight or InKeyName == self.FocusKey) and self.Text_Input:HasAnyUserFocus() and self.CurInputDeviceType == ECommonInputType.Gamepad then
    local Widget
    if self.OnGetBackFocusWidget then
      Widget = self.OnGetBackFocusWidget(self.Owner)
    end
    Widget = Widget or self.BackFocusWidget
    if Widget then
      return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), Widget)
    end
  end
  return UIUtils.Unhandled
end

return M
