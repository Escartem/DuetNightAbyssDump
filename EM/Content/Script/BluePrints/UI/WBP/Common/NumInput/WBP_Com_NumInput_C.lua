require("UnLua")
local StringUtils = require("Utils.StringUtils")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})
local MAX_NUMBER_COUNT = 5

function M:Construct()
  self.IsForbidStyleUpdate = false
  self.CurInputNumber = nil
  self.CurInputDeviceType = nil
  self.Text_Input.OnTextChanged:Add(self, self.OnInputTextChanged)
  self.Text_Input.OnPressed:Add(self, self.ExecOnTextOnPressed)
  self.Text_Input.OnTextCommitted:Add(self, self.ExecOnTextCommintted)
  self.Text_Input.OnFocusReceived:Add(self, self.EditOnTextFocusReceived)
  self.Text_Input.OnFocusLost:Add(self, self.EditOnTextFocusLost)
end

function M:Destruct()
  self.Text_Input.OnTextChanged:Remove(self, self.OnInputTextChanged)
  self.Text_Input.OnPressed:Clear()
  self.Text_Input.OnTextCommitted:Clear()
  self.Text_Input.OnFocusReceived:Clear()
  self.Text_Input.OnFocusLost:Clear()
  self:ClearListenEvent()
end

function M:Init(ConfigData)
  self.ConfigData = ConfigData
  self.CurInputNumber = ConfigData.InitValue or 1
  self.MinValue = ConfigData.MinValue or 1
  self.MaxValue = ConfigData.MaxValue or 999
  self.ClickInterval = ConfigData.ClickInterval or 1
  self.MinusBtnCallback = ConfigData.MinusBtnCallback
  self.MinusBtnForbidCallback = ConfigData.MinusBtnForbidCallback
  self.AddBtnCallback = ConfigData.AddBtnCallback
  self.AddBtnForbidCallback = ConfigData.AddBtnForbidCallback
  self.MinBtnCallback = ConfigData.MinBtnCallback
  self.MinBtnForbidCallback = ConfigData.MinBtnForbidCallback
  self.MaxBtnCallback = ConfigData.MaxBtnCallback
  self.MaxBtnForbidCallback = ConfigData.MaxBtnForbidCallback
  self.InputCallback = ConfigData.InputCallback
  self.SoundResPath = ConfigData.SoundResPath or {}
  self.IsNotAllowTextFieldInput = ConfigData.IsNotAllowTextFieldInput
  self.LeaveFocusWidget = ConfigData.LeaveFocusWidget or ConfigData.OwnerPanel
  self.OwnerPanel = ConfigData.OwnerPanel
  self.ViewGamePad = ConfigData.ViewGamePad or "SpecialLeft"
  self:BindAllClickAction()
  self:RefreshBaseInfo()
  self:InitListenEvent()
end

function M:BindAllClickAction()
  self.Btn_Min:BindEventOnClicked(self, self.OnClickToMinus)
  self.Btn_Min:BindForbidStateExecuteEvent(self, self.OnClickToMinusInForbidState)
  self.Btn_Add:BindEventOnClicked(self, self.OnClickToAdd)
  self.Btn_Add:BindForbidStateExecuteEvent(self, self.OnClickToAddInForbidState)
  self.Btn_Mini:BindEventOnClicked(self, self.OnClickToMin)
  self.Btn_Mini:BindForbidStateExecuteEvent(self, self.OnClickToMinInForbidState)
  self.Btn_Max:BindEventOnClicked(self, self.OnClickToMax)
  self.Btn_Max:BindForbidStateExecuteEvent(self, self.OnClickToMaxInForbidState)
  
  function self.Btn_Min.SoundFunc(Btn)
    local EventSoundPath = self.SoundResPath.Minus or "event:/ui/common/click_btn_minus"
    AudioManager(self):PlayUISound(self.Btn_Min, EventSoundPath, nil, nil)
  end
  
  function self.Btn_Add.SoundFunc(Btn)
    local EventSoundPath = self.SoundResPath.Add or "event:/ui/common/click_btn_add"
    AudioManager(self):PlayUISound(self.Btn_Add, EventSoundPath, nil, nil)
  end
  
  function self.Btn_Mini.SoundFunc(Btn)
    local EventSoundPath = self.SoundResPath.Max or "event:/ui/common/click_level_01"
    AudioManager(self):PlayUISound(self.Btn_Mini, EventSoundPath, nil, nil)
  end
  
  function self.Btn_Max.SoundFunc(Btn)
    local EventSoundPath = self.SoundResPath.Max or "event:/ui/common/click_btn_addMulti"
    AudioManager(self):PlayUISound(self.Btn_Max, EventSoundPath, nil, nil)
  end
end

function M:SetSimpleMode(bSimpleMode)
  self.IsSimpleMode = bSimpleMode
  if bSimpleMode then
    self.WS_Left:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.WS_Right:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.WS_Left:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.WS_Right:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:RefreshBaseInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self.Text_Num:SetText(tostring(self.CurInputNumber))
  self:RefreshBtnState()
  if self.MinBtnCallback ~= nil then
    self.Group_BtnMini:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Group_ControllerMini:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if nil ~= self.MaxBtnCallback then
    self.Group_BtnMax:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Group_ControllerMax:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if self.IsNotAllowTextFieldInput then
    self.Text_Input:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Group_View:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Text_Input:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  self:InitWidgetInfoInGamePad()
end

function M:InitWidgetInfoInGamePad()
  self.Key_ControllerMini_Text:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Left"}
    },
    Desc = GText("UI_SHOP_MIN")
  })
  self.Key_Min:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LT"}
    }
  })
  self.Key_ControllerMax_Text:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Right"}
    },
    Desc = GText("UI_SHOP_MAX")
  })
  self.Key_Add:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RT"}
    }
  })
  self.Key_View:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey[self.ViewGamePad]
      }
    }
  })
  self.Key_Cancel:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    }
  })
  self.Text_Cancel:SetText(GText("UI_PATCH_CANCEL"))
  self.Group_ControllerTips:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:SetIsForbidStyleUpdate(bIsForbidStyleUpdate)
  self.IsForbidStyleUpdate = bIsForbidStyleUpdate
end

function M:IsCanChangeToGamePadViewMode(bIsForbidStyleUpdate)
  return not self.IsForbidStyleUpdate
end

function M:IsCanChangeToPCViewMode()
  return not self.IsForbidStyleUpdate
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  if CurInputType == ECommonInputType.MouseAndKeyboard and not self:IsCanChangeToGamePadViewMode() then
    DebugPrint("Com_NumInput OnUpdateUIStyleByInputTypeChange, Now Is forbid Change to GamePad View! CurInputType is", CurInputType)
    return
  end
  if CurInputType == ECommonInputType.Gamepad and not self:IsCanChangeToPCViewMode() then
    DebugPrint("Com_NumInput OnUpdateUIStyleByInputTypeChange, Now is forbid Change to PC View! CurInputType is", CurInputType)
    return
  end
  self.CurInputDeviceType = CurInputType
  local IsUseKeyAndMouse = CurInputType == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse, CurGamepadName)
end

function M:UpdateUIStyleInPlatform(IsUseKeyAndMouse, CurGamepadName)
  local ActiveWidgetIndex = IsUseKeyAndMouse and 0 or 1
  self.WS_Left:SetActiveWidgetIndex(ActiveWidgetIndex)
  self.WS_Right:SetActiveWidgetIndex(ActiveWidgetIndex)
  if IsUseKeyAndMouse then
    self.Group_View:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    if self.Text_Input ~= nil and self.Text_Input:IsVisible() then
      self.Group_View:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    self:UpdateHotKeyImage(CurGamepadName)
  end
end

function M:OverrideValueLimit(InitValue, MaxValue, MinValue, bRefresh)
  self.CurInputNumber = InitValue or 1
  self.MaxValue = MaxValue or 999
  self.MinValue = MinValue or 1
  if bRefresh then
    self:RefreshBaseInfo()
  else
    self:RefreshBtnState()
  end
end

function M:RefreshCurInputNumber(NewNumber)
  self.CurInputNumber = NewNumber or 1
  if self.IsSimpleMode then
    self.Text_Num:SetText(tostring(self.CurInputNumber))
    self:RefreshBtnState()
  else
    self:RefreshBaseInfo()
  end
end

function M:RefreshBtnState()
  self.Btn_Add:ForbidBtn(self.CurInputNumber + self.ClickInterval > self.MaxValue)
  self.Btn_Max:ForbidBtn(self.CurInputNumber + self.ClickInterval > self.MaxValue)
  self.Btn_Min:ForbidBtn(self.CurInputNumber - self.ClickInterval < self.MinValue)
  self.Btn_Mini:ForbidBtn(self.CurInputNumber - self.ClickInterval < self.MinValue)
end

function M:ExecOnTextOnPressed()
  self.Text_Input:SetText(tostring(self.CurInputNumber))
  self.Text_Input:SetRenderOpacity(1.0)
  self.Text_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:ExecOnTextCommintted(InText, CommitType)
  local TempNumber = "" ~= InText and tonumber(InText) or 1
  local OldNumberValue = self.CurInputNumber
  self.CurInputNumber = math.min(self.MaxValue, math.max(TempNumber, self.MinValue))
  self.Btn_Add:ForbidBtn(self.CurInputNumber + self.ClickInterval > self.MaxValue)
  self.Btn_Max:ForbidBtn(self.CurInputNumber + self.ClickInterval > self.MaxValue)
  self.Btn_Min:ForbidBtn(self.CurInputNumber - self.ClickInterval < self.MinValue)
  self.Btn_Mini:ForbidBtn(self.CurInputNumber - self.ClickInterval < self.MinValue)
  self.Text_Num:SetText(tostring(self.CurInputNumber))
  self.Text_Input:SetRenderOpacity(0.0)
  self.Text_Num:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if type(self.InputCallback) == "function" then
    self.InputCallback(self.OwnerPanel, self.CurInputNumber, OldNumberValue)
  end
  self.IsInNumInputState = false
end

function M:OnInputTextChanged(Text)
  local TextTable = StringUtils.Utf8ToTable(Text)
  local bOverLength = #TextTable > MAX_NUMBER_COUNT
  if bOverLength then
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_REGISTER_OVERLENGTH"))
    local NeedShowNumber = math.min(self.MaxValue, 99999)
    self.Text_Input:SetText(tostring(NeedShowNumber))
  end
end

function M:EditOnTextFocusReceived()
  self:ExecOnTextOnPressed()
end

function M:EditOnTextFocusLost()
  self:AddTimer(0.1, self.OnReturnFocusToWidget, false, 0, "OnReturnFocusToWidget", true)
end

function M:OnClickToMinus()
  if self.CurInputNumber - self.ClickInterval < self.MinValue then
    if not self.Btn_Min.IsForbidden then
      self.Btn_Min:ForbidBtn(true)
    end
    if not self.Btn_Mini.IsForbidden then
      self.Btn_Mini:ForbidBtn(true)
    end
    return
  end
  local OldNumberValue = self.CurInputNumber
  self.CurInputNumber = self.CurInputNumber - self.ClickInterval
  self.Text_Num:SetText(tostring(self.CurInputNumber))
  if self.Btn_Add.IsForbidden then
    self.Btn_Add:ForbidBtn(false)
  end
  if self.Btn_Max.IsForbidden then
    self.Btn_Max:ForbidBtn(false)
  end
  self.Btn_Min:ForbidBtn(self.CurInputNumber - self.ClickInterval < self.MinValue)
  self.Btn_Mini:ForbidBtn(self.CurInputNumber - self.ClickInterval < self.MinValue)
  if type(self.MinusBtnCallback) == "function" then
    self.MinusBtnCallback(self.OwnerPanel, self.CurInputNumber, OldNumberValue)
  end
end

function M:OnClickToMinusInForbidState()
  if type(self.MinusBtnForbidCallback) == "function" then
    self.MinusBtnForbidCallback(self.OwnerPanel, self.CurInputNumber)
  end
end

function M:OnClickToAdd()
  if self.CurInputNumber + self.ClickInterval > self.MaxValue then
    if not self.Btn_Add.IsForbidden then
      self.Btn_Add:ForbidBtn(true)
    end
    if not self.Btn_Max.IsForbidden then
      self.Btn_Max:ForbidBtn(true)
    end
    return
  end
  local OldNumberValue = self.CurInputNumber
  self.CurInputNumber = self.CurInputNumber + self.ClickInterval
  self.Text_Num:SetText(tostring(self.CurInputNumber))
  if self.Btn_Min.IsForbidden then
    self.Btn_Min:ForbidBtn(false)
  end
  if self.Btn_Mini.IsForbidden then
    self.Btn_Mini:ForbidBtn(false)
  end
  self.Btn_Add:ForbidBtn(self.CurInputNumber + self.ClickInterval > self.MaxValue)
  self.Btn_Max:ForbidBtn(self.CurInputNumber + self.ClickInterval > self.MaxValue)
  if type(self.AddBtnCallback) == "function" then
    self.AddBtnCallback(self.OwnerPanel, self.CurInputNumber, OldNumberValue)
  end
end

function M:OnClickToAddInForbidState()
  if type(self.AddBtnForbidCallback) == "function" then
    self.AddBtnForbidCallback(self.OwnerPanel, self.CurInputNumber)
  end
end

function M:OnClickToMax()
  local OldNumberValue = self.CurInputNumber
  self.CurInputNumber = self.MaxValue
  self.Text_Num:SetText(tostring(self.CurInputNumber))
  if self.Btn_Min.IsForbidden then
    self.Btn_Min:ForbidBtn(self.CurInputNumber - self.ClickInterval < self.MinValue)
  end
  if self.Btn_Mini.IsForbidden then
    self.Btn_Mini:ForbidBtn(self.CurInputNumber - self.ClickInterval < self.MinValue)
  end
  self.Btn_Add:ForbidBtn(true)
  self.Btn_Max:ForbidBtn(true)
  if type(self.MaxBtnCallback) == "function" then
    self.MaxBtnCallback(self.OwnerPanel, self.CurInputNumber, OldNumberValue)
  end
end

function M:OnClickToMaxInForbidState()
  if type(self.MaxBtnForbidCallback) == "function" then
    self.MaxBtnForbidCallback(self.OwnerPanel, self.CurInputNumber)
  end
end

function M:OnClickToMin()
  local OldNumberValue = self.CurInputNumber
  self.CurInputNumber = self.MinValue
  self.Text_Num:SetText(tostring(self.CurInputNumber))
  if self.Btn_Add.IsForbidden then
    self.Btn_Add:ForbidBtn(self.CurInputNumber + self.ClickInterval > self.MaxValue)
  end
  if self.Btn_Max.IsForbidden then
    self.Btn_Max:ForbidBtn(self.CurInputNumber + self.ClickInterval > self.MaxValue)
  end
  self.Btn_Min:ForbidBtn(true)
  self.Btn_Mini:ForbidBtn(true)
  if type(self.MinBtnCallback) == "function" then
    self.MinBtnCallback(self.OwnerPanel, self.CurInputNumber, OldNumberValue)
  end
end

function M:OnClickToMinInForbidState()
  if type(self.MinBtnForbidCallback) == "function" then
    self.MinBtnForbidCallback(self.OwnerPanel, self.CurInputNumber)
  end
end

function M:PlayCommonClickSound()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_01", nil, nil)
end

function M:OverrideFocusWidget(NewFocusWidget)
  self.CurFocusWidget = NewFocusWidget
end

function M:UpdateHotKeyImage(CurGamepadName)
  if "PS" == CurGamepadName then
  else
  end
end

function M:Handle_KeyEventOnGamePad(InKeyName)
  local IsEventHandled = false
  if InKeyName == UIConst.GamePadKey.FaceButtonRight then
    if self.Text_Input ~= nil and self.Text_Input:HasAnyUserFocus() then
      IsEventHandled = true
      self:LeaveNumInputMode()
    end
  elseif InKeyName == UIConst.GamePadKey[self.ViewGamePad] then
    if not self.IsNotAllowTextFieldInput then
      IsEventHandled = true
      self:EnterNumInputMode()
    end
  elseif InKeyName == UIConst.GamePadKey.LeftTriggerThreshold then
    IsEventHandled = true
    local EventSoundPath = self.SoundResPath.Minus or "event:/ui/common/click_btn_minus"
    AudioManager(self):PlayUISound(self.Btn_Min, EventSoundPath, nil, nil)
    self:OnClickToMinus()
  elseif InKeyName == UIConst.GamePadKey.DPadLeft then
    IsEventHandled = true
    local EventSoundPath = self.SoundResPath.Max or "event:/ui/common/click_level_01"
    AudioManager(self):PlayUISound(self.Btn_Mini, EventSoundPath, nil, nil)
    self:OnClickToMin()
  elseif InKeyName == UIConst.GamePadKey.RightTriggerThreshold then
    IsEventHandled = true
    local EventSoundPath = self.SoundResPath.Add or "event:/ui/common/click_btn_add"
    AudioManager(self):PlayUISound(self.Btn_Add, EventSoundPath, nil, nil)
    self:OnClickToAdd()
  elseif InKeyName == UIConst.GamePadKey.DPadRight then
    IsEventHandled = true
    local EventSoundPath = self.SoundResPath.Max or "event:/ui/common/click_btn_addMulti"
    AudioManager(self):PlayUISound(self.Btn_Max, EventSoundPath, nil, nil)
    self:OnClickToMax()
  end
  return IsEventHandled
end

function M:CheckIsFocusInTextInput()
  local PlayerController = self:GetOwningPlayer()
  if self.Text_Input:HasUserFocus(PlayerController) then
    return true
  end
  return false
end

function M:EnterNumInputMode()
  if self.IsNotAllowTextFieldInput then
    return
  end
  if self.IsInNumInputState then
    return
  end
  self:UpdateUIStyleInPlatform(true)
  self.Text_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if self.Text_Input ~= nil and self.Text_Input:IsVisible() then
    self.IsInNumInputState = true
    self.Text_Input:SetFocus()
    if self.OwnerPanel and self.OwnerPanel.UpdateCurFocusInfo then
      self.OwnerPanel:UpdateCurFocusInfo("NumInputEdit")
    end
  end
end

function M:LeaveNumInputMode()
  if self.IsNotAllowTextFieldInput then
    return
  end
  if not self.IsInNumInputState then
    return
  end
  self:UpdateUIStyleInPlatform(false)
  self.Text_Num:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.IsInNumInputState = false
  self:OnReturnFocusToWidget()
end

function M:OverrideFocusToWidget(FocusWidget)
  self.LeaveFocusWidget = FocusWidget
end

function M:OnReturnFocusToWidget()
  if self.LeaveFocusWidget then
    if type(self.LeaveFocusWidget.SetFocus_Lua) == "function" then
      self.LeaveFocusWidget:SetFocus_Lua()
    else
      self.LeaveFocusWidget:SetFocus()
    end
  elseif self.OwnerPanel then
    if self.OwnerPanel.SetFocus_Lua then
      self.OwnerPanel:SetFocus_Lua()
    else
      self.OwnerPanel:SetFocus()
    end
  end
end

return M
