local T = {}
T.RT_1 = {215}
T.RT_2 = {99, 100}
T.RT_3 = {99}
T.RT_4 = {211}
T.RT_5 = {210, 101}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ShopTabSub", {
  [1101] = {
    MainTabId = 110,
    SubName = "UI_SHOP_MAINTAB_PAY",
    SubTabId = 1101,
    TabCoin = T.RT_2,
    TabType = "Pay"
  },
  [1201] = {
    MainTabId = 120,
    ReddotNode = "Shop_Skin_Suit",
    SubName = "UI_SHOP_SUBTAB_SKIN",
    SubTabId = 1201,
    TabCoin = T.RT_2,
    TabType = "Skin"
  },
  [1202] = {
    MainTabId = 120,
    ReddotNode = "Shop_Skin_Head",
    SubName = "UI_SHOP_MAINTAB_ACCESSORY_Head",
    SubTabId = 1202,
    TabCoin = T.RT_2,
    TabType = "Skin"
  },
  [1203] = {
    MainTabId = 120,
    ReddotNode = "Shop_Skin_Face",
    SubName = "UI_SHOP_MAINTAB_ACCESSORY_Face",
    SubTabId = 1203,
    TabCoin = T.RT_2,
    TabType = "Skin"
  },
  [1204] = {
    MainTabId = 120,
    ReddotNode = "Shop_Skin_Waist",
    SubName = "UI_SHOP_MAINTAB_ACCESSORY_Waist",
    SubTabId = 1204,
    TabCoin = T.RT_2,
    TabType = "Skin"
  },
  [1205] = {
    MainTabId = 120,
    ReddotNode = "Shop_Skin_Back",
    SubName = "UI_SHOP_MAINTAB_ACCESSORY_Back",
    SubTabId = 1205,
    TabCoin = T.RT_2,
    TabType = "Skin"
  },
  [1401] = {
    MainTabId = 140,
    ReddotNode = "Shop_Gacha_Higth",
    SubName = "UI_SHOP_SUBTAB_NAME_SPPrism",
    SubTabId = 1401,
    TabCoin = {111, 110},
    TabType = "Normal"
  },
  [1402] = {
    MainTabId = 140,
    ReddotNode = "Shop_Gacha_Low",
    SubName = "UI_SHOP_SUBTAB_NAME_Prism",
    SubTabId = 1402,
    TabCoin = {110},
    TabType = "Normal"
  },
  [1500] = {
    MainTabId = 150,
    ReddotNode = "Shop_Item_Yueshijingpei",
    SubName = "UI_SHOP_SUBTAB_NAME_YUESHIJINGPEI",
    SubTabId = 1500,
    TabCoin = T.RT_3,
    TabType = "Normal"
  },
  [1501] = {
    MainTabId = 150,
    ReddotNode = "Shop_Item_Yueshi",
    SubName = "UI_SHOP_SUBTAB_NAME_YUESHITAB",
    SubTabId = 1501,
    TabCoin = {100},
    TabType = "Normal"
  },
  [1502] = {
    MainTabId = 150,
    ReddotNode = "Shop_Item_CharPiece",
    SubName = "UI_SHOP_SUBTAB_NAME_CHARPIECE",
    SubTabId = 1502,
    TabCoin = T.RT_3,
    TabType = "Normal"
  },
  [1503] = {
    MainTabId = 150,
    ReddotNode = "Shop_Item_Weapon",
    SubName = "UI_SHOP_SUBTAB_NAME_WEAPON",
    SubTabId = 1503,
    TabCoin = T.RT_3,
    TabType = "Normal"
  },
  [1601] = {
    MainTabId = 160,
    ReddotNode = "Shop_Pack_Limit",
    SubName = "UI_SHOP_MAINTAB_PACK_LIMIT",
    SubTabId = 1601,
    TabCoin = T.RT_2,
    TabType = "Pack"
  },
  [1604] = {
    MainTabId = 160,
    ReddotNode = "Shop_Pack_Month",
    SubName = "UI_SHOP_MAINTAB_PACK_MONTH",
    SubTabId = 1604,
    TabCoin = T.RT_2,
    TabType = "Pack"
  },
  [1605] = {
    MainTabId = 160,
    ReddotNode = "Shop_Pack_Week",
    SubName = "UI_SHOP_MAINTAB_PACK_WEEK",
    SubTabId = 1605,
    TabCoin = T.RT_2,
    TabType = "Pack"
  },
  [1606] = {
    MainTabId = 160,
    ReddotNode = "Shop_Pack_Item",
    SubName = "UI_SHOP_MAINTAB_PACK_ITEM",
    SubTabId = 1606,
    TabCoin = T.RT_2,
    TabType = "Pack"
  },
  [1701] = {
    MainTabId = 170,
    SubName = "UI_SHOP_MAINTAB_BANNER",
    SubTabId = 1701,
    TabCoin = T.RT_2,
    TabType = "Banner"
  },
  [1801] = {
    ConditionId = "SecretLetterShopTab",
    MainTabId = 180,
    ReddotNode = "Shop_Walnut_1",
    SubName = "UI_Armory_Char",
    SubTabId = 1801,
    TabCoin = T.RT_4,
    TabType = "Normal"
  },
  [1802] = {
    ConditionId = "SecretLetterShopTab",
    MainTabId = 180,
    ReddotNode = "Shop_Walnut_2",
    SubName = "UI_SHOP_SUBTAB_NAME_WEAPON",
    SubTabId = 1802,
    TabCoin = T.RT_4,
    TabType = "Normal"
  },
  [1803] = {
    ConditionId = "SecretLetterShopTab",
    MainTabId = 180,
    ReddotNode = "Shop_Walnut_3",
    SubName = "UI_Armory_Mod",
    SubTabId = 1803,
    TabCoin = T.RT_4,
    TabType = "Normal"
  },
  [2001] = {
    MainTabId = 200,
    SubName = "UI_SHOP_MAINTAB_COMPLEX",
    SubTabId = 2001,
    TabCoin = T.RT_2,
    TabType = "Complex"
  },
  [7010] = {
    MainTabId = 701,
    SubName = "UI_SHOP_TAB_ExploreBadge_Prologue",
    SubTabId = 7010,
    TabCoin = {29001},
    TabType = "Normal"
  },
  [7020] = {
    MainTabId = 702,
    SubName = "UI_SHOP_TAB_ExploreBadge_Chapter01",
    SubTabId = 7020,
    TabCoin = {29002},
    TabType = "Normal"
  },
  [7030] = {
    ConditionId = "LonzaFortressShopTab",
    MainTabId = 703,
    SubName = "UI_SHOP_TAB_ExploreBadge_EXChapter01",
    SubTabId = 7030,
    TabCoin = {29003},
    TabType = "Normal",
    UnlockHide = true
  },
  [8010] = {
    MainTabId = 801,
    SubName = "UI_SHOP_SUBTAB_NAME_FISHING",
    SubTabId = 8010,
    TabCoin = T.RT_5,
    TabType = "Normal"
  },
  [8011] = {
    MainTabId = 801,
    SubName = "UI_SHOP_MAINTAB_ITEM",
    SubTabId = 8011,
    TabCoin = T.RT_5,
    TabType = "Normal"
  },
  [100001] = {
    MainTabId = 10000,
    SubName = "Abyss_ExchangeStore",
    SubTabId = 100001,
    TabCoin = {214},
    TabType = "Normal"
  },
  [100011] = {
    MainTabId = 10001,
    SubName = "UI_SHOP_TAB_Fishing",
    SubTabId = 100011,
    TabCoin = {6000001},
    TabType = "Normal"
  },
  [100021] = {
    MainTabId = 10002,
    SubName = "UI_SHOP_ROGUE_ITEM",
    SubTabId = 100021,
    TabCoin = T.RT_1,
    TabType = "Normal"
  },
  [100022] = {
    MainTabId = 10002,
    SubName = "UI_SHOP_MOD_MELEEUWEAPON",
    SubTabId = 100022,
    TabCoin = T.RT_1,
    TabType = "Normal"
  },
  [100023] = {
    MainTabId = 10002,
    SubName = "UI_SHOP_MOD_RANGEUWEAPON",
    SubTabId = 100023,
    TabCoin = T.RT_1,
    TabType = "Normal"
  }
})
