local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("DataSetIgnore", {
  BaonuEnd = {ID = "BaonuEnd"},
  BaonuFinish = {
    ID = "BaonuFinish"
  },
  BlockOverride = {
    ID = "BlockOverride"
  },
  CamBlendTime = {
    ID = "CamBlendTime"
  },
  CollisionName = {
    ID = "CollisionName"
  },
  DeadDissolveTime = {
    ID = "DeadDissolveTime"
  },
  HitMoveDis = {ID = "HitMoveDis"},
  IsDestructPart = {
    ID = "IsDestructPart"
  },
  LinenSkill02Range = {
    ID = "LinenSkill02Range"
  },
  Maer_Skill02_Level1 = {
    ID = "Maer_Skill02_Level1"
  },
  Maer_Skill02_Level2 = {
    ID = "Maer_Skill02_Level2"
  },
  Maer_Skill02_Level3 = {
    ID = "Maer_Skill02_Level3"
  },
  NotifyMonMoveSpeed = {
    ID = "NotifyMonMoveSpeed"
  },
  Skill01Count1 = {
    ID = "Skill01Count1"
  },
  Skill01Count2 = {
    ID = "Skill01Count2"
  },
  ToExplode = {ID = "ToExplode"}
})
