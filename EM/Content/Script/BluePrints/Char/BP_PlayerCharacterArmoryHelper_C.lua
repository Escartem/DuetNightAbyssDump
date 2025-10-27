require("UnLua")
local M = Class()

function M:ReceiveBeginPlay()
  self.Overridden.ReceiveBeginPlay(self)
  self.ArmoryLocation = GlobalArmoryLocations or {}
  self.PPSetting_Default = self.PPSetting_Default or self.Camera.PostProcessSettings
end

function M:UpdatePPSetting(PPSettingType)
  if 0 == PPSettingType then
    self.Camera.PostProcessSettings = self.PPSetting_Default
  elseif 1 == PPSettingType then
    self.Camera.PostProcessSettings = self.PPSetting_PreviewCommon
  elseif 2 == PPSettingType then
    self.Camera.PostProcessSettings = self.PPSetting_PreviewCommon
  end
end

function M:ClearPPSetting()
  self.Camera.PostProcessSettings.WeightedBlendables.Array:Clear()
end

function M:ReceiveEndPlay()
  self.ArmoryLocation = nil
end

function M:SetCameraStartTrans(StartTransform, FOV, Player)
  local CameraMgr = UGameplayStatics.GetPlayerCameraManager(self, 0)
  self.RecoverEndTransform = FTransform()
  self.RecoverEndTransform.Translation = CameraMgr:GetCameraLocation()
  self.RecoverEndTransform.Rotation = CameraMgr:GetCameraRotation():ToQuat()
  StartTransform = StartTransform or self.RecoverEndTransform
  self.OriginalFOV = FOV
  if not self.OriginalFOV then
    self.OriginalFOV = CameraMgr:GetFOVAngle()
  end
  if Player and self.Player ~= Player and Player.Mesh then
    self.OriginalRootTrans = Player.Mesh:K2_GetComponentToWorld()
  end
  self.Player = Player
  self.ViewActor = Player
  self.EndPos, self.EndRot = UE4.UKismetMathLibrary.BreakTransform(StartTransform)
  self.StartPos = StartTransform.Translation
  self.EnableCameraScrolling = false
  self:CalcCircle()
  self.Camera:K2_SetWorldTransform(StartTransform, false, nil, false)
  self:OnCameraRotated()
  local CurRot = self.Player:K2_GetActorRotation()
  self.OriginalRotation = FRotator(CurRot.Pitch, CurRot.Yaw, CurRot.Roll)
  self:SetTickableWhenPaused(true)
end

function M:SetCameraStartInfo(Location, Rotation, FOV)
  if not self.ViewActor then
    return
  end
  local CameraMgr = UGameplayStatics.GetPlayerCameraManager(self, 0)
  self.RecoverEndTransform = FTransform()
  self.RecoverEndTransform.Translation = CameraMgr:GetCameraLocation()
  self.RecoverEndTransform.Rotation = CameraMgr:GetCameraRotation():ToQuat()
  self.OriginalFOV = FOV
  if not self.OriginalFOV then
    self.OriginalFOV = CameraMgr:GetFOVAngle()
  end
  self.EndPos, self.EndRot = Location, Rotation
  self.StartPos = Location
  self.EnableCameraScrolling = false
  self:CalcCircle()
  self:SetTickableWhenPaused(true)
end

function M:SetOriginalRotation(Rotator)
  self.OriginalRotation = FRotator(Rotator.Pitch, Rotator.Yaw, Rotator.Roll)
end

function M:OnRoleChanged()
  self:SetViewActorRotation(self.OriginalRotation)
  if self.Player then
    self.OriginalRootTrans = self.Player.Mesh:K2_GetComponentToWorld()
  end
end

function M:TransformCamera(EndLocation, EndRotation, Duration, Ease, StartLocation, StartRotation)
  if not self.ViewActor then
    return
  end
  self:ResetStart(StartLocation, StartRotation)
  local trans = self.OriginalRootTrans or self.ViewActor.RootComponent:K2_GetComponentToWorld()
  self.EndPos = UE4.UKismetMathLibrary.TransformLocation(trans, EndLocation)
  self.EndRot = UE4.UKismetMathLibrary.TransformRotation(trans, EndRotation)
  self:CalcCircle()
  self.Duration = Duration or 0
  self:Move(function()
    self.BaseScrollLocation = self.Camera:K2_GetComponentLocation()
    self:UpdateScrolDirection()
  end, Ease or 14)
  return self.StartPos, self.EndPos
end

function M:CalcCircle()
  local StartDiff = self:GetViewActorLocation() - self.StartPos
  local EndDiff = self:GetViewActorLocation() - self.EndPos
  self.CenterOfCircle = self:GetViewActorLocation()
  if StartDiff:Size() > EndDiff:Size() then
    self.CenterOfCircle.Z = self.EndPos.Z
  else
    self.CenterOfCircle.Z = self.StartPos.Z
  end
  self.StartArmLength = UE4.UKismetMathLibrary.Vector_Distance(self.StartPos, self.CenterOfCircle)
  self.StartForward = UE4.UKismetMathLibrary.FindLookAtRotation(self.CenterOfCircle, self.StartPos)
  self.EndArmLength = UE4.UKismetMathLibrary.Vector_Distance(self.EndPos, self.CenterOfCircle)
  self.EndForward = UE4.UKismetMathLibrary.FindLookAtRotation(self.CenterOfCircle, self.EndPos)
end

function M:RecorverCamera(Obj_OnRecoverEnd, OnRecoverEnd, DurationTime, StartTransform, RelativeLocation, RelativeRotation)
  self:SetViewActorRotation(self.OriginalRotation)
  self:ResetStart(RelativeLocation, RelativeRotation, StartTransform or self.OriginalRootTrans)
  self.Duration = DurationTime or 0
  self.EndPos, self.EndRot = UE4.UKismetMathLibrary.BreakTransform(self.RecoverEndTransform)
  self:CalcCircle()
  
  local function OnCompleteFunc()
    if OnRecoverEnd then
      OnRecoverEnd(Obj_OnRecoverEnd)
    end
  end
  
  if self.Duration <= 0 then
    OnCompleteFunc()
  else
    self:Move(OnCompleteFunc, 6)
    self:StartFOVAnim(self.OriginalFOV, 0, 6)
  end
end

function M:Move(CompleteFunc, Ease)
  local Duration = self.Duration
  if Duration <= 0 then
    Duration = 0.01
  end
  local yawRotateRate = 0
  local needLerpYaw = false
  self:YawNormalize(self.StartRot)
  self:YawNormalize(self.EndRot)
  self:YawNormalize(self.StartForward)
  self:YawNormalize(self.EndForward)
  local isRight = true
  local sub = math.abs((self.EndForward - self.StartForward).Yaw)
  if sub < 180 then
    if sub > 90 then
      needLerpYaw = true
      if self.StartForward.Yaw < self.EndForward.Yaw then
        isRight = true
      else
        isRight = false
      end
    end
  else
    sub = 360 - sub
    if sub > 90 then
      needLerpYaw = true
      if self.StartForward.Yaw < self.EndForward.Yaw then
        isRight = false
      else
        isRight = true
      end
    end
  end
  if not isRight then
    if self.EndRot.Yaw > self.StartRot.Yaw then
      yawRotateRate = -(360 - (self.EndRot.Yaw - self.StartRot.Yaw)) / Duration
    else
      yawRotateRate = (self.EndRot.Yaw - self.StartRot.Yaw) / Duration
    end
  elseif self.EndRot.Yaw > self.StartRot.Yaw then
    yawRotateRate = (self.EndRot.Yaw - self.StartRot.Yaw) / Duration
  else
    yawRotateRate = (360 + (self.EndRot.Yaw - self.StartRot.Yaw)) / Duration
  end
  if self.LTweenHandle_Scroll and IsValid(self.LTweenHandle_Scroll) then
    ULTweenBPLibrary.KillIfIsTweening(self, self.LTweenHandle_Scroll, true)
  end
  if self.LTweenHandle and IsValid(self.LTweenHandle) then
    ULTweenBPLibrary.KillIfIsTweening(self, self.LTweenHandle, true)
  end
  
  local function CameraTransByLerpValue(value)
    local armLength = UE4.UKismetMathLibrary.Lerp(self.StartArmLength, self.EndArmLength, value)
    local armForward = UE4.UKismetMathLibrary.RLerp(self.StartForward, self.EndForward, value, true)
    local temp = self.CenterOfCircle + UE4.UKismetMathLibrary.Multiply_VectorFloat(UE4.UKismetMathLibrary.GetForwardVector(armForward), armLength)
    local lerpRot = UE4.UKismetMathLibrary.RLerp(self.StartRot, self.EndRot, value, true)
    if needLerpYaw then
      lerpRot.Yaw = self.StartRot.Yaw + yawRotateRate * value * Duration
    end
    self.Camera:K2_SetWorldLocationAndRotation(temp, lerpRot, false, nil, false)
    self:OnCameraRotated()
  end
  
  if self.Duration <= 0 then
    CameraTransByLerpValue(1)
    if CompleteFunc then
      CompleteFunc()
    end
    return
  end
  self.LTweenHandle = UE4.ULTweenBPLibrary.FloatTo(self, {
    self,
    function(_, value)
      CameraTransByLerpValue(value)
    end
  }, 0, 1, Duration, 0, Ease)
  local LTweenActor = UE4.ALTweenActor.GetLTweenInstance(self.LTweenHandle)
  if LTweenActor then
    LTweenActor:SetTickableWhenPaused(true)
  end
  self.LTweenHandle:OnComplete({
    self,
    function()
      if CompleteFunc then
        CompleteFunc()
      end
    end
  })
  if self.LTweenHandle_Scroll and IsValid(self.LTweenHandle_Scroll) then
    ULTweenBPLibrary.KillIfIsTweening(self, self.LTweenHandle_Scroll, true)
  end
end

function M:ResetStart(RelativeLocation, RelativeRotation, Transform)
  local trans = Transform or self.ViewActor.RootComponent:K2_GetComponentToWorld()
  if RelativeLocation then
    self.StartPos = UE4.UKismetMathLibrary.TransformLocation(trans, RelativeLocation)
  else
    self.StartPos = self.EnableCameraScrolling and self.Camera:K2_GetComponentLocation() or self.EndPos
  end
  if RelativeRotation then
    self.StartRot = UE4.UKismetMathLibrary.TransformRotation(trans, RelativeRotation)
  else
    self.StartRot = self.EnableCameraScrolling and self.Camera:K2_GetComponentRotation() or self.EndRot
  end
end

function M:YawNormalize(Rotator)
  local yaw = math.fmod(Rotator.Yaw, 360)
  if yaw < 0 then
    yaw = yaw + 360
  end
  Rotator.Yaw = yaw
end

function M:OnDragging(DeltaMove)
  if self.LTweenHandle and IsValid(self.LTweenHandle) or not self.ViewActor then
    return
  end
  DeltaMove = DeltaMove or {X = 0}
  local CurRot = self:GetViewActorRotation()
  local Rotation = FRotator()
  Rotation.Yaw = CurRot.Yaw
  Rotation.Pitch = CurRot.Pitch
  Rotation.Roll = CurRot.Roll
  Rotation.Yaw = Rotation.Yaw - math.clamp(DeltaMove.X, -20, 20)
  self:SetViewActorRotation(Rotation)
end

function M:SetCameraScrollRange(ForwardLocation, BackwardLocation, Duration, Ease)
  self.DataForwardScrollLocation = ForwardLocation
  self.DataBackwardScrollLocation = BackwardLocation
  self.ScrollAnimDuration = Duration
  self.ScrollEase = Ease or 14
  self:UpdateScrolDirection()
end

function M:UpdateScrolDirection()
  if not (self.DataForwardScrollLocation and self.BaseScrollLocation) or not IsValid(self.ViewActor) then
    return
  end
  local trans = self.ViewActor.RootComponent:K2_GetComponentToWorld()
  if self.OriginalRootTrans then
    trans = self.OriginalRootTrans
  end
  self.ForwardScrollLocation = UE4.UKismetMathLibrary.TransformLocation(trans, self.DataForwardScrollLocation)
  self.BackwardScrollLocation = UE4.UKismetMathLibrary.TransformLocation(trans, self.DataBackwardScrollLocation)
  self.ForwardScrollDirection = self.ForwardScrollLocation - self.BaseScrollLocation
  self.ForwardScrollLength = self.ForwardScrollDirection:Size()
  self.ForwardScrollDirection:Normalize()
  self.BackwardScrollDirection = self.BackwardScrollLocation - self.BaseScrollLocation
  self.BackwardScrollLength = self.BackwardScrollDirection:Size()
  self.BackwardScrollDirection:Normalize()
  self.ScrollDirection = 0
  self.TargetScrollLength = 0
end

function M:OnScrolling(DeltaScroll)
  if not (0 ~= DeltaScroll and self.EnableCameraScrolling and (not IsValid(self.LTweenHandle) or not ULTweenBPLibrary.IsTweening(self, self.LTweenHandle)) and self.ForwardScrollLocation) or not self.BaseScrollLocation then
    return
  end
  if self.LTweenHandle_Scroll and IsValid(self.LTweenHandle_Scroll) then
    ULTweenBPLibrary.KillIfIsTweening(self, self.LTweenHandle_Scroll, true)
  end
  local Speed = 20.0
  local EndValue
  self.TargetScrollLength = self.TargetScrollLength + DeltaScroll * Speed
  if 0 == self.ScrollDirection then
    if DeltaScroll > 0 then
      self.TargetScrollLength = math.clamp(self.TargetScrollLength, 0, self.ForwardScrollLength)
      EndValue = self.BaseScrollLocation + self.ForwardScrollDirection * self.TargetScrollLength
      self.ScrollDirection = 1
    else
      self.TargetScrollLength = math.clamp(self.TargetScrollLength, -self.BackwardScrollLength, 0)
      EndValue = self.BaseScrollLocation + self.BackwardScrollDirection * -self.TargetScrollLength
      self.ScrollDirection = -1
    end
  elseif self.ScrollDirection > 0 then
    self.TargetScrollLength = math.clamp(self.TargetScrollLength, 0, self.ForwardScrollLength)
    EndValue = self.BaseScrollLocation + self.ForwardScrollDirection * self.TargetScrollLength
  else
    self.TargetScrollLength = math.clamp(self.TargetScrollLength, -self.BackwardScrollLength, 0)
    EndValue = self.BaseScrollLocation + self.BackwardScrollDirection * -self.TargetScrollLength
  end
  if 0 == self.TargetScrollLength then
    self.ScrollDirection = 0
  end
  self.LTweenHandle_Scroll = ULTweenBPLibrary.WorldPositionTo(self.Camera, EndValue, self.ScrollAnimDuration, 0, self.ScrollEase)
  local LTweenActor = UE4.ALTweenActor.GetLTweenInstance(self.LTweenHandle_Scroll)
  if LTweenActor then
    LTweenActor:SetTickableWhenPaused(true)
  end
end

function M:ResetRotation()
  self:SetViewActorRotation(self.OriginalRotation)
end

function M:SetViewActorRotation(Rotation)
  if self.ViewActor and Rotation then
    self.ViewActor:K2_SetActorRotation(Rotation, false, nil, false)
  end
end

function M:GetViewActorRotation()
  return self.ViewActor and self.ViewActor:K2_GetActorRotation() or FRotator(0, 0, 0)
end

function M:GetViewActorLocation()
  return self.ViewActor and self.ViewActor:K2_GetActorLocation() or FVector(0, 0, 0)
end

function M:OpenArmoryTransformCheck()
  local player = UGameplayStatics.GetPlayerCharacter(self, 0)
  self.ViewActor:K2_SetActorLocationAndRotation(player:K2_GetActorLocation(), player:K2_GetActorRotation(), false, nil, false)
  if not player:CharacterInTag("Falling") then
    local transform = player.RootComponent:K2_GetComponentToWorld()
    local capsuleRadius = player.CapsuleComponent.CapsuleRadius
    local capsuleHalfHeight = player.CapsuleComponent.CapsuleHalfHeight / 2
    local exceptActors = TArray(AActor)
    exceptActors:Add(player)
    exceptActors:Add(self.ViewActor)
    local standardVector = FVector(800, 0, 0)
    local boxExtent = FVector(5, 100, 50)
    local axis = FVector(0, 0, 1)
    local traceHalfCount = 10
    local rot = transform.Rotation:ToRotator().Yaw
    for i = 1, traceHalfCount + 1 do
      local deg = (i - 1) * 180 / traceHalfCount
      local targetVector = UKismetMathLibrary.RotateAngleAxis(standardVector, deg, axis)
      targetVector = UKismetMathLibrary.TransformLocation(transform, targetVector)
      local hitResult = FHitResult()
      local result = UKismetSystemLibrary.BoxTraceSingle(self, (transform.Translation + targetVector) / 2, targetVector, boxExtent, FRotator(0, rot + deg, 0), 1, false, exceptActors, 0, hitResult, true)
      local resultCap = UKismetSystemLibrary.CapsuleTraceSingle(self, transform.Translation, (transform.Translation + targetVector) / 2, capsuleRadius, capsuleHalfHeight, 1, false, exceptActors, 0, hitResult, true)
      if (result or resultCap) and 0 ~= deg and 180 ~= deg then
        targetVector = UKismetMathLibrary.RotateAngleAxis(standardVector, -deg, axis)
        targetVector = UKismetMathLibrary.TransformLocation(transform, targetVector)
        local result1 = UKismetSystemLibrary.BoxTraceSingle(self, (transform.Translation + targetVector) / 2, targetVector, boxExtent, FRotator(0, rot - deg, 0), 1, false, exceptActors, 0, hitResult, true)
        local resultCap1 = UKismetSystemLibrary.CapsuleTraceSingle(self, transform.Translation, (transform.Translation + targetVector) / 2, capsuleRadius, capsuleHalfHeight, 1, false, exceptActors, 0, hitResult, true)
        if not result1 and not resultCap1 then
          self.ViewActor:K2_AddActorLocalRotation(FRotator(0, -deg, 0), false, nil, false)
          return self.ViewActor:GetTransform()
        end
      elseif not result and not resultCap then
        self.ViewActor:K2_AddActorLocalRotation(FRotator(0, deg, 0), false, nil, false)
        return self.ViewActor:GetTransform()
      end
    end
  end
  local distance, target
  for _, armoryLocaction in pairs(self.ArmoryLocation) do
    if IsValid(armoryLocaction) then
      local temp = UKismetMathLibrary.Vector_Distance(player:K2_GetActorLocation(), armoryLocaction:K2_GetActorLocation())
      if nil == distance or distance > temp then
        distance = temp
        target = armoryLocaction
      end
    end
  end
  player = self.ViewActor
  if target and distance < 12800 then
    local finalLoc = FVector(0, 0, player.CapsuleComponent.CapsuleHalfHeight + 2.4)
    FVector.Add(finalLoc, target:K2_GetActorLocation())
    self.ViewActor:K2_SetActorLocationAndRotation(finalLoc, target:K2_GetActorRotation(), false, nil, false)
    return self.ViewActor:GetTransform()
  end
end

function M:StartFOVAnim(EndFOV, Duration, Ease, CompleteFunc)
  local CameraMgr = UGameplayStatics.GetPlayerCameraManager(self, 0)
  self.StartFOV = CameraMgr:GetFOVAngle()
  self.EndFOV = EndFOV
  if IsValid(self.LTweenHandle_FOV) then
    ULTweenBPLibrary.KillIfIsTweening(self, self.LTweenHandle_FOV, false)
  end
  self.LTweenHandle_FOV = UE4.ULTweenBPLibrary.FloatTo(self, {
    self,
    function(_, value)
      local fov = UE4.UKismetMathLibrary.Lerp(self.StartFOV, self.EndFOV, value)
      self.Camera:SetFieldOfView(fov)
    end
  }, 0, 1, Duration or 0, 0, Ease or 14)
  local LTweenActor = UE4.ALTweenActor.GetLTweenInstance(self.LTweenHandle_FOV)
  if LTweenActor then
    LTweenActor:SetTickableWhenPaused(true)
  end
  if CompleteFunc then
    self.LTweenHandle_FOV:OnComplete({self, CompleteFunc})
  end
end

function M:StartPreviewBGAnimation(TargetLoc, Duration)
  if _G.UIPreviewPreviewLevel then
    local BGActor = _G.UIPreviewPreviewLevel:GetBGActor()
    if BGActor then
      local StartLoc = BGActor:K2_GetActorLocation()
      self.LTweenHandle_BGAnim = UE4.ULTweenBPLibrary.FloatTo(self, {
        self,
        function(_, value)
          local Loc = UKismetMathLibrary.VLerp(StartLoc, TargetLoc, value)
          BGActor:K2_SetActorLocation(Loc, false, nil, false)
        end
      }, 0, 1, Duration, 0, 14)
      local LTweenActor = UE4.ALTweenActor.GetLTweenInstance(self.LTweenHandle_BGAnim)
      if LTweenActor then
        LTweenActor:SetTickableWhenPaused(true)
      end
    end
  end
end

function M:SetPlayer(Player, DestroyOldPlayer)
  if DestroyOldPlayer and self.Player ~= Player and IsValid(self.Player) then
    if self.Player.IsPlayer and self.Player:IsPlayer() then
      self.Player:ServerRemoveBattlePet()
    end
    self.Player:EMActorDestroy(EDestroyReason.Armory)
    self.Player:K2_DestroyActor()
  end
  self.Player = Player
end

function M:SetViewActor(Actor)
  if Actor then
    if Actor == self.Weapon then
      self.ViewActor = self.WeaponArmoryHelper
    else
      self.ViewActor = Actor
    end
  else
    self.ViewActor = nil
  end
end

function M:GetViewActor()
  return self.ViewActor
end

function M:SetWeapon(Weapon)
  self.Weapon = Weapon
  if self.Weapon == nil then
    self.WeaponTag = nil
    if IsValid(self.WeaponArmoryHelper) then
      self.WeaponArmoryHelper:K2_DestroyActor()
      self.WeaponArmoryHelper = nil
    end
    return
  end
  self:AttachWeaponToHelper(Weapon)
end

function M:AttachWeaponToHelper(Weapon)
  local Tags = Weapon:GetWeaponTags():ToTable()
  for key, value in pairs(Tags) do
    if self.WeaponArmoryHelper[value] then
      local SceneComponents = TArray(USceneComponent)
      self.WeaponArmoryHelper[value]:GetChildrenComponents(true, SceneComponents)
      Weapon:K2_AttachToComponent(SceneComponents:GetRef(1))
      if SceneComponents:Length() > 1 then
        if Weapon.ChildWeapon then
          Weapon.ChildWeapon:K2_AttachToComponent(SceneComponents:GetRef(2))
          Weapon.ChildWeapon:K2_SetActorRelativeTransform(FTransform(), false, nil, false)
        end
        local AccessoriesLen = Weapon.Accessories:Length()
        if AccessoriesLen > 0 then
          Weapon.Accessories[1]:K2_AttachToComponent(SceneComponents:GetRef(2))
          Weapon.Accessories[1]:K2_SetActorRelativeTransform(FTransform(), false, nil, false)
        end
      end
      break
    end
  end
end

function M:CreateOrGetWeaponHelper()
  if not self.WeaponArmoryHelper or not IsValid(self.WeaponArmoryHelper) then
    local _Class = UE4.UClass.Load("/Game/UI/Blueprint/ArmoryWeapon.ArmoryWeapon")
    self.WeaponArmoryHelper = self:GetWorld():SpawnActor(_Class, self:GetTransform(), UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
    self.WeaponArmoryHelper:K2_SetActorRotation(FRotator(0, 0, 0), false, nil, false)
  end
  return self.WeaponArmoryHelper
end

function M:TransformWeaponCamera()
  if not self.WeaponTag then
    return
  end
  local WeaponTag = self.WeaponTag
  local Distance = self.WeaponArmoryHelper.CamDistance:ToTable()[WeaponTag] or 0
  local ViewActorLocation = self:K2_GetActorLocation()
  local Rotation = UKismetMathLibrary.FindLookAtRotation(ViewActorLocation + self.WeaponArmoryHelper:GetActorRightVector(), ViewActorLocation)
  local Offset = UKismetMathLibrary.GetForwardVector(Rotation) * -Distance
  local Location = ViewActorLocation + Offset
  local TargetTrans = FTransform()
  TargetTrans.Translation = Location
  TargetTrans.Rotation = Rotation
  if not self.OriginalRootTrans then
    self.OriginalRootTrans = self:GetTransform()
    self:SetCameraStartInfo(Location, Rotation)
  end
  self:TransformCamera(Offset, Rotation, 0.5)
  local MinDistance = self.WeaponArmoryHelper.CamDistance_Min:ToTable()[WeaponTag] or 0
  local MinLocation = UKismetMathLibrary.GetForwardVector(Rotation) * -MinDistance
  local MaxDistance = self.WeaponArmoryHelper.CamDistance_Max:ToTable()[WeaponTag] or 0
  local MaxLocation = UKismetMathLibrary.GetForwardVector(Rotation) * -MaxDistance
  self:SetCameraScrollRange(MinLocation, MaxLocation, 0.5)
  if 0 ~= MinDistance or 0 ~= MaxDistance then
    self.EnableCameraScrolling = true
  end
end

function M:ReceiveEndPlay()
  self:DestroyViewActorIfNeed()
end

function M:DestroyViewActorIfNeed()
  self:SetPlayer(nil, self.bNeedDestroyPlayerActor)
  self:SetWeapon(nil)
  self:SetViewActor(nil)
end

function M:BindViewTargetEvents(Events, Obj)
  Events = Events or {}
  self._OnEndViewTarget = Events.OnEndViewTarget
  self._OnBecomeViewTarget = Events.OnBecomeViewTarget
  self.ViewTargetEventObj = Obj
end

function M:K2_OnEndViewTarget(PC)
  if self._OnEndViewTarget then
    self._OnEndViewTarget(self.ViewTargetEventObj, PC)
  end
end

function M:K2_OnBecomeViewTarget(PC)
  if self._OnBecomeViewTarget then
    self._OnBecomeViewTarget(self.ViewTargetEventObj, PC)
  end
end

function M:GetActorToRotate()
  if _G.UIPreviewPreviewLevel then
    return _G.UIPreviewPreviewLevel:GetGroundActor()
  end
end

return M
