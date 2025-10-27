require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  Content.Entry = self
  self.Content = Content
  if self.Content.Light then
    self.Switcher_Star:SetActiveWidgetIndex(2)
  else
    self.Switcher_Star:SetActiveWidgetIndex(1)
  end
end

return M
