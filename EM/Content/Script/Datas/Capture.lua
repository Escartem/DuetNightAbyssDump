local T = {}
T.RT_1 = {CaptureMonsterId = 7001005, Weight = 1}
T.RT_2 = {CaptureMonsterId = 7003005, Weight = 1}
T.RT_3 = {CaptureMonsterId = 7002005, Weight = 4}
T.RT_4 = {
  [1] = T.RT_1,
  [2] = T.RT_2,
  [3] = T.RT_3
}
T.RT_5 = {CaptureMonsterId = 7002005, Weight = 1}
T.RT_6 = {
  [1] = T.RT_1,
  [2] = T.RT_2,
  [3] = T.RT_5
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Capture", {
  [30002] = {
    Capture = T.RT_4,
    CaptureCreatorId = 1100000001,
    DungeonId = 30002,
    FixLevel = 1,
    TreasureMonsterId = 9500001
  },
  [30004] = {
    Capture = T.RT_4,
    CaptureCreatorId = 1100000002,
    DungeonId = 30004,
    FixLevel = 1,
    TreasureMonsterId = 9500001
  },
  [60401] = {
    Capture = T.RT_4,
    CaptureCreatorId = 1100000015,
    DungeonId = 60401,
    FixLevel = 1,
    TreasureMonsterId = 9500001
  },
  [60402] = {
    Capture = T.RT_4,
    CaptureCreatorId = 1100000016,
    DungeonId = 60402,
    FixLevel = 1,
    TreasureMonsterId = 9500001
  },
  [62401] = {
    Capture = T.RT_4,
    CaptureCreatorId = 1100000017,
    DungeonId = 62401,
    FixLevel = 1,
    TreasureMonsterId = 9500001
  },
  [62402] = {
    Capture = T.RT_4,
    CaptureCreatorId = 1100000018,
    DungeonId = 62402,
    FixLevel = 1,
    TreasureMonsterId = 9500001
  },
  [64401] = {
    Capture = T.RT_4,
    CaptureCreatorId = 1100000019,
    DungeonId = 64401,
    FixLevel = 1,
    TreasureMonsterId = 9500001
  },
  [64402] = {
    Capture = T.RT_4,
    CaptureCreatorId = 1100000020,
    DungeonId = 64402,
    FixLevel = 1,
    TreasureMonsterId = 9500001
  },
  [90301] = {
    Capture = T.RT_4,
    CaptureCreatorId = 1100000003,
    DungeonId = 90301,
    FixLevel = 1,
    TreasureMonsterId = 9500001
  },
  [90302] = {
    Capture = T.RT_4,
    CaptureCreatorId = 1100000004,
    DungeonId = 90302,
    FixLevel = 1,
    TreasureMonsterId = 9500001
  },
  [90303] = {
    Capture = T.RT_4,
    CaptureCreatorId = 1100000005,
    DungeonId = 90303,
    FixLevel = 1,
    TreasureMonsterId = 9500001
  },
  [90304] = {
    Capture = T.RT_4,
    CaptureCreatorId = 1100000006,
    DungeonId = 90304,
    FixLevel = 1,
    TreasureMonsterId = 9500001
  },
  [90305] = {
    Capture = T.RT_6,
    CaptureCreatorId = 1100000007,
    DungeonId = 90305,
    FixLevel = 1,
    TreasureMonsterId = 9500001
  },
  [90306] = {
    Capture = T.RT_6,
    CaptureCreatorId = 1100000008,
    DungeonId = 90306,
    FixLevel = 1,
    TreasureMonsterId = 9500001
  },
  [90307] = {
    Capture = T.RT_6,
    CaptureCreatorId = 1100000009,
    DungeonId = 90307,
    FixLevel = 1,
    TreasureMonsterId = 9500001
  },
  [90308] = {
    Capture = T.RT_6,
    CaptureCreatorId = 1100000010,
    DungeonId = 90308,
    FixLevel = 1,
    TreasureMonsterId = 9500001
  },
  [90309] = {
    Capture = T.RT_6,
    CaptureCreatorId = 1100000011,
    DungeonId = 90309,
    FixLevel = 1,
    TreasureMonsterId = 9500001
  },
  [90310] = {
    Capture = T.RT_6,
    CaptureCreatorId = 1100000012,
    DungeonId = 90310,
    FixLevel = 1,
    TreasureMonsterId = 9500001
  },
  [90311] = {
    Capture = T.RT_6,
    CaptureCreatorId = 1100000013,
    DungeonId = 90311,
    FixLevel = 1,
    TreasureMonsterId = 9500001
  },
  [90312] = {
    Capture = T.RT_6,
    CaptureCreatorId = 1100000014,
    DungeonId = 90312,
    FixLevel = 1,
    TreasureMonsterId = 9500001
  }
})
