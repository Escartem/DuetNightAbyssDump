local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("CaptureProgressCondition", {
  [100] = {
    ProgressId = 100,
    ProgressProbList = {
      10001,
      10002,
      10003
    }
  },
  [101] = {
    ProgressId = 101,
    ProgressProbList = {
      10101,
      10102,
      10103,
      10104,
      10105
    }
  },
  [200] = {
    ProgressId = 200,
    ProgressProbList = {
      20001,
      20002,
      20003,
      20004,
      20005
    }
  },
  [201] = {
    ProgressId = 201,
    ProgressProbList = {
      20101,
      20102,
      20103,
      20104,
      20105
    }
  },
  [400] = {
    ProgressId = 400,
    ProgressProbList = {
      40001,
      40002,
      40003,
      40004,
      40005
    }
  },
  [401] = {
    ProgressId = 401,
    ProgressProbList = {
      40101,
      40102,
      40103,
      40104,
      40105
    }
  },
  [600] = {
    ProgressId = 600,
    ProgressProbList = {
      60001,
      60002,
      60003,
      60004,
      60005
    }
  },
  [601] = {
    ProgressId = 601,
    ProgressProbList = {
      60101,
      60102,
      60103,
      60104,
      60105,
      60106
    }
  },
  [800] = {
    ProgressId = 800,
    ProgressProbList = {
      80001,
      80002,
      80003,
      80004,
      80005
    }
  },
  [801] = {
    ProgressId = 801,
    ProgressProbList = {
      80101,
      80102,
      80103,
      80104,
      80105,
      80106,
      80107
    }
  },
  [1000] = {
    ProgressId = 1000,
    ProgressProbList = {100001}
  },
  [1001] = {
    ProgressId = 1001,
    ProgressProbList = {
      100101,
      100102,
      100103,
      100104,
      100105
    }
  }
})
