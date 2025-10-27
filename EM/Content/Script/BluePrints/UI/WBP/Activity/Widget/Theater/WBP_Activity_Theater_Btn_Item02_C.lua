require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self:InitUI()
end

function M:InitUI()
  local ResourceData = DataMgr.Resource[self.Content.Resource]
  local ItemContent = {
    Id = self.Content.Resource,
    ItemType = "Resource",
    Icon = ResourceData.Icon,
    Rarity = ResourceData.Rarity,
    IsShowDetails = true,
    HandleMouseDown = true
  }
  self.Com_Item_S:Init(ItemContent)
  self.Text_Item_Name:SetText(GText(ResourceData.ResourceName))
end

return M
