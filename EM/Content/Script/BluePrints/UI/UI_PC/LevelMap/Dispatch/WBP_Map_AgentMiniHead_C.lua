require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Initialize(Initializer)
  self.IsForid = false
  self.IsChoose = false
  self.Id = nil
end

return M
