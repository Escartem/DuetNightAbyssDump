local T = {}
T.RT_1 = {1}
T.RT_2 = {1000}
T.RT_3 = {2}
T.RT_4 = {500, 500}
T.RT_5 = {3}
T.RT_6 = {
  1,
  3,
  6
}
T.RT_7 = {
  500,
  500,
  500
}
T.RT_8 = {
  1,
  4,
  6
}
T.RT_9 = {
  1,
  3,
  4
}
T.RT_10 = {
  3,
  4,
  6
}
T.RT_11 = {
  1,
  3,
  4,
  6
}
T.RT_12 = {
  500,
  500,
  500,
  500
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RougeLikeRoomRandom", {
  [1] = {
    RoomNum = T.RT_1,
    RoomRandom = 1,
    RoomType = T.RT_1,
    RoomTypeWeight = T.RT_2
  },
  [2] = {
    RoomNum = T.RT_1,
    RoomRandom = 2,
    RoomType = T.RT_3,
    RoomTypeWeight = T.RT_2
  },
  [3] = {
    RoomNum = T.RT_1,
    RoomRandom = 3,
    RoomType = T.RT_5,
    RoomTypeWeight = T.RT_2
  },
  [4] = {
    RoomNum = T.RT_1,
    RoomRandom = 4,
    RoomType = {4},
    RoomTypeWeight = T.RT_2
  },
  [5] = {
    RoomNum = T.RT_1,
    RoomRandom = 5,
    RoomType = {5},
    RoomTypeWeight = T.RT_2
  },
  [6] = {
    RoomNum = T.RT_1,
    RoomRandom = 6,
    RoomType = {6},
    RoomTypeWeight = T.RT_2
  },
  [21] = {
    RoomNum = T.RT_3,
    RoomRandom = 21,
    RoomType = {1, 6},
    RoomTypeWeight = T.RT_4
  },
  [22] = {
    RoomNum = T.RT_3,
    RoomRandom = 22,
    RoomType = {1, 3},
    RoomTypeWeight = T.RT_4
  },
  [23] = {
    RoomNum = T.RT_3,
    RoomRandom = 23,
    RoomType = {1, 4},
    RoomTypeWeight = T.RT_4
  },
  [24] = {
    RoomNum = T.RT_3,
    RoomRandom = 24,
    RoomType = {3, 6},
    RoomTypeWeight = T.RT_4
  },
  [25] = {
    RoomNum = T.RT_3,
    RoomRandom = 25,
    RoomType = {4, 6},
    RoomTypeWeight = T.RT_4
  },
  [26] = {
    RoomNum = T.RT_3,
    RoomRandom = 26,
    RoomType = {3, 4},
    RoomTypeWeight = T.RT_4
  },
  [41] = {
    RoomNum = T.RT_5,
    RoomRandom = 41,
    RoomType = T.RT_6,
    RoomTypeWeight = T.RT_7
  },
  [42] = {
    RoomNum = T.RT_5,
    RoomRandom = 42,
    RoomType = T.RT_8,
    RoomTypeWeight = T.RT_7
  },
  [43] = {
    RoomNum = T.RT_5,
    RoomRandom = 43,
    RoomType = T.RT_9,
    RoomTypeWeight = T.RT_7
  },
  [44] = {
    RoomNum = T.RT_5,
    RoomRandom = 44,
    RoomType = T.RT_10,
    RoomTypeWeight = T.RT_7
  },
  [61] = {
    RoomNum = T.RT_3,
    RoomRandom = 61,
    RoomType = T.RT_6,
    RoomTypeWeight = T.RT_7
  },
  [62] = {
    RoomNum = T.RT_3,
    RoomRandom = 62,
    RoomType = T.RT_8,
    RoomTypeWeight = T.RT_7
  },
  [63] = {
    RoomNum = T.RT_3,
    RoomRandom = 63,
    RoomType = T.RT_9,
    RoomTypeWeight = T.RT_7
  },
  [64] = {
    RoomNum = T.RT_3,
    RoomRandom = 64,
    RoomType = T.RT_10,
    RoomTypeWeight = T.RT_7
  },
  [65] = {
    RoomNum = T.RT_3,
    RoomRandom = 65,
    RoomType = T.RT_11,
    RoomTypeWeight = T.RT_12
  },
  [66] = {
    RoomNum = T.RT_3,
    RoomRandom = 66,
    RoomType = T.RT_6,
    RoomTypeWeight = {
      200,
      600,
      200
    }
  },
  [67] = {
    RoomNum = T.RT_3,
    RoomRandom = 67,
    RoomType = T.RT_6,
    RoomTypeWeight = {
      200,
      200,
      600
    }
  },
  [68] = {
    RoomNum = T.RT_3,
    RoomRandom = 68,
    RoomType = T.RT_6,
    RoomTypeWeight = {
      600,
      200,
      200
    }
  },
  [81] = {
    RoomNum = T.RT_5,
    RoomRandom = 81,
    RoomType = T.RT_11,
    RoomTypeWeight = T.RT_12
  },
  [82] = {
    RoomNum = T.RT_5,
    RoomRandom = 82,
    RoomType = T.RT_11,
    RoomTypeWeight = {
      600,
      200,
      200,
      600
    }
  },
  [83] = {
    RoomNum = T.RT_5,
    RoomRandom = 83,
    RoomType = T.RT_11,
    RoomTypeWeight = {
      600,
      600,
      200,
      200
    }
  },
  [84] = {
    RoomNum = T.RT_5,
    RoomRandom = 84,
    RoomType = T.RT_11,
    RoomTypeWeight = {
      600,
      200,
      600,
      400
    }
  },
  [85] = {
    RoomNum = T.RT_5,
    RoomRandom = 85,
    RoomType = T.RT_11,
    RoomTypeWeight = {
      600,
      400,
      600,
      200
    }
  }
})
