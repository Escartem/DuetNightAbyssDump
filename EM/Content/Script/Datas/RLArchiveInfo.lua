local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RLArchiveInfo", {
  [100001] = {
    RLArchiveStep = 10,
    RLArchiveTitle = "UI_RLArchiveTitle_Treasure",
    RLArchiveType = 100001,
    RewardId = 10000101,
    RewardTabIconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_RougeArchive_03"
  },
  [100002] = {
    RLArchiveStep = 20,
    RLArchiveTitle = "UI_RLArchiveTitle_Blessing",
    RLArchiveType = 100002,
    RewardId = 10000202,
    RewardTabIconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_RougeArchive_04"
  },
  [100003] = {
    RLArchiveStep = 3,
    RLArchiveTitle = "UI_RLArchiveTitle_Event",
    RLArchiveType = 100003,
    RewardId = 10000303,
    RewardTabIconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_RougeArchive_02"
  },
  [100004] = {
    RLArchiveStep = 5,
    RLArchiveTitle = "UI_RLArchiveTitle_Story",
    RLArchiveType = 100004,
    RewardId = 10000404,
    RewardTabIconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_RougeArchive_01"
  }
})
