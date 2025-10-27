require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self:AddDispatcher(EventID.OnMenuClose, self, self.CloseList)
  self:AddDispatcher(EventID.OnWindowResized, self, self.OnWindowResized)
  self.Btn_Filter_List.OnClicked:Add(self, self.ListOpenBtnClicked)
  self.Btn_Filter_List.OnPressed:Add(self, self.OnBtn_Filter_List_Pressed)
  self.Btn_Filter_List.OnReleased:Add(self, self.OnBtn_Filter_List_Released)
  self.Btn_Filter_List.OnHovered:Add(self, self.OnBtn_Filter_List_Hovered)
  self.Btn_Filter_List.OnUnhovered:Add(self, self.OnBtn_Filter_List_Unhovered)
  self.Btn_SortType.OnClicked:Add(self, self.OnSortTypeButtonClicked)
  self.Btn_SortType.OnPressed:Add(self, self.OnBtn_SortType_Pressed)
  self.Btn_SortType.OnReleased:Add(self, self.OnBtn_SortType_Released)
  self.Btn_SortType.OnHovered:Add(self, self.OnBtn_SortType_Hovered)
  self.Btn_SortType.OnUnhovered:Add(self, self.OnBtn_SortType_Unhovered)
  self:PlayAnimation(self.SortList_Normal)
  self:PlayAnimation(self.Btn_Normal)
  self.bIsFocusable = true
  self.Btn_Outside.OnClicked:Add(self, self.OnBackgroundClicked)
  self:UnbindAllFromAnimationFinished(self.List_In)
  self:BindToAnimationFinished(self.List_In, {
    self,
    self.OnListInAnimFinished
  })
  self:UnbindAllFromAnimationFinished(self.List_Out)
  self:BindToAnimationFinished(self.List_Out, {
    self,
    self.OnListOutAnimFinished
  })
  self.List.BP_OnEntryInitialized:Add(self, self.OnListEntryInitialized)
  self.OriginalPanelSize = FVector2D(259, 40)
  self.FocusKeyName = "LS"
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.List:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.List:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.List:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.List:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
  M.Super.Construct(self)
end

function M:Init(Parent, SortBy_List, SortType)
  self.Parent = Parent
  self.CurSortType = SortType or CommonConst.DESC
  self.SortBy_List = SortBy_List or {}
  self.IsListInAnimPlaying = false
  self.IsListOutAnimPlaying = false
  self.IsListViewOpened = false
  self.SelectedItem = nil
  self.Filter_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.List:ClearListItems()
  self.Text_Filterlist:SetText("")
  if SortBy_List and #SortBy_List > 0 then
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.Text = GText(SortBy_List[1])
    Obj.IsSelected = true
    Obj.Mode = "Single"
    Obj.Index = 1
    Obj.Owner = self
    Obj.OnListItemClicked = self.OnListItemClicked
    self.SelectedItem = Obj
    self.List:AddItem(Obj)
    for i = 2, #SortBy_List do
      Obj = NewObject(UIUtils.GetCommonItemContentClass())
      Obj.Text = GText(SortBy_List[i])
      Obj.Mode = "Single"
      Obj.Index = i
      Obj.Owner = self
      Obj.IsSelected = false
      Obj.OnListItemClicked = self.OnListItemClicked
      self.List:AddItem(Obj)
    end
    self.Btn_Filter_List:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.Btn_Filter_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:CalcSizeAndPos()
  local ParentGeo = self.Parent:GetTickSpaceGeometry()
  local ParentSize = USlateBlueprintLibrary.GetAbsoluteSize(ParentGeo)
  local ParentPos = UUIFunctionLibrary.GetGeometryAbsolutePosition(ParentGeo)
  local SelfGeo = self:GetTickSpaceGeometry()
  local Pos = USlateBlueprintLibrary.AbsoluteToLocal(SelfGeo, ParentPos)
  self.Panel_Main.Slot:SetPosition(Pos)
  local Size = FVector2D(0, 0)
  local ViewPortScale = UWidgetLayoutLibrary.GetViewportScale(self)
  Size.X = ParentSize.X / ViewPortScale
  Size.Y = self.OriginalPanelSize.Y
  self.Panel_Main.Slot:SetSize(Size)
end

function M:OnWindowResized()
  self:CloseList()
end

function M:SetSortType(SortType)
  self.CurSortType = SortType
end

function M:UpdateSortInfos()
  self.CurSortBy = self.Parent.CurSortBy
  self.CurSortType = self.Parent.CurSortType
  local AllContents = self.List:GetListItems()
  self:SelectContent(AllContents[self.CurSortBy])
  self.List:NavigateToIndex(self.CurSortBy - 1)
  if self.CurSortType == CommonConst.ASC then
    self:PlayAnimationReverse(self.Btn_Switch)
  else
    self:PlayAnimationForward(self.Btn_Switch)
  end
end

function M:UpdateParentSortInfos()
  self.CurSortBy = self.SelectedItem.Index
  self.Parent:SetSortInfos(self.CurSortBy, self.CurSortType)
end

function M:OnBtn_Filter_List_Pressed()
  self:StopAnimation(self.SortList_Hover)
  self:StopAnimation(self.SortList_Click)
  self:PlayAnimation(self.SortList_Press)
end

function M:OnBtn_Filter_List_Released()
end

function M:OnBtn_Filter_List_Hovered()
  self.IsFilterListBtnHovered = true
  self:StopAnimation(self.SortList_UnHover)
  self:PlayAnimation(self.SortList_Hover)
end

function M:OnBtn_Filter_List_Unhovered()
  self.IsFilterListBtnHovered = false
  self:StopAnimation(self.SortList_Hover)
  self:StopAnimation(self.SortList_Click)
  self:StopAnimation(self.SortList_Press)
  self:PlayAnimation(self.SortList_UnHover)
end

function M:ListOpenBtnClicked()
  if not self.Btn_Filter_List:IsHovered() then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
  if self.IsListViewOpened then
    self:StopAnimation(self.SortList_Hover)
    self:StopAnimation(self.SortList_Press)
    self:PlayAnimation(self.SortList_Click)
    self:CloseList()
  else
    self:OpenList()
  end
end

function M:DelayToCalcSizeAndPos()
  self:AddTimer(0.033, function()
    local PanelGeo = self.Panel_Main:GetTickSpaceGeometry()
    local PanelSize = USlateBlueprintLibrary.GetAbsoluteSize(PanelGeo)
    if PanelSize.X > 0 then
      self:RemoveTimer("DelayToCalcSizeAndPos")
      self:SetRenderOpacity(1)
      self:CalcSizeAndPos()
      self.Parent:SetRenderOpacity(0)
    end
  end, true, 0, "DelayToCalcSizeAndPos")
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self:Init(...)
  self:OpenList()
  self:RefreshOpInfoByInputDevice(self.CurInputDeviceType)
end

function M:OpenList()
  if self.SortBy_List then
    self:SetRenderOpacity(0)
    self:DelayToCalcSizeAndPos()
    self:UpdateSortInfos()
    self.IsListInAnimPlaying = true
    self:StopAnimation(self.SortList_Hover)
    self:StopAnimation(self.SortList_Press)
    self:PlayAnimation(self.SortList_Click)
    self:StopAnimation(self.List_Out)
    self:PlayAnimation(self.List_In)
    self:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Filter_List:SetVisibility(UIConst.VisibilityOp.Visible)
    self.IsListViewOpened = true
    self.Parent:OnListOpened()
  end
end

function M:CloseList()
  if self.SortBy_List then
    if self.IsListViewOpened then
      self.IsListViewOpened = false
      self.Parent:OnListClosed()
      self.IsListOutAnimPlaying = true
      self:StopAnimation(self.List_In)
      self:PlayAnimation(self.List_Out)
      self.Filter_List:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    end
  else
    self.Filter_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnListInAnimFinished()
  self.IsListInAnimPlaying = false
end

function M:OnListOutAnimFinished()
  self.IsListOutAnimPlaying = false
  if not self.IsListInAnimPlaying then
    if self.IsFilterListBtnHovered then
      self.Parent:OnBtn_Filter_List_Hovered(true)
    elseif self.IsSortTypeBtnHovered then
      self.Parent:OnBtn_SortType_Hovered(true)
    end
    self.Parent:SetRenderOpacity(1)
    self:Close()
  end
end

function M:Destruct()
  M.Super.Destruct(self)
  self.Parent:SetRenderOpacity(1)
  self.Parent:SetFocus()
end

function M:OnAddedToFocusPath(InFocusEvent)
  self.IsInFocusPath = true
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  self.IsInFocusPath = false
  if self.IsListViewOpened then
    self:CloseList()
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  M.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.List)
end

function M:OnBackgroundClicked()
  self:CloseList()
end

function M:OnBtn_SortType_Pressed()
  self:StopAnimation(self.Btn_Hover)
  self:StopAnimation(self.Btn_Click)
  self:PlayAnimation(self.Btn_Press)
end

function M:OnBtn_SortType_Released()
end

function M:OnBtn_SortType_Hovered()
  self.IsSortTypeBtnHovered = true
  self:StopAnimation(self.Btn_UnHover)
  self:PlayAnimation(self.Btn_Hover)
end

function M:OnBtn_SortType_Unhovered()
  self.IsSortTypeBtnHovered = false
  self:StopAnimation(self.Btn_Hover)
  self:StopAnimation(self.Btn_Click)
  self:StopAnimation(self.Btn_Press)
  self:PlayAnimation(self.Btn_UnHover)
end

function M:OnSortTypeButtonClicked()
  if not self.Btn_SortType:IsHovered() then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  self:CloseList()
  if self.CurSortType == CommonConst.ASC then
    self.CurSortType = CommonConst.DESC
    self:PlayAnimationForward(self.Btn_Switch)
  else
    self.CurSortType = CommonConst.ASC
    self:PlayAnimationReverse(self.Btn_Switch)
  end
  self.Parent:OnSortTypeChanged()
end

function M:OnListItemClicked(Content)
  if self:IsAnimationPlaying(self.List_Out) or Content.IsSelected then
    self:CloseList()
    return
  end
  self:SelectContent(Content)
  self:UpdateParentSortInfos()
  self.Parent:OnSelectionsChanged()
  self:CloseList()
end

function M:SelectContent(Content)
  Content.IsSelected = true
  if Content.Entry then
    Content.Entry:OnEntrySelectionChanged()
  end
  if self.SelectedItem ~= Content then
    self.SelectedItem.IsSelected = false
    if self.SelectedItem.Entry then
      self.SelectedItem.Entry:OnEntrySelectionChanged()
    end
    self.SelectedItem = Content
  end
  self.Text_Filterlist:SetText(self.SelectedItem.Text)
end

function M:OnListEntryInitialized(Content, Entry)
  if Content.IsSelected then
    self.List:BP_NavigateToItem(Content)
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local Reply = UE4.UWidgetBlueprintLibrary.Handled()
  if "Escape" == InKeyName and self.IsListViewOpened then
    self:CloseList()
    Reply = UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Parent)
  elseif self.CurInputDeviceType == ECommonInputType.Gamepad then
    if self.List:HasAnyUserFocus() or self.List:HasFocusedDescendants() then
      if Const.GamepadFaceButtonRight == InKeyName and self.IsListViewOpened then
        self:CloseList()
        Reply = UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Parent)
      end
    elseif Const.GamepadDPadLeft == InKeyName then
      Reply = UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Btn_Filter_List)
    elseif Const.GamepadDPadRight == InKeyName then
      Reply = UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Btn_SortType)
    end
  end
  M.Super.OnPreviewKeyDown(self, MyGeometry, InKeyEvent)
  return Reply
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurInputDeviceType = CurInputDevice
  self:UpdateGamepadKeyState()
  M.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
end

function M:UpdateGamepadKeyState()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    if self.IsInFocusPath or self.IsListViewOpened then
      self.Controller:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.Controller:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  else
    self.Controller:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

return M
