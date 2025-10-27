local FStoryLogLine = require("BluePrints/Story/Log/StoryLogLine")
local M = setmetatable({}, {__index = FStoryLogLine})

function M:New(TextOrderMap)
  TextOrderMap = TextOrderMap or {}
  local MapLine = setmetatable(FStoryLogLine:New(), {__index = M})
  MapLine.TextOrderMap = TextOrderMap
  return MapLine
end

function M:ToString()
  local ResultString = ""
  for _, Tuple in pairs(self.TextOrderMap) do
    ResultString = string.format("%s[%s]: %s, ", ResultString, Tuple[1], Tuple[2])
  end
  return string.format("%s\n", ResultString)
end

function M:ToRichString()
  local ResultString = ""
  for _, Tuple in pairs(self.TextOrderMap) do
    ResultString = string.format("%s**[%s]**: %s, ", ResultString, Tuple[1], Tuple[2])
  end
  return string.format("%s\n", ResultString)
end

return M
