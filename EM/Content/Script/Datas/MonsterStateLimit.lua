local T = {}
T.RT_1 = {"Hit"}
T.RT_2 = {"Skill"}
T.RT_3 = {"Controlled"}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MonsterStateLimit", {
  Birth = {ActionMode = 1, SourceTag = "Birth"},
  CaptureSuccess = {
    ActionMode = 1,
    InterruptNavLink = true,
    SourceTag = "CaptureSuccess"
  },
  Cover = {ActionMode = 0, SourceTag = "Cover"},
  Crouch = {ActionMode = 0, SourceTag = "Crouch"},
  Dead = {
    ActionMode = 1,
    ForbidAI = 1,
    InterruptNavLink = true,
    SourceTag = "Dead"
  },
  Defeated = {
    ActionMode = 1,
    InterruptNavLink = true,
    SourceTag = "Defeated"
  },
  Falling = {ActionMode = 0, SourceTag = "Falling"},
  HeavyHit = {
    ActionMode = 1,
    InterruptNavLink = true,
    SourceTag = "HeavyHit",
    TagType = T.RT_1
  },
  HitFly = {
    ActionMode = 1,
    BreakableItem = {Breakable = true},
    InterruptNavLink = true,
    SourceTag = "HitFly",
    TagType = T.RT_1
  },
  Idle = {ActionMode = 0, SourceTag = "Idle"},
  LandHeavy = {ActionMode = 0, SourceTag = "LandHeavy"},
  LightHit = {
    ActionMode = 1,
    InterruptNavLink = true,
    SourceTag = "LightHit",
    TagType = T.RT_1
  },
  LightHitRanged = {
    ActionMode = 1,
    InterruptNavLink = true,
    SourceTag = "LightHitRanged",
    TagType = T.RT_1
  },
  Shooting = {
    ActionMode = 0,
    SourceTag = "Shooting",
    TagType = T.RT_2
  },
  Skill = {
    ActionMode = 0,
    SourceTag = "Skill",
    TagType = T.RT_2
  },
  Slide = {ActionMode = 0, SourceTag = "Slide"},
  Stun = {
    ActionMode = 1,
    InterruptNavLink = true,
    SourceTag = "Stun",
    TagType = T.RT_3
  },
  StunFloat = {
    ActionMode = 1,
    InterruptNavLink = true,
    SourceTag = "StunFloat",
    TagType = T.RT_3
  },
  WaitForCaught = {
    ActionMode = 1,
    InterruptNavLink = true,
    SourceTag = "WaitForCaught"
  }
})
