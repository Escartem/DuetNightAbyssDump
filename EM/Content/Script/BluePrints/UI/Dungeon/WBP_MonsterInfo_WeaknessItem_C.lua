require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:OnListItemObjectSet(Obj)
  local IconObj = LoadObject(string.format("Texture2D'%s'", Obj.WeaknessIcon))
  self.Img_Level:SetBrushFromTexture(IconObj)
  Obj.ViewWidget = self
end

return M
