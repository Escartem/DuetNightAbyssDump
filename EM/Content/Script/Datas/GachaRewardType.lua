local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("GachaRewardType", {
  Skin = {
    DungeonRewardSeq = 10,
    HighlightDisplay = true,
    RewardType = "Skin"
  },
  WeaponSkin = {
    DungeonRewardSeq = 9,
    HighlightDisplay = true,
    RewardType = "WeaponSkin"
  }
})
