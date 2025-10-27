local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("InputCache", {
  Attack = {
    GroupId = 1,
    InputKey = "Attack",
    Time = 0.15
  },
  AttackHold = {
    GroupId = 1,
    InputKey = "AttackHold",
    Time = 0.15
  },
  Avoid = {
    GroupId = 1,
    InputKey = "Avoid",
    Time = 0.15
  },
  BulletJump = {
    GroupId = 1,
    InputKey = "BulletJump",
    Time = 0.15
  },
  Fire = {
    GroupId = 1,
    InputKey = "Fire",
    Time = 0.15
  },
  HeavyShooting = {
    GroupId = 1,
    InputKey = "HeavyShooting",
    Time = 0.15
  },
  Jump = {
    GroupId = 1,
    InputKey = "Jump",
    Time = 0.15
  },
  Reload = {
    GroupId = 1,
    InputKey = "Reload",
    Time = 0.15
  },
  Skill1 = {
    GroupId = 1,
    InputKey = "Skill1",
    Time = 0.15
  },
  Skill1Hold = {
    GroupId = 1,
    InputKey = "Skill1Hold",
    Time = 0.15
  },
  Skill2 = {
    GroupId = 1,
    InputKey = "Skill2",
    Time = 0.15
  },
  Skill2Hold = {
    GroupId = 1,
    InputKey = "Skill2Hold",
    Time = 0.15
  },
  Slide = {
    GroupId = 2,
    InputKey = "Slide",
    Time = 100
  }
})
