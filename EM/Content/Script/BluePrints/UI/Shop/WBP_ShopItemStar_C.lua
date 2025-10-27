require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:SetLight(bLight)
  self.Img_StarLight:SetVisibility(bLight and UIConst.VisibilityOp.SelfHitTestInvisible or UIConst.VisibilityOp.Collapsed)
  self.Img_StarUnLight:SetVisibility(bLight and UIConst.VisibilityOp.Collapsed or UIConst.VisibilityOp.SelfHitTestInvisible)
end

return M
