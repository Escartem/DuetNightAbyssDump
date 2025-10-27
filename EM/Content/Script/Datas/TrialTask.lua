local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("TrialTask", {
  [1] = {
    IsKillMonsterTask = false,
    TaskId = 1,
    TextMap = "DUNGEONSINGLE",
    TextTitle = "UI_CharTrial_Title",
    TexturePath = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_MainMission.T_Gp_MainMission",
    WidgetPath = "Guide_Point"
  },
  [2] = {
    IsKillMonsterTask = true,
    MonsterSpawnId = {9000101},
    TargetNum = 40,
    TaskId = 2,
    TextMap = "TARGET_DUNGEON_TRAINING_102",
    TextTitle = "UI_CharTrial_Title",
    TexturePath = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_DefeatMission.T_Gp_DefeatMission",
    WidgetPath = "Guide_Point"
  },
  [3] = {
    IsKillMonsterTask = false,
    TaskId = 3,
    TextMap = "TARGET_DUNGEON_103",
    TextTitle = "UI_CharTrial_Title",
    TexturePath = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Evacuation.T_Gp_Evacuation",
    WidgetPath = "Guide_Point"
  }
})
