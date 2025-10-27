local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SightData", {
  [1] = {
    SightAngle = 120,
    SightId = 1,
    SightRadius = 2000
  },
  [2] = {
    SightAngle = 120,
    SightId = 2,
    SightRadius = 3000
  },
  [3] = {
    SightAngle = 180,
    SightId = 3,
    SightRadius = 6000
  },
  [4] = {
    SightAngle = 360,
    SightId = 4,
    SightRadius = 20000
  },
  [10] = {
    SightAngle = 360,
    SightId = 10,
    SightRadius = 3500
  },
  [11] = {
    SightAngle = 360,
    SightId = 11,
    SightRadius = 10000
  },
  [103] = {
    SightAngle = 60,
    SightId = 103,
    SightRadius = 1000
  },
  [6001001] = {
    SightAngle = 60,
    SightId = 6001001,
    SightRadius = 1000
  },
  [6002002] = {
    SightAngle = 180,
    SightId = 6002002,
    SightRadius = 3000
  },
  [6003001] = {
    SightAngle = 360,
    SightId = 6003001,
    SightRadius = 2000
  },
  [7008001] = {
    SightAngle = 360,
    SightId = 7008001,
    SightRadius = 500
  },
  [9800001] = {
    SightAngle = 360,
    SightId = 9800001,
    SightRadius = 2400
  },
  [9802001] = {
    SightAngle = 0,
    SightId = 9802001,
    SightRadius = 0
  }
})
