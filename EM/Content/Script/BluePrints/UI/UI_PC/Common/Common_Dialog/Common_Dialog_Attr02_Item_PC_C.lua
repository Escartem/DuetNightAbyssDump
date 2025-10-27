require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Obj)
  self.Content = Obj
  self.Text_Attribute:SetText(Obj.AttrName)
  self.Text_Num:SetText(Obj.AttrValue)
  if 1 == Obj.Idx % 2 then
    self.Bg01:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Bg01:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

return M
