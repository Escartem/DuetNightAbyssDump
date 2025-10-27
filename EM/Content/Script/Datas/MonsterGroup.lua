local T = {}
T.RT_1 = {UnitId = 7002001, UnitProb = 1}
T.RT_2 = {UnitId = 6001001, UnitProb = 1}
T.RT_3 = {UnitId = 6001601, UnitProb = 1}
T.RT_4 = {UnitId = 6011601, UnitProb = 1}
T.RT_5 = {UnitId = 6011601, UnitProb = 0.5}
T.RT_6 = {UnitId = 6002601, UnitProb = 1}
T.RT_7 = {UnitId = 6012601, UnitProb = 1}
T.RT_8 = {UnitId = 7002601, UnitProb = 1}
T.RT_9 = {UnitId = 7012601, UnitProb = 0.5}
T.RT_10 = {UnitId = 7015601, UnitProb = 1}
T.RT_11 = {UnitId = 7001601, UnitProb = 1}
T.RT_12 = {UnitId = 7011601, UnitProb = 0.5}
T.RT_13 = {UnitId = 8002601, UnitProb = 1}
T.RT_14 = {UnitId = 8002601, UnitProb = 0.5}
T.RT_15 = {UnitId = 8001601, UnitProb = 1}
T.RT_16 = {UnitId = 9001601, UnitProb = 1}
T.RT_17 = {UnitId = 9001601, UnitProb = 0.5}
T.RT_18 = {UnitId = 9007601, UnitProb = 0.5}
T.RT_19 = {UnitId = 9002601, UnitProb = 1}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MonsterGroup", {
  [11] = {
    GroupId = 11,
    MemberSpawnProb = {
      [1] = T.RT_1,
      [2] = T.RT_1,
      [3] = {UnitId = 7004001, UnitProb = 0.3}
    }
  },
  [12] = {
    GroupId = 12,
    MemberSpawnProb = {
      [1] = {UnitId = 7001001, UnitProb = 1},
      [2] = {UnitId = 7003001, UnitProb = 1}
    }
  },
  [13] = {
    GroupId = 13,
    MemberSpawnProb = {
      [1] = T.RT_2,
      [2] = T.RT_2,
      [3] = {UnitId = 6004001, UnitProb = 0.3}
    }
  },
  [14] = {
    GroupId = 14,
    MemberSpawnProb = {
      [1] = {UnitId = 6002001, UnitProb = 1},
      [2] = {UnitId = 6003001, UnitProb = 1}
    }
  },
  [6010] = {
    GroupId = 6010,
    MemberSpawnProb = {
      [1] = T.RT_3,
      [2] = T.RT_3,
      [3] = T.RT_4,
      [4] = {UnitId = 6001601, UnitProb = 0.5},
      [5] = T.RT_5
    }
  },
  [6011] = {
    GroupId = 6011,
    MemberSpawnProb = {
      [1] = T.RT_3,
      [2] = T.RT_4,
      [3] = {UnitId = 6004601, UnitProb = 0.3},
      [4] = {UnitId = 6014001, UnitProb = 0.2}
    }
  },
  [6020] = {
    GroupId = 6020,
    MemberSpawnProb = {
      [1] = T.RT_6,
      [2] = T.RT_6,
      [3] = T.RT_7,
      [4] = {UnitId = 6002601, UnitProb = 0.5},
      [5] = {UnitId = 6012601, UnitProb = 0.5}
    }
  },
  [6021] = {
    GroupId = 6021,
    MemberSpawnProb = {
      [1] = T.RT_6,
      [2] = T.RT_7,
      [3] = {UnitId = 6003601, UnitProb = 0.5},
      [4] = {UnitId = 6013601, UnitProb = 0.5}
    }
  },
  [6030] = {
    GroupId = 6030,
    MemberSpawnProb = {
      [1] = T.RT_3,
      [2] = T.RT_6,
      [3] = T.RT_5,
      [4] = {UnitId = 6007601, UnitProb = 0.5}
    }
  },
  [7010] = {
    GroupId = 7010,
    MemberSpawnProb = {
      [1] = T.RT_8,
      [2] = T.RT_9,
      [3] = {UnitId = 7004601, UnitProb = 0.3},
      [4] = T.RT_8,
      [5] = {UnitId = 7014601, UnitProb = 0.2}
    }
  },
  [7011] = {
    GroupId = 7011,
    MemberSpawnProb = {
      [1] = {UnitId = 7009601, UnitProb = 1},
      [2] = T.RT_10,
      [3] = T.RT_8,
      [4] = T.RT_9,
      [5] = {UnitId = 7004601, UnitProb = 0.5}
    }
  },
  [7020] = {
    GroupId = 7020,
    MemberSpawnProb = {
      [1] = T.RT_11,
      [2] = {UnitId = 7003601, UnitProb = 1},
      [3] = T.RT_11,
      [4] = T.RT_12,
      [5] = {UnitId = 7013601, UnitProb = 0.5}
    }
  },
  [7021] = {
    GroupId = 7021,
    MemberSpawnProb = {
      [1] = {UnitId = 7008601, UnitProb = 1},
      [2] = T.RT_10,
      [3] = {UnitId = 7001601, UnitProb = 0.5},
      [4] = T.RT_12,
      [5] = {UnitId = 7003601, UnitProb = 0.5}
    }
  },
  [7022] = {
    GroupId = 7022,
    MemberSpawnProb = {
      [1] = T.RT_8,
      [2] = T.RT_11,
      [3] = {UnitId = 7010601, UnitProb = 0.5},
      [4] = {UnitId = 7015601, UnitProb = 0.2}
    }
  },
  [8010] = {
    GroupId = 8010,
    MemberSpawnProb = {
      [1] = T.RT_13,
      [2] = T.RT_13,
      [3] = T.RT_14,
      [4] = {UnitId = 8001601, UnitProb = 0.5}
    }
  },
  [8020] = {
    GroupId = 8020,
    MemberSpawnProb = {
      [1] = T.RT_15,
      [2] = T.RT_15,
      [3] = T.RT_14,
      [4] = {UnitId = 8003601, UnitProb = 0.5}
    }
  },
  [9010] = {
    GroupId = 9010,
    MemberSpawnProb = {
      [1] = T.RT_16,
      [2] = T.RT_16,
      [3] = T.RT_17,
      [4] = T.RT_18
    }
  },
  [9020] = {
    GroupId = 9020,
    MemberSpawnProb = {
      [1] = T.RT_19,
      [2] = T.RT_19,
      [3] = T.RT_17,
      [4] = T.RT_18
    }
  },
  [6001012] = {
    GroupId = 6001012,
    MemberSpawnProb = {
      [1] = {UnitId = 6001012, UnitProb = 1}
    }
  },
  [6001013] = {
    GroupId = 6001013,
    MemberSpawnProb = {
      [1] = {UnitId = 6001013, UnitProb = 1}
    }
  },
  [6001014] = {
    GroupId = 6001014,
    MemberSpawnProb = {
      [1] = {UnitId = 6001014, UnitProb = 1}
    }
  },
  [6001016] = {
    GroupId = 6001016,
    MemberSpawnProb = {
      [1] = {UnitId = 6001016, UnitProb = 1}
    }
  },
  [6001018] = {
    GroupId = 6001018,
    MemberSpawnProb = {
      [1] = {UnitId = 6001018, UnitProb = 1}
    }
  },
  [6002011] = {
    GroupId = 6002011,
    MemberSpawnProb = {
      [1] = {UnitId = 6002011, UnitProb = 1}
    }
  },
  [6002015] = {
    GroupId = 6002015,
    MemberSpawnProb = {
      [1] = {UnitId = 6002015, UnitProb = 1}
    }
  },
  [6002016] = {
    GroupId = 6002016,
    MemberSpawnProb = {
      [1] = {UnitId = 6002016, UnitProb = 1}
    }
  },
  [6002017] = {
    GroupId = 6002017,
    MemberSpawnProb = {
      [1] = {UnitId = 6002017, UnitProb = 1}
    }
  },
  [6002018] = {
    GroupId = 6002018,
    MemberSpawnProb = {
      [1] = {UnitId = 6002018, UnitProb = 1}
    }
  },
  [6004013] = {
    GroupId = 6004013,
    MemberSpawnProb = {
      [1] = {UnitId = 6007001, UnitProb = 1}
    }
  },
  [7001011] = {
    GroupId = 7001011,
    MemberSpawnProb = {
      [1] = {UnitId = 7001011, UnitProb = 1}
    }
  },
  [7001015] = {
    GroupId = 7001015,
    MemberSpawnProb = {
      [1] = {UnitId = 7001015, UnitProb = 1}
    }
  },
  [7001016] = {
    GroupId = 7001016,
    MemberSpawnProb = {
      [1] = {UnitId = 7001016, UnitProb = 1}
    }
  },
  [7001017] = {
    GroupId = 7001017,
    MemberSpawnProb = {
      [1] = {UnitId = 7001017, UnitProb = 1}
    }
  },
  [7001018] = {
    GroupId = 7001018,
    MemberSpawnProb = {
      [1] = {UnitId = 7001018, UnitProb = 1}
    }
  },
  [7002011] = {
    GroupId = 7002011,
    MemberSpawnProb = {
      [1] = {UnitId = 7002011, UnitProb = 1}
    }
  },
  [7002012] = {
    GroupId = 7002012,
    MemberSpawnProb = {
      [1] = {UnitId = 7002012, UnitProb = 1}
    }
  },
  [7002013] = {
    GroupId = 7002013,
    MemberSpawnProb = {
      [1] = {UnitId = 7002013, UnitProb = 1}
    }
  },
  [7002014] = {
    GroupId = 7002014,
    MemberSpawnProb = {
      [1] = {UnitId = 7002014, UnitProb = 1}
    }
  },
  [7002016] = {
    GroupId = 7002016,
    MemberSpawnProb = {
      [1] = {UnitId = 7002016, UnitProb = 1}
    }
  },
  [7002018] = {
    GroupId = 7002018,
    MemberSpawnProb = {
      [1] = {UnitId = 7002018, UnitProb = 1}
    }
  },
  [7003011] = {
    GroupId = 7003011,
    MemberSpawnProb = {
      [1] = {UnitId = 7003011, UnitProb = 1}
    }
  },
  [7003015] = {
    GroupId = 7003015,
    MemberSpawnProb = {
      [1] = {UnitId = 7003015, UnitProb = 1}
    }
  },
  [7003016] = {
    GroupId = 7003016,
    MemberSpawnProb = {
      [1] = {UnitId = 7003016, UnitProb = 1}
    }
  },
  [7003017] = {
    GroupId = 7003017,
    MemberSpawnProb = {
      [1] = {UnitId = 7003017, UnitProb = 1}
    }
  },
  [7003018] = {
    GroupId = 7003018,
    MemberSpawnProb = {
      [1] = {UnitId = 7003018, UnitProb = 1}
    }
  },
  [8001011] = {
    GroupId = 8001011,
    MemberSpawnProb = {
      [1] = {UnitId = 8001011, UnitProb = 1}
    }
  },
  [8001012] = {
    GroupId = 8001012,
    MemberSpawnProb = {
      [1] = {UnitId = 8001012, UnitProb = 1}
    }
  },
  [8001013] = {
    GroupId = 8001013,
    MemberSpawnProb = {
      [1] = {UnitId = 8001013, UnitProb = 1}
    }
  },
  [8001014] = {
    GroupId = 8001014,
    MemberSpawnProb = {
      [1] = {UnitId = 8001014, UnitProb = 1}
    }
  },
  [8001015] = {
    GroupId = 8001015,
    MemberSpawnProb = {
      [1] = {UnitId = 8001015, UnitProb = 1}
    }
  },
  [8001016] = {
    GroupId = 8001016,
    MemberSpawnProb = {
      [1] = {UnitId = 8001016, UnitProb = 1}
    }
  },
  [8001017] = {
    GroupId = 8001017,
    MemberSpawnProb = {
      [1] = {UnitId = 8001017, UnitProb = 1}
    }
  },
  [8001018] = {
    GroupId = 8001018,
    MemberSpawnProb = {
      [1] = {UnitId = 8001018, UnitProb = 1}
    }
  },
  [8001019] = {
    GroupId = 8001019,
    MemberSpawnProb = {
      [1] = {UnitId = 8001019, UnitProb = 1}
    }
  },
  [8001020] = {
    GroupId = 8001020,
    MemberSpawnProb = {
      [1] = {UnitId = 8001020, UnitProb = 1}
    }
  },
  [8001021] = {
    GroupId = 8001021,
    MemberSpawnProb = {
      [1] = {UnitId = 8001021, UnitProb = 1}
    }
  },
  [8001022] = {
    GroupId = 8001022,
    MemberSpawnProb = {
      [1] = {UnitId = 8001022, UnitProb = 1}
    }
  },
  [8001023] = {
    GroupId = 8001023,
    MemberSpawnProb = {
      [1] = {UnitId = 8001023, UnitProb = 1}
    }
  },
  [8001024] = {
    GroupId = 8001024,
    MemberSpawnProb = {
      [1] = {UnitId = 8001024, UnitProb = 1}
    }
  },
  [8002011] = {
    GroupId = 8002011,
    MemberSpawnProb = {
      [1] = {UnitId = 8002011, UnitProb = 1}
    }
  },
  [8002012] = {
    GroupId = 8002012,
    MemberSpawnProb = {
      [1] = {UnitId = 8002012, UnitProb = 1}
    }
  },
  [8002013] = {
    GroupId = 8002013,
    MemberSpawnProb = {
      [1] = {UnitId = 8002013, UnitProb = 1}
    }
  },
  [8002014] = {
    GroupId = 8002014,
    MemberSpawnProb = {
      [1] = {UnitId = 8002014, UnitProb = 1}
    }
  },
  [8002015] = {
    GroupId = 8002015,
    MemberSpawnProb = {
      [1] = {UnitId = 8002015, UnitProb = 1}
    }
  },
  [8002016] = {
    GroupId = 8002016,
    MemberSpawnProb = {
      [1] = {UnitId = 8002016, UnitProb = 1}
    }
  },
  [8002017] = {
    GroupId = 8002017,
    MemberSpawnProb = {
      [1] = {UnitId = 8002017, UnitProb = 1}
    }
  },
  [8002018] = {
    GroupId = 8002018,
    MemberSpawnProb = {
      [1] = {UnitId = 8002018, UnitProb = 1}
    }
  },
  [8002019] = {
    GroupId = 8002019,
    MemberSpawnProb = {
      [1] = {UnitId = 8002019, UnitProb = 1}
    }
  },
  [8002020] = {
    GroupId = 8002020,
    MemberSpawnProb = {
      [1] = {UnitId = 8002020, UnitProb = 1}
    }
  },
  [8002021] = {
    GroupId = 8002021,
    MemberSpawnProb = {
      [1] = {UnitId = 8002021, UnitProb = 1}
    }
  },
  [8002022] = {
    GroupId = 8002022,
    MemberSpawnProb = {
      [1] = {UnitId = 8002022, UnitProb = 1}
    }
  },
  [8002023] = {
    GroupId = 8002023,
    MemberSpawnProb = {
      [1] = {UnitId = 8002023, UnitProb = 1}
    }
  },
  [8002024] = {
    GroupId = 8002024,
    MemberSpawnProb = {
      [1] = {UnitId = 8002024, UnitProb = 1}
    }
  },
  [8003011] = {
    GroupId = 8003011,
    MemberSpawnProb = {
      [1] = {UnitId = 8003011, UnitProb = 1}
    }
  },
  [8003012] = {
    GroupId = 8003012,
    MemberSpawnProb = {
      [1] = {UnitId = 8003012, UnitProb = 1}
    }
  },
  [8003013] = {
    GroupId = 8003013,
    MemberSpawnProb = {
      [1] = {UnitId = 8003013, UnitProb = 1}
    }
  },
  [8003014] = {
    GroupId = 8003014,
    MemberSpawnProb = {
      [1] = {UnitId = 8003014, UnitProb = 1}
    }
  },
  [8003015] = {
    GroupId = 8003015,
    MemberSpawnProb = {
      [1] = {UnitId = 8003015, UnitProb = 1}
    }
  },
  [8003016] = {
    GroupId = 8003016,
    MemberSpawnProb = {
      [1] = {UnitId = 8003016, UnitProb = 1}
    }
  },
  [8003017] = {
    GroupId = 8003017,
    MemberSpawnProb = {
      [1] = {UnitId = 8003017, UnitProb = 1}
    }
  },
  [8003018] = {
    GroupId = 8003018,
    MemberSpawnProb = {
      [1] = {UnitId = 8003018, UnitProb = 1}
    }
  },
  [8003019] = {
    GroupId = 8003019,
    MemberSpawnProb = {
      [1] = {UnitId = 8003019, UnitProb = 1}
    }
  },
  [8003020] = {
    GroupId = 8003020,
    MemberSpawnProb = {
      [1] = {UnitId = 8003020, UnitProb = 1}
    }
  },
  [8003021] = {
    GroupId = 8003021,
    MemberSpawnProb = {
      [1] = {UnitId = 8003021, UnitProb = 1}
    }
  },
  [8003022] = {
    GroupId = 8003022,
    MemberSpawnProb = {
      [1] = {UnitId = 8003022, UnitProb = 1}
    }
  },
  [8003023] = {
    GroupId = 8003023,
    MemberSpawnProb = {
      [1] = {UnitId = 8003023, UnitProb = 1}
    }
  },
  [8003024] = {
    GroupId = 8003024,
    MemberSpawnProb = {
      [1] = {UnitId = 8003024, UnitProb = 1}
    }
  },
  [9001011] = {
    GroupId = 9001011,
    MemberSpawnProb = {
      [1] = {UnitId = 9001011, UnitProb = 1}
    }
  },
  [9001012] = {
    GroupId = 9001012,
    MemberSpawnProb = {
      [1] = {UnitId = 9001012, UnitProb = 1}
    }
  },
  [9001013] = {
    GroupId = 9001013,
    MemberSpawnProb = {
      [1] = {UnitId = 9001013, UnitProb = 1}
    }
  },
  [9001014] = {
    GroupId = 9001014,
    MemberSpawnProb = {
      [1] = {UnitId = 9001014, UnitProb = 1}
    }
  },
  [9001015] = {
    GroupId = 9001015,
    MemberSpawnProb = {
      [1] = {UnitId = 9001015, UnitProb = 1}
    }
  },
  [9001016] = {
    GroupId = 9001016,
    MemberSpawnProb = {
      [1] = {UnitId = 9001016, UnitProb = 1}
    }
  },
  [9001017] = {
    GroupId = 9001017,
    MemberSpawnProb = {
      [1] = {UnitId = 9001017, UnitProb = 1}
    }
  },
  [9001018] = {
    GroupId = 9001018,
    MemberSpawnProb = {
      [1] = {UnitId = 9001018, UnitProb = 1}
    }
  },
  [9001019] = {
    GroupId = 9001019,
    MemberSpawnProb = {
      [1] = {UnitId = 9001019, UnitProb = 1}
    }
  },
  [9001020] = {
    GroupId = 9001020,
    MemberSpawnProb = {
      [1] = {UnitId = 9001020, UnitProb = 1}
    }
  },
  [9001021] = {
    GroupId = 9001021,
    MemberSpawnProb = {
      [1] = {UnitId = 9001021, UnitProb = 1}
    }
  },
  [9001022] = {
    GroupId = 9001022,
    MemberSpawnProb = {
      [1] = {UnitId = 9001022, UnitProb = 1}
    }
  },
  [9001023] = {
    GroupId = 9001023,
    MemberSpawnProb = {
      [1] = {UnitId = 9001023, UnitProb = 1}
    }
  },
  [9001024] = {
    GroupId = 9001024,
    MemberSpawnProb = {
      [1] = {UnitId = 9001024, UnitProb = 1}
    }
  },
  [9002011] = {
    GroupId = 9002011,
    MemberSpawnProb = {
      [1] = {UnitId = 9002011, UnitProb = 1}
    }
  },
  [9002012] = {
    GroupId = 9002012,
    MemberSpawnProb = {
      [1] = {UnitId = 9002012, UnitProb = 1}
    }
  },
  [9002013] = {
    GroupId = 9002013,
    MemberSpawnProb = {
      [1] = {UnitId = 9002013, UnitProb = 1}
    }
  },
  [9002014] = {
    GroupId = 9002014,
    MemberSpawnProb = {
      [1] = {UnitId = 9002014, UnitProb = 1}
    }
  },
  [9002015] = {
    GroupId = 9002015,
    MemberSpawnProb = {
      [1] = {UnitId = 9002015, UnitProb = 1}
    }
  },
  [9002016] = {
    GroupId = 9002016,
    MemberSpawnProb = {
      [1] = {UnitId = 9002016, UnitProb = 1}
    }
  },
  [9002017] = {
    GroupId = 9002017,
    MemberSpawnProb = {
      [1] = {UnitId = 9002017, UnitProb = 1}
    }
  },
  [9002018] = {
    GroupId = 9002018,
    MemberSpawnProb = {
      [1] = {UnitId = 9002018, UnitProb = 1}
    }
  },
  [9002019] = {
    GroupId = 9002019,
    MemberSpawnProb = {
      [1] = {UnitId = 9002019, UnitProb = 1}
    }
  },
  [9002020] = {
    GroupId = 9002020,
    MemberSpawnProb = {
      [1] = {UnitId = 9002020, UnitProb = 1}
    }
  },
  [9002021] = {
    GroupId = 9002021,
    MemberSpawnProb = {
      [1] = {UnitId = 9002021, UnitProb = 1}
    }
  },
  [9002022] = {
    GroupId = 9002022,
    MemberSpawnProb = {
      [1] = {UnitId = 9002022, UnitProb = 1}
    }
  },
  [9002023] = {
    GroupId = 9002023,
    MemberSpawnProb = {
      [1] = {UnitId = 9002023, UnitProb = 1}
    }
  },
  [9002024] = {
    GroupId = 9002024,
    MemberSpawnProb = {
      [1] = {UnitId = 9002024, UnitProb = 1}
    }
  },
  [9003601] = {
    GroupId = 9003601,
    MemberSpawnProb = {
      [1] = {UnitId = 9003601, UnitProb = 1}
    }
  },
  [9005601] = {
    GroupId = 9005601,
    MemberSpawnProb = {
      [1] = {UnitId = 9005601, UnitProb = 1}
    }
  },
  [9006601] = {
    GroupId = 9006601,
    MemberSpawnProb = {
      [1] = {UnitId = 9006601, UnitProb = 1}
    }
  },
  [9007011] = {
    GroupId = 9007011,
    MemberSpawnProb = {
      [1] = {UnitId = 9007011, UnitProb = 1}
    }
  },
  [9007012] = {
    GroupId = 9007012,
    MemberSpawnProb = {
      [1] = {UnitId = 9007012, UnitProb = 1}
    }
  },
  [9007013] = {
    GroupId = 9007013,
    MemberSpawnProb = {
      [1] = {UnitId = 9007013, UnitProb = 1}
    }
  },
  [9007014] = {
    GroupId = 9007014,
    MemberSpawnProb = {
      [1] = {UnitId = 9007014, UnitProb = 1}
    }
  },
  [9007015] = {
    GroupId = 9007015,
    MemberSpawnProb = {
      [1] = {UnitId = 9007015, UnitProb = 1}
    }
  },
  [9007016] = {
    GroupId = 9007016,
    MemberSpawnProb = {
      [1] = {UnitId = 9007016, UnitProb = 1}
    }
  },
  [9007017] = {
    GroupId = 9007017,
    MemberSpawnProb = {
      [1] = {UnitId = 9007017, UnitProb = 1}
    }
  },
  [9007018] = {
    GroupId = 9007018,
    MemberSpawnProb = {
      [1] = {UnitId = 9007018, UnitProb = 1}
    }
  },
  [9007019] = {
    GroupId = 9007019,
    MemberSpawnProb = {
      [1] = {UnitId = 9007019, UnitProb = 1}
    }
  },
  [9007020] = {
    GroupId = 9007020,
    MemberSpawnProb = {
      [1] = {UnitId = 9007020, UnitProb = 1}
    }
  },
  [9007021] = {
    GroupId = 9007021,
    MemberSpawnProb = {
      [1] = {UnitId = 9007021, UnitProb = 1}
    }
  },
  [9007022] = {
    GroupId = 9007022,
    MemberSpawnProb = {
      [1] = {UnitId = 9007022, UnitProb = 1}
    }
  },
  [9007023] = {
    GroupId = 9007023,
    MemberSpawnProb = {
      [1] = {UnitId = 9007023, UnitProb = 1}
    }
  },
  [9007024] = {
    GroupId = 9007024,
    MemberSpawnProb = {
      [1] = {UnitId = 9007024, UnitProb = 1}
    }
  }
})
