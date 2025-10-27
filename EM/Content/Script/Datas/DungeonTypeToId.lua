local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("DungeonTypeToId", {
  Capture = {
    GameModeType = "Capture",
    GuideId = 1005,
    GuideNoteId = 96
  },
  Defence = {
    GameModeType = "Defence",
    GuideId = 1003,
    GuideNoteId = 94
  },
  DefenceMove = {
    GameModeType = "DefenceMove",
    GuideId = 1004,
    GuideNoteId = 95
  },
  Excavation = {
    GameModeType = "Excavation",
    GuideId = 1006,
    GuideNoteId = 97
  },
  ExtermPro = {
    GameModeType = "ExtermPro",
    GuideId = 1011,
    GuideNoteId = 102
  },
  Exterminate = {
    GameModeType = "Exterminate",
    GuideId = 1010,
    GuideNoteId = 101
  },
  Hijack = {
    GameModeType = "Hijack",
    GuideId = 1009,
    GuideNoteId = 100
  },
  Rescue = {
    GameModeType = "Rescue",
    GuideId = 1008,
    GuideNoteId = 99
  },
  Sabotage = {
    GameModeType = "Sabotage",
    GuideId = 1007,
    GuideNoteId = 98
  },
  SabotagePro = {
    GameModeType = "SabotagePro",
    GuideId = 1012,
    GuideNoteId = 103
  },
  SurvivalMini = {
    GameModeType = "SurvivalMini",
    GuideId = 1001,
    GuideNoteId = 92
  },
  SurvivalMiniPro = {
    GameModeType = "SurvivalMiniPro",
    GuideId = 1002,
    GuideNoteId = 93
  },
  Synthesis = {
    GameModeType = "Synthesis",
    GuideId = 1013,
    GuideNoteId = 106
  }
})
