local M = Class()

function M:ReceiveBeginPlay()
  GWorld.GameInstance:GetSceneManager().PrologueFloorBox = self
end

return M
