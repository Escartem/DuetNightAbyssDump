require("UnLua")
local Component = {}

function Component:InitSpecialView(ItemData, ...)
  self.WidgetSwitcher_Level:SetActiveWidgetIndex(1)
  if ItemData.GradeLevel ~= nil and ItemData.GradeLevel > 0 then
    self.Num_EnhanceLevel:SetText(GText(Const.RomanNum[ItemData.GradeLevel]))
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
    self.Text_Hold:SetText(GText("UI_Bag_Sellconfirm_Hold"))
    self.Icon_RootStar:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Num_Hold:SetText(ItemData.HaveCountNumber)
    self.WidgetSwitcher_Info:SetActiveWidgetIndex(0)
  else
    self.Text_NotHold:SetText(GText("UI_Consumable_NotOwned"))
    self.WidgetSwitcher_Info:SetActiveWidgetIndex(1)
  end
  self.WB_Star:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

return Component
