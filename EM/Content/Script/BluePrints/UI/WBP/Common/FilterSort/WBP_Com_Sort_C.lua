require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Init(Parent, SortBy_List, SortType, Params)
  Params = Params or {}
  self.Parent = Parent
  self._OnAddedToFocusPath = Params.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Params.OnRemovedFromFocusPath
  self.OnGetBackFocusWidget = Params.OnGetBackFocusWidget
  self.OnGetBackReply = Params.OnGetBackReply
  self.SortBy_List = SortBy_List or {}
  self.IsListViewOpened = false
  self.Text_Filterlist:SetText("")
  if SortBy_List and #SortBy_List > 0 then
    self.Btn_Filter_List:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.Btn_Filter_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:SetSortInfos(1, SortType or CommonConst.DESC)
  if IsValid(self.ListWidget) then
    self.ListWidget:Init(self, self.SortBy_List, self.CurSortType)
  end
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType())
end

function M:BindEventOnSelectionsChanged(Obj, Event)
  self.Obj_OnSelectionsChanged = Obj
  self.Event_OnSelectionsChanged = Event
end

function M:BindEventOnSortTypeChanged(Obj, Event)
  self.Obj_OnSortTypeChanged = Obj
  self.Event_OnSortTypeChanged = Event
end

function M:GetSortInfos()
  return self.CurSortBy, self.CurSortType
end

function M:SetGamepadKey(FocusKeyName)
  self.FocusKeyName = FocusKeyName
  local FocusKeyImgPath = UIUtils.UtilsGetKeyIconPathInGamepad(self.FocusKeyName)
  self.Img_Key:SetBrushFromTexture(LoadObject(FocusKeyImgPath))
  self:UpdateGamepadKeyState()
end

function M:SetSortInfos(SortByIdx, SortType)
  self.CurSortBy = SortByIdx
  self.CurSortType = SortType
  self.Text_Filterlist:SetText(GText(self.SortBy_List[self.CurSortBy]))
  if self.CurSortType == CommonConst.ASC then
    self:PlayAnimationReverse(self.Btn_Switch)
  else
    self:PlayAnimationForward(self.Btn_Switch)
  end
end

function M:Construct()
  M.Super.Construct(self)
  rawset(self, "IsInFocusPath", false)
  self:AddInputMethodChangedListen()
  rawset(self, "FocusKeyName", "LS")
  rawset(self, "CurInputDeviceType", UIUtils.UtilsGetCurrentInputType())
  self:PlayAnimation(self.SortList_Normal)
  self:PlayAnimation(self.Btn_Normal)
  self.bIsFocusable = true
end

function M:OnBtn_Filter_List_Pressed()
  self:StopAnimation(self.SortList_Hover)
  self:StopAnimation(self.SortList_Click)
  self:PlayAnimation(self.SortList_Press)
end

function M:OnBtn_Filter_List_Released()
end

function M:OnBtn_Filter_List_Hovered(bImdly)
  if self.IsFilterListBtnHovered then
    self:PlayAnimation(self.SortList_Hover, 0, 1, 0, 100, false)
    return
  end
  self.IsFilterListBtnHovered = true
  self:StopAnimation(self.SortList_UnHover)
  if bImdly then
    self:PlayAnimation(self.SortList_Hover, 0, 1, 0, 100, false)
  else
    self:PlayAnimation(self.SortList_Hover)
  end
end

function M:OnBtn_Filter_List_Unhovered()
  self:StopAnimation(self.SortList_Hover)
  self:StopAnimation(self.SortList_Click)
  self:StopAnimation(self.SortList_Press)
  self:PlayAnimation(self.SortList_UnHover)
end

function M:ListOpenBtnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
  if #self.SortBy_List > 0 then
    if IsValid(self.ListWidget) then
      UIManager(self):UnLoadUI("ComSortFullScreen")
    end
    self.ListWidgetOpening = true
    self.ListWidget = UIManager(self):LoadUI(nil, "ComSortFullScreen", self.Parent:GetZOrder(), self, self.SortBy_List, self.CurSortType)
    self.ListWidgetOpening = false
  end
end

function M:OnListClosed()
  self.IsListViewOpened = false
  self:SetFocus()
end

function M:OnListOpened()
  self.IsListViewOpened = true
end

function M:OnBtn_SortType_Pressed()
  self:StopAnimation(self.Btn_Hover)
  self:StopAnimation(self.Btn_Click)
  self:PlayAnimation(self.Btn_Press)
end

function M:OnBtn_SortType_Released()
end

function M:OnBtn_SortType_Hovered(bImdly)
  if self.IsSortTypeBtnHovered then
    self:PlayAnimation(self.Btn_Hover, 0, 1, 0, 100, false)
    return
  end
  self.IsSortTypeBtnHovered = true
  self:StopAnimation(self.Btn_UnHover)
  if bImdly then
    self:PlayAnimation(self.Btn_Hover, 0, 1, 0, 100, false)
  else
    self:PlayAnimation(self.Btn_Hover)
  end
end

function M:OnBtn_SortType_Unhovered()
  self:StopAnimation(self.Btn_Hover)
  self:StopAnimation(self.Btn_Click)
  self:StopAnimation(self.Btn_Press)
  self:PlayAnimation(self.Btn_UnHover)
end

function M:PlayBtnSortTypeClickAnim()
end

function M:OnSortTypeButtonClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  self:OnSortTypeChanged()
end

function M:OnSortTypeChanged()
  if self.CurSortType == CommonConst.ASC then
    self.CurSortType = CommonConst.DESC
    self:PlayAnimationForward(self.Btn_Switch)
  else
    self.CurSortType = CommonConst.ASC
    self:PlayAnimationReverse(self.Btn_Switch)
  end
  if IsValid(self.ListWidget) then
    self.ListWidget:SetSortType(self.CurSortType)
  end
  if self.Event_OnSortTypeChanged then
    self.Event_OnSortTypeChanged(self.Obj_OnSortTypeChanged, self.CurSortType)
  end
end

function M:OnSelectionsChanged()
  if self.Event_OnSelectionsChanged then
    self.Event_OnSelectionsChanged(self.Obj_OnSelectionsChanged, self.CurSortBy, self.CurSortType)
  end
end

function M:UpdateGamepadKeyState()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    if self.IsInFocusPath or IsValid(self.ListWidget) and self.ListWidget.IsInFocusPath or self.ListWidgetOpening or self.IsControllerKeyHidden then
      self.Controller:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.Controller:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  else
    self.Controller:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:SetControllerKeyHidden(bHidden)
  self.IsControllerKeyHidden = bHidden
  if bHidden then
    self.Controller:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Controller:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:ChangeKeyByInputDevice(CurInputDevice, CurGamepadName)
  self:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurInputDeviceType = CurInputDevice
  self:UpdateGamepadKeyState()
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if Const.GamepadFaceButtonRight == InKeyName then
    if self.OnGetBackReply then
      local Reply = self.OnGetBackReply(self.Parent, MyGeometry, InKeyEvent)
      if Reply then
        return Reply
      end
    end
    if self.OnGetBackFocusWidget then
      local Widget = self.OnGetBackFocusWidget(self.Parent, MyGeometry, InKeyEvent)
      if IsValid(Widget) then
        return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), Widget)
      end
    end
    if self.Parent.SetFocus_Lua then
      self.Parent:SetFocus_Lua()
      return UE4.UWidgetBlueprintLibrary.Handled()
    else
      return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Parent)
    end
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  M.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Btn_Filter_List)
end

function M:SetLeftWidgetForNavigation(Widget)
  if Widget then
    self.Btn_Filter_List:SetNavigationRuleExplicit(EUINavigation.Left, Widget)
  else
    self.Btn_Filter_List:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  end
end

function M:SetRightWidgetForNavigation(Widget)
  if Widget then
    self.Btn_SortType:SetNavigationRuleExplicit(EUINavigation.Right, Widget)
  else
    self.Btn_SortType:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  end
end

function M:OnAddedToFocusPath(InFocusEvent)
  self.IsInFocusPath = true
  self:UpdateGamepadKeyState()
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self.Parent, self)
  end
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  self.IsInFocusPath = false
  self:UpdateGamepadKeyState()
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self.Parent, self)
  end
end

function M:Activate()
  self:ListOpenBtnClicked()
end

return M
