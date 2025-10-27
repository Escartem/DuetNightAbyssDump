local M = Class()

function M:TestLuaBinding()
  DebugPrint(string.format("Execution flow %s binding lua success.", self:GetName()))
end

return M
