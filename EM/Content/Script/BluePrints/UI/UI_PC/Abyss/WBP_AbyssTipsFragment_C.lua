require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function M:Construct()
  self:BindToAnimationFinished(self.In, function()
    self:PlayAnimation(self.Loop)
  end)
  self:BindToAnimationFinished(self.Loop, function()
    self:PlayAnimation(self.Loop)
  end)
  self:BindToAnimationFinished(self.Out, function()
    self:StopAllAnimations()
    self:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end)
end

function M:Destruct()
  self:UnbindAllFromAnimationFinished(self.In)
  self:UnbindAllFromAnimationFinished(self.Loop)
  self:UnbindAllFromAnimationFinished(self.Out)
  self:RemoveTimer("CountDownTimer")
end

function M:Init(Params)
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if Params then
    self:SetText(Params.Text)
    self:SetIcon(Params.IconPath)
  end
end

function M:SetText(Text)
  if Text then
    self.Text_Describe:SetText(Text)
  end
end

function M:SetIcon(IconPath)
  if IconPath then
    local Object = LoadObject(IconPath)
    self.Icon_Fragement:SetBrushFromTexture(Object)
  end
end

function M:PlayInAnim()
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:StopAllAnimations()
  self:PlayAnimation(self.In)
  self:AddTimer(5, function()
    self:PlayAnimation(self.Out)
  end, false, 0, "CountDownTimer", true)
end

function M:Hide()
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:RemoveTimer("CountDownTimer")
  self:StopAllAnimations()
end

return M
