local StorylineUtils = require("StoryCreator.StoryLogic.StorylineUtils")
local GuidePointLocData = require("BluePrints.UI.TaskPanel/QuestGuidePointLocData")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local StoryMgr = Class("StoryCreator.StoryLogic.StorylineNodes.NodeObject")

function StoryMgr:Init()
  self.Storylines = {}
  self.StorylinesNeedRestart = {}
  self.StaticCreatorActorEvents = {}
  self.NpcInteractiveTalkDetail = {}
  self.NpcInteractiveTalkId = 0
  self.WaitTalkTriggerCompleted = {}
  self.bEnableStory = true
end

function StoryMgr:IsCanRunStoryMgr()
  if IsStandAlone(GWorld.GameInstance) or IsClient(GWorld.GameInstance) then
    return true
  end
  return false
end

function StoryMgr:EnableStory()
  self.bEnableStory = true
end

function StoryMgr:DisableStory()
  self.bEnableStory = false
end

function StoryMgr:HandleInLoading()
  self:DisableStory()
  if self:IsCanRunStoryMgr() == false then
    return
  end
  if TaskUtils and TaskUtils.RemoveAllQuestExtraInfo then
    TaskUtils:RemoveAllQuestExtraInfo()
  end
  self:Clear()
end

function StoryMgr:Clear()
  DebugPrint("StoryMgr:Clear")
  self:StopAllStoryline()
  self:ClearStaticCreatorActorEvent()
  self:UnbindAllNPCInteractiveTalk()
  self:ClearAllWaitCompleteTalkTrigger()
end

function StoryMgr:RunStory(StoryPath, QuestId, NodeId, EndCallback, StopCallback, Payload)
  if self.Storylines[StoryPath] then
    DebugPrint("StoryMgr:RunStory:Already Exit", StoryPath, QuestId, NodeId, EndCallback, StopCallback, Payload)
    return
  end
  return self:RunStoryInternal(StorylineUtils.BuildStoryline(StoryPath, EndCallback, StopCallback, Payload), StoryPath, QuestId, NodeId, EndCallback, StopCallback, Payload)
end

function StoryMgr:RunStoryByLongFileName(LongFileName, QuestId, NodeId, EndCallback, StopCallback, Payload)
  if self.Storylines[LongFileName] then
    DebugPrint("StoryMgr:RunStoryByLongFileName:Already Exit", LongFileName, QuestId, NodeId, EndCallback, StopCallback, Payload)
    return
  end
  return self:RunStoryInternal(StorylineUtils.BuildStorylineByLongFileName(LongFileName, EndCallback, StopCallback, Payload), LongFileName, QuestId, NodeId, EndCallback, StopCallback, Payload)
end

function StoryMgr:RunStoryInternal(Storyline, FileName, QuestId, NodeId, EndCallback, StopCallback, Payload)
  if self.bEnableStory == false then
    local Title = "STL \229\183\178\231\166\129\231\148\168"
    local Message = string.format("\232\175\149\229\155\190\229\156\168\231\166\129\231\148\168\230\151\182\232\191\144\232\161\140\230\150\176\231\154\132 STL %s", FileName)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, Title, Message)
  end
  if not Storyline then
    local Message = "Story\228\184\141\229\173\152\229\156\168" .. [[

FileName:]] .. FileName
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "Story\228\184\141\229\173\152\229\156\168", Message)
  end
  DebugPrint("StoryMgr:RunStory", FileName, QuestId, NodeId, EndCallback, StopCallback, Payload)
  self.Storylines[FileName] = Storyline
  Storyline:StartStory(tonumber(QuestId), NodeId)
  return Storyline.FilePath
end

function StoryMgr:GetStory(StoryPath)
  local Storyline = self.Storylines[StoryPath]
  return Storyline
end

function StoryMgr:IsRunningStoryline(StoryPath)
  return self.Storylines[StoryPath] ~= nil
end

function StoryMgr:StopStoryline(StoryPath, IgnoreFinishClear)
  local Storyline = self.Storylines[StoryPath]
  if Storyline then
    Storyline:Stop(IgnoreFinishClear)
    self.Storylines[StoryPath] = nil
    self.StorylinesNeedRestart[StoryPath] = nil
  end
end

function StoryMgr:FinishStory(StoryPath)
  self.Storylines[StoryPath] = nil
  self.StorylinesNeedRestart[StoryPath] = nil
end

function StoryMgr:StopAllStoryline()
  local Storylines = {}
  for _, Storyline in pairs(self.Storylines) do
    table.insert(Storylines, Storyline)
  end
  for _, Storyline in pairs(Storylines) do
    Storyline:Stop()
  end
  self.Storylines = {}
  self.StorylinesNeedRestart = {}
end

function StoryMgr:SuccessAllQuest()
  for _, Storyline in pairs(self.Storylines) do
    Storyline:Success()
  end
end

function StoryMgr:BindStaticCreatorActorEvent(StaticCreatorId, ActorEventType, Obj, Func)
  local ActorEvents = self.StaticCreatorActorEvents[StaticCreatorId]
  if nil == ActorEvents then
    ActorEvents = {}
    self.StaticCreatorActorEvents[StaticCreatorId] = ActorEvents
  end
  ActorEvents[ActorEventType] = {Obj, Func}
end

function StoryMgr:UnbindStaticCreatorActorEvent(StaticCreatorId)
  if self.StaticCreatorActorEvents[StaticCreatorId] then
    self.StaticCreatorActorEvents[StaticCreatorId] = nil
  end
end

function StoryMgr:UnbindStaticCreatorActorEventByType(StaticCreatorId, ActorEventType)
  if self.StaticCreatorActorEvents[StaticCreatorId] and self.StaticCreatorActorEvents[StaticCreatorId][ActorEventType] then
    self.StaticCreatorActorEvents[StaticCreatorId][ActorEventType] = nil
  end
end

function StoryMgr:TryExecStorylineActorEvent(StaticCreatorId, ActorEventType, Info)
  local ActorEvents = self.StaticCreatorActorEvents[StaticCreatorId]
  if ActorEvents then
    local ActorEvent = ActorEvents[ActorEventType]
    if ActorEvent and ActorEvent[1] and ActorEvent[2] then
      ActorEvent[2](ActorEvent[1], Info)
    end
  end
end

function StoryMgr:ClearStaticCreatorActorEvent()
  self.StaticCreatorActorEvents = {}
end

function StoryMgr:BindNPCInteractiveTalk(NPCId, Detail)
  self.NpcInteractiveTalkId = self.NpcInteractiveTalkId + 1
  local BindId = self.NpcInteractiveTalkId
  if not self.NpcInteractiveTalkDetail[NPCId] then
    self.NpcInteractiveTalkDetail[NPCId] = {}
  end
  self.NpcInteractiveTalkDetail[NPCId][BindId] = Detail
  return BindId
end

function StoryMgr:UnbindNPCInteractiveTalk(NPCId, BindId)
  if not BindId then
    return
  end
  local BindInfos = self.NpcInteractiveTalkDetail[NPCId]
  if not BindInfos then
    return
  end
  BindInfos[BindId] = nil
end

function StoryMgr:GetNPCInteractiveTalkDetails(NPCId)
  return self.NpcInteractiveTalkDetail[NPCId]
end

function StoryMgr:ExistedNPCInteractiveTalk(NPCId)
  local BindInfos = self.NpcInteractiveTalkDetail[NPCId]
  return BindInfos and next(BindInfos) ~= nil
end

function StoryMgr:TryGetWaitTalkCompletedQuest(TalkTriggerId)
  return self.WaitTalkTriggerCompleted[TalkTriggerId]
end

function StoryMgr:RegisterWaitTalkCompleted(TalkTriggerId, QuestChainId, SpecialQuestId, DynQuestId, ShowGuide)
  self.WaitTalkTriggerCompleted[TalkTriggerId] = {
    QuestChainId = QuestChainId,
    SpecialQuestId = SpecialQuestId,
    ShowGuide = ShowGuide,
    DynQuestId = DynQuestId
  }
end

function StoryMgr:UnRegisterWaitTalkCompleted(TalkTriggerId)
  self.WaitTalkTriggerCompleted[TalkTriggerId] = nil
end

function StoryMgr:ClearAllWaitCompleteTalkTrigger()
  self.WaitTalkTriggerCompleted = {}
end

function StoryMgr:TryExecNPCInteractiveTalk(NPCId, NPC, BindId, TalkEndCallback)
  local BindInfos = self.NpcInteractiveTalkDetail[NPCId]
  if not BindInfos then
    if TalkEndCallback and TalkEndCallback.Func then
      TalkEndCallback.Func(TalkEndCallback.Obj)
    end
    return
  end
  BindId = BindId or next(BindInfos)
  local Detail = BindInfos[BindId]
  if Detail and Detail.Func then
    Detail.Func(NPC, TalkEndCallback)
  elseif TalkEndCallback and TalkEndCallback.Func then
    TalkEndCallback.Func(TalkEndCallback.Obj)
  end
end

function StoryMgr:UnbindAllNPCInteractiveTalk()
  self.NpcInteractiveTalkDetail = {}
  self.NpcInteractiveTalkId = 0
end

function StoryMgr:PrintStorylineInfo()
  for _, Storyline in pairs(self.Storylines) do
    Storyline:PrintInfo()
  end
end

function StoryMgr:CreateQuestPickupId2Callback(QuestPickupId, Callback)
  if not self.QuestPickupId2Callback then
    self.QuestPickupId2Callback = {}
  end
  self.QuestPickupId2Callback[QuestPickupId] = Callback
end

function StoryMgr:GetRunningNodeTableByType(NodeType, OutRunningNodeTable)
  for _, Storyline in pairs(self.Storylines) do
    Storyline:GetRunningNodeTableByType(NodeType, OutRunningNodeTable)
  end
end

function StoryMgr:GetResurgencePointInfo()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if not Avatar.TrackingQuestChainId then
    return
  end
  local CurrentRegionId = Avatar:GetCurrentRegionId()
  if not CurrentRegionId or CurrentRegionId <= 0 then
    return
  end
  local QuestChain = Avatar.QuestChains[Avatar.TrackingQuestChainId]
  local DoingQuestId = QuestChain.DoingQuestId
  local Storyline = self.Storylines[QuestChain.StoryPath]
  local StoryNode = Storyline.QuestIdNodeList[DoingQuestId]
  if StoryNode.ResurgencePoint ~= "" then
    local PointInfo = GuidePointLocData[StoryNode.ResurgencePoint]
    if not PointInfo then
      local Message = "StoryNode\228\184\173\233\133\141\231\189\174\231\154\132\229\164\141\230\180\187\231\130\185\229\156\168QuestGuidePointLoc\232\161\168\228\184\173\228\184\141\229\173\152\229\156\168" .. [[

FileName:]] .. QuestChain.StoryPath .. [[

QuestChainId:]] .. Storyline.QuestChainId .. [[

QuestId:]] .. DoingQuestId .. [[

ResurgencePoint:]] .. StoryNode.ResurgencePoint
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "StoryNode\228\184\173\233\133\141\231\189\174\231\154\132\229\164\141\230\180\187\231\130\185\229\156\168QuestGuidePointLoc\232\161\168\228\184\173\228\184\141\229\173\152\229\156\168", Message)
      return
    end
    if not PointInfo.SubRegionId or PointInfo.SubRegionId <= 0 then
      local Message = "StoryNode\228\184\173\233\133\141\231\189\174\231\154\132\229\164\141\230\180\187\231\130\185\229\156\168QuestGuidePointLoc\232\161\168\228\184\173\230\151\160SubRegionId" .. [[

FileName:]] .. QuestChain.StoryPath .. [[

QuestChainId:]] .. Storyline.QuestChainId .. [[

QuestId:]] .. DoingQuestId .. [[

ResurgencePoint:]] .. StoryNode.ResurgencePoint
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "StoryNode\228\184\173\233\133\141\231\189\174\231\154\132\229\164\141\230\180\187\231\130\185\229\156\168QuestGuidePointLoc\232\161\168\228\184\173\230\151\160SubRegionId", Message)
      return
    end
    if DataMgr.SubRegion[CurrentRegionId].RegionId == DataMgr.SubRegion[PointInfo.SubRegionId].RegionId then
      local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
      local NewTargetPoint = GameState:GetTargetPoint(StoryNode.ResurgencePoint)
      if IsValid(NewTargetPoint) then
        return {
          Transform = NewTargetPoint:GetTransform(),
          FailBlackScreenText = StoryNode.FailBlackScreenText,
          FadeInTime = StoryNode.FadeInTime,
          FadeOutTime = StoryNode.FadeOutTime,
          ContinueTime = StoryNode.ContinueTime
        }
      else
        DebugPrint("gyy@ Use ResurgencePoint, NewTargetPoint is not valid")
        return
      end
    else
      DebugPrint("gyy@ Use ResurgencePoint, CurrentRegionId and TargetRegionId are not equal")
      return
    end
  else
    if not StoryNode.bUseQuestCoordinate then
      return
    end
    local QuestCoordinate = QuestChain.QuestCoordinate
    if not QuestCoordinate then
      return
    end
    local TargetRegionId = QuestCoordinate.SubRegionId
    if not TargetRegionId or TargetRegionId < 0 then
      return
    elseif 0 == TargetRegionId then
      local Message = "\228\187\187\229\138\161\233\147\190\228\184\173\231\154\132\231\172\172\228\184\128\228\184\170\228\187\187\229\138\161\239\188\140\230\131\179\232\166\129\228\189\191\231\148\168\229\164\141\230\180\187\229\138\159\232\131\189\233\156\128\232\166\129\233\133\141\231\189\174\229\164\141\230\180\187\231\130\185\228\189\141" .. [[

FileName:]] .. QuestChain.StoryPath .. [[

QuestChainId:]] .. Storyline.QuestChainId .. [[

QuestId:]] .. DoingQuestId
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\228\187\187\229\138\161\233\147\190\228\184\173\231\154\132\231\172\172\228\184\128\228\184\170\228\187\187\229\138\161\239\188\140\230\131\179\232\166\129\228\189\191\231\148\168\229\164\141\230\180\187\229\138\159\232\131\189\233\156\128\232\166\129\233\133\141\231\189\174\229\164\141\230\180\187\231\130\185\228\189\141", Message)
      return
    end
    if DataMgr.SubRegion[CurrentRegionId].RegionId ~= DataMgr.SubRegion[TargetRegionId].RegionId then
      DebugPrint("gyy@ CurrentRegionId and TargetRegionId are not equal")
      return
    end
    if QuestCoordinate.StartIndex > 0 then
      local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
      local LevelLoader = GameMode:GetLevelLoader()
      local LevelId = LevelLoader:GetLevelIdByRegionId(QuestCoordinate.SubRegionId)
      local TargtePoint = LevelLoader:GetStartPointByManager(LevelId, QuestCoordinate.StartIndex)
      if IsValid(TargtePoint) then
        return {
          Transform = TargtePoint:GetTransform(),
          FailBlackScreenText = StoryNode.FailBlackScreenText,
          FadeInTime = StoryNode.FadeInTime,
          FadeOutTime = StoryNode.FadeOutTime,
          ContinueTime = StoryNode.ContinueTime
        }
      else
        DebugPrint("gyy@ Use StartIndex, TargtePoint is not valid")
        return
      end
    else
      local TargetTransform = UE4.UKismetMathLibrary.MakeTransform(FVector(QuestCoordinate.Location[1], QuestCoordinate.Location[2], QuestCoordinate.Location[3]), FRotator(QuestCoordinate.Rotation[1], QuestCoordinate.Rotation[2], QuestCoordinate.Rotation[3]), FVector(1, 1, 1))
      return {
        Transform = TargetTransform,
        FailBlackScreenText = StoryNode.FailBlackScreenText,
        FadeInTime = StoryNode.FadeInTime,
        FadeOutTime = StoryNode.FadeOutTime,
        ContinueTime = StoryNode.ContinueTime
      }
    end
  end
end

function StoryMgr:FailCurrentQuestWhenDead()
  local StoryNode = self:GetCurrentStoryNode()
  if not StoryNode then
    return
  end
  if not StoryNode.bDeadTriggerQuestFail then
    return
  end
  StoryNode.Questline:FailQuest()
end

function StoryMgr:GetCurrentStoryNode()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if not Avatar.TrackingQuestChainId then
    return
  end
  if Avatar.TrackingQuestChainId <= 0 then
    return
  end
  if Avatar:IsQuestChainFinished(Avatar.TrackingQuestChainId) then
    return
  end
  local QuestChain = Avatar.QuestChains[Avatar.TrackingQuestChainId]
  if not QuestChain then
    return
  end
  local DoingQuestId = QuestChain.DoingQuestId
  if not DoingQuestId then
    return
  end
  local Storyline = self.Storylines[QuestChain.StoryPath]
  if not Storyline then
    return
  end
  return Storyline.QuestIdNodeList[DoingQuestId]
end

function StoryMgr:AddToWaitingRestartList(Storyline)
  self.StorylinesNeedRestart[Storyline.FilePath] = Storyline
end

function StoryMgr:TryRestartStoryline()
  DebugPrint("StoryMgr TryRestartStoryline")
  local Flag = false
  local RestartStorylines = {}
  for _, Storyline in pairs(self.StorylinesNeedRestart) do
    Flag = true
    table.insert(RestartStorylines, Storyline)
  end
  if Flag then
    DebugPrint("StoryMgr RestartStoryline")
    for _, Storyline in pairs(RestartStorylines) do
      Storyline:RestartNodes()
    end
    self:RemoveStoryBlackScreenOnFail()
  end
  self.StorylinesNeedRestart = {}
end

function StoryMgr:PrintStorylineNeedRestartInfo()
  for _, Storyline in pairs(self.StorylinesNeedRestart) do
    Storyline:PrintInfo()
  end
end

function StoryMgr:AddStoryBlackScreen(ExtralInfo)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if not UIManager:IsCommonBlackScreenExist(ExtralInfo.HandleName) then
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    local Params = {}
    Params.BlackScreenHandle = ExtralInfo.HandleName
    Params.InAnimationPlayTime = ExtralInfo.InTime or 0
    Params.OutAnimationPlayTime = ExtralInfo.OutTime or 0
    if IsValid(Player) then
      Player:AddDisableInputTag(ExtralInfo.HandleName)
    end
    UIManager:SetBannedActionCallback("BlackScreen", true, ExtralInfo.HandleName)
    UIManager:ShowCommonBlackScreen(Params)
  end
  
  local function BlackUIFadeOut()
    if ExtralInfo.TimeOverCallback then
      local Obj = ExtralInfo.TimeOverCallback.Obj
      local Func = ExtralInfo.TimeOverCallback.Func
      local Params = ExtralInfo.TimeOverCallback.Params
      Func(Obj, Params)
    end
    self:RemoveStoryBlackScreen(ExtralInfo.HandleName)
  end
  
  GWorld.GameInstance:AddTimer(ExtralInfo.ContinueTime or 10, BlackUIFadeOut, false, nil, ExtralInfo.HandleName, true)
end

function StoryMgr:RemoveStoryBlackScreen(HandleName)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if UIManager:IsCommonBlackScreenExist(HandleName) then
    GWorld.GameInstance:RemoveTimer(HandleName)
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    if IsValid(Player) then
      Player:RemoveDisableInputTag(HandleName)
    end
    UIManager:SetBannedActionCallback("BlackScreen", false, HandleName)
    UIManager:HideCommonBlackScreen(HandleName)
  end
end

function StoryMgr:AddStoryBlackScreenOnFail()
  local ExtralInfo = {
    HandleName = "StoryBlackScreenOnFail"
  }
  self:AddStoryBlackScreen(ExtralInfo)
end

function StoryMgr:RemoveStoryBlackScreenOnFail()
  local HandleName = "StoryBlackScreenOnFail"
  self:RemoveStoryBlackScreen(HandleName)
end

function StoryMgr:AddStoryBlackScreenOnSucc(WaitingQuest)
  if not self.WaitingQuest then
    self.WaitingQuest = {}
  end
  local AddFlag = false
  for _, Id in pairs(WaitingQuest) do
    if not self.WaitingQuest[Id] then
      self.WaitingQuest[Id] = 1
      AddFlag = true
    end
  end
  if AddFlag then
    local ExtralInfo = {
      HandleName = "StoryBlackScreenOnSucc",
      TimeOverCallback = {
        Obj = self,
        Func = self.RemoveWaitingQuest
      }
    }
    self:AddStoryBlackScreen(ExtralInfo)
  end
end

function StoryMgr:RemoveWaitingQuest()
  self.WaitingQuest = nil
end

function StoryMgr:TryRemoveStoryBlackScreenOnSucc(QuestChainId, QuestId)
  if not self.WaitingQuest or not self.WaitingQuest[QuestChainId] and not self.WaitingQuest[QuestId] then
    return
  end
  self.WaitingQuest[QuestChainId] = nil
  self.WaitingQuest[QuestId] = nil
  if not next(self.WaitingQuest) then
    self:RemoveStoryBlackScreenOnSucc()
  end
end

function StoryMgr:RemoveStoryBlackScreenOnSucc()
  local HandleName = "StoryBlackScreenOnSucc"
  self:RemoveWaitingQuest()
  self:RemoveStoryBlackScreen(HandleName)
end

return StoryMgr
