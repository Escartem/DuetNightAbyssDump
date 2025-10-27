local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("BattlePassTab", {
  BattlePassMission = {
    Sequence = 90,
    TabIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_BattlePass_Task.T_Tab_BattlePass_Task",
    TabName = "UI_BattlePass_MissionTab",
    WidgetUI = "BattlePassMission"
  },
  BattlePassPetSelection = {
    Sequence = 80,
    TabIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_BattlePass_ChoosePet.T_Tab_BattlePass_ChoosePet",
    TabName = "UI_BattlePass_PetSelectionTab",
    WidgetUI = "BattlePassPetSelection"
  },
  BattlePassReward = {
    Sequence = 100,
    TabIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_BattlePass_Reward.T_Tab_BattlePass_Reward",
    TabName = "UI_BattlePass_RewardTab",
    WidgetUI = "BattlePassReward"
  }
})
