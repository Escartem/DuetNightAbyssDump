local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MonsterCamp", {
  ["Mon.Gr"] = {
    MonCampIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Training_Infection.T_Tab_Training_Infection",
    MonCampName = "UI_DUNGEON_DES_TRAINING_20",
    MonCampTag = "Mon.Gr",
    Priority = 1
  },
  ["Mon.Jh"] = {
    MonCampIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Training_Church.T_Tab_Training_Church",
    MonCampName = "UI_DUNGEON_DES_TRAINING_21",
    MonCampTag = "Mon.Jh",
    Priority = 3
  },
  ["Mon.Jt"] = {
    MonCampIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Training_Empire.T_Tab_Training_Empire",
    MonCampName = "UI_DUNGEON_DES_TRAINING_19",
    MonCampTag = "Mon.Jt",
    Priority = 2
  },
  ["Mon.Sq"] = {
    MonCampIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Training_Alliance.T_Tab_Training_Alliance",
    MonCampName = "UI_DUNGEON_DES_TRAINING_22",
    MonCampTag = "Mon.Sq",
    Priority = 4
  }
})
