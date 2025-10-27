local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("FishingStick", {
  [1] = {
    FishingStickId = 1,
    MoveCurve = {
      [1] = "OutSine",
      [2] = "InSine"
    },
    MoveParam = {
      [1] = 1.5,
      [2] = 0.9
    }
  }
})
