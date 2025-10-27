require("UnLua")
local Component = {}

function Component:InitSpecialView(ItemData, ...)
  self.WB_Star:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.WidgetSwitcher_Level:SetActiveWidgetIndex(0)
  local Color = self[ItemData.Attribute]
  local SlateColor = FSlateColor()
  SlateColor.SpecifiedColor.R = Color.R
  SlateColor.SpecifiedColor.G = Color.G
  SlateColor.SpecifiedColor.B = Color.B
  self.Bg_Intron:SetColorAndOpacity(Color)
  self.Bg_Intron:SetBrushTintColor(SlateColor)
  self.Num_Intron:SetColorAndOpacity(SlateColor)
  if ItemData.GradeLevel ~= nil and ItemData.GradeLevel > 0 then
    self.Num_Intron:SetText(ItemData.GradeLevel)
    if ItemData.IsMaxGradeLevel then
      self.Switcher_Max:SetActiveWidgetIndex(1)
    else
      self.Switcher_Max:SetActiveWidgetIndex(0)
    end
    self.WidgetSwitcher_Level:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.WidgetSwitcher_Level:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if ItemData.HaveCountNumber > 0 then
    self.Text_Hold:SetText(GText("UI_Consumable_HasGot"))
    self.Icon_RootStar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Num_Hold:SetText(ItemData.Count)
    self.WidgetSwitcher_Info:SetActiveWidgetIndex(0)
  else
    self.Text_NotHold:SetText(GText("UI_Consumable_NotOwned"))
    self.WidgetSwitcher_Info:SetActiveWidgetIndex(1)
  end
end

return Component
