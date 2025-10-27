local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RougeBagTab", {
  [1] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Rouge_BlessingMainT.T_Tab_Rouge_BlessingMainT'",
    MainTabId = 1,
    MainTabName = "UI_RougeBag_Tab_Name_1",
    Type = "Blessing"
  },
  [2] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Rouge_TreasureMainT.T_Tab_Rouge_TreasureMainT'",
    MainTabId = 2,
    MainTabName = "UI_RougeBag_Tab_Name_2",
    Type = "Treasure"
  }
})
