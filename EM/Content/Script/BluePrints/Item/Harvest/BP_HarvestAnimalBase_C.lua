require("UnLua")
local M = Class("BluePrints.Item.Harvest.BP_HarvestBase_C")

function M:GetCanOpen()
  self.Overridden.GetCanOpen(self)
end

return M
