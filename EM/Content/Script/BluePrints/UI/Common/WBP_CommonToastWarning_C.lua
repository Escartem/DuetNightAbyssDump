require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  local ShowMessage, LastTime = ...
  self:ShowToast(ShowMessage, LastTime)
  if LastTime > 0 then
    self:AddTimer(LastTime, self.Close, false, 0, "TipSecond", true)
  end
end

function M:PlayOutAnim()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:UnbindAllFromAnimationFinished(self.Out)
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self:PlayAnimation(self.Out)
end

function M:Close()
  self.Super.Close(self)
  self.IsClose = true
end

return M
