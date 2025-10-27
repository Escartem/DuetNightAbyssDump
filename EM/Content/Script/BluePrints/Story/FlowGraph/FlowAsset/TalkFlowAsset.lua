local M = Class()

function M:InitializeLua(TalkTask)
  self.TalkTask = TalkTask
end

function M:IsFinish()
  return self:IsActive()
end

return M
