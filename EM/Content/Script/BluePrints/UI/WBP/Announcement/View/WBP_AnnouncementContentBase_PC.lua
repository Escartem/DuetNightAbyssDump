require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:AddToParent(Parent)
  Parent:AddChild(self)
end

function M:Open(Content)
  self:SetVisibility(UIConst.VisibilityOp.Visible)
end

function M:Close()
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

return M
