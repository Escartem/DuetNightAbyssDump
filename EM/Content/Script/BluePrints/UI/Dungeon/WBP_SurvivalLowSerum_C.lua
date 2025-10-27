require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:ShowOrHideByAnim(bShow)
  if bShow ~= self.bShow then
    if bShow then
      self.Root:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self:StopAllAnimations()
      self:PlayAnimation(self.In)
    else
      self:StopAllAnimations()
      self:UnbindAllFromAnimationFinished(self.Out)
      self:BindToAnimationFinished(self.Out, {
        self,
        function()
          self.Root:SetVisibility(ESlateVisibility.Collapsed)
        end
      })
      self:PlayAnimation(self.Out)
    end
  end
  self.bShow = bShow
end

return M
