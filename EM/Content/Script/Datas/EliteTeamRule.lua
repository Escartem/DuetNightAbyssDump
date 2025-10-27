local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("EliteTeamRule", {
  [1] = {
    FilterTags = {"Mon.Ranged", "Mon.Jt"},
    Id = 1
  }
})
