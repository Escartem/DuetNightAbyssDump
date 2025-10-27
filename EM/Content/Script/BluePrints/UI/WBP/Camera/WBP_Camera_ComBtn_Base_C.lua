require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.Btn_Click.OnClicked:Clear()
  self.Btn_Click.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Click.OnPressed:Clear()
  self.Btn_Click.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Click.OnReleased:Clear()
  self.Btn_Click.OnReleased:Add(self, self.OnBtnReleased)
  self:FlushAnimations()
end

function M:BindEventOnClicked(Obj, Event, Param)
  self.Obj = Obj
  self.Event = Event
  self.Param = Param
end

function M:OnBtnPressed()
  self:FlushAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnBtnReleased()
  self:FlushAnimations()
  self:PlayAnimation(self.Normal)
end

function M:OnBtnClicked()
  self:FlushAnimations()
  self:PlayAnimation(self.Click)
  if self.Event then
    self.Event(self.Obj, self.Param)
  end
end

return M
