local T = {}
T.RT_1 = {
  2,
  6,
  10,
  14,
  18,
  22
}
T.RT_2 = {
  0,
  3,
  6,
  9,
  12,
  15,
  18,
  21
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MiniGameBattery2", {
  [1] = {
    BatteryId = 1,
    PointerNum = 2,
    PointerSpeed = 3,
    SwitchPosition = T.RT_1,
    SwitchStatus = {
      1,
      1,
      0,
      0,
      1,
      1
    }
  },
  [2] = {
    BatteryId = 2,
    PointerNum = 2,
    PointerSpeed = 3,
    SwitchPosition = T.RT_1,
    SwitchStatus = {
      0,
      0,
      1,
      1,
      1,
      1
    }
  },
  [3] = {
    BatteryId = 3,
    PointerNum = 2,
    PointerSpeed = 3,
    SwitchPosition = T.RT_1,
    SwitchStatus = {
      0,
      1,
      1,
      1,
      1,
      0
    }
  },
  [4] = {
    BatteryId = 4,
    PointerNum = 2,
    PointerSpeed = 3,
    SwitchPosition = T.RT_1,
    SwitchStatus = {
      0,
      0,
      0,
      1,
      1,
      0
    }
  },
  [5] = {
    BatteryId = 5,
    PointerNum = 2,
    PointerSpeed = 3,
    SwitchPosition = T.RT_1,
    SwitchStatus = {
      0,
      0,
      1,
      1,
      0,
      0
    }
  },
  [6] = {
    BatteryId = 6,
    PointerNum = 2,
    PointerSpeed = 3,
    SwitchPosition = T.RT_1,
    SwitchStatus = {
      0,
      0,
      0,
      0,
      0,
      0
    }
  },
  [7] = {
    BatteryId = 7,
    PointerNum = 2,
    PointerSpeed = 3,
    SwitchPosition = T.RT_2,
    SwitchStatus = {
      1,
      0,
      1,
      1,
      1,
      1,
      1,
      0
    }
  },
  [8] = {
    BatteryId = 8,
    PointerNum = 2,
    PointerSpeed = 3,
    SwitchPosition = T.RT_2,
    SwitchStatus = {
      1,
      0,
      1,
      0,
      1,
      0,
      1,
      0
    }
  },
  [9] = {
    BatteryId = 9,
    PointerNum = 2,
    PointerSpeed = 3,
    SwitchPosition = T.RT_2,
    SwitchStatus = {
      0,
      1,
      0,
      1,
      0,
      1,
      0,
      1
    }
  },
  [10] = {
    BatteryId = 10,
    PointerNum = 2,
    PointerSpeed = 3,
    SwitchPosition = T.RT_2,
    SwitchStatus = {
      1,
      1,
      0,
      0,
      1,
      1,
      0,
      0
    }
  },
  [11] = {
    BatteryId = 11,
    PointerNum = 2,
    PointerSpeed = 3,
    SwitchPosition = T.RT_2,
    SwitchStatus = {
      1,
      0,
      1,
      0,
      0,
      0,
      0,
      0
    }
  },
  [12] = {
    BatteryId = 12,
    PointerNum = 2,
    PointerSpeed = 3,
    SwitchPosition = T.RT_2,
    SwitchStatus = {
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0
    }
  }
})
