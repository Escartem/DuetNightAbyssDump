local T = {}
T.RT_1 = {
  AimSpeed = 0.3,
  MaxPitch = 16,
  MaxYaw = 12
}
T.RT_2 = {
  AimRadius = 1.5,
  AimSpeed = 0.15,
  MaxPitch = 8,
  MaxYaw = 8,
  PitchWeight = 15,
  YawWeight = 20
}
T.RT_3 = {
  AimSpeed = 0.25,
  MaxPitch = 24,
  MaxYaw = 24
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("HelpAim", {
  Crossbow_01 = {
    AimTargetFilter = {
      AimRadius = 2,
      AimSpeed = 0.2,
      MaxPitch = 4,
      MaxYaw = 3,
      PitchWeight = 15,
      YawWeight = 20
    },
    HelpAimChooseTarget = "Char_Shoot_10_3600",
    Key = "Crossbow_01",
    MaxDistance = 2800,
    OpenAimChooseTarget = "Char_Shoot_30_3600",
    OpenAimTargetFilter = T.RT_1
  },
  Crossbow_02 = {
    AimTargetFilter = T.RT_2,
    HelpAimChooseTarget = "Char_Shoot_10_3600",
    Key = "Crossbow_02",
    MaxDistance = 2800,
    OpenAimChooseTarget = "Char_Shoot_30_3600",
    OpenAimTargetFilter = T.RT_3
  },
  Machinegun_01 = {
    AimTargetFilter = {
      AimRadius = 3,
      AimSpeed = 0.2,
      MaxPitch = 4,
      MaxYaw = 3,
      PitchWeight = 15,
      YawWeight = 20
    },
    HelpAimChooseTarget = "Char_Shoot_10_3600",
    Key = "Machinegun_01",
    MaxDistance = 2800,
    OpenAimChooseTarget = "Char_Shoot_30_3600",
    OpenAimTargetFilter = T.RT_1
  },
  Machinegun_02 = {
    AimTargetFilter = T.RT_2,
    HelpAimChooseTarget = "Char_Shoot_10_3600",
    Key = "Machinegun_02",
    MaxDistance = 2800,
    OpenAimChooseTarget = "Char_Shoot_30_3600",
    OpenAimTargetFilter = T.RT_3
  },
  OnlyOpenAim_01 = {
    Key = "OnlyOpenAim_01",
    OpenAimChooseTarget = "Char_Shoot_30_3600",
    OpenAimTargetFilter = T.RT_1
  },
  Pistol_01 = {
    AimTargetFilter = {
      AimRadius = 2,
      AimSpeed = 0.3,
      MaxPitch = 4,
      MaxYaw = 3,
      PitchWeight = 15,
      YawWeight = 20
    },
    HelpAimChooseTarget = "Char_Shoot_10_3600",
    Key = "Pistol_01",
    MaxDistance = 2800,
    OpenAimChooseTarget = "Char_Shoot_30_3600",
    OpenAimTargetFilter = T.RT_1
  },
  Pistol_02 = {
    AimTargetFilter = T.RT_2,
    HelpAimChooseTarget = "Char_Shoot_10_3600",
    Key = "Pistol_02",
    MaxDistance = 2800,
    OpenAimChooseTarget = "Char_Shoot_30_3600",
    OpenAimTargetFilter = T.RT_3
  },
  Saiqi_01 = {
    AimTargetFilter = {
      AimSpeed = 0.1,
      MaxPitch = 4,
      MaxYaw = 3,
      PitchWeight = 15,
      YawWeight = 20
    },
    HelpAimChooseTarget = "Char_Shoot_10_3600",
    Key = "Saiqi_01",
    MaxDistance = 2800,
    OpenAimChooseTarget = "Char_Shoot_30_3600",
    OpenAimTargetFilter = T.RT_1
  },
  Saiqi_02 = {
    AimTargetFilter = {
      AimRadius = 1,
      AimSpeed = 0.15,
      MaxPitch = 10,
      MaxYaw = 10,
      PitchWeight = 15,
      YawWeight = 20
    },
    HelpAimChooseTarget = "Char_Shoot_10_3600",
    Key = "Saiqi_02",
    MaxDistance = 2800,
    OpenAimChooseTarget = "Char_Shoot_30_3600",
    OpenAimTargetFilter = {
      AimSpeed = 0.25,
      MaxPitch = 30,
      MaxYaw = 30
    }
  },
  Shotgun_01 = {
    AimTargetFilter = {
      AimSpeed = 0.3,
      MaxPitch = 4,
      MaxYaw = 3,
      PitchWeight = 15,
      YawWeight = 20
    },
    HelpAimChooseTarget = "Char_Shoot_10_3600",
    Key = "Shotgun_01",
    MaxDistance = 2800,
    OpenAimChooseTarget = "Char_Shoot_30_3600",
    OpenAimTargetFilter = T.RT_1
  },
  Shotgun_02 = {
    AimTargetFilter = T.RT_2,
    HelpAimChooseTarget = "Char_Shoot_10_3600",
    Key = "Shotgun_02",
    MaxDistance = 2800,
    OpenAimChooseTarget = "Char_Shoot_30_3600",
    OpenAimTargetFilter = T.RT_3
  }
})
