local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("QuestActiveSkill", {
  [10010101] = {
    ActiveType = "Lock",
    InactiveorActive = "Inactive",
    QuestId = 10010101,
    QuestStartorSuccess = "Success",
    SkillId = {
      "Attack",
      "Jump",
      "Slide",
      "BulletJump",
      "Skill1",
      "Skill2",
      "Skill3",
      "Fire",
      "Avoid",
      "Crouch"
    }
  },
  [10010105] = {
    ActiveType = "Lock",
    InactiveorActive = "Active",
    QuestId = 10010105,
    QuestStartorSuccess = "Success",
    SkillId = {
      "Jump",
      "Slide",
      "BulletJump",
      "Crouch"
    }
  },
  [10010107] = {
    ActiveType = "Lock",
    InactiveorActive = "Active",
    QuestId = 10010107,
    QuestStartorSuccess = "Success",
    SkillId = {"Attack", "Avoid"}
  },
  [10010111] = {
    ActiveType = "Lock",
    InactiveorActive = "Active",
    QuestId = 10010111,
    QuestStartorSuccess = "Success",
    SkillId = {"Fire"}
  },
  [10010212] = {
    ActiveType = "Lock",
    InactiveorActive = "Active",
    QuestId = 10010212,
    QuestStartorSuccess = "Success",
    SkillId = {"Skill1"}
  },
  [10010306] = {
    ActiveType = "Lock",
    InactiveorActive = "Active",
    QuestId = 10010306,
    QuestStartorSuccess = "Success",
    SkillId = {"Skill2"}
  },
  [20010305] = {
    ActiveType = "Lock",
    InactiveorActive = "Active",
    QuestId = 20010305,
    QuestStartorSuccess = "Success",
    SkillId = {"Skill3"}
  }
})
