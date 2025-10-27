require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.WS_Item:SetActiveWidgetIndex(0)
  self.Text_SoldOut:SetText(GText("UI_SHOP_SOLDOUT"))
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.ItemData = Content.ItemData
  self:InitPayGiftItemInfo(self.ItemData)
end

function M:InitPayGiftItemInfo(ShopItemData)
  if not ShopItemData then
    self.WS_Item:SetActiveWidgetIndex(1)
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.WS_Item:SetActiveWidgetIndex(0)
  self.NowPayGiftItem = nil
  self.Lock:SetVisibility(ESlateVisibility.Collapsed)
  if ShopItemData.UnlockLevel and Avatar.Level < ShopItemData.UnlockLevel then
    self.Lock.Text_Lock:SetText(GText("UI_Player_Level") .. ShopItemData.UnlockLevel)
    self.Lock:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  elseif Avatar:CheckShopItemSoldOutDisplay(ShopItemData.ItemId) then
    self.PayGift_PurpleItem.Group_More:SetVisibility(ESlateVisibility.Collapsed)
    self.PayGift_YellowItem.Group_More:SetVisibility(ESlateVisibility.Collapsed)
    self.Group_SoldOut:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Group_SoldOut:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.bNewShopItem = Avatar:CheckShopItemEnhanceRedDot(ShopItemData.ItemId)
  if self.bNewShopItem then
    self.New:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.New:SetVisibility(ESlateVisibility.Collapsed)
  end
  local Cost = ShopUtils:GetShopItemPrice(ShopItemData.ItemId)
  if 0 == Cost then
    self.Reddot:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.New:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Reddot:SetVisibility(ESlateVisibility.Collapsed)
  end
  if 1 == ShopItemData.Bg then
    self.NowPayGiftItem = self.PayGift_YellowItem
    self.PayGift_YellowItem:SetVisibility(ESlateVisibility.Visible)
    self.PayGift_PurpleItem:SetVisibility(ESlateVisibility.Collapsed)
    self.PayGift_YellowItem:InitItemInfo(ShopItemData)
  else
    self.NowPayGiftItem = self.PayGift_PurpleItem
    self.PayGift_YellowItem:SetVisibility(ESlateVisibility.Collapsed)
    self.PayGift_PurpleItem:SetVisibility(ESlateVisibility.Visible)
    self.PayGift_PurpleItem:InitItemInfo(ShopItemData)
  end
  self.NowPayGiftItem:SetCallbacks(self, {
    OnClickCb = self.OnSubItemClick,
    ClearRdCb = self.OnClearReddot
  })
  self:EMShowReddot(false, EReddotType.New, 0)
  local ShopTabConf = DataMgr.ShopTabSub[ShopItemData.SubTabId]
  local NodeName = ShopTabConf and ShopTabConf.ReddotNode
  if NodeName then
    local Node = ReddotManager.GetTreeNode(NodeName)
    local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(NodeName)
    local ItemId = ShopItemData.ItemId
    if CacheDetail[ItemId] and CacheDetail[ItemId] ~= Const.ShopCacheReason.Read then
      self:EMShowReddot(true, Node.ReddotType, 0)
    end
  end
end

function M:OnClearReddot()
  self:EMShowReddot(false, EReddotType.New, 0)
end

function M:OnSubItemClick()
  local ShopTabConf = DataMgr.ShopTabSub[self.ItemData.SubTabId]
  local NodeName = ShopTabConf and ShopTabConf.ReddotNode
  if NodeName and ReddotManager.DecreaseLeafNodeCount(ShopTabConf.ReddotNode, 1, {
    ShopItemId = self.ShopId
  }) then
    self:EMShowReddot(false, EReddotType.New, 0)
  end
end

return M
