require("UnLua")
local WBP_Build_List_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})
WBP_Build_List_C._components = {
  "BluePrints.UI.UI_PC.Common.LSFocusComp",
  "BluePrints.UI.UI_PC.Common.HorizontalListViewResizeComp"
}
WBP_Build_List_C.GamepadIcons = {}

function WBP_Build_List_C:Construct()
  self.List_Select.BP_OnItemClicked:Clear()
  self.List_Select.BP_OnItemClicked:Add(self, self.OnListItemClicked)
  self.List_Select.BP_OnEntryInitialized:Clear()
  self.List_Select.BP_OnEntryInitialized:Add(self, self.OnListItemInited)
  self.EMListView_Filter.BP_OnItemClicked:Clear()
  self.EMListView_Filter.BP_OnItemClicked:Add(self, self.OnFilterListItemClicked)
  self.CurFilterItem = nil
  self.Text_Empty:SetText(GText("UI_Armory_Char_Empty"))
  self:AddLSFocusTarget(self.Sort.Controller, {
    self.Sort
  })
  self:InitKeyInfo()
  self:RefreshBaseInfo()
  self:InitListenEvent()
end

function WBP_Build_List_C:Destruct()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Build_List_C:BtnEventClear(Btn)
  Btn.OnPressed:Clear()
  Btn.OnReleased:Clear()
  Btn.OnClicked:Clear()
  Btn.OnHovered:Clear()
  Btn.OnUnhovered:Clear()
end

function WBP_Build_List_C:InitKeyInfo()
  self.Key_L:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "Q"}
    }
  })
  self:BtnEventClear(self.Key_L.Button_Key)
  self.Key_R:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "E"}
    }
  })
  self:BtnEventClear(self.Key_R.Button_Key)
  self.Key_Controller_L:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LT"}
    }
  })
  self.Key_Controller_R:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RT"}
    }
  })
end

function WBP_Build_List_C:SetEmptyText(Text)
  self.Text_Empty:SetText(Text)
end

function WBP_Build_List_C:GetSquadMainUI()
  return UIManager(self):GetUIObj("SquadMainUINew")
end

function WBP_Build_List_C:IsSubstringContained(parentStr, subStr)
  local startPos, endPos = string.find(parentStr, subStr)
  if nil ~= startPos then
    return nil ~= startPos, string.sub(parentStr, -1)
  end
  return nil, nil
end

function WBP_Build_List_C:OnListItemInited(Content, EntryUI)
  local SquadMainUI = self:GetSquadMainUI()
  local Avatar = GWorld:GetAvatar()
  EntryUI:SetInGear(false)
  EntryUI:SetWeaponMiniPhantomIcon()
  EntryUI:SetSelected(false)
  if SquadMainUI.CurSquadInfo then
    for key, value in pairs(SquadMainUI.CurSquadInfo) do
      local IsEquipped, WidgetName = SquadMainUI:CheckThisContentIsEquippedByOtherSlot(Content.Uuid)
      if IsEquipped then
        local IsPhantomWeapon, EndPos = self:IsSubstringContained(WidgetName or key, "PhantomWeapon")
        if IsPhantomWeapon then
          EntryUI:SetWeaponMiniPhantomIcon(Avatar and Avatar.Chars[SquadMainUI.CurSquadInfo["Phantom" .. EndPos]].CharId or SquadMainUI.SquadInfo["Phantom" .. EndPos .. "Id"])
        else
          EntryUI.Rarity = Content.Rarity
          EntryUI:SetInGear(true)
        end
        SquadMainUI.RightSlots[WidgetName].ItemInfo = Content
        if SquadMainUI.CurSlot.Uuid and SquadMainUI.CurSlot.Uuid == Content.Uuid then
          Content.IsSelected = true
          Content.SelfWidget:SetSelected(true)
        end
        return
      end
    end
  end
  if self.Event_OnEntryInitialized then
    self.Event_OnEntryInitialized(self.EventReceiver, Content, EntryUI)
  end
end

function WBP_Build_List_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Build_List_C:RefreshBaseInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function WBP_Build_List_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    self.Switch_Mode_L:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Switch_Mode_R:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  else
    self.Switch_Mode_L:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Switch_Mode_R:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    for _, IconName in pairs(self.GamepadIcons) do
      if self[IconName] then
        self[IconName]:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
    self.Switch_Mode_L:SetActiveWidgetIndex(0)
    self.Switch_Mode_R:SetActiveWidgetIndex(0)
  else
    for _, IconName in pairs(self.GamepadIcons) do
      if self[IconName] then
        self[IconName]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
    end
    self.Switch_Mode_L:SetActiveWidgetIndex(1)
    self.Switch_Mode_R:SetActiveWidgetIndex(1)
  end
end

function WBP_Build_List_C:OnKeyDown(MyGeometry, InKeyEvent)
  local IsHandled = self:OnKeyDownForLSComp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  DebugPrint("thy   WBP_Build_List_C:OnKeyDown", InKeyName)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_LeftThumbstick" == InKeyName then
    elseif "Gamepad_FaceButton_Right" == InKeyName then
    end
    return false
  end
  if not IsHandled then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  else
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
end

function WBP_Build_List_C:Init(Parent, Params)
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
  self.CurFilterItem = nil
  if self.AllItemContents then
    for index, value in ipairs(self.AllItemContents) do
      value.OnFocusReceivedEvent = {
        Obj = self,
        Callback = self.OnFocusReceivedEvent
      }
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
    self.FilterContentObj_All.Owner = self
    self.EMListView_Filter:AddItem(self.FilterContentObj_All)
    self.Tab_Sub:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Tab_Sub:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  for Index, Tag in ipairs(self.Filters) do
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    for key, value in pairs(Tag) do
      Obj[key] = value
    end
    Obj.Index = Index
    Obj.Owner = self
    self.EMListView_Filter:AddItem(Obj)
  end
  local Params = {
    OnGetBackFocusWidget = function()
      return self.List_Select
    end
  }
  self.Sort:Init(self.Parent, self.OrderByDisplayNames, self.SortType or CommonConst.DESC, Params)
  self.Sort:BindEventOnSelectionsChanged(self, self.OnSortListSelectionsChanged)
  self.Sort:BindEventOnSortTypeChanged(self, self.OnSortTypeChanged)
  self:FillListView()
end

function WBP_Build_List_C:BindEvents(EventReceiver, Events)
  self.EventReceiver = EventReceiver
  self.Event_OnListItemClicked = Events.OnListItemClicked
  self.Event_SortFuncion = Events.SortFuncion
  self.Event_FilterFunction = Events.FilterFunction
  self.Event_OnListItemInited = Events.OnListItemInited
  self.Event_OnEntryInitialized = Events.OnEntryInitialized
end

function WBP_Build_List_C:OnFocusReceivedEvent()
  self.IsFromListContent = true
end

function WBP_Build_List_C:SetSortWidgetFocus()
  self.Sort:SetFocus()
end

function WBP_Build_List_C:OnListItemClicked(Content)
  if self.Event_OnListItemClicked then
    self.Event_OnListItemClicked(self.EventReceiver, Content)
  end
end

function WBP_Build_List_C:OnFilterListItemClicked(Content)
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
end

function WBP_Build_List_C:SetFilterContentIsSelected(Content, IsSelected)
  Content.IsSelected = IsSelected
  if Content.UI then
    Content.UI:SetIsSelected(Content.IsSelected)
  end
  if Content.Tag then
    self.SelectedFilterContents[Content.Tag] = Content
  end
end

function WBP_Build_List_C:UpdateFilterInfos()
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

function WBP_Build_List_C:OnSortListSelectionsChanged()
  local SortByIdx, SortType = self.Sort:GetSortInfos()
  if self.Event_SortFuncion then
    self.Event_SortFuncion(self.EventReceiver, self.FilteredContents, SortByIdx, SortType)
    self:FillListView()
  end
end

function WBP_Build_List_C:OnSortTypeChanged()
  local SortByIdx, SortType = self.Sort:GetSortInfos()
  if self.Event_SortFuncion then
    self.Event_SortFuncion(self.EventReceiver, self.FilteredContents, SortByIdx, SortType)
    self:FillListView()
  end
end

function WBP_Build_List_C:FillListView()
  self.List_Select:ClearListItems()
  for _, value in ipairs(self.FilteredContents) do
    self.List_Select:AddItem(value)
  end
  if #self.FilteredContents <= 0 then
    self.List_Select:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Empty:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Sort:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Empty:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Sort:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
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
    end, false, 0, "DelayAddEmptyItem", true)
  end
end

function WBP_Build_List_C:FillEmptyItems(Count)
  for i = 1, Count do
    self.List_Select:AddItem(NewObject(UIUtils.GetCommonItemContentClass()))
  end
end

function WBP_Build_List_C:ScrollItemIntoView(Content)
  if Content then
    self.List_Select:BP_ScrollItemIntoView(Content)
  end
end

function WBP_Build_List_C:PlayInAnim()
  AudioManager(self):PlayUISound(self, "event:/ui/common/sub_panel_expand", "Selective_Listing_In", nil)
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:StopAnimation(self.Out)
  self:PlayAnimation(self.In)
end

function WBP_Build_List_C:PlayOutAnim()
  AudioManager(self):PlayUISound(self, "event:/ui/common/sub_panel_expand", "Selective_Listing_In", {ToEnd = 1})
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
end

function WBP_Build_List_C:Destruct()
  if AudioManager(self):IsSoundPlaying(self, "Selective_Listing_In") then
    AudioManager(self):SetEventSoundParam(self, "Selective_Listing_In", {ToEnd = 1})
  end
  self:RemoveTimer("DelayAddEmptyItem")
end

AssembleComponents(WBP_Build_List_C)
return WBP_Build_List_C
