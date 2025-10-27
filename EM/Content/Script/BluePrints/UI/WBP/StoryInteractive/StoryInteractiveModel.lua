local M = Class("BluePrints.Common.MVC.Model")
local FTalkTriggerComponent = require("BluePrints.Story.Talk.Component.TalkTriggerComponent")

function M:Init()
  self.Super.Init(self)
end

function M:Destory()
  self.Super.Destory(self)
end

local function GetPriority(QuestChainId, DynQuestId, Avatar)
  local QusetData = DataMgr.QuestChain[QuestChainId]
  local bQuestInTracking = Avatar and Avatar.TrackingQuestChainId == QuestChainId
  if bQuestInTracking then
    return math.maxinteger
  end
  if DynQuestId and 0 ~= DynQuestId then
    DynQuestId = math.maxinteger - 1
  end
  if QusetData and QusetData.QuestChainType then
    local QusetPriorityData = DataMgr.QuestTypePriority[QusetData.QuestChainType]
    return QusetPriorityData.TypePriority or 0
  end
  return 0
end

local function GetQuestName(QuestChainId, SpecialQuestId, DynQuestId)
  local ShowName
  if 0 == QuestChainId then
    QuestChainId = nil
  end
  if string.isempty(ShowName) then
    local Quest = DataMgr.QuestChain[QuestChainId]
    if not QuestChainId then
      local SpecialQuest = DataMgr.SpecialQuestConfig[SpecialQuestId]
      QuestChainId = SpecialQuest and SpecialQuest.QuestChainId
      Quest = DataMgr.QuestChain[SpecialQuest and SpecialQuest.QuestChainId]
    end
    ShowName = Quest and Quest.QuestChainName
  end
  if string.isempty(ShowName) then
    local DynaQuest = DataMgr.DynQuest[DynQuestId]
    if DynaQuest and DynaQuest.DynName then
      ShowName = DynaQuest.DynName
    end
  end
  return ShowName
end

local function GetQuestInteractiveName(InteractiveInfo)
  local QuestChainId = InteractiveInfo.QuestChainId
  if 0 == QuestChainId then
    QuestChainId = nil
  end
  local ShowName = InteractiveInfo.NpcNodeInteractiveName
  if string.isempty(ShowName) then
    ShowName = GetQuestName(InteractiveInfo.QuestChainId, InteractiveInfo.SpecialQuestId, InteractiveInfo.DynQuestId)
  end
  return ShowName
end

local function MakeInteractiveItemFromTalkNode(Index, InteractiveInfo, Avatar)
  return {
    Type = "TalkNode",
    QuestChainId = InteractiveInfo.QuestChainId,
    SpecialQuestId = InteractiveInfo.SpecialQuestId,
    DynQuestId = InteractiveInfo.DynQuestId,
    BindId = Index,
    GuideUIEnable = InteractiveInfo.GuideUIEnable,
    NpcNodeInteractiveName = GetQuestInteractiveName(InteractiveInfo),
    Priority = GetPriority(InteractiveInfo.QuestChainId, InteractiveInfo.DynQuestId, Avatar)
  }
end

local function MakeInteractiveItemFromTalkTrigger(TalkTriggerId, Avatar)
  local Name
  local NameData = DataMgr.TalkTriggerName[TalkTriggerId]
  if NameData and NameData.TextMapId then
    Name = NameData.TextMapId
  end
  local WaitQuestDetail = GWorld.StoryMgr:TryGetWaitTalkCompletedQuest(TalkTriggerId)
  local WaitQuestChainId = WaitQuestDetail and WaitQuestDetail.QuestChainId
  local WaitSpecialQuestId = WaitQuestDetail and WaitQuestDetail.SpecialQuestId
  local GuideUIEnable = WaitQuestDetail and WaitQuestDetail.ShowGuide
  local DynQuestId = WaitQuestDetail and WaitQuestDetail.DynQuestId
  local TalkTriggerInfo = DataMgr.TalkTrigger[TalkTriggerId]
  if string.isempty(Name) then
    Name = GetQuestName(WaitQuestChainId, WaitSpecialQuestId, DynQuestId)
  end
  return {
    Type = "TalkTrigger",
    QuestChainId = WaitQuestChainId,
    SpecialQuestId = WaitSpecialQuestId,
    DynQuestId = DynQuestId,
    BindId = Index,
    NpcNodeInteractiveName = Name,
    TalkTriggerId = TalkTriggerId,
    Priority = GetPriority(WaitQuestChainId, DynQuestId, Avatar),
    GuideUIEnable = GuideUIEnable,
    bForbidden = Avatar and Avatar.InSpecialQuest and TalkTriggerInfo.Type ~= nil,
    ForbiddenMsg = "QUEST_INSPECIALQUEST_MSG"
  }
end

function M:GetNpcTalkInteractives(NpcId)
  local Result = {}
  local InteractiveInfos = self:GetNpcStorylineInteractives(NpcId)
  local Avatar = self:GetAvatar()
  if InteractiveInfos then
    for Index, Detail in pairs(InteractiveInfos) do
      table.insert(Result, MakeInteractiveItemFromTalkNode(Index, Detail, Avatar))
    end
  end
  local TalkTriggers = self:GetNpcTalkTriggers(NpcId)
  local Avatar = self:GetAvatar()
  if TalkTriggers then
    for _, TalkTriggerId in pairs(TalkTriggers) do
      table.insert(Result, MakeInteractiveItemFromTalkTrigger(TalkTriggerId, Avatar))
    end
  end
  table.sort(Result, function(Left, Right)
    if Left.Priority == Right.Priority then
      return (Left.QuestChainId or 0) < (Right.QuestChainId or 0)
    end
    return Left.Priority > Right.Priority
  end)
  return Result
end

function M:GetNpcTalkTriggers(NpcId)
  local NpcData = DataMgr.Npc[NpcId]
  if not NpcData then
    return
  end
  local TalkTriggerIds = NpcData.RelatedTalks
  if not TalkTriggerIds then
    return
  end
  local Result = {}
  for _, TriggerId in ipairs(TalkTriggerIds) do
    local TalkTriggerInfo = DataMgr.TalkTrigger[TriggerId]
    if FTalkTriggerComponent:CanTrigger(TalkTriggerInfo) then
      table.insert(Result, TriggerId)
    end
  end
  return Result
end

function M:GetNpcStorylineInteractives(NpcId)
  local Details = GWorld.StoryMgr:GetNPCInteractiveTalkDetails(NpcId)
  return Details
end

local function SimpleTableCount(Table)
  local Count = 0
  if not Table then
    return Count
  end
  local Index, Elem = next(Table)
  if not Index then
    return Count
  end
  Count = Count + 1
  if not next(Table, Index) then
    return Count
  end
  Count = Count + 1
  return Count
end

function M:HasMultiInteractive(NpcId)
  local InteractiveInfos = self:GetNpcStorylineInteractives(NpcId)
  local Count = 0
  Count = Count + SimpleTableCount(InteractiveInfos)
  if Count > 1 then
    return true
  end
  local TalkTriggers = self:GetNpcTalkTriggers(NpcId)
  Count = Count + SimpleTableCount(TalkTriggers)
  if Count > 1 then
    return true
  end
  return false
end

function M:HasAnyInteractive(NpcId)
  local InteractiveInfos = self:GetNpcStorylineInteractives(NpcId)
  local Count = 0
  Count = Count + SimpleTableCount(InteractiveInfos)
  if Count > 0 then
    return true
  end
  local TalkTriggers = self:GetNpcTalkTriggers(NpcId)
  Count = Count + SimpleTableCount(TalkTriggers)
  if Count > 0 then
    return true
  end
  return false
end

function M:GetInteractiveName(NpcId)
  local NpcData = DataMgr.Npc[NpcId]
  if not NpcData then
    return
  end
  local Name = NpcData.UnitName
  local InteractiveInfos = self:GetNpcStorylineInteractives(NpcId)
  local Count = SimpleTableCount(InteractiveInfos)
  if Count > 1 then
    return Name
  end
  local TalkTriggers = self:GetNpcTalkTriggers(NpcId)
  local TalkTriggerCount = 0
  TalkTriggerCount = TalkTriggerCount + SimpleTableCount(TalkTriggers)
  if Count + TalkTriggerCount > 1 then
    return Name
  end
  if TalkTriggerCount > 0 then
    local NameData = DataMgr.TalkTriggerName[TalkTriggers[1]]
    if NameData and NameData.TextMapId then
      Name = NameData.TextMapId
    end
  end
  if Count > 0 then
    local Index, Detail = next(InteractiveInfos)
    local ShowName = Detail.NpcNodeInteractiveName
    if not string.isempty(ShowName) then
      Name = ShowName
    end
  end
  return Name
end

function M:GetNowInteractiveQuestChainId(NpcId)
  local InteractiveItems = self:GetNpcTalkInteractives(NpcId)
  if #InteractiveItems > 0 then
    local InteractiveItem = InteractiveItems[1]
    if InteractiveItem.GuideUIEnable then
      return InteractiveItems[1].QuestChainId
    end
  end
  return nil
end

function M:GetNowInteractiveSpecialQuestId(NpcId)
  local InteractiveItems = self:GetNpcTalkInteractives(NpcId)
  if #InteractiveItems > 0 then
    local InteractiveItem = InteractiveItems[1]
    if InteractiveItem.GuideUIEnable then
      return InteractiveItems[1].SpecialQuestId
    end
  end
  return nil
end

function M:IsForbidBySpecialQuest(NpcId)
  if not self:HasAnyInteractive(NpcId) then
    return false
  end
  if self:HasMultiInteractive(NpcId) then
    return false
  end
  local TalkTriggers = self:GetNpcTalkTriggers(NpcId)
  if SimpleTableCount(TalkTriggers) <= 0 then
    return false
  end
  local TalkTriggerId = TalkTriggers[1]
  local TalkTriggerInfo = DataMgr.TalkTrigger[TalkTriggerId]
  if TalkTriggerInfo then
    return TalkTriggerInfo.Type ~= nil
  end
  return false
end

return M
