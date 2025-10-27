local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Shop", {
  AbyssShop = {
    MainTabId = {10000},
    ShopBgBPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/Widget/BG/WBP_Shop_BG_Abyss.WBP_Shop_BG_Abyss'",
    ShopName = "Abyss_ExchangeStore",
    ShopUIName = "ShopActivity",
    SystemName = "AbyssShop"
  },
  ExploreBadgeShop = {
    MainTabId = {
      701,
      702,
      703
    },
    ShopBgBPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/Widget/BG/WBP_Shop_BG_Area.WBP_Shop_BG_Area'",
    ShopName = "UI_SHOP_ExploreBadge",
    ShopUIName = "ShopActivity",
    SpawnNPCId = 920005,
    SystemName = "ExploreBadgeShop"
  },
  FishingShop = {
    MainTabId = {801},
    PlaySystemUIBGM = "event:/bgm/cbt03/0082_system_fishing",
    ShopBgBPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/Widget/BG/WBP_Shop_BG_Fishing.WBP_Shop_BG_Fishing'",
    ShopName = "UI_SHOP_Fishing",
    ShopUIName = "ShopActivity",
    SpawnNPCId = 900010,
    SystemName = "FishingShop"
  },
  Rouge = {
    MainTabId = {10002},
    ShopBgBPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/Widget/BG/WBP_Shop_BG_Rouge.WBP_Shop_BG_Rouge'",
    ShopName = "Rouge_ExchangeShop",
    ShopUIName = "ShopActivity",
    SystemName = "Rouge"
  },
  Shop = {
    MainTabId = {
      170,
      160,
      150,
      180,
      140,
      120,
      110,
      200
    },
    PlaySystemUIBGM = "event:/bgm/1_0/0083_system_shop_normal",
    ShopBgBPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/Widget/BG/WBP_Shop_BG_Normal.WBP_Shop_BG_Normal'",
    ShopName = "MAIN_UI_SHOP",
    ShopUIName = "ShopMain",
    SpawnNPCId = 900002,
    SystemName = "Shop"
  }
})
