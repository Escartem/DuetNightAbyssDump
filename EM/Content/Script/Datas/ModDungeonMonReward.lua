local T = {}
T.RT_1 = {112}
T.RT_2 = {125}
T.RT_3 = {130}
T.RT_4 = {135}
T.RT_5 = {140}
T.RT_6 = {145}
T.RT_7 = {155}
T.RT_8 = {160}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ModDungeonMonReward", {
  [1001] = {
    DungeonDropReward = 131001,
    DungeonList = {91101},
    DungeonRewardView = 131001,
    MonRewardId = 1001,
    MonsterUnitId = 6001012,
    Sequence = 1
  },
  [1002] = {
    DungeonDropReward = 131002,
    DungeonList = {91102},
    DungeonRewardView = 131002,
    MonRewardId = 1002,
    MonsterUnitId = 6002015,
    Sequence = 2
  },
  [1003] = {
    DungeonDropReward = 131003,
    DungeonList = {91103},
    DungeonRewardView = 131003,
    MonRewardId = 1003,
    MonsterUnitId = 6013017,
    Sequence = 3
  },
  [1004] = {
    DungeonDropReward = 131004,
    DungeonList = {91104},
    DungeonRewardView = 131004,
    MonRewardId = 1004,
    MonsterUnitId = 6007011,
    Sequence = 4
  },
  [2001] = {
    DungeonDropReward = 132001,
    DungeonList = {91105},
    DungeonRewardView = 132001,
    MonRewardId = 2001,
    MonsterUnitId = 8002018,
    Sequence = 5
  },
  [2002] = {
    DungeonDropReward = 132002,
    DungeonList = {91106},
    DungeonRewardView = 132002,
    MonRewardId = 2002,
    MonsterUnitId = 8001019,
    Sequence = 6
  },
  [3001] = {
    Condition = T.RT_1,
    DungeonDropReward = 133001,
    DungeonList = {90161},
    DungeonRewardView = 133001,
    MonRewardId = 3001,
    MonsterUnitId = 6004020,
    Sequence = 1
  },
  [3002] = {
    Condition = T.RT_1,
    DungeonDropReward = 133002,
    DungeonList = {90162},
    DungeonRewardView = 133002,
    MonRewardId = 3002,
    MonsterUnitId = 6001014,
    Sequence = 2
  },
  [3003] = {
    Condition = T.RT_1,
    DungeonDropReward = 133003,
    DungeonList = {90167},
    DungeonRewardView = 133003,
    MonRewardId = 3003,
    MonsterUnitId = 6002016,
    Sequence = 3
  },
  [3004] = {
    Condition = T.RT_1,
    DungeonDropReward = 133004,
    DungeonList = {90168},
    DungeonRewardView = 133004,
    MonRewardId = 3004,
    MonsterUnitId = 6001011,
    Sequence = 4
  },
  [4001] = {
    Condition = T.RT_2,
    DungeonDropReward = 134001,
    DungeonList = {91107},
    DungeonRewardView = 134001,
    MonRewardId = 4001,
    MonsterUnitId = 6002011,
    Sequence = 1
  },
  [4002] = {
    Condition = T.RT_2,
    DungeonDropReward = 134002,
    DungeonList = {91108},
    DungeonRewardView = 134002,
    MonRewardId = 4002,
    MonsterUnitId = 6013018,
    Sequence = 2
  },
  [4003] = {
    Condition = T.RT_2,
    DungeonDropReward = 134003,
    DungeonList = {91109},
    DungeonRewardView = 134003,
    MonRewardId = 4003,
    MonsterUnitId = 6007024,
    Sequence = 3
  },
  [4004] = {
    Condition = T.RT_2,
    DungeonDropReward = 134004,
    DungeonList = {91110},
    DungeonRewardView = 134004,
    MonRewardId = 4004,
    MonsterUnitId = 6004014,
    Sequence = 4
  },
  [4005] = {
    Condition = T.RT_2,
    DungeonDropReward = 134005,
    DungeonList = {91111},
    DungeonRewardView = 134005,
    MonRewardId = 4005,
    MonsterUnitId = 6001018,
    Sequence = 5
  },
  [5001] = {
    Condition = T.RT_3,
    DungeonDropReward = 135001,
    DungeonList = {90163},
    DungeonRewardView = 135001,
    MonRewardId = 5001,
    MonsterUnitId = 6002017,
    Sequence = 1
  },
  [5002] = {
    Condition = T.RT_3,
    DungeonDropReward = 135002,
    DungeonList = {90164},
    DungeonRewardView = 135002,
    MonRewardId = 5002,
    MonsterUnitId = 6013015,
    Sequence = 2
  },
  [5003] = {
    Condition = T.RT_3,
    DungeonDropReward = 135003,
    DungeonList = {90165},
    DungeonRewardView = 135003,
    MonRewardId = 5003,
    MonsterUnitId = 6007016,
    Sequence = 3
  },
  [5004] = {
    Condition = T.RT_3,
    DungeonDropReward = 135004,
    DungeonList = {90166},
    DungeonRewardView = 135004,
    MonRewardId = 5004,
    MonsterUnitId = 6004012,
    Sequence = 4
  },
  [5501] = {
    Condition = T.RT_4,
    DungeonDropReward = 135501,
    DungeonList = {91112},
    DungeonRewardView = 135501,
    MonRewardId = 5501,
    MonsterUnitId = 8003021,
    Sequence = 501
  },
  [5502] = {
    Condition = T.RT_4,
    DungeonDropReward = 135502,
    DungeonList = {91113},
    DungeonRewardView = 135502,
    MonRewardId = 5502,
    MonsterUnitId = 8002012,
    Sequence = 502
  },
  [5503] = {
    Condition = T.RT_4,
    DungeonDropReward = 135503,
    DungeonList = {91114},
    DungeonRewardView = 135503,
    MonRewardId = 5503,
    MonsterUnitId = 8001015,
    Sequence = 503
  },
  [5504] = {
    Condition = T.RT_4,
    DungeonDropReward = 135504,
    DungeonList = {91115},
    DungeonRewardView = 135504,
    MonRewardId = 5504,
    MonsterUnitId = 8003016,
    Sequence = 504
  },
  [5505] = {
    Condition = T.RT_4,
    DungeonDropReward = 135505,
    DungeonList = {91116},
    DungeonRewardView = 135505,
    MonRewardId = 5505,
    MonsterUnitId = 8002020,
    Sequence = 505
  },
  [5506] = {
    Condition = T.RT_4,
    DungeonDropReward = 135506,
    DungeonList = {91117},
    DungeonRewardView = 135506,
    MonRewardId = 5506,
    MonsterUnitId = 8001021,
    Sequence = 506
  },
  [6001] = {
    Condition = T.RT_5,
    DungeonDropReward = 136001,
    DungeonList = {91118},
    DungeonRewardView = 136001,
    MonRewardId = 6001,
    MonsterUnitId = 7001015,
    Sequence = 1
  },
  [6002] = {
    Condition = T.RT_5,
    DungeonDropReward = 136002,
    DungeonList = {91119},
    DungeonRewardView = 136002,
    MonRewardId = 6002,
    MonsterUnitId = 7002018,
    Sequence = 2
  },
  [6003] = {
    Condition = T.RT_5,
    DungeonDropReward = 136003,
    DungeonList = {91120},
    DungeonRewardView = 136003,
    MonRewardId = 6003,
    MonsterUnitId = 7003016,
    Sequence = 3
  },
  [6004] = {
    Condition = T.RT_5,
    DungeonDropReward = 136004,
    DungeonList = {91121},
    DungeonRewardView = 136004,
    MonRewardId = 6004,
    MonsterUnitId = 7004020,
    Sequence = 4
  },
  [6005] = {
    Condition = T.RT_5,
    DungeonDropReward = 136005,
    DungeonList = {91122},
    DungeonRewardView = 136005,
    MonRewardId = 6005,
    MonsterUnitId = 7015011,
    Sequence = 5
  },
  [6006] = {
    Condition = T.RT_5,
    DungeonDropReward = 136006,
    DungeonList = {91123},
    DungeonRewardView = 136006,
    MonRewardId = 6006,
    MonsterUnitId = 7010022,
    Sequence = 6
  },
  [6501] = {
    Condition = T.RT_6,
    DungeonDropReward = 136501,
    DungeonList = {90180},
    DungeonRewardView = 136501,
    MonRewardId = 6501,
    MonsterUnitId = 9002019,
    Sequence = 501
  },
  [6502] = {
    Condition = T.RT_6,
    DungeonDropReward = 136502,
    DungeonList = {90181},
    DungeonRewardView = 136502,
    MonRewardId = 6502,
    MonsterUnitId = 9001023,
    Sequence = 502
  },
  [6503] = {
    Condition = T.RT_6,
    DungeonDropReward = 136503,
    DungeonList = {90182},
    DungeonRewardView = 136503,
    MonRewardId = 6503,
    MonsterUnitId = 9007023,
    Sequence = 503
  },
  [6504] = {
    Condition = T.RT_6,
    DungeonDropReward = 136504,
    DungeonList = {90183},
    DungeonRewardView = 136504,
    MonRewardId = 6504,
    MonsterUnitId = 9002024,
    Sequence = 504
  },
  [6505] = {
    Condition = T.RT_6,
    DungeonDropReward = 136505,
    DungeonList = {90184},
    DungeonRewardView = 136505,
    MonRewardId = 6505,
    MonsterUnitId = 9001017,
    Sequence = 505
  },
  [6506] = {
    Condition = T.RT_6,
    DungeonDropReward = 136506,
    DungeonList = {90185},
    DungeonRewardView = 136506,
    MonRewardId = 6506,
    MonsterUnitId = 9007022,
    Sequence = 506
  },
  [6507] = {
    Condition = T.RT_6,
    DungeonDropReward = 136507,
    DungeonList = {90186},
    DungeonRewardView = 136507,
    MonRewardId = 6507,
    MonsterUnitId = 9002023,
    Sequence = 507
  },
  [6508] = {
    Condition = T.RT_6,
    DungeonDropReward = 136508,
    DungeonList = {90187},
    DungeonRewardView = 136508,
    MonRewardId = 6508,
    MonsterUnitId = 9001024,
    Sequence = 508
  },
  [6509] = {
    Condition = T.RT_6,
    DungeonDropReward = 136509,
    DungeonList = {90188},
    DungeonRewardView = 136509,
    MonRewardId = 6509,
    MonsterUnitId = 9007019,
    Sequence = 509
  },
  [7001] = {
    Condition = T.RT_7,
    DungeonDropReward = 137001,
    DungeonList = {91137},
    DungeonRewardView = 137001,
    MonRewardId = 7001,
    MonsterUnitId = 7009020,
    Sequence = 10
  },
  [7002] = {
    Condition = T.RT_7,
    DungeonDropReward = 137002,
    DungeonList = {91138},
    DungeonRewardView = 137002,
    MonRewardId = 7002,
    MonsterUnitId = 7008023,
    Sequence = 20
  },
  [7003] = {
    Condition = T.RT_7,
    DungeonDropReward = 137003,
    DungeonList = {91139},
    DungeonRewardView = 137003,
    MonRewardId = 7003,
    MonsterUnitId = 7001024,
    Sequence = 30
  },
  [7004] = {
    Condition = T.RT_7,
    DungeonDropReward = 137004,
    DungeonList = {91140},
    DungeonRewardView = 137004,
    MonRewardId = 7004,
    MonsterUnitId = 7002019,
    Sequence = 40
  },
  [7005] = {
    Condition = T.RT_7,
    DungeonDropReward = 137005,
    DungeonList = {91141},
    DungeonRewardView = 137005,
    MonRewardId = 7005,
    MonsterUnitId = 7003022,
    Sequence = 50
  },
  [7006] = {
    Condition = T.RT_7,
    DungeonDropReward = 137006,
    DungeonList = {91142},
    DungeonRewardView = 137006,
    MonRewardId = 7006,
    MonsterUnitId = 7004017,
    Sequence = 60
  },
  [8001] = {
    Condition = T.RT_8,
    DungeonDropReward = 138001,
    DungeonList = {91143},
    DungeonRewardView = 138001,
    MonRewardId = 8001,
    MonsterUnitId = 8003024,
    Sequence = 10
  },
  [11001] = {
    DungeonList = {91151},
    MonRewardId = 11001,
    MonsterUnitId = 6001012,
    Sequence = 1
  },
  [11002] = {
    DungeonList = {91152},
    MonRewardId = 11002,
    MonsterUnitId = 6002015,
    Sequence = 2
  },
  [11003] = {
    DungeonList = {91153},
    MonRewardId = 11003,
    MonsterUnitId = 6013017,
    Sequence = 3
  },
  [11004] = {
    DungeonList = {91154},
    MonRewardId = 11004,
    MonsterUnitId = 6007011,
    Sequence = 4
  },
  [12001] = {
    DungeonList = {91155},
    MonRewardId = 12001,
    MonsterUnitId = 8002018,
    Sequence = 5
  },
  [12002] = {
    DungeonList = {91156},
    MonRewardId = 12002,
    MonsterUnitId = 8001019,
    Sequence = 6
  },
  [13001] = {
    Condition = T.RT_1,
    DungeonList = {90171},
    MonRewardId = 13001,
    MonsterUnitId = 6004020,
    Sequence = 1
  },
  [13002] = {
    Condition = T.RT_1,
    DungeonList = {90172},
    MonRewardId = 13002,
    MonsterUnitId = 6001014,
    Sequence = 2
  },
  [13003] = {
    Condition = T.RT_1,
    DungeonList = {90173},
    MonRewardId = 13003,
    MonsterUnitId = 6002016,
    Sequence = 3
  },
  [13004] = {
    Condition = T.RT_1,
    DungeonList = {90174},
    MonRewardId = 13004,
    MonsterUnitId = 6001011,
    Sequence = 4
  },
  [14001] = {
    Condition = T.RT_2,
    DungeonList = {91157},
    MonRewardId = 14001,
    MonsterUnitId = 6002011,
    Sequence = 1
  },
  [14002] = {
    Condition = T.RT_2,
    DungeonList = {91158},
    MonRewardId = 14002,
    MonsterUnitId = 6013018,
    Sequence = 2
  },
  [14003] = {
    Condition = T.RT_2,
    DungeonList = {91159},
    MonRewardId = 14003,
    MonsterUnitId = 6007024,
    Sequence = 3
  },
  [14004] = {
    Condition = T.RT_2,
    DungeonList = {91160},
    MonRewardId = 14004,
    MonsterUnitId = 6004014,
    Sequence = 4
  },
  [14005] = {
    Condition = T.RT_2,
    DungeonList = {91161},
    MonRewardId = 14005,
    MonsterUnitId = 6001018,
    Sequence = 5
  },
  [15001] = {
    Condition = T.RT_3,
    DungeonList = {90175},
    MonRewardId = 15001,
    MonsterUnitId = 6002017,
    Sequence = 1
  },
  [15002] = {
    Condition = T.RT_3,
    DungeonList = {90176},
    MonRewardId = 15002,
    MonsterUnitId = 6013015,
    Sequence = 2
  },
  [15003] = {
    Condition = T.RT_3,
    DungeonList = {90177},
    MonRewardId = 15003,
    MonsterUnitId = 6007016,
    Sequence = 3
  },
  [15004] = {
    Condition = T.RT_3,
    DungeonList = {90178},
    MonRewardId = 15004,
    MonsterUnitId = 6004012,
    Sequence = 4
  },
  [15501] = {
    Condition = T.RT_4,
    DungeonList = {91162},
    MonRewardId = 15501,
    MonsterUnitId = 8003021,
    Sequence = 501
  },
  [15502] = {
    Condition = T.RT_4,
    DungeonList = {91163},
    MonRewardId = 15502,
    MonsterUnitId = 8002012,
    Sequence = 502
  },
  [15503] = {
    Condition = T.RT_4,
    DungeonList = {91164},
    MonRewardId = 15503,
    MonsterUnitId = 8001015,
    Sequence = 503
  },
  [15504] = {
    Condition = T.RT_4,
    DungeonList = {91165},
    MonRewardId = 15504,
    MonsterUnitId = 8003016,
    Sequence = 504
  },
  [15505] = {
    Condition = T.RT_4,
    DungeonList = {91166},
    MonRewardId = 15505,
    MonsterUnitId = 8002020,
    Sequence = 505
  },
  [15506] = {
    Condition = T.RT_4,
    DungeonList = {91167},
    MonRewardId = 15506,
    MonsterUnitId = 8001021,
    Sequence = 506
  },
  [16001] = {
    Condition = T.RT_5,
    DungeonList = {91168},
    MonRewardId = 16001,
    MonsterUnitId = 7001015,
    Sequence = 1
  },
  [16002] = {
    Condition = T.RT_5,
    DungeonList = {91169},
    MonRewardId = 16002,
    MonsterUnitId = 7002018,
    Sequence = 2
  },
  [16003] = {
    Condition = T.RT_5,
    DungeonList = {91170},
    MonRewardId = 16003,
    MonsterUnitId = 7003016,
    Sequence = 3
  },
  [16004] = {
    Condition = T.RT_5,
    DungeonList = {91171},
    MonRewardId = 16004,
    MonsterUnitId = 7004020,
    Sequence = 4
  },
  [16005] = {
    Condition = T.RT_5,
    DungeonList = {91172},
    MonRewardId = 16005,
    MonsterUnitId = 7015011,
    Sequence = 5
  },
  [16006] = {
    Condition = T.RT_5,
    DungeonList = {91173},
    MonRewardId = 16006,
    MonsterUnitId = 7010022,
    Sequence = 6
  },
  [16501] = {
    Condition = T.RT_6,
    DungeonList = {91251},
    MonRewardId = 16501,
    MonsterUnitId = 9002019,
    Sequence = 501
  },
  [16502] = {
    Condition = T.RT_6,
    DungeonList = {91252},
    MonRewardId = 16502,
    MonsterUnitId = 9001023,
    Sequence = 502
  },
  [16503] = {
    Condition = T.RT_6,
    DungeonList = {91253},
    MonRewardId = 16503,
    MonsterUnitId = 9007023,
    Sequence = 503
  },
  [16504] = {
    Condition = T.RT_6,
    DungeonList = {91254},
    MonRewardId = 16504,
    MonsterUnitId = 9002024,
    Sequence = 504
  },
  [16505] = {
    Condition = T.RT_6,
    DungeonList = {91255},
    MonRewardId = 16505,
    MonsterUnitId = 9001017,
    Sequence = 505
  },
  [16506] = {
    Condition = T.RT_6,
    DungeonList = {91256},
    MonRewardId = 16506,
    MonsterUnitId = 9007022,
    Sequence = 506
  },
  [16507] = {
    Condition = T.RT_6,
    DungeonList = {91257},
    MonRewardId = 16507,
    MonsterUnitId = 9002023,
    Sequence = 507
  },
  [16508] = {
    Condition = T.RT_6,
    DungeonList = {91258},
    MonRewardId = 16508,
    MonsterUnitId = 9001024,
    Sequence = 508
  },
  [16509] = {
    Condition = T.RT_6,
    DungeonList = {91259},
    MonRewardId = 16509,
    MonsterUnitId = 9007019,
    Sequence = 509
  },
  [17001] = {
    Condition = T.RT_7,
    DungeonList = {91174},
    MonRewardId = 17001,
    MonsterUnitId = 7009020,
    Sequence = 10
  },
  [17002] = {
    Condition = T.RT_7,
    DungeonList = {91175},
    MonRewardId = 17002,
    MonsterUnitId = 7008023,
    Sequence = 20
  },
  [17003] = {
    Condition = T.RT_7,
    DungeonList = {91176},
    MonRewardId = 17003,
    MonsterUnitId = 7001024,
    Sequence = 30
  },
  [17004] = {
    Condition = T.RT_7,
    DungeonList = {91177},
    MonRewardId = 17004,
    MonsterUnitId = 7002019,
    Sequence = 40
  },
  [17005] = {
    Condition = T.RT_7,
    DungeonList = {91178},
    MonRewardId = 17005,
    MonsterUnitId = 7003022,
    Sequence = 50
  },
  [17006] = {
    Condition = T.RT_7,
    DungeonList = {91179},
    MonRewardId = 17006,
    MonsterUnitId = 7004017,
    Sequence = 60
  },
  [18001] = {
    Condition = T.RT_8,
    DungeonList = {91180},
    MonRewardId = 18001,
    MonsterUnitId = 8003024,
    Sequence = 10
  }
})
