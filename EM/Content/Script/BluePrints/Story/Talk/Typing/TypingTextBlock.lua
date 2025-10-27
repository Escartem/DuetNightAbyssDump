local FTypingBlock = require("Blueprints.Story.Talk.Typing.TypingBlock")
local M = {}

function M:New(Text, RichTag, Attrs)
  local TypingTextBlock = {}
  for k, v in pairs(self) do
    TypingTextBlock[k] = v
  end
  setmetatable(TypingTextBlock, {__index = FTypingBlock})
  TypingTextBlock.Text = Text
  TypingTextBlock.RichTag = RichTag
  TypingTextBlock.Size = nil
  TypingTextBlock.Attrs = Attrs or {}
  return TypingTextBlock
end

function M:GetRichText()
  return "<" .. self.RichTag .. ">" .. self.Text .. "</>"
end

function M:GetFullText()
  local text = "<" .. self.RichTag
  if self.Attrs then
    for key, value in pairs(self.Attrs) do
      text = text .. " " .. key .. "=\""
      if type(value) == "table" then
        for key, value in pairs(value) do
          text = text .. key .. ":" .. value .. ","
        end
        local len = #text
        if "," == string.sub(text, len, len) then
          text = string.sub(text, 1, len - 1)
        end
      else
        text = text .. value
      end
      text = text .. "\""
    end
  end
  text = text .. ">" .. self.Text .. "</>"
  return text
end

function M:GetType()
  return "text"
end

return M
