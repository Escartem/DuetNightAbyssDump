require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.Btn_Click.OnClicked:Add(self, self.ShowItemDetail)
  self.Com_Time.Text_TimeTitle:SetVisibility(ESlateVisibility.Collapsed)
end

function M:SetCallbacks(OwnerObj, Callbacks)
  self.OwnerObj = OwnerObj
  self.OnClickCb = Callbacks.OnClickCb
  self.ClearRdCb = Callbacks.ClearRdCb
end

function M:InitItemInfo(ShopItemData)
  self:CleanTimer()
  self.ShopItemId = ShopItemData.ItemId
  if self.ShopItemId and DataMgr.ShopItem[self.ShopItemId] then
    self.ShopItemData = setmetatable({}, {
      __index = DataMgr.ShopItem[self.ShopItemId]
    })
  end
  local ItemData = DataMgr[ShopItemData.ItemType][ShopItemData.TypeId]
  if DataMgr.ShopItem2PayGoods[self.ShopItemId] then
    self.WS_PriceSign:SetActiveWidgetIndex(0)
  else
    self.WS_PriceSign:SetActiveWidgetIndex(1)
    assert(ItemData.Icon, "\231\188\186\229\176\145Icon", ShopItemData.ItemType, ShopItemData.TypeId)
    self.Com_ItemIcon:Init({
      Id = ShopItemData.PriceType,
      Icon = LoadObject(DataMgr.Resource[ShopItemData.PriceType].Icon),
      ItemType = "Resource",
      UIName = "ShopMain",
      IsShowDetails = true,
      MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight
    })
  end
  local Cost = ShopUtils:GetShopItemPrice(ShopItemData.ItemId)
  self.Text_PriceNum:SetText(Cost)
  self.Text_PriceSign:SetText(GText(ShopUtils:GetCurrencyType()))
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if ShopItemData.ShowBonus and not Avatar:CheckShopItemSoldOutDisplay(ShopItemData.ItemId) then
    self.Group_More:SetVisibility(ESlateVisibility.Visible)
    self.Text_MoreNum:SetText("+" .. ShopItemData.ShowBonus)
  else
    self.Group_More:SetVisibility(ESlateVisibility.Collapsed)
  end
  local ItemName = ItemUtils:GetDropName(ShopItemData.TypeId, ShopItemData.ItemType)
  self.Text_GiftTitle:SetText(ItemName)
  local PurchaseLimit = ShopUtils:GetShopItemPurchaseLimit(ShopItemData.ItemId)
  if PurchaseLimit >= 0 then
    self.Group_BuyLeftTimes:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_BuyLeftTimes:SetText(GText("UI_SHOP_SHOPITEMLIMIT") .. PurchaseLimit .. "/" .. self.ShopItemData.PurchaseLimit)
  else
    self.Group_BuyLeftTimes:SetVisibility(ESlateVisibility.Collapsed)
  end
  local IconPath = ItemData.Icon
  if IconPath then
    local IconObj = LoadObject(IconPath)
    if IconObj then
      self.Image_Icon:SetBrushResourceObject(IconObj)
    end
  end
  self.Group_LimitTime:SetVisibility(ESlateVisibility.Collapsed)
  if self.ShopItemData.RefreshTime then
    self.Group_LimitTime:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Com_Time.Image_ClockIcon:SetBrush(self.Com_Time.Img_Refresh)
    self:UpdateShopItemRefreshTime(self.ShopItemData.RefreshTime, self.Com_Time.Text_TimeDesc)
  elseif self.ShopItemData.StartTime and self.ShopItemData.EndTime then
    self.Group_LimitTime:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Com_Time.Image_ClockIcon:SetBrush(self.Com_Time.Img_Time)
    self:UpdateLimitTime(self.ShopItemData.EndTime, self.Com_Time.Text_TimeDesc)
    self:AddTimer(1, self.UpdateLimitTime, true, 0, "RefreshEndTimer", true, self.ShopItemData.EndTime, self.Com_Time.Text_TimeDesc)
  end
end

function M:UpdateShopItemRefreshTime(RefreshTime)
  if not RefreshTime then
    self.Group_LimitTime:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Group_LimitTime:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    ShopUtils:RefreshShopRefreshTime(RefreshTime, self.Com_Time.Text_TimeDesc)
    self:AddTimer(1, ShopUtils.RefreshShopRefreshTime, true, 0, "RefreshTimeTimer", true, RefreshTime, self.Com_Time.Text_TimeDesc)
  end
end

function M:ShowItemDetail()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if Avatar:CheckShopItemEnhanceRedDot(self.ShopItemData.ItemId) then
    Avatar:CleanShopItemEnhanceRedDot(self.ShopItemData.ItemId, function()
      if self.ClearRdCb and self.OwnerObj then
        self.ClearRdCb(self.OwnerObj)
      end
    end)
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large_crystal", "PayGiftItemClick", nil)
  if 1 == self.ShopItemData.Bg then
    UIManager(self):LoadUINew("PayGiftPopup_Yellow", self.ShopItemData, self)
  elseif 2 == self.ShopItemData.Bg then
    UIManager(self):LoadUINew("PayGiftPopup_Purple", self.ShopItemData, self)
  else
    UIManager(self):LoadUINew("PayGiftPopup_Purple", self.ShopItemData, self)
  end
  if self.OnClickCb and self.OwnerObj then
    self.OnClickCb(self.OwnerObj)
  end
end

function M:UpdateLimitTime(ItemEndTime, TimeWidget)
  local EndTime = ItemEndTime
  if EndTime <= TimeUtils.NowTime() then
    self:CleanTimer()
    EventManager:FireEvent(EventID.RefreshShop)
    return
  end
  local RemainTimeStr = ShopUtils:UpdateLimitTime(EndTime)
  TimeWidget:SetText(string.format(GText("UI_SHOP_REMAINTIME"), RemainTimeStr))
end

return M
