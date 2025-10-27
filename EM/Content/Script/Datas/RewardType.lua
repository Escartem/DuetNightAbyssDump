local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RewardType", {
  Char = {
    DungeonRewardSeq = 90,
    OperationGM = true,
    Remark = "\232\167\146\232\137\178",
    RewardType = "Char"
  },
  CharAccessory = {
    DungeonRewardSeq = 70,
    DungeonRewardType = true,
    OperationGM = true,
    Remark = "\232\167\146\232\137\178\233\133\141\233\165\176",
    RewardType = "CharAccessory",
    UniqueType = true
  },
  Draft = {
    DungeonRewardSeq = 41,
    DungeonRewardType = true,
    OperationGM = true,
    Remark = "\233\147\184\233\128\160\229\155\190\231\186\184",
    RewardType = "Draft"
  },
  Drop = {RewardType = "Drop"},
  HeadFrame = {
    DungeonRewardSeq = 53,
    OperationGM = true,
    Remark = "\229\164\180\229\131\143\230\161\134",
    RewardType = "HeadFrame",
    UniqueType = true
  },
  HeadSculpture = {
    DungeonRewardSeq = 60,
    OperationGM = true,
    Remark = "\229\164\180\229\131\143",
    RewardType = "HeadSculpture",
    UniqueType = true
  },
  Mod = {
    DungeonRewardSeq = 50,
    DungeonRewardType = true,
    OperationGM = true,
    Remark = "\233\173\148\228\185\139\230\165\148",
    RewardType = "Mod"
  },
  Pet = {
    DungeonRewardSeq = 51,
    DungeonRewardType = true,
    OperationGM = true,
    Remark = "\229\174\160\231\137\169",
    RewardType = "Pet"
  },
  Resource = {
    DungeonRewardSeq = 1,
    DungeonRewardType = true,
    OperationGM = true,
    Remark = "\232\181\132\230\186\144",
    RewardType = "Resource"
  },
  Skin = {
    DungeonRewardSeq = 72,
    OperationGM = true,
    Remark = "\232\167\146\232\137\178\231\154\174\232\130\164",
    RewardType = "Skin",
    UniqueType = true
  },
  Title = {
    DungeonRewardSeq = 62,
    OperationGM = true,
    Remark = "\231\167\176\229\143\183",
    RewardType = "Title",
    UniqueType = true
  },
  TitleFrame = {
    DungeonRewardSeq = 63,
    OperationGM = true,
    Remark = "\231\167\176\229\143\183\230\161\134",
    RewardType = "TitleFrame",
    UniqueType = true
  },
  Walnut = {
    DungeonRewardSeq = 40,
    DungeonRewardType = true,
    OperationGM = true,
    Remark = "\229\175\134\229\135\189",
    RewardType = "Walnut"
  },
  Weapon = {
    DungeonRewardSeq = 80,
    DungeonRewardType = true,
    OperationGM = true,
    Remark = "\230\173\166\229\153\168",
    RewardType = "Weapon"
  },
  WeaponAccessory = {
    DungeonRewardSeq = 61,
    OperationGM = true,
    Remark = "\230\173\166\229\153\168\233\133\141\233\165\176",
    RewardType = "WeaponAccessory",
    UniqueType = true
  },
  WeaponSkin = {
    DungeonRewardSeq = 71,
    OperationGM = true,
    Remark = "\230\173\166\229\153\168\231\154\174\232\130\164",
    RewardType = "WeaponSkin",
    UniqueType = true
  }
})
