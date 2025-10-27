require("UnLua")
local WBP_Settlement_TipsItem_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_Settlement_TipsItem_C:OnListItemObjectSet(ListItemObject)
  self.Text_Title:SetText(GText(ListItemObject.Title))
  self.Text_Describe:SetText(GText(ListItemObject.Text))
  self.Icon:SetBrushResourceObject(ListItemObject.Icon)
end

return WBP_Settlement_TipsItem_C
