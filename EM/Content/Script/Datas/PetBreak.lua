local T = {}
T.RT_1 = {
  4011,
  4012,
  4013
}
T.RT_2 = {
  [3007] = 1
}
T.RT_3 = {
  4021,
  4022,
  4023
}
T.RT_4 = {
  4031,
  4032,
  4033,
  4039
}
T.RT_5 = {
  4041,
  4042,
  4043
}
T.RT_6 = {
  4051,
  4052,
  4053
}
T.RT_7 = {
  4061,
  4062,
  4063
}
T.RT_8 = {
  4071,
  4072,
  4073,
  4079
}
T.RT_9 = {
  4081,
  4082,
  4083
}
T.RT_10 = {
  4091,
  4092,
  4093
}
T.RT_11 = {
  4111,
  4112,
  4113
}
T.RT_12 = {
  4121,
  4122,
  4123
}
T.RT_13 = {
  4131,
  4132,
  4133
}
T.RT_14 = {
  4141,
  4142,
  4143
}
T.RT_15 = {
  4151,
  4152,
  4153
}
T.RT_16 = {
  4161,
  4162,
  4163
}
T.RT_17 = {4211}
T.RT_18 = {4221}
T.RT_19 = {4231}
T.RT_20 = {4241}
T.RT_21 = {4251}
T.RT_22 = {4261}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PetBreak", {
  [4011] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_1,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4011
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_1,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4011
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_1,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4011
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4011
    }
  },
  [4012] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_1,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4012
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_1,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4012
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_1,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4012
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4012
    }
  },
  [4013] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_1,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4013
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_1,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4013
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_1,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4013
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakNum = 3,
      PetId = 4013
    }
  },
  [4021] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_3,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4021
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_3,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4021
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_3,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4021
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4021
    }
  },
  [4022] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_3,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4022
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_3,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4022
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_3,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4022
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4022
    }
  },
  [4023] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_3,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4023
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_3,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4023
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_3,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4023
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakNum = 3,
      PetId = 4023
    }
  },
  [4031] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_4,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4031
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_4,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4031
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_4,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4031
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4031
    }
  },
  [4032] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_4,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4032
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_4,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4032
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_4,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4032
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4032
    }
  },
  [4033] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_4,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4033
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_4,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4033
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_4,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4033
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakNum = 3,
      PetId = 4033
    }
  },
  [4039] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_4,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4039
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_4,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4039
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_4,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4039
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4039
    }
  },
  [4041] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_5,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4041
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_5,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4041
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_5,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4041
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4041
    }
  },
  [4042] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_5,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4042
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_5,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4042
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_5,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4042
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4042
    }
  },
  [4043] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_5,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4043
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_5,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4043
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_5,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4043
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakNum = 3,
      PetId = 4043
    }
  },
  [4051] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_6,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4051
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_6,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4051
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_6,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4051
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4051
    }
  },
  [4052] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_6,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4052
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_6,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4052
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_6,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4052
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4052
    }
  },
  [4053] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_6,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4053
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_6,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4053
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_6,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4053
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakNum = 3,
      PetId = 4053
    }
  },
  [4061] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_7,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4061
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_7,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4061
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_7,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4061
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4061
    }
  },
  [4062] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_7,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4062
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_7,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4062
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_7,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4062
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4062
    }
  },
  [4063] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_7,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4063
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_7,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4063
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_7,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4063
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakNum = 3,
      PetId = 4063
    }
  },
  [4071] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_8,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4071
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_8,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4071
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_8,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4071
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4071
    }
  },
  [4072] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_8,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4072
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_8,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4072
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_8,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4072
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4072
    }
  },
  [4073] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_8,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4073
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_8,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4073
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_8,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4073
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakNum = 3,
      PetId = 4073
    }
  },
  [4079] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_8,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4079
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_8,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4079
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_8,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4079
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4079
    }
  },
  [4081] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_9,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4081
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_9,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4081
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_9,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4081
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4081
    }
  },
  [4082] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_9,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4082
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_9,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4082
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_9,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4082
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4082
    }
  },
  [4083] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_9,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4083
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_9,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4083
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_9,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4083
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakNum = 3,
      PetId = 4083
    }
  },
  [4091] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_10,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4091
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_10,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4091
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_10,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4091
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4091
    }
  },
  [4092] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_10,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4092
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_10,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4092
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_10,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4092
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4092
    }
  },
  [4093] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_10,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4093
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_10,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4093
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_10,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4093
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakNum = 3,
      PetId = 4093
    }
  },
  [4111] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_11,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4111
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_11,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4111
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_11,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4111
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4111
    }
  },
  [4112] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_11,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4112
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_11,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4112
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_11,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4112
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4112
    }
  },
  [4113] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_11,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4113
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_11,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4113
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_11,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4113
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakNum = 3,
      PetId = 4113
    }
  },
  [4121] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_12,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4121
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_12,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4121
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_12,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4121
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4121
    }
  },
  [4122] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_12,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4122
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_12,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4122
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_12,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4122
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4122
    }
  },
  [4123] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_12,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4123
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_12,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4123
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_12,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4123
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakNum = 3,
      PetId = 4123
    }
  },
  [4131] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_13,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4131
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_13,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4131
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_13,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4131
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4131
    }
  },
  [4132] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_13,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4132
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_13,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4132
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_13,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4132
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4132
    }
  },
  [4133] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_13,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4133
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_13,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4133
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_13,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4133
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakNum = 3,
      PetId = 4133
    }
  },
  [4141] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_14,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4141
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_14,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4141
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_14,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4141
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4141
    }
  },
  [4142] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_14,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4142
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_14,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4142
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_14,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4142
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4142
    }
  },
  [4143] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_14,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4143
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_14,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4143
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_14,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4143
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakNum = 3,
      PetId = 4143
    }
  },
  [4151] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_15,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4151
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_15,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4151
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_15,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4151
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4151
    }
  },
  [4152] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_15,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4152
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_15,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4152
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_15,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4152
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4152
    }
  },
  [4153] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_15,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4153
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_15,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4153
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_15,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4153
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakNum = 3,
      PetId = 4153
    }
  },
  [4161] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_16,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4161
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_16,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4161
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_16,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4161
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4161
    }
  },
  [4162] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_16,
      ConsumeResource = T.RT_2,
      EntryNum = 0,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4162
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_16,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4162
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_16,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4162
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakNum = 3,
      PetId = 4162
    }
  },
  [4163] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_16,
      ConsumeResource = T.RT_2,
      EntryNum = 1,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4163
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_16,
      ConsumeResource = T.RT_2,
      EntryNum = 2,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4163
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_16,
      ConsumeResource = T.RT_2,
      EntryNum = 3,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4163
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakNum = 3,
      PetId = 4163
    }
  },
  [4211] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_17,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4211
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_17,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4211
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_17,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4211
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakNum = 3,
      PetId = 4211
    }
  },
  [4221] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_18,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4221
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_18,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4221
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_18,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4221
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakNum = 3,
      PetId = 4221
    }
  },
  [4231] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_19,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4231
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_19,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4231
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_19,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4231
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakNum = 3,
      PetId = 4231
    }
  },
  [4241] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_20,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4241
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_20,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4241
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_20,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4241
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakNum = 3,
      PetId = 4241
    }
  },
  [4251] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_21,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4251
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_21,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4251
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_21,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4251
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakNum = 3,
      PetId = 4251
    }
  },
  [4261] = {
    [0] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_22,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakLevel = 20,
      PetBreakNum = 0,
      PetId = 4261
    },
    [1] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_22,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakLevel = 40,
      PetBreakNum = 1,
      PetId = 4261
    },
    [2] = {
      CollectRewardExp = 50,
      ConsumePetId = T.RT_22,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakLevel = 60,
      PetBreakNum = 2,
      PetId = 4261
    },
    [3] = {
      CollectRewardExp = 50,
      ConsumeResource = T.RT_2,
      EntryNum = 4,
      PetBreakNum = 3,
      PetId = 4261
    }
  },
  [4911] = {
    [0] = {
      EntryNum = 1,
      PetBreakNum = 0,
      PetId = 4911
    }
  },
  [4912] = {
    [0] = {
      EntryNum = 1,
      PetBreakNum = 0,
      PetId = 4912
    }
  },
  [4913] = {
    [0] = {
      EntryNum = 1,
      PetBreakNum = 0,
      PetId = 4913
    }
  },
  [4921] = {
    [0] = {
      EntryNum = 1,
      PetBreakNum = 0,
      PetId = 4921
    }
  },
  [4922] = {
    [0] = {
      EntryNum = 1,
      PetBreakNum = 0,
      PetId = 4922
    }
  },
  [4923] = {
    [0] = {
      EntryNum = 1,
      PetBreakNum = 0,
      PetId = 4923
    }
  },
  [4931] = {
    [0] = {
      EntryNum = 1,
      PetBreakNum = 0,
      PetId = 4931
    }
  },
  [4932] = {
    [0] = {
      EntryNum = 1,
      PetBreakNum = 0,
      PetId = 4932
    }
  },
  [4933] = {
    [0] = {
      EntryNum = 1,
      PetBreakNum = 0,
      PetId = 4933
    }
  },
  [4934] = {
    [0] = {
      EntryNum = 1,
      PetBreakNum = 0,
      PetId = 4934
    }
  },
  [4935] = {
    [0] = {
      EntryNum = 1,
      PetBreakNum = 0,
      PetId = 4935
    }
  },
  [4936] = {
    [0] = {
      EntryNum = 1,
      PetBreakNum = 0,
      PetId = 4936
    }
  }
})
