require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:SetTargetInfo(Text)
  self.Text_ScoreDesc:SetText(Text)
end

function M:PlayStarAnimation(IsHardMode)
  if IsHardMode then
    self:PlayAnimation(self.Gain_1)
  else
    self:PlayAnimation(self.Gain)
  end
end

function M:PlayNormalAnimation()
  self:PlayAnimation(self.Normal)
end

function M:PlayLossAnimation(IsHardMode)
  if IsHardMode then
    self:PlayAnimation(self.Loss_1)
  else
    self:PlayAnimation(self.Loss)
  end
end

return M
