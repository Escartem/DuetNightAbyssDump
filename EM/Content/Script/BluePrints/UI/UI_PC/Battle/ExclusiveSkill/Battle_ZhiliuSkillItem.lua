require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.MarkType = nil
  self.StopAnimationTable = {
    self.Empty_In,
    self.Empty_Out,
    self.Wind_In,
    self.Wind_Out,
    self.Thunder_In,
    self.Thunder_Out
  }
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Empty_In)
end

function M:PlayInAnimation(MarkType)
  if EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.ScanLline) then
    self.NextInAnimationType = MarkType
  else
    self.MarkType = MarkType
    self:StopAllAnimationsExceptScanLline()
    EMUIAnimationSubsystem:EMPlayAnimation(self, self[MarkType .. "_In"])
  end
end

function M:PlayOutAnimation()
  if not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.ScanLline) then
    self:StopAllAnimationsExceptScanLline()
    if self.MarkType then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self[self.MarkType .. "_Out"])
    else
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Empty_Out)
    end
  end
  self.MarkType = nil
end

function M:PlaySwitchAnimation()
  self:StopAllAnimationsExceptScanLline()
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.ScanLline)
end

function M:OnAnimationFinished(Animation)
  if Animation == self.ScanLline then
    if self.NextInAnimationType then
      self.MarkType = self.NextInAnimationType
      self.NextInAnimationType = nil
      EMUIAnimationSubsystem:EMPlayAnimation(self, self[self.MarkType .. "_In"])
    else
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Empty_In)
    end
  elseif Animation == self.Wind_Out or Animation == self.Thunder_Out or Animation == self.Empty_Out then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Empty_In)
  end
end

function M:StopAllAnimationsExceptScanLline()
  for _, Animation in ipairs(self.StopAnimationTable) do
    if EMUIAnimationSubsystem:EMAnimationIsPlaying(self, Animation) then
      EMUIAnimationSubsystem:EMStopAnimation(self, Animation)
    end
  end
end

function M:InitSkillItem()
  self:StopAllAnimationsExceptScanLline()
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Empty_In)
end

return M
