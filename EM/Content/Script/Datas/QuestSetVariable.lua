local T = {}
T.RT_1 = {Name = "IQ1002", Value = 1}
T.RT_2 = {
  [1] = T.RT_1
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("QuestSetVariable", {
  [10020101] = {
    Start = {
      Info = T.RT_2,
      QuestId = 10020101,
      QuestStartorSuccess = "Start"
    },
    Success = {
      Info = T.RT_2,
      QuestId = 10020101,
      QuestStartorSuccess = "Success"
    }
  },
  [10030101] = {
    Start = {
      Info = {
        [1] = {Name = "IQ1003", Value = 1}
      },
      QuestId = 10030101,
      QuestStartorSuccess = "Start"
    }
  },
  [10030301] = {
    Start = {
      Info = {
        [1] = {Name = "IQ100303", Value = 1}
      },
      QuestId = 10030301,
      QuestStartorSuccess = "Start"
    }
  },
  [10030395] = {
    Success = {
      Info = {
        [1] = {Name = "IQ1002", Value = 0}
      },
      QuestId = 10030395,
      QuestStartorSuccess = "Success"
    }
  },
  [10030401] = {
    Start = {
      Info = {
        [1] = {Name = "IQ100304", Value = 0}
      },
      QuestId = 10030401,
      QuestStartorSuccess = "Start"
    }
  },
  [10030498] = {
    Start = {
      Info = {
        [1] = {Name = "IQ10030498", Value = 1}
      },
      QuestId = 10030498,
      QuestStartorSuccess = "Start"
    }
  },
  [10030499] = {
    Start = {
      Info = {
        [1] = {Name = "IQ100304", Value = 1},
        [2] = {Name = "IQ10030498", Value = 0}
      },
      QuestId = 10030499,
      QuestStartorSuccess = "Start"
    }
  },
  [10030510] = {
    Start = {
      Info = {
        [1] = {Name = "IQ100306", Value = 1}
      },
      QuestId = 10030510,
      QuestStartorSuccess = "Start"
    }
  },
  [10030512] = {
    Success = {
      Info = {
        [1] = {Name = "IQ10030601", Value = 1},
        [2] = {Name = "IQ100306", Value = 0}
      },
      QuestId = 10030512,
      QuestStartorSuccess = "Success"
    }
  },
  [10030601] = {
    Success = {
      Info = {
        [1] = {Name = "IQ10030601", Value = 0}
      },
      QuestId = 10030601,
      QuestStartorSuccess = "Success"
    }
  },
  [11010104] = {
    Success = {
      Info = {
        [1] = {
          Name = "LinshiNPC110101",
          Value = 1
        }
      },
      QuestId = 11010104,
      QuestStartorSuccess = "Success"
    }
  },
  [11010306] = {
    Success = {
      Info = {
        [1] = {Name = "IQ110103", Value = 1}
      },
      QuestId = 11010306,
      QuestStartorSuccess = "Success"
    }
  },
  [11010308] = {
    Success = {
      Info = {
        [1] = {
          Name = "LinshiNPC110101",
          Value = 0
        }
      },
      QuestId = 11010308,
      QuestStartorSuccess = "Success"
    }
  },
  [11010501] = {
    Start = {
      Info = {
        [1] = {
          Name = "XimengNPC110105",
          Value = 1
        }
      },
      QuestId = 11010501,
      QuestStartorSuccess = "Start"
    }
  },
  [11010512] = {
    Start = {
      Info = {
        [1] = {
          Name = "NengYuanNPC110105",
          Value = 0
        }
      },
      QuestId = 11010512,
      QuestStartorSuccess = "Start"
    }
  },
  [11010515] = {
    Start = {
      Info = {
        [1] = {
          Name = "ShenWenNPC110105",
          Value = 1
        }
      },
      QuestId = 11010515,
      QuestStartorSuccess = "Start"
    }
  },
  [11010516] = {
    Success = {
      Info = {
        [1] = {
          Name = "ShenWenNPC110105",
          Value = 0
        }
      },
      QuestId = 11010516,
      QuestStartorSuccess = "Success"
    }
  },
  [11010526] = {
    Success = {
      Info = {
        [1] = {
          Name = "NengYuanNPC110105",
          Value = 1
        }
      },
      QuestId = 11010526,
      QuestStartorSuccess = "Success"
    }
  },
  [11010704] = {
    Success = {
      Info = {
        [1] = {Name = "IQ110107", Value = 1}
      },
      QuestId = 11010704,
      QuestStartorSuccess = "Success"
    }
  },
  [11010706] = {
    Success = {
      Info = {
        [1] = {Name = "NPC110108", Value = 1}
      },
      QuestId = 11010706,
      QuestStartorSuccess = "Success"
    }
  },
  [11010804] = {
    Success = {
      Info = {
        [1] = {Name = "NPC110108", Value = 0}
      },
      QuestId = 11010804,
      QuestStartorSuccess = "Success"
    }
  },
  [11010816] = {
    Success = {
      Info = {
        [1] = {
          Name = "XimengNPC110105",
          Value = 0
        }
      },
      QuestId = 11010816,
      QuestStartorSuccess = "Success"
    }
  }
})
