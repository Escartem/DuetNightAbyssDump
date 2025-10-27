require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Click.OnReleased:Add(self, self.OnReleased)
  self.Btn_Click.OnPressed:Add(self, self.OnPressed)
end

function M:OnPressed()
  self:PlayAnimation(self.Press)
end

function M:OnReleased()
  self:PlayAnimation(self.Click)
end

return M
