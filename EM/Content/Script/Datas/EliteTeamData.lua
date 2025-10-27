local T = {}
T.RT_1 = {0, 0}
T.RT_2 = {
  OffsetXY = T.RT_1
}
T.RT_3 = {
  [1] = T.RT_2
}
T.RT_4 = {
  HalfHeight = 90,
  MaxLength = 200,
  MaxWidth = 100,
  Radius = 45,
  StepHeight = 50,
  WalkableFloorAngle = 60
}
T.RT_5 = {260, 0}
T.RT_6 = {
  OffsetXY = T.RT_5
}
T.RT_7 = {
  [1] = T.RT_6
}
T.RT_8 = {200, 0}
T.RT_9 = {
  OffsetXY = T.RT_8
}
T.RT_10 = {
  [1] = T.RT_9
}
T.RT_11 = {
  0,
  0,
  0
}
T.RT_12 = {
  OffsetXY = T.RT_11
}
T.RT_13 = {
  Interval = 30,
  PreFormationType = "Circle",
  Radius = 200,
  Random = 1
}
T.RT_14 = {0, 300}
T.RT_15 = {
  OffsetXY = T.RT_14
}
T.RT_16 = {0, -300}
T.RT_17 = {
  OffsetXY = T.RT_16
}
T.RT_18 = {0, 600}
T.RT_19 = {
  OffsetXY = T.RT_18
}
T.RT_20 = {0, -600}
T.RT_21 = {
  OffsetXY = T.RT_20
}
T.RT_22 = {
  [1] = T.RT_12
}
T.RT_23 = {0, -500}
T.RT_24 = {
  OffsetXY = T.RT_23
}
T.RT_25 = {0, 500}
T.RT_26 = {
  OffsetXY = T.RT_25
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("EliteTeamData", {
  [1] = {
    EliteArgs = {
      1500,
      500,
      7,
      1
    },
    EliteId = 1,
    Offsets = {
      [1] = {
        OffsetXY = {200, 300}
      },
      [2] = {
        OffsetXY = {-200, 300}
      },
      [3] = {
        OffsetXY = {400, 150}
      },
      [4] = {
        OffsetXY = {-400, 150}
      },
      [5] = {
        OffsetXY = {600, 450}
      },
      [6] = {
        OffsetXY = {-600, 450}
      },
      [7] = {
        OffsetXY = {0, 400}
      }
    },
    TeamType = 1
  },
  [2] = {
    EliteId = 2,
    Offsets = T.RT_3
  },
  [10101] = {
    EliteId = 10101,
    Offsets = {
      [1] = {
        OffsetXY = {150, 150}
      }
    }
  },
  [210101] = {
    EliteId = 210101,
    LocationCheckParam = T.RT_4,
    Offsets = T.RT_7
  },
  [230101] = {
    EliteId = 230101,
    Offsets = T.RT_3
  },
  [230102] = {
    EliteId = 230102,
    LocationCheckParam = T.RT_4,
    Offsets = {
      [1] = {
        OffsetXY = {200, -300}
      },
      [2] = {
        OffsetXY = {550, 50}
      },
      [3] = {
        OffsetXY = {700, -300}
      },
      [4] = {
        OffsetXY = {1000, 50}
      }
    }
  },
  [230103] = {
    EliteId = 230103,
    LocationCheckParam = T.RT_4,
    Offsets = {
      [1] = {
        OffsetXY = {300, -50}
      },
      [2] = {
        OffsetXY = {400, 300}
      },
      [3] = {
        OffsetXY = {800, -100}
      },
      [4] = {
        OffsetXY = {1150, 300}
      }
    }
  },
  [230104] = {
    EliteId = 230104,
    LocationCheckParam = T.RT_4,
    Offsets = {
      [1] = {
        OffsetXY = {150, 350}
      },
      [2] = {
        OffsetXY = {450, -400}
      },
      [3] = {
        OffsetXY = {800, 350}
      },
      [4] = {
        OffsetXY = {1050, -300}
      }
    }
  },
  [240101] = {
    EliteId = 240101,
    LocationCheckParam = T.RT_4,
    Offsets = T.RT_7
  },
  [410101] = {
    EliteId = 410101,
    Offsets = {
      [1] = {
        OffsetXY = {-50, 0}
      }
    }
  },
  [410201] = {
    EliteId = 410201,
    Offsets = {
      [1] = {
        OffsetXY = {
          0,
          11,
          -23
        }
      }
    }
  },
  [430101] = {
    EliteId = 430101,
    Offsets = T.RT_10
  },
  [510101] = {
    EliteId = 510101,
    Offsets = {
      [1] = {
        OffsetXY = {0, 95}
      }
    }
  },
  [510102] = {EliteId = 510102},
  [540201] = {
    EliteId = 540201,
    LocationCheckParam = T.RT_4,
    Offsets = {
      [1] = {
        OffsetXY = {560, 0}
      }
    }
  },
  [600501] = {
    EliteId = 600501,
    SummonPresetShape = T.RT_13
  },
  [600502] = {
    EliteId = 600502,
    SummonPresetShape = T.RT_13
  },
  [601301] = {
    EliteId = 601301,
    Offsets = {
      [1] = {
        OffsetXY = {300, 0}
      },
      [2] = T.RT_15,
      [3] = T.RT_17
    }
  },
  [700201] = {
    EliteId = 700201,
    Offsets = {
      [1] = {
        OffsetXY = {-200, 200}
      }
    }
  },
  [700202] = {
    EliteId = 700202,
    Offsets = T.RT_10
  },
  [700801] = {
    EliteId = 700801,
    Offsets = {
      [1] = {
        OffsetXY = {
          100,
          50,
          400
        }
      }
    }
  },
  [800201] = {
    EliteId = 800201,
    Offsets = {
      [1] = T.RT_15,
      [2] = T.RT_17
    }
  },
  [800202] = {
    EliteId = 800202,
    Offsets = {
      [1] = T.RT_15,
      [2] = T.RT_17,
      [3] = T.RT_19,
      [4] = T.RT_21
    }
  },
  [850061] = {
    EliteId = 850061,
    Offsets = T.RT_22
  },
  [850081] = {
    EliteId = 850081,
    Offsets = T.RT_22
  },
  [850401] = {
    EliteId = 850401,
    Offsets = {
      [1] = T.RT_24
    }
  },
  [850402] = {
    EliteId = 850402,
    Offsets = {
      [1] = T.RT_26
    }
  },
  [850403] = {
    EliteId = 850403,
    Offsets = {
      [1] = {
        OffsetXY = {0, -1000}
      }
    }
  },
  [850404] = {
    EliteId = 850404,
    Offsets = {
      [1] = {
        OffsetXY = {0, 1000}
      }
    }
  },
  [850501] = {
    EliteId = 850501,
    Offsets = {
      [1] = {
        OffsetXY = {0, 650}
      },
      [2] = {
        OffsetXY = {0, -650}
      }
    }
  },
  [850502] = {
    EliteId = 850502,
    Offsets = {
      [1] = {
        OffsetXY = {450, 600}
      },
      [2] = {
        OffsetXY = {450, -600}
      },
      [3] = {
        OffsetXY = {-450, 600}
      },
      [4] = {
        OffsetXY = {-450, -600}
      }
    }
  },
  [850901] = {
    EliteId = 850901,
    Offsets = T.RT_22
  },
  [851001] = {
    EliteId = 851001,
    Offsets = {
      [1] = {
        OffsetXY = {400, 500}
      },
      [2] = {
        OffsetXY = {400, -500}
      }
    }
  },
  [851002] = {
    EliteId = 851002,
    Offsets = {
      [1] = T.RT_26,
      [2] = T.RT_24,
      [3] = {
        OffsetXY = {500, 0}
      },
      [4] = {
        OffsetXY = {-500, 0}
      }
    }
  },
  [851801] = {
    EliteId = 851801,
    Offsets = {
      [1] = T.RT_19,
      [2] = T.RT_21,
      [3] = {
        OffsetXY = {600, 0}
      },
      [4] = {
        OffsetXY = {-600, 0}
      },
      [5] = {
        OffsetXY = {424, 424}
      },
      [6] = {
        OffsetXY = {424, -424}
      },
      [7] = {
        OffsetXY = {-424, 424}
      },
      [8] = {
        OffsetXY = {-424, -424}
      }
    }
  },
  [900301] = {
    EliteId = 900301,
    Offsets = T.RT_10
  },
  [900601] = {
    EliteId = 900601,
    LocationCheckParam = T.RT_4,
    Offsets = {
      [1] = {
        OffsetXY = {20, 0}
      }
    }
  },
  [900602] = {
    EliteId = 900602,
    LocationCheckParam = T.RT_4,
    SummonPresetShape = {
      Interval = 72,
      PreFormationType = "Circle",
      Radius = 500,
      Random = 0
    }
  },
  [6000005] = {
    EliteId = 6000005,
    SummonPresetShape = {
      Interval = 120,
      PreFormationType = "Circle",
      Radius = 700,
      Random = 0
    }
  },
  [6000009] = {
    EliteId = 6000009,
    Offsets = {
      [1] = T.RT_12,
      [2] = {
        OffsetXY = {
          1500,
          0,
          0
        }
      },
      [3] = {
        OffsetXY = {
          -750,
          1500,
          0
        }
      },
      [4] = {
        OffsetXY = {
          -750,
          -1500,
          0
        }
      }
    }
  },
  [6000012] = {
    EliteId = 6000012,
    SummonPresetShape = {
      Interval = 60,
      PreFormationType = "Circle",
      Radius = 1200,
      Random = 0
    }
  },
  [6000014] = {
    EliteId = 6000014,
    Offsets = {
      [1] = {
        OffsetXY = {
          0,
          500,
          0
        }
      },
      [2] = {
        OffsetXY = {
          0,
          -500,
          0
        }
      }
    }
  },
  [10104900] = {
    EliteId = 10104900,
    SummonPresetShape = {
      Interval = 30,
      PreFormationType = "Circle",
      Radius = 150,
      Random = 1
    }
  }
})
