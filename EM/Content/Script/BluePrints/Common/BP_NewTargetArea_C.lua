local M = Class("BluePrints.Common.TimerMgr")

function M:ReceiveBeginPlay()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState:AddQuestArea(self)
end

return M
