local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ShopBannerTab", {
  [1] = {
    ActivityId = 0,
    BannerIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_Recommend_Saiqi01.T_Shop_Recommend_Saiqi01'",
    BgVideoPath = "FileMediaSource'/Game/Asset/UIVideo/SystemShow/ShopSkin/Shop_Skin_SaiqiCar01.Shop_Skin_SaiqiCar01'",
    Bp = "WBP_Shop_Recommend_AvatarSkin",
    EndTime = 1766394000,
    Id = 1,
    InterfaceJumpId = 5,
    PreviewId = {530101},
    PreviewType = "Skin",
    Sequence = 1,
    StartTime = 1735704000,
    SwitchTime = 10,
    Text1 = "UI_Skin_Name_530101"
  },
  [2] = {
    ActivityId = 105102011,
    BannerIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_Recommend_MonthCard.T_Shop_Recommend_MonthCard'",
    Bp = "WBP_Shop_Banner_MonthCard",
    Id = 2,
    IsMonthlyCardBanner = true,
    MarkText = "UI_Banner_Tab_SpSale_10",
    Sequence = 2,
    StartTime = 1735704000,
    SwitchTime = 10,
    Text1 = "UI_Banner_MonthlyCard"
  },
  [3] = {
    BannerIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_Recommend_NewPlayerGift.T_Shop_Recommend_NewPlayerGift'",
    Bp = "WBP_Shop_Recommend_Gift4_1",
    GoodsId = "com.hero.dna.Pay_Bundle1",
    Id = 3,
    ItemId = 160107,
    MarkText = "UI_Banner_Tab_SaleForNew",
    PreviewId = {
      20601,
      20305,
      10601,
      10302
    },
    PreviewType = "Weapon",
    Sequence = 3,
    StartTime = 1735704000,
    SwitchTime = 10,
    Text1 = "Pack_Name_Shop_Start_01"
  },
  [4] = {
    BannerIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_Recommend_WeaponSkin01.T_Shop_Recommend_WeaponSkin01'",
    Bp = "WBP_Shop_Recommend_WeaponSkin",
    Id = 4,
    ItemId = 120101,
    MarkText = "UI_Banner_Tab_WeaponSkinForNew",
    PreviewId = {3010202},
    PreviewType = "WeaponSkin",
    Sequence = 4,
    StartTime = 1735704000,
    SwitchTime = 10,
    Text1 = "UI_WeaponSkin_Name_3010202"
  }
})
