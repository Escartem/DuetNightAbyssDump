local M = Class()

function M:BindMoveProxyFinish_Lua(BindId, Proxy)
  local function OnMoveFinish()
    self:OnMoveProxyFinish(BindId)
  end
  
  Proxy.OnSuccess:Add(self, OnMoveFinish)
  Proxy.OnFail:Add(self, OnMoveFinish)
end

return M
