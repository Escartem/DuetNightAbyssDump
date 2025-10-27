local FStoryLogLine = require("BluePrints/Story/Log/StoryLogLine")
local M = setmetatable({}, {__index = FStoryLogLine})

function M:New(Title)
  Title = tostring(Title)
  local TitleLine = setmetatable(FStoryLogLine:New(Title), {__index = M})
  TitleLine.Title = Title
  return TitleLine
end

function M:ToString()
  return string.format("\194\183 %s\n", self.Title)
end

function M:ToRichString()
  return string.format("<font color='red'>**%s**</font>\n", self.Title)
end

return M
