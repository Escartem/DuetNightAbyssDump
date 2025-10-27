local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RougeBlessingShop", {
  [1] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Rouge_BlessingMainT.T_Tab_Rouge_BlessingMainT'",
    MainName = "UI_Rouge_Shop_SubTab_Blessing",
    MainTabId = 1,
    Type = "Blessing"
  }
})
