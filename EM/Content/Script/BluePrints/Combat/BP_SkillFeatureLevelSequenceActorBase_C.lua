require("UnLua")
local M = Class("BluePrints.Common.TimerMgr")

function M:IsCanPlay()
  if self.bIsSkill and Const.bEnableSkillFeatureCD and self.OwnerCharacter.bSkillFeatureCD then
    return false
  end
  return true
end

function M:ReceiveBeginPlay()
  if self.FeatureSequence == nil then
    return
  end
  self:SetSequence(self.FeatureSequence)
  self:SetInstanceData()
  self:TryAttachToPlayer()
  self:SetCineCameraActor()
  self:ResetPlayerSpeed()
end

function M:StartSkillFeature()
  EventManager:FireEvent(EventID.OnStartSkillFeature, self.HideAllUI)
  if self.HideAllUI then
    UIManager(self):AddUIManagerCurrentModeTag(Const.SkillFeatureHideTag)
    EventManager:AddEvent(EventID.OnCreatedEnergySupplyWidget, self, self.OnCreatedEnergySupplyWidget)
  end
  self.Overridden.StartSkillFeature(self)
end

function M:StartSkillFeatureCD()
  if not self.bIsSkill then
    return
  end
  if Const.bEnableSkillFeatureCD and not self.OwnerCharacter:IsExistTimer("SkillFeatureCD") then
    local OwnerCharacter = self.OwnerCharacter
    OwnerCharacter.bSkillFeatureCD = true
    OwnerCharacter:AddTimer(Const.SkillFeatureCD, function()
      OwnerCharacter.bSkillFeatureCD = false
    end, false, 0, "SkillFeatureCD")
  end
end

function M:EndSkillFeature()
  EventManager:FireEvent(EventID.OnEndSkillFeature, self.HideAllUI)
  if self.HideAllUI then
    UIManager(self):RemoveUIManagerCurrentModeTag(Const.SkillFeatureHideTag)
    EventManager:RemoveEvent(EventID.OnCreatedEnergySupplyWidget, self)
  end
  self.Overridden.EndSkillFeature(self)
end

function M:SetInstanceData()
  self.bOverrideInstanceData = true
  local DefaultInstanceData = self.DefaultInstanceData
  DefaultInstanceData.TransformOriginActor = self
end

function M:TryAttachToPlayer()
  if not self.AttachToPlayer then
    return
  end
  self:K2_AttachToComponent(self.OwnerCharacter.Mesh, "Root", EAttachmentRule.SnapToTarget, EAttachmentRule.SnapToTarget, EAttachmentRule.SnapToTarget, true)
  self:K2_SetActorRelativeRotation(FRotator(0, 90, 0), false, nil, false)
end

function M:ResetPlayerSpeed()
  if self.ResetSpeed then
    self.OwnerCharacter:GetMovementComponent().Velocity:Set(0, 0, 0)
  end
end

function M:RecordPlayerCamera()
  if not self.CameraCurve then
    return
  end
  local SpringArm = self.OwnerCharacter.CharSpringArmComponent
  if not SpringArm then
    return
  end
  local CameraControlComponent = self.OwnerCharacter.CameraControlComponent
  if not CameraControlComponent then
    return
  end
  self.bPlayCameraAnim = true
  self.OriCameraControlStruct = FCameraControlStruct()
  self.OriCameraControlStruct.ArmLength = self.OwnerCharacter.BaseSpringArmForReset
  self.OriCameraControlStruct.SocketOffset = SpringArm.SocketOffset
  self.OriCameraControlStruct.ArmPos = SpringArm.BaseSpringArmLocation
  local ControlRotation = self.OwnerCharacter.Controller:GetControlRotation()
  self.OriCameraArmRotation = FRotator(ControlRotation.Pitch, 0, ControlRotation.Roll)
  local CameraControlStruct = FCameraControlStruct()
  CameraControlStruct.ArmLength = self.CameraArmLength
  CameraControlStruct.ArmPos = self.CameraArmLocation
  CameraControlComponent:PushCameraState("SkillFeature", CameraControlStruct, 0, 9999999)
  local Rotation = UE4.UKismetMathLibrary.Conv_VectorToRotator(self.OwnerCharacter:GetActorForwardVector())
  Rotation:Add(self.CameraArmRotation)
  self.OwnerCharacter.Controller:SetControlRotation(Rotation)
end

function M:ResetCamera()
  if not self.bPlayCameraAnim then
    return
  end
  self.bPlayCameraAnim = false
  local CameraControlComponent = self.OwnerCharacter.CameraControlComponent
  if not CameraControlComponent then
    return
  end
  self.OriCameraControlStruct.TimelineFloatCurve = self.CameraCurve
  local OwnerCharacter = self.OwnerCharacter
  OwnerCharacter.Controller:RemoveDisableRotationInputTag("SkillFeature")
  CameraControlComponent:PushCameraState("SkillFeature", self.OriCameraControlStruct, self.CameraTweenTime, -99999)
  self.OwnerCharacter.CameraRotationComponent:SetControlRotation_Curve(self.OriCameraArmRotation, self.CameraTweenTime, self.CameraCurve, true)
  self.OwnerCharacter:AddTimer(self.CameraTweenTime, function()
    CameraControlComponent:PopCameraState("SkillFeature")
  end, false, 0, "SkillFeatureCamera")
end

function M:SetCineCameraActor()
  self.SequencePlayer:Play()
  self.SequencePlayer:Pause()
  local CineCameraBind = self:FindNamedBinding(self.BindingTag)
  local BoundObjects = self.SequencePlayer:GetBoundObjects(CineCameraBind)
  assert(1 == BoundObjects:Num(), self.BindingTag .. "\231\187\145\229\174\154\230\160\135\231\173\190\230\156\170\230\137\190\229\136\176\230\136\150\230\137\190\229\136\176\228\186\134\229\164\154\228\184\170\229\175\185\232\177\161\227\128\130")
  self.CineCameraActor = BoundObjects[1]
  self.CineCameraActor.CameraComponent:SetConstraintAspectRatio(false)
  if self.bUseNewSkillFeature then
    self.NewCamera = URuntimeCommonFunctionLibrary.DuplicateActor(self.CineCameraActor)
    self.NewCamera:K2_AttachToComponent(self.OwnerCharacter.Mesh, self.AttachBoneName, EAttachmentRule.SnapToTarget, EAttachmentRule.SnapToTarget, EAttachmentRule.SnapToTarget, true)
    self.NewCamera:K2_SetActorRelativeRotation(FRotator(-90, 0, -90), false, nil, false)
    self.Actors:Add(self.NewCamera)
    self.NewSkillFeatureObjectBinds = {}
    local NewFeatureBinds = self:FindNamedBindings("NewSkillFeature")
    for _, NewFeatureBind in pairs(NewFeatureBinds) do
      local NewFeatureBoundObjects = self.SequencePlayer:GetBoundObjects(NewFeatureBind)
      table.insert(self.NewSkillFeatureObjectBinds, NewFeatureBind)
      for i = 1, NewFeatureBoundObjects:Num() do
        local NewFeature = NewFeatureBoundObjects[i]
        if NewFeature.K2_AttachToComponent then
          NewFeature:K2_AttachToComponent(self.NewCamera:K2_GetRootComponent(), "Root", EAttachmentRule.KeepRelative, EAttachmentRule.KeepRelative, EAttachmentRule.KeepRelative, true)
          self.Actors:Add(NewFeature)
        end
      end
    end
  end
end

function M:ReceiveOnObjectSpawned(InObject)
  if not self.NewSkillFeatureObjectBinds then
    return
  end
  for _, Bind in pairs(self.NewSkillFeatureObjectBinds) do
    local bBreak = false
    local BoundObjects = self.SequencePlayer:GetBoundObjects(Bind)
    for i = 1, BoundObjects:Num() do
      local BoundObject = BoundObjects[i]
      if BoundObject == InObject then
        self:AddTimer(0.01, function()
          BoundObject:K2_AttachToComponent(self.NewCamera:K2_GetRootComponent(), "Root", EAttachmentRule.KeepRelative, EAttachmentRule.KeepRelative, EAttachmentRule.KeepRelative, true)
        end)
        self.Actors:Add(InObject)
        bBreak = true
        break
      end
    end
    if bBreak then
      break
    end
  end
end

function M:OnCreatedEnergySupplyWidget(UIWidget)
  if IsValid(UIWidget) then
    UIWidget:Hide(Const.SkillFeatureHideTag)
  end
end

function M:OnUIWidgetCreate(UIInfo)
  if IsValid(UIInfo.UIObject) then
    UIInfo.UIObject:Hide(Const.SkillFeatureHideTag)
  end
end

return M
