local FStoryLogLine = require("BluePrints/Story/Log/StoryLogLine")
local M = setmetatable({}, {__index = FStoryLogLine})

function M:New(Key, Text)
  Key = tostring(Key)
  Text = tostring(Text)
  local KeyLine = setmetatable(FStoryLogLine:New(), {__index = M})
  KeyLine.Key = Key
  KeyLine.Text = Text
  return KeyLine
end

function M:ToString()
  return string.format("%s: %s\n", self.Key, self.Text)
end

function M:ToRichString()
  return string.format("**%s**: %s\n", self.Key, self.Text)
end

return M
