local WBP_Abyss_Lineup_List_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})
WBP_Abyss_Lineup_List_C._components = {
  "BluePrints.UI.UI_PC.Common.LSFocusComp"
}

function WBP_Abyss_Lineup_List_C:Construct()
  self.bAllowRefreshList = true
  self.Platform = CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance)
  self.List_Select.BP_OnItemClicked:Clear()
  self.List_Select.BP_OnEntryInitialized:Clear()
  self.List_Select.BP_OnEntryInitialized:Add(self, self.OnListItemInited)
  self.List_Select.BP_OnItemIsHoveredChanged:Add(self, self.OnItemIsHoverChanged)
  self.EMListView_Filter.BP_OnItemClicked:Clear()
  self.EMListView_Filter.BP_OnItemClicked:Add(self, self.OnFilterListItemClicked)
  self.EMListView_Filter.BP_OnEntryInitialized:Clear()
  self.EMListView_Filter.BP_OnEntryInitialized:Add(self, self.OnFilterListItemInited)
  self.EMListView_Filter.BP_OnItemIsHoveredChanged:Clear()
  self.EMListView_Filter.BP_OnItemIsHoveredChanged:Add(self, self.OnFilterListItemHovered)
  self.Text_Empty:SetText(GText("UI_Armory_Pet_Empty"))
  self:AddLSFocusTarget(nil, {
    self.Sort
  })
  self:InitKeyInfo()
  self:RefreshBaseInfo()
end

function WBP_Abyss_Lineup_List_C:Destruct()
  self.List_Select.BP_OnItemClicked:Clear()
  self.List_Select.BP_OnEntryInitialized:Clear()
  self.EMListView_Filter.BP_OnItemClicked:Clear()
  self.EMListView_Filter.BP_OnEntryInitialized:Clear()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Abyss_Lineup_List_C:IsMobile()
  return self.Platform == CommonConst.CLIENT_DEVICE_TYPE.MOBILE
end

function WBP_Abyss_Lineup_List_C:InitKeyInfo()
  if self:IsMobile() then
    return
  end
  self.Key_L:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "Q"}
    }
  })
  self.Key_R:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "E"}
    }
  })
  self.Key_Controller_L:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LB"}
    }
  })
  self.Key_Controller_R:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RB"}
    }
  })
end

function WBP_Abyss_Lineup_List_C:OnListItemInited(Content, EntryUI)
  if self.Event_OnEntryInitialized then
    self.Event_OnEntryInitialized(self.EventReceiver, Content, EntryUI)
  end
end

function WBP_Abyss_Lineup_List_C:RefreshBaseInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
end

function WBP_Abyss_Lineup_List_C:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    self.Switch_Mode_L:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Switch_Mode_R:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Sort.Controller:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  else
    self.Switch_Mode_L:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Switch_Mode_R:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    self.Switch_Mode_L:SetActiveWidgetIndex(0)
    self.Switch_Mode_R:SetActiveWidgetIndex(0)
    self.Sort.Controller:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Switch_Mode_L:SetActiveWidgetIndex(1)
    self.Switch_Mode_R:SetActiveWidgetIndex(1)
    if not self:IsInLSMode() then
      self.Sort.Controller:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
end

function WBP_Abyss_Lineup_List_C:OnListKeyUp(MyGeometry, InKeyEvent)
  local IsHandled = self:OnKeyDownForLSComp(MyGeometry, InKeyEvent)
  return IsHandled
end

function WBP_Abyss_Lineup_List_C:Init(Parent, Params)
  self.Parent = Parent
  self.Params = Params
  self.Filters = Params.Filters or {}
  self.FilterMod = Params.FilterMod or "Single"
  self.FilterIdxes = {}
  self.Type = Params.Type
  self.SortType = Params.SortType
  self.AllItemContents = Params.ItemContents
  self.OrderByDisplayNames = Params.OrderByDisplayNames
  self.EMListView_Filter:ClearListItems()
  self.SelectedFilterContents = {}
  self.FilteredContents = {}
  if self.AllItemContents then
    for index, value in ipairs(self.AllItemContents) do
      table.insert(self.FilteredContents, value)
    end
  end
  self.FilterContentObj_All = nil
  if #self.Filters > 0 then
    self.FilterContentObj_All = NewObject(UIUtils.GetCommonItemContentClass())
    self.FilterContentObj_All.IsSelecte = true
    self.FilterContentObj_All.Index = 0
    self.FilterContentObj_All.Icon = "/Game/UI/Texture/Static/Atlas/Armory/T_Armory_Select.T_Armory_Select"
    self.FilterContentObj_All.IsSelected = true
    self.EMListView_Filter:AddItem(self.FilterContentObj_All)
    self.Tab_Sub:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Tab_Sub:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.bAllowRefreshList = false
  for Index, Tag in ipairs(self.Filters) do
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    for key, value in pairs(Tag) do
      Obj[key] = value
    end
    Obj.Index = Index
    self.EMListView_Filter:AddItem(Obj)
  end
  self.CurrentTabIdx = 0
  self:AddTimer(0.2, function()
    self.bAllowRefreshList = true
  end, false, 0, "DelaySetAllowRefreshList", true)
  self.Sort:Init(self.Parent, self.OrderByDisplayNames, self.SortType or CommonConst.DESC)
  self.Sort:BindEventOnSelectionsChanged(self, self.OnSortListSelectionsChanged)
  self.Sort:BindEventOnSortTypeChanged(self, self.OnSortTypeChanged)
  self.Sort.Controller:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if IsValid(self.Sort.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self.Sort, self.Sort.RefreshOpInfoByInputDevice)
  end
  self:FillListView()
  self:OnSortTypeChanged()
  self:SetEmptyText(self.Type)
end

local WeaponTags = {
  CommonConst.ArmoryTag.Melee,
  CommonConst.ArmoryTag.Ranged
}

function WBP_Abyss_Lineup_List_C:SetEmptyText(Type)
  for _, Tag in pairs(WeaponTags) do
    if Type == Tag then
      Type = CommonConst.ArmoryType.Weapon
      break
    end
  end
  if Type and "" ~= Type then
    self.Text_Empty:SetText(GText("UI_Armory_" .. Type .. "_Empty"))
  end
end

function WBP_Abyss_Lineup_List_C:BindEvents(EventReceiver, Events)
  self.EventReceiver = EventReceiver
  self.Event_SortFuncion = Events.SortFuncion
  self.Event_FilterFunction = Events.FilterFunction
  self.Event_OnListItemInited = Events.OnListItemInited
  self.Event_OnEntryInitialized = Events.OnEntryInitialized
  self.Event_OnItemIsHoverChanged = Events.OnItemIsHoverChanged
end

function WBP_Abyss_Lineup_List_C:SetSortWidgetFocus()
  self.Sort:SetFocus()
end

function WBP_Abyss_Lineup_List_C:OnItemIsHoverChanged(Content, bHovered)
  if self.Event_OnItemIsHoverChanged then
    self.Event_OnItemIsHoverChanged(self.EventReceiver, Content, bHovered)
  end
end

function WBP_Abyss_Lineup_List_C:OnFilterListItemClicked(Content)
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
    else
    end
    self:SetFilterContentIsSelected(Content, true)
  else
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_sort_tab", nil, nil)
  self:UpdateFilterInfos()
  local FilterIdxes = self.FilterIdxes
  if self.Event_FilterFunction then
    self.FilteredContents = self.Event_FilterFunction(self.EventReceiver, self.AllItemContents, FilterIdxes) or {}
    if self.Event_SortFuncion then
      local SortByIdx, SortType = self.Sort:GetSortInfos()
      self.Event_SortFuncion(self.EventReceiver, self.FilteredContents, SortByIdx, SortType)
    end
    self:FillListView()
  end
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem:SetTargetUIFocusWidget(Content.UI)
    self.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
  end
  self.CurrentTabIdx = Content.Index
end

function WBP_Abyss_Lineup_List_C:OnFilterListItemHovered(Content, bHovered)
  if self.GameInputModeSubsystem:GetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  if not self.bAllowRefreshList then
    return
  end
  if not bHovered then
    return
  end
  self:OnFilterListItemClicked(Content)
end

function WBP_Abyss_Lineup_List_C:OnFilterListItemInited(Content, EntryUI)
  if EntryUI then
    Content.UI = EntryUI
  end
end

function WBP_Abyss_Lineup_List_C:SetCurrentTabItemFocus()
  self.EMListView_Filter:NavigateToIndex(self.CurrentTabIdx)
end

function WBP_Abyss_Lineup_List_C:SetFilterContentIsSelected(Content, IsSelected)
  Content.IsSelected = IsSelected
  if Content.UI then
    Content.UI:SetIsSelected(Content.IsSelected)
  end
  if Content.Tag then
    self.SelectedFilterContents[Content.Tag] = Content
  end
end

function WBP_Abyss_Lineup_List_C:UpdateFilterInfos()
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

function WBP_Abyss_Lineup_List_C:OnSortListSelectionsChanged()
  local SortByIdx, SortType = self.Sort:GetSortInfos()
  if self.Event_SortFuncion then
    self.Event_SortFuncion(self.EventReceiver, self.FilteredContents, SortByIdx, SortType)
    self:FillListView()
  end
end

function WBP_Abyss_Lineup_List_C:OnSortTypeChanged()
  local SortByIdx, SortType = self.Sort:GetSortInfos()
  if self.Event_SortFuncion then
    self.Event_SortFuncion(self.EventReceiver, self.FilteredContents, SortByIdx, SortType)
    self:FillListView()
  end
end

function WBP_Abyss_Lineup_List_C:FillListView()
  self:PlayAnimation(self.List_Change)
  self:SetLastItemNavigationRule(true)
  self.List_Select:ClearListItems()
  for _, value in ipairs(self.FilteredContents) do
    self.List_Select:AddItem(value)
  end
  local bListEmpty = false
  if #self.FilteredContents <= 0 then
    self.List_Select:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Empty:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    bListEmpty = true
  else
    self.Empty:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.List_Select:SetVisibility(UIConst.VisibilityOp.Visible)
    self:AddTimer(0.01, function()
      local ItemUIs = self.List_Select:GetDisplayedEntryWidgets()
      local XCount, YCount = UIUtils.GetTileViewContentMaxCount(self.List_Select, "XY")
      local ItemLen = ItemUIs:Length()
      local RestCount = XCount * YCount - ItemLen
      if RestCount <= 0 then
        RestCount = XCount - #self.FilteredContents % XCount
      end
      self:FillEmptyItems(RestCount)
      self.List_Select:RegenerateAllEntries()
      self.List_Select:ScrollToTop()
      if self.Event_OnListItemInited then
        self.Event_OnListItemInited(self.EventReceiver)
      end
      self:AddTimer(0.01, function()
        self:SetLastItemNavigationRule(false, ItemLen)
      end, false, 0, "DelaySetNavigation", true)
    end, false, 0, "DelayAddEmptyItem", true)
  end
  self.Parent:OnListInited(bListEmpty)
end

function WBP_Abyss_Lineup_List_C:SetLastItemNavigationRule(bClear, Index)
  if self:IsMobile() then
    return
  end
  if bClear then
    if not self.LastWidget then
      return
    end
    self.LastWidget:SetAllNavigationRules(EUINavigationRule.Escape, 0)
    self.LastWidget = nil
  else
    local LastItem = self.List_Select:GetItemAt(Index - 1)
    if not LastItem or not LastItem.SelfWidget then
      return
    end
    local LastWidget = LastItem.SelfWidget
    LastWidget:SetNavigationRuleExplicit(EUINavigation.Right, self.EMListView_Filter)
    self.LastWidget = LastWidget
  end
end

function WBP_Abyss_Lineup_List_C:FillEmptyItems(Count)
  for i = 1, Count do
    self.List_Select:AddItem(NewObject(UIUtils.GetCommonItemContentClass()))
  end
end

function WBP_Abyss_Lineup_List_C:ScrollItemIntoView(Content)
  if Content then
    self.List_Select:BP_ScrollItemIntoView(Content)
  end
end

function WBP_Abyss_Lineup_List_C:PlayInAnim()
  AudioManager(self):PlayUISound(self, "event:/ui/common/sub_panel_expand", "Selective_Listing_In", nil)
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:StopAnimation(self.Out)
  self:PlayAnimation(self.In)
end

function WBP_Abyss_Lineup_List_C:PlayOutAnim()
  AudioManager(self):PlayUISound(self, "event:/ui/common/sub_panel_expand", "Selective_Listing_In", {ToEnd = 1})
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
end

function WBP_Abyss_Lineup_List_C:Destruct()
  if AudioManager(self):IsSoundPlaying(self, "Selective_Listing_In") then
    AudioManager(self):SetEventSoundParam(self, "Selective_Listing_In", {ToEnd = 1})
  end
  self:RemoveTimer("DelayAddEmptyItem")
  self:RemoveTimer("DelaySetNavigation")
end

AssembleComponents(WBP_Abyss_Lineup_List_C)
return WBP_Abyss_Lineup_List_C
