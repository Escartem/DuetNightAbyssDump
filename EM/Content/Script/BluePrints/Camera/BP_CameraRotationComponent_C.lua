local M = Class()

function M:StartCameraKeepSightOnActor(Actor, KeepSightTime, CameraAxisLockType, Speed, OnFinish)
  self.KeepSightActor = Actor
  self.KeepSightTime = KeepSightTime
  self.ElapsedKeepSightTime = 0
  self.CameraAxisLockType = CameraAxisLockType
  self.CameraKeepSightSpeed = Speed or 1
  self.OnKeepSightFinished = OnFinish
  local Owner = self:GetOwner()
  if Actor and self.OwnerController then
    Owner:AddDisableInputTag("CameraKeepSight")
    Owner.MoveInputCache:Set(0, 0, 0)
    Owner.MoveInput:Set(0, 0, 0)
    if Owner:GetMovementComponent() then
      Owner:GetMovementComponent():ConsumeInputVector()
    end
    local UIManager = UIManager(self)
    self.CameraKeepSightUI = UIManager and UIManager:LoadUI(nil, "CameraKeepSightUI", UIConst.ZORDER_FOR_NORMAL)
    local IsInPc = CommonUtils.GetDeviceTypeByPlatformName(self) == "PC"
    if not IsValid(self.CameraKeepSightUI) then
      self:FinishKeepSight()
    else
      self.bKeepingSightOnActor = true
      if Actor.Sphere then
        Actor.Sphere:SetCollisionEnabled(ECollisionEnabled.QueryOnly)
      end
      self.CameraKeepSightUI:BindEventOnMouseMove(function(MoveDelta, InDeltaTime)
        if IsInPc then
          self.KeepSightYawInputDelta = MoveDelta.X
          self.KeepSightPitchInputDelta = -MoveDelta.Y
        else
          local AddYaw = math.clamp(MoveDelta.X * Owner.TurnSpeedYaw, -1 * Owner.TurnLimitYaw, Owner.TurnLimitYaw)
          local AddPitch = math.clamp(MoveDelta.Y * Owner.TurnSpeedPitch, -1 * Owner.TurnLimitPitch, Owner.TurnLimitPitch)
          self.KeepSightYawInputDelta = -AddYaw
          self.KeepSightPitchInputDelta = -AddPitch
        end
        self:CameraKeepSightOnActorInTick(InDeltaTime)
      end)
    end
  else
    self:FinishKeepSight()
  end
end

function M:FinishKeepSight()
  self.bKeepingSightOnActor = false
  self.OwnerController:RemoveDisableRotationInputTag("CameraKeepSight")
  self:GetOwner():RemoveDisableInputTag("CameraKeepSight")
  self.KeepSightActor = nil
  self.ElapsedKeepSightTime = 0
  if self.CameraKeepSightUI then
    local UIManager = UIManager(self)
    if UIManager then
      UIManager:UnLoadUI("CameraKeepSightUI")
    end
    self.CameraKeepSightUI = nil
  end
  if IsValid(self.KeepSightActor) and self.KeepSightActor.Sphere then
    self.KeepSightActor.Sphere:SetCollisionEnabled(ECollisionEnabled.NoCollision)
  end
  if self.OnKeepSightFinished then
    local NewFunc = self.OnKeepSightFinished
    self.OnKeepSightFinished = nil
    NewFunc()
  end
end

function M:CameraKeepSightOnActorInTick(DeltaTime)
  if self.bKeepingSightOnActor then
    local X, Y
    if 0 ~= self.KeepSightPitchInputDelta or 0 ~= self.KeepSightYawInputDelta then
      X, Y = self.KeepSightYawInputDelta, self.KeepSightPitchInputDelta
    else
      X, Y = self.OwnerController:GetInputMouseDelta()
    end
    if self.CameraAxisLockType ~= "Yaw" then
      self.KeepSightYawInputDelta = X * self.CameraKeepSightSpeed
      self.OwnerController:AddYawInput(self.KeepSightYawInputDelta)
    end
    if self.CameraAxisLockType ~= "Pitch" then
      self.KeepSightPitchInputDelta = -Y * self.CameraKeepSightSpeed
      self.OwnerController:AddPitchInput(self.KeepSightPitchInputDelta)
    end
    local ActorLoc = self.KeepSightActor:K2_GetActorLocation()
    local CameraLoc = self.OwnerController.PlayerCameraManager:K2_GetActorLocation()
    local Distance = UE4.UKismetMathLibrary.VSize(ActorLoc - CameraLoc)
    local EndLoc = CameraLoc + self:GetOwner().CharCameraComponent:GetForwardVector() * Distance * 2
    local HitResults = TArray(FHitResult)
    UKismetSystemLibrary.LineTraceMulti(self, CameraLoc, EndLoc, ETraceTypeQuery.TraceScene, false, nil, EDrawDebugTrace.None, HitResults, true)
    local IsKeepingSight = false
    for _, value in pairs(HitResults) do
      if value.Actor == self.KeepSightActor then
        IsKeepingSight = true
        break
      end
    end
    if IsKeepingSight then
      self.ElapsedKeepSightTime = self.ElapsedKeepSightTime + DeltaTime
    else
      self.ElapsedKeepSightTime = 0
    end
    if self.ElapsedKeepSightTime > self.KeepSightTime then
      self:FinishKeepSight()
    end
  end
end

function M:CameraLookToActor(Actor, Duration, EasingFunc, bDisableUserInput)
  local Owner = self:GetOwner()
  
  local function OnEnd()
    if Owner and Owner.OnCameraLookToActorEnd and Owner.OnCameraLookToActorEnd:IsBound() then
      Owner.OnCameraLookToActorEnd:Broadcast(self)
    end
  end
  
  local function OnNoneFound()
    if Owner and Owner.OnCameraLookToActorNoneFound and Owner.OnCameraLookToActorNoneFound:IsBound() then
      Owner.OnCameraLookToActorNoneFound:Broadcast(self)
    end
  end
  
  self:CameraLookToTarget(Actor, nil, Duration, EasingFunc, bDisableUserInput, nil, nil, nil, false, false, OnEnd, OnNoneFound)
end

function M:CameraLookToTarget(Actor, BoneName, Duration, EasingFunc, bDisableUserInput, MaxAngle, MaxDistance, ObscuredMaxTime, bPauseWhenShooting, bLookAndLockOnTarget, OnEnd, OnNoneFound, OnInterrupt)
  if self.IsCameraLookingToTarget then
    self:StopCameraLookToTarget()
  end
  self:StopControlRotationLerp()
  self.OnLookToTargetNoneFound = OnNoneFound
  if IsValid(Actor) then
    self.TargetActor = Actor
    self.FollowedBoneName = BoneName
    self.TotalTime_Rotation = Duration
    self.EasingFunc_Rotation = EasingFunc or UE4.EEasingFunc.SinusoidalInOut
    self.IsDisableInput = bDisableUserInput
    if self.IsDisableInput then
      self.OwnerPlayer:AddDisableInputTag("CameraLookToTarget")
      self.OwnerPlayer:CancelSkill(nil, false)
      self.OwnerPlayer.MoveInputCache:Set(0, 0, 0)
      self.OwnerPlayer.MoveInput:Set(0, 0, 0)
      if self.OwnerPlayer:GetMovementComponent() then
        self.OwnerPlayer:GetMovementComponent():ConsumeInputVector()
      end
    end
    self.MaxDistance = MaxDistance
    self.ObscuredMaxTime = ObscuredMaxTime
    self.IsPauseWhenShooting = bPauseWhenShooting
    self.bLookAndLockOnTarget = bLookAndLockOnTarget
    self.OnLookToTargetEnd = OnEnd
    self.OnLookToTargetInterrupt = OnInterrupt
    self.PassedTime_Rotation = 0
    self.StartCtrlRotation = self.OwnerController:GetControlRotation()
    self.StartCtrlRotation.Roll = 0
    local TargetLoc
    if self.FollowedBoneName and self.FollowedBoneName ~= "" and self.TargetActor.Mesh then
      TargetLoc = self.TargetActor.Mesh:GetSocketLocation(self.FollowedBoneName)
    else
      TargetLoc = self.TargetActor:K2_GetActorLocation()
    end
    if Duration <= 0 then
      self.TargetCtrlRotation = self:CalcTargetCtrlRotation(TargetLoc, true)
      self.OwnerController:SetControlRotation(self.TargetCtrlRotation)
      self:StopCameraLookToTarget()
      return
    else
      self.TargetCtrlRotation = self:CalcTargetCtrlRotation(TargetLoc)
    end
    self.IsCameraLookingToTarget = true
    self.OwnerController:AddDisableRotationInputTag("CameraLookToTarget")
    if self.ObscuredMaxTime then
      self:StartCameraLineTrace()
    end
  elseif self.OnLookToTargetNoneFound then
    self.OwnerPlayer:AddTimer(0.01, self.OnLookToTargetNoneFound, false, 0, "NoneFound")
  end
end

function M:StopCameraLookToTarget()
  self:ClearCurrentLockOnInfo()
  self.OwnerPlayer:RemoveTimer("CameraLineTrace")
  self.OwnerController:RemoveDisableRotationInputTag("CameraLookToTarget")
  self.IsPitchUp = false
  self.IsLockOn = false
  self.PreIsLockOn = false
  self:ResetLockOnReasons()
  self.OwnerPlayer:RemoveDisableInputTag("CameraLookToTarget")
  if self.IsCameraLookingToTarget then
    self.IsCameraLookingToTarget = false
    self.IsLookingToTargetInterrupted = true
    if self.OnLookToTargetInterrupt then
      self.OnLookToTargetInterrupt()
    end
  else
    self.IsLookingToTargetInterrupted = false
  end
  if self.OnLookToTargetEnd then
    self.OnLookToTargetEnd()
  end
end

function M:StartCameraLineTrace()
  self.ObscuredTime = 0
  self.CameraLineTracingTickTime = 0.3
  
  local function LineTraceTest()
    if not self.OwnerController or not self.OwnerController:IsPlayerController() then
      return
    end
    if not IsValid(self.TargetActor) then
      self:StopCameraLookToTarget()
      return
    end
    local CameraLoc = self.OwnerController.PlayerCameraManager:K2_GetActorLocation()
    local TargetLoc
    if self.FollowedBoneName and self.FollowedBoneName ~= "" and self.TargetActor.Mesh then
      TargetLoc = self.TargetActor.Mesh:GetSocketLocation(self.FollowedBoneName)
    else
      TargetLoc = self.TargetActor:K2_GetActorLocation()
    end
    local HitResult = FHitResult()
    local bHit = UE4.UKismetSystemLibrary.LineTraceSingle(self, CameraLoc, TargetLoc, ETraceTypeQuery.TraceScene, false, nil, 0, HitResult, true)
    if bHit then
      self.ObscuredTime = self.ObscuredTime + self.CameraLineTracingTickTime
    else
      self.ObscuredTime = self.CameraLineTracingTickTime
    end
  end
  
  self.OwnerPlayer:AddTimer(self.CameraLineTracingTickTime, LineTraceTest, true, 0, "CameraLineTrace")
end

function M:SetCameraPitchBySkill(ParametersTable)
  local NewRotation = FRotator(ParametersTable.Pitch, 0, 0)
  self:SetControlRotation_Lerp(NewRotation, ParametersTable.InterpTime, ParametersTable.InterpSpeed, false, nil)
  if ParametersTable.InputTag then
    self.OwnerController:AddDisablePitchRotationInputTag(ParametersTable.InputTag)
  end
end

function M:EnablePitchRotInputBySkill(ParametersTable)
  if ParametersTable.InputTag then
    self.OwnerController:RemoveDisablePitchRotationInputTag(ParametersTable.InputTag)
    self:ResetCameraPitch()
  end
end

return M
