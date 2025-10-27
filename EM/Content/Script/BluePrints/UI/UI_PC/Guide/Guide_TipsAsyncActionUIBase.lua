require("UnLua")
local Guide_TipsAsyncActionUIBase = Class({
  "BluePrints.UI.BP_UIState_C"
})

function Guide_TipsAsyncActionUIBase:OnTipBegin(Duration, Callback, InAnim, OutAnim)
  if nil ~= Duration and Duration <= 0 then
    return false
  end
  if self.IsShowing then
    return false
  end
  self.IsShowing = true
  self.IsTipEnd = false
  if nil ~= Duration then
    self:AddTimer(Duration, self.OnTipEnd)
  end
  self.Callback = Callback
  self.InAnim = InAnim
  self.OutAnim = OutAnim
  self:Show()
  if nil ~= self.InAnim then
    self:PlayAnimation(self.InAnim)
  end
  return true
end

function Guide_TipsAsyncActionUIBase:OnTipEnd()
  if self.IsTipEnd then
    return
  end
  self.IsTipEnd = true
  if self.OutAnim then
    self:BindToAnimationFinished(self.Out, {
      self,
      self.OnTipRealEnd
    })
    self:PlayAnimation(self.Out)
  else
    self:OnTipRealEnd()
  end
end

function Guide_TipsAsyncActionUIBase:OnTipRealEnd()
  self:UnbindAllFromAnimationFinished(self.OutAnim)
  self:Hide()
  self.IsShowing = false
  if self.Callback then
    self:Callback()
  end
  if self.OnGuideEnd:IsBound() then
    self.OnGuideEnd:Broadcast()
  end
end

return Guide_TipsAsyncActionUIBase
