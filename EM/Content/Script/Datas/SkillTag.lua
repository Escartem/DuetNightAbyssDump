local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SkillTag", {
  NotRealSkill1 = {
    SkillTag = "NotRealSkill1"
  },
  NotRealSkill2 = {
    SkillTag = "NotRealSkill2"
  }
})
