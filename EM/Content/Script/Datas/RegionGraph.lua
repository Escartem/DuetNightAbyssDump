local T = {}
T.RT_1 = {
  100101,
  100102,
  100103
}
T.RT_2 = {
  100101,
  "TargetPoint_Balcony_Connect1",
  1
}
T.RT_3 = {
  T.RT_2
}
T.RT_4 = {
  RegionTarget = T.RT_3
}
T.RT_5 = {101101, 101103}
T.RT_6 = {
  101107,
  "TargetPoint_Tavern",
  1
}
T.RT_7 = {
  210101,
  "TargetPoint_HomeBase",
  1
}
T.RT_8 = {
  101105,
  "TargetPoint_OutSiderHome",
  1
}
T.RT_9 = {
  101106,
  "TargetPoint_Sanatorium",
  1
}
T.RT_10 = {
  101701,
  "TargetPoint_Sewer",
  1,
  312
}
T.RT_11 = {
  101702,
  "TargetPoint_SewPoorEnter",
  1
}
T.RT_12 = {
  101301,
  "TargetPoint_Kuangkeng",
  1
}
T.RT_13 = {
  101901,
  "TargetPoint_Theater",
  1
}
T.RT_14 = {
  101110,
  "Cp2LeaveSickPoint",
  1
}
T.RT_15 = {
  101111,
  "LC_EnterFlow",
  1
}
T.RT_16 = {
  101108,
  "TargetPoint_Traff2SecEnter",
  1
}
T.RT_17 = {
  101108,
  "TargetPoint_Traff2SecLeave",
  1,
  321
}
T.RT_18 = {
  T.RT_6,
  T.RT_7,
  T.RT_8,
  T.RT_9,
  T.RT_10,
  T.RT_11,
  T.RT_12,
  T.RT_13,
  T.RT_14,
  T.RT_15,
  T.RT_16,
  T.RT_17
}
T.RT_19 = {
  RegionTarget = T.RT_18
}
T.RT_20 = {
  101301,
  101303,
  101304,
  101305
}
T.RT_21 = {
  101103,
  "TargetPoint_Enter_2_TrafficWay",
  1
}
T.RT_22 = {
  T.RT_21
}
T.RT_23 = {
  RegionTarget = T.RT_22
}
T.RT_24 = {
  101701,
  101702,
  101703
}
T.RT_25 = {
  101101,
  "TargetPoint_Sew1_2_IcelakeCity",
  1
}
T.RT_26 = {
  101101,
  "TargetPoint_Sew2_2_IcelakeCity",
  1
}
T.RT_27 = {
  T.RT_25,
  T.RT_26
}
T.RT_28 = {
  RegionTarget = T.RT_27
}
T.RT_29 = {102101, 102102}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RegionGraph", {
  [100101] = {
    RegionStart = T.RT_1,
    SubRegionStart = 100101,
    SubRegionTarget = {
      RegionTarget = {
        {
          100102,
          "TargetPoint_Village_Connect",
          1
        },
        {
          100103,
          "TargetPoint_Village_Connect",
          1
        }
      }
    }
  },
  [100102] = {
    RegionStart = T.RT_1,
    SubRegionStart = 100102,
    SubRegionTarget = T.RT_4
  },
  [100103] = {
    RegionStart = T.RT_1,
    SubRegionStart = 100103,
    SubRegionTarget = T.RT_4
  },
  [100104] = {SubRegionStart = 100104},
  [101101] = {
    RegionStart = T.RT_5,
    SubRegionStart = 101101,
    SubRegionTarget = T.RT_19
  },
  [101103] = {
    RegionStart = T.RT_5,
    SubRegionStart = 101103,
    SubRegionTarget = T.RT_19
  },
  [101105] = {
    SubRegionStart = 101105,
    SubRegionTarget = {
      RegionTarget = {
        {
          101101,
          "TargetPoint_LeaveOutsidersHome",
          1
        }
      }
    }
  },
  [101106] = {
    SubRegionStart = 101106,
    SubRegionTarget = {
      RegionTarget = {
        {
          101101,
          "TargetPoint_LeaveSanatorium",
          1
        }
      }
    }
  },
  [101107] = {
    SubRegionStart = 101107,
    SubRegionTarget = {
      RegionTarget = {
        {
          101101,
          "TargetPoint_LeaveTavern",
          1
        }
      }
    }
  },
  [101108] = {
    SubRegionStart = 101108,
    SubRegionTarget = {
      RegionTarget = {
        {
          101103,
          "TargetPoint_SecLeave",
          1
        },
        {
          101103,
          "TargetPoint_SecrEnter",
          1
        }
      }
    }
  },
  [101110] = {
    SubRegionStart = 101110,
    SubRegionTarget = {
      RegionTarget = {
        {
          101101,
          "SickTelePoint",
          1
        }
      }
    }
  },
  [101111] = {
    SubRegionStart = 101111,
    SubRegionTarget = {
      RegionTarget = {
        {
          101101,
          "LC_LeaveFlow",
          1
        }
      }
    }
  },
  [101301] = {
    RegionStart = T.RT_20,
    SubRegionStart = 101301,
    SubRegionTarget = T.RT_23
  },
  [101303] = {
    RegionStart = T.RT_20,
    SubRegionStart = 101303,
    SubRegionTarget = T.RT_23
  },
  [101304] = {
    RegionStart = T.RT_20,
    SubRegionStart = 101304,
    SubRegionTarget = T.RT_23
  },
  [101305] = {
    RegionStart = T.RT_20,
    SubRegionStart = 101305,
    SubRegionTarget = T.RT_23
  },
  [101701] = {
    RegionStart = T.RT_24,
    SubRegionStart = 101701,
    SubRegionTarget = T.RT_28
  },
  [101702] = {
    RegionStart = T.RT_24,
    SubRegionStart = 101702,
    SubRegionTarget = T.RT_28
  },
  [101703] = {
    RegionStart = T.RT_24,
    SubRegionStart = 101703,
    SubRegionTarget = T.RT_28
  },
  [101901] = {
    SubRegionStart = 101901,
    SubRegionTarget = {
      RegionTarget = {
        {
          101101,
          "LeavePoint_Theater",
          1
        }
      }
    }
  },
  [102101] = {
    RegionStart = T.RT_29,
    SubRegionStart = 102101
  },
  [102102] = {
    RegionStart = T.RT_29,
    SubRegionStart = 102102
  },
  [104901] = {
    SubRegionStart = 104901,
    SubRegionTarget = {
      RegionTarget = {
        {
          104109,
          "TargetPoint_LeaveQiuOffice",
          1
        }
      }
    }
  },
  [210101] = {
    SubRegionStart = 210101,
    SubRegionTarget = {
      RegionTarget = {
        {
          101101,
          "TargetPoint_LeaveHomeBase",
          1
        }
      }
    }
  }
})
