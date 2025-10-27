local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("EventConstant", {
  FeinaEventId = {
    ConstantName = "FeinaEventId",
    ConstantValue = 103010
  },
  FollowCommunityEvent = {
    ConstantName = "FollowCommunityEvent",
    ConstantValue = 103008
  },
  ZhiLiuEntrustEventID = {
    ConstantName = "ZhiLiuEntrustEventID",
    ConstantValue = 103005
  },
  ZhiLiuEntrustGrandReward = {
    ConstantName = "ZhiLiuEntrustGrandReward",
    ConstantValue = 110000
  },
  ZhiLiuEntrustGrandRewardView = {
    ConstantName = "ZhiLiuEntrustGrandRewardView",
    ConstantValue = 1030052
  },
  ZhiLiuEntrustRewardResource = {
    ConstantName = "ZhiLiuEntrustRewardResource",
    ConstantValue = 10100
  },
  ZhiLiuEntrustRewardResourceNum = {
    ConstantName = "ZhiLiuEntrustRewardResourceNum",
    ConstantValue = 1
  }
})
