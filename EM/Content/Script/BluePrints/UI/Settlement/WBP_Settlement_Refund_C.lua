require("UnLua")
local WBP_Settlement_Refund_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_Settlement_Refund_C:InitItemInfo(ItemId, ItemNum)
  local ItemInfo = {}
  local WalnutData = DataMgr.Walnut[ItemId]
  local WalnutTypeData = {}
  local WalnutRaity, WalnutIconPath
  ItemInfo.IsWalnut = WalnutData and true or false
  if ItemInfo.IsWalnut then
    WalnutTypeData = DataMgr.WalnutType[WalnutData.WalnutType]
    WalnutRaity = WalnutData.Rarity
    WalnutIconPath = WalnutData.Icon
  end
  local ItemData = DataMgr.Resource[ItemId]
  if not ItemData and not WalnutData then
    return
  end
  ItemInfo.ParentWidget = self
  ItemInfo.CommonType = "Refund"
  ItemInfo.Id = ItemId
  ItemInfo.Count = ItemNum or 1
  ItemInfo.Icon = WalnutIconPath or ItemData.Icon
  
  function ItemInfo.AfterInitCallback(Widget)
    if Widget.CanvasPanel_0 then
      Widget.CanvasPanel_0:SetRenderOpacity(0.0)
    end
    if self.IsAllowPropInAnimation and not Widget.Content.IsPlayedInAnimation then
      Widget:PlayInAnimation()
      Widget.Content.IsPlayedInAnimation = true
    elseif 5 == Widget.Rarity then
      Widget:PlayAnimation(Widget.Orange_In, Widget.Orange_In:GetEndTime())
    elseif 4 == Widget.Rarity then
      Widget:PlayAnimation(Widget.purple_In, Widget.purple_In:GetEndTime())
    else
      Widget:PlayAnimation(Widget.Normal_In, Widget.Normal_In:GetEndTime())
    end
    Widget.Bg03:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  
  ItemInfo.Rarity = WalnutRaity or ItemData.Rarity
  ItemInfo.OnMouseButtonUpEvents = {
    Obj = self,
    Callback = self.OpenWalnutDetail,
    Params = {ItemId}
  }
  if ItemInfo.IsWalnut then
  end
  ItemInfo.IsShowDetails = true
  ItemInfo.ItemType = ItemInfo.IsWalnut and "Walnut" or "Resource"
  ItemInfo.IsSpecial = false
  ItemInfo.IsBonus = false
  ItemInfo.IsWalnutBonus = false
  ItemInfo.UIName = "DungeonSettlement"
  return ItemInfo
end

function WBP_Settlement_Refund_C:OpenWalnutDetail(WalnutId)
  if not UIManager(self):GetUIObj("WalnutRewardDialog") then
    self.DialogWidget = UIManager(self):LoadUINew("WalnutRewardDialog", WalnutId, "DungeonSettlement")
  end
  self.DialogWidget:Show("DungeonSettlement")
end

function WBP_Settlement_Refund_C:AddRefundItem(ItemInfo)
  local DungeonSettlement = UIManager(self):GetUI("DungeonSettlement")
  if not DungeonSettlement then
    return
  end
  local Item = DungeonSettlement:NewPropContent(ItemInfo, self.TileView_Refund)
  Item.AfterInitCallback = nil
  self.TileView_Refund:AddItem(Item)
end

function WBP_Settlement_Refund_C:UpdateGamePadIcon(GamePadIcon)
  if GamePadIcon then
    DebugPrint("thy     UpdateGamePadIcon ", GamePadIcon)
    local KeyInfo = {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = GamePadIcon}
      }
    }
    DebugPrint("thy     self.Icon_Key_Refund is Visible")
    self.Icon_Key_Refund:SetVisibility(ESlateVisibility.Visible)
    self.Icon_Key_Refund:SetRenderOpacity(1)
    self.Icon_Key_Refund:CreateCommonKey(KeyInfo)
  else
    self.Controller_Refund:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Settlement_Refund_C:GetShowState()
  return self.IsShow
end

function WBP_Settlement_Refund_C:GetFocusState()
  return self.IsFocus
end

function WBP_Settlement_Refund_C:Show()
  self.IsShow = true
  self.Controller_Refund:SetVisibility(ESlateVisibility.Visible)
end

function WBP_Settlement_Refund_C:Hide()
  self.IsShow = false
  self.Controller_Refund:SetVisibility(ESlateVisibility.Collapsed)
end

function WBP_Settlement_Refund_C:SetItemListFocus()
  self.IsFocus = true
  self.TileView_Refund:SetFocus()
end

function WBP_Settlement_Refund_C:CancelItemListFocus()
  self.IsFocus = false
end

function WBP_Settlement_Refund_C:InitRefund(Content)
  if not Content then
    return
  end
  local AddItemNum = 0
  self.TileView_Refund:ClearListItems()
  for key, value in pairs(Content) do
    if 1 == key then
      if 0 ~= value then
        AddItemNum = AddItemNum + 1
        self:AddRefundItem(self:InitItemInfo(103, value))
      end
    else
      AddItemNum = AddItemNum + 1
      self:AddRefundItem(self:InitItemInfo(value, nil))
    end
  end
  if 0 == AddItemNum then
    self:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  self.Text_Refund:SetText(GText("UI_Refund"))
  self.IsShow = true
  self.IsFocus = false
end

return WBP_Settlement_Refund_C
