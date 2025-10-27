require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.UI = self
  self:StopAllAnimations()
  if Content.bActivate then
    self:PlayAnimation(self.Activate)
  elseif Content.bGolden then
    self:PlayAnimation(self.Succeed)
  else
    self:PlayAnimation(self.Normal)
  end
end

function M:BP_OnEntryReleased()
  self:PlayAnimation(self.Normal)
end

function M:GoldStar()
  self.Content.bGolden = true
  self:StopAllAnimations()
  self:PlayAnimation(self.Succeed)
end

return M
