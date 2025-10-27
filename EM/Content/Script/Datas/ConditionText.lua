local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ConditionText", {
  AvatarStatus = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "AvatarStatus"
  },
  CharEquipRarityLevelModCount = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "CharEquipRarityLevelModCount"
  },
  ConditionalRewardEventEnd = {
    ConditionLogic = "S",
    ConditionType = "ConditionalRewardEventEnd"
  },
  ConstantBool = {
    ConditionLogic = "S",
    ConditionType = "ConstantBool"
  },
  CurrentCharId = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "CurrentCharId"
  },
  DailyLoginEnd = {
    ConditionLogic = "S",
    ConditionType = "DailyLoginEnd"
  },
  DialogueHasRead = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "DialogueHasRead"
  },
  DualTerminalLogin = {
    ConditionLogic = "S",
    ConditionType = "DualTerminalLogin"
  },
  DungeonComplete = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "DungeonComplete"
  },
  DungeonType = {
    AutoTrigger = true,
    ConditionLogic = "S&DS",
    ConditionType = "DungeonType"
  },
  DynamicEventCompleteTimes = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "DynamicEventCompleteTimes"
  },
  EquipPetId = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "EquipPetId"
  },
  ExploreGroup = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "ExploreGroup"
  },
  FollowCommunityComplete = {
    ConditionLogic = "S",
    ConditionType = "FollowCommunityComplete"
  },
  HardBossComplete = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "HardBossComplete"
  },
  HaveResource = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "HaveResource"
  },
  HaveResourceSType = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "HaveResourceSType"
  },
  ImprShopUnlock = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "ImprShopUnlock"
  },
  Impression = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "Impression"
  },
  InDungeon = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "InDungeon"
  },
  InHardBossDifficulty = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "InHardBossDifficulty"
  },
  InStoryMode = {
    AutoTrigger = true,
    ConditionLogic = "C",
    ConditionType = "InStoryMode"
  },
  IsSpecialQuest = {
    ConditionType = "IsSpecialQuest"
  },
  LoginDay = {ConditionLogic = "S", ConditionType = "LoginDay"},
  MechanismState = {
    AutoTrigger = true,
    ConditionLogic = "DS",
    ConditionType = "MechanismState"
  },
  OwnCharIdAndLevel = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "OwnCharIdAndLevel"
  },
  PhaseQuestEnd = {
    ConditionLogic = "S",
    ConditionType = "PhaseQuestEnd"
  },
  PlayerInBattlePass = {
    ConditionLogic = "C",
    ConditionType = "PlayerInBattlePass"
  },
  PlayerLevelMax = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "PlayerLevelMax"
  },
  PlayerLevelMin = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionName = "UI_QUEST_CONDITION_PLAYERLEVEL",
    ConditionType = "PlayerLevelMin"
  },
  PlayerLvEventEnd = {
    ConditionLogic = "S",
    ConditionType = "PlayerLvEventEnd"
  },
  Quest = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "Quest"
  },
  QuestChain = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionName = "UI_QUEST_CONDITION_FINISHQUEST",
    ConditionType = "QuestChain"
  },
  RougeLikeComplete = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "RougeLikeComplete"
  },
  RougeLikeDifficulty = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "RougeLikeDifficulty"
  },
  RougeLikeGroupMax = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "RougeLikeGroupMax"
  },
  RougeLikeGroupMin = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "RougeLikeGroupMin"
  },
  RougeLikeManual = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "RougeLikeManual"
  },
  RougeLikePassRoom = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "RougeLikePassRoom"
  },
  RougeLikePreAward = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "RougeLikePreAward"
  },
  RougeLikePreRoom = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "RougeLikePreRoom"
  },
  SubRegionType = {
    AutoTrigger = true,
    ConditionLogic = "S",
    ConditionType = "SubRegionType"
  },
  TeleportIsUnlock = {
    ConditionLogic = "C",
    ConditionType = "TeleportIsUnlock"
  },
  TestClientCon = {
    ConditionLogic = "C",
    ConditionType = "TestClientCon"
  },
  TimeArrived = {
    ConditionLogic = "S",
    ConditionType = "TimeArrived"
  },
  VarEqual = {ConditionLogic = "S", ConditionType = "VarEqual"}
})
