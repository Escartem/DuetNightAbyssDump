local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MonsterStateMachine", {
  Birth = {SourceTag = "Birth"},
  CaptureSuccess = {
    Cover = 1,
    Crouch = 1,
    Falling = 1,
    HeavyHit = 1,
    HitFly = 1,
    Idle = 1,
    LandHeavy = 1,
    LightHit = 1,
    LightHitRanged = 1,
    Shooting = 1,
    Skill = 1,
    Slide = 1,
    SourceTag = "CaptureSuccess"
  },
  Cover = {SourceTag = "Cover"},
  Crouch = {SourceTag = "Crouch"},
  Dead = {
    Cover = 1,
    Crouch = 1,
    Falling = 1,
    HeavyHit = 1,
    HitFly = 1,
    Idle = 1,
    LandHeavy = 1,
    LightHit = 1,
    LightHitRanged = 1,
    Shooting = 1,
    Skill = 1,
    Slide = 1,
    SourceTag = "Dead",
    Stun = 1
  },
  Defeated = {
    Cover = 1,
    Crouch = 1,
    Defeated = 1,
    Falling = 1,
    HeavyHit = 1,
    HitFly = 1,
    LandHeavy = 1,
    LightHit = 1,
    LightHitRanged = 1,
    Shooting = 1,
    Skill = 1,
    Slide = 1,
    SourceTag = "Defeated",
    Stun = 1,
    StunFloat = 1
  },
  Falling = {SourceTag = "Falling"},
  HeavyHit = {
    LightHit = 1,
    LightHitRanged = 1,
    Shooting = 1,
    Skill = 1,
    SourceTag = "HeavyHit"
  },
  HitFly = {
    Cover = 1,
    HeavyHit = 1,
    LightHit = 1,
    LightHitRanged = 1,
    Shooting = 1,
    Skill = 1,
    Slide = 1,
    SourceTag = "HitFly",
    Stun = 1
  },
  Idle = {SourceTag = "Idle"},
  LandHeavy = {SourceTag = "LandHeavy"},
  LightHit = {
    Shooting = 1,
    Skill = 1,
    SourceTag = "LightHit"
  },
  LightHitRanged = {
    Shooting = 1,
    Skill = 1,
    SourceTag = "LightHitRanged"
  },
  Shooting = {SourceTag = "Shooting"},
  Skill = {SourceTag = "Skill"},
  Slide = {SourceTag = "Slide"},
  Stun = {
    HeavyHit = 1,
    LightHit = 1,
    LightHitRanged = 1,
    Shooting = 1,
    Skill = 1,
    Slide = 1,
    SourceTag = "Stun",
    Stun = 1
  },
  StunFloat = {
    Crouch = 1,
    Falling = 1,
    HitFly = 1,
    LandHeavy = 1,
    Shooting = 1,
    Skill = 1,
    Slide = 1,
    SourceTag = "StunFloat",
    Stun = 1,
    StunFloat = 1
  },
  WaitForCaught = {
    Cover = 1,
    Crouch = 1,
    Falling = 1,
    HeavyHit = 1,
    HitFly = 1,
    LandHeavy = 1,
    LightHit = 1,
    LightHitRanged = 1,
    Shooting = 1,
    Skill = 1,
    Slide = 1,
    SourceTag = "WaitForCaught",
    Stun = 1,
    StunFloat = 1
  }
})
