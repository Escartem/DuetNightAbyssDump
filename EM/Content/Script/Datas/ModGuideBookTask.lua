local T = {}
T.RT_1 = {4}
T.RT_2 = {
  30601,
  30602,
  30603,
  30604,
  30605,
  30606
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ModGuideBookTask", {
  [1] = {
    DisplayId = "01",
    JumpTaskTypeParam = T.RT_1,
    QuestPhaseId = 1,
    Target = 1,
    TargetId = {30404},
    TaskDes = "UI_ModGuideBook_Task_Des_01",
    TaskId = 1,
    TaskName = "UI_ModGuideBook_Task_Title_Equip_01",
    TaskReward = {7301},
    TaskType = "Jump"
  },
  [2] = {
    DisplayId = "02",
    JumpTaskTypeParam = T.RT_1,
    QuestPhaseId = 1,
    Target = 1,
    TargetId = T.RT_2,
    TaskDes = "UI_ModGuideBook_Task_Des_02",
    TaskId = 2,
    TaskName = "UI_ModGuideBook_Task_Title_LevelUp_01",
    TaskReward = {7302},
    TaskType = "Jump"
  },
  [3] = {
    CollectTaskTypeParam = {21005, 21006},
    DisplayId = "03",
    NoRepeatField = "ModId",
    QuestPhaseId = 1,
    Target = 2,
    TargetId = {30201},
    TaskDes = "UI_ModGuideBook_Task_Des_03",
    TaskId = 3,
    TaskName = "UI_ModGuideBook_Task_Title_Collect_01",
    TaskReward = {7303},
    TaskType = "Collect"
  },
  [4] = {
    CollectTaskTypeParam = {22007, 22008},
    DisplayId = "04",
    NoRepeatField = "ModId",
    QuestPhaseId = 1,
    Target = 2,
    TargetId = {30202},
    TaskDes = "UI_ModGuideBook_Task_Des_04",
    TaskId = 4,
    TaskName = "UI_ModGuideBook_Task_Title_Collect_02",
    TaskReward = {7304},
    TaskType = "Collect"
  },
  [5] = {
    CollectTaskTypeParam = {23007, 23008},
    DisplayId = "05",
    NoRepeatField = "ModId",
    QuestPhaseId = 1,
    Target = 2,
    TargetId = {30203},
    TaskDes = "UI_ModGuideBook_Task_Des_05",
    TaskId = 5,
    TaskName = "UI_ModGuideBook_Task_Title_Collect_03",
    TaskReward = {7305},
    TaskType = "Collect"
  },
  [6] = {
    DisplayId = "06",
    JumpTaskTypeParam = T.RT_1,
    QuestPhaseId = 2,
    Target = 1,
    TargetId = {30405},
    TaskDes = "UI_ModGuideBook_Task_Des_06",
    TaskId = 6,
    TaskName = "UI_ModGuideBook_Task_Title_Equip_02",
    TaskReward = {7306},
    TaskType = "Jump"
  },
  [7] = {
    DisplayId = "07",
    JumpTaskTypeParam = T.RT_1,
    QuestPhaseId = 2,
    Target = 4,
    TargetId = T.RT_2,
    TaskDes = "UI_ModGuideBook_Task_Des_07",
    TaskId = 7,
    TaskName = "UI_ModGuideBook_Task_Title_LevelUp_02",
    TaskReward = {7307},
    TaskType = "Jump"
  },
  [8] = {
    CollectTaskTypeParam = {31215, 31216},
    DisplayId = "08",
    NoRepeatField = "ModId",
    QuestPhaseId = 2,
    Target = 2,
    TargetId = {30204},
    TaskDes = "UI_ModGuideBook_Task_Des_08",
    TaskId = 8,
    TaskName = "UI_ModGuideBook_Task_Title_Collect_04",
    TaskReward = {7308},
    TaskType = "Collect"
  },
  [9] = {
    CollectTaskTypeParam = {31217, 31218},
    DisplayId = "09",
    NoRepeatField = "ModId",
    QuestPhaseId = 2,
    Target = 2,
    TargetId = {30210},
    TaskDes = "UI_ModGuideBook_Task_Des_09",
    TaskId = 9,
    TaskName = "UI_ModGuideBook_Task_Title_Collect_05",
    TaskReward = {7314},
    TaskType = "Collect"
  },
  [10] = {
    CollectTaskTypeParam = {32004, 32005},
    DisplayId = "10",
    NoRepeatField = "ModId",
    QuestPhaseId = 2,
    Target = 2,
    TargetId = {30205},
    TaskDes = "UI_ModGuideBook_Task_Des_11",
    TaskId = 10,
    TaskName = "UI_ModGuideBook_Task_Title_Collect_07",
    TaskReward = {7309},
    TaskType = "Collect"
  },
  [11] = {
    CollectTaskTypeParam = {33004, 33005},
    DisplayId = "11",
    NoRepeatField = "ModId",
    QuestPhaseId = 3,
    Target = 2,
    TargetId = {30206},
    TaskDes = "UI_ModGuideBook_Task_Des_10",
    TaskId = 11,
    TaskName = "UI_ModGuideBook_Task_Title_Collect_06",
    TaskReward = {7310},
    TaskType = "Collect"
  },
  [12] = {
    CollectTaskTypeParam = {
      31301,
      31201,
      31202,
      31203,
      31204
    },
    DisplayId = "12",
    NoRepeatField = "ModId",
    QuestPhaseId = 3,
    Target = 5,
    TargetId = {30207},
    TaskDes = "UI_ModGuideBook_Task_Des_12",
    TaskId = 12,
    TaskName = "UI_ModGuideBook_Task_Title_Collect_08",
    TaskReward = {7311},
    TaskType = "Collect"
  },
  [13] = {
    CollectTaskTypeParam = {32301, 32302},
    DisplayId = "13",
    NoRepeatField = "ModId",
    QuestPhaseId = 3,
    Target = 2,
    TargetId = {30208},
    TaskDes = "UI_ModGuideBook_Task_Des_13",
    TaskId = 13,
    TaskName = "UI_ModGuideBook_Task_Title_Collect_09",
    TaskReward = {7312},
    TaskType = "Collect"
  },
  [14] = {
    CollectTaskTypeParam = {33311, 33331},
    DisplayId = "14",
    NoRepeatField = "ModId",
    QuestPhaseId = 3,
    Target = 2,
    TargetId = {30209},
    TaskDes = "UI_ModGuideBook_Task_Des_14",
    TaskId = 14,
    TaskName = "UI_ModGuideBook_Task_Title_Collect_10",
    TaskReward = {7313},
    TaskType = "Collect"
  }
})
