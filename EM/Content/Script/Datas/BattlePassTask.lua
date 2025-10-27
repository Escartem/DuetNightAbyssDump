local T = {}
T.RT_1 = {10150}
T.RT_2 = {201}
T.RT_3 = {10100}
T.RT_4 = {10116}
T.RT_5 = {30101}
T.RT_6 = {1400101}
T.RT_7 = {10200}
T.RT_8 = {1900101}
T.RT_9 = {11000}
T.RT_10 = {10600}
T.RT_11 = {10201}
T.RT_12 = {50930}
T.RT_13 = {10800}
T.RT_14 = {9000}
T.RT_15 = {10051601}
T.RT_16 = {1400201}
T.RT_17 = {2300101}
T.RT_18 = {11600}
T.RT_19 = {22000}
T.RT_20 = {1500102}
T.RT_21 = {23000}
T.RT_22 = {100101}
T.RT_23 = {22500}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("BattlePassTask", {
  [100001001] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001001",
    BattlePassTaskId = 100001001,
    BattlePassType = "Daily",
    QuestReward = T.RT_1,
    Target = 1,
    TargetId = T.RT_2
  },
  [100001003] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001003",
    BattlePassTaskId = 100001003,
    BattlePassType = "Daily",
    JumpUIId = 31,
    QuestReward = T.RT_3,
    Target = 200,
    TargetId = T.RT_4
  },
  [100001004] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001004",
    BattlePassTaskId = 100001004,
    BattlePassType = "Daily",
    JumpUIId = 20,
    QuestReward = T.RT_3,
    Target = 3,
    TargetId = T.RT_5
  },
  [100001005] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001005",
    BattlePassTaskId = 100001005,
    BattlePassType = "Daily",
    QuestReward = T.RT_3,
    Target = 1,
    TargetId = T.RT_6
  },
  [100001006] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001006",
    BattlePassTaskId = 100001006,
    BattlePassType = "Daily",
    JumpUIId = 21,
    QuestReward = T.RT_7,
    Target = 1,
    TargetId = T.RT_8
  },
  [100001101] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001101",
    BattlePassTaskId = 100001101,
    BattlePassType = "Weekly",
    JumpUIId = 20,
    QuestReward = T.RT_9,
    Target = 30,
    TargetId = T.RT_5
  },
  [100001102] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001102",
    BattlePassTaskId = 100001102,
    BattlePassType = "Weekly",
    QuestReward = T.RT_10,
    Target = 300000,
    TargetId = T.RT_11
  },
  [100001103] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001103",
    BattlePassTaskId = 100001103,
    BattlePassType = "Weekly",
    JumpUIId = 19,
    QuestReward = T.RT_10,
    Target = 10,
    TargetId = T.RT_12
  },
  [100001104] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001104",
    BattlePassTaskId = 100001104,
    BattlePassType = "Weekly",
    JumpUIId = 13,
    QuestReward = T.RT_13,
    Target = 1,
    TargetId = T.RT_14
  },
  [100001105] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001105",
    BattlePassTaskId = 100001105,
    BattlePassType = "Weekly",
    QuestReward = T.RT_10,
    Target = 1,
    TargetId = T.RT_15
  },
  [100001106] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001106",
    BattlePassTaskId = 100001106,
    BattlePassType = "Weekly",
    QuestReward = T.RT_13,
    Target = 10,
    TargetId = T.RT_6
  },
  [100001107] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001107",
    BattlePassTaskId = 100001107,
    BattlePassType = "Weekly",
    JumpUIId = 50,
    QuestReward = T.RT_10,
    Target = 3,
    TargetId = T.RT_16
  },
  [100001108] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001108",
    BattlePassTaskId = 100001108,
    BattlePassType = "Weekly",
    JumpUIId = 22,
    QuestReward = T.RT_13,
    Target = 1,
    TargetId = T.RT_17
  },
  [100001109] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001109",
    BattlePassTaskId = 100001109,
    BattlePassType = "Weekly",
    JumpUIId = 21,
    QuestReward = T.RT_18,
    Target = 6,
    TargetId = T.RT_8
  },
  [100001110] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001110",
    BattlePassTaskId = 100001110,
    BattlePassType = "Weekly",
    JumpUIId = 21,
    QuestReward = T.RT_18,
    Target = 12,
    TargetId = T.RT_8
  },
  [100001111] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001111",
    BattlePassTaskId = 100001111,
    BattlePassType = "Weekly",
    JumpUIId = 21,
    QuestReward = T.RT_18,
    Target = 18,
    TargetId = T.RT_8
  },
  [100001112] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001112",
    BattlePassTaskId = 100001112,
    BattlePassType = "Weekly",
    JumpUIId = 21,
    QuestReward = T.RT_18,
    Target = 24,
    TargetId = T.RT_8
  },
  [100001201] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001201",
    BattlePassTaskId = 100001201,
    BattlePassType = "Version",
    JumpUIId = 14,
    QuestReward = T.RT_19,
    Target = 1,
    TargetId = T.RT_20
  },
  [100001202] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001202",
    BattlePassTaskId = 100001202,
    BattlePassType = "Version",
    JumpUIId = 5,
    QuestReward = T.RT_21,
    Target = 40,
    TargetId = T.RT_22
  },
  [100001203] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001203",
    BattlePassTaskId = 100001203,
    BattlePassType = "Version",
    JumpUIId = 11,
    QuestReward = T.RT_23,
    Target = 1,
    TargetId = {70108}
  },
  [100001204] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001204",
    BattlePassTaskId = 100001204,
    BattlePassType = "Version",
    JumpUIId = 17,
    QuestReward = T.RT_23,
    Target = 1,
    TargetId = {70110}
  },
  [100001205] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001205",
    BattlePassTaskId = 100001205,
    BattlePassType = "Version",
    JumpUIId = 32,
    QuestReward = T.RT_23,
    Target = 1,
    TargetId = {1800101}
  },
  [100001206] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001206",
    BattlePassTaskId = 100001206,
    BattlePassType = "Version",
    QuestReward = T.RT_19,
    Target = 8,
    TargetId = T.RT_2
  },
  [100001207] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100002202",
    BattlePassTaskId = 100001207,
    BattlePassType = "Version",
    QuestReward = T.RT_19,
    Target = 1000,
    TargetId = {2200601},
    TaskUnlockTime = 1762135200
  },
  [100002001] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001001",
    BattlePassTaskId = 100002001,
    BattlePassType = "Daily",
    QuestReward = T.RT_1,
    Target = 1,
    TargetId = T.RT_2
  },
  [100002003] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001003",
    BattlePassTaskId = 100002003,
    BattlePassType = "Daily",
    JumpUIId = 31,
    QuestReward = T.RT_3,
    Target = 200,
    TargetId = T.RT_4
  },
  [100002004] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001004",
    BattlePassTaskId = 100002004,
    BattlePassType = "Daily",
    JumpUIId = 20,
    QuestReward = T.RT_3,
    Target = 3,
    TargetId = T.RT_5
  },
  [100002005] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001005",
    BattlePassTaskId = 100002005,
    BattlePassType = "Daily",
    QuestReward = T.RT_3,
    Target = 1,
    TargetId = T.RT_6
  },
  [100002006] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001006",
    BattlePassTaskId = 100002006,
    BattlePassType = "Daily",
    JumpUIId = 21,
    QuestReward = T.RT_7,
    Target = 1,
    TargetId = T.RT_8
  },
  [100002101] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001101",
    BattlePassTaskId = 100002101,
    BattlePassType = "Weekly",
    JumpUIId = 20,
    QuestReward = T.RT_9,
    Target = 30,
    TargetId = T.RT_5
  },
  [100002102] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001102",
    BattlePassTaskId = 100002102,
    BattlePassType = "Weekly",
    QuestReward = T.RT_10,
    Target = 300000,
    TargetId = T.RT_11
  },
  [100002103] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001103",
    BattlePassTaskId = 100002103,
    BattlePassType = "Weekly",
    JumpUIId = 19,
    QuestReward = T.RT_10,
    Target = 10,
    TargetId = T.RT_12
  },
  [100002104] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001104",
    BattlePassTaskId = 100002104,
    BattlePassType = "Weekly",
    JumpUIId = 13,
    QuestReward = T.RT_13,
    Target = 1,
    TargetId = T.RT_14
  },
  [100002105] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001105",
    BattlePassTaskId = 100002105,
    BattlePassType = "Weekly",
    QuestReward = T.RT_10,
    Target = 1,
    TargetId = T.RT_15
  },
  [100002106] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001106",
    BattlePassTaskId = 100002106,
    BattlePassType = "Weekly",
    QuestReward = T.RT_13,
    Target = 10,
    TargetId = T.RT_6
  },
  [100002107] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001107",
    BattlePassTaskId = 100002107,
    BattlePassType = "Weekly",
    JumpUIId = 50,
    QuestReward = T.RT_10,
    Target = 3,
    TargetId = T.RT_16
  },
  [100002108] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001108",
    BattlePassTaskId = 100002108,
    BattlePassType = "Weekly",
    JumpUIId = 22,
    QuestReward = T.RT_13,
    Target = 1,
    TargetId = T.RT_17
  },
  [100002109] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001109",
    BattlePassTaskId = 100002109,
    BattlePassType = "Weekly",
    JumpUIId = 21,
    QuestReward = T.RT_18,
    Target = 6,
    TargetId = T.RT_8
  },
  [100002110] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001110",
    BattlePassTaskId = 100002110,
    BattlePassType = "Weekly",
    JumpUIId = 21,
    QuestReward = T.RT_18,
    Target = 12,
    TargetId = T.RT_8
  },
  [100002111] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001111",
    BattlePassTaskId = 100002111,
    BattlePassType = "Weekly",
    JumpUIId = 21,
    QuestReward = T.RT_18,
    Target = 18,
    TargetId = T.RT_8
  },
  [100002112] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001112",
    BattlePassTaskId = 100002112,
    BattlePassType = "Weekly",
    JumpUIId = 21,
    QuestReward = T.RT_18,
    Target = 24,
    TargetId = T.RT_8
  },
  [100002201] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001201",
    BattlePassTaskId = 100002201,
    BattlePassType = "Version",
    JumpUIId = 14,
    QuestReward = T.RT_19,
    Target = 1,
    TargetId = T.RT_20
  },
  [100002202] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001202",
    BattlePassTaskId = 100002202,
    BattlePassType = "Version",
    JumpUIId = 5,
    QuestReward = T.RT_21,
    Target = 40,
    TargetId = T.RT_22
  },
  [100002206] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001206",
    BattlePassTaskId = 100002206,
    BattlePassType = "Version",
    QuestReward = T.RT_19,
    Target = 8,
    TargetId = T.RT_2
  },
  [100002207] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001207",
    BattlePassTaskId = 100002207,
    BattlePassType = "Version",
    QuestReward = T.RT_19,
    Target = 10,
    TargetId = {2200301},
    TaskUnlockTime = 1765159200
  },
  [100002208] = {
    BattlePassId = 100002,
    BattlePassTaskDes = "BattlePass_Task_Des_100001209",
    BattlePassTaskId = 100002208,
    BattlePassType = "Version",
    QuestReward = T.RT_19,
    Target = 1,
    TargetId = {2200501},
    TaskUnlockTime = 1764036000
  }
})
