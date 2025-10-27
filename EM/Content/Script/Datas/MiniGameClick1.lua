local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MiniGameClick1", {
  [1] = {
    ClickEndInfo = {
      60,
      150,
      240
    },
    ClickLevelInfo = {
      "Low",
      "Low",
      "Low"
    },
    ClickStartInfo = {
      0,
      90,
      180
    },
    GameMapId = 1,
    PointerSpeed = 0.5,
    PointerSpeedHigh = 7,
    PointerSpeedLow = 15,
    PointerSpeedMid = 10,
    PointerSpeedResis = 0.2
  },
  [2] = {
    ClickEndInfo = {
      45,
      110,
      175,
      240
    },
    ClickLevelInfo = {
      "Low",
      "Low",
      "Low",
      "Low"
    },
    ClickStartInfo = {
      0,
      65,
      130,
      195
    },
    GameMapId = 2,
    PointerSpeed = 0.5,
    PointerSpeedHigh = 7,
    PointerSpeedLow = 15,
    PointerSpeedMid = 10,
    PointerSpeedResis = 0.2
  },
  [3] = {
    ClickEndInfo = {
      30,
      80,
      140,
      190,
      240
    },
    ClickLevelInfo = {
      "Low",
      "Low",
      "Low",
      "Low",
      "Low"
    },
    ClickStartInfo = {
      0,
      50,
      100,
      160,
      210
    },
    GameMapId = 3,
    PointerSpeed = 0.5,
    PointerSpeedHigh = 7,
    PointerSpeedLow = 15,
    PointerSpeedMid = 10,
    PointerSpeedResis = 0.2
  }
})
