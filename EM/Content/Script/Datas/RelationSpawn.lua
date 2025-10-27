local T = {}
T.RT_1 = {
  1,
  1,
  2,
  2
}
T.RT_2 = {
  6001012,
  6001014,
  6001016,
  6001018,
  8002012,
  8002014,
  8002016,
  8002018
}
T.RT_3 = {
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1
}
T.RT_4 = {
  1,
  1,
  1,
  1
}
T.RT_5 = {
  1,
  1,
  1
}
T.RT_6 = {1, 1}
T.RT_7 = {1}
T.RT_8 = {
  6001012,
  6002017,
  6004013
}
T.RT_9 = {
  6001012,
  6001014,
  6001016,
  6001018,
  7002012,
  7002014,
  7002016,
  7002018
}
T.RT_10 = {
  6002011,
  6002015,
  6002016,
  6002017,
  6002018,
  7001011,
  7001015,
  7001016,
  7001017,
  7001018,
  7003011,
  7003015,
  7003016,
  7003017,
  7003018
}
T.RT_11 = {
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1
}
T.RT_12 = {
  1,
  1,
  1,
  1,
  1,
  1
}
T.RT_13 = {
  6001012,
  6001013,
  6001014,
  6001016,
  6001018,
  7001012,
  7001013,
  7001014,
  7001016,
  7001018
}
T.RT_14 = {
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1
}
T.RT_15 = {
  7003011,
  7003015,
  7003017
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RelationSpawn", {
  [205] = {
    RelationId = 205,
    RelationSpawnTotalNum = T.RT_1,
    UnitId = T.RT_9,
    UnitLevel = 5,
    UnitWeight = T.RT_3
  },
  [206] = {
    RelationId = 206,
    RelationSpawnTotalNum = T.RT_1,
    UnitId = T.RT_9,
    UnitLevel = 5,
    UnitWeight = T.RT_3
  },
  [302] = {
    RelationId = 302,
    RelationSpawnTotalNum = T.RT_1,
    UnitId = T.RT_10,
    UnitLevel = 3,
    UnitWeight = T.RT_11
  },
  [303] = {
    RelationId = 303,
    RelationSpawnTotalNum = T.RT_1,
    UnitId = T.RT_10,
    UnitLevel = 3,
    UnitWeight = T.RT_11
  },
  [304] = {
    RelationId = 304,
    RelationSpawnTotalNum = T.RT_1,
    UnitId = T.RT_10,
    UnitLevel = 3,
    UnitWeight = T.RT_11
  },
  [305] = {
    RelationId = 305,
    RelationSpawnTotalNum = T.RT_1,
    UnitId = T.RT_10,
    UnitLevel = 3,
    UnitWeight = T.RT_11
  },
  [306] = {
    RelationId = 306,
    RelationSpawnTotalNum = T.RT_1,
    UnitId = T.RT_10,
    UnitLevel = 3,
    UnitWeight = T.RT_11
  },
  [312] = {
    RelationId = 312,
    RelationSpawnTotalNum = T.RT_1,
    UnitId = {
      6002015,
      6002016,
      7001015,
      7001016,
      7003015,
      7003016
    },
    UnitLevel = 5,
    UnitWeight = T.RT_12
  },
  [313] = {
    RelationId = 313,
    RelationSpawnTotalNum = T.RT_1,
    UnitId = T.RT_10,
    UnitLevel = 5,
    UnitWeight = T.RT_11
  },
  [314] = {
    RelationId = 314,
    RelationSpawnTotalNum = T.RT_1,
    UnitId = T.RT_10,
    UnitLevel = 5,
    UnitWeight = T.RT_11
  },
  [315] = {
    RelationId = 315,
    RelationSpawnTotalNum = T.RT_1,
    UnitId = T.RT_10,
    UnitLevel = 5,
    UnitWeight = T.RT_11
  },
  [502] = {
    RelationId = 502,
    RelationSpawnTotalNum = T.RT_1,
    UnitId = {
      6001013,
      6001014,
      6001016,
      7001013,
      7001014,
      7001016
    },
    UnitLevel = 5,
    UnitWeight = T.RT_12
  },
  [503] = {
    RelationId = 503,
    RelationSpawnTotalNum = T.RT_1,
    UnitId = T.RT_13,
    UnitLevel = 5,
    UnitWeight = T.RT_14
  },
  [504] = {
    RelationId = 504,
    RelationSpawnTotalNum = T.RT_1,
    UnitId = T.RT_13,
    UnitLevel = 5,
    UnitWeight = T.RT_14
  },
  [505] = {
    RelationId = 505,
    RelationSpawnTotalNum = T.RT_1,
    UnitId = T.RT_13,
    UnitLevel = 5,
    UnitWeight = T.RT_14
  },
  [506] = {
    RelationId = 506,
    RelationSpawnTotalNum = T.RT_1,
    UnitId = T.RT_13,
    UnitLevel = 5,
    UnitWeight = T.RT_14
  },
  [601] = {
    RelationId = 601,
    RelationSpawnTotalNum = T.RT_1,
    UnitId = T.RT_15,
    UnitLevel = 5,
    UnitWeight = T.RT_5
  },
  [701] = {
    RelationId = 701,
    RelationSpawnTotalNum = T.RT_1,
    UnitId = T.RT_15,
    UnitLevel = 5,
    UnitWeight = T.RT_5
  },
  [100205] = {
    RelationId = 100205,
    RelationSpawnTotalNum = T.RT_1,
    UnitId = T.RT_2,
    UnitLevel = 5,
    UnitWeight = T.RT_3
  },
  [100206] = {
    RelationId = 100206,
    RelationSpawnTotalNum = T.RT_1,
    UnitId = T.RT_2,
    UnitLevel = 5,
    UnitWeight = T.RT_3
  },
  [10110101] = {
    RelationId = 10110101,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      6001011,
      6002011,
      6004011
    },
    UnitLevel = 3,
    UnitWeight = T.RT_5
  },
  [10110102] = {
    RelationId = 10110102,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {6001012, 6004012},
    UnitLevel = 3,
    UnitWeight = T.RT_6
  },
  [10110103] = {
    RelationId = 10110103,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {6001013, 6004013},
    UnitLevel = 3,
    UnitWeight = T.RT_6
  },
  [10110104] = {
    RelationId = 10110104,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {6001014, 6004014},
    UnitLevel = 3,
    UnitWeight = T.RT_6
  },
  [10110105] = {
    RelationId = 10110105,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {6002015},
    UnitLevel = 3,
    UnitWeight = T.RT_7
  },
  [10110106] = {
    RelationId = 10110106,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      6001016,
      6002016,
      6004016
    },
    UnitLevel = 3,
    UnitWeight = T.RT_5
  },
  [10110107] = {
    RelationId = 10110107,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      6001017,
      6002017,
      6004017
    },
    UnitLevel = 3,
    UnitWeight = T.RT_5
  },
  [10110108] = {
    RelationId = 10110108,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      6001018,
      6002018,
      6004018
    },
    UnitLevel = 3,
    UnitWeight = T.RT_5
  },
  [10110109] = {
    RelationId = 10110109,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      6001019,
      6002019,
      6004019
    },
    UnitLevel = 3,
    UnitWeight = T.RT_5
  },
  [10110110] = {
    RelationId = 10110110,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {6001020, 6004020},
    UnitLevel = 3,
    UnitWeight = T.RT_6
  },
  [10110111] = {
    RelationId = 10110111,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      6001021,
      6002021,
      6004021
    },
    UnitLevel = 3,
    UnitWeight = T.RT_5
  },
  [10110112] = {
    RelationId = 10110112,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {6002022},
    UnitLevel = 3,
    UnitWeight = T.RT_7
  },
  [10110113] = {
    RelationId = 10110113,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      6001023,
      6002023,
      6004023
    },
    UnitLevel = 3,
    UnitWeight = T.RT_5
  },
  [10110114] = {
    RelationId = 10110114,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      6001024,
      6002024,
      6004024
    },
    UnitLevel = 3,
    UnitWeight = T.RT_5
  },
  [10110115] = {RelationId = 10110115, UnitLevel = 3},
  [10110116] = {RelationId = 10110116, UnitLevel = 3},
  [10110117] = {RelationId = 10110117, UnitLevel = 3},
  [10110118] = {RelationId = 10110118, UnitLevel = 3},
  [10110119] = {RelationId = 10110119, UnitLevel = 3},
  [10110120] = {RelationId = 10110120, UnitLevel = 3},
  [10110121] = {RelationId = 10110121, UnitLevel = 3},
  [10110122] = {RelationId = 10110122, UnitLevel = 3},
  [10110123] = {RelationId = 10110123, UnitLevel = 3},
  [10110124] = {RelationId = 10110124, UnitLevel = 3},
  [10110125] = {RelationId = 10110125, UnitLevel = 3},
  [10110126] = {RelationId = 10110126, UnitLevel = 3},
  [10110127] = {RelationId = 10110127, UnitLevel = 3},
  [10110128] = {RelationId = 10110128, UnitLevel = 3},
  [10110129] = {RelationId = 10110129, UnitLevel = 3},
  [10110130] = {RelationId = 10110130, UnitLevel = 3},
  [10110131] = {RelationId = 10110131, UnitLevel = 3},
  [10110132] = {RelationId = 10110132, UnitLevel = 3},
  [10110133] = {RelationId = 10110133, UnitLevel = 3},
  [10110134] = {RelationId = 10110134, UnitLevel = 3},
  [10110135] = {RelationId = 10110135, UnitLevel = 3},
  [10110136] = {RelationId = 10110136, UnitLevel = 3},
  [10110137] = {RelationId = 10110137, UnitLevel = 3},
  [10110138] = {RelationId = 10110138, UnitLevel = 3},
  [10110201] = {
    RelationId = 10110201,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      7001011,
      7002011,
      7003011,
      7004011
    },
    UnitLevel = 3,
    UnitWeight = T.RT_4
  },
  [10110202] = {
    RelationId = 10110202,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {7002012, 7004012},
    UnitLevel = 3,
    UnitWeight = T.RT_6
  },
  [10110203] = {
    RelationId = 10110203,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {7002013, 7004013},
    UnitLevel = 3,
    UnitWeight = T.RT_6
  },
  [10110204] = {
    RelationId = 10110204,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {7002014, 7004014},
    UnitLevel = 3,
    UnitWeight = T.RT_6
  },
  [10110205] = {
    RelationId = 10110205,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {7001015, 7003015},
    UnitLevel = 3,
    UnitWeight = T.RT_6
  },
  [10110206] = {
    RelationId = 10110206,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      7001016,
      7002016,
      7003016,
      7004016
    },
    UnitLevel = 3,
    UnitWeight = T.RT_4
  },
  [10110207] = {
    RelationId = 10110207,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      7001017,
      7002017,
      7003017,
      7004017
    },
    UnitLevel = 3,
    UnitWeight = T.RT_4
  },
  [10110208] = {
    RelationId = 10110208,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      7001018,
      7002018,
      7003018,
      7004018
    },
    UnitLevel = 3,
    UnitWeight = T.RT_4
  },
  [10110209] = {
    RelationId = 10110209,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      7001019,
      7002019,
      7003019,
      7004019
    },
    UnitLevel = 3,
    UnitWeight = T.RT_4
  },
  [10110210] = {
    RelationId = 10110210,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {7002020, 7004020},
    UnitLevel = 3,
    UnitWeight = T.RT_6
  },
  [10110211] = {
    RelationId = 10110211,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      7001021,
      7002021,
      7003021,
      7004021
    },
    UnitLevel = 3,
    UnitWeight = T.RT_4
  },
  [10110212] = {
    RelationId = 10110212,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {7001022, 7003022},
    UnitLevel = 3,
    UnitWeight = T.RT_6
  },
  [10110213] = {
    RelationId = 10110213,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      7001023,
      7002023,
      7003023,
      7004023
    },
    UnitLevel = 3,
    UnitWeight = T.RT_4
  },
  [10110214] = {
    RelationId = 10110214,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      7001024,
      7002024,
      7003024,
      7004024
    },
    UnitLevel = 3,
    UnitWeight = T.RT_4
  },
  [10110215] = {RelationId = 10110215, UnitLevel = 3},
  [10110216] = {RelationId = 10110216, UnitLevel = 3},
  [10110217] = {RelationId = 10110217, UnitLevel = 3},
  [10110218] = {RelationId = 10110218, UnitLevel = 3},
  [10110219] = {RelationId = 10110219, UnitLevel = 3},
  [10110220] = {RelationId = 10110220, UnitLevel = 3},
  [10110221] = {RelationId = 10110221, UnitLevel = 3},
  [10110222] = {RelationId = 10110222, UnitLevel = 3},
  [10110223] = {RelationId = 10110223, UnitLevel = 3},
  [10110224] = {RelationId = 10110224, UnitLevel = 3},
  [10110225] = {RelationId = 10110225, UnitLevel = 3},
  [10110226] = {RelationId = 10110226, UnitLevel = 3},
  [10110227] = {RelationId = 10110227, UnitLevel = 3},
  [10110228] = {RelationId = 10110228, UnitLevel = 3},
  [10110229] = {RelationId = 10110229, UnitLevel = 3},
  [10110230] = {RelationId = 10110230, UnitLevel = 3},
  [10110231] = {RelationId = 10110231, UnitLevel = 3},
  [10110232] = {RelationId = 10110232, UnitLevel = 3},
  [10110233] = {RelationId = 10110233, UnitLevel = 3},
  [10110234] = {RelationId = 10110234, UnitLevel = 3},
  [10110235] = {RelationId = 10110235, UnitLevel = 3},
  [10110236] = {RelationId = 10110236, UnitLevel = 3},
  [10110237] = {RelationId = 10110237, UnitLevel = 3},
  [10110238] = {RelationId = 10110238, UnitLevel = 3},
  [10110301] = {
    RelationId = 10110301,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      8001011,
      8002011,
      8003011
    },
    UnitLevel = 3,
    UnitWeight = T.RT_5
  },
  [10110302] = {
    RelationId = 10110302,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {8002012},
    UnitLevel = 3,
    UnitWeight = T.RT_7
  },
  [10110303] = {
    RelationId = 10110303,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {8002013},
    UnitLevel = 3,
    UnitWeight = T.RT_7
  },
  [10110304] = {
    RelationId = 10110304,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {8002014},
    UnitLevel = 3,
    UnitWeight = T.RT_7
  },
  [10110305] = {
    RelationId = 10110305,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {8001015, 8003015},
    UnitLevel = 3,
    UnitWeight = T.RT_6
  },
  [10110306] = {
    RelationId = 10110306,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      8001016,
      8002016,
      8003016
    },
    UnitLevel = 3,
    UnitWeight = T.RT_5
  },
  [10110307] = {
    RelationId = 10110307,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      8001017,
      8002017,
      8003017
    },
    UnitLevel = 3,
    UnitWeight = T.RT_5
  },
  [10110308] = {
    RelationId = 10110308,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      8001018,
      8002018,
      8003018
    },
    UnitLevel = 3,
    UnitWeight = T.RT_5
  },
  [10110309] = {
    RelationId = 10110309,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      8001019,
      8002019,
      8003019
    },
    UnitLevel = 3,
    UnitWeight = T.RT_5
  },
  [10110310] = {
    RelationId = 10110310,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {8002020},
    UnitLevel = 3,
    UnitWeight = T.RT_7
  },
  [10110311] = {
    RelationId = 10110311,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      8001021,
      8002021,
      8003021
    },
    UnitLevel = 3,
    UnitWeight = T.RT_5
  },
  [10110312] = {
    RelationId = 10110312,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {8001022, 8003022},
    UnitLevel = 3,
    UnitWeight = T.RT_6
  },
  [10110313] = {
    RelationId = 10110313,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      8001023,
      8002023,
      8003023
    },
    UnitLevel = 3,
    UnitWeight = T.RT_5
  },
  [10110314] = {
    RelationId = 10110314,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      8001024,
      8002024,
      8003024
    },
    UnitLevel = 3,
    UnitWeight = T.RT_5
  },
  [201010101] = {
    RelationId = 201010101,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      6001012,
      6001014,
      6001016,
      6001018
    },
    UnitLevel = 5,
    UnitWeight = T.RT_4
  },
  [201010102] = {
    RelationId = 201010102,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = {
      6002011,
      6002015,
      6002016,
      6002017,
      6002018
    },
    UnitLevel = 10,
    UnitWeight = {
      1,
      1,
      1,
      1,
      1
    }
  },
  [201010103] = {
    RelationId = 201010103,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = T.RT_8,
    UnitLevel = 15,
    UnitWeight = T.RT_5
  },
  [201010104] = {
    RelationId = 201010104,
    RelationSpawnTotalNum = T.RT_4,
    UnitId = T.RT_8,
    UnitLevel = 20,
    UnitWeight = T.RT_5
  }
})
