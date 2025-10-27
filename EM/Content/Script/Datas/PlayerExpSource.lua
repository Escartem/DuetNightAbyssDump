local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PlayerExpSource", {
  [1] = {
    ID = 1,
    Sequence = 100,
    SourceName = "PlayerLevel_CharProgress"
  },
  [2] = {
    ID = 2,
    Sequence = 90,
    SourceName = "PlayerLevel_WeaponProgress"
  },
  [3] = {
    ID = 3,
    Sequence = 80,
    SourceName = "PlayerLevel_PetProgress"
  },
  [4] = {
    ID = 4,
    Sequence = 70,
    SourceName = "PlayerLevel_ModProgress"
  },
  [5] = {
    ID = 5,
    Sequence = 60,
    SourceName = "PlayerLevel_OtherExpSource"
  }
})
