local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("AxisName2ActionName", {
  MoveForward = {
    ["-1.0"] = "S",
    ["1.0"] = "W"
  },
  MoveRight = {
    ["-1.0"] = "A",
    ["1.0"] = "D"
  }
})
