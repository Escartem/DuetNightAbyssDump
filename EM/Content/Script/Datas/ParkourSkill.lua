local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ParkourSkill", {
  [1] = {
    EffectBasic = 3,
    EffectConstatnce = 1,
    EffectFactor = 0,
    EffectID = 5000204,
    IsPositiveBuff = true,
    MultiplayerOnly = 1,
    ShowToast = "UI_Party_Parkour_Skill_01",
    SkillID = 1,
    Target = 1,
    WeightBasic = 1000,
    WeightConstant = 0,
    WeightFactor = -10
  },
  [2] = {
    EffectBasic = 5,
    EffectConstatnce = 1,
    EffectFactor = 0,
    EffectID = 5000201,
    IsPositiveBuff = true,
    MultiplayerOnly = 1,
    ShowToast = "UI_Party_Parkour_Skill_02",
    SkillID = 2,
    Target = 3,
    WeightBasic = 1000,
    WeightConstant = 2,
    WeightFactor = -15
  },
  [3] = {
    EffectBasic = 7,
    EffectConstatnce = 1,
    EffectFactor = -2,
    EffectID = 5000203,
    IsPositiveBuff = true,
    ShowToast = "UI_Party_Parkour_Skill_03",
    SkillID = 3,
    Target = 0,
    WeightBasic = 1000,
    WeightConstant = 0,
    WeightFactor = -30
  },
  [4] = {
    EffectBasic = 5,
    EffectConstatnce = 1,
    EffectFactor = 0,
    EffectID = 5000207,
    IsPositiveBuff = true,
    MultiplayerOnly = 1,
    ShowToast = "UI_Party_Parkour_Skill_04",
    SkillID = 4,
    Target = 0,
    WeightBasic = 1000,
    WeightConstant = 0,
    WeightFactor = 50
  },
  [5] = {
    EffectBasic = 7,
    EffectConstatnce = 1,
    EffectFactor = -1,
    EffectID = 5000206,
    IsPositiveBuff = true,
    ShowToast = "UI_Party_Parkour_Skill_05",
    SkillID = 5,
    Target = 0,
    WeightBasic = 1000,
    WeightConstant = 2,
    WeightFactor = -10
  },
  [6] = {
    EffectBasic = 7,
    EffectConstatnce = 1,
    EffectFactor = -1,
    EffectID = 5000208,
    IsPositiveBuff = true,
    ShowToast = "UI_Party_Parkour_Skill_06",
    SkillID = 6,
    Target = 0,
    WeightBasic = 1000,
    WeightConstant = 3,
    WeightFactor = 0
  }
})
