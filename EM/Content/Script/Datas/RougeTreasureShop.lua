local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RougeTreasureShop", {
  [1] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Rouge_TreasureMainT.T_Tab_Rouge_TreasureMainT'",
    MainName = "UI_Rouge_Shop_SubTab_Treasure",
    MainTabId = 1,
    Type = "Treasure"
  }
})
