require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:OnListItemObjectSet(Obj)
  self.Content = Obj
  self.Text_Attribute:SetText(Obj.AttrName)
  self.Text_Num:SetText(Obj.AttrValue)
  self.Text_Num_New:SetText(Obj.CmpValue)
  if 1 == Obj.Idx % 2 then
    self.Bg01:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Bg01:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  local AttrValue = tonumber(Obj.AttrValue)
  local CmpValue = tonumber(Obj.CmpValue)
  if not Obj.Delta and AttrValue and CmpValue then
    Obj.Delta = Obj.CmpValue - Obj.AttrValue
  end
  if Obj.Delta < 0 then
    self:PlayAnimation(self.Text_Num_New_Red)
  elseif 0 == Obj.Delta then
    self:PlayAnimation(self.Text_Num_New_Normal)
  elseif Obj.Delta > 0 then
    self:PlayAnimation(self.Text_Num_New_Green)
  end
end

function M:OnAnimationFinished(InAnim)
  if InAnim == self.Text_Num_New_Red then
    if self.Content.Nagative then
      self.Text_Num_New:SetColorAndOpacity(self.Green)
      self.Image_3:SetColorAndOpacity(self.Green.SpecifiedColor)
    end
  elseif InAnim == self.Text_Num_New_Green and self.Content.Nagative then
    self.Text_Num_New:SetColorAndOpacity(self.Red)
    self.Image_3:SetColorAndOpacity(self.Red.SpecifiedColor)
  end
end

return M
