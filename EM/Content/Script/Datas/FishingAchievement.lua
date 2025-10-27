local T = {}
T.RT_1 = {10301}
T.RT_2 = {10302}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("FishingAchievement", {
  [1001] = {
    Describe = "UI_Achievement_Fishing_Des_1001",
    FishingAchievementId = 1001,
    NoRepeatField = "ResourceId",
    RewardId = 7003,
    Target = 1,
    TargetId = T.RT_1
  },
  [1002] = {
    Describe = "UI_Achievement_Fishing_Des_1001",
    FishingAchievementId = 1002,
    NoRepeatField = "ResourceId",
    RewardId = 7003,
    Target = 8,
    TargetId = T.RT_1
  },
  [1003] = {
    Describe = "UI_Achievement_Fishing_Des_1001",
    FishingAchievementId = 1003,
    NoRepeatField = "ResourceId",
    RewardId = 7003,
    Target = 18,
    TargetId = T.RT_1
  },
  [1004] = {
    Describe = "UI_Achievement_Fishing_Des_1001",
    FishingAchievementId = 1004,
    NoRepeatField = "ResourceId",
    RewardId = 7003,
    Target = 28,
    TargetId = T.RT_1
  },
  [1006] = {
    Describe = "UI_Achievement_Fishing_Des_1001",
    FishingAchievementId = 1006,
    NoRepeatField = "ResourceId",
    RewardId = 7003,
    Target = 48,
    TargetId = T.RT_1
  },
  [2001] = {
    Describe = "UI_Achievement_Fishing_Des_2001",
    FishingAchievementId = 2001,
    NoRepeatField = "ResourceId",
    RewardId = 7003,
    Target = 1,
    TargetId = T.RT_2
  },
  [2002] = {
    Describe = "UI_Achievement_Fishing_Des_2001",
    FishingAchievementId = 2002,
    NoRepeatField = "ResourceId",
    RewardId = 7003,
    Target = 2,
    TargetId = T.RT_2
  },
  [2003] = {
    Describe = "UI_Achievement_Fishing_Des_2001",
    FishingAchievementId = 2003,
    NoRepeatField = "ResourceId",
    RewardId = 7003,
    Target = 3,
    TargetId = T.RT_2
  },
  [2004] = {
    Describe = "UI_Achievement_Fishing_Des_2001",
    FishingAchievementId = 2004,
    NoRepeatField = "ResourceId",
    RewardId = 7003,
    Target = 4,
    TargetId = T.RT_2
  },
  [2005] = {
    Describe = "UI_Achievement_Fishing_Des_2001",
    FishingAchievementId = 2005,
    NoRepeatField = "ResourceId",
    RewardId = 7003,
    Target = 5,
    TargetId = T.RT_2
  },
  [2006] = {
    Describe = "UI_Achievement_Fishing_Des_2001",
    FishingAchievementId = 2006,
    NoRepeatField = "ResourceId",
    RewardId = 7003,
    Target = 6,
    TargetId = T.RT_2
  },
  [3001] = {
    Describe = "UI_Achievement_Fishing_Des_3001",
    FishingAchievementId = 3001,
    NoRepeatField = "ResourceId",
    RewardId = 7003,
    Target = 10,
    TargetId = {10110}
  },
  [3002] = {
    Describe = "UI_Achievement_Fishing_Des_3002",
    FishingAchievementId = 3002,
    NoRepeatField = "ResourceId",
    RewardId = 7003,
    Target = 10,
    TargetId = {10111}
  },
  [3003] = {
    Describe = "UI_Achievement_Fishing_Des_3003",
    FishingAchievementId = 3003,
    NoRepeatField = "ResourceId",
    RewardId = 7003,
    Target = 10,
    TargetId = {10112}
  }
})
