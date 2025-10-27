local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("CaptureProgress", {
  [10001] = {
    Growth1 = 10,
    Growth2 = 5,
    Growth3 = 5,
    ProgressProbId = 10001
  },
  [10002] = {
    Growth1 = 5,
    Growth2 = 10,
    Growth3 = 10,
    ProgressProbId = 10002
  },
  [10003] = {
    Growth1 = 10,
    Growth2 = 10,
    Growth3 = 10,
    ProgressProbId = 10003
  },
  [10101] = {
    Growth1 = 5,
    Growth2 = 10,
    Growth3 = 85,
    ProgressProbId = 10101
  },
  [10102] = {
    Growth1 = 10,
    Growth2 = 5,
    Growth3 = 85,
    ProgressProbId = 10102
  },
  [10103] = {
    Growth1 = 10,
    Growth2 = 30,
    Growth3 = 60,
    ProgressProbId = 10103
  },
  [10104] = {
    Growth1 = 20,
    Growth2 = 5,
    Growth3 = 75,
    ProgressProbId = 10104
  },
  [10105] = {
    Growth1 = 5,
    Growth2 = 5,
    Growth3 = 90,
    ProgressProbId = 10105
  },
  [20001] = {
    Growth1 = 10,
    Growth2 = 10,
    Growth3 = 10,
    ProgressProbId = 20001
  },
  [20002] = {
    Growth1 = 5,
    Growth2 = 5,
    Growth3 = 10,
    ProgressProbId = 20002
  },
  [20003] = {
    Growth1 = 5,
    Growth2 = 20,
    Growth3 = 10,
    ProgressProbId = 20003
  },
  [20004] = {
    Growth1 = 15,
    Growth2 = 5,
    Growth3 = 10,
    ProgressProbId = 20004
  },
  [20005] = {
    Growth1 = 40,
    Growth2 = 5,
    Growth3 = 5,
    ProgressProbId = 20005
  },
  [20101] = {
    Growth1 = 20,
    Growth2 = 10,
    Growth3 = 70,
    ProgressProbId = 20101
  },
  [20102] = {
    Growth1 = 30,
    Growth2 = 10,
    Growth3 = 60,
    ProgressProbId = 20102
  },
  [20103] = {
    Growth1 = 10,
    Growth2 = 30,
    Growth3 = 60,
    ProgressProbId = 20103
  },
  [20104] = {
    Growth1 = 20,
    Growth2 = 20,
    Growth3 = 60,
    ProgressProbId = 20104
  },
  [20105] = {
    Growth1 = 50,
    Growth2 = 20,
    Growth3 = 30,
    ProgressProbId = 20105
  },
  [40001] = {
    Growth1 = 20,
    Growth2 = 15,
    Growth3 = 10,
    ProgressProbId = 40001
  },
  [40002] = {
    Growth1 = 10,
    Growth2 = 10,
    Growth3 = 20,
    ProgressProbId = 40002
  },
  [40003] = {
    Growth1 = 10,
    Growth2 = 30,
    Growth3 = 10,
    ProgressProbId = 40003
  },
  [40004] = {
    Growth1 = 10,
    Growth2 = 5,
    Growth3 = 20,
    ProgressProbId = 40004
  },
  [40005] = {
    Growth1 = 40,
    Growth2 = 5,
    Growth3 = 5,
    ProgressProbId = 40005
  },
  [40101] = {
    Growth1 = 20,
    Growth2 = 20,
    Growth3 = 60,
    ProgressProbId = 40101
  },
  [40102] = {
    Growth1 = 30,
    Growth2 = 10,
    Growth3 = 60,
    ProgressProbId = 40102
  },
  [40103] = {
    Growth1 = 10,
    Growth2 = 60,
    Growth3 = 30,
    ProgressProbId = 40103
  },
  [40104] = {
    Growth1 = 30,
    Growth2 = 30,
    Growth3 = 40,
    ProgressProbId = 40104
  },
  [40105] = {
    Growth1 = 25,
    Growth2 = 35,
    Growth3 = 40,
    ProgressProbId = 40105
  },
  [60001] = {
    Growth1 = 20,
    Growth2 = 30,
    Growth3 = 20,
    ProgressProbId = 60001
  },
  [60002] = {
    Growth1 = 15,
    Growth2 = 30,
    Growth3 = 15,
    ProgressProbId = 60002
  },
  [60003] = {
    Growth1 = 20,
    Growth2 = 20,
    Growth3 = 20,
    ProgressProbId = 60003
  },
  [60004] = {
    Growth1 = 30,
    Growth2 = 20,
    Growth3 = 10,
    ProgressProbId = 60004
  },
  [60005] = {
    Growth1 = 50,
    Growth2 = 5,
    Growth3 = 10,
    ProgressProbId = 60005
  },
  [60101] = {
    Growth1 = 30,
    Growth2 = 30,
    Growth3 = 40,
    ProgressProbId = 60101
  },
  [60102] = {
    Growth1 = 20,
    Growth2 = 60,
    Growth3 = 20,
    ProgressProbId = 60102
  },
  [60103] = {
    Growth1 = 30,
    Growth2 = 30,
    Growth3 = 40,
    ProgressProbId = 60103
  },
  [60104] = {
    Growth1 = 30,
    Growth2 = 40,
    Growth3 = 30,
    ProgressProbId = 60104
  },
  [60105] = {
    Growth1 = 50,
    Growth2 = 50,
    ProgressProbId = 60105
  },
  [60106] = {
    Growth1 = 30,
    Growth2 = 70,
    ProgressProbId = 60106
  },
  [80001] = {
    Growth1 = 20,
    Growth2 = 30,
    Growth3 = 30,
    ProgressProbId = 80001
  },
  [80002] = {
    Growth1 = 30,
    Growth2 = 10,
    Growth3 = 30,
    ProgressProbId = 80002
  },
  [80003] = {
    Growth1 = 30,
    Growth2 = 30,
    Growth3 = 30,
    ProgressProbId = 80003
  },
  [80004] = {
    Growth1 = 50,
    Growth2 = 10,
    Growth3 = 10,
    ProgressProbId = 80004
  },
  [80005] = {
    Growth1 = 5,
    Growth2 = 50,
    Growth3 = 25,
    ProgressProbId = 80005
  },
  [80101] = {
    Growth1 = 30,
    Growth2 = 30,
    Growth3 = 40,
    ProgressProbId = 80101
  },
  [80102] = {
    Growth1 = 30,
    Growth2 = 20,
    Growth3 = 50,
    ProgressProbId = 80102
  },
  [80103] = {
    Growth1 = 30,
    Growth2 = 30,
    Growth3 = 30,
    ProgressProbId = 80103
  },
  [80104] = {
    Growth1 = 50,
    Growth2 = 10,
    Growth3 = 40,
    ProgressProbId = 80104
  },
  [80105] = {
    Growth1 = 20,
    Growth2 = 50,
    Growth3 = 30,
    ProgressProbId = 80105
  },
  [80106] = {
    Growth1 = 20,
    Growth2 = 80,
    ProgressProbId = 80106
  },
  [80107] = {
    Growth1 = 70,
    Growth2 = 30,
    ProgressProbId = 80107
  },
  [100001] = {
    Growth1 = 20,
    Growth2 = 30,
    Growth3 = 10,
    ProgressProbId = 100001
  },
  [100101] = {
    Growth1 = 30,
    Growth2 = 30,
    Growth3 = 40,
    ProgressProbId = 100101
  },
  [100102] = {
    Growth1 = 10,
    Growth2 = 30,
    Growth3 = 60,
    ProgressProbId = 100102
  },
  [100103] = {
    Growth1 = 60,
    Growth2 = 40,
    ProgressProbId = 100103
  },
  [100104] = {
    Growth1 = 40,
    Growth2 = 60,
    ProgressProbId = 100104
  },
  [100105] = {
    Growth1 = 20,
    Growth2 = 80,
    ProgressProbId = 100105
  }
})
