local CountTrigger_C = require("BluePrints.Story.Talk.Controller.CountTrigger")
local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local ETalkNodeFinishType = require("StoryCreator.StoryLogic.StorylineUtils").ETalkNodeFinishType
local TalkWaitQueueManager_C = require("BluePrints.Story.Talk.Controller.TalkWaitQueue").TalkWaitQueueManager_C
local TalkTimerManager_C = require("BluePrints.Story.Talk.Controller.TalkTimer").TalkTimerManager_C
local TalkCameraManager_C = require("BluePrints.Story.Talk.Controller.TalkCameraManager")
local TalkDelegateManager_C = require("BluePrints.Story.Talk.Controller.TalkDelegate").TalkDelegateManager_C
local TalkActionManager_C = require("BluePrints.Story.Talk.Controller.TalkActionManager")
local TalkStateManager_C = require("BluePrints.Story.Talk.Controller.TalkStateManager")
local CreateTalkActionData = require("BluePrints.Story.Talk.Model.TalkActionData").CreateTalkActionData
local FTalkTriggerComponent = require("BluePrints.Story.Talk.Component.TalkTriggerComponent")
local TimeUtil = require("Utils.TimeUtils")
local MiscUtils = require("Utils.MiscUtils")
local WaitQueueTag = {
  LoadLevel = "LoadLevel",
  CameraBlend = "CameraBlend",
  DelayTime = "DelayTime",
  CreateActors = "CreateActors",
  TalkNpcRotateToPlayer = "TalkNpcRotateToPlayer",
  PlayerMove = "PlayerMove"
}
local PlayerCharClass = LoadClass("/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C")
local TalkActorData_C = {}

function TalkActorData_C.New(TalkActor, TalkActorType, TalkActorId, bIsExternal)
  local Obj = {}
  Obj.TalkActor = TalkActor
  Obj.TalkActorType = TalkActorType
  Obj.TalkActorId = TalkActorId
  Obj.bIsExternal = bIsExternal
  return Obj
end

local BP_TalkContext_C = Class("BluePrints.Common.TimerMgr")

function BP_TalkContext_C:Initialize(Initializer)
  self.InternalUIs = {}
  self.ExternalUIs = {}
  self.ValidTalkTasks = {}
  self.SequenceTalkTask = nil
  self.BubbleTalkTasks = {}
  self.TalkActorDatas = {}
  self.bGlobalAutoPlay = false
  self.BranchTriggerId = nil
  self.TalkTimerManager = TalkTimerManager_C.New()
  self.WaitQueueManager = TalkWaitQueueManager_C.New()
  self.TalkDelegateManager = TalkDelegateManager_C.New()
  self.TalkStateManager = TalkStateManager_C.New()
  self.TalkActionManager = TalkActionManager_C.New()
  self.TalkCameraManager = nil
  self.TalkStageMap = {}
  self.Player = nil
  self.PlayerController = nil
  self.InteractiveActor = nil
  self.MisImmunePausedActors = {}
  self.SequenceImmunePausedActors = {}
  self.TalkImmunePausedActors = {}
  self.bGamePaused = false
  self.CustomNPCs = {}
  self.CamerasInSequence = {}
  self.SimpleBlackUI = nil
  self.CinematicBlackUI = nil
  self.DialogueBlackUI = nil
  self.InTalkActorVisibility = {}
  self.bUseMobileTalkUI_Debug = false
  self.FadeOutTimerInterval = 0.1
  self.TalkNodes = {}
  self.TalkConfigs = {}
  self.OnPausedCachedData = {}
  self.RecordDataMap = {}
  self.bAllPlayerHasHidden = false
  self.bInMobile = false
  self.ActorHasImmuneGamePause = {}
  self.MatInSequenceResumeLogics = {}
  self.bCachedDoNotReceiveCharacterShadow = nil
  self.BubbleLastPlayTime = {}
end

function BP_TalkContext_C:ReceiveBeginPlay()
  self.Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  self.PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  DebugPrint("Player", self.Player, self.PlayerController)
  self.TalkCameraManager = TalkCameraManager_C.New(self, self.Player, self.PlayerController)
  self.TalkTriggerComponent = FTalkTriggerComponent:New()
  local UIModePlatform = CommonUtils.GetDeviceTypeByPlatformName(self)
  if "Mobile" == UIModePlatform then
    self.bInMobile = true
  end
end

function BP_TalkContext_C:GetInMobile()
  return self.bInMobile or self.bUseMobileTalkUI_Debug
end

function BP_TalkContext_C:ReceiveTick(DeltaTime)
  self.TalkTimerManager:ReceiveTick(DeltaTime)
  self.TalkCameraManager:ReceiveTick(DeltaTime)
  self.TalkActionManager:ReceiveTick(DeltaTime)
end

function BP_TalkContext_C:CreateTalkActors(TalkTask, CreateInfos, Callback, TalkStage)
  Callback = Callback or function()
  end
  if -1 == TalkTask.TalkTaskData.BlendInTime then
    Callback()
    return
  end
  if not CreateInfos or 0 == #CreateInfos then
    Callback()
    return
  end
  local CountTrigger = CountTrigger_C.New(#CreateInfos, {
    Func = function()
      Callback()
    end
  })
  local StageInfos = self:CreateStageInfos(TalkStage)
  for _, CreateInfo in ipairs(CreateInfos) do
    local ActorId = CreateInfo.TalkActorId
    local ActorType = CreateInfo.TalkActorType
    local bVisible = CreateInfo.TalkActorVisible
    local StageInfo = StageInfos[ActorId]
    
    local function OnGotActor(Actor, bExternal)
      if not IsValid(Actor) then
        local Message = string.format("\229\175\185\232\175\157\229\136\155\229\187\186Actor\229\164\177\232\180\165\239\188\140ActorId: %d, ActorType: %s", ActorId, ActorType)
        UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
        return
      end
      if StageInfo then
        local StaticCreateActor = StageInfo.StaticCreateActor
        local Loc = StageInfo.Loc
        local Rot = StageInfo.Rot
        local ForcedLodModel = StageInfo.ForcedLodModel
        if type(Actor.SetStagePoint) == "function" then
          Actor:SetStagePoint(StaticCreateActor)
        end
        if IsValid(Actor.CapsuleComponent) and Actor.UnitId and DataMgr.Npc[Actor.UnitId] and (DataMgr.Npc[Actor.UnitId].IsSit == nil or 2 ~= DataMgr.Npc[Actor.UnitId].IsSit) then
          local HalfUpVector = Actor:GetActorUpVector()
          local HalfHeight = Actor.CapsuleComponent.CapsuleHalfHeight
          Loc = Loc + UKismetMathLibrary.Multiply_VectorFloat(HalfUpVector, HalfHeight)
          Actor:K2_SetActorLocationAndRotation(Loc, Rot, false, nil, false)
        end
        if "function" == type(Actor.ResetLocation) and Actor.UnitId and DataMgr.Npc[Actor.UnitId] and (DataMgr.Npc[Actor.UnitId].IsSit == nil or 2 ~= DataMgr.Npc[Actor.UnitId].IsSit) then
          Actor:ResetLocation()
        end
        if IsValid(Actor.Mesh) and "function" == type(Actor.Mesh.SetForcedLOD) and ForcedLodModel then
          Actor.Mesh:SetForcedLOD(ForcedLodModel)
        end
      end
      self:RecordInShowActorVisibility(Actor, bVisible)
      self:AddTalkActor(TalkTask, ActorType, ActorId, Actor, bExternal)
      CountTrigger:CountIncrement()
    end
    
    if CreateInfo.TalkActorType == "Player" then
      OnGotActor(self.Player, true)
    elseif CreateInfo.TalkActorType == "Npc" then
      self:GetNPCAsync(CreateInfo.TalkActorId, function(NPC)
        if IsValid(NPC) then
          OnGotActor(NPC, true)
        else
          StageInfo = StageInfo or {
            Loc = UE4.FVector(0, 0, 0),
            Rot = UE4.FRotator(0, 0, 0)
          }
          self:CreateTalkActorInternal(ActorId, ActorType, StageInfo.Loc, StageInfo.Rot, function(Unit)
            OnGotActor(Unit, false)
          end)
        end
      end)
    else
      CountTrigger:CountIncrement()
    end
  end
end

function BP_TalkContext_C:DestoryTalkActors(TalkTask, RemoveTalkActors)
  if -1 == TalkTask.TalkTaskData.BlendOutTime then
    return
  end
  self:RealDestoryTalkActors(TalkTask, RemoveTalkActors)
end

function BP_TalkContext_C:RealDestoryTalkActors(TalkTask, RemoveTalkActors)
  for _, RemoveTalkActorData in ipairs(RemoveTalkActors) do
    local UnitId = RemoveTalkActorData.TalkActorId
    self:RemoveTalkActor(TalkTask, UnitId)
  end
end

function BP_TalkContext_C:NPCPlayDefaultAction(TalkTask, TalkActorInfos)
  for _, TalkActorInfo in ipairs(TalkActorInfos) do
    local ActorData = self:GetTalkActorData(TalkTask, TalkActorInfo.TalkActorId)
    if ActorData then
      local Actor = ActorData.TalkActor
      if IsValid(Actor) and Actor:IsA(ANpcCharacter) then
        Actor:PlayDefaultAnimation()
      end
    end
  end
end

function BP_TalkContext_C:TalkHidePlayer(Player, bHide)
  local TS = TalkSubsystem()
  if IsValid(TS) then
    TS:TalkHidePlayerCharacter(Player, bHide, Const.TalkHideTag)
  end
end

function BP_TalkContext_C:AddTalkActor(TalkTask, UnitType, UnitId, Unit, bIsExternal)
  if self.TalkActorDatas[UnitId] then
    return
  end
  if "Npc" == UnitType then
    local Type = TalkTask.TalkTaskData.TalkType
    local bCacheMeshMaterials = "Cinematic" == Type
    Unit:PreEnterStory({}, bCacheMeshMaterials, TalkTask.TalkTaskData.bPauseNpcBT)
  end
  self.TalkActorDatas[UnitId] = TalkActorData_C.New(Unit, UnitType, UnitId, bIsExternal)
end

function BP_TalkContext_C:RemoveTalkActor(TalkTask, UnitId)
  if self.TalkActorDatas[UnitId] == nil then
    return
  end
  local Data = self.TalkActorDatas[UnitId]
  local UnitType = Data.TalkActorType
  local Unit = Data.TalkActor
  local bIsExternal = Data.bIsExternal
  if IsValid(Unit) then
    if "Player" == UnitType then
      self:TalkHidePlayer(Unit, false)
    elseif "Npc" == UnitType then
      if bIsExternal then
        self:ShowHideActor(Unit, true)
        Unit:PreExitStory({}, TalkTask.TalkTaskData.bPauseNpcBT)
      else
        Unit:EMActorDestroy(EDestroyReason.TalkContext)
      end
    end
  end
  self.TalkActorDatas[UnitId] = nil
end

function BP_TalkContext_C:GetTalkActorData(TalkTask, SearchUnitId)
  return self.TalkActorDatas[SearchUnitId]
end

function BP_TalkContext_C:GetAllTalkActorData(TalkTask)
  return self.TalkActorDatas
end

function BP_TalkContext_C:RegisterInteractiveActor(TalkActor)
  DebugPrint("BP_TalkContext_C:RegisterInteractiveActor", TalkActor)
  self.InteractiveActor = TalkActor
  self.TalkCameraManager.InteractiveActor = TalkActor
end

function BP_TalkContext_C:UnregisterInteractiveActor()
  DebugPrint("BP_TalkContext_C:UnregisterInteractiveActor")
  self.InteractiveActor = nil
  self.TalkCameraManager.InteractiveActor = nil
end

function BP_TalkContext_C:ShowInteractiveActor(bShow)
  if self.InteractiveActor then
    self:ShowHideActor(self.InteractiveActor, bShow)
  end
end

function BP_TalkContext_C:GetTalkActionData(ActorId, AnimationId)
  return CreateTalkActionData(ActorId, AnimationId)
end

function BP_TalkContext_C:CreateTalkActorInternal(UnitId, UnitType, Loc, Rot, OnCreated)
  DebugPrint("CreateTalkActor", UnitId, UnitType, type(UnitId))
  local GameState = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(self)
  local Level = GameState.GameModeLevel + 0
  
  local function NewLoadFinishCallback(_, Unit)
    OnCreated(Unit)
  end
  
  local Context = AEventMgr.CreateUnitContext()
  Context.UnitType = UnitType
  Context.UnitId = UnitId
  Context.Loc = Loc
  Context.Rotation = Rot
  Context.IntParams:Add("Level", Level)
  Context.BoolParams:Add("InStory", true)
  Context.IntParams:Add("RegionDataType", 0)
  Context.OnUnitInitCreateReadyDynamic:Add(self, NewLoadFinishCallback)
  GameState.EventMgr:CreateUnitNew(Context, true)
end

function BP_TalkContext_C:GetNPCAsync(NPCId, OnGotNPC)
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if not GameState then
    DebugPrint("Async get or create NPC failed, game state is nil.", GameState)
    OnGotNPC(nil)
    return
  end
  if not GameState.GetNpcInfoAsync then
    DebugPrint("Async get or create NPC failed, game state get npc info async is nil.")
    OnGotNPC(nil)
    return
  end
  GameState:GetNpcInfoAsync(NPCId, function(NPC)
    OnGotNPC(NPC)
  end)
end

function BP_TalkContext_C:SnapshotAttachesVisibleState(Actor)
  local SnapshotVisibleState = {}
  local Attaches = Actor.GetAllAttaches and Actor:GetAllAttaches() or {}
  for _, Attach in ipairs(Attaches) do
    SnapshotVisibleState[Attach] = Attach.bHidden
  end
  return SnapshotVisibleState
end

function BP_TalkContext_C:HideActor(TalkActorData, bWithAttaches, bPauseTick)
  if not TalkActorData.TalkActor then
    DebugPrint("TalkActorData.TalkActor is nil")
    return
  end
  DebugPrint("HideActor", TalkActorData.TalkActorId, TalkActorData.TalkActor:GetName())
  local Actor = TalkActorData.TalkActor
  self:ShowHideActor(Actor, false)
end

function BP_TalkContext_C:ShowActor(TalkActorData, bWithAttaches, bResumeTick)
  if not TalkActorData or not TalkActorData.TalkActor then
    DebugPrint("TalkActorData.TalkActor is nil")
    return
  end
  DebugPrint("ShowActor", TalkActorData.TalkActorId, TalkActorData.TalkActor:GetName())
  local Actor = TalkActorData.TalkActor
  self:ShowHideActor(Actor, true)
end

function BP_TalkContext_C:RequestRegisterTalkTask(TalkTask, TalkType, BasicTalkType)
  DebugPrint("Register talk: " .. TalkType)
  if "Cinematic" == BasicTalkType then
    self.SequenceTalkTask = TalkTask
  end
  return true
end

function BP_TalkContext_C:UnRegisterTalkTask(TalkTask)
  if self.SequenceTalkTask == TalkTask then
    self.SequenceTalkTask = nil
  end
end

function BP_TalkContext_C:InterruptTalkTask(TalkTask, TalkNodeFinishType)
  TalkNodeFinishType = TalkNodeFinishType or ETalkNodeFinishType.Out
  if self.ValidTalkTasks[TalkTask] then
    self.ValidTalkTasks[TalkTask] = nil
    TalkTask:OnInterrupted(TalkNodeFinishType)
  end
end

function BP_TalkContext_C:InterruptTalkTaskByTriggerId(TriggerId, TalkNodeFinishType)
  TalkNodeFinishType = TalkNodeFinishType or ETalkNodeFinishType.Out
  local TalkTask = self.BubbleTalkTasks[TriggerId]
  if TalkTask then
    TalkTask:OnInterrupted(TalkNodeFinishType)
  end
end

function BP_TalkContext_C:SequencePlayDialogue(DialogueId, bStart)
  DebugPrint("SequencePlayDialogue", DialogueId, self.SequenceTalkTask)
  if self.SequenceTalkTask then
    self.SequenceTalkTask:OnSequencePlayDialogue(DialogueId, bStart)
  end
end

function BP_TalkContext_C:SequenceTryPauseDialogue()
  DebugPrint("SequenceTryPauseDialogue")
  local SequenceTryPauseDialogue = self.SequenceTalkTask.SequenceTryPauseDialogue
  if self.SequenceTalkTask and SequenceTryPauseDialogue then
    return SequenceTryPauseDialogue(self.SequenceTalkTask)
  else
    return false
  end
end

function BP_TalkContext_C:SequenceSetActorHidden(Actor, bHidden)
  self:ShowHideActor(Actor, not bHidden)
end

function BP_TalkContext_C:BindActors(TalkTask)
  for _, TalkActorInfo in ipairs(TalkTask.TalkTaskData.CreateTalkActors) do
    local UnitId = TalkActorInfo.TalkActorId
    local UnitIdStr = tostring(UnitId)
    local Unit = self:GetTalkActorData(TalkTask, UnitId).TalkActor
    if Unit and UTalkFunctionLibrary.IsSequenceOwnTag(TalkTask.TalkTaskData.SequencePlayer:GetSequence(), UnitIdStr) then
      TalkTask.TalkTaskData.SequenceActor:AddBindingByTag(UnitIdStr, Unit, false)
    end
  end
end

function BP_TalkContext_C:BindSequencerControllerComponents(TaskData)
  local Subsystem = USequenceControlGameInstanceSubsystem.GetSubsystem(self)
  if nil == Subsystem then
    DebugPrint("Waring: Subsystem is nil, bind sequencer controller components failed.")
    return
  end
  local Tags = TArray(FName)
  USequenceUtils.GetSequenceAllBindingTags(TaskData.SequencePlayer:GetSequence(), Tags)
  for _, Tag in pairs(Tags) do
    local SequencerController = Subsystem:GetSequencerControllerComponent(Tag)
    if SequencerController then
      TaskData.SequenceActor:AddBindingByTag(Tag, SequencerController:GetOwner(), false)
    else
      DebugPrint("Waring: not find SequencerController by tag: " .. Tag .. ", bind sequencer controller components failed.")
    end
  end
end

function BP_TalkContext_C:RegisterBranchTriggerId(Id)
  self.BranchTriggerId = Id
end

function BP_TalkContext_C:UnregisterBranchTriggerId()
  self.BranchTriggerId = nil
end

function BP_TalkContext_C:GetBranchTriggerId()
  return self.BranchTriggerId
end

function BP_TalkContext_C:ConditionalSetupCharacterShadowSetting(TalkTaskData)
  DebugPrint("ConditionalSetupCharacterShadowSetting", TalkTaskData.DoNotReceiveCharacterShadow, self.SetCharacterShadowSetting, self.GetCharacterShadowSetting)
  if TalkTaskData.DoNotReceiveCharacterShadow ~= nil and self.SetCharacterShadowSetting and self.GetCharacterShadowSetting then
    self.CachedDoNotReceiveCharacterShadow = self:GetCharacterShadowSetting()
    self:SetCharacterShadowSetting(TalkTaskData.DoNotReceiveCharacterShadow)
  end
end

function BP_TalkContext_C:ConditionalRecoverCharacterShadowSetting(TalkTaskData)
  if TalkTaskData.DoNotReceiveCharacterShadow ~= nil and self.SetCharacterShadowSetting then
    if nil == self.CachedDoNotReceiveCharacterShadow then
      DebugPrint("Error: CachedDoNotReceiveCharacterShadow is nil, recover character shadow setting failed.")
      return
    end
    self:SetCharacterShadowSetting(self.CachedDoNotReceiveCharacterShadow)
    self.CachedDoNotReceiveCharacterShadow = nil
  end
end

function BP_TalkContext_C:CreateStageInfos(Stage)
  if not Stage then
    return {}
  end
  local StageInfos = {}
  local StaticCreateActors = Stage.StaticCreateActors
  for i = 1, StaticCreateActors:Length() do
    local StaticCreateActor = StaticCreateActors:GetRef(i)
    if IsValid(StaticCreateActor) then
      local Trans = StaticCreateActor:GetTransform()
      local Loc, Rot = UE.UKismetMathLibrary.BreakTransform(Trans)
      local UnitId = StaticCreateActor.UnitId
      local ForcedLodModel = StaticCreateActor.ForcedLodModel
      StageInfos[UnitId] = {
        StaticCreateActor = StaticCreateActor,
        Loc = Loc,
        Rot = Rot,
        ForcedLodModel = ForcedLodModel
      }
    else
      local Message = string.format("\232\136\158\229\143\176\239\188\136%s\239\188\137\233\133\141\231\189\174\231\154\132\231\172\172 %d \228\184\170\229\136\183\230\150\176\231\130\185\230\152\175\231\169\186\231\154\132\239\188\140\232\139\165\233\157\158\230\132\143\229\164\150\229\136\160\233\153\164\239\188\140\229\136\153\231\167\187\233\153\164\232\175\165\230\149\176\230\141\174\227\128\130", Stage:GetName(), i)
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\233\157\153\230\128\129\229\136\183\230\150\176\231\130\185\230\152\175\231\169\186\231\154\132", Message)
    end
  end
  return StageInfos
end

function BP_TalkContext_C:TryFireCallback(Callback)
  if Callback and Callback.Func then
    Callback.Func(Callback.Obj, table.unpack(Callback.Params or {}))
  end
end

function BP_TalkContext_C:GetStage(TalkStageName)
  if not TalkStageName or "" == TalkStageName then
    return
  end
  return self.TalkStageMap[TalkStageName]
end

function BP_TalkContext_C:RegisterStage(TalkStageName, Stage)
  if not TalkStageName or "" == TalkStageName then
    local Message = UKismetSystemLibrary.GetPathName(Stage)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\156\176\229\155\190\228\184\173\229\173\152\229\156\168\230\151\160\230\149\136TalkStage(DisplayName\228\184\186\231\169\186)", Message)
    return
  end
  if self.TalkStageMap[TalkStageName] then
  end
  self.TalkStageMap[TalkStageName] = Stage
end

function BP_TalkContext_C:RecordBubbleStart(TalkTaskData)
  if not TalkTaskData or not TalkTaskData.TalkNodeId then
    return
  end
  self.BubbleLastPlayTime[TalkTaskData.TalkNodeId] = TimeUtil.NowTime()
end

function BP_TalkContext_C:GetBubbleLastPlayTime(TalkTaskData)
  if not TalkTaskData or not TalkTaskData.TalkNodeId then
    return 0
  end
  return self.BubbleLastPlayTime[TalkTaskData.TalkNodeId] or 0
end

function BP_TalkContext_C:StartTalk(TalkTriggerId, OverridenStoryLinePath, OverridenTalkId, Player, InteractiveActor, OnTalkEndCallback, OnPlayDialogue, RelatedNpcIds)
  local TalkTriggerInfo = TalkTriggerId and DataMgr.TalkTrigger[TalkTriggerId] or {}
  local StoryLinePath = OverridenStoryLinePath or TalkTriggerInfo.StoryLinePath
  local BranchId = tonumber(OverridenTalkId or TalkTriggerInfo.TalkId)
  local GameInstance = GWorld.GameInstance
  if not StoryLinePath and TalkTriggerId then
    self:StartDirectTalkByTalkTriggerId_CPP(TalkTriggerId, nil, function()
      if OnTalkEndCallback then
        OnTalkEndCallback.Func(OnTalkEndCallback.Obj)
      end
    end)
    return
  end
  local TalkContext = GameInstance:GetTalkContext()
  TalkContext:RegisterBranchTriggerId(BranchId)
  
  local function STLCallback()
    if not IsValid(self) then
      return
    end
    if OnTalkEndCallback and OnTalkEndCallback.Func then
      OnTalkEndCallback.Func(OnTalkEndCallback.Obj)
    end
  end
  
  local TalkActors = {
    {
      TalkActorType = "Player",
      TalkActorId = 0,
      TalkActorVisible = true
    }
  }
  if IsValid(InteractiveActor) then
    local InteractiveActorUnitType = InteractiveActor.UnitType
    if "NPC" == InteractiveActorUnitType then
      InteractiveActorUnitType = "Npc"
    end
    table.insert(TalkActors, {
      TalkActorType = InteractiveActorUnitType,
      TalkActorId = InteractiveActor.UnitId or InteractiveActor.NpcId,
      TalkActorVisible = true
    })
  end
  if RelatedNpcIds then
    for _, NpcId in pairs(RelatedNpcIds) do
      table.insert(TalkActors, {
        TalkActorType = "Npc",
        TalkActorId = NpcId,
        TalkActorVisible = true
      })
    end
  end
  return GWorld.StoryMgr:RunStory(StoryLinePath, nil, nil, STLCallback, STLCallback, {
    TalkTriggerId = TalkTriggerId,
    PlayDialogueCallBack = OnPlayDialogue,
    TalkActors = TalkActors
  })
end

function BP_TalkContext_C:StopTalk(StoryLinePath)
  DebugPrint("StopTalk", StoryLinePath, UE4.UKismetSystemLibrary.GetFrameCount())
  GWorld.StoryMgr:StopStoryline(StoryLinePath)
end

function BP_TalkContext_C:StartDirectTalkByTalkTriggerId_CPP(TalkTriggerId, AudioAttachActor, EndCallback)
  DebugPrint("StartDirectTalkByTalkTriggerId_CPP ", TalkTriggerId)
  if not self:CheckTalkTriggerId() then
    DebugPrint("\230\163\128\230\181\139TalkTriggerId\228\184\141\233\128\154\232\191\135\239\188\140\232\175\183\230\163\128\230\159\165\233\133\141\231\189\174", TalkTriggerId)
    if EndCallback then
      EndCallback()
    end
    return
  end
  local TS = TalkSubsystem()
  if not TS then
    DebugPrint("\232\142\183\229\143\150TalkSubsystem\229\164\177\232\180\165:")
    if EndCallback then
      EndCallback()
    end
    return
  end
  local TalkTriggerInfo = DataMgr.TalkTrigger[TalkTriggerId]
  if not TalkTriggerInfo then
    Utils.ScreenPrint("Warning: \232\176\131\231\148\168\231\155\180\230\142\165\230\146\173\230\148\190\229\175\185\232\175\157\230\151\182\228\188\160\229\133\165\228\186\134\230\151\160\230\149\136\231\154\132TalkTriggerId,\232\175\183\230\163\128\230\159\165\227\128\130TalkTriggerId: " .. TalkTriggerId)
    if EndCallback then
      EndCallback()
    end
    return
  end
  if TalkTriggerInfo.StoryLinePath then
    self:StartTalk(TalkTriggerId, nil, nil, nil, nil, {Func = EndCallback, Obj = self})
  else
    local RawData = {
      TalkType = TalkTriggerInfo.TalkType,
      FirstDialogueId = TalkTriggerInfo.DialogueId,
      AudioAttachActor = AudioAttachActor,
      TalkTriggerId = TalkTriggerId,
      BlendInTime = 0.5,
      BlendOutTime = 0.5
    }
    local TaskDataKey = TS:RegisterTalkData(RawData)
    local TA = UE4.UPlayTalkAsyncAction.PlayTalk(GWorld.GameInstance, TaskDataKey, nil)
    if type(EndCallback) == "function" then
      TA.OnPlayTalkEnd:Add(self, EndCallback)
    end
  end
end

function BP_TalkContext_C:CheckTalkTriggerId(Id)
  return true
end

function BP_TalkContext_C:GenDummyTalkNode(InTalkId, InTalkTypeStr)
  local DirectTalkData = DataMgr.Dialogue[InTalkId]
  if nil == DirectTalkData then
    DebugPrint("BP_TalkContext_C:GenDummyTalkNode: InTalkId is nil", InTalkId)
    return
  end
  local TalkNodeData = {
    FilePath = nil,
    TalkNodeId = nil,
    TalkId = nil,
    Options = nil,
    FirstDialogueId = InTalkId,
    TalkType = InTalkTypeStr,
    TalkStageName = nil,
    ShowFilePath = nil,
    FOVCurve = nil,
    CameraPositionCurve = nil,
    CameraRotationCurve = nil,
    PlayerSpeedCurve = nil,
    Pose = nil,
    bPlayerMove = nil,
    BlendInTime = nil,
    BlendOutTime = nil,
    BlendInType = nil,
    BlendOutType = nil,
    ShowSkipButton = nil,
    ShowAutoPlayButton = nil,
    PauseGameGlobal = nil,
    DisableMonsterAI = nil,
    DisableMonsterAIForSimpleTalk = nil,
    DisableNPCAI = nil,
    HideAllBattleEntity = nil,
    HideElseCharacter = nil,
    RestoreStand = nil,
    TalkActors = {
      {
        TalkActorType = "Player",
        TalkActorId = 0,
        TalkActorVisible = true
      }
    },
    RemoveTalkActors = nil,
    GuideMeshIndexList = nil,
    BeginTargetPoint = nil,
    EndTargetPoint = nil,
    CameraLookAtTartgetPoint = nil,
    SkipToOption = false,
    RandomOptionNum = nil,
    SaveToServer = nil,
    OptionType = nil,
    NormalOptions = nil,
    RandomOptions = nil,
    PlusOptions = nil,
    CheckOptions = nil,
    UseProceduralCamera = nil,
    ProceduralCameraId = nil,
    IsPlayStartSound = nil
  }
  return TalkNodeData
end

function BP_TalkContext_C:GetValidTalkTriggerId(TalkTriggerIds)
  if nil == TalkTriggerIds then
    return
  end
  for _, TalkTriggerId in ipairs(TalkTriggerIds) do
    if MiscUtils.IsWithoutAvatar(self) then
      return TalkTriggerId
    end
    local TalkTriggerInfo = DataMgr.TalkTrigger[TalkTriggerId]
    if self.TalkTriggerComponent:CanTrigger(TalkTriggerInfo) then
      return TalkTriggerId
    end
  end
end

function BP_TalkContext_C:CreateImpressionMarkCondition(TriggerCondition, TalkTriggerId)
  local Condition = {}
  local ImprUncomp = {TalkTriggerId = TalkTriggerId}
  if TriggerCondition then
    Condition.And = {ImprUncomp = ImprUncomp}
    for Key, Val in pairs(TriggerCondition) do
      Condition.And[Key] = Val
    end
  else
    Condition.ImprUncomp = ImprUncomp
  end
  return Condition
end

function BP_TalkContext_C:HideAllBattleEntity()
  if self.SequenceTalkTask then
    self.SequenceTalkTask.bHasHiddenBattleEntity = true
    self:SetAllBattleEntityHidden(true)
  end
end

function BP_TalkContext_C:ShowAllBattleEntity()
  if self.SequenceTalkTask then
    if not self.SequenceTalkTask.bHasHiddenBattleEntity then
      return
    end
    self.SequenceTalkTask.bHasHiddenBattleEntity = false
    self:SetAllBattleEntityHidden(false)
  end
end

function BP_TalkContext_C:SetAllBattleEntityHidden(bHidden)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState:HideAllPickups(Const.TalkHideTag, bHidden)
end

function BP_TalkContext_C:HasDisableMonsterSpawn()
  return self.TalkStateManager:GetTalkState(Const.TalkState_DisableMonsterSpawn)
end

function BP_TalkContext_C:HasHiddenGameUI()
  return self.TalkStateManager:GetTalkState(Const.TalkState_HiddenGameUI)
end

function BP_TalkContext_C:IsInTalk()
  return self.TalkStateManager:GetTalkState(Const.TalkState_IsInTalk)
end

function BP_TalkContext_C:InterruptAllLightTalks()
  for TalkTask, Type in pairs(self.ValidTalkTasks) do
    if "Bubble" == Type or "Guide" == Type then
      self:InterruptTalkTask(TalkTask)
    end
  end
end

function BP_TalkContext_C:GetGlobalAutoPlay()
  return GWorld.GameInstance.bGlobalAutoPlay
end

function BP_TalkContext_C:SetGlobalAutoPlay(bAutoPlay)
  local GameInstance = GWorld.GameInstance
  GameInstance.bGlobalAutoPlay = bAutoPlay
end

function BP_TalkContext_C:ForceShowTalkRefActors()
  local function checkFunc(entity)
    if not entity then
      return false
    end
    if entity.IsPlayer and entity:IsPlayer() then
      return false
    end
    if entity.IsMonster and entity:IsMonster() then
      return true
    end
    if entity.IsNpc and entity:IsNpc() then
      return true
    end
    if URuntimeCommonFunctionLibrary.ObjIsChildOf(entity, APawn) then
      return true
    end
    return false
  end
  
  for _, entity in pairs(self.SequenceImmunePausedActors or {}) do
    if checkFunc(entity) then
      self:SetActorHidden(entity, false)
    end
  end
  for _, entity in pairs(self.TalkImmunePausedActors or {}) do
    if checkFunc(entity) then
      self:SetActorHidden(entity, false)
    end
  end
end

function BP_TalkContext_C:OnPausedBegin(TalkTaskData)
  DebugPrint("HYY OnPauseBegin")
  AudioManager(self):PlayFMODSound(nil, nil, "event:/snapshot/ui/global_pause_fader", "TalkFilterPausedOneShotSound")
end

function BP_TalkContext_C:OnPausedEnd(TalkTaskData)
  DebugPrint("HYY OnPauseEnd")
  AudioManager(self):SetEventSoundParam(nil, "TalkFilterPausedOneShotSound", {ToEnd = 1})
end

function BP_TalkContext_C:SetSpecifiedObjectsImmunePause(TalkTaskData)
  local SA = TalkTaskData.SequenceActor
  table.insert(self.MisImmunePausedActors, SA)
  if self.TalkCameraManager and self.TalkCameraManager.TalkPawn then
    table.insert(self.MisImmunePausedActors, self.TalkCameraManager.TalkPawn)
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local Entities = {}
  if not TalkTaskData.bDisableMonsterAI then
    Entities = GameState.MonsterMap:ToTable()
    for _, entity in pairs(Entities) do
      if entity.IsMonster and entity:IsMonster() then
        table.insert(self.MisImmunePausedActors, entity)
        local AIController = entity:GetController()
        if AIController then
          table.insert(self.MisImmunePausedActors, AIController)
        end
      end
    end
  end
  if not TalkTaskData.bDisableNPCAI then
    Entities = GameState.NpcCharacterMap:ToTable()
    for _, entity in pairs(Entities) do
      if entity.IsNPC and entity:IsNPC() then
        table.insert(self.MisImmunePausedActors, entity)
        local AIController = entity:GetController()
        if AIController then
          table.insert(self.MisImmunePausedActors, AIController)
        end
      end
    end
  end
end

function BP_TalkContext_C:SetActorsInSequenceImmunePause(TaskData)
end

function BP_TalkContext_C:SetActorImmunePauseOnSpawned(TargetActor)
  if IsValid(TargetActor) and TargetActor:Cast(AActor) then
    self:SetActorImmunePause(TargetActor, true)
    if TargetActor ~= self.Player and TargetActor:Cast(APawn) then
      self:SetActorHidden(TargetActor, false)
      table.insert(self.SequenceImmunePausedActors, TargetActor)
    end
  end
end

function BP_TalkContext_C:SetNiagaraMatImmunePauseOnActorSpawned(TargetActor)
  local NiagaraComponents = TargetActor:K2_GetComponentsByClass(UNiagaraComponent:StaticClass())
  local OutMaterials = TArray(UMaterialInterface)
  for _, NC in pairs(NiagaraComponents) do
    local NCCachedValue = UE4.URuntimeCommonFunctionLibrary.GetNiaragaComponentFloatParameter(NC, "IgnoreGamePause")
    NC:SetFloatParameter("IgnoreGamePause", 1)
    table.insert(self.MatInSequenceResumeLogics, {
      Obj = NC,
      Func = function()
        if IsValid(NC) then
          NC:SetFloatParameter("IgnoreGamePause", NCCachedValue)
        end
      end
    })
    UE4.URuntimeCommonFunctionLibrary.GetMaterialsInNiagaraComponent(NC, OutMaterials)
    for _, Mat in pairs(OutMaterials) do
      if Mat and Mat:Cast(UMaterialInstanceDynamic:StaticClass()) then
        local CachedValue = Mat:K2_GetScalarParameterValue("IgnoreGamePause")
        Mat:SetScalarParameterValue("IgnoreGamePause", 1)
        table.insert(self.MatInSequenceResumeLogics, {
          Obj = Mat,
          Func = function()
            if IsValid(Mat) then
              Mat:SetScalarParameterValue("IgnoreGamePause", CachedValue)
            end
          end
        })
      end
    end
  end
  local MeshComponents = TargetActor:K2_GetComponentsByClass(UMeshComponent:StaticClass())
  for _, Mesh in pairs(MeshComponents) do
    local MeshNum = Mesh:GetNumMaterials()
    for i = 0, MeshNum do
      local Mat = Mesh:GetMaterial(i)
      self.CachedObjectsAvoidGC:Add(Mat)
      if Mat then
        if Mat:Cast(UMaterialInstanceDynamic:StaticClass()) then
          local CachedValue = Mat:K2_GetScalarParameterValue("IgnoreGamePause")
          Mat:SetScalarParameterValue("IgnoreGamePause", 1)
          table.insert(self.MatInSequenceResumeLogics, {
            Obj = Mat,
            Func = function()
              if IsValid(Mat) then
                Mat:SetScalarParameterValue("IgnoreGamePause", CachedValue)
              end
            end
          })
        else
          local MID = Mesh:CreateAndSetMaterialInstanceDynamic(i)
          MID:SetScalarParameterValue("IgnoreGamePause", 1)
          Mesh:SetMaterial(i, MID)
          table.insert(self.MatInSequenceResumeLogics, {
            Obj = Mesh,
            Func = function()
              if IsValid(Mesh) and IsValid(Mat) then
                Mesh:SetMaterial(i, Mat)
              end
            end
          })
        end
      end
      table.insert(self.MatInSequenceResumeLogics, {
        Obj = self.CachedObjectsAvoidGC,
        Func = function()
          if IsValid(Mat) then
            self.CachedObjectsAvoidGC:Remove(Mat)
          end
        end
      })
    end
  end
end

function BP_TalkContext_C:SetActorsImmunePause(TargetActors, bImmune)
  if not TargetActors then
    return
  end
  for _, TargetActor in pairs(TargetActors) do
    self:SetActorImmunePause(TargetActor, bImmune)
  end
end

function BP_TalkContext_C:SetActorImmunePause(TargetActor, bImmune)
  if nil ~= TargetActor and IsValid(TargetActor) then
    TargetActor:SetTickableWhenPaused(bImmune)
    local Components = TargetActor:K2_GetComponentsByClass(UActorComponent:StaticClass())
    if Components then
      for _, _Component in pairs(Components) do
        _Component:SetTickableWhenPaused(bImmune)
      end
    end
    self:SetNiagaraMatImmunePauseOnActorSpawned(TargetActor)
    if URuntimeCommonFunctionLibrary.ObjIsChildOf(TargetActor, ACharacterBase) and TargetActor.GetAllAttaches then
      local Attaches = TargetActor:GetAllAttaches()
      if Attaches then
        self:SetActorsImmunePause(Attaches, bImmune)
      end
    end
  end
end

function BP_TalkContext_C:HideTypeOfActors(ActorType, bHide, IgnoreIds)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if IsValid(GameState) then
    if "Npc" == ActorType then
      GameState:HideAllNpcs(bHide, Const.TalkHideTag)
    elseif " Monster" == ActorType then
      GameState:HideAllRealMonsters(bHide, Const.TalkHideTag)
      GameState:HideAllPhantom(bHide, Const.TalkHideTag)
    end
  end
end

function BP_TalkContext_C:HideAndPauseMonsterAI(MonsterChar, bHideAndPause)
  if not IsValid(MonsterChar) then
    return
  end
  if MonsterChar.PauseBT and MonsterChar.ResumeBT then
    if bHideAndPause then
      MonsterChar:PauseBT("Talk")
    else
      MonsterChar:ResumeBT("Talk")
    end
  else
  end
  self:SetActorHidden(MonsterChar, bHideAndPause)
end

function BP_TalkContext_C:SetActorNoCollision(Target, bNoCollision)
  if Target == self.Player and Target.SetCollisionProfileOverlapAll then
    Target:SetCollisionProfileOverlapAll(bNoCollision)
  elseif Target.SetActorNoCollisionTag then
    Target:SetActorNoCollisionTag(bNoCollision, "TalkContext")
  else
    Target:SetActorEnableCollision(not bNoCollision)
  end
end

function BP_TalkContext_C:SetActorHidden(Target, bHidden)
  if Target and IsValid(Target) then
    if Target:Cast(ACharacterBase) then
      Target:SetActorHideTag("Talk", bHidden, false, true)
      if Target:IsNPC() then
        Target.CharacterMovement.Velocity = FVector(0, 0, 0)
      end
    else
      Target:SetActorHiddenInGame(bHidden)
      if Target.HideSkillCreature then
        Target:HideSkillCreature(bHidden)
      end
      if Target.HideAllEffectCreature then
        Target:HideAllEffectCreature("TalkContext", bHidden)
      end
    end
    self:SetActorNoCollision(Target, bHidden)
    if Target.GetBattlePet then
      local BattlePet = Target:GetBattlePet()
      if BattlePet then
        BattlePet:HideBattlePet("Actor", bHidden)
      end
    end
    if Target.GetAllDirectorSummon then
      local AllSummons = Target:GetAllDirectorSummon():ToTable()
      for _, SummonEid in pairs(AllSummons) do
        local Summon = Battle(self):GetEntity(SummonEid)
        if IsValid(Summon) then
          self:SetActorHidden(Summon, bHidden)
        end
      end
    end
  end
end

function BP_TalkContext_C:RecordCustomNPCInfo(Npc)
  self.CustomNPCs[Npc] = true
  if self:CheckConfigInTalkNode("bHideElseCharacter", true) then
    self:SetActorHidden(Npc, true)
  end
end

function BP_TalkContext_C:RemoveCustomNPCInfo(Npc)
  self.CustomNPCs[Npc] = nil
end

function BP_TalkContext_C:OnSequencePlayBegin(TalkTaskData)
  HeroUSDKSubsystem():UploadTrackLog_Lua("game_guide_step_start", {
    step_id = UFormulaFunctionLibrary.GetBaseFileName(TalkTaskData.SequencePath)
  })
  DebugPrint("@@@ CG\229\188\128\229\167\139", TalkTaskData.TalkNodeName)
  self.SequencePlayer = TalkTaskData.SequencePlayer
  self.SequenceActor = TalkTaskData.SequenceActor
  self:FixSequenceCamerasBegin(TalkTaskData)
end

function BP_TalkContext_C:OnSequencePlayEnd(TalkTaskData)
  local EndTime = UE4.UTimeManagementBlueprintLibrary.Conv_QualifiedFrameTimeToSeconds(self.SequencePlayer:GetEndTime())
  local EndType = TalkTaskData.bSkippedSequence and 0 or 1
  local ContinueTime = TalkTaskData.bSkippedSequence and TalkTaskData.SkippedSequencePoint or EndTime
  HeroUSDKSubsystem():UploadTrackLog_Lua("game_guide_step_end", {
    step_id = UFormulaFunctionLibrary.GetBaseFileName(TalkTaskData.SequencePath),
    end_type = EndType,
    continue_time = MiscUtils.Round(ContinueTime)
  })
  DebugPrint("@@@ CG\231\187\147\230\157\159", TalkTaskData.TalkNodeName, EndType, EndTime, TalkTaskData.SkippedSequencePoint)
  self.SequencePlayer = nil
  self.SequenceActor = nil
  self:FixSequenceCamerasEnd(TalkTaskData)
end

function BP_TalkContext_C:FixSequenceCamerasBegin(TalkTaskData)
  local SA = TalkTaskData.SequenceActor
  local SP = TalkTaskData.SequencePlayer
  local TargetActors = SA:TryGetAllActorsInSequence()
  for _, Actor in pairs(TargetActors) do
    self.TalkCameraManager:AdaptCineCameraConstraint(Actor)
  end
  SP.OnObjectSpawnedEvent:Add(self, self.OnSequenceCameraSpawned)
end

function BP_TalkContext_C:FixSequenceCamerasEnd(TalkTaskData)
  local SA = TalkTaskData.SequenceActor
  local SP = TalkTaskData.SequencePlayer
  SP.OnObjectSpawnedEvent:Remove(self, self.OnSequenceCameraSpawned)
end

function BP_TalkContext_C:OnSequenceCameraSpawned(TargetActor)
  if IsValid(TargetActor) and URuntimeCommonFunctionLibrary.ObjIsChildOf(TargetActor, ACameraActor) then
    self.TalkCameraManager:AdaptCineCameraConstraint(TargetActor)
  end
end

function BP_TalkContext_C:OnPlayerWindowChanged(bConstrainAspectRatio, NewAspectRatio, NewFOV)
  DebugPrint("BP_TalkContext_C:OnPlayerWindowChanged", bConstrainAspectRatio, NewAspectRatio, NewFOV)
  self.TalkCameraManager:OnPlayerWindowChanged(bConstrainAspectRatio, NewAspectRatio, NewFOV)
end

function BP_TalkContext_C:BindOnSequenceFadeInStart(SequencePlayer, FadeInTime, Callback)
  if not (Callback and SequencePlayer) or FadeInTime <= 0 then
    return
  end
  FadeInTime = FadeInTime + self.FadeOutTimerInterval
  local Obj = Callback.Obj
  local Func = Callback.Func
  local Params = Callback.Params or {}
  self.TalkTimerManager:AddTimer("SequenceFadeOut", self.FadeOutTimerInterval, true, self.FadeOutTimerInterval, Obj, function()
    local bTrigger = SequencePlayer:CheckTargetPlayTime(FadeInTime, true)
    if bTrigger then
      Func(Obj, table.unpack(Params))
      self.TalkTimerManager:ClearTimer("SequenceFadeOut")
    end
  end)
end

function BP_TalkContext_C:UnBindOnSequenceFadeInStart()
  self.TalkTimerManager:ClearTimer("SequenceFadeOut")
end

function BP_TalkContext_C:GetSimpleBlackUI()
  if self.SimpleBlackUI then
    return self.SimpleBlackUI
  end
  self.SimpleBlackUI = UIManager(self):_CreateWidgetNew("TalkBlackScreenBorder")
  return self.SimpleBlackUI
end

function BP_TalkContext_C:RemoveSimpleBlackUI()
  if self.SimpleBlackUI then
    self.SimpleBlackUI:RemoveFromParent()
    self.SimpleBlackUI = nil
  end
end

function BP_TalkContext_C:GetCinematicBlackUI()
  return self:GetSimpleBlackUI()
end

function BP_TalkContext_C:GetDialogueBlackUI()
  if IsValid(self.DialogueBlackUI) then
    return self.DialogueBlackUI
  end
  local BlackBorderClass = LoadClass("/Game/UI/WBP/Story/Widget/WBP_BlackScreen.WBP_BlackScreen_C")
  self.DialogueBlackUI = UE.UWidgetBlueprintLibrary.Create(self, BlackBorderClass)
  self.DialogueBlackUI:AddToViewport(-1)
  return self.DialogueBlackUI
end

function BP_TalkContext_C:RemoveDialogueBlackUI()
  if self.DialogueBlackUI then
    self.DialogueBlackUI:SetToTransparent()
    self.DialogueBlackUI:RemoveFromParent()
    self.DialogueBlackUI = nil
  end
end

function BP_TalkContext_C:GetImagePlayUI()
  if self.ImagePlayUI then
    return self.ImagePlayUI
  end
  local ImageUIClass = LoadClass("WidgetBlueprint'/Game/UI/WBP/Story/Widget/WBP_Story_Image.WBP_Story_Image'")
  self.ImageUI = UE.UWidgetBlueprintLibrary.Create(self, ImageUIClass)
  self.ImageUI:AddToViewport(-1)
  return self.ImageUI
end

function BP_TalkContext_C:TalkLoadUI(UIName, ...)
  local TargetUI = UIManager(self):LoadUINew(UIName, ...)
  if TargetUI then
    TargetUI:Show("Talk")
  end
end

function BP_TalkContext_C:TalkShowUITip(TipType, ...)
  UIManager(self):ShowUITip(TipType, ...)
  local TipUI = UIManager(self):GetUIObj("CommonTopToastList")
  if TipUI then
    TipUI:Show("Talk")
  end
end

function BP_TalkContext_C:OnTalkStart()
  self.InTalkActorVisibility = {}
end

function BP_TalkContext_C:OnTalkEnd()
  self.InTalkActorVisibility = {}
end

function BP_TalkContext_C:RecordInShowActorVisibility(Actor, bVisible)
  self.InTalkActorVisibility[Actor] = bVisible
end

function BP_TalkContext_C:ShowHideInTalkActors()
  for Actor, Visible in pairs(self.InTalkActorVisibility) do
    self:ShowHideActor(Actor, Visible)
  end
end

function BP_TalkContext_C:ShowHideActor(Actor, bShow)
  if not IsValid(Actor) then
    return
  end
  if URuntimeCommonFunctionLibrary.ObjIsChildOf(Actor, APlayerCharacter) then
    self:TalkHidePlayer(Actor, not bShow)
  elseif URuntimeCommonFunctionLibrary.ObjIsChildOf(Actor, AMonsterCharacter) then
    local EMGameState = UE4.UGameplayStatics.GetGameState(self)
    EMGameState:HideMonster(not bShow, Const.TalkHideTag, Actor)
  elseif URuntimeCommonFunctionLibrary.ObjIsChildOf(Actor, ACharacter) then
    local EMGameState = UE4.UGameplayStatics.GetGameState(self)
    EMGameState:HideNpc(not bShow, Const.TalkHideTag, Actor)
  else
    self:SetActorHidden(Actor, not bShow)
  end
end

function BP_TalkContext_C:CheckConfigInTalkNode(TargetConfig, TargetValue)
  local TalkTaskData
  for _, TalkNode in pairs(self.TalkNodes) do
    TalkTaskData = TalkNode.TalkTaskData
    if TalkTaskData and TalkTaskData[TargetConfig] == TargetValue then
      return true
    end
  end
  return false
end

function BP_TalkContext_C:OnHideElseCharacterStart(IgnoreIds)
  self:HideTypeOfActors("NPC", true, IgnoreIds)
  self:ForceShowTalkRefActors()
end

function BP_TalkContext_C:OnHideElseCharacterEnd(IgnoreIds)
  self:HideTypeOfActors("NPC", false, IgnoreIds)
end

function BP_TalkContext_C:SwitchHideAllPlayerChars(bHide)
  if self.bAllPlayerHasHidden == bHide then
    return
  end
  self.bAllPlayerHasHidden = bHide
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    return
  end
  
  local function SetMeshHidden(TargetActor, bHide)
    if not IsValid(TargetActor) then
      return
    end
    local MeshComps = TargetActor:K2_GetComponentsByClass(UE4.UMeshComponent)
    if MeshComps then
      for _, Mesh in pairs(MeshComps) do
        if bHide then
          self.RecordDataMap[Mesh] = Mesh.bHiddenInGame
          Mesh:SetHiddenInGame(true, false)
        elseif self.RecordDataMap[Mesh] then
          Mesh:SetHiddenInGame(self.RecordDataMap[Mesh], false)
          self.RecordDataMap[Mesh] = nil
        else
          Mesh:SetHiddenInGame(false, false)
        end
      end
    end
  end
  
  for _, PS in pairs(GameState.PlayerArray:ToTable()) do
    if IsValid(PS) and PS.GetMyPawn then
      local Char = PS:GetMyPawn()
      local IsBPPlayerCharacter = UE4.UKismetMathLibrary.EqualEqual_ClassClass(Char:GetClass(), PlayerCharClass)
      if IsBPPlayerCharacter then
        SetMeshHidden(Char, bHide)
        if Char.GetAllAttaches then
          local Attaches = Char:GetAllAttaches()
          if Attaches then
            for _, Attach in pairs(Attaches) do
              SetMeshHidden(Attach, bHide)
            end
          end
          if Char.EffectCreatures then
            for _, value in pairs(Char.EffectCreatures or {}) do
              for _, obj in pairs(value) do
                SetMeshHidden(obj, bHide)
              end
            end
          end
          if Char.GetBattlePet then
            local BattlePet = Char:GetBattlePet()
            if BattlePet then
              BattlePet:HideBattlePet("Player", bHide)
            end
          end
        end
      end
    else
    end
  end
end

function BP_TalkContext_C:ShowCinematicVideoUI(bShow)
  if self.SequenceTalkTask then
    self.SequenceTalkTask:OnSequenceShowVideoUI(bShow)
  end
end

return BP_TalkContext_C
