require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Init(Content)
  if Content.IsLocked then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(2)
  elseif Content.IsEmpty then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  else
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
    self.Panel_EntryTag:Init(Content)
  end
end

return M
