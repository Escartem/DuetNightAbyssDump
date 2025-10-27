local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("WikiReward", {
  [10] = {RewardId = 1001000, RewardProgress = 10},
  [20] = {RewardId = 1001000, RewardProgress = 20},
  [30] = {RewardId = 1001000, RewardProgress = 30},
  [40] = {RewardId = 1001000, RewardProgress = 40},
  [50] = {RewardId = 1001000, RewardProgress = 50},
  [60] = {RewardId = 1001000, RewardProgress = 60},
  [70] = {RewardId = 1001000, RewardProgress = 70},
  [80] = {RewardId = 1001000, RewardProgress = 80}
})
