local T = {}
T.RT_1 = {
  0,
  0,
  -90
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SquadCameraData", {
  Char_Boy = {
    CameraFocal = 38.6,
    CameraName = "Char_Boy",
    Ease = 14,
    Location = {
      13,
      285,
      115
    },
    Rotation = T.RT_1,
    Time = 1.2
  },
  Char_Girl = {
    CameraFocal = 38.6,
    CameraName = "Char_Girl",
    Ease = 14,
    Location = {
      13,
      285,
      104
    },
    Rotation = T.RT_1,
    Time = 1.2
  },
  Char_Loli = {
    CameraFocal = 38.6,
    CameraName = "Char_Loli",
    Ease = 14,
    Location = {
      13,
      285,
      88
    },
    Rotation = T.RT_1,
    Time = 1.2
  },
  Char_Man = {
    CameraFocal = 38.6,
    CameraName = "Char_Man",
    Ease = 14,
    Location = {
      13,
      285,
      140
    },
    Rotation = T.RT_1,
    Time = 1.2
  },
  Char_Woman = {
    CameraFocal = 38.6,
    CameraName = "Char_Woman",
    Ease = 14,
    Location = {
      13,
      285,
      125
    },
    Rotation = T.RT_1,
    Time = 1.2
  },
  Default = {
    CameraFocal = 70,
    CameraName = "Default",
    Ease = 14,
    Location = {
      1000,
      -20,
      -1
    },
    Rotation = {
      0,
      0,
      180
    },
    Time = 1.2
  }
})
