local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RespawnRule", {
  Abyss = {
    DelayTime = 1.8,
    DissolveAfterDead = false,
    DyingDuration = 20,
    NotModify = true,
    PhantomRecoverSpeed = 0,
    PhantomRecoverTimes = 0,
    PlayerRecoverSpeed = 0,
    PlayerRecoverTimes = 0,
    RecoverUI = "BattleResurgence",
    RuleId = "Abyss"
  },
  CommonRegion = {
    DelayTime = 1.8,
    DissolveAfterDead = true,
    DyingDuration = 20,
    PhantomRecoverSpeed = 0,
    PhantomRecoverTimes = 0,
    PlayerRecoverSpeed = -1,
    PlayerRecoverTimes = -1,
    RecoverUI = "RegionResurgence",
    RuleId = "CommonRegion"
  },
  CommonSolo = {
    DelayTime = 1.8,
    DissolveAfterDead = false,
    DyingDuration = 20,
    PhantomRecoverSpeed = 5,
    PhantomRecoverTimes = 3,
    PlayerRecoverSpeed = 10,
    PlayerRecoverTimes = 3,
    RecoverUI = "BattleResurgence",
    RuleId = "CommonSolo"
  },
  Default = {
    DelayTime = 1.8,
    DissolveAfterDead = false,
    DyingDuration = 20,
    PhantomRecoverSpeed = 10,
    PhantomRecoverTimes = -1,
    PlayerRecoverSpeed = 20,
    PlayerRecoverTimes = -1,
    RecoverUI = "BattleResurgence",
    RuleId = "Default"
  },
  HardBoss = {
    DelayTime = 1.8,
    DissolveAfterDead = false,
    DyingDuration = 20,
    PhantomRecoverSpeed = 0,
    PhantomRecoverTimes = 0,
    PlayerRecoverSpeed = 20,
    PlayerRecoverTimes = 1,
    RecoverUI = "BattleResurgence",
    RuleId = "HardBoss"
  },
  Hostage = {
    DelayTime = 1.8,
    DissolveAfterDead = false,
    DyingDuration = 20,
    PhantomRecoverSpeed = 0,
    PhantomRecoverTimes = 0,
    PlayerRecoverSpeed = 0,
    PlayerRecoverTimes = -1,
    RuleId = "Hostage"
  },
  MonsterRush = {
    DelayTime = 1.8,
    DissolveAfterDead = false,
    DyingDuration = 20,
    PhantomRecoverSpeed = 5,
    PhantomRecoverTimes = 3,
    PlayerRecoverSpeed = 100,
    PlayerRecoverTimes = 1,
    RecoverUI = "BattleResurgence",
    RuleId = "MonsterRush"
  },
  Rouge = {
    DelayTime = 1.8,
    DissolveAfterDead = true,
    DyingDuration = 20,
    PhantomRecoverSpeed = 0,
    PhantomRecoverTimes = 0,
    PlayerRecoverSpeed = 50,
    PlayerRecoverTimes = 1,
    RecoverUI = "BattleResurgence",
    RuleId = "Rouge"
  }
})
