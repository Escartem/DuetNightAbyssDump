require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.A:SetText("A")
  self.B:SetText("B")
  self.C:SetText("C")
  self.Schemes = {
    self.A,
    self.B,
    self.C
  }
  for index, Widget in ipairs(self.Schemes) do
    Widget:BindEventOnMouseButtonDown(self, self.OnSchemeItemClicked, index)
  end
end

function M:SwitchScheme(SchemeIdx)
  for index, value in ipairs(self.Schemes) do
    value:On(index == SchemeIdx)
  end
end

function M:BindEventOnSchemeClicked(Obj, Event)
  self.Obj = Obj
  self.Event = Event
end

function M:OnSchemeItemClicked(Index)
  if self.Event then
    self.Event(self.Obj, Index)
  end
  for idx, Widget in ipairs(self.Schemes) do
    if idx ~= Index then
      Widget:DeSelect()
    end
  end
end

function M:PlayInAnim()
  self:PlayAnimation(self.In)
end

return M
