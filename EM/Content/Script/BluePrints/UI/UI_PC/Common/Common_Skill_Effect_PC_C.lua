require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:OnListItemObjectSet(Content)
  self.Text_SkillDescribe:SetText(Content.AttrName)
  self.Text_Basic:SetText(Content.AttrValue)
  if Content.Sign > 0 then
    self.Text_Pos:SetText("+" .. Content.AddValue)
    self.WidgetSwitcher_Addon:SetActiveWidget(self.Text_Pos)
  elseif Content.Sign < 0 then
    self.Text_Rev:SetText("-" .. Content.AddValue)
    self.WidgetSwitcher_Addon:SetActiveWidget(self.Text_Rev)
  else
    self.Text_Pos:SetText("")
    self.Text_Rev:SetText("")
  end
end

return M
