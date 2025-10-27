local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MainUIGuidePoint", {
  [1] = {
    EnterId = 8,
    GuidePointId = 1,
    HideCondition = 10020502,
    ShowCondition = 100204
  }
})
