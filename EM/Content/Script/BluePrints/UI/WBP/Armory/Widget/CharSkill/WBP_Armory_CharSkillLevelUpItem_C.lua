require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  if Content.Style == "ShowValue" then
    self:InitShowValue(Content)
  end
end

function M:InitShowValue(Content)
  if not Content.CmpValue or Content.Value == Content.CmpValue then
    self.Num_Preview:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Icon_Up:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Icon_Arrow:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Num_Preview:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Icon_Up:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Icon_Arrow:SetVisibility(UIConst.VisibilityOp.Visibie)
  end
  self.Text_Atrr:SetText(Content.Name)
  self.Num_Now:SetText(Content.Value)
  self.Num_Preview:SetText(Content.CmpValue)
  self.WidgetSwitcher_Bg:SetActiveWidgetIndex(Content.Idx % 2)
  if Content.Delta and 0 ~= Content.Delta then
    self.Icon_Up:SetRenderTransformAngle(Content.Delta > 0 and 0 or 180)
    self.CalcColorType = Content.CalcColorType or function(Delta)
      return Delta > 0 and "Positive" or "Nagative"
    end
    local ColorType = self.CalcColorType(Content.Delta)
    self.Num_Preview:SetColorAndOpacity(self[ColorType])
    self.Icon_Up:SetColorAndOpacity(self[ColorType].SpecifiedColor)
  end
end

return M
