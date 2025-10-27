require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:OnLoaded()
  M.Super.OnLoaded(self)
  self:SetVisibility(ESlateVisibility.Collapsed)
  
  local function OnAnimationFinished()
    self:SetVisibility(ESlateVisibility.Collapsed)
  end
  
  self:BindToAnimationFinished(self.Auto_In, {self, OnAnimationFinished})
end

function M:Refresh()
  self:SetVisibility(ESlateVisibility.HitTestInvisible)
  if not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Auto_In) then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Auto_In)
  end
end

function M:Close()
  M.Super.Close(self)
end

return M
