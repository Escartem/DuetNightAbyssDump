require("UnLua")
local EMCache = require("EMCache.EMCache")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local GuidePointLocData = require("BluePrints.UI.TaskPanel/QuestGuidePointLocData")
local StorylineUtils = require("StoryCreator.StoryLogic.StorylineUtils")
local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")
local Component = {}

function Component:NotifyAvatarRegionAllReady()
  if TaskUtils and TaskUtils.RemoveAllQuestExtraInfo then
    TaskUtils:RemoveAllQuestExtraInfo()
  end
  if MissionIndicatorManager and MissionIndicatorManager.MissionNpcSideBubbles then
    MissionIndicatorManager.MissionNpcSideBubbles = {}
  end
  self:TriggerQuestChain()
  EventManager:FireEvent(EventID.OnRegionLoaded)
end

function Component:EnterWorld()
  DebugPrint("QuestMgr EnterWorld")
  self.DoingQuestChainIds = {}
  self.DoingQuestIds = {}
end

function Component:GetCurrentDoingQuest()
  local DoingQuestChainIds = {}
  local DoingQuestIds = {}
  for QuestChainId, QuestChain in pairs(self.QuestChains) do
    if QuestChain:IsDoing() then
      table.insert(DoingQuestChainIds, QuestChainId)
      local id = QuestChain.DoingQuestId
      if id and id > 0 then
        table.insert(DoingQuestIds, id)
      end
    end
  end
  return DoingQuestChainIds, DoingQuestIds
end

function Component:GetCurrenCanReciveQuest()
  local CanReciveQuestChainIds = {}
  local CanReciveQuestIds = {}
  for QuestChainId, QuestChain in pairs(self.QuestChains) do
    if QuestChain:IsUnlock() then
      table.insert(CanReciveQuestChainIds, QuestChainId)
      local id = QuestChain.DoingQuestId
      if id and id > 0 then
        table.insert(CanReciveQuestIds, id)
      end
    end
    if QuestChain:IsDoing() then
      table.insert(CanReciveQuestChainIds, QuestChainId)
      local id = QuestChain.DoingQuestId
      if id and id > 0 then
        table.insert(CanReciveQuestIds, id)
      end
    end
  end
  return CanReciveQuestChainIds, CanReciveQuestIds
end

function Component:CheckQuestCanStart()
  local GameMode = UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if not GameMode then
    return false, GameMode
  end
  if not GameMode.IsInRegion then
    return false, GameMode
  end
  if not GameMode:IsInRegion() then
    return false, GameMode
  end
  if not GameMode.IsRegionAllReady or not GameMode:IsRegionAllReady() then
    return false, GameMode
  end
  return true, GameMode
end

function Component:OnPrintToFeiShu_Quest(ClientErrorCode, ServerErrorCode, FunctionName, QuestChainId, QuestId, ...)
end

function Component:TriggerQuestChain()
  if not self:CheckQuestCanStart() then
    return
  end
  local Chain
  self.CanReciveQuestChainIds, self.CanReciveQuestIds = self:GetCurrenCanReciveQuest()
  self.CanReciveQuestId2QuestChainId = {}
  for index, id in ipairs(self.CanReciveQuestChainIds) do
    Chain = self.QuestChains[id]
    if Chain and Chain:IsUnlock() then
      if Chain.DoingQuestId and Chain.DoingQuestId > 0 then
        self.CanReciveQuestId2QuestChainId[Chain.DoingQuestId] = id
      end
      if GWorld.StoryMgr:IsRunningStoryline(DataMgr.QuestChain[Chain.QuestChainId].StoryPath) == false then
        GWorld.StoryMgr:RunStory(DataMgr.QuestChain[Chain.QuestChainId].StoryPath, Chain.DoingQuestId)
      end
    end
    if Chain and Chain:IsDoing() then
      if Chain.DoingQuestId and Chain.DoingQuestId > 0 then
        self.CanReciveQuestId2QuestChainId[Chain.DoingQuestId] = id
      end
      if GWorld.StoryMgr:IsRunningStoryline(DataMgr.QuestChain[Chain.QuestChainId].StoryPath) == false then
        GWorld.StoryMgr:RunStory(DataMgr.QuestChain[Chain.QuestChainId].StoryPath, Chain.DoingQuestId)
      end
      EventManager:FireEvent(EventID.SetNpcFlexibShowOrHideDynamic, "Quest", Chain.DoingQuestId)
      EventManager:FireEvent(EventID.SetCustomNpcFlexibShowOrHideDynamic, "Quest", Chain.DoingQuestId)
      EventManager:FireEvent(EventID.TriggerFlexibleActive)
    end
  end
end

function Component:CheckQuestIdIsInStory(InPath, TargetQuestId)
  local FileData = StorylineUtils.GetFileData(InPath)
  if nil == FileData then
    DebugPrint("Warning: QuestMgr.CheckQuestIdIsInStory: FileData is Empty")
    return false
  end
  local IsIn = false
  for _, Node in pairs(FileData.storyNodeData) do
    if Node and nil ~= Node.propsData.QuestId and Node.propsData.QuestId == TargetQuestId then
      IsIn = true
      break
    end
  end
  return IsIn
end

function Component:ServerStartQuest(Ret, QuestChainId, ClientVarParams)
  DebugPrint("ZJT_ ServerStartQuest ", Ret, QuestChainId, ClientVarParams)
  local CheckRet, GameMode, QuestChain = self:IsCanRunQuestConditionCheck(Ret, QuestChainId)
  if not self:CheckRegionErrorCode(CheckRet) then
    self:OnPrintToFeiShu_Quest(CheckRet, Ret, " ServerStartQuest_\230\156\141\229\138\161\229\153\168\229\145\138\231\159\165\229\174\162\230\136\183\231\171\175\229\188\128\229\167\139\228\187\187\229\138\161 ", QuestChainId)
    return
  end
  table.insert(self.DoingQuestIds, QuestChain.DoingQuestId)
  EventManager:FireEvent(EventID.SetNpcFlexibShowOrHideDynamic, "Quest", QuestChain.DoingQuestId)
  EventManager:FireEvent(EventID.SetCustomNpcFlexibShowOrHideDynamic, "Quest", QuestChain.DoingQuestId)
  EventManager:FireEvent(EventID.TriggerFlexibleActive)
  local Story = GWorld.StoryMgr:GetStory(QuestChain.StoryPath)
  GameMode:TriggerQuestArtLevelChange(ClientVarParams)
  if not Story then
    local MainStoryData = DataMgr.QuestChain[QuestChainId]
    if QuestChainId and QuestChainId > 0 and nil ~= MainStoryData and MainStoryData.StoryPath ~= nil then
      GWorld.StoryMgr:RunStory(MainStoryData.StoryPath, self.QuestChains[QuestChainId].DoingQuestId)
    end
    return
  end
  Story:StartStory(QuestChain.DoingQuestId)
end

function Component:RealUpdateQuestChain(QuestChainId)
  local QuestChain = self.QuestChains[QuestChainId]
  local Type = DataMgr.QuestChain[QuestChainId].QuestChainType
  local TypeName = CommonConst.QuestTypeName[Type]
  local NodeName = DataMgr.ReddotNode[TypeName].Name
  if ReddotManager.GetTreeNode(NodeName) and ReddotManager.GetLeafNodeCacheDetail(NodeName)[QuestChainId] == nil then
    ReddotManager.IncreaseLeafNodeCount(NodeName, 1, {QuestId = QuestChainId})
  end
  if not self:CheckQuestCanStart() then
    return
  end
  if not QuestChain or not QuestChain:IsDoing() then
    return
  end
  DebugPrint("ZJT_ RealUpdateQuestChain ", QuestChainId)
  GWorld.StoryMgr:RunStory(QuestChain.StoryPath, QuestChain.DoingQuestId)
end

function Component:IsCanRunQuestConditionCheck(Ret, QuestChainId)
  local QuestChain, GameMode, Result
  Result, GameMode = self:CheckQuestCanStart()
  if not Result then
    return ErrorCode.RET_QUEST_REGION_NOT_ALLREADY, GameMode, QuestChain
  end
  QuestChain = self.QuestChains[QuestChainId]
  if not QuestChain then
    return ErrorCode.RET_QUESTCHAIN_NOT_EXIST, GameMode, QuestChain
  end
  if not self:CheckRegionErrorCode(Ret or ErrorCode.RET_SUCCESS) then
    return Ret, GameMode, QuestChain
  end
  return ErrorCode.RET_SUCCESS, GameMode, QuestChain
end

function Component:CheckQuestIdIsDoing(QuestId)
  if not self.DoingQuestId2QuestChainId then
    return false
  end
  if self.DoingQuestId2QuestChainId[QuestId] then
    return true
  end
  return false
end

function Component:QuestChainFinish(Ret, QuestChainId, RewardBox, TargetCompleteQuestIds, TargetClientVarParams)
  self.logger.info("QuestChainFinish", QuestChainId, Ret)
  PrintTable({TargetClientVarParams = TargetClientVarParams}, 10)
  local CheckRet, GameMode, QuestChain = self:IsCanRunQuestConditionCheck(Ret, QuestChainId)
  self:UpdateAllQuestChainReddotSetByFinishedQuestChain(QuestChainId)
  if not self:CheckRegionErrorCode(CheckRet) then
    self:OnPrintToFeiShu_Quest(CheckRet, Ret, " QuestChainFinish_\228\187\187\229\138\161\233\147\190\229\174\140\230\136\144\229\164\177\232\180\165 ", QuestChainId, nil, RewardBox)
    return
  end
  self:HandleNotifyQuestComplete(nil, QuestChainId, TargetCompleteQuestIds)
  EventManager:FireEvent(EventID.SetNpcFlexibShowOrHideDynamic, "QuestChain", QuestChainId)
  EventManager:FireEvent(EventID.SetCustomNpcFlexibShowOrHideDynamic, "QuestChain", QuestChainId)
  EventManager:FireEvent(EventID.TriggerFlexibleActive)
  local StoryPath = QuestChain.StoryPath
  GWorld.StoryMgr:StopStoryline(StoryPath)
  GWorld.UploadQuestChainData = true
  GameMode:HandleQuestChainFinish(QuestChainId)
  GWorld.UploadQuestChainData = false
  CommonUtils.RemoveValue(self.CanReciveQuestChainIds, QuestChainId)
  EventManager:FireEvent(EventID.QuestChainFinished, QuestChainId)
  GameMode:TriggerQuestArtLevelChange(TargetClientVarParams)
  if TaskUtils and TaskUtils.ShowQuestChainFinishCommonHudReward then
    TaskUtils:ShowQuestChainFinishCommonHudReward(QuestChainId, RewardBox)
  end
end

function Component:GetQuestDoing()
  return self.DoingQuestIds
end

function Component:IsQuestChainDoing(QuestChainId)
  local QuestChain = self.QuestChains[QuestChainId]
  if QuestChain and QuestChain:IsDoing() then
    return true
  end
  return false
end

function Component:IsQuestDoing(QuestId)
  for QuestChainId, QuestChain in pairs(self.QuestChains) do
    if QuestChain:CheckQuestIdDoing(QuestId) then
      return true
    end
  end
  return false
end

function Component:UpdateAllQuestChainReddotSetByFinishedQuestChain(InQuestChainId)
  local Type = DataMgr.QuestChain[InQuestChainId].QuestChainType
  local TypeName = CommonConst.QuestTypeName[Type]
  local NodeName = DataMgr.ReddotNode[TypeName].Name
  if ReddotManager.GetLeafNodeCacheDetail(NodeName) and 1 == ReddotManager.GetLeafNodeCacheDetail(NodeName)[InQuestChainId] then
    ReddotManager.DecreaseLeafNodeCount(NodeName, 1, {QuestId = InQuestChainId})
  end
end

function Component:IsQuestChainFinished(QuestChainId)
  local QuestChain = self.QuestChains[QuestChainId]
  if QuestChain and QuestChain:IsFinish() then
    return true
  end
  return false
end

function Component:IsQuestFinished(QuestId)
  local length = CommonUtils:GetIntNumLength(QuestId)
  assert(length >= 6, "QuestId:" .. QuestId .. "\230\151\160\230\149\136")
  local QuestChainId = CommonUtils:GetFrontNum(QuestId, 6)
  local QuestChain = self.QuestChains[QuestChainId]
  if QuestChain and (QuestChain:IsFinish() or QuestChain:CheckQuestIdComplete(QuestId)) then
    return true
  end
  return false
end

function Component:IsQuestChainLock(QuestChainId)
  local QuestChain = self.QuestChains[QuestChainId]
  if QuestChain and QuestChain:IsLock() then
    return true
  end
  return false
end

function Component:IsQuestChainUnlock(QuestChainId)
  local QuestChain = self.QuestChains[QuestChainId]
  if QuestChain and QuestChain:IsUnlock() then
    return true
  end
  return false
end

function Component:StartQuest(QuestChainId, QuestId, ManualTrigger, TargetId, Count)
end

function Component:GMStartQuest(QuestChainId, QuestId)
  self:CallServerMethod("GMStartQuest", QuestChainId, QuestId)
end

function Component:CompleteQuestSuccess(QuestChainId, QuestId, ManualTrigger, TargetId, Count, STLData, RegionQuestDatas, NextId, QuestCoordinate, QuestCommonDatas)
  local QuestChain = self.QuestChains[QuestChainId]
  if QuestChain then
    if QuestChain:IsFinish() then
      local Message = "\228\187\187\229\138\161\233\147\190\229\183\178\231\187\143\229\174\140\230\136\144" .. [[

QuestChainId:]] .. QuestChainId .. [[

QuestId:]] .. QuestId
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\228\187\187\229\138\161\233\147\190\229\183\178\231\187\143\229\174\140\230\136\144", Message)
      return
    elseif QuestChain:CheckQuestIdComplete(QuestId) then
      local Message = "\228\187\187\229\138\161\229\183\178\231\187\143\229\174\140\230\136\144" .. [[

QuestChainId:]] .. QuestChainId .. [[

QuestId:]] .. QuestId
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\228\187\187\229\138\161\229\183\178\231\187\143\229\174\140\230\136\144", Message)
      return
    end
  end
  local ServerParamTable = {}
  ServerParamTable.QuestChainId = QuestChainId
  ServerParamTable.QuestId = QuestId
  ServerParamTable.TriggerType = CommonConst.QuestState.Success
  ServerParamTable.TargetId = TargetId
  ServerParamTable.TargetCount = Count
  ServerParamTable.STLData = STLData or {}
  ServerParamTable.RegionQuestDatas = RegionQuestDatas or {}
  ServerParamTable.NextId = NextId
  ServerParamTable.QuestCoordinate = QuestCoordinate or {}
  ServerParamTable.QuestCommonDatas = QuestCommonDatas or {}
  self:OnQuestTrigger(ServerParamTable, ManualTrigger)
end

function Component:HandleClientQuestCompleteEvent(Ret, ManualTrigger, QuestId, QuestChainId, TargetCompleteQuestIds, ClientVarParams)
  if not ErrorCode:Check(Ret) then
    return
  end
  PrintTable({
    ClientVarParams = ClientVarParams,
    Ret = Ret,
    QuestChainId = QuestChainId,
    QuestId = QuestId,
    TargetCompleteQuestIds = TargetCompleteQuestIds
  }, 10)
  DebugPrint("ZJT_ 1111111 HandleClientQuestCompleteEvent ", Ret, ManualTrigger, QuestId, QuestChainId, TargetCompleteQuestIds, ClientVarParams)
  EventManager:FireEvent(EventID.SetNpcFlexibShowOrHideDynamic, "Quest", QuestId)
  EventManager:FireEvent(EventID.SetCustomNpcFlexibShowOrHideDynamic, "Quest", QuestId)
  EventManager:FireEvent(EventID.QuestFinished, QuestId)
  EventManager:FireEvent(EventID.TriggerFlexibleActive)
  CommonUtils.RemoveValue(self.DoingQuestIds, QuestId)
  self:HandleNotifyQuestComplete(QuestId, QuestChainId, TargetCompleteQuestIds)
  local GameMode = GWorld.GameInstance:GetCurrentGameMode()
  GameMode:TriggerQuestArtLevelChange(ClientVarParams)
  if ManualTrigger then
    self:TriggerQuestChain()
  end
end

function Component:HandleNotifyQuestComplete(CompleteQuestId, QuestChainId, TargetCompleteQuestIds)
  if not TargetCompleteQuestIds or next(TargetCompleteQuestIds) == nil then
    if CompleteQuestId then
      self:OnQuestComplete(QuestChainId, CompleteQuestId)
    else
      PrintTable({
        CompleteQuestId = CompleteQuestId or 0,
        QuestChainId = QuestChainId or 0,
        TargetCompleteQuestIds = TargetCompleteQuestIds,
        Reason = "ZJT_FailedCompleteQuestId"
      }, 10)
    end
  elseif type(TargetCompleteQuestIds) == "table" then
    for _, QuestId in ipairs(TargetCompleteQuestIds) do
      self:OnQuestComplete(QuestChainId, QuestId)
    end
  else
    PrintTable({
      CompleteQuestId = CompleteQuestId or 0,
      QuestChainId = QuestChainId or 0,
      TargetCompleteQuestIds = TargetCompleteQuestIds,
      Reason = "ZJT_FailedTargetCompleteQuestIds"
    }, 10)
  end
end

function Component:OnQuestTrigger(ServerParamTable, ManualTrigger)
  DebugPrint("ZJT_ OnQuestTrigger  ", os.time(), ServerParamTable.TriggerType, ServerParamTable.QuestChainId, ServerParamTable.QuestId, ManualTrigger, ServerParamTable.TargetId, ServerParamTable.TargetCount, ServerParamTable.STLData, ServerParamTable.QuestDatas)
  PrintTable({
    QuestDatas = ServerParamTable.RegionQuestDatas
  }, 10)
  
  local function callback(Ret, Reward, ClientVarParams)
    self:HandleServerQuestComplete(Ret, Reward, ServerParamTable, ManualTrigger, ClientVarParams)
  end
  
  if ServerParamTable.QuestChainId > 0 and ServerParamTable.QuestId > 0 then
    self:CallServer("OnQuestTrigger", callback, ServerParamTable)
  end
end

function Component:HandleServerQuestComplete(Ret, Reward, ServerParamTable, ManualTrigger, ClientVarParams)
  local TaskChainConfig = DataMgr.QuestChain[ServerParamTable.QuestChainId]
  if next(Reward) and TaskChainConfig.QuestReward and TaskChainConfig.QuestReward[ServerParamTable.QuestId] and nil ~= Reward and next(Reward) ~= nil and not Reward.bEmpty then
    UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Reward)
  end
  self.logger.debug("ZJT_ OnQuestTrigger ServerCallClient ", ServerParamTable.TriggerType, ServerParamTable.QuestChainId, ServerParamTable.QuestId, Ret, ClientVarParams)
  self:HandleClientQuestCompleteEvent(Ret, ManualTrigger, ServerParamTable.QuestId, ServerParamTable.QuestChainId, nil, ClientVarParams)
  local EventNames = DataMgr.MSDKUploadConvert.QuestSuccessInfo[ServerParamTable.QuestId]
  if EventNames then
    for i, EventName in ipairs(EventNames) do
      local EMHeroUSDKSubsystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UEMHeroUSDKSubsystem:StaticClass())
      EMHeroUSDKSubsystem:MSDKUploadCommonEventByEventName(EventName)
    end
  end
end

function Component:OnQuestStart(QuestChainId, QuestId)
end

function Component:OnQuestComplete(QuestChainId, QuestId)
  local GameMode = GWorld.GameInstance:GetCurrentGameMode()
  DebugPrint("ZJT_ OnQuestComplete ", QuestChainId, QuestId, GameMode:GetName(), GameMode:IsSubGameMode())
  if not IsValid(GameMode) then
    return
  end
  GameMode:TriggerOnQuestComplete(QuestChainId, QuestId)
end

function Component:UpdateQuestChain(QuestChainId)
  EventManager:FireEvent(EventID.OnUpdateQuestChain, QuestChainId)
  self:RealUpdateQuestChain(QuestChainId)
end

function Component:GMStartQuestChain(QuestChainId)
  self.logger.debug("GMStartQuestChain", QuestChainId, type(QuestChainId))
  local QuestChain = self.QuestChains[QuestChainId]
  if QuestChain then
    if QuestChain:IsFinish() then
      DebugPrint("ZJT_ \228\187\187\229\138\161\233\147\190\229\183\178\231\187\143\229\174\140\230\136\144 ", QuestChainId)
      return
    end
    if QuestChain:IsDoing() then
      DebugPrint("\228\187\187\229\138\161\233\147\190\230\173\163\229\156\168\232\191\155\232\161\140 ", QuestChainId)
      return
    end
    if QuestChain:IsUnlock() then
      DebugPrint("\230\173\163\229\156\168\232\191\155\232\161\140\229\137\141\231\189\174\228\187\187\229\138\161 ", QuestChainId)
      return
    end
  end
  
  local function callback(Ret)
    self.logger.debug("ServerCallClient GMStartQuestChain callback", Ret)
    local CheckRet, GameMode, QuestChain = self:IsCanRunQuestConditionCheck(Ret, QuestChainId)
    if not self:CheckRegionErrorCode(CheckRet) then
      self:OnPrintToFeiShu_Quest(CheckRet, Ret, " GMStartQuestChain_GM\229\188\128\229\167\139\228\187\187\229\138\161\233\147\190\229\164\177\232\180\165 ", QuestChainId)
      return
    end
    table.insert(self.CanReciveQuestChainIds, QuestChainId)
    self:TriggerQuestChain()
  end
  
  self:CallServer("GMStartQuestChain", callback, QuestChainId)
end

function Component:GMSuccQuestChain(QuestChainId, bIsTriggerQuestChain)
  self.logger.debug("GMSuccQuestChain", QuestChainId, type(QuestChainId), bIsTriggerQuestChain, type(bIsTriggerQuestChain))
  local QuestChain = self.QuestChains[QuestChainId]
  if QuestChain and QuestChain:IsFinish() then
    DebugPrint("ZJT_ \228\187\187\229\138\161\233\147\190\229\183\178\231\187\143\229\174\140\230\136\144 ", QuestChainId)
    return
  end
  self:CallServerMethod("GMSuccQuestChain", QuestChainId)
end

function Component:GMCleanQuestChain(QuestChainId)
  print(_G.LogTag, "GMCleanQuestChain", QuestChainId)
  
  local function callback(ret)
    self.logger.debug("GMCleanQuestChain callback", ret)
  end
  
  self:CallServer("GMCleanQuestChain", callback, QuestChainId)
end

function Component:GMCleanAllQuest()
  self.QuestChains:Clear()
  
  local function callback(Ret)
    if ErrorCode:Check(Ret) then
    end
  end
  
  self:CallServer("GMCleanAllQuest", callback)
end

function Component:DoRefreshTaskItemUIInfo(OpType, TaskInfo, TaskExtraInfo)
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local BattleMain = UIManager:GetUIObj("BattleMain")
  if BattleMain and BattleMain.Pos_TaskBar:GetChildAt(0) and BattleMain.Pos_TaskBar.Visibility == UE4.ESlateVisibility.Collapsed and Avatar.TrackingQuestChainId > 0 and nil ~= Avatar.TrackingQuestChainId then
    BattleMain.Pos_TaskBar:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  elseif BattleMain and BattleMain.Pos_TaskBar:GetChildAt(0) and BattleMain.Pos_TaskBar.Visibility == UE4.ESlateVisibility.Collapsed and TaskUtils:GetUnlockMainStory() then
    BattleMain.Pos_TaskBar:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    BattleMain.Pos_TaskBar:GetChildAt(0).VBox_TaskBar:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if TaskInfo and "Add" == OpType then
    local QuestChainData = DataMgr.QuestChain[TaskInfo.TaskChainId]
    local STLExportInfo = DataMgr.STLExportQuestChain[TaskInfo.TaskChainId]
    if QuestChainData and QuestChainData.QuestChainType and nil ~= STLExportInfo and nil ~= STLExportInfo.Quests and nil ~= STLExportInfo.Quests[TaskInfo.TaskId] and nil == STLExportInfo.Quests[TaskInfo.TaskId].IsPreQuest then
      local TypeName = CommonConst.QuestTypeName[QuestChainData.QuestChainType]
      local NodeName = DataMgr.ReddotNode[TypeName].Name
      if ReddotManager.GetTreeNode(NodeName) then
        local NodeDetail = ReddotManager.GetLeafNodeCacheDetail(NodeName)
        if nil == ReddotManager.GetLeafNodeCacheDetail(NodeName)[TaskInfo.TaskChainId] then
          ReddotManager.IncreaseLeafNodeCount(NodeName, 1, {
            QuestId = TaskInfo.TaskChainId
          })
        end
      end
    end
  end
  local TaskPanel
  local BattleMainUI = UIManager:GetUIObj("BattleMain")
  if nil ~= BattleMainUI then
    if TaskInfo and TaskInfo.IsDynamicEvent then
      TaskPanel = BattleMainUI:GetOrAddDynamicEventWidget()
    else
      TaskPanel = BattleMainUI.Pos_TaskBar:GetChildAt(0)
    end
  end
  if nil == TaskPanel then
    return
  end
  if TaskInfo and TaskInfo.IsDynamicEvent then
    TaskPanel:UpdateTaskInfo(TaskInfo, OpType)
  elseif nil ~= TaskExtraInfo then
    TaskPanel:UpdateTaskExtraInfo(OpType, TaskExtraInfo)
  else
    local TrackingQuestId = Avatar.TrackingQuestChainId
    local RefreshTaskChainId = TaskInfo.TaskChainId
    if TrackingQuestId == RefreshTaskChainId then
      TaskPanel:UpdateTaskInfo(TaskInfo, OpType)
    end
  end
end

function Component:SetQuestTracking(QuestChainId, SubRegionId)
  local function Callback(Ret)
    if not self:CheckRegionErrorCode(Ret) then
      self:OnPrintToFeiShu_Quest(ErrorCode.RET_SUCCESS, Ret, " SetQuestTracking_\232\174\190\231\189\174\232\191\189\232\184\170\228\187\187\229\138\161\233\147\190\229\164\177\232\180\165 ", QuestChainId)
      
      return
    end
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    local BattleMain = UIManager:GetUIObj("BattleMain")
    if BattleMain and BattleMain.Pos_TaskBar:GetChildAt(0) then
      BattleMain.Pos_TaskBar:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      BattleMain.Pos_TaskBar:GetChildAt(0):SwitchTaskBarContentByTracking(true, true)
    end
    EventManager:FireEvent(EventID.UpdateMiniMap, nil, "Task", "Clear")
    local UIObjs = MissionIndicatorManager:GetIndicatorUIObjByQuestChainIdWithType(self.TrackingQuestChainId, "Task")
    local TargetSubRegionId = 0
    if not IsEmptyTable(UIObjs) then
      for k, UI in pairs(UIObjs) do
        local TargetKey = UI.GuideInfoCache.PointOrStaticCreatorName
        if TargetKey and GuidePointLocData[TargetKey] then
          TargetSubRegionId = GuidePointLocData[TargetKey].SubRegionId
        end
        local NpcUnitId = UI:GetTaskGuideNpcUnitIdFromCache()
        if nil ~= NpcUnitId and TaskUtils and TaskUtils.UpdateAllMissionNpcGuideMaps then
          TaskUtils:UpdateAllMissionNpcGuideMaps(true, k, NpcUnitId)
        end
        UI:UpdateTaskIndicator()
        UI.PlayerRegionId = self.CurrentRegionId
        EventManager:FireEvent(EventID.UpdateMiniMap, UI:GetName(), "Task", "Add")
      end
    end
    EventManager:FireEvent(EventID.OnChangeTaskIndicator, TaskUtils.MissionNpcGuideMaps)
    if nil ~= MissionIndicatorManager.TrackingSpecialSideQuestChainId then
      local UnSpecialUIObjs = MissionIndicatorManager:GetSpecialSideIndicatorUIObj()
      if not IsEmptyTable(UnSpecialUIObjs) then
        for _, UI in pairs(UnSpecialUIObjs) do
          if IsValid(UI) and UI.OwenrQuestNpcId then
            EventManager:FireEvent(EventID.UpdateMiniMap, UI.OwenrQuestNpcId, "SpecialSide", "Add")
          end
        end
      end
    end
    TaskUtils:UpdatePlayerSubRegionIdInfo(self.CurrentRegionId)
    if SubRegionId and SubRegionId > 0 then
      EventManager:FireEvent(EventID.CheckShowMap, QuestChainId)
    end
  end
  
  if QuestChainId ~= self.TrackingQuestChainId then
    self:CallServer("SetQuestTracking", Callback, QuestChainId)
  elseif SubRegionId and SubRegionId > 0 then
    EventManager:FireEvent(EventID.CheckShowMap, QuestChainId)
  end
end

function Component:CancelQuestTracking(QuestChainId)
  local function Callback(Ret)
    if not self:CheckRegionErrorCode(Ret) then
      self:OnPrintToFeiShu_Quest(ErrorCode.RET_SUCCESS, Ret, " CancelQuestTracking_\229\143\150\230\182\136\232\191\189\232\184\170\228\187\187\229\138\161\233\147\190\229\164\177\232\180\165 ", QuestChainId)
      
      return
    end
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    local BattleMain = UIManager:GetUIObj("BattleMain")
    if BattleMain then
      BattleMain.Pos_TaskBar:GetChildAt(0):SwitchTaskBarContentByTracking(false, false)
    end
    local UI = UIManager:GetUIObj("TaskIndicator")
    if UI then
      UI.CurGuideChainId = 0
    end
    EventManager:FireEvent(EventID.OnCancelQuestTracking, QuestChainId)
    local UIObjs = MissionIndicatorManager:GetIndicatorUIObjByQuestChainIdWithType(QuestChainId, "Task")
    if not IsEmptyTable(UIObjs) then
      for k, UI in pairs(UIObjs) do
        if TaskUtils and TaskUtils.UpdateAllMissionNpcGuideMaps then
          TaskUtils:UpdateAllMissionNpcGuideMaps(false, k, nil)
        end
      end
    end
    EventManager:FireEvent(EventID.OnChangeTaskIndicator, TaskUtils.MissionNpcGuideMaps)
    EventManager:FireEvent(EventID.UpdateMiniMap, nil, "Task", "Clear")
  end
  
  self:CallServer("CancelQuestTracking", Callback, QuestChainId)
end

function Component:OnQuestTargetFinish(Ret)
  DebugPrint("ZJT_ OnQuestTargetFinish ", Ret)
  if not self:CheckRegionErrorCode(Ret) then
    self:OnPrintToFeiShu_Quest(ErrorCode.RET_SUCCESS, Ret, " OnQuestTargetUpdate_\230\155\180\230\150\176\229\174\140\230\136\144\232\191\155\229\186\166\233\148\153\232\175\175 ")
    return
  end
  EventManager:FireEvent(EventID.OnGameModeComplete)
end

function Component:OnQuestTargetUpdate(Ret)
  DebugPrint("ZJT_ OnQuestTargetUpdate ", Ret)
  if not self:CheckRegionErrorCode(Ret) then
    self:OnPrintToFeiShu_Quest(ErrorCode.RET_SUCCESS, Ret, " OnQuestTargetUpdate_\230\155\180\230\150\176\232\191\155\229\186\166\233\148\153\232\175\175 ")
    return
  end
  EventManager:FireEvent(EventID.OnGameModeComplete)
end

function Component:ShowQuestChainRewardUI(RewardBox)
  if not RewardBox then
    return
  end
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local BattleMain = UIManager:GetUIObj("BattleMain")
  if not BattleMain then
    print(WarningTag, "\229\189\147\229\137\141\229\156\168\230\141\174\231\130\185\228\184\173\239\188\140\231\155\174\229\137\141\230\141\174\231\130\185\228\184\187UI\228\184\142\233\135\142\229\164\150\228\184\187UI\228\184\141\231\187\159\228\184\128\239\188\140\230\141\174\231\130\185\230\154\130\230\151\182\228\184\141\230\152\190\231\164\186\228\187\187\229\138\161\233\147\190\229\174\140\230\136\144\229\165\150\229\138\177")
    return
  end
  self:AddRewardsToCache(RewardBox)
  for _, DataType in pairs(CommonConst.DataType) do
    local RewardProps = RewardBox[DataType .. "s"]
    if not RewardProps then
    else
      self:ShowRewardUI(RewardProps, DataType, CommonConst.RewardReason.Quest)
    end
  end
end

function Component:ShowRewardUI(RewardProps, DataType, RewardReason)
  UIUtils.ShowDungeonRewardUI(RewardProps, RewardReason, DataType)
end

function Component:FailerSpecialQuest(SpecialQuestId, infos, NodeCallback)
  local function Callback(Ret)
    DebugPrint("ZJT_ FailerSpecialQuest ", Ret, SpecialQuestId)
    
    if ErrorCode:Check(Ret) then
      NodeCallback()
    else
      self:OnPrintToFeiShu_Quest(ErrorCode.RET_SUCCESS, Ret, " FailerSpecialQuest_\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165\233\148\153\232\175\175 ", SpecialQuestId)
    end
  end
  
  self:CallServer("FailerSpecialQuest", Callback, SpecialQuestId, infos)
end

function Component:SuccessSpecialQuest(SpecialQuestId, infos, NodeCallback)
  local function Callback(Ret)
    DebugPrint("ZJT_ SuccessSpecialQuest ", Ret, SpecialQuestId)
    
    if ErrorCode:Check(Ret) then
      NodeCallback()
    else
      self:OnPrintToFeiShu_Quest(ErrorCode.RET_SUCCESS, Ret, " SuccessSpecialQuest_\230\136\144\229\138\159\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165 ", SpecialQuestId)
    end
  end
  
  self:CallServer("SuccessSpecialQuest", Callback, SpecialQuestId, infos)
end

function Component:StartSpecialQuest(SpecialQuestId, infos, NodeCallback)
  local function Callback(Ret)
    DebugPrint("ZJT_ StartSpecialQuest ServerCallBack ", Ret, SpecialQuestId)
    
    if ErrorCode:Check(Ret) then
      NodeCallback()
    else
      self:OnPrintToFeiShu_Quest(ErrorCode.RET_SUCCESS, Ret, " StartSpecialQuest_\229\188\128\229\167\139\231\137\185\230\174\138\228\187\187\229\138\161\233\148\153\232\175\175 ", SpecialQuestId)
    end
  end
  
  self:CallServer("StartSpecialQuest", Callback, SpecialQuestId, infos)
end

function Component:StopQuestChainExcept(ChainId)
  local chain
  for index, id in ipairs(self.CanReciveQuestChainIds) do
    chain = self.QuestChains[id]
    if chain and id ~= ChainId and (chain:IsDoing() or chain:IsUnlock()) then
      local FilePath = chain.StoryPath
      GWorld.StoryMgr:StopStoryline(FilePath)
    end
  end
end

function Component:HandleQuestChainDoing(QuestChainId, cb)
  local function Callback(Ret)
    self.logger.debug("ZJT_ HandleQuestChainDoing ", Ret, QuestChainId)
    
    if cb then
      cb(Ret)
    end
    if not self:CheckRegionErrorCode(Ret) then
      self:OnPrintToFeiShu_Quest(ErrorCode.RET_SUCCESS, Ret, " HandleQuestChainDoing_\230\137\139\229\138\168\229\188\128\229\167\139\228\187\187\229\138\161\233\148\153\232\175\175 ", QuestChainId)
      return
    end
  end
  
  self:CallServer("HandleQuestChainDoing", Callback, QuestChainId)
end

function Component:NotifyQuestDeliver(DeliverId, DeliverStartIndex, IsWhite)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  DebugPrint("ZJT_ NotifyQuestDeliver ", DeliverId, DeliverStartIndex, self.CurrentRegionId, IsWhite)
  if IsValid(GameMode) then
    GameMode:HandleLevelDeliver(UE4.EModeType.ModeRegion, DeliverId, DeliverStartIndex, IsWhite)
  end
end

function Component:RegisterQuestPickId(QuestPickId, CallbackFunc)
  local function Callback(Ret)
    if not self:CheckRegionErrorCode(Ret) then
      self:OnPrintToFeiShu_Quest(ErrorCode.RET_SUCCESS, Ret, " RegisterQuestPickId_\230\179\168\229\134\140\230\139\190\229\143\150\230\142\137\232\144\189\231\137\169\233\148\153\232\175\175 ", QuestPickId)
      
      return
    end
    if ErrorCode:Check(Ret) then
      CallbackFunc()
    end
  end
  
  self:CallServer("RegisterQuestPickId", Callback, QuestPickId)
end

function Component:QuestPickComplete(CompleteTable)
  for _, QuestPickupId in pairs(CompleteTable) do
    local QuestPickupId2Callback = GWorld.StoryMgr.QuestPickupId2Callback
    if QuestPickupId2Callback and QuestPickupId2Callback[QuestPickupId] then
      QuestPickupId2Callback[QuestPickupId]()
      GWorld.StoryMgr.QuestPickupId2Callback[QuestPickupId] = nil
    end
  end
end

function Component:UpdateStoryVariable(StoryVariableName, StoryVariableValue)
  local function Callback(Ret)
    self.logger.debug("ZJT_ UpdateStoryVariable ", Ret, StoryVariableName, StoryVariableValue)
  end
  
  self:CallServer("UpdateStoryVariable", Callback, StoryVariableName, StoryVariableValue)
end

function Component:RemoveStoryVariable(StoryVariableName)
  local function Callback(Ret)
    self.logger.debug("ZJT_ RemoveStoryVariable ", Ret, StoryVariableName)
  end
  
  self:CallServer("RemoveStoryVariable", Callback, StoryVariableName)
end

function Component:S2C_SwitchGuide_QuestChain()
  EventManager:FireEvent(EventID.OnChangeTaskIndicator, TaskUtils.MissionNpcGuideMaps)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local TrackQuestChainId = Avatar.TrackingQuestChainId
  if Avatar.InSpecialQuest and ClientEventUtils:GetCurrentEvent() and ClientEventUtils:GetCurrentEvent().PreQuestChainId then
    TrackQuestChainId = ClientEventUtils:GetCurrentEvent().PreQuestChainId
  end
  local QuestChain = Avatar.QuestChains[TrackQuestChainId]
  if not QuestChain then
    return
  end
  local DoingQuestId = QuestChain.DoingQuestId
  AudioManager(GWorld):UpdateQuestChainIdAndQuestId(TrackQuestChainId, DoingQuestId)
end

function Component:HandleQuestChainDoing_QuestComplete(ServerParamTable)
  local QuestChainId = ServerParamTable.QuestChainId
  if DataMgr.QuestChain[QuestChainId] and DataMgr.QuestChain[QuestChainId].QuestNpcId then
    MissionIndicatorManager:ReactiveMissionIndicatorByRegionMap(DataMgr.QuestChain[QuestChainId].QuestNpcId)
  end
  
  local function CallBack(Ret, RewardBox)
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_Quest_GetQuestSuccess"))
    self.logger.debug("ZJT_ HandleQuestChainDoing_QuestComplete ", Ret)
    local TaslBar = TaskUtils:GetTaskBarWidget()
    if 0 == self.TrackingQuestChainId then
      if TaslBar and QuestChainId > 0 then
        local IconTexture = TaskUtils:GetIconTextureByTrackQuestChainType(QuestChainId)
        if IconTexture then
          TaslBar.Icon_GuidePoint:SetBrushResourceObject(IconTexture)
        end
      end
    elseif TaslBar and self.TrackingQuestChainId > 0 then
      local IconTexture = TaskUtils:GetIconTextureByTrackQuestChainType(self.TrackingQuestChainId)
      if IconTexture then
        TaslBar.Icon_GuidePoint:SetBrushResourceObject(IconTexture)
      end
    end
  end
  
  self:CallServer("HandleQuestChainDoing_QuestComplete", CallBack, ServerParamTable)
end

function Component:NotifyActiveQuestChainEnd(QuestChainId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    DebugPrint("LHQ@@@NotifyActiveQuestChainEnd:", Avatar.TrackingQuestChainId)
  end
  self.logger.debug("ZJT_ ServerCallClient NotifyActiveQuestChainEnd ", QuestChainId)
  if self.InSpecialQuest then
    local SpecialQuestIds = DataMgr.SpecialQuestId2QuestChainId[QuestChainId]
    if SpecialQuestIds then
      local SpecialQuestEvent = ClientEventUtils:GetCurrentEvent()
      for _, SpecialQuestId in pairs(SpecialQuestIds) do
        if SpecialQuestEvent and SpecialQuestEvent.SpecialQuestId == SpecialQuestId then
          SpecialQuestEvent:SpecialQuestEventFinishAndStopDirectly("QuestChainEnd")
        end
      end
    end
  end
  local QuestChain = self.QuestChains[QuestChainId]
  local StoryPath = QuestChain.StoryPath
  GWorld.StoryMgr:StopStoryline(StoryPath)
  local GameMode = UGameplayStatics.GetGameMode(GWorld.GameInstance)
  GameMode:ClearRegionActorData("QuestChainId", QuestChainId, EDestroyReason.QuestChainClear, function(Target, Key, Value)
    return Target.QuestChainId == Value
  end)
  local TaslBar = TaskUtils:GetTaskBarWidget()
  if TaslBar then
    TaslBar:SwitchTaskBarContentByTracking(true, true)
  end
  local Indicators = MissionIndicatorManager:GetIndicatorUIObjByQuestChainIdWithType(QuestChainId, "Task")
  if IsEmptyTable(Indicators) == false then
    for _, Indicator in pairs(Indicators) do
      if Indicator then
        Indicator:CloseIndicator()
      end
    end
  end
end

return Component
