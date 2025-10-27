require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnFocusLost(InFocusEvent)
  self.ParentWidget:FocusLost()
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  self.ParentWidget:FocusReceived()
  return UE4.UWidgetBlueprintLibrary.Handled()
end

return M
