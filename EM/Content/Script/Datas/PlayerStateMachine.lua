local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PlayerStateMachine", {
  Avoid = {
    Interactive = 1,
    LandHeavy = 1,
    Seating = 1,
    Shooting = 1,
    Skill = 1,
    SourceTag = "Avoid"
  },
  BulletJump = {
    Interactive = 1,
    LandHeavy = 1,
    Seating = 1,
    SourceTag = "BulletJump"
  },
  Crouch = {Seating = 1, SourceTag = "Crouch"},
  Dead = {
    BulletJump = 1,
    Crouch = 1,
    Falling = 1,
    GrabHit = 1,
    HeavyHit = 1,
    HitFly = 1,
    Hook = 1,
    Idle = 1,
    Interactive = 1,
    LandHeavy = 1,
    LevelEnter = 1,
    LevelFinish = 1,
    LightHit = 1,
    LightHitRanged = 1,
    Seating = 1,
    Shooting = 1,
    Skill = 1,
    Slide = 1,
    SourceTag = "Dead",
    Stun = 1
  },
  Falling = {
    Interactive = 1,
    Seating = 1,
    SourceTag = "Falling"
  },
  GrabHit = {
    BulletJump = 1,
    Crouch = 1,
    HeavyHit = 1,
    HitFly = 1,
    Hook = 1,
    Interactive = 1,
    LandHeavy = 1,
    LightHit = 1,
    LightHitRanged = 1,
    Shooting = 1,
    Skill = 1,
    Slide = 1,
    SourceTag = "GrabHit",
    Stun = 1
  },
  HeavyHit = {
    HeavyHit = 1,
    Hook = 1,
    Interactive = 1,
    LandHeavy = 1,
    LightHit = 1,
    LightHitRanged = 1,
    Seating = 1,
    SourceTag = "HeavyHit"
  },
  HitFly = {
    BulletJump = 1,
    Crouch = 1,
    HeavyHit = 1,
    Hook = 1,
    Interactive = 1,
    LandHeavy = 1,
    LightHit = 1,
    LightHitRanged = 1,
    Seating = 1,
    Shooting = 1,
    Skill = 1,
    Slide = 1,
    SourceTag = "HitFly",
    Stun = 1
  },
  HitRepel = {
    Hook = 1,
    Interactive = 1,
    Seating = 1,
    SourceTag = "HitRepel"
  },
  Hook = {
    GrabHit = 1,
    HeavyHit = 1,
    HitFly = 1,
    Interactive = 1,
    LightHit = 1,
    LightHitRanged = 1,
    Seating = 1,
    SourceTag = "Hook",
    Stun = 1
  },
  Idle = {SourceTag = "Idle"},
  Interactive = {
    GrabHit = 1,
    HeavyHit = 1,
    HitFly = 1,
    LightHit = 1,
    LightHitRanged = 1,
    Seating = 1,
    SourceTag = "Interactive",
    Stun = 1
  },
  LandHeavy = {
    Interactive = 1,
    Seating = 1,
    SourceTag = "LandHeavy"
  },
  LevelEnter = {
    GrabHit = 1,
    HeavyHit = 1,
    HitFly = 1,
    Hook = 1,
    Interactive = 1,
    LightHit = 1,
    LightHitRanged = 1,
    Seating = 1,
    SourceTag = "LevelEnter",
    Stun = 1
  },
  LevelFinish = {
    GrabHit = 1,
    HeavyHit = 1,
    HitFly = 1,
    Hook = 1,
    Interactive = 1,
    LightHit = 1,
    LightHitRanged = 1,
    Seating = 1,
    SourceTag = "LevelFinish",
    Stun = 1
  },
  LightHit = {
    Hook = 1,
    Interactive = 1,
    Seating = 1,
    SourceTag = "LightHit"
  },
  LightHitRanged = {
    Hook = 1,
    Interactive = 1,
    Seating = 1,
    SourceTag = "LightHitRanged"
  },
  Recovery = {
    GrabHit = 1,
    HeavyHit = 1,
    HitFly = 1,
    Interactive = 1,
    LightHit = 1,
    LightHitRanged = 1,
    Seating = 1,
    SourceTag = "Recovery",
    Stun = 1
  },
  Seating = {
    Avoid = 1,
    BulletJump = 1,
    Crouch = 1,
    Hook = 1,
    Interactive = 1,
    LandHeavy = 1,
    Seating = 1,
    Slide = 1,
    SourceTag = "Seating"
  },
  Shooting = {
    Interactive = 1,
    LandHeavy = 1,
    Seating = 1,
    SourceTag = "Shooting"
  },
  Skill = {
    Interactive = 1,
    LandHeavy = 1,
    Seating = 1,
    SourceTag = "Skill"
  },
  Slide = {
    Interactive = 1,
    LandHeavy = 1,
    Seating = 1,
    Shooting = 1,
    SourceTag = "Slide"
  },
  Stun = {
    BulletJump = 1,
    Crouch = 1,
    HeavyHit = 1,
    Hook = 1,
    Interactive = 1,
    LandHeavy = 1,
    LightHit = 1,
    LightHitRanged = 1,
    Shooting = 1,
    Skill = 1,
    Slide = 1,
    SourceTag = "Stun",
    Stun = 1
  }
})
