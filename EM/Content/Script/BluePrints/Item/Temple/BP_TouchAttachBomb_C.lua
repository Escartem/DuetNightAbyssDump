require("UnLua")
local M = Class({
  "BluePrints.Item.Temple.BP_TouchBomb_C"
})

function M:ActiveCombat()
  self.ChestInteractiveComponent.bCanUsed = false
  self:OnAttach()
end

return M
