require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local UIUtils = require("Utils.UIUtils")
local M = {}

function M:Construct()
  self.CharFilterTags, self.CharFilterNames = UIUtils.GetAllElementTypes()
  self.CharFilterIcons = {}
  for key, Tag in pairs(self.CharFilterTags) do
    local IconName = "Armory_" .. Tag
    table.insert(self.CharFilterIcons, "/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName)
  end
  self.MeleeFilterTags, self.MeleeFilterNames, self.RangedFilterTags, self.RangedFilterNames = UIUtils.GetAllWeaponTags()
  self.MeleeFilterIcons = {}
  self.Melee2Icon = {}
  for _, Tag in ipairs(self.MeleeFilterTags) do
    local Data = DataMgr.WeaponTag[Tag]
    table.insert(self.MeleeFilterIcons, Data and Data.Icon)
    self.Melee2Icon[Tag] = Data.Icon
  end
  self.RangedFilterIcons = {}
  self.Ranged2Icon = {}
  for _, Tag in ipairs(self.RangedFilterTags) do
    local Data = DataMgr.WeaponTag[Tag]
    table.insert(self.RangedFilterIcons, Data and Data.Icon)
    self.Ranged2Icon[Tag] = Data.Icon
  end
  self.Btn_Selective:BindEventOnClicked(self, self.OnExpandListButtonClicked)
  self.IsListExpanded = false
end

function M:CreateWeaponFilterTags()
  if not self.ComparedWeaponName or not self[self.ComparedWeaponName] then
    return
  end
  
  local function _concat(FromTable, ToTable)
    table.move(FromTable, 1, #FromTable, #ToTable + 1, ToTable)
  end
  
  self.WeaponFilterTags = {}
  self.WeaponFilterNames = {}
  self.WeaponFilterIcons = {}
  if self.bFromArchive then
    if self[self.ComparedWeaponName]:HasTag(CommonConst.WeaponType.MeleeWeapon) then
      _concat(self.MeleeFilterTags, self.WeaponFilterTags)
      _concat(self.MeleeFilterNames, self.WeaponFilterNames)
      _concat(self.MeleeFilterIcons, self.WeaponFilterIcons)
    else
      _concat(self.RangedFilterTags, self.WeaponFilterTags)
      _concat(self.RangedFilterNames, self.WeaponFilterNames)
      _concat(self.RangedFilterIcons, self.WeaponFilterIcons)
    end
  else
    _concat(self.MeleeFilterTags, self.WeaponFilterTags)
    _concat(self.RangedFilterTags, self.WeaponFilterTags)
    _concat(self.MeleeFilterNames, self.WeaponFilterNames)
    _concat(self.RangedFilterNames, self.WeaponFilterNames)
    _concat(self.MeleeFilterIcons, self.WeaponFilterIcons)
    _concat(self.RangedFilterIcons, self.WeaponFilterIcons)
  end
end

function M:InitUIInfo()
  if self.bFromArchive then
    self.Arr_OrderBy = {
      "UI_LEVEL_SELECT"
    }
    self.CommonOrderByAttrNames = {
      "SortPriority",
      "UnitId"
    }
  else
    self.Arr_OrderBy = {
      "UI_LEVEL_SELECT"
    }
    self.CommonOrderByAttrNames = {
      "Level",
      "SortPriority",
      "UnitId"
    }
  end
  self.CharOrderByDisplayNames = self.Arr_OrderBy
  self.MeleeOrderByDisplayNames = self.Arr_OrderBy
  self.RangedOrderByDisplayNames = self.Arr_OrderBy
  self.WeaponOrderByDisplayNames = self.Arr_OrderBy
  self.PetOrderByDisplayNames = {
    "UI_LEVEL_SELECT",
    "UI_RARITY_NAME"
  }
  self.ResourcePetOrderByDisplayNames = {
    "UI_RARITY_NAME",
    "Pet_Affix_Type"
  }
  self.CharOrderByAttrNames = self.CommonOrderByAttrNames
  self.MeleeOrderByAttrNames = self.CommonOrderByAttrNames
  self.RangedOrderByAttrNames = self.CommonOrderByAttrNames
  self.WeaponOrderByAttrNames = self.CommonOrderByAttrNames
  self.PetOrderByAttrNames = {
    "BreakNum",
    "Level",
    "Rarity",
    "SortPriority",
    "UnitId"
  }
  self.ResourcePetOrderByAttrNames = {
    "Rarity",
    "_PetEntryId",
    "SortPriority",
    "UnitId"
  }
end

function M:CreateFilters(InTags, InTexts, InIcons, ExcelWeaponTags)
  local Filters = {}
  for i, value in ipairs(InTags) do
    table.insert(Filters, {
      Tag = value,
      Text = InTexts[i],
      Icon = InIcons[i],
      bShowRecommend = ExcelWeaponTags and CommonUtils.HasValue(ExcelWeaponTags, value)
    })
  end
  return Filters
end

function M:OnBackKeyDown()
  if not self.IsListExpanded then
    return
  end
  return self:OnBackBtnClicked()
end

function M:OnBackBtnClicked()
  if not self.IsListExpanded then
    return
  end
  self:ExpandList(false)
end

function M:OnExpandListButtonClicked()
  self:OnExpandListKeyDown()
end

function M:OnExpandListKeyDown()
  self:ExpandList(not self.IsListExpanded)
end

function M:ResetMainTabStyle(IsListExpanded)
  if IsListExpanded then
    local MainTabName = self.CurMainTab.Name
    local TitleName = ""
    local RoleName = ""
    if MainTabName == ArmoryUtils.ArmoryMainTabNames.Char then
      TitleName = GText("UI_Armory_Replace_Character") .. "/"
      RoleName = self.CharMain_CmpContent.UnitName
    elseif MainTabName == ArmoryUtils.ArmoryMainTabNames.Pet then
      if 1 == self.CurPetTabIdx then
        TitleName = GText("UI_Armory_Replace_Pet") .. "/"
      else
        TitleName = ""
      end
      RoleName = self.PetMain_CmpContent.UnitName
    else
      TitleName = GText("UI_Armory_Replace_Weapon") .. "/"
      RoleName = self[self.CmpContentName].UnitName
    end
    if self.IsPreviewMode then
      TitleName = GText("UI_Preview_Switch") .. "/"
    end
    self.TitleName = TitleName .. RoleName
    self:UpdateMainTabs({})
    self.Tab_Arm:UpdateTopTitle(self.TitleName)
    if not self.IsPC then
      self.Tab_Arm.Panel_Tab:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  else
    self:InitMainTabsStyle(self.MainTabsStyle, true)
    local CurMainTabIdx = self.MainTabName2Idx[self.CurMainTab.Name]
    self:UpdateMainTabs(self.MainTabs)
    if CurMainTabIdx then
      self.Tab_Arm:SelectTab(CurMainTabIdx)
    end
  end
end

function M:SetReceivedEvent(IsReceive)
  self.ComponentReceivedEvent.Back = IsReceive
  self.ComponentReceivedEvent.WheelScroll = IsReceive
  self.ComponentReceivedEvent.OnClose = IsReceive
  self.ComponentReceivedEvent.ReceiveEnterState = IsReceive
  self.ComponentReceivedEvent.RoleUp = IsReceive
  self.ComponentReceivedEvent.RoleDown = IsReceive
  self.ComponentReceivedEvent.OnLeftThumbstickKeyDown = IsReceive
  self.ComponentReceivedEvent.OnLeftThumbstickKeyUp = IsReceive
  self.ComponentReceivedEvent.InitKeySetting = IsReceive
  self.ComponentReceivedEvent.GetDesiredFocusTargetInfo = IsReceive
  self.ComponentReceivedEvent.OnGetSubUINavigationInfo = IsReceive
  self.ComponentReceivedEvent.SelectRoleListItem = IsReceive
end

function M:ExpandList(IsListExpanded)
  if IsListExpanded then
    self.IsListExpanded = true
    self.ExcelWeaponTags = nil
    self:SetReceivedEvent(IsListExpanded)
    self:ResetMainTabStyle(IsListExpanded)
    if self.CurMainTab.Name == ArmoryUtils.ArmoryMainTabNames.Melee or self.CurMainTab.Name == ArmoryUtils.ArmoryMainTabNames.Ranged then
      self.ExcelWeaponTags = UIUtils.GetExcelWeaponTags(self.ComparedChar.CharId)
    end
    self:CreateWeaponFilterTags()
    if self[self.CurMainTab.Name .. "FilterTags"] then
      self.Filters = self:CreateFilters(self[self.CurMainTab.Name .. "FilterTags"], self[self.CurMainTab.Name .. "FilterNames"], self[self.CurMainTab.Name .. "FilterIcons"], self.ExcelWeaponTags)
    else
      self.Filters = nil
    end
    self.Selective_Listing:BindEvents(self, {
      OnListItemClicked = self.OnExpandListItemClicked,
      OnListItemSelectionChanged = self.OnExpandListItemSelectionChanged,
      OnEntryInitialized = self.OnExpandListEntryInitialized,
      SortFuncion = self.SortItemContents,
      FilterFunction = self.FilterItemContents
    })
    local OrderByDisplayNames
    if self.CurMainTab.Name == ArmoryUtils.ArmoryMainTabNames.Pet and self.PetItemContentsArray == self.ResourcePetItemContentsArray then
      OrderByDisplayNames = self.ResourcePetOrderByDisplayNames
    else
      OrderByDisplayNames = self[self.CurMainTab.Name .. "OrderByDisplayNames"]
    end
    self.Selective_Listing:Init(self, {
      Filters = self.Filters,
      OrderByDisplayNames = OrderByDisplayNames,
      SortType = CommonConst.DESC,
      ItemContents = self[self.CurMainTab.Name .. "ItemContentsArray"]
    })
    local LastCameraTags = self.ActorController.LastCameraTags
    if LastCameraTags then
      self.LastCameraTagsBeforeExpandList = {
        table.unpack(LastCameraTags)
      }
      self.ActorController:SetArmoryCameraTag(LastCameraTags[1], LastCameraTags[2], "Switch", LastCameraTags[4])
    end
    self.Tab_L_Visibility = self.Tab_L:GetVisibility()
    self.Panel_SubTab_Visibility = self.Panel_SubTab:GetVisibility()
    self.Tab_PetAlive_Visibility = self.Tab_PetAlive:GetVisibility()
    self.Tab_PetAlive:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self:HideLeftPanels(IsListExpanded)
    if self.CurMainTab.Name == ArmoryUtils.ArmoryMainTabNames.Char then
      self.Selective_Listing:SetEmptyStateText(GText("UI_Armory_Char_Empty"))
    elseif self.CurMainTab.Name == ArmoryUtils.ArmoryMainTabNames.Pet then
      self.Selective_Listing:SetEmptyStateText(GText("UI_Armory_Pet_Empty"))
    else
      self.Selective_Listing:SetEmptyStateText(GText("UI_Armory_Weapon_Empty"))
    end
    self.Selective_Listing:PlayInAnim()
    self.Selective_Listing:SetFocusToList()
  else
    self.IsListExpanded = false
    self.Selective_Listing:PlayOutAnim()
    self:PlayAnimation(self.RoleList_In)
    self:PlayAnimation(self.BG_BackFirst)
    self.Panel_SubTab:SetVisibility(self.Tab_L_Visibility)
    self.Tab_L:SetVisibility(self.Panel_SubTab_Visibility)
    self.Tab_PetAlive:SetVisibility(self.Tab_PetAlive_Visibility)
    self:SetReceivedEvent(IsListExpanded)
    self:ResetMainTabStyle(IsListExpanded)
    local LastCameraTags = self.ActorController.LastCameraTags
    if LastCameraTags then
      local CameraTags = {
        table.unpack(LastCameraTags)
      }
      if "Switch" == CameraTags[3] then
        CameraTags[3] = self.LastCameraTagsBeforeExpandList[3]
      end
      self.ActorController:SetArmoryCameraTag(table.unpack(CameraTags))
    end
    self:SetAllReddotRead()
    if self.GetDesiredFocusTargetInfo then
      local Info = {}
      self:GetDesiredFocusTargetInfo(Info)
      if Info.Widget then
        Info.Widget:SetFocus()
      else
        self:SetFocus()
      end
    end
  end
end

function M:UpdataExpandList()
end

function M:OnWeaponGradeLevelUp()
  if not self.IsListExpanded then
    return
  end
end

function M:OnExpandListItemClicked(Content)
  if not self.IsListExpanded then
    return
  end
  if not Content.Uuid then
    return
  end
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_OnRoleListItemClicked", Content)
end

function M:SelectRoleListItem(Content)
  if not self.IsListExpanded then
    return
  end
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_SelectRoleListItem", Content)
  self:ResetMainTabStyle(self.IsListExpanded)
  self:HideLeftPanels()
end

function M:OnExpandListItemSelectionChanged(Content, IsSelected)
  if not self.IsGamepadInput or not IsSelected then
    return
  end
  self:OnExpandListItemClicked(Content)
end

function M:OnExpandListEntryInitialized(Content, Widget)
  if self.CurMainTab.Name == ArmoryUtils.ArmoryMainTabNames.Pet and not Content.IsResourcePet then
    Widget:SetLevel(Content.Level)
  end
end

function M:HideLeftPanels()
  self.Tab_L:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_SubTab:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:InitRoleList()
  if self.IsListExpanded then
    self.Selective_Listing:Resort()
  end
end

function M:SortItemContents(InOutContentArray, SortByIdx, SortType)
  local FirtContent = self[self.CurMainTab.Name .. "Main_CurContent"] or self[self.CurMainTab.Name .. "Main_CmpContent"]
  local SortByAttrNames
  local Func = self[self.CurMainTab.Name .. "_GetSortByAttrNames"]
  if Func then
    SortByAttrNames = Func(self, SortByIdx)
  else
    SortByAttrNames = self:Common_GetSortByAttrNames(SortByIdx)
  end
  ArmoryUtils:SortItemContents(InOutContentArray, SortByAttrNames, SortType, FirtContent, function(a, b)
    if a.IsOwned or b.IsOwned then
      return ArmoryUtils.IsOwnedCmpFunc(a, b)
    end
    if a.Unlockable ~= b.Unlockable then
      if a.Unlockable then
        return true
      else
        return false
      end
    end
  end)
end

function M:Common_GetSortByAttrNames(SortByIdx)
  local OrderByAttrNames = self[self.CurMainTab.Name .. "OrderByAttrNames"]
  local SortByAttrNames = {
    OrderByAttrNames[SortByIdx]
  }
  for index, value in ipairs(OrderByAttrNames) do
    if index ~= SortByIdx then
      table.insert(SortByAttrNames, value)
    end
  end
  return SortByAttrNames
end

function M:Pet_GetSortByAttrNames(SortByIdx)
  local SortByAttrNames
  if self.PetItemContentsArray == self.UseablePetItemContentsArray then
    local OrderByAttrNames = self.PetOrderByAttrNames
    if 2 == SortByIdx then
      SortByAttrNames = {"Rarity"}
      for index, value in ipairs(OrderByAttrNames) do
        if index ~= SortByIdx then
          table.insert(SortByAttrNames, value)
        end
      end
    else
      SortByAttrNames = OrderByAttrNames
    end
  elseif 1 == SortByIdx then
    SortByAttrNames = self.ResourcePetOrderByAttrNames
  else
    SortByAttrNames = {
      "_PetEntryId"
    }
    for index, value in ipairs(self.ResourcePetOrderByAttrNames) do
      if index ~= SortByIdx then
        table.insert(SortByAttrNames, value)
      end
    end
  end
  return SortByAttrNames
end

function M:FilterItemContents(InContentArray, FilterIdxes)
  local TabName = self.CurMainTab.Name
  local FilteredItems = {}
  local FilterFunc
  if TabName == ArmoryUtils.ArmoryMainTabNames.Char then
    function FilterFunc(FilterTag, Content)
      local Data = DataMgr.BattleChar[Content.UnitId]
      
      return FilterTag == Data.Attribute
    end
  elseif TabName == ArmoryUtils.ArmoryMainTabNames.Melee or TabName == ArmoryUtils.ArmoryMainTabNames.Ranged or TabName == ArmoryUtils.ArmoryMainTabNames.Weapon then
    local Avatar = ArmoryUtils:GetAvatar()
    
    function FilterFunc(FilterTag, Content)
      local Weapon = Avatar.Weapons[Content.Uuid]
      Weapon = Content.Avatar and Content.Avatar.Weapons[Content.Uuid] or Weapon
      return Weapon:HasTag(FilterTag)
    end
  elseif TabName == ArmoryUtils.ArmoryMainTabNames.Pet then
    function FilterFunc()
      return true
    end
  end
  local bShowSubTile = false
  if FilterFunc then
    for _, Content in ipairs(InContentArray) do
      if FilterIdxes and next(FilterIdxes) then
        for _, Idx in ipairs(FilterIdxes) do
          local Tag = self[TabName .. "FilterTags"][Idx]
          if self.ExcelWeaponTags and CommonUtils.HasValue(self.ExcelWeaponTags, Tag) then
            bShowSubTile = true
          end
          if FilterFunc(Tag, Content) then
            table.insert(FilteredItems, Content)
            break
          end
        end
      else
        table.insert(FilteredItems, Content)
      end
    end
  end
  if bShowSubTile then
    self.Selective_Listing:SetSubTitle(GText("UI_Armory_CharExcelWeapon"))
  end
  return FilteredItems
end

function M:OnArmoryModClosed(Type, Tag)
  if not self.IsListExpanded then
    return
  end
  self:UpdateMontageAndCamera()
end

function M:RealClose()
  if not self.IsListExpanded then
    return
  end
  self:ExpandList(false)
end

function M:ReceiveEnterState(StackAction)
  if not self.IsListExpanded then
    return
  end
end

function M:InitKeySetting()
  if not self.IsListExpanded then
    return
  end
  self:InitKeySettingCommon()
  self:CallFunctionByName("ExpandList_" .. self.CurMainTab.Name .. "Main_InitKeySetting", self.KeyDownEvents, self.KeyUpEvents, self.BottomKeyInfo)
  self:UpdateBottomKeyInfo(self.BottomKeyInfo)
end

function M:ExpandList_CharMain_InitKeySetting(KeyDownEvents, KeyUpEvents, BottomKeyInfo)
  if not self.bHideSquadBuildBtn or not self.IsPreviewMode then
    self:AddKeyEvents(KeyDownEvents, self.MenuKeyDownEvents)
  end
  self:AddKeyEvents(KeyDownEvents, self.LeftThumbstickKeyDownEvents, self.CommonKeyDownEvents)
  if self.CurSubTab.Name == ArmoryUtils.ArmorySubTabNames.Attribute and not self.AttributeButtonStyleParams[1].ForbidBtn and not self.IsPreviewMode then
    self:AddKeyEvents(KeyDownEvents, self.UpgradeKeyDownEvents)
  end
  table.insert(BottomKeyInfo, self.ESCKeyInfoList)
end

function M:ExpandList_MeleeMain_InitKeySetting(KeyDownEvents, KeyUpEvents, BottomKeyInfo)
  self:ExpandList_WeaponMain_InitKeySetting(KeyDownEvents, KeyUpEvents, BottomKeyInfo)
end

function M:ExpandList_RangedMain_InitKeySetting(KeyDownEvents, KeyUpEvents, BottomKeyInfo)
  self:ExpandList_WeaponMain_InitKeySetting(KeyDownEvents, KeyUpEvents, BottomKeyInfo)
end

function M:ExpandList_WeaponMain_InitKeySetting(KeyDownEvents, KeyUpEvents, BottomKeyInfo)
  if not self.bHideSquadBuildBtn or not self.IsPreviewMode then
    self:AddKeyEvents(KeyDownEvents, self.MenuKeyDownEvents)
  end
  self:AddKeyEvents(KeyDownEvents, self.LeftThumbstickKeyDownEvents, self.CommonKeyDownEvents)
  self:AddKeyEvents(KeyUpEvents, self.LeftThumbstickKeyUpEvents)
  if self.WeaponTag ~= CommonConst.ArmoryTag.UWeapon and not self.IsPreviewMode and self.CurSubTab.Name == ArmoryUtils.ArmorySubTabNames.Attribute and not self.AttributeButtonStyleParams[1].ForbidBtn then
    self:AddKeyEvents(KeyDownEvents, self.UpgradeKeyDownEvents)
  end
  table.insert(self.BottomKeyInfo, self.ESCKeyInfoList)
end

function M:ExpandList_PetMain_InitKeySetting(KeyDownEvents, KeyUpEvents, BottomKeyInfo)
  if not self.bHideSquadBuildBtn or not self.IsPreviewMode then
    self:AddKeyEvents(KeyDownEvents, self.MenuKeyDownEvents)
  end
  self:AddKeyEvents(KeyDownEvents, self.CommonKeyDownEvents, self.LeftThumbstickKeyDownEvents)
  if self.CurSubTab.Name == ArmoryUtils.ArmorySubTabNames.Attribute and not self.SubUIButtonStyleInfo[1].ForbidBtn then
    self:AddKeyEvents(KeyDownEvents, self.UpgradeKeyDownEvents)
  end
  table.insert(BottomKeyInfo, self.ESCKeyInfoList)
end

function M:InitKeySettingCommon()
  if self.IsListExpanded then
    self:AddKeyEvents(self.KeyDownEvents, self.ViewKeyDownEvents)
  elseif self.BoxWidget:IsVisible() then
    self:AddKeyEvents(self.KeyDownEvents, self.ViewKeyDownEvents)
  end
end

function M:CharMain_OnViewKeyDown()
  self:ExpandList_OnViewKeyDown()
end

function M:WeaponMain_OnViewKeyDown()
  self:ExpandList_OnViewKeyDown()
end

function M:PetMain_OnViewKeyDown()
  self:ExpandList_OnViewKeyDown()
end

function M:ExpandList_OnViewKeyDown()
  if self.IsListExpanded then
    self:ExpandList(false)
  elseif self.BoxWidget:IsVisible() then
    self:ExpandList(true)
  end
end

function M:OnLeftThumbstickKeyDown()
  if not self.IsListExpanded then
    return
  end
  self.Selective_Listing:SetSortWidgetFocus()
end

function M:OnBackgroundClicked()
  if self.IsListExpanded then
    self:ExpandList(false)
  end
end

function M:CharMain_OnFocusReceived(ReplyInfo)
  self:ExpandList_OnFocusReceived(ReplyInfo)
end

function M:WeaponMain_OnFocusReceived(ReplyInfo)
  self:ExpandList_OnFocusReceived(ReplyInfo)
end

function M:PetMain_OnFocusReceived(ReplyInfo)
  self:ExpandList_OnFocusReceived(ReplyInfo)
end

function M:ExpandList_OnFocusReceived(ReplyInfo)
  if not self.IsListExpanded then
    return
  end
  ReplyInfo.Reply = UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Selective_Listing)
  ReplyInfo.IsHandled = true
end

function M:GetDesiredFocusTargetInfo(Info)
  if self.IsListExpanded then
    Info.Widget = self.Selective_Listing
  end
end

function M:OnGetSubUINavigationInfo(Info, NavigationDirection)
  if not self.IsListExpanded then
    return
  end
  if NavigationDirection == EUINavigation.Left then
    Info.Widget = self.Selective_Listing
  end
end

function M:PetMain_Init()
  if not self.IsListExpanded then
    return
  end
  self:ExpandList(true)
end

function M:WeaponMain_Init()
  if not self.IsListExpanded then
    return
  end
  self:ExpandList(true)
end

function M:CharMain_Init()
  if not self.IsListExpanded then
    return
  end
  self:ExpandList(true)
end

function M:ExpandList_OnItemContentsChanged()
  if not self.IsListExpanded then
    return
  end
  self.Selective_Listing:SetItemContents(self[self.CurMainTab.Name .. "ItemContentsArray"])
  local Item = self.Selective_Listing:GetSelectedListItem()
  if Item then
    self.Selective_Listing:ScrollItemIntoView(Item)
  end
end

function M:OnNewCharObtained()
  self:ExpandList_OnItemContentsChanged()
end

function M:OnNewWeaponObtained()
  self:ExpandList_OnItemContentsChanged()
end

function M:OnWeaponDeleted()
  self:ExpandList_OnItemContentsChanged()
end

function M:OnNewPetObtained()
  self:ExpandList_OnItemContentsChanged()
end

function M:OnPetDeleted()
  self:ExpandList_OnItemContentsChanged()
end

return M
