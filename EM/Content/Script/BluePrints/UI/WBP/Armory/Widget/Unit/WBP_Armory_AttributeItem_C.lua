require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnAnimationFinished(InAnim)
  if InAnim == self.In then
    self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
end

function M:OnListItemObjectSet(Obj)
  if Obj.ShowType == "Mod" then
    self.Content = Obj
    self.Text_Attribute01:SetText(Obj.AttrName)
    Obj.AttrValue = string.trim(tostring(Obj.AttrValue))
    if Obj.CmpValue and Obj.CmpValue ~= "" then
      Obj.CmpValue = string.trim(tostring(Obj.CmpValue))
      if Obj.Style == "Normal" then
        self.Text_Num:SetText(Obj.CmpValue)
        self.Text_Num:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        self.Text_Num_New:SetVisibility(ESlateVisibility.Collapsed)
        self.Arrow:SetVisibility(ESlateVisibility.Collapsed)
        self.AddArrow:SetVisibility(ESlateVisibility.Collapsed)
      elseif Obj.Style == "Positive" then
        self.Text_Num:SetText(Obj.CmpValue)
        self.Text_Num_New:SetText(Obj.AttrValue)
        self.Text_Num_New:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        self.Arrow:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        self.AddArrow:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        self.Text_Num_New:SetColorAndOpacity(self.Red)
        self.AddArrow:SetBrushTintColor(self.Red)
        self.AddArrow:SetRenderScale(FVector2D(1.0, 1.0))
      elseif Obj.Style == "Negative" then
        self.Text_Num:SetText(Obj.CmpValue)
        self.Text_Num_New:SetText(Obj.AttrValue)
        self.Text_Num_New:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        self.Arrow:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        self.AddArrow:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        self.Text_Num_New:SetColorAndOpacity(self.Orange)
        self.AddArrow:SetBrushTintColor(self.Orange)
        self.AddArrow:SetRenderScale(FVector2D(1.0, -1.0))
      end
    else
      self.Text_Num:SetText(Obj.AttrValue)
      self.Text_Num_New:SetVisibility(ESlateVisibility.Collapsed)
      self.Arrow:SetVisibility(ESlateVisibility.Collapsed)
      self.AddArrow:SetVisibility(ESlateVisibility.Collapsed)
    end
  else
    self.Content = Obj
    self.Text_Attribute01:SetText(Obj.AttrName)
    Obj.AttrValue = string.trim(tostring(Obj.AttrValue))
    self.Text_Num:SetText(Obj.AttrValue)
    if Obj.CmpValue and Obj.CmpValue ~= "" then
      Obj.CmpValue = string.trim(tostring(Obj.CmpValue))
      self.Text_Num_New:SetText(Obj.CmpValue)
      self.Text_Num_New:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self.Arrow:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self.AddArrow:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.Text_Num_New:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Arrow:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.AddArrow:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  if 1 == Obj.Idx % 2 then
    self.WidgetSwitcher_Bg:SetActiveWidgetIndex(1)
  else
    self.WidgetSwitcher_Bg:SetActiveWidgetIndex(0)
  end
  self:UpdateHighlight(Obj.bHightlight, Obj.bNoBg)
end

function M:UpdateHighlight(bHightlight, bNoBg)
  if self.Overridden.UpdateHighlight_OverrideLua then
    self.Overridden.UpdateHighlight_OverrideLua(self, bHightlight, bNoBg)
  elseif bHightlight then
    self.Text_Attribute01:SetColorAndOpacity(self.Orange)
    self.Text_Num:SetColorAndOpacity(self.Orange)
    self.Arrow:SetBrushTintColor(self.White)
  else
    self.Text_Attribute01:SetColorAndOpacity(self.White)
    self.Text_Num:SetColorAndOpacity(self.White)
    self.Arrow:SetBrushTintColor(self.Orange)
  end
end

return M
