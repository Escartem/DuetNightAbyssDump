local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("CampRule", {
  DefenceCore = {
    CampKey = "DefenceCore",
    DefenceCore = 1,
    Hostile = 0,
    Monster = 0,
    NPC = 2,
    Neutral = 2,
    Player = 2
  },
  Hostile = {
    CampKey = "Hostile",
    DefenceCore = 0,
    Hostile = 0,
    Monster = 0,
    NPC = 0,
    Neutral = 2,
    Player = 0
  },
  Monster = {
    CampKey = "Monster",
    DefenceCore = 0,
    Hostile = 0,
    Monster = 1,
    NPC = 2,
    Neutral = 2,
    Player = 0
  },
  NPC = {
    CampKey = "NPC",
    DefenceCore = 2,
    Hostile = 0,
    Monster = 2,
    NPC = 1,
    Neutral = 2,
    Player = 2
  },
  Neutral = {
    CampKey = "Neutral",
    DefenceCore = 2,
    Hostile = 2,
    Monster = 2,
    NPC = 2,
    Neutral = 2,
    Player = 2
  },
  Player = {
    CampKey = "Player",
    DefenceCore = 2,
    Hostile = 0,
    Monster = 0,
    NPC = 2,
    Neutral = 2,
    Player = 1
  }
})
