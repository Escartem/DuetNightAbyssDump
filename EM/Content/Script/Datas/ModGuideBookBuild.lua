local T = {}
T.RT_1 = {
  32302,
  32102,
  32004,
  22112,
  22007
}
T.RT_2 = {
  32302,
  32101,
  32004,
  22111,
  22007
}
T.RT_3 = {
  32301,
  32103,
  32004,
  22007,
  22113
}
T.RT_4 = {
  32301,
  32102,
  32004,
  22007,
  22112
}
T.RT_5 = {
  32301,
  32101,
  32004,
  22007,
  22111
}
T.RT_6 = {
  31215,
  31326,
  31301,
  31201,
  31202
}
T.RT_7 = {
  31326,
  31201,
  31203,
  31202,
  31001
}
T.RT_8 = {
  31215,
  31217,
  31322,
  31201,
  31301
}
T.RT_9 = {
  31215,
  31323,
  31301,
  31201,
  31202
}
T.RT_10 = {
  31218,
  31201,
  31011,
  31002,
  31301
}
T.RT_11 = {
  33103,
  33004,
  33005,
  23007,
  23113
}
T.RT_12 = {
  33102,
  33004,
  33005,
  23112,
  23007
}
T.RT_13 = {
  33102,
  33004,
  33005,
  23007,
  23112
}
T.RT_14 = {
  33101,
  33004,
  33005,
  23007,
  23111
}
T.RT_15 = {
  33411,
  33103,
  33004,
  33005,
  23007
}
T.RT_16 = {
  33411,
  33101,
  33004,
  33005,
  23007
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ModGuideBookBuild", {
  [1001] = {
    BuildId = 1001,
    InterfaceJumpId = 1101,
    ModList = {
      31215,
      31321,
      31301,
      31201,
      31202
    },
    TabId = 1,
    TargetId = 1101,
    TargetType = "Char"
  },
  [1002] = {
    BuildId = 1002,
    InterfaceJumpId = 1103,
    ModList = {
      31217,
      31202,
      31215,
      31301,
      31001
    },
    TabId = 1,
    TargetId = 1103,
    TargetType = "Char"
  },
  [1003] = {
    BuildId = 1003,
    InterfaceJumpId = 1501,
    ModList = T.RT_6,
    TabId = 1,
    TargetId = 1501,
    TargetType = "Char"
  },
  [1004] = {
    BuildId = 1004,
    InterfaceJumpId = 1502,
    ModList = T.RT_6,
    TabId = 1,
    TargetId = 1502,
    TargetType = "Char"
  },
  [1005] = {
    BuildId = 1005,
    InterfaceJumpId = 1503,
    ModList = {
      31326,
      31001,
      31005,
      31201,
      31301
    },
    TabId = 1,
    TargetId = 1503,
    TargetType = "Char"
  },
  [1006] = {
    BuildId = 1006,
    InterfaceJumpId = 1601,
    ModList = T.RT_7,
    TabId = 1,
    TargetId = 1601,
    TargetType = "Char"
  },
  [1007] = {
    BuildId = 1007,
    InterfaceJumpId = 160101,
    ModList = T.RT_7,
    TabId = 1,
    TargetId = 160101,
    TargetType = "Char"
  },
  [1008] = {
    BuildId = 1008,
    InterfaceJumpId = 1801,
    ModList = {
      31215,
      31217,
      31326,
      31201,
      31301
    },
    TabId = 1,
    TargetId = 1801,
    TargetType = "Char"
  },
  [1009] = {
    BuildId = 1009,
    InterfaceJumpId = 2101,
    ModList = {
      31215,
      31322,
      31301,
      31201,
      31202
    },
    TabId = 1,
    TargetId = 2101,
    TargetType = "Char"
  },
  [1010] = {
    BuildId = 1010,
    InterfaceJumpId = 2301,
    ModList = T.RT_8,
    TabId = 1,
    TargetId = 2301,
    TargetType = "Char"
  },
  [1011] = {
    BuildId = 1011,
    InterfaceJumpId = 2401,
    ModList = T.RT_8,
    TabId = 1,
    TargetId = 2401,
    TargetType = "Char"
  },
  [1012] = {
    BuildId = 1012,
    InterfaceJumpId = 3101,
    ModList = T.RT_9,
    TabId = 1,
    TargetId = 3101,
    TargetType = "Char"
  },
  [1013] = {
    BuildId = 1013,
    InterfaceJumpId = 3102,
    ModList = T.RT_9,
    TabId = 1,
    TargetId = 3102,
    TargetType = "Char"
  },
  [1014] = {
    BuildId = 1014,
    InterfaceJumpId = 3103,
    ModList = T.RT_9,
    TabId = 1,
    TargetId = 3103,
    TargetType = "Char"
  },
  [1015] = {
    BuildId = 1015,
    InterfaceJumpId = 3201,
    ModList = {
      31216,
      31203,
      31011,
      31002,
      31301
    },
    TabId = 1,
    TargetId = 3201,
    TargetType = "Char"
  },
  [1016] = {
    BuildId = 1016,
    InterfaceJumpId = 3301,
    ModList = T.RT_9,
    TabId = 1,
    TargetId = 3301,
    TargetType = "Char"
  },
  [1017] = {
    BuildId = 1017,
    InterfaceJumpId = 4101,
    ModList = {
      31215,
      31324,
      31301,
      31201,
      31202
    },
    TabId = 1,
    TargetId = 4101,
    TargetType = "Char"
  },
  [1018] = {
    BuildId = 1018,
    InterfaceJumpId = 4102,
    ModList = {
      31215,
      31216,
      31324,
      31201,
      31301
    },
    TabId = 1,
    TargetId = 4102,
    TargetType = "Char"
  },
  [1019] = {
    BuildId = 1019,
    InterfaceJumpId = 4201,
    ModList = {
      31324,
      31301,
      31201,
      31005,
      31202
    },
    TabId = 1,
    TargetId = 4201,
    TargetType = "Char"
  },
  [1020] = {
    BuildId = 1020,
    InterfaceJumpId = 4202,
    ModList = {
      31215,
      31015,
      31007,
      31301,
      31201
    },
    TabId = 1,
    TargetId = 4202,
    TargetType = "Char"
  },
  [1021] = {
    BuildId = 1021,
    InterfaceJumpId = 4301,
    ModList = T.RT_10,
    TabId = 1,
    TargetId = 4301,
    TargetType = "Char"
  },
  [1022] = {
    BuildId = 1022,
    InterfaceJumpId = 5101,
    ModList = T.RT_10,
    TabId = 1,
    TargetId = 5101,
    TargetType = "Char"
  },
  [1023] = {
    BuildId = 1023,
    InterfaceJumpId = 5102,
    ModList = {
      31215,
      31325,
      31301,
      31201,
      31005
    },
    TabId = 1,
    TargetId = 5102,
    TargetType = "Char"
  },
  [1024] = {
    BuildId = 1024,
    InterfaceJumpId = 5301,
    ModList = {
      31215,
      31325,
      31301,
      31201,
      31202
    },
    TabId = 1,
    TargetId = 5301,
    TargetType = "Char"
  },
  [1025] = {
    BuildId = 1025,
    InterfaceJumpId = 5401,
    ModList = {
      31215,
      31217,
      31325,
      31301,
      31201
    },
    TabId = 1,
    TargetId = 5401,
    TargetType = "Char"
  },
  [10001] = {
    BuildId = 10001,
    InterfaceJumpId = 10102,
    ModList = T.RT_1,
    TabId = 2,
    TargetId = 10102,
    TargetType = "Weapon"
  },
  [10002] = {
    BuildId = 10002,
    InterfaceJumpId = 10104,
    ModList = T.RT_2,
    TabId = 2,
    TargetId = 10104,
    TargetType = "Weapon"
  },
  [10003] = {
    BuildId = 10003,
    InterfaceJumpId = 10101,
    ModList = T.RT_3,
    TabId = 2,
    TargetId = 10101,
    TargetType = "Weapon"
  },
  [10004] = {
    BuildId = 10004,
    InterfaceJumpId = 10103,
    ModList = T.RT_4,
    TabId = 2,
    TargetId = 10103,
    TargetType = "Weapon"
  },
  [10005] = {
    BuildId = 10005,
    InterfaceJumpId = 10105,
    ModList = T.RT_1,
    TabId = 2,
    TargetId = 10105,
    TargetType = "Weapon"
  },
  [10006] = {
    BuildId = 10006,
    InterfaceJumpId = 10201,
    ModList = T.RT_4,
    TabId = 2,
    TargetId = 10201,
    TargetType = "Weapon"
  },
  [10007] = {
    BuildId = 10007,
    InterfaceJumpId = 10203,
    ModList = T.RT_3,
    TabId = 2,
    TargetId = 10203,
    TargetType = "Weapon"
  },
  [10008] = {
    BuildId = 10008,
    InterfaceJumpId = 10204,
    ModList = T.RT_5,
    TabId = 2,
    TargetId = 10204,
    TargetType = "Weapon"
  },
  [10009] = {
    BuildId = 10009,
    InterfaceJumpId = 10202,
    ModList = T.RT_1,
    TabId = 2,
    TargetId = 10202,
    TargetType = "Weapon"
  },
  [10010] = {
    BuildId = 10010,
    InterfaceJumpId = 10206,
    ModList = T.RT_5,
    TabId = 2,
    TargetId = 10206,
    TargetType = "Weapon"
  },
  [10011] = {
    BuildId = 10011,
    InterfaceJumpId = 10301,
    ModList = T.RT_3,
    TabId = 2,
    TargetId = 10301,
    TargetType = "Weapon"
  },
  [10012] = {
    BuildId = 10012,
    InterfaceJumpId = 10304,
    ModList = T.RT_2,
    TabId = 2,
    TargetId = 10304,
    TargetType = "Weapon"
  },
  [10013] = {
    BuildId = 10013,
    InterfaceJumpId = 10302,
    ModList = T.RT_2,
    TabId = 2,
    TargetId = 10302,
    TargetType = "Weapon"
  },
  [10014] = {
    BuildId = 10014,
    InterfaceJumpId = 10303,
    ModList = T.RT_3,
    TabId = 2,
    TargetId = 10303,
    TargetType = "Weapon"
  },
  [10015] = {
    BuildId = 10015,
    InterfaceJumpId = 10401,
    ModList = T.RT_2,
    TabId = 2,
    TargetId = 10401,
    TargetType = "Weapon"
  },
  [10016] = {
    BuildId = 10016,
    InterfaceJumpId = 10402,
    ModList = T.RT_3,
    TabId = 2,
    TargetId = 10402,
    TargetType = "Weapon"
  },
  [10017] = {
    BuildId = 10017,
    InterfaceJumpId = 10403,
    ModList = T.RT_1,
    TabId = 2,
    TargetId = 10403,
    TargetType = "Weapon"
  },
  [10018] = {
    BuildId = 10018,
    InterfaceJumpId = 10501,
    ModList = T.RT_1,
    TabId = 2,
    TargetId = 10501,
    TargetType = "Weapon"
  },
  [10019] = {
    BuildId = 10019,
    InterfaceJumpId = 10502,
    ModList = T.RT_5,
    TabId = 2,
    TargetId = 10502,
    TargetType = "Weapon"
  },
  [10020] = {
    BuildId = 10020,
    InterfaceJumpId = 10503,
    ModList = {
      32302,
      32103,
      32004,
      22113,
      22007
    },
    TabId = 2,
    TargetId = 10503,
    TargetType = "Weapon"
  },
  [10021] = {
    BuildId = 10021,
    InterfaceJumpId = 10504,
    ModList = T.RT_4,
    TabId = 2,
    TargetId = 10504,
    TargetType = "Weapon"
  },
  [10022] = {
    BuildId = 10022,
    InterfaceJumpId = 10601,
    ModList = T.RT_5,
    TabId = 2,
    TargetId = 10601,
    TargetType = "Weapon"
  },
  [10023] = {
    BuildId = 10023,
    InterfaceJumpId = 10602,
    ModList = T.RT_3,
    TabId = 2,
    TargetId = 10602,
    TargetType = "Weapon"
  },
  [10024] = {
    BuildId = 10024,
    InterfaceJumpId = 10603,
    ModList = T.RT_4,
    TabId = 2,
    TargetId = 10603,
    TargetType = "Weapon"
  },
  [20001] = {
    BuildId = 20001,
    InterfaceJumpId = 20101,
    ModList = {
      33101,
      33004,
      33005,
      23111,
      23007
    },
    TabId = 3,
    TargetId = 20101,
    TargetType = "Weapon"
  },
  [20002] = {
    BuildId = 20002,
    InterfaceJumpId = 20102,
    ModList = T.RT_11,
    TabId = 3,
    TargetId = 20102,
    TargetType = "Weapon"
  },
  [20003] = {
    BuildId = 20003,
    InterfaceJumpId = 20103,
    ModList = T.RT_12,
    TabId = 3,
    TargetId = 20103,
    TargetType = "Weapon"
  },
  [20004] = {
    BuildId = 20004,
    InterfaceJumpId = 20203,
    ModList = T.RT_13,
    TabId = 3,
    TargetId = 20203,
    TargetType = "Weapon"
  },
  [20005] = {
    BuildId = 20005,
    InterfaceJumpId = 20201,
    ModList = T.RT_13,
    TabId = 3,
    TargetId = 20201,
    TargetType = "Weapon"
  },
  [20006] = {
    BuildId = 20006,
    InterfaceJumpId = 20205,
    ModList = T.RT_14,
    TabId = 3,
    TargetId = 20205,
    TargetType = "Weapon"
  },
  [20007] = {
    BuildId = 20007,
    InterfaceJumpId = 20301,
    ModList = T.RT_15,
    TabId = 3,
    TargetId = 20301,
    TargetType = "Weapon"
  },
  [20008] = {
    BuildId = 20008,
    InterfaceJumpId = 20302,
    ModList = T.RT_16,
    TabId = 3,
    TargetId = 20302,
    TargetType = "Weapon"
  },
  [20009] = {
    BuildId = 20009,
    InterfaceJumpId = 20304,
    ModList = T.RT_16,
    TabId = 3,
    TargetId = 20304,
    TargetType = "Weapon"
  },
  [20010] = {
    BuildId = 20010,
    InterfaceJumpId = 20303,
    ModList = T.RT_15,
    TabId = 3,
    TargetId = 20303,
    TargetType = "Weapon"
  },
  [20011] = {
    BuildId = 20011,
    InterfaceJumpId = 20305,
    ModList = T.RT_12,
    TabId = 3,
    TargetId = 20305,
    TargetType = "Weapon"
  },
  [20012] = {
    BuildId = 20012,
    InterfaceJumpId = 20402,
    ModList = T.RT_15,
    TabId = 3,
    TargetId = 20402,
    TargetType = "Weapon"
  },
  [20013] = {
    BuildId = 20013,
    InterfaceJumpId = 20405,
    ModList = T.RT_15,
    TabId = 3,
    TargetId = 20405,
    TargetType = "Weapon"
  },
  [20014] = {
    BuildId = 20014,
    InterfaceJumpId = 20403,
    ModList = T.RT_16,
    TabId = 3,
    TargetId = 20403,
    TargetType = "Weapon"
  },
  [20015] = {
    BuildId = 20015,
    InterfaceJumpId = 20401,
    ModList = T.RT_13,
    TabId = 3,
    TargetId = 20401,
    TargetType = "Weapon"
  },
  [20016] = {
    BuildId = 20016,
    InterfaceJumpId = 20502,
    ModList = {
      33321,
      33102,
      33004,
      33005,
      23007
    },
    TabId = 3,
    TargetId = 20502,
    TargetType = "Weapon"
  },
  [20017] = {
    BuildId = 20017,
    InterfaceJumpId = 20504,
    ModList = {
      33331,
      33102,
      33004,
      33005,
      23007
    },
    TabId = 3,
    TargetId = 20504,
    TargetType = "Weapon"
  },
  [20018] = {
    BuildId = 20018,
    InterfaceJumpId = 20507,
    ModList = T.RT_14,
    TabId = 3,
    TargetId = 20507,
    TargetType = "Weapon"
  },
  [20019] = {
    BuildId = 20019,
    InterfaceJumpId = 20509,
    ModList = {
      33332,
      33101,
      33004,
      33005,
      23007
    },
    TabId = 3,
    TargetId = 20509,
    TargetType = "Weapon"
  },
  [20020] = {
    BuildId = 20020,
    InterfaceJumpId = 20510,
    ModList = T.RT_14,
    TabId = 3,
    TargetId = 20510,
    TargetType = "Weapon"
  },
  [20021] = {
    BuildId = 20021,
    InterfaceJumpId = 20503,
    ModList = {
      33332,
      33101,
      33004,
      33005,
      23111
    },
    TabId = 3,
    TargetId = 20503,
    TargetType = "Weapon"
  },
  [20022] = {
    BuildId = 20022,
    InterfaceJumpId = 20501,
    ModList = T.RT_13,
    TabId = 3,
    TargetId = 20501,
    TargetType = "Weapon"
  },
  [20023] = {
    BuildId = 20023,
    InterfaceJumpId = 20602,
    ModList = T.RT_11,
    TabId = 3,
    TargetId = 20602,
    TargetType = "Weapon"
  },
  [20024] = {
    BuildId = 20024,
    InterfaceJumpId = 20603,
    ModList = T.RT_14,
    TabId = 3,
    TargetId = 20603,
    TargetType = "Weapon"
  },
  [20025] = {
    BuildId = 20025,
    InterfaceJumpId = 20601,
    ModList = T.RT_13,
    TabId = 3,
    TargetId = 20601,
    TargetType = "Weapon"
  },
  [20026] = {
    BuildId = 20026,
    InterfaceJumpId = 20604,
    ModList = {
      33103,
      33004,
      33005,
      23113,
      23007
    },
    TabId = 3,
    TargetId = 20604,
    TargetType = "Weapon"
  }
})
