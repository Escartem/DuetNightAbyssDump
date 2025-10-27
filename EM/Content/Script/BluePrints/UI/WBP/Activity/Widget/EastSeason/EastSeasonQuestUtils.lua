require("UnLua")
local M = {}

function M:GetQuestPhaseIdByTabId(EventId, TabId)
  for _, phaseConfig in pairs(DataMgr.CommonQuestPhase) do
    if phaseConfig.Index == TabId and phaseConfig.EventId == EventId then
      return phaseConfig.QuestPhaseId
    end
  end
  return nil
end

function M:GetQuestPhaseInfo(EventId, QuestPhaseId)
  local Avatar = GWorld:GetAvatar()
  local TotalQuestCount = 0
  local CompletedQuestCount = 0
  if Avatar then
    local CommonQuestActivity = Avatar.CommonQuestActivity[EventId]
    local QuestIds = DataMgr.QuestPhaseId2QuestId[QuestPhaseId]
    for _, QuestId in pairs(QuestIds) do
      if CommonQuestActivity[QuestId] then
        if CommonQuestActivity[QuestId].Progress >= CommonQuestActivity[QuestId].Target then
          CompletedQuestCount = CompletedQuestCount + 1
        end
        TotalQuestCount = TotalQuestCount + 1
      end
    end
    return CompletedQuestCount, TotalQuestCount
  end
end

function M:IsQuestPhaseCanGetReward(EventId, QuestPhaseId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local CommonQuestActivity = Avatar.CommonQuestActivity[EventId]
    local QuestIds = DataMgr.QuestPhaseId2QuestId[QuestPhaseId]
    if nil == CommonQuestActivity or nil == QuestIds then
      return false
    end
    for _, QuestId in pairs(QuestIds) do
      if CommonQuestActivity[QuestId] and CommonQuestActivity[QuestId].Progress >= CommonQuestActivity[QuestId].Target and CommonQuestActivity[QuestId].RewardsGot == false then
        return true
      end
    end
    return false
  end
end

function M:GetQuestPhaseGetDiamond(EventId, QuestPhaseId)
  local Avatar = GWorld:GetAvatar()
  local GetDiamond = 0
  if Avatar then
    local CommonQuestActivity = Avatar.CommonQuestActivity[EventId]
    local QuestIds = DataMgr.QuestPhaseId2QuestId[QuestPhaseId]
    for _, QuestId in pairs(QuestIds) do
      if CommonQuestActivity[QuestId] and CommonQuestActivity[QuestId].RewardsGot then
        local RewardId = DataMgr.CommonQuestDetail[QuestId].QuestReward
        local RewardInfo = DataMgr.Reward[RewardId[1]]
        if RewardInfo then
          local Ids = RewardInfo.Id or {}
          local RewardCount = RewardInfo.Count or {}
          for i = 1, #Ids do
            local ItemId = Ids[i]
            if ItemId == CommonConst.Coins.Coin1 then
              GetDiamond = GetDiamond + RewardUtils:GetCount(RewardCount[i])
            end
          end
        end
      end
    end
  end
  return GetDiamond
end

function M:GetQuestPhaseCanGetDiamond(EventId, QuestPhaseId)
  local Avatar = GWorld:GetAvatar()
  local GetDiamond = 0
  if Avatar then
    local CommonQuestActivity = Avatar.CommonQuestActivity[EventId]
    local QuestIds = DataMgr.QuestPhaseId2QuestId[QuestPhaseId]
    for _, QuestId in pairs(QuestIds) do
      if CommonQuestActivity[QuestId] then
        local RewardId = DataMgr.CommonQuestDetail[QuestId].QuestReward
        local RewardInfo = DataMgr.Reward[RewardId[1]]
        if RewardInfo then
          local Ids = RewardInfo.Id or {}
          local RewardCount = RewardInfo.Count or {}
          for i = 1, #Ids do
            local ItemId = Ids[i]
            if ItemId == CommonConst.Coins.Coin1 then
              GetDiamond = GetDiamond + RewardUtils:GetCount(RewardCount[i])
            end
          end
        end
      end
    end
  end
  return GetDiamond
end

function M:IsQuestPhaseAllGetReward(EventId, QuestPhaseId)
  local allcount = self:GetQuestPhaseCanGetDiamond(EventId, QuestPhaseId)
  local getcount = self:GetQuestPhaseGetDiamond(EventId, QuestPhaseId)
  return allcount == getcount
end

return M
