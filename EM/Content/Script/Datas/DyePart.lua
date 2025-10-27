local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("DyePart", {
  [1] = {PartID = 1},
  [2] = {PartID = 2},
  [3] = {PartID = 3},
  [4] = {PartID = 4},
  [5] = {PartID = 5},
  [6] = {PartID = 6},
  [7] = {PartID = 7},
  [8] = {
    ColorID = {1022, 1027},
    PartID = 8
  }
})
