require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
M._components = {
  "BluePrints.UI.UI_PC.Common.HorizontalListViewResizeComp"
}

function M:Construct()
  self.List_PayGift.OnCreateEmptyContent:Bind(self, function(self)
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.ShopId = nil
    return Content
  end)
end

function M:Destruct()
  self:HorizontalListViewResize_TearDown()
end

function M:InitPayGiftInfo(ShopItemsData)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.List_PayGift:ClearListItems()
  for _, v in ipairs(ShopItemsData) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.ItemData = v
    if 0 ~= ShopUtils:GetShopItemPurchaseLimit(v.ItemId) or Avatar:CheckShopItemSoldOutDisplay(v.ItemId) then
      self.List_PayGift:AddItem(Content)
    end
  end
  if self.List_PayGift:GetNumItems() > 0 then
    self.List_PayGift:RequestFillEmptyContent()
    self:AddTimer(0.01, function()
      local ShopMain = UIManager(self):GetUIObj("ShopMain")
      if (ShopMain and ShopMain:HasAnyFocus() or self:HasFocusedDescendants()) and not CommonUtils:IfExistSystemGuideUI(self) then
        self.List_PayGift:SetFocus()
      end
    end)
  end
end

AssembleComponents(M)
return M
