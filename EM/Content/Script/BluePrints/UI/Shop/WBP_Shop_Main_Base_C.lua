require("UnLua")
local MiscUtils = require("Utils.MiscUtils")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:InitShopTabInfo(MainTabIdx, SubTabIdx, ShopType)
  self.MainTabData = "ShopTabMain"
  self.SubTabData = "ShopTabSub"
  self.ShopType = ShopType
  if 1 == ShopType then
    self.MainTabData = "RougeBlessingShop"
    self.SubTabData = nil
  elseif 3 == ShopType then
    self.MainTabData = "RougeTreasureShop"
    self.SubTabData = nil
  elseif 2 == ShopType then
    self.MainTabData = "ImpressionShopMainTab"
    self.SubTabData = "ImpressionShopSubTab"
  end
  local TabList = {}
  self.MainTabMap = {}
  for _, ShopMainTabData in MiscUtils.PairsByKeys(DataMgr[self.MainTabData]) do
    local MainTab = {
      Text = GText(ShopMainTabData.MainName),
      TabId = ShopMainTabData.MainTabId,
      IconPath = ShopMainTabData.Icon
    }
    table.insert(TabList, MainTab)
  end
  table.sort(TabList, function(a, b)
    return a.TabId < b.TabId
  end)
  for _, Tab in ipairs(TabList) do
    table.insert(self.MainTabMap, Tab.TabId)
  end
  local SubTabDict = {}
  local SubTabMapIdx = {}
  if self.SubTabData then
    for SubTabId, Data in MiscUtils.PairsByKeys(DataMgr[self.SubTabData]) do
      if not SubTabDict[Data.MainTabId] then
        SubTabDict[Data.MainTabId] = 1
      else
        SubTabDict[Data.MainTabId] = SubTabDict[Data.MainTabId] + 1
      end
      SubTabMapIdx[SubTabId] = SubTabDict[Data.MainTabId]
    end
  end
  local OverridenTopResouces
  if type(self.GetOverrideTopResource) == "function" then
    OverridenTopResouces = self:GetOverrideTopResource()
  end
  if 0 == ShopType then
    self.Common_Tab:Init({
      LeftKey = "Q",
      RightKey = "E",
      Tabs = TabList,
      DynamicNode = {
        "Back",
        "ResourceBar",
        "BottomKey"
      },
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
              ClickCallback = self.CloseSelf,
              Owner = self
            }
          },
          Desc = GText("UI_BACK")
        }
      },
      StyleName = "Text",
      TitleName = GText("MAIN_UI_SHOP"),
      OverridenTopResouces = OverridenTopResouces,
      OwnerPanel = self,
      BackCallback = self.CloseSelf
    })
  elseif 1 == ShopType or 3 == ShopType then
    self.Common_Tab:Init({
      LeftKey = "Q",
      RightKey = "E",
      Tabs = TabList,
      DynamicNode = {
        "Back",
        "ResourceBar",
        "BottomKey"
      },
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
          Desc = GText("UI_BACK"),
          bLongPress = false
        }
      },
      TitleName = GText("MAIN_UI_SHOP"),
      OverridenTopResouces = OverridenTopResouces,
      OwnerPanel = self,
      BackCallback = self.CloseSelf
    }, true)
  elseif 2 == ShopType then
    local Avatar = GWorld:GetAvatar()
    local RegionId = Avatar:GetSubRegionId2RegionId(Avatar:GetCurrentRegionId())
    local TitleText = "UI_ImpressionShop_ShopName_" .. RegionId
    if TitleText == GText(TitleText) then
      TitleText = "UI_ImpressionShop_ShopName_1011"
    end
    self.Common_Tab:Init({
      LeftKey = "Q",
      RightKey = "E",
      Tabs = TabList,
      DynamicNode = {
        "Back",
        "ResourceBar",
        "BottomKey"
      },
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
              ClickCallback = self.CloseSelf,
              Owner = self
            }
          },
          Desc = GText("UI_BACK")
        }
      },
      StyleName = "Text",
      TitleName = GText(TitleText),
      OverridenTopResouces = OverridenTopResouces,
      OwnerPanel = self,
      BackCallback = self.CloseSelf
    })
  end
  self.Common_Tab:BindEventOnTabSelected(self, self.OnMainTabChanged)
  if not MainTabIdx then
    self.Common_Tab:SelectTab(1)
  else
    self.Common_Tab:SelectTab(MainTabIdx)
    if self.Common_Toggle_TabGroup_PC then
      self.Common_Toggle_TabGroup_PC:SelectTab(SubTabMapIdx[SubTabIdx])
    end
  end
end

function M:OnMainTabChanged(TabWidget)
  local MainTabId = self.MainTabMap[TabWidget.Idx]
  if not MainTabId then
    return
  end
  self:CleanTimer()
  local SubTabList = {}
  self.SubTabMap = {}
  for _, ShopSubTabData in MiscUtils.PairsByKeys(DataMgr[self.SubTabData]) do
    if ShopSubTabData.MainTabId == MainTabId then
      local SubTab = {
        Text = GText(ShopSubTabData.SubName),
        Img = ShopSubTabData.Icon,
        TabId = ShopSubTabData.SubTabId,
        Data = ShopSubTabData
      }
      table.insert(SubTabList, SubTab)
    end
  end
  table.sort(SubTabList, function(a, b)
    return a.TabId < b.TabId
  end)
  for _, Tab in ipairs(SubTabList) do
    table.insert(self.SubTabMap, Tab.Data)
  end
  if self.Common_Toggle_TabGroup_PC then
    self.Common_Toggle_TabGroup_PC:Init({
      LeftKey = "A",
      RightKey = "D",
      Tabs = SubTabList
    })
    self.Common_Toggle_TabGroup_PC:BindEventOnTabSelected(self, self.OnSubTabChanged)
    self.Common_Toggle_TabGroup_PC:SelectTab(1)
    if #SubTabList <= 1 then
      self.Common_Toggle_TabGroup_PC:SetVisibility(ESlateVisibility.Collapsed)
    else
      self.Common_Toggle_TabGroup_PC:SetVisibility(ESlateVisibility.Visible)
    end
  end
end

function M:OnSubTabChanged(TabWidget)
  local SubTabData = self.SubTabMap[TabWidget.Idx]
  if not SubTabData then
    return
  end
  self:CleanTimer()
  self.CurSubTabMap = SubTabData
  if self.ShopType == "Shop" then
    EventManager:FireEvent(EventID.OnMenuClose)
    if SubTabData.TabCoin then
      self.TabCoinInfo = SubTabData.TabCoin
    else
      self.TabCoinInfo = DataMgr.SystemUI.ShopMain.TabCoin
    end
    self.Common_Tab:OverrideTopResource(self.TabCoinInfo)
    self.Common_Tab:ResetDynamicNode()
    self:UpdateShopDetail(self.CurSubTabMap)
  elseif 1 == self.ShopType or 3 == self.ShopType then
    self:UpdateShopDetail(self.CurSubTabMap, false, true)
  elseif 2 == self.ShopType then
    self:UpdateShopDetail(self.CurSubTabMap, false, true)
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  elseif "Escape" == InKeyName then
    if not UIManager(self):GetUIObj("CommonDialog") and not self.bCannotResponseEscape then
      IsEventHandled = true
      self:CloseSelf()
    end
  elseif "Q" == InKeyName then
    IsEventHandled = true
    self.Common_Tab:TabToLeft()
  elseif "E" == InKeyName then
    IsEventHandled = true
    self.Common_Tab:TabToRight()
  elseif "A" == InKeyName then
    if self.Common_Toggle_TabGroup_PC then
      IsEventHandled = true
      self.Common_Toggle_TabGroup_PC:TabToLeft()
    end
  elseif "D" == InKeyName and self.Common_Toggle_TabGroup_PC then
    IsEventHandled = true
    self.Common_Toggle_TabGroup_PC:TabToRight()
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if "Gamepad_LeftTrigger" == InKeyName or "Gamepad_RightTrigger" == InKeyName then
    if self.Common_Toggle_TabGroup_PC then
      IsEventHandled = self.Common_Toggle_TabGroup_PC:Handle_KeyEventOnGamePad(InKeyName)
    end
  else
    IsEventHandled = self.Common_Tab:Handle_KeyEventOnGamePad(InKeyName)
  end
  return IsEventHandled
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurInputDevice = CurInputDevice
  M.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  self:SetFocus_Lua()
  return UIUtils.Handle
end

function M:SetFocus_Lua()
end

function M:ReceiveEnterState(StackAction)
  M.Super.ReceiveEnterState(self, StackAction)
  self:OnUpdateUIStyleByInputTypeChange(self.GameInputModeSubsystem:GetCurrentInputType())
end

function M:SortByFloatField(ItemA, ItemB, Field, bReverse)
  if nil == ItemA[Field] then
    DebugPrint("Error: \228\189\191\231\148\168\228\186\134\230\156\170\231\159\165\231\154\132\229\173\151\230\174\181\231\148\168\228\186\142\230\175\148\232\190\131\229\149\134\229\147\129", Field)
    return false
  end
  local bRes = false
  if bReverse then
    bRes = ItemA[Field] > ItemB[Field]
  else
    bRes = ItemA[Field] < ItemB[Field]
  end
  return bRes
end

function M:SortByBoolField(ItemA, ItemB, Field, bReverse)
  local bRes = false
  if ItemA[Field] and not ItemB[Field] then
    bRes = true
  end
  if bReverse then
    bRes = ItemB[Field] and not ItemA[Field]
  else
    bRes = ItemA[Field] and not ItemB[Field]
  end
  return bRes
end

function M:GetItemRarity(ItemType, ItemId, DefaultRarity)
  local Rarity = DataMgr[ItemType][ItemId].Rarity or DataMgr[ItemType][ItemId].WeaponRarity or DataMgr[ItemType][ItemId].CharRarity or DefaultRarity or 1
  return Rarity
end

return M
