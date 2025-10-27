local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("KeyboardMap", {
  A = {
    ActionName = "A",
    ActionNameText = "UI_Keyboard_Map_A",
    AxisActionName = "MoveRight",
    CanChanged = true,
    IsShowInSetting = true,
    Key = "A",
    Scale = "-1.0",
    SortId = 32
  },
  ActiveGuide = {
    ActionName = "ActiveGuide",
    ActionNameText = "UI_Keyboard_Map_ActiveGuide",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "V",
    SortId = 26
  },
  Attack = {
    ActionName = "Attack",
    ActionNameText = "UI_Keyboard_Map_Attack",
    CanChanged = true,
    GamePadKey = "LeftMouseButton",
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "LeftMouseButton",
    SortId = 1
  },
  Avoid = {
    ActionName = "Avoid",
    ActionNameText = "UI_Keyboard_Map_Avoid",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "LeftShift",
    SortId = 8
  },
  BulletJump = {
    ActionName = "BulletJump",
    ActionNameText = "UI_CTL_BulletJump",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "Four",
    SortId = 9
  },
  ChangeCameraLengthDown = {
    ActionName = "ChangeCameraLengthDown",
    IsActionMapping = true,
    IsShowInSetting = false,
    Key = "MouseScrollDown",
    SortId = 37
  },
  ChangeCameraLengthUp = {
    ActionName = "ChangeCameraLengthUp",
    IsActionMapping = true,
    IsShowInSetting = false,
    Key = "MouseScrollUp",
    SortId = 38
  },
  ChargeBullet = {
    ActionName = "ChargeBullet",
    ActionNameText = "UI_Keyboard_Map_ChargeBullet",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "R",
    SortId = 11
  },
  D = {
    ActionName = "D",
    ActionNameText = "UI_Keyboard_Map_D",
    AxisActionName = "MoveRight",
    CanChanged = true,
    IsShowInSetting = true,
    Key = "D",
    Scale = "1.0",
    SortId = 34
  },
  DownSelect = {
    ActionName = "DownSelect",
    ActionNameText = "UI_Keyboard_DownSelect",
    IsShowInSetting = true,
    Key = "MouseScrollDown",
    SortId = 36
  },
  Fire = {
    ActionName = "Fire",
    ActionNameText = "UI_Keyboard_Map_Fire",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "RightMouseButton",
    SortId = 2
  },
  Interactive = {
    ActionName = "Interactive",
    ActionNameText = "UI_Keyboard_Map_Interactive",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "F",
    SortId = 12
  },
  ItemDetail = {
    ActionName = "ItemDetail",
    ActionNameText = "UI_Keyboard_Map_ItemDetail",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "Tab",
    SortId = 25
  },
  Jump = {
    ActionName = "Jump",
    ActionNameText = "UI_Keyboard_Map_Jump",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "SpaceBar",
    SortId = 6
  },
  LockMonster = {
    ActionName = "LockMonster",
    ActionNameText = "UI_Keyboard_Map_LockMonster",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "MiddleMouseButton",
    SortId = 29
  },
  OpenArmory = {
    ActionName = "OpenArmory",
    ActionNameText = "MAIN_UI_ARMORY",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "C",
    SortId = 18
  },
  OpenBag = {
    ActionName = "OpenBag",
    ActionNameText = "MAIN_UI_BAG",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "B",
    SortId = 13
  },
  OpenBattlePass = {
    ActionName = "OpenBattlePass",
    ActionNameText = "MAIN_UI_BATTLEPASS",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "F2",
    SortId = 21
  },
  OpenBattleWheel = {
    ActionName = "OpenBattleWheel",
    ActionNameText = "MAIN_UI_BATTLEWHEEL",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "T",
    SortId = 23
  },
  OpenChat = {
    ActionName = "OpenChat",
    ActionNameText = "MAIN_UI_CHAT",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "Enter",
    SortId = 17
  },
  OpenEvent = {
    ActionName = "OpenEvent",
    ActionNameText = "MAIN_UI_GAMEEVENT",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "F1",
    SortId = 20
  },
  OpenForge = {
    ActionName = "OpenForge",
    ActionNameText = "MAIN_UI_FORGE",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "H",
    SortId = 19
  },
  OpenGacha = {
    ActionName = "OpenGacha",
    ActionNameText = "MAIN_UI_GACHA",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "F3",
    SortId = 22
  },
  OpenGuideBook = {
    ActionName = "OpenGuideBook",
    ActionNameText = "MAIN_UI_GUIDEBOOK",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "G",
    SortId = 24
  },
  OpenMap = {
    ActionName = "OpenMap",
    ActionNameText = "MAIN_UI_MAP",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "M",
    SortId = 16
  },
  OpenMenu = {
    ActionName = "OpenMenu",
    ActionNameText = "MAIN_UI_MENU",
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "Escape",
    SortId = 30
  },
  OpenPlay = {
    ActionName = "OpenPlay",
    ActionNameText = "MAIN_UI_PLAY",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "L",
    SortId = 14
  },
  OpenTask = {
    ActionName = "OpenTask",
    ActionNameText = "MAIN_UI_QUEST",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "J",
    SortId = 15
  },
  QuitChallenge = {
    ActionName = "QuitChallenge",
    ActionNameText = "UI_Keyboard_Map_QuitChallenge",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "P",
    SortId = 27
  },
  Recovery = {
    ActionName = "Recovery",
    ActionNameText = "UI_Keyboard_Map_Recovery",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "X",
    SortId = 10
  },
  S = {
    ActionName = "S",
    ActionNameText = "UI_Keyboard_Map_S",
    AxisActionName = "MoveForward",
    CanChanged = true,
    IsShowInSetting = true,
    Key = "S",
    Scale = "-1.0",
    SortId = 33
  },
  ShowCursor = {
    ActionName = "ShowCursor",
    ActionNameText = "UI_Keyboard_Map_ShowCursor",
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "LeftAlt",
    SortId = 28
  },
  ShowTeamInfo = {
    ActionName = "ShowTeamInfo",
    ActionNameText = "UI_Keyboard_TeamInfo",
    IsActionMapping = true,
    IsShowInSetting = false,
    Key = "F4",
    SortId = 45
  },
  Skill1 = {
    ActionName = "Skill1",
    ActionNameText = "UI_Keyboard_Map_Skill1",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "E",
    SortId = 3
  },
  Skill2 = {
    ActionName = "Skill2",
    ActionNameText = "UI_Keyboard_Map_Skill2",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "Q",
    SortId = 4
  },
  Skill3 = {
    ActionName = "Skill3",
    ActionNameText = "UI_Keyboard_Map_Skill3",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "Z",
    SortId = 5
  },
  Slide = {
    ActionName = "Slide",
    ActionNameText = "UI_Keyboard_Map_Slide",
    CanChanged = true,
    IsActionMapping = true,
    IsShowInSetting = true,
    Key = "LeftControl",
    SortId = 7
  },
  StoryInteractive = {
    ActionName = "StoryInteractive",
    IsActionMapping = true,
    IsShowInSetting = false,
    Key = "F",
    SortId = 51
  },
  StoryInteractiveClick = {
    ActionName = "StoryInteractiveClick",
    IsActionMapping = true,
    IsShowInSetting = false,
    Key = "SpaceBar",
    SortId = 50
  },
  StoryInteractiveClose = {
    ActionName = "StoryInteractiveClose",
    IsActionMapping = true,
    IsShowInSetting = false,
    Key = "Escape",
    SortId = 49
  },
  TalkAutoPlay = {
    ActionName = "TalkAutoPlay",
    IsActionMapping = true,
    IsShowInSetting = false,
    Key = "Tab",
    SortId = 39
  },
  TalkClick = {
    ActionName = "TalkClick",
    IsActionMapping = true,
    IsShowInSetting = false,
    Key = "SpaceBar",
    SortId = 40
  },
  TalkDownSelect = {
    ActionName = "TalkDownSelect",
    IsActionMapping = true,
    IsShowInSetting = false,
    Key = "S",
    SortId = 41
  },
  TalkExit = {
    ActionName = "TalkExit",
    IsActionMapping = true,
    IsShowInSetting = false,
    Key = "Escape",
    SortId = 48
  },
  TalkOption = {
    ActionName = "TalkOption",
    IsActionMapping = true,
    IsShowInSetting = false,
    Key = "F",
    SortId = 42
  },
  TalkReview = {
    ActionName = "TalkReview",
    IsActionMapping = true,
    IsShowInSetting = false,
    Key = "V",
    SortId = 47
  },
  TalkSkip = {
    ActionName = "TalkSkip",
    IsActionMapping = true,
    IsShowInSetting = false,
    Key = "SpaceBar",
    SortId = 43
  },
  TalkUpSelect = {
    ActionName = "TalkUpSelect",
    IsActionMapping = true,
    IsShowInSetting = false,
    Key = "W",
    SortId = 44
  },
  TalkWiki = {
    ActionName = "TalkWiki",
    IsActionMapping = true,
    IsShowInSetting = false,
    Key = "H",
    SortId = 46
  },
  UpSelect = {
    ActionName = "UpSelect",
    ActionNameText = "UI_Keyboard_UpSelect",
    IsShowInSetting = true,
    Key = "MouseScrollUp",
    SortId = 35
  },
  W = {
    ActionName = "W",
    ActionNameText = "UI_Keyboard_Map_W",
    AxisActionName = "MoveForward",
    CanChanged = true,
    IsShowInSetting = true,
    Key = "W",
    Scale = "1.0",
    SortId = 31
  }
})
