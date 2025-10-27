require("UnLua")
local M = Class("BluePrints/Item/CombatProp/BP_CombatPropBase_C")

function M:OnBreakCountDown(SourceEid)
  M.Super.OnBreakCountDown(self, SourceEid)
  self.Overridden.OnBreakCountDown(self, SourceEid)
end

return M
