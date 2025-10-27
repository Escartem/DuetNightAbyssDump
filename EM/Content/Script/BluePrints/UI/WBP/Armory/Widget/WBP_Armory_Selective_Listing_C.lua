require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})
M._components = {
  "BluePrints.UI.BP_EMUserWidgetUtils_C"
}

function M:Construct()
  self.Overridden.Construct(self)
  self.Pos_Tips:ClearChildren()
  self.Bg_Dialog.Text_MailDetail_Empry:SetText("")
  self:AddInputMethodChangedListen()
  self:RefreshOpInfoByInputDevice(UIUtils.UtilsGetCurrentInputType())
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.IsGamepadInput = CurInputDevice == ECommonInputType.Gamepad
end

function M:OnListItemInited(Content, EntryUI)
  if self.Event_OnEntryInitialized then
    self.Event_OnEntryInitialized(self.EventReceiver, Content, EntryUI)
  end
end

function M:Init(Parent, Params)
  self.Parent = Parent
  self.Params = Params
  self.Filters = Params.Filters or {}
  self.FilterMod = Params.FilterMod or "Single"
  self.FilterIdxes = {}
  self.OrderByDisplayNames = Params.OrderByDisplayNames
  self.SortType = Params.SortType
  self.AllItemContents = Params.ItemContents
  self.EMListView_Filter:ClearListItems()
  self.SelectedFilterContents = {}
  self.FilteredContents = {}
  self.LastSelectedFilterContent = nil
  if self.AllItemContents then
    for index, value in ipairs(self.AllItemContents) do
      table.insert(self.FilteredContents, value)
    end
  end
  self.FilterContentObj_All = nil
  if #self.Filters > 0 then
    self.FilterContentObj_All = NewObject(UIUtils.GetCommonItemContentClass())
    self.FilterContentObj_All.IsSelect = true
    self.FilterContentObj_All.Index = 0
    self.FilterContentObj_All.Icon = "/Game/UI/Texture/Static/Atlas/Armory/T_Armory_Select.T_Armory_Select"
    self.FilterContentObj_All.IsSelected = true
    self.LastSelectedFilterContent = self.FilterContentObj_All
    self.EMListView_Filter:AddItem(self.FilterContentObj_All)
    self.Panel_FilterTab:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self:SetTitle(GText("UI_ALL"))
  else
    self:SetTitle(nil)
    self.Panel_FilterTab:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:SetSubTitle(Params.SubTitle)
  for Index, Tag in ipairs(self.Filters) do
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    for key, value in pairs(Tag) do
      Obj[key] = value
    end
    Obj.Index = Index
    self.EMListView_Filter:AddItem(Obj)
  end
  self.Common_Sort_List:Init(self.Parent, self.OrderByDisplayNames, self.SortType or CommonConst.DESC, {
    OnGetBackFocusWidget = function(_self, MyGeometry, InKeyEvent)
      return self:OnSortListWidgetBack(MyGeometry, InKeyEvent)
    end,
    OnAddedToFocusPath = function()
      self:OnSortListAddedToFocusPath()
    end,
    OnRemovedFromFocusPath = function()
      self:OnSortListRemovedFromFocusPath()
    end
  })
  self.Common_Sort_List:BindEventOnSelectionsChanged(self, self.OnSortListSelectionsChanged)
  self.Common_Sort_List:BindEventOnSortTypeChanged(self, self.OnSortTypeChanged)
  self.Bg_Dialog.Not_Have:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:FillListView()
  self:InitNavigationRules()
end

function M:SetItemContents(ItemContents)
  self.AllItemContents = ItemContents
  self:UpdateFilterInfos()
  if self.Event_FilterFunction then
    self.FilteredContents = self.Event_FilterFunction(self.EventReceiver, self.AllItemContents, self.FilterIdxes) or {}
    if self.Event_SortFuncion then
      local SortByIdx, SortType = self.Common_Sort_List:GetSortInfos()
      self.Event_SortFuncion(self.EventReceiver, self.FilteredContents, SortByIdx, SortType)
    end
    self:FillListView()
    self:RegenerateAllEntries()
  end
end

function M:BindEvents(EventReceiver, Events)
  self.EventReceiver = EventReceiver
  self.Event_OnListItemClicked = Events.OnListItemClicked
  self.Event_OnListItemSelectionChanged = Events.OnListItemSelectionChanged
  self.Event_SortFuncion = Events.SortFuncion
  self.Event_FilterFunction = Events.FilterFunction
  self.Event_OnListItemInited = Events.OnListItemInited
  self.Event_OnEntryInitialized = Events.OnEntryInitialized
  self.Event_OnItemIsHoverChanged = Events.OnItemIsHoverChanged
end

function M:SetSortWidgetFocus()
  self.Common_Sort_List:SetFocus()
end

function M:SetFocusToList()
  self.TileView_Select_Role:SetFocus()
  if self.LastSelectedListContent then
    self.TileView_Select_Role:BP_CancelScrollIntoView()
    self.TileView_Select_Role:BP_SetSelectedItem(self.LastSelectedListContent)
    self.TileView_Select_Role:BP_ScrollItemIntoView(self.LastSelectedListContent)
    self.TileView_Select_Role:BP_NavigateToItem(self.LastSelectedListContent)
  end
end

function M:OnListItemClicked(Content)
  if self.Event_OnListItemClicked then
    self.Event_OnListItemClicked(self.EventReceiver, Content)
  end
end

function M:OnListItemSelectionChanged(Content, IsSelected)
  if IsSelected then
    self.LastSelectedListContent = Content
  end
  if self.Event_OnListItemSelectionChanged then
    self.Event_OnListItemSelectionChanged(self.EventReceiver, Content, IsSelected)
  end
end

function M:OnItemIsHoverChanged(Content)
  if self.Event_OnItemIsHoverChanged then
    self.Event_OnItemIsHoverChanged(self.EventReceiver, Content)
  end
end

function M:OnFilterListItemSelectionChanged(Content, IsSelected)
  if self.IsGamepadInput and IsSelected then
    self:OnFilterListItemClicked(Content)
  end
end

function M:OnFilterListItemClicked(Content)
  self.LastSelectedFilterContent = Content
  if self.FilterMod == "Single" then
    if Content.IsSelected then
      return
    end
    for Tag, Value in pairs(self.SelectedFilterContents) do
      if Value ~= Content then
        self:SetFilterContentIsSelected(Value, false)
        self.SelectedFilterContents[Tag] = nil
      end
    end
    if self.FilterContentObj_All ~= Content then
      self:SetFilterContentIsSelected(self.FilterContentObj_All, false)
      self:SetTitle(GText(Content.Text))
    else
      self:SetTitle(GText("UI_ALL"))
    end
    self:SetSubTitle(self.Params.SubTitle)
    self:SetFilterContentIsSelected(Content, true)
  else
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_sort_tab", nil, nil)
  self:UpdateFilterInfos()
  if self.Event_FilterFunction then
    self.FilteredContents = self.Event_FilterFunction(self.EventReceiver, self.AllItemContents, self.FilterIdxes) or {}
    if self.Event_SortFuncion then
      local SortByIdx, SortType = self.Common_Sort_List:GetSortInfos()
      self.Event_SortFuncion(self.EventReceiver, self.FilteredContents, SortByIdx, SortType)
    end
    self:FillListView()
    self.TileView_Select_Role:ScrollToTop()
  end
end

function M:SetFilterContentIsSelected(Content, IsSelected)
  Content.IsSelected = IsSelected
  if Content.UI then
    Content.UI:SetIsSelected(Content.IsSelected)
  end
  if Content.Tag then
    self.SelectedFilterContents[Content.Tag] = Content
  end
end

function M:UpdateFilterInfos()
  local Indexes = {}
  local bHasItem = next(self.SelectedFilterContents) ~= nil
  local Items = self.EMListView_Filter:GetListItems()
  local Len = Items:Length()
  if bHasItem then
    for i = 2, Len do
      if self.SelectedFilterContents[Items[i].Tag] then
        table.insert(Indexes, Items[i].Index)
      end
    end
  else
    for i = 2, Len do
      table.insert(Indexes, Items[i].Index)
    end
  end
  self.FilterIdxes = Indexes
  return self.FilterIdxes
end

function M:Resort()
  self:OnSortListSelectionsChanged()
end

function M:OnSortListSelectionsChanged()
  local SortByIdx, SortType = self.Common_Sort_List:GetSortInfos()
  if self.Event_SortFuncion then
    self.Event_SortFuncion(self.EventReceiver, self.FilteredContents, SortByIdx, SortType)
    self:FillListView()
  end
end

function M:OnSortTypeChanged()
  local SortByIdx, SortType = self.Common_Sort_List:GetSortInfos()
  if self.Event_SortFuncion then
    self.Event_SortFuncion(self.EventReceiver, self.FilteredContents, SortByIdx, SortType)
    self:FillListView()
  end
end

function M:NavigateToItem(Content)
  self.TileView_Select_Role:BP_NavigateToItem(Content)
end

function M:ScrollItemIntoView(Content)
  self.TileView_Select_Role:BP_ScrollItemIntoView(Content)
end

function M:GetSelectedListItem()
  return self.LastSelectedListContent
end

function M:FillListView()
  self:PlayAnimation(self.List_Change)
  self.TileView_Select_Role:ClearListItems()
  self.LastSelectedListContent = nil
  for i, value in ipairs(self.FilteredContents) do
    value.IndexInList = i - 1
    if value.IsSelect then
      self.LastSelectedListContent = value
    end
    self.TileView_Select_Role:AddItem(value)
  end
  if not self.LastSelectedListContent then
    self.LastSelectedListContent = self.FilteredContents[1]
  end
  if #self.FilteredContents <= 0 then
    self.Bg_Dialog.Not_Have:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.TileView_Select_Role:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Bg_Dialog.Not_Have:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.TileView_Select_Role:SetVisibility(UIConst.VisibilityOp.Visible)
    self:AddTimer(0.01, function()
      local ItemUIs = self.TileView_Select_Role:GetDisplayedEntryWidgets()
      local XCount, YCount = UIUtils.GetTileViewContentMaxCount(self.TileView_Select_Role, "XY")
      local ItemLen = ItemUIs:Length()
      local RestCount = XCount * YCount - ItemLen
      if RestCount <= 0 then
        RestCount = XCount - #self.FilteredContents % XCount
      end
      self:FillEmptyItems(RestCount)
      if self.Event_OnListItemInited then
        self.Event_OnListItemInited(self.EventReceiver)
      end
    end, false, 0, "DelayAddEmptyItem", true)
  end
end

function M:RegenerateAllEntries()
  self.TileView_Select_Role:RegenerateAllEntries()
end

function M:FillEmptyItems(Count)
  for i = 1, Count do
    self.TileView_Select_Role:AddItem(NewObject(UIUtils.GetCommonItemContentClass()))
  end
end

function M:AttachTipsWidget(Widget)
  self.Pos_Tips:AddChild(Widget)
end

function M:IsTipsWidgetShowed()
  return self.bTipsWidgetShowed
end

function M:SetEmptyStateText(Text)
  self.Bg_Dialog.Text_MailDetail_Empry:SetText(Text)
end

function M:SetTitle(Title)
  if Title then
    self.Panel_Recommend:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Weapon_Recommend:SetText(Title)
  else
    self.Panel_Recommend:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:SetSubTitle(Title)
  if not Title then
    self.Text_Commond:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Split:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Text_Commond:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Split:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_Commond:SetText(Title)
  end
end

function M:ScrollItemIntoView(Content)
  if Content then
    self.TileView_Select_Role:BP_ScrollItemIntoView(Content)
  end
end

function M:PlayInAnim()
  AudioManager(self):PlayUISound(self, "event:/ui/common/sub_panel_expand", "Selective_Listing_In", nil)
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:StopAnimation(self.Out)
  self:PlayAnimation(self.In)
end

function M:PlayOutAnim()
  AudioManager(self):PlayUISound(self, "event:/ui/common/sub_panel_expand", "Selective_Listing_In", {ToEnd = 1})
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
end

function M:Destruct()
  if AudioManager(self):IsSoundPlaying(self, "Selective_Listing_In") then
    AudioManager(self):SetEventSoundParam(self, "Selective_Listing_In", {ToEnd = 1})
  end
  self:RemoveTimer("DelayAddEmptyItem")
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.TileView_Select_Role)
end

function M:GetItemAt(Index)
  return self.TileView_Select_Role:GetItemAt(Index)
end

function M:WBP_Armory_Selective_Listing_Out()
  if self.HB_Main:IsVisible() then
    self.Overridden.WBP_Armory_Selective_Listing_Out(self)
  end
end

function M:InitNavigationRules()
  self.TileView_Select_Role:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.TileView_Select_Role:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.TileView_Select_Role:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.TileView_Select_Role:SetNavigationRuleCustom(EUINavigation.Left, {
    self,
    self.OnRoleListNavigation
  })
  self.EMListView_Filter:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.EMListView_Filter:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.EMListView_Filter:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.EMListView_Filter:SetNavigationRuleCustom(EUINavigation.Right, {
    self,
    self.OnFilterListNavigation
  })
  self.TileView_Select_Role.bWrapHorizontalNavigation = not self.Panel_FilterTab:IsVisible()
end

function M:OnRoleListNavigation(NavigationDirection)
  if NavigationDirection == EUINavigation.Left then
    self.EMListView_Filter:BP_SetSelectedItem(self.LastSelectedFilterContent)
    self.EMListView_Filter:BP_NavigateToItem(self.LastSelectedFilterContent)
    return self.EMListView_Filter
  end
  return self.TileView_Select_Role
end

function M:OnFilterListNavigation(NavigationDirection)
  if NavigationDirection == EUINavigation.Right then
    self.TileView_Select_Role:BP_SetSelectedItem(self.LastSelectedListContent)
    self.TileView_Select_Role:BP_NavigateToItem(self.LastSelectedListContent)
    return self.TileView_Select_Role
  end
  return self.EMListView_Filter
end

function M:OnSortListWidgetBack(MyGeometry, InKeyEvent)
  if self.LastFocusList:IsVisible() then
    return self.LastFocusList
  end
end

function M:OnSortListAddedToFocusPath()
  if UIUtils.HasAnyFocus(self.EMListView_Filter) then
    self.LastFocusList = self.EMListView_Filter
  else
    self.LastFocusList = self.TileView_Select_Role
  end
end

function M:OnSortListRemovedFromFocusPath()
end

AssembleComponents(M)
return M
