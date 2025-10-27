local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("AutoTestTask", {
  [1] = {
    CharGroupId = 1101,
    DungeonId = 30,
    TaskId = 1,
    TestDuration = 60
  },
  [2] = {
    CharGroupPoolId = 1,
    DungeonId = 30,
    TaskId = 2,
    TestDuration = 15
  },
  [999] = {
    CharGroupId = 9999,
    CharGroupPoolId = 1,
    DungeonId = 1,
    TaskId = 999,
    TestDuration = 30
  },
  [2101] = {
    CharGroupId = 2101,
    DungeonId = 30,
    TaskId = 2101,
    TestDuration = 60
  },
  [2301] = {
    CharGroupId = 2301,
    DungeonId = 30,
    TaskId = 2301,
    TestDuration = 60
  },
  [2401] = {
    CharGroupId = 2401,
    DungeonId = 30,
    TaskId = 2401,
    TestDuration = 60
  },
  [3101] = {
    CharGroupId = 3101,
    DungeonId = 30,
    TaskId = 3101,
    TestDuration = 60
  },
  [3102] = {
    CharGroupId = 3102,
    DungeonId = 30,
    TaskId = 3102,
    TestDuration = 60
  },
  [4201] = {
    CharGroupId = 4201,
    DungeonId = 30,
    TaskId = 4201,
    TestDuration = 60
  },
  [5101] = {
    CharGroupId = 5101,
    DungeonId = 30,
    TaskId = 5101,
    TestDuration = 60
  },
  [5301] = {
    CharGroupId = 5301,
    DungeonId = 30,
    TaskId = 5301,
    TestDuration = 60
  }
})
