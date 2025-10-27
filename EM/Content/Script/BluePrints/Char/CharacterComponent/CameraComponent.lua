local EMCache = require("EMCache.EMCache")
local CameraComponent = {}

function CameraComponent:OnCharacterReady()
  if self.FromOtherWorld then
    return
  end
  rawset(self, "CharSpringArmComponent", self.CharSpringArmComponent)
  rawset(self, "CameraRotationComponent", self.CameraRotationComponent)
  rawset(self, "CharCameraComponent", self.CharCameraComponent)
  self.CharSpringArmComponent:InitComponent()
  self.CameraRotationComponent:InitComponent()
  self:EnableAutoResetCameraPitch(EMCache:Get("CameraBack") or "Enable")
  local DefaultSpringArmRate = EMCache:Get("SpringArmRate") or DataMgr.Option.SpringArmRate.DefaultValue / DataMgr.Option.SpringArmRate.ScrollMappingScale
  self:SetDefaultSpringArmRate(DefaultSpringArmRate)
  self:SetCameraYawFollow()
  rawset(self, "MaxDistance_LockOn", 4000)
  rawset(self, "MaxTime_LockOnObscured", 2)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    rawset(self, "IsPlayerCameraUnlock", false)
  else
    rawset(self, "IsPlayerCameraUnlock", true)
  end
end

function CameraComponent:EnableAutoResetCameraPitch(Method)
  self.CameraRotationComponent:EnableAutoResetCameraPitch(UE4.EResetPitchMethod[Method] or 0)
end

function CameraComponent:SetDefaultSpringArmRate(Value)
  self.DefaultSpringArmRate = Value
  self.SpringArmRate = Value
  local BaseTargetArmLength, BaseSocketOffset = self:SetCameraSpringRate(self.DefaultSpringArmRate)
  self:SetBaseTargetArmLengthForReset(BaseTargetArmLength)
  self:SetBaseSocketOffsetForReset(BaseSocketOffset)
  self:ResetSpringArm()
  self:ResetSocketOffset()
end

function CameraComponent:SetBaseTargetArmLengthForReset(ArmLength)
  self.CharSpringArmComponent.BaseSpringArmForReset = ArmLength
end

function CameraComponent:SetBaseSocketOffsetForReset(SocketOffset)
  self.CharSpringArmComponent.BaseSocketOffsetForReset = SocketOffset
end

function CameraComponent:ApplyCameraShake(CameraShake, ShakeScale)
  local PlayerCameraManager = self.Controller and self.Controller.PlayerCameraManager
  if nil == PlayerCameraManager or 0 ~= UGameplayStatics.GetPlayerControllerID(self.Controller) then
    return
  end
  if self.CharSpringArmComponent:IsCameraOverlapped() then
    return
  end
  PlayerCameraManager:StartCameraShake(CameraShake, ShakeScale)
end

function CameraComponent:ResetCameraPitch()
  if IsValid(self.CameraRotationComponent) then
    return self.CameraRotationComponent:ResetCameraPitch()
  end
end

function CameraComponent:ResetSpringArm()
  if IsValid(self.CharSpringArmComponent) then
    return self.CharSpringArmComponent:ResetSpringArm()
  end
end

function CameraComponent:ResetSocketOffset()
  if IsValid(self.CharSpringArmComponent) then
    return self.CharSpringArmComponent:ResetSocketOffset()
  end
end

function CameraComponent:SetCameraYawFollow()
  self.CameraRotationComponent.bSwitchOnCameraFollow = EMCache:Get("CameraYawFollow")
  if self.CameraRotationComponent.bSwitchOnCameraFollow == nil then
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
      self.CameraRotationComponent.bSwitchOnCameraFollow = true
    elseif CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
      self.CameraRotationComponent.bSwitchOnCameraFollow = false
    end
  end
end

function CameraComponent:SwitchCameraYawFollow(bSwitchOn)
  self.CameraRotationComponent.bSwitchOnCameraFollow = bSwitchOn
end

function CameraComponent:CalcTargetCtrlRotation(TargetPoint, bImmediately)
  local ControlRotation = self.Controller:GetControlRotation()
  local TargetCtrlRotation
  local CameraRotation = self.CharCameraComponent:K2_GetComponentRotation()
  local PitchOffset = CameraRotation.Pitch - ControlRotation.Pitch
  local TargetPointLookFrom = self:CalcTargetPointLookFrom(TargetPoint)
  TargetCtrlRotation = UE4.UKismetMathLibrary.FindLookAtRotation(TargetPointLookFrom, TargetPoint)
  if not bImmediately then
    local OnlyUsePitch = UE4.UKismetMathLibrary.FindLookAtRotation(self.CharCameraComponent:K2_GetComponentLocation(), TargetPoint)
    TargetCtrlRotation.Pitch = OnlyUsePitch.Pitch
  end
  TargetCtrlRotation.Pitch = TargetCtrlRotation.Pitch - PitchOffset
  if not self:CheckCanRotateToTarget(TargetPoint) then
    TargetCtrlRotation.Pitch = UE4.UKismetMathLibrary.FClamp(TargetCtrlRotation.Pitch, self.CameraPitchLimitMin, self.CameraPitchLimitMax)
  end
  TargetCtrlRotation.Roll = 0
  return TargetCtrlRotation
end

function CameraComponent:CheckCanRotateToTarget(TargetPoint)
  local V = self.CharSpringArmComponent:K2_GetComponentLocation() - TargetPoint
  local OutsideLen = math.abs(V.Z) * UE4.UKismetMathLibrary.DegTan(0.5)
  V.Z = 0
  local R = UE4.UKismetMathLibrary.VSize(V)
  return R > self.CharSpringArmComponent.SocketOffset.Y * OutsideLen
end

function CameraComponent:CalcTargetPointLookFrom(TargetPoint)
  local PA = TargetPoint
  local PO = self.CharSpringArmComponent:K2_GetComponentLocation()
  local Radius = self.CharSpringArmComponent.SocketOffset.Y
  local AO = PO - PA
  AO.Z = 0
  local SizeAO = UE4.UKismetMathLibrary.VSize(AO)
  local CosAOB = Radius / SizeAO
  local AngleAOB = UE4.UKismetMathLibrary.DegAcos(CosAOB)
  local OBN = UE4.UKismetMathLibrary.RotateAngleAxis(UE4.UKismetMathLibrary.Normal(AO), AngleAOB * -1, FVector(0, 0, 1))
  local OB = OBN * Radius
  local PB = OB + PO
  local CameraRotation = self.CharCameraComponent:K2_GetComponentRotation()
  local dir = UE4.UKismetMathLibrary.GetForwardVector(CameraRotation)
  local CurrentPointLookFrom = dir * self.CharSpringArmComponent.BaseTargetArmLength + self.CharCameraComponent:K2_GetComponentLocation()
  PB.Z = CurrentPointLookFrom.Z
  return PB
end

function CameraComponent:CalcDiffAngleInYaw(Forward, Target)
  return self:CalcVectorAngle(FVector(Forward.X, Forward.Y, 0), FVector(Target.X, Target.Y, 0))
end

function CameraComponent:CalcCurrentPitchAngle(Forward, Right)
  local HorizonVector = FVector(Forward.X, Forward.Y, 0)
  local AngleValue = self:CalcVectorAngle(Forward, HorizonVector)
  local CrossResult = Forward:Cross(HorizonVector)
  local DotResult = CrossResult:Dot(Right)
  if DotResult >= 0 then
    return AngleValue
  else
    return -AngleValue
  end
end

function CameraComponent:StopCameraLookOrLockOnTarget()
  local rest = false
  if self.CameraRotationComponent.IsCameraLookingToTarget then
    self.CameraRotationComponent:StopCameraLookToTarget()
    rest = true
  end
  return rest
end

function CameraComponent:StopAllAutoControlRotation()
  local rest = false
  if self.CameraRotationComponent:GetIsControllerAutoRotating() then
    self.CameraRotationComponent:StopControlRotationLerp()
    rest = true
  elseif self.CameraRotationComponent.IsCameraLookingToTarget then
    self.CameraRotationComponent:StopCameraLookToTarget()
    rest = true
  end
  return rest
end

function CameraComponent:CalcCameraRotation()
  local ControlRotation = self.Controller:GetControlRotation()
  local CameraRotation = self.CharCameraComponent:K2_GetComponentRotation()
  local PitchOffset = CameraRotation.Pitch - ControlRotation.Pitch
  local result = FRotator(0, 0, 0)
  result.Yaw = ControlRotation.Yaw
  result.Pitch = ControlRotation.Pitch + PitchOffset
  return result
end

function CameraComponent:FlipCameraLockOnMonster()
  if self:CharacterInTag("Shooting") then
    return
  end
  if self:StopCameraLookOrLockOnTarget() then
    return
  end
  local PreLockOnInfo = self.CameraRotationComponent.PreLockOnInfo
  if IsValid(PreLockOnInfo) then
    self.CameraRotationComponent.CurLockOnInfo = PreLockOnInfo
    
    local function OnEnd()
      self.CameraRotationComponent.PreLockOnInfo = nil
      self.CameraRotationComponent.CurLockOnInfo = nil
    end
    
    self.CameraRotationComponent:CameraLookToTarget(PreLockOnInfo.Actor, PreLockOnInfo.Bone, self.CameraRotationComponent.Duration_LockOn, nil, false, self.CameraRotationComponent.MaxAngle_ReLockOn, self.MaxDistance_LockOn, self.MaxTime_LockOnObscured, true, true, OnEnd, OnEnd, OnEnd)
  else
    self:ResetCameraAndSpringArm()
  end
end

function CameraComponent:CameraUnlockOnBySkill(Source, ParamentsTable)
  if not Source then
    return
  end
  if self.IsPlayerCameraUnlock then
    self:BanCameraLockOnBySkill(ParamentsTable)
  else
    local CurLockOnInfo = self.CameraRotationComponent.CurLockOnInfo
    if self.CameraRotationComponent.IsCameraLookingToTarget and CurLockOnInfo and CurLockOnInfo.Actor == Source then
      self.CameraRotationComponent:StopCameraLookToTarget()
    end
    if ParamentsTable and ParamentsTable.CantLockTime then
      self:SetTargetCantBeLockOn(Source.Eid, true)
      if ParamentsTable.CantLockTime > 0 then
        local function SetCanBeLockOn()
          self:SetTargetCantBeLockOn(Source.Eid, false)
        end
        
        self:AddTimer(ParamentsTable.CantLockTime, SetCanBeLockOn, false, 0, Source.Eid .. "SetCanBeLockOn", false)
      end
    end
  end
end

function CameraComponent:CameraRelockOnBySkill(Source)
  if not Source then
    return
  end
  if self.IsPlayerCameraUnlock then
    self.CameraRotationComponent.SetCanLockOn = true
    if self:IsExistTimer("BanCameraLockOn") then
      self:RemoveTimer("BanCameraLockOn")
    end
  else
    self:SetTargetCantBeLockOn(Source.Eid, false)
    if self:IsExistTimer(Source.Eid .. "SetCanBeLockOn") then
      self:RemoveTimer(Source.Eid .. "SetCanBeLockOn")
    end
  end
end

function CameraComponent:BanCameraLockOnBySkill(ParamentsTable)
  if ParamentsTable and ParamentsTable.CantLockTime then
    local function SetCanLockOn()
      self.CameraRotationComponent.SetCanLockOn = true
    end
    
    self.CameraRotationComponent.SetCanLockOn = false
    if self:IsExistTimer("BanCameraLockOn") then
      self:RemoveTimer("BanCameraLockOn")
    end
    if ParamentsTable.CantLockTime > 0 then
      self:AddTimer(ParamentsTable.CantLockTime, SetCanLockOn, false, 0, "BanCameraLockOn", false)
    end
  end
end

function CameraComponent:SetTargetCantBeLockOn(Eid, CantBeLockOn)
  self.CameraRotationComponent:SetTargetCantBeLockOn(Eid, CantBeLockOn)
end

function CameraComponent:StartCameraKeepSightOnActor(Actor, KeepSightTime, CameraAxisLockType, Speed, OnFinish)
  self.CameraRotationComponent:StartCameraKeepSightOnActor(Actor, KeepSightTime, CameraAxisLockType, Speed, OnFinish)
end

function CameraComponent:FinishKeepSight()
  self.CameraRotationComponent:FinishKeepSight()
end

function CameraComponent:SetControlPitchLimit(MinPitch, MaxPitch, TimeToInterpSpeed, InterpSpeed)
  if not self.Controller then
    return
  end
  if self.IsSpawnedByMovieCaptureSequence then
    return
  end
  if not IsValid(self.CameraRotationComponent) or not IsValid(self.CameraControlComponent) then
    return
  end
  local CurrentRotation = self.Controller:GetControlRotation()
  local CurrentPitch = CurrentRotation.Pitch
  local CurrentYaw = CurrentRotation.Yaw
  if CurrentPitch > 90 and MinPitch > CurrentPitch - 360 then
    self.CameraRotationComponent:SetControlRotationAbsolute_Lerp(FRotator(MinPitch, CurrentYaw, 0), TimeToInterpSpeed, InterpSpeed, false, function()
      self.CameraControlComponent:ModifyViewPitch(MinPitch, MaxPitch)
    end)
  elseif CurrentPitch < 90 and MaxPitch < CurrentPitch then
    self.CameraRotationComponent:SetControlRotationAbsolute_Lerp(FRotator(MaxPitch, CurrentYaw, 0), TimeToInterpSpeed, InterpSpeed, false, function()
      self.CameraControlComponent:ModifyViewPitch(MinPitch, MaxPitch)
    end)
  else
    self.CameraControlComponent:ModifyViewPitch(MinPitch, MaxPitch)
  end
end

return CameraComponent
