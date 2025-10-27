local T = {}
T.RT_1 = {
  [1] = "TERM_Common_OverES"
}
T.RT_2 = {
  [1] = "TERM_Common_AdditionalDmg"
}
T.RT_3 = {
  [1] = "TERM_Common_Taunt"
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Desc2ProperTerm", {
  [404] = T.RT_1,
  [414] = T.RT_1,
  [426] = T.RT_2,
  [160102] = T.RT_1,
  [180103] = T.RT_2,
  [240102] = T.RT_1,
  [240103] = {
    [1] = "TERM_Common_SkillSpeed"
  },
  [320102] = T.RT_3,
  [320104] = T.RT_3,
  [410201] = T.RT_1,
  [420202] = T.RT_1,
  [420203] = T.RT_1,
  [510202] = T.RT_1,
  [530102] = T.RT_1
})
