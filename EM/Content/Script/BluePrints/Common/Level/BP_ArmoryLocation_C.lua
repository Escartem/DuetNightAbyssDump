local M = Class()

function M:ReceiveBeginPlay()
  _G.GlobalArmoryLocations = GlobalArmoryLocations or {}
  GlobalArmoryLocations[self] = self
end

function M:ReceiveEndPlay()
  GlobalArmoryLocations[self] = nil
end

return M
