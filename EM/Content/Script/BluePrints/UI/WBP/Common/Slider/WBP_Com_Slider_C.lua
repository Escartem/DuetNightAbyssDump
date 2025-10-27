require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
local GamePadAddKey = {
  Vertical = UIConst.GamePadKey.RightStickUp,
  Horizontal = UIConst.GamePadKey.RightStickRight
}
local GamePadMinKey = {
  Vertical = UIConst.GamePadKey.RightStickDown,
  Horizontal = UIConst.GamePadKey.RightStickLeft
}
local LongPressInterval = 0.15

function M:Construct()
  self.CurrentCount = nil
  self.CurInputDeviceType = nil
  self.CurGamepadNameName = nil
  self.StepCount = 1
  self.AddTime = 0
  self.MinTime = 0
  self.SliderType = self.SliderType or "Horizontal"
end

function M:Destruct()
  self:ClearListenEvent()
  M.Super.Destruct(self)
end

function M:Init(ConfigData)
  self.ConfigData = ConfigData
  self.CurrentCount = ConfigData.InitValue or 1
  self.MinValue = ConfigData.MinValue or 1
  self.MaxValue = ConfigData.MaxValue or 999
  self.EnableMiniBtn = ConfigData.EnableMiniBtn or false
  self.EnableMaxBtn = ConfigData.EnableMaxBtn or false
  self.ClickInterval = ConfigData.ClickInterval or 1
  self.MinusBtnCallback = ConfigData.MinusBtnCallback
  self.AddBtnCallback = ConfigData.AddBtnCallback
  self.MaxBtnCallback = ConfigData.MaxBtnCallback
  self.SliderChangeCallback = ConfigData.SliderChangeCallback
  self.SoundResPath = ConfigData.SoundResPath or {}
  self.OwnerPanel = ConfigData.OwnerPanel
  self.ForbidGamePadLTRTKey = ConfigData.ForbidGamePadLTRTKey or false
  self.ForbidGamePadRSKey = ConfigData.ForbidGamePadRSKey or false
  self.GamePadRSRate = ConfigData.GamePadRSRate or 1
  self.bDisableAutoHandleInputDeviceChange = ConfigData.bDisableAutoHandleInputDeviceChange or false
  self.bForbidPressAccelerate = ConfigData.bForbidPressAccelerate or false
  self.bUseDefaultKeyInit = ConfigData.bUseDefaultKeyInit or true
  self:InitWidgetInfoInGamePad()
  self:AddTimer(0.01, function()
    self:BindAllClickAction()
    self:RefreshBaseInfo()
  end)
  self:InitListenEvent()
end

function M:RefreshBaseInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self.StepCount = 0 == self.MaxValue - self.MinValue and 1 or self.MaxValue - self.MinValue
  self.Slider:SetStepSize(1 / self.StepCount)
  self.Slider_Controller:SetStepSize(1 / self.StepCount)
  self:UpdateSliderAndProgress()
  if self.MaxValue - self.MinValue <= 0 then
    self.Slider:SetLocked(true)
    self.Slider_Controller:SetLocked(true)
  else
    self.Slider:SetLocked(false)
    self.Slider_Controller:SetLocked(false)
  end
  if self.WS_Mini then
    if self.EnableMiniBtn then
      self.WS_Mini:SetVisibility(UE4.ESlateVisibility.Visible)
    else
      self.WS_Mini:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  if self.WS_Max then
    if self.EnableMaxBtn then
      self.WS_Max:SetVisibility(UE4.ESlateVisibility.Visible)
    else
      self.WS_Max:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  if self.Key_Add and self.Key_Min then
    if not self.ForbidGamePadLTRTKey then
      self.Key_Add:SetVisibility(UE4.ESlateVisibility.Visible)
      self.Key_Min:SetVisibility(UE4.ESlateVisibility.Visible)
    else
      self.Key_Add:SetVisibility(UE4.ESlateVisibility.Hidden)
      self.Key_Min:SetVisibility(UE4.ESlateVisibility.Hidden)
    end
  end
  self:ForbidAddOperation(self.CurrentCount + self.ClickInterval > self.MaxValue)
  self:ForbidMinOperation(self.CurrentCount - self.ClickInterval < self.MinValue)
  if self.ParentContainer then
    if 1 == self.MaxValue then
      self.ParentContainer:SetVisibility(ESlateVisibility.Collapsed)
    else
      self.ParentContainer:SetVisibility(ESlateVisibility.Visible)
    end
  end
end

function M:InitWidgetInfoInGamePad()
  self.MinusPressed = false
  self.AddPressed = false
  self.Key_Min:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LT"}
    },
    bDisableResetWhenChangeDevice = true
  })
  self.Key_Add:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RT"}
    },
    bDisableResetWhenChangeDevice = true
  })
  self.Key_Mini:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Left"}
    },
    bDisableResetWhenChangeDevice = true
  })
  self.Key_Max:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Right"}
    },
    bDisableResetWhenChangeDevice = true
  })
  self.Text_Mini:SetText(GText("UI_SHOP_MIN"))
  self.Text_Max:SetText(GText("UI_SHOP_MAX"))
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

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.bDisableAutoHandleInputDeviceChange then
    return
  end
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  local IsUseGamePad = CurInputDevice == ECommonInputType.Gamepad
  self:UpdateUIStyleInPlatform(IsUseGamePad, CurGamepadName)
  self.CurInputDeviceType = CurInputDevice
end

function M:UpdateUIStyleInPlatform(IsUseGamePad, CurGamepadName)
  self:ButonUseGamePadStyle(IsUseGamePad)
  self:SliderUseGamePadStyle(IsUseGamePad)
  self:MiniMaxUseGamePadStyle(IsUseGamePad)
  if IsUseGamePad then
    self.InGamePadMode = true
    self:UpdateMouseGamePadImage(CurGamepadName)
  else
    self.InGamePadMode = false
  end
end

function M:MiniMaxUseGamePadStyle(UseGamePadStyle)
  local ActiveWidgetIndex = UseGamePadStyle and 1 or 0
  self.WS_Mini:SetActiveWidgetIndex(ActiveWidgetIndex)
  self.WS_Max:SetActiveWidgetIndex(ActiveWidgetIndex)
end

function M:ButonUseGamePadStyle(UseGamePadStyle)
  if UseGamePadStyle then
    self.ButtonInGamePadStyle = true
  else
    self.ButtonInGamePadStyle = false
  end
  local ActiveWidgetIndex = UseGamePadStyle and 1 or 0
  self.WS_Min:SetActiveWidgetIndex(ActiveWidgetIndex)
  self.WS_Add:SetActiveWidgetIndex(ActiveWidgetIndex)
end

function M:SliderUseGamePadStyle(UseGamePadStyle)
  if self.ForbidGamePadRSKey then
    UseGamePadStyle = false
  end
  if UseGamePadStyle then
    self.SliderInGamePadStyle = true
  else
    self.SliderInGamePadStyle = false
  end
  local ActiveWidgetIndex = UseGamePadStyle and 1 or 0
  self.WS_Slider:SetActiveWidgetIndex(ActiveWidgetIndex)
end

function M:BindAllClickAction()
  self.Btn_Min:BindEventOnPressed(self, self.OnMinusKeyDown)
  self.Btn_Min:BindEventOnReleased(self, self.OnMinusKeyUp)
  self.Btn_Add:BindEventOnPressed(self, self.OnAddKeyDown)
  self.Btn_Add:BindEventOnReleased(self, self.OnAddKeyUp)
  self.Slider.OnValueChanged:Add(self, self.OnSliderValueChanged)
  self.Slider.OnMouseCaptureBegin:Add(self, self.OnSelectedSlider)
  self.Slider.OnMouseCaptureEnd:Add(self, self.OnUnSelectedSlider)
  if self.Btn_Mini then
    self.Btn_Mini:BindEventOnPressed(self, self.OnMiniKeyDown)
    
    function self.Btn_Mini.SoundFunc(Btn)
    end
  end
  if self.Btn_Max then
    self.Btn_Max:BindEventOnPressed(self, self.OnMaxKeyDown)
    
    function self.Btn_Max.SoundFunc(Btn)
    end
  end
  
  function self.Btn_Min.SoundFunc(Btn)
  end
  
  function self.Btn_Add.SoundFunc(Btn)
  end
end

function M:GetChangeCount()
  local PressTime = 0 ~= self.AddTime and self.AddTime or self.MinTime
  local Multiple = 1
  if not self.bForbidPressAccelerate and self.LongPressCurve then
    Multiple = self.LongPressCurve:GetFloatValue(PressTime)
  end
  local StepCount = self.ClickInterval * Multiple
  StepCount = math.floor(StepCount + 0.5)
  local FinalCount = math.floor(math.max(1, math.min(StepCount, self.MaxValue)))
  return FinalCount
end

function M:OnClickToMinus()
  self.MinTime = self.MinTime + LongPressInterval
  local FinalCount = self:GetChangeCount()
  if FinalCount > self.CurrentCount - self.MinValue then
    FinalCount = self.CurrentCount - self.MinValue
    self:RemoveTimer("PreMinusLoop", true)
  end
  if FinalCount <= 0 then
    return
  end
  if self.CurrentCount - FinalCount < self.MinValue then
    if not self.ForbidMin then
      self:ForbidMinOperation(true)
    end
    return
  end
  local OldNumberValue = self.CurrentCount
  self.CurrentCount = self.CurrentCount - FinalCount
  self:UpdateSliderAndProgress()
  if self.ForbidAdd then
    self:ForbidAddOperation(false)
  end
  self:ForbidMinOperation(self.CurrentCount - self.ClickInterval < self.MinValue)
  if type(self.MinusBtnCallback) == "function" then
    self.MinusBtnCallback(self.OwnerPanel, self.CurrentCount, OldNumberValue)
  end
  local EventSoundPath = self.SoundResPath.Minus or "event:/ui/common/click_btn_minus"
  AudioManager(self):PlayUISound(self.Btn_Min, EventSoundPath, nil, nil)
end

function M:OnClickToAdd()
  self.AddTime = self.AddTime + LongPressInterval
  local FinalCount = self:GetChangeCount()
  if FinalCount > self.MaxValue - self.CurrentCount then
    FinalCount = self.MaxValue - self.CurrentCount
    self:RemoveTimer("PreAddLoop", true)
  end
  if FinalCount <= 0 then
    return
  end
  if self.CurrentCount + FinalCount > self.MaxValue then
    if not self.ForbidAdd then
      self:ForbidAddOperation(true)
    end
    return
  end
  local OldNumberValue = self.CurrentCount
  self.CurrentCount = self.CurrentCount + FinalCount
  self:UpdateSliderAndProgress()
  if self.ForbidMin then
    self:ForbidMinOperation(false)
  end
  self:ForbidAddOperation(self.CurrentCount + self.ClickInterval > self.MaxValue)
  if type(self.AddBtnCallback) == "function" then
    self.AddBtnCallback(self.OwnerPanel, self.CurrentCount, OldNumberValue)
  end
  local EventSoundPath = self.SoundResPath.Add or "event:/ui/common/click_btn_add"
  AudioManager(self):PlayUISound(self.Btn_Add, EventSoundPath, nil, nil)
end

function M:OnMinusKeyDown()
  self:AddTimer(LongPressInterval, self.OnClickToMinus, true, 0, "PreMinusLoop", true)
  local AddTimerKey = self:_GetTimerInfo("PreAddLoop")
  if AddTimerKey then
    self.AddTime = 0
    self:PauseTimer("PreAddLoop")
    self:PauseTimer("PreMinusLoop")
  else
    self:OnClickToMinus()
  end
end

function M:OnMinusKeyUp()
  self.MinTime = 0
  self:RemoveTimer("PreMinusLoop", true)
  local AddTimerKey = self:_GetTimerInfo("PreAddLoop")
  if AddTimerKey then
    self:UnPauseTimer("PreAddLoop")
  end
end

function M:OnAddKeyDown()
  self:AddTimer(LongPressInterval, self.OnClickToAdd, true, 0, "PreAddLoop", true)
  local AddTimerKey = self:_GetTimerInfo("PreMinusLoop")
  if AddTimerKey then
    self.MinTime = 0
    self:PauseTimer("PreMinusLoop")
    self:PauseTimer("PreAddLoop")
  else
    self:OnClickToAdd()
  end
end

function M:OnAddKeyUp()
  self.AddTime = 0
  self:RemoveTimer("PreAddLoop", true)
  local AddTimerKey = self:_GetTimerInfo("PreMinusLoop")
  if AddTimerKey then
    self:UnPauseTimer("PreMinusLoop")
  end
end

function M:TriggerKeyUpEvent()
  self:OnMinusKeyUp()
  self.MinusPressed = false
  self:OnAddKeyUp()
  self.AddPressed = false
end

function M:ForbidMinOperation(Forbidden)
  if not Forbidden and self.CurrentCount - self.ClickInterval < self.MinValue then
    Forbidden = true
  end
  self.ForbidMin = Forbidden
  self.Btn_Min:ForbidBtn(Forbidden)
  self.Key_Min:SetForbidKey(Forbidden)
  self.Btn_Mini:ForbidBtn(Forbidden)
  self.Key_Mini:SetForbidKey(Forbidden)
  self.Text_Mini:SetOpacity(Forbidden and 0.6 or 1)
end

function M:ForbidAddOperation(Forbidden)
  if not Forbidden and self.CurrentCount + self.ClickInterval > self.MaxValue then
    Forbidden = true
  end
  self.ForbidAdd = Forbidden
  self.Btn_Add:ForbidBtn(Forbidden)
  self.Key_Add:SetForbidKey(Forbidden)
  self.Btn_Max:ForbidBtn(Forbidden)
  self.Key_Max:SetForbidKey(Forbidden)
  self.Text_Max:SetOpacity(Forbidden and 0.6 or 1)
end

function M:UpdateSliderValue()
  local Value = (self.CurrentCount - self.MinValue) / self.StepCount
  if 0 ~= self.MaxValue and self.CurrentCount == self.MaxValue then
    Value = 1
  end
  self.Slider:SetValue(Value)
  self.Slider_Controller:SetValue(Value)
end

function M:OnMiniKeyDown()
  if self.ForbidMin then
    return
  end
  self:ChangeSliderValueByInputNumber(self.MinValue)
  local EventSoundPath = self.SoundResPath.Mini or "event:/ui/common/click_btn_minusMulti"
  AudioManager(self):PlayUISound(self.Btn_Mini, EventSoundPath, nil, nil)
end

function M:OnMaxKeyDown()
  if self.ForbidAdd then
    return
  end
  local OldNumberValue = self.CurrentCount
  self.CurrentCount = self.MaxValue
  self:ChangeSliderValueByInputNumber(self.MaxValue)
  if type(self.MaxBtnCallback) == "function" then
    self.MaxBtnCallback(self.OwnerPanel, self.CurrentCount, OldNumberValue)
  end
  local EventSoundPath = self.SoundResPath.Max or "event:/ui/common/click_btn_addMulti"
  AudioManager(self):PlayUISound(self.Btn_Max, EventSoundPath, nil, nil)
end

function M:OnSliderValueChanged(Value)
  local SlideValue = Value * self.StepCount + self.MinValue
  SlideValue = math.floor(SlideValue + 0.5)
  local NewCount = math.floor(math.max(self.MinValue, math.min(SlideValue, self.MaxValue)))
  self:UpdateSliderValue()
  if NewCount ~= self.CurrentCount then
    self.CurrentCount = NewCount
    self:ForbidAddOperation(self.CurrentCount + self.ClickInterval > self.MaxValue)
    self:ForbidMinOperation(self.CurrentCount - self.ClickInterval < self.MinValue)
    self:UpdateSliderAndProgress(true)
    if self.SelectedSlider then
      local EventSoundPath = self.SoundResPath.Slider or "event:/ui/common/click"
      AudioManager(self):PlayUISound(self.WS_Slider, EventSoundPath, nil, nil)
    end
  end
end

function M:OnSelectedSlider()
  self.SelectedSlider = true
end

function M:OnUnSelectedSlider()
  self.SelectedSlider = false
end

function M:ChangeSliderValueByInputNumber(Value, NoNeedCallback)
  if Value < self.MinValue then
    Value = self.MinValue
  end
  if Value > self.MaxValue then
    Value = self.MaxValue
  end
  self.CurrentCount = Value
  self:ForbidAddOperation(self.CurrentCount + self.ClickInterval > self.MaxValue)
  self:ForbidMinOperation(self.CurrentCount - self.ClickInterval < self.MinValue)
  self:UpdateSliderAndProgress(not NoNeedCallback)
end

function M:SetValue(Value)
  self.CurrentCount = Value
end

function M:SetMinValue(MinValue)
  self.MinValue = MinValue
end

function M:SetMaxValue(MaxValue)
  self.MaxValue = MaxValue
end

function M:OverrideValueLimit(InitValue, MaxValue, MinValue, bRefresh)
  self.CurrentCount = InitValue or 1
  self.MaxValue = MaxValue or 999
  self.MinValue = MinValue or 1
  if bRefresh then
    self:RefreshBaseInfo()
  else
    self:ForbidAddOperation(self.CurrentCount + self.ClickInterval > self.MaxValue)
    self:ForbidMinOperation(self.CurrentCount - self.ClickInterval < self.MinValue)
  end
end

function M:SetEnabled(IsEnabled)
  if IsEnabled then
    self.Slider:SetIsEnabled(true)
    self.Slider:SetRenderOpacity(1)
    self.Slider_Controller:SetIsEnabled(true)
    self.Slider_Controller:SetRenderOpacity(1)
    self.ProgressBar_Slider:SetRenderOpacity(1)
  else
    self.Slider:SetIsEnabled(false)
    self.Slider:SetRenderOpacity(0.6)
    self.Slider_Controller:SetIsEnabled(false)
    self.Slider_Controller:SetRenderOpacity(0.6)
    self.ProgressBar_Slider:SetRenderOpacity(0.6)
  end
end

function M:UpdateSliderAndProgress(NeedCallback)
  self:UpdateSliderValue()
  self.ProgressBar_Slider:SetPercent(self.Slider:GetValue())
  if NeedCallback and type(self.SliderChangeCallback) == "function" then
    self.SliderChangeCallback(self.OwnerPanel, self.CurrentCount)
  end
end

function M:RefreshCurInputNumber(NewNumber)
  self.CurrentCount = NewNumber or 1
  self:UpdateSliderAndProgress()
  self:RefreshBtnState()
end

function M:RefreshBtnState()
  self:ForbidAddOperation(self.CurrentCount + self.ClickInterval > self.MaxValue)
  self:ForbidMinOperation(self.CurrentCount - self.ClickInterval < self.MinValue)
end

function M:UpdateMouseGamePadImage(CurGamepadName)
  if self.CurGamepadNameName == CurGamepadName then
    return
  end
  local ResourceIconPath = UIUtils.UtilsGetKeyIconPathInGamepad("RH", CurGamepadName)
  local Img = LoadObject(ResourceIconPath)
  if not IsValid(Img) then
    return
  end
  self.Slider_Controller.WidgetStyle.NormalThumbImage.ResourceObject = Img
  self.Slider_Controller.WidgetStyle.DisabledThumbImage.ResourceObject = Img
end

function M:Handle_KeyDownEventOnGamePad(InKeyName)
  local IsEventHandled = true
  if not self.ForbidGamePadLTRTKey and InKeyName == UIConst.GamePadKey.RightTriggerThreshold then
    if not self.AddPressed then
      self.AddPressed = true
      self:OnAddKeyDown()
    end
  elseif not self.ForbidGamePadLTRTKey and InKeyName == UIConst.GamePadKey.LeftTriggerThreshold then
    if not self.MinusPressed then
      self.MinusPressed = true
      self:OnMinusKeyDown()
    end
  elseif not self.ForbidGamePadRSKey and InKeyName == GamePadAddKey[self.SliderType] then
    if not self.AddPressed then
      self.AddPressed = true
      self:OnAddKeyDown()
    end
  elseif not self.ForbidGamePadRSKey and InKeyName == GamePadMinKey[self.SliderType] then
    if not self.MinusPressed then
      self:OnMinusKeyDown()
      self.MinusPressed = true
    end
  elseif self.EnableMiniBtn and self.InGamePadMode and InKeyName == UIConst.GamePadKey.DPadLeft then
    self:OnMiniKeyDown()
  elseif self.EnableMaxBtn and self.InGamePadMode and InKeyName == UIConst.GamePadKey.DPadRight then
    self:OnMaxKeyDown()
  else
    IsEventHandled = false
  end
  return IsEventHandled
end

function M:Handle_KeyUpEventOnGamePad(InKeyName)
  local IsEventHandled = true
  if not self.ForbidGamePadLTRTKey and InKeyName == UIConst.GamePadKey.RightTriggerThreshold then
    self:OnAddKeyUp()
    self.AddPressed = false
  elseif not self.ForbidGamePadLTRTKey and InKeyName == UIConst.GamePadKey.LeftTriggerThreshold then
    self:OnMinusKeyUp()
    self.MinusPressed = false
  elseif not self.ForbidGamePadRSKey and InKeyName == UIConst.GamePadKey.RightStickRight then
    self:OnAddKeyUp()
    self.AddPressed = false
  elseif not self.ForbidGamePadRSKey and InKeyName == UIConst.GamePadKey.RightStickLeft then
    self:OnMinusKeyUp()
    self.MinusPressed = false
  else
    IsEventHandled = false
  end
  return IsEventHandled
end

return M
