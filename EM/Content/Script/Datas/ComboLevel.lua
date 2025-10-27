local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ComboLevel", {
  [0] = {
    ComboCount = 0,
    ComboLevel = 0,
    ComboLevelText = "BATTLE_COMBO_0"
  },
  [1] = {
    ComboCount = 15,
    ComboLevel = 1,
    ComboLevelText = "BATTLE_COMBO_1"
  },
  [2] = {
    ComboCount = 40,
    ComboLevel = 2,
    ComboLevelText = "BATTLE_COMBO_2"
  },
  [3] = {
    ComboCount = 70,
    ComboLevel = 3,
    ComboLevelText = "BATTLE_COMBO_3"
  },
  [4] = {
    ComboCount = 120,
    ComboLevel = 4,
    ComboLevelText = "BATTLE_COMBO_4"
  }
})
