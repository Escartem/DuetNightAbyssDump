local T = {}
T.RT_1 = {
  Count = 1,
  SkillCd = 5,
  SkillId = 600404
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MonBattleMgrData", {
  [305] = {
    BattleGroupId = 305,
    SkillShareRule = {
      {
        Count = 1,
        SkillCd = 5,
        SkillId = 600403
      },
      T.RT_1
    }
  },
  [6001] = {
    BattleGroupId = 6001,
    SkillShareRule = {
      {
        Count = 2,
        SkillCd = 10,
        SkillId = 600103
      }
    }
  },
  [6004] = {
    BattleGroupId = 6004,
    SkillShareRule = {
      T.RT_1
    }
  },
  [6007] = {
    BattleGroupId = 6007,
    SkillShareRule = {
      {
        Count = 2,
        SkillCd = 7,
        SkillId = 600702
      }
    }
  },
  [6013] = {
    BattleGroupId = 6013,
    SkillShareRule = {
      {
        Count = 2,
        SkillCd = 10,
        SkillId = 601301
      }
    }
  },
  [6015] = {
    BattleGroupId = 6015,
    SkillShareRule = {
      {
        Count = 2,
        SkillCd = 7,
        SkillId = 601502
      }
    }
  },
  [6017] = {
    BattleGroupId = 6017,
    SkillShareRule = {
      {
        Count = 2,
        SkillCd = 10,
        SkillId = 601703
      }
    }
  },
  [7002] = {
    BattleGroupId = 7002,
    SkillShareRule = {
      {
        Count = 2,
        SkillCd = 10,
        SkillId = 700203
      }
    }
  },
  [7004] = {
    BattleGroupId = 7004,
    SkillShareRule = {
      {
        Count = 1,
        SkillCd = 5,
        SkillId = 700402
      }
    }
  },
  [7008] = {
    BattleGroupId = 7008,
    SkillShareRule = {
      {
        Count = 1,
        SkillCd = 15,
        SkillId = 700810
      }
    }
  },
  [8002] = {
    BattleGroupId = 8002,
    SkillShareRule = {
      {
        Count = 2,
        SkillCd = 7,
        SkillId = 800203
      },
      {
        Count = 1,
        SkillCd = 10,
        SkillId = 800204
      },
      {
        Count = 1,
        SkillCd = 10,
        SkillId = 800207
      }
    }
  },
  [8003] = {
    BattleGroupId = 8003,
    SkillShareRule = {
      {
        Count = 1,
        SkillCd = 15,
        SkillId = 800303
      }
    }
  },
  [9001] = {
    BattleGroupId = 9001,
    SkillShareRule = {
      {
        Count = 1,
        SkillCd = 15,
        SkillId = 900103
      }
    }
  },
  [9002] = {
    BattleGroupId = 9002,
    SkillShareRule = {
      {
        Count = 4,
        SkillCd = 20,
        SkillId = 900202
      }
    }
  },
  [9007] = {
    BattleGroupId = 9007,
    SkillShareRule = {
      {
        Count = 2,
        SkillCd = 8,
        SkillId = 900703
      }
    }
  },
  [9501] = {
    BattleGroupId = 9501,
    SkillShareRule = {
      {
        Count = 1,
        SkillCd = 3,
        SkillId = 950101
      },
      {
        Count = 1,
        SkillCd = 3,
        SkillId = 950102
      },
      {
        Count = 1,
        SkillCd = 1,
        SkillId = 950103
      }
    }
  },
  [10001] = {
    BattleGroupId = 10001,
    SkillShareRule = {
      {
        Count = 2,
        SkillCd = 7,
        SkillId = 1000103
      },
      {
        Count = 1,
        SkillCd = 10,
        SkillId = 1000104
      },
      {
        Count = 1,
        SkillCd = 10,
        SkillId = 1000107
      }
    }
  },
  [10005] = {
    BattleGroupId = 10005,
    SkillShareRule = {
      {
        Count = 2,
        SkillCd = 7,
        SkillId = 1000503
      },
      {
        Count = 1,
        SkillCd = 10,
        SkillId = 1000504
      },
      {
        Count = 1,
        SkillCd = 10,
        SkillId = 1000507
      }
    }
  },
  [700407] = {
    BattleGroupId = 700407,
    SkillShareRule = {
      {
        Count = 1,
        SkillCd = 1.5,
        SkillId = 700404
      }
    }
  }
})
