require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Init(SortBy_List, FocusKeyName, Parent)
  self.SortBy_List = SortBy_List or {}
  self.IsListViewOpened = false
  self.SelectedItem = {}
  self.IsListInAnimPlaying = false
  self.IsListOutAnimPlaying = false
  self.Filter_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.List:ClearListItems()
  self.Text_Filterlist:SetText("")
  if SortBy_List and #SortBy_List > 0 then
    self.Text_Filterlist:SetText(GText(SortBy_List[1]))
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.Text = GText(SortBy_List[1])
    Obj.IsSelected = true
    Obj.Mode = "Single"
    Obj.Index = 1
    Obj.Owner = self
    Obj.OnListItemClicked = self.OnListItemClicked
    Obj.OnClickedObj = self
    self.SelectedItem = Obj
    self.List:AddItem(Obj)
    for i = 2, #SortBy_List do
      Obj = NewObject(UIUtils.GetCommonItemContentClass())
      Obj.Text = GText(SortBy_List[i])
      Obj.Mode = "Single"
      Obj.Index = i
      Obj.Owner = self
      Obj.OnListItemClicked = self.OnListItemClicked
      self.List:AddItem(Obj)
    end
    self.Btn_Filter_List:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.Btn_Filter_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:UpdateSortInfos()
  self.FocusKeyName = FocusKeyName or "LS"
  self.Parent = Parent
  self.GamePadKey = Const.ShortKeyToGamePadKey[self.FocusKeyName]
  self.Img_Key:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = self.FocusKeyName
      }
    }
  })
  self.HideControllerTags = {}
  if not self.GameInputModeSubsystem then
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  end
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
end

function M:HideGamePadIcon(bHide, Tag)
  Tag = Tag or "Default"
  if bHide then
    self.HideControllerTags[Tag] = true
  else
    self.HideControllerTags[Tag] = nil
  end
  self:UpdateGamePadIcon(UIUtils.UtilsGetCurrentInputType())
end

function M:BindEventOnSelectionsChanged(Obj, Event)
  self.Obj_OnSelectionsChanged = Obj
  self.Event_OnSelectionsChanged = Event
end

function M:BindOnRemovedFromFocusPathEvent(Obj, Event)
  self.Obj_RemovedFromFocusPath = Obj
  self.Event_RemovedFromFocusPath = Event
end

function M:GetSortInfos()
  return self.CurSortBy
end

function M:SelectItem(Idx)
  local ItemCount = self.List:GetNumItems()
  if Idx > ItemCount then
    return
  end
  self:OnListItemClicked(self.List:GetItemAt(Idx - 1))
end

function M:UpdateSortInfos()
  self.CurSortBy = self.SelectedItem.Index
  return self.CurSortBy
end

function M:Construct()
  self:AddDispatcher(EventID.OnMenuClose, self, self.OnListClosed)
  self.Btn_Filter_List.OnClicked:Add(self, self.ListOpenBtnClicked)
  self.Btn_Filter_List.OnPressed:Add(self, self.OnBtn_Filter_List_Pressed)
  self.Btn_Filter_List.OnReleased:Add(self, self.OnBtn_Filter_List_Released)
  self.Btn_Filter_List.OnHovered:Add(self, self.OnBtn_Filter_List_Hovered)
  self.Btn_Filter_List.OnUnhovered:Add(self, self.OnBtn_Filter_List_Unhovered)
  self:PlayAnimation(self.SortList_Normal)
  self.bIsFocusable = true
  self:AddInputMethodChangedListen()
end

function M:OnBtn_Filter_List_Pressed()
  self:StopAnimation(self.Hover)
  self:StopAnimation(self.Click)
  self:PlayAnimation(self.Press)
end

function M:OnBtn_Filter_List_Released()
end

function M:OnBtn_Filter_List_Hovered()
  self:StopAnimation(self.UnHover)
  self:PlayAnimation(self.Hover)
end

function M:OnBtn_Filter_List_Unhovered()
  self:StopAnimation(self.Hover)
  self:StopAnimation(self.Click)
  self:StopAnimation(self.Press)
  self:PlayAnimation(self.UnHover)
end

function M:ListOpenBtnClicked(bForce)
  if not self.Btn_Filter_List:IsHovered() and not bForce then
    return
  end
  self:StopAnimation(self.Hover)
  self:StopAnimation(self.Press)
  self:PlayAnimation(self.Click)
  self.Filter_List:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
  if self.SortBy_List then
    if self.IsListViewOpened then
      self:OnListClosed()
    else
      self:StopAnimation(self.List_Out)
      self:PlayAnimation(self.List_In)
      self.Filter_List:SetVisibility(UIConst.VisibilityOp.Visible)
      self.IsListViewOpened = true
      self:AddDelayFrameFunc(function()
        self:UpdateGamePadFocus()
      end, 3)
    end
  else
    self.Filter_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self:UpdateGamePadFocus()
  end
  self:SetFocus()
end

function M:OnListItemClicked(Content)
  if self.IsListOutAnimPlaying or self:IsAnimationPlaying(self.List_Out) then
    self:OnListClosed()
    return
  end
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
  local SortItem = self:UpdateSortInfos()
  self.Text_Filterlist:SetText(self.SelectedItem.Text)
  if self.Event_OnSelectionsChanged then
    self.Event_OnSelectionsChanged(self.Obj_OnSelectionsChanged, SortItem)
  end
  self:OnListClosed()
  self:TryReleaseFocus()
end

function M:OnListClosed()
  if self.SortBy_List then
    if self.IsListViewOpened then
      self:StopAnimation(self.List_In)
      self:PlayAnimation(self.List_Out)
      self.Filter_List:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      self.IsListViewOpened = false
    end
  else
    self.Filter_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:UpdateGamePadFocus()
end

function M:OnFocusLost(InFocusEvent)
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return M.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
end

function M:OnAddedToFocusPath(InFocusEvent)
  self.bAddedToFocusPath = true
  self:UpdateGamePadIcon(UIUtils.UtilsGetCurrentInputType())
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  if self.Event_RemovedFromFocusPath then
    self.Event_RemovedFromFocusPath(self.Obj_RemovedFromFocusPath)
  end
  self.bAddedToFocusPath = false
  self:OnListClosed()
  self:UpdateGamePadIcon(UIUtils.UtilsGetCurrentInputType())
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if Const.GamepadFaceButtonRight == InKeyName and self.bAddedToFocusPath then
    if self.IsListViewOpened then
      self:OnListClosed()
    end
    if self.Parent then
      local Widget = self.Parent:GetDesiredFocusTarget()
      return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), Widget or self.Parent)
    end
  end
  return M.Super.OnKeyDown(self, MyGeometry, InKeyEvent)
end

function M:ReceiveKeyDown_Lua(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self.GamePadKey == InKeyName then
    return self:FocusToSelf()
  end
  return false
end

function M:FocusToSelf()
  if not self.IsListViewOpened then
    self:ListOpenBtnClicked(true)
    return true
  elseif not self.bAddedToFocusPath then
    if self.SelectedItem and self.SelectedItem.Entry then
      self.List:BP_NavigateToItem(self.SelectedItem)
    else
      self.Btn_Filter_List:SetFocus()
    end
    return true
  end
  return false
end

function M:UpdateGamePadFocus()
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  if not self.bAddedToFocusPath then
    return
  end
  if self.IsListViewOpened and self.SelectedItem and self.SelectedItem.Entry then
    self.List:BP_NavigateToItem(self.SelectedItem)
    return
  end
  self.List:BP_CancelScrollIntoView()
  self.Btn_Filter_List:SetFocus()
end

function M:UpdateGamePadIcon(CurInputType)
  local bHide = self.HideControllerTags and next(self.HideControllerTags) ~= nil
  if CurInputType == ECommonInputType.Gamepad and not self.bAddedToFocusPath and not bHide then
    self.Controller:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Controller:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputType, CurGamepadName)
  M.Super.RefreshOpInfoByInputDevice(self, CurInputType, CurGamepadName)
  if CurInputType == ECommonInputType.Gamepad and self.bAddedToFocusPath then
    self:UpdateGamePadFocus()
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  M.Super.OnUpdateUIStyleByInputTypeChange(self, CurInputType, CurGamepadName)
  self:UpdateGamePadIcon(CurInputType)
end

function M:BP_GetDesiredFocusTarget()
  local SelectedItem = self.IsListViewOpened and self.SelectedItem
  local Entry = SelectedItem and SelectedItem.Entry
  if Entry then
    return Entry
  else
    return self.Btn_Filter_List
  end
end

function M:TryReleaseFocus()
  if not self.bAddedToFocusPath then
    return
  end
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  if self.Parent then
    local Widget = self.Parent:GetDesiredFocusTarget()
    Widget = Widget or self.Parent
    Widget:SetFocus()
  end
end

function M:Activate()
  self:ListOpenBtnClicked(true)
end

return M
