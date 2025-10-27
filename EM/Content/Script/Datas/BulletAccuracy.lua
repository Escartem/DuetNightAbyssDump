local T = {}
T.RT_1 = {0, 25}
T.RT_2 = {25, 50}
T.RT_3 = {50, 75}
T.RT_4 = {75, 100}
T.RT_5 = {100, 125}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("BulletAccuracy", {
  [2] = {
    Accuracys = {
      [1] = {
        Accuracy = 20,
        Range = T.RT_1
      },
      [2] = {
        Accuracy = 0,
        Range = T.RT_2
      },
      [3] = {
        Accuracy = 20,
        Range = T.RT_3
      },
      [4] = {
        Accuracy = 20,
        Range = T.RT_4
      },
      [5] = {
        Accuracy = 20,
        Range = T.RT_5
      },
      [6] = {
        Accuracy = 20,
        Range = {125, 150}
      }
    },
    BulletAccId = 2
  },
  [101] = {
    Accuracys = {
      [1] = {
        Accuracy = 38,
        Range = T.RT_1
      },
      [2] = {
        Accuracy = 30,
        Range = T.RT_2
      },
      [3] = {
        Accuracy = 18,
        Range = T.RT_3
      },
      [4] = {
        Accuracy = 9,
        Range = T.RT_4
      },
      [5] = {
        Accuracy = 5,
        Range = T.RT_5
      }
    },
    BulletAccId = 101
  },
  [102] = {
    Accuracys = {
      [1] = {
        Accuracy = 38,
        Range = {0, 100}
      },
      [2] = {
        Accuracy = 30,
        Range = {100, 200}
      },
      [3] = {
        Accuracy = 18,
        Range = {200, 300}
      },
      [4] = {
        Accuracy = 9,
        Range = {300, 400}
      },
      [5] = {
        Accuracy = 5,
        Range = {400, 500}
      }
    },
    BulletAccId = 102
  },
  [103] = {
    Accuracys = {
      [1] = {
        Accuracy = 70,
        Range = {0, 376}
      },
      [2] = {
        Accuracy = 30,
        Range = {376, 752}
      }
    },
    BulletAccId = 103
  },
  [104] = {
    Accuracys = {
      [1] = {
        Accuracy = 70,
        Range = {0, 282}
      },
      [2] = {
        Accuracy = 30,
        Range = {282, 564}
      }
    },
    BulletAccId = 104
  },
  [105] = {
    Accuracys = {
      [1] = {
        Accuracy = 70,
        Range = {0, 188}
      },
      [2] = {
        Accuracy = 30,
        Range = {188, 376}
      }
    },
    BulletAccId = 105
  },
  [600201] = {
    Accuracys = {
      [1] = {
        Accuracy = 38,
        Range = {0, 30}
      },
      [2] = {
        Accuracy = 30,
        Range = {30, 60}
      },
      [3] = {
        Accuracy = 18,
        Range = {60, 100}
      },
      [4] = {
        Accuracy = 9,
        Range = {100, 140}
      },
      [5] = {
        Accuracy = 3,
        Range = {140, 200}
      },
      [6] = {
        Accuracy = 2,
        Range = {200, 250}
      }
    },
    BulletAccId = 600201
  }
})
