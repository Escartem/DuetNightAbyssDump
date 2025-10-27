require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Initialize(Initializer)
  self.IsPlay = true
end

function M:OnAnimationStarted(Animation)
  if Animation == self.Click and self.IsPlay then
    AudioManager(self):PlayUISound(self, "event:/ui/common/map_click_gold_mark", "", nil)
  end
  self.IsPlay = true
end

return M
