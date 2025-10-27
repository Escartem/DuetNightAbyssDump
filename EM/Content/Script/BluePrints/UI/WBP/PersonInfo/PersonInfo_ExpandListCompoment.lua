require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local UIUtils = require("Utils.UIUtils")
local Component = {}

function Component:Construct()
  self.Arr_OrderBy = {
    "UI_LEVEL_SELECT",
    "UI_RARITY_NAME"
  }
  self.CharOrderByDisplayNames = self.Arr_OrderBy
  self.MeleeOrderByDisplayNames = self.Arr_OrderBy
  self.RangedOrderByDisplayNames = self.Arr_OrderBy
  self.WeaponOrderByDisplayNames = self.Arr_OrderBy
  self.PetOrderByDisplayNames = self.Arr_OrderBy
  self.CharOrderByAttrNames = {
    "Level",
    "Rarity",
    "SortPriority",
    "UnitId"
  }
  self.MeleeOrderByAttrNames = self.CharOrderByAttrNames
  self.RangedOrderByAttrNames = self.CharOrderByAttrNames
  self.WeaponOrderByAttrNames = self.CharOrderByAttrNames
  self.PetOrderByAttrNames = self.CharOrderByAttrNames
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
  
  local function _concat(FromTable, ToTable)
    table.move(FromTable, 1, #FromTable, #ToTable + 1, ToTable)
  end
  
  self.WeaponFilterTags = {}
  _concat(self.MeleeFilterTags, self.WeaponFilterTags)
  _concat(self.RangedFilterTags, self.WeaponFilterTags)
  self.WeaponFilterNames = {}
  _concat(self.MeleeFilterNames, self.WeaponFilterNames)
  _concat(self.RangedFilterNames, self.WeaponFilterNames)
  self.WeaponFilterIcons = {}
  _concat(self.MeleeFilterIcons, self.WeaponFilterIcons)
  _concat(self.RangedFilterIcons, self.WeaponFilterIcons)
  if self.IsEditPage ~= true then
    self.Btn_Selective:BindEventOnClicked(self, self.OnExpandListButtonClicked)
    self.Gamepad_LeftThumbstick = "Gamepad_LeftThumbstick"
    self.CommonKeyDownEvents = self.CommonKeyDownEvents or {}
    self.CommonKeyDownEvents[self.Gamepad_LeftThumbstick] = self.OnGamepad_LeftThumbstickKeyDown
  else
  end
  self.IsListExpanded = false
end

function Component:CreateFilters(InTags, InTexts, InIcons, ExcelWeaponTags)
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

function Component:OnBackKeyDown()
  if not self.IsListExpanded then
    return
  end
  self:ExpandList(false)
end

function Component:OnExpandListButtonClicked()
  self:OnExpandListKeyDown()
end

function Component:OnExpandListKeyDown()
  self:ExpandList(not self.IsListExpanded)
end

function Component:ResetMainTabStyle(IsListExpanded)
  if IsListExpanded then
    local MainTabName = self.CurMainTab.Name
    local TitleName = ""
    local RoleName = ""
    if MainTabName == ArmoryUtils.ArmoryMainTabNames.Char then
      TitleName = GText("UI_Armory_Replace_Character")
      RoleName = self.CharName
    elseif MainTabName == ArmoryUtils.ArmoryMainTabNames.Pet then
      TitleName = GText("UI_Armory_Replace_Pet")
      RoleName = self.PetName
    else
      TitleName = GText("UI_Armory_Replace_Weapon")
      RoleName = self.WeaponName
    end
    if self.IsPreviewMode then
      TitleName = GText("UI_Preview_Switch")
    end
    self.TitleName = TitleName
    self:InitMainTabsStyle({
      TitleName = TitleName .. "/" .. RoleName,
      Tabs = {},
      DynamicNode = {"Back", "BottomKey"},
      BottomKeyInfo = {
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = CommonUtils:GetKeyText("Escape"),
              ClickCallback = self.OnBackKeyDown,
              Owner = self
            }
          },
          Desc = GText("UI_BACK"),
          bLongPress = false
        }
      },
      StyleName = "Text",
      InfoCallback = self.OnInfoClicked,
      BackCallback = self.OnBackKeyDown,
      OwnerPanel = self
    }, true)
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
    self:InitKeySetting()
  end
end

function Component:SetReceivedEvent(IsReceive)
  if self.ComponentReceivedEvent == nil then
    return
  end
  self.ComponentReceivedEvent.Back = IsReceive
  self.ComponentReceivedEvent.WheelScroll = IsReceive
  self.ComponentReceivedEvent.OnClose = IsReceive
  self.ComponentReceivedEvent.ReceiveEnterState = IsReceive
  self.ComponentReceivedEvent.RoleUp = IsReceive
  self.ComponentReceivedEvent.RoleDown = IsReceive
end

function Component:ExpandList(IsListExpanded)
  if IsListExpanded then
    self.IsListExpanded = true
    self.ExcelWeaponTags = nil
    if self[self.CurMainTab.Name .. "FilterTags"] then
      self.Filters = self:CreateFilters(self[self.CurMainTab.Name .. "FilterTags"], self[self.CurMainTab.Name .. "FilterNames"], self[self.CurMainTab.Name .. "FilterIcons"], self.ExcelWeaponTags)
    else
      self.Filters = nil
    end
    self:BindEvents(self, {
      OnListItemClicked = self.OnExpandListItemClicked,
      SortFuncion = self.SortItemContents,
      FilterFunction = self.FilterItemContents,
      OnListItemSelectionChanged = self.OnExpandListItemSelectionChanged
    })
    self:InitEditListView(self, {
      Filters = self.Filters,
      OrderByDisplayNames = self[self.CurMainTab.Name .. "OrderByDisplayNames"],
      SortType = CommonConst.DESC,
      ItemContents = self[self.CurMainTab.Name .. "ItemContentsArray"]
    })
  end
end

function Component:OnExpandListItemSelectionChanged(Content, IsSelected)
  if not self.IsGamepadInput or not IsSelected then
    return
  end
  self:OnExpandListItemClicked(Content)
end

function Component:OnExpandListItemClicked(Content)
  if not self.IsListExpanded then
    return
  end
  if not Content.Uuid then
    return
  end
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_OnListItemClicked", Content)
  if self.IsEditPage then
  else
    self:ResetMainTabStyle(self.IsListExpanded)
    self:HideLeftPanels()
  end
end

function Component:SortItemContents(InOutContentArray, SortByIdx, SortType)
  local FirtContent = self[self.CurMainTab.Name .. "Main_CurContent"] or self[self.CurMainTab.Name .. "Main_CmpContent"]
  local OrderByAttrNames = self[self.CurMainTab.Name .. "OrderByAttrNames"]
  local SortByAttrNames = {
    OrderByAttrNames[SortByIdx]
  }
  for index, value in ipairs(OrderByAttrNames) do
    if index ~= SortByIdx then
      table.insert(SortByAttrNames, value)
    end
  end
  ArmoryUtils:SortItemContents(InOutContentArray, SortByAttrNames, SortType, FirtContent)
end

function Component:FilterItemContents(InContentArray, FilterIdxes)
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
    end
  end
  if bShowSubTile then
    self.Selective_Listing:SetSubTitle(GText("UI_Armory_CharExcelWeapon"))
  end
  return FilteredItems
end

return Component
