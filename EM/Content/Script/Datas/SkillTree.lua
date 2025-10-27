local T = {}
T.RT_1 = {Skill = 150003}
T.RT_2 = {Skill = 160101}
T.RT_3 = {Attr = 160101}
T.RT_4 = {Attr = 160102}
T.RT_5 = {
  [1] = T.RT_2,
  [2] = T.RT_3,
  [3] = T.RT_4
}
T.RT_6 = {Skill = 160102}
T.RT_7 = {Attr = 160103}
T.RT_8 = {Attr = 160104}
T.RT_9 = {
  [1] = T.RT_6,
  [2] = T.RT_7,
  [3] = T.RT_8
}
T.RT_10 = {Skill = 160103}
T.RT_11 = {Skill = 160104}
T.RT_12 = {Skill = 100005}
T.RT_13 = {
  [1] = T.RT_10,
  [2] = T.RT_11,
  [3] = T.RT_12
}
T.RT_14 = {Skill = 210003}
T.RT_15 = {Skill = 310003}
T.RT_16 = {Skill = 310001}
T.RT_17 = {Skill = 410003}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SkillTree", {
  [1101] = {
    CharID = 1101,
    Skill1 = {
      [1] = {Skill = 110101},
      [2] = {Attr = 110101},
      [3] = {Attr = 110102}
    },
    Skill2 = {
      [1] = {Skill = 110102},
      [2] = {Attr = 110103},
      [3] = {Attr = 110104}
    },
    Skill3 = {
      [1] = {Skill = 110103},
      [2] = {Skill = 110104},
      [3] = {Skill = 110001}
    }
  },
  [1103] = {
    CharID = 1103,
    Skill1 = {
      [1] = {Skill = 110301},
      [2] = {Attr = 110301},
      [3] = {Attr = 110302}
    },
    Skill2 = {
      [1] = {Skill = 110302},
      [2] = {Attr = 110303},
      [3] = {Attr = 110304}
    },
    Skill3 = {
      [1] = {Skill = 110303},
      [2] = {Skill = 110304},
      [3] = {Skill = 110003}
    }
  },
  [1501] = {
    CharID = 1501,
    Skill1 = {
      [1] = {Skill = 150101},
      [2] = {Attr = 150101},
      [3] = {Attr = 150102}
    },
    Skill2 = {
      [1] = {Skill = 150102},
      [2] = {Attr = 150103},
      [3] = {Attr = 150104}
    },
    Skill3 = {
      [1] = {Skill = 150103},
      [2] = {Skill = 150104},
      [3] = {Skill = 150001}
    }
  },
  [1502] = {
    CharID = 1502,
    Skill1 = {
      [1] = {Skill = 150201},
      [2] = {Attr = 150201},
      [3] = {Attr = 150202}
    },
    Skill2 = {
      [1] = {Skill = 150202},
      [2] = {Attr = 150203},
      [3] = {Attr = 150204}
    },
    Skill3 = {
      [1] = {Skill = 150203},
      [2] = {Skill = 150204},
      [3] = T.RT_1
    }
  },
  [1503] = {
    CharID = 1503,
    Skill1 = {
      [1] = {Skill = 150301},
      [2] = {Attr = 150301},
      [3] = {Attr = 150302}
    },
    Skill2 = {
      [1] = {Skill = 150302},
      [2] = {Attr = 150303},
      [3] = {Attr = 150304}
    },
    Skill3 = {
      [1] = {Skill = 150303},
      [2] = {Skill = 150304},
      [3] = T.RT_1
    }
  },
  [1601] = {
    CharID = 1601,
    Skill1 = T.RT_5,
    Skill2 = T.RT_9,
    Skill3 = T.RT_13
  },
  [1801] = {
    CharID = 1801,
    Skill1 = {
      [1] = {Skill = 180101},
      [2] = {Attr = 180101},
      [3] = {Attr = 180102}
    },
    Skill2 = {
      [1] = {Skill = 180102},
      [2] = {Attr = 180103},
      [3] = {Attr = 180104}
    },
    Skill3 = {
      [1] = {Skill = 180103},
      [2] = {Skill = 180104},
      [3] = {Skill = 180191}
    }
  },
  [2101] = {
    CharID = 2101,
    Skill1 = {
      [1] = {Skill = 210101},
      [2] = {Attr = 210101},
      [3] = {Attr = 210102}
    },
    Skill2 = {
      [1] = {Skill = 210102},
      [2] = {Attr = 210103},
      [3] = {Attr = 210104}
    },
    Skill3 = {
      [1] = {Skill = 210103},
      [2] = {Skill = 210104},
      [3] = T.RT_14
    }
  },
  [2102] = {
    CharID = 2102,
    Skill1 = {
      [1] = {Skill = 210201}
    },
    Skill2 = {
      [1] = {Skill = 210202}
    },
    Skill3 = {
      [1] = {Skill = 210203},
      [2] = {Skill = 210204},
      [3] = T.RT_14
    }
  },
  [2301] = {
    CharID = 2301,
    Skill1 = {
      [1] = {Skill = 230101},
      [2] = {Attr = 230101},
      [3] = {Attr = 230102}
    },
    Skill2 = {
      [1] = {Skill = 230102},
      [2] = {Attr = 230103},
      [3] = {Attr = 230104}
    },
    Skill3 = {
      [1] = {Skill = 230103},
      [2] = {Skill = 230104},
      [3] = {Skill = 100003}
    }
  },
  [2401] = {
    CharID = 2401,
    Skill1 = {
      [1] = {Skill = 240101},
      [2] = {Attr = 240101},
      [3] = {Attr = 240102}
    },
    Skill2 = {
      [1] = {Skill = 240102},
      [2] = {Attr = 240103},
      [3] = {Attr = 240104}
    },
    Skill3 = {
      [1] = {Skill = 240103},
      [2] = {Skill = 240104},
      [3] = {Skill = 240191}
    }
  },
  [3101] = {
    CharID = 3101,
    Skill1 = {
      [1] = {Skill = 310101},
      [2] = {Attr = 310101},
      [3] = {Attr = 310102}
    },
    Skill2 = {
      [1] = {Skill = 310102},
      [2] = {Attr = 310103},
      [3] = {Attr = 310104}
    },
    Skill3 = {
      [1] = {Skill = 310103},
      [2] = {Skill = 310104},
      [3] = T.RT_15
    }
  },
  [3102] = {
    CharID = 3102,
    Skill1 = {
      [1] = {Skill = 310201},
      [2] = {Attr = 310201},
      [3] = {Attr = 310202}
    },
    Skill2 = {
      [1] = {Skill = 310202},
      [2] = {Attr = 310203},
      [3] = {Attr = 310204}
    },
    Skill3 = {
      [1] = {Skill = 310203},
      [2] = {Skill = 310204},
      [3] = T.RT_15
    }
  },
  [3103] = {
    CharID = 3103,
    Skill1 = {
      [1] = {Skill = 310301},
      [2] = {Attr = 310301},
      [3] = {Attr = 310302}
    },
    Skill2 = {
      [1] = {Skill = 310302},
      [2] = {Attr = 310303},
      [3] = {Attr = 310304}
    },
    Skill3 = {
      [1] = {Skill = 310303},
      [2] = {Skill = 310304},
      [3] = T.RT_16
    }
  },
  [3201] = {
    CharID = 3201,
    Skill1 = {
      [1] = {Skill = 320101},
      [2] = {Attr = 320101},
      [3] = {Attr = 320102}
    },
    Skill2 = {
      [1] = {Skill = 320102},
      [2] = {Attr = 320103},
      [3] = {Attr = 320104}
    },
    Skill3 = {
      [1] = {Skill = 320103},
      [2] = {Skill = 320104},
      [3] = T.RT_16
    }
  },
  [3202] = {
    CharID = 3202,
    Skill1 = {
      [1] = {Skill = 320201},
      [2] = {Attr = 320201},
      [3] = {Attr = 320202}
    },
    Skill2 = {
      [1] = {Skill = 320202},
      [2] = {Attr = 320203},
      [3] = {Attr = 320204}
    },
    Skill3 = {
      [1] = {Skill = 320203},
      [2] = {Skill = 320204},
      [3] = T.RT_16
    }
  },
  [3301] = {
    CharID = 3301,
    Skill1 = {
      [1] = {Skill = 330101},
      [2] = {Attr = 330101},
      [3] = {Attr = 330102}
    },
    Skill2 = {
      [1] = {Skill = 330102},
      [2] = {Attr = 330103},
      [3] = {Attr = 330104}
    },
    Skill3 = {
      [1] = {Skill = 330103},
      [2] = {Skill = 330104},
      [3] = {Skill = 100001}
    }
  },
  [4101] = {
    CharID = 4101,
    Skill1 = {
      [1] = {Skill = 410101},
      [2] = {Attr = 410101},
      [3] = {Attr = 410102}
    },
    Skill2 = {
      [1] = {Skill = 410102},
      [2] = {Attr = 410103},
      [3] = {Attr = 410104}
    },
    Skill3 = {
      [1] = {Skill = 410103},
      [2] = {Skill = 410104},
      [3] = {Skill = 410001}
    }
  },
  [4102] = {
    CharID = 4102,
    Skill1 = {
      [1] = {Skill = 410201},
      [2] = {Attr = 410201},
      [3] = {Attr = 410202}
    },
    Skill2 = {
      [1] = {Skill = 410202},
      [2] = {Attr = 410203},
      [3] = {Attr = 410204}
    },
    Skill3 = {
      [1] = {Skill = 410203},
      [2] = {Skill = 410204},
      [3] = T.RT_17
    }
  },
  [4201] = {
    CharID = 4201,
    Skill1 = {
      [1] = {Skill = 420101},
      [2] = {Attr = 420101},
      [3] = {Attr = 420102}
    },
    Skill2 = {
      [1] = {Skill = 420102},
      [2] = {Attr = 420103},
      [3] = {Attr = 420104}
    },
    Skill3 = {
      [1] = {Skill = 420103},
      [2] = {Skill = 420104},
      [3] = {Skill = 420191}
    }
  },
  [4202] = {
    CharID = 4202,
    Skill1 = {
      [1] = {Skill = 420201},
      [2] = {Attr = 420201},
      [3] = {Attr = 420202}
    },
    Skill2 = {
      [1] = {Skill = 420202},
      [2] = {Attr = 420203},
      [3] = {Attr = 420204}
    },
    Skill3 = {
      [1] = {Skill = 420203},
      [2] = {Skill = 420204},
      [3] = {Skill = 100007}
    }
  },
  [4301] = {
    CharID = 4301,
    Skill1 = {
      [1] = {Skill = 430101},
      [2] = {Attr = 430101},
      [3] = {Attr = 430102}
    },
    Skill2 = {
      [1] = {Skill = 430102},
      [2] = {Attr = 430103},
      [3] = {Attr = 430104}
    },
    Skill3 = {
      [1] = {Skill = 430103},
      [2] = {Skill = 430104},
      [3] = T.RT_17
    }
  },
  [5101] = {
    CharID = 5101,
    Skill1 = {
      [1] = {Skill = 510101},
      [2] = {Attr = 510101},
      [3] = {Attr = 510102}
    },
    Skill2 = {
      [1] = {Skill = 510102},
      [2] = {Attr = 510103},
      [3] = {Attr = 510104}
    },
    Skill3 = {
      [1] = {Skill = 510103},
      [2] = {Skill = 510106},
      [3] = {Skill = 510191}
    }
  },
  [5102] = {
    CharID = 5102,
    Skill1 = {
      [1] = {Skill = 510201},
      [2] = {Attr = 510201},
      [3] = {Attr = 510202}
    },
    Skill2 = {
      [1] = {Skill = 510202},
      [2] = {Attr = 510203},
      [3] = {Attr = 510204}
    },
    Skill3 = {
      [1] = {Skill = 510203},
      [2] = {Skill = 510204},
      [3] = {Skill = 510001}
    }
  },
  [5301] = {
    CharID = 5301,
    Skill1 = {
      [1] = {Skill = 530101},
      [2] = {Attr = 530101},
      [3] = {Attr = 530102}
    },
    Skill2 = {
      [1] = {Skill = 530102},
      [2] = {Attr = 530103},
      [3] = {Attr = 530104}
    },
    Skill3 = {
      [1] = {Skill = 530103},
      [2] = {Skill = 530104},
      [3] = {Skill = 510003}
    }
  },
  [5401] = {
    CharID = 5401,
    Skill1 = {
      [1] = {Skill = 540101},
      [2] = {Attr = 540101},
      [3] = {Attr = 540102}
    },
    Skill2 = {
      [1] = {Skill = 540102},
      [2] = {Attr = 540103},
      [3] = {Attr = 540104}
    },
    Skill3 = {
      [1] = {Skill = 540103},
      [2] = {Skill = 540104},
      [3] = {Skill = 100009}
    }
  },
  [160101] = {
    CharID = 160101,
    Skill1 = T.RT_5,
    Skill2 = T.RT_9,
    Skill3 = T.RT_13
  }
})
