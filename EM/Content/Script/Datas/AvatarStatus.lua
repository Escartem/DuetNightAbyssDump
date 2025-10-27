local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("AvatarStatus", {
  [1] = {
    IncompatibleList = {-1},
    Priority = 1,
    StatusId = 1,
    StatusName = "Normal",
    TurnList = {
      4,
      6,
      11
    }
  },
  [2] = {
    IncompatibleList = {
      1,
      5,
      6,
      7,
      8,
      10
    },
    Priority = 1,
    StatusId = 2,
    StatusName = "InBigWorld",
    TurnList = {
      3,
      4,
      6,
      8,
      9,
      11,
      12,
      13,
      14,
      15
    }
  },
  [3] = {
    Priority = 3,
    StatusId = 3,
    StatusName = "Matching",
    TurnList = {
      6,
      11,
      12,
      15
    }
  },
  [4] = {
    IncompatibleList = {
      3,
      6,
      8,
      9,
      11,
      12,
      13,
      16
    },
    Priority = 2,
    StatusId = 4,
    StatusName = "EnterSingleDungeon",
    TurnList = {
      1,
      4,
      5,
      11
    }
  },
  [5] = {
    IncompatibleList = {
      1,
      2,
      4,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      16
    },
    Priority = 1,
    StatusId = 5,
    StatusName = "InSingleDungeon",
    TurnList = {
      3,
      4,
      5,
      6,
      11
    }
  },
  [6] = {
    IncompatibleList = {
      3,
      4,
      8,
      9,
      11,
      12
    },
    Priority = 2,
    StatusId = 6,
    StatusName = "EnterBigWorld",
    TurnList = {2, 6}
  },
  [7] = {
    IncompatibleList = {
      1,
      2,
      3,
      4,
      5,
      6,
      8,
      9,
      10,
      11,
      12
    },
    Priority = 1,
    StatusId = 7,
    StatusName = "InMultiDungeon",
    TurnList = {
      1,
      4,
      6
    }
  },
  [8] = {
    IncompatibleList = {
      3,
      4,
      6,
      9,
      11,
      12,
      16
    },
    Priority = 2,
    StatusId = 8,
    StatusName = "InHardBoss",
    TurnList = {6, 8}
  },
  [9] = {
    IncompatibleList = {
      3,
      4,
      6,
      8,
      11,
      12,
      13,
      16
    },
    Priority = 2,
    StatusId = 9,
    StatusName = "EnterRougeLike",
    TurnList = {2, 10}
  },
  [10] = {
    IncompatibleList = {
      1,
      2,
      4,
      5,
      6,
      7,
      8,
      9,
      11,
      12,
      16
    },
    Priority = 1,
    StatusId = 10,
    StatusName = "InRougeLike",
    TurnList = {6, 10}
  },
  [11] = {
    IncompatibleList = {
      3,
      4,
      6,
      8,
      9,
      12,
      13,
      16
    },
    Priority = 2,
    StatusId = 11,
    StatusName = "EnterMultiDungeon",
    TurnList = {
      4,
      6,
      7,
      11
    }
  },
  [12] = {
    Priority = 2,
    StatusId = 12,
    StatusName = "DynamicEvent",
    TurnList = {
      3,
      4,
      6,
      8,
      9,
      11,
      13,
      14,
      15
    }
  },
  [13] = {
    Priority = 2,
    StatusId = 13,
    StatusName = "InExploreChanllenge",
    TurnList = {
      3,
      4,
      6,
      9,
      11,
      14,
      15
    }
  },
  [14] = {
    Priority = 1,
    StatusId = 14,
    StatusName = "InTeam",
    TurnList = {
      3,
      4,
      6,
      11,
      12,
      15
    }
  },
  [15] = {
    IncompatibleList = {
      3,
      11,
      12,
      16
    },
    Priority = 3,
    StatusId = 15,
    StatusName = "InSpecialQuest",
    TurnList = {
      2,
      6,
      13
    }
  },
  [16] = {
    StatusId = 16,
    StatusName = "InRegionOnline",
    TurnList = {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      11,
      12,
      13,
      14,
      15
    }
  }
})
