local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("CombatProperTerm", {
  TERM_Common_AdditionalDmg = {
    CombatProperTermExplaination = "TERMEXP_Common_AdditionalDmg",
    CombatProperTermId = "TERM_Common_AdditionalDmg"
  },
  TERM_Common_OverES = {
    CombatProperTermExplaination = "TERMEXP_Common_OverES",
    CombatProperTermId = "TERM_Common_OverES"
  },
  TERM_Common_SkillSpeed = {
    CombatProperTermExplaination = "TERMEXP_Common_SkillSpeed",
    CombatProperTermId = "TERM_Common_SkillSpeed"
  },
  TERM_Common_Taunt = {
    CombatProperTermExplaination = "TERMEXP_Common_Taunt",
    CombatProperTermId = "TERM_Common_Taunt"
  }
})
