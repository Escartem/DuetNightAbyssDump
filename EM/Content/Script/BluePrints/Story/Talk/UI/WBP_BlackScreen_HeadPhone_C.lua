require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Init(Content)
  self.Content = Content
  self.Text_Hint:SetText(GText("Textmap_NodeText001"))
end

function M:PlayInAnimation(BlendInTime)
  if BlendInTime <= 0.01 then
    BlendInTime = 0.01
  end
  local InAnimation = self.In
  local AnimationInTime = InAnimation:GetEndTime()
  self:PlayAnimation(InAnimation, 0, 1, EUMGSequencePlayMode.Forward, AnimationInTime / BlendInTime)
end

function M:PlayOutAnimation(BlendOutTime)
  if BlendOutTime <= 0.01 then
    BlendOutTime = 0.01
  end
  local OutAnimation = self.Out
  local AnimationOutTime = OutAnimation:GetEndTime()
  self:PlayAnimation(OutAnimation, 0, 1, EUMGSequencePlayMode.Forward, AnimationOutTime / BlendOutTime)
end

return M
