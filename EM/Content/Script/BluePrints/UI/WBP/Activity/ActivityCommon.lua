require("UnLua")
local RewardBox = require("BluePrints.Client.CustomTypes.SimpleRewardBox")
local ActivityCommon = {}
ActivityCommon.MaxTryOutItemCount = 3
ActivityCommon.IsLoadAsync = true
ActivityCommon.DefaultPhaseId = 1001
ActivityCommon.MainUIName = "ActivityMain"
ActivityCommon.EventAllTypeId = {
  DailyLogin = 101,
  StarterQuests = 102,
  JumpToOtherPage = 103,
  CharTrial = 105,
  Zhiliu = 106,
  ConditionReward = 107,
  CommunityCheck = 109
}
ActivityCommon.NewReddotFrameEventTypes = {
  [ActivityCommon.EventAllTypeId.ConditionReward] = 1,
  [ActivityCommon.EventAllTypeId.CharTrial] = 1,
  [ActivityCommon.EventAllTypeId.CommunityCheck] = 1,
  [ActivityCommon.EventAllTypeId.StarterQuests] = 1,
  [ActivityCommon.EventAllTypeId.JumpToOtherPage] = 1
}
ActivityCommon.AllTitleName = {
  RougeTitle = "RougeTitle",
  TryOutTitle = "TryOutTitle",
  AbyssTitle = "AbyssTitle",
  ZhiliuTitle = "ZhiliuTitle",
  RechargeTitle = "RechargeTitle"
}
ActivityCommon.AllUpdateTag = {
  ActivityTab = "ActivityTab",
  BackToPageWithJump = "BackToPageWithJump"
}
ActivityCommon.EventId = {
  OnRefreshInNextDay = "OnRefreshInNextDay",
  OnRefreshWithActivityOpen = "OnRefreshWithActivityOpen",
  OnRefreshWithActivityClose = "OnRefreshWithActivityClose"
}
ActivityCommon.NeedRefreshInNextDay = {
  DailyLoginFirst = 101001,
  DailyLoginSecond = 101003,
  MidTermGoal = 103006
}
ActivityCommon.GlobalPakForbidTabId = {
  [105001] = 1
}

function ActivityCommon.GenerateAllRewardIds(RewardIds)
  local RewardType, RewardList = DataMgr.RewardType, {}
  for ItemType, _ in pairs(RewardType) do
    local Rewards = RewardIds[ItemType .. "s"]
    if Rewards then
      local RewardInfo = DataMgr[ItemType]
      for ItemId, ItemCount in pairs(Rewards) do
        local count = 0
        if type(ItemCount) == "table" then
          count = RewardBox:GetCount(ItemCount)
        end
        if type(ItemCount) == "number" then
          count = ItemCount
        end
        RewardList[ItemId] = {
          TableName = ItemType,
          ItemCount = count,
          Rarity = RewardInfo[ItemId].Rarity or RewardInfo[ItemId][ItemType .. "Rarity"]
        }
      end
    end
  end
  local RewardInfoList = {}
  for key, Value in pairs(RewardList) do
    table.insert(RewardInfoList, {ItemId = key, ItemInfo = Value})
  end
  table.sort(RewardInfoList, function(A, B)
    local RarityA = A.ItemInfo.Rarity or 1
    local RarityB = B.ItemInfo.Rarity or 1
    if RarityA > RarityB then
      return true
    elseif RarityA == RarityB then
      return A.ItemId < B.ItemId
    else
      return false
    end
  end)
  return RewardInfoList
end

return ActivityCommon
