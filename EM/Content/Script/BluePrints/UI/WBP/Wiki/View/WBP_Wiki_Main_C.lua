require("UnLua")
local WikiCommon = require("BluePrints.UI.WBP.Wiki.WikiCommon")
local WikiController = require("BluePrints.UI.WBP.Wiki.WikiController")
local WikiText_BP = "/Game/UI/WBP/Encyclopedia/Widget/WBP_Encyclopedia_Text.WBP_Encyclopedia_Text"
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.Super.Construct(self)
  self.Categories = WikiCommon.Categories
  self.AllGuideNotes = DataMgr.WikiMain or {}
  self.CurrentSearchContent = ""
  self.FilteredList = nil
  self.IsSearchMode = false
  self.IsAssociatedJump = false
  self:InitWikiNoteData()
  local SearchInputConfig = {
    Owner = self,
    OnGetBackFocusWidget = self.SetGetBackFocusWidget,
    Events = {
      OnTextChanged = self.OnContentChanged,
      OnTextCommitted = self.OnContentChanged
    },
    HintText = GText("UI_Wiki_DefaultSearch")
  }
  self.Com_Input_Light:Init(SearchInputConfig)
  self.CurrentSelectedCell = nil
  self.CurrentSelectedEntry = nil
  WikiController:GetModel():AddNewStateListener(self, function(subTypeId, tabId)
    self:UpdateTabsRedDot()
  end)
  self.List_Catalogue:DisableScroll(true)
  self:InitListenEvent()
  self:RefreshBaseInfo()
end

function M:InitWikiNoteData()
  self.Categories[1].WikiNotes = {}
  self.UnlockedWikiNotes = WikiController:GetModel():GetUnlockedWikiEntryIds()
  if self.AllGuideNotes then
    for WikiNoteId, Content in pairs(self.AllGuideNotes) do
      local ContentTemp = Content
      local IsUnlocked = true
      if self.UnlockedWikiNotes then
        IsUnlocked = self.UnlockedWikiNotes[WikiNoteId] ~= nil
      end
      if IsUnlocked then
        local TabID = ContentTemp.MainType + 1
        if self.Categories[TabID].WikiNotes == nil then
          self.Categories[TabID].WikiNotes = {}
        end
        self.Categories[TabID].WikiNotes[WikiNoteId] = ContentTemp
        self.Categories[1].WikiNotes[WikiNoteId] = ContentTemp
      end
    end
  else
    DebugPrint(TXTTag, "AllGuideNotes is nil")
  end
end

function M:UpdateTextNum(tabId)
  local NumNow, NumAll = WikiController:GetModel():GetTextNum(tabId)
  self.Text_Num:SetText(NumNow .. "/" .. NumAll)
end

function M:InitUIInfo(Name, IsInUIMode, EventList, Params)
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, Params)
  self.Params = Params
  self.Tabs = CommonUtils.DeepCopy(WikiCommon.TabList)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:InitWikiEntryReddotNode()
  end
  self:InitMainTab(Params.TabId)
  self.Group_ContentEmpty:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_labelTitle:SetText(GText("UI_Wiki_RelatedEntry"))
  self.Text_Empty:SetText(GText("UI_Matches_Not_Found"))
  self.Text_Com_Empty:SetText(GText("UI_Wiki_No_Choose"))
  self.List_label:SetAllowOverscroll(false)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "WikiMain", nil)
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
end

function M:InitMainTab(TargetTabId)
  local CurLanguageTabs = CommonUtils.DeepCopy(self.Tabs)
  for i, tab in ipairs(self.Tabs) do
    CurLanguageTabs[i].Text = GText(tab.Text)
  end
  self.Tabs = CurLanguageTabs
  self.Com_Tab:Init({
    Tabs = self.Tabs,
    DynamicNode = {"Back", "BottomKey"},
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.CloseSelf
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    },
    OwnerPanel = self,
    BackCallback = self.CloseSelf,
    StyleName = "Icon",
    TitleName = GText("MAIN_UI_WIKI")
  })
  self.InitializedTab = true
  self:UpdateTabsRedDot()
  self.Com_Tab:BindEventOnTabSelected(self, self.OnTabChanged)
  local TargetTabId = TargetTabId or 1
  self:UpdateTextNum(TargetTabId)
  self.TargetList = self.Categories[TargetTabId].WikiNotes
  local actualIndex = 1
  for index, tab in ipairs(self.Tabs) do
    if tab.TabId == TargetTabId then
      actualIndex = index
      break
    end
  end
  self.CurrentTabIndex = actualIndex
  self:UpdateListView()
  self.Com_Tab:SelectTabById(TargetTabId)
  self:SelectFirstEntryInWikiMain()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self.Common_Btn_Close_PC:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:ClearDialogueWiki()
  if self.Params.bShowDialogueWiki then
    self:ShowDialogueWiki()
  end
end

function M:SelectFirstEntryInWikiMain()
  self:AddTimer(0.1, function()
    local SubTypeWidget = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.List_Catalogue, 0)
    if SubTypeWidget then
      if not SubTypeWidget.IsExpanded then
        SubTypeWidget:OnItemClicked(true)
      end
      self:AddTimer(0.2, function()
        local entryWidget = SubTypeWidget.List_Box:GetChildAt(0)
        if entryWidget then
          self.FirstEntryWidget = entryWidget
          entryWidget.IsSelected = false
          entryWidget:OnCellClicked(true)
        end
        self:RefreshList_Catalogue()
        if self.CurInputDevice == ECommonInputType.Gamepad then
          self.FirstEntryWidget:SetFocus()
        end
      end)
    end
  end)
end

function M:ShowDialogueWiki()
  self:SetDialogueWikiMode(true)
  if self.Params.DialogueEntryIds then
    self:ShowDialogueEntry(self.Params.DialogueEntryIds)
  end
end

function M:ClearDialogueWiki()
  self:SetDialogueWikiMode(false)
end

function M:SetDialogueWikiMode(bShow)
  local visibility = bShow and UIConst.VisibilityOp.Collapsed or UIConst.VisibilityOp.Visible
  local elements = {}
  local isPC = CommonUtils.GetDeviceTypeByPlatformName(self) == "PC"
  if isPC then
    elements = {
      self.List_label,
      self.Com_Tab.HB,
      self.Com_Tab.Panel_Back,
      self.Com_Tab.Bg_Bottom,
      self.Com_Tab.Bg_Top,
      self.Com_Tab.BackgroundBlur_Top,
      self.Com_Tab.BackgroundBlur_Bottom,
      self.Com_Tab.Com_BarBg,
      self.Com_Tab.Com_BarBg_1
    }
    if bShow then
      self.Text_ListTabTitle:SetText(GText("UI_Wiki_WikiReferTitle"))
      self.Text_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  else
    elements = {
      self.List_label,
      self.Com_Tab,
      self.Com_Tab.Panel_Tab,
      self.Com_Tab.Panel_Info
    }
    if bShow then
      self.Group_GatherNum:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Common_Btn_Close_PC:SetVisibility(UIConst.VisibilityOp.Visible)
      self.Common_Btn_Close_PC:Init("Close", self, self.CloseSelf)
    else
      self.Group_GatherNum:SetVisibility(UIConst.VisibilityOp.Visible)
      self.Common_Btn_Close_PC:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  for _, element in ipairs(elements) do
    if element then
      element:SetVisibility(visibility)
    end
  end
  if bShow then
    self.Group_Search:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Switcher_List:SetActiveWidgetIndex(1)
  else
    self.Switcher_List:SetActiveWidgetIndex(0)
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    local CanvasSlot = self.Group_Book.Slot
    local Offset = CanvasSlot:GetOffsets()
    if bShow then
      Offset.Left = self.OffsetLeft_In_QuickCheck
      CanvasSlot:SetOffsets(Offset)
    else
      Offset.Left = self.OffsetLeft_In_Encyclopedia
      CanvasSlot:SetOffsets(Offset)
    end
  end
end

function M:ShowDialogueEntry(entryIds)
  self.List_Catalogue_Subsize:ClearListItems()
  WikiController:HandleDialogueEntries(entryIds, function(readableEntries)
    for _, entryData in pairs(readableEntries) do
      local entryItem = self:CreateDialogueEntryItem(entryData)
      self.List_Catalogue_Subsize:AddItem(entryItem)
    end
    self.List_Catalogue_Subsize:RequestRefresh()
    self.List_Catalogue_Subsize:BP_CancelScrollIntoView()
    self.List_Catalogue_Subsize:BP_NavigateToItem(self.List_Catalogue_Subsize:GetItemAt(0))
    self:AutoSelectFirstEntry()
  end)
end

function M:AutoSelectFirstEntry()
  self:AddTimer(0.1, function()
    local entryWidget = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.List_Catalogue_Subsize, 0)
    if entryWidget then
      entryWidget:OnCellClicked(true)
    end
  end)
end

function M:CreateDialogueEntryItem(entryData)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.EntryId = entryData.EntryId
  Obj.EntryTitle = entryData.EntryTitle
  Obj.IsDialogueEntry = true
  Obj.Parent = self
  return Obj
end

function M:UpdateTabsLockState()
  local shouldUpdateTabs = false
  if self.InitializedTab then
    shouldUpdateTabs = true
    self.InitializedTab = false
  end
  for i = 1, #self.Tabs do
    local tabId = self.Tabs[i].TabId
    local NumNow, _ = WikiController:GetModel():GetTextNum(tabId)
    local wasLocked = self.Tabs[i].IsLocked
    self.Tabs[i].IsLocked = NumNow <= 0
    if wasLocked and not self.Tabs[i].IsLocked then
      shouldUpdateTabs = true
    end
    if self.Tabs[i].IsLocked then
      self.Tabs[i].LockReasonText = GText("UI_Wiki_Tab_Locked")
    end
  end
  if shouldUpdateTabs then
    self.Com_Tab:UpdateTabs(self.Tabs)
  end
end

function M:OnTabChanged(TabWidget)
  self.CatalogueScroll:ScrollToStart()
  self:PlayAnimation(self.Refresh)
  self:CleanTimer()
  if self.Params.bShowDialogueWiki then
    return
  end
  local TabId = TabWidget:GetTabId()
  self.CurrentTabIndex = TabWidget.Idx
  self:UpdateTextNum(TabId)
  if TabId > 1 then
    self.Params.EntranceWidget:UpdateTextNum(TabId)
  end
  self:ChangeListContent(TabId)
  if self.CurrentSelectedCell then
    self.CurrentSelectedCell:OnCellUnSelect()
  end
  if not self.IsAssociatedJump then
    self:SelectFirstEntryInWikiMain()
  end
end

function M:ClearItemState()
  local items = self.List_Catalogue:GetListItems()
  for _, item in pairs(items) do
    item:ClearItemState()
  end
end

function M:ChangeListContent(TabId)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Text_ListTabTitle:SetText(self.Tabs[self.CurrentTabIndex].Text)
  else
    self.Text_TabTitle:SetText(self.Tabs[self.CurrentTabIndex].Text)
  end
  self.TargetList = self.Categories[TabId].WikiNotes
  self.CurrentSearchContent = self.Com_Input_Light:GetText()
  self.IsSearchMode = self.CurrentSearchContent ~= ""
  if self.CurrentSearchContent ~= "" then
    self:OnContentChanged(self.CurrentSearchContent)
  else
    self:UpdateListView()
  end
end

function M:OnContentChanged(NewText)
  self.CurrentSearchContent = NewText
  self.IsSearchMode = "" ~= NewText
  if not self.TargetList then
    if "" == NewText then
      self.FilteredList = nil
    else
      self.FilteredList = {}
    end
    self:UpdateListView()
    return
  end
  local TargetList = {}
  for EntryId, EntryData in pairs(self.TargetList) do
    TargetList[EntryId] = GText(EntryData.EntryTitle)
  end
  local SearchResult = {}
  if "" ~= NewText then
    SearchResult = CommonUtils.FuzzySearch(TargetList, NewText, true)
  end
  self:OnFilteredBySearch(SearchResult)
end

function M:OnFilteredBySearch(SearchResult)
  if self.IsSearchMode and next(SearchResult) == nil then
    self.FilteredList = nil
    self:UpdateListView()
    self:ShowEmptyList()
    self:ShowEmptyDescContent()
    if self.CurInputDevice == ECommonInputType.Gamepad then
      self:SetFocus()
    end
    return
  else
    self.Group_ListEmpty:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  local filteredTargetList = {}
  for EntryId, EntryData in pairs(self.TargetList) do
    if SearchResult[EntryId] then
      filteredTargetList[EntryId] = {
        EntryId = EntryId,
        SubType = EntryData.SubType,
        EntryTitle = SearchResult[EntryId],
        OriginalTitle = EntryData.EntryTitle
      }
    end
  end
  self.FilteredList = filteredTargetList
  self:UpdateListView()
end

function M:FilterEntriesBySubType(entries, subTypeId)
  if self.CurrentSearchContent == "" then
    return entries
  end
  if not (entries and next(entries)) or not self.FilteredList then
    return nil
  end
  local filteredEntries = {}
  for entryId, entryData in pairs(entries) do
    if self.FilteredList[entryId] and self.FilteredList[entryId].SubType == subTypeId then
      local entryDataCopy = CommonUtils.DeepCopy(entryData)
      entryDataCopy.EntryTitle = self.FilteredList[entryId].EntryTitle
      entryDataCopy.OriginalTitle = self.FilteredList[entryId].OriginalTitle
      filteredEntries[entryId] = entryDataCopy
    end
  end
  return next(filteredEntries) and filteredEntries or nil
end

function M:UpdateListView()
  self.List_Catalogue:ClearListItems()
  local tabId = self.Tabs[self.CurrentTabIndex].TabId
  local subTypes = WikiController:GetModel():GetWikiSubType(tabId)
  if not subTypes or CommonUtils.Size(subTypes) <= 0 then
    self:ShowEmptyList()
    return
  end
  local entriesBySubType = WikiController:GetModel():GetEntriesBySubType(tabId)
  local sortedSubTypes = {}
  for id, subType in pairs(subTypes) do
    table.insert(sortedSubTypes, subType)
  end
  table.sort(sortedSubTypes, function(a, b)
    return a.SubType < b.SubType
  end)
  local actualIndex = 0
  for i, subTypeData in ipairs(sortedSubTypes) do
    local subTypeId = subTypeData.SubType
    local subTypeText = subTypeData.SubTypeText
    local entries = entriesBySubType[subTypeId] or {}
    local hasUnlockedEntry = false
    for entryId, _ in pairs(entries) do
      if self.UnlockedWikiNotes and self.UnlockedWikiNotes[entryId] then
        hasUnlockedEntry = true
        break
      end
    end
    if hasUnlockedEntry then
      local displayEntries = self:FilterEntriesBySubType(entries, subTypeId)
      if displayEntries then
        local subTypeItem = self:CreateSubTypeItem(actualIndex, subTypeId, subTypeText, displayEntries, self.IsSearchMode)
        self.List_Catalogue:AddItem(subTypeItem)
        actualIndex = actualIndex + 1
      end
    end
  end
  self.Group_ListEmpty:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:RefreshList_Catalogue()
  DebugPrint(LXYTag, "RefreshList_Cataloguexxxxxxxxx")
  self.List_Catalogue:RequestRefresh()
  self.List_Catalogue:SetScrollbarVisibility(UIConst.VisibilityOp.Collapsed)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.List_Catalogue:SetControlScrollbarInside(true)
  else
    self.List_Catalogue:SetScrollbarVisibility(UIConst.VisibilityOp.Visible)
  end
end

function M:FilterEntriesByUnlock(entries)
  if not entries then
    return {}
  end
  if not self.UnlockedWikiNotes then
    return entries
  end
  local filteredEntries = {}
  for entryId, entryData in pairs(entries) do
    if self.UnlockedWikiNotes[entryId] then
      filteredEntries[entryId] = entryData
    end
  end
  return filteredEntries
end

function M:UpdateEntryWidgetSelectedStyle(EntryWidget)
  if self.CurrentSelectedEntry and self.CurrentSelectedEntry.SubTypeId ~= EntryWidget.SubTypeId then
    self.CurrentSelectedEntry.ListBox_Parent:PlayAnimation(self.CurrentSelectedEntry.ListBox_Parent.UnSelect)
  end
  self.CurrentSelectedEntry = EntryWidget
  self.CurrentSelectedEntry.ListBox_Parent:PlayAnimation(self.CurrentSelectedEntry.ListBox_Parent.Select)
end

function M:OnEntrySelected(selectedCell)
  if self.CurrentSelectedCell and self.CurrentSelectedCell.EntryId ~= selectedCell.EntryId then
    self.CurrentSelectedCell:OnCellUnSelect()
  end
  self.CurrentSelectedCell = selectedCell
  self:OpenDescPage(selectedCell)
end

function M:OpenDescPage(selectedCell)
  if not self.AllGuideNotes then
    DebugPrint(TXTTag, "AllGuideNotes is nil")
    return
  end
  local entryData = self.AllGuideNotes[selectedCell.EntryId]
  if not entryData then
    DebugPrint(TXTTag, "entryData is nil")
    return
  end
  local entryTexts = WikiController:GetModel():GetWikiTextByEntryId(selectedCell.EntryId)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.ListText = self.Guide_Desc_Text01
  else
    self.ListText = self.Guide_Desc_Text02_1
  end
  if entryData.EntryImg then
    local EntryImg = "/Game/UI/Texture/Dynamic/Image/Guide/T_Guide_Ex01_DirtyPic.T_Guide_Ex01_DirtyPic"
    self.Switch_Text:SetActiveWidgetIndex(0)
    local Img = LoadObject(entryData.EntryImg)
    self.Img_Icon:SetBrushResourceObject(Img)
  else
    self.Switch_Text:SetActiveWidgetIndex(1)
    self.ListText = self.Guide_Desc_Text02
  end
  self:UpdateDescContent(entryTexts, self.ListText)
  self:UpdateAssociatedEntry(entryData)
  self:UpdateDescScroll()
end

function M:ShowEmptyDescContent()
  self.Text_DescTitle:SetText("")
  self.Group_ContentEmpty:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Content:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:UpdateDescContent(entryTexts, ListText)
  if not entryTexts or CommonUtils.Size(entryTexts) <= 0 then
    return
  end
  self.Group_ContentEmpty:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Content:SetVisibility(UIConst.VisibilityOp.Visible)
  ListText:ClearChildren()
  local sortedTexts = WikiController:GetModel():SortTextsByTextId(entryTexts)
  for _, textData in pairs(sortedTexts) do
    local textItemObj = UIManager(self):CreateWidget(WikiText_BP)
    local textItem = self:CreateTextItem(textData)
    ListText:AddChild(textItemObj)
    textItemObj:OnListItemObjectSet(textItem)
  end
end

function M:UpdateDescScroll()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  local bCanScroll = UIUtils.CheckScrollBoxCanScroll(self.ListText)
  if bCanScroll then
    self.Com_Tab:UpdateBottomKeyInfo({
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "RV",
            Owner = self
          }
        },
        Desc = GText("UI_Controller_Slide"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.CloseSelf
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    })
  else
    self.Com_Tab:UpdateBottomKeyInfo({
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.CloseSelf
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    })
  end
end

function M:UpdateAssociatedEntry(entryData)
  self.List_Label:ClearListItems()
  local unlockedEntries = WikiController:GetModel():GetUnlockedWikiEntryIds()
  local hasAssociatedEntry = false
  for i = 1, 4 do
    local associatedEntryKey = "AssociatedEntry" .. i
    local associatedEntryId = entryData[associatedEntryKey]
    if not associatedEntryId then
      break
    end
    if unlockedEntries[associatedEntryId] then
      local associatedEntryData = self.AllGuideNotes[associatedEntryId]
      if associatedEntryData then
        local labelItem = self:CreateLabelItem(i, associatedEntryData)
        self.List_Label:AddItem(labelItem)
        hasAssociatedEntry = true
      end
    end
  end
  if not hasAssociatedEntry or self.Params.bShowDialogueWiki then
    self.HB:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.HB:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end

function M:OnAssociatedEntryClicked(targetData)
  if self.IsAssociatedJump then
    return
  end
  if not self:ValidateEntryData(targetData) then
    return
  end
  self:SwitchToTargetTab(targetData.MainType)
  self:NavigateToEntry(targetData.SubType, targetData.EntryId)
  self.IsAssociatedJump = false
end

function M:ValidateEntryData(targetData)
  if not targetData or not targetData.EntryId then
    return false
  end
  local unlockedWikiNotes = WikiController:GetModel():GetUnlockedWikiEntryIds()
  if not unlockedWikiNotes or not unlockedWikiNotes[targetData.EntryId] then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Wiki_Entry_Locked"))
    return false
  end
  return true
end

function M:SwitchToTargetTab(mainType)
  if self.IsSearchMode then
    self.Com_Input_Light:OnDeleteBtnClicked()
    self.IsSearchMode = false
  end
  self.IsAssociatedJump = true
  local RealMainType = mainType + 1
  for index, tab in ipairs(self.Tabs) do
    if tab.MainType == RealMainType and self.CurrentTabIndex ~= tab.TabId then
      self.CurrentTabIndex = tab.TabId
      break
    end
  end
  self.Com_Tab:SelectTabById(self.CurrentTabIndex)
end

function M:NavigateToEntry(subType, entryId)
  self:AddTimer(0.1, function()
    self:ScrollToSubType(subType, function(subTypeItem)
      self:SelectEntryInSubType(subTypeItem, entryId)
    end)
  end)
end

function M:ScrollToSubType(subType, callback)
  local subTypeIndex = self:GetSubTypeIndex(subType)
  if not subTypeIndex then
    return
  end
  self.List_Catalogue:ScrollIndexIntoView(subTypeIndex)
  local subTypeItem = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.List_Catalogue, subTypeIndex)
  if not subTypeItem then
    return
  end
  if not subTypeItem.IsExpanded then
    subTypeItem:OnItemClicked(true)
  end
  if callback then
    callback(subTypeItem)
  end
end

function M:SelectEntryInSubType(subTypeItem, entryId)
  self:AddTimer(0.1, function()
    local entryIndex = subTypeItem:GetEntryIndex(entryId)
    if not entryIndex then
      return
    end
    local entryWidget = subTypeItem.List_Box:GetChildAt(entryIndex)
    if entryWidget then
      entryWidget:OnCellClicked(true)
      self.CatalogueScroll:ScrollWidgetIntoView(entryWidget, true, EDescendantScrollDestination.Center)
    end
    entryWidget:SetFocus()
    if self.CurInputDevice == ECommonInputType.Gamepad then
    end
  end)
end

function M:GetSubTypeIndex(subTypeId)
  local items = self.List_Catalogue:GetListItems()
  if not items then
    return nil
  end
  for index, item in ipairs(items) do
    if item.SubTypeId == subTypeId then
      return item.Index
    end
  end
  return nil
end

function M:CreateSubTypeItem(index, subTypeId, subTypeText, entries, IsSearchMode)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.IsSearchMode = IsSearchMode
  Obj.SubTypeId = subTypeId
  Obj.SubTypeText = subTypeText
  Obj.Entries = entries
  Obj.Owner = self
  Obj.Index = index
  return Obj
end

function M:CreateLabelItem(index, entryData)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.TargetData = entryData
  Obj.Owner = self
  Obj.Index = index
  return Obj
end

function M:CreateTextItem(textData)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.TextId = textData.TextId
  Obj.EntryId = textData.EntryId
  Obj.TextUnlock = textData.TextUnlock
  Obj.TextDetail = textData.TextDetail
  Obj.PreviousText = textData.PreviousText
  return Obj
end

function M:ShowEmptyList()
  self.Group_ListEmpty:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local ParentHandled = M.Super.OnKeyDown(self, MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName then
    self:CloseSelf()
  elseif "Q" == InKeyName then
    if 1 == self.CurrentTabIndex then
      return
    end
    if self.CurrentSelectedCell then
      self.CurrentSelectedCell:OnCellUnSelect()
    end
    self.Com_Tab:TabToLeft()
  elseif "E" == InKeyName then
    if self.CurrentTabIndex == #self.Tabs then
      return
    end
    if self.CurrentSelectedCell then
      self.CurrentSelectedCell:OnCellUnSelect()
    end
    self.Com_Tab:TabToRight()
  end
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == Const.GamepadFaceButtonRight then
      self:CloseSelf()
    elseif InKeyName == Const.GamepadLeftShoulder then
      if 1 == self.CurrentTabIndex then
        return
      end
      if self.CurrentSelectedCell then
        self.CurrentSelectedCell:OnCellUnSelect()
      end
      self.Com_Tab:TabToLeft()
    elseif InKeyName == Const.GamepadRightShoulder then
      if self.CurrentTabIndex == #self.Tabs then
        return
      end
      if self.CurrentSelectedCell then
        self.CurrentSelectedCell:OnCellUnSelect()
      end
      self.Com_Tab:TabToRight()
    elseif InKeyName == Const.GamepadFaceButtonLeft then
      self.Com_Input_Light:SetVisibility(UIConst.VisibilityOp.Visible)
      self.Com_Input_Light:SetFocus()
      self.Com_Input_Light:FocusInputField()
    elseif InKeyName == Const.GamepadLeftThumbstick then
      self.Com_Input_Light:OnDeleteBtnClicked()
      self:SelectFirstEntryInWikiMain()
    end
  end
  return ParentHandled
end

function M:Destruct()
  self.Super.Destruct(self)
  WikiController:GetModel():RemoveNewStateListener(self)
end

function M:CloseSelf()
  if self:IsAnimationPlaying(self.Auto_In) then
    return
  end
  self.IsSearchMode = false
  AudioManager(self):SetEventSoundParam(self, "WikiMain", {ToEnd = 1})
  if self.Params.EntranceWidget and IsValid(self.Params.EntranceWidget) then
    self.Params.EntranceWidget:ShowSelf()
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:ClearWikiEntryReddotCount()
  end
  if self.Params.CloseCallback then
    self.Params.CloseCallback()
  end
  self:Close()
end

function M:UpdateTabsRedDot()
  self:UpdateTabsLockState()
  for Idx, tab in ipairs(self.Tabs) do
    if not tab.IsLocked then
      local isNew = WikiController:GetModel():IsTabNew(tab.TabId)
      self.Com_Tab:ShowTabRedDot(Idx, isNew)
      if self.Params and self.Params.EntranceWidget then
        WikiController:GetModel():UpdateEntranceRedDot(self.Params.EntranceWidget)
      end
    end
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.IsSearchMode then
    self.Com_Input_Light:SetFocus()
    self.Com_Input_Light:FocusInputField()
  elseif self.CurrentSelectedCell and IsValid(self.CurrentSelectedCell) and self.CurrentSelectedCell:IsVisible() then
    if self.IsSearchMode and CommonUtils.Size(self.FilteredList) < 1 then
      return M.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
    end
    self.CurrentSelectedCell:SetFocus()
  elseif self.FirstEntryWidget and IsValid(self.FirstEntryWidget) and self.FirstEntryWidget:IsVisible() then
    if self.IsSearchMode and CommonUtils.Size(self.FilteredList) < 1 then
      return M.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
    end
    self.FirstEntryWidget:SetFocus()
  else
    self:SetFocus()
  end
  self:InitNavigationRules()
  return M.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
end

function M:InitListenEvent()
  local PlayerController = self:GetOwningPlayer()
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshBaseInfo()
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
  self.CurGamepadName = CurGamepadName
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  local ActiveWidgetIndex = IsUseKeyAndMouse and 0 or 1
  if IsUseKeyAndMouse then
    if self.ListText then
      self.ListText:SetVisibility(UIConst.VisibilityOp.Visible)
    end
    self.Com_Input_Light:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    if self.ListText then
      self.ListText:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    self.Com_Input_Light:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    if self.IsSearchMode then
      self.Com_Input_Light:SetFocus()
      self.Com_Input_Light:FocusInputField()
    elseif self.CurrentSelectedCell and IsValid(self.CurrentSelectedCell) and self.CurrentSelectedCell:IsVisible() then
      self.CurrentSelectedCell:SetFocus()
    elseif self.FirstEntryWidget and IsValid(self.FirstEntryWidget) and self.FirstEntryWidget:IsVisible() then
      self.FirstEntryWidget:SetFocus()
    else
      self:SetFocus()
    end
  end
  self.CurInputDevice = CurInputDevice
end

function M:OnEditTextFocusLost()
  if self.CurInputDevice == ECommonInputType.Gamepad then
    self.Com_Input_Light:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
  self:SelectFirstEntryInWikiMain()
end

function M:InitNavigationRules()
  self:SetNavigationRuleCustom(EUINavigation.Right, {
    self,
    self.SetRightTarget
  })
  self.List_Label:SetNavigationRuleExplicit(EUINavigation.Left, self.CurrentSelectedCell)
end

function M:SetRightTarget()
  if self.CurInputDevice == ECommonInputType.Gamepad then
    self.Com_Tab:UpdateBottomKeyInfo({
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.CloseSelf
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    })
  end
  local ListItemWidget = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.List_Label, 0)
  if ListItemWidget then
    return ListItemWidget
  end
  return nil
end

function M:SetGetBackFocusWidget()
  if IsValid(self.List_Catalogue) then
    local SubTypeWidget = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.List_Catalogue, 0)
    if IsValid(SubTypeWidget) then
      return SubTypeWidget
    end
  end
  return self
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  if not self.ListText then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local AddOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 5
  if "Gamepad_RightY" == InKeyName then
    local CurScrollOffset = self.ListText:GetScrollOffset()
    local ScrollOffset = math.clamp(CurScrollOffset - AddOffset, 0, self.ListText:GetScrollOffsetOfEnd())
    self.ListText:SetScrollOffset(ScrollOffset)
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

AssembleComponents(M)
return M
