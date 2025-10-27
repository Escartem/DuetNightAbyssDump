require("UnLua")
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.Btn_FullClose.OnClicked:Add(self, self.CloseSelf)
  self.Btn_Cancel:BindEventOnClicked(self, self.CloseSelf)
  self.Btn_Cancel:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_cancel", nil, nil)
  end)
  self.Btn_Confirm:BindEventOnClicked(self, self.PurChaseShopItem)
  self.Btn_Confirm:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/activity/shop_small_btn_click", nil, nil)
  end)
  self.Btn_Confirm:BindForbidStateExecuteEvent(self, self.PurChaseShopItem)
  self.Text_Qa:SetText(GText("UI_GACHA_DESDETAIL"))
  self.Btn_Confirm:SetText(GText("UI_SHOP_PURCHASE"))
  self.Btn_Confirm:SetGamePadImg("A")
  self.Btn_Confirm.Text_ValueSign:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Btn_Cancel:SetText(GText("UI_PATCH_CANCEL"))
  self.Btn_Cancel:SetGamePadImg("B")
  self.Text_Tip:SetText(GText("UI_TRAIN_CLOSE"))
  self.Text_BuyLeftTitle:SetText(GText("UI_SHOP_SHOPITEMLIMIT"))
  self:InitGamePadKeyInfo()
  self.List_Item.OnCreateEmptyContent:Bind(self, function(self)
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Conf = nil
    Content.IsSelected = false
    Content.Parent = self
    return Content
  end)
end

function M:Destruct()
  self.Btn_Cancel:UnBindEventOnClickedByObj(self)
  self.Btn_Confirm:UnBindEventOnClickedByObj(self)
  self.Super.Destruct(self)
end

function M:OnLoaded(...)
  M.Super.OnLoaded(self)
  self.ShopItemData, self.ParentWidget = ...
  self:SetFocus()
  self:BlockAllUIInput(true)
  local Icon = ItemUtils.GetItemIcon(self.ShopItemData.TypeId, self.ShopItemData.ItemType)
  if Icon then
    self.Image_Icon:SetBrushFromTexture(Icon)
  end
  local ItemName = ItemUtils:GetDropName(self.ShopItemData.TypeId, self.ShopItemData.ItemType)
  if 1 == self.ShopItemData.Bg then
    self.Text_GiftTitle_Yellow:SetText(GText(ItemName))
  else
    self.Text_GiftTitle_Purple:SetText(GText(ItemName))
  end
  local ItemData = DataMgr[self.ShopItemData.ItemType][self.ShopItemData.TypeId]
  local Rewards = DataMgr.Reward[ItemData.RewardId]
  if Rewards then
    self.RewardList = {}
    local RewardIds = Rewards.Id
    local RewardCounts = Rewards.Count
    local RewardTypes = Rewards.Type
    for i = 1, #RewardIds do
      local ItemId = RewardIds[i]
      local Count = RewardUtils:GetCount(RewardCounts[i])
      local Icon = ItemUtils.GetItemIcon(ItemId, RewardTypes[i])
      local Rarity = ItemUtils.GetItemRarity(ItemId, RewardTypes[i])
      local ItemType = RewardTypes[i]
      local RewardContent = {
        Id = ItemId,
        Type = ItemType,
        ItemCount = Count,
        Icon = Icon,
        Rarity = Rarity
      }
      table.insert(self.RewardList, RewardContent)
    end
    self.List_Item:ClearListItems()
    for _, ItemInfo in pairs(self.RewardList) do
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.Id = ItemInfo.Id
      Content.Icon = ItemUtils.GetItemIconPath(ItemInfo.Id, ItemInfo.Type)
      Content.ParentWidget = self
      Content.ItemType = ItemInfo.Type
      Content.Count = ItemInfo.ItemCount
      Content.Rarity = ItemInfo.Rarity or 1
      Content.IsShowDetails = true
      Content.UIName = "ShopMain"
      Content.OnMenuOpenChangedEvents = {
        Obj = self,
        Callback = self.ItemMenuAnchorChanged
      }
      self.List_Item:AddItem(Content)
    end
  end
  self.List_Item:RequestFillEmptyContent()
  local PurchaseLimit = ShopUtils:GetShopItemPurchaseLimit(self.ShopItemData.ItemId)
  local TotalPurchaseLimit = self.ShopItemData.PurchaseLimit
  self.Text_BuyLeftTimes:SetText(PurchaseLimit .. "/" .. TotalPurchaseLimit)
  if DataMgr.ShopItem2PayGoods[self.ShopItemData.ItemId] then
    self.Btn_Confirm.WS_Sign:SetActiveWidgetIndex(1)
    self.Btn_Confirm.Text_ValueSign:SetText(GText(ShopUtils:GetCurrencyType()))
  else
    assert(ItemData.Icon, "\231\188\186\229\176\145Icon", self.ShopItemData.ItemType, self.ShopItemData.TypeId)
    self.Btn_Confirm.WS_Sign:SetActiveWidgetIndex(0)
    self.Btn_Confirm.Com_ItemIcon:Init({
      Id = self.ShopItemData.PriceType,
      Icon = LoadObject(DataMgr.Resource[self.ShopItemData.PriceType].Icon),
      ItemType = "Resource",
      UIName = "ShopMain",
      IsShowDetails = true,
      MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight
    })
  end
  local Cost = ShopUtils:GetShopItemPrice(self.ShopItemData.ItemId)
  self.Btn_Confirm.Text_Num:SetText(Cost)
  self.Btn_Confirm:ForbidBtn(false)
  if ShopUtils:CanPurchase(self.ShopItemData, self.ShopItemData.PriceType, ShopUtils:GetShopItemPrice(self.ShopItemData.ItemId)) then
    self.Btn_Confirm:ForbidBtn(false)
    self.bForbiddenPurchase = false
  else
    self.Btn_Confirm:ForbidBtn(true)
    self.bForbiddenPurchase = true
  end
  self.Btn_Confirm.Text_Num:SetColorAndOpacity(self.Btn_Confirm.NumTextNormalColor)
  if not DataMgr.ShopItem2PayGoods[self.ShopItemData.ItemId] then
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return
    end
    local HasCount = Avatar.Resources[self.ShopItemData.PriceType] and Avatar.Resources[self.ShopItemData.PriceType].Count or 0
    local NeedCount = ShopUtils:GetShopItemPrice(self.ShopItemData.ItemId)
    if HasCount < NeedCount then
      self.Btn_Confirm.Text_Num:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DA2A4A"))
    end
  end
  local CutoffData = ShopUtils:GetShopItemCutoffData(self.ShopItemData.ItemId)
  if CutoffData and CutoffData.CutoffEndTime then
    self.Panel_Time:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:UpdateCutOffTime(CutoffData.CutoffEndTime)
    self:AddTimer(1, self.UpdateCutOffTime, true, 0, "RefreshCutOffTimer", true, CutoffData.CutoffEndTime)
  elseif self.ShopItemData.StartTime and self.ShopItemData.EndTime then
    self.Panel_Time:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:UpdateLimitTime(self.ShopItemData.EndTime)
    self:AddTimer(1, self.UpdateLimitTime, true, 0, "RefreshEndTimer", true, self.ShopItemData.EndTime)
  else
    self.Panel_Time:SetVisibility(ESlateVisibility.Collapsed)
  end
  if self.ShopItemData.RefreshTime then
    self.Panel_RefreshTime:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:UpdateRefreshTime(self.ShopItemData.RefreshTime)
  else
    self.Panel_RefreshTime:SetVisibility(ESlateVisibility.Collapsed)
  end
  local ConfigData = {
    OwnerWidget = self,
    TextContent = GText(self.ShopItemData.ItemDes),
    OnMenuOpenChangedCallBack = self.OnDescOpenChanged
  }
  self.Btn_Qa:Init(ConfigData)
  if self.ShopItemData.ItemDes then
    self.Btn_Qa:SetVisibility(ESlateVisibility.Visible)
    self.Text_Qa:SetVisibility(ESlateVisibility.Visible)
  else
    self.Btn_Qa:SetVisibility(ESlateVisibility.Collapsed)
    self.Text_Qa:SetVisibility(ESlateVisibility.Collapsed)
  end
  if self.ShopItemData.ShowBonus then
    self.Group_More:SetVisibility(ESlateVisibility.Visible)
    self.Text_MoreNum:SetText("+" .. self.ShopItemData.ShowBonus)
  else
    self.Group_More:SetVisibility(ESlateVisibility.Collapsed)
  end
  local TopResource = {
    self.ShopItemData.PriceType
  }
  self.Com_Tab_ResourceBar:InitResourceBar(TopResource, false)
  self.Com_Tab_ResourceBar:BindEvents(self, {
    OnMenuOpenChanged = self.OnDescOpenChanged
  })
  self:UpdateGamePadKeyInfo()
  if PurchaseLimit > 0 then
    self:PlayAnimation(self.In)
  else
    self:PlayAnimation(self.In_SoldOut)
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/gift_pack_info_show", "GiftPopupIn", nil)
end

function M:List_In()
  self.List_Item:RequestPlayEntriesAnim()
end

function M:OnBtnDetailClick()
  if self.ShopItemData and self.ShopItemData.ItemDes then
    if not self.Btn_Qa:IsMenuAnchorOpen() then
      self.Btn_Qa:PlayClickSound()
      self.Btn_Qa.Btn_Click:SetChecked(true)
      self.Btn_Qa:OpenMenuAnchor()
    else
      self.Btn_Qa.Btn_Click:SetChecked(false)
      self.Btn_Qa:CloseMenuAnchor()
    end
  end
end

function M:UpdateRefreshTime(RefreshTime)
  ShopUtils:RefreshShopRefreshTime(RefreshTime, self.Text_RefreshTime)
  self:AddTimer(1, ShopUtils.RefreshShopRefreshTime, true, 0, "RefreshTimeTimer", true, RefreshTime, self.Text_RefreshTime)
end

function M:UpdateCutOffTime(CutoffTime)
  local EndTime = CutoffTime
  if EndTime <= TimeUtils.NowTime() then
    self:RemoveTimer("RefreshCutOffTimer")
    return
  end
  local RemainTimeStr = ShopUtils:UpdateLimitTime(EndTime)
  self.Text_Time:SetText(string.format(GText("UI_SHOP_REMAINTIME"), RemainTimeStr))
end

function M:UpdateLimitTime(ItemEndTime)
  local EndTime = ItemEndTime
  if EndTime <= TimeUtils.NowTime() then
    self:CleanTimer()
    EventManager:FireEvent(EventID.RefreshShop)
    return
  end
  local RemainTimeStr = ShopUtils:UpdateLimitTime(EndTime)
  self.Text_Time:SetText(string.format(GText("UI_SHOP_REMAINTIME"), RemainTimeStr))
end

function M:PurChaseShopItem()
  ShopUtils:CanPurchase(self.ShopItemData, self.ShopItemData.PriceType, ShopUtils:GetShopItemPrice(self.ShopItemData.ItemId))
  self:Purchase(self.ShopItemData, self)
end

function M:Purchase(ShopItemData, ParentWidget)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if DataMgr.ShopItem2PayGoods[ShopItemData.ItemId] then
    if 0 == ShopItemData.PurchaseFailRes then
      local Avatar = GWorld:GetAvatar()
      if not Avatar then
        return false
      end
      if not HeroUSDKSubsystem():IsHeroSDKEnable() then
        local GMFunctionLibrary = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
        GMFunctionLibrary.ExecConsoleCommand(GWorld.GameInstance, "sgm pgi " .. DataMgr.ShopItem2PayGoods[ShopItemData.ItemId])
        self:PlayAnimation(self.Out)
        return
      end
      Avatar:RequestPay(DataMgr.ShopItem2PayGoods[ShopItemData.ItemId], function(ret, OrderId, CallbackUrl)
        if not ErrorCode:Check(ret) then
          return
        end
        local PaymentParameters = FHeroUPaymentParameters()
        PaymentParameters.goodsId = DataMgr.ShopItem2PayGoods[ShopItemData.ItemId]
        PaymentParameters.cpOrder = OrderId
        PaymentParameters.callbackUrl = CallbackUrl
        local GameRoleInfo = HeroUSDKUtils.GenHeroHDCGameRoleInfo()
        HeroUSDKSubsystem():HeroSDKPay(PaymentParameters, GameRoleInfo)
        local TrackInfo = {}
        TrackInfo.product_id = DataMgr.ShopItem2PayGoods[ShopItemData.ItemId]
        if ShopItemData.ItemId then
          TrackInfo.item_id = ShopItemData.ItemId
          TrackInfo.product_type = DataMgr.ShopItem[ShopItemData.ItemId].ItemType
        end
        TrackInfo.game_order_id = OrderId
        TrackInfo.order_create_time = TimeUtils.NowTime()
        HeroUSDKSubsystem(self):UploadTrackLog_Lua("charge_client", TrackInfo)
        self:PlayAnimation(self.Out)
      end)
    else
      UIManager(self):ShowError(ErrorCode.RET_SHOPITEM_REMAIN_PURCHASE_TIMES_EQUAL_ZERO, 1.0, "CommonToastMain")
    end
    return
  end
  if 0 ~= ShopItemData.PurchaseFailRes then
    if 1 == ShopItemData.PurchaseFailRes then
      UIManager(GWorld.GameInstance):ShowError(ErrorCode.RET_SHOPITEM_REMAIN_PURCHASE_TIMES_EQUAL_ZERO, 1.0, "CommonToastMain")
      self:PlayAnimation(self.Out)
    elseif 2 == ShopItemData.PurchaseFailRes then
      UIManager(self):ShowUITip("CommonToastMain", string.format(GText("UI_Shop_Toast_No_Coin"), GText(DataMgr.Resource[ShopItemData.PriceType].ResourceName)), 1.0)
      self:PlayAnimation(self.Out)
    elseif 3 == ShopItemData.PurchaseFailRes then
      UIManager(self):ShowUITip("CommonToastMain", string.format(GText("UI_Shop_Toast_Locked"), ShopItemData.UnlockLevel), 1.0)
    elseif 6 == ShopItemData.PurchaseFailRes then
      UIManager(GWorld.GameInstance):ShowError(ErrorCode.RET_SHOPITEM_UNIQUE_ALREDAY_OWNED, 1.0, "CommonToastMain")
      self:PlayAnimation(self.Out)
    elseif 4 == ShopItemData.PurchaseFailRes then
      local PopUpId = 100136
      local Avatar = GWorld:GetAvatar()
      if not Avatar then
        return
      end
      local ItemName = ItemUtils:GetDropName(ShopItemData.TypeId, ShopItemData.ItemType)
      local PriceCount = Avatar.Resources[ShopItemData.PriceType] and Avatar.Resources[ShopItemData.PriceType].Count or 0
      local PopoverText = GText(DataMgr.CommonPopupUIContext[PopUpId].PopoverText)
      if string.find(PopoverText, "&ResourceName&") then
        PopoverText = string.gsub(PopoverText, "&ResourceName&", GText(DataMgr.Resource[CommonConst.Coins.Coin4].ResourceName))
      end
      if string.find(PopoverText, "&ResourceName1&") then
        PopoverText = string.gsub(PopoverText, "&ResourceName1&", GText(DataMgr.Resource[CommonConst.Coins.Coin4].ResourceName))
      end
      if string.find(PopoverText, "&ResourceName2&") then
        PopoverText = string.gsub(PopoverText, "&ResourceName2&", GText(ItemName))
      end
      if string.find(PopoverText, "&Num1&") then
        PopoverText = string.gsub(PopoverText, "&Num1&", ParentWidget.CurrentCount * ParentWidget.UnitPrice - PriceCount)
      end
      if string.find(PopoverText, "&Num2&") then
        PopoverText = string.gsub(PopoverText, "&Num2&", ParentWidget.CurrentCount)
      end
      
      local function Confirm()
        local Coin4Count = 0
        if Avatar.Resources[CommonConst.Coins.Coin4] then
          Coin4Count = Avatar.Resources[CommonConst.Coins.Coin4].Count
        end
        if Coin4Count < ParentWidget.CurrentCount * ParentWidget.UnitPrice - PriceCount then
          local function JumpToShop()
            PageJumpUtils:JumpToShopPage(CommonConst.GachaJumpToShopMainTabId, nil, nil, "Shop")
            
            self:PlayAnimation(self.Out)
          end
          
          local Params = {}
          Params.LeftCallbackObj = self
          Params.RightCallbackObj = self
          Params.RightBtnClickedCallback = JumpToShop
          UIManager(self):ShowCommonPopupUI(100137, Params, self)
        else
          self:SendExchangeRequest(ShopItemData.ItemId, ParentWidget.CurrentCount)
        end
      end
      
      local ItemList = {}
      local Coin4Count = Avatar.Resources[CommonConst.Coins.Coin4] and Avatar.Resources[CommonConst.Coins.Coin4].Count or 0
      table.insert(ItemList, {
        ItemId = CommonConst.Coins.Coin4,
        ItemType = CommonConst.ItemType.Resource,
        ItemNum = Coin4Count,
        ItemNeed = ParentWidget.CurrentCount * ParentWidget.UnitPrice - PriceCount
      })
      local Params = {
        RightCallbackFunction = Confirm,
        ItemList = ItemList,
        ShortText = PopoverText
      }
      UIManager(self):ShowCommonPopupUI(PopUpId, Params)
    elseif 5 == ShopItemData.PurchaseFailRes then
      local function JumpToShop()
        PageJumpUtils:JumpToShopPage(CommonConst.GachaJumpToShopMainTabId, nil, nil, "Shop")
        
        self:PlayAnimation(self.Out)
      end
      
      local PopupId
      if ShopItemData.PriceType == CommonConst.Coins.Coin1 then
        PopupId = 100137
      elseif ShopItemData.PriceType == CommonConst.Coins.Coin4 then
        PopupId = 100263
      end
      if not PopupId then
        return
      end
      local Params = {}
      Params.LeftCallbackObj = self
      Params.RightCallbackObj = self
      Params.RightCallbackFunction = JumpToShop
      UIManager(self):ShowCommonPopupUI(PopupId, Params, self)
    end
    return
  end
  local ShopMain = UIManager(self):GetUIObj("ShopMain")
  local ShopActivity = UIManager(self):GetUIObj("ActivityShop")
  local CommonShopActivity = UIManager(self):GetUIObj("ShopActivity")
  if ShopMain then
    ShopMain:BlockAllUIInput(true)
  end
  if ShopActivity then
    ShopActivity:BlockAllUIInput(true)
  end
  if CommonShopActivity then
    CommonShopActivity:BlockAllUIInput(true)
  end
  Avatar:PurchaseShopItem(ShopItemData.ItemId, 1)
  self:PlayAnimation(self.Out)
end

function M:CloseSelf()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  if self.bCantClose then
    self.bCantClose = false
    return
  end
  self:PlayAnimation(self.Out)
  AudioManager(self):SetEventSoundParam(self, "GiftPopupIn", {ToEnd = 1})
end

function M:OnAnimationFinished(InAnim)
  if InAnim == self.In or InAnim == self.In_SoldOut then
    self:BlockAllUIInput(false)
  elseif InAnim == self.Out then
    self:Close()
    if self.ParentWidget then
      self.ParentWidget:SetFocus()
    end
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  elseif "Escape" == InKeyName then
    IsEventHandled = true
    self:CloseSelf()
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:InitGamePadKeyInfo()
  self.Panel_Key:ClearChildren()
  self.GamePadKeyCheck = self:CreateWidgetNew("ComKeyTextDesc")
  self.GamePadKeyA = self:CreateWidgetNew("ComKeyTextDesc")
  self.GamePadKeyB = self:CreateWidgetNew("ComKeyTextDesc")
  self.GamePadKeyCheck:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = DataMgr.KeyboardText[UIConst.GamePadKey.LeftThumb].KeyText
      }
    },
    Desc = GText("UI_Controller_CheckDetails")
  })
  self.GamePadKeyB:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_BACK")
  })
  self.GamePadKeyA:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    },
    Desc = GText("UI_Tips_Ensure")
  })
  self.Panel_Key:AddChild(self.GamePadKeyCheck)
  self.Panel_Key:AddChild(self.GamePadKeyA)
  self.Panel_Key:AddChild(self.GamePadKeyB)
  local Key_Qa_Params = {
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = DataMgr.KeyboardText[UIConst.GamePadKey.SpecialLeft].KeyText
      }
    }
  }
  self.Key_Qa:CreateCommonKey(Key_Qa_Params)
  self.Key_Qa:SetVisibility(ESlateVisibility.Collapsed)
  self.Com_Tab_ResourceBar:SetGamePadKeyImgByPath(UIUtils.UtilsGetKeyIconPathInGamepad(DataMgr.KeyboardText[UIConst.GamePadKey.RightThumb].KeyText))
  self.Com_Tab_ResourceBar:SetLastFocusWidget(self)
  self:UpdateGamePadKeyInfo()
end

function M:OnDescOpenChanged(bOpen)
  self.bTipOpen = bOpen
  if bOpen then
    self.bCantClose = bOpen
  end
  if not self.FocusOnSubItem and not self.bTipOpen then
    self:SetFocus()
  end
  self:UpdateGamePadKeyInfo()
end

function M:ItemMenuAnchorChanged(bIsOpen)
  self.bItemTipsOpen = bIsOpen
  if bIsOpen then
    self.bCantClose = bIsOpen
  end
  self:UpdateGamePadKeyInfo()
end

function M:UpdateGamePadKeyInfo()
  self.Btn_Confirm:RefreshIconAndGamePadVisibility()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Btn_Cancel:SetPCVisibility(false)
    self.Text_Tip:SetVisibility(ESlateVisibility.Collapsed)
    self.Panel_Key:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if self.FocusOnSubItem and not self.bItemTipsOpen and not self.bTipOpen then
      self.Btn_Cancel:SetGamepadIconVisibility(false)
      self.Btn_Confirm:SetGamePadVisibility(ESlateVisibility.Collapsed)
      self.Key_Qa:SetVisibility(ESlateVisibility.Collapsed)
      self.GamePadKeyCheck:SetVisibility(ESlateVisibility.Collapsed)
      self.GamePadKeyA:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.GamePadKeyB:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    elseif self.bItemTipsOpen or self.bTipOpen then
      if self.bItemTipsOpen then
        self.Key_Qa:SetVisibility(ESlateVisibility.Collapsed)
      end
      self.Btn_Cancel:SetGamepadIconVisibility(false)
      self.Btn_Confirm:SetGamePadVisibility(ESlateVisibility.Collapsed)
      self.GamePadKeyCheck:SetVisibility(ESlateVisibility.Collapsed)
      self.GamePadKeyA:SetVisibility(ESlateVisibility.Collapsed)
      self.GamePadKeyB:SetVisibility(ESlateVisibility.Collapsed)
    else
      if self.ShopItemData and self.ShopItemData.ItemDes then
        self.Key_Qa:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      end
      self.Btn_Cancel:SetGamepadIconVisibility(true)
      self.Btn_Confirm:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.GamePadKeyCheck:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.GamePadKeyA:SetVisibility(ESlateVisibility.Collapsed)
      self.GamePadKeyB:SetVisibility(ESlateVisibility.Collapsed)
    end
  else
    self.Btn_Cancel:SetPCVisibility(true)
    self.Key_Qa:SetVisibility(ESlateVisibility.Collapsed)
    self.Text_Tip:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Key:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == UIConst.GamePadKey.LeftThumb then
    if self.bTipOpen then
      return false
    end
    self.List_Item:SetFocus()
    self.FocusOnSubItem = true
    IsEventHandled = true
  elseif InKeyName == UIConst.GamePadKey.RightThumb then
    if self.bTipOpen then
      return false
    end
    self.Com_Tab_ResourceBar:FocusToResource()
    self.FocusOnSubItem = true
    IsEventHandled = true
  elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
    IsEventHandled = true
    if self.FocusOnSubItem then
      self.FocusOnSubItem = false
      self:SetFocus()
    elseif self.bTipOpen then
      self:OnBtnDetailClick()
    else
      AudioManager(self):PlayUISound(self.Btn_Cancel, "event:/ui/common/click_btn_cancel", nil, nil)
      self:CloseSelf()
    end
  elseif InKeyName == UIConst.GamePadKey.SpecialLeft then
    if not self.FocusOnSubItem then
      IsEventHandled = true
      self:OnBtnDetailClick()
    end
  elseif InKeyName == UIConst.GamePadKey.FaceButtonBottom then
    AudioManager(self):PlayUISound(self.Btn_Confirm, "event:/ui/activity/shop_small_btn_click", nil, nil)
    self:PurChaseShopItem()
  end
  self:UpdateGamePadKeyInfo()
  return IsEventHandled
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  self.FocusOnSubItem = false
  self.bItemTipsOpen = false
  self.bTipOpen = false
  self:UpdateGamePadKeyInfo()
  return UIUtils.Unhandled
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self:UpdateGamePadKeyInfo()
end

return M
