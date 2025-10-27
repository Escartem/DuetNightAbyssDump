local M = Class("BluePrints.Combat.BP_SkillFeatureLevelSequenceActorBase_C")

function M:ReceiveBeginPlay()
  if self.FeatureSequence == nil then
    return
  end
  self:SetSequence(self.FeatureSequence)
  self:SetInstanceData()
  self:SetCineCameraActor()
end

function M:IsCanPlay()
  if not self.Super.IsCanPlay(self) then
    return false
  end
  if 0 == #self.VoidLevelPath then
    return false
  end
  return true
end

function M:StartSkillFeature()
  self:RecordPlayerCamera()
  self.SequencePlayer.OnFinished:Add(self, self.EndSkillFeature)
  local bRet
  bRet, self.Level = ULevelStreamingDynamic.LoadLevelInstance(self, self.VoidLevelPath, FVector(0, 0, 0), FRotator(0, 0, 0), true)
  local FakeCharacterClass = LoadClass("Blueprint'/Game/BluePrints/Char/BP_FakeCharacter.BP_FakeCharacter_C'")
  self.FakeCharacter = self:GetWorld():SpawnActor(FakeCharacterClass, UKismetMathLibrary.MakeTransform(FVector(), FRotator(0, -90, 0), FVector(1)), ESpawnActorCollisionHandlingMethod.AlwaysSpawn, self, nil, nil)
  self.FakeCharacter:InitFakeCharacter({
    ShadowModelId = self.OwnerCharacter.ShadowModelId,
    CurrentRoleId = self.OwnerCharacter.CurrentRoleId,
    ModelId = self.OwnerCharacter:GetCharModelComponent():GetCurrentModelId(),
    CanPart = self.OwnerCharacter:CheckCanPart()
  })
  self.FakeCharacter.Mesh:PlayAnimation(self.Animation, false)
  self.FakeCharacter.Mesh:GetAnimInstance():SetRootMotionMode(ERootMotionMode.RootMotionFromEverything)
  self:TryAttachToPlayer()
  self:StartSkillFeatureCD()
  local PlayerController = UGameplayStatics.GetPlayerController(self, 0)
  PlayerController:SetViewTargetWithBlend(self.CineCameraActor, 0, EViewTargetBlendFunction.VTBlend_Linear, 0, false)
  self.SequencePlayer:SetPlayRate(self.OwnerCharacter.SkillTimeLine.CurrentSkillNode.AnimPlayRate)
  self.SequencePlayer:Play()
  self.OwnerCharacter.SkillFeatureActor = self
  self:SetSkillFeatureTimeDilation()
end

function M:EndSkillFeature()
  self:ResetCamera()
  if self.Level then
    self.Level:SetShouldBeLoaded(false)
  end
  if self.FakeCharacter then
    self.FakeCharacter:K2_DestroyActor()
  end
  local PlayerController = UGameplayStatics.GetPlayerController(self, 0)
  PlayerController:SetViewTargetWithBlend(self.OwnerCharacter, 0, EViewTargetBlendFunction.VTBlend_Linear, 0, false)
  self:K2_DestroyActor()
  self.OwnerCharacter.SkillFeatureActor = nil
end

function M:TryAttachToPlayer()
  local Location = self.FakeCharacter:K2_GetActorLocation()
  local Rotation = self.FakeCharacter:K2_GetActorRotation()
  Rotation.Yaw = Rotation.Yaw + 90
  self:K2_SetActorLocationAndRotation(Location, Rotation, false, nil, false)
end

return M
