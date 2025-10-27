local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RougeShopTabSub", {
  [1001] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Rouge_BlessingMainT.T_Tab_Rouge_BlessingMainT'",
    MainTabId = 1,
    SubName = "UI_Rouge_Shop_SubTab_Blessing",
    SubTabId = 1001,
    Type = "Blessing"
  },
  [1002] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Rouge_TreasureMainT.T_Tab_Rouge_TreasureMainT'",
    MainTabId = 1,
    SubName = "UI_Rouge_Shop_SubTab_Treasure",
    SubTabId = 1002,
    Type = "Treasure"
  }
})
