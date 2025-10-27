require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  self.IconPath = Content.IconPath
  self.Text = Content.Text
  self.Img_Icon:SetBrushResourceObject(LoadObject(self.IconPath))
  self.Text_Describe:SetText(GText(self.Text))
end

return M
