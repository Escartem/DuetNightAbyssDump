require("UnLua")
local MiscUtils = require("Utils.MiscUtils")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:InitShop(MainTabIdx, SubTabIdx, ShopItemId, ShopType)
  local PlayerController = UGameplayStatics.GetPlayerController(self, 0)
  if IsValid(PlayerController) then
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
      PlayerController.bShowMouseCursor = true
    else
      PlayerController.bShowMouseCursor = false
    end
  end
  local Player = UGameplayStatics.GetPlayerCharacter(self, 0)
  Player:SetCanInteractiveTrigger(false)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "OpenShopMain", nil)
  if not ShopType then
    DebugPrint("ShopType\231\188\186\229\164\177\239\188\140ZDX_\232\175\183\229\175\185\229\186\148\231\179\187\231\187\159\230\142\165\229\143\163\232\180\159\232\180\163\228\186\186\228\188\160\229\133\165\229\149\134\229\159\142\229\133\183\228\189\147\231\154\132SystemName")
    ShopType = "Shop"
  end
  self.ShopType = ShopType
  self.Common_SortList_PC:Init(self, self.Filters, CommonConst.ASC)
  self.Common_SortList_PC:BindEventOnSelectionsChanged(self, self.BindEventOnSelectionsChanged)
  self.Common_SortList_PC:BindEventOnSortTypeChanged(self, self.BindEventOnSortTypeChanged)
  self.SelectShopItemId = ShopItemId
  self:CommmonInitShop(MainTabIdx, SubTabIdx, ShopItemId, ShopType)
  self:InitShopTabInfo(MainTabIdx, SubTabIdx, ShopType)
  self:PlayAnimation(self.In)
  self:BlockAllUIInput(true)
end

function M:CommmonInitShop(MainTabIdx, SubTabIdx, ShopItemId, ShopType)
  self.Group_BG:ClearChildren()
  local BGPath = DataMgr.Shop[ShopType].ShopBgBPPath
  if BGPath then
    local WidgetClass = LoadClass(BGPath)
    local Widget = UE4.UWidgetBlueprintLibrary.Create(self, WidgetClass)
    if Widget then
      self.Group_BG:AddChild(Widget)
      local OverlaySlot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(Widget)
      OverlaySlot:SetPadding(FMargin(0, 0, 0, 0))
      OverlaySlot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
      OverlaySlot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
      Widget:PlayAnimation(Widget.In)
    end
  end
end

function M:LoadShopTabInfo(MainShopTabData)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.MainTabList = {}
  self.MainTabMap = {}
  self.MainTabs = {}
  for _, MainTabId in ipairs(MainShopTabData.MainTabId) do
    if ShopUtils:IsCanOpenPay(true) then
      local ShopMainTabData = DataMgr.ShopTabMain[MainTabId]
      local MainTab = {
        Text = GText(ShopMainTabData.MainName),
        TabId = ShopMainTabData.MainTabId,
        IconPath = ShopMainTabData.Icon
      }
      if ShopMainTabData.ConditionId then
        MainTab.IsLocked = not Avatar.CheckUIUnlocked(Avatar, ShopMainTabData.ConditionId)
        MainTab.LockReasonText = GText(DataMgr.Condition[DataMgr.UIUnlockRule[ShopMainTabData.ConditionId].ConditionId].ConditionText)
      end
      if not MainTab.IsLocked or not ShopMainTabData.UnlockHide then
        table.insert(self.MainTabList, MainTab)
      end
    end
  end
  for i, Tab in ipairs(self.MainTabList) do
    self.MainTabs[Tab.TabId] = i
    table.insert(self.MainTabMap, Tab.TabId)
  end
  local SubTabDict = {}
  self.SubTabMapIdx = {}
  for SubTabId, Data in MiscUtils.PairsByKeys(DataMgr.ShopTabSub) do
    if ShopUtils:IsCanOpenPay(true) and self.MainTabs[Data.MainTabId] then
      if not SubTabDict[Data.MainTabId] then
        SubTabDict[Data.MainTabId] = 1
      else
        SubTabDict[Data.MainTabId] = SubTabDict[Data.MainTabId] + 1
      end
      self.SubTabMapIdx[SubTabId] = SubTabDict[Data.MainTabId]
    end
  end
  self.OverridenTopResouces = nil
  if type(self.GetOverrideTopResource) == "function" then
    self.OverridenTopResouces = self:GetOverrideTopResource()
  end
end

function M:LoadMainTabInfo(MainTabId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self:CleanTimer()
  self.SubTabList = {}
  self.SubTabMap = {}
  for _, ShopSubTabData in MiscUtils.PairsByKeys(DataMgr.ShopTabSub) do
    if ShopSubTabData.MainTabId == MainTabId and ShopUtils:IsCanOpenPay(true) then
      local SubTab = {
        Text = GText(ShopSubTabData.SubName),
        TabId = ShopSubTabData.SubTabId,
        Data = ShopSubTabData
      }
      if ShopSubTabData.ConditionId then
        SubTab.IsLocked = not Avatar.CheckUIUnlocked(Avatar, ShopSubTabData.ConditionId)
        SubTab.LockReasonText = GText(DataMgr.Condition[DataMgr.UIUnlockRule[ShopSubTabData.ConditionId].ConditionId].ConditionText)
      end
      if not SubTab.IsLocked or not ShopSubTabData.UnlockHide then
        table.insert(self.SubTabList, SubTab)
      end
    end
  end
  table.sort(self.SubTabList, function(a, b)
    return a.TabId < b.TabId
  end)
  for _, Tab in ipairs(self.SubTabList) do
    table.insert(self.SubTabMap, Tab.Data)
  end
end

function M:LoadSubTabInfo(SubTabData)
  self:CleanTimer()
  self.CurSubTabMap = SubTabData
  EventManager:FireEvent(EventID.OnMenuClose)
  if SubTabData.TabCoin then
    self.TabCoinInfo = SubTabData.TabCoin
  else
    assert(DataMgr.Shop[self.ShopType].ShopUIName, "\232\175\165\229\149\134\229\159\142\229\175\185\229\186\148\231\154\132\232\147\157\229\155\190\229\156\168SystemUI\228\184\173\228\184\141\229\173\152\229\156\168\239\188\154" .. self.ShopType)
    self.TabCoinInfo = DataMgr.SystemUI[DataMgr.Shop[self.ShopType].ShopUIName].TabCoin
  end
  self.Common_Tab:OverrideTopResource(self.TabCoinInfo)
  self.Common_Tab:ResetDynamicNode()
  if self.Common_Tab.WBP_Com_Tab_ResourceBar then
    self.Common_Tab.WBP_Com_Tab_ResourceBar:SetLastFocusWidget(nil)
  end
  if self.Common_Tab and self.Common_Tab.UpdateBottomKeyInfo then
    self.Common_Tab:UpdateBottomKeyInfo({
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
    })
  end
end

function M:UpdateShopDetail(SubTabData)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Filter1, SortType = self.Common_SortList_PC:GetSortInfos()
  local ShopDataList = {}
  for ShopItemId, ShopData in pairs(DataMgr.ShopItem) do
    if ShopData.SubTabId == SubTabData.SubTabId and ShopUtils:GetShopItemCanShow(ShopItemId) then
      if not self.bFilterOwned then
        table.insert(ShopDataList, ShopData)
      elseif ShopData.ItemType == "Reward" then
        table.insert(ShopDataList, ShopData)
      else
        local CheckFuncName = "Check" .. ShopData.ItemType .. "Enough"
        local CheckMethod = Avatar[CheckFuncName]
        local bOwn = CheckMethod(Avatar, {
          [ShopData.TypeId] = 1
        })
        if not bOwn then
          table.insert(ShopDataList, ShopData)
        end
      end
    end
  end
  local SortFunc
  
  local function SortBySequence(a, b)
    if SortType == CommonConst.ASC then
      if a.Sequence == b.Sequence then
        return a.ItemId > b.ItemId
      end
      return a.Sequence > b.Sequence
    else
      return a.Sequence < b.Sequence
    end
  end
  
  local function SortFuncByTime(a, b)
    if SortType == CommonConst.ASC then
      return a.StartTime < b.StartTime
    else
      return a.StartTime > b.StartTime
    end
  end
  
  local function SortFuncByRarity(a, b)
    local ItemDataA = DataMgr[a.ItemType][a.TypeId]
    local ItemDataB = DataMgr[b.ItemType][b.TypeId]
    local RarityA = ItemDataA.Rarity or ItemDataA.WeaponRarity or 1
    local RarityB = ItemDataB.Rarity or ItemDataB.WeaponRarity or 1
    if SortType == CommonConst.ASC then
      return RarityA < RarityB
    else
      return RarityA > RarityB
    end
  end
  
  local function SortFuncByPrice(a, b)
    if SortType == CommonConst.ASC then
      return ShopUtils:GetShopItemPrice(a.ItemId) < ShopUtils:GetShopItemPrice(b.ItemId)
    else
      return ShopUtils:GetShopItemPrice(a.ItemId) > ShopUtils:GetShopItemPrice(b.ItemId)
    end
  end
  
  if 1 == Filter1 then
    function SortFunc(a, b)
      if SortBySequence(a, b) then
        return true
      elseif SortBySequence(b, a) then
        return false
      elseif SortFuncByTime(a, b) then
        return true
      elseif SortFuncByTime(b, a) then
        return false
      elseif SortFuncByRarity(a, b) then
        return true
      elseif SortFuncByRarity(b, a) then
        return false
      elseif SortFuncByPrice(a, b) then
        return true
      elseif SortFuncByPrice(b, a) then
        return false
      else
        return false
      end
    end
  elseif 3 == Filter1 then
    function SortFunc(a, b)
      if SortFuncByRarity(a, b) then
        return true
      elseif SortFuncByRarity(b, a) then
        return false
      elseif SortBySequence(a, b) then
        return true
      elseif SortBySequence(b, a) then
        return false
      elseif SortFuncByTime(a, b) then
        return true
      elseif SortFuncByTime(b, a) then
        return false
      elseif SortFuncByPrice(a, b) then
        return true
      elseif SortFuncByPrice(b, a) then
        return false
      else
        return false
      end
    end
  elseif 2 == Filter1 then
    function SortFunc(a, b)
      if SortFuncByTime(a, b) then
        return true
      elseif SortFuncByTime(b, a) then
        return false
      elseif SortBySequence(a, b) then
        return true
      elseif SortBySequence(b, a) then
        return false
      elseif SortFuncByRarity(a, b) then
        return true
      elseif SortFuncByRarity(b, a) then
        return false
      elseif SortFuncByPrice(a, b) then
        return true
      elseif SortFuncByPrice(b, a) then
        return false
      else
        return false
      end
    end
  else
    function SortFunc(a, b)
      if SortFuncByPrice(a, b) then
        return true
      elseif SortFuncByPrice(b, a) then
        return false
      elseif SortBySequence(a, b) then
        return true
      elseif SortBySequence(b, a) then
        return false
      elseif SortFuncByTime(a, b) then
        return true
      elseif SortFuncByTime(b, a) then
        return false
      elseif SortFuncByRarity(a, b) then
        return true
      elseif SortFuncByRarity(b, a) then
        return false
      else
        return false
      end
    end
  end
  local NotSoldOutList = {}
  local SoldOutList = {}
  local LimitLevelList = {}
  for _, ShopData in pairs(ShopDataList) do
    local PurchaseLimit = ShopUtils:GetShopItemPurchaseLimit(ShopData.ItemId)
    if 0 == PurchaseLimit or Avatar:CheckShopItemUnique(ShopData.ItemId) then
      table.insert(SoldOutList, ShopData)
    else
      local NeedLevel = ShopData.UnlockLevel or 0
      if NeedLevel > Avatar.Level then
        table.insert(LimitLevelList, ShopData)
      else
        table.insert(NotSoldOutList, ShopData)
      end
    end
  end
  table.sort(NotSoldOutList, SortFunc)
  table.sort(SoldOutList, SortFunc)
  table.sort(LimitLevelList, SortFunc)
  ShopDataList = {}
  for _, ShopData in ipairs(NotSoldOutList) do
    table.insert(ShopDataList, ShopData)
  end
  for _, ShopData in ipairs(LimitLevelList) do
    table.insert(ShopDataList, ShopData)
  end
  for _, ShopData in ipairs(SoldOutList) do
    table.insert(ShopDataList, ShopData)
  end
  if self.CurSubTabMap.TabType == "Pack" then
    self.VB_ItemList:SetVisibility(ESlateVisibility.Collapsed)
    self:InitPayGiftPage(ShopDataList)
    return
  end
  self.List_Item:ScrollIndexIntoView(0)
  self.List_Item:ClearListItems()
  self.ShopItemNum = #ShopDataList
  self.Index2ShopSkin = {}
  self.ShopSkin2Index = {}
  self.SkinCount = 0
  for i = 1, self.ShopItemNum do
    local ShopData = ShopDataList[i]
    local Content = NewObject(self.ShopItemContentClass)
    Content.ShopId = ShopData.ItemId
    if ShopData.ItemType == "Skin" or ShopData.ItemType == "WeaponSkin" or ShopData.ItemType == "CharAccessory" or ShopData.ItemType == "WeaponAccessory" then
      self.SkinCount = self.SkinCount + 1
      self.Index2ShopSkin[self.SkinCount] = ShopData.ItemId
      self.ShopSkin2Index[ShopData.ItemId] = self.SkinCount
    end
    if ShopData.ItemType == "Resource" and DataMgr.Resource[ShopData.TypeId] and DataMgr.Resource[ShopData.TypeId].ResourceSType == "GestureItem" then
      self.SkinCount = self.SkinCount + 1
      self.Index2ShopSkin[self.SkinCount] = ShopData.ItemId
      self.ShopSkin2Index[ShopData.ItemId] = self.SkinCount
    end
    self.List_Item:AddItem(Content)
  end
  local XAnchor = 0.5
  self:HorizontalListViewResize_SetUp(self.Group_Item, self.List_Item, XAnchor)
  local GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem(self)
  if self.List_Item:GetNumItems() > 0 then
    self:AddTimer(0.1, function()
      if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
        GameInputModeSubsystem:SetNavigateWidgetVisibility(true)
      end
      self.VB_ItemList:SetVisibility(ESlateVisibility.Visible)
      self.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
      self.List_Item:RequestFillEmptyContent()
      self.List_Item:RequestPlayEntriesAnim()
      if not CommonUtils:IfExistSystemGuideUI(self) or self:HasAnyFocus() or self:HasFocusedDescendants() then
        self.List_Item:SetFocus()
      end
    end)
  else
    GameInputModeSubsystem:SetNavigateWidgetVisibility(false)
    self.VB_ItemList:SetVisibility(ESlateVisibility.Collapsed)
    self.Group_Empty:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:OnClickFilterOwned()
  if self:IsAnimationPlaying(self.Filtrate) then
    return
  end
  if self.bFilterOwned then
    self:PlayAnimationReverse(self.Filtrate)
  else
    self:PlayAnimation(self.Filtrate)
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  self.bFilterOwned = not self.bFilterOwned
  self:UpdateShopDetail(self.CurSubTabMap, true)
end

function M:GetOverrideTopResource()
  if self.TabCoinInfo then
    return self.TabCoinInfo
  end
end

function M:CloseSelf()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:BlockAllUIInput(true)
  AudioManager(self):SetEventSoundParam(self, "OpenShopMain", {ToEnd = 1})
  if self.IsAddInDeque then
    self:PlayAnimationForward(self.Out, UIConst.AnimOutSpeedWithPageJump.LittleFastSpeed)
  else
    self:PlayAnimation(self.Out)
  end
end

function M:BindEventOnSelectionsChanged(Filter1, Filter2, Filter3, SortType)
  self:UpdateShopDetail(self.CurSubTabMap)
end

function M:BindEventOnSortTypeChanged(SortType)
  self:UpdateShopDetail(self.CurSubTabMap)
end

function M:ShowItemDetail()
  if not DataMgr.ShopItem[self.SelectShopItemId] then
    return
  end
  self.ShopItemData = setmetatable({}, {
    __index = DataMgr.ShopItem[self.SelectShopItemId]
  })
  if not self.ShopItemData then
    return
  end
  local TypeId = self.ShopItemData.TypeId
  local ItemType = self.ShopItemData.ItemType
  AudioManager(self):PlayItemSound(self, TypeId, "Click", ItemType)
  local RemainTimes = ShopUtils:GetShopItemPurchaseLimit(self.SelectShopItemId)
  local ItemData = DataMgr[ItemType][TypeId]
  local CommonPopupUIID
  if "Reward" == ItemType and (DataMgr.Reward[ItemData.RewardId].Mode == "Fixed" or DataMgr.Reward[ItemData.RewardId].Mode == "Once") then
    if 0 == RemainTimes then
      CommonPopupUIID = 100040
    else
      CommonPopupUIID = 100039
    end
  elseif 0 == RemainTimes then
    CommonPopupUIID = 100042
  else
    CommonPopupUIID = 100041
  end
  if not CommonPopupUIID then
    return
  end
  local Funds = {}
  Funds[1] = {}
  Funds[1].FundId = self.ShopItemData.PriceType
  Funds[1].FundNeed = ShopUtils:GetShopItemPrice(self.ShopItemData.ItemId)
  local ShopUIName = DataMgr.Shop[self.ShopType].ShopUIName
  local CommonDialog = UIManager(self):ShowCommonPopupUI(CommonPopupUIID, {
    ShopItemData = self.ShopItemData,
    ShopType = 0,
    Funds = Funds,
    ShowParentTabCoin = true,
    LeftCallbackObj = self,
    LeftCallbackFunction = function(Obj, PackageData)
      local Shop = UIManager(self):GetUIObj(ShopUIName)
      if Shop then
        Shop:SetFocus()
      end
    end,
    RightCallbackObj = self,
    RightCallbackFunction = function(Obj, PackageData)
      PackageData.Content_1.CallFunc(PackageData.Content_1.CallObj)
    end,
    ForbiddenRightCallbackObj = self,
    ForbiddenRightCallbackFunction = function(Obj, PackageData)
      PackageData.Content_1.CallFunc(PackageData.Content_1.CallObj)
    end,
    DontFocusParentWidget = true,
    CloseBtnCallbackObj = self,
    CloseBtnCallbackFunction = function(Obj, PackageData)
      local Shop = UIManager(self):GetUIObj(ShopUIName)
      if Shop then
        Shop:SetFocus()
      end
    end,
    ForbidRightBtn = not ShopUtils:CanPurchase(self.ShopItemData, Funds[1].FundId, Funds[1].FundNeed)
  }, UIManager(self):GetUIObj(ShopUIName))
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  self:OnKeyDownForLSComp(MyGeometry, InKeyEvent)
  return M.Super.OnKeyUp(self, MyGeometry, InKeyEvent)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if not IsEventHandled then
      IsEventHandled = self:OnGamePadDown(InKeyName)
    end
  elseif "Escape" == InKeyName then
    if not UIManager(self):GetUIObj("CommonDialog") then
      IsEventHandled = true
      self:CloseSelf()
    end
  elseif "Q" == InKeyName then
    IsEventHandled = true
    self.ShopTab:TabToLeft()
  elseif "E" == InKeyName then
    IsEventHandled = true
    self.ShopTab:TabToRight()
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
    if self.IsBannerPage and self.BannerIdMap and self.SelectBannerId then
      local Banner = self.BannerIdMap[self.SelectBannerId]
      if Banner.OnKeyDown then
        return Banner:OnKeyDown(MyGeometry, InKeyEvent)
      end
    end
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnRechargeFinished(Result, GoodsId, ShopItems)
  self:BlockAllUIInput(false)
  self:RefreshSubTabData(self.CurSubTabMap)
  if Result == ErrorCode.RET_SUCCESS then
    if ShopItems and DataMgr.PayGoods[GoodsId].ItemId then
      local ShopItemData = DataMgr.ShopItem[DataMgr.PayGoods[GoodsId].ItemId]
      assert(ShopItemData, "\232\180\173\228\185\176\230\136\144\229\138\159\229\144\142\232\175\187\232\161\168ShopItemData\228\184\186\231\169\186", DataMgr.PayGoods[GoodsId].ItemId)
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, ShopItems, ShopItemData.IsSpPopup)
    end
  else
    UIManager(GWorld.GameInstance):ShowError(Result, 1.0, "CommonToastMain")
  end
end

function M:SetFocus_Lua()
  local AllItemCount = self.List_Item:GetNumItems()
  if AllItemCount > 0 then
    self.List_Item:SetFocus()
  else
    self:SetFocus()
  end
end

return M
