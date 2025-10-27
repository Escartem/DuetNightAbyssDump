local T = {}
T.RT_1 = {
  [1] = 101,
  [2] = 20011,
  [3] = 20018
}
T.RT_2 = {
  [1] = 1120,
  [2] = 3,
  [3] = 1
}
T.RT_3 = {
  [1] = 2080,
  [2] = 6,
  [3] = 2
}
T.RT_4 = {
  [1] = 101,
  [2] = 20011,
  [3] = 20018,
  [4] = 20013
}
T.RT_5 = {
  [1] = 2560,
  [2] = 9,
  [3] = 3,
  [4] = 4
}
T.RT_6 = {
  [1] = 5840,
  [2] = 15,
  [3] = 5,
  [4] = 6
}
T.RT_7 = {
  [1] = 7200,
  [2] = 30,
  [3] = 10,
  [4] = 8
}
T.RT_8 = {
  [1] = 101,
  [2] = 20013,
  [3] = 20024,
  [4] = 10101
}
T.RT_9 = {
  [1] = 24000,
  [2] = 10,
  [3] = 6,
  [4] = 1
}
T.RT_10 = {
  [1] = 37600,
  [2] = 10,
  [3] = 8,
  [4] = 1
}
T.RT_11 = {
  [1] = 101,
  [2] = 20031,
  [3] = 10101,
  [4] = 10100
}
T.RT_12 = {
  [1] = 72000,
  [2] = 1,
  [3] = 2,
  [4] = 1
}
T.RT_13 = {
  [1] = 136000,
  [2] = 2,
  [3] = 2,
  [4] = 1
}
T.RT_14 = {
  [1] = 1400,
  [2] = 3,
  [3] = 1
}
T.RT_15 = {
  [1] = 2600,
  [2] = 6,
  [3] = 2
}
T.RT_16 = {
  [1] = 3200,
  [2] = 9,
  [3] = 3,
  [4] = 4
}
T.RT_17 = {
  [1] = 7300,
  [2] = 15,
  [3] = 5,
  [4] = 6
}
T.RT_18 = {
  [1] = 9000,
  [2] = 30,
  [3] = 10,
  [4] = 8
}
T.RT_19 = {
  [1] = 30000,
  [2] = 10,
  [3] = 6,
  [4] = 1
}
T.RT_20 = {
  [1] = 47000,
  [2] = 10,
  [3] = 8,
  [4] = 1
}
T.RT_21 = {
  [1] = 90000,
  [2] = 1,
  [3] = 2,
  [4] = 1
}
T.RT_22 = {
  [1] = 170000,
  [2] = 2,
  [3] = 2,
  [4] = 1
}
T.RT_23 = {
  [1] = 101,
  [2] = 20013,
  [3] = 20024,
  [4] = 10103
}
T.RT_24 = {
  [1] = 101,
  [2] = 20031,
  [3] = 10103,
  [4] = 10100
}
T.RT_25 = {
  [1] = 101,
  [2] = 20013,
  [3] = 20024,
  [4] = 10102
}
T.RT_26 = {
  [1] = 101,
  [2] = 20031,
  [3] = 10102,
  [4] = 10100
}
T.RT_27 = {
  [1] = 101,
  [2] = 20005,
  [3] = 20020
}
T.RT_28 = {
  [1] = 101,
  [2] = 20005,
  [3] = 20020,
  [4] = 20013
}
T.RT_29 = {
  [1] = 101,
  [2] = 20002,
  [3] = 20019
}
T.RT_30 = {
  [1] = 101,
  [2] = 20002,
  [3] = 20019,
  [4] = 20013
}
T.RT_31 = {
  [1] = 101,
  [2] = 20013,
  [3] = 20021,
  [4] = 10101
}
T.RT_32 = {
  [1] = 101,
  [2] = 20030,
  [3] = 10101,
  [4] = 10100
}
T.RT_33 = {
  [1] = 101,
  [2] = 20013,
  [3] = 20021,
  [4] = 10104
}
T.RT_34 = {
  [1] = 101,
  [2] = 20030,
  [3] = 10104,
  [4] = 10100
}
T.RT_35 = {
  [1] = 101,
  [2] = 20013,
  [3] = 20021,
  [4] = 10103
}
T.RT_36 = {
  [1] = 101,
  [2] = 20030,
  [3] = 10103,
  [4] = 10100
}
T.RT_37 = {
  [1] = 101,
  [2] = 20013,
  [3] = 20021,
  [4] = 10102
}
T.RT_38 = {
  [1] = 101,
  [2] = 20030,
  [3] = 10102,
  [4] = 10100
}
T.RT_39 = {
  [1] = 101,
  [2] = 20012,
  [3] = 20017
}
T.RT_40 = {
  [1] = 101,
  [2] = 20012,
  [3] = 20017,
  [4] = 20013
}
T.RT_41 = {
  [1] = 101,
  [2] = 20009,
  [3] = 20014
}
T.RT_42 = {
  [1] = 101,
  [2] = 20009,
  [3] = 20014,
  [4] = 20013
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SkillLevelUp", {
  [110101] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_1,
      ItemNum = T.RT_2,
      SkillId = 110101,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_1,
      ItemNum = T.RT_3,
      SkillId = 110101,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_4,
      ItemNum = T.RT_5,
      SkillId = 110101,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_6,
      SkillId = 110101,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_7,
      SkillId = 110101,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_8,
      ItemNum = T.RT_9,
      SkillId = 110101,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_8,
      ItemNum = T.RT_10,
      SkillId = 110101,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_11,
      ItemNum = T.RT_12,
      SkillId = 110101,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_11,
      ItemNum = T.RT_13,
      SkillId = 110101,
      SkillLevel = 9
    }
  },
  [110102] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_1,
      ItemNum = T.RT_2,
      SkillId = 110102,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_1,
      ItemNum = T.RT_3,
      SkillId = 110102,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_4,
      ItemNum = T.RT_5,
      SkillId = 110102,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_6,
      SkillId = 110102,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_7,
      SkillId = 110102,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_8,
      ItemNum = T.RT_9,
      SkillId = 110102,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_8,
      ItemNum = T.RT_10,
      SkillId = 110102,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_11,
      ItemNum = T.RT_12,
      SkillId = 110102,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_11,
      ItemNum = T.RT_13,
      SkillId = 110102,
      SkillLevel = 9
    }
  },
  [110103] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_1,
      ItemNum = T.RT_2,
      SkillId = 110103,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_1,
      ItemNum = T.RT_3,
      SkillId = 110103,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_4,
      ItemNum = T.RT_5,
      SkillId = 110103,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_6,
      SkillId = 110103,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_7,
      SkillId = 110103,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_8,
      ItemNum = T.RT_9,
      SkillId = 110103,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_8,
      ItemNum = T.RT_10,
      SkillId = 110103,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_11,
      ItemNum = T.RT_12,
      SkillId = 110103,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_11,
      ItemNum = T.RT_13,
      SkillId = 110103,
      SkillLevel = 9
    }
  },
  [110301] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_1,
      ItemNum = T.RT_14,
      SkillId = 110301,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_1,
      ItemNum = T.RT_15,
      SkillId = 110301,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_4,
      ItemNum = T.RT_16,
      SkillId = 110301,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_17,
      SkillId = 110301,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_18,
      SkillId = 110301,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_8,
      ItemNum = T.RT_19,
      SkillId = 110301,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_8,
      ItemNum = T.RT_20,
      SkillId = 110301,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_11,
      ItemNum = T.RT_21,
      SkillId = 110301,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_11,
      ItemNum = T.RT_22,
      SkillId = 110301,
      SkillLevel = 9
    }
  },
  [110302] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_1,
      ItemNum = T.RT_14,
      SkillId = 110302,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_1,
      ItemNum = T.RT_15,
      SkillId = 110302,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_4,
      ItemNum = T.RT_16,
      SkillId = 110302,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_17,
      SkillId = 110302,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_18,
      SkillId = 110302,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_8,
      ItemNum = T.RT_19,
      SkillId = 110302,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_8,
      ItemNum = T.RT_20,
      SkillId = 110302,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_11,
      ItemNum = T.RT_21,
      SkillId = 110302,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_11,
      ItemNum = T.RT_22,
      SkillId = 110302,
      SkillLevel = 9
    }
  },
  [110303] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_1,
      ItemNum = T.RT_14,
      SkillId = 110303,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_1,
      ItemNum = T.RT_15,
      SkillId = 110303,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_4,
      ItemNum = T.RT_16,
      SkillId = 110303,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_17,
      SkillId = 110303,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_18,
      SkillId = 110303,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_8,
      ItemNum = T.RT_19,
      SkillId = 110303,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_8,
      ItemNum = T.RT_20,
      SkillId = 110303,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_11,
      ItemNum = T.RT_21,
      SkillId = 110303,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_11,
      ItemNum = T.RT_22,
      SkillId = 110303,
      SkillLevel = 9
    }
  },
  [150101] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_1,
      ItemNum = T.RT_2,
      SkillId = 150101,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_1,
      ItemNum = T.RT_3,
      SkillId = 150101,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_4,
      ItemNum = T.RT_5,
      SkillId = 150101,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_6,
      SkillId = 150101,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_7,
      SkillId = 150101,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_9,
      SkillId = 150101,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_10,
      SkillId = 150101,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_12,
      SkillId = 150101,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_13,
      SkillId = 150101,
      SkillLevel = 9
    }
  },
  [150102] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_1,
      ItemNum = T.RT_2,
      SkillId = 150102,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_1,
      ItemNum = T.RT_3,
      SkillId = 150102,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_4,
      ItemNum = T.RT_5,
      SkillId = 150102,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_6,
      SkillId = 150102,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_7,
      SkillId = 150102,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_9,
      SkillId = 150102,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_10,
      SkillId = 150102,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_12,
      SkillId = 150102,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_13,
      SkillId = 150102,
      SkillLevel = 9
    }
  },
  [150103] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_1,
      ItemNum = T.RT_2,
      SkillId = 150103,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_1,
      ItemNum = T.RT_3,
      SkillId = 150103,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_4,
      ItemNum = T.RT_5,
      SkillId = 150103,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_6,
      SkillId = 150103,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_7,
      SkillId = 150103,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_9,
      SkillId = 150103,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_10,
      SkillId = 150103,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_12,
      SkillId = 150103,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_13,
      SkillId = 150103,
      SkillLevel = 9
    }
  },
  [150201] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_1,
      ItemNum = T.RT_14,
      SkillId = 150201,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_1,
      ItemNum = T.RT_15,
      SkillId = 150201,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_4,
      ItemNum = T.RT_16,
      SkillId = 150201,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_17,
      SkillId = 150201,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_18,
      SkillId = 150201,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_19,
      SkillId = 150201,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_20,
      SkillId = 150201,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_21,
      SkillId = 150201,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_22,
      SkillId = 150201,
      SkillLevel = 9
    }
  },
  [150202] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_1,
      ItemNum = T.RT_14,
      SkillId = 150202,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_1,
      ItemNum = T.RT_15,
      SkillId = 150202,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_4,
      ItemNum = T.RT_16,
      SkillId = 150202,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_17,
      SkillId = 150202,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_18,
      SkillId = 150202,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_19,
      SkillId = 150202,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_20,
      SkillId = 150202,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_21,
      SkillId = 150202,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_22,
      SkillId = 150202,
      SkillLevel = 9
    }
  },
  [150203] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_1,
      ItemNum = T.RT_14,
      SkillId = 150203,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_1,
      ItemNum = T.RT_15,
      SkillId = 150203,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_4,
      ItemNum = T.RT_16,
      SkillId = 150203,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_17,
      SkillId = 150203,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_18,
      SkillId = 150203,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_19,
      SkillId = 150203,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_20,
      SkillId = 150203,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_21,
      SkillId = 150203,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_22,
      SkillId = 150203,
      SkillLevel = 9
    }
  },
  [150301] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_1,
      ItemNum = T.RT_14,
      SkillId = 150301,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_1,
      ItemNum = T.RT_15,
      SkillId = 150301,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_4,
      ItemNum = T.RT_16,
      SkillId = 150301,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_17,
      SkillId = 150301,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_18,
      SkillId = 150301,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_19,
      SkillId = 150301,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_20,
      SkillId = 150301,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_21,
      SkillId = 150301,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_22,
      SkillId = 150301,
      SkillLevel = 9
    }
  },
  [150302] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_1,
      ItemNum = T.RT_14,
      SkillId = 150302,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_1,
      ItemNum = T.RT_15,
      SkillId = 150302,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_4,
      ItemNum = T.RT_16,
      SkillId = 150302,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_17,
      SkillId = 150302,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_18,
      SkillId = 150302,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_19,
      SkillId = 150302,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_20,
      SkillId = 150302,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_21,
      SkillId = 150302,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_22,
      SkillId = 150302,
      SkillLevel = 9
    }
  },
  [150303] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_1,
      ItemNum = T.RT_14,
      SkillId = 150303,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_1,
      ItemNum = T.RT_15,
      SkillId = 150303,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_4,
      ItemNum = T.RT_16,
      SkillId = 150303,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_17,
      SkillId = 150303,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_18,
      SkillId = 150303,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_19,
      SkillId = 150303,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_20,
      SkillId = 150303,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_21,
      SkillId = 150303,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_22,
      SkillId = 150303,
      SkillLevel = 9
    }
  },
  [160101] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_1,
      ItemNum = T.RT_14,
      SkillId = 160101,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_1,
      ItemNum = T.RT_15,
      SkillId = 160101,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_4,
      ItemNum = T.RT_16,
      SkillId = 160101,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_17,
      SkillId = 160101,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_18,
      SkillId = 160101,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_19,
      SkillId = 160101,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_20,
      SkillId = 160101,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_21,
      SkillId = 160101,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_22,
      SkillId = 160101,
      SkillLevel = 9
    }
  },
  [160102] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_1,
      ItemNum = T.RT_14,
      SkillId = 160102,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_1,
      ItemNum = T.RT_15,
      SkillId = 160102,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_4,
      ItemNum = T.RT_16,
      SkillId = 160102,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_17,
      SkillId = 160102,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_18,
      SkillId = 160102,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_19,
      SkillId = 160102,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_20,
      SkillId = 160102,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_21,
      SkillId = 160102,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_22,
      SkillId = 160102,
      SkillLevel = 9
    }
  },
  [160103] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_1,
      ItemNum = T.RT_14,
      SkillId = 160103,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_1,
      ItemNum = T.RT_15,
      SkillId = 160103,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_4,
      ItemNum = T.RT_16,
      SkillId = 160103,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_17,
      SkillId = 160103,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_18,
      SkillId = 160103,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_19,
      SkillId = 160103,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_20,
      SkillId = 160103,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_21,
      SkillId = 160103,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_22,
      SkillId = 160103,
      SkillLevel = 9
    }
  },
  [180101] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_1,
      ItemNum = T.RT_14,
      SkillId = 180101,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_1,
      ItemNum = T.RT_15,
      SkillId = 180101,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_4,
      ItemNum = T.RT_16,
      SkillId = 180101,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_17,
      SkillId = 180101,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_18,
      SkillId = 180101,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_19,
      SkillId = 180101,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_20,
      SkillId = 180101,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_21,
      SkillId = 180101,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_22,
      SkillId = 180101,
      SkillLevel = 9
    }
  },
  [180102] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_1,
      ItemNum = T.RT_14,
      SkillId = 180102,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_1,
      ItemNum = T.RT_15,
      SkillId = 180102,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_4,
      ItemNum = T.RT_16,
      SkillId = 180102,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_17,
      SkillId = 180102,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_18,
      SkillId = 180102,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_19,
      SkillId = 180102,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_20,
      SkillId = 180102,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_21,
      SkillId = 180102,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_22,
      SkillId = 180102,
      SkillLevel = 9
    }
  },
  [180103] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_1,
      ItemNum = T.RT_14,
      SkillId = 180103,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_1,
      ItemNum = T.RT_15,
      SkillId = 180103,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_4,
      ItemNum = T.RT_16,
      SkillId = 180103,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_17,
      SkillId = 180103,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_4,
      ItemNum = T.RT_18,
      SkillId = 180103,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_19,
      SkillId = 180103,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_20,
      SkillId = 180103,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_21,
      SkillId = 180103,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_22,
      SkillId = 180103,
      SkillLevel = 9
    }
  },
  [210101] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_27,
      ItemNum = T.RT_14,
      SkillId = 210101,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_27,
      ItemNum = T.RT_15,
      SkillId = 210101,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_28,
      ItemNum = T.RT_16,
      SkillId = 210101,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_17,
      SkillId = 210101,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_18,
      SkillId = 210101,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_19,
      SkillId = 210101,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_20,
      SkillId = 210101,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_21,
      SkillId = 210101,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_22,
      SkillId = 210101,
      SkillLevel = 9
    }
  },
  [210102] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_27,
      ItemNum = T.RT_14,
      SkillId = 210102,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_27,
      ItemNum = T.RT_15,
      SkillId = 210102,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_28,
      ItemNum = T.RT_16,
      SkillId = 210102,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_17,
      SkillId = 210102,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_18,
      SkillId = 210102,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_19,
      SkillId = 210102,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_20,
      SkillId = 210102,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_21,
      SkillId = 210102,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_22,
      SkillId = 210102,
      SkillLevel = 9
    }
  },
  [210103] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_27,
      ItemNum = T.RT_14,
      SkillId = 210103,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_27,
      ItemNum = T.RT_15,
      SkillId = 210103,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_28,
      ItemNum = T.RT_16,
      SkillId = 210103,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_17,
      SkillId = 210103,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_18,
      SkillId = 210103,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_19,
      SkillId = 210103,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_20,
      SkillId = 210103,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_21,
      SkillId = 210103,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_22,
      SkillId = 210103,
      SkillLevel = 9
    }
  },
  [210201] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_27,
      ItemNum = T.RT_14,
      SkillId = 210201,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_27,
      ItemNum = T.RT_15,
      SkillId = 210201,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_28,
      ItemNum = T.RT_16,
      SkillId = 210201,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_17,
      SkillId = 210201,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_18,
      SkillId = 210201,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_19,
      SkillId = 210201,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_20,
      SkillId = 210201,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_21,
      SkillId = 210201,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_22,
      SkillId = 210201,
      SkillLevel = 9
    }
  },
  [210202] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_27,
      ItemNum = T.RT_14,
      SkillId = 210202,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_27,
      ItemNum = T.RT_15,
      SkillId = 210202,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_28,
      ItemNum = T.RT_16,
      SkillId = 210202,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_17,
      SkillId = 210202,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_18,
      SkillId = 210202,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_19,
      SkillId = 210202,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_20,
      SkillId = 210202,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_21,
      SkillId = 210202,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_22,
      SkillId = 210202,
      SkillLevel = 9
    }
  },
  [210203] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_27,
      ItemNum = T.RT_14,
      SkillId = 210203,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_27,
      ItemNum = T.RT_15,
      SkillId = 210203,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_28,
      ItemNum = T.RT_16,
      SkillId = 210203,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_17,
      SkillId = 210203,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_18,
      SkillId = 210203,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_19,
      SkillId = 210203,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_20,
      SkillId = 210203,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_21,
      SkillId = 210203,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_22,
      SkillId = 210203,
      SkillLevel = 9
    }
  },
  [230101] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_27,
      ItemNum = T.RT_2,
      SkillId = 230101,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_27,
      ItemNum = T.RT_3,
      SkillId = 230101,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_28,
      ItemNum = T.RT_5,
      SkillId = 230101,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_6,
      SkillId = 230101,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_7,
      SkillId = 230101,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_9,
      SkillId = 230101,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_10,
      SkillId = 230101,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_12,
      SkillId = 230101,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_13,
      SkillId = 230101,
      SkillLevel = 9
    }
  },
  [230102] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_27,
      ItemNum = T.RT_2,
      SkillId = 230102,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_27,
      ItemNum = T.RT_3,
      SkillId = 230102,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_28,
      ItemNum = T.RT_5,
      SkillId = 230102,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_6,
      SkillId = 230102,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_7,
      SkillId = 230102,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_9,
      SkillId = 230102,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_10,
      SkillId = 230102,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_12,
      SkillId = 230102,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_13,
      SkillId = 230102,
      SkillLevel = 9
    }
  },
  [230103] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_27,
      ItemNum = T.RT_2,
      SkillId = 230103,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_27,
      ItemNum = T.RT_3,
      SkillId = 230103,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_28,
      ItemNum = T.RT_5,
      SkillId = 230103,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_6,
      SkillId = 230103,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_7,
      SkillId = 230103,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_9,
      SkillId = 230103,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_25,
      ItemNum = T.RT_10,
      SkillId = 230103,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_12,
      SkillId = 230103,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_26,
      ItemNum = T.RT_13,
      SkillId = 230103,
      SkillLevel = 9
    }
  },
  [240101] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_27,
      ItemNum = T.RT_14,
      SkillId = 240101,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_27,
      ItemNum = T.RT_15,
      SkillId = 240101,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_28,
      ItemNum = T.RT_16,
      SkillId = 240101,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_17,
      SkillId = 240101,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_18,
      SkillId = 240101,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_19,
      SkillId = 240101,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_20,
      SkillId = 240101,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_21,
      SkillId = 240101,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_22,
      SkillId = 240101,
      SkillLevel = 9
    }
  },
  [240102] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_27,
      ItemNum = T.RT_14,
      SkillId = 240102,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_27,
      ItemNum = T.RT_15,
      SkillId = 240102,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_28,
      ItemNum = T.RT_16,
      SkillId = 240102,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_17,
      SkillId = 240102,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_18,
      SkillId = 240102,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_19,
      SkillId = 240102,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_20,
      SkillId = 240102,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_21,
      SkillId = 240102,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_22,
      SkillId = 240102,
      SkillLevel = 9
    }
  },
  [240103] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_27,
      ItemNum = T.RT_14,
      SkillId = 240103,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_27,
      ItemNum = T.RT_15,
      SkillId = 240103,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_28,
      ItemNum = T.RT_16,
      SkillId = 240103,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_17,
      SkillId = 240103,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_28,
      ItemNum = T.RT_18,
      SkillId = 240103,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_19,
      SkillId = 240103,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_23,
      ItemNum = T.RT_20,
      SkillId = 240103,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_21,
      SkillId = 240103,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_24,
      ItemNum = T.RT_22,
      SkillId = 240103,
      SkillLevel = 9
    }
  },
  [310101] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_29,
      ItemNum = T.RT_14,
      SkillId = 310101,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_29,
      ItemNum = T.RT_15,
      SkillId = 310101,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_30,
      ItemNum = T.RT_16,
      SkillId = 310101,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_17,
      SkillId = 310101,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_18,
      SkillId = 310101,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_31,
      ItemNum = T.RT_19,
      SkillId = 310101,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_31,
      ItemNum = T.RT_20,
      SkillId = 310101,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_32,
      ItemNum = T.RT_21,
      SkillId = 310101,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_32,
      ItemNum = T.RT_22,
      SkillId = 310101,
      SkillLevel = 9
    }
  },
  [310102] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_29,
      ItemNum = T.RT_14,
      SkillId = 310102,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_29,
      ItemNum = T.RT_15,
      SkillId = 310102,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_30,
      ItemNum = T.RT_16,
      SkillId = 310102,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_17,
      SkillId = 310102,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_18,
      SkillId = 310102,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_31,
      ItemNum = T.RT_19,
      SkillId = 310102,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_31,
      ItemNum = T.RT_20,
      SkillId = 310102,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_32,
      ItemNum = T.RT_21,
      SkillId = 310102,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_32,
      ItemNum = T.RT_22,
      SkillId = 310102,
      SkillLevel = 9
    }
  },
  [310103] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_29,
      ItemNum = T.RT_14,
      SkillId = 310103,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_29,
      ItemNum = T.RT_15,
      SkillId = 310103,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_30,
      ItemNum = T.RT_16,
      SkillId = 310103,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_17,
      SkillId = 310103,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_18,
      SkillId = 310103,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_31,
      ItemNum = T.RT_19,
      SkillId = 310103,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_31,
      ItemNum = T.RT_20,
      SkillId = 310103,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_32,
      ItemNum = T.RT_21,
      SkillId = 310103,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_32,
      ItemNum = T.RT_22,
      SkillId = 310103,
      SkillLevel = 9
    }
  },
  [310201] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_29,
      ItemNum = T.RT_14,
      SkillId = 310201,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_29,
      ItemNum = T.RT_15,
      SkillId = 310201,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_30,
      ItemNum = T.RT_16,
      SkillId = 310201,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_17,
      SkillId = 310201,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_18,
      SkillId = 310201,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_19,
      SkillId = 310201,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_20,
      SkillId = 310201,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_21,
      SkillId = 310201,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_22,
      SkillId = 310201,
      SkillLevel = 9
    }
  },
  [310202] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_29,
      ItemNum = T.RT_14,
      SkillId = 310202,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_29,
      ItemNum = T.RT_15,
      SkillId = 310202,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_30,
      ItemNum = T.RT_16,
      SkillId = 310202,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_17,
      SkillId = 310202,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_18,
      SkillId = 310202,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_19,
      SkillId = 310202,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_20,
      SkillId = 310202,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_21,
      SkillId = 310202,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_22,
      SkillId = 310202,
      SkillLevel = 9
    }
  },
  [310203] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_29,
      ItemNum = T.RT_14,
      SkillId = 310203,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_29,
      ItemNum = T.RT_15,
      SkillId = 310203,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_30,
      ItemNum = T.RT_16,
      SkillId = 310203,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_17,
      SkillId = 310203,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_18,
      SkillId = 310203,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_19,
      SkillId = 310203,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_20,
      SkillId = 310203,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_21,
      SkillId = 310203,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_22,
      SkillId = 310203,
      SkillLevel = 9
    }
  },
  [310301] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_29,
      ItemNum = T.RT_2,
      SkillId = 310301,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_29,
      ItemNum = T.RT_3,
      SkillId = 310301,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_30,
      ItemNum = T.RT_5,
      SkillId = 310301,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_6,
      SkillId = 310301,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_7,
      SkillId = 310301,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_35,
      ItemNum = T.RT_9,
      SkillId = 310301,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_35,
      ItemNum = T.RT_10,
      SkillId = 310301,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_36,
      ItemNum = T.RT_12,
      SkillId = 310301,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_36,
      ItemNum = T.RT_13,
      SkillId = 310301,
      SkillLevel = 9
    }
  },
  [310302] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_29,
      ItemNum = T.RT_2,
      SkillId = 310302,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_29,
      ItemNum = T.RT_3,
      SkillId = 310302,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_30,
      ItemNum = T.RT_5,
      SkillId = 310302,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_6,
      SkillId = 310302,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_7,
      SkillId = 310302,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_35,
      ItemNum = T.RT_9,
      SkillId = 310302,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_35,
      ItemNum = T.RT_10,
      SkillId = 310302,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_36,
      ItemNum = T.RT_12,
      SkillId = 310302,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_36,
      ItemNum = T.RT_13,
      SkillId = 310302,
      SkillLevel = 9
    }
  },
  [310303] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_29,
      ItemNum = T.RT_2,
      SkillId = 310303,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_29,
      ItemNum = T.RT_3,
      SkillId = 310303,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_30,
      ItemNum = T.RT_5,
      SkillId = 310303,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_6,
      SkillId = 310303,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_7,
      SkillId = 310303,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_35,
      ItemNum = T.RT_9,
      SkillId = 310303,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_35,
      ItemNum = T.RT_10,
      SkillId = 310303,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_36,
      ItemNum = T.RT_12,
      SkillId = 310303,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_36,
      ItemNum = T.RT_13,
      SkillId = 310303,
      SkillLevel = 9
    }
  },
  [320101] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_29,
      ItemNum = T.RT_2,
      SkillId = 320101,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_29,
      ItemNum = T.RT_3,
      SkillId = 320101,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_30,
      ItemNum = T.RT_5,
      SkillId = 320101,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_6,
      SkillId = 320101,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_7,
      SkillId = 320101,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_9,
      SkillId = 320101,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_10,
      SkillId = 320101,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_12,
      SkillId = 320101,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_13,
      SkillId = 320101,
      SkillLevel = 9
    }
  },
  [320102] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_29,
      ItemNum = T.RT_2,
      SkillId = 320102,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_29,
      ItemNum = T.RT_3,
      SkillId = 320102,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_30,
      ItemNum = T.RT_5,
      SkillId = 320102,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_6,
      SkillId = 320102,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_7,
      SkillId = 320102,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_9,
      SkillId = 320102,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_10,
      SkillId = 320102,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_12,
      SkillId = 320102,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_13,
      SkillId = 320102,
      SkillLevel = 9
    }
  },
  [320103] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_29,
      ItemNum = T.RT_2,
      SkillId = 320103,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_29,
      ItemNum = T.RT_3,
      SkillId = 320103,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_30,
      ItemNum = T.RT_5,
      SkillId = 320103,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_6,
      SkillId = 320103,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_7,
      SkillId = 320103,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_9,
      SkillId = 320103,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_10,
      SkillId = 320103,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_12,
      SkillId = 320103,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_13,
      SkillId = 320103,
      SkillLevel = 9
    }
  },
  [320201] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_29,
      ItemNum = T.RT_14,
      SkillId = 320201,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_29,
      ItemNum = T.RT_15,
      SkillId = 320201,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_30,
      ItemNum = T.RT_16,
      SkillId = 320201,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_17,
      SkillId = 320201,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_18,
      SkillId = 320201,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_19,
      SkillId = 320201,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_20,
      SkillId = 320201,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_21,
      SkillId = 320201,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_22,
      SkillId = 320201,
      SkillLevel = 9
    }
  },
  [320202] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_29,
      ItemNum = T.RT_14,
      SkillId = 320202,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_29,
      ItemNum = T.RT_15,
      SkillId = 320202,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_30,
      ItemNum = T.RT_16,
      SkillId = 320202,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_17,
      SkillId = 320202,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_18,
      SkillId = 320202,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_19,
      SkillId = 320202,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_20,
      SkillId = 320202,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_21,
      SkillId = 320202,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_22,
      SkillId = 320202,
      SkillLevel = 9
    }
  },
  [320203] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_29,
      ItemNum = T.RT_14,
      SkillId = 320203,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_29,
      ItemNum = T.RT_15,
      SkillId = 320203,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_30,
      ItemNum = T.RT_16,
      SkillId = 320203,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_17,
      SkillId = 320203,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_18,
      SkillId = 320203,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_19,
      SkillId = 320203,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_20,
      SkillId = 320203,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_21,
      SkillId = 320203,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_22,
      SkillId = 320203,
      SkillLevel = 9
    }
  },
  [330101] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_29,
      ItemNum = T.RT_2,
      SkillId = 330101,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_29,
      ItemNum = T.RT_3,
      SkillId = 330101,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_30,
      ItemNum = T.RT_5,
      SkillId = 330101,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_6,
      SkillId = 330101,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_7,
      SkillId = 330101,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_9,
      SkillId = 330101,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_10,
      SkillId = 330101,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_12,
      SkillId = 330101,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_13,
      SkillId = 330101,
      SkillLevel = 9
    }
  },
  [330102] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_29,
      ItemNum = T.RT_2,
      SkillId = 330102,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_29,
      ItemNum = T.RT_3,
      SkillId = 330102,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_30,
      ItemNum = T.RT_5,
      SkillId = 330102,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_6,
      SkillId = 330102,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_7,
      SkillId = 330102,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_9,
      SkillId = 330102,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_10,
      SkillId = 330102,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_12,
      SkillId = 330102,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_13,
      SkillId = 330102,
      SkillLevel = 9
    }
  },
  [330103] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_29,
      ItemNum = T.RT_2,
      SkillId = 330103,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_29,
      ItemNum = T.RT_3,
      SkillId = 330103,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_30,
      ItemNum = T.RT_5,
      SkillId = 330103,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_6,
      SkillId = 330103,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_30,
      ItemNum = T.RT_7,
      SkillId = 330103,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_9,
      SkillId = 330103,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_10,
      SkillId = 330103,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_12,
      SkillId = 330103,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_13,
      SkillId = 330103,
      SkillLevel = 9
    }
  },
  [410101] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_39,
      ItemNum = T.RT_2,
      SkillId = 410101,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_39,
      ItemNum = T.RT_3,
      SkillId = 410101,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_40,
      ItemNum = T.RT_5,
      SkillId = 410101,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_6,
      SkillId = 410101,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_7,
      SkillId = 410101,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_9,
      SkillId = 410101,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_10,
      SkillId = 410101,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_12,
      SkillId = 410101,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_13,
      SkillId = 410101,
      SkillLevel = 9
    }
  },
  [410102] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_39,
      ItemNum = T.RT_2,
      SkillId = 410102,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_39,
      ItemNum = T.RT_3,
      SkillId = 410102,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_40,
      ItemNum = T.RT_5,
      SkillId = 410102,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_6,
      SkillId = 410102,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_7,
      SkillId = 410102,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_9,
      SkillId = 410102,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_10,
      SkillId = 410102,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_12,
      SkillId = 410102,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_13,
      SkillId = 410102,
      SkillLevel = 9
    }
  },
  [410103] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_39,
      ItemNum = T.RT_2,
      SkillId = 410103,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_39,
      ItemNum = T.RT_3,
      SkillId = 410103,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_40,
      ItemNum = T.RT_5,
      SkillId = 410103,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_6,
      SkillId = 410103,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_7,
      SkillId = 410103,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_9,
      SkillId = 410103,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_10,
      SkillId = 410103,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_12,
      SkillId = 410103,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_13,
      SkillId = 410103,
      SkillLevel = 9
    }
  },
  [410201] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_39,
      ItemNum = T.RT_14,
      SkillId = 410201,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_39,
      ItemNum = T.RT_15,
      SkillId = 410201,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_40,
      ItemNum = T.RT_16,
      SkillId = 410201,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_17,
      SkillId = 410201,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_18,
      SkillId = 410201,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_19,
      SkillId = 410201,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_20,
      SkillId = 410201,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_21,
      SkillId = 410201,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_22,
      SkillId = 410201,
      SkillLevel = 9
    }
  },
  [410202] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_39,
      ItemNum = T.RT_14,
      SkillId = 410202,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_39,
      ItemNum = T.RT_15,
      SkillId = 410202,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_40,
      ItemNum = T.RT_16,
      SkillId = 410202,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_17,
      SkillId = 410202,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_18,
      SkillId = 410202,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_19,
      SkillId = 410202,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_20,
      SkillId = 410202,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_21,
      SkillId = 410202,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_22,
      SkillId = 410202,
      SkillLevel = 9
    }
  },
  [410203] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_39,
      ItemNum = T.RT_14,
      SkillId = 410203,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_39,
      ItemNum = T.RT_15,
      SkillId = 410203,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_40,
      ItemNum = T.RT_16,
      SkillId = 410203,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_17,
      SkillId = 410203,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_18,
      SkillId = 410203,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_19,
      SkillId = 410203,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_20,
      SkillId = 410203,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_21,
      SkillId = 410203,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_22,
      SkillId = 410203,
      SkillLevel = 9
    }
  },
  [420101] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_39,
      ItemNum = T.RT_14,
      SkillId = 420101,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_39,
      ItemNum = T.RT_15,
      SkillId = 420101,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_40,
      ItemNum = T.RT_16,
      SkillId = 420101,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_17,
      SkillId = 420101,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_18,
      SkillId = 420101,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_19,
      SkillId = 420101,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_20,
      SkillId = 420101,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_21,
      SkillId = 420101,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_22,
      SkillId = 420101,
      SkillLevel = 9
    }
  },
  [420102] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_39,
      ItemNum = T.RT_14,
      SkillId = 420102,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_39,
      ItemNum = T.RT_15,
      SkillId = 420102,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_40,
      ItemNum = T.RT_16,
      SkillId = 420102,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_17,
      SkillId = 420102,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_18,
      SkillId = 420102,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_19,
      SkillId = 420102,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_20,
      SkillId = 420102,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_21,
      SkillId = 420102,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_22,
      SkillId = 420102,
      SkillLevel = 9
    }
  },
  [420103] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_39,
      ItemNum = T.RT_14,
      SkillId = 420103,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_39,
      ItemNum = T.RT_15,
      SkillId = 420103,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_40,
      ItemNum = T.RT_16,
      SkillId = 420103,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_17,
      SkillId = 420103,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_18,
      SkillId = 420103,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_19,
      SkillId = 420103,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_20,
      SkillId = 420103,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_21,
      SkillId = 420103,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_22,
      SkillId = 420103,
      SkillLevel = 9
    }
  },
  [420201] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_39,
      ItemNum = T.RT_2,
      SkillId = 420201,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_39,
      ItemNum = T.RT_3,
      SkillId = 420201,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_40,
      ItemNum = T.RT_5,
      SkillId = 420201,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_6,
      SkillId = 420201,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_7,
      SkillId = 420201,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_31,
      ItemNum = T.RT_9,
      SkillId = 420201,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_31,
      ItemNum = T.RT_10,
      SkillId = 420201,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_32,
      ItemNum = T.RT_12,
      SkillId = 420201,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_32,
      ItemNum = T.RT_13,
      SkillId = 420201,
      SkillLevel = 9
    }
  },
  [420202] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_39,
      ItemNum = T.RT_2,
      SkillId = 420202,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_39,
      ItemNum = T.RT_3,
      SkillId = 420202,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_40,
      ItemNum = T.RT_5,
      SkillId = 420202,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_6,
      SkillId = 420202,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_7,
      SkillId = 420202,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_31,
      ItemNum = T.RT_9,
      SkillId = 420202,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_31,
      ItemNum = T.RT_10,
      SkillId = 420202,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_32,
      ItemNum = T.RT_12,
      SkillId = 420202,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_32,
      ItemNum = T.RT_13,
      SkillId = 420202,
      SkillLevel = 9
    }
  },
  [420203] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_39,
      ItemNum = T.RT_2,
      SkillId = 420203,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_39,
      ItemNum = T.RT_3,
      SkillId = 420203,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_40,
      ItemNum = T.RT_5,
      SkillId = 420203,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_6,
      SkillId = 420203,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_7,
      SkillId = 420203,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_31,
      ItemNum = T.RT_9,
      SkillId = 420203,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_31,
      ItemNum = T.RT_10,
      SkillId = 420203,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_32,
      ItemNum = T.RT_12,
      SkillId = 420203,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_32,
      ItemNum = T.RT_13,
      SkillId = 420203,
      SkillLevel = 9
    }
  },
  [430101] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_39,
      ItemNum = T.RT_14,
      SkillId = 430101,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_39,
      ItemNum = T.RT_15,
      SkillId = 430101,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_40,
      ItemNum = T.RT_16,
      SkillId = 430101,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_17,
      SkillId = 430101,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_18,
      SkillId = 430101,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_31,
      ItemNum = T.RT_19,
      SkillId = 430101,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_31,
      ItemNum = T.RT_20,
      SkillId = 430101,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_32,
      ItemNum = T.RT_21,
      SkillId = 430101,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_32,
      ItemNum = T.RT_22,
      SkillId = 430101,
      SkillLevel = 9
    }
  },
  [430102] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_39,
      ItemNum = T.RT_14,
      SkillId = 430102,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_39,
      ItemNum = T.RT_15,
      SkillId = 430102,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_40,
      ItemNum = T.RT_16,
      SkillId = 430102,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_17,
      SkillId = 430102,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_18,
      SkillId = 430102,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_31,
      ItemNum = T.RT_19,
      SkillId = 430102,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_31,
      ItemNum = T.RT_20,
      SkillId = 430102,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_32,
      ItemNum = T.RT_21,
      SkillId = 430102,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_32,
      ItemNum = T.RT_22,
      SkillId = 430102,
      SkillLevel = 9
    }
  },
  [430103] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_39,
      ItemNum = T.RT_14,
      SkillId = 430103,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_39,
      ItemNum = T.RT_15,
      SkillId = 430103,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_40,
      ItemNum = T.RT_16,
      SkillId = 430103,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_17,
      SkillId = 430103,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_40,
      ItemNum = T.RT_18,
      SkillId = 430103,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_31,
      ItemNum = T.RT_19,
      SkillId = 430103,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_31,
      ItemNum = T.RT_20,
      SkillId = 430103,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_32,
      ItemNum = T.RT_21,
      SkillId = 430103,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_32,
      ItemNum = T.RT_22,
      SkillId = 430103,
      SkillLevel = 9
    }
  },
  [510101] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_41,
      ItemNum = T.RT_14,
      SkillId = 510101,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_41,
      ItemNum = T.RT_15,
      SkillId = 510101,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_42,
      ItemNum = T.RT_16,
      SkillId = 510101,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_17,
      SkillId = 510101,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_18,
      SkillId = 510101,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_19,
      SkillId = 510101,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_20,
      SkillId = 510101,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_21,
      SkillId = 510101,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_22,
      SkillId = 510101,
      SkillLevel = 9
    }
  },
  [510102] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_41,
      ItemNum = T.RT_14,
      SkillId = 510102,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_41,
      ItemNum = T.RT_15,
      SkillId = 510102,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_42,
      ItemNum = T.RT_16,
      SkillId = 510102,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_17,
      SkillId = 510102,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_18,
      SkillId = 510102,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_19,
      SkillId = 510102,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_20,
      SkillId = 510102,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_21,
      SkillId = 510102,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_22,
      SkillId = 510102,
      SkillLevel = 9
    }
  },
  [510103] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_41,
      ItemNum = T.RT_14,
      SkillId = 510103,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_41,
      ItemNum = T.RT_15,
      SkillId = 510103,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_42,
      ItemNum = T.RT_16,
      SkillId = 510103,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_17,
      SkillId = 510103,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_18,
      SkillId = 510103,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_19,
      SkillId = 510103,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_20,
      SkillId = 510103,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_21,
      SkillId = 510103,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_22,
      SkillId = 510103,
      SkillLevel = 9
    }
  },
  [510201] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_41,
      ItemNum = T.RT_2,
      SkillId = 510201,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_41,
      ItemNum = T.RT_3,
      SkillId = 510201,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_42,
      ItemNum = T.RT_5,
      SkillId = 510201,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_6,
      SkillId = 510201,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_7,
      SkillId = 510201,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_9,
      SkillId = 510201,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_10,
      SkillId = 510201,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_12,
      SkillId = 510201,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_13,
      SkillId = 510201,
      SkillLevel = 9
    }
  },
  [510202] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_41,
      ItemNum = T.RT_2,
      SkillId = 510202,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_41,
      ItemNum = T.RT_3,
      SkillId = 510202,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_42,
      ItemNum = T.RT_5,
      SkillId = 510202,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_6,
      SkillId = 510202,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_7,
      SkillId = 510202,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_9,
      SkillId = 510202,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_10,
      SkillId = 510202,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_12,
      SkillId = 510202,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_13,
      SkillId = 510202,
      SkillLevel = 9
    }
  },
  [510203] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_41,
      ItemNum = T.RT_2,
      SkillId = 510203,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_41,
      ItemNum = T.RT_3,
      SkillId = 510203,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_42,
      ItemNum = T.RT_5,
      SkillId = 510203,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_6,
      SkillId = 510203,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_7,
      SkillId = 510203,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_9,
      SkillId = 510203,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_37,
      ItemNum = T.RT_10,
      SkillId = 510203,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_12,
      SkillId = 510203,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_38,
      ItemNum = T.RT_13,
      SkillId = 510203,
      SkillLevel = 9
    }
  },
  [530101] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_41,
      ItemNum = T.RT_14,
      SkillId = 530101,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_41,
      ItemNum = T.RT_15,
      SkillId = 530101,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_42,
      ItemNum = T.RT_16,
      SkillId = 530101,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_17,
      SkillId = 530101,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_18,
      SkillId = 530101,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_35,
      ItemNum = T.RT_19,
      SkillId = 530101,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_35,
      ItemNum = T.RT_20,
      SkillId = 530101,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_36,
      ItemNum = T.RT_21,
      SkillId = 530101,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_36,
      ItemNum = T.RT_22,
      SkillId = 530101,
      SkillLevel = 9
    }
  },
  [530102] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_41,
      ItemNum = T.RT_14,
      SkillId = 530102,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_41,
      ItemNum = T.RT_15,
      SkillId = 530102,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_42,
      ItemNum = T.RT_16,
      SkillId = 530102,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_17,
      SkillId = 530102,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_18,
      SkillId = 530102,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_35,
      ItemNum = T.RT_19,
      SkillId = 530102,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_35,
      ItemNum = T.RT_20,
      SkillId = 530102,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_36,
      ItemNum = T.RT_21,
      SkillId = 530102,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_36,
      ItemNum = T.RT_22,
      SkillId = 530102,
      SkillLevel = 9
    }
  },
  [530103] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_41,
      ItemNum = T.RT_14,
      SkillId = 530103,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_41,
      ItemNum = T.RT_15,
      SkillId = 530103,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_42,
      ItemNum = T.RT_16,
      SkillId = 530103,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_17,
      SkillId = 530103,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_18,
      SkillId = 530103,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_35,
      ItemNum = T.RT_19,
      SkillId = 530103,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_35,
      ItemNum = T.RT_20,
      SkillId = 530103,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_36,
      ItemNum = T.RT_21,
      SkillId = 530103,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_36,
      ItemNum = T.RT_22,
      SkillId = 530103,
      SkillLevel = 9
    }
  },
  [540101] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_41,
      ItemNum = T.RT_2,
      SkillId = 540101,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_41,
      ItemNum = T.RT_3,
      SkillId = 540101,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_42,
      ItemNum = T.RT_5,
      SkillId = 540101,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_6,
      SkillId = 540101,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_7,
      SkillId = 540101,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_9,
      SkillId = 540101,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_10,
      SkillId = 540101,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_12,
      SkillId = 540101,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_13,
      SkillId = 540101,
      SkillLevel = 9
    }
  },
  [540102] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_41,
      ItemNum = T.RT_2,
      SkillId = 540102,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_41,
      ItemNum = T.RT_3,
      SkillId = 540102,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_42,
      ItemNum = T.RT_5,
      SkillId = 540102,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_6,
      SkillId = 540102,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_7,
      SkillId = 540102,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_9,
      SkillId = 540102,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_10,
      SkillId = 540102,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_12,
      SkillId = 540102,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_13,
      SkillId = 540102,
      SkillLevel = 9
    }
  },
  [540103] = {
    [1] = {
      CharBreakLevel = 1,
      ItemId = T.RT_41,
      ItemNum = T.RT_2,
      SkillId = 540103,
      SkillLevel = 1
    },
    [2] = {
      CharBreakLevel = 2,
      ItemId = T.RT_41,
      ItemNum = T.RT_3,
      SkillId = 540103,
      SkillLevel = 2
    },
    [3] = {
      CharBreakLevel = 3,
      ItemId = T.RT_42,
      ItemNum = T.RT_5,
      SkillId = 540103,
      SkillLevel = 3
    },
    [4] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_6,
      SkillId = 540103,
      SkillLevel = 4
    },
    [5] = {
      CharBreakLevel = 4,
      ItemId = T.RT_42,
      ItemNum = T.RT_7,
      SkillId = 540103,
      SkillLevel = 5
    },
    [6] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_9,
      SkillId = 540103,
      SkillLevel = 6
    },
    [7] = {
      CharBreakLevel = 5,
      ItemId = T.RT_33,
      ItemNum = T.RT_10,
      SkillId = 540103,
      SkillLevel = 7
    },
    [8] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_12,
      SkillId = 540103,
      SkillLevel = 8
    },
    [9] = {
      CharBreakLevel = 6,
      ItemId = T.RT_34,
      ItemNum = T.RT_13,
      SkillId = 540103,
      SkillLevel = 9
    }
  }
})
