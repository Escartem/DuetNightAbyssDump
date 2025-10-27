local FTypingLine = require("Blueprints.Story.Talk.Typing.TypingLine")
local M = {}

function M:New(Book)
  local TypingPage = {}
  for k, v in pairs(self) do
    TypingPage[k] = v
  end
  TypingPage.Book = Book
  TypingPage.Size = FVector2D(0, 0)
  TypingPage.Lines = {}
  return TypingPage
end

function M:GetMaxSize()
  return self.Book:GetSize()
end

function M:GetRemainHeight()
  return self:GetMaxSize().Y - self.Size.Y
end

function M:GetSize()
  return self.Size
end

function M:AddBlock(Block, TypingUserWidget)
  if Block:GetType() == "br" then
    local br = FTypingLine:New(self)
    table.insert(self.Lines, br)
    return
  end
  local Line = self.Lines[#self.Lines]
  if Line then
    self.Size.Y = self.Size.Y - Line:GetSize().Y
    Block = Line:AddBlock(Block, TypingUserWidget)
    self.Size.Y = self.Size.Y + Line:GetSize().Y
    self.Size.X = math.max(self.Size.X, Line:GetSize().X)
  end
  while Block do
    Line = FTypingLine:New(self)
    local OldBlock = Block
    Block = Line:AddBlock(Block, TypingUserWidget)
    if OldBlock == Block then
      break
    end
    table.insert(self.Lines, Line)
    self.Size.Y = self.Size.Y + Line:GetSize().Y
    self.Size.X = math.max(self.Size.X, Line:GetSize().X)
  end
  return Block
end

function M:RemoveEmptyLinesAtLast()
  local Lenth = #self.Lines
  for i = Lenth, 1, -1 do
    local Line = self.Lines[i]
    if 0 == Line:GetSize().Y or 0 == Line:GetSize().X then
      self.Lines[i] = nil
    end
  end
end

function M:GetLineCount()
  return #self.Lines
end

function M:GetLine(Num)
  return self.Lines[Num]
end

function M:GetRichText()
  local Str = ""
  for _, Line in ipairs(self.Lines) do
    Str = Str .. Line:GetRichText() .. "\n"
  end
  return Str
end

function M:GetFullText()
  local Str = ""
  for _, Line in ipairs(self.Lines) do
    Str = Str .. Line:GetFullText() .. "\n"
  end
  return Str
end

return M
