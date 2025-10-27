local TestPrintNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function TestPrintNode:Init()
  self.Text = nil
end

function TestPrintNode:Execute()
  local Str = "[TestPrint]Text\228\184\186:"
  if self.Text then
    Str = Str .. "'" .. self.Text .. "'"
  end
  ScreenPrint(Str)
  return nil
end

function TestPrintNode:Clear()
end

function TestPrintNode:OnQuestlineFinish()
end

function TestPrintNode:OnQuestlineSuccess()
end

function TestPrintNode:OnQuestlineFail()
end

return TestPrintNode
