local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("QuestTab", {
  [1] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_All.T_Tab_All'\n",
    QuestType = -1,
    TabId = 1,
    TabName = "UI_QUEST_SUBTAB_NAME_ALL"
  },
  [2] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_TaskMainLine.T_Tab_TaskMainLine'",
    QuestType = 1,
    TabId = 2,
    TabName = "UI_QUEST_SUBTAB_NAME_MAIN"
  },
  [3] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_TaskActivityMainLine.T_Tab_TaskActivityMainLine'",
    QuestType = 6,
    TabId = 3,
    TabName = "UI_QUEST_SUBTAB_NAME_Activity"
  },
  [4] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_TaskLimitedtimeActivity.T_Tab_TaskLimitedtimeActivity'",
    QuestType = 5,
    TabId = 4,
    TabName = "UI_QUEST_SUBTAB_NAME_LimitedtimeActivity"
  },
  [5] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_TaskSpecialSider.T_Tab_TaskSpecialSider'",
    QuestType = 4,
    TabId = 5,
    TabName = "UI_QUEST_SUBTAB_NAME_SpecialSlide"
  },
  [6] = {
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_TaskSider.T_Tab_TaskSider'",
    QuestType = 3,
    TabId = 6,
    TabName = "UI_QUEST_SUBTAB_NAME_SIDE"
  }
})
