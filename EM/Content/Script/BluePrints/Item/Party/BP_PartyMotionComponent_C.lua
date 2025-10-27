require("UnLua")
local M = Class({
  "BluePrints.Common.TimerMgr"
})

function M:ReceiveTick(DeltaSeconds)
  if self.IsMoveOneTgt then
    self:InMoveOneTgt(DeltaSeconds)
  elseif self.IsRotateOneTgt then
    self:InRotateOneTgt(DeltaSeconds)
  elseif self.IsRotateKeep then
  end
end

function M:OnForcePause()
  self.ForcePause = true
end

function M:MoveOneTgt()
  self.Motion = self:GetOwner()
  if not self.Motion then
    return
  end
  self.IsMoveOneTgt = true
  if self.ForcePause and self.CurrentTime and self.CurrentTime >= 0 then
  else
    self.StartLocation = self.Motion:K2_GetActorLocation()
    self.TargetLocationAbs = UKismetMathLibrary.TransformLocation(self.Motion:GetTransform(), self.Motion.TargetLocation)
    self.CurrentTime = 0.0
    self.MoveTime = self.Motion.MoveTime
    self.MoveUniformly = self.Motion.MoveUniformly
    self.bMovingToTarget = true
    self.bIsPaused = false
  end
  self.ForcePause = false
end

function M:InMoveOneTgt(DeltaTime)
  if IsClient(self.Motion) and not self.Motion.UseClient then
    if self.bMovingToTarget then
      self.Motion:MoveLocationLerp(DeltaTime, self.StartLocation, self.TargetLocationAbs, 0, self.MoveTime, self.MoveUniformly and 0 or 1)
    else
      self.Motion:MoveLocationLerp(DeltaTime, self.TargetLocationAbs, self.StartLocation, 0, self.MoveTime, self.MoveUniformly and 0 or 1)
    end
    return
  end
  if not (not self.bIsPaused and self.Motion) or self.ForcePause then
    return
  end
  self.CurrentTime = self.CurrentTime + DeltaTime
  local Progress = self.CurrentTime / self.MoveTime
  if Progress > 1.0 then
    self:PauseBeforeReverse()
    return
  end
  if self.Motion.UseClient then
    local NewPosition
    if self.MoveUniformly then
      NewPosition = self:InterpolateLinear(Progress)
    else
      NewPosition = self:InterpolateAccelerated(Progress)
    end
    self.Motion:K2_SetActorLocation(NewPosition, false, nil, false)
  elseif self.bMovingToTarget then
    self.Motion:MoveLocationLerp(DeltaTime, self.StartLocation, self.TargetLocationAbs, 0, self.MoveTime, self.MoveUniformly and 0 or 1)
  else
    self.Motion:MoveLocationLerp(DeltaTime, self.TargetLocationAbs, self.StartLocation, 0, self.MoveTime, self.MoveUniformly and 0 or 1)
  end
end

function M:InterpolateLinear(Progress)
  if self.bMovingToTarget then
    return self.StartLocation + (self.TargetLocationAbs - self.StartLocation) * Progress
  else
    return self.TargetLocationAbs + (self.StartLocation - self.TargetLocationAbs) * Progress
  end
end

function M:InterpolateAccelerated(Progress)
  local t = Progress * Progress * (3 - 2 * Progress)
  if self.bMovingToTarget then
    return self.StartLocation + (self.TargetLocationAbs - self.StartLocation) * t
  else
    return self.TargetLocationAbs + (self.StartLocation - self.TargetLocationAbs) * t
  end
end

function M:PauseBeforeReverse()
  self.bIsPaused = true
  self.CurrentTime = 0
  self.Motion:ResetMovementInfo()
  local TeleportBack = self.Motion.TeleportBackToOrigin
  local PauseTime = self.bMovingToTarget and self.Motion.PauseTime1 or self.Motion.PauseTime2
  self:AddTimer(PauseTime, function()
    self.bIsPaused = false
    if TeleportBack and self.bMovingToTarget then
      self.Motion:K2_SetActorLocation(self.StartLocation)
      self.TargetLocationAbs = UKismetMathLibrary.TransformLocation(self.Motion:GetTransform(), self.Motion.TargetLocation)
      self.bMovingToTarget = true
    else
      self.bMovingToTarget = not self.bMovingToTarget
    end
  end, false, 0)
end

function M:RotateOneTgt()
  self.Motion = self:GetOwner()
  if not self.Motion then
    return
  end
  self.IsRotateOneTgt = true
  if self.ForcePause and self.CurrentTime and self.CurrentTime >= 0 then
  else
    self.CurrentTime = 0
    self.RotateTime = self.Motion.RotateTime
    self.RotateUniformly = self.Motion.RotateUniformly
    self.bRotatingToTarget = true
    self.bIsPaused = false
    self.KeepingRotate = self.Motion.KeepingRotate
    self.TargetRotation = self.Motion.TargetRotation or FRotator(0, 90, 0)
    self.TotalRotated = FRotator(0, 0, 0)
  end
  self.ForcePause = false
end

function M:InRotateOneTgt(DeltaTime)
  if IsClient(self.Motion) and not self.Motion.UseClient then
    self.CurrentTime = self.CurrentTime + DeltaTime
    local progress = math.min(self.CurrentTime / self.RotateTime, 1.0)
    local currentRelativeRot
    if self.RotateUniformly then
      currentRelativeRot = self:InterpolateLinearRot(progress)
    else
      currentRelativeRot = self:InterpolateAcceleratedRot(progress)
    end
    local deltaRot = currentRelativeRot - self.TotalRotated
    self.TotalRotated = currentRelativeRot
    self.Motion:MoveRotationLerp(DeltaTime, deltaRot)
    return
  end
  if self.bIsPaused or not self.Motion then
    return
  end
  self.CurrentTime = self.CurrentTime + DeltaTime
  local progress = math.min(self.CurrentTime / self.RotateTime, 1.0)
  local currentRelativeRot
  if self.RotateUniformly then
    currentRelativeRot = self:InterpolateLinearRot(progress)
  else
    currentRelativeRot = self:InterpolateAcceleratedRot(progress)
  end
  local deltaRot = currentRelativeRot - self.TotalRotated
  self.TotalRotated = currentRelativeRot
  if self.Motion.UseClient then
    self.Motion:K2_AddActorLocalRotation(deltaRot, false, nil, false)
  else
    self.Motion:MoveRotationLerp(DeltaTime, deltaRot)
  end
  if progress >= 1.0 then
    self:PauseBeforeReverseRot()
  end
end

function M:InterpolateLinearRot(progress)
  local target = self.TargetRotation
  local factor = self.bRotatingToTarget and progress or 1.0 - progress
  return FRotator(target.Pitch * factor, target.Yaw * factor, target.Roll * factor)
end

function M:InterpolateAcceleratedRot(progress)
  local t = progress * progress * (3 - 2 * progress)
  local target = self.TargetRotation
  local factor = self.bRotatingToTarget and t or 1.0 - t
  return FRotator(target.Pitch * factor, target.Yaw * factor, target.Roll * factor)
end

function M:PauseBeforeReverseRot()
  self.bIsPaused = true
  self.CurrentTime = 0
  self.Motion:ResetMovementInfo()
  local PauseTime = self.bRotatingToTarget and self.Motion.RotatePauseTime1 or self.Motion.RotatePauseTime2
  self:AddTimer(PauseTime, function()
    self.bIsPaused = false
    self.TotalRotated = FRotator(0, 0, 0)
    if self.KeepingRotate and self.bRotatingToTarget then
      self.bRotatingToTarget = true
    else
      self.bRotatingToTarget = not self.bRotatingToTarget
    end
  end, false, 0)
end

return M
