local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("AfterLoadingFSM", {
  BeginState = {
    FSMState = "BeginState",
    NextState = "JumpToRogueMain"
  },
  DungeonUI = {
    FSMState = "DungeonUI",
    NextState = "OpenForcePopup"
  },
  DynamicQuest = {
    FSMState = "DynamicQuest",
    NextState = "EndState"
  },
  EndState = {FSMState = "EndState"},
  GameplayReward = {
    FSMState = "GameplayReward",
    NextState = "SystemUnlock"
  },
  JumpToRogueMain = {
    FSMState = "JumpToRogueMain",
    NextState = "GameplayReward"
  },
  MainLineQuest = {
    FSMState = "MainLineQuest",
    NextState = "DynamicQuest"
  },
  OpenForcePopup = {
    FSMState = "OpenForcePopup",
    NextState = "MainLineQuest"
  },
  SystemUnlock = {
    FSMState = "SystemUnlock",
    NextState = "TriggerGuide"
  },
  TriggerGuide = {
    FSMState = "TriggerGuide",
    NextState = "DungeonUI"
  }
})
