local M = {}

function M:New()
  local Line = setmetatable({}, {__index = M})
  return Line
end

function M:ToString()
  return ""
end

function M:ToRichString()
  return ""
end

return M
