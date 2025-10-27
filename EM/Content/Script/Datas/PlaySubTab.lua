local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PlaySubTab", {
  AbyssMain = {
    BgImage = "/Game/UI/Texture/Static/Image/Max2048/T_Activity_Abyss.T_Activity_Abyss",
    EnterImage = "/Game/UI/Texture/Static/Image/Max2048/T_Activity_Abyss.T_Activity_Abyss",
    JumpUIId = 14,
    RewardViewId = 1030021,
    Sequence = 90,
    ShopJumpId = 28,
    SubTabDes = "UI_Abyss_Des",
    SubTabName = "Abyss_entry",
    SubTabUnlockRuleId = "Abyss",
    SubWidgetUI = "AbyssMain",
    TitleBp = "/Game/UI/WBP/Abyss/Widget/Title/WBP_Abyss_Title01.WBP_Abyss_Title01",
    WidgetUI = "PlayCommon"
  },
  DailyMain = {
    Sequence = 90,
    SubTabName = "MAIN_UI_DAILYGOAL",
    SubTabUnlockRuleId = "DailyGoal",
    SubWidgetUI = "DailyMain",
    WidgetUI = "PlayTaskRoot"
  },
  DeputeNightBook = {
    Sequence = 90,
    SubTabName = "UI_Dungeon_Tab_ModDungeon",
    SubTabUnlockRuleId = "ModDungeon",
    SubWidgetUI = "DeputeNightBook",
    WidgetUI = "NewDeputeRoot"
  },
  DeputeWalnut = {
    Sequence = 80,
    SubTabName = "UI_Dungeon_Tab_WalnutDungeon",
    SubTabUnlockRuleId = "WalnutBag",
    SubWidgetUI = "DeputeWalnut",
    WidgetUI = "NewDeputeRoot"
  },
  NewDeputeRoot = {
    Sequence = 100,
    SubTabName = "UI_Dungeon_TabName",
    SubTabUnlockRuleId = "Play",
    SubWidgetUI = "NewDeputeRoot",
    WidgetUI = "NewDeputeRoot"
  },
  RougeMain = {
    BgImage = "/Game/UI/Texture/Dynamic/Image/Permanent/T_Permanent_Rouge.T_Permanent_Rouge",
    EnterImage = "/Game/UI/Texture/Dynamic/Image/Permanent/T_Permanent_Rouge.T_Permanent_Rouge",
    RewardViewId = 1030011,
    Sequence = 100,
    ShopJumpId = 55,
    SubTabDes = "UI_Rouge_Des",
    SubTabName = "MAIN_UI_ROUGE",
    SubTabUnlockRuleId = "Rouge",
    SubWidgetUI = "RougeMain",
    TitleBp = "/Game/UI/WBP/RougeLike/Widget/Title/WBP_Rouge_LightLessChasm.WBP_Rouge_LightLessChasm",
    WidgetUI = "PlayCommon"
  },
  StarterQuest = {
    Sequence = 100,
    SubTabName = "MAIN_UI_STARTERQUEST",
    SubTabUnlockRuleId = "StarterQuest",
    SubWidgetUI = "StarterQuest",
    WidgetUI = "PlayTaskRoot"
  },
  WeeklySelectDungeon = {
    Sequence = 70,
    SubTabName = "DUNGEON_WEEK",
    SubTabUnlockRuleId = "Match",
    SubWidgetUI = "WeeklySelectDungeon",
    WidgetUI = "NewDeputeRoot"
  }
})
