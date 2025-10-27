require("UnLua")
local M = Class("BluePrints.UI.WBP.Armory.WBP_Armory_Skin_Base_C")

function M:Construct()
  self.KeyDownEvents = {}
  self.RepeatKeyDownEvents = {}
  self.TabStyleName = "Text"
  self.UKey = "U"
  self.GamePadHideUIKey = UIConst.GamePadKey.FaceButtonLeft
  self.TabLeftKey = EKeys.Q.KeyName
  self.TabRightKey = EKeys.E.KeyName
  self.LeftThumbstickKey = UIConst.GamePadKey.LeftThumb
  self.LeftMouseButton = EKeys.LeftMouseButton.KeyName
  self.EscapeKey = EKeys.Escape.KeyName
  self.MainTabGamePadLeftKey = Const.GamepadLeftShoulder
  self.MainTabGamePadRightKey = Const.GamepadRightShoulder
  self.GamePadBackKey = Const.GamepadFaceButtonRight
  self.GamePadConfirKey = Const.GamepadFaceButtonDown
  self.GamePadGotoDyeKey = UIConst.GamePadKey.FaceButtonTop
  self.LeftTriggerKey = Const.GamepadLeftTrigger
  self.RightTriggerKey = Const.GamepadRightTrigger
  self.DPadLeftKey = UIConst.GamePadKey.DPadLeft
  self.DPadRightKey = UIConst.GamePadKey.DPadRight
  self.ZoomKey = "Mouse_Button"
  self.Key_GamePad_L:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Left"}
    }
  })
  self.Key_GamePad_R:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Right"}
    }
  })
  self.ESCKeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = self.EscapeKey,
        ClickCallback = self.OnBackKeyDown,
        Owner = self
      }
    },
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = "B",
        ClickCallback = self.OnBackKeyDown,
        Owner = self
      }
    },
    Desc = GText("UI_BACK")
  }
  self.HideUI_KeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText("U"),
        ClickCallback = self.OnHideUIKeyDown,
        Owner = self
      }
    },
    GamePadInfoList = {
      {Type = "Img", ImgShortPath = "X"}
    },
    Desc = GText("UI_Dye_HideUI")
  }
  self.ZoomKeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = self.ZoomKey,
        Owner = self
      }
    },
    GamePadInfoList = {
      {Type = "Or"},
      GamePadSubKeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LT",
          Owner = self
        },
        {
          Type = "Img",
          ImgShortPath = "RT",
          Owner = self
        }
      }
    },
    Desc = GText("UI_Dye_Zoom"),
    bLongPress = false
  }
  self.RightThumbstickAnalogBottomKeyInfoList = {
    GamePadInfoList = {
      {Type = "Img", ImgShortPath = "RH"}
    },
    Desc = GText("UI_CTL_RotatePreview")
  }
  self.List_Accessory.BP_OnItemSelectionChanged:Clear()
  self.List_Accessory.BP_OnItemSelectionChanged:Add(self, self.OnAccessoryItemSelectionChanged)
  self.Btn_Function:SetDefaultGamePadImg("A")
  self.bShoulFocusToLastFocusedWidget = false
  M.Super.Construct(self)
  
  function self.TabConfig.GetReplyOnBack()
    return self:GetReplyOnBack()
  end
  
  self:RefreshOpInfoByInputDevice(UIUtils.UtilsGetCurrentInputType())
  self.WBP_Com_Cost:SwitchToPC()
end

function M:UpdateKeySetting()
  self.KeyDownEvents = {}
  self.RepeatKeyDownEvents = {}
  self.KeyDownEvents[self.EscapeKey] = self.OnBackKeyDown
  self.KeyDownEvents[self.GamePadBackKey] = self.OnBackKeyDown
  self.KeyDownEvents[self.LeftMouseButton] = self.OnLeftMouseButtonDown
  self.RepeatKeyDownEvents[self.LeftTriggerKey] = self.OnCameraScrollBackwardKeyDown
  self.RepeatKeyDownEvents[self.RightTriggerKey] = self.OnCameraScrollForwardKeyDown
  self.KeyDownEvents[self.GamePadHideUIKey] = self.OnHideUIKeyDown
  self.KeyDownEvents[self.UKey] = self.OnHideUIKeyDown
  self.KeyDownEvents[self.TabLeftKey] = self.OnTabLeftKeyDown
  self.KeyDownEvents[self.TabRightKey] = self.OnTabRightKeyDown
  self.KeyDownEvents[self.MainTabGamePadLeftKey] = self.OnTabLeftKeyDown
  self.KeyDownEvents[self.MainTabGamePadRightKey] = self.OnTabRightKeyDown
  if not self.bSelfHidden and self.CurrentTopTabIdx == self.SkinTabIdx then
    if not self.IsPreviewMode and not self.IsCharacterTrialMode then
      self.KeyDownEvents[self.GamePadGotoDyeKey] = self.OnGamePadGotoDyeKeyDown
    end
    self.KeyDownEvents[self.DPadLeftKey] = self.OnDPadLeftKeyDown
    self.KeyDownEvents[self.DPadRightKey] = self.OnDPadRightKeyDown
  end
  self.BottomKeyInfo = {}
  table.insert(self.BottomKeyInfo, self.HideUI_KeyInfoList)
  table.insert(self.BottomKeyInfo, self.ZoomKeyInfoList)
  table.insert(self.BottomKeyInfo, self.RightThumbstickAnalogBottomKeyInfoList)
  table.insert(self.BottomKeyInfo, self.ESCKeyInfoList)
  self.Tab_Skin:UpdateBottomKeyInfo(self.BottomKeyInfo)
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  M.Super.OnUpdateUIStyleByInputTypeChange(self, CurInputDevice, CurGamepadName)
  self.IsGamepadInput = CurInputDevice == ECommonInputType.Gamepad
  local Content = self.SkinMap and self.SkinMap[self.SelectedSkinId]
  if self.IsGamepadInput then
    self.ScrollBox_Skin:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    if not self.IsInFocusPath or self.bSelfHidden then
      return
    end
    if self.CurrentTopTabIdx == self.SkinTabIdx then
      if not Content then
        return
      end
      if not self.IsSkinWidgetFocused or not UIUtils.HasAnyFocus(self.SkinWidgets[Content.Idx]) then
        self:SelectSkinByContent(Content)
        self.SkinWidgets[Content.Idx]:SetFocus()
      end
    elseif not self.IsAccessoryTabFocused and not self.IsAccessoryItemFocused then
      self:NavigateToList():SetFocus()
    end
  else
    self.ScrollBox_Skin:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  if Content then
    self:UpdateDirBtnByIdx(Content.Idx)
  end
end

function M:InitSkinWidgets()
  M.Super.InitSkinWidgets(self)
  self:InitSkinWidgetsNavigationRules()
end

function M:OnSkinContentCreated(Content)
  Content.OnAddedToFocusPath = self.OnSkinWidgetAddedToFocusPath
  Content.OnRemovedFromFocusPath = self.OnSkinWidgetRemovedFromFocusPath
end

function M:OnSkinWidgetAddedToFocusPath(Content)
  if self.IsGamepadInput then
    self.IsSkinWidgetFocused = true
    self:SelectSkinByContent(Content)
  end
end

function M:OnSkinWidgetRemovedFromFocusPath(Content)
  self.IsSkinWidgetFocused = false
end

function M:InitSkinWidgetsNavigationRules()
  for index, Widget in ipairs(self.SkinWidgets) do
    Widget.bIsShowNavigateGuide = false
    Widget.Button_Area.bIsShowNavigateGuide = false
    Widget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    Widget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    local PreWidgt = self.SkinWidgets[index - 1]
    if PreWidgt then
      Widget:SetNavigationRuleExplicit(EUINavigation.Left, PreWidgt)
    else
      Widget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
    end
    local NextWidget = self.SkinWidgets[index + 1]
    if NextWidget then
      Widget:SetNavigationRuleExplicit(EUINavigation.Right, NextWidget)
    else
      Widget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
    end
  end
end

function M:UpdateSkinWidgetStyle(Content)
  M.Super.UpdateSkinWidgetStyle(self, Content)
  for index, Widget in ipairs(self.SkinWidgets) do
    Widget:SetGamePadKeyVisibility(UIConst.VisibilityOp.Collapsed)
  end
  local CurrentWidget = self.SkinWidgets[Content.Idx]
  if CurrentWidget and Content.bDyeable and not Content.LockType then
    CurrentWidget:SetGamePadKeyVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
end

function M:UpdateDirBtnByIdx(Idx)
  if self.IsGamepadInput then
    self.Btn_L:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Btn_R:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_GamePad_L:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Key_GamePad_R:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    if Idx <= 1 then
      self.Key_GamePad_L:SetForbidKey(true)
    else
      self.Key_GamePad_L:SetForbidKey(false)
    end
    if Idx >= #self.SkinArray then
      self.Key_GamePad_R:SetForbidKey(true)
    else
      self.Key_GamePad_R:SetForbidKey(false)
    end
  else
    self.Key_GamePad_L:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_GamePad_R:SetVisibility(UIConst.VisibilityOp.Collapsed)
    M.Super.UpdateDirBtnByIdx(self, Idx)
  end
end

function M:OnTopTabSelected(TabWidget, Content)
  M.Super.OnTopTabSelected(self, TabWidget, Content)
  self:UpdateKeySetting()
  if self.CurrentTopTabIdx == self.SkinTabIdx then
    local SkinContent = self.SkinMap[self.SelectedSkinId]
    if SkinContent and self.SkinWidgets[SkinContent.Idx] then
      self.SkinWidgets[SkinContent.Idx]:SetFocus()
    end
  else
    self:InitAccessoryNavigationRules()
    self:NavigateToList()
  end
end

function M:NavigateToList()
  self.List_Accessory:BP_CancelScrollIntoView()
  self.List_Accessory:BP_SetSelectedItem(self.ComparedContent)
  self.List_Accessory:BP_NavigateToItem(self.ComparedContent)
  return self.List_Accessory
end

function M:OnAccessoryContentCreated(Content)
  Content.OnAddedToFocusPathEvent = {
    Obj = self,
    Callback = function()
      self.IsAccessoryItemFocused = true
    end
  }
  Content.OnRemovedFromFocusPathEvent = {
    Obj = self,
    Callback = function()
      self.IsAccessoryItemFocused = false
    end
  }
end

function M:OnAccessoryTabContentCreated(Content)
  function Content.OnAddedToFocusPath()
    self.IsAccessoryTabFocused = true
  end
  
  function Content.OnRemovedFromFocusPath()
    self.IsAccessoryTabFocused = false
  end
end

function M:OnAddedToFocusPath()
  self.IsInFocusPath = true
end

function M:OnRemovedFromFocusPath()
  self.IsInFocusPath = false
end

function M:InitAccessoryNavigationRules()
  self.Tab_Accessory:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.Tab_Accessory:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.Tab_Accessory:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.List_Accessory:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.List_Accessory:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.List_Accessory:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  if self.Tab_Accessory:IsVisible() then
    self.Tab_Accessory:SetNavigationRuleCustom(EUINavigation.Right, {
      self,
      function()
        local Content = self.ComparedContent or self.CurrentContent
        self.List_Accessory:BP_CancelScrollIntoView()
        self.List_Accessory:BP_SetSelectedItem(Content)
        self.List_Accessory:BP_NavigateToItem(Content)
        return self.List_Accessory
      end
    })
    self.List_Accessory:SetNavigationRuleCustom(EUINavigation.Left, {
      self,
      function()
        return self.CurrentAccessoryTabWidget or self.Tab_Accessory
      end
    })
  end
end

function M:OnAccessoryItemSelectionChanged(Content, IsSelected)
  if not IsSelected or not self.IsGamepadInput then
    return
  end
  self:TrySelectAccessoryItem(Content)
end

function M:OnAccessoryItemClicked(Content)
  if self.IsGamepadInput then
    self:OnGamePadConfirKeyDown()
  else
    M.Super.OnAccessoryItemClicked(self, Content)
  end
end

function M:OnGamePadConfirKeyDown()
  if self.IsPreviewMode or self.IsCharacterTrialMode then
    return
  end
  if self.Btn_Function:IsVisible() and not self.Btn_Function:IsBtnForbidden() and self.Btn_Function == self.WidgetSwitcher_BtnState:GetActiveWidget() and self.ConfirmBtnFunc then
    self.ConfirmBtnFunc(self)
  end
end

function M:OnGamePadGotoDyeKeyDown()
  if self.IsPreviewMode or self.IsCharacterTrialMode or self.IsTargetUnowned then
    return
  end
  local Content = self.SkinMap[self.SelectedSkinId]
  if not Content then
    return
  end
  if Content.bDyeable and not Content.LockType then
    self:OpenDye()
  end
end

function M:OnDPadLeftKeyDown()
  local Content = self.SkinMap[self.SelectedSkinId]
  if Content then
    local SkinWidget = self.SkinWidgets[Content.Idx - 1]
    if SkinWidget then
      return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), SkinWidget), true
    end
  end
end

function M:OnDPadRightKeyDown()
  local Content = self.SkinMap[self.SelectedSkinId]
  if Content then
    local SkinWidget = self.SkinWidgets[Content.Idx + 1]
    if SkinWidget then
      return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), SkinWidget), true
    end
  end
end

function M:OnCameraScrollBackwardKeyDown()
  self:ScrollCamera(1)
end

function M:OnCameraScrollForwardKeyDown()
  self:ScrollCamera(-1)
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  if CommonUtils:IfExistSystemGuideUI(self) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  M.Super.OnPreviewKeyDown(self, MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == self.GamePadConfirKey then
    self:OnGamePadConfirKeyDown()
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnRepeatKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local RepeatKeyDownEvent = self.RepeatKeyDownEvents[InKeyName]
  if RepeatKeyDownEvent then
    local Reply, IsHandled = RepeatKeyDownEvent(self)
    if IsHandled then
      return Reply
    end
  end
  return UIUtils.Handled
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  if CommonUtils:IfExistSystemGuideUI(self) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local InputEvent = UWidgetBlueprintLibrary.GetInputEventFromKeyEvent(InKeyEvent)
  if UKismetInputLibrary.InputEvent_IsRepeat(InputEvent) then
    return UIUtils.Handled
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local KeyDownEvent = self.KeyDownEvents[InKeyName]
  if KeyDownEvent then
    local Reply, IsHandled = KeyDownEvent(self)
    if IsHandled then
      return Reply
    end
  elseif not self.bSelfHidden then
    self.Tab_Skin:Handle_KeyEventOnGamePad(InKeyName)
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  local Reply = M.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
  if not self.IsGamepadInput then
    return UIUtils.Unhandled
  end
  if self.bSelfHidden then
    return UIUtils.Unhandled
  end
  local NewReply = self:GetReplyOnBack()
  if NewReply then
    return NewReply
  end
  return Reply
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_RightX" == InKeyName then
    if self.ActorController then
      local DeltaX = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 10
      self.ActorController:OnDragging({X = DeltaX})
    end
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end

function M:OnTabLeftKeyDown()
  self.Tab_Skin:TabToLeft()
end

function M:OnTabRightKeyDown()
  self.Tab_Skin:TabToRight()
end

function M:OnHideUIKeyDown()
  M.Super.OnHideUIKeyDown(self)
  self:UpdateKeySetting()
  self.bShoulFocusToLastFocusedWidget = not self.bSelfHidden
  if self.bSelfHidden then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self), true
  else
    local Reply = self:GetReplyOnBack()
    if Reply then
      return Reply, true
    end
  end
end

function M:GetReplyOnBack()
  if self.CurrentTopTabIdx == self.SkinTabIdx then
    local SkinContent = self.SkinMap[self.SelectedSkinId]
    if SkinContent and self.SkinWidgets[SkinContent.Idx] then
      return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.SkinWidgets[SkinContent.Idx]), true
    end
  else
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.List_Accessory), true
  end
end

return M
