local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ShopTabMain", {
  [110] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Shop_Recharge.T_Tab_Shop_Recharge'",
    MainName = "UI_SHOP_MAINTAB_PAY",
    MainTabId = 110
  },
  [120] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_ShopClothes.T_Tab_ShopClothes'",
    MainName = "UI_SHOP_MAINTAB_SKIN",
    MainTabId = 120,
    ReddotNode = "Shop_Skin"
  },
  [130] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Mod.T_Tab_Mod'",
    MainName = "UI_SHOP_MAINTAB_MOD",
    MainTabId = 130
  },
  [140] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Gacha.T_Tab_Gacha'",
    MainName = "UI_SHOP_MAINTAB_GACHA",
    MainTabId = 140,
    ReddotNode = "Shop_Gacha"
  },
  [150] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Item.T_Tab_Item'",
    MainName = "UI_SHOP_MAINTAB_ITEM",
    MainTabId = 150,
    ReddotNode = "Shop_Item"
  },
  [160] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Shop_PayGift.T_Tab_Shop_PayGift'",
    MainName = "UI_SHOP_MAINTAB_PACK",
    MainTabId = 160,
    ReddotNode = "Shop_Pack"
  },
  [170] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Shop_Banner.T_Tab_Shop_Banner'",
    MainName = "UI_SHOP_MAINTAB_BANNER",
    MainTabId = 170
  },
  [180] = {
    ConditionId = "SecretLetterShopTab",
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Shop_Walnut.T_Tab_Shop_Walnut'",
    MainName = "MAIN_UI_WALNUTBAG",
    MainTabId = 180,
    ReddotNode = "Shop_Walnut",
    UnlockHide = true
  },
  [200] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Shop_Complex.T_Tab_Shop_Complex'",
    MainName = "UI_SHOP_MAINTAB_COMPLEX",
    MainTabId = 200
  },
  [701] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_PurgatorioIsland.T_Tab_PurgatorioIsland'",
    MainName = "UI_SHOP_TAB_ExploreBadge_Prologue",
    MainTabId = 701
  },
  [702] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_IceLake.T_Tab_IceLake'",
    MainName = "UI_SHOP_TAB_ExploreBadge_Chapter01",
    MainTabId = 702
  },
  [703] = {
    ConditionId = "LonzaFortressShopTab",
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Fortress.T_Tab_Fortress'",
    MainName = "UI_SHOP_TAB_ExploreBadge_EXChapter01",
    MainTabId = 703,
    UnlockHide = true
  },
  [801] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Item.T_Tab_Item'",
    MainName = "UI_SHOP_MAINTAB_ITEM",
    MainTabId = 801
  },
  [10000] = {
    ConditionId = "Abyss",
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_ShopClothes.T_Tab_ShopClothes'",
    MainName = "Abyss_ExchangeStore",
    MainTabId = 10000
  },
  [10001] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_ShopClothes.T_Tab_ShopClothes'",
    MainName = "UI_SHOP_TAB_Fishing",
    MainTabId = 10001
  },
  [10002] = {
    ConditionId = "Rouge",
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_ShopClothes.T_Tab_ShopClothes'",
    MainName = "Rouge_ExchangeShop",
    MainTabId = 10002
  }
})
