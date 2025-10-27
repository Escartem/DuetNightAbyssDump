require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function M:Construct()
  self:SetVisibility(UE4.ESlateVisibility.Visible)
end

function M:Open()
  self:StopAllAnimations()
  self:PlayAnimation(self.In)
end

function M:Close()
  self:StopAllAnimations()
  self:PlayAnimation(self.Out)
end

function M:Init(Content)
  self:RemoveTimer("CloseBubbleShow")
  self.Text_PopUp:SetText(Content.Text)
  self.OnCloseEvent = Content.OnCloseEvent
end

function M:OnAnimationFinished(InAnim)
  if InAnim == self.In then
    self:AddTimer(5, self.Close, false, 0, "CloseBubbleShow", true, self)
    self:PlayAnimation(self.Loop, 0, 0)
  elseif InAnim == self.Out then
    self:RemoveTimer("CloseBubbleShow")
    if self.OnCloseEvent and self.OnCloseEvent.Callback then
      self.OnCloseEvent.Callback(self.OnCloseEvent.Obj, self.OnCloseEvent.Params)
    end
  end
end

return M
