local T = {}
T.RT_1 = {-3172, -5484}
T.RT_2 = {101107}
T.RT_3 = {
  101701,
  101702,
  101703
}
T.RT_4 = {101108}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RegionPoint", {
  [2001] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Homebase.T_Gp_Homebase",
    Id = 2001,
    ManualItemId = 1199997,
    Name = "UI_SUBREGION_NAME_210101",
    Pos = {-5221, 6000},
    SubRegion = 101101,
    TargetSubRegion = {210101},
    TelepointId = 1011,
    TeleportPointPos = 15,
    TeleportSubRegion = 101101,
    UnlockConditionId = 311
  },
  [2002] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Tavern.T_Gp_Tavern",
    Id = 2002,
    ManualItemId = 1199999,
    Name = "UI_SUBREGION_NAME_101107",
    Pos = T.RT_1,
    SubRegion = 101101,
    TargetSubRegion = T.RT_2,
    TelepointId = 1011,
    TeleportPointPos = 16,
    TeleportSubRegion = 101101,
    UnlockConditionId = 31
  },
  [2003] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Sanatorium.T_Gp_Sanatorium",
    Id = 2003,
    ManualItemId = 1199996,
    Name = "UI_SUBREGION_NAME_101106",
    Pos = {-2360, 13561},
    SubRegion = 101101,
    TargetSubRegion = {101106},
    TelepointId = 1012,
    TeleportPointPos = 17,
    TeleportSubRegion = 101101,
    UnlockConditionId = 310
  },
  [2004] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_OutsidersHome.T_Gp_OutsidersHome",
    Id = 2004,
    ManualItemId = 1199998,
    Name = "UI_SUBREGION_NAME_101105",
    Pos = {-1768, -12190},
    SubRegion = 101101,
    TargetSubRegion = {101105},
    TelepointId = 1011,
    TeleportPointPos = 18,
    TeleportSubRegion = 101101,
    UnlockConditionId = 313
  },
  [2005] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Kuangkeng.T_Gp_Kuangkeng",
    Id = 2005,
    ManualItemId = 1189999,
    Name = "UI_REGIONMAP_NAME_201",
    Pos = {-32320, -14330},
    SubRegion = 101103,
    TargetSubRegion = {
      101301,
      101302,
      101303,
      101304
    },
    TelepointId = 1014,
    TeleportPointPos = 15,
    TeleportSubRegion = 101103,
    UnlockConditionId = 314
  },
  [2006] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Sew.T_Gp_Sew",
    Id = 2006,
    ManualItemId = 1199995,
    Name = "UI_REGIONMAP_NAME_202",
    Pos = {-8372, -675},
    SubRegion = 101101,
    TargetSubRegion = T.RT_3,
    TelepointId = 1011,
    TeleportPointPos = 19,
    TeleportSubRegion = 101101,
    UnlockConditionId = 312
  },
  [2007] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Sew.T_Gp_Sew",
    Id = 2007,
    ManualItemId = 1193001,
    Name = "UI_REGIONMAP_NAME_202",
    Pos = {100, -7250},
    SubRegion = 101101,
    TargetSubRegion = T.RT_3,
    TelepointId = 1011,
    TeleportPointPos = 20,
    TeleportSubRegion = 101101,
    UnlockConditionId = 320
  },
  [2008] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Secr.T_Gp_Secr",
    Id = 2008,
    ManualItemId = 118001,
    Name = "UI_SUBREGION_NAME_101108",
    Pos = {-39499, 2240},
    SubRegion = 101103,
    TargetSubRegion = T.RT_4,
    TelepointId = 1010,
    TeleportPointPos = 16,
    TeleportSubRegion = 101103,
    UnlockConditionId = 315
  },
  [2009] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Thea.T_Gp_Thea",
    Id = 2009,
    ManualItemId = 119004,
    Name = "UI_SUBREGION_NAME_101901",
    Pos = {699, 5940},
    SubRegion = 101101,
    TargetSubRegion = {101901},
    TelepointId = 1011,
    TeleportPointPos = 21,
    TeleportSubRegion = 101101,
    UnlockConditionId = 317
  },
  [2011] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Flow.T_Gp_Flow",
    Id = 2011,
    ManualItemId = 119002,
    Name = "UI_SUBREGION_NAME_101111",
    Pos = {-8023, -7696},
    SubRegion = 101101,
    TargetSubRegion = {101111},
    TelepointId = 1011,
    TeleportPointPos = 22,
    TeleportSubRegion = 101101,
    UnlockConditionId = 31
  },
  [2012] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Secr.T_Gp_Secr",
    Id = 2012,
    ManualItemId = 118003,
    Name = "UI_SUBREGION_NAME_101108",
    Pos = {-39990, 6541},
    SubRegion = 101103,
    TargetSubRegion = T.RT_4,
    TelepointId = 1010,
    TeleportPointPos = 38,
    TeleportSubRegion = 101103,
    UnlockConditionId = 321
  },
  [2612] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Shop.T_Gp_Shop",
    Id = 2612,
    Name = "UI_ImpressionShop_ShopName_1011",
    Pos = {-1185, -4530},
    StaticId = 1190177,
    SubRegion = 101101,
    TelepointId = 1011,
    TeleportPointPos = 23,
    TeleportSubRegion = 101101,
    UnlockConditionId = 101103
  },
  [2613] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Shop.T_Gp_Shop",
    Id = 2613,
    Name = "UI_SHOP_ExploreBadge",
    Pos = {44, -2924},
    StaticId = 1190879,
    SubRegion = 101101,
    TelepointId = 1011,
    TeleportPointPos = 24,
    TeleportSubRegion = 101101,
    UnlockConditionId = 10101001
  },
  [2614] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Shop.T_Gp_Shop",
    Id = 2614,
    Name = "UI_SHOP_Fishing",
    Pos = {-5184, -621},
    StaticId = 1190986,
    SubRegion = 101101,
    TelepointId = 1011,
    TeleportPointPos = 25,
    TeleportSubRegion = 101101,
    UnlockConditionId = 20021501
  },
  [2814] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Angling.T_Gp_Angling",
    Id = 2814,
    ManualItemId = 159001,
    Name = "FishingSpot_Name_10010101",
    Pos = {-4222, 11076},
    SubRegion = 100101,
    TelepointId = 1001,
    TeleportPointPos = 7,
    TeleportSubRegion = 100101,
    UnlockConditionId = 20021502
  },
  [2815] = {
    BuildingNameAndId = "Icelake_L-1",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Angling.T_Gp_Angling",
    Id = 2815,
    ManualItemId = 124020,
    Name = "FishingSpot_Name_10110301",
    Pos = {-31071, 25822},
    SubRegion = 101103,
    TelepointId = 1017,
    TeleportPointPos = 17,
    TeleportSubRegion = 101103,
    UnlockConditionId = 20021503
  },
  [2816] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Angling.T_Gp_Angling",
    Id = 2816,
    ManualItemId = 173077,
    Name = "FishingSpot_Name_10170101",
    Pos = {-28245, -18056},
    SubRegion = 101702,
    TelepointId = 1032,
    TeleportPointPos = 8,
    TeleportSubRegion = 101702,
    UnlockConditionId = 20021504
  },
  [2817] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Zhiliu.T_Gp_Zhiliu",
    Id = 2817,
    ManualItemId = 1199999,
    Name = "Event_Title_103005",
    Pos = T.RT_1,
    SingleCreate = true,
    SubRegion = 101101,
    TargetSubRegion = T.RT_2,
    TelepointId = 1011,
    TeleportPointPos = 2,
    TeleportSubRegion = 101107
  },
  [2818] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Angling.T_Gp_Angling",
    Id = 2818,
    ManualItemId = 209001,
    Name = "FishingSpot_Name_10410801",
    Pos = {29818, 63347},
    SubRegion = 104108,
    TelepointId = 1100,
    TeleportSubRegion = 104108,
    UnlockConditionId = 20021501
  },
  [2819] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Angling.T_Gp_Angling",
    Id = 2819,
    ManualItemId = 209002,
    Name = "FishingSpot_Name_10411001",
    Pos = {29374, 2540},
    SubRegion = 104110,
    TelepointId = 1100,
    TeleportSubRegion = 104108,
    UnlockConditionId = 20021501
  },
  [2820] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Angling.T_Gp_Angling",
    Id = 2820,
    ManualItemId = 209003,
    Name = "FishingSpot_Name_10410701",
    Pos = {29770, 63360},
    SubRegion = 104103,
    TelepointId = 1100,
    TeleportSubRegion = 104108,
    UnlockConditionId = 20021501
  },
  [2821] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Angling.T_Gp_Angling",
    Id = 2821,
    ManualItemId = 209004,
    Name = "FishingSpot_Name_10410601",
    Pos = {-5619, 31992},
    SubRegion = 104106,
    TelepointId = 1100,
    TeleportSubRegion = 104108,
    UnlockConditionId = 20021501
  },
  [2822] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Angling.T_Gp_Angling",
    Id = 2822,
    ManualItemId = 209005,
    Name = "FishingSpot_Name_10410901",
    Pos = {-23243, 13894},
    SubRegion = 104109,
    TelepointId = 1100,
    TeleportSubRegion = 104108,
    UnlockConditionId = 20021501
  }
})
