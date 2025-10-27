local T = {
  Prologue_optimization = {
    RT_1 = {
      MonsterSpawn = {
        [6001005] = 10,
        [6002001] = 8,
        [6003001] = 8,
        [6004001] = 2,
        [7001001] = 10,
        [7002001] = 12,
        [7003001] = 5,
        [7004001] = 5
      }
    }
  }
}
local ReadOnly = {
  Prologue_optimization = T.Prologue_optimization.RT_1
}
return ReadOnly
