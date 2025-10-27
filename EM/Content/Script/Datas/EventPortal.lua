local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("EventPortal", {
  [103001] = {
    EventId = 103001,
    JumpUIId = 13,
    JumpUnlockCondition = 4170,
    JumpUnlockTips = "EventPortal_UnlockTips_103001",
    RewardPreview = 1030011
  },
  [103002] = {
    EventId = 103002,
    EventShop = 28,
    JumpUIId = 14,
    JumpUnlockCondition = 8002,
    JumpUnlockTips = "EventPortal_UnlockTips_Common",
    RewardPreview = 1030021,
    SubBPPath2 = "/Game/UI/WBP/Activity/Widget/Abyss/WBP_Activity_Abyss_Progress.WBP_Activity_Abyss_Progress"
  },
  [103003] = {
    EventId = 103003,
    JumpFinishCondition = 6009,
    JumpFinishDes = "UI_EventPortalFinish",
    JumpUIId = 37,
    JumpUnlockCondition = 100204,
    JumpUnlockTips = "EventPortal_UnlockTips_103003",
    RewardPreview = 50510
  },
  [103004] = {
    EventId = 103004,
    JumpFinishCondition = 6010,
    JumpFinishDes = "UI_EventPortalFinish",
    JumpUIId = 17,
    JumpUnlockCondition = 110105,
    JumpUnlockTips = "EventPortal_UnlockTips_103004",
    RewardPreview = 50518
  },
  [103005] = {
    EventId = 103005,
    JumpUIId = 36,
    JumpUnlockCondition = 8001,
    JumpUnlockTips = "EventPortal_UnlockTips_Common",
    RewardPreview = 1030051
  },
  [103006] = {
    EventId = 103006,
    IsUseTabJumpBtn = false,
    JumpUIId = 36,
    JumpUnlockTips = "EventPortal_UnlockTips_Common",
    RewardPreview = 1030071,
    SubBPPath2 = "/Game/UI/WBP/Activity/Widget/JJGame/WBP_Activity_JJGame_TaskEntryBtn.WBP_Activity_JJGame_TaskEntryBtn"
  },
  [103010] = {
    EventId = 103010,
    JumpUIId = 54,
    JumpUnlockTips = "EventPortal_UnlockTips_Common",
    RewardBPPath = "/Game/UI/WBP/Activity/Widget/FeinaEvent/WBP_Activity_FeinaEvent_LTReward_RText.WBP_Activity_FeinaEvent_LTReward_RText",
    RewardPreview = 1030062
  },
  [103012] = {
    EventId = 103012,
    JumpFinishCondition = 6019,
    JumpFinishDes = "UI_EventPortalFinish",
    JumpUIId = 13,
    JumpUnlockCondition = 4170,
    JumpUnlockTips = "EventPortal_UnlockTips_103012",
    RewardPreview = 103012
  },
  [103013] = {
    EventId = 103013,
    JumpFinishCondition = 6020,
    JumpFinishDes = "UI_EventPortalFinish",
    JumpUIId = 67,
    JumpUnlockCondition = 100202,
    JumpUnlockTips = "EventPortal_UnlockTips_103013",
    RewardPreview = 50577
  },
  [1030022] = {
    EventId = 1030022,
    EventShop = 28,
    JumpUIId = 14,
    JumpUnlockCondition = 8002,
    JumpUnlockTips = "EventPortal_UnlockTips_Common",
    RewardPreview = 1030022,
    SubBPPath2 = "/Game/UI/WBP/Activity/Widget/Abyss/WBP_Activity_Abyss_Progress.WBP_Activity_Abyss_Progress"
  }
})
