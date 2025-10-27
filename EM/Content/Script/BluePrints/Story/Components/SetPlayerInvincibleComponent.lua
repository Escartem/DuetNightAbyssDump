local M = {}
local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")

function M:New()
  local Obj = setmetatable({}, {__index = M})
  return Obj
end

function M:Execute()
  TalkUtils.SetPlayerInvincible()
end

function M:Resume()
  TalkUtils.RemovePlayerInvincible()
end

return M
