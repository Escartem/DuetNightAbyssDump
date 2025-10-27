require("UnLua")
local M = Class()

function M:InitPhantom()
  self.IsPhantomIcon = true
  self.PhantomActor = self.Icon.PhantomActor
end

return M
