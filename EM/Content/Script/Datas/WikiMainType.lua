local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("WikiMainType", {
  [1] = {
    MainType = 1,
    MainTypeIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Faction.T_Tab_Faction",
    MainTypeText = "MainType_Faction"
  },
  [2] = {
    MainType = 2,
    MainTypeIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Character.T_Tab_Character",
    MainTypeText = "MainType_Character"
  },
  [3] = {
    MainType = 3,
    MainTypeIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Customs.T_Tab_Customs",
    MainTypeText = "MainType_Customs"
  },
  [4] = {
    MainType = 4,
    MainTypeIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Civilization.T_Tab_Civilization",
    MainTypeText = "MainType_Civilization"
  }
})
