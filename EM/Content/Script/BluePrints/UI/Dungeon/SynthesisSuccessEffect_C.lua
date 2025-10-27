require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:OnLoaded()
  M.Super.OnLoaded(self)
  self:BindToAnimationFinished(self.In, function()
    self:Close()
  end)
end

function M:ShowEffect()
  self:PlayAnimation(self.In)
  AudioManager(self):PlayUISound(self, "event:/sfx/common/scene/week/stage_finish", nil, nil)
end

return M
