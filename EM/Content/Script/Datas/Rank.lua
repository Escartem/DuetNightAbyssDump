local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Rank", {
  [1] = {
    Capacity = 10,
    DungeonId = 0,
    Id = 1,
    Param = "time",
    SortRule = "ascend"
  },
  [20002] = {
    Capacity = 10,
    DungeonId = 20002,
    Id = 20002,
    Param = "round",
    SortRule = "descend"
  },
  [30002] = {
    Capacity = 10,
    DungeonId = 30002,
    Id = 30002,
    Param = "time",
    SortRule = "ascend"
  }
})
