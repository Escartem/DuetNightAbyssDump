local T = {}
T.RT_1 = {
  Damping = 0.9,
  LimitAngle = 0,
  Radius = 3.0,
  Stiffness = 0.7,
  Width = 5,
  WordDampingLocation = 0.9,
  WordDampingRotation = 0.5
}
T.RT_2 = {
  Damping = 0.8,
  LimitAngle = 0,
  Radius = 3.0,
  Stiffness = 0.6,
  Width = 5,
  WordDampingLocation = 0.9,
  WordDampingRotation = 0.5
}
T.RT_3 = {
  Damping = 0.8,
  LimitAngle = 0,
  Radius = 3.0,
  Stiffness = 0.8,
  Width = 5,
  WordDampingLocation = 0.9,
  WordDampingRotation = 0.5
}
T.RT_4 = {
  Damping = 0.9,
  LimitAngle = 0,
  Radius = 3.0,
  Stiffness = 0.8,
  Width = 5,
  WordDampingLocation = 0.9,
  WordDampingRotation = 0.5
}
T.RT_5 = {
  Damping = 0.1,
  LimitAngle = 0,
  Radius = 3.0,
  Stiffness = 0.8,
  Width = 5,
  WordDampingLocation = 0.9,
  WordDampingRotation = 0.5
}
T.RT_6 = {
  Damping = 0.6,
  LimitAngle = 0,
  Radius = 3.0,
  Stiffness = 0.3,
  Width = 5,
  WordDampingLocation = 0.9,
  WordDampingRotation = 0.5
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("KawaiiParams", {
  [1001] = {
    KawaiiId = 1001,
    KawaiiParament = {
      EnterJump = {
        Damping = 0.8,
        LimitAngle = 0,
        Radius = 3.0,
        Stiffness = 0.7,
        Width = 5,
        WordDampingLocation = 0.9,
        WordDampingRotation = 0.5
      },
      EnterSecJump = T.RT_1,
      Idle = T.RT_2,
      InAir = T.RT_1,
      Land = T.RT_3,
      LevelEnter = T.RT_2,
      RunLoop = {
        Damping = 0.9,
        LimitAngle = 0,
        Radius = 3.0,
        Stiffness = 0.65,
        Width = 5,
        WordDampingLocation = 0.9,
        WordDampingRotation = 0.5
      },
      RunStart = T.RT_2,
      RunStop = T.RT_3,
      SlideToIdle = T.RT_2,
      StartSlide = T.RT_2
    },
    KawaiiType = "hair"
  },
  [1002] = {
    KawaiiId = 1002,
    KawaiiParament = {
      EnterJump = {
        Damping = 0.8,
        LimitAngle = 0,
        Radius = 3.0,
        Stiffness = 0.6,
        Width = 5,
        WordDampingLocation = 0.7,
        WordDampingRotation = 0.5
      },
      EnterSecJump = {
        Damping = 0.8,
        LimitAngle = 0,
        Radius = 3.0,
        Stiffness = 0.5,
        Width = 5,
        WordDampingLocation = 0.7,
        WordDampingRotation = 0.5
      },
      Idle = T.RT_3,
      InAir = {
        Damping = 0.7,
        LimitAngle = 0,
        Radius = 3.0,
        Stiffness = 0.5,
        Width = 5,
        WordDampingLocation = 0.7,
        WordDampingRotation = 0.5
      },
      Land = T.RT_4,
      LevelEnter = {
        Damping = 0.8,
        LimitAngle = 0,
        Radius = 3.0,
        Stiffness = 0.8,
        Width = 5,
        WordDampingLocation = 0.7,
        WordDampingRotation = 0.5
      },
      RunLoop = T.RT_3,
      RunStart = T.RT_3,
      RunStop = T.RT_3,
      SlideToIdle = T.RT_3,
      StartSlide = T.RT_3
    },
    KawaiiType = "cloak"
  },
  [1003] = {
    KawaiiId = 1003,
    KawaiiParament = {
      EnterJump = T.RT_3,
      EnterSecJump = T.RT_3,
      Idle = T.RT_3,
      InAir = T.RT_3,
      Land = T.RT_3,
      LevelEnter = T.RT_3,
      RunLoop = T.RT_3,
      RunStart = T.RT_3,
      RunStop = T.RT_3,
      SlideToIdle = T.RT_3,
      StartSlide = T.RT_3
    },
    KawaiiType = "skirt"
  },
  [1004] = {
    KawaiiId = 1004,
    KawaiiParament = {
      EnterJump = T.RT_5,
      EnterSecJump = T.RT_5,
      Idle = T.RT_5,
      InAir = T.RT_5,
      Land = T.RT_5,
      LevelEnter = T.RT_5,
      RunLoop = T.RT_5,
      RunStart = T.RT_5,
      RunStop = T.RT_5,
      SlideToIdle = T.RT_5,
      StartSlide = T.RT_5
    },
    KawaiiType = "hair"
  },
  [1005] = {
    KawaiiId = 1005,
    KawaiiParament = {
      EnterJump = T.RT_6,
      EnterSecJump = T.RT_6,
      Idle = T.RT_6,
      InAir = {
        Damping = 0.7,
        LimitAngle = 0,
        Radius = 3.0,
        Stiffness = 0.5,
        Width = 5,
        WordDampingLocation = 0.8,
        WordDampingRotation = 0.5
      },
      Land = {
        Damping = 0.7,
        LimitAngle = 0,
        Radius = 3.0,
        Stiffness = 0.3,
        Width = 5,
        WordDampingLocation = 0.9,
        WordDampingRotation = 0.5
      },
      LevelEnter = T.RT_6,
      RunLoop = {
        Damping = 0.6,
        LimitAngle = 0,
        Radius = 3.0,
        Stiffness = 0.3,
        Width = 5,
        WordDampingLocation = 0.8,
        WordDampingRotation = 0.5
      },
      RunStart = T.RT_6,
      RunStop = T.RT_6,
      SlideToIdle = T.RT_6,
      StartSlide = {
        Damping = 0.6,
        LimitAngle = 0,
        Radius = 3.0,
        Stiffness = 0.3,
        Width = 5,
        WordDampingLocation = 0.7,
        WordDampingRotation = 0.5
      }
    },
    KawaiiType = "cloak"
  },
  [1006] = {
    KawaiiId = 1006,
    KawaiiParament = {
      EnterJump = T.RT_3,
      EnterSecJump = T.RT_3,
      Idle = T.RT_3,
      InAir = {
        Damping = 0.9,
        LimitAngle = 0,
        Radius = 3.0,
        Stiffness = 0.9,
        Width = 5,
        WordDampingLocation = 0.9,
        WordDampingRotation = 0.5
      },
      Land = T.RT_3,
      LevelEnter = T.RT_3,
      RunLoop = T.RT_3,
      RunStart = T.RT_3,
      RunStop = T.RT_4,
      SlideToIdle = T.RT_3,
      StartSlide = T.RT_3
    },
    KawaiiType = "hair"
  },
  [1007] = {
    KawaiiId = 1007,
    KawaiiParament = {
      EnterJump = T.RT_2,
      EnterSecJump = T.RT_2,
      Idle = T.RT_2,
      InAir = {
        Damping = 0.7,
        LimitAngle = 0,
        Radius = 3.0,
        Stiffness = 0.6,
        Width = 5,
        WordDampingLocation = 0.9,
        WordDampingRotation = 0.5
      },
      Land = T.RT_2,
      LevelEnter = T.RT_2,
      RunLoop = T.RT_2,
      RunStart = T.RT_2,
      RunStop = T.RT_2,
      SlideToIdle = T.RT_2,
      StartSlide = T.RT_2
    },
    KawaiiType = "cloak"
  }
})
