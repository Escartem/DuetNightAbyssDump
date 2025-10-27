require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:SetFocusCallback(callback)
  self._callback = callback
end

function M:OnAddedToFocusPath()
  if self._callback then
    self._callback(self)
  end
  return UIUtils.Handled
end

return M
