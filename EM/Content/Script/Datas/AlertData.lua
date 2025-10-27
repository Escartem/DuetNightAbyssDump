local T = {}
T.RT_1 = {0, 120}
T.RT_2 = {120, 240}
T.RT_3 = {0, 240}
T.RT_4 = {
  AlertRange = T.RT_1,
  AlertRangeDownSpeed = -40,
  AlertRangeHearId = 1,
  AlertRangeSightId = 1,
  AlertRangeUpSpeed = 40
}
T.RT_5 = {
  AlertRange = T.RT_2,
  AlertRangeDownSpeed = -24,
  AlertRangeHearId = 2,
  AlertRangeSightId = 2,
  AlertRangeUpSpeed = 60
}
T.RT_6 = {
  [1] = T.RT_4,
  [2] = T.RT_5
}
T.RT_7 = {
  AlertRange = T.RT_1,
  AlertRangeDownSpeed = -40,
  AlertRangeHearId = 1,
  AlertRangeSightId = 6003001,
  AlertRangeUpSpeed = 40
}
T.RT_8 = {
  AlertRange = T.RT_1,
  AlertRangeDownSpeed = 0,
  AlertRangeHearId = 1,
  AlertRangeSightId = 1,
  AlertRangeUpSpeed = 9999
}
T.RT_9 = {
  AlertRange = T.RT_2,
  AlertRangeDownSpeed = 0,
  AlertRangeHearId = 2,
  AlertRangeSightId = 2,
  AlertRangeUpSpeed = 9999
}
T.RT_10 = {
  [1] = T.RT_8,
  [2] = T.RT_9
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("AlertData", {
  [1] = {
    AlertId = 1,
    AlertRanges = {
      [1] = {
        AlertRange = T.RT_1,
        AlertRangeDownSpeed = -40,
        AlertRangeHearId = 1,
        AlertRangeSightId = 1,
        AlertRangeUpSpeed = 80
      },
      [2] = {
        AlertRange = T.RT_2,
        AlertRangeDownSpeed = -24,
        AlertRangeHearId = 2,
        AlertRangeSightId = 2,
        AlertRangeUpSpeed = 120
      }
    },
    AlertResetChange = 0,
    BroadCastAlertValue = 40,
    BroadCastDis = 1500,
    CanBroadCastAlert = true,
    CommonAlertHearId = 2,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 2,
    FightStateBroarCastTime = 0.5,
    MaxAlertValue = 240
  },
  [10] = {
    AlertId = 10,
    AlertRanges = {
      [1] = {
        AlertRange = T.RT_3,
        AlertRangeDownSpeed = 0,
        AlertRangeHearId = 10,
        AlertRangeSightId = 10,
        AlertRangeUpSpeed = 120
      }
    },
    AlertResetChange = 0,
    BroadCastAlertValue = 40,
    BroadCastDis = 500,
    CanBroadCastAlert = true,
    CommonAlertHearId = 10,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 10,
    FightStateBroarCastTime = 0.5,
    MaxAlertValue = 240
  },
  [11] = {
    AlertId = 11,
    AlertRanges = {
      [1] = {
        AlertRange = T.RT_3,
        AlertRangeDownSpeed = 0,
        AlertRangeHearId = 10,
        AlertRangeSightId = 11,
        AlertRangeUpSpeed = 120
      }
    },
    AlertResetChange = 0,
    BroadCastAlertValue = 40,
    BroadCastDis = 10000,
    CanBroadCastAlert = true,
    CommonAlertHearId = 10,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 11,
    FightStateBroarCastTime = 0.5,
    MaxAlertValue = 240
  },
  [101] = {
    AlarmMode = "UseAlarmMechanism",
    AlertId = 101,
    AlertRanges = T.RT_6,
    AlertResetChange = 0,
    BroadCastAlertValue = 40,
    BroadCastDis = 2000,
    CanBroadCastAlert = true,
    CommonAlertHearId = 2,
    CommonAlertRequestTime = 1,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 2,
    FightStateBroarCastTime = 0.5,
    MaxAlertValue = 240,
    RequestFightDistance = 5000
  },
  [102] = {
    AlertId = 102,
    AlertRanges = T.RT_6,
    AlertResetChange = 0,
    BroadCastAlertValue = 40,
    BroadCastDis = 2000,
    CanBroadCastAlert = true,
    CommonAlertHearId = 2,
    CommonAlertRequestTime = 1,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 2,
    FightStateBroarCastTime = 0.5,
    MaxAlertValue = 240,
    RequestFightDistance = 5000
  },
  [103] = {
    AlertId = 103,
    AlertRanges = {
      [1] = {
        AlertRange = T.RT_1,
        AlertRangeDownSpeed = -40,
        AlertRangeHearId = 103,
        AlertRangeSightId = 103,
        AlertRangeUpSpeed = 40
      },
      [2] = {
        AlertRange = T.RT_2,
        AlertRangeDownSpeed = -24,
        AlertRangeHearId = 103,
        AlertRangeSightId = 103,
        AlertRangeUpSpeed = 20
      }
    },
    AlertResetChange = 0,
    BroadCastAlertValue = 40,
    BroadCastDis = 3000,
    CanBroadCastAlert = true,
    CommonAlertHearId = 103,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 103,
    FightStateBroarCastTime = 0.5,
    MaxAlertValue = 240,
    RequestFightDistance = 5000
  },
  [104] = {
    AlertId = 104,
    AlertRanges = T.RT_6,
    AlertResetChange = 0,
    BroadCastDis = 0,
    CommonAlertHearId = 2,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 2,
    MaxAlertValue = 240
  },
  [105] = {
    AlertId = 105,
    AlertRanges = {
      [1] = {
        AlertRange = T.RT_1,
        AlertRangeDownSpeed = 0,
        AlertRangeHearId = 4,
        AlertRangeSightId = 4,
        AlertRangeUpSpeed = 9999
      },
      [2] = {
        AlertRange = T.RT_2,
        AlertRangeDownSpeed = 0,
        AlertRangeHearId = 4,
        AlertRangeSightId = 4,
        AlertRangeUpSpeed = 9999
      }
    },
    AlertResetChange = 0,
    BroadCastAlertValue = 40,
    BroadCastDis = 2000,
    CanBroadCastAlert = true,
    CommonAlertHearId = 4,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 4,
    FightStateBroarCastTime = 0.5,
    MaxAlertValue = 240,
    RequestFightDistance = 5000
  },
  [201] = {
    AlertId = 201,
    AlertRanges = {
      [1] = {
        AlertRange = T.RT_1,
        AlertRangeDownSpeed = -40,
        AlertRangeHearId = 3,
        AlertRangeSightId = 3,
        AlertRangeUpSpeed = 40
      },
      [2] = {
        AlertRange = T.RT_2,
        AlertRangeDownSpeed = -24,
        AlertRangeHearId = 3,
        AlertRangeSightId = 3,
        AlertRangeUpSpeed = 60
      }
    },
    AlertResetChange = 0,
    BroadCastAlertValue = 40,
    BroadCastDis = 1500,
    CanBroadCastAlert = true,
    CommonAlertHearId = 2,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 2,
    FightStateBroarCastTime = 0.5,
    MaxAlertValue = 240
  },
  [202] = {
    AlertId = 202,
    AlertRanges = T.RT_6,
    AlertResetChange = 0,
    BroadCastAlertValue = 40,
    BroadCastDis = 7000,
    CanBroadCastAlert = true,
    CommonAlertHearId = 2,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 2,
    FightStateBroarCastTime = 0.5,
    MaxAlertValue = 240
  },
  [203] = {
    AlertId = 203,
    AlertRanges = T.RT_6,
    AlertResetChange = 0,
    BroadCastAlertValue = 40,
    BroadCastDis = 7000,
    CanBroadCastAlert = true,
    CommonAlertHearId = 2,
    CommonAlertRequestTime = 1,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 2,
    FightStateBroarCastTime = 0.5,
    MaxAlertValue = 240,
    RequestFightDistance = 5000
  },
  [6001005] = {
    AlertId = 6001005,
    AlertRanges = {
      [1] = {
        AlertRange = T.RT_1,
        AlertRangeDownSpeed = -40,
        AlertRangeHearId = 1,
        AlertRangeSightId = 1,
        AlertRangeUpSpeed = 30
      },
      [2] = T.RT_5
    },
    AlertResetChange = 0,
    BroadCastAlertValue = 40,
    BroadCastDis = 800,
    CanBroadCastAlert = true,
    CommonAlertHearId = 2,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 2,
    FightStateBroarCastTime = 0.5,
    MaxAlertValue = 240,
    RequestFightDistance = 1000
  },
  [6001006] = {
    AlertId = 6001006,
    AlertRanges = {
      [1] = {
        AlertRange = T.RT_1,
        AlertRangeDownSpeed = -40,
        AlertRangeHearId = 1,
        AlertRangeSightId = 1,
        AlertRangeUpSpeed = 240
      },
      [2] = {
        AlertRange = T.RT_2,
        AlertRangeDownSpeed = -24,
        AlertRangeHearId = 2,
        AlertRangeSightId = 2,
        AlertRangeUpSpeed = 240
      }
    },
    AlertResetChange = 0,
    BroadCastAlertValue = 40,
    BroadCastDis = 1700,
    CanBroadCastAlert = true,
    CommonAlertHearId = 2,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 2,
    FightStateBroarCastTime = 0.5,
    MaxAlertValue = 240,
    RequestFightDistance = 1000
  },
  [6002002] = {
    AlertId = 6002002,
    AlertRanges = {
      [1] = {
        AlertRange = T.RT_1,
        AlertRangeDownSpeed = -40,
        AlertRangeHearId = 1,
        AlertRangeSightId = 6002002,
        AlertRangeUpSpeed = 30
      },
      [2] = T.RT_5
    },
    AlertResetChange = 0,
    BroadCastAlertValue = 40,
    BroadCastDis = 500,
    CanBroadCastAlert = true,
    CommonAlertHearId = 2,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 2,
    FightStateBroarCastTime = 0.5,
    MaxAlertValue = 240,
    RequestFightDistance = 1000
  },
  [6003001] = {
    AlertId = 6003001,
    AlertRanges = {
      [1] = T.RT_7,
      [2] = T.RT_5
    },
    AlertResetChange = 0,
    BroadCastAlertValue = 40,
    BroadCastDis = 500,
    CanBroadCastAlert = true,
    CommonAlertHearId = 2,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 2,
    FightStateBroarCastTime = 0.5,
    MaxAlertValue = 240,
    RequestFightDistance = 1000
  },
  [7001001] = {
    AlertId = 7001001,
    AlertRanges = T.RT_6,
    AlertResetChange = 0,
    BroadCastAlertValue = 40,
    BroadCastDis = 0,
    CommonAlertHearId = 2,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 2,
    FightStateBroarCastTime = 0.5,
    MaxAlertValue = 240
  },
  [7002102] = {
    AlertId = 7002102,
    AlertRanges = T.RT_6,
    AlertResetChange = 0,
    BroadCastAlertValue = 40,
    BroadCastDis = 0,
    CommonAlertHearId = 2,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 2,
    MaxAlertValue = 240
  },
  [7002103] = {
    AlertId = 7002103,
    AlertRanges = T.RT_10,
    AlertResetChange = 0,
    BroadCastAlertValue = 40,
    BroadCastDis = 0,
    CommonAlertHearId = 2,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 2,
    MaxAlertValue = 240
  },
  [7003051] = {
    AlertId = 7003051,
    AlertRanges = T.RT_10,
    AlertResetChange = 0,
    BroadCastAlertValue = 40,
    BroadCastDis = 0,
    CommonAlertHearId = 2,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 2,
    MaxAlertValue = 240
  },
  [7008001] = {
    AlertId = 7008001,
    AlertRanges = {
      [1] = {
        AlertRange = T.RT_1,
        AlertRangeDownSpeed = -40,
        AlertRangeHearId = 1,
        AlertRangeSightId = 7008001,
        AlertRangeUpSpeed = 40
      },
      [2] = T.RT_5
    },
    AlertResetChange = 0,
    BroadCastAlertValue = 40,
    BroadCastDis = 0,
    CommonAlertHearId = 2,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 2,
    FightStateBroarCastTime = 0.5,
    MaxAlertValue = 240
  },
  [8504002] = {
    AlertId = 8504002,
    AlertRanges = {
      [1] = {
        AlertRange = T.RT_3,
        AlertRangeDownSpeed = 0,
        AlertRangeHearId = 10,
        AlertRangeSightId = 3,
        AlertRangeUpSpeed = 120
      }
    },
    AlertResetChange = 0,
    BroadCastAlertValue = 40,
    BroadCastDis = 500,
    CommonAlertHearId = 3,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 3,
    FightStateBroarCastTime = 0.5,
    MaxAlertValue = 240
  },
  [9501001] = {
    AlertId = 9501001,
    AlertRanges = {
      [1] = T.RT_7,
      [2] = {
        AlertRange = T.RT_2,
        AlertRangeDownSpeed = -24,
        AlertRangeHearId = 2,
        AlertRangeSightId = 6003001,
        AlertRangeUpSpeed = 60
      }
    },
    AlertResetChange = 0,
    BroadCastAlertValue = 40,
    BroadCastDis = 2000,
    CanBroadCastAlert = true,
    CommonAlertHearId = 2,
    CommonAlertSetValue = 99,
    CommonAlertSightId = 6003001,
    FightStateBroarCastTime = 0.5,
    MaxAlertValue = 240,
    RequestFightDistance = 1000
  },
  [9800001] = {
    AlertId = 9800001,
    AlertRanges = {
      [1] = {
        AlertRange = T.RT_1,
        AlertRangeDownSpeed = 0,
        AlertRangeHearId = 1,
        AlertRangeSightId = 9800001,
        AlertRangeUpSpeed = 240
      },
      [2] = {
        AlertRange = T.RT_2,
        AlertRangeDownSpeed = 0,
        AlertRangeUpSpeed = 0
      }
    },
    AlertResetChange = 0,
    BroadCastDis = 0,
    MaxAlertValue = 240
  },
  [9802001] = {
    AlertId = 9802001,
    AlertRanges = {
      [1] = {
        AlertRange = T.RT_1,
        AlertRangeDownSpeed = 0,
        AlertRangeHearId = 9802001,
        AlertRangeSightId = 9802001,
        AlertRangeUpSpeed = 0
      }
    },
    AlertResetChange = 0,
    BroadCastDis = 0,
    MaxAlertValue = 240
  }
})
