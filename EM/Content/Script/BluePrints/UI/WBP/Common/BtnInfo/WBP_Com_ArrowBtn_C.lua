require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Button.Common_Button_PC")

function M:Construct()
  self.UnHover = self.Unhover
  self.Super.Construct(self, self.Btn)
end

function M:Destruct()
  self.Super.Destruct(self)
end

function M:SwitchNormalAnimation()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:ForbidBtn(IsForbid)
  self.Super.ForbidBtn(self, IsForbid)
  self.Btn:SetForbidden(IsForbid)
end

return M
