local FTypingBlock = require("Blueprints.Story.Talk.Typing.TypingBlock")
local M = {}

function M:New(RichTag, Attrs)
  local TypingImgBlock = {}
  for k, v in pairs(self) do
    TypingImgBlock[k] = v
  end
  setmetatable(TypingImgBlock, {__index = FTypingBlock})
  TypingImgBlock.RichTag = RichTag
  TypingImgBlock.Size = nil
  TypingImgBlock.Attrs = Attrs or {}
  return TypingImgBlock
end

function M:GetRichText()
  local text = "<" .. self.RichTag
  if self.Attrs then
    for key, value in pairs(self.Attrs) do
      text = text .. " " .. key .. "=\"" .. value .. "\""
    end
  end
  text = text .. "/>"
  return text
end

function M:GetType()
  return "img"
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
  text = text .. "/>"
  return text
end

return M
