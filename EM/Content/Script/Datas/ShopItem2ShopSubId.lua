local T = {}
T.RT_1 = {}
T.RT_2 = {
  AbyssShop = T.RT_1,
  ExploreBadgeShop = T.RT_1,
  FishingShop = T.RT_1,
  Rouge = T.RT_1,
  Shop = T.RT_1
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ShopItem2ShopSubId", {
  Char = T.RT_2,
  CharAccessory = {
    AbyssShop = T.RT_1,
    ExploreBadgeShop = T.RT_1,
    FishingShop = T.RT_1,
    Rouge = T.RT_1,
    Shop = {
      [10009] = {
        [1] = {ShopItemId = 140106, SubTabId = 1402}
      },
      [10010] = {
        [1] = {ShopItemId = 120202, SubTabId = 1202}
      },
      [10012] = {
        [1] = {ShopItemId = 140104, SubTabId = 1402}
      },
      [10013] = {
        [1] = {ShopItemId = 140105, SubTabId = 1402},
        [2] = {ShopItemId = 120203, SubTabId = 1202}
      },
      [10015] = {
        [1] = {ShopItemId = 120219, SubTabId = 1202}
      },
      [10016] = {
        [1] = {ShopItemId = 120213, SubTabId = 1202}
      },
      [10017] = {
        [1] = {ShopItemId = 120212, SubTabId = 1202}
      },
      [10018] = {
        [1] = {ShopItemId = 120211, SubTabId = 1202}
      },
      [10031] = {
        [1] = {ShopItemId = 120220, SubTabId = 1202}
      },
      [10035] = {
        [1] = {ShopItemId = 120217, SubTabId = 1202}
      },
      [10037] = {
        [1] = {ShopItemId = 120214, SubTabId = 1202}
      },
      [10038] = {
        [1] = {ShopItemId = 120215, SubTabId = 1202}
      },
      [10039] = {
        [1] = {ShopItemId = 120216, SubTabId = 1202}
      },
      [10040] = {
        [1] = {ShopItemId = 120204, SubTabId = 1202}
      },
      [10041] = {
        [1] = {ShopItemId = 120205, SubTabId = 1202}
      },
      [10042] = {
        [1] = {ShopItemId = 120206, SubTabId = 1202}
      },
      [10043] = {
        [1] = {ShopItemId = 120207, SubTabId = 1202}
      },
      [10044] = {
        [1] = {ShopItemId = 120208, SubTabId = 1202}
      },
      [10045] = {
        [1] = {ShopItemId = 120209, SubTabId = 1202}
      },
      [10046] = {
        [1] = {ShopItemId = 120218, SubTabId = 1202}
      },
      [10047] = {
        [1] = {ShopItemId = 140107, SubTabId = 1402}
      },
      [10048] = {
        [1] = {ShopItemId = 140108, SubTabId = 1402}
      },
      [10050] = {
        [1] = {ShopItemId = 120201, SubTabId = 1202}
      },
      [20005] = {
        [1] = {ShopItemId = 120305, SubTabId = 1203}
      },
      [20006] = {
        [1] = {ShopItemId = 120306, SubTabId = 1203}
      },
      [20007] = {
        [1] = {ShopItemId = 140111, SubTabId = 1402}
      },
      [20016] = {
        [1] = {ShopItemId = 120303, SubTabId = 1203}
      },
      [20017] = {
        [1] = {ShopItemId = 120304, SubTabId = 1203}
      },
      [20018] = {
        [1] = {ShopItemId = 140109, SubTabId = 1402}
      },
      [20019] = {
        [1] = {ShopItemId = 140110, SubTabId = 1402}
      },
      [20027] = {
        [1] = {ShopItemId = 140115, SubTabId = 1402}
      },
      [20028] = {
        [1] = {ShopItemId = 140114, SubTabId = 1402}
      },
      [20029] = {
        [1] = {ShopItemId = 120301, SubTabId = 1203}
      },
      [20031] = {
        [1] = {ShopItemId = 140113, SubTabId = 1402}
      },
      [20032] = {
        [1] = {ShopItemId = 140112, SubTabId = 1402}
      },
      [20033] = {
        [1] = {ShopItemId = 120302, SubTabId = 1203}
      },
      [20034] = {
        [1] = {ShopItemId = 140117, SubTabId = 1402}
      },
      [20036] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 140203,
          SubTabId = 1401
        }
      },
      [20037] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 140204,
          SubTabId = 1401
        }
      },
      [20038] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 140205,
          SubTabId = 1401
        }
      },
      [20039] = {
        [1] = {ShopItemId = 140116, SubTabId = 1402}
      },
      [30002] = {
        [1] = {ShopItemId = 120401, SubTabId = 1204}
      },
      [30007] = {
        [1] = {ShopItemId = 120402, SubTabId = 1204}
      },
      [30017] = {
        [1] = {ShopItemId = 120403, SubTabId = 1204}
      },
      [40001] = {
        [1] = {ShopItemId = 120502, SubTabId = 1205}
      },
      [40002] = {
        [1] = {ShopItemId = 120501, SubTabId = 1205}
      },
      [40005] = {
        [1] = {ShopItemId = 140118, SubTabId = 1402}
      },
      [70001] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 140219,
          SubTabId = 1401
        }
      },
      [80001] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 140206,
          SubTabId = 1401
        }
      }
    }
  },
  Draft = {
    AbyssShop = T.RT_1,
    ExploreBadgeShop = T.RT_1,
    FishingShop = T.RT_1,
    Rouge = {
      [154001] = {
        [1] = {ShopItemId = 10002201, SubTabId = 100022}
      },
      [154002] = {
        [1] = {ShopItemId = 10002202, SubTabId = 100022}
      },
      [154003] = {
        [1] = {ShopItemId = 10002203, SubTabId = 100022}
      },
      [154004] = {
        [1] = {ShopItemId = 10002204, SubTabId = 100022}
      },
      [154005] = {
        [1] = {ShopItemId = 10002205, SubTabId = 100022}
      },
      [154006] = {
        [1] = {ShopItemId = 10002206, SubTabId = 100022}
      },
      [154101] = {
        [1] = {ShopItemId = 10002207, SubTabId = 100022}
      },
      [154102] = {
        [1] = {ShopItemId = 10002208, SubTabId = 100022}
      },
      [154103] = {
        [1] = {ShopItemId = 10002209, SubTabId = 100022}
      },
      [155001] = {
        [1] = {ShopItemId = 10002301, SubTabId = 100023}
      },
      [155002] = {
        [1] = {ShopItemId = 10002302, SubTabId = 100023}
      },
      [155003] = {
        [1] = {ShopItemId = 10002303, SubTabId = 100023}
      },
      [155004] = {
        [1] = {ShopItemId = 10002304, SubTabId = 100023}
      },
      [155005] = {
        [1] = {ShopItemId = 10002305, SubTabId = 100023}
      },
      [155006] = {
        [1] = {ShopItemId = 10002306, SubTabId = 100023}
      },
      [155101] = {
        [1] = {ShopItemId = 10002307, SubTabId = 100023}
      },
      [155102] = {
        [1] = {ShopItemId = 10002308, SubTabId = 100023}
      },
      [155103] = {
        [1] = {ShopItemId = 10002309, SubTabId = 100023}
      }
    },
    Shop = T.RT_1
  },
  Drop = T.RT_2,
  HeadFrame = T.RT_2,
  HeadSculpture = T.RT_2,
  Mod = {
    AbyssShop = {
      [101002] = {
        [1] = {ShopItemId = 10000501, SubTabId = 100001}
      },
      [102001] = {
        [1] = {ShopItemId = 10000500, SubTabId = 100001}
      },
      [102004] = {
        [1] = {ShopItemId = 10000503, SubTabId = 100001}
      },
      [106001] = {
        [1] = {ShopItemId = 10000502, SubTabId = 100001}
      }
    },
    ExploreBadgeShop = {
      [31502] = {
        [1] = {ShopItemId = 702007, SubTabId = 7020}
      },
      [31513] = {
        [1] = {ShopItemId = 703004, SubTabId = 7030}
      },
      [31521] = {
        [1] = {ShopItemId = 701004, SubTabId = 7010}
      },
      [31522] = {
        [1] = {ShopItemId = 703005, SubTabId = 7030}
      },
      [31523] = {
        [1] = {ShopItemId = 702008, SubTabId = 7020}
      },
      [31524] = {
        [1] = {ShopItemId = 703006, SubTabId = 7030}
      },
      [31525] = {
        [1] = {ShopItemId = 702010, SubTabId = 7020}
      },
      [31526] = {
        [1] = {ShopItemId = 701005, SubTabId = 7010}
      },
      [31531] = {
        [1] = {ShopItemId = 702009, SubTabId = 7020}
      },
      [31532] = {
        [1] = {ShopItemId = 701003, SubTabId = 7010}
      }
    },
    FishingShop = {
      [103002] = {
        [1] = {ShopItemId = 801201, SubTabId = 8011}
      },
      [104001] = {
        [1] = {ShopItemId = 801202, SubTabId = 8011}
      }
    },
    Rouge = {
      [24001] = {
        [1] = {ShopItemId = 10002228, SubTabId = 100022}
      },
      [24002] = {
        [1] = {ShopItemId = 10002229, SubTabId = 100022}
      },
      [24003] = {
        [1] = {ShopItemId = 10002230, SubTabId = 100022}
      },
      [24004] = {
        [1] = {ShopItemId = 10002231, SubTabId = 100022}
      },
      [24005] = {
        [1] = {ShopItemId = 10002232, SubTabId = 100022}
      },
      [24006] = {
        [1] = {ShopItemId = 10002233, SubTabId = 100022}
      },
      [24101] = {
        [1] = {ShopItemId = 10002234, SubTabId = 100022}
      },
      [24102] = {
        [1] = {ShopItemId = 10002235, SubTabId = 100022}
      },
      [24103] = {
        [1] = {ShopItemId = 10002236, SubTabId = 100022}
      },
      [25001] = {
        [1] = {ShopItemId = 10002328, SubTabId = 100023}
      },
      [25002] = {
        [1] = {ShopItemId = 10002329, SubTabId = 100023}
      },
      [25003] = {
        [1] = {ShopItemId = 10002330, SubTabId = 100023}
      },
      [25004] = {
        [1] = {ShopItemId = 10002331, SubTabId = 100023}
      },
      [25005] = {
        [1] = {ShopItemId = 10002332, SubTabId = 100023}
      },
      [25006] = {
        [1] = {ShopItemId = 10002333, SubTabId = 100023}
      },
      [25101] = {
        [1] = {ShopItemId = 10002334, SubTabId = 100023}
      },
      [25102] = {
        [1] = {ShopItemId = 10002335, SubTabId = 100023}
      },
      [25103] = {
        [1] = {ShopItemId = 10002336, SubTabId = 100023}
      },
      [34001] = {
        [1] = {ShopItemId = 10002219, SubTabId = 100022}
      },
      [34002] = {
        [1] = {ShopItemId = 10002220, SubTabId = 100022}
      },
      [34003] = {
        [1] = {ShopItemId = 10002221, SubTabId = 100022}
      },
      [34004] = {
        [1] = {ShopItemId = 10002222, SubTabId = 100022}
      },
      [34005] = {
        [1] = {ShopItemId = 10002223, SubTabId = 100022}
      },
      [34006] = {
        [1] = {ShopItemId = 10002224, SubTabId = 100022}
      },
      [34101] = {
        [1] = {ShopItemId = 10002225, SubTabId = 100022}
      },
      [34102] = {
        [1] = {ShopItemId = 10002226, SubTabId = 100022}
      },
      [34103] = {
        [1] = {ShopItemId = 10002227, SubTabId = 100022}
      },
      [35001] = {
        [1] = {ShopItemId = 10002319, SubTabId = 100023}
      },
      [35002] = {
        [1] = {ShopItemId = 10002320, SubTabId = 100023}
      },
      [35003] = {
        [1] = {ShopItemId = 10002321, SubTabId = 100023}
      },
      [35004] = {
        [1] = {ShopItemId = 10002322, SubTabId = 100023}
      },
      [35005] = {
        [1] = {ShopItemId = 10002323, SubTabId = 100023}
      },
      [35006] = {
        [1] = {ShopItemId = 10002324, SubTabId = 100023}
      },
      [35101] = {
        [1] = {ShopItemId = 10002325, SubTabId = 100023}
      },
      [35102] = {
        [1] = {ShopItemId = 10002326, SubTabId = 100023}
      },
      [35103] = {
        [1] = {ShopItemId = 10002327, SubTabId = 100023}
      },
      [44001] = {
        [1] = {ShopItemId = 10002210, SubTabId = 100022}
      },
      [44002] = {
        [1] = {ShopItemId = 10002211, SubTabId = 100022}
      },
      [44003] = {
        [1] = {ShopItemId = 10002212, SubTabId = 100022}
      },
      [44004] = {
        [1] = {ShopItemId = 10002213, SubTabId = 100022}
      },
      [44005] = {
        [1] = {ShopItemId = 10002214, SubTabId = 100022}
      },
      [44006] = {
        [1] = {ShopItemId = 10002215, SubTabId = 100022}
      },
      [44101] = {
        [1] = {ShopItemId = 10002216, SubTabId = 100022}
      },
      [44102] = {
        [1] = {ShopItemId = 10002217, SubTabId = 100022}
      },
      [44103] = {
        [1] = {ShopItemId = 10002218, SubTabId = 100022}
      },
      [45001] = {
        [1] = {ShopItemId = 10002310, SubTabId = 100023}
      },
      [45002] = {
        [1] = {ShopItemId = 10002311, SubTabId = 100023}
      },
      [45003] = {
        [1] = {ShopItemId = 10002312, SubTabId = 100023}
      },
      [45004] = {
        [1] = {ShopItemId = 10002313, SubTabId = 100023}
      },
      [45005] = {
        [1] = {ShopItemId = 10002314, SubTabId = 100023}
      },
      [45006] = {
        [1] = {ShopItemId = 10002315, SubTabId = 100023}
      },
      [45101] = {
        [1] = {ShopItemId = 10002316, SubTabId = 100023}
      },
      [45102] = {
        [1] = {ShopItemId = 10002317, SubTabId = 100023}
      },
      [45103] = {
        [1] = {ShopItemId = 10002318, SubTabId = 100023}
      },
      [101001] = {
        [1] = {ShopItemId = 10002106, SubTabId = 100021}
      },
      [102002] = {
        [1] = {ShopItemId = 10002109, SubTabId = 100021}
      },
      [103001] = {
        [1] = {ShopItemId = 10002108, SubTabId = 100021}
      },
      [104002] = {
        [1] = {ShopItemId = 10002107, SubTabId = 100021}
      }
    },
    Shop = T.RT_1
  },
  Pet = T.RT_2,
  Resource = {
    AbyssShop = {
      [101] = {
        [1] = {ShopItemId = 10000104, SubTabId = 100001},
        [2] = {ShopItemId = 10000107, SubTabId = 100001}
      },
      [102] = {
        [1] = {ShopItemId = 10000105, SubTabId = 100001}
      },
      [2009] = {
        [1] = {ShopItemId = 10000102, SubTabId = 100001}
      },
      [2013] = {
        [1] = {ShopItemId = 10000101, SubTabId = 100001}
      },
      [3006] = {
        [1] = {ShopItemId = 10000103, SubTabId = 100001}
      },
      [3007] = {
        [1] = {ShopItemId = 10000106, SubTabId = 100001}
      },
      [20027] = {
        [1] = {ShopItemId = 10000110, SubTabId = 100001}
      },
      [20028] = {
        [1] = {ShopItemId = 10000111, SubTabId = 100001}
      }
    },
    ExploreBadgeShop = {
      [201] = {
        [1] = {ShopItemId = 703002, SubTabId = 7030},
        [2] = {ShopItemId = 702005, SubTabId = 7020},
        [3] = {ShopItemId = 701001, SubTabId = 7010}
      },
      [202] = {
        [1] = {ShopItemId = 702006, SubTabId = 7020},
        [2] = {ShopItemId = 703003, SubTabId = 7030},
        [3] = {ShopItemId = 701002, SubTabId = 7010}
      },
      [2009] = {
        [1] = {ShopItemId = 702004, SubTabId = 7020}
      },
      [2013] = {
        [1] = {ShopItemId = 702003, SubTabId = 7020}
      },
      [10100] = {
        [1] = {ShopItemId = 702002, SubTabId = 7020},
        [2] = {ShopItemId = 703001, SubTabId = 7030},
        [3] = {ShopItemId = 702001, SubTabId = 7020}
      }
    },
    FishingShop = {
      [101] = {
        [1] = {ShopItemId = 801140, SubTabId = 8011},
        [2] = {ShopItemId = 801104, SubTabId = 8011},
        [3] = {ShopItemId = 801109, SubTabId = 8011},
        [4] = {ShopItemId = 801129, SubTabId = 8011},
        [5] = {ShopItemId = 801118, SubTabId = 8011}
      },
      [102] = {
        [1] = {ShopItemId = 801141, SubTabId = 8011},
        [2] = {ShopItemId = 801130, SubTabId = 8011},
        [3] = {ShopItemId = 801105, SubTabId = 8011},
        [4] = {ShopItemId = 801110, SubTabId = 8011},
        [5] = {ShopItemId = 801119, SubTabId = 8011}
      },
      [201] = {
        [1] = {ShopItemId = 801134, SubTabId = 8011},
        [2] = {ShopItemId = 801145, SubTabId = 8011},
        [3] = {ShopItemId = 801123, SubTabId = 8011}
      },
      [202] = {
        [1] = {ShopItemId = 801135, SubTabId = 8011},
        [2] = {ShopItemId = 801146, SubTabId = 8011},
        [3] = {ShopItemId = 801124, SubTabId = 8011}
      },
      [211] = {
        [1] = {ShopItemId = 801136, SubTabId = 8011},
        [2] = {ShopItemId = 801125, SubTabId = 8011},
        [3] = {ShopItemId = 801114, SubTabId = 8011},
        [4] = {ShopItemId = 801147, SubTabId = 8011}
      },
      [1001] = {
        [1] = {ShopItemId = 801143, SubTabId = 8011},
        [2] = {ShopItemId = 801132, SubTabId = 8011},
        [3] = {ShopItemId = 801121, SubTabId = 8011},
        [4] = {ShopItemId = 801112, SubTabId = 8011}
      },
      [2008] = {
        [1] = {ShopItemId = 801102, SubTabId = 8011},
        [2] = {ShopItemId = 801107, SubTabId = 8011}
      },
      [2009] = {
        [1] = {ShopItemId = 801127, SubTabId = 8011},
        [2] = {ShopItemId = 801116, SubTabId = 8011}
      },
      [2010] = {
        [1] = {ShopItemId = 801138, SubTabId = 8011}
      },
      [2012] = {
        [1] = {ShopItemId = 801101, SubTabId = 8011},
        [2] = {ShopItemId = 801106, SubTabId = 8011}
      },
      [2013] = {
        [1] = {ShopItemId = 801126, SubTabId = 8011},
        [2] = {ShopItemId = 801115, SubTabId = 8011}
      },
      [2014] = {
        [1] = {ShopItemId = 801137, SubTabId = 8011}
      },
      [3001] = {
        [1] = {ShopItemId = 801144, SubTabId = 8011},
        [2] = {ShopItemId = 801133, SubTabId = 8011},
        [3] = {ShopItemId = 801122, SubTabId = 8011},
        [4] = {ShopItemId = 801113, SubTabId = 8011}
      },
      [3005] = {
        [1] = {ShopItemId = 801103, SubTabId = 8011},
        [2] = {ShopItemId = 801108, SubTabId = 8011},
        [3] = {ShopItemId = 801203, SubTabId = 8011}
      },
      [3006] = {
        [1] = {ShopItemId = 801139, SubTabId = 8011},
        [2] = {ShopItemId = 801128, SubTabId = 8011},
        [3] = {ShopItemId = 801117, SubTabId = 8011}
      },
      [10100] = {
        [1] = {ShopItemId = 801142, SubTabId = 8011},
        [2] = {ShopItemId = 801131, SubTabId = 8011},
        [3] = {ShopItemId = 801120, SubTabId = 8011},
        [4] = {ShopItemId = 801111, SubTabId = 8011}
      },
      [41013] = {
        [1] = {ShopItemId = 801200, SubTabId = 8011}
      },
      [5110200] = {
        [1] = {ShopItemId = 801005, SubTabId = 8010}
      },
      [5110300] = {
        [1] = {ShopItemId = 801006, SubTabId = 8010}
      },
      [5110400] = {
        [1] = {ShopItemId = 801007, SubTabId = 8010}
      },
      [5110500] = {
        [1] = {ShopItemId = 801008, SubTabId = 8010}
      },
      [5210100] = {
        [1] = {ShopItemId = 801001, SubTabId = 8010}
      },
      [5210200] = {
        [1] = {ShopItemId = 801002, SubTabId = 8010}
      },
      [5210300] = {
        [1] = {ShopItemId = 801003, SubTabId = 8010}
      },
      [5210400] = {
        [1] = {ShopItemId = 801004, SubTabId = 8010}
      }
    },
    Rouge = {
      [101] = {
        [1] = {ShopItemId = 10002103, SubTabId = 100021},
        [2] = {ShopItemId = 10002105, SubTabId = 100021}
      },
      [102] = {
        [1] = {ShopItemId = 10002104, SubTabId = 100021}
      },
      [2009] = {
        [1] = {ShopItemId = 10002102, SubTabId = 100021}
      },
      [2013] = {
        [1] = {ShopItemId = 10002101, SubTabId = 100021}
      }
    },
    Shop = {
      [99] = {
        [1] = {ShopItemId = 110101, SubTabId = 1101},
        [2] = {ShopItemId = 110102, SubTabId = 1101},
        [3] = {ShopItemId = 110103, SubTabId = 1101},
        [4] = {ShopItemId = 110104, SubTabId = 1101},
        [5] = {ShopItemId = 110105, SubTabId = 1101},
        [6] = {ShopItemId = 110106, SubTabId = 1101}
      },
      [101] = {
        [1] = {ShopItemId = 140136, SubTabId = 1402}
      },
      [102] = {
        [1] = {ShopItemId = 140141, SubTabId = 1402}
      },
      [201] = {
        [1] = {ShopItemId = 140143, SubTabId = 1402},
        [2] = {ShopItemId = 150104, SubTabId = 1501}
      },
      [202] = {
        [1] = {ShopItemId = 140144, SubTabId = 1402},
        [2] = {ShopItemId = 150105, SubTabId = 1501}
      },
      [207] = {
        [1] = {ShopItemId = 150101, SubTabId = 1500}
      },
      [208] = {
        [1] = {ShopItemId = 150102, SubTabId = 1500}
      },
      [209] = {
        [1] = {ShopItemId = 150103, SubTabId = 1500}
      },
      [1001] = {
        [1] = {ShopItemId = 140145, SubTabId = 1402},
        [2] = {
          AccessOrder = 1,
          ShopItemId = 150106,
          SubTabId = 1501
        }
      },
      [1002] = {
        [1] = {ShopItemId = 140142, SubTabId = 1402},
        [2] = {ShopItemId = 150115, SubTabId = 1501}
      },
      [1003] = {
        [1] = {ShopItemId = 140146, SubTabId = 1402},
        [2] = {
          AccessOrder = 1,
          ShopItemId = 150107,
          SubTabId = 1500
        }
      },
      [2009] = {
        [1] = {ShopItemId = 140137, SubTabId = 1402}
      },
      [2013] = {
        [1] = {ShopItemId = 140138, SubTabId = 1402}
      },
      [30101] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 140213,
          SubTabId = 1401
        },
        [2] = {ShopItemId = 140147, SubTabId = 1402}
      },
      [30102] = {
        [1] = {ShopItemId = 150108, SubTabId = 1501}
      },
      [30103] = {
        [1] = {ShopItemId = 150109, SubTabId = 1501}
      },
      [30104] = {
        [1] = {ShopItemId = 150110, SubTabId = 1501}
      },
      [30105] = {
        [1] = {ShopItemId = 150111, SubTabId = 1501}
      },
      [30106] = {
        [1] = {ShopItemId = 150112, SubTabId = 1501}
      },
      [30107] = {
        [1] = {ShopItemId = 150113, SubTabId = 1501}
      },
      [30108] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 140214,
          SubTabId = 1401
        },
        [2] = {ShopItemId = 140148, SubTabId = 1402}
      },
      [30109] = {
        [1] = {ShopItemId = 150114, SubTabId = 1501}
      },
      [41002] = {
        [1] = {ShopItemId = 140133, SubTabId = 1402}
      },
      [41005] = {
        [1] = {ShopItemId = 140134, SubTabId = 1402}
      },
      [41006] = {
        [1] = {ShopItemId = 140135, SubTabId = 1402}
      },
      [41012] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 140210,
          SubTabId = 1401
        }
      },
      [41014] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 140207,
          SubTabId = 1401
        }
      },
      [41015] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 140211,
          SubTabId = 1401
        }
      },
      [41016] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 140212,
          SubTabId = 1401
        }
      },
      [41017] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 140208,
          SubTabId = 1401
        }
      },
      [41018] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 140209,
          SubTabId = 1401
        }
      },
      [110006] = {
        [1] = {ShopItemId = 120105, SubTabId = 1201},
        [2] = {ShopItemId = 120106, SubTabId = 1201},
        [3] = {ShopItemId = 120107, SubTabId = 1201}
      },
      [1001101] = {
        [1] = {ShopItemId = 150116, SubTabId = 1502}
      },
      [1001103] = {
        [1] = {ShopItemId = 150117, SubTabId = 1502}
      },
      [1001501] = {
        [1] = {ShopItemId = 150118, SubTabId = 1502}
      },
      [1001502] = {
        [1] = {ShopItemId = 150119, SubTabId = 1502}
      },
      [1001801] = {
        [1] = {ShopItemId = 150122, SubTabId = 1502}
      },
      [1002101] = {
        [1] = {ShopItemId = 150123, SubTabId = 1502}
      },
      [1002301] = {
        [1] = {ShopItemId = 150124, SubTabId = 1502}
      },
      [1003101] = {
        [1] = {ShopItemId = 150126, SubTabId = 1502}
      },
      [1003103] = {
        [1] = {ShopItemId = 150128, SubTabId = 1502}
      },
      [1003201] = {
        [1] = {ShopItemId = 150129, SubTabId = 1502}
      },
      [1003301] = {
        [1] = {ShopItemId = 150131, SubTabId = 1502}
      },
      [1004101] = {
        [1] = {ShopItemId = 150132, SubTabId = 1502}
      },
      [1004202] = {
        [1] = {ShopItemId = 150135, SubTabId = 1502}
      },
      [1004301] = {
        [1] = {ShopItemId = 150136, SubTabId = 1502}
      },
      [1005101] = {
        [1] = {ShopItemId = 150137, SubTabId = 1502}
      },
      [1005102] = {
        [1] = {ShopItemId = 150138, SubTabId = 1502}
      },
      [1005301] = {
        [1] = {ShopItemId = 150139, SubTabId = 1502}
      },
      [1005401] = {
        [1] = {ShopItemId = 150140, SubTabId = 1502}
      }
    }
  },
  Reward = {
    AbyssShop = T.RT_1,
    ExploreBadgeShop = T.RT_1,
    FishingShop = T.RT_1,
    Rouge = T.RT_1,
    Shop = {
      [12001] = {
        [1] = {
          AccessOrder = 8,
          ShopItemId = 160301,
          SubTabId = 1606
        }
      },
      [12002] = {
        [1] = {
          AccessOrder = 7,
          ShopItemId = 160302,
          SubTabId = 1606
        }
      },
      [12003] = {
        [1] = {
          AccessOrder = 6,
          ShopItemId = 160303,
          SubTabId = 1606
        }
      },
      [12004] = {
        [1] = {
          AccessOrder = 5,
          ShopItemId = 160304,
          SubTabId = 1606
        }
      },
      [12005] = {
        [1] = {
          AccessOrder = 3,
          ShopItemId = 160306,
          SubTabId = 1606
        }
      },
      [12006] = {
        [1] = {
          AccessOrder = 1,
          ShopItemId = 160308,
          SubTabId = 1606
        }
      },
      [12023] = {
        [1] = {ShopItemId = 160107, SubTabId = 1601}
      },
      [12024] = {
        [1] = {ShopItemId = 160108, SubTabId = 1601}
      },
      [12025] = {
        [1] = {ShopItemId = 160109, SubTabId = 1601}
      },
      [12026] = {
        [1] = {ShopItemId = 160110, SubTabId = 1601}
      },
      [12034] = {
        [1] = {
          AccessOrder = 4,
          ShopItemId = 160305,
          SubTabId = 1606
        }
      },
      [12035] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 160307,
          SubTabId = 1606
        }
      },
      [12036] = {
        [1] = {ShopItemId = 160309, SubTabId = 1606}
      },
      [12037] = {
        [1] = {ShopItemId = 160310, SubTabId = 1606}
      },
      [12038] = {
        [1] = {ShopItemId = 160311, SubTabId = 1606}
      },
      [12039] = {
        [1] = {ShopItemId = 160312, SubTabId = 1606}
      },
      [12040] = {
        [1] = {ShopItemId = 160313, SubTabId = 1606}
      },
      [12041] = {
        [1] = {ShopItemId = 160314, SubTabId = 1606}
      },
      [12042] = {
        [1] = {ShopItemId = 160315, SubTabId = 1606}
      },
      [12043] = {
        [1] = {ShopItemId = 160204, SubTabId = 1605}
      },
      [12044] = {
        [1] = {ShopItemId = 160205, SubTabId = 1605}
      },
      [12045] = {
        [1] = {ShopItemId = 160206, SubTabId = 1605}
      },
      [12046] = {
        [1] = {ShopItemId = 160207, SubTabId = 1605}
      },
      [12047] = {
        [1] = {ShopItemId = 160208, SubTabId = 1605}
      },
      [12048] = {
        [1] = {ShopItemId = 160209, SubTabId = 1605}
      },
      [12049] = {
        [1] = {ShopItemId = 160210, SubTabId = 1605}
      },
      [12050] = {
        [1] = {ShopItemId = 160211, SubTabId = 1605}
      },
      [12051] = {
        [1] = {ShopItemId = 160201, SubTabId = 1604}
      },
      [12052] = {
        [1] = {ShopItemId = 160202, SubTabId = 1604}
      },
      [12055] = {
        [1] = {ShopItemId = 160212, SubTabId = 1605}
      },
      [12056] = {
        [1] = {ShopItemId = 160213, SubTabId = 1605}
      },
      [12101] = {
        [1] = {ShopItemId = 160101, SubTabId = 1601}
      },
      [12102] = {
        [1] = {ShopItemId = 160102, SubTabId = 1601}
      },
      [12103] = {
        [1] = {ShopItemId = 160103, SubTabId = 1601}
      },
      [12104] = {
        [1] = {ShopItemId = 160104, SubTabId = 1601}
      },
      [12105] = {
        [1] = {ShopItemId = 160105, SubTabId = 1601}
      },
      [12106] = {
        [1] = {ShopItemId = 160106, SubTabId = 1601}
      },
      [12107] = {
        [1] = {ShopItemId = 160111, SubTabId = 1601},
        [2] = {ShopItemId = 160316, SubTabId = 1606}
      }
    }
  },
  Skin = {
    AbyssShop = T.RT_1,
    ExploreBadgeShop = T.RT_1,
    FishingShop = T.RT_1,
    Rouge = T.RT_1,
    Shop = {
      [530101] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 140201,
          SubTabId = 1401
        }
      }
    }
  },
  Title = T.RT_2,
  TitleFrame = T.RT_2,
  Walnut = {
    AbyssShop = {
      [2029] = {
        [1] = {ShopItemId = 10000108, SubTabId = 100001},
        [2] = {ShopItemId = 10000109, SubTabId = 100001}
      },
      [2050] = {
        [1] = {ShopItemId = 10000112, SubTabId = 100001},
        [2] = {ShopItemId = 10000113, SubTabId = 100001}
      }
    },
    ExploreBadgeShop = T.RT_1,
    FishingShop = T.RT_1,
    Rouge = T.RT_1,
    Shop = {
      [1000] = {
        [1] = {ShopItemId = 151000, SubTabId = 1801}
      },
      [1003] = {
        [1] = {ShopItemId = 151003, SubTabId = 1801}
      },
      [1006] = {
        [1] = {ShopItemId = 151006, SubTabId = 1801}
      },
      [1009] = {
        [1] = {ShopItemId = 151009, SubTabId = 1801}
      },
      [1014] = {
        [1] = {ShopItemId = 151014, SubTabId = 1801}
      },
      [1018] = {
        [1] = {ShopItemId = 151018, SubTabId = 1801}
      },
      [1019] = {
        [1] = {ShopItemId = 151019, SubTabId = 1801}
      },
      [1021] = {
        [1] = {ShopItemId = 151021, SubTabId = 1801}
      },
      [1023] = {
        [1] = {ShopItemId = 151023, SubTabId = 1801}
      },
      [2001] = {
        [1] = {ShopItemId = 152001, SubTabId = 1802}
      },
      [2002] = {
        [1] = {ShopItemId = 152002, SubTabId = 1802}
      },
      [2003] = {
        [1] = {ShopItemId = 152003, SubTabId = 1802}
      },
      [2004] = {
        [1] = {ShopItemId = 152004, SubTabId = 1802}
      },
      [2005] = {
        [1] = {ShopItemId = 152005, SubTabId = 1802}
      },
      [2006] = {
        [1] = {ShopItemId = 152006, SubTabId = 1802}
      },
      [2007] = {
        [1] = {ShopItemId = 152007, SubTabId = 1802}
      },
      [2008] = {
        [1] = {ShopItemId = 152008, SubTabId = 1802}
      },
      [2009] = {
        [1] = {ShopItemId = 152009, SubTabId = 1802}
      },
      [2010] = {
        [1] = {ShopItemId = 152010, SubTabId = 1802}
      },
      [2011] = {
        [1] = {ShopItemId = 152011, SubTabId = 1802}
      },
      [2012] = {
        [1] = {ShopItemId = 152012, SubTabId = 1802}
      },
      [2013] = {
        [1] = {ShopItemId = 152013, SubTabId = 1802}
      },
      [2014] = {
        [1] = {ShopItemId = 152014, SubTabId = 1802}
      },
      [2015] = {
        [1] = {ShopItemId = 152015, SubTabId = 1802}
      },
      [2016] = {
        [1] = {ShopItemId = 152016, SubTabId = 1802}
      },
      [2017] = {
        [1] = {ShopItemId = 152017, SubTabId = 1802}
      },
      [2018] = {
        [1] = {ShopItemId = 152018, SubTabId = 1802}
      },
      [2019] = {
        [1] = {ShopItemId = 152019, SubTabId = 1802}
      },
      [2020] = {
        [1] = {ShopItemId = 152020, SubTabId = 1802}
      },
      [2021] = {
        [1] = {ShopItemId = 152021, SubTabId = 1802}
      },
      [2022] = {
        [1] = {ShopItemId = 152022, SubTabId = 1802}
      },
      [2023] = {
        [1] = {ShopItemId = 152023, SubTabId = 1802}
      },
      [2024] = {
        [1] = {ShopItemId = 152024, SubTabId = 1802}
      },
      [2025] = {
        [1] = {ShopItemId = 152025, SubTabId = 1802}
      },
      [151321] = {
        [1] = {ShopItemId = 651321, SubTabId = 1803}
      },
      [151322] = {
        [1] = {ShopItemId = 651322, SubTabId = 1803}
      },
      [151323] = {
        [1] = {ShopItemId = 651323, SubTabId = 1803}
      },
      [151324] = {
        [1] = {ShopItemId = 651324, SubTabId = 1803}
      },
      [151325] = {
        [1] = {ShopItemId = 651325, SubTabId = 1803}
      },
      [151326] = {
        [1] = {ShopItemId = 651326, SubTabId = 1803}
      },
      [151331] = {
        [1] = {ShopItemId = 651331, SubTabId = 1803}
      },
      [151332] = {
        [1] = {ShopItemId = 651332, SubTabId = 1803}
      },
      [151333] = {
        [1] = {ShopItemId = 651333, SubTabId = 1803}
      },
      [151334] = {
        [1] = {ShopItemId = 651334, SubTabId = 1803}
      },
      [151335] = {
        [1] = {ShopItemId = 651335, SubTabId = 1803}
      },
      [151336] = {
        [1] = {ShopItemId = 651336, SubTabId = 1803}
      },
      [151711] = {
        [1] = {ShopItemId = 651711, SubTabId = 1803}
      },
      [151712] = {
        [1] = {ShopItemId = 651712, SubTabId = 1803}
      },
      [151713] = {
        [1] = {ShopItemId = 651713, SubTabId = 1803}
      },
      [151714] = {
        [1] = {ShopItemId = 651714, SubTabId = 1803}
      },
      [151721] = {
        [1] = {ShopItemId = 651721, SubTabId = 1803}
      },
      [151722] = {
        [1] = {ShopItemId = 651722, SubTabId = 1803}
      },
      [151723] = {
        [1] = {ShopItemId = 651723, SubTabId = 1803}
      },
      [151724] = {
        [1] = {ShopItemId = 651724, SubTabId = 1803}
      },
      [151731] = {
        [1] = {ShopItemId = 651731, SubTabId = 1803}
      },
      [151732] = {
        [1] = {ShopItemId = 651732, SubTabId = 1803}
      },
      [151733] = {
        [1] = {ShopItemId = 651733, SubTabId = 1803}
      },
      [151734] = {
        [1] = {ShopItemId = 651734, SubTabId = 1803}
      },
      [151741] = {
        [1] = {ShopItemId = 651741, SubTabId = 1803}
      },
      [151742] = {
        [1] = {ShopItemId = 651742, SubTabId = 1803}
      },
      [151743] = {
        [1] = {ShopItemId = 651743, SubTabId = 1803}
      },
      [151744] = {
        [1] = {ShopItemId = 651744, SubTabId = 1803}
      },
      [151751] = {
        [1] = {ShopItemId = 651751, SubTabId = 1803}
      },
      [151752] = {
        [1] = {ShopItemId = 651752, SubTabId = 1803}
      },
      [151753] = {
        [1] = {ShopItemId = 651753, SubTabId = 1803}
      },
      [151754] = {
        [1] = {ShopItemId = 651754, SubTabId = 1803}
      },
      [151761] = {
        [1] = {ShopItemId = 651761, SubTabId = 1803}
      },
      [151762] = {
        [1] = {ShopItemId = 651762, SubTabId = 1803}
      },
      [151763] = {
        [1] = {ShopItemId = 651763, SubTabId = 1803}
      },
      [151764] = {
        [1] = {ShopItemId = 651764, SubTabId = 1803}
      },
      [151911] = {
        [1] = {ShopItemId = 651911, SubTabId = 1803}
      },
      [151921] = {
        [1] = {ShopItemId = 651921, SubTabId = 1803}
      },
      [151922] = {
        [1] = {ShopItemId = 651922, SubTabId = 1803}
      },
      [151931] = {
        [1] = {ShopItemId = 651931, SubTabId = 1803}
      },
      [151941] = {
        [1] = {ShopItemId = 651941, SubTabId = 1803}
      },
      [151951] = {
        [1] = {ShopItemId = 651951, SubTabId = 1803}
      },
      [151952] = {
        [1] = {ShopItemId = 651952, SubTabId = 1803}
      },
      [151961] = {
        [1] = {ShopItemId = 651961, SubTabId = 1803}
      },
      [151962] = {
        [1] = {ShopItemId = 651962, SubTabId = 1803}
      }
    }
  },
  Weapon = {
    AbyssShop = T.RT_1,
    ExploreBadgeShop = T.RT_1,
    FishingShop = T.RT_1,
    Rouge = T.RT_1,
    Shop = {
      [10101] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159101,
          SubTabId = 1503
        }
      },
      [10102] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159102,
          SubTabId = 1503
        }
      },
      [10103] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159103,
          SubTabId = 1503
        }
      },
      [10104] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159104,
          SubTabId = 1503
        }
      },
      [10105] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159105,
          SubTabId = 1503
        }
      },
      [10201] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159106,
          SubTabId = 1503
        }
      },
      [10202] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159107,
          SubTabId = 1503
        }
      },
      [10204] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159109,
          SubTabId = 1503
        }
      },
      [10206] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159111,
          SubTabId = 1503
        }
      },
      [10301] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159115,
          SubTabId = 1503
        }
      },
      [10302] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159116,
          SubTabId = 1503
        }
      },
      [10303] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159117,
          SubTabId = 1503
        }
      },
      [10401] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159119,
          SubTabId = 1503
        }
      },
      [10402] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159120,
          SubTabId = 1503
        }
      },
      [10403] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159121,
          SubTabId = 1503
        }
      },
      [10501] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159122,
          SubTabId = 1503
        }
      },
      [10503] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159124,
          SubTabId = 1503
        }
      },
      [10504] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159125,
          SubTabId = 1503
        }
      },
      [10601] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159126,
          SubTabId = 1503
        }
      },
      [10602] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159127,
          SubTabId = 1503
        }
      },
      [10603] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159128,
          SubTabId = 1503
        }
      },
      [20101] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159129,
          SubTabId = 1503
        }
      },
      [20102] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159130,
          SubTabId = 1503
        }
      },
      [20103] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159131,
          SubTabId = 1503
        }
      },
      [20201] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159132,
          SubTabId = 1503
        }
      },
      [20203] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159133,
          SubTabId = 1503
        }
      },
      [20205] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159134,
          SubTabId = 1503
        }
      },
      [20301] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159135,
          SubTabId = 1503
        }
      },
      [20303] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159137,
          SubTabId = 1503
        }
      },
      [20304] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159138,
          SubTabId = 1503
        }
      },
      [20305] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159139,
          SubTabId = 1503
        }
      },
      [20401] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159140,
          SubTabId = 1503
        }
      },
      [20402] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159141,
          SubTabId = 1503
        }
      },
      [20403] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159142,
          SubTabId = 1503
        }
      },
      [20405] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159143,
          SubTabId = 1503
        }
      },
      [20501] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159144,
          SubTabId = 1503
        }
      },
      [20502] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159145,
          SubTabId = 1503
        }
      },
      [20503] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159146,
          SubTabId = 1503
        }
      },
      [20504] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159147,
          SubTabId = 1503
        }
      },
      [20507] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159148,
          SubTabId = 1503
        }
      },
      [20509] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159150,
          SubTabId = 1503
        }
      },
      [20601] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159151,
          SubTabId = 1503
        }
      },
      [20602] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159152,
          SubTabId = 1503
        }
      },
      [20603] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159153,
          SubTabId = 1503
        }
      },
      [20604] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 159154,
          SubTabId = 1503
        }
      }
    }
  },
  WeaponAccessory = {
    AbyssShop = T.RT_1,
    ExploreBadgeShop = T.RT_1,
    FishingShop = T.RT_1,
    Rouge = T.RT_1,
    Shop = {
      [10001] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 140218,
          SubTabId = 1401
        }
      },
      [10002] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 140216,
          SubTabId = 1401
        }
      },
      [10003] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 140217,
          SubTabId = 1401
        }
      },
      [10004] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 140215,
          SubTabId = 1401
        }
      },
      [10005] = {
        [1] = {ShopItemId = 140120, SubTabId = 1402}
      },
      [10006] = {
        [1] = {ShopItemId = 140121, SubTabId = 1402}
      },
      [10007] = {
        [1] = {ShopItemId = 140122, SubTabId = 1402}
      },
      [10008] = {
        [1] = {ShopItemId = 140123, SubTabId = 1402}
      },
      [10009] = {
        [1] = {ShopItemId = 140124, SubTabId = 1402}
      },
      [10010] = {
        [1] = {ShopItemId = 140125, SubTabId = 1402}
      },
      [10011] = {
        [1] = {ShopItemId = 140126, SubTabId = 1402}
      },
      [10012] = {
        [1] = {ShopItemId = 140127, SubTabId = 1402}
      },
      [10013] = {
        [1] = {ShopItemId = 140128, SubTabId = 1402}
      },
      [10014] = {
        [1] = {ShopItemId = 140129, SubTabId = 1402}
      },
      [10015] = {
        [1] = {ShopItemId = 140130, SubTabId = 1402}
      },
      [10016] = {
        [1] = {ShopItemId = 140131, SubTabId = 1402}
      }
    }
  },
  WeaponSkin = {
    AbyssShop = T.RT_1,
    ExploreBadgeShop = T.RT_1,
    FishingShop = T.RT_1,
    Rouge = T.RT_1,
    Shop = {
      [3010101] = {
        [1] = {ShopItemId = 120103, SubTabId = 1201}
      },
      [3010201] = {
        [1] = {ShopItemId = 120104, SubTabId = 1201}
      },
      [3010202] = {
        [1] = {ShopItemId = 120101, SubTabId = 1201}
      },
      [3010401] = {
        [1] = {
          AccessOrder = 2,
          ShopItemId = 140202,
          SubTabId = 1401
        }
      }
    }
  }
})
