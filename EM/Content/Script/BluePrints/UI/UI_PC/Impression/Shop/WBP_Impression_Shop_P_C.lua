require("UnLua")
local M = Class("BluePrints.UI.Shop.WBP_Shop_Main_Base_C")
local ImpressionTypes = require("BluePrints.UI.UI_PC.Impression.ImpressionConst").ImpressionTypes
M._components = {
  "BluePrints.UI.UI_PC.Common.HorizontalListViewResizeComp",
  "BluePrints.UI.UI_PC.Common.LSFocusComp"
}

function M:Construct()
  M.Super.Construct(self)
  self:AddLSFocusTarget(self.Btn_DimensionDrawArea.Key_Dimension, self.Btn_DimensionDrawArea, "Menu", true)
  self:AddLSFocusTarget(self.CheckBox_Own.Com_KeyImg, self.CheckBox_Own, "X", true)
  self:AddLSFocusTarget(nil, {
    self.Common_SortList_PC
  })
end

function M:Destruct()
  M.Super.Destruct(self)
  self:RemoveFocusTarget("Menu")
  self:RemoveFocusTarget("LS")
  self:RemoveFocusTarget("X")
end

function M:OnLoaded(...)
  M.Super.OnLoaded(self, ...)
  self.ExtraShopItemInfos = {}
  self.Filters = {
    "UI_Select_Default",
    "UI_RARITY_NAME"
  }
  self.bFilterOwned = false
  self.List_Item:SetVisibility(ESlateVisibility.Visible)
  self:InitShop()
  self:SetGText()
  self:BindAnimations()
  self:PlayAnimation(self.In)
  self:SwitchHideHeadWidget(true)
  self:InitDimensionBtn()
  self:PlayInAudio()
end

function M:PlayInAudio()
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "ImpressionShopIn", nil)
  AudioManager(self):PlaySystemUIBGM("event:/bgm/1_0/0084_system_shop_danjiao", nil, "ImpressionShop")
end

function M:PlayCloseAudio()
  AudioManager(self):SetEventSoundParam(self, "ImpressionShopIn", {ToEnd = 1})
  AudioManager(self):StopSystemUIBGM("ImpressionShop")
end

function M:InitDimensionBtn()
  self.Btn_DimensionDrawArea:Init()
end

function M:SwitchHideHeadWidget(bHide)
  local ImpressionShopNPC = UE4.ANpcCharacter.GetNpc(self, 700050)
  if ImpressionShopNPC then
    local HeadUISubsystem = UNpcHeadUISubsystem.GetHeadUISubsystem(self)
    HeadUISubsystem:HideNpcHeadUI(ImpressionShopNPC.NpcId, bHide, "ImpressionShop")
  end
end

function M:SetGText()
  self.Text_ImpressionShopTips:SetText(GText("UI_ImpressionShop_Tips"))
end

function M:BindAnimations()
  self:BindToAnimationFinished(self.In, {
    self,
    self.OnInAnimationFinished
  })
end

function M:OnInAnimationFinished()
  self:BindButtonEvents()
end

function M:BindButtonEvents()
  self.Btn_DimensionDrawArea:BindEventOnClicked(self, self.OnBtn_DimensionClicked)
  self.CheckBox_Own:BindEventOnClicked({
    Inst = self,
    Func = self.OnClickFilterOwned
  })
end

function M:UnBindButtonEvents()
  self.CheckBox_Own:UnBindEventOnClickedByObj(self)
  self.Btn_DimensionDrawArea:UnBindEventOnClicked(self, self.OnBtn_DimensionClicked)
end

function M:OnClickFilterOwned()
  DebugPrint("WBP_Impression_Shop_P:OnClickFilterOwned")
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  self.bFilterOwned = not self.bFilterOwned
  self:UpdateShopDetail(nil, true)
end

function M:OnBtn_DimensionClicked()
  local DimensionPanel = UIManager(self):LoadUINew("RegionMapImpression")
  DimensionPanel:Init(self.RegionId, self, true)
  self.Btn_DimensionDrawArea:SetIsChecked(false)
end

function M:InitShop(MainTabIdx, SubTabIdx)
  self.bIsFocusable = true
  self:UpdateResource()
  self.Text_None:SetText(GText("UI_SHOP_NOTOWNED"))
  self:InitSortList()
  self:InitShopTabInfo(MainTabIdx, SubTabIdx, 2)
  self:InitRegionInfo()
end

function M:InitRegionInfo()
  self.RegionId = 1011
  self.WorldId = nil
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self.RegionId = Avatar:GetSubRegionId2RegionId()
  end
  for _, MapData in pairs(DataMgr.WorldMap) do
    for _, regionMapId in pairs(MapData.WorldMapRegion) do
      if self.RegionId == DataMgr.RegionMap[regionMapId].RegionId then
        self.RegionIcon = MapData.RegionIcon
        self.WorldId = MapData.WorldMapId
        break
      end
    end
  end
end

function M:SetFocus_Lua()
  if self.ShopItemNum > 0 then
    self.List_Item:SetFocus()
  else
    self:SetFocus()
  end
end

function M:UpdateResource()
  local Avatar = GWorld:GetAvatar()
  local SubRegionId = Avatar:GetSubRegionId2RegionId()
  local Data = DataMgr.ImpressionResource[SubRegionId]
  local ResourceId = 3001
  if not Data then
    Utils.ScreenPrint("Error: ImpressionResource\228\184\173\230\156\170\233\133\141\231\189\174\229\189\147\229\137\141RegionId" .. SubRegionId)
  else
    ResourceId = Data.ResourceId
  end
  self.OverrideTopResource = {ResourceId}
end

function M:CloseSelf()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:UnBindButtonEvents()
  self:PlayAnimation(self.Out)
end

function M:BindSortListEvents()
  self.Common_SortList_PC:BindEventOnSelectionsChanged(self, self.OnSelectionsChanged)
  self.Common_SortList_PC:BindEventOnSortTypeChanged(self, self.OnSortTypeChanged)
end

function M:InitSortList()
  self.Common_SortList_PC:Init(self, self.Filters, CommonConst.ASC)
  self:BindSortListEvents()
end

function M:OnSelectionsChanged()
  DebugPrint("WBP_Impression_Shop_P:OnSelectionsChanged")
  self:UpdateSortList()
end

function M:OnSortTypeChanged()
  DebugPrint("WBP_Impression_Shop_P:OnSortTypeChanged")
  self:UpdateSortList()
end

function M:GetAllAvailableImpressionShopItemDatas(CheckFunc)
  local ShopItems = {}
  for _, v in pairs(DataMgr.ImpressionShop) do
    if not CheckFunc or CheckFunc(v) then
      table.insert(ShopItems, setmetatable({}, {__index = v}))
    end
  end
  return ShopItems
end

function M:ProcessShopItemData(ItemInfos)
  for _, ItemInfo in pairs(ItemInfos) do
    ItemInfo.bUnlocked = ItemInfo.bUnlocked or self:CheckShopItemUnlocked(ItemInfo)
    ItemInfo.Rarity = ItemInfo.Rarity or self:GetItemRarity(ItemInfo.ItemType, ItemInfo.ItemId, 1)
    ItemInfo.ItemSeq = ItemInfo.ItemSeq or 0
  end
end

function M:CheckShopItemUnlocked(ItemInfo)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  return ConditionUtils.CheckCondition(Avatar, ItemInfo.UnlockCondition, false)
end

function M:AddOrRefreshShopItemSoldOut(ShopItemDatas)
  local Avatar = GWorld:GetAvatar()
  for _, ItemData in pairs(ShopItemDatas) do
    if Avatar then
      local Info = Avatar.ImpressionShops[ItemData.ImpressionShopId]
      local bSoldOut = false
      if Info then
        bSoldOut = ItemData.PurchaseLimit and Info.AlreadyPurchaseTimes >= ItemData.PurchaseLimit or false
      else
        bSoldOut = true
      end
      ItemData.bSoldOut = bSoldOut
      ItemData.bNotSoldOut = not bSoldOut
    else
      ItemData.bSoldOut = true
    end
  end
end

function M:OnShopItemSold()
  self:UpdateShopDetail()
end

function M:UpdateSortList(SubTabData)
  SubTabData = SubTabData or self.CachedSubTabData
  self.CachedSubTabData = SubTabData
  local Avatar = GWorld:GetAvatar()
  
  local function GetShopItemCheckFunc(ShopItemData)
    if ShopItemData.SubTabId ~= SubTabData.SubTabId then
      return false
    end
    if ShopItemData.ConditionId and not ConditionUtils.CheckCondition(Avatar, ShopItemData.ConditionId) then
      return false
    end
    return true
  end
  
  local ItemInfos = self:GetAllAvailableImpressionShopItemDatas(GetShopItemCheckFunc)
  local Filter1, SortType = self.Common_SortList_PC:GetSortInfos()
  self:ProcessShopItemData(ItemInfos)
  self:AddOrRefreshShopItemSoldOut(ItemInfos)
  local SortFunc
  local bReverse = SortType ~= CommonConst.ASC
  DebugPrint("WBP_Impression_Shop_P:UpdateSortList ", SortType, Filter1, bReverse, self.bFilterOwned)
  if 1 == Filter1 then
    function SortFunc(A, B)
      if self:SortByBoolField(A, B, "bNotSoldOut", bReverse) then
        return true
      elseif self:SortByBoolField(B, A, "bNotSoldOut", bReverse) then
        return false
      elseif self:SortByBoolField(A, B, "bUnlocked", bReverse) then
        return true
      elseif self:SortByBoolField(B, A, "bUnlocked", bReverse) then
        return false
      elseif self:SortByFloatField(A, B, "ItemSeq", not bReverse) then
        return true
      elseif self:SortByFloatField(B, A, "ItemSeq", not bReverse) then
        return false
      else
        return self:SortByFloatField(A, B, "ImpressionShopId", bReverse)
      end
    end
  elseif 2 == Filter1 then
    function SortFunc(A, B)
      if self:SortByBoolField(A, B, "bNotSoldOut", bReverse) then
        return true
      elseif self:SortByBoolField(B, A, "bNotSoldOut", bReverse) then
        return false
      elseif self:SortByFloatField(A, B, "Rarity", not bReverse) then
        return true
      elseif self:SortByFloatField(B, A, "Rarity", not bReverse) then
        return false
      elseif self:SortByBoolField(A, B, "bUnlocked", bReverse) then
        return true
      elseif self:SortByBoolField(B, A, "bUnlocked", bReverse) then
        return false
      elseif self:SortByFloatField(A, B, "ItemSeq", not bReverse) then
        return true
      elseif self:SortByFloatField(B, A, "ItemSeq", not bReverse) then
        return false
      else
        return self:SortByFloatField(A, B, "ImpressionShopId", bReverse)
      end
    end
  end
  table.sort(ItemInfos, SortFunc)
  local ShopDataList = {}
  for _, ItemData in pairs(ItemInfos) do
    if self.bFilterOwned then
      local bOwn = self:CheckSelfOwnShopItem(ItemData, true)
      if not bOwn then
        table.insert(ShopDataList, ItemData)
      end
    else
      table.insert(ShopDataList, ItemData)
    end
  end
  self.List_Item:ScrollIndexIntoView(0)
  self:StopAttrListFramingIn()
  self.List_Item:ClearListItems()
  self.ShopItemNum = #ShopDataList
  for i = 1, self.ShopItemNum do
    local ShopData = ShopDataList[i]
    local Content = NewObject(self.ShopItemContentClass)
    Content.ShopItemData = ShopData
    Content.ShopUI = self
    self.List_Item:AddItem(Content)
  end
  local XAnchor = CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" and 0 or 0.5
  self:HorizontalListViewResize_SetUp(self.Group_Item, self.List_Item, XAnchor)
  local GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem(self)
  if 0 == self.ShopItemNum then
    GameInputModeSubsystem:SetNavigateWidgetVisibility(false)
  elseif UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    GameInputModeSubsystem:SetNavigateWidgetVisibility(true)
  end
  self:AddTimer(0.01, function()
    local XCount, YCount = UIUtils.GetTileViewContentMaxCount(self.List_Item, "XY")
    local EmptyItemNum
    if self.ShopItemNum - XCount * YCount <= 0 then
      EmptyItemNum = XCount * YCount - self.ShopItemNum
    else
      EmptyItemNum = XCount - self.ShopItemNum % XCount
    end
    for i = 1, EmptyItemNum do
      local Content = NewObject(self.ShopItemContentClass)
      Content.ShopId = nil
      self.List_Item:AddItem(Content)
      self.List_Item:RegenerateAllEntries()
    end
    if not CommonUtils:IfExistSystemGuideUI(self) then
      self:SetFocus()
    end
    self:AddTimer(0.01, function()
      self:PlayAttrListFramingIn()
    end)
  end)
end

function M:PlayAttrListFramingIn()
  self.List_Item:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self._ListAttrAnimTimerKeys = UIUtils.PlayListViewFramingInAnimation(self, self.List_Item, {
    Interval = self.IntervalTime,
    Visibility = UIConst.VisibilityOp.Visible,
    Callback = function()
      self.List_Item:SetVisibility(UIConst.VisibilityOp.Visible)
    end
  })
end

function M:StopAttrListFramingIn()
  UIUtils.StopListViewFramingInAnimation(self.List_Item, {
    UIState = self,
    TimerKeys = self._ListAttrAnimTimerKeys
  })
end

function M:UpdateShopDetail(SubTabData)
  self:UpdateSortList(SubTabData)
end

function M:OnReturnKeyDown()
  self:CloseSelf()
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.Out then
    self:Close()
  end
end

function M:Close()
  DebugPrint("WBP_Impression_Shop_P:Close")
  self:SwitchHideHeadWidget(false)
  self:HorizontalListViewResize_TearDown()
  self:PlayCloseAudio()
  M.Super.Close(self)
end

function M:IsShopItemUnlocked(ShopItemData)
  return ShopItemData.bUnlocked
end

function M:IsShopItemSoldOut(ShopItemData)
  return ShopItemData.bSoldOut
end

function M:GetShopItemNum(ShopItemData)
  local AvailableTime, LimitTime = 0, 0
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local Info = Avatar.ImpressionShops[ShopItemData.ImpressionShopId]
    if Info then
      LimitTime = ShopItemData.PurchaseLimit
      AvailableTime = LimitTime - Info.AlreadyPurchaseTimes
    end
  end
  return AvailableTime, LimitTime
end

function M:CheckSelfOwnShopItem(ShopItemData, bForceRefresh)
  if ShopItemData.bOwn ~= nil and not bForceRefresh then
    return ShopItemData.bOwn
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local NetData = Avatar[ShopItemData.ItemType .. "s"]
  if NetData then
    for _, Data in pairs(NetData) do
      local ItemId = Data[ShopItemData.ItemType .. "Id"] or Data.AccessoryId
      if ItemId == ShopItemData.ItemId then
        return true
      end
    end
  end
  return false
end

function M:GetOverrideTopResource()
  return self.OverrideTopResource
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  self:OnKeyDownForLSComp(MyGeometry, InKeyEvent)
  return M.Super.OnKeyUp(self, MyGeometry, InKeyEvent)
end

AssembleComponents(M)
return M
