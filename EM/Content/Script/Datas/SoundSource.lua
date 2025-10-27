local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SoundSource", {
  [1] = {
    Id = 1,
    Radius = 1500,
    Strength = 1
  },
  [2] = {
    Id = 2,
    Radius = 500,
    Strength = 2
  },
  [3] = {
    Id = 3,
    Radius = 500,
    Strength = 3
  },
  [4] = {
    Id = 4,
    Radius = 1,
    Strength = 1
  },
  [5] = {
    Id = 5,
    Radius = 500,
    Strength = 2
  },
  [6] = {
    Id = 6,
    Radius = 1000,
    Strength = 2
  },
  [7] = {
    Id = 7,
    Radius = 1500,
    Strength = 2
  },
  [11] = {
    Id = 11,
    Radius = 500,
    Strength = 11
  }
})
