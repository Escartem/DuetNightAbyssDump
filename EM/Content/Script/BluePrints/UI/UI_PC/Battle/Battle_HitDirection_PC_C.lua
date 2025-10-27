require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:OnLoaded(Attacker, OwnerPlayer)
  M.Super.OnLoaded(self, Attacker, OwnerPlayer)
  self:OnLoaded_CPP(Attacker, OwnerPlayer)
end

return M
