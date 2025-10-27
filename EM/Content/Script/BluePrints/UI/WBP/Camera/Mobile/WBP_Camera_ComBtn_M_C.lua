require("UnLua")
local M = Class("BluePrints.UI.WBP.Camera.WBP_Camera_ComBtn_Base_C")

function M:Construct()
  M.Super.Construct(self)
  self:FlushAnimations()
  self:PlayAnimation(self.Normal)
  self.bClicked = false
end

function M:OnBtnClicked()
  if not self.bClicked then
    self:StopAnimation(self.Normal)
    self:PlayAnimation(self.Click)
    self.bClicked = true
  end
  if self.Event then
    self.Event(self.Obj, self.Param)
  end
end

function M:Unclicked()
  if self.bClicked then
    self:StopAnimation(self.Click)
    self:PlayAnimation(self.Normal)
    self.bClicked = false
  end
end

return M
