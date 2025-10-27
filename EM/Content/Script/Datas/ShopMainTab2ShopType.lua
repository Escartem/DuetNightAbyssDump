local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ShopMainTab2ShopType", {
  [110] = "Shop",
  [120] = "Shop",
  [140] = "Shop",
  [150] = "Shop",
  [160] = "Shop",
  [170] = "Shop",
  [180] = "Shop",
  [200] = "Shop",
  [701] = "ExploreBadgeShop",
  [702] = "ExploreBadgeShop",
  [703] = "ExploreBadgeShop",
  [801] = "FishingShop",
  [10000] = "AbyssShop",
  [10002] = "Rouge"
})
