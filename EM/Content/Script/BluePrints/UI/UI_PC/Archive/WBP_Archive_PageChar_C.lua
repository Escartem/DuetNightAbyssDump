require("UnLua")
local WBP_Archive_PageChar_C = Class({
  "BluePrints.UI.BP_UIState_C"
})
WBP_Archive_PageChar_C._components = {
  "BluePrints.UI.UI_PC.Common.HorizontalListViewResizeComp"
}

function WBP_Archive_PageChar_C:Construct()
  self.Super.Construct(self)
  self.FirstFocus = false
  self.FilterTags = {}
  self.FilterNames = {}
  self.FilterIcons = {}
  self.List_Item:SetControlScrollbarInside(true)
  self.List_Item.BP_OnEntryInitialized:Clear()
  self.List_Item.OnCreateEmptyContent:Bind(self, function(self)
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Icon = nil
    Content.Parent = self
    return Content
  end)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
  self:InitWidgetInfoInGamePad()
end

function WBP_Archive_PageChar_C:Destruct()
  self.Super.Destruct(self)
  self.List_Item.BP_OnEntryInitialized:Remove(self, self.OnObjectSetFinished)
  self:HorizontalListViewResize_TearDown()
  self:ClearListenEvent()
  if self.NodeName then
    ReddotManager.RemoveListener(self.NodeName, self)
  end
end

function WBP_Archive_PageChar_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.Name, self.Type = ...
  self:InitFilter()
  self:InitCommonTab()
  self:PlayInAnim()
  if self.Name == "Character" then
    self.NodeName = "ArchiveNewChar"
  elseif self.Name == "Melee" then
    self.NodeName = "ArchiveNewMelee"
  elseif self.Name == "Ranged" then
    self.NodeName = "ArchiveNewRanged"
  end
  if self.NodeName then
    if not ReddotManager.GetTreeNode(self.NodeName) then
      ReddotManager.AddNode(self.NodeName)
    end
    ReddotManager.AddListener(self.NodeName, self, self.RefreshReddot)
  end
end

function WBP_Archive_PageChar_C:InitFilter()
  self.List_Item:SetFocus()
  self.List_Item.BP_OnEntryInitialized:Clear()
  self.List_Item.BP_OnEntryInitialized:Add(self, self.OnObjectSetFinished)
  local FilterTags, FilterNames
  if self.Name == "Character" then
    FilterTags, FilterNames = UIUtils.GetAllElementTypes()
  else
    local MeleeFilterTags, MeleeFilterNames, RangedFilterTags, RangedFilterNames = UIUtils.GetAllWeaponTags()
    if self.Name == "Melee" then
      FilterTags, FilterNames = MeleeFilterTags, MeleeFilterNames
    elseif self.Name == "Ranged" then
      FilterTags, FilterNames = RangedFilterTags, RangedFilterNames
    end
  end
  self.FilterTags = CommonUtils.DeepCopy(FilterTags)
  self.FilterNames = CommonUtils.DeepCopy(FilterNames)
  for key, Tag in pairs(self.FilterTags) do
    if self.Name == "Character" then
      local IconName = "Tab_" .. Tag
      table.insert(self.FilterIcons, "/Game/UI/Texture/Dynamic/Atlas/Tab/T_" .. IconName .. ".T_" .. IconName)
    elseif self.Name == "Melee" or self.Name == "Ranged" then
      local Data = DataMgr.WeaponTag[Tag]
      table.insert(self.FilterIcons, Data and Data.Icon)
    end
  end
  table.insert(self.FilterTags, 1, "All")
  table.insert(self.FilterNames, 1, "UI_ALL")
  table.insert(self.FilterIcons, 1, "/Game/UI/Texture/Static/Atlas/Armory/T_Armory_Select.T_Armory_Select")
end

function WBP_Archive_PageChar_C:InitCommonTab()
  self.AllTabInfo = {}
  for i, Tag in ipairs(self.FilterTags) do
    table.insert(self.AllTabInfo, {
      Text = GText(self.FilterNames[i]),
      IconPath = self.FilterIcons[i],
      TabId = Tag,
      SortId = -i
    })
  end
  self.Index2TabId = {}
  self.TabId2Index = {}
  for Index, Data in pairs(self.AllTabInfo) do
    self.Index2TabId[Index] = Data.TabId
    self.TabId2Index[Data.TabId] = Index
  end
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
        GamePadInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_Tips_Ensure"),
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
  }
  self.Com_Tab:Init(self.TabConfigData, true)
  self.Com_Tab:BindEventOnTabSelected(self, self.TabItemClick)
  self.Com_Tab:SelectTabById(self.FilterTags[1])
end

function WBP_Archive_PageChar_C:TabItemClick(TabWidget)
  self.SelectFirstTime = false
  self.List_Item:SetFocus()
  local TabId = TabWidget:GetTabId()
  self.CurTabId = TabId
  self:RefreshList(true)
  self:HorizontalListViewResize_SetUp(self.Panel_ListCut, self.List_Item, 0)
  self.Collect:Init(self.Name, self.Type, TabWidget.Idx, TabWidget.Info.Text, self.Num_Now, self.Num_Total, self)
end

function WBP_Archive_PageChar_C:RefreshList(bAnimation)
  if nil == bAnimation then
    bAnimation = true
  end
  if bAnimation then
    self:_StopListFramingInAnim()
  else
    self.List_Item:SetRenderOpacity(1)
  end
  self:OnRefreshListBegin()
  self:GetListData()
  self.FirstFocus = false
  self.List_Item:ClearListItems()
  self.ItemId2Index = {}
  self:OnListFillWith()
  self:AddTimer(0.01, function()
    self:OnRefreshListLater(bAnimation)
    self:OnRefreshListEnd()
    if bAnimation then
      self.List_Item:ScrollToTop()
    end
  end, false, 0, "OnRefreshListLater", true)
end

function WBP_Archive_PageChar_C:_StopListFramingInAnim()
  local Params = {UIState = self}
  if self._ListAnimTimerKeys then
    Params.TimerKeys = self._ListAnimTimerKeys
  end
  UIUtils.StopListViewFramingInAnimation(self.List_Item, Params)
end

function WBP_Archive_PageChar_C:GetListData()
  self["Get" .. self.Name .. "Data"](self, self.CurTabId)
end

function WBP_Archive_PageChar_C:GetCharacterData(TabId)
  local Avatar = GWorld:GetAvatar()
  local Sex = Avatar.Sex or 0
  local PlayerCharacterIds = {}
  if not self.AllCharacterIds then
    self.AllCharacterIds = {}
    for Id, Data in pairs(DataMgr.Char) do
      if not Data.IsNotOpen then
        table.insert(self.AllCharacterIds, Data.CharId)
        if Data.GenderTag and Data.GenderTag == Sex then
          PlayerCharacterIds[Data.CharId] = 0
        end
      end
    end
  end
  self.ListDatas = {}
  local ArchiveList = {}
  local CharsInfo = {}
  if Avatar then
    ArchiveList = Avatar.Archives[self.Type].ArchiveList or {}
    CharsInfo = Avatar.Chars or {}
  end
  local CharId2CharInfo = {}
  local Flag = false
  for Uuid, CharInfo in pairs(CharsInfo) do
    CharId2CharInfo[CharInfo.CharId] = CharInfo
    if PlayerCharacterIds[CharInfo.CharId] then
      Flag = true
      PlayerCharacterIds[CharInfo.CharId] = 1
    end
  end
  if not Flag then
    PlayerCharacterIds[Const.DefaultAttributeMaster[Sex]] = 1
  end
  for Index, Id in pairs(self.AllCharacterIds) do
    local Data = DataMgr.Char[Id]
    local Attribute = DataMgr.BattleChar[Data.CharId].Attribute
    if ("All" == TabId or Attribute == TabId) and (not Data.GenderTag or 1 == PlayerCharacterIds[Id]) then
      local Unlock = false
      if ArchiveList[Id] then
        Unlock = true
      end
      local Info = {}
      if CharId2CharInfo[Id] then
        Info = CharId2CharInfo[Id]
      end
      self:FillListDatasWithCharacterInfo(Data, Info, Unlock)
    end
  end
  self:SortListDatas()
end

function WBP_Archive_PageChar_C:GetMeleeData(TabId)
  if not self.AllMeleeIds then
    self.AllMeleeIds = {}
    for _, Info in pairs(DataMgr.Weapon) do
      if not Info.IsNotOpen and self:DoesWeaponHaveTag(Info.WeaponId, "Melee") then
        table.insert(self.AllMeleeIds, Info.WeaponId)
      end
    end
  end
  self.ListDatas = {}
  local ArchiveList = {}
  local ArchiveInfo = {}
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    ArchiveList = Avatar.Archives[self.Type].ArchiveList or {}
    ArchiveInfo = Avatar.Archives[self.Type].ArchiveInfo or {}
  end
  for Index, Id in pairs(self.AllMeleeIds) do
    if "All" == TabId or self:DoesWeaponHaveTag(Id, TabId) then
      local Tag = TabId
      if "All" == TabId then
        Tag = self:GetWeaponTag(Id)
      end
      local Data = DataMgr.Weapon[Id]
      local Unlock = false
      if ArchiveList[Id] then
        Unlock = true
      end
      local Info = ArchiveInfo[Id] or {}
      self:FillListDatasWithWeaponInfo(Data, Info, Unlock, Tag)
    end
  end
  self:SortListDatas()
end

function WBP_Archive_PageChar_C:GetRangedData(TabId)
  if not self.AllRangedIds then
    self.AllRangedIds = {}
    for _, Info in pairs(DataMgr.Weapon) do
      if not Info.IsNotOpen and self:DoesWeaponHaveTag(Info.WeaponId, "Ranged") then
        table.insert(self.AllRangedIds, Info.WeaponId)
      end
    end
  end
  self.ListDatas = {}
  local ArchiveList = {}
  local ArchiveInfo = {}
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    ArchiveList = Avatar.Archives[self.Type].ArchiveList or {}
    ArchiveInfo = Avatar.Archives[self.Type].ArchiveInfo or {}
  end
  for Index, Id in pairs(self.AllRangedIds) do
    if "All" == TabId or self:DoesWeaponHaveTag(Id, TabId) then
      local Tag = TabId
      if "All" == TabId then
        Tag = self:GetWeaponTag(Id)
      end
      local Data = DataMgr.Weapon[Id]
      local Unlock = false
      if ArchiveList[Id] then
        Unlock = true
      end
      local Info = ArchiveInfo[Id] or {}
      self:FillListDatasWithWeaponInfo(Data, Info, Unlock, Tag)
    end
  end
  self:SortListDatas()
end

function WBP_Archive_PageChar_C:DoesWeaponHaveTag(WeaponId, TargetTag)
  local WeaponTags = DataMgr.BattleWeapon[WeaponId].WeaponTag
  if WeaponTags then
    for _, Tag in pairs(WeaponTags) do
      if Tag == TargetTag then
        return true
      end
    end
  end
  return false
end

function WBP_Archive_PageChar_C:GetWeaponTag(WeaponId)
  local WeaponTags = DataMgr.BattleWeapon[WeaponId].WeaponTag
  if WeaponTags then
    for _, Tag in pairs(WeaponTags) do
      for _, FilterTag in ipairs(self.FilterTags) do
        if Tag == FilterTag then
          return Tag
        end
      end
    end
  end
  return nil
end

function WBP_Archive_PageChar_C:SetupListContent(ItemIndex, ItemInfo, Content)
  Content.Index = ItemIndex
  Content.Id = ItemInfo.Id
  Content.Type = ItemInfo.Type
  Content.Name = ItemInfo.Name
  Content.Rarity = ItemInfo.Rarity
  Content.ItemIcon = ItemInfo.Icon
  Content.TypeIcon = ItemInfo.TagIcon
  Content.IsLock = not ItemInfo.Unlock
  Content.IsNew = self:CheckIsNew(self.NodeName, ItemInfo.Id)
  Content.EnhanceLevel = ItemInfo.EnhanceLevel or 0
  Content.GradeLevel = ItemInfo.GradeLevel or 0
  Content.OnMouseButtonUpEvent = {
    Callback = self.ClickListItem,
    Obj = self,
    Params = {Content}
  }
end

function WBP_Archive_PageChar_C:OnListFillWith()
  self.Num_Now = 0
  self.Num_Total = 0
  for Index, ItemInfo in ipairs(self.ListDatas) do
    self.Num_Total = self.Num_Total + 1
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    self:SetupListContent(Index, ItemInfo, Content)
    if ItemInfo.Unlock then
      self.Num_Now = self.Num_Now + 1
    end
    self.ItemId2Index[ItemInfo.Id] = Index
    self.List_Item:AddItem(Content)
  end
end

function WBP_Archive_PageChar_C:OnRefreshListLater(bAnimation)
  if bAnimation then
    self._ListAnimTimerKeys = UIUtils.PlayListViewFramingInAnimation(self, self.List_Item, {
      Interval = 0.01,
      Callback = function()
      end
    })
  end
end

function WBP_Archive_PageChar_C:OnRefreshListBegin()
end

function WBP_Archive_PageChar_C:OnRefreshListEnd()
end

function WBP_Archive_PageChar_C:FillListDatasWithCharacterInfo(Data, Info, Unlock)
  local Attribute = DataMgr.BattleChar[Data.CharId].Attribute
  local AttributeIcon
  if Attribute then
    local IconName = "Armory_" .. Attribute
    AttributeIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName
  end
  table.insert(self.ListDatas, {
    Type = "Character",
    Id = Data.CharId,
    Name = Data.CharName,
    Rarity = Data.CharRarity,
    Icon = Data.Icon,
    Tag = Attribute,
    TagIcon = AttributeIcon,
    SortPriority = Data.SortPriority,
    Unlock = Unlock,
    EnhanceLevel = Info.EnhanceLevel,
    GradeLevel = Info.GradeLevel
  })
end

function WBP_Archive_PageChar_C:FillListDatasWithWeaponInfo(Data, Info, Unlock, Tag)
  local TagIcon
  if Tag then
    local WeaponTagInfo = DataMgr.WeaponTag[Tag]
    if WeaponTagInfo then
      TagIcon = WeaponTagInfo.Icon
    end
  end
  table.insert(self.ListDatas, {
    Type = "Weapon",
    Id = Data.WeaponId,
    Name = Data.WeaponName,
    Rarity = Data.WeaponRarity,
    Icon = Data.Icon,
    Tag = Tag,
    TagIcon = TagIcon,
    SortPriority = Data.SortPriority or 0,
    Unlock = Unlock,
    EnhanceLevel = Info[1],
    GradeLevel = Info[2]
  })
end

function WBP_Archive_PageChar_C:SortListDatas()
  table.sort(self.ListDatas, function(A, B)
    if A.Unlock ~= B.Unlock then
      if A.Unlock then
        return true
      else
        return false
      end
    elseif A.Rarity ~= B.Rarity then
      return A.Rarity > B.Rarity
    elseif A.SortPriority ~= B.SortPriority then
      return A.SortPriority > B.SortPriority
    else
      return A.Id < B.Id
    end
  end)
end

function WBP_Archive_PageChar_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == UIConst.GamePadKey.FaceButtonTop then
      IsEventHandled = true
      self.Collect:OnCellClicked()
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
    self.Com_Tab:TabToLeft()
  elseif "E" == InKeyName then
    self.Com_Tab:TabToRight()
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_Archive_PageChar_C:OnReturnKeyDown()
  UIUtils.PlayCommonBtnSe(self)
  self:OnClickBack()
end

function WBP_Archive_PageChar_C:OnClickBack()
  if self:CheckIsCanCloseSelf() then
    self:PlayOutAnim()
  end
end

function WBP_Archive_PageChar_C:CheckIsCanCloseSelf()
  if self:IsAnimationPlaying(self.In) then
    return false
  end
  return true
end

function WBP_Archive_PageChar_C:PlayInAnim()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "ArchivePageCharOpenSound", nil)
  self:PlayAnimationForward(self.In)
  self.Main:SetRenderOpacity(1)
end

function WBP_Archive_PageChar_C:PlayOutAnim()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  AudioManager(self):SetEventSoundParam(self, "ArchivePageCharOpenSound", {ToEnd = 1})
  self:BlockAllUIInput(true)
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self:PlayAnimationForward(self.Out)
end

function WBP_Archive_PageChar_C:Close()
  self.Super.Close(self)
end

function WBP_Archive_PageChar_C:ClickListItem(Content)
  if self.Name == "Character" then
    self:ClickListChar(Content)
  elseif self.Name == "Melee" or self.Name == "Ranged" then
    self:ClickListWeapon(Content)
  end
end

function WBP_Archive_PageChar_C:ClickListChar(Content)
  local CharIds = {}
  for _, value in ipairs(self.ListDatas) do
    table.insert(CharIds, value.Id)
  end
  UIManager(self):LoadUINew("ArmoryDetail", {
    PreviewCharIds = CharIds,
    SelectedTargetId = Content.Id,
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewArmory,
    bNoEndCamera = true,
    bFromArchive = true,
    bHideCharAppearance = true,
    DoNotSort = true,
    bNeedStandBtn = true,
    OnCloseDelegate = nil
  })
end

function WBP_Archive_PageChar_C:ClickListWeapon(Content)
  local WeaponIds = {}
  for _, value in ipairs(self.ListDatas) do
    table.insert(WeaponIds, value.Id)
  end
  UIManager(self):LoadUINew("ArmoryDetail", {
    PreviewWeaponIds = WeaponIds,
    SelectedTargetId = Content.Id,
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewArmory,
    bNoEndCamera = true,
    bFromArchive = true,
    DoNotSort = true,
    OnCloseDelegate = nil
  })
end

function WBP_Archive_PageChar_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Archive_PageChar_C:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Archive_PageChar_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_Archive_PageChar_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function WBP_Archive_PageChar_C:InitGamepadView()
  if UIUtils.HasAnyFocus(self) then
    self.List_Item:SetFocus()
  end
end

function WBP_Archive_PageChar_C:InitKeyboardView()
end

function WBP_Archive_PageChar_C:InitWidgetInfoInGamePad()
  self.Collect:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    }
  })
end

function WBP_Archive_PageChar_C:BP_GetDesiredFocusTarget()
  return self.List_Item
end

function WBP_Archive_PageChar_C:TrySetFocusFirstTime(Entry)
  if not self.SelectFirstTime then
    self.SelectFirstTime = true
    self.List_Item:BP_NavigateToItem(Entry.Content)
  end
end

function WBP_Archive_PageChar_C:CheckIsNew(NodeName, Id)
  if not NodeName or not Id then
    return false
  end
  if not ReddotManager.GetTreeNode(NodeName) then
    ReddotManager.AddNode(NodeName)
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(NodeName)
  if 1 == CacheDetail[Id] then
    return true
  else
    return false
  end
end

function WBP_Archive_PageChar_C:RefreshReddot()
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(self.NodeName)
  self.Index2ReddotNum = {}
  if CacheDetail then
    for Id, State in pairs(CacheDetail) do
      if 1 == State then
        if self.Name == "Character" then
          local Data = DataMgr.Char[Id]
          local Attribute = DataMgr.BattleChar[Data.CharId].Attribute
          local Index = self.TabId2Index[Attribute]
          if 6 == Index then
            local xxx = 1
          end
          if not self.Index2ReddotNum[Index] then
            self.Index2ReddotNum[Index] = 1
          else
            self.Index2ReddotNum[Index] = self.Index2ReddotNum[Index] + 1
          end
          local All_Index = self.TabId2Index.All
          if not self.Index2ReddotNum[All_Index] then
            self.Index2ReddotNum[All_Index] = 1
          else
            self.Index2ReddotNum[All_Index] = self.Index2ReddotNum[All_Index] + 1
          end
        elseif self.Name == "Melee" or self.Name == "Ranged" then
          for i, Tag in ipairs(self.FilterTags) do
            if "All" == Tag or self:DoesWeaponHaveTag(Id, Tag) then
              local Index = self.TabId2Index[Tag]
              if not self.Index2ReddotNum[Index] then
                self.Index2ReddotNum[Index] = 1
              else
                self.Index2ReddotNum[Index] = self.Index2ReddotNum[Index] + 1
              end
            end
          end
        end
      end
    end
    self:RefreshTabReddot()
  end
  local Contents = self.List_Item:GetListItems()
  for _, Content in pairs(Contents) do
    Content.IsNew = false
    if Content.Id and 1 == CacheDetail[Content.Id] then
      Content.IsNew = true
    end
  end
  local AllDisplayWidget = self.List_Item:GetDisplayedEntryWidgets()
  for _, Widget in pairs(AllDisplayWidget) do
    Widget:SetNew(Widget.Content.IsNew)
  end
end

function WBP_Archive_PageChar_C:OnObjectSetFinished(Content, Widget)
  if 1 == Content.Index and not self.FirstFocus then
    self.FirstFocus = true
    self.List_Item:BP_NavigateToItem(Content)
  end
end

function WBP_Archive_PageChar_C:RefreshTabReddot()
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

AssembleComponents(WBP_Archive_PageChar_C)
return WBP_Archive_PageChar_C
