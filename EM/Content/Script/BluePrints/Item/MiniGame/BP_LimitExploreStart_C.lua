require("UnLua")
local M = Class("BluePrints/Item/Chest/BP_MechanismBase_C")

function M:GetCanOpen()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  self.CanOpen = 0 == GameState.ActiveLimitTimeExploreGroup
end

return M
