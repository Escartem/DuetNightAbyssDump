local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ComplexTab", {
  [1] = {
    BackgroundIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_JumpEntry_Impression_1172_2850.T_Shop_JumpEntry_Impression_1172_2850'",
    CoinId = {3001},
    EntrySort = 100,
    InterfaceJumpId = 58,
    RegionPointId = 2612,
    ShopEntryId = 1,
    ShopName = "UI_ImpressionShop_ShopName_1011"
  },
  [2] = {
    BackgroundIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_JumpEntry_Area_1172_2850.T_Shop_JumpEntry_Area_1172_2850'",
    CoinId = {29001, 29002},
    EntrySort = 99,
    InterfaceJumpId = 60,
    RegionPointId = 2613,
    ShopEntryId = 2,
    ShopName = "UI_SHOP_ExploreBadge"
  },
  [3] = {
    BackgroundIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_JumpEntry_Fishing_1172_2850.T_Shop_JumpEntry_Fishing_1172_2850'",
    CoinId = {210},
    EntrySort = 98,
    InterfaceJumpId = 59,
    RefreshTime = {DAY = 1},
    RegionPointId = 2614,
    ShopEntryId = 3,
    ShopName = "EntryTitle_406003"
  },
  [4] = {
    BackgroundIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_JumpEntry_Abyss_1172_2850.T_Shop_JumpEntry_Abyss_1172_2850'",
    CoinId = {214},
    EntrySort = 97,
    InterfaceJumpId = 28,
    RefreshTime = {WEEK = 1},
    ShopEntryId = 4,
    ShopName = "Abyss_ExchangeStore"
  },
  [5] = {
    BackgroundIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_JumpEntry_Rouge_1172_2850.T_Shop_JumpEntry_Rouge_1172_2850'",
    CoinId = {215},
    EntrySort = 96,
    InterfaceJumpId = 55,
    RefreshTime = {WEEK = 8},
    ShopEntryId = 5,
    ShopName = "UI_RougeExchangeShop_Title"
  }
})
