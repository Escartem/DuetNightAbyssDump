require("UnLua")
local Component = {}

function Component:InitSpecialView(ItemData, ...)
  self.WidgetSwitcher_Level:SetActiveWidgetIndex(2)
  if ItemData.Premium then
    self.Item.VX_Colorful:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  local PetMaxStar = 3
  if ItemData.GradeLevel ~= nil then
    for i = PetMaxStar, PetMaxStar - ItemData.GradeLevel + 1, -1 do
      self["PetStar_" .. i].PetStar:SetActiveWidgetIndex(1)
    end
    if 0 == ItemData.GradeLevel then
      self.WidgetSwitcher_Level:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.WidgetSwitcher_Level:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
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
end

return Component
