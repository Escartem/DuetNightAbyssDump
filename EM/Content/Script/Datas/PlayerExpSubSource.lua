local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PlayerExpSubSource", {
  [1] = {
    ID = 1,
    Key = "Char",
    Sequence = 100,
    Source = 1,
    SubSourceName = "PlayerLevel_FirstObtain_Char"
  },
  [2] = {
    ID = 2,
    Key = "CharBreak",
    Sequence = 90,
    Source = 1,
    SubSourceName = "PlayerLevel_CharBreak"
  },
  [3] = {
    ID = 3,
    Key = "CharCardLevelUp",
    Sequence = 80,
    Source = 1,
    SubSourceName = "PlayerLevel_CharIntron"
  },
  [4] = {
    ID = 4,
    Key = "Weapon",
    Sequence = 100,
    Source = 2,
    SubSourceName = "PlayerLevel_FirstObtain_Weapon"
  },
  [5] = {
    ID = 5,
    Key = "WeaponBreak",
    Sequence = 90,
    Source = 2,
    SubSourceName = "PlayerLevel_WeaponBreak"
  },
  [6] = {
    ID = 6,
    Key = "WeaponCardLevel",
    Sequence = 80,
    Source = 2,
    SubSourceName = "PlayerLevel_WeaponSmelt"
  },
  [7] = {
    ID = 7,
    Key = "Pet",
    Sequence = 100,
    Source = 3,
    SubSourceName = "PlayerLevel_FirstObtain_Pet"
  },
  [8] = {
    ID = 8,
    Key = "PetBreak",
    Sequence = 90,
    Source = 3,
    SubSourceName = "PlayerLevel_PetBreak"
  },
  [9] = {
    ID = 9,
    Key = "Mod",
    Sequence = 100,
    Source = 4,
    SubSourceName = "PlayerLevel_FirstObtain_Mod"
  },
  [10] = {
    ID = 10,
    Key = "Quest",
    Sequence = 100,
    Source = 5,
    SubSourceName = "PlayerLevel_Quests"
  },
  [11] = {
    ID = 11,
    Key = "Daily",
    Sequence = 90,
    Source = 5,
    SubSourceName = "PlayerLevel_DailyGoal"
  }
})
