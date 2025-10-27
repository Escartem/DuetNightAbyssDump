local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("CommunityList", {
  [1] = {
    CommunityId = 1,
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/SNS/T_Icon_Sns_JJJCN.T_Icon_Sns_JJJCN'",
    JobTips = "FollowCommunity_JJJ",
    JumpLink = "https://dnabbs.yingxiong.com",
    JumpTips = "UI_FollowCommunity",
    Reward = 107003,
    RewardMark = true
  },
  [2] = {
    CommunityId = 2,
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/SNS/T_Icon_Sns_Weixin.T_Icon_Sns_Weixin'",
    JobTips = "FollowCommunity_WeCom",
    JumpLink = "https://huke.163.com/wxUrlScheme?shareInfo=KGECZ-PzF_PfE59khJhhLpIbxMjDgC_HlhO6xgvMS-3CIvz3RfnPEA8mXZOsdobO2fAlxAWJG7jVJF5KN37kRj6L3C-al1ek6SVF9uwsgEqMfz19MzMPKdnU5Dz6URrr&type=drainage&appid=wxfe42d57febf7bf0d",
    JumpTips = "UI_JumpCommunity",
    Reward = 107004
  },
  [3] = {
    CommunityId = 3,
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/SNS/T_Icon_Sns_Douyin.T_Icon_Sns_Douyin'",
    JobTips = "FollowCommunity_Douyin",
    JumpLink = "https://v.douyin.com/O8ILZ72QUZM/ 8@3.com",
    JumpTips = "UI_JumpCommunity",
    Reward = 107004
  }
})
