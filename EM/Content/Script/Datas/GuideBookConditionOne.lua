local T = {}
T.RT_1 = {
  CompleteUIGuideId = 72,
  FinishQuestChain = 200215,
  GuideId = 72,
  GuideNoteId = 84,
  GuideNoteTab = 5,
  RewardId = 7000,
  SysGuideId = 2044
}
T.RT_2 = {
  [1] = T.RT_1
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("GuideBookConditionOne", {
  FinishQuest = {
    [10010106] = {
      [1] = {
        FinishQuest = 10010106,
        GuideId = 13,
        GuideNoteId = 29,
        GuideNoteTab = 4,
        RewardId = 7000
      },
      [2] = {
        FinishQuest = 10010106,
        GuideId = 14,
        GuideNoteId = 30,
        GuideNoteTab = 4,
        RewardId = 7000
      }
    },
    [10010108] = {
      [1] = {
        CompleteUIGuideId = 5,
        FinishQuest = 10010108,
        GuideId = 5,
        GuideNoteId = 3,
        GuideNoteTab = 4,
        RewardId = 7000
      },
      [2] = {
        FinishQuest = 10010108,
        GuideId = 15,
        GuideNoteId = 31,
        GuideNoteTab = 4,
        RewardId = 7000
      },
      [3] = {
        CompleteUIGuideId = 5,
        FinishQuest = 10010108,
        GuideId = 68,
        GuideNoteId = 83,
        GuideNoteTab = 4,
        RewardId = 7000
      }
    },
    [10010110] = {
      [1] = {
        CompleteUIGuideId = 7,
        FinishQuest = 10010110,
        GuideId = 7,
        GuideNoteId = 5,
        GuideNoteTab = 4,
        RewardId = 7000
      }
    },
    [10010206] = {
      [1] = {
        FinishQuest = 10010206,
        GuideId = 20,
        GuideNoteId = 36,
        GuideNoteTab = 3,
        RewardId = 7000
      }
    },
    [10010209] = {
      [1] = {
        FinishQuest = 10010209,
        GuideId = 27,
        GuideNoteId = 43,
        GuideNoteTab = 5,
        RewardId = 7000
      }
    },
    [10020103] = {
      [1] = {
        FinishQuest = 10020103,
        GuideId = 10,
        GuideNoteId = 8,
        GuideNoteTab = 4,
        RewardId = 7000
      },
      [2] = {
        CompleteUIGuideId = 55,
        FinishQuest = 10020103,
        GuideId = 55,
        GuideNoteId = 75,
        GuideNoteTab = 4,
        RewardId = 7000
      }
    },
    [10020110] = {
      [1] = {
        CompleteUIGuideId = 33,
        FinishQuest = 10020110,
        GuideId = 33,
        GuideNoteId = 47,
        GuideNoteTab = 5,
        RewardId = 7000
      },
      [2] = {
        CompleteUIGuideId = 34,
        FinishQuest = 10020110,
        GuideId = 34,
        GuideNoteId = 48,
        GuideNoteTab = 5,
        RewardId = 7000
      }
    },
    [10020212] = {
      [1] = {
        CompleteUIGuideId = 41,
        FinishQuest = 10020212,
        GuideId = 41,
        GuideNoteId = 56,
        GuideNoteTab = 3,
        RewardId = 7000
      }
    },
    [10020302] = {
      [1] = {
        FinishQuest = 10020302,
        GuideId = 48,
        GuideNoteId = 68,
        GuideNoteTab = 5,
        RewardId = 7000
      }
    },
    [10020504] = {
      [1] = {
        CompleteUIGuideId = 40,
        FinishQuest = 10020504,
        GuideId = 40,
        GuideNoteId = 55,
        GuideNoteTab = 3,
        RewardId = 7000
      }
    },
    [11010104] = {
      [1] = {
        CompleteUIGuideId = 56,
        FinishQuest = 11010104,
        GuideId = 56,
        GuideNoteId = 76,
        GuideNoteTab = 4,
        RewardId = 7000
      }
    },
    [11010106] = {
      [1] = {
        CompleteUIGuideId = 51,
        FinishQuest = 11010106,
        GuideId = 51,
        GuideNoteId = 71,
        GuideNoteTab = 3,
        RewardId = 7000
      }
    },
    [11010107] = {
      [1] = {
        CompleteUIGuideId = 42,
        FinishQuest = 11010107,
        GuideId = 42,
        GuideNoteId = 57,
        GuideNoteTab = 3,
        RewardId = 7000
      }
    },
    [11010301] = {
      [1] = {
        CompleteUIGuideId = 53,
        FinishQuest = 11010301,
        GuideId = 53,
        GuideNoteId = 73,
        GuideNoteTab = 3,
        RewardId = 7000
      }
    },
    [11010510] = {
      [1] = {
        CompleteUIGuideId = 63,
        FinishQuest = 11010510,
        GuideId = 63,
        GuideNoteId = 78,
        GuideNoteTab = 3,
        RewardId = 7000
      }
    },
    [11010512] = {
      [1] = {
        CompleteUIGuideId = 52,
        FinishQuest = 11010512,
        GuideId = 52,
        GuideNoteId = 72,
        GuideNoteTab = 3,
        RewardId = 7000
      }
    }
  },
  FinishQuestChain = {
    [100101] = {
      [1] = {
        FinishQuestChain = 100101,
        GuideId = 23,
        GuideNoteId = 39,
        GuideNoteTab = 3,
        RewardId = 7000
      },
      [2] = {
        FinishQuestChain = 100101,
        GuideId = 26,
        GuideNoteId = 42,
        GuideNoteTab = 5,
        RewardId = 7000
      }
    },
    [100103] = {
      [1] = {
        CompleteUIGuideId = 3,
        FinishQuestChain = 100103,
        GuideId = 3,
        GuideNoteId = 1,
        GuideNoteTab = 4,
        RewardId = 7000
      },
      [2] = {
        CompleteUIGuideId = 3,
        FinishQuestChain = 100103,
        GuideId = 16,
        GuideNoteId = 32,
        GuideNoteTab = 4,
        RewardId = 7000
      },
      [3] = {
        FinishQuestChain = 100103,
        GuideId = 36,
        GuideNoteId = 51,
        GuideNoteTab = 4,
        RewardId = 7000
      },
      [4] = {
        FinishQuestChain = 100103,
        GuideId = 47,
        GuideNoteId = 67,
        GuideNoteTab = 5,
        RewardId = 7000
      }
    },
    [100201] = {
      [1] = {
        FinishQuestChain = 100201,
        GuideId = 25,
        GuideNoteId = 41,
        GuideNoteTab = 3,
        RewardId = 7000
      }
    },
    [100202] = {
      [1] = {
        FinishQuestChain = 100202,
        GuideId = 21,
        GuideNoteId = 37,
        GuideNoteTab = 3,
        RewardId = 7000
      },
      [2] = {
        FinishQuestChain = 100202,
        GuideId = 22,
        GuideNoteId = 38,
        GuideNoteTab = 3,
        RewardId = 7000
      }
    },
    [100208] = {
      [1] = {
        FinishQuestChain = 100208,
        GuideId = 80,
        GuideNoteId = 112,
        GuideNoteTab = 5,
        RewardId = 7000
      }
    },
    [200215] = T.RT_2,
    [200220] = {
      [1] = {
        FinishQuestChain = 200220,
        GuideId = 82,
        GuideNoteId = 107,
        GuideNoteTab = 5,
        RewardId = 7000
      }
    }
  },
  FunctionId = {
    Armory = {
      [1] = {
        FunctionId = "Armory",
        GuideId = 37,
        GuideNoteId = 52,
        GuideNoteTab = 4,
        RewardId = 7000
      },
      [2] = {
        FunctionId = "Armory",
        GuideId = 38,
        GuideNoteId = 53,
        GuideNoteTab = 4,
        RewardId = 7000
      },
      [3] = {
        FunctionId = "Armory",
        GuideId = 39,
        GuideNoteId = 54,
        GuideNoteTab = 4,
        RewardId = 7000
      }
    },
    Bag = {
      [1] = {
        FunctionId = "Bag",
        GuideId = 83,
        GuideNoteId = 108,
        GuideNoteTab = 5,
        RewardId = 7000
      }
    },
    FriendMain = {
      [1] = {
        FunctionId = "FriendMain",
        GuideId = 45,
        GuideNoteId = 60,
        GuideNoteTab = 5,
        RewardId = 7000
      },
      [2] = {
        FunctionId = "FriendMain",
        GuideId = 46,
        GuideNoteId = 61,
        GuideNoteTab = 5,
        RewardId = 7000
      },
      [3] = {
        FunctionId = "FriendMain",
        GuideId = 59,
        GuideNoteId = 64,
        GuideNoteTab = 5,
        RewardId = 7000
      },
      [4] = {
        FunctionId = "FriendMain",
        GuideId = 61,
        GuideNoteId = 66,
        GuideNoteTab = 5,
        RewardId = 7000
      }
    },
    Pet = {
      [1] = {
        FunctionId = "Pet",
        GuideId = 35,
        GuideNoteId = 50,
        GuideNoteTab = 4,
        RewardId = 7000
      },
      [2] = {
        FunctionId = "Pet",
        GuideId = 49,
        GuideNoteId = 69,
        GuideNoteTab = 5,
        RewardId = 7000
      }
    },
    Quest = {
      [1] = {
        FunctionId = "Quest",
        GuideId = 62,
        GuideNoteId = 77,
        GuideNoteTab = 5,
        RewardId = 7000
      }
    },
    Temple = {
      [1] = {
        FunctionId = "Temple",
        GuideId = 43,
        GuideNoteId = 58,
        GuideNoteTab = 3,
        RewardId = 7000
      }
    }
  },
  MechanismTag = {
    MirrorPuzzle = {
      [1] = {
        GuideId = 84,
        GuideNoteId = 109,
        GuideNoteTab = 3,
        MechanismTag = "MirrorPuzzle",
        RewardId = 7000
      }
    }
  },
  MonsterId = {
    [115] = {
      [1] = {
        CompleteUIGuideId = 115,
        GuideId = 115,
        GuideNoteId = 1016,
        GuideNoteTab = 2,
        MonsterId = 115,
        RewardId = 7000
      }
    },
    [10011] = {
      [1] = {
        CompleteUIGuideId = 10011,
        GuideId = 10011,
        GuideNoteId = 1001,
        GuideNoteTab = 2,
        MonsterId = 10011,
        RewardId = 7000
      }
    },
    [10012] = {
      [1] = {
        CompleteUIGuideId = 10012,
        GuideId = 10012,
        GuideNoteId = 1002,
        GuideNoteTab = 2,
        MonsterId = 10012,
        RewardId = 7000
      }
    },
    [10013] = {
      [1] = {
        CompleteUIGuideId = 10013,
        GuideId = 10013,
        GuideNoteId = 1003,
        GuideNoteTab = 2,
        MonsterId = 10013,
        RewardId = 7000
      }
    },
    [10014] = {
      [1] = {
        CompleteUIGuideId = 10014,
        GuideId = 10014,
        GuideNoteId = 1004,
        GuideNoteTab = 2,
        MonsterId = 10014,
        RewardId = 7000
      }
    },
    [10015] = {
      [1] = {
        CompleteUIGuideId = 10015,
        GuideId = 10015,
        GuideNoteId = 1005,
        GuideNoteTab = 2,
        MonsterId = 10015,
        RewardId = 7000
      }
    },
    [10016] = {
      [1] = {
        CompleteUIGuideId = 10016,
        GuideId = 10016,
        GuideNoteId = 1006,
        GuideNoteTab = 2,
        MonsterId = 10016,
        RewardId = 7000
      }
    },
    [10017] = {
      [1] = {
        CompleteUIGuideId = 10017,
        GuideId = 10017,
        GuideNoteId = 1007,
        GuideNoteTab = 2,
        MonsterId = 10017,
        RewardId = 7000
      }
    },
    [10018] = {
      [1] = {
        CompleteUIGuideId = 10018,
        GuideId = 10018,
        GuideNoteId = 1008,
        GuideNoteTab = 2,
        MonsterId = 10018,
        RewardId = 7000
      }
    },
    [10019] = {
      [1] = {
        CompleteUIGuideId = 10019,
        GuideId = 10019,
        GuideNoteId = 1009,
        GuideNoteTab = 2,
        MonsterId = 10019,
        RewardId = 7000
      }
    },
    [10020] = {
      [1] = {
        CompleteUIGuideId = 10020,
        GuideId = 10020,
        GuideNoteId = 1010,
        GuideNoteTab = 2,
        MonsterId = 10020,
        RewardId = 7000
      }
    },
    [10021] = {
      [1] = {
        CompleteUIGuideId = 10021,
        GuideId = 10021,
        GuideNoteId = 1011,
        GuideNoteTab = 2,
        MonsterId = 10021,
        RewardId = 7000
      }
    },
    [10022] = {
      [1] = {
        CompleteUIGuideId = 10022,
        GuideId = 10022,
        GuideNoteId = 1012,
        GuideNoteTab = 2,
        MonsterId = 10022,
        RewardId = 7000
      }
    },
    [10023] = {
      [1] = {
        CompleteUIGuideId = 10023,
        GuideId = 10023,
        GuideNoteId = 1013,
        GuideNoteTab = 2,
        MonsterId = 10023,
        RewardId = 7000
      }
    },
    [10024] = {
      [1] = {
        CompleteUIGuideId = 10024,
        GuideId = 10024,
        GuideNoteId = 1014,
        GuideNoteTab = 2,
        MonsterId = 10024,
        RewardId = 7000
      }
    },
    [10100] = {
      [1] = {
        CompleteUIGuideId = 10100,
        GuideId = 10100,
        GuideNoteId = 1015,
        GuideNoteTab = 2,
        MonsterId = 10100,
        RewardId = 7000
      }
    },
    [6006001] = {
      [1] = {
        CompleteUIGuideId = 6006001,
        GuideId = 6006001,
        GuideNoteId = 1017,
        GuideNoteTab = 2,
        MonsterId = 6006001,
        RewardId = 7000
      }
    },
    [6007001] = {
      [1] = {
        CompleteUIGuideId = 6007001,
        GuideId = 6007001,
        GuideNoteId = 1018,
        GuideNoteTab = 2,
        MonsterId = 6007001,
        RewardId = 7000
      }
    },
    [7001005] = {
      [1] = {
        CompleteUIGuideId = 7001005,
        GuideId = 7001005,
        GuideNoteId = 1019,
        GuideNoteTab = 2,
        MonsterId = 7001005,
        RewardId = 7000
      }
    },
    [7002005] = {
      [1] = {
        CompleteUIGuideId = 7002005,
        GuideId = 7002005,
        GuideNoteId = 1020,
        GuideNoteTab = 2,
        MonsterId = 7002005,
        RewardId = 7000
      }
    },
    [7003005] = {
      [1] = {
        CompleteUIGuideId = 7003005,
        GuideId = 7003005,
        GuideNoteId = 1021,
        GuideNoteTab = 2,
        MonsterId = 7003005,
        RewardId = 7000
      }
    },
    [7007002] = {
      [1] = {
        CompleteUIGuideId = 7007002,
        GuideId = 7007002,
        GuideNoteId = 1022,
        GuideNoteTab = 2,
        MonsterId = 7007002,
        RewardId = 7000
      }
    },
    [7008001] = {
      [1] = {
        CompleteUIGuideId = 7008001,
        GuideId = 7008001,
        GuideNoteId = 1023,
        GuideNoteTab = 2,
        MonsterId = 7008001,
        RewardId = 7000
      }
    },
    [7015001] = {
      [1] = {
        CompleteUIGuideId = 7015001,
        GuideId = 7015001,
        GuideNoteId = 1024,
        GuideNoteTab = 2,
        MonsterId = 7015001,
        RewardId = 7000
      }
    },
    [8501002] = {
      [1] = {
        CompleteUIGuideId = 8501002,
        GuideId = 8501002,
        GuideNoteId = 1025,
        GuideNoteTab = 2,
        MonsterId = 8501002,
        RewardId = 7000
      }
    },
    [8515001] = {
      [1] = {
        CompleteUIGuideId = 8515001,
        GuideId = 8515001,
        GuideNoteId = 1026,
        GuideNoteTab = 2,
        MonsterId = 8515001,
        RewardId = 7000
      }
    },
    [9003004] = {
      [1] = {
        CompleteUIGuideId = 9003004,
        GuideId = 9003004,
        GuideNoteId = 1027,
        GuideNoteTab = 2,
        MonsterId = 9003004,
        RewardId = 7000
      }
    },
    [9005004] = {
      [1] = {
        CompleteUIGuideId = 9005004,
        GuideId = 9005004,
        GuideNoteId = 1028,
        GuideNoteTab = 2,
        MonsterId = 9005004,
        RewardId = 7000
      }
    },
    [9006004] = {
      [1] = {
        CompleteUIGuideId = 9006004,
        GuideId = 9006004,
        GuideNoteId = 1029,
        GuideNoteTab = 2,
        MonsterId = 9006004,
        RewardId = 7000
      }
    },
    [9500001] = {
      [1] = {
        CompleteUIGuideId = 9500001,
        GuideId = 9500001,
        GuideNoteId = 1030,
        GuideNoteTab = 2,
        MonsterId = 9500001,
        RewardId = 7000
      }
    }
  },
  SysGuideId = {
    [1001] = {
      [1] = {
        GuideId = 6,
        GuideNoteId = 4,
        GuideNoteTab = 2,
        RewardId = 7000,
        SysGuideId = 1001
      }
    },
    [1002] = {
      [1] = {
        GuideId = 8,
        GuideNoteId = 6,
        GuideNoteTab = 2,
        RewardId = 7000,
        SysGuideId = 1002
      }
    },
    [2001] = {
      [1] = {
        GuideId = 9,
        GuideNoteId = 7,
        GuideNoteTab = 3,
        RewardId = 7000,
        SysGuideId = 2001
      }
    },
    [2011] = {
      [1] = {
        GuideId = 17,
        GuideNoteId = 33,
        GuideNoteTab = 5,
        RewardId = 7000,
        SysGuideId = 2011
      },
      [2] = {
        GuideId = 32,
        GuideNoteId = 49,
        GuideNoteTab = 4,
        RewardId = 7000,
        SysGuideId = 2011
      }
    },
    [2013] = {
      [1] = {
        GuideId = 12,
        GuideNoteId = 10,
        GuideNoteTab = 5,
        RewardId = 7000,
        SysGuideId = 2013
      }
    },
    [2014] = {
      [1] = {
        GuideId = 11,
        GuideNoteId = 9,
        GuideNoteTab = 5,
        RewardId = 7000,
        SysGuideId = 2014
      }
    },
    [2015] = {
      [1] = {
        GuideId = 29,
        GuideNoteId = 44,
        GuideNoteTab = 5,
        RewardId = 7000,
        SysGuideId = 2015
      },
      [2] = {
        GuideId = 30,
        GuideNoteId = 45,
        GuideNoteTab = 5,
        RewardId = 7000,
        SysGuideId = 2015
      },
      [3] = {
        GuideId = 31,
        GuideNoteId = 46,
        GuideNoteTab = 5,
        RewardId = 7000,
        SysGuideId = 2015
      },
      [4] = {
        GuideId = 54,
        GuideNoteId = 74,
        GuideNoteTab = 5,
        RewardId = 7000,
        SysGuideId = 2015
      }
    },
    [2044] = T.RT_2,
    [2052] = {
      [1] = {
        GuideId = 71,
        GuideNoteId = 85,
        GuideNoteTab = 5,
        RewardId = 7000,
        SysGuideId = 2052
      }
    },
    [2069] = {
      [1] = {
        GuideId = 79,
        GuideNoteId = 80,
        GuideNoteTab = 5,
        RewardId = 7000,
        SysGuideId = 2069
      }
    },
    [2075] = {
      [1] = {
        GuideId = 78,
        GuideNoteId = 105,
        GuideNoteTab = 5,
        RewardId = 7000,
        SysGuideId = 2075
      }
    },
    [2080] = {
      [1] = {
        CompleteUIGuideId = 85,
        GuideId = 85,
        GuideNoteId = 110,
        GuideNoteTab = 5,
        RewardId = 7000,
        SysGuideId = 2080
      }
    },
    [2081] = {
      [1] = {
        CompleteUIGuideId = 86,
        GuideId = 86,
        GuideNoteId = 111,
        GuideNoteTab = 5,
        RewardId = 7000,
        SysGuideId = 2081
      }
    }
  }
})
