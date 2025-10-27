local T = {}
T.RT_1 = {"10.0"}
T.RT_2 = {"3.0"}
T.RT_3 = {"1.0"}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("BattleCamera", {
  CameraFadeAngleEnd = {
    ParamentName = "CameraFadeAngleEnd",
    ParamentValue = T.RT_1
  },
  CameraFadeAngleStart = {
    ParamentName = "CameraFadeAngleStart",
    ParamentValue = {"30.0"}
  },
  CameraPitchLimitMax = {
    ParamentName = "CameraPitchLimitMax",
    ParamentValue = {"89.9"}
  },
  CameraPitchLimitMin = {
    ParamentName = "CameraPitchLimitMin",
    ParamentValue = {"-89.9"}
  },
  EnterCollisionSpeed = {
    ParamentName = "EnterCollisionSpeed",
    ParamentValue = T.RT_1
  },
  LeaveCollisionSpeed = {
    ParamentName = "LeaveCollisionSpeed",
    ParamentValue = {"2.0"}
  },
  ResetPitchMaxSpeed = {
    ParamentName = "ResetPitchMaxSpeed",
    ParamentValue = T.RT_2
  },
  ResetSocketOffsetMaxSpeed = {
    ParamentName = "ResetSocketOffsetMaxSpeed",
    ParamentValue = {"4.0"}
  },
  ResetSpringArmMaxSpeed = {
    ParamentName = "ResetSpringArmMaxSpeed",
    ParamentValue = T.RT_2
  },
  TagAndTimeForResetPitch = {
    ParamentName = "TagAndTimeForResetPitch",
    ParamentValue = {"Idle:3"}
  },
  TagAndTimeForResetSpringArm = {
    ParamentName = "TagAndTimeForResetSpringArm",
    ParamentValue = {"Idle:1.5"}
  },
  TimeToResetPitchMaxSpeed = {
    ParamentName = "TimeToResetPitchMaxSpeed",
    ParamentValue = T.RT_3
  },
  TimeToResetSocketOffsetMaxSpeed = {
    ParamentName = "TimeToResetSocketOffsetMaxSpeed",
    ParamentValue = T.RT_3
  },
  TimeToResetSpringArmMaxSpeed = {
    ParamentName = "TimeToResetSpringArmMaxSpeed",
    ParamentValue = T.RT_3
  }
})
