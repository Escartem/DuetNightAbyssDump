require("UnLua")
local EMCache = require("EMCache.EMCache")
local StuffIconObject = require("BluePrints.UI.WBP.Bag.Widget.BagStuffIconObject")
local RewardBox = require("BluePrints.Client.CustomTypes.SimpleRewardBox")
local CommonUtils = require("Utils.CommonUtils")
local BagCommon = require("BluePrints.UI.WBP.Bag.BagCommon")
local TimeUtils = require("Utils.TimeUtils")
local WBP_Bag_Sell_View_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Bag_Sell_View_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.ParentWidget = nil
  self.bIsOpenList = false
  self.InitStuffDataInList = nil
  self.CurStuffCountInList = 0
  self.CurSelectStuffContentInList = nil
  self.AllTypeCoinInfo = {}
  self.AllTypeRewardsInfo = {}
  self.AllRewardContentList = {}
  self.NeedDealWithStuffData = {}
  self.NeedDealWithStuffCount = {}
  self.CloseCallback = nil
  self.RemoveCallback = nil
  self.ConfirmCallback = nil
  self.BagCurState = nil
  self.CurFocusWidget = "DefaultWidget"
end

function WBP_Bag_Sell_View_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.List_Item:ClearListItems()
  self.ParentWidget, self.CloseCallback, self.RemoveCallback, self.ConfirmCallback, self.InitStuffDataInList, self.CurrentMode = ...
  if CommonUtils.GetDeviceTypeByPlatformName(self) == CommonConst.CLIENT_DEVICE_TYPE.MOBILE then
    local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Panel_Content)
    if nil ~= CanvasSlot then
      CanvasSlot:SetSize(FVector2D(0, 0))
    end
  end
  self:PlayInAnim()
end

function WBP_Bag_Sell_View_C:OnFocusReceived(MyGeometry, InFocusEvent)
  self.CurFocusWidget = "DefaultWidget"
  if self.ParentWidget then
    self.ParentWidget:RefreshBottomKeyInfo("DefaultWidget")
  end
  return WBP_Bag_Sell_View_C.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
end

function WBP_Bag_Sell_View_C:InitListenEvent()
  self:AddDispatcher(EventID.OnUpdateBagItem, self, self.OnUpdateBagItemByAction)
  self:AddDispatcher(EventID.OnAddBagItemToList, self, self.AddBagItemToList)
  self:AddDispatcher(EventID.OnRemoveBagItemInList, self, self.RemoveBagItemInList)
end

function WBP_Bag_Sell_View_C:OnUpdateBagItemByAction(OpAction, ErrCode, ...)
  if 0 ~= ErrCode then
    return
  end
  if "WeaponBulkBreakDown" == OpAction then
    local RewardBox, ResolveWeaponSucc = ...
    self:ShowGetItemPage(RewardBox)
  elseif UKismetStringLibrary.EndsWith(OpAction, "Sale", ESearchCase.CaseSensitive) then
    local AllRewards, bIsNotShowGetItemPage = {}, true
    local ItemKeys = BagCommon.StuffType.Resource .. "s"
    if "ModBulkSale" == OpAction then
      local DecomposeSuccStuff, DecomposeModSucc = ...
      for k, v in pairs(DecomposeSuccStuff) do
        if not AllRewards[ItemKeys] then
          AllRewards[ItemKeys] = {}
        end
        AllRewards[ItemKeys][k] = v
        if v > 0 then
          bIsNotShowGetItemPage = false
        end
      end
    elseif "ResourceBulkSale" == OpAction then
      local SaleItemSucc, SaleItemFail = ...
      AllRewards[ItemKeys] = {}
      bIsNotShowGetItemPage = false
      for k, v in pairs(SaleItemSucc) do
        local StuffUnitId = tostring(k)
        local SellResourceObj = self.NeedDealWithStuffData[StuffUnitId]
        if SellResourceObj then
          local NowSaleStuffCount = self.NeedDealWithStuffCount[StuffUnitId]
          if AllRewards[ItemKeys][SellResourceObj.CoinId] then
            AllRewards[ItemKeys][SellResourceObj.CoinId] = AllRewards[ItemKeys][SellResourceObj.CoinId] + SellResourceObj.Price * NowSaleStuffCount
          else
            AllRewards[ItemKeys][SellResourceObj.CoinId] = SellResourceObj.Price * NowSaleStuffCount
          end
        end
      end
    elseif "FishResourceBulkSale" == OpAction then
      local SaleFishResources, SaleFishPrice = ...
      AllRewards[ItemKeys] = {}
      bIsNotShowGetItemPage = false
      for CoinId, Price in pairs(SaleFishPrice) do
        AllRewards[ItemKeys][CoinId] = Price
      end
    end
    if not bIsNotShowGetItemPage then
      self:ShowGetItemPage(AllRewards)
    else
      self:PlayOutAnim()
    end
  end
end

function WBP_Bag_Sell_View_C:ShowGetItemPage(AllRewards)
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self:AddTimer(0.8, function()
      UIManager(self):LoadUINew("GetItemPage", nil, nil, nil, AllRewards, self.PlayOutAnim, self, true)
    end)
  else
    UIManager(self):LoadUINew("GetItemPage", nil, nil, nil, AllRewards, self.PlayOutAnim, self, true)
  end
end

function WBP_Bag_Sell_View_C:PlayInAnim()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  self:PlayAnimationForward(self.In)
  self:RefreshBaseInfo()
  self:InitListenEvent()
  AudioManager(self):PlayUISound(self, "event:/ui/common/sell_panel_expand", nil, nil)
end

function WBP_Bag_Sell_View_C:PlayOutAnim()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  if self.bIsOpenList or self:IsAnimationPlaying(self.CloseList) then
    local function PlayCloseAnimFinished()
      self.List_Item:SetVisibility(UE4.ESlateVisibility.Collapsed)
      
      self.Panel_Sell_List:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.bIsOpenList = false
      self:BindToAnimationFinished(self.Out, {
        self,
        self.Close
      })
      self:PlayAnimationForward(self.Out)
    end
    
    self:UnbindAllFromAnimationFinished(self.CloseList)
    self:BindToAnimationFinished(self.CloseList, {self, PlayCloseAnimFinished})
    self:PlayAnimationForward(self.CloseList)
  else
    self:BindToAnimationFinished(self.Out, {
      self,
      self.Close
    })
    self:PlayAnimationForward(self.Out)
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/sell_panel_shrink", nil, nil)
end

function WBP_Bag_Sell_View_C:RefreshBaseInfo()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == CommonConst.CLIENT_DEVICE_TYPE.PC then
    self.Key_Check:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RS"}
      }
    })
    self.Key_View:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Menu"}
      }
    })
  end
  self.Com_NumInput:Init({
    MinusBtnCallback = self.OnClickToMinusStuff,
    AddBtnCallback = self.OnClickToAddStuff,
    MinBtnCallback = self.OnClickToMinStuff,
    MaxBtnCallback = self.OnClickToMaxStuff,
    InputCallback = self.OnInputStuffNum,
    LeaveFocusWidget = self.ParentWidget,
    OwnerPanel = self
  })
  self.Com_NumInput:SetSimpleMode(true)
  self.Com_Slider:Init({
    MinusBtnCallback = self.OnClickToMinusStuff,
    AddBtnCallback = self.OnClickToAddStuff,
    SliderChangeCallback = self.SliderChangeCallback,
    SoundResPath = {
      Minus = "event:/ui/common/click_btn_minus"
    },
    OwnerPanel = self,
    EnableMiniBtn = false,
    EnableMaxBtn = false
  })
  self.ItemBox:ClearChildren()
  self.Num_Select:SetText(tostring(BagCommon.MinSellInputCount))
  self.Num_Select_Max:SetText(tostring(BagCommon.MaxSellInputCount))
  self.Text_Num:SetText(GText("UI_Bag_Sell_Amount"))
  self.Text_Select:SetText(GText("UI_Bag_Sell_Select"))
  self.Text_Total:SetText(GText("UI_Bag_Decompose_Expect"))
  self.Text_Empty:SetText(GText("UI_BAG_Nochosen"))
  self.Button_Purchase:SetGamePadImg("Y")
  if self.ParentWidget and (self.ParentWidget.CurTabId == BagCommon.ItemTypeToTabId.MeleeWeapon or self.ParentWidget.CurTabId == BagCommon.ItemTypeToTabId.RangedWeapon) then
    self.Button_Purchase:SetText(GText("UI_Bag_Decompose"))
    self.Button_Purchase:BindEventOnClicked(self, self.TryToResolveStuff)
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  elseif self.ParentWidget and self.ParentWidget.CurTabId == BagCommon.ItemTypeToTabId.Mod then
    self.Button_Purchase:SetText(GText("UI_Bag_ModExtract"))
    self.Button_Purchase:BindEventOnClicked(self, self.TryToSaleStuff)
    self.Text_Overflow:SetText(GText("UI_Bag_ModExtract_Overflow"))
    self.Text_ModSellLimit:SetText(GText("UI_Bag_ModExtract_MaxNum"))
    local LimitedCoinNum, CurCoinNumDaily = self:GetCoin3DataInfo()
    self.Num_ModSellLimit:SetText(math.max(0, LimitedCoinNum - CurCoinNumDaily))
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    if LimitedCoinNum <= CurCoinNumDaily then
      self.Bg_ModSellNum:SetColorAndOpacity(self.Color_ModSell_Empty)
    else
      self.Bg_ModSellNum:SetColorAndOpacity(self.Color_ModSell_Normal)
    end
    self.Icon_Currency:SetBrushResourceObject(LoadObject(ItemUtils.GetItemIconPath(CommonConst.Coins.Coin3, BagCommon.StuffType.Resource)))
  else
    self.Button_Purchase:SetText(GText("UI_BAG_Sell"))
    self.Button_Purchase:BindEventOnClicked(self, self.TryToSaleStuff)
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  end
  self.Button_List:BindEventOnClicked(self, self.ClickToOpenStuffList)
  self.Back_Area.OnClicked:Clear()
  self.Back_Area.OnClicked:Add(self, self.ClickToOpenStuffList)
  if self.InitStuffDataInList ~= nil then
    self:AddBagItemToList(self.InitStuffDataInList)
    self.CurSelectStuffContentInList = self.List_Item:GetItemAt(0)
    self.Panel_Empty:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if self.CurrentMode == BagCommon.BagItemSelectOpMode.ResolveMode then
      self.Panel_KeyCount:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      self.Panel_KeyCount:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    self.Button_Purchase:ForbidBtn(false)
  else
    self.CurSelectStuffContentInList = nil
    self.Panel_Empty:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Total:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Panel_KeyCount:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Button_Purchase:ForbidBtn(true)
  end
  self.List_Item.BP_OnItemSelectionChanged:Add(self, self.OnSelectStuffItemChanged)
  
  function self.Button_List.SoundFunc(Btn)
    AudioManager(self):PlayUISound(self.Button_List, "event:/ui/common/click_btn_small", nil, nil)
  end
  
  if self.ParentWidget then
    self.BagCurState = self.ParentWidget.BagCurState
    if type(self.ParentWidget.SetFocus_Lua) == "function" then
      self.ParentWidget:SetFocus_Lua()
    else
      self.ParentWidget:SetFocus()
    end
  end
  local IsUseGamePad = self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad and self:IsCanChangeToGamePadViewMode()
  self:UpdateUIStyleInPlatform(IsUseGamePad)
end

function WBP_Bag_Sell_View_C:GetCoin3DataInfo()
  local PlayerAvatar = GWorld:GetAvatar()
  local CurrentLevel = PlayerAvatar.Level
  local PlayerLevelInfo = DataMgr.PlayerLevelUp[CurrentLevel]
  local LimitedCoinNum, CurCoinNumDaily = PlayerLevelInfo.ModExtractMax or 0, PlayerAvatar.ResourceCoinNumDaily or 0
  return LimitedCoinNum, CurCoinNumDaily
end

function WBP_Bag_Sell_View_C:RefreshCoinInfo(CoinId)
  local AllChildren = self.ItemBox:GetAllChildren()
  local TotalRewardTypeNum, ExtraShowCoinNum = 0, 0
  if self.ParentWidget and self.ParentWidget.CurTabId == BagCommon.ItemTypeToTabId.Mod then
    for k, v in pairs(self.AllTypeCoinInfo) do
      if v > 0 then
        local bIsNeedStuffIcon, ValueCount = true, 0
        if k == CommonConst.Coins.Coin3 then
          local LimitedCoinNum, CurCoinNumDaily = self:GetCoin3DataInfo()
          if CurCoinNumDaily < LimitedCoinNum then
            ExtraShowCoinNum = CurCoinNumDaily + v - LimitedCoinNum
          else
            ExtraShowCoinNum = 0
          end
          bIsNeedStuffIcon = CurCoinNumDaily < LimitedCoinNum
          ValueCount = math.min(math.floor(v + 0.5), math.floor(LimitedCoinNum - CurCoinNumDaily + 0.5))
        else
          ValueCount = math.floor(v + 0.5)
        end
        if bIsNeedStuffIcon then
          TotalRewardTypeNum = TotalRewardTypeNum + 1
          local RewardItemWidget
          if TotalRewardTypeNum > AllChildren:Length() then
            RewardItemWidget = UIManager(self):_CreateWidgetNew("ComItemUniversalS")
            self.ItemBox:AddChildToWrapBox(RewardItemWidget)
          else
            RewardItemWidget = self.ItemBox:GetChildAt(TotalRewardTypeNum - 1)
          end
          local RewardInfo = DataMgr.Resource[k]
          local RewardObject = {}
          RewardObject.Id = k
          RewardObject.Icon = ItemUtils.GetItemIconPath(k, BagCommon.StuffType.Resource)
          RewardObject.ParentWidget = self
          RewardObject.ItemType = BagCommon.StuffType.Resource
          RewardObject.Rarity = RewardInfo.Rarity or 1
          RewardObject.IsShowDetails = true
          RewardObject.UIName = BagCommon.BagStuffSelectUIName
          RewardObject.Count = ValueCount
          RewardItemWidget:Init(RewardObject)
          RewardItemWidget:SetVisibility(UE4.ESlateVisibility.Visible)
        end
      end
    end
    if ExtraShowCoinNum > 0 then
      local RewardInfo = DataMgr.Resource[CommonConst.Coins.Coin3]
      local RewardObject = {}
      RewardObject.Id = CommonConst.Coins.Coin3
      RewardObject.Icon = ItemUtils.GetItemIconPath(CommonConst.Coins.Coin3, BagCommon.StuffType.Resource)
      RewardObject.ParentWidget = self
      RewardObject.ItemType = BagCommon.StuffType.Resource
      RewardObject.Rarity = RewardInfo.Rarity or 1
      RewardObject.IsShowDetails = true
      RewardObject.UIName = BagCommon.BagStuffSelectUIName
      RewardObject.bAllUseAsyncLoadWidget = false
      RewardObject.Count = math.floor(ExtraShowCoinNum + 0.5)
      self.WBP_Com_Item_Universal_S_C:Init(RewardObject)
      if self.WBP_Com_Item_Universal_S_C.CountWidget then
        self.WBP_Com_Item_Universal_S_C.CountWidget.Text_Num:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DA2A4AFF"))
      end
      self.WBP_Com_Item_Universal_S_C:SetVisibility(UE4.ESlateVisibility.Visible)
      self.ItemBox_Overflow:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Text_Overflow:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.ItemBox_Overflow:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Text_Overflow:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  else
    for k, v in pairs(self.AllTypeCoinInfo) do
      if v > 0 then
        TotalRewardTypeNum = TotalRewardTypeNum + 1
        local RewardItemWidget
        if TotalRewardTypeNum > AllChildren:Length() then
          RewardItemWidget = UIManager(self):_CreateWidgetNew("ComItemUniversalS")
          self.ItemBox:AddChildToWrapBox(RewardItemWidget)
        else
          RewardItemWidget = self.ItemBox:GetChildAt(TotalRewardTypeNum - 1)
        end
        local RewardInfo = DataMgr.Resource[k]
        local RewardObject = {}
        RewardObject.Id = k
        RewardObject.Icon = ItemUtils.GetItemIconPath(k, BagCommon.StuffType.Resource)
        RewardObject.ParentWidget = self
        RewardObject.ItemType = BagCommon.StuffType.Resource
        RewardObject.Rarity = RewardInfo.Rarity or 1
        RewardObject.IsShowDetails = true
        RewardObject.UIName = BagCommon.BagStuffSelectUIName
        RewardObject.Count = math.floor(v + 0.5)
        RewardItemWidget:Init(RewardObject)
        RewardItemWidget:SetVisibility(UE4.ESlateVisibility.Visible)
      end
    end
    self.ItemBox_Overflow:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Text_Overflow:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if TotalRewardTypeNum <= 0 then
    if ExtraShowCoinNum <= 0 then
      self.Panel_Total:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      self.Text_Total:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  else
    self:SetNavigationRuleForRewardItem(TotalRewardTypeNum)
    for i = TotalRewardTypeNum + 1, AllChildren:Length() do
      local SubRewardItemWidget = self.ItemBox:GetChildAt(i - 1)
      if SubRewardItemWidget then
        SubRewardItemWidget:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
    self.Text_Total:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Total:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_Bag_Sell_View_C:RefreshRewardInfo()
  self.AllRewardContentList = {}
  
  local function FillWithRewardData(RewardId, Count)
    local RewardInfo = DataMgr.Reward[RewardId]
    if RewardInfo then
      local RewardObject = {}
      RewardObject.Id = RewardId
      RewardObject.Icon = RewardInfo.Icon
      RewardObject.ParentWidget = self
      RewardObject.ItemType = "Reward"
      RewardObject.Rarity = RewardInfo.Rarity or 0
      RewardObject.IsShowDetails = true
      RewardObject.UIName = BagCommon.BagStuffSelectUIName
      RewardObject.Count = Count
      table.insert(self.AllRewardContentList, RewardObject)
    end
  end
  
  local RewardIds = {}
  for k, v in pairs(self.AllTypeRewardsInfo) do
    if RewardIds[v] then
      RewardIds[v] = RewardIds[v] + 1
    else
      RewardIds[v] = 1
    end
  end
  for RewardId, RewardCount in pairs(RewardIds) do
    FillWithRewardData(RewardId, RewardCount)
  end
  local AllChildren = self.ItemBox:GetAllChildren()
  if #self.AllRewardContentList > 0 then
    for Index, v in ipairs(self.AllRewardContentList) do
      local Widget = self.ItemBox:GetChildAt(Index - 1)
      if not Widget then
        Widget = UIManager(self):_CreateWidgetNew("ComItemUniversalS")
        self.ItemBox:AddChild(Widget)
      end
      Widget:Init(v)
      Widget:SetVisibility(UE4.ESlateVisibility.Visible)
    end
    for idx = #self.AllRewardContentList + 1, AllChildren:Length() do
      local Widget = self.ItemBox:GetChildAt(idx - 1)
      if Widget then
        Widget:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
    self:SetNavigationRuleForRewardItem(#self.AllRewardContentList)
    self.Panel_Total:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.ItemBox_Overflow:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Text_Overflow:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Panel_Total:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Bag_Sell_View_C:SetNavigationRuleForRewardItem(TotalRewardTypeNum)
  if 1 == TotalRewardTypeNum then
    local CurRewardItemWidget = self.ItemBox:GetChildAt(0)
    CurRewardItemWidget:SetNavigatePosAngle(0)
    CurRewardItemWidget:SetNavigatePosOffsetPercent(UE4.FVector2D(0.5, -0.2))
    CurRewardItemWidget:SetNavigatePosOffsetAlignment(UE4.FVector2D(0.5, 0.5))
    CurRewardItemWidget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    CurRewardItemWidget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    CurRewardItemWidget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
    CurRewardItemWidget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  else
    for idx = 1, TotalRewardTypeNum do
      local CurRewardItemWidget = self.ItemBox:GetChildAt(idx - 1)
      local NextRewardItemWidget = self.ItemBox:GetChildAt(idx)
      local LastRewardItemWidget = self.ItemBox:GetChildAt(math.max(idx - 2, 0))
      CurRewardItemWidget:SetNavigatePosAngle(0)
      CurRewardItemWidget:SetNavigatePosOffsetPercent(UE4.FVector2D(0.5, -0.2))
      CurRewardItemWidget:SetNavigatePosOffsetAlignment(UE4.FVector2D(0.5, 0.5))
      CurRewardItemWidget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
      CurRewardItemWidget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
      if 1 == idx then
        CurRewardItemWidget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
        CurRewardItemWidget:SetNavigationRuleExplicit(EUINavigation.Right, NextRewardItemWidget)
      elseif idx == TotalRewardTypeNum then
        CurRewardItemWidget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
        CurRewardItemWidget:SetNavigationRuleExplicit(EUINavigation.Left, LastRewardItemWidget)
      else
        CurRewardItemWidget:SetNavigationRuleExplicit(EUINavigation.Left, LastRewardItemWidget)
        CurRewardItemWidget:SetNavigationRuleExplicit(EUINavigation.Right, NextRewardItemWidget)
      end
    end
  end
end

function WBP_Bag_Sell_View_C:IsCanChangeToGamePadViewMode()
  if self.CurFocusWidget == "DefaultWidget" then
    return true
  else
    local PlayerController = self:GetOwningPlayer()
    local AllChildren = self.ItemBox:GetAllChildren()
    for i = 1, AllChildren:Length() do
      local Widget = self.ItemBox:GetChildAt(i - 1)
      if Widget:HasUserFocus(PlayerController) then
        return false
      end
    end
    return true
  end
end

function WBP_Bag_Sell_View_C:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == CommonConst.CLIENT_DEVICE_TYPE.MOBILE then
  else
    local IsUseGamePad = CurInputType == ECommonInputType.Gamepad and self:IsCanChangeToGamePadViewMode()
    self:UpdateUIStyleInPlatform(IsUseGamePad)
    if IsUseGamePad then
      if self.CurSelectStuffContentInList then
        self.ParentWidget:RefreshBottomKeyInfo("ToSellListView")
      else
        self.ParentWidget:RefreshBottomKeyInfo()
      end
    end
  end
end

function WBP_Bag_Sell_View_C:GenerateAllRewardIds(RewardIds)
  local RewardType, RewardList = DataMgr.RewardType, {}
  for ItemType, _ in pairs(RewardType) do
    local Rewards = RewardIds[ItemType .. "s"]
    if Rewards then
      local RewardInfo = DataMgr[ItemType]
      for ItemId, ItemCount in pairs(Rewards) do
        local count = 0
        if type(ItemCount) == "table" then
          count = RewardBox:GetCount(ItemCount)
        end
        if type(ItemCount) == "number" then
          count = ItemCount
        end
        RewardList[ItemId] = {
          TableName = ItemType,
          ItemCount = count,
          Rarity = RewardInfo[ItemId].Rarity or RewardInfo[ItemId][ItemType .. "Rarity"]
        }
      end
    end
  end
  local RewardInfoList = {}
  for key, Value in pairs(RewardList) do
    table.insert(RewardInfoList, {ItemId = key, ItemInfo = Value})
  end
  table.sort(RewardInfoList, function(A, B)
    local RarityA = A.ItemInfo.Rarity or 1
    local RarityB = B.ItemInfo.Rarity or 1
    if RarityA > RarityB then
      return true
    elseif RarityA == RarityB then
      return A.ItemId < B.ItemId
    else
      return false
    end
  end)
  return RewardInfoList
end

function WBP_Bag_Sell_View_C:TryToSaleStuff()
  if self.CurStuffCountInList <= 0 then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_BAG_Nochosen"))
    return
  end
  local CommonDialogParams, bIsNeedShowWarning, PlayerAvatar, bIsNeedShowTips = {}, false, GWorld:GetAvatar(), false
  CommonDialogParams.StuffInfoList = {}
  for ItemUuid, ItemData in pairs(self.NeedDealWithStuffData) do
    local StuffServerData
    if ItemData.StuffType == BagCommon.StuffType.Mod then
      local ModItemUuid = self:GetStuffObjId(ItemUuid)
      StuffServerData = PlayerAvatar.Mods[ModItemUuid]
      if nil ~= StuffServerData then
        local StuffDataDict = StuffIconObject:GetModStuffData(StuffServerData, self)
        StuffDataDict.StuffCount = self.NeedDealWithStuffCount[ModItemUuid]
        table.insert(CommonDialogParams.StuffInfoList, StuffDataDict)
      end
    else
      StuffServerData = PlayerAvatar.Resources[ItemData.UnitId]
      if nil ~= StuffServerData then
        local StuffDataDict = StuffIconObject:GetItemStuffData(StuffServerData, self)
        StuffDataDict.StuffCount = self.NeedDealWithStuffCount[ItemUuid]
        table.insert(CommonDialogParams.StuffInfoList, StuffDataDict)
      end
    end
    if not bIsNeedShowWarning and ItemData.StuffType == BagCommon.StuffType.Mod then
      local ModItemNum = math.floor(self.NeedDealWithStuffCount[self:GetStuffObjId(ItemUuid)] + 0.5)
      if nil ~= StuffServerData and (StuffServerData.WeaponUuids:Length() > 0 or StuffServerData.CharUuids:Length() > 0) and StuffServerData.Count > 0 and ModItemNum >= StuffServerData.Count then
        bIsNeedShowWarning = true
        bIsNeedShowTips = true
      end
    end
  end
  if self.ParentWidget and self.ParentWidget.CurTabId == BagCommon.ItemTypeToTabId.Mod then
    CommonDialogParams.LeftText = GText("UI_Bag_ModExtract_Ready")
    CommonDialogParams.RightText = GText("UI_Bag_ModExtract_Get")
    local LimitedCoinNum, CurCoinNumDaily = self:GetCoin3DataInfo()
    if LimitedCoinNum <= CurCoinNumDaily then
      bIsNeedShowTips = true
      CommonDialogParams.IsShowEmptyText = true
      CommonDialogParams.Tips = {
        GText("UI_Bag_ModExtract_Delete")
      }
    end
  else
    CommonDialogParams.LeftText = GText("UI_Bag_Sell_Waiting")
    CommonDialogParams.RightText = GText("UI_Bag_Sell_Get")
  end
  CommonDialogParams.RewardList = {}
  for k, v in pairs(self.AllTypeCoinInfo) do
    if v > 0 then
      local ValueCount = 0
      if k == CommonConst.Coins.Coin3 then
        local LimitedCoinNum, CurCoinNumDaily = self:GetCoin3DataInfo()
        if LimitedCoinNum < CurCoinNumDaily + v and not CommonDialogParams.IsShowEmptyText then
          bIsNeedShowTips = true
          CommonDialogParams.Tips = {
            GText("UI_Bag_ModExtract_Warning")
          }
        end
        ValueCount = math.min(math.floor(v + 0.5), math.floor(LimitedCoinNum - CurCoinNumDaily + 0.5))
      else
        ValueCount = math.floor(v + 0.5)
      end
      local RewardInfo = DataMgr.Resource[k]
      local RewardObject = {}
      RewardObject.StuffId = k
      RewardObject.StuffIcon = ItemUtils.GetItemIconPath(k, BagCommon.StuffType.Resource)
      RewardObject.ParentWidget = self
      RewardObject.StuffType = BagCommon.StuffType.Resource
      RewardObject.Rarity = RewardInfo.Rarity or 1
      RewardObject.IsShowDetails = true
      RewardObject.UIName = BagCommon.BagStuffSelectUIName
      RewardObject.Count = ValueCount
      table.insert(CommonDialogParams.RewardList, RewardObject)
    end
  end
  if bIsNeedShowTips then
    CommonDialogParams.bHideDialogItem = false
    CommonDialogParams.DialogItemIndex = nil
  else
    CommonDialogParams.bHideDialogItem = true
    CommonDialogParams.DialogItemIndex = 1
  end
  
  function CommonDialogParams.RightCallbackFunction()
    self:ConfirmDealWithItems()
  end
  
  local LastStuffTimeStamp = EMCache:Get(BagCommon.LastStuffSellTimeStamp, true)
  if LastStuffTimeStamp and LastStuffTimeStamp > TimeUtils.TimestampLastClock(0) then
    UIManager(self):ShowCommonPopupUI(100164, CommonDialogParams, self)
  else
    local ConfirmParams = {}
    if bIsNeedShowWarning then
      ConfirmParams.ShortText = GText("UI_COMMONPOP_TEXT_100038")
    end
    if ConfirmParams.ShortText then
      function ConfirmParams.RightCallbackFunction(_, Data)
        self:UpdatePopupSelectedInfo(Data, BagCommon.LastStuffSellTimeStamp)
        
        UIManager(self):ShowCommonPopupUI(100164, CommonDialogParams, self)
      end
      
      UIManager(self):ShowCommonPopupUI(100165, ConfirmParams, self)
    else
      UIManager(self):ShowCommonPopupUI(100164, CommonDialogParams, self)
    end
  end
end

function WBP_Bag_Sell_View_C:TryToResolveStuff()
  if self.CurStuffCountInList <= 0 then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_BAG_Nochosen"))
    return
  end
  local CommonDialogParams, bShowPhantomWarning, bShowGrowUpWarning, PlayerAvatar = {}, false, false, GWorld:GetAvatar()
  CommonDialogParams.StuffInfoList = {}
  for ItemUuid, ItemData in pairs(self.NeedDealWithStuffData) do
    local WeaponUuid = self:GetStuffObjId(ItemUuid)
    local StuffServerData = PlayerAvatar.Weapons[WeaponUuid]
    if StuffServerData then
      local AssisterId = StuffServerData.AssisterId
      if AssisterId and 0 ~= AssisterId then
        bShowPhantomWarning = true
      end
      if StuffServerData.Level > 1 or StuffServerData.GradeLevel > 0 then
        bShowGrowUpWarning = true
      end
    end
    local WeaponData = StuffIconObject:GetWeaponStuffData(StuffServerData, self)
    table.insert(CommonDialogParams.StuffInfoList, WeaponData)
  end
  
  local function CheckWeaponInSquadPresets()
    if not PlayerAvatar or not PlayerAvatar.Squad then
      return false
    end
    local SquadWeaponUuids = {}
    for _, Squad in pairs(PlayerAvatar.Squad) do
      if Squad.Props then
        if Squad.Props.MeleeWeapon and Squad.Props.MeleeWeapon ~= "" then
          SquadWeaponUuids[Squad.Props.MeleeWeapon] = true
        end
        if Squad.Props.RangedWeapon and "" ~= Squad.Props.RangedWeapon then
          SquadWeaponUuids[Squad.Props.RangedWeapon] = true
        end
        if Squad.Props.PhantomWeapon1 and "" ~= Squad.Props.PhantomWeapon1 then
          SquadWeaponUuids[Squad.Props.PhantomWeapon1] = true
        end
        if Squad.Props.PhantomWeapon2 and "" ~= Squad.Props.PhantomWeapon2 then
          SquadWeaponUuids[Squad.Props.PhantomWeapon2] = true
        end
      end
    end
    for ItemUuid, ItemData in pairs(self.NeedDealWithStuffData) do
      local WeaponUuid = self:GetStuffObjId(ItemUuid)
      if SquadWeaponUuids[WeaponUuid] then
        return true
      end
    end
    return false
  end
  
  local function ShowCommonDialogFunction()
    CommonDialogParams.LeftText = GText("UI_Bag_Decompose_Waiting")
    CommonDialogParams.RightText = GText("UI_Bag_Decompose_Get")
    CommonDialogParams.RewardList = {}
    for Index, v in ipairs(self.AllRewardContentList) do
      local RewardData = {}
      RewardData.StuffId = v.Id
      RewardData.StuffIcon = v.Icon
      RewardData.StuffType = v.ItemType
      RewardData.Rarity = v.Rarity
      RewardData.Count = v.Count
      RewardData.ParentWidget = self
      table.insert(CommonDialogParams.RewardList, RewardData)
    end
    
    function CommonDialogParams.RightCallbackFunction()
      self:ConfirmDealWithItems()
    end
    
    local LastWeaponTimeStamp = EMCache:Get(BagCommon.LastWeaponResolveTimeStamp, true)
    if LastWeaponTimeStamp and LastWeaponTimeStamp > TimeUtils.TimestampLastClock(0) then
      UIManager(self):ShowCommonPopupUI(100063, CommonDialogParams, self)
    else
      local ConfirmParams = {}
      if bShowPhantomWarning and bShowGrowUpWarning then
        ConfirmParams.ShortText = GText("UI_Bag_Decompose_Tip_4")
      elseif bShowGrowUpWarning then
        ConfirmParams.ShortText = GText("UI_Bag_Decompose_Tip_2")
      elseif bShowPhantomWarning then
        ConfirmParams.ShortText = GText("UI_Bag_Decompose_Tip_3")
      end
      if ConfirmParams.ShortText then
        function ConfirmParams.RightCallbackFunction(_, Data)
          self:UpdatePopupSelectedInfo(Data, BagCommon.LastWeaponResolveTimeStamp)
          
          UIManager(self):ShowCommonPopupUI(100063, CommonDialogParams, self)
        end
        
        UIManager(self):ShowCommonPopupUI(100064, ConfirmParams, self)
      else
        UIManager(self):ShowCommonPopupUI(100063, CommonDialogParams, self)
      end
    end
  end
  
  local ShowSecondConfirm = false
  ShowSecondConfirm = CheckWeaponInSquadPresets()
  if ShowSecondConfirm then
    local SecondConfirmParams = {}
    SecondConfirmParams.ShortText = GText(DataMgr.CommonPopupUIContext[100246].PopoverText)
    SecondConfirmParams.RightCallbackFunction = ShowCommonDialogFunction
    UIManager(self):ShowCommonPopupUI(100246, SecondConfirmParams, self)
  else
    ShowCommonDialogFunction()
  end
end

function WBP_Bag_Sell_View_C:GetStuffObjId(StuffUuid)
  local FinalObjId = StuffUuid
  if type(FinalObjId) == "string" and CommonUtils.IsObjIdStr(FinalObjId) then
    FinalObjId = CommonUtils.Str2ObjId(FinalObjId)
  end
  return FinalObjId
end

function WBP_Bag_Sell_View_C:ConfirmDealWithItems()
  if self.ConfirmCallback ~= nil then
    self.ConfirmCallback(self.ParentWidget, self.NeedDealWithStuffData, self.NeedDealWithStuffCount)
  end
  if self.ParentWidget then
    if type(self.ParentWidget.SetFocus_Lua) == "function" then
      self.ParentWidget:SetFocus_Lua()
    else
      self.ParentWidget:SetFocus()
    end
  end
end

function WBP_Bag_Sell_View_C:UpdatePopupSelectedInfo(Data, CacheKey)
  local IsSelected = Data.SelectHint.IsSelected
  if IsSelected then
    local NowTime = TimeUtils.NowTime()
    EMCache:Set(CacheKey, NowTime, true)
  end
end

function WBP_Bag_Sell_View_C:OnClickToMinusStuff(NewValue, OldValue)
  if self.CurSelectStuffContentInList == nil then
    return
  end
  local StuffCoinId = self.CurSelectStuffContentInList.CoinId
  if nil ~= self.AllTypeCoinInfo[StuffCoinId] then
    self.AllTypeCoinInfo[StuffCoinId] = self.AllTypeCoinInfo[StuffCoinId] - self.NeedDealWithStuffData[self.CurSelectStuffContentInList.Uuid].Price
  end
  self:RefreshCoinInfo(StuffCoinId)
  self:OnUpdateCurSelectItemSaleInfo(NewValue)
end

function WBP_Bag_Sell_View_C:OnClickToAddStuff(NewValue, OldValue)
  if self.CurSelectStuffContentInList == nil then
    return
  end
  local StuffCoinId = self.CurSelectStuffContentInList.CoinId
  if nil ~= self.AllTypeCoinInfo[StuffCoinId] then
    self.AllTypeCoinInfo[StuffCoinId] = self.AllTypeCoinInfo[StuffCoinId] + self.NeedDealWithStuffData[self.CurSelectStuffContentInList.Uuid].Price
  else
    self.AllTypeCoinInfo[StuffCoinId] = self.NeedDealWithStuffData[self.CurSelectStuffContentInList.Uuid].Price
  end
  self:RefreshCoinInfo(StuffCoinId)
  self:OnUpdateCurSelectItemSaleInfo(NewValue)
end

function WBP_Bag_Sell_View_C:OnClickToMaxStuff(NewValue, OldValue)
  if self.CurSelectStuffContentInList == nil then
    return
  end
  local StuffCoinId = self.CurSelectStuffContentInList.CoinId
  if nil ~= self.AllTypeCoinInfo[StuffCoinId] then
    self.AllTypeCoinInfo[StuffCoinId] = self.AllTypeCoinInfo[StuffCoinId] + self.NeedDealWithStuffData[self.CurSelectStuffContentInList.Uuid].Price * math.max(0, NewValue - OldValue)
  else
    self.AllTypeCoinInfo[StuffCoinId] = self.NeedDealWithStuffData[self.CurSelectStuffContentInList.Uuid].Price * math.max(0, NewValue - OldValue)
  end
  self:RefreshCoinInfo(StuffCoinId)
  self:OnUpdateCurSelectItemSaleInfo(NewValue)
end

function WBP_Bag_Sell_View_C:OnClickToMinStuff(NewValue, OldValue)
  if self.CurSelectStuffContentInList == nil then
    return
  end
  local StuffCoinId = self.CurSelectStuffContentInList.CoinId
  if nil ~= self.AllTypeCoinInfo[StuffCoinId] then
    self.AllTypeCoinInfo[StuffCoinId] = self.AllTypeCoinInfo[StuffCoinId] - self.NeedDealWithStuffData[self.CurSelectStuffContentInList.Uuid].Price * math.max(0, OldValue - NewValue)
  end
  self:RefreshCoinInfo(StuffCoinId)
  self:OnUpdateCurSelectItemSaleInfo(NewValue)
end

function WBP_Bag_Sell_View_C:OnInputStuffNum(NewValue, OldValue)
  if self.CurSelectStuffContentInList == nil then
    return
  end
  local StuffCoinId = self.CurSelectStuffContentInList.CoinId
  if nil ~= self.AllTypeCoinInfo[StuffCoinId] then
    self.AllTypeCoinInfo[StuffCoinId] = math.max(0, self.AllTypeCoinInfo[StuffCoinId] + self.NeedDealWithStuffData[self.CurSelectStuffContentInList.Uuid].Price * (NewValue - OldValue))
  else
    self.AllTypeCoinInfo[StuffCoinId] = math.max(0, self.NeedDealWithStuffData[self.CurSelectStuffContentInList.Uuid].Price * (NewValue - OldValue))
  end
  self:RefreshCoinInfo(StuffCoinId)
  self:OnUpdateCurSelectItemSaleInfo(NewValue, true)
  self:SetFocus_Lua()
end

function WBP_Bag_Sell_View_C:SliderChangeCallback(NewValue)
  if self.CurSelectStuffContentInList == nil then
    return
  end
  local OldValue = self.NeedDealWithStuffCount[self.CurSelectStuffContentInList.Uuid]
  local StuffCoinId = self.CurSelectStuffContentInList.CoinId
  if nil ~= self.AllTypeCoinInfo[StuffCoinId] then
    self.AllTypeCoinInfo[StuffCoinId] = self.AllTypeCoinInfo[StuffCoinId] + self.NeedDealWithStuffData[self.CurSelectStuffContentInList.Uuid].Price * (NewValue - OldValue)
  else
    self.AllTypeCoinInfo[StuffCoinId] = self.NeedDealWithStuffData[self.CurSelectStuffContentInList.Uuid].Price * (NewValue - OldValue)
  end
  self:RefreshCoinInfo(StuffCoinId)
  self:OnUpdateCurSelectItemSaleInfo(NewValue)
end

function WBP_Bag_Sell_View_C:OnUpdateCurSelectItemSaleInfo(SaleNum, bIsNeedRefreshSliderBar)
  if self.CurSelectStuffContentInList == nil then
    return
  end
  self.NeedDealWithStuffCount[self.CurSelectStuffContentInList.Uuid] = SaleNum
  if self.CurSelectStuffContentInList.StateTagInfo and self.CurSelectStuffContentInList.StateTagInfo.ExtraData then
    self.CurSelectStuffContentInList.StateTagInfo.ExtraData[1] = SaleNum
  end
  if self.CurSelectStuffContentInList.SelfWidget then
    self.CurSelectStuffContentInList.SelfWidget:SetSelectNum(Utils.FormatNumber(SaleNum, true))
  end
  self.Com_NumInput:RefreshCurInputNumber(SaleNum)
  if bIsNeedRefreshSliderBar then
    self.Com_Slider:RefreshCurInputNumber(SaleNum)
  end
  if self.ParentWidget then
    self.ParentWidget:OnRefreshSaleSelectNum(self.CurSelectStuffContentInList.Uuid, SaleNum)
  end
end

function WBP_Bag_Sell_View_C:ClickToOpenStuffList()
  if self:IsAnimationPlaying(self.OpenList) or self:IsAnimationPlaying(self.CloseList) then
    return
  end
  if self.bIsOpenList then
    local function PlayCloseAnimFinished()
      local ChooseItem = self.List_Item:BP_GetSelectedItem()
      
      if ChooseItem and ChooseItem.SelfWidget then
        ChooseItem.SelfWidget:SetSelected(false)
      end
      self.List_Item:BP_ClearSelection()
      self.List_Item:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Panel_Sell_List:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.bIsOpenList = false
      self.Com_NumInput:OverrideFocusToWidget(self.ParentWidget)
      if self.ParentWidget then
        self.ParentWidget:SetFocus_Lua()
      end
    end
    
    self:UnbindAllFromAnimationFinished(self.CloseList)
    self:BindToAnimationFinished(self.CloseList, {self, PlayCloseAnimFinished})
    self:PlayAnimationForward(self.CloseList)
    AudioManager(self):SetEventSoundParam(self, "ExpandStuffList", {ToEnd = 1})
  else
    local function PlayOpenAnimFinished()
      self.bIsOpenList = true
      
      local AllItemCount = self.List_Item:GetNumItems()
      for i = 0, AllItemCount - 1 do
        local ItemObj = self.List_Item:GetItemAt(i)
        if ItemObj and ItemObj.SelfWidget ~= nil then
          if 0 == i then
            ItemObj.SelfWidget:SetSelected(true)
            self:OnListSelectStuffClicked(ItemObj, "SelectFirstItem")
          end
          local NowSaleStuffCount = self.NeedDealWithStuffCount[ItemObj.Uuid] or 1
          ItemObj.SelfWidget:SetSelectNum(Utils.FormatNumber(NowSaleStuffCount, true))
        end
      end
      self.List_Item:SetFocus()
      self.Com_NumInput:OverrideFocusToWidget(self)
      self:UpdateCurFocusInfo("ToSellListView")
    end
    
    self:UnbindAllFromAnimationFinished(self.OpenList)
    self:BindToAnimationFinished(self.OpenList, {self, PlayOpenAnimFinished})
    self:PlayAnimationForward(self.OpenList)
    self.List_Item:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Panel_Sell_List:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    AudioManager(self):PlayUISound(self, "event:/ui/common/sub_panel_expand", "ExpandStuffList", nil)
  end
end

function WBP_Bag_Sell_View_C:AddBagItemToList(StuffData)
  if self.CurrentMode == BagCommon.BagItemSelectOpMode.ResolveMode then
    self:FillWithWeaponResolveData(StuffData)
    self:RefreshRewardInfo()
  else
    self:FillWithStuffSellData(StuffData)
    self:RefreshCoinInfo()
  end
  self.Num_Select:SetText(tostring(self.CurStuffCountInList))
  if 1 == self.CurStuffCountInList then
    if self.CurrentMode == BagCommon.BagItemSelectOpMode.SellMode then
      self.Panel_KeyCount:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    self.Button_Purchase:ForbidBtn(false)
    self.Panel_Empty:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self:RefreshKeyCount()
end

function WBP_Bag_Sell_View_C:MultiAddBagItemToList(StuffDataList)
  if self.CurrentMode == BagCommon.BagItemSelectOpMode.ResolveMode then
    self:FillWithWeaponResolveDataWithList(StuffDataList)
  else
    local AddTypeMode = "All"
    if self.ParentWidget then
      local bIsRetainChecked, _ = self.ParentWidget:GetStuffSaleCondition()
      if bIsRetainChecked then
        AddTypeMode = "ReserveOne"
      end
    end
    self:FillWithStuffSellDataWithList(StuffDataList, AddTypeMode)
  end
  self.Num_Select:SetText(tostring(self.CurStuffCountInList))
  if self.CurStuffCountInList >= 1 then
    if self.CurrentMode == BagCommon.BagItemSelectOpMode.SellMode then
      self.Panel_KeyCount:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    self.Button_Purchase:ForbidBtn(false)
    self.Panel_Empty:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self:RefreshKeyCount()
end

function WBP_Bag_Sell_View_C:FillWithStuffSellData(StuffData, AddTypeMode)
  StuffData.ParentWidget = self
  StuffData.GridIndex = self.CurStuffCountInList + 1
  local AddStuffCount
  if "All" == AddTypeMode then
    AddStuffCount = StuffData.StuffCount
  elseif "ReserveOne" == AddTypeMode then
    AddStuffCount = StuffData.StuffCount - 1
  else
    AddStuffCount = 1
  end
  StuffData.StateTagInfo = {
    Name = "InSelectList",
    ExtraData = {
      AddStuffCount,
      StuffData.StuffCount,
      StuffData.Price,
      StuffData.CoinId,
      self.RemoveBagItemInList
    }
  }
  StuffData.ClickCallback = self.OnListSelectStuffClicked
  local StuffObj = StuffIconObject:CreateBagItemContent(StuffData)
  self.NeedDealWithStuffData[StuffObj.Uuid] = StuffObj
  self.NeedDealWithStuffCount[StuffObj.Uuid] = AddStuffCount
  self.List_Item:AddItem(StuffObj)
  local SelectItemObj = self.List_Item:GetItemAt(self.CurStuffCountInList)
  self:OnListSelectStuffClicked(SelectItemObj, "AddNewItem")
  self.CurStuffCountInList = self.CurStuffCountInList + 1
  local AddStuffValue = StuffObj.Price * AddStuffCount
  local StuffCoinId = StuffObj.CoinId
  self.AllTypeCoinInfo[StuffCoinId] = (self.AllTypeCoinInfo[StuffCoinId] or 0) + AddStuffValue
end

function WBP_Bag_Sell_View_C:FillWithStuffSellDataWithList(StuffDataList, AddTypeMode)
  for index, StuffData in ipairs(StuffDataList) do
    self:FillWithStuffSellData(StuffData, AddTypeMode)
  end
  self:RefreshCoinInfo()
end

function WBP_Bag_Sell_View_C:FillWithWeaponResolveData(StuffData, bIsAllAddInList)
  StuffData.ParentWidget = self
  StuffData.GridIndex = self.CurStuffCountInList + 1
  local AddStuffCount = bIsAllAddInList and StuffData.StuffCount or 1
  StuffData.StateTagInfo = {
    Name = "InSelectList",
    ExtraData = {
      AddStuffCount,
      StuffData.StuffCount,
      StuffData.Price,
      StuffData.CoinId,
      self.RemoveBagItemInList
    }
  }
  StuffData.ClickCallback = self.OnListSelectStuffClicked
  local StuffObj = StuffIconObject:CreateBagItemContent(StuffData)
  self.NeedDealWithStuffData[StuffObj.Uuid] = StuffObj
  self.NeedDealWithStuffCount[StuffObj.Uuid] = 1
  self.List_Item:AddItem(StuffObj)
  local SelectItemObj = self.List_Item:GetItemAt(self.CurStuffCountInList)
  self:OnListSelectStuffClicked(SelectItemObj, "AddNewItem")
  self.CurStuffCountInList = self.CurStuffCountInList + 1
  self.AllTypeRewardsInfo[StuffObj.Uuid] = StuffObj.CoinId
end

function WBP_Bag_Sell_View_C:FillWithWeaponResolveDataWithList(StuffDataList, bIsAllAddInList)
  for index, StuffData in ipairs(StuffDataList) do
    self:FillWithWeaponResolveData(StuffData, bIsAllAddInList)
  end
  self:RefreshRewardInfo()
end

function WBP_Bag_Sell_View_C:RemoveBagItemInList(StuffUuid)
  local StuffContent = self.NeedDealWithStuffData[StuffUuid]
  if nil ~= StuffContent then
    if self.CurrentMode == BagCommon.BagItemSelectOpMode.ResolveMode then
      local IsRemoveSelectedItem = self:RemoveFromResolveList(StuffContent)
      self:RefreshRewardInfo()
      self:AfterRemoveItemFromList(StuffContent, IsRemoveSelectedItem)
    else
      local IsRemoveSelectedItem = self:RemoveFromSellList(StuffContent)
      self:RefreshCoinInfo()
      self:AfterRemoveItemFromList(StuffContent, IsRemoveSelectedItem)
    end
  end
end

function WBP_Bag_Sell_View_C:MultiRemoveBagItemInList(StuffUuidList)
  local StuffContentList, IsNeedResetSelectItem = {}, false
  for index, StuffUuid in ipairs(StuffUuidList) do
    local StuffContent = self.NeedDealWithStuffData[StuffUuid]
    if nil ~= StuffContent then
      if self.CurrentMode == BagCommon.BagItemSelectOpMode.ResolveMode then
        local IsRemoveSelectedItem = self:RemoveFromResolveList(StuffContent)
        table.insert(StuffContentList, StuffContent)
        if IsRemoveSelectedItem then
          IsNeedResetSelectItem = IsRemoveSelectedItem
        end
      else
        local IsRemoveSelectedItem = self:RemoveFromSellList(StuffContent)
        table.insert(StuffContentList, StuffContent)
        if IsRemoveSelectedItem then
          IsNeedResetSelectItem = IsRemoveSelectedItem
        end
      end
    end
  end
  self:AfterMultiRemoveItemFromList(StuffContentList, IsNeedResetSelectItem)
  if self.CurrentMode == BagCommon.BagItemSelectOpMode.ResolveMode then
    self:RefreshRewardInfo()
  else
    self:RefreshCoinInfo()
  end
end

function WBP_Bag_Sell_View_C:RemoveFromResolveList(StuffContent)
  local NeedRemoveStuffContent
  local AllItemCount = self.List_Item:GetNumItems()
  for i = 0, AllItemCount - 1 do
    local ItemObj = self.List_Item:GetItemAt(i)
    if ItemObj and ItemObj.Uuid == StuffContent.Uuid then
      NeedRemoveStuffContent = ItemObj
      break
    end
  end
  if nil == NeedRemoveStuffContent then
    DebugPrint("WBP_Bag_Sell_View_C=RemoveFromResolveList Error, StuffUuid is ", StuffContent.Uuid)
    return false
  end
  local IsRemoveSelectedItem = NeedRemoveStuffContent.IsSelect
  self.List_Item:RemoveItem(NeedRemoveStuffContent)
  self.CurStuffCountInList = math.max(self.CurStuffCountInList - 1, 0)
  self.NeedDealWithStuffData[StuffContent.Uuid] = nil
  self.AllTypeRewardsInfo[StuffContent.Uuid] = nil
  return IsRemoveSelectedItem
end

function WBP_Bag_Sell_View_C:RemoveFromSellList(StuffContent)
  local NeedRemoveStuffContent
  local AllItemCount = self.List_Item:GetNumItems()
  for i = 0, AllItemCount - 1 do
    local ItemObj = self.List_Item:GetItemAt(i)
    if ItemObj and ItemObj.Uuid == StuffContent.Uuid then
      NeedRemoveStuffContent = ItemObj
      break
    end
  end
  if nil == NeedRemoveStuffContent then
    DebugPrint("WBP_Bag_Sell_View_C=RemoveFromSellList Error, StuffUuid is ", StuffContent.Uuid)
    return false
  end
  local StuffCoinId = NeedRemoveStuffContent.CoinId
  local IsRemoveSelectedItem = NeedRemoveStuffContent.IsSelect
  self.List_Item:RemoveItem(NeedRemoveStuffContent)
  self.CurStuffCountInList = math.max(self.CurStuffCountInList - 1, 0)
  self.NeedDealWithStuffData[StuffContent.Uuid] = nil
  if nil ~= self.AllTypeCoinInfo[StuffCoinId] then
    self.AllTypeCoinInfo[StuffCoinId] = self.AllTypeCoinInfo[StuffCoinId] - StuffContent.Price * self.NeedDealWithStuffCount[StuffContent.Uuid]
  end
  return IsRemoveSelectedItem
end

function WBP_Bag_Sell_View_C:AfterRemoveItemFromList(StuffContent, IsRemoveSelectedItem)
  self.NeedDealWithStuffCount[StuffContent.Uuid] = nil
  self.Num_Select:SetText(tostring(math.max(self.CurStuffCountInList, 0)))
  if self.CurStuffCountInList <= 0 then
    self.CurSelectGridIndex = nil
    self.CurSelectStuffContentInList = nil
    self.Panel_Empty:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Total:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Button_Purchase:ForbidBtn(true)
    if self.CurrentMode == BagCommon.BagItemSelectOpMode.SellMode then
      self.Panel_KeyCount:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
      self:SetFocus_Lua()
    end
  elseif IsRemoveSelectedItem then
    self:RefreshAllGridIndex()
    self.List_Item:SetSelectedIndex(0)
    local SelectItemObj = self.List_Item:GetItemAt(0)
    self:OnListSelectStuffClicked(SelectItemObj, "SelectFirstItem")
    if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad and SelectItemObj and SelectItemObj.SelfWidget then
      SelectItemObj.SelfWidget:SetFocus()
    end
  end
  if type(self.RemoveCallback) == "function" then
    self.RemoveCallback(self.ParentWidget, StuffContent.Uuid)
  end
end

function WBP_Bag_Sell_View_C:AfterMultiRemoveItemFromList(StuffContentList, IsRemoveSelectedItem)
  for index, StuffContent in ipairs(StuffContentList) do
    self.NeedDealWithStuffCount[StuffContent.Uuid] = nil
    if type(self.RemoveCallback) == "function" then
      self.RemoveCallback(self.ParentWidget, StuffContent.Uuid)
    end
  end
  self.Num_Select:SetText(tostring(math.max(self.CurStuffCountInList, 0)))
  if self.CurStuffCountInList <= 0 then
    self.CurSelectGridIndex = nil
    self.CurSelectStuffContentInList = nil
    self.Panel_Empty:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Total:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Button_Purchase:ForbidBtn(true)
    if self.CurrentMode == BagCommon.BagItemSelectOpMode.SellMode then
      self.Panel_KeyCount:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
      self:SetFocus_Lua()
    end
  elseif IsRemoveSelectedItem then
    self:RefreshAllGridIndex()
    self.List_Item:SetSelectedIndex(0)
    local SelectItemObj = self.List_Item:GetItemAt(0)
    self:OnListSelectStuffClicked(SelectItemObj, "SelectFirstItem")
    if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad and SelectItemObj and SelectItemObj.SelfWidget then
      SelectItemObj.SelfWidget:SetFocus()
    end
  end
end

function WBP_Bag_Sell_View_C:RefreshAllGridIndex()
  local AllItemCount = self.List_Item:GetNumItems()
  for i = 0, AllItemCount - 1 do
    local ItemObj = self.List_Item:GetItemAt(i)
    ItemObj.GridIndex = i + 1
  end
end

function WBP_Bag_Sell_View_C:UpdateItemInfoFromList(StuffContentList)
  for index, StuffContent in ipairs(StuffContentList) do
    local StuffCoinId = StuffContent.CoinId
    if self.AllTypeCoinInfo[StuffCoinId] ~= nil then
      self.AllTypeCoinInfo[StuffCoinId] = self.AllTypeCoinInfo[StuffCoinId] - self.NeedDealWithStuffData[StuffContent.Uuid].Price or StuffContent.Price
    end
    local SaleNum = StuffContent.Count - 1
    self.NeedDealWithStuffCount[StuffContent.Uuid] = SaleNum
    local StuffContentInList = self.NeedDealWithStuffData[StuffContent.Uuid]
    if StuffContentInList.StateTagInfo and StuffContentInList.StateTagInfo.ExtraData then
      StuffContentInList.StateTagInfo.ExtraData[1] = SaleNum
    end
    if StuffContentInList.SelfWidget then
      StuffContentInList.SelfWidget:SetSelectNum(Utils.FormatNumber(SaleNum, true), Utils.FormatNumber(StuffContent.Count, true))
    end
    if self.ParentWidget then
      self.ParentWidget:OnRefreshSaleSelectNum(StuffContent.Uuid, SaleNum)
    end
  end
  self:RefreshCoinInfo()
  if StuffContentList then
    local FirstItemInList = StuffContentList[1]
    self.Com_Slider:RefreshCurInputNumber(self.NeedDealWithStuffCount[FirstItemInList.Uuid])
    self.Com_NumInput:RefreshCurInputNumber(self.NeedDealWithStuffCount[FirstItemInList.Uuid])
  end
end

function WBP_Bag_Sell_View_C:UpdateItemNumFromList(StuffContent, DeltaNum)
  local StuffCoinId = StuffContent.CoinId
  if self.AllTypeCoinInfo[StuffCoinId] ~= nil and DeltaNum > 0 then
    if self.NeedDealWithStuffData[StuffContent.Uuid].Price then
      self.AllTypeCoinInfo[StuffCoinId] = self.AllTypeCoinInfo[StuffCoinId] + StuffContent.AddNum * self.NeedDealWithStuffData[StuffContent.Uuid].Price
    else
      self.AllTypeCoinInfo[StuffCoinId] = self.AllTypeCoinInfo[StuffCoinId] + StuffContent.AddNum * StuffContent.Price
    end
  end
  local SaleNum = StuffContent.StateTagInfo.ExtraData[1]
  self.NeedDealWithStuffCount[StuffContent.Uuid] = SaleNum
  local StuffContentInList = self.NeedDealWithStuffData[StuffContent.Uuid]
  if StuffContentInList.StateTagInfo and StuffContentInList.StateTagInfo.ExtraData then
    StuffContentInList.StateTagInfo.ExtraData[1] = SaleNum
  end
  if StuffContentInList.SelfWidget then
    StuffContentInList.SelfWidget:SetSelectNum(Utils.FormatNumber(SaleNum, true))
  end
  if self.ParentWidget then
    self.ParentWidget:OnRefreshSaleSelectNum(StuffContent.Uuid, SaleNum)
  end
  self:OnListSelectStuffClicked(StuffContentInList, "UpdateItemNum")
  self:RefreshCoinInfo()
  self.Com_NumInput:RefreshCurInputNumber(SaleNum)
  self.Com_Slider:RefreshCurInputNumber(SaleNum)
end

function WBP_Bag_Sell_View_C:OnListSelectStuffClicked(Content, ClickReason)
  local GridIndex, StuffUuid = Content.GridIndex, Content.Uuid
  if IsValid(self.CurSelectStuffContentInList) and self.CurSelectStuffContentInList.Uuid == StuffUuid then
    self:RefreshKeyCount()
    return
  end
  if IsValid(self.CurSelectStuffContentInList) then
    if self.CurSelectStuffContentInList.SelfWidget then
      self.CurSelectStuffContentInList.SelfWidget:SetSelected(false)
    else
      self.CurSelectStuffContentInList.IsSelect = false
    end
  end
  self.CurSelectStuffContentInList = Content
  self:ClickChooseStuff(GridIndex, StuffUuid)
end

function WBP_Bag_Sell_View_C:ClickChooseStuff(GridIndex, StuffUuid)
  self.CurSelectGridIndex = GridIndex
  self:RefreshKeyCount()
  if IsValid(self.CurSelectStuffContentInList) then
    if self.CurSelectStuffContentInList.SelfWidget then
      self.CurSelectStuffContentInList.SelfWidget:SetSelected(true)
    else
      self.CurSelectStuffContentInList.IsSelect = true
    end
  end
end

function WBP_Bag_Sell_View_C:OnSelectStuffItemChanged(SelectItem, bIsSelect)
  if not SelectItem then
    return
  end
  if self.bIsOpenList and self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self:OnListSelectStuffClicked(SelectItem, "ChangeHoverInGamepad")
  end
end

function WBP_Bag_Sell_View_C:RefreshKeyCount()
  if self.CurSelectStuffContentInList then
    local InitDealWithStuffCount = self.NeedDealWithStuffCount[self.CurSelectStuffContentInList.Uuid]
    local MaxDealWithStuffCount = self.NeedDealWithStuffData[self.CurSelectStuffContentInList.Uuid].Count
    self.Com_NumInput:OverrideValueLimit(InitDealWithStuffCount, MaxDealWithStuffCount, 1, true)
    self.Com_Slider:OverrideValueLimit(InitDealWithStuffCount, MaxDealWithStuffCount, 1, true)
  end
end

function WBP_Bag_Sell_View_C:UpdateUIStyleInPlatform(IsUseGamePad)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == CommonConst.CLIENT_DEVICE_TYPE.MOBILE then
    return
  end
  local ActiveWidgetIndex = IsUseGamePad and 1 or 0
  if IsUseGamePad then
    self.Key_Check:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Key_View:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Key_Check:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_View:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_Bag_Sell_View_C:UpdateCurFocusInfo(NewFocusName)
  self.CurFocusWidget = NewFocusName
end

function WBP_Bag_Sell_View_C:SetFocus_Lua()
  if self.bIsOpenList then
    self.List_Item:SetFocus()
    self:UpdateCurFocusInfo("ToSellListView")
  elseif self.ParentWidget then
    self:UpdateCurFocusInfo("DefaultWidget")
    if self.ParentWidget.SetFocus_Lua then
      self.ParentWidget:SetFocus_Lua()
    else
      self.ParentWidget:SetFocus()
    end
  end
end

function WBP_Bag_Sell_View_C:GetGetDesiredFocusTarget_Lua()
  local DesiredFocusTarget
  if self.bIsOpenList then
    DesiredFocusTarget = self.List_Item
  end
  return DesiredFocusTarget
end

function WBP_Bag_Sell_View_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadButtonDown(InKeyName)
  elseif InKeyName == UE4.EKeys.Escape.KeyName then
    self:PlayOutAnim()
    IsEventHandled = true
  elseif InKeyName == UE4.EKeys.Q.KeyName then
    self.ParentWidget.Tab_Bag:TabToLeft()
    IsEventHandled = true
  elseif InKeyName == UE4.EKeys.E.KeyName then
    self.ParentWidget.Tab_Bag:TabToRight()
    IsEventHandled = true
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_Bag_Sell_View_C:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadButtonUp(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_Bag_Sell_View_C:OnGamePadButtonDown(InKeyName)
  local IsEventHandled = false
  if self.CurSelectStuffContentInList then
    IsEventHandled = self.Com_Slider:Handle_KeyDownEventOnGamePad(InKeyName)
    IsEventHandled = IsEventHandled or self.Com_NumInput:Handle_KeyEventOnGamePad(InKeyName)
  end
  if not IsEventHandled then
    if InKeyName == UIConst.GamePadKey.FaceButtonRight then
      DebugPrint("OnGamePadButtonDown   ---  ", self.CurFocusWidget)
      if self.CurFocusWidget == "DefaultWidget" then
        self:PlayOutAnim()
        IsEventHandled = true
      elseif self.CurFocusWidget == "ToSellListView" then
        self.CurFocusWidget = "DefaultWidget"
        self:ClickToOpenStuffList()
        if self.ParentWidget then
          self.ParentWidget:RefreshBottomKeyInfo()
        end
        IsEventHandled = true
      elseif self.CurFocusWidget == "GetItemBox" then
        self.CurFocusWidget = "DefaultWidget"
        self:SetFocus_Lua()
        if self.ParentWidget then
          self.ParentWidget:RefreshBottomKeyInfo()
        end
        IsEventHandled = true
      elseif self.Com_NumInput:CheckIsFocusInTextInput() then
        if self.bIsOpenList then
          self.CurFocusWidget = "ToSellListView"
          self.List_Item:SetFocus()
        else
          self.CurFocusWidget = "DefaultWidget"
          if self.ParentWidget then
            if self.ParentWidget.SetFocus_Lua then
              self.ParentWidget:SetFocus_Lua()
            else
              self.ParentWidget:SetFocus()
            end
          end
        end
        IsEventHandled = true
      else
        self.CurFocusWidget = "DefaultWidget"
        self:UpdateUIStyleInPlatform(true)
        if self.ParentWidget then
          self.ParentWidget:RefreshBottomKeyInfo()
          self.ParentWidget:UpdateUIStyleInPlatform(true)
          if self.ParentWidget.SetFocus_Lua then
            self.ParentWidget:SetFocus_Lua()
          else
            self.ParentWidget:SetFocus()
          end
        end
        IsEventHandled = true
      end
    elseif InKeyName == UIConst.GamePadKey.RightThumb then
      self.CurFocusWidget = "GetItemBox"
      local Widget = self.ItemBox:GetChildAt(0)
      if Widget then
        Widget:SetFocus()
        self:UpdateUIStyleInPlatform(false)
        if self.ParentWidget then
          self.ParentWidget:RefreshBottomKeyInfo("GetItemBox")
          self.ParentWidget:UpdateUIStyleInPlatform(false)
        end
      end
    elseif InKeyName == UIConst.GamePadKey.SpecialRight then
      if self.CurFocusWidget ~= "GetItemBox" and self.CurFocusWidget ~= "NumInputEdit" then
        if self.bIsOpenList then
          self.CurFocusWidget = "DefaultWidget"
        else
          self.CurFocusWidget = "ToSellListView"
        end
        self:ClickToOpenStuffList()
        if self.ParentWidget then
          self.ParentWidget:RefreshBottomKeyInfo(self.CurFocusWidget)
        end
      end
    elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
      if not self.Com_NumInput:CheckIsFocusInTextInput() then
        if self.CurrentMode == BagCommon.BagItemSelectOpMode.ResolveMode then
          self:TryToResolveStuff()
        else
          self:TryToSaleStuff()
        end
      end
    elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft and (self.BagCurState == BagCommon.AllBagState.ChooseSaleState or BagCommon.AllBagState.WeaponResolveState) and self.CurSelectStuffContentInList and self.CurSelectStuffContentInList.bMinus then
      self:RemoveBagItemInList(self.CurSelectStuffContentInList.Uuid)
      if self.CurSelectStuffContentInList then
        self.ParentWidget:RefreshBottomKeyInfo("ToSellListView")
      else
        self.ParentWidget:RefreshBottomKeyInfo()
      end
    end
  end
  return IsEventHandled
end

function WBP_Bag_Sell_View_C:OnGamePadButtonUp(InKeyName)
  local IsEventHandled = false
  if self.CurSelectStuffContentInList then
    IsEventHandled = self.Com_Slider:Handle_KeyUpEventOnGamePad(InKeyName)
  end
  return IsEventHandled
end

function WBP_Bag_Sell_View_C:TryToHoverToItemOnNavigation(SelectItem)
  local ToHoverStuffData = self.NeedDealWithStuffData[SelectItem.Uuid]
  if ToHoverStuffData then
    if IsValid(self.CurSelectStuffContentInList) then
      if self.CurSelectStuffContentInList.SelfWidget then
        self.CurSelectStuffContentInList.SelfWidget:SetSelected(false)
      else
        self.CurSelectStuffContentInList.IsSelect = false
      end
    end
    local AllItemCount = self.List_Item:GetNumItems()
    local GridIndex = 0
    for i = 0, AllItemCount - 1 do
      local ItemObj = self.List_Item:GetItemAt(i)
      if ItemObj.Uuid == ToHoverStuffData.Uuid then
        self.CurSelectStuffContentInList = ItemObj
        GridIndex = i
        break
      end
    end
    self:ClickChooseStuff(GridIndex, ToHoverStuffData.Uuid)
  else
  end
end

function WBP_Bag_Sell_View_C:Close()
  if type(self.CloseCallback) == "function" then
    self.CloseCallback(self.ParentWidget)
  end
  self.List_Item:ClearListItems()
  self.Super.Close(self)
end

return WBP_Bag_Sell_View_C
