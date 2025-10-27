require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.IntensifyItem.Text_Ability:SetText(GText("UI_Ability"))
end

function M:OnListItemObjectSet(Content)
  if not Content.Desc then
    self.Text_Detail:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Text_Detail:SetText(Content.Desc)
  end
  if Content.bEnhanced then
    self.IntensifyItem.Num_Now:SetVisibility(UIConst.VisibilityOp.Hidden)
    self.IntensifyItem.Icon_Arrow:SetVisibility(UIConst.VisibilityOp.Hidden)
    self.IntensifyItem.Icon_Up:SetVisibility(UIConst.VisibilityOp.Hidden)
  end
  self.IntensifyItem.Text_Atrr:SetText("\194\183" .. Content.Name)
  self.IntensifyItem.Num_Now:SetText(Content.Value)
  self.IntensifyItem.Num_Preview:SetText(Content.CmpValue)
end

return M
