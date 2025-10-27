local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ImpressionShopMainTab", {
  [1] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Impression/T_Impression_Benefit.T_Impression_Benefit",
    MainName = "UI_IMPRESSIONSHOP_SUBTAB_BENEFIT",
    MainTabId = 1
  },
  [2] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Impression/T_Impression_Morality.T_Impression_Morality",
    MainName = "UI_IMPRESSIONSHOP_SUBTAB_MORALITY",
    MainTabId = 2
  },
  [3] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Impression/T_Impression_Wisdom.T_Impression_Wisdom",
    MainName = "UI_IMPRESSIONSHOP_SUBTAB_WISDOM",
    MainTabId = 3
  },
  [4] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Impression/T_Impression_Empathy.T_Impression_Empathy",
    MainName = "UI_IMPRESSIONSHOP_SUBTAB_EMPATHY",
    MainTabId = 4
  },
  [5] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Impression/T_Impression_Chaos.T_Impression_Chaos",
    MainName = "UI_IMPRESSIONSHOP_SUBTAB_CHAOS",
    MainTabId = 5
  }
})
