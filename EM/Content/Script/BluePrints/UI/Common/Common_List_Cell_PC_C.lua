require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Initialize(Initializer)
  self.IsFold = true
  self.IsSelected = false
end

function M:Init(Obj, Func)
  self.Obj = Obj
  self.Func = Func
end

function M:OnCellClicked()
end

function M:OnCellHovered()
  self:StopAnimation(self.Normal)
  self:PlayAnimation(self.Hover)
end

function M:OnCellUnhovered()
  self:StopAnimation(self.Hover)
  self:StopAnimation(self.Press)
  self:PlayAnimation(self.Normal)
end

function M:OnCellPressed()
  self:PlayAnimation(self.Press)
end

function M:OnCellReleased()
  self:PlayAnimation(self.Normal)
end

function M:OnCellUnSelect()
  self:StopAnimation(self.Hover)
  self:StopAnimation(self.Press)
  self:PlayAnimation(self.UnSelect)
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.Obj and self.Func then
    self.Func(self.Obj)
  end
  return UIUtils.Handle
end

return M
