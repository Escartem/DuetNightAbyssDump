local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ModPolarity", {
  [-1] = {Char = "E", Id = -1},
  [1] = {
    Char = "C",
    Id = 1,
    Name = "Polarity_1_Name"
  },
  [2] = {
    Char = "B",
    Id = 2,
    Name = "Polarity_2_Name"
  },
  [3] = {
    Char = "D",
    Id = 3,
    Name = "Polarity_3_Name"
  },
  [4] = {
    Char = "A",
    Id = 4,
    Name = "Polarity_4_Name"
  }
})
