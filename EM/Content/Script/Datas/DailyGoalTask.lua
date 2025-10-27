local T = {}
T.RT_1 = {7201}
T.RT_2 = {7203}
T.RT_3 = {7209}
T.RT_4 = {7207}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("DailyGoalTask", {
  [10000101] = {
    DailyGoalTaskId = 10000101,
    DailyTasktDes = "DailyTaskDes_10000101",
    IsFixed = true,
    QuestReward = T.RT_1,
    Target = 1,
    TargetId = {201}
  },
  [10000102] = {
    DailyGoalTaskId = 10000102,
    DailyTasktDes = "DailyTaskDes_10000102",
    EntryCondition = 120,
    JumpUIId = 20,
    QuestReward = T.RT_2,
    RandomWeight = 20,
    Target = 3,
    TargetId = {30101}
  },
  [10000103] = {
    DailyGoalTaskId = 10000103,
    DailyTasktDes = "DailyTaskDes_10000103",
    JumpUIId = 47,
    QuestReward = T.RT_1,
    RandomWeight = 20,
    Target = 1,
    TargetId = {
      30610,
      30611,
      30612,
      30613,
      30614
    }
  },
  [10000105] = {
    DailyGoalTaskId = 10000105,
    DailyTasktDes = "DailyTaskDes_10000105",
    JumpUIId = 19,
    QuestReward = T.RT_2,
    RandomWeight = 60,
    Target = 1,
    TargetId = {50930}
  },
  [10000106] = {
    DailyGoalTaskId = 10000106,
    DailyTasktDes = "DailyTaskDes_10000106",
    EntryCondition = 125,
    IsFixed = true,
    JumpUIId = 19,
    QuestReward = T.RT_1,
    Target = 50,
    TargetId = {2000}
  },
  [10000107] = {
    DailyGoalTaskId = 10000107,
    DailyTasktDes = "DailyTaskDes_10000107",
    EntryCondition = 120,
    IsFixed = true,
    JumpUIId = 13,
    QuestReward = T.RT_3,
    Target = 1,
    TargetId = {9000}
  },
  [10000108] = {
    DailyGoalTaskId = 10000108,
    DailyTasktDes = "DailyTaskDes_10000108",
    EntryCondition = 120,
    JumpUIId = 22,
    QuestReward = T.RT_4,
    RandomWeight = 20,
    Target = 1,
    TargetId = {2300101}
  },
  [10000109] = {
    DailyGoalTaskId = 10000109,
    DailyTasktDes = "DailyTaskDes_10000109",
    EntryCondition = 125,
    JumpUIId = 63,
    QuestReward = T.RT_4,
    RandomWeight = 20,
    Target = 1,
    TargetId = {50932}
  },
  [10000110] = {
    DailyGoalTaskId = 10000110,
    DailyTasktDes = "DailyTaskDes_10000110",
    QuestReward = T.RT_2,
    RandomWeight = 20,
    Target = 1,
    TargetId = {10051601}
  },
  [10000111] = {
    DailyGoalTaskId = 10000111,
    DailyTasktDes = "DailyTaskDes_10000111",
    EntryCondition = 115,
    QuestReward = T.RT_2,
    RandomWeight = 20,
    Target = 1,
    TargetId = {10301}
  },
  [10000112] = {
    DailyGoalTaskId = 10000112,
    DailyTasktDes = "DailyTaskDes_10000112",
    JumpUIId = 30,
    QuestReward = T.RT_1,
    RandomWeight = 20,
    Target = 1,
    TargetId = {90105}
  },
  [10000113] = {
    DailyGoalTaskId = 10000113,
    DailyTasktDes = "DailyTaskDes_10000113",
    EntryCondition = 125,
    QuestReward = T.RT_1,
    RandomWeight = 20,
    Target = 1,
    TargetId = {2100101}
  },
  [10000114] = {
    DailyGoalTaskId = 10000114,
    DailyTasktDes = "DailyTaskDes_10000114",
    JumpUIId = 51,
    QuestReward = T.RT_1,
    RandomWeight = 20,
    Target = 1,
    TargetId = {2000101}
  },
  [10000115] = {
    DailyGoalTaskId = 10000115,
    DailyTasktDes = "DailyTaskDes_10000115",
    ExitCondition = 125,
    JumpUIId = 49,
    QuestReward = T.RT_1,
    RandomWeight = 20,
    Target = 1,
    TargetId = {
      40301,
      40302,
      40303,
      40304,
      40305,
      40306
    }
  },
  [10000116] = {
    DailyGoalTaskId = 10000116,
    DailyTasktDes = "DailyTaskDes_10000116",
    EntryCondition = 125,
    IsFixed = true,
    QuestReward = {7205},
    Target = 1,
    TargetId = {1900101}
  },
  [10000117] = {
    DailyGoalTaskId = 10000117,
    DailyTasktDes = "DailyTaskDes_10000117",
    EntryCondition = 125,
    QuestReward = {7202},
    RandomWeight = 20,
    Target = 1,
    TargetId = {50931}
  },
  [10000118] = {
    DailyGoalTaskId = 10000118,
    DailyTasktDes = "DailyTaskDes_10000118",
    IsFixed = true,
    QuestReward = T.RT_3,
    Target = 1,
    TargetId = {1070301, 1070304}
  },
  [10000119] = {
    DailyGoalTaskId = 10000119,
    DailyTasktDes = "DailyTaskDes_10000119",
    IsFixed = true,
    QuestReward = {7204},
    Target = 1,
    TargetId = {1070302, 1070303}
  },
  [10000120] = {
    DailyGoalTaskId = 10000120,
    DailyTasktDes = "DailyTaskDes_10000120",
    QuestReward = T.RT_1,
    RandomWeight = 20,
    Target = 3,
    TargetId = {1010501}
  }
})
