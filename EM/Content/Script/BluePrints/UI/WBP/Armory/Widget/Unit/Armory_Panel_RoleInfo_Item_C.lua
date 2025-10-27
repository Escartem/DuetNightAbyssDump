require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  if Content.IsSelected then
    self.Bg_On:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Bg_On:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if type(Content.Icon) == "string" then
    self.Image_Attribute:SetBrushResourceObject(LoadObject(Content.Icon))
  else
    self.Image_Attribute:SetBrushResourceObject(Content.Icon)
  end
  self.Stats_Name:SetText(Content.Text)
end

return M
