require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:SetTitle(Title)
  self.Text_Title:SetText(Title)
end

function M:SetText(Text)
  self.Text_Details:SetText(Text)
end

function M:BindEventOnFocusLost(Obj, Event)
  self.Obj = Obj
  self.Event = Event
end

function M:OnFocusLost(InFocusEvent)
  if self.Event then
    self.Event(self.Obj)
  end
end

return M
