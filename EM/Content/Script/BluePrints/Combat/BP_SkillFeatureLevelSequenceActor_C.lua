require("UnLua")
local MiscUtils = require("Utils.MiscUtils")
local M = Class("BluePrints.Combat.BP_SkillFeatureLevelSequenceActorBase_C")

function M:IsCanPlay()
  if not self.bIsSkill then
    return true
  end
  if not self.Super.IsCanPlay(self) then
    return false
  end
  local FrameLength = self.SequencePlayer:GetFrameDuration()
  local IgnoreActors = TArray(AActor)
  IgnoreActors:Add(self.OwnerCharacter)
  local TraceDebugType = EDrawDebugTrace.None
  if _G.DrawDebugTest then
    TraceDebugType = EDrawDebugTrace.Persistent
  end
  local StartLocation = self.CineCameraActor:K2_GetActorLocation()
  local EndLocation = self.OwnerCharacter.CurrentLocation
  local CapsuleStartLocation = StartLocation + FVector(0, 0, self.OwnerCharacter.CapsuleComponent:GetUnscaledCapsuleHalfHeight())
  local CapsuleEndLocation = CapsuleStartLocation + FVector(0, 0, 1) * self.CapsuleTraceDis
  if self.CapsuleTraceDis > 0 then
    local _, bHit = UKismetSystemLibrary.SphereTraceSingle(self, CapsuleStartLocation, CapsuleEndLocation, 25, ETraceTypeQuery.Camera, false, IgnoreActors, TraceDebugType, nil, true)
    if bHit then
      return false
    end
  end
  local CurrentFrame = 0
  while FrameLength > CurrentFrame do
    local PlaybackParams = FMovieSceneSequencePlaybackParams()
    PlaybackParams.Frame.FrameNumber.Value = MiscUtils.Int(CurrentFrame)
    self.SequencePlayer:SetPlaybackPosition(PlaybackParams)
    StartLocation = self.CineCameraActor:K2_GetActorLocation()
    local _, bIsHit = UKismetSystemLibrary.SphereTraceSingle(self, EndLocation, StartLocation, self.TraceRadius, ETraceTypeQuery.Camera, false, IgnoreActors, TraceDebugType, nil, true)
    if bIsHit then
      return false
    end
    CurrentFrame = CurrentFrame + 1
  end
  if not self.bUseNewSkillFeature and self.EndBlendTime > 0 then
    local PlaybackParams = FMovieSceneSequencePlaybackParams()
    PlaybackParams.Frame.FrameNumber.Value = FrameLength
    self.SequencePlayer:SetPlaybackPosition(PlaybackParams)
    self.EndBlendCamera = self:DuplicateCameraActorOnEnd()
  end
  self.SequencePlayer:SetPlaybackPosition(FMovieSceneSequencePlaybackParams())
  return true
end

function M:HidePlayerBattlePet(IsHide)
  local BattlePet = self.OwnerCharacter:GetBattlePet()
  if BattlePet then
    BattlePet:HideBattlePet("Skill", IsHide)
  end
end

function M:StartSkillFeature()
  local FlowManager = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
  self.Flow = FlowManager:CreateFlow("SkillFeature")
  self.Flow.OnBegin:Add(self.Flow, function()
    local PlayerCameraManager = UGameplayStatics.GetPlayerCameraManager(self, 0)
    PlayerCameraManager:StopAllCameraShakes(true)
    self:RecordPlayerCamera()
    self.CacheControlRotation = self.OwnerCharacter:GetControlRotation()
    self:StartSkillFeatureCD()
    M.Super.StartSkillFeature(self)
    self:SetSkillFeatureTimeDilation()
    if self.OwnerCharacter.Controller.AddDisableRotationInputTag then
      self.OwnerCharacter.Controller:AddDisableRotationInputTag("SkillFeature")
    end
    if self.bIsSkill then
      self:HidePlayerBattlePet(true)
    end
  end)
  FlowManager:AddFlow(self.Flow)
end

function M:EndSkillFeature()
  if self.Flow then
    local FlowManager = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
    FlowManager:RemoveFlow(self.Flow)
    self.Flow = nil
  end
  self.OwnerCharacter.SkillFeature = false
  if self.OwnerCharacter.RemoveTimer then
    self.OwnerCharacter:RemoveTimer("SkillFeature")
  end
  if self.OwnerCharacter.Controller and self.OwnerCharacter.Controller.RemoveDisableRotationInputTag then
    self.OwnerCharacter.Controller:RemoveDisableRotationInputTag("SkillFeature")
  end
  if IsValid(self.NewCamera) then
    self.NewCamera:K2_DestroyActor()
  end
  if IsValid(self.CameraActor) then
    self.CameraActor:K2_DestroyActor()
  end
  self:ResetCamera()
  if self.OwnerCharacter.bSkillFeatureSuccess and self.EndBlendTime > 0 then
    self.OwnerCharacter.Controller:AddDisableRotationInputTag("EndSkillFeatureCamera")
    self.EndBlendCamera = self:DuplicateCameraActorOnEnd()
    self.EndBlendCamera:GetCineCameraComponent().FocusSettings.ManualFocusDistance = 100000
    local PlayerController = self.OwnerCharacter:GetController()
    if PlayerController then
      PlayerController:ClientSetViewTarget(self.EndBlendCamera, nil)
    end
    local OwnerCharacter = self.OwnerCharacter
    self.OwnerCharacter:AddTimer(self.EndBlendTime + 0.1, function()
      if IsValid(self.EndBlendCamera) then
        self.EndBlendCamera:K2_DestroyActor()
      end
      OwnerCharacter.Controller:RemoveDisableRotationInputTag("EndSkillFeatureCamera")
    end, false, 0, "EndSkillFeatureCamera")
  end
  self:HidePlayerBattlePet(false)
  M.Super.EndSkillFeature(self)
  self.OwnerCharacter:ForbidHitStop(false)
end

function M:DuplicateCameraActorOnEnd()
  if IsValid(self.EndBlendCamera) then
    return self.EndBlendCamera
  end
  local NewCamera
  if IsValid(self.NewCamera) then
    NewCamera = URuntimeCommonFunctionLibrary.DuplicateActor(self.NewCamera)
  else
    NewCamera = URuntimeCommonFunctionLibrary.DuplicateActor(self.CineCameraActor)
  end
  return NewCamera
end

return M
