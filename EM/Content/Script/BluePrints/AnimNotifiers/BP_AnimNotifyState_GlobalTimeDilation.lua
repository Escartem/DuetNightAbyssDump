local M = Class({
  "BluePrints.Common.TimerMgr"
})

function M:Begin(Character)
  if self.TimerHandle then
    GWorld.GameInstance:RemoveTimer(self.TimerHandle)
    self.TimerHandle = nil
  end
  
  local function Callback()
    self.TimerHandle = nil
    self.Overridden.Begin(self, Character)
    self.HasStarted = true
  end
  
  self.TimerHandle = GWorld.GameInstance:AddTimer(1.0E-4, Callback, false, 0, nil, true)
end

function M:End(Character)
  if self.TimerHandle then
    GWorld.GameInstance:RemoveTimer(self.TimerHandle)
    self.TimerHandle = nil
  end
  if self.HasStarted then
    self.Overridden.End(self, Character)
    self.HasStarted = false
  end
end

return M
