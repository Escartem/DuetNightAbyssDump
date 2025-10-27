require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:InitContent(Params, PopupData, Owner)
  self.ShopItemId = Params.ShopItemId
  local ShopItemData = DataMgr.ShopItem[self.ShopItemId]
  assert(ShopItemData, "\230\156\170\230\137\190\229\136\176\229\149\134\229\147\129\230\149\176\230\141\174:" .. self.ShopItemId)
  self.Text_RechargeTitle:SetText(string.format(GText("UI_Shop_JP_Phoxene"), ShopItemData.TypeNum))
  local Icon = ItemUtils.GetItemIcon(ShopItemData.TypeId, ShopItemData.ItemType)
  self.Image_Icon:SetBrushResourceObject(Icon)
end

return M
