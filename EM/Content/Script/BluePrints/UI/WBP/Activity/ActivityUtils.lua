require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local ActivityCommon = require("BluePrints.UI.WBP.Activity.ActivityCommon")
local EMCache = require("EMCache.EMCache")
local ActivityReddotHelper = require("BluePrints.UI.WBP.Activity.ActivityReddotHelper")
local EastSeasonQuestUtils = require("BluePrints.UI.WBP.Activity.Widget.EastSeason.EastSeasonQuestUtils")
local ActivityUtils = {}
ActivityUtils.EnumPlayerTaskState = {
  NotStart = 1,
  NotComplete = 2,
  NotUnlock = 3,
  NotGetReward = 4,
  Completed = 5
}
ActivityUtils.EnumPlayerSignRewardState = {
  NotSign = 1,
  SignedNotRecv = 2,
  Completed = 3
}
ActivityUtils.ServerPropertyName = {
  DailyLogin = "DailyLogin",
  StarterQuests = "StarterQuests",
  CharTrial = "CharTrial",
  OnlyClient = "OnlyClient",
  ConditionReward = "ConditionReward"
}
ActivityUtils.Id2ReddotNodeName = {
  [103001] = "RougeMain",
  [103002] = "AbyssMain",
  [106001] = "TrainingLevel",
  [103005] = "ZhiliuReward",
  [103006] = "MidTermGoal"
}

function ActivityUtils.CheckEventIsInActiveTime(EventID, EventMainExcel)
  local NowTime = TimeUtils.NowTime()
  if nil == EventMainExcel then
    EventMainExcel = DataMgr.EventMain[EventID]
  end
  if not EventMainExcel then
    return false
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local bServerActivityTimeOpen
  if EventID and Avatar.ActivityTimeOpen and nil ~= Avatar.ActivityTimeOpen[EventID] and type(Avatar.ActivityTimeOpen[EventID]) == "table" then
    if next(Avatar.ActivityTimeOpen[EventID]) then
      bServerActivityTimeOpen = true
    else
      bServerActivityTimeOpen = false
    end
  elseif EventID and Avatar.ActivityTimeOpen and nil ~= Avatar.ActivityTimeOpen[EventID] and type(Avatar.ActivityTimeOpen[EventID]) == "boolean" then
    bServerActivityTimeOpen = Avatar.ActivityTimeOpen[EventID]
  else
    bServerActivityTimeOpen = false
  end
  if bServerActivityTimeOpen then
    return true
  else
    local RealEndTime = nil == EventMainExcel.RewardEndTime and EventMainExcel.EventEndTime or EventMainExcel.RewardEndTime
    local StartTime = EventMainExcel.EventStartTime or 0
    if RealEndTime and NowTime >= RealEndTime or StartTime and NowTime < StartTime then
      return false
    end
  end
  return true
end

function ActivityUtils.CheckEventIsOpen(EventID, EventMainExcel, IsUseRewardTime, UnlockRuleName)
  if ActivityCommon.GlobalPakForbidTabId[EventID] and UE.AHotUpdateGameMode.IsGlobalPak() then
    return false
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local NowTime = TimeUtils.NowTime()
  if nil == EventMainExcel then
    EventMainExcel = DataMgr.EventMain[EventID]
  end
  if not EventMainExcel then
    return false
  end
  if not Avatar.ActivityTimeOpen then
    return false
  end
  local bServerActivityTimeOpen
  if EventID and Avatar.ActivityTimeOpen and nil ~= Avatar.ActivityTimeOpen[EventID] and type(Avatar.ActivityTimeOpen[EventID]) == "table" then
    if next(Avatar.ActivityTimeOpen[EventID]) then
      bServerActivityTimeOpen = true
    else
      bServerActivityTimeOpen = false
    end
  elseif EventID and Avatar.ActivityTimeOpen and nil ~= Avatar.ActivityTimeOpen[EventID] and type(Avatar.ActivityTimeOpen[EventID]) == "boolean" then
    bServerActivityTimeOpen = Avatar.ActivityTimeOpen[EventID]
  else
    bServerActivityTimeOpen = false
  end
  if not bServerActivityTimeOpen then
    local IsActivityOpenAndInRewardTime = false
    local IsNotEventEndTimeAndPermanenEventTime = false
    local IsActivityOpenAndInEventEndTime = false
    local IsNotEventEndTimeAndNotPermanenEventTime = false
    local bEventIsInActiveTime = ActivityUtils.CheckEventIsInActiveTime(EventID, EventMainExcel)
    if bEventIsInActiveTime and not EventMainExcel.EventEndTime and EventMainExcel.PermanenEventTime then
      IsNotEventEndTimeAndPermanenEventTime = true
    end
    if bEventIsInActiveTime and not EventMainExcel.EventEndTime and not EventMainExcel.PermanenEventTime then
      IsNotEventEndTimeAndNotPermanenEventTime = true
    end
    if IsUseRewardTime and EventMainExcel.EventEndTime and NowTime > EventMainExcel.EventEndTime and EventMainExcel.RewardEndTime and NowTime < EventMainExcel.RewardEndTime then
      IsActivityOpenAndInRewardTime = true
    end
    if bEventIsInActiveTime then
      IsActivityOpenAndInEventEndTime = true
    end
    if not IsActivityOpenAndInRewardTime and not IsNotEventEndTimeAndPermanenEventTime and not IsActivityOpenAndInEventEndTime and not IsNotEventEndTimeAndNotPermanenEventTime then
      return false
    end
  end
  local OfflineActivity = Avatar.OfflineActivity
  if OfflineActivity and OfflineActivity[EventID] then
    return false
  end
  if ConditionUtils.CheckCondition(Avatar, EventMainExcel.EventUnlockCondition) == false then
    return false
  end
  if nil ~= UnlockRuleName and not Avatar:CheckSystemUICanOpen(UnlockRuleName) then
    return false
  end
  if EventID == DataMgr.EventConstant.FollowCommunityEvent.ConstantValue and ActivityUtils.IsBilibiliServer() then
    return false
  end
  return true
end

function ActivityUtils.IsBilibiliServer()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local ChannelId = Avatar.ChannelId
  for id, channelInfo in pairs(DataMgr.ChannelInfo) do
    if id == ChannelId then
      return channelInfo.Provider == CommonConst.CHANNEL_PROVIDER.BILI
    end
  end
  return false
end

function ActivityUtils.GetCurSignRewardState(SignDayIndex, SignServerData)
  if nil == SignServerData then
    return ActivityUtils.EnumPlayerSignRewardState.NotSign
  elseif not SignServerData:IsSignInday(SignDayIndex) then
    return ActivityUtils.EnumPlayerSignRewardState.NotSign
  elseif SignServerData:CanRecvReward(SignDayIndex) then
    return ActivityUtils.EnumPlayerSignRewardState.SignedNotRecv
  else
    return ActivityUtils.EnumPlayerSignRewardState.Completed
  end
end

function ActivityUtils.GetCurQuestState(QuestServerData, PlayerPhaseId)
  if nil == QuestServerData then
    return ActivityUtils.EnumPlayerTaskState.NotStart
  elseif not QuestServerData:IsComplete() then
    return ActivityUtils.EnumPlayerTaskState.NotComplete
  elseif not ActivityUtils.CheckIsTaskUnlock(QuestServerData:GetUniqueID(), PlayerPhaseId) then
    return ActivityUtils.EnumPlayerTaskState.NotUnlock
  elseif QuestServerData:CanRecvReward() then
    return ActivityUtils.EnumPlayerTaskState.NotGetReward
  else
    return ActivityUtils.EnumPlayerTaskState.Completed
  end
end

function ActivityUtils.GetCurrentAllActivity()
  local AllActivityTabIdx = {}
  for key, TabConfigInfo in pairs(DataMgr.EventTab) do
    if type(TabConfigInfo.EventId) == "table" then
      local EventConfigData = DataMgr.EventMain[TabConfigInfo.EventId[1]]
      if ActivityUtils.CheckEventIsOpen(TabConfigInfo.EventId[1], EventConfigData, true, "GameEvent") then
        table.insert(AllActivityTabIdx, TabConfigInfo.EventTabId)
      end
    else
      local EventConfigData = DataMgr.EventMain[TabConfigInfo.EventId]
      if ActivityUtils.CheckEventIsOpen(TabConfigInfo.EventId, EventConfigData, true, "GameEvent") then
        table.insert(AllActivityTabIdx, TabConfigInfo.EventTabId)
      end
    end
  end
  table.sort(AllActivityTabIdx, function(Data1, Data2)
    if DataMgr.EventTab[Data1].Sequence == DataMgr.EventTab[Data2].Sequence then
      return DataMgr.EventTab[Data1].EventTabId < DataMgr.EventTab[Data2].EventTabId
    else
      return DataMgr.EventTab[Data1].Sequence > DataMgr.EventTab[Data2].Sequence
    end
  end)
  local AllActivityID = {}
  for _, v in ipairs(AllActivityTabIdx) do
    local EventConfigData = DataMgr.EventTab[v]
    if type(EventConfigData.EventId) == "table" then
      table.insert(AllActivityID, EventConfigData.EventId)
    else
      table.insert(AllActivityID, {
        EventConfigData.EventId
      })
    end
  end
  return AllActivityID, AllActivityTabIdx
end

function ActivityUtils.GetCurrentAllActivityWithoutSystemCheck()
  local AllActivityTabIdx = {}
  for key, TabConfigInfo in pairs(DataMgr.EventTab) do
    if type(TabConfigInfo.EventId) == "table" then
      local EventConfigData = DataMgr.EventMain[TabConfigInfo.EventId[1]]
      if ActivityUtils.CheckEventIsOpen(TabConfigInfo.EventId[1], EventConfigData, true, nil) then
        table.insert(AllActivityTabIdx, TabConfigInfo.EventTabId)
      end
    else
      local EventConfigData = DataMgr.EventMain[TabConfigInfo.EventId]
      if ActivityUtils.CheckEventIsOpen(TabConfigInfo.EventId, EventConfigData, true, nil) then
        table.insert(AllActivityTabIdx, TabConfigInfo.EventTabId)
      end
    end
  end
  table.sort(AllActivityTabIdx, function(Data1, Data2)
    if DataMgr.EventTab[Data1].Sequence == DataMgr.EventTab[Data2].Sequence then
      return DataMgr.EventTab[Data1].EventTabId < DataMgr.EventTab[Data2].EventTabId
    else
      return DataMgr.EventTab[Data1].Sequence > DataMgr.EventTab[Data2].Sequence
    end
  end)
  local AllActivityID = {}
  for _, v in ipairs(AllActivityTabIdx) do
    local EventConfigData = DataMgr.EventTab[v]
    if type(EventConfigData.EventId) == "table" then
      table.insert(AllActivityID, EventConfigData.EventId)
    else
      table.insert(AllActivityID, {
        EventConfigData.EventId
      })
    end
  end
  return AllActivityID, AllActivityTabIdx
end

function ActivityUtils.CheckIsTaskUnlock(QuestId, PlayerPhaseId)
  local QuestConfigData = DataMgr.CommonQuestDetail[QuestId]
  if nil == QuestConfigData then
    return
  end
  local PhaseId = QuestConfigData.QuestPhaseId
  return PlayerPhaseId >= PhaseId
end

function ActivityUtils.CheckIsQuestPhaseIdReached(ActivityID, QuestPhaseId)
  local CurrentPhaseId = EMCache:Get("CommonQuestsCurPhaseId", true)
  if CurrentPhaseId and QuestPhaseId <= CurrentPhaseId then
    return true
  end
  return false
end

function ActivityUtils.CheckIsCurrentTaskAllDone(PlayerPhaseId)
  local QuestIdValue, IsCurrentPhaseTaskAllDone, PlayerAvatar, IsShowRedDot = DataMgr.QuestPhaseId2QuestId[PlayerPhaseId], true, GWorld:GetAvatar(), false
  for _, v in ipairs(QuestIdValue) do
    local QuestConfigData = DataMgr.CommonQuestDetail[v]
    local QuestServerData = PlayerAvatar.StarterQuests[v]
    local CurQuestState = ActivityUtils.GetCurQuestState(QuestServerData, PlayerPhaseId)
    if IsCurrentPhaseTaskAllDone and CurQuestState ~= ActivityUtils.EnumPlayerTaskState.Completed then
      IsCurrentPhaseTaskAllDone = false
    end
    if not IsShowRedDot and CurQuestState == ActivityUtils.EnumPlayerTaskState.NotGetReward and QuestConfigData.QuestReward ~= nil then
      IsShowRedDot = true
    end
  end
  return IsCurrentPhaseTaskAllDone, IsShowRedDot
end

function ActivityUtils.OnGetTryOutActivityRewardBack(ActivityID, AllRewards)
  UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, AllRewards, false, nil, self, false)
  ActivityReddotHelper.TrySubReddotCount(ActivityUtils, ActivityID, "Red")
  EventManager:FireEvent(EventID.OnUpdateActivityEvent, "TryOutGetReward", ActivityID)
end

function ActivityUtils.RefreshActivityReddotNode()
  local AllActivityInfo, AllActivityTabIdxes = ActivityUtils.GetCurrentAllActivity()
  for i, ActivityInfo in ipairs(AllActivityInfo) do
    for index, ActivityID in ipairs(ActivityInfo) do
      ActivityReddotHelper.RefreshReddotNode(ActivityID)
    end
  end
end

function ActivityUtils.TryAddActivityReddotCommon(CacheKey, ActivityID)
  ActivityReddotHelper.TryAddReddotCount(nil, ActivityID, CacheKey)
end

function ActivityUtils.TrySubActivityReddotCommon(CacheKey, ActivityID)
  ActivityReddotHelper.TrySubReddotCount(nil, ActivityID, CacheKey)
end

function ActivityUtils.GetReddotCachInfoByKey(CacheKey, ActivityID)
  local ReddotName = ActivityReddotHelper.GetEventMainNodeName(ActivityID)
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(ReddotName)
  if CacheDetail then
    return CacheDetail[CacheKey]
  end
end

function ActivityUtils.CheckIsStarterQuestUnlock(QuestId, PlayerPhaseId)
  local QuestConfigData = DataMgr.StarterQuestDetail[QuestId]
  if nil == QuestConfigData then
    return
  end
  local PhaseId = QuestConfigData.QuestPhaseId
  return PlayerPhaseId >= PhaseId
end

function ActivityUtils.GetCurStarterQuestState(QuestServerData, PlayerPhaseId)
  if nil == QuestServerData then
    return ActivityUtils.EnumPlayerTaskState.NotStart
  elseif not QuestServerData:IsComplete() then
    return ActivityUtils.EnumPlayerTaskState.NotComplete
  elseif not ActivityUtils.CheckIsStarterQuestUnlock(QuestServerData:GetUniqueID(), PlayerPhaseId) then
    return ActivityUtils.EnumPlayerTaskState.NotUnlock
  elseif QuestServerData:CanRecvReward() then
    return ActivityUtils.EnumPlayerTaskState.NotGetReward
  else
    return ActivityUtils.EnumPlayerTaskState.Completed
  end
end

function ActivityUtils:CheckStarterQuestIsNeedShowReddot()
  local IsNeedShowRed, PlayerAvatar = false, GWorld:GetAvatar()
  local AllQuestServerData = PlayerAvatar.StarterQuests
  local CurrentPhaseId = EMCache:Get("StarterQuestsCurPhaseId", true)
  if nil == CurrentPhaseId then
    CurrentPhaseId = ActivityCommon.DefaultPhaseId
  end
  local QuestIdValue = DataMgr.StarterQuestPhaseMap[CurrentPhaseId] or {}
  for _, v in ipairs(QuestIdValue) do
    local QuestServerData = AllQuestServerData[v]
    local CurQuestState = ActivityUtils.GetCurStarterQuestState(QuestServerData, CurrentPhaseId)
    if CurQuestState == ActivityUtils.EnumPlayerTaskState.NotGetReward then
      IsNeedShowRed = true
      break
    end
  end
  return IsNeedShowRed
end

function ActivityUtils.ChangeStarterQuestReddot()
  local IsNeedShowRed = ActivityUtils.CheckStarterQuestIsNeedShowReddot()
  if not ReddotManager.GetTreeNode("StarterQuest") then
    ReddotManager.AddNode("StarterQuest")
  end
  if IsNeedShowRed then
    local reddot = ReddotManager.GetTreeNode("StarterQuest")
    if reddot.Count <= 0 then
      ReddotManager.IncreaseLeafNodeCount("StarterQuest", 1)
    end
  else
    ReddotManager.ClearLeafNodeCount("StarterQuest", false)
  end
end

function ActivityUtils.CheckStarterQuestAllDone()
  local PlayerAvatar = GWorld:GetAvatar()
  local CurrentPhaseId = EMCache:Get("StarterQuestsCurPhaseId", true)
  if nil == CurrentPhaseId then
    CurrentPhaseId = ActivityCommon.DefaultPhaseId
  end
  for _, QuestServerData in pairs(PlayerAvatar.StarterQuests) do
    local CurQuestState = ActivityUtils.GetCurStarterQuestState(QuestServerData, CurrentPhaseId)
    if CurQuestState ~= ActivityUtils.EnumPlayerTaskState.Completed then
      return false
    end
  end
  return true
end

function ActivityUtils.CheckIsCurrentStarterQuestAllDone(PlayerPhaseId)
  local QuestIdValue, PlayerAvatar = DataMgr.StarterQuestPhaseMap[PlayerPhaseId], GWorld:GetAvatar()
  for _, v in ipairs(QuestIdValue) do
    local QuestServerData = PlayerAvatar.StarterQuests[v]
    local CurQuestState = ActivityUtils.GetCurStarterQuestState(QuestServerData, PlayerPhaseId)
    if CurQuestState ~= ActivityUtils.EnumPlayerTaskState.Completed then
      return false
    end
  end
  return true
end

function ActivityUtils.CheckIsActivityLock(PageConfigData)
  local IsLock = false
  local PlayerAvatar = GWorld:GetAvatar()
  if PlayerAvatar and PageConfigData and PageConfigData.JumpUnlockCondition and not ConditionUtils.CheckCondition(PlayerAvatar, PageConfigData.JumpUnlockCondition) then
    IsLock = true
  end
  return IsLock
end

function ActivityUtils.OpenActivitySettlement(ActivityId, DungeonId, Params)
  local EventSettlementConfigData = DataMgr.EventSettlementPage[1]
  for Id, ConfigData in pairs(DataMgr.EventSettlementPage) do
    if ConfigData.EventId == ActivityId and ConfigData.DungeonId == DungeonId then
      EventSettlementConfigData = ConfigData
    end
  end
  local SettlementPage
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance) == CommonConst.CLIENT_DEVICE_TYPE.PC then
    SettlementPage = UIManager:CreateWidget(EventSettlementConfigData.PCBluePrint, true, 59)
  else
    SettlementPage = UIManager:CreateWidget(EventSettlementConfigData.MobileBluePrint or EventSettlementConfigData.PCBluePrint, true, 59)
  end
  if SettlementPage then
    SettlementPage:InitParams(Params)
  end
  return SettlementPage
end

function ActivityUtils.CheckIsPermanentEvent(ActivityId)
  local MainConfigInfo = DataMgr.EventMain[ActivityId]
  if not MainConfigInfo then
    return false
  end
  local bPermanentEvent = false
  local PermanenEventTime = MainConfigInfo.PermanenEventTime
  local EventEndTime = MainConfigInfo.EventEndTime
  local TimeUtils = require("Utils.TimeUtils")
  local NowTime = TimeUtils.NowTime()
  if not EventEndTime and PermanenEventTime and PermanenEventTime <= NowTime then
    bPermanentEvent = true
  end
  return bPermanentEvent
end

function ActivityUtils.RefreshLeftTime(TargetUI, TargetTimeUI, bCheckNextDayFiveStamp)
  if not TargetUI or not TargetTimeUI then
    return
  end
  local RemainActivityTimeDict, ActivityTimeCount = UIUtils.GetLeftTimeStrStyle2(TargetUI.ActivityEndTime)
  local IsActivityTimeOut = 0 == ActivityTimeCount
  local bActuallyEnd = false
  if TargetUI.IsComplete and bCheckNextDayFiveStamp then
    local NextDayFiveStamp = TimeUtils.TimestampNextClock(5)
    if TargetUI.ActivityEndTime == nil then
      TargetUI.ActivityEndTime = NextDayFiveStamp
    end
    local minStamp = math.min(NextDayFiveStamp, TargetUI.ActivityEndTime)
    RemainActivityTimeDict = UIUtils.GetLeftTimeStrStyle2(minStamp)
    ActivityUtils.SetLeftTimeView(TargetTimeUI, false, false, RemainActivityTimeDict, true)
    return
  end
  if IsActivityTimeOut and not TargetUI.RewardEndTime then
    if TargetTimeUI and not TargetUI.ActivityEndTime then
      TargetTimeUI:SetForeverTimeText(GText("UI_GameEvent_EventTimeRemain"))
    end
    ActivityUtils.SetLeftTimeView(TargetTimeUI, false, false, RemainActivityTimeDict)
    TargetUI:RemoveTimer("RefreshLeftTime")
    bActuallyEnd = true
  elseif IsActivityTimeOut and TargetUI.RewardEndTime then
    local RemainRewardTimeDict, RewardTimeCount = UIUtils.GetLeftTimeStrStyle2(TargetUI.RewardEndTime)
    ActivityUtils.SetLeftTimeView(TargetTimeUI, false, true, RemainRewardTimeDict)
    if 0 == RewardTimeCount then
      TargetUI:RemoveTimer("RefreshLeftTime")
      bActuallyEnd = true
    end
  else
    ActivityUtils.SetLeftTimeView(TargetTimeUI, false, false, RemainActivityTimeDict)
  end
  if bActuallyEnd and TargetUI.ParentWidget and TargetUI.ParentTabId == TargetUI.ParentWidget.CurTabId and TargetUI.ParentWidget.GenerateAllDataInfo then
    TargetUI.ParentWidget.NeedJumpToTabId = nil
    TargetUI.ParentWidget.CurActivityId = nil
    TargetUI.ParentWidget.NormalStateCurActivityId = nil
    TargetUI.ParentWidget.LimitStateCurActivityId = nil
    TargetUI.ParentWidget:GenerateAllDataInfo()
  end
end

function ActivityUtils.SetLeftTimeView(TargetTimeUI, IsHideTimeInfo, IsActivityTimeOut, TimeDictInfo, IsComplete)
  if IsComplete then
    TargetTimeUI:SetTimeText(GText("UI_Event_RemoveRemainTime"), TimeDictInfo)
    return
  end
  if IsHideTimeInfo then
    TargetTimeUI:SetForeverTimeText(GText("UI_GameEvent_EventTimeRemain"))
    return
  end
  if IsActivityTimeOut then
    TargetTimeUI:SetTimeText(GText("UI_GameEvent_RewardTimeRemain"), TimeDictInfo)
  else
    TargetTimeUI:SetTimeText(GText("UI_GameEvent_EventTimeRemain"), TimeDictInfo)
  end
end

return ActivityUtils
