local FStoryLogTitleLine = require("BluePrints/Story/Log/StoryLogTitleLine")
local FStoryLogTextLine = require("BluePrints/Story/Log/StoryLogTextLine")
local FStoryLogKeyLine = require("BluePrints/Story/Log/StoryLogKeyLine")
local FStoryLogMapLine = require("BluePrints/Story/Log/StoryLogMapLine")
local M = {}

function M:New()
  local StoryLog = setmetatable({}, {__index = M})
  StoryLog.LineArray = {}
  return StoryLog
end

function M:AddTitleLine(Title)
  table.insert(self.LineArray, FStoryLogTitleLine:New(Title))
end

function M:AddTextLine(Text)
  table.insert(self.LineArray, FStoryLogTextLine:New(Text))
end

function M:AddKeyLine(Key, Value)
  table.insert(self.LineArray, FStoryLogKeyLine:New(Key, Value))
end

function M:AddMapLine(TextOrderMap)
  table.insert(self.LineArray, FStoryLogMapLine:New(TextOrderMap))
end

function M:AddSeparator()
  self:AddTextLine("\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148")
end

function M:ToString()
  local Text = ""
  for _, Line in ipairs(self.LineArray) do
    Text = Text .. Line:ToString()
  end
  return Text
end

function M:ToRichString()
  local RichText = ""
  for _, Line in ipairs(self.LineArray) do
    RichText = RichText .. Line:ToRichString()
  end
  return RichText
end

return M
