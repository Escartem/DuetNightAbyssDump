require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(ItemObject)
  self.Text_Title:SetText(GText(ItemObject.Name))
  if not ItemObject.IsSelected then
    self.Text_Title:SetRenderOpacity(0.4)
  else
    self.Text_Title:SetRenderOpacity(1)
  end
  ItemObject.UI = self
  self.Item = ItemObject
  if -1 ~= ItemObject.TitleID then
    local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("Title")
    if CacheDetail and CacheDetail[ItemObject.TitleID] then
      self.New:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    ItemObject.IsNew = true
  else
    self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnEntryReleased()
end

function M:SetNotNew()
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("Title")
  UIUtils.TrySubReddotCacheDetailNumber(self.Item.TitleID, "Title")
  self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

return M
