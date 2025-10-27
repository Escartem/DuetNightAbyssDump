local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("FreeCamera", {
  [1] = {
    BlockRange = 14,
    CameraControl = true,
    CameraHeight = 100,
    EaseExp = 2.5,
    FreeCameraId = 1,
    IfBlockThenRot = 20,
    PivotOffset = 40,
    PullDistance = 0,
    PushDistance = 1
  }
})
