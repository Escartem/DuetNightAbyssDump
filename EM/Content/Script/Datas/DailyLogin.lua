local T = {}
T.RT_1 = {
  1010012,
  1010012,
  1010013,
  1010012,
  1010012,
  1010012,
  1010014
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("DailyLogin", {
  [101001] = {
    EventId = 101001,
    EventReward = T.RT_1,
    LoginDuration = 7,
    RewardBannerBP = "/Game/UI/WBP/Activity/Widget/SevenDay/Saiqi/WBP_Activity_SevenDayItems.WBP_Activity_SevenDayItems"
  },
  [101003] = {
    EventId = 101003,
    EventReward = T.RT_1,
    LoginDuration = 7,
    RewardBannerBP = "/Game/UI/WBP/Activity/Widget/SevenDay/Baiheng/WBP_Activity_SevenDayItems.WBP_Activity_SevenDayItems"
  }
})
