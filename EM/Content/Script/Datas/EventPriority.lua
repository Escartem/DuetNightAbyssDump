local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("EventPriority", {
  ["event:/ambience"] = {
    EventPath = "event:/ambience",
    Priority = 10
  },
  ["event:/bgm"] = {EventPath = "event:/bgm", Priority = 10},
  ["event:/cine"] = {
    EventPath = "event:/cine",
    Priority = 100
  },
  ["event:/sfx/common/scene"] = {
    EventPath = "event:/sfx/common/scene",
    Priority = 8
  },
  ["event:/sfx/common/story"] = {
    EventPath = "event:/sfx/common/story",
    Priority = 100
  },
  ["event:/snapshot"] = {
    EventPath = "event:/snapshot",
    Priority = 10
  },
  ["event:/ui"] = {EventPath = "event:/ui", Priority = 8},
  ["event:/voice"] = {
    EventPath = "event:/voice",
    Priority = 8
  }
})
