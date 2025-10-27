local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RougeLikeTalentBranch", {
  [1] = {
    BranchId = 1,
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rouge_TalentBranch_Skill.T_Rouge_TalentBranch_Skill'",
    Name = "UI_Rouge_Talent_CHARATK",
    SubTitle = "UI_Rouge_TalentSubTitle_CHARATK"
  },
  [2] = {
    BranchId = 2,
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rouge_TalentBranch_Adaptability.T_Rouge_TalentBranch_Adaptability'",
    Name = "UI_Rouge_Talent_CHARDEF",
    SubTitle = "UI_Rouge_TalentSubTitle_CHARDEF"
  },
  [3] = {
    BranchId = 3,
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rouge_Talent_Melee_AttackUP.T_Rouge_Talent_Melee_AttackUP'",
    Name = "UI_Rouge_Talent_MELEE",
    SubTitle = "UI_Rouge_TalentSubTitle_MELEE"
  },
  [4] = {
    BranchId = 4,
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rouge_Talent_Range_AttackUP.T_Rouge_Talent_Range_AttackUP'",
    Name = "UI_Rouge_Talent_RANGE",
    SubTitle = "UI_Rouge_TalentSubTitle_RANGE"
  }
})
