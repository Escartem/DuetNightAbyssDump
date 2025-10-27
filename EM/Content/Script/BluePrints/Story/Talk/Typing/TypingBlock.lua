local M = {}

function M:SetSize(Size)
  self.Size = Size
end

function M:GetSize()
  return self.Size
end

function M:GetRichTag()
  return self.RichTag
end

function M:GetRichText()
  return "nil"
end

function M:GetType()
  return "nil"
end

function M:GetAttr(AttrName)
  return self.Attrs[AttrName]
end

function M:SetAttr(AttrName, AttrContent)
  self.Attrs[AttrName] = AttrContent
end

return M
