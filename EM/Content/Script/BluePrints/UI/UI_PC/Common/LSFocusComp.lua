local Component = {}

function Component:AddLSFocusTarget(KeyImg, WidgetOrGroup, OverriddenKeyName, bSingleWidget)
  if not self.Initialized then
    self:BindInputEventForLSComp()
  end
  local KeyName = OverriddenKeyName or "LS"
  self:InitGamePadImgForLSComp(KeyImg, KeyName)
  local GamePadKey = Const.ShortKeyToGamePadKey[KeyName]
  if not WidgetOrGroup then
    return
  end
  self.GroupWidgets = self.GroupWidgets or {}
  self.SingleWidget = self.SingleWidget or {}
  if bSingleWidget then
    local Widget = WidgetOrGroup
    self.SingleWidget[GamePadKey] = {KeyImg = KeyImg, Widget = Widget}
    Widget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    Widget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    Widget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
    Widget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
    self:RefreshOpInfoByInputDeviceForLSComp(self.GameInputModeSubsystem:GetCurrentInputType())
    return
  end
  local GroupWidgets = WidgetOrGroup
  self.GroupWidgets[GamePadKey] = {KeyImg = KeyImg, Widgets = GroupWidgets}
  local LastWidget
  for _, TargetWidget in ipairs(GroupWidgets) do
    if nil ~= TargetWidget and TargetWidget:IsVisible() then
      TargetWidget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
      TargetWidget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
      TargetWidget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
      if TargetWidget.Btn_SortType then
        TargetWidget.Btn_SortType:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
      else
        TargetWidget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
      end
      if LastWidget then
        if LastWidget.Btn_SortType then
          LastWidget.Btn_SortType:SetNavigationRuleExplicit(EUINavigation.Right, TargetWidget)
        else
          LastWidget:SetNavigationRuleExplicit(EUINavigation.Right, TargetWidget)
        end
        TargetWidget:SetNavigationRuleExplicit(EUINavigation.Left, LastWidget)
      end
      LastWidget = TargetWidget
    end
  end
  self:RefreshOpInfoByInputDeviceForLSComp(self.GameInputModeSubsystem:GetCurrentInputType())
end

function Component:InitGamePadImgForLSComp(KeyImg, KeyName)
  if not KeyImg or not KeyName then
    return
  end
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Touch then
    KeyImg:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if KeyImg.CreateCommonKey then
    KeyImg:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = KeyName}
      }
    })
  end
end

function Component:HideGamepadKeyForLSComp()
  self.HideCompKeyImg = true
  self:UpdateGamepadKeyState()
end

function Component:ShowGamepadKeyForLSComp()
  self.HideCompKeyImg = false
  self:UpdateGamepadKeyState()
end

function Component:BindInputEventForLSComp()
  if not self.GameInputModeSubsystem then
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  end
  if IsValid(self) and IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDeviceForLSComp)
  end
end

function Component:Destruct()
  if IsValid(self) and IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDeviceForLSComp)
  end
end

function Component:RemoveFocusTarget(KeyName)
  self.SingleWidget = self.SingleWidget or {}
  self.GroupWidgets = self.GroupWidgets or {}
  local GamePadKey = Const.ShortKeyToGamePadKey[KeyName]
  if self.SingleWidget[GamePadKey] then
    self.SingleWidget[GamePadKey] = nil
    return
  end
  if self.GroupWidgets[GamePadKey] then
    self.GroupWidgets[GamePadKey] = nil
    return
  end
end

function Component:RefreshOpInfoByInputDeviceForLSComp(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  if self.CurInputDeviceType ~= ECommonInputType.Gamepad then
    self.CurrentFocusKey = nil
  else
    for Key, _ in pairs(self.SingleWidget) do
      if self:IsInLSMode(Key) then
        self.CurrentFocusKey = Key
        self:UpdateGamepadKeyState()
        return
      end
    end
    for Key, _ in pairs(self.GroupWidgets) do
      if self:IsInLSMode(Key) then
        self.CurrentFocusKey = Key
        self:UpdateGamepadKeyState()
        return
      end
    end
  end
  self:UpdateGamepadKeyState()
end

function Component:OnKeyDownForLSComp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_FaceButton_Right" ~= InKeyName then
      if self:EnterLSMode(InKeyName) then
        IsEventHandled = true
      end
    else
      IsEventHandled = self:LeaveLSMode()
    end
  end
  return IsEventHandled
end

function Component:OnKeyUpForLSComp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
end

function Component:FocusOnWidget(TargetWidget, FocusKey, bSingleWidget)
  if nil ~= TargetWidget and TargetWidget:IsVisible() then
    if bSingleWidget then
      self:ActivateWidget(TargetWidget)
    else
      TargetWidget:SetFocus()
      self.CurrentFocusKey = FocusKey
    end
    self:UpdateGamepadKeyState(FocusKey)
    return true
  end
  return false
end

function Component:IsWidgetFocused(TargetWidget)
  if nil ~= TargetWidget and TargetWidget:IsVisible() and (TargetWidget:HasFocusedDescendants() or TargetWidget:HasAnyUserFocus()) then
    return true
  end
  return false
end

function Component:EnterLSMode(FocusKey)
  if self:IsInLSMode(FocusKey) then
    return false
  end
  if self.SingleWidget[FocusKey] then
    local WidgetInfo = self.SingleWidget[FocusKey]
    local Widget = WidgetInfo.Widget
    return self:FocusOnWidget(Widget, FocusKey, true)
  end
  if self.GroupWidgets[FocusKey] then
    local GroupInfo = self.GroupWidgets[FocusKey]
    local GroupWidgets = GroupInfo.Widgets
    if not GroupWidgets then
      return false
    end
    for _, TargetWidget in ipairs(GroupWidgets) do
      if self:FocusOnWidget(TargetWidget, FocusKey) then
        return true
      end
    end
  end
  return false
end

function Component:LeaveLSMode()
  local FocusKey = self.CurrentFocusKey
  if not FocusKey then
    self:UpdateGamepadKeyState()
    return false
  end
  if not self:IsInLSMode(FocusKey) then
    self:UpdateGamepadKeyState()
    self.CurrentFocusKey = nil
    return true
  end
  if self.SingleWidget[FocusKey] then
    local Widget = self.SingleWidget[FocusKey].Widget
    self:InActivateWidget(Widget)
  end
  local DefaultFocusWidget = self:BP_GetDesiredFocusTarget()
  if nil ~= DefaultFocusWidget then
    DefaultFocusWidget:SetFocus()
  end
  self:UpdateGamepadKeyState()
  if self.AddTimer then
    self:AddTimer(0.2, function()
      if FocusKey and not self:IsInLSMode(FocusKey) then
        self.CurrentFocusKey = nil
      end
    end, nil, nil, nil, true)
  else
    self.CurrentFocusKey = nil
  end
  return true
end

function Component:UpdateGamepadKeyState(FocusKey)
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    if not self:IsInLSMode(FocusKey) and not self.HideCompKeyImg then
      self:ShowKeyImg(true)
    else
      self:ShowKeyImg(false)
    end
  else
    self:ShowKeyImg(false)
  end
end

function Component:IsInLSMode(FocusKey)
  local FocusKey = FocusKey or self.CurrentFocusKey
  if not FocusKey then
    return false
  end
  if self.SingleWidget[FocusKey] then
    local Widget = self.SingleWidget[FocusKey].Widget
    return self:IsWidgetFocused(Widget)
  end
  if self.GroupWidgets[FocusKey] then
    local GroupWidgets = self.GroupWidgets[FocusKey].Widgets
    if not GroupWidgets then
      return false
    end
    for _, TargetWidget in ipairs(GroupWidgets) do
      if self:IsWidgetFocused(TargetWidget) then
        return true
      end
    end
  end
  return false
end

function Component:ShowKeyImg(bShow)
  for _, v in pairs(self.SingleWidget) do
    local KeyImg = v.KeyImg
    self:SetKeyVisibility(KeyImg, bShow)
  end
  for _, v in pairs(self.GroupWidgets) do
    local KeyImg = v.KeyImg
    self:SetKeyVisibility(KeyImg, bShow)
  end
end

function Component:SetKeyVisibility(Key, bShow)
  if not Key then
    return
  end
  if bShow then
    Key:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    Key:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function Component:ActivateWidget(TargetWidget)
  if TargetWidget.Activate then
    TargetWidget:Activate()
  end
end

function Component:InActivateWidget(TargetWidget)
  if TargetWidget.InActivate then
    TargetWidget:InActivate()
  end
end

return Component
