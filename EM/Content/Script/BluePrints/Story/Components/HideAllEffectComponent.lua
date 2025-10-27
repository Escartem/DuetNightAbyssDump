local M = {}

function M:New()
  local Obj = setmetatable({}, {__index = M})
  return Obj
end

function M:Execute()
  local TS = TalkSubsystem()
  if TS then
    TS:TalkHideEffects(true)
  end
end

function M:Resume()
  local TS = TalkSubsystem()
  if TS then
    TS:TalkHideEffects(false)
  end
end

return M
