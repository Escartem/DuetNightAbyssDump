local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("QuestTypeIcon", {
  [1] = {
    NotTrackingIcon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_TaskMainLine.T_Interactive_TaskMainLine'",
    QuestChainType = 1,
    TrackingIcon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_MainMission.T_Gp_MainMission"
  },
  [2] = {
    NotTrackingIcon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_TaskDaily.T_Interactive_TaskDaily'",
    QuestChainType = 2,
    TrackingIcon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_MainMission.T_Gp_MainMission"
  },
  [3] = {
    NotTrackingIcon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_TaskSider.T_Interactive_TaskSider'",
    QuestChainType = 3,
    TrackingIcon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SideMission.T_Gp_SideMission"
  },
  [4] = {
    NotTrackingIcon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_TaskSpecialSider.T_Interactive_TaskSpecialSider'",
    QuestChainType = 4,
    TrackingIcon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SpSideMission.T_Gp_SpSideMission"
  },
  [5] = {
    NotTrackingIcon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_TaskLimitedtimeActivity.T_Interactive_TaskLimitedtimeActivity'",
    QuestChainType = 5,
    TrackingIcon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_LTMission.T_Gp_LTMission"
  },
  [6] = {
    NotTrackingIcon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_TaskActivityMainLine.T_Interactive_TaskActivityMainLine'",
    QuestChainType = 6,
    TrackingIcon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_EventMainMission.T_Gp_EventMainMission"
  }
})
