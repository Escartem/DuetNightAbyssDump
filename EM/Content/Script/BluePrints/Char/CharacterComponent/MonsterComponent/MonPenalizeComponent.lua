local Component = {}

function Component:InitPenalizeComponentImpl()
  if self:HasCannotCondemn() then
    return
  end
  self:AddPenalizeInteractive()
  self.CanOpen = false
  self.OpenState = false
  self.InteractiveType = Const.PressInteractive
  self.PenalizeInteractiveComponent.bCanUsed = true
  self.PenalizeInteractiveComponent:SetInteractiveName("BATTLE_CONDEMN_NAME")
  self.PenalizeInteractiveComponent.InteractiveDistance = 400
  self.PenalizeInteractiveComponent.InteractiveFaceAngle = 180
  self.PenalizeInteractiveComponent.InteractiveAngle = 360
  local ModelData = DataMgr.Model[self.ModelId]
  local PenalizeParam = ModelData.PenalizeParam
  local PenalizeSocket = PenalizeParam and PenalizeParam.PenalizeSocket
  if PenalizeSocket and self.Mesh and self.Mesh:GetSocketBoneName(PenalizeSocket) ~= "None" then
    local PenalizeComAttach = self.PenalizeInteractiveComponent:GetAttachParent()
    PenalizeComAttach:SetAbsolute(false, true, true)
    PenalizeComAttach:K2_AttachToComponent(self.Mesh, PenalizeSocket, UE4.EAttachmentRule.SnapToTarget, UE4.EAttachmentRule.KeepWorld, UE4.EAttachmentRule.KeepWorld)
  end
  local PenalizeOffset = PenalizeParam and PenalizeParam.PenalizeOffset
  PenalizeOffset = PenalizeOffset and FVector(PenalizeOffset[1], PenalizeOffset[2], PenalizeOffset[3])
  if PenalizeOffset then
    local ComponentLocation = self.PenalizeInteractiveComponent:K2_GetComponentLocation()
    local Transform = self:GetTransform()
    Transform.Translation = ComponentLocation
    local OffsetLocation = UE4.UKismetMathLibrary.TransformLocation(Transform, PenalizeOffset)
    self.PenalizeInteractiveComponent:K2_SetWorldLocation(OffsetLocation, false, nil, false)
  end
  if ModelData.PenalizeEffect then
    if not self.HeightLightTip then
      self.HeightLightTip = self.FXComponent:PlayEffectByID(ModelData.PenalizeEffect)
    end
    if self.HeightLightTip then
      self.HeightLightTip:SetVisibility(false)
    end
  end
end

function Component:SetHeightLightTip(Visibility)
  if self.HeightLightTip then
    self.HeightLightTip:SetVisibility(Visibility)
  end
end

function Component:Penalize(PlayerId)
  local Role = Battle(self):GetEntity(PlayerId)
  if not Role then
    return
  end
  if self:GetEnableBeCondemned() and Role:DoCheckUseSkill(Role:GetSkillByType(UE.ESkillType.Condemn)) then
    self.CondemnerEid = PlayerId
    local Res = false
    if self:IsHpEnterDeathStory() then
      self:BeforeBePenalize()
      self:SendPenalizeStoryEvent()
      Res = true
    elseif self:GetAttr("Hp") <= 0 then
      self:BeforeBePenalize()
      Res = Role:UsePenalizeSkill(self.Eid)
    elseif not self:HasAirWallBetweenPosition(Role) then
      self:BeforeBePenalize()
      Res = Role:UsePenalizeSkill(self.Eid)
    else
      Role:ClientShowToast(UIConst.Tip_CommonToast, GText("TOAST_PENALIZEINVALID"))
    end
    if Res then
      self:DisableToughnessRecover()
      self:DefeatedRecoverToIdleSuccess()
    else
      self.CondemnerEid = nil
    end
  end
end

function Component:DefeatedRecoverToIdleSuccess_Implementation()
  if self.HeightLightTip then
    self.HeightLightTip:SetVisibility(false)
  end
  self:HideDefeatedUI()
end

function Component:HideDefeatedUI()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local DefeatedUI = UIManager:GetUIObj("DefeatedInteract")
  if DefeatedUI then
    DefeatedUI:StopAllAnimations()
    DefeatedUI:PlayAnimation(DefeatedUI.Press)
    DefeatedUI:TryShowPhoneUI(false)
  end
end

function Component:HasAirWallBetweenPosition(Player)
  local BornLocation = self:GetCondemnLocation(Player)
  local TargetLocation = self.PenalizeInteractiveComponent:K2_GetComponentLocation()
  local HitResults = TArray(FHitResult)
  local ObjectTypes = TArray(EObjectTypeQuery)
  ObjectTypes:Add(EObjectTypeQuery.WorldStatic)
  UE4.UKismetSystemLibrary.LineTraceMultiForObjects(self, BornLocation, TargetLocation, ObjectTypes, false, nil, 0, HitResults, true)
  for i = 1, HitResults:Num() do
    local HitResult = HitResults[i]
    local IsWall = HitResult.Component and HitResult.Component:GetCollisionProfileName() == "AirWall"
    if IsWall then
      return true
    end
  end
  return false
end

function Component:GetCondemnLocation(PenalizePlayer)
  if not PenalizePlayer then
    return
  end
  local ModelInfo = self:GetCharModelComponent():GetCurrentModelInfo()
  local CondemnBoneName = ModelInfo.CondemnBoneName
  if not CondemnBoneName then
    return
  end
  local CondemnTransform4 = self.Mesh:GetSocketTransform(CondemnBoneName.CondemnSocket, ERelativeTransformSpace.RTS_World)
  local LocalOffset4 = CondemnTransform4.Translation
  local LocationOffset = CondemnBoneName.LocationOffset or {}
  LocationOffset = FVector(LocationOffset[1] or 0, LocationOffset[2] or 0, LocationOffset[3] or 0)
  local T = UE4.UKismetMathLibrary.InverseTransformLocation(self:GetTransform(), LocalOffset4)
  local CondemnLocation = UE4.UKismetMathLibrary.TransformLocation(self:GetTransform(), LocationOffset + T)
  local RootLocation = PenalizePlayer:GetCapsuleRootLocation()
  local ActorLocation = PenalizePlayer:K2_GetActorLocation()
  local IntervalV = ActorLocation - RootLocation
  local PenalizePos = CondemnLocation + IntervalV
  return PenalizePos
end

function Component:IsCanBePenalize()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not Player then
    return false
  end
  if self.PenalizeInteractiveComponent and self.PenalizeInteractiveComponent.IsDisPlayBtn and self:GetEnableBeCondemned() and Player:DoCheckUseSkill(Player:GetSkillByType(UE.ESkillType.Condemn)) then
    return true
  end
  return false
end

return Component
