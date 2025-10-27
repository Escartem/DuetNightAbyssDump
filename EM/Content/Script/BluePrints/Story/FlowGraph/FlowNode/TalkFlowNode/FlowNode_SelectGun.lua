local M = Class("BluePrints.Story.FlowGraph.FlowNode.TalkFlowNode.FlowNode_TalkNodeBase")

function M:Start()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not IsValid(PlayerCharacter) then
    local Message = string.format("%s start failed, PlayerCharacter is invalid", self:GetName())
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\233\128\137\230\158\170\232\138\130\231\130\185", Message)
    return
  end
  if PlayerCharacter.RangedWeapon then
    self:FinishEnd()
    return
  end
  self:SetTalkUIVisibility(false)
  self.CameraSequenceActor = self:GetWorld():SpawnActor(ALevelSequenceActor)
  if not IsValid(self.CameraSequenceActor) then
    local Message = string.format("%s start failed, CameraSequenceActor is invalid", self:GetName())
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\233\128\137\230\158\170\232\138\130\231\130\185", Message)
    return
  end
  self.CameraSequenceActor.CameraSettings.bOverrideAspectRatioAxisConstraint = false
  self.CameraSequenceActor:SetSequence(self.CameraSequence)
  self.CameraSequenceActor.SequencePlayer.OnPause:Add(self, self.SelectGuns)
  self.CameraSequenceActor.SequencePlayer.OnFinished:Add(self, self.FinishEnd)
  local PlaybackParams = FMovieSceneSequencePlaybackParams()
  PlaybackParams.MarkedFrame = self.SelectGunsMark
  PlaybackParams.PositionType = EMovieScenePositionType.MarkedFrame
  self.CameraSequenceActor.SequencePlayer:PlayTo(PlaybackParams)
end

function M:K2_Cleanup()
  self:SetTalkUIVisibility(true)
  if IsValid(self.CameraSequenceActor) then
    self.CameraSequenceActor:K2_DestroyActor()
    self.CameraSequenceActor = nil
  end
end

function M:CanSkip()
  return false
end

function M:SelectGuns()
  UIManager(self):LoadUINew("StoryWeaponSelect")
  EventManager:AddEvent(EventID.OnSelectWeapon, self, self.OnSelectedGuns)
end

function M:OnSelectedGuns()
  UIManager(self):UnLoadUINew("StoryWeaponSelect")
  EventManager:RemoveEvent(EventID.OnSelectWeapon, self)
  self.CameraSequenceActor.SequencePlayer:Play()
end

function M:SetTalkUIVisibility(bVisibility)
  local TalkTask = self:TryGetTalkTask()
  if not TalkTask then
    return
  end
  if bVisibility then
    TalkTask:HideUI(false, "SelectGun")
  else
    TalkTask:HideUI(true, "SelectGun")
  end
end

return M
