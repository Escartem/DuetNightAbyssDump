local M = Class("BluePrints.Story.FlowGraph.FlowNode.TalkFlowNode.FlowNode_TalkNodeBase")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local CameraBlendTime = 1

function M:Start()
  self.OptionStr = nil
  local TalkTask = self:TryGetTalkTask()
  TalkTask:HideUI(true, "QuestAccept")
  self.IsShowDialog = self:CheckIsNeedShowDialog()
  if self.IsShowDialog then
    self:InitCameraSequence()
  else
    self:RealFinish("ApproveOut")
  end
end

function M:InitCameraSequence()
  local NpcHeadTrans = self:InitNpcAndGetTransform()
  if not NpcHeadTrans then
    self:InitReceiveUI()
    return
  end
  self.CameraSequenceActor = self:GetWorld():SpawnActor(ALevelSequenceActor)
  if not IsValid(self.CameraSequenceActor) then
    local Message = string.format("%s start failed, CameraSequenceActor is invalid", self:GetName())
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\230\148\175\231\186\191\230\142\165\229\143\150\232\138\130\231\130\185", Message)
    return
  end
  self.CameraSequenceActor.CameraSettings.bOverrideAspectRatioAxisConstraint = false
  self.CameraSequenceActor:SetSequence(self.CameraSequence)
  self.CameraSequenceActor.bOverrideInstanceData = 1
  self.CameraSequenceActor.DefaultInstanceData.TransformOrigin = NpcHeadTrans
  self.CameraSequenceActor.SequencePlayer.OnPause:Add(self, self.InitReceiveUI)
  self.CameraSequenceActor.SequencePlayer.OnFinished:Add(self, self.RealFinish)
  local PlaybackParams = FMovieSceneSequencePlaybackParams()
  PlaybackParams.MarkedFrame = self.QuestAcceptMark
  PlaybackParams.PositionType = EMovieScenePositionType.MarkedFrame
  self.CameraSequenceActor.SequencePlayer:PlayTo(PlaybackParams)
end

function M:InitReceiveUI()
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  if not IsValid(self.Widget) then
    self.Widget = UIManager:LoadUINew("BranchTaskReceiveTips", self)
  end
end

function M:InitNpcAndGetTransform()
  local GameInstance = GWorld.GameInstance
  self.PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  self.PlayerCharacter:SetActorHideTag("QuestAccept", true)
  if not DataMgr.QuestChain[self.SideQuestChainId] or not DataMgr.QuestChain[self.SideQuestChainId].QuestNpcId then
    return nil
  end
  self.TalkNpcId = DataMgr.QuestChain[self.SideQuestChainId].QuestNpcId
  local EMGameState = UE4.UGameplayStatics.GetGameState(GameInstance)
  local BranchTaskNpc = EMGameState.NpcCharacterMap:FindRef(self.TalkNpcId)
  if BranchTaskNpc then
    return FTransform(BranchTaskNpc:K2_GetActorRotation():ToQuat(), BranchTaskNpc.Mesh:GetSocketLocation("head"))
  end
  return nil
end

function M:CheckIsNeedShowDialog()
  if not DataMgr.QuestChain[self.SideQuestChainId] or not DataMgr.QuestChain[self.SideQuestChainId].QuestNpcId then
    return true
  end
  if DataMgr.QuestChain[self.SideQuestChainId].IsShowWindow == nil or DataMgr.QuestChain[self.SideQuestChainId].IsShowWindow == false then
    return false
  end
  return true
end

function M:FinishAction(OptionStr)
  self.OptionStr = OptionStr
  self.CameraSequenceActor.SequencePlayer:Play()
  if self.IsShowDialog and self.Widget then
    self.Widget:CloseTips()
  end
end

function M:RealFinish(OptionStr)
  local OptionStr = OptionStr or self.OptionStr
  if self.IsShowDialog then
    self.PlayerCharacter:SetActorHideTag("QuestAccept", false)
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    self:Finish(OptionStr)
    return
  end
  if "ApproveOut" == OptionStr then
    local CurServerTrackId = Avatar.TrackingQuestChainId
    if Avatar.QuestChains[CurServerTrackId] then
      TaskUtils:ResumQuestTaskBarOnTrack(CurServerTrackId, nil, nil)
    end
    if MissionIndicatorManager.MissionNpcSideBubbles[self.TalkNpcId] then
      MissionIndicatorManager.MissionNpcSideBubbles[self.TalkNpcId] = nil
    end
    EventManager:FireEvent(EventID.EnableNpcSideBubble, self.TalkNpcId, false)
    self:FinishAccept()
    return
  end
  self:FinishCancel()
end

function M:K2_Cleanup()
  local TalkTask = self:TryGetTalkTask()
  TalkTask:HideUI(false, "QuestAccept")
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:UnLoadUINew("BranchTaskReceiveTips")
  self.Widget = nil
end

function M:CanSkip()
  return false
end

return M
