local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("AbyssSeasonList", {
  [1001] = {
    Abyss = {Infinite = 1013, Rotate = 1012},
    AbyssEndTime = 1764018000,
    AbyssSeasonId = 1001,
    AbyssSeasonName = "Event_STitle_103002",
    AbyssStartTime = 1761523200,
    CharId = 5301,
    EventId = 103002
  },
  [1002] = {
    Abyss = {Infinite = 1015, Rotate = 1014},
    AbyssEndTime = 1766437200,
    AbyssSeasonId = 1002,
    AbyssSeasonName = "Event_STitle_103002",
    AbyssStartTime = 1764018000,
    CharId = 1801,
    EventId = 1030022,
    LastSeason = 1001
  }
})
