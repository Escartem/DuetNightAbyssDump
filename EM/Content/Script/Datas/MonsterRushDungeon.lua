local T = {}
T.RT_1 = {851400101}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MonsterRushDungeon", {
  [40201] = {
    Description = "\230\151\160\229\133\179\229\141\161\230\149\136\230\158\156",
    LevelId = 40201,
    MonsterList = {4020101, 4020102},
    StaticCreatorList = {851500101},
    TargetNum = 100
  },
  [40202] = {
    Description = "\230\151\160\229\133\179\229\141\161\230\149\136\230\158\156",
    LevelId = 40202,
    MonsterList = {4020201, 4020202},
    StaticCreatorList = {850100101},
    TargetNum = 100
  },
  [40203] = {
    Description = "\230\151\160\229\133\179\229\141\161\230\149\136\230\158\156",
    LevelId = 40203,
    MonsterList = {4020301, 4020302},
    StaticCreatorList = {851300101},
    TargetNum = 100
  },
  [40204] = {
    Description = "Test",
    GlobalPassiveList = {40101},
    LevelId = 40204,
    MonsterList = {4020401, 4020402},
    StaticCreatorList = T.RT_1,
    TargetNum = 100
  },
  [40205] = {
    Description = "Test",
    GlobalPassiveList = {40102},
    LevelId = 40205,
    MonsterList = {4020501, 4020502},
    StaticCreatorList = T.RT_1,
    TargetNum = 100
  },
  [40206] = {
    Description = "Test",
    GlobalPassiveList = {40103},
    LevelId = 40206,
    MonsterList = {4020601, 4020602},
    StaticCreatorList = T.RT_1,
    TargetNum = 100
  },
  [40207] = {
    Description = "Test",
    GlobalPassiveList = {40104},
    LevelId = 40207,
    MonsterList = {4020701, 4020702},
    StaticCreatorList = {850000201},
    TargetNum = 100
  }
})
