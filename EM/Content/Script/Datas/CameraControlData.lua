local T = {}
T.RT_1 = {
  0,
  0,
  0
}
T.RT_2 = {
  0,
  0,
  40
}
T.RT_3 = {
  0,
  0,
  25
}
T.RT_4 = {
  0,
  0,
  120
}
T.RT_5 = {
  0,
  0,
  60
}
T.RT_6 = {
  50,
  0,
  0
}
T.RT_7 = {
  4,
  0,
  0
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("CameraControlData", {
  Arm120OffsetZM40 = {
    ArmLength = 120,
    ArmPos = T.RT_1,
    CameraName = "Arm120OffsetZM40",
    ProbeSize = 12,
    SocketOffset = {
      0,
      0,
      -40
    },
    TimelineFloatCurve = "CameraCurve",
    bIncrementArmLength = true,
    bIncrementArmPos = true,
    bIncrementSocketOffset = true
  },
  Arm150OffsetZ40 = {
    ArmLength = 150,
    ArmPos = T.RT_1,
    CameraName = "Arm150OffsetZ40",
    ProbeSize = 12,
    SocketOffset = T.RT_2,
    TimelineFloatCurve = "CameraCurve",
    bIncrementArmLength = true,
    bIncrementArmPos = true,
    bIncrementSocketOffset = true
  },
  Arm90OffsetZ20 = {
    ArmLength = 90,
    ArmPos = T.RT_1,
    CameraName = "Arm90OffsetZ20",
    ProbeSize = 12,
    SocketOffset = {
      0,
      0,
      20
    },
    TimelineFloatCurve = "CameraCurve",
    bIncrementArmLength = true,
    bIncrementArmPos = true,
    bIncrementSocketOffset = true
  },
  BossHeilongDefault = {
    ArmLength = 3600,
    ArmPos = T.RT_3,
    CameraName = "BossHeilongDefault",
    ProbeSize = 12,
    SocketOffset = {
      3000,
      0,
      200
    },
    TimelineFloatCurve = "CameraCurve",
    bIncrementArmLength = false,
    bIncrementArmPos = false,
    bIncrementSocketOffset = true
  },
  BossLinenDefault = {
    ArmLength = 550,
    ArmPos = T.RT_3,
    CameraName = "BossLinenDefault",
    ProbeSize = 12,
    SocketOffset = T.RT_4,
    TimelineFloatCurve = "CameraCurve",
    bIncrementArmLength = false,
    bIncrementArmPos = false,
    bIncrementSocketOffset = false
  },
  BossMapSkill = {
    ArmLength = 0,
    ArmPos = T.RT_5,
    CameraName = "BossMapSkill",
    ProbeSize = 12,
    SocketOffset = T.RT_2,
    TimelineFloatCurve = "CameraCurve",
    bIncrementArmLength = true,
    bIncrementArmPos = false,
    bIncrementSocketOffset = false
  },
  BossShijingzheSkill15 = {
    ArmLength = 800,
    ArmPos = T.RT_3,
    CameraName = "BossShijingzheSkill15",
    ProbeSize = 12,
    SocketOffset = T.RT_4,
    TimelineFloatCurve = "CameraCurve",
    bIncrementArmLength = false,
    bIncrementArmPos = false,
    bIncrementSocketOffset = false
  },
  Default = {
    ArmLength = 360,
    ArmPos = T.RT_3,
    CameraName = "Default",
    ProbeSize = 12,
    SocketOffset = {
      0,
      35,
      55
    },
    TimelineFloatCurve = "CameraCurve",
    bIncrementArmLength = false,
    bIncrementArmPos = false,
    bIncrementSocketOffset = false
  },
  FallAttack = {
    ArmLength = 60,
    ArmPos = T.RT_1,
    CameraName = "FallAttack",
    LagMaxDistance = T.RT_6,
    LagSpeed = T.RT_7,
    ProbeSize = 12,
    SocketOffset = T.RT_1,
    TimelineFloatCurve = "CameraCurve",
    bIncrementArmLength = true,
    bIncrementArmPos = true,
    bIncrementSocketOffset = true
  },
  FuluoSkill01 = {
    ArmLength = 420,
    ArmPos = T.RT_1,
    CameraName = "FuluoSkill01",
    ProbeSize = 12,
    SocketOffset = {
      0,
      0,
      50
    },
    TimelineFloatCurve = "CameraCurve",
    bIncrementArmLength = true,
    bIncrementArmPos = true,
    bIncrementSocketOffset = true
  },
  FuluoSkill02 = {
    ArmLength = 120,
    ArmPos = T.RT_1,
    CameraName = "FuluoSkill02",
    ProbeSize = 12,
    SocketOffset = T.RT_3,
    TimelineFloatCurve = "CameraCurve",
    bIncrementArmLength = true,
    bIncrementArmPos = true,
    bIncrementSocketOffset = true
  },
  IncrementDefault = {
    ArmLength = 0,
    ArmPos = T.RT_1,
    CameraName = "IncrementDefault",
    ProbeSize = 12,
    SocketOffset = T.RT_1,
    TimelineFloatCurve = "CameraCurve",
    bIncrementArmLength = true,
    bIncrementArmPos = true,
    bIncrementSocketOffset = true
  },
  KezhouSkill02 = {
    ArmLength = 120,
    ArmPos = T.RT_1,
    CameraName = "KezhouSkill02",
    ProbeSize = 12,
    SocketOffset = T.RT_3,
    TimelineFloatCurve = "CameraCurve",
    bIncrementArmLength = true,
    bIncrementArmPos = true,
    bIncrementSocketOffset = true
  },
  SongluSkill02 = {
    ArmLength = 0,
    ArmPos = T.RT_5,
    CameraName = "SongluSkill02",
    LagMaxDistance = T.RT_6,
    LagSpeed = T.RT_7,
    ProbeSize = 12,
    SocketOffset = {
      0,
      0,
      -80
    },
    TimelineFloatCurve = "CameraCurve",
    bIncrementArmLength = true,
    bIncrementArmPos = true,
    bIncrementSocketOffset = true
  },
  SpringArm200 = {
    ArmLength = 200,
    ArmPos = T.RT_1,
    CameraName = "SpringArm200",
    ProbeSize = 12,
    SocketOffset = T.RT_1,
    TimelineFloatCurve = "CameraCurve",
    bIncrementArmLength = true,
    bIncrementArmPos = true,
    bIncrementSocketOffset = true
  },
  StoryDefault = {
    ArmLength = 800,
    ArmPos = T.RT_1,
    CameraName = "StoryDefault",
    ProbeSize = 12,
    SocketOffset = {
      0,
      0,
      225
    },
    TimelineFloatCurve = "CameraCurve",
    bIncrementArmLength = false,
    bIncrementArmPos = false,
    bIncrementSocketOffset = false
  },
  StoryEast01Nai01 = {
    ArmLength = 200,
    ArmPos = T.RT_1,
    CameraName = "StoryEast01Nai01",
    ProbeSize = 12,
    SocketOffset = {
      0,
      40,
      35
    },
    TimelineFloatCurve = "CameraCurve",
    bIncrementArmLength = false,
    bIncrementArmPos = false,
    bIncrementSocketOffset = false
  },
  StoryEast01Nai02 = {
    ArmLength = 200,
    ArmPos = T.RT_1,
    CameraName = "StoryEast01Nai02",
    ProbeSize = 12,
    SocketOffset = {
      0,
      40,
      43
    },
    TimelineFloatCurve = "CameraCurve",
    bIncrementArmLength = false,
    bIncrementArmPos = false,
    bIncrementSocketOffset = false
  },
  TuosiSkill02 = {
    ArmLength = 150,
    ArmPos = T.RT_1,
    CameraName = "TuosiSkill02",
    LagMaxDistance = T.RT_6,
    LagSpeed = T.RT_7,
    ProbeSize = 12,
    SocketOffset = T.RT_2,
    TimelineFloatCurve = "CameraCurve",
    bIncrementArmLength = true,
    bIncrementArmPos = true,
    bIncrementSocketOffset = true
  }
})
