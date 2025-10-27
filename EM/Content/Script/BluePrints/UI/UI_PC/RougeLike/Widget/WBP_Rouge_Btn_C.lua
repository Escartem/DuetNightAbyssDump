require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnAnimationFinished(Anim)
  if Anim == self.Click then
    if self.Parent and self.Parent.RougePurchase then
      self.Parent:RougePurchase()
    end
  elseif Anim == self.UnHover then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)
  end
end

return M
