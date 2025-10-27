local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RVOData", {
  ArtificialRadiusExpansion = {
    ParamName = "ArtificialRadiusExpansion",
    ParamValue = {
      1.1,
      1.1,
      1.1
    }
  },
  DefaultTimeToLive = {
    ParamName = "DefaultTimeToLive",
    ParamValue = {
      1.5,
      1.5,
      3
    }
  },
  DeltaTimeToPredict = {
    ParamName = "DeltaTimeToPredict",
    ParamValue = {
      0.5,
      0.5,
      0.8
    }
  },
  HeightCheckMargin = {
    ParamName = "HeightCheckMargin",
    ParamValue = {
      50,
      50,
      50
    }
  },
  LockTimeAfterAvoid = {
    ParamName = "LockTimeAfterAvoid",
    ParamValue = {
      0.25,
      0.25,
      1
    }
  },
  LockTimeAfterClean = {
    ParamName = "LockTimeAfterClean",
    ParamValue = {
      0.03,
      0.03,
      0.03
    }
  }
})
