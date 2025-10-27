local T = {}
T.RT_1 = {Breakable = true, Radius = 60}
T.RT_2 = {"Controlled"}
T.RT_3 = {"Controlled", "Hit"}
T.RT_4 = {
  "Interactive"
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PlayerStateLimit", {
  Avoid = {
    ActionMode = 0,
    SourceTag = "Avoid",
    TagType = {"Move", "Avoid"}
  },
  BulletJump = {
    ActionMode = 0,
    BreakableItem = T.RT_1,
    SourceTag = "BulletJump",
    TagType = {"Move"}
  },
  Crouch = {
    ActionMode = 0,
    SourceTag = "Crouch",
    TagType = {"Move", "Crouch"}
  },
  Dead = {
    ActionMode = 1,
    ForbidInput = 1,
    SourceTag = "Dead",
    TagType = T.RT_2
  },
  Falling = {ActionMode = 0, SourceTag = "Falling"},
  GrabHit = {
    ActionMode = 1,
    ForbidInput = 1,
    SourceTag = "GrabHit",
    TagType = T.RT_2
  },
  HeavyHit = {
    ActionMode = 1,
    ForbidInput = 1,
    SourceTag = "HeavyHit",
    TagType = T.RT_3
  },
  HitFly = {
    ActionMode = 1,
    BreakableItem = T.RT_1,
    ForbidInput = 1,
    SourceTag = "HitFly",
    TagType = T.RT_3
  },
  HitRepel = {
    ActionMode = 1,
    ForbidInput = 1,
    SourceTag = "HitRepel"
  },
  Hook = {
    SourceTag = "Hook",
    TagType = T.RT_4
  },
  Idle = {SourceTag = "Idle"},
  Interactive = {
    ActionMode = 1,
    ForbidInput = 1,
    SourceTag = "Interactive",
    TagType = T.RT_4
  },
  LandHeavy = {
    ActionMode = 1,
    BreakableItem = {Breakable = true, Radius = 250},
    SourceTag = "LandHeavy",
    TagType = {"Move", "LandHeavy"}
  },
  LevelEnter = {
    ActionMode = 1,
    ForbidInput = 1,
    SourceTag = "LevelEnter"
  },
  LevelFinish = {
    ActionMode = 1,
    ForbidInput = 1,
    SourceTag = "LevelFinish"
  },
  LightHit = {
    ActionMode = 1,
    ForbidInput = 1,
    SourceTag = "LightHit",
    TagType = T.RT_3
  },
  LightHitRanged = {
    ActionMode = 1,
    ForbidInput = 1,
    SourceTag = "LightHitRanged",
    TagType = T.RT_3
  },
  Recovery = {
    ActionMode = 1,
    ForbidInput = 1,
    SourceTag = "Recovery"
  },
  Seating = {
    ActionMode = 0,
    SourceTag = "Seating",
    TagType = {"Seating"}
  },
  Shooting = {
    ActionMode = 0,
    SourceTag = "Shooting",
    TagType = {"Shooting"}
  },
  Skill = {
    ActionMode = 0,
    SourceTag = "Skill",
    TagType = {"Skill"}
  },
  Slide = {
    ActionMode = 0,
    BreakableItem = T.RT_1,
    SourceTag = "Slide",
    TagType = {"Move", "Slide"}
  },
  Stun = {
    ActionMode = 1,
    ForbidInput = 1,
    SourceTag = "Stun",
    TagType = T.RT_2
  }
})
