local T = {}
T.RT_1 = {
  1,
  2,
  3
}
T.RT_2 = {
  Id = T.RT_1
}
T.RT_3 = {
  [1] = T.RT_2
}
T.RT_4 = {
  [1] = "UI_NewWalnut_Unlock"
}
T.RT_5 = {
  [1] = "Walnut"
}
T.RT_6 = {
  Text = "PlayerLevel_Growth_Unlock_Content"
}
T.RT_7 = {
  [1] = "PlayerLevel_Growth_Unlock",
  [2] = "PlayerLevel_HardBoss_Unlock"
}
T.RT_8 = {
  [1] = "Text",
  [2] = "Text"
}
T.RT_9 = {
  [1] = "UI_NewWalnut_Unlock",
  [2] = "PlayerLevel_Growth_Unlock",
  [3] = "PlayerLevel_HardBoss_Unlock"
}
T.RT_10 = {
  [1] = "Walnut",
  [2] = "Text",
  [3] = "Text"
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PlayerLevelUp", {
  [1] = {
    ModExtractMax = 2000,
    PlayerLevel = 1,
    PlayerLevelMaxExp = 100,
    PlayerLevelReward = 60001
  },
  [2] = {
    ModExtractMax = 2000,
    PlayerLevel = 2,
    PlayerLevelMaxExp = 120,
    PlayerLevelReward = 60002
  },
  [3] = {
    ModExtractMax = 2000,
    PlayerLevel = 3,
    PlayerLevelMaxExp = 140,
    PlayerLevelReward = 60003
  },
  [4] = {
    ModExtractMax = 2000,
    PlayerLevel = 4,
    PlayerLevelMaxExp = 160,
    PlayerLevelReward = 60004
  },
  [5] = {
    ModExtractMax = 2000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerLevel = 5,
    PlayerLevelMaxExp = 180,
    PlayerLevelReward = 60005
  },
  [6] = {
    ModExtractMax = 2000,
    PlayerLevel = 6,
    PlayerLevelMaxExp = 200,
    PlayerLevelReward = 60006
  },
  [7] = {
    ModExtractMax = 2000,
    PlayerLevel = 7,
    PlayerLevelMaxExp = 220,
    PlayerLevelReward = 60007
  },
  [8] = {
    ModExtractMax = 2000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerLevel = 8,
    PlayerLevelMaxExp = 240,
    PlayerLevelReward = 60008
  },
  [9] = {
    ModExtractMax = 2000,
    PlayerLevel = 9,
    PlayerLevelMaxExp = 260,
    PlayerLevelReward = 60009
  },
  [10] = {
    ModExtractMax = 2000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerLevel = 10,
    PlayerLevelMaxExp = 280,
    PlayerLevelReward = 60010
  },
  [11] = {
    ModExtractMax = 2000,
    PlayerLevel = 11,
    PlayerLevelMaxExp = 300,
    PlayerLevelReward = 60011
  },
  [12] = {
    ModExtractMax = 2000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerLevel = 12,
    PlayerLevelMaxExp = 320,
    PlayerLevelReward = 60012
  },
  [13] = {
    ModExtractMax = 2000,
    PlayerLevel = 13,
    PlayerLevelMaxExp = 340,
    PlayerLevelReward = 60013
  },
  [14] = {
    ModExtractMax = 2000,
    PlayerLevel = 14,
    PlayerLevelMaxExp = 360,
    PlayerLevelReward = 60014
  },
  [15] = {
    ModExtractMax = 2000,
    NodeContent = {
      [1] = T.RT_2,
      [2] = T.RT_6
    },
    NodeTitle = {
      [1] = "UI_NewWalnut_Unlock",
      [2] = "PlayerLevel_Growth_Unlock"
    },
    NodeType = {
      [1] = "Walnut",
      [2] = "Text"
    },
    PlayerBuffId = 801,
    PlayerBuffLevel = 1,
    PlayerLevel = 15,
    PlayerLevelMaxExp = 390,
    PlayerLevelReward = 60015
  },
  [16] = {
    ModExtractMax = 2000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 801,
    PlayerBuffLevel = 1,
    PlayerLevel = 16,
    PlayerLevelMaxExp = 420,
    PlayerLevelReward = 60016
  },
  [17] = {
    ModExtractMax = 2000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 801,
    PlayerBuffLevel = 1,
    PlayerLevel = 17,
    PlayerLevelMaxExp = 450,
    PlayerLevelReward = 60017
  },
  [18] = {
    ModExtractMax = 2000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 801,
    PlayerBuffLevel = 1,
    PlayerLevel = 18,
    PlayerLevelMaxExp = 480,
    PlayerLevelReward = 60018
  },
  [19] = {
    ModExtractMax = 2000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 801,
    PlayerBuffLevel = 1,
    PlayerLevel = 19,
    PlayerLevelMaxExp = 510,
    PlayerLevelReward = 60019
  },
  [20] = {
    ModExtractMax = 2000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 801,
    PlayerBuffLevel = 6,
    PlayerLevel = 20,
    PlayerLevelMaxExp = 540,
    PlayerLevelReward = 60020
  },
  [21] = {
    ModExtractMax = 2000,
    PlayerBuffId = 801,
    PlayerBuffLevel = 6,
    PlayerLevel = 21,
    PlayerLevelMaxExp = 570,
    PlayerLevelReward = 60021
  },
  [22] = {
    ModExtractMax = 2000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 801,
    PlayerBuffLevel = 6,
    PlayerLevel = 22,
    PlayerLevelMaxExp = 600,
    PlayerLevelReward = 60022
  },
  [23] = {
    ModExtractMax = 2000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 801,
    PlayerBuffLevel = 6,
    PlayerLevel = 23,
    PlayerLevelMaxExp = 630,
    PlayerLevelReward = 60023
  },
  [24] = {
    ModExtractMax = 2000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 801,
    PlayerBuffLevel = 6,
    PlayerLevel = 24,
    PlayerLevelMaxExp = 660,
    PlayerLevelReward = 60024
  },
  [25] = {
    ModExtractMax = 2500,
    NodeContent = {
      [1] = T.RT_6,
      [2] = {
        Text = "PlayerLevel_HardBoss_Unlock_Content2"
      }
    },
    NodeTitle = T.RT_7,
    NodeType = T.RT_8,
    PlayerBuffId = 802,
    PlayerBuffLevel = 1,
    PlayerLevel = 25,
    PlayerLevelMaxExp = 710,
    PlayerLevelReward = 60025
  },
  [26] = {
    ModExtractMax = 2500,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 802,
    PlayerBuffLevel = 1,
    PlayerLevel = 26,
    PlayerLevelMaxExp = 760,
    PlayerLevelReward = 60026
  },
  [27] = {
    ModExtractMax = 2500,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 802,
    PlayerBuffLevel = 1,
    PlayerLevel = 27,
    PlayerLevelMaxExp = 810,
    PlayerLevelReward = 60027
  },
  [28] = {
    ModExtractMax = 2500,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 802,
    PlayerBuffLevel = 1,
    PlayerLevel = 28,
    PlayerLevelMaxExp = 860,
    PlayerLevelReward = 60028
  },
  [29] = {
    ModExtractMax = 2500,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 802,
    PlayerBuffLevel = 1,
    PlayerLevel = 29,
    PlayerLevelMaxExp = 910,
    PlayerLevelReward = 60029
  },
  [30] = {
    ModExtractMax = 2500,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 802,
    PlayerBuffLevel = 6,
    PlayerLevel = 30,
    PlayerLevelMaxExp = 960,
    PlayerLevelReward = 60030
  },
  [31] = {
    ModExtractMax = 2500,
    PlayerBuffId = 802,
    PlayerBuffLevel = 6,
    PlayerLevel = 31,
    PlayerLevelMaxExp = 1010,
    PlayerLevelReward = 60031
  },
  [32] = {
    ModExtractMax = 2500,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 802,
    PlayerBuffLevel = 6,
    PlayerLevel = 32,
    PlayerLevelMaxExp = 1060,
    PlayerLevelReward = 60032
  },
  [33] = {
    ModExtractMax = 2500,
    PlayerBuffId = 802,
    PlayerBuffLevel = 6,
    PlayerLevel = 33,
    PlayerLevelMaxExp = 1110,
    PlayerLevelReward = 60033
  },
  [34] = {
    ModExtractMax = 2500,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 802,
    PlayerBuffLevel = 6,
    PlayerLevel = 34,
    PlayerLevelMaxExp = 1160,
    PlayerLevelReward = 60034
  },
  [35] = {
    ModExtractMax = 3000,
    NodeContent = {
      [1] = T.RT_6,
      [2] = {
        Text = "PlayerLevel_HardBoss_Unlock_Content3"
      }
    },
    NodeTitle = T.RT_7,
    NodeType = T.RT_8,
    PlayerBuffId = 803,
    PlayerBuffLevel = 1,
    PlayerLevel = 35,
    PlayerLevelMaxExp = 1210,
    PlayerLevelReward = 60035
  },
  [36] = {
    ModExtractMax = 3000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 803,
    PlayerBuffLevel = 1,
    PlayerLevel = 36,
    PlayerLevelMaxExp = 1260,
    PlayerLevelReward = 60036
  },
  [37] = {
    ModExtractMax = 3000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 803,
    PlayerBuffLevel = 1,
    PlayerLevel = 37,
    PlayerLevelMaxExp = 1310,
    PlayerLevelReward = 60037
  },
  [38] = {
    ModExtractMax = 3000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 803,
    PlayerBuffLevel = 1,
    PlayerLevel = 38,
    PlayerLevelMaxExp = 1360,
    PlayerLevelReward = 60038
  },
  [39] = {
    ModExtractMax = 3000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 803,
    PlayerBuffLevel = 1,
    PlayerLevel = 39,
    PlayerLevelMaxExp = 1410,
    PlayerLevelReward = 60039
  },
  [40] = {
    ModExtractMax = 3000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 803,
    PlayerBuffLevel = 6,
    PlayerLevel = 40,
    PlayerLevelMaxExp = 1460,
    PlayerLevelReward = 60040
  },
  [41] = {
    ModExtractMax = 3000,
    PlayerBuffId = 803,
    PlayerBuffLevel = 6,
    PlayerLevel = 41,
    PlayerLevelMaxExp = 1510,
    PlayerLevelReward = 60041
  },
  [42] = {
    ModExtractMax = 3000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 803,
    PlayerBuffLevel = 6,
    PlayerLevel = 42,
    PlayerLevelMaxExp = 1560,
    PlayerLevelReward = 60042
  },
  [43] = {
    ModExtractMax = 3000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 803,
    PlayerBuffLevel = 6,
    PlayerLevel = 43,
    PlayerLevelMaxExp = 1610,
    PlayerLevelReward = 60043
  },
  [44] = {
    ModExtractMax = 3000,
    PlayerBuffId = 803,
    PlayerBuffLevel = 6,
    PlayerLevel = 44,
    PlayerLevelMaxExp = 1660,
    PlayerLevelReward = 60044
  },
  [45] = {
    ModExtractMax = 3500,
    NodeContent = {
      [1] = T.RT_2,
      [2] = T.RT_6,
      [3] = {
        Text = "PlayerLevel_HardBoss_Unlock_Content4"
      }
    },
    NodeTitle = T.RT_9,
    NodeType = T.RT_10,
    PlayerBuffId = 804,
    PlayerBuffLevel = 1,
    PlayerLevel = 45,
    PlayerLevelMaxExp = 2060,
    PlayerLevelReward = 60045
  },
  [46] = {
    ModExtractMax = 3500,
    PlayerBuffId = 804,
    PlayerBuffLevel = 1,
    PlayerLevel = 46,
    PlayerLevelMaxExp = 2460,
    PlayerLevelReward = 60046
  },
  [47] = {
    ModExtractMax = 3500,
    PlayerBuffId = 804,
    PlayerBuffLevel = 1,
    PlayerLevel = 47,
    PlayerLevelMaxExp = 2860,
    PlayerLevelReward = 60047
  },
  [48] = {
    ModExtractMax = 3500,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 804,
    PlayerBuffLevel = 1,
    PlayerLevel = 48,
    PlayerLevelMaxExp = 3260,
    PlayerLevelReward = 60048
  },
  [49] = {
    ModExtractMax = 3500,
    PlayerBuffId = 804,
    PlayerBuffLevel = 1,
    PlayerLevel = 49,
    PlayerLevelMaxExp = 3660,
    PlayerLevelReward = 60049
  },
  [50] = {
    ModExtractMax = 3500,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 804,
    PlayerBuffLevel = 6,
    PlayerLevel = 50,
    PlayerLevelMaxExp = 4060,
    PlayerLevelReward = 60050
  },
  [51] = {
    ModExtractMax = 3500,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 804,
    PlayerBuffLevel = 6,
    PlayerLevel = 51,
    PlayerLevelMaxExp = 4460,
    PlayerLevelReward = 60051
  },
  [52] = {
    ModExtractMax = 3500,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 804,
    PlayerBuffLevel = 6,
    PlayerLevel = 52,
    PlayerLevelMaxExp = 4860,
    PlayerLevelReward = 60052
  },
  [53] = {
    ModExtractMax = 3500,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 804,
    PlayerBuffLevel = 6,
    PlayerLevel = 53,
    PlayerLevelMaxExp = 5260,
    PlayerLevelReward = 60053
  },
  [54] = {
    ModExtractMax = 3500,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 804,
    PlayerBuffLevel = 6,
    PlayerLevel = 54,
    PlayerLevelMaxExp = 5660,
    PlayerLevelReward = 60054
  },
  [55] = {
    ModExtractMax = 4000,
    NodeContent = {
      [1] = T.RT_6,
      [2] = {
        Text = "PlayerLevel_HardBoss_Unlock_Content5"
      }
    },
    NodeTitle = T.RT_7,
    NodeType = T.RT_8,
    PlayerBuffId = 804,
    PlayerBuffLevel = 11,
    PlayerLevel = 55,
    PlayerLevelMaxExp = 7660,
    PlayerLevelReward = 60055
  },
  [56] = {
    ModExtractMax = 4000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 804,
    PlayerBuffLevel = 11,
    PlayerLevel = 56,
    PlayerLevelMaxExp = 9660,
    PlayerLevelReward = 60056
  },
  [57] = {
    ModExtractMax = 4000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 804,
    PlayerBuffLevel = 11,
    PlayerLevel = 57,
    PlayerLevelMaxExp = 11660,
    PlayerLevelReward = 60057
  },
  [58] = {
    ModExtractMax = 4000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 804,
    PlayerBuffLevel = 11,
    PlayerLevel = 58,
    PlayerLevelMaxExp = 13660,
    PlayerLevelReward = 60058
  },
  [59] = {
    ModExtractMax = 4000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 804,
    PlayerBuffLevel = 11,
    PlayerLevel = 59,
    PlayerLevelMaxExp = 15660,
    PlayerLevelReward = 60059
  },
  [60] = {
    ModExtractMax = 5000,
    NodeContent = {
      [1] = T.RT_2,
      [2] = T.RT_6,
      [3] = {
        Text = "PlayerLevel_HardBoss_Unlock_Content6"
      }
    },
    NodeTitle = T.RT_9,
    NodeType = T.RT_10,
    PlayerBuffId = 804,
    PlayerBuffLevel = 12,
    PlayerLevel = 60,
    PlayerLevelMaxExp = 20660,
    PlayerLevelReward = 60060
  },
  [61] = {
    ModExtractMax = 5000,
    PlayerBuffId = 804,
    PlayerBuffLevel = 12,
    PlayerLevel = 61,
    PlayerLevelMaxExp = 30660,
    PlayerLevelReward = 60061
  },
  [62] = {
    ModExtractMax = 5000,
    NodeContent = T.RT_3,
    NodeTitle = T.RT_4,
    NodeType = T.RT_5,
    PlayerBuffId = 804,
    PlayerBuffLevel = 13,
    PlayerLevel = 62,
    PlayerLevelMaxExp = 45660,
    PlayerLevelReward = 60062
  },
  [63] = {
    ModExtractMax = 5000,
    PlayerBuffId = 804,
    PlayerBuffLevel = 13,
    PlayerLevel = 63,
    PlayerLevelMaxExp = 65660,
    PlayerLevelReward = 60063
  },
  [64] = {
    ModExtractMax = 5000,
    PlayerBuffId = 804,
    PlayerBuffLevel = 14,
    PlayerLevel = 64,
    PlayerLevelMaxExp = 90660,
    PlayerLevelReward = 60064
  },
  [65] = {
    ModExtractMax = 5000,
    PlayerBuffId = 804,
    PlayerBuffLevel = 15,
    PlayerLevel = 65,
    PlayerLevelMaxExp = 99999,
    PlayerLevelReward = 60065
  }
})
