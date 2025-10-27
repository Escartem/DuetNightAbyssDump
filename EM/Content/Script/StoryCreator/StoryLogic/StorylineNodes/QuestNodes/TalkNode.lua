local TalkNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")
local ETalkType = require("BluePrints.Story.Talk.Base.ETalkType")
local ETalkNodeFinishType = require("StoryCreator.StoryLogic.StorylineUtils").ETalkNodeFinishType

function TalkNode:Init()
  self.Options = nil
  self.TalkTask = nil
  self.TalkTaskData = nil
  self.NpcId = 0
  self.TalkContext = nil
  self.GuideType = nil
  self.GuidePointName = nil
  self.GuideStaticCreatorId = 0
  self.QuestHintId = 0
  self.GuideUIEnable = false
  self.bSpecifyExecution = false
  self.DelayShowGuideTime = 0
end

function TalkNode:OnUIPauseGame()
  EventManager:RemoveEvent(EventID.OnUIPauseGame, self)
  self.TalkContext = GWorld.GameInstance:GetTalkContext()
  self.TalkBasicType = DataMgr.TalkType[self.TalkType].BasicType
  self:CreateTalkNodeData()
  self:ShowGuide()
  self:SwitchStart()
end

function TalkNode:Execute(Callback)
  self.Callback = Callback
  if UIManager(self):IsUIPauseGame() and self.TalkType ~= "RougeLike" then
    EventManager:RemoveEvent(EventID.OnUIPauseGame, self)
    EventManager:AddEvent(EventID.OnUIPauseGame, self, self.OnUIPauseGame)
    return
  end
  self.TalkContext = GWorld.GameInstance:GetTalkContext()
  self.TalkBasicType = DataMgr.TalkType[self.TalkType].BasicType
  self:CreateTalkNodeData()
  self:ShowGuide()
  self:SwitchStart()
end

function TalkNode:Clear()
  self:HideGuide()
  GWorld.StoryMgr:UnbindNPCInteractiveTalk(self.NpcIdWithGender, self.BindId)
  if not self:IsNormalFinished() then
    local TS = TalkSubsystem()
    assert(TS, "\229\175\185\232\175\157\231\179\187\231\187\159\229\191\133\233\161\187\229\173\152\229\156\168")
    TS:ExceptionInterruptTaskBySTL(self.TalkTaskKey)
  end
  EventManager:RemoveEvent(EventID.OnUIPauseGame, self)
  if self.bIsImmersiveStory then
    local FlowManager = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
    FlowManager:RemoveFlow(self.Flow)
    self.Flow = nil
  end
end

function TalkNode:OnQuestlineFinish()
  EventManager:RemoveEvent(EventID.OnUIPauseGame, self)
end

function TalkNode:CreateTalkNodeData()
  self.TalkNodeData = {
    FilePath = self.Context.FilePath,
    QuestChainId = self.Context.QuestChainId,
    TalkNodeId = self.Key,
    Options = self.Options,
    FirstDialogueId = self.FirstDialogueId,
    TalkName = self.Name,
    TalkType = self.TalkType,
    BubblePlayType = self.BubblePlayType,
    BubbleDelayLoopSeconds = self.BubbleDelayLoopSeconds,
    bBubblePlayCDEnable = self.bBubblePlayCDEnable,
    BubblePlayCD = self.BubblePlayCD,
    TalkStageName = self.TalkStageName,
    ShowFilePath = self.ShowFilePath,
    BlendInTime = self.BlendInTime,
    BlendOutTime = self.BlendOutTime,
    BlendInType = self.InType,
    BlendOutType = self.OutType,
    ForceAutoPlay = self.ForceAutoPlay,
    ShowSkipButton = self.ShowSkipButton,
    ShowAutoPlayButton = self.ShowAutoPlayButton,
    ShowReviewButton = self.ShowReviewButton,
    ShowWikiButton = self.ShowWikiButton,
    PauseGameGlobal = self.PauseGameGlobal,
    DisableMonsterAI = self.DisableMonsterAI,
    DisableMonsterAIForSimpleTalk = self.DisableMonsterAIForSimpleTalk,
    DisableNPCAI = self.DisableNPCAI,
    HideAllBattleEntity = self.HideAllBattleEntity,
    HideElseCharacter = self.HideElseCharacter,
    RestoreStand = self.RestoreStand,
    TalkActors = self.TalkActors or {},
    RemoveTalkActors = self.RemoveTalkActors or {},
    IsPlayerTurnToNPC = self.IsPlayerTurnToNPC,
    IsNPCTurnToPlayer = self.IsNPCTurnToPlayer,
    GuideMeshIndexList = self.GuideMeshIndexList,
    BeginNewTargetPointName = self.BeginNewTargetPointName,
    EndNewTargetPointName = self.EndNewTargetPointName,
    CameraLookAtTartgetPoint = self.CameraLookAtTartgetPoint,
    SkipToOption = self.SkipToOption,
    RandomOptionNum = self.RandomOptionNum,
    SaveToServer = self.SaveToServer,
    OptionType = self.OptionType,
    NormalOptions = self.NormalOptions,
    RandomOptions = self.RandomOptions,
    PlusOptions = self.PlusOptions,
    CheckOptions = self.CheckOptions,
    RougeLikeOptions = self.RougeLikeOptions,
    UseProceduralCamera = self.UseProceduralCamera,
    ProceduralCameraId = self.ProceduralCameraId,
    IsPlayStartSound = self.IsPlayStartSound,
    GuideTalkStyle = self.GuideTalkStyle,
    Name = self.Name,
    HideEffectCreature = self.HideEffectCreature,
    HideNpcs = self.HideNpcs,
    HideMonsters = self.HideMonsters,
    DisableNpcOptimization = self.DisableNpcOptimization,
    DoNotReceiveCharacterShadow = self.DoNotReceiveCharacterShadow,
    FreezeWorldComposition = self.FreezeWorldComposition,
    bTravelFullLoadWorldComposition = self.bTravelFullLoadWorldComposition,
    SwitchToMasterType = self.SwitchToMaster,
    bOverrideFailBlend = self.OverrideFailBlend,
    FailOutType = self.FailOutType,
    FailOutTime = self.FailOutTime,
    Key = self.Key,
    UsingGM = self.UsingGM,
    TalkTriggerId = self:GetPayload("TalkTriggerId"),
    PlayDialogueCallBack = self:GetPayload("PlayDialogueCallBack"),
    FlowAssetPath = self.FlowAssetPath,
    PauseNpcBT = self.PauseNpcBT,
    ShowFadeDetail = self.ShowFadeDetail,
    StartFadeOutTime = self.StartFadeOutTime,
    StartScreenEffectDuration = self.StartScreenEffectDuration,
    FinishFadeInTime = self.FinishFadeInTime,
    PlayerSwitchEmoIdle = self.PlayerSwitchEmoIdle
  }
  local NativeTalkActors = {}
  for _, ActorData in pairs(self.TalkNodeData.TalkActors) do
    NativeTalkActors[ActorData.TalkActorId] = true
  end
  if self.IsNpcNode then
    if not NativeTalkActors[0] then
      table.insert(self.TalkNodeData.TalkActors, {
        TalkActorType = "Player",
        TalkActorId = 0,
        TalkActorVisible = true
      })
      table.insert(self.TalkNodeData.RemoveTalkActors, {TalkActorType = "Player", TalkActorId = 0})
      NativeTalkActors[0] = true
    end
    if not NativeTalkActors[self.NpcId] then
      table.insert(self.TalkNodeData.TalkActors, {
        TalkActorType = "Npc",
        TalkActorId = self.NpcId,
        TalkActorVisible = true
      })
      table.insert(self.TalkNodeData.RemoveTalkActors, {
        TalkActorType = "Npc",
        TalkActorId = self.NpcId
      })
      NativeTalkActors[self.NpcId] = true
    end
  end
  for _, ActorData in pairs(self:GetPayload("TalkActors") or {}) do
    if not NativeTalkActors[ActorData.TalkActorId] then
      table.insert(self.TalkNodeData.TalkActors, ActorData)
      table.insert(self.TalkNodeData.RemoveTalkActors, {
        TalkActorType = ActorData.TalkActorType,
        TalkActorId = ActorData.TalkActorId
      })
      NativeTalkActors[ActorData.TalkActorId] = true
    end
  end
end

function TalkNode:ChangeNpcInfoByGender(NpcId)
  local NpcData = DataMgr.Npc[NpcId]
  if not NpcData then
    return nil
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return nil
  end
  if NpcData.SwitchPlayer == "Player" then
    if NpcData.Gender == Avatar.Sex then
      return NpcId
    else
      return NpcData.RelateNpcId
    end
  elseif NpcData.SwitchPlayer == "EXPlayer" then
    if NpcData.Gender == Avatar.WeitaSex then
      return NpcId
    else
      return NpcData.RelateNpcId
    end
  else
    return NpcId
  end
end

function TalkNode:SwitchStart()
  if self.IsNpcNode then
    local BindId
    local NpcIdWithGender = self:ChangeNpcInfoByGender(self.NpcId) or self.NpcId
    self.NpcIdWithGender = NpcIdWithGender
    if string.isempty(self.NpcNodeInteractiveName) then
    end
    local NpcNodeInteractiveName = self.NpcNodeInteractiveName
    local Detail = {
      QuestChainId = self.TalkNodeData.QuestChainId,
      SpecialQuestId = self:GetPayload("SpecialQuestId"),
      DynQuestId = self:GetPayload("DynQuestId"),
      NpcNodeInteractiveName = NpcNodeInteractiveName,
      GuideUIEnable = self.GuideUIEnable,
      Func = function(NPC, OnTalkEndCallback)
        GWorld.StoryMgr:UnbindNPCInteractiveTalk(NpcIdWithGender, BindId)
        local PlayerCharacter = UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
        self.TalkContext:AddTalkActor("Player", 0, PlayerCharacter, true)
        self:TalkNodeStartInternal(function(TalkNodeFinishType, OptionIndex)
          if OnTalkEndCallback then
            OnTalkEndCallback.Func(OnTalkEndCallback.Obj)
          end
          self:TalkNodeFinishInternal(TalkNodeFinishType, OptionIndex)
        end)
      end
    }
    self.BindId = GWorld.StoryMgr:BindNPCInteractiveTalk(NpcIdWithGender, Detail)
  elseif self.bIsStandalone then
    self:TalkNodeStartInternal()
    self:TalkNodeFinishInternal()
  else
    self:TalkNodeStartInternal(function(TalkNodeFinishType, OptionIndex)
      self:TalkNodeFinishInternal(TalkNodeFinishType, OptionIndex)
    end)
  end
end

function TalkNode:TryPrintNowFlows()
  local IsShippingPackage = UE4.UKismetSystemLibrary.IsPackagedForDistribution()
  if IsShippingPackage then
    return
  end
  local FlowManager = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
  if not FlowManager then
    return
  end
  local Flows = FlowManager.BeginningFlows:ToTable()
  for Index, Flow in pairs(Flows) do
    DebugPrint("WXT TalkNode:IsRunning Flow", Index, IsValid(Flow) and Flow.Channel)
  end
end

function TalkNode:TalkNodeStartInternal(TalkTaskEndLambdaCallback)
  local BasicTalkType = DataMgr.TalkType[self.TalkType].BasicType
  self.bIsImmersiveStory = BasicTalkType == ETalkType.Cinematic or BasicTalkType == ETalkType.FreeSimple or BasicTalkType == ETalkType.FixSimple or BasicTalkType == ETalkType.Impression or BasicTalkType == ETalkType.Black
  if self.bIsImmersiveStory then
    local FlowManager = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
    self.Flow = FlowManager:CreateFlow("ImmersiveStory")
    DebugPrint("WXT TalkNode:TalkNodeStartInternal Try Start Flow")
    self:TryPrintNowFlows()
    self.Flow.OnBegin:Add(self.Flow, function()
      DebugPrint("WXT TalkNode:TalkNodeStartInternal Real Start")
      local TS = TalkSubsystem()
      self.TalkTaskKey = TS:RegisterTalkData(self.TalkNodeData)
      if not TS:RegisterTalkTask(self.TalkTaskKey, TalkTaskEndLambdaCallback) then
        self:TalkNodeFinishInternal()
      end
    end)
    FlowManager:AddFlow(self.Flow)
  else
    local TS = TalkSubsystem()
    self.TalkTaskKey = TS:RegisterTalkData(self.TalkNodeData)
    if not TS:RegisterTalkTask(self.TalkTaskKey, TalkTaskEndLambdaCallback) then
      self:TalkNodeFinishInternal()
    end
  end
end

function TalkNode:TalkNodeFinishInternal(TalkNodeFinishType, OptionIndex)
  TalkNodeFinishType = TalkNodeFinishType or ETalkNodeFinishType.Out
  TalkSubsystem():UnregisterTalkData(self.TalkTaskKey)
  if self.TalkContext.TalkCameraManager then
    self.TalkContext.TalkCameraManager:ClearPostProcess()
  end
  self.TalkTaskKey = nil
  if TalkNodeFinishType == ETalkNodeFinishType.Stop then
    self:StopStory()
  else
    local OutPortName = self:CalOutPortName(TalkNodeFinishType, OptionIndex)
    self.Callback(OutPortName)
  end
  UIManager():FallbackAfterLoadingMgr()
end

function TalkNode:ShowGuide()
  if self.GuideUIEnable then
    if self.DelayShowGuideTime > 0 then
      self.ShowGuideTimer = GWorld.GameInstance:AddTimer(self.DelayShowGuideTime, function()
        MissionIndicatorManager:ActiveMissionIndicatorByNode(self)
      end, false)
    else
      MissionIndicatorManager:ActiveMissionIndicatorByNode(self)
    end
  end
end

function TalkNode:HideGuide()
  if self.GuideUIEnable then
    if self.ShowGuideTimer ~= nil then
      GWorld.GameInstance:RemoveTimer(self.ShowGuideTimer)
      self.ShowGuideTimer = nil
    end
    MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
  end
end

function TalkNode:IsNormalFinished()
  return self.TalkTaskKey == nil
end

function TalkNode:StopStory()
  if 0 ~= self.TalkNodeData.QuestChainId then
    self.Context:FailQuest()
  else
    self.Context:StopStory()
  end
end

function TalkNode:CalOutPortName(TalkNodeFinishType, OptionIndex)
  assert(TalkNodeFinishType, "\229\175\185\232\175\157\232\138\130\231\130\185\229\174\140\230\136\144\231\177\187\229\158\139\228\184\141\232\131\189\228\184\186\231\169\186")
  local OutPortName = TalkNodeFinishType
  if TalkNodeFinishType == ETalkNodeFinishType.Out then
    OutPortName = "Out"
  elseif TalkNodeFinishType == ETalkNodeFinishType.Option then
    assert(OptionIndex, "\229\175\185\232\175\157\232\138\130\231\130\185\229\174\140\230\136\144\231\177\187\229\158\139\228\184\186Option\230\151\182\239\188\140\233\128\137\233\161\185\231\180\162\229\188\149\228\184\141\232\131\189\228\184\186\231\169\186")
    OutPortName = "Option_" .. OptionIndex
  elseif TalkNodeFinishType == ETalkNodeFinishType.Fail then
    OutPortName = "Fail"
  end
  return OutPortName
end

return TalkNode
