require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:OnLoaded(...)
  local Content, LastTime = ...
  self:InitToastMainInfo(Content, LastTime)
end

function M:InitToastMainInfo(Content, LastTime)
  self:RemoveTimer("StoryToastLastTime")
  if LastTime then
    self.LastTime = LastTime
  end
  self.Text_Toast:SetText(GText(Content))
  local Duration = self.LastTime - self.Out:GetEndTime()
  if Duration <= 0 then
    self:PlayOutAnim()
  else
    self:PlayAnimation(self.In)
    AudioManager(self):PlayUISound(self, "event:/ui/common/toast_simple", nil, nil)
    self:AddTimer(Duration, function()
      self:PlayOutAnim()
    end, false, 0, "StoryToastLastTime", true)
  end
end

function M:PlayOutAnim()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:PlayAnimation(self.Out)
end

function M:OnAnimationFinished(Animation)
  if Animation == self.Out then
    self.Super.Close(self)
  end
end

return M
