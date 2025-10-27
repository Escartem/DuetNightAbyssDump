local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SkillType", {
  Attack = {EnumValue = 1, SkillType = "Attack"},
  Block = {EnumValue = 2, SkillType = "Block"},
  BlockRun = {EnumValue = 3, SkillType = "BlockRun"},
  BossSkill = {EnumValue = 18, SkillType = "BossSkill"},
  Condemn = {EnumValue = 4, SkillType = "Condemn"},
  ExtraPassive = {
    EnumValue = 8,
    SkillType = "ExtraPassive"
  },
  FallAttack = {EnumValue = 5, SkillType = "FallAttack"},
  HeavyAttack = {
    EnumValue = 6,
    SkillType = "HeavyAttack"
  },
  HeavyShooting = {
    EnumValue = 19,
    SkillType = "HeavyShooting"
  },
  Movement = {EnumValue = 21, SkillType = "Movement"},
  Passive = {EnumValue = 7, SkillType = "Passive"},
  PhantomPassive = {
    EnumValue = 9,
    SkillType = "PhantomPassive"
  },
  Recovery = {EnumValue = 10, SkillType = "Recovery"},
  Reload = {EnumValue = 11, SkillType = "Reload"},
  Shooting = {EnumValue = 12, SkillType = "Shooting"},
  ShootingOverheat = {
    EnumValue = 20,
    SkillType = "ShootingOverheat"
  },
  Skill1 = {EnumValue = 13, SkillType = "Skill1"},
  Skill2 = {EnumValue = 14, SkillType = "Skill2"},
  SlideAttack = {
    EnumValue = 15,
    SkillType = "SlideAttack"
  },
  Support = {EnumValue = 16, SkillType = "Support"},
  WeaponPassive = {
    EnumValue = 17,
    SkillType = "WeaponPassive"
  }
})
