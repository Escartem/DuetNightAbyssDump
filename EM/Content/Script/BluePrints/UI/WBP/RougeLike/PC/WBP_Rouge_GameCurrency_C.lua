require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:InitInfo(ImgPath, Num)
  local Img = LoadObject(ImgPath)
  self.Img_Currency:SetBrushResourceObject(Img)
  self.Text_Num:SetText(Num)
end

return M
