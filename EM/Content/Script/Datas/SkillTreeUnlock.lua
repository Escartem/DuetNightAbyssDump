local T = {}
T.RT_1 = {
  [1] = 20000,
  [2] = 3
}
T.RT_2 = {
  [1] = 101,
  [2] = 10201
}
T.RT_3 = {1, 2}
T.RT_4 = {
  [1] = 80000,
  [2] = 5,
  [3] = 1,
  [4] = 1
}
T.RT_5 = {
  [1] = 101,
  [2] = 10202,
  [3] = 10101,
  [4] = 10100
}
T.RT_6 = {1, 3}
T.RT_7 = {2, 2}
T.RT_8 = {
  [1] = 160000,
  [2] = 5,
  [3] = 2,
  [4] = 1
}
T.RT_9 = {2, 3}
T.RT_10 = {
  [1] = 10000,
  [2] = 3,
  [3] = 1
}
T.RT_11 = {
  [1] = 101,
  [2] = 10200,
  [3] = 10101
}
T.RT_12 = {3, 2}
T.RT_13 = {
  [1] = 40000,
  [2] = 5,
  [3] = 1
}
T.RT_14 = {
  [1] = 101,
  [2] = 10201,
  [3] = 10101
}
T.RT_15 = {3, 3}
T.RT_16 = {
  [1] = 101,
  [2] = 10202,
  [3] = 10103,
  [4] = 10100
}
T.RT_17 = {
  [1] = 101,
  [2] = 10200,
  [3] = 10103
}
T.RT_18 = {
  [1] = 101,
  [2] = 10201,
  [3] = 10103
}
T.RT_19 = {
  [1] = 101,
  [2] = 10204
}
T.RT_20 = {
  [1] = 101,
  [2] = 10205,
  [3] = 10103,
  [4] = 10100
}
T.RT_21 = {
  [160101] = 4
}
T.RT_22 = {
  [1] = 101,
  [2] = 10207
}
T.RT_23 = {
  [1] = 101,
  [2] = 10208,
  [3] = 10102,
  [4] = 10100
}
T.RT_24 = {
  [160102] = 4
}
T.RT_25 = {
  [1] = 101,
  [2] = 10206,
  [3] = 10102
}
T.RT_26 = {
  [1] = 101,
  [2] = 10207,
  [3] = 10102
}
T.RT_27 = {
  [1] = 101,
  [2] = 10205,
  [3] = 10102,
  [4] = 10100
}
T.RT_28 = {
  [1] = 101,
  [2] = 10203,
  [3] = 10102
}
T.RT_29 = {
  [1] = 101,
  [2] = 10204,
  [3] = 10102
}
T.RT_30 = {
  [1] = 101,
  [2] = 10210
}
T.RT_31 = {
  [1] = 101,
  [2] = 10211,
  [3] = 10102,
  [4] = 10100
}
T.RT_32 = {
  [1] = 101,
  [2] = 10209,
  [3] = 10102
}
T.RT_33 = {
  [1] = 101,
  [2] = 10210,
  [3] = 10102
}
T.RT_34 = {
  [1] = 101,
  [2] = 10208,
  [3] = 10103,
  [4] = 10100
}
T.RT_35 = {
  [1] = 101,
  [2] = 10211,
  [3] = 10101,
  [4] = 10100
}
T.RT_36 = {
  [1] = 101,
  [2] = 10211,
  [3] = 10104,
  [4] = 10100
}
T.RT_37 = {
  [1] = 101,
  [2] = 10211,
  [3] = 10103,
  [4] = 10100
}
T.RT_38 = {
  [1] = 101,
  [2] = 10209,
  [3] = 10103
}
T.RT_39 = {
  [1] = 101,
  [2] = 10210,
  [3] = 10103
}
T.RT_40 = {
  [1] = 101,
  [2] = 10202,
  [3] = 10102,
  [4] = 10100
}
T.RT_41 = {
  [1] = 101,
  [2] = 10200,
  [3] = 10102
}
T.RT_42 = {
  [1] = 101,
  [2] = 10201,
  [3] = 10102
}
T.RT_43 = {
  [1] = 101,
  [2] = 10205,
  [3] = 10104,
  [4] = 10100
}
T.RT_44 = {
  [1] = 101,
  [2] = 10203,
  [3] = 10104
}
T.RT_45 = {
  [1] = 101,
  [2] = 10204,
  [3] = 10104
}
T.RT_46 = {
  [1] = 101,
  [2] = 10202,
  [3] = 10104,
  [4] = 10100
}
T.RT_47 = {
  [1] = 101,
  [2] = 10205,
  [3] = 10101,
  [4] = 10100
}
T.RT_48 = {
  [1] = 101,
  [2] = 10208,
  [3] = 10104,
  [4] = 10100
}
T.RT_49 = {
  [1] = 101,
  [2] = 10206,
  [3] = 10104
}
T.RT_50 = {
  [1] = 101,
  [2] = 10207,
  [3] = 10104
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SkillTreeUnlock", {
  [1101] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 1101,
      NeedSkill = {
        [110101] = 4
      },
      Num = 1,
      ResourceID = T.RT_2,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 1101,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_5,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 1101,
      NeedSkill = {
        [110102] = 4
      },
      Num = 3,
      ResourceID = T.RT_2,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 1101,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_5,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 1101,
      NeedBreak = 2,
      Num = 5,
      ResourceID = T.RT_11,
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 1101,
      NeedBreak = 4,
      Num = 6,
      ResourceID = T.RT_14,
      Skill = T.RT_15
    }
  },
  [1103] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 1103,
      NeedSkill = {
        [110301] = 4
      },
      Num = 1,
      ResourceID = T.RT_2,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 1103,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_5,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 1103,
      NeedSkill = {
        [110302] = 4
      },
      Num = 3,
      ResourceID = T.RT_2,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 1103,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_5,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 1103,
      NeedBreak = 2,
      Num = 5,
      ResourceID = T.RT_11,
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 1103,
      NeedBreak = 4,
      Num = 6,
      ResourceID = T.RT_14,
      Skill = T.RT_15
    }
  },
  [1501] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 1501,
      NeedSkill = {
        [150101] = 4
      },
      Num = 1,
      ResourceID = T.RT_2,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 1501,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_16,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 1501,
      NeedSkill = {
        [150102] = 4
      },
      Num = 3,
      ResourceID = T.RT_2,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 1501,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_16,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 1501,
      NeedBreak = 2,
      Num = 5,
      ResourceID = T.RT_17,
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 1501,
      NeedBreak = 4,
      Num = 6,
      ResourceID = T.RT_18,
      Skill = T.RT_15
    }
  },
  [1502] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 1502,
      NeedSkill = {
        [150201] = 4
      },
      Num = 1,
      ResourceID = T.RT_19,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 1502,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_20,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 1502,
      NeedSkill = {
        [150202] = 4
      },
      Num = 3,
      ResourceID = T.RT_19,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 1502,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_20,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 1502,
      NeedBreak = 2,
      Num = 5,
      ResourceID = {
        [1] = 101,
        [2] = 10203,
        [3] = 10103
      },
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 1502,
      NeedBreak = 4,
      Num = 6,
      ResourceID = {
        [1] = 101,
        [2] = 10204,
        [3] = 10103
      },
      Skill = T.RT_15
    }
  },
  [1503] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 1503,
      NeedSkill = {
        [150301] = 4
      },
      Num = 1,
      ResourceID = T.RT_2,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 1503,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_16,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 1503,
      NeedSkill = {
        [150302] = 4
      },
      Num = 3,
      ResourceID = T.RT_2,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 1503,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_16,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 1503,
      NeedBreak = 2,
      Num = 5,
      ResourceID = T.RT_17,
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 1503,
      NeedBreak = 4,
      Num = 6,
      ResourceID = T.RT_18,
      Skill = T.RT_15
    }
  },
  [1601] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 1601,
      NeedSkill = T.RT_21,
      Num = 1,
      ResourceID = T.RT_22,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 1601,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_23,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 1601,
      NeedSkill = T.RT_24,
      Num = 3,
      ResourceID = T.RT_22,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 1601,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_23,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 1601,
      NeedBreak = 2,
      Num = 5,
      ResourceID = T.RT_25,
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 1601,
      NeedBreak = 4,
      Num = 6,
      ResourceID = T.RT_26,
      Skill = T.RT_15
    }
  },
  [1801] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 1801,
      NeedSkill = {
        [180101] = 4
      },
      Num = 1,
      ResourceID = T.RT_22,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 1801,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_23,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 1801,
      NeedSkill = {
        [180102] = 4
      },
      Num = 3,
      ResourceID = T.RT_22,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 1801,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_23,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 1801,
      NeedBreak = 2,
      Num = 5,
      ResourceID = T.RT_25,
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 1801,
      NeedBreak = 4,
      Num = 6,
      ResourceID = T.RT_26,
      Skill = T.RT_15
    }
  },
  [2101] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 2101,
      NeedSkill = {
        [210101] = 4
      },
      Num = 1,
      ResourceID = T.RT_19,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 2101,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_27,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 2101,
      NeedSkill = {
        [210102] = 4
      },
      Num = 3,
      ResourceID = T.RT_19,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 2101,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_27,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 2101,
      NeedBreak = 2,
      Num = 5,
      ResourceID = T.RT_28,
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 2101,
      NeedBreak = 4,
      Num = 6,
      ResourceID = T.RT_29,
      Skill = T.RT_15
    }
  },
  [2102] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 2102,
      NeedSkill = {
        [210201] = 4
      },
      Num = 1,
      ResourceID = T.RT_19,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 2102,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_27,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 2102,
      NeedSkill = {
        [210202] = 4
      },
      Num = 3,
      ResourceID = T.RT_19,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 2102,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_27,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 2102,
      NeedBreak = 2,
      Num = 5,
      ResourceID = T.RT_28,
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 2102,
      NeedBreak = 4,
      Num = 6,
      ResourceID = T.RT_29,
      Skill = T.RT_15
    }
  },
  [2301] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 2301,
      NeedSkill = {
        [230101] = 4
      },
      Num = 1,
      ResourceID = T.RT_30,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 2301,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_31,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 2301,
      NeedSkill = {
        [230102] = 4
      },
      Num = 3,
      ResourceID = T.RT_30,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 2301,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_31,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 2301,
      NeedBreak = 2,
      Num = 5,
      ResourceID = T.RT_32,
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 2301,
      NeedBreak = 4,
      Num = 6,
      ResourceID = T.RT_33,
      Skill = T.RT_15
    }
  },
  [2401] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 2401,
      NeedSkill = {
        [240101] = 4
      },
      Num = 1,
      ResourceID = T.RT_22,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 2401,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_34,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 2401,
      NeedSkill = {
        [240102] = 4
      },
      Num = 3,
      ResourceID = T.RT_22,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 2401,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_34,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 2401,
      NeedBreak = 2,
      Num = 5,
      ResourceID = {
        [1] = 101,
        [2] = 10206,
        [3] = 10103
      },
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 2401,
      NeedBreak = 4,
      Num = 6,
      ResourceID = {
        [1] = 101,
        [2] = 10207,
        [3] = 10103
      },
      Skill = T.RT_15
    }
  },
  [3101] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 3101,
      NeedSkill = {
        [310101] = 4
      },
      Num = 1,
      ResourceID = T.RT_30,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 3101,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_35,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 3101,
      NeedSkill = {
        [310102] = 4
      },
      Num = 3,
      ResourceID = T.RT_30,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 3101,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_35,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 3101,
      NeedBreak = 2,
      Num = 5,
      ResourceID = {
        [1] = 101,
        [2] = 10209,
        [3] = 10101
      },
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 3101,
      NeedBreak = 4,
      Num = 6,
      ResourceID = {
        [1] = 101,
        [2] = 10210,
        [3] = 10101
      },
      Skill = T.RT_15
    }
  },
  [3102] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 3102,
      NeedSkill = {
        [310201] = 4
      },
      Num = 1,
      ResourceID = T.RT_30,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 3102,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_36,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 3102,
      NeedSkill = {
        [310202] = 4
      },
      Num = 3,
      ResourceID = T.RT_30,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 3102,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_36,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 3102,
      NeedBreak = 2,
      Num = 5,
      ResourceID = {
        [1] = 101,
        [2] = 10209,
        [3] = 10104
      },
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 3102,
      NeedBreak = 4,
      Num = 6,
      ResourceID = {
        [1] = 101,
        [2] = 10210,
        [3] = 10104
      },
      Skill = T.RT_15
    }
  },
  [3103] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 3103,
      NeedSkill = {
        [310301] = 4
      },
      Num = 1,
      ResourceID = T.RT_30,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 3103,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_37,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 3103,
      NeedSkill = {
        [310302] = 4
      },
      Num = 3,
      ResourceID = T.RT_30,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 3103,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_37,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 3103,
      NeedBreak = 2,
      Num = 5,
      ResourceID = T.RT_38,
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 3103,
      NeedBreak = 4,
      Num = 6,
      ResourceID = T.RT_39,
      Skill = T.RT_15
    }
  },
  [3201] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 3201,
      NeedSkill = {
        [320101] = 4
      },
      Num = 1,
      ResourceID = T.RT_2,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 3201,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_40,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 3201,
      NeedSkill = {
        [320102] = 4
      },
      Num = 3,
      ResourceID = T.RT_2,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 3201,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_40,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 3201,
      NeedBreak = 2,
      Num = 5,
      ResourceID = T.RT_41,
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 3201,
      NeedBreak = 4,
      Num = 6,
      ResourceID = T.RT_42,
      Skill = T.RT_15
    }
  },
  [3202] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 3202,
      NeedSkill = {
        [320201] = 4
      },
      Num = 1,
      ResourceID = T.RT_2,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 3202,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_40,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 3202,
      NeedSkill = {
        [320202] = 4
      },
      Num = 3,
      ResourceID = T.RT_2,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 3202,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_40,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 3202,
      NeedBreak = 2,
      Num = 5,
      ResourceID = T.RT_41,
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 3202,
      NeedBreak = 4,
      Num = 6,
      ResourceID = T.RT_42,
      Skill = T.RT_15
    }
  },
  [3301] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 3301,
      NeedSkill = {
        [330101] = 4
      },
      Num = 1,
      ResourceID = T.RT_30,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 3301,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_31,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 3301,
      NeedSkill = {
        [330102] = 4
      },
      Num = 3,
      ResourceID = T.RT_30,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 3301,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_31,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 3301,
      NeedBreak = 2,
      Num = 5,
      ResourceID = T.RT_32,
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 3301,
      NeedBreak = 4,
      Num = 6,
      ResourceID = T.RT_33,
      Skill = T.RT_15
    }
  },
  [4101] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 4101,
      NeedSkill = {
        [410101] = 4
      },
      Num = 1,
      ResourceID = T.RT_19,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 4101,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_43,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 4101,
      NeedSkill = {
        [410102] = 4
      },
      Num = 3,
      ResourceID = T.RT_19,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 4101,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_43,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 4101,
      NeedBreak = 2,
      Num = 5,
      ResourceID = T.RT_44,
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 4101,
      NeedBreak = 4,
      Num = 6,
      ResourceID = T.RT_45,
      Skill = T.RT_15
    }
  },
  [4102] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 4102,
      NeedSkill = {
        [410201] = 4
      },
      Num = 1,
      ResourceID = T.RT_19,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 4102,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_43,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 4102,
      NeedSkill = {
        [410202] = 4
      },
      Num = 3,
      ResourceID = T.RT_19,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 4102,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_43,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 4102,
      NeedBreak = 2,
      Num = 5,
      ResourceID = T.RT_44,
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 4102,
      NeedBreak = 4,
      Num = 6,
      ResourceID = T.RT_45,
      Skill = T.RT_15
    }
  },
  [4201] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 4201,
      NeedSkill = {
        [420101] = 4
      },
      Num = 1,
      ResourceID = T.RT_2,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 4201,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_46,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 4201,
      NeedSkill = {
        [420102] = 4
      },
      Num = 3,
      ResourceID = T.RT_2,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 4201,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_46,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 4201,
      NeedBreak = 2,
      Num = 5,
      ResourceID = {
        [1] = 101,
        [2] = 10200,
        [3] = 10104
      },
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 4201,
      NeedBreak = 4,
      Num = 6,
      ResourceID = {
        [1] = 101,
        [2] = 10201,
        [3] = 10104
      },
      Skill = T.RT_15
    }
  },
  [4202] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 4202,
      NeedSkill = {
        [420201] = 4
      },
      Num = 1,
      ResourceID = T.RT_2,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 4202,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_5,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 4202,
      NeedSkill = {
        [420202] = 4
      },
      Num = 3,
      ResourceID = T.RT_2,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 4202,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_5,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 4202,
      NeedBreak = 2,
      Num = 5,
      ResourceID = T.RT_11,
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 4202,
      NeedBreak = 4,
      Num = 6,
      ResourceID = T.RT_14,
      Skill = T.RT_15
    }
  },
  [4301] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 4301,
      NeedSkill = {
        [430101] = 4
      },
      Num = 1,
      ResourceID = T.RT_19,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 4301,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_47,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 4301,
      NeedSkill = {
        [430102] = 4
      },
      Num = 3,
      ResourceID = T.RT_19,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 4301,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_47,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 4301,
      NeedBreak = 2,
      Num = 5,
      ResourceID = {
        [1] = 101,
        [2] = 10203,
        [3] = 10101
      },
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 4301,
      NeedBreak = 4,
      Num = 6,
      ResourceID = {
        [1] = 101,
        [2] = 10204,
        [3] = 10101
      },
      Skill = T.RT_15
    }
  },
  [5101] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 5101,
      NeedSkill = {
        [510101] = 4
      },
      Num = 1,
      ResourceID = T.RT_22,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 5101,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_48,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 5101,
      NeedSkill = {
        [510102] = 4
      },
      Num = 3,
      ResourceID = T.RT_22,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 5101,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_48,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 5101,
      NeedBreak = 2,
      Num = 5,
      ResourceID = T.RT_49,
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 5101,
      NeedBreak = 4,
      Num = 6,
      ResourceID = T.RT_50,
      Skill = T.RT_15
    }
  },
  [5102] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 5102,
      NeedSkill = {
        [510201] = 4
      },
      Num = 1,
      ResourceID = T.RT_30,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 5102,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_31,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 5102,
      NeedSkill = {
        [510202] = 4
      },
      Num = 3,
      ResourceID = T.RT_30,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 5102,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_31,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 5102,
      NeedBreak = 2,
      Num = 5,
      ResourceID = T.RT_32,
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 5102,
      NeedBreak = 4,
      Num = 6,
      ResourceID = T.RT_33,
      Skill = T.RT_15
    }
  },
  [5301] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 5301,
      NeedSkill = {
        [530101] = 4
      },
      Num = 1,
      ResourceID = T.RT_30,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 5301,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_37,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 5301,
      NeedSkill = {
        [530102] = 4
      },
      Num = 3,
      ResourceID = T.RT_30,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 5301,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_37,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 5301,
      NeedBreak = 2,
      Num = 5,
      ResourceID = T.RT_38,
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 5301,
      NeedBreak = 4,
      Num = 6,
      ResourceID = T.RT_39,
      Skill = T.RT_15
    }
  },
  [5401] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 5401,
      NeedSkill = {
        [540101] = 4
      },
      Num = 1,
      ResourceID = T.RT_22,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 5401,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_48,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 5401,
      NeedSkill = {
        [540102] = 4
      },
      Num = 3,
      ResourceID = T.RT_22,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 5401,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_48,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 5401,
      NeedBreak = 2,
      Num = 5,
      ResourceID = T.RT_49,
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 5401,
      NeedBreak = 4,
      Num = 6,
      ResourceID = T.RT_50,
      Skill = T.RT_15
    }
  },
  [160101] = {
    [1] = {
      Amount = T.RT_1,
      CharID = 160101,
      NeedSkill = T.RT_21,
      Num = 1,
      ResourceID = T.RT_22,
      Skill = T.RT_3
    },
    [2] = {
      Amount = T.RT_4,
      CharID = 160101,
      NeedBreak = 5,
      Num = 2,
      ResourceID = T.RT_23,
      Skill = T.RT_6
    },
    [3] = {
      Amount = T.RT_1,
      CharID = 160101,
      NeedSkill = T.RT_24,
      Num = 3,
      ResourceID = T.RT_22,
      Skill = T.RT_7
    },
    [4] = {
      Amount = T.RT_8,
      CharID = 160101,
      NeedLevel = 75,
      Num = 4,
      ResourceID = T.RT_23,
      Skill = T.RT_9
    },
    [5] = {
      Amount = T.RT_10,
      CharID = 160101,
      NeedBreak = 2,
      Num = 5,
      ResourceID = T.RT_25,
      Skill = T.RT_12
    },
    [6] = {
      Amount = T.RT_13,
      CharID = 160101,
      NeedBreak = 4,
      Num = 6,
      ResourceID = T.RT_26,
      Skill = T.RT_15
    }
  }
})
