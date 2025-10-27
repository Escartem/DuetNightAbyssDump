local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("AttrLimit", {
  DefaultMaxAttackSpeed = {
    AttachAttrName = "MaxAttackSpeed",
    AttrName = "DefaultMaxAttackSpeed",
    LimitValue = 3
  },
  MaxBulletJumpVelocityModifier = {
    AttachAttrName = "BulletJumpVelocityModifier",
    AttrName = "MaxBulletJumpVelocityModifier",
    LimitValue = 3
  },
  MaxJumpVelocityModifier = {
    AttachAttrName = "JumpVelocityModifier",
    AttrName = "MaxJumpVelocityModifier",
    LimitValue = 3
  },
  MaxSkillEfficiency = {
    AttachAttrName = "SkillEfficiency",
    AttrName = "MaxSkillEfficiency",
    LimitValue = 1.75
  },
  MaxSkillRange = {
    AttachAttrName = "SkillRange",
    AttrName = "MaxSkillRange",
    LimitValue = 2.8
  },
  MaxSkillSustain = {
    AttachAttrName = "SkillSustain",
    AttrName = "MaxSkillSustain",
    LimitValue = 4
  },
  MaxSlideVelocityModifier = {
    AttachAttrName = "SlideVelocityModifier",
    AttrName = "MaxSlideVelocityModifier",
    LimitValue = 3
  },
  MaxTriggerProbability = {
    AttachAttrName = "TriggerProbability",
    AttrName = "MaxTriggerProbability",
    LimitValue = 1
  },
  MaxWalkSpeedModifier = {
    AttachAttrName = "WalkSpeedModifier",
    AttrName = "MaxWalkSpeedModifier",
    LimitValue = 0.6
  },
  SpChangeLimitPercent = {
    AttrName = "SpChangeLimitPercent",
    LimitValue = 0.25
  }
})
