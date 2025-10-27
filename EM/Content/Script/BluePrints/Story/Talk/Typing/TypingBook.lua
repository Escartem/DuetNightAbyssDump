local FTypingPage = require("Blueprints.Story.Talk.Typing.TypingPage")
local M = {}

function M:New(Size)
  local TypingBook = {}
  for k, v in pairs(self) do
    TypingBook[k] = v
  end
  TypingBook.Size = Size
  TypingBook.Pages = {}
  return TypingBook
end

function M:GetSize()
  return self.Size
end

function M:AddBlock(Block, TypingUserWidget)
  local Page = self.Pages[#self.Pages]
  if Page then
    Block = Page:AddBlock(Block, TypingUserWidget)
    if Block then
      Page:RemoveEmptyLinesAtLast()
    end
  end
  while Block do
    Page = FTypingPage:New(self)
    local OldBlock = Block
    Block = Page:AddBlock(Block, TypingUserWidget)
    if OldBlock == Block then
      print(_G.LogTag, "Block \229\134\133\229\174\185\232\182\133\229\135\186\233\161\181\229\164\167\229\176\143\239\188\140\232\162\171\228\184\162\229\188\131\227\128\130", "Block \229\164\167\229\176\143\239\188\154", Block:GetSize(), "Block \229\134\133\229\174\185\239\188\154", Block:GetRichText())
      break
    end
    table.insert(self.Pages, Page)
  end
end

function M:GetLine(Num)
  for _, Page in ipairs(self.Pages) do
    local LineCount = Page:GetLineCount()
    if Num - LineCount < 0 then
      return Page:GetLine(Num)
    end
    Num = Num - LineCount
  end
end

function M:GetPage(Num)
  return self.Pages[Num]
end

function M:GetPageCount()
  return #self.Pages
end

function M:GetRichText()
  local Text = ""
  for Index, Page in ipairs(self.Pages) do
    Text = Text .. "#Page " .. Index .. "\n" .. Page:GetRichText() .. "\n"
  end
  return Text
end

function M:GetFullText()
  local Text = ""
  for Index, Page in ipairs(self.Pages) do
    Text = Text .. "#Page " .. Index .. "\n" .. Page:GetFullText() .. "\n"
  end
  return Text
end

return M
