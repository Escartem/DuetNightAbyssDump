local FStoryLogLine = require("BluePrints/Story/Log/StoryLogLine")
local M = setmetatable({}, {__index = FStoryLogLine})

function M:New(Text)
  Text = tostring(Text)
  local TextLine = setmetatable(FStoryLogLine:New(), {__index = M})
  TextLine.Text = Text
  return TextLine
end

function M:ToString()
  return string.format("%s\n", self.Text)
end

function M:ToRichString()
  return string.format("%s\n", self.Text)
end

return M
