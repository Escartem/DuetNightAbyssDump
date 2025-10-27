require("UnLua")
local MonsterUtils = require("Utils.MonsterUtils")
local WBP_Archive_PageItem_C = Class({
  "BluePrints.UI.BP_UIState_C"
})
WBP_Archive_PageItem_C._components = {
  "BluePrints.UI.UI_PC.Common.HorizontalListViewResizeComp"
}

function WBP_Archive_PageItem_C:Construct()
  self.Super.Construct(self)
  self.CurTabId = 1
  self.CurSelectContent = nil
  self.BookSeriesId2ResourceIdTable = {}
  self.List_Item.BP_OnItemSelectionChanged:Add(self, self.OnSelectItemChanged)
  self.Sort:BindEventOnSortTypeChanged(self, self.OnSortTypeChanged)
  self.Button_Read:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Btn_Read:BindEventOnClicked(self, self.OpenBookDetail)
  self.Btn_Read:BindForbidStateExecuteEvent(self, self.ShowBookLockedTip)
  self.Btn_Read:SetDefaultGamePadImg("A")
  self.List_Item.BP_OnEntryInitialized:Clear()
  self.List_Item.BP_OnEntryInitialized:Add(self, self.OnObjectSetFinished)
  self.List_Item.OnCreateEmptyContent:Bind(self, function(self)
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.IsEmpty = true
    Content.Parent = self
    return Content
  end)
  self.Panel_ItemInfo:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.DefaultSortFunction = self.SortListDatasByRarityUp
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
  self:InitWidgetInfoInGamePad()
end

function WBP_Archive_PageItem_C:Destruct()
  self.Super.Destruct(self)
  self.List_Item.BP_OnEntryInitialized:Remove(self, self.OnObjectSetFinished)
  self:HorizontalListViewResize_TearDown()
  self:ClearListenEvent()
  if self.NodeName then
    ReddotManager.RemoveListener(self.NodeName, self)
  end
end

function WBP_Archive_PageItem_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.Name, self.Type = ...
  self.NodeName = nil
  if self.Type == 1004 then
    self.NodeName = DataMgr.ReddotNode.ArchiveNewResource.Name
  elseif self.Type == 1005 then
    self.NodeName = DataMgr.ReddotNode.ArchiveNewReadBook.Name
  elseif self.Type == 1006 then
    self.NodeName = DataMgr.ReddotNode.ArchiveNewMonster.Name
  end
  if self.Name == "Resource" then
    self.Sort:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Sort:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self:InitBtn()
  self:PlayInAnim()
  self:AddTimer(0.01, function()
    self:HorizontalListViewResize_SetUp(self.Panel_ListCut, self.List_Item, 0)
  end, false, 0, nil, true)
  self:InitCommonTab()
  if self.NodeName then
    if not ReddotManager.GetTreeNode(self.NodeName) then
      ReddotManager.AddNode(self.NodeName)
    end
    ReddotManager.AddListener(self.NodeName, self, self.RefreshReddot)
  end
end

function WBP_Archive_PageItem_C:InitBtn()
  if self.Name == "Read" then
    self.Button_Read:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Button_Read:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Archive_PageItem_C:InitCommonTab()
  self.AllTabInfo = {}
  for _, Data in pairs(DataMgr.ArchiveTab) do
    if Data.ArchiveID == self.Type then
      table.insert(self.AllTabInfo, {
        Text = GText(Data.TabName),
        IconPath = Data.Icon,
        TabId = Data.TabId,
        TabType = Data.TabPara,
        ArchiveID = Data.ArchiveID
      })
    end
  end
  self.TabId2TabType = {}
  self.TabType2TabId = {}
  self.NoramalComp = {}
  for _, Info in pairs(self.AllTabInfo) do
    self.TabType2TabId[Info.TabType] = Info.TabId
    self.TabId2TabType[Info.TabId] = Info.TabType
    if Info.ArchiveID == 1006 and Info.TabType ~= "AllMonster" and Info.TabType ~= "OtherMonster" then
      self.NoramalComp[Info.TabType] = 1
    end
  end
  self.Index2TabId = {}
  self.TabId2Index = {}
  for Index, Data in pairs(self.AllTabInfo) do
    self.Index2TabId[Index] = Data.TabId
    self.TabId2Index[Data.TabId] = Index
  end
  table.sort(self.AllTabInfo, function(A, B)
    return A.TabId < B.TabId
  end)
  self.TabConfigData = {
    TitleName = GText(DataMgr.ArchiveInfo[self.Type].ArchiveTitle),
    LeftKey = "Q",
    RightKey = "E",
    Tabs = self.AllTabInfo,
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    StyleName = "Text",
    OwnerPanel = self,
    BackCallback = self.OnClickBack,
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnClickBack,
            Owner = self
          }
        },
        GamePadInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    }
  }
  self.Com_Tab:Init(self.TabConfigData, true)
  if next(self.AllTabInfo) == nil then
    self:TabItemClick()
  else
    self.CurTabId = self.AllTabInfo[1].TabId
    self.Com_Tab:BindEventOnTabSelected(self, self.TabItemClick)
    self.Com_Tab:SelectTabById(self.CurTabId)
  end
end

function WBP_Archive_PageItem_C:TabItemClick(TabWidget)
  self.CurSelectContent = nil
  if not self.SortFunction or self.SortFunction ~= self.DefaultSortFunction then
    self:InitSortFunction()
    self.Sort:Init(self, {
      "UI_Select_Unique"
    }, CommonConst.DESC)
  end
  local TabId
  if TabWidget then
    TabId = TabWidget:GetTabId()
  end
  self.CurTabId = TabId
  self:RefreshList(true)
  if TabWidget then
    self.Collect:Init(self.Name, self.Type, TabWidget.Idx, TabWidget.Info.Text, self.Num_Now, self.Num_Total, self)
  else
    self.Collect:Init(self.Name, self.Type, nil, nil, self.Num_Now, self.Num_Total, self)
  end
end

function WBP_Archive_PageItem_C:RefreshList(bAnimation)
  self.Panel_ItemInfo:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if nil == bAnimation then
    bAnimation = true
  end
  self:GetListData()
  self:MarkDirty()
  self.CurSelectContent = nil
  self.List_Item:ClearListItems()
  self.List_Item:ScrollToTop()
  self.List_Item:SetFocus()
  self.ItemId2Index = {}
  self:OnListFillWith()
  self:AddTimer(0.01, function()
    self.List_Item:RequestFillEmptyContent()
  end, false, 0, nil, true)
end

function WBP_Archive_PageItem_C:MarkDirty()
  local Contents = self.List_Item:GetListItems() or {}
  for _, Content in pairs(Contents) do
    Content.IsDirty = true
  end
end

function WBP_Archive_PageItem_C:GetListData()
  local TabType
  if self.CurTabId then
    TabType = self.TabId2TabType[self.CurTabId]
  end
  if self.Name == "Enemy" then
    self:GetMonsterData(TabType)
  elseif TabType then
    self["Get" .. TabType .. "Data"](self)
  else
    self["Get" .. self.Name .. "Data"](self)
  end
  self:FillReddotInfo()
end

function WBP_Archive_PageItem_C:FillReddotInfo()
  if self.NodeName then
    if not ReddotManager.GetTreeNode(self.NodeName) then
      ReddotManager.AddNode(self.NodeName)
    end
    local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(self.NodeName)
    if self.Type == 1005 then
      for Index, ItemInfo in ipairs(self.ListDatas) do
        if ItemInfo.BookSeriesId then
          local ResourceIdTable = self.BookSeriesId2ResourceIdTable[ItemInfo.BookSeriesId]
          for _, ResourceId in pairs(ResourceIdTable) do
            if 1 == CacheDetail[ResourceId] then
              ItemInfo.IsNew = true
            end
          end
        end
      end
    else
      for Index, ItemInfo in ipairs(self.ListDatas) do
        if ItemInfo.Id and 1 == CacheDetail[ItemInfo.Id] then
          ItemInfo.IsNew = true
        end
      end
    end
  end
end

function WBP_Archive_PageItem_C:GetAllResourceData()
  self.Num_Now = 0
  self.Num_Total = 0
  self.ListDatas = {}
  local ArchiveList = {}
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    ArchiveList = Avatar.Archives[self.Type].ArchiveList
  end
  for ResourceId, Data in pairs(DataMgr.Resource) do
    if 1 == Data.ItemArchiveType or 2 == Data.ItemArchiveType then
      self.Num_Total = self.Num_Total + 1
      if ArchiveList[ResourceId] then
        self.Num_Now = self.Num_Now + 1
        self:FillListDatasWithResourceInfo(Data)
      end
    end
  end
  self.SortFunction(self)
end

function WBP_Archive_PageItem_C:GetNormalResourceData()
  self.Num_Now = 0
  self.Num_Total = 0
  self.ListDatas = {}
  local ArchiveList = {}
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    ArchiveList = Avatar.Archives[self.Type].ArchiveList
  end
  for ResourceId, Data in pairs(DataMgr.Resource) do
    if Data.ItemArchiveType and 1 == Data.ItemArchiveType then
      self.Num_Total = self.Num_Total + 1
      if ArchiveList[ResourceId] then
        self.Num_Now = self.Num_Now + 1
        self:FillListDatasWithResourceInfo(Data)
      end
    end
  end
  self.SortFunction(self)
end

function WBP_Archive_PageItem_C:GetTaskResourceData()
  self.Num_Now = 0
  self.Num_Total = 0
  self.ListDatas = {}
  local ArchiveList = {}
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    ArchiveList = Avatar.Archives[self.Type].ArchiveList
  end
  for ResourceId, Data in pairs(DataMgr.Resource) do
    if Data.ItemArchiveType and 2 == Data.ItemArchiveType then
      self.Num_Total = self.Num_Total + 1
      if ArchiveList[ResourceId] then
        self.Num_Now = self.Num_Now + 1
        self:FillListDatasWithResourceInfo(Data)
      end
    end
  end
  self.SortFunction(self)
end

function WBP_Archive_PageItem_C:GetReadData()
  self.Num_Now = nil
  self.Num_Total = nil
  for _, Info in pairs(DataMgr.Resource) do
    if Info.BookSeriesId then
      if not self.BookSeriesId2ResourceIdTable[Info.BookSeriesId] then
        self.BookSeriesId2ResourceIdTable[Info.BookSeriesId] = {}
      end
      table.insert(self.BookSeriesId2ResourceIdTable[Info.BookSeriesId], Info.ResourceId)
    end
  end
  for BookSeriesId, ResourceIdTable in pairs(self.BookSeriesId2ResourceIdTable) do
    table.sort(ResourceIdTable, function(A, B)
      return A < B
    end)
  end
  self.ListDatas = {}
  for _, Data in pairs(DataMgr.BookSeriesArchive) do
    self:FillListDatasWithBookSeriesInfo(Data)
  end
  self:SortListDatasByBookSeriesId()
end

function WBP_Archive_PageItem_C:GetMonsterData(TabType)
  self.Num_Now = 0
  self.Num_Total = 0
  self.ListDatas = {}
  local ArchiveList = {}
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    ArchiveList = Avatar.Archives[self.Type].ArchiveList
  end
  for GalleryRuleId, GalleryData in pairs(DataMgr.GalleryRule) do
    if not GalleryData.DisableArchive and self:CheckMonsterInCamp(GalleryData.PreferredMonsterId, TabType) and MonsterUtils.CheckGallerRuleByMonsterRelease(GalleryData) then
      self.Num_Total = self.Num_Total + 1
      if ArchiveList[GalleryRuleId] then
        self.Num_Now = self.Num_Now + 1
        local MonsterData = DataMgr.Monster[GalleryData.PreferredMonsterId]
        local FunctionDes = DataMgr.ArchiveTab[self.CurTabId].TabName
        if "AllMonster" == TabType then
          local Camp = self:GetMonsterCamp(GalleryData.PreferredMonsterId)
          for TabId, TabType in pairs(self.TabId2TabType) do
            if TabType == Camp then
              FunctionDes = DataMgr.ArchiveTab[TabId].TabName
            end
          end
        end
        self:FillListDatasWithMonsterInfo(GalleryData, MonsterData, FunctionDes)
      end
    end
  end
  self:SortListDatasByGalleryRuleId()
end

function WBP_Archive_PageItem_C:CheckMonsterInCamp(MonsterId, CampOption)
  local MonsterData = DataMgr.Monster[MonsterId]
  if not MonsterData then
    return false
  end
  if "AllMonster" == CampOption then
    return true
  end
  local Flag = true
  local MonsterGamePlayTags = MonsterData.GamePlayTags or {}
  for _, Tag in ipairs(MonsterGamePlayTags) do
    if "OtherMonster" == CampOption then
      if self.NoramalComp[Tag] then
        Flag = false
        break
      end
    elseif Tag == CampOption then
      return true
    end
  end
  if "OtherMonster" == CampOption then
    return Flag
  else
    return false
  end
end

function WBP_Archive_PageItem_C:GetMonsterCamp(MonsterId)
  local MonsterData = DataMgr.Monster[MonsterId]
  if not MonsterData then
    return nil
  end
  local MonsterGamePlayTags = MonsterData.GamePlayTags or {}
  for _, Tag in ipairs(MonsterGamePlayTags) do
    if self.NoramalComp[Tag] then
      return Tag
    end
  end
  return "OtherMonster"
end

function WBP_Archive_PageItem_C:FillListDatasWithResourceInfo(Data)
  table.insert(self.ListDatas, {
    Type = "Resource",
    Id = Data.ResourceId,
    Rarity = Data.Rarity,
    Icon = Data.Icon,
    FunctionDes = Data.FunctionDes,
    Name = Data.ResourceName,
    IpDes = Data.IpDes,
    DetailDes = Data.DetailDes,
    SoundItemType = "Resource"
  })
end

function WBP_Archive_PageItem_C:FillListDatasWithBookSeriesInfo(Data)
  local ResourceInfo = self:FindResourceInfoByBookSeriesId(Data.BookSeriesId)
  if not ResourceInfo then
    return
  end
  local IsUnlock = self:IsBookSeriesUnlock(Data.BookSeriesId)
  local CurNum, SumNum = self:GetBookSeriesCurNumAndSumNum(Data.BookSeriesId)
  local Name = Data.BookSeriesName
  local IsLock = false
  if not IsUnlock then
    IsLock = true
    Name = "UI_BookArchive_SeriesLockedTitle"
  end
  table.insert(self.ListDatas, {
    Type = "Resource",
    Id = ResourceInfo.ResourceId,
    Icon = ResourceInfo.Icon,
    FunctionDes = ResourceInfo.FunctionDes,
    Name = Name,
    IpDes = Data.DetailDes,
    BookSeriesId = Data.BookSeriesId,
    IsBookSeriesUnlock = IsUnlock,
    IsLock = IsLock,
    CurNum = CurNum,
    SumNum = SumNum,
    SoundItemType = "Resource"
  })
end

function WBP_Archive_PageItem_C:FindResourceInfoByBookSeriesId(BookSeriesId)
  if self.BookSeriesId2ResourceIdTable[BookSeriesId] then
    return DataMgr.Resource[self.BookSeriesId2ResourceIdTable[BookSeriesId][1]]
  end
end

function WBP_Archive_PageItem_C:FillListDatasWithMonsterInfo(GalleryData, MonsterData, FunctionDes)
  table.insert(self.ListDatas, {
    Type = "Monster",
    Id = MonsterData.UnitId,
    Name = MonsterData.UnitName,
    Icon = MonsterData.Icon,
    IpDes = GalleryData.DescriptionDetail,
    GalleryRuleId = GalleryData.GalleryRuleId,
    FunctionDes = FunctionDes,
    SoundItemType = "Monster"
  })
end

function WBP_Archive_PageItem_C:SortListDatasByRarityUp()
  table.sort(self.ListDatas, function(A, B)
    if A.Rarity == B.Rarity then
      return A.Id < B.Id
    end
    return A.Rarity > B.Rarity
  end)
end

function WBP_Archive_PageItem_C:SortListDatasByRarityDown()
  table.sort(self.ListDatas, function(A, B)
    if A.Rarity == B.Rarity then
      return A.Id < B.Id
    end
    return A.Rarity < B.Rarity
  end)
end

function WBP_Archive_PageItem_C:SortListDatasById()
  table.sort(self.ListDatas, function(A, B)
    return A.Id < B.Id
  end)
end

function WBP_Archive_PageItem_C:SortListDatasByBookSeriesId()
  table.sort(self.ListDatas, function(A, B)
    return A.BookSeriesId < B.BookSeriesId
  end)
end

function WBP_Archive_PageItem_C:SortListDatasByGalleryRuleId()
  table.sort(self.ListDatas, function(A, B)
    return A.GalleryRuleId < B.GalleryRuleId
  end)
end

function WBP_Archive_PageItem_C:SetupListContent(ItemIndex, ItemInfo, Content, Type)
  Content.Id = ItemInfo.Id
  Content.Rarity = ItemInfo.Rarity
  Content.IconPath = ItemInfo.Icon
  Content.FunctionDes = ItemInfo.FunctionDes
  Content.Name = ItemInfo.Name
  Content.IpDes = ItemInfo.IpDes
  Content.DetailDes = ItemInfo.DetailDes
  Content.Type = ItemInfo.Type
  Content.BookSeriesId = ItemInfo.BookSeriesId
  Content.IsBookSeriesUnlock = ItemInfo.IsBookSeriesUnlock
  Content.IsLock = ItemInfo.IsLock
  Content.CurNum = ItemInfo.CurNum
  Content.SumNum = ItemInfo.SumNum
  Content.GalleryRuleId = ItemInfo.GalleryRuleId
  Content.IsEmpty = false
  Content.IsSelect = false
  Content.IsDirty = false
  Content.ItemIndex = ItemIndex
  Content.IsNew = ItemInfo.IsNew
  Content.SoundItemType = ItemInfo.SoundItemType
  Content.OnMouseButtonUpEvent = {
    Obj = self,
    Callback = self.ClickListItem,
    Params = {Content}
  }
  Content.Parent = self
end

function WBP_Archive_PageItem_C:OnListFillWith()
  if next(self.ListDatas) == nil then
    self.WS_Empty:SetActiveWidgetIndex(1)
    self.Panel_ItemInfo:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Empty:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if self.Name == "Resource" then
      self.Text_Name:SetText(GText("UI_BookArchive_Empty"))
      self.Text_Empty:SetText(GText("UI_BookArchive_Empty"))
    elseif self.Name == "Enemy" then
      self.Text_Name:SetText(GText("UI_EnemyArchive_Empty"))
      self.Text_Empty:SetText(GText("UI_EnemyArchive_Empty"))
    end
    self.Panel_NotEmpty:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Panel_Info:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self:SetFocus()
  else
    self.WS_Empty:SetActiveWidgetIndex(0)
    for Index, ItemInfo in ipairs(self.ListDatas) do
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      self:SetupListContent(Index, ItemInfo, Content)
      self.ItemId2Index[ItemInfo.Id] = Index
      self.List_Item:AddItem(Content)
    end
  end
end

function WBP_Archive_PageItem_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == UIConst.GamePadKey.LeftThumb then
      IsEventHandled = true
      self.Sort:SetFocus()
    elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
      IsEventHandled = true
      self:TryOpenCollect()
    elseif InKeyName == UIConst.GamePadKey.FaceButtonBottom then
    elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
      IsEventHandled = true
      self:OnReturnKeyDown()
    elseif InKeyName == UIConst.GamePadKey.LeftShoulder then
      IsEventHandled = self.Com_Tab:Handle_KeyEventOnGamePad(InKeyName)
    elseif InKeyName == UIConst.GamePadKey.RightShoulder then
      IsEventHandled = self.Com_Tab:Handle_KeyEventOnGamePad(InKeyName)
    end
  elseif "Escape" == InKeyName then
    IsEventHandled = true
    self:OnReturnKeyDown()
  elseif "Q" == InKeyName then
    IsEventHandled = true
    self.Com_Tab:TabToLeft()
  elseif "E" == InKeyName then
    IsEventHandled = true
    self.Com_Tab:TabToRight()
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_Archive_PageItem_C:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_RightY" == InKeyName then
    local a = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 5
    local CurScrollOffset = self.EMScrollBox_359:GetScrollOffset()
    local ScrollOffset = math.clamp(CurScrollOffset - a, 0, self.EMScrollBox_359:GetScrollOffsetOfEnd())
    self.EMScrollBox_359:SetScrollOffset(ScrollOffset)
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function WBP_Archive_PageItem_C:TryOpenCollect()
  if 1 == self.WS_Empty:GetActiveWidgetIndex() then
    return
  end
  self.Collect:OnCellClicked()
end

function WBP_Archive_PageItem_C:OnReturnKeyDown()
  UIUtils.PlayCommonBtnSe(self)
  self:OnClickBack()
end

function WBP_Archive_PageItem_C:OnClickBack()
  if self:CheckIsCanCloseSelf() then
    self:PlayOutAnim()
  end
end

function WBP_Archive_PageItem_C:CheckIsCanCloseSelf()
  if self:IsAnimationPlaying(self.In) then
    return false
  end
  return true
end

function WBP_Archive_PageItem_C:PlayInAnim()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "ArchivePageItemOpenSound", nil)
  self:PlayAnimationForward(self.In)
end

function WBP_Archive_PageItem_C:PlayOutAnim()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  AudioManager(self):SetEventSoundParam(self, "ArchivePageItemOpenSound", {ToEnd = 1})
  self:BlockAllUIInput(true)
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self:PlayAnimationForward(self.Out)
end

function WBP_Archive_PageItem_C:Close()
  self.Super.Close(self)
end

function WBP_Archive_PageItem_C:OnSelectItemChanged(SelectItem)
  if not SelectItem then
    return
  end
  if SelectItem.IsDirty then
    return
  end
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self:ClickListItemWhenSelectItemChanged(SelectItem)
  end
end

function WBP_Archive_PageItem_C:ClickListItem(Content)
  if Content and not Content.IsEmpty then
    self.Panel_ItemInfo:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Empty:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Panel_NotEmpty:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Info:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if IsValid(self.CurSelectContent) then
      if Content.ItemIndex == self.CurSelectContent.ItemIndex then
        self:ReadByGamepadKey()
        return
      end
      if self.CurSelectContent.Entry then
        self.CurSelectContent.Entry:SetSelected(false)
        self.CurSelectContent.Entry:SetDoNotPlaySoundGamePad(false)
      else
        self.CurSelectContent.IsSelect = false
        self.CurSelectContent.DoNotPlaySoundGamePad = false
      end
    end
    self.CurSelectContent = Content
    self.CurSelectContent.Entry:SetSelected(true)
    self.CurSelectContent.Entry:SetDoNotPlaySoundGamePad(true)
    self.List_Item:BP_NavigateToItem(self.CurSelectContent)
    self:RefreshDetail()
    self:RefreshBtn()
    self:SetArchiveReddotRead(Content)
  end
end

function WBP_Archive_PageItem_C:ClickListItemWhenSelectItemChanged(Content)
  if Content and Content.Entry and (not self.CurSelectContent or self.CurSelectContent.ItemIndex ~= Content.ItemIndex) then
    Content.Entry:OnMouseButtonDown()
    Content.Entry:OnMouseButtonUp()
  end
end

function WBP_Archive_PageItem_C:RefreshDetail()
  local Icon = LoadObject(self.CurSelectContent.IconPath)
  self.Icon_Item:SetBrushFromTexture(Icon)
  if self.CurSelectContent.Rarity and self["Img_Quality_" .. self.CurSelectContent.Rarity] then
    self.Quality_Item:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Quality_Item:SetBrushFromTexture(self["Img_Quality_" .. self.CurSelectContent.Rarity])
  else
    self.Quality_Item:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Quality_Item:SetBrushFromTexture(self.Img_Quality_1)
  end
  self.Text_Type:SetText(GText(self.CurSelectContent.FunctionDes))
  self.Text_Name:SetText(GText(self.CurSelectContent.Name))
  self.Text_Describe01:SetText(GText(self.CurSelectContent.IpDes))
  if self.CurSelectContent.DetailDes then
    self.Text_Describe02:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Text_Describe02:SetText(GText(self.CurSelectContent.DetailDes))
  else
    self.Text_Describe02:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if self.Name == "Read" then
    self.Switch_Type:SetActiveWidgetIndex(1)
    self.Text_Has:SetText(self.CurSelectContent.CurNum)
    self.Text_All:SetText(self.CurSelectContent.SumNum)
    if not self.CurSelectContent.IsBookSeriesUnlock then
      self.Text_Name:SetText(GText("UI_BookArchive_SeriesLockedTitle"))
      self.Text_Describe01:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      self.Text_Name:SetText(GText(self.CurSelectContent.Name))
      self.Text_Describe01:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  else
    self.Switch_Type:SetActiveWidgetIndex(0)
  end
  self:AddDelayFrameFunc(function()
    if UIUtils.CheckScrollBoxCanScroll(self.EMScrollBox_359) then
      local BottomKeyInfo = {
        {
          GamePadInfoList = {
            {Type = "Img", ImgShortPath = "RV"}
          },
          Desc = GText("UI_CTL_Rougelike_SlideItems"),
          bLongPress = false
        },
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "Esc",
              ClickCallback = self.OnClickBack,
              Owner = self
            }
          },
          GamePadInfoList = {
            {Type = "Img", ImgShortPath = "B"}
          },
          Desc = GText("UI_BACK"),
          bLongPress = false
        }
      }
      self:UpdatePageTab(BottomKeyInfo)
    else
      local BottomKeyInfo = {
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "Esc",
              ClickCallback = self.OnClickBack,
              Owner = self
            }
          },
          GamePadInfoList = {
            {Type = "Img", ImgShortPath = "B"}
          },
          Desc = GText("UI_BACK"),
          bLongPress = false
        }
      }
      self:UpdatePageTab(BottomKeyInfo)
    end
    self.EMScrollBox_359:SetScrollOffset(0)
  end, 2)
end

function WBP_Archive_PageItem_C:RefreshBtn()
  if self.Name == "Read" then
    if self.CurSelectContent.IsBookSeriesUnlock then
      self.ReadBtnForbid = false
      self.Btn_Read:SetText(GText("UI_BookArchive_Read"))
      self.WS_Type:SetActiveWidgetIndex(0)
    else
      self.ReadBtnForbid = true
      self.WS_Type:SetActiveWidgetIndex(1)
      self.Hint.WidgetSwitcher_State:SetActiveWidgetIndex(0)
      self.Hint.Text_Hint_Normal:SetText(GText("UI_BookArchive_SeriesLockedEntrance"))
    end
  end
end

function WBP_Archive_PageItem_C:IsBookSeriesUnlock(BookSeriesId)
  local ArchiveList = {}
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    ArchiveList = Avatar.Archives[self.Type].ArchiveList
  end
  for Index, Id in pairs(self.BookSeriesId2ResourceIdTable[BookSeriesId]) do
    if ArchiveList[Id] then
      return true
    end
  end
  return false
end

function WBP_Archive_PageItem_C:GetBookSeriesCurNumAndSumNum(BookSeriesId)
  local CurNum = 0
  local SumNum = 0
  local ArchiveList = {}
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    ArchiveList = Avatar.Archives[self.Type].ArchiveList
  end
  for Index, Id in pairs(self.BookSeriesId2ResourceIdTable[BookSeriesId]) do
    SumNum = SumNum + 1
    if ArchiveList[Id] then
      CurNum = CurNum + 1
    end
  end
  return CurNum, SumNum
end

function WBP_Archive_PageItem_C:InitSortFunction()
  self.SortFunction = self.DefaultSortFunction
end

function WBP_Archive_PageItem_C:OnSortTypeChanged()
  if self.SortFunction == self.SortListDatasByRarityUp then
    self.SortFunction = self.SortListDatasByRarityDown
  else
    self.SortFunction = self.SortListDatasByRarityUp
  end
  self:RefreshList(true)
  self:HorizontalListViewResize_SetUp(self.Panel_ItemList, self.List_Item, 0)
end

function WBP_Archive_PageItem_C:OpenBookDetail()
  UIManager(self):LoadUINew("ArchiveBookDetail", self.Type, self.CurSelectContent.Id, self.BookSeriesId2ResourceIdTable[self.CurSelectContent.BookSeriesId])
end

function WBP_Archive_PageItem_C:ShowBookLockedTip()
end

function WBP_Archive_PageItem_C:OnObjectSetFinished(Content, Widget)
  if 1 == Content.ItemIndex and not self.CurSelectContent and Content.Entry then
    Content.Entry:SetDoNotPlaySound(true)
    Content.Entry:OnMouseButtonDown()
    Content.Entry:OnMouseButtonUp()
    Content.Entry:SetDoNotPlaySound(false)
  end
end

function WBP_Archive_PageItem_C:SetFocus_Lua()
  self.List_Item:SetFocus()
end

function WBP_Archive_PageItem_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Archive_PageItem_C:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Archive_PageItem_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_Archive_PageItem_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function WBP_Archive_PageItem_C:InitGamepadView()
  if UIUtils.HasAnyFocus(self) then
    self.List_Item:SetFocus()
  end
end

function WBP_Archive_PageItem_C:InitKeyboardView()
end

function WBP_Archive_PageItem_C:InitWidgetInfoInGamePad()
  self.Collect:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    }
  })
end

function WBP_Archive_PageItem_C:ReadByGamepadKey()
  local CurInputDevice = self.GameInputModeSubsystem:GetCurrentInputType()
  local IsGamepad = CurInputDevice == ECommonInputType.Gamepad
  if IsGamepad and self.Name == "Read" then
    if self.ReadBtnForbid then
      self:ShowBookLockedTip()
    else
      self:OpenBookDetail()
    end
  end
end

function WBP_Archive_PageItem_C:RefreshReddot()
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(self.NodeName)
  self.Index2ReddotNum = {}
  if CacheDetail then
    for Id, State in pairs(CacheDetail) do
      if 1 == State then
        if self.NodeName == DataMgr.ReddotNode.ArchiveNewResource.Name then
          for Index, TabId in pairs(self.Index2TabId) do
            if self:CheckResourceIsBelong(Id, TabId) then
              if not self.Index2ReddotNum[Index] then
                self.Index2ReddotNum[Index] = 1
              else
                self.Index2ReddotNum[Index] = self.Index2ReddotNum[Index] + 1
              end
            end
          end
        elseif self.NodeName == DataMgr.ReddotNode.ArchiveNewMonster.Name then
          local Camp = self:GetMonsterCamp(Id)
          local TabId = self.TabType2TabId[Camp]
          local Index = self.TabId2Index[TabId]
          if not self.Index2ReddotNum[Index] then
            self.Index2ReddotNum[Index] = 1
          else
            self.Index2ReddotNum[Index] = self.Index2ReddotNum[Index] + 1
          end
          local AllMonsterTabId = self.TabType2TabId.AllMonster
          local AllMonsterIndex = self.TabId2Index[AllMonsterTabId]
          if not self.Index2ReddotNum[AllMonsterIndex] then
            self.Index2ReddotNum[AllMonsterIndex] = 1
          else
            self.Index2ReddotNum[AllMonsterIndex] = self.Index2ReddotNum[AllMonsterIndex] + 1
          end
        end
      end
    end
    self:RefreshTabReddot()
  end
  local Contents = self.List_Item:GetListItems()
  if self.Type == 1005 then
    for _, Content in pairs(Contents) do
      if not Content.IsEmpty then
        Content.IsNew = false
        if Content.BookSeriesId then
          local ResourceIdTable = self.BookSeriesId2ResourceIdTable[Content.BookSeriesId]
          for _, ResourceId in pairs(ResourceIdTable) do
            if 1 == CacheDetail[ResourceId] then
              Content.IsNew = true
            end
          end
        end
      end
    end
  else
    for _, Content in pairs(Contents) do
      if not Content.IsEmpty then
        Content.IsNew = false
        if Content.Id and 1 == CacheDetail[Content.Id] then
          Content.IsNew = true
        end
      end
    end
  end
  local AllDisplayWidget = self.List_Item:GetDisplayedEntryWidgets()
  for _, Widget in pairs(AllDisplayWidget) do
    if self.CurSelectContent and self.CurSelectContent.Id == Widget.Content.Id then
      Widget:SetNew(Widget.Content.IsNew)
    end
  end
end

function WBP_Archive_PageItem_C:SetArchiveReddotRead(Content)
  if self.NodeName and not Content.BookSeriesId then
    if not ReddotManager.GetTreeNode(self.NodeName) then
      ReddotManager.AddNode(self.NodeName)
    end
    local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(self.NodeName)
    if 1 == CacheDetail[Content.Id] then
      CacheDetail[Content.Id] = 0
      ReddotManager.DecreaseLeafNodeCount(self.NodeName)
    end
  end
end

function WBP_Archive_PageItem_C:UpdatePageTab(BottomKeyInfo)
  if CommonUtils.GetDeviceTypeByPlatformName() ~= "Mobile" then
    self.Com_Tab:UpdateBottomKeyInfo(BottomKeyInfo)
  end
end

function WBP_Archive_PageItem_C:CheckResourceIsBelong(ResourceId, TabId)
  local TabType = self.TabId2TabType[TabId]
  if TabType and self["CheckResourceIsBelong" .. TabType] then
    return self["CheckResourceIsBelong" .. TabType](self, ResourceId)
  end
  return false
end

function WBP_Archive_PageItem_C:CheckResourceIsBelongAllResource(ResourceId)
  return true
end

function WBP_Archive_PageItem_C:CheckResourceIsBelongNormalResource(ResourceId)
  local ResourceData = DataMgr.Resource[ResourceId]
  if ResourceData and 1 == ResourceData.ItemArchiveType then
    return true
  else
    return false
  end
end

function WBP_Archive_PageItem_C:CheckResourceIsBelongTaskResource(ResourceId)
  local ResourceData = DataMgr.Resource[ResourceId]
  if ResourceData and 2 == ResourceData.ItemArchiveType then
    return true
  else
    return false
  end
end

function WBP_Archive_PageItem_C:RefreshTabReddot()
  if self.AllTabInfo then
    for Index, _ in pairs(self.AllTabInfo) do
      if self.Index2ReddotNum and self.Index2ReddotNum[Index] then
        self.Com_Tab:ShowTabRedDot(Index, true)
      else
        self.Com_Tab:ShowTabRedDot(Index, false)
      end
    end
  end
end

function WBP_Archive_PageItem_C:BP_GetDesiredFocusTarget()
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    if self.CurSelectContent then
      self.List_Item:BP_NavigateToItem(self.CurSelectContent)
    else
      self.List_Item:SetFocus()
    end
  end
  return nil
end

AssembleComponents(WBP_Archive_PageItem_C)
return WBP_Archive_PageItem_C
