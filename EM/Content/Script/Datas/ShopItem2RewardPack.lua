local T = {}
T.RT_1 = {}
T.RT_2 = {
  ShopItemId = 160316,
  ShopType = "Shop",
  SubTabId = 1606,
  TypeId = 12107
}
T.RT_3 = {
  ShopItemId = 160111,
  ShopType = "Shop",
  SubTabId = 1601,
  TypeId = 12107
}
T.RT_4 = {
  [1] = T.RT_3,
  [2] = T.RT_2
}
T.RT_5 = {
  ShopItemId = 160213,
  ShopType = "Shop",
  SubTabId = 1605,
  TypeId = 12056
}
T.RT_6 = {
  ShopItemId = 160212,
  ShopType = "Shop",
  SubTabId = 1605,
  TypeId = 12055
}
T.RT_7 = {
  ShopItemId = 160211,
  ShopType = "Shop",
  SubTabId = 1605,
  TypeId = 12050
}
T.RT_8 = {
  ShopItemId = 160210,
  ShopType = "Shop",
  SubTabId = 1605,
  TypeId = 12049
}
T.RT_9 = {
  [1] = T.RT_8,
  [2] = T.RT_7
}
T.RT_10 = {
  ShopItemId = 160209,
  ShopType = "Shop",
  SubTabId = 1605,
  TypeId = 12048
}
T.RT_11 = {
  ShopItemId = 160208,
  ShopType = "Shop",
  SubTabId = 1605,
  TypeId = 12047
}
T.RT_12 = {
  [1] = T.RT_11,
  [2] = T.RT_10
}
T.RT_13 = {
  ShopItemId = 160107,
  ShopType = "Shop",
  SubTabId = 1601,
  TypeId = 12023
}
T.RT_14 = {
  [1] = T.RT_13
}
T.RT_15 = {
  ShopItemId = 160103,
  ShopType = "Shop",
  SubTabId = 1601,
  TypeId = 12103
}
T.RT_16 = {
  ShopItemId = 160102,
  ShopType = "Shop",
  SubTabId = 1601,
  TypeId = 12102
}
T.RT_17 = {
  ShopItemId = 160110,
  ShopType = "Shop",
  SubTabId = 1601,
  TypeId = 12026
}
T.RT_18 = {
  ShopItemId = 160109,
  ShopType = "Shop",
  SubTabId = 1601,
  TypeId = 12025
}
T.RT_19 = {
  ShopItemId = 160108,
  ShopType = "Shop",
  SubTabId = 1601,
  TypeId = 12024
}
T.RT_20 = {
  [1] = T.RT_13,
  [2] = T.RT_19,
  [3] = T.RT_18,
  [4] = T.RT_17
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ShopItem2RewardPack", {
  Char = T.RT_1,
  CharAccessory = {
    [10019] = {
      [1] = T.RT_17
    },
    [20001] = T.RT_14,
    [30008] = {
      [1] = T.RT_18
    },
    [40007] = {
      [1] = T.RT_19
    }
  },
  Draft = T.RT_1,
  Drop = T.RT_1,
  HeadFrame = T.RT_1,
  HeadSculpture = T.RT_1,
  Mod = T.RT_1,
  Pet = T.RT_1,
  Resource = {
    [101] = {
      [1] = T.RT_16,
      [2] = T.RT_15
    },
    [102] = {
      [1] = {
        ShopItemId = 160206,
        ShopType = "Shop",
        SubTabId = 1605,
        TypeId = 12045
      },
      [2] = {
        ShopItemId = 160207,
        ShopType = "Shop",
        SubTabId = 1605,
        TypeId = 12046
      }
    },
    [201] = {
      [1] = {
        ShopItemId = 160201,
        ShopType = "Shop",
        SubTabId = 1604,
        TypeId = 12051
      }
    },
    [202] = {
      [1] = {
        ShopItemId = 160202,
        ShopType = "Shop",
        SubTabId = 1604,
        TypeId = 12052
      }
    },
    [207] = {
      [1] = T.RT_6
    },
    [208] = {
      [1] = T.RT_5,
      [2] = T.RT_6
    },
    [209] = {
      [1] = T.RT_5
    },
    [1001] = T.RT_20,
    [1003] = T.RT_20,
    [1004] = {
      [1] = {
        ShopItemId = 160101,
        ShopType = "Shop",
        SubTabId = 1601,
        TypeId = 12101
      },
      [2] = T.RT_16,
      [3] = T.RT_15,
      [4] = {
        ShopItemId = 160104,
        ShopType = "Shop",
        SubTabId = 1601,
        TypeId = 12104
      },
      [5] = {
        ShopItemId = 160105,
        ShopType = "Shop",
        SubTabId = 1601,
        TypeId = 12105
      },
      [6] = {
        ShopItemId = 160106,
        ShopType = "Shop",
        SubTabId = 1601,
        TypeId = 12106
      }
    },
    [20008] = T.RT_12,
    [20013] = {
      [1] = {
        ShopItemId = 160205,
        ShopType = "Shop",
        SubTabId = 1605,
        TypeId = 12044
      },
      [2] = {
        ShopItemId = 160204,
        ShopType = "Shop",
        SubTabId = 1605,
        TypeId = 12043
      }
    },
    [20023] = T.RT_12,
    [20027] = T.RT_9,
    [20028] = T.RT_9,
    [30102] = {
      [1] = {
        ShopItemId = 160309,
        ShopType = "Shop",
        SubTabId = 1606,
        TypeId = 12036
      }
    },
    [30103] = {
      [1] = {
        ShopItemId = 160310,
        ShopType = "Shop",
        SubTabId = 1606,
        TypeId = 12037
      }
    },
    [30104] = {
      [1] = {
        ShopItemId = 160311,
        ShopType = "Shop",
        SubTabId = 1606,
        TypeId = 12038
      }
    },
    [30105] = {
      [1] = {
        ShopItemId = 160312,
        ShopType = "Shop",
        SubTabId = 1606,
        TypeId = 12039
      }
    },
    [30106] = {
      [1] = {
        ShopItemId = 160313,
        ShopType = "Shop",
        SubTabId = 1606,
        TypeId = 12040
      }
    },
    [30107] = {
      [1] = {
        ShopItemId = 160314,
        ShopType = "Shop",
        SubTabId = 1606,
        TypeId = 12041
      }
    },
    [30109] = {
      [1] = {
        ShopItemId = 160315,
        ShopType = "Shop",
        SubTabId = 1606,
        TypeId = 12042
      }
    },
    [110001] = T.RT_14
  },
  Reward = T.RT_1,
  Skin = {
    [16010010] = T.RT_4,
    [16010110] = T.RT_4
  },
  Title = T.RT_1,
  TitleFrame = T.RT_1,
  Walnut = T.RT_1,
  Weapon = T.RT_1,
  WeaponAccessory = T.RT_1,
  WeaponSkin = T.RT_1
})
