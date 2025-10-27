require("UnLua")
local M = Class("BluePrints.UI.WBP.Armory.WBP_Armory_Dye_Base_C")
local FSM = require("Blueprints.UI.FocusStateMachine")
local FocusAreas = {
  NoramlDyeTab = "NoramlDyeTab",
  ColorWidget = "ColorWidget",
  Tips = "Tips",
  ConsumItem = "ConsumItem",
  Resource = "Resource",
  Coin = "Coin",
  FunctionBtn = "FunctionBtn",
  Plan = "Plan",
  Self = "Self"
}

function M:Construct()
  self.TabConfig = {
    TitleName = GText("UI_Dye_Name"),
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BottomKeyInfo = {},
    OverridenTopResouces = {
      DataMgr.GlobalConstant.AdvanceColorId.ConstantValue
    },
    StyleName = "Text",
    BackCallback = self.OnBackKeyDown,
    OwnerPanel = self,
    OnResourceBarAddedToFocusPath = self.OnResourceBarAddedToFocusPath,
    OnResourceBarRemovedFromFocusPath = self.OnResourceBarRemovedFromFocusPath,
    GetReplyOnBack = self.OnResourceGetReply
  }
  self.Btn_Done:SetDefaultGamePadImg("Y")
  self.Btn_PreviewSave:SetDefaultGamePadImg("Y")
  self.Key_GamePad_Save:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "X"}
    }
  })
  self.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Down"}
    }
  })
  self.Key_GamePad_Function:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "View"}
    }
  })
  self.bIsShowNavigateGuide = false
  self.FSM = FSM:New(self, {
    StateNames = FocusAreas,
    OnStateChanged = self.OnFocusChanged,
    CheckFunction = self.IsFocusStateValid
  })
  M.Super.Construct(self)
  self.Plan_Dye:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.Plan_Dye:SetNavigationRuleExplicit(EUINavigation.Right, self.Btn_Share)
  self.Btn_Share:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.Btn_Share:SetNavigationRuleExplicit(EUINavigation.Left, self.Plan_Dye)
  self:InitKeySetting()
  self:RefreshOpInfoByInputDevice(UIUtils.UtilsGetCurrentInputType(), UIUtils.UtilsGetCurrentGamepadName())
end

function M:InitKeySetting()
  self.TableKey = "Tab"
  self.UKey = "U"
  self.TabLeftKey = EKeys.A.KeyName
  self.TabRightKey = EKeys.D.KeyName
  self.LeftMouseButton = EKeys.LeftMouseButton.KeyName
  self.EscapeKey = EKeys.Escape.KeyName
  self.GamePadTabLeftKey = UIConst.GamePadKey.LeftShoulder
  self.GamePadTabRightKey = UIConst.GamePadKey.RightShoulder
  self.GamePadBackKey = UIConst.GamePadKey.FaceButtonRight
  self.LeftTriggerKey = UIConst.GamePadKey.LeftTriggerThreshold
  self.RightTriggerKey = UIConst.GamePadKey.RightTriggerThreshold
  self.GamepadApplyKey = UIConst.GamePadKey.FaceButtonTop
  self.GamepadSaveKey = UIConst.GamePadKey.FaceButtonLeft
  self.ZoomKey = "Mouse_Button"
  self.LeftThumbstickKey = UIConst.GamePadKey.LeftThumb
  self.RightThumbstickKey = UIConst.GamePadKey.RightThumb
  self.GamepadViewKey = UIConst.GamePadKey.SpecialLeft
  self.GamepadMenuKey = UIConst.GamePadKey.SpecialRight
  self.GamepadConsumItemFocusKey = UIConst.GamePadKey.DPadDown
  self.Scroll_KeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText(self.ZoomKey),
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
    Desc = GText("UI_Dye_Zoom")
  }
  self.Tab_KeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText("Tab"),
        PressCallback = self.OnContrastKeyDown,
        ReleaseCallback = self.OnContrastKeyUp,
        Owner = self
      }
    },
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = "LS",
        PressCallback = self.OnContrastKeyDown,
        ReleaseCallback = self.OnContrastKeyUp,
        Owner = self
      }
    },
    Desc = GText("UI_Dye_Compare")
  }
  self.HideUI_KeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText("U"),
        ClickCallback = self.OnUKeyDown,
        Owner = self
      }
    },
    Desc = GText("UI_Dye_HideUI")
  }
  self.Select_KeyInfoList = {
    GamePadInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    },
    Desc = GText("UI_LOGIN_ENSURE")
  }
  self.Back_KeyInfoList = {
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
    Desc = GText("UI_BACK"),
    bLongPress = false
  }
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.IsGamepadInput = CurInputDevice == ECommonInputType.Gamepad
  if not self.IsLoaded or not self.IsInFocusPath then
    return
  end
  self:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if self.IsGamepadInput then
    local State = self.FSM:Peak()
    local IsStateValid = self:IsFocusStateValid(State)
    if not (IsStateValid and not IsValid(State.Widget) and UIUtils.HasAnyFocus(State.Widget)) or self.bSelfHidden and State.Name == FocusAreas.Self then
      self:GetDesiredFocusWidget():SetFocus()
    end
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  M.Super.OnUpdateUIStyleByInputTypeChange(self, CurInputDevice, CurGamepadName)
  self:OnFocusChanged()
end

function M:OnLoaded(...)
  M.Super.OnLoaded(self, ...)
end

function M:OnFocusChanged()
  self:UpdateKeyEvents()
  self:UpdateKeyStyle()
end

function M:UpdateKeyStyle()
  if self.KeyDownEvents[self.TabLeftKey] then
  else
  end
  if self.IsGamepadInput then
    if self.KeyDownEvents[self.GamepadViewKey] then
      self.Key_GamePad_Function:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    else
      self.Key_GamePad_Function:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    if self.KeyDownEvents[self.GamepadMenuKey] then
      self.Plan_Dye:OnUpdateUIStyleByInputTypeChange(ECommonInputType.Gamepad)
    else
      self.Plan_Dye:OnUpdateUIStyleByInputTypeChange(ECommonInputType.MouseAndKeyboard)
    end
    if self.KeyDownEvents[self.GamepadSaveKey] then
      self.Key_GamePad_Save:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    else
      self.Key_GamePad_Save:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    if self.KeyDownEvents[self.GamepadConsumItemFocusKey] then
      self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    else
      self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    if self.KeyDownEvents[self.GamePadTabLeftKey] then
      self.SubTab_Dye:UpdateUIStyleInPlatform(true)
    else
      self.SubTab_Dye:UpdateUIStyleInPlatform(false)
    end
    if self.KeyDownEvents[self.RightThumbstickKey] then
      self.Tab_Dye:UpdateUIStyleInPlatform(true)
    else
      self.Tab_Dye:UpdateUIStyleInPlatform(false)
    end
  else
    self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_GamePad_Save:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_GamePad_Function:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:UpdateBottomKeyInfo()
end

function M:UpdateBottomKeyInfo()
  local BottomKeyInfo = {}
  if self.IsGamepadInput then
    if self.RepeatKeyDownEvents[self.LeftTriggerKey] then
      table.insert(BottomKeyInfo, self.Scroll_KeyInfoList)
    end
    if self.KeyDownEvents[self.TableKey] then
      table.insert(BottomKeyInfo, self.Tab_KeyInfoList)
    end
    if self.KeyDownEvents[self.GamepadApplyKey] then
      table.insert(BottomKeyInfo, self.Select_KeyInfoList)
    end
    if self.KeyDownEvents[self.GamePadBackKey] then
      table.insert(BottomKeyInfo, self.Back_KeyInfoList)
    end
  else
    table.insert(BottomKeyInfo, self.Scroll_KeyInfoList)
    table.insert(BottomKeyInfo, self.Tab_KeyInfoList)
    table.insert(BottomKeyInfo, self.HideUI_KeyInfoList)
    table.insert(BottomKeyInfo, self.Back_KeyInfoList)
  end
  BottomKeyInfo = BottomKeyInfo or self.BottomKeyInfo
  self.Tab_Dye:UpdateBottomKeyInfo(BottomKeyInfo)
end

function M:UpdateItemConsume(...)
  M.Super.UpdateItemConsume(self, ...)
  if self.IsLoaded then
    self:UpdateKeyEvents()
    self:UpdateKeyStyle()
  end
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self.KeyUpEvents[InKeyName] then
    self.KeyUpEvents[InKeyName](self)
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnSubTabLeftKeyDown()
end

function M:OnSubTabRightKeyDown()
end

function M:OnUKeyDown()
  self:OnHideUIKeyDown()
  return self
end

function M:OnHideUIKeyDown()
  M.Super.OnHideUIKeyDown(self)
  self:UpdateKeyEvents()
  self:SetFocus()
end

function M:UpdateKeyEvents()
  self.KeyDownEvents = {}
  self.RepeatKeyDownEvents = {}
  self.KeyUpEvents = {}
  self.KeyDownEvents[self.EscapeKey] = self.OnBackKeyDown
  self.KeyDownEvents[self.GamePadBackKey] = self.OnBackKeyDown
  if self.bSelfHidden then
    self.KeyDownEvents[self.UKey] = self.OnUKeyDown
    self.RepeatKeyDownEvents[self.LeftTriggerKey] = self.OnCameraScrollBackwardKeyDown
    self.RepeatKeyDownEvents[self.RightTriggerKey] = self.OnCameraScrollForwardKeyDown
    self.KeyDownEvents[self.TableKey] = self.OnContrastKeyDown
    self.KeyDownEvents[self.LeftThumbstickKey] = self.OnContrastKeyDown
    self.KeyUpEvents[self.TableKey] = self.OnContrastKeyUp
    self.KeyUpEvents[self.LeftThumbstickKey] = self.OnContrastKeyUp
  else
    self.KeyDownEvents[self.TabLeftKey] = self.OnSubTabLeftKeyDown
    self.KeyDownEvents[self.TabRightKey] = self.OnSubTabRightKeyDown
    self.KeyDownEvents[self.UKey] = self.OnUKeyDown
    self.KeyDownEvents[self.TableKey] = self.OnContrastKeyDown
    self.KeyUpEvents[self.TableKey] = self.OnContrastKeyUp
    local CurrentFocusedArea = self.FSM:Peak().Name
    if CurrentFocusedArea == FocusAreas.NoramlDyeTab or CurrentFocusedArea == FocusAreas.ColorWidget or CurrentFocusedArea == FocusAreas.Resource then
      self.RepeatKeyDownEvents[self.LeftTriggerKey] = self.OnCameraScrollBackwardKeyDown
      self.RepeatKeyDownEvents[self.RightTriggerKey] = self.OnCameraScrollForwardKeyDown
      self.KeyDownEvents[self.GamePadTabLeftKey] = self.OnSubTabLeftKeyDown
      self.KeyDownEvents[self.GamePadTabRightKey] = self.OnSubTabRightKeyDown
      self.KeyDownEvents[self.LeftThumbstickKey] = self.OnContrastKeyDown
      self.KeyUpEvents[self.LeftThumbstickKey] = self.OnContrastKeyUp
      self.KeyDownEvents[self.GamepadApplyKey] = self.OnGamepadApplyKeyDown
      self.KeyDownEvents[self.RightThumbstickKey] = self.OnRightThumbstickKeyDown
      self.KeyDownEvents[self.GamepadViewKey] = self.OnGamepadViewKeyDown
      self.KeyDownEvents[self.GamepadMenuKey] = self.OnGamepadMenuKeyDown
      self.KeyDownEvents[self.GamepadConsumItemFocusKey] = self.OnConsumItemFocusKeyDown
      if not self.Btn_Save:IsBtnForbidden() then
        self.KeyDownEvents[self.GamepadSaveKey] = self.OnSaveKeyDown
      end
    elseif CurrentFocusedArea == FocusAreas.Plan then
      self.KeyDownEvents[self.GamepadApplyKey] = self.OnGamepadApplyKeyDown
    end
  end
  self:UpdateFunctionBtnNavigation()
end

function M:OnGamepadApplyKeyDown()
  if 0 == self.WidgetSwitcher_Preview:GetActiveWidgetIndex() then
    if self.Btn_Done.IsForbidden then
      self:OnForbiddenDoneBtnClicked()
    else
      self:OnDoneBtnClicked()
    end
  elseif 1 == self.WidgetSwitcher_Preview:GetActiveWidgetIndex() then
    self:OnPreviewSaveBtnClicked()
  end
end

function M:OnRightThumbstickKeyDown()
  self.Tab_Dye:Handle_KeyEventOnGamePad(self.RightThumbstickKey)
end

function M:OnConsumItemFocusKeyDown()
  if self.Panel_Cost:GetVisibility() == UIConst.VisibilityOp.Visible then
    DebugPrint(self.WB_Consume:GetChildAt(1).bIsFocusable)
    return self.WB_Consume:GetChildAt(1)
  end
end

function M:OnGamepadViewKeyDown()
  return self.Btn_Hide
end

function M:OnGamepadMenuKeyDown()
  return self.Plan_Dye
end

function M:OnSaveKeyDown()
  if self.Btn_Save:IsBtnForbidden() then
    self:OnForbiddenSaveBtnClicked()
  else
    self:OnSaveBtnClicked()
  end
end

function M:OnCameraScrollBackwardKeyDown()
  self:ScrollCamera(1)
end

function M:OnCameraScrollForwardKeyDown()
  self:ScrollCamera(-1)
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.DPadUp or InKeyName == UIConst.GamePadKey.DPadDown or InKeyName == UIConst.GamePadKey.DPadLeft or InKeyName == UIConst.GamePadKey.DPadRight then
    local KeyDownEvent = self.KeyDownEvents[InKeyName]
    if KeyDownEvent then
      local Widget = KeyDownEvent(self, MyGeometry, InKeyEvent)
      if Widget then
        return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), Widget)
      end
    end
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end

function M:OnRepeatKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local RepeatKeyDownEvent = self.RepeatKeyDownEvents[InKeyName]
  if RepeatKeyDownEvent then
    local Widget = RepeatKeyDownEvent(self)
    if Widget then
      return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), Widget)
    end
  end
  return UIUtils.Handled
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  if CommonUtils:IfExistSystemGuideUI(self) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local KeyDownEvent = self.KeyDownEvents[InKeyName]
  if KeyDownEvent then
    local Widget = KeyDownEvent(self)
    if Widget then
      return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), Widget)
    end
  end
  return UWidgetBlueprintLibrary.Handled()
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.bSelfHidden then
    self.FSM:Push({
      Name = FocusAreas.Self,
      Widget = self
    })
  else
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self:GetDesiredFocusWidget())
  end
  return UIUtils.Unhandled
end

function M:GetDesiredFocusWidget()
  if not self.IsGamepadInput then
    return
  end
  if self.bSelfHidden then
    return self
  end
  local CurrentState = self.FSM:Peak()
  if CurrentState.Name == FocusAreas.FunctionBtn then
    return CurrentState.Widget
  end
  if CurrentState.Name == FocusAreas.Plan then
    return CurrentState.Widget
  end
  if self.CurrentTabIdx == self.NormalColorTabIdx then
    return self:NavigateToNormalColorList(self.EMList_Normal:GetItemAt(0))
  end
  if self.SpecialCurrentContent == self.SpecialDefaultContent then
    return self.ColorLump_Default_Sp
  end
  local Content = self.SpecialCurrentContent
  self.EMList_Special:BP_NavigateToItem(Content)
  return self.EMList_Special
end

function M:OnAddedToFocusPath()
  self.IsInFocusPath = true
end

function M:OnRemovedFromFocusPath()
  self.IsInFocusPath = false
end

function M:OnColorContentCreated(Content)
  Content.Owner = self
  
  function Content.OnAddedToFocusPath(_self, _Content)
    if _Content.ColorId ~= self.DefaultColorId and _Content.ListContent then
      local Contents = _Content.ListContent.OnlyShowColor or _Content.ListContent.ColorContents
      for index, value in ipairs(Contents) do
        if value == _Content then
          _Content.ListContent.CurrentFocusWidgetIdx = index
          break
        end
      end
    end
    self.FSM:Push({
      Name = FocusAreas.ColorWidget,
      Content = _Content,
      Widget = _Content.Widget
    })
  end
  
  function Content.OnRemovedFromFocusPath(_self, _Content)
  end
end

function M:OnSpecialColorContentCreated(Content)
  self:OnColorContentCreated(Content)
end

function M:OnNormalColorContentCreated(Content)
  self:OnColorContentCreated(Content)
  if self.DefaultColorId == Content.ColorId then
    return
  end
  
  function Content.OnNavigateUp()
    local Idx = self.EMList_Normal:GetIndexForItem(Content.ListContent)
    local PreItem = self.EMList_Normal:GetItemAt(Idx - 1)
    if PreItem then
      PreItem.CurrentFocusWidgetIdx = Content.ListContent.CurrentFocusWidgetIdx
      return self:NavigateToNormalColorList(PreItem)
    else
      return self.ColorLump_Default
    end
  end
  
  function Content.OnNavigateDown()
    local Idx = self.EMList_Normal:GetIndexForItem(Content.ListContent)
    local NextItem = self.EMList_Normal:GetItemAt(Idx + 1)
    if NextItem then
      NextItem.CurrentFocusWidgetIdx = Content.ListContent.CurrentFocusWidgetIdx
      return self:NavigateToNormalColorList(NextItem)
    else
      return nil
    end
  end
end

function M:OnNormalColorListContentCreated(Content)
  function Content.OnResourceAddedToFocusPath(_self, ResourceWidget)
    self.FSM:Push({
      Name = FocusAreas.Resource,
      
      Content = Content,
      Widget = ResourceWidget
    })
  end
  
  function Content.OnResourceRemovedFromFocusPath()
  end
  
  function Content.OnResourceNavigateUp()
    local Idx = self.EMList_Normal:GetIndexForItem(Content)
    local PreItem = self.EMList_Normal:GetItemAt(Idx - 1)
    if PreItem then
      PreItem.CurrentFocusWidgetIdx = Content.CurrentFocusWidgetIdx
      return self:NavigateToNormalColorList(PreItem)
    else
      return self.ColorLump_Default
    end
  end
  
  function Content.OnResourceNavigateDown()
    local Idx = self.EMList_Normal:GetIndexForItem(Content)
    local NextItem = self.EMList_Normal:GetItemAt(Idx + 1)
    if NextItem then
      NextItem.CurrentFocusWidgetIdx = Content.CurrentFocusWidgetIdx
      return self:NavigateToNormalColorList(NextItem)
    else
      return nil
    end
  end
  
  function Content.OnMenuOpenChanged(_self, IsOpen, _Content)
    if IsOpen then
      self.FSM:Push({
        Name = FocusAreas.Tips,
        Content = Content
      })
    end
  end
end

function M:OnNoramlDyeTabContentCreated(Content)
  function Content.OnAddedToFocusPath(_self, _Content)
    self.FSM:Push({
      Name = FocusAreas.NoramlDyeTab,
      
      Content = Content,
      Widget = Content.Widget
    })
  end
  
  function Content.OnRemovedFromFocusPath(_self, _Content)
  end
  
  function Content.OnHovered(_self, _Content)
    if self.IsGamepadInput then
      _Content.Widget:OnClicked()
    end
  end
end

function M:OnFunctionBtnAddedToFocusPath(Widget)
  self.FSM:Push({
    Name = FocusAreas.FunctionBtn,
    Widget = Widget
  })
end

function M:OnFunctionBtnRemovedFromFocusPath()
end

function M:OnConsumItemContentCreated(Content)
  Content.OnAddedToFocusPathEvent = {
    Obj = self,
    Callback = self.OnConsumItemAddedToFocusPath,
    Params = Content
  }
  Content.OnRemovedFromFocusPathEvent = {
    Obj = self,
    Callback = self.OnConsumItemRemovedFromFocusPath,
    Params = Content
  }
end

function M:OnConsumItemAddedToFocusPath(Content)
  self.FSM:Push({
    Name = FocusAreas.ConsumItem,
    Content = Content,
    Widget = Content.SelfWidget
  })
end

function M:OnConsumItemRemovedFromFocusPath()
end

function M:OnResourceBarAddedToFocusPath(Widget)
  self.FSM:Push({
    Name = FocusAreas.Coin,
    Widget = Widget
  })
end

function M:OnResourceBarRemovedFromFocusPath()
end

function M:OnModifyPlanParams(Params)
  Params.FocusKeyImgPath = "Menu"
  
  function Params.OnGetBackReply(_self)
    local Widget = self:OnBackKeyDown()
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), Widget)
  end
  
  function Params.OnAddedToFocusPath()
    self.FSM:Push({
      Name = FocusAreas.Plan,
      Widget = self.Plan_Dye
    })
  end
  
  function Params.OnRemovedFromFocusPath()
  end
end

function M:OnFocusStateChanged(NewState, OladState)
  if NewState then
    self:OnFocusChanged()
  end
end

function M:IsFocusStateValid(State)
  return State and IsValid(State.Widget)
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

function M:SelectDyeingTypeTab(TabIdx)
  M.Super.SelectDyeingTypeTab(self, TabIdx)
  self:InitNavigationRules()
end

function M:OnBackKeyDown()
  if not self.IsGamepadInput then
    M.Super.OnBackKeyDown(self)
    return
  end
  local State = self.FSM:Pop()
  if State.Name == FocusAreas.ColorWidget or State.Name == FocusAreas.Resource or State.Name == FocusAreas.NoramlDyeTab then
    M.Super.OnBackKeyDown(self)
    return
  end
  local BackState = self.FSM:Peak()
  local BackStateName = BackState.Name
  if self.bSelfHidden then
    M.Super.OnBackKeyDown(self)
    return self.Btn_Hide
  end
  if BackStateName == FocusAreas.ColorWidget then
    return self:BackToColorList(BackState)
  elseif BackStateName == FocusAreas.Resource then
    return self:BackToResource(BackState)
  elseif BackStateName == FocusAreas.NoramlDyeTab then
    return self:BackToNoramlDyeTab(BackState)
  else
    M.Super.OnBackKeyDown(self)
  end
end

function M:BackToColorList(BackState)
  local ColorContent = BackState.Content
  if self.CurrentTabIdx == self.NormalColorTabIdx then
    local DefaultColorContent = self.NormalDefaultColorContents[self.CurNormalDyeTab.Idx]
    if ColorContent == DefaultColorContent then
      return self.ColorLump_Default
    end
  elseif ColorContent == self.SpecialDefaultContent then
    return self.ColorLump_Default_Sp
  end
  local ListContent = ColorContent and ColorContent.ListContent
  if self.EMList_Normal:GetIndexForItem(ListContent) >= 0 then
    self.EMList_Normal:BP_NavigateToItem(ListContent)
  elseif self.EMList_Special:GetIndexForItem(ListContent) >= 0 then
    self.EMList_Special:BP_NavigateToItem(ListContent)
  else
    DebugPrint("Warning: \232\191\148\229\155\158\233\162\156\232\137\178\229\136\151\232\161\168\230\151\182\228\189\191\231\148\168\228\186\134\233\148\153\232\175\175\231\154\132\230\149\176\230\141\174", ColorContent and ColorContent.ColorId)
    return self:BackToDefaultWidget()
  end
  if IsValid(BackState.Widget) then
    return BackState.Widget:GetDesiredFocusTarget()
  else
    return self:BackToDefaultWidget()
  end
end

function M:BackToResource(BackState)
  local ListContent = BackState.Content
  if self.EMList_Normal:GetIndexForItem(ListContent) >= 0 then
    self.EMList_Normal:BP_NavigateToItem(ListContent)
  elseif self.EMList_Special:GetIndexForItem(ListContent) >= 0 then
    self.EMList_Special:BP_NavigateToItem(ListContent)
  else
    DebugPrint("Warning: \232\191\148\229\155\158\232\181\132\230\186\144\229\136\151\232\161\168\230\151\182\228\189\191\231\148\168\228\186\134\233\148\153\232\175\175\231\154\132\230\149\176\230\141\174")
    return self:BackToDefaultWidget()
  end
  if IsValid(BackState.Widget) then
    return BackState.Widget:GetDesiredFocusTarget()
  else
    return self:BackToDefaultWidget()
  end
end

function M:BackToNoramlDyeTab(BackState)
  local BackContent = BackState.Content
  if self.List_Tab:GetIndexForItem(BackContent) >= 0 then
    self.List_Tab:BP_NavigateToItem(BackContent)
    if IsValid(BackState.Widget) then
      return BackState.Widget
    end
    return self.List_Tab
  else
    DebugPrint("Warning: \232\191\148\229\155\158\230\153\174\233\128\154\230\159\147\232\137\178Tab\230\151\182\228\189\191\231\148\168\228\186\134\233\148\153\232\175\175\231\154\132\230\149\176\230\141\174", BackContent and BackContent.Idx)
    return self:BackToDefaultWidget()
  end
end

function M:BackToDefaultWidget()
  if self.CurrentTabIdx == self.NormalColorTabIdx then
    return self:NavigateToNormalColorList(self.EMList_Normal:GetItemAt(0))
  else
    self.EMList_Special:BP_NavigateToItem(self.EMList_Special:GetItemAt(0))
    return self.EMList_Special
  end
end

function M:OnResourceGetReply()
end

function M:OnNormalDyeTabInit(...)
  M.Super.OnNormalDyeTabInit(self, ...)
  local AllContents = self.EMList_Normal:GetListItems():ToTable()
end

function M:NavigateToNormalColorList(Content)
  self.EMList_Normal:BP_NavigateToItem(Content)
  if Content.Widget then
    return Content.Widget:GetDesiredFocusTarget()
  else
    return self.EMList_Normal
  end
end

function M:InitNavigationRules()
  if self.CurrentTabIdx == self.NormalColorTabIdx then
    self.List_Tab:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    self.List_Tab:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    self.List_Tab:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
    self.List_Tab:SetNavigationRuleCustom(EUINavigation.Left, {
      self,
      function()
        self.FSM:Pop()
        local NewState = self.FSM:Peak()
        local DefaultColorContent = self.NormalDefaultColorContents[self.CurNormalDyeTab.Idx]
        local ColorContent = NewState.Content
        if ColorContent == DefaultColorContent then
          return self.ColorLump_Default
        elseif ColorContent and ColorContent.ListContent and self.EMList_Normal:GetIndexForItem(ColorContent.ListContent) >= 0 then
          return self:NavigateToNormalColorList(ColorContent.ListContent)
        else
          local Content = self.EMList_Normal:GetItemAt(0)
          return self:NavigateToNormalColorList(Content)
        end
      end
    })
    self.EMList_Normal:SetNavigationRuleExplicit(EUINavigation.Up, self.ColorLump_Default)
    self.EMList_Normal:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    self.EMList_Normal:SetNavigationRuleCustom(EUINavigation.Right, function()
      self.FSM:Pop()
      self.List_Tab:BP_SetSelectedItem(self.CurNormalDyeTab)
      self.List_Tab:BP_NavigateToItem(self.CurNormalDyeTab)
      if self.CurNormalDyeTab.Widget then
        return self.CurNormalDyeTab.Widget
      end
      return self.List_Tab
    end)
    self.EMList_Normal:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
    self.ColorLump_Default:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
    self.ColorLump_Default:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    self.ColorLump_Default:SetNavigationRuleExplicit(EUINavigation.Right, self.List_Tab)
    self.ColorLump_Default:SetNavigationRuleCustom(EUINavigation.Down, {
      self,
      function()
        local Content = self.EMList_Normal:GetItemAt(0)
        return self:NavigateToNormalColorList(Content)
      end
    })
  else
    self.ColorLump_Default_Sp:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
    self.ColorLump_Default_Sp:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    self.ColorLump_Default_Sp:SetNavigationRuleExplicit(EUINavigation.Right, self.List_Tab)
    self.ColorLump_Default_Sp:SetNavigationRuleCustom(EUINavigation.Down, {
      self,
      function()
        local Content = self.EMList_Special:GetItemAt(0)
        self.EMList_Special:BP_SetSelectedItem(Content)
        self.EMList_Special:BP_NavigateToItem(Content)
        return self.EMList_Special
      end
    })
    self.EMList_Special:SetNavigationRuleExplicit(EUINavigation.Up, self.ColorLump_Default_Sp)
    self.EMList_Special:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
    self.EMList_Special:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
    self.EMList_Special:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  end
end

function M:UpdateFunctionBtnNavigation()
  local Btns = self.WB_Function:GetAllChildren():ToTable()
  local PreBtn
  for i = 2, #Btns do
    Btns[i]:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
    Btns[i]:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
    if PreBtn then
      Btns[i]:SetNavigationRuleExplicit(EUINavigation.Up, PreBtn)
      PreBtn:SetNavigationRuleExplicit(EUINavigation.Down, Btns[i])
    else
      Btns[i]:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    end
    Btns[i]:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    if not Btns[i]:GetForbidden() then
      PreBtn = Btns[i]
    end
  end
end

function M:OnColorListItemHovered(Content)
  if not self.IsGamepadInput then
    M.Super.OnColorListItemHovered(self, Content)
  end
end

return M
