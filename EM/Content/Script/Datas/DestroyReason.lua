local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("DestroyReason", {
  Breakable = {
    DestroyReason = "Breakable",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = false,
    IsTriggerDestroyEvent = true,
    IsTriggrRelationSpawn = false
  },
  Cache = {
    DestroyReason = "Cache",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = false,
    IsTriggerDestroyEvent = true,
    IsTriggrRelationSpawn = false
  },
  CombatStateChange = {
    DestroyReason = "CombatStateChange",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = false,
    IsTriggerDestroyEvent = true,
    IsTriggrRelationSpawn = false
  },
  Dispatch = {
    DestroyReason = "Dispatch",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = true,
    IsTriggrRelationSpawn = false
  },
  EngineDestroy = {
    DestroyReason = "EngineDestroy",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = false,
    IsTriggrRelationSpawn = false
  },
  Flexible = {
    DestroyReason = "Flexible",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = false,
    IsTriggrRelationSpawn = false
  },
  GM = {
    DestroyReason = "GM",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = true,
    IsTriggrRelationSpawn = false
  },
  HardBossClear = {
    DestroyReason = "HardBossClear",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = false,
    IsTriggrRelationSpawn = false
  },
  HostageRescueEnd = {
    DestroyReason = "HostageRescueEnd",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = true,
    IsTriggrRelationSpawn = false
  },
  LevelNotExsit = {
    DestroyReason = "LevelNotExsit",
    IsClearGuide = false,
    IsClearStaticCreatorRef = false,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = false,
    IsTriggrRelationSpawn = true
  },
  LevelUnloadedNotSaveGame = {
    DestroyReason = "LevelUnloadedNotSaveGame",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = false,
    IsTriggrRelationSpawn = true
  },
  LevelUnloadedSaveGame = {
    DestroyReason = "LevelUnloadedSaveGame",
    IsClearGuide = false,
    IsClearStaticCreatorRef = false,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = false,
    IsTriggrRelationSpawn = true
  },
  MechanismDead = {
    DestroyReason = "MechanismDead",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = false,
    IsTriggerDestroyEvent = true,
    IsTriggrRelationSpawn = false
  },
  MechanismLifeTime = {
    DestroyReason = "MechanismLifeTime",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = false,
    IsTriggerDestroyEvent = true,
    IsTriggrRelationSpawn = false
  },
  MechanismSummon = {
    DestroyReason = "MechanismSummon",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = false,
    IsTriggerDestroyEvent = true,
    IsTriggrRelationSpawn = false
  },
  MonsterDead = {
    DestroyReason = "MonsterDead",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = false,
    IsTriggerDestroyEvent = true,
    IsTriggrRelationSpawn = false
  },
  MonsterInitiate = {
    DestroyReason = "MonsterInitiate",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = true,
    IsTriggrRelationSpawn = false
  },
  MonsterNestItemClear = {
    DestroyReason = "MonsterNestItemClear",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = false,
    IsTriggrRelationSpawn = false
  },
  MonsterSpawnAdjust = {
    DestroyReason = "MonsterSpawnAdjust",
    IsClearGuide = true,
    IsClearStaticCreatorRef = false,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = false,
    IsTriggrRelationSpawn = true
  },
  NoReason = {
    DestroyReason = "NoReason",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = true,
    IsTriggrRelationSpawn = false
  },
  NotTriggerGameModeEvent = {
    DestroyReason = "NotTriggerGameModeEvent",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = false,
    IsTriggrRelationSpawn = false
  },
  PetAfterInteractive = {
    DestroyReason = "PetAfterInteractive",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = false,
    IsTriggerDestroyEvent = false,
    IsTriggrRelationSpawn = false
  },
  PhantomChangeRole = {
    DestroyReason = "PhantomChangeRole",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = true,
    IsTriggrRelationSpawn = false
  },
  PhantomDieInRegion = {
    DestroyReason = "PhantomDieInRegion",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = true,
    IsTriggrRelationSpawn = false
  },
  PhantomEnterDungeon = {
    DestroyReason = "PhantomEnterDungeon",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = true,
    IsTriggrRelationSpawn = false
  },
  PhantomExitDungeon = {
    DestroyReason = "PhantomExitDungeon",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = true,
    IsTriggrRelationSpawn = false
  },
  PhantomUseResource = {
    DestroyReason = "PhantomUseResource",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = true,
    IsTriggrRelationSpawn = false
  },
  Pickup = {
    DestroyReason = "Pickup",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = false,
    IsTriggerDestroyEvent = true,
    IsTriggrRelationSpawn = false
  },
  QuestChainClear = {
    DestroyReason = "QuestChainClear",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = false,
    IsTriggrRelationSpawn = false
  },
  RecoverSubRegionDataCacheButBpBornHasAlreadyDead = {
    DestroyReason = "RecoverSubRegionDataCacheButBpBornHasAlreadyDead",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = false,
    IsTriggrRelationSpawn = false
  },
  RegionExploreGroup = {
    DestroyReason = "RegionExploreGroup",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = false,
    IsTriggrRelationSpawn = false
  },
  RougeLevelUnloaded = {
    DestroyReason = "RougeLevelUnloaded",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = false,
    IsTriggrRelationSpawn = false
  },
  SepcialQuestStart = {
    DestroyReason = "SepcialQuestStart",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = false,
    IsTriggrRelationSpawn = false
  },
  SpawnerClear = {
    DestroyReason = "SpawnerClear",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = false,
    IsTriggrRelationSpawn = false
  },
  StoryLine = {
    DestroyReason = "StoryLine",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = false,
    IsTriggrRelationSpawn = false
  },
  SummonDirectSourceChangeOrDied = {
    DestroyReason = "SummonDirectSourceChangeOrDied",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = false,
    IsTriggrRelationSpawn = false
  },
  TalkContext = {
    DestroyReason = "TalkContext",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = false,
    IsTriggrRelationSpawn = false
  },
  Training = {
    DestroyReason = "Training",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = false,
    IsTriggrRelationSpawn = false
  },
  UnitLabel = {
    DestroyReason = "UnitLabel",
    IsClearGuide = true,
    IsClearStaticCreatorRef = true,
    IsMonClearBattleInfo = true,
    IsTriggerDestroyEvent = true,
    IsTriggrRelationSpawn = false
  }
})
