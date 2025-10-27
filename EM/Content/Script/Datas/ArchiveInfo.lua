local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ArchiveInfo", {
  [1001] = {
    ArchiveStep = 3,
    ArchiveTitle = "ArchiveTitle_Char",
    ArchiveType = 1001,
    MajorType = 1,
    RewardId = 1001001,
    RewardTabIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Character.T_Tab_Character'"
  },
  [1002] = {
    ArchiveStep = 5,
    ArchiveTitle = "ArchiveTitle_Meele",
    ArchiveType = 1002,
    MajorType = 1,
    RewardId = 1002001,
    RewardTabIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_CloseIn_Weapons.T_Tab_CloseIn_Weapons'"
  },
  [1003] = {
    ArchiveStep = 5,
    ArchiveTitle = "ArchiveTitle_Ranged",
    ArchiveType = 1003,
    MajorType = 1,
    RewardId = 1003001,
    RewardTabIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_RangedWeapon.T_Tab_RangedWeapon'"
  },
  [1004] = {
    ArchiveStep = 20,
    ArchiveTitle = "ArchiveTitle_Resource",
    ArchiveType = 1004,
    MajorType = 2,
    RewardId = 1004001,
    RewardTabIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Item.T_Tab_Item'"
  },
  [1005] = {
    ArchiveStep = 10,
    ArchiveTitle = "ArchiveTitle_Read",
    ArchiveType = 1005,
    MajorType = 2,
    RewardId = 1005001,
    RewardTabIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Reading.T_Tab_Reading'"
  },
  [1006] = {
    ArchiveStep = 10,
    ArchiveTitle = "ArchiveTitle_Enemy",
    ArchiveType = 1006,
    MajorType = 2,
    RewardId = 1006001,
    RewardTabIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Monster.T_Tab_Monster'"
  }
})
