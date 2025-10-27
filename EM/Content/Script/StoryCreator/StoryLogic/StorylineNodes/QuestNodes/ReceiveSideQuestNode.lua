local ReceiveSideQuestNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")

function ReceiveSideQuestNode:Init()
  self.SideQuestChainId = 0
  self.CurrentCamera = nil
  self.TargetCamera = nil
  self.PlayerCharacter = nil
  self.PlayerController = nil
  self.Widget = nil
  self.IsShowDialog = false
  self.CameraBlendTime = 1
  self.ListenTimer = nil
  self.TalkNpcId = 0
  self.CameraSequenceActor = nil
end

function ReceiveSideQuestNode:Start(Context)
  self.IsShowDialog = self:CheckIsNeedShowDialog()
  if not self.IsShowDialog then
    self:FinishAction("ApproveOut")
    return
  end
  if self.EnableSequence then
    self:StartSequenceMode()
  else
    self:TrySwitchCamera()
    self.ListenTimer = GWorld.GameInstance:AddTimer(self.CameraBlendTime / 2, function()
      self:InitReceiveUI()
    end, false)
  end
end

function ReceiveSideQuestNode:StartSequenceMode()
  local GameInstance = GWorld.GameInstance
  local EMGameState = UE4.UGameplayStatics.GetGameState(GameInstance)
  self.PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  self.PlayerCharacter:SetCanInteractiveTrigger(false, "ReceiveSideQuestNode")
  self.PlayerCharacter:SetActorHideTag("NpcSideTips", true)
  self.PlayerController = UE4.UGameplayStatics.GetPlayerController(GameInstance, 0)
  if not DataMgr.QuestChain[self.SideQuestChainId] or not DataMgr.QuestChain[self.SideQuestChainId].QuestNpcId then
    return
  end
  self.TalkNpcId = DataMgr.QuestChain[self.SideQuestChainId].QuestNpcId
  local BranchTaskNpc = EMGameState.NpcCharacterMap:FindRef(self.TalkNpcId)
  if not BranchTaskNpc then
    return
  end
  local NpcHeadLoc = BranchTaskNpc.Mesh:GetSocketLocation("head")
  local NpcRotation = BranchTaskNpc:K2_GetActorRotation():ToQuat()
  local NpcCreatorId = BranchTaskNpc.CreatorId
  local NpcCreator = EMGameState.StaticCreatorMap:FindRef(NpcCreatorId)
  if NpcCreator then
    NpcRotation = NpcCreator:K2_GetActorRotation():ToQuat()
  end
  self.CameraSequenceActor = GameInstance:GetWorld():SpawnActor(ALevelSequenceActor)
  if not IsValid(self.CameraSequenceActor) then
    local Message = string.format("%s start failed, CameraSequenceActor is invalid", self:GetName())
    UStoryLogUtils.PrintToFeiShu(GameInstance, UE.EStoryLogType.Quest, "\230\148\175\231\186\191\230\142\165\229\143\150\232\138\130\231\130\185", Message)
    return
  end
  if not self.SequencePath or self.SequencePath == "" then
    return
  end
  local Sequence = UE4.LoadObject(self.SequencePath)
  if not Sequence then
    return
  end
  self.CameraSequenceActor.CameraSettings.bOverrideAspectRatioAxisConstraint = false
  self.CameraSequenceActor:SetSequence(Sequence)
  self.CameraSequenceActor.SequencePlayer.OnPause:Add(self.CameraSequenceActor, function()
    self:OnSequencePause()
  end)
  self.CameraSequenceActor.SequencePlayer.OnFinished:Add(self.CameraSequenceActor, function()
    self:OnSequenceFinished()
  end)
  self.CameraSequenceActor.bOverrideInstanceData = 1
  self.CameraSequenceActor.DefaultInstanceData.TransformOrigin = FTransform(NpcRotation, NpcHeadLoc)
  local PlaybackParams = FMovieSceneSequencePlaybackParams()
  PlaybackParams.MarkedFrame = self.PauseMark
  PlaybackParams.PositionType = EMovieScenePositionType.MarkedFrame
  self.CameraSequenceActor.SequencePlayer:PlayTo(PlaybackParams)
end

function ReceiveSideQuestNode:OnSequencePause()
  self:InitReceiveUI()
end

function ReceiveSideQuestNode:OnSequenceFinished()
  self:FinishAction("ApproveOut")
end

function ReceiveSideQuestNode:InitReceiveUI()
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  if not self.Widget then
    self.Widget = UIManager:LoadUINew("BranchTaskReceiveTips", self)
  end
end

function ReceiveSideQuestNode:CheckIsNeedShowDialog()
  if not DataMgr.QuestChain[self.SideQuestChainId] or not DataMgr.QuestChain[self.SideQuestChainId].QuestNpcId then
    return true
  end
  if DataMgr.QuestChain[self.SideQuestChainId].IsShowWindow == nil or DataMgr.QuestChain[self.SideQuestChainId].IsShowWindow == false then
    return false
  end
  return true
end

function ReceiveSideQuestNode:TrySwitchCamera()
  local GameInstance = GWorld.GameInstance
  local EMGameState = UE4.UGameplayStatics.GetGameState(GameInstance)
  self.PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  self.PlayerCharacter:SetCanInteractiveTrigger(false, "ReceiveSideQuestNode")
  self.PlayerCharacter:SetActorHideTag("NpcSideTips", true)
  self.PlayerController = UE4.UGameplayStatics.GetPlayerController(GameInstance, 0)
  if not DataMgr.QuestChain[self.SideQuestChainId] or not DataMgr.QuestChain[self.SideQuestChainId].QuestNpcId then
    return
  end
  self.TalkNpcId = DataMgr.QuestChain[self.SideQuestChainId].QuestNpcId
  local BranchTaskNpc
  BranchTaskNpc = EMGameState.NpcCharacterMap:FindRef(self.TalkNpcId)
  if BranchTaskNpc then
    local NpcCreatorId = BranchTaskNpc.CreatorId
    local NpcHeadLoc = BranchTaskNpc.Mesh:GetSocketLocation("head")
    local NpcCreator = EMGameState.StaticCreatorMap:FindRef(NpcCreatorId)
    local NpcForwardVector = BranchTaskNpc:K2_GetActorLocation()
    local NpcCameraRotation = BranchTaskNpc:K2_GetActorRotation()
    if NpcCreator then
      NpcForwardVector = BranchTaskNpc:K2_GetActorLocation() + FVector(NpcCreator:GetActorForwardVector().X, NpcCreator:GetActorForwardVector().Y, NpcCreator:GetActorForwardVector().Z) * 100
      NpcCameraRotation = NpcCreator:K2_GetActorRotation()
    end
    local PlayerController = UE4.UGameplayStatics.GetPlayerController(GameInstance, 0)
    local TalkContext = GameInstance:GetTalkContext()
    if TalkContext then
      TalkContext.TalkCameraManager:SwitchToPlayer()
    end
    local PlayerCameraManager = UE4.UGameplayStatics.GetPlayerCameraManager(GWorld.GameInstance, 0)
    local CurrentCameraLoc = PlayerCameraManager:GetCameraLocation()
    local CurrentCameraRot = PlayerCameraManager:GetCameraRotation()
    self.CurrentCamera = GameInstance:GetWorld():SpawnActor(ACameraActor:StaticClass(), FTransform(CurrentCameraRot:ToQuat(), CurrentCameraLoc), UE4.ESpawnActorCollisionHandlingMethod.AdjustIfPossibleButAlwaysSpawn, nil, nil, nil)
    local OldFOV = PlayerCameraManager:GetFOVAngle()
    self.CurrentCamera.CameraComponent:SetConstraintAspectRatio(false)
    USequenceFunctionLibrary.SetViewTarget(PlayerController, self.CurrentCamera)
    local TargetCameraLoc = FVector(NpcForwardVector.X - 18, NpcForwardVector.Y - 15.5, NpcHeadLoc.Z)
    NpcCameraRotation.Pitch = NpcCameraRotation.Pitch - 4.8
    NpcCameraRotation.Yaw = NpcCameraRotation.Yaw + 197.6
    local CameraTansrorm = FTransform(NpcCameraRotation:ToQuat(), TargetCameraLoc)
    self.TargetCamera = GameInstance:GetWorld():SpawnActor(ACameraActor:StaticClass(), CameraTansrorm, UE4.ESpawnActorCollisionHandlingMethod.AdjustIfPossibleButAlwaysSpawn, nil, nil, nil)
    self.TargetCamera.CameraComponent.FieldOfView = OldFOV
    self.TargetCamera.CameraComponent:SetConstraintAspectRatio(false)
    self:AdaptCameraComponent(self.TargetCamera.CameraComponent)
    local CurveName = "/Game/UI/WBP/Common/VX/Task/Curve_Task_NpcSideTask.Curve_Task_NpcSideTask"
    USequenceFunctionLibrary.SetViewTargetWithBlendByCurve(PlayerController, self.TargetCamera, self.CameraBlendTime, CurveName, CurveName, CurveName)
  end
end

function ReceiveSideQuestNode:FinishAction(OptionStr)
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  if self.IsShowDialog then
    if self.ListenTimer then
      GWorld.GameInstance:RemoveTimer(self.ListenTimer)
      self.ListenTimer = nil
    end
    if self.EnableSequence then
      if IsValid(self.CameraSequenceActor) then
        self.CameraSequenceActor:K2_DestroyActor()
        self.CameraSequenceActor = nil
      end
      if self.Widget then
        self.Widget:CloseTips()
        self.PlayerCharacter:SetCanInteractiveTrigger(true, "ReceiveSideQuestNode")
        self.PlayerCharacter:SetActorHideTag("NpcSideTips", false)
      end
    else
      local ViewTarget = self.PlayerController:GetViewTarget()
      self.PlayerController:SetViewTargetWithBlend(ViewTarget, 1.0, EViewTargetBlendFunction.VTBlend_Linear, 0, false)
      if IsValid(self.TargetCamera) then
        self.TargetCamera:K2_DestroyActor()
      end
      if IsValid(self.CurrentCamera) then
        self.CurrentCamera:K2_DestroyActor()
      end
      if self.Widget then
        self.Widget:CloseTips()
        self.PlayerCharacter:SetCanInteractiveTrigger(true, "ReceiveSideQuestNode")
        self.PlayerCharacter:SetActorHideTag("NpcSideTips", false)
      end
    end
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    if self.Widget then
      self.Widget:CloseTips()
    end
    self:Finish(OptionStr)
    return
  end
  if "ApproveOut" == OptionStr then
    local NpcSideIndicator = UIManager:GetUIObj("UnSpecialSide_" .. tostring(self.TalkNpcId))
    if NpcSideIndicator then
      NpcSideIndicator:CloseIndicator()
      EventManager:FireEvent(EventID.OnChangeTaskIndicator, TaskUtils.MissionNpcGuideMaps)
    end
    if MissionIndicatorManager.MissionNpcSideBubbles[self.TalkNpcId] then
      MissionIndicatorManager.MissionNpcSideBubbles[self.TalkNpcId] = nil
    end
    if nil ~= MissionIndicatorManager.TrackingSpecialSideQuestChainId and MissionIndicatorManager.TrackingSpecialSideQuestChainId == self.SideQuestChainId then
      MissionIndicatorManager.TrackingSpecialSideQuestChainId = nil
    end
    EventManager:FireEvent(EventID.EnableNpcSideBubble, self.TalkNpcId, false)
  end
  self:Finish(OptionStr)
end

function ReceiveSideQuestNode:Clear()
  if self.EnableSequence and IsValid(self.CameraSequenceActor) then
    self.CameraSequenceActor:K2_DestroyActor()
    self.CameraSequenceActor = nil
  elseif self.ListenTimer then
    GWorld.GameInstance:RemoveTimer(self.ListenTimer)
    self.ListenTimer = nil
  end
end

function ReceiveSideQuestNode:AdaptCameraComponent(CameraComponent)
  if not IsValid(CameraComponent) then
    return
  end
  local AspectRatio, FOV, bConstrainAspectRatio = CommonUtils:GetCurrentAspectRatioAndFOV()
  if URuntimeCommonFunctionLibrary.ObjIsChildOf(CameraComponent, UCineCameraComponent) then
    local CineCameraComponent = CameraComponent
    if IsValid(CineCameraComponent) then
      local DesiredHeight = CineCameraComponent.Filmback.SensorWidth / AspectRatio
      CineCameraComponent.bConstrainAspectRatio = false
      CineCameraComponent:SetFieldOfView(FOV)
      CineCameraComponent.Filmback.SensorHeight = DesiredHeight
    end
  elseif URuntimeCommonFunctionLibrary.ObjIsChildOf(CameraComponent, UCameraComponent) then
    CameraComponent.bConstrainAspectRatio = false
    CameraComponent:SetFieldOfView(FOV)
    CameraComponent:SetAspectRatio(AspectRatio)
  end
end

return ReceiveSideQuestNode
