local T = {}
T.RT_1 = {"CharTitle"}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ConditionalRewardEvent", {
  [107001] = {
    EventId = 107001,
    EventReward = 107001,
    HideBPNode = T.RT_1,
    RewardClaimCondition = 6014
  },
  [107002] = {
    EventId = 107002,
    EventReward = 107002,
    HideBPNode = T.RT_1,
    RewardClaimCondition = 6015
  },
  [107003] = {
    EventId = 107003,
    EventReward = 107006,
    HideBPNode = T.RT_1,
    RewardClaimCondition = 6022,
    RewardUnlockTips = "UI_RewardUnlockTips_107003"
  }
})
