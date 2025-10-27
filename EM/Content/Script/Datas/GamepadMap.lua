local T = {}
T.RT_1 = {"LB", "RS"}
T.RT_2 = {"B", "LS"}
T.RT_3 = {"X"}
T.RT_4 = {"RB"}
T.RT_5 = {"B"}
T.RT_6 = {"A"}
T.RT_7 = {"LS"}
T.RT_8 = {"LB", "Down"}
T.RT_9 = {"B", "Down"}
T.RT_10 = {"LB", "Up"}
T.RT_11 = {"B", "Up"}
T.RT_12 = {
  [1] = "Fire",
  [2] = "Fire",
  [3] = "Fire",
  [4] = "Fire"
}
T.RT_13 = {"LB", "RT"}
T.RT_14 = {"B", "RT"}
T.RT_15 = {"Down"}
T.RT_16 = {
  [1] = T.RT_15,
  [2] = T.RT_15,
  [3] = T.RT_15,
  [4] = T.RT_15
}
T.RT_17 = {
  [1] = "DPad_Down",
  [2] = "DPad_Down",
  [3] = "DPad_Down",
  [4] = "DPad_Down"
}
T.RT_18 = {"RT"}
T.RT_19 = {"Right"}
T.RT_20 = {
  [1] = T.RT_19,
  [2] = T.RT_19,
  [3] = T.RT_19,
  [4] = T.RT_19
}
T.RT_21 = {
  [1] = "DPad_Right",
  [2] = "DPad_Right",
  [3] = "DPad_Right",
  [4] = "DPad_Right"
}
T.RT_22 = {"LB"}
T.RT_23 = {"Y"}
T.RT_24 = {
  [1] = T.RT_23,
  [2] = T.RT_23,
  [3] = T.RT_23,
  [4] = T.RT_23
}
T.RT_25 = {
  [1] = "FaceButton_Top",
  [2] = "FaceButton_Top",
  [3] = "FaceButton_Top",
  [4] = "FaceButton_Top"
}
T.RT_26 = {"LB", "Right"}
T.RT_27 = {"B", "Right"}
T.RT_28 = {"RS"}
T.RT_29 = {"Right", "X"}
T.RT_30 = {"Right", "B"}
T.RT_31 = {"Right", "LB"}
T.RT_32 = {"LT"}
T.RT_33 = {"View"}
T.RT_34 = {
  [1] = T.RT_33,
  [2] = T.RT_33,
  [3] = T.RT_33,
  [4] = T.RT_33
}
T.RT_35 = {"Right", "Y"}
T.RT_36 = {"Right", "RT"}
T.RT_37 = {"Right", "RB"}
T.RT_38 = {"LB", "Left"}
T.RT_39 = {"B", "Left"}
T.RT_40 = {
  [1] = "Special_Left",
  [2] = "Special_Left",
  [3] = "Special_Left",
  [4] = "Special_Left"
}
T.RT_41 = {"Menu"}
T.RT_42 = {"Right", "A"}
T.RT_43 = {"Right", "LT"}
T.RT_44 = {"Right", "RS"}
T.RT_45 = {"Left"}
T.RT_46 = {
  [1] = T.RT_45,
  [2] = T.RT_45,
  [3] = T.RT_45,
  [4] = T.RT_45
}
T.RT_47 = {
  [1] = "DPad_Left",
  [2] = "DPad_Left",
  [3] = "DPad_Left",
  [4] = "DPad_Left"
}
T.RT_48 = {"LB", "X"}
T.RT_49 = {"B", "LB"}
T.RT_50 = {"LB", "Y"}
T.RT_51 = {"B", "RB"}
T.RT_52 = {"LB", "B"}
T.RT_53 = {"B", "Y"}
T.RT_54 = {
  [1] = T.RT_6,
  [2] = T.RT_6,
  [3] = T.RT_6,
  [4] = T.RT_6
}
T.RT_55 = {
  [1] = "FaceButton_Bottom",
  [2] = "FaceButton_Bottom",
  [3] = "FaceButton_Bottom",
  [4] = "FaceButton_Bottom"
}
T.RT_56 = {
  [1] = T.RT_5,
  [2] = T.RT_5,
  [3] = T.RT_5,
  [4] = T.RT_5
}
T.RT_57 = {
  [1] = "FaceButton_Right",
  [2] = "FaceButton_Right",
  [3] = "FaceButton_Right",
  [4] = "FaceButton_Right"
}
T.RT_58 = {"Up"}
T.RT_59 = {
  [1] = T.RT_58,
  [2] = T.RT_58,
  [3] = T.RT_58,
  [4] = T.RT_58
}
T.RT_60 = {
  [1] = "DPad_Up",
  [2] = "DPad_Up",
  [3] = "DPad_Up",
  [4] = "DPad_Up"
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("GamepadMap", {
  ActiveGuide = {
    ActionName = "ActiveGuide",
    BattleInput = {
      [1] = "LockMonster",
      [2] = "LockMonster",
      [3] = "BulletJump",
      [4] = "BulletJump"
    },
    GamepadIcon = {
      [1] = T.RT_1,
      [2] = T.RT_1,
      [3] = T.RT_2,
      [4] = T.RT_2
    }
  },
  Attack = {
    ActionName = "Attack",
    GamepadIcon = {
      [1] = T.RT_3,
      [2] = T.RT_4,
      [3] = T.RT_3,
      [4] = T.RT_3
    },
    GamepadKey = {
      [1] = "FaceButton_Left",
      [2] = "RightShoulder",
      [3] = "FaceButton_Left",
      [4] = "FaceButton_Left"
    }
  },
  Avoid = {
    ActionName = "Avoid",
    GamepadIcon = {
      [1] = T.RT_5,
      [2] = T.RT_5,
      [3] = T.RT_6,
      [4] = T.RT_4
    },
    GamepadKey = {
      [1] = "FaceButton_Right",
      [2] = "FaceButton_Right",
      [3] = "FaceButton_Bottom",
      [4] = "RightShoulder"
    }
  },
  BulletJump = {
    ActionName = "BulletJump",
    GamepadIcon = {
      [1] = T.RT_7,
      [2] = T.RT_7,
      [3] = T.RT_7,
      [4] = T.RT_7
    },
    GamepadKey = {
      [1] = "LeftThumbstick",
      [2] = "LeftThumbstick",
      [3] = "LeftThumbstick",
      [4] = "LeftThumbstick"
    }
  },
  ChangeCameraLengthDown = {
    ActionName = "ChangeCameraLengthDown",
    BattleInput = {
      [1] = "DownSelect",
      [2] = "DownSelect",
      [3] = "DownSelect",
      [4] = "DownSelect"
    },
    GamepadIcon = {
      [1] = T.RT_8,
      [2] = T.RT_8,
      [3] = T.RT_9,
      [4] = T.RT_9
    }
  },
  ChangeCameraLengthUp = {
    ActionName = "ChangeCameraLengthUp",
    BattleInput = {
      [1] = "UpSelect",
      [2] = "UpSelect",
      [3] = "UpSelect",
      [4] = "UpSelect"
    },
    GamepadIcon = {
      [1] = T.RT_10,
      [2] = T.RT_10,
      [3] = T.RT_11,
      [4] = T.RT_11
    }
  },
  ChargeBullet = {
    ActionName = "ChargeBullet",
    BattleInput = T.RT_12,
    GamepadIcon = {
      [1] = T.RT_13,
      [2] = T.RT_13,
      [3] = T.RT_14,
      [4] = T.RT_14
    }
  },
  DownSelect = {
    ActionName = "DownSelect",
    GamepadIcon = T.RT_16,
    GamepadKey = T.RT_17
  },
  Fire = {
    ActionName = "Fire",
    GamepadIcon = {
      [1] = T.RT_18,
      [2] = T.RT_18,
      [3] = T.RT_18,
      [4] = T.RT_18
    },
    GamepadKey = {
      [1] = "RightTrigger",
      [2] = "RightTrigger",
      [3] = "RightTrigger",
      [4] = "RightTrigger"
    }
  },
  GamepadOpenSystem = {
    ActionName = "GamepadOpenSystem",
    GamepadIcon = T.RT_20,
    GamepadKey = T.RT_21
  },
  GamepadUseSkill = {
    ActionName = "GamepadUseSkill",
    GamepadIcon = {
      [1] = T.RT_22,
      [2] = T.RT_22,
      [3] = T.RT_5,
      [4] = T.RT_5
    },
    GamepadKey = {
      [1] = "LeftShoulder",
      [2] = "LeftShoulder",
      [3] = "FaceButton_Right",
      [4] = "FaceButton_Right"
    }
  },
  Interactive = {
    ActionName = "Interactive",
    GamepadIcon = T.RT_24,
    GamepadKey = T.RT_25
  },
  ItemDetail = {
    ActionName = "ItemDetail",
    BattleInput = {
      [1] = "GamepadOpenSystem",
      [2] = "GamepadOpenSystem",
      [3] = "GamepadOpenSystem",
      [4] = "GamepadOpenSystem"
    },
    GamepadIcon = {
      [1] = T.RT_26,
      [2] = T.RT_26,
      [3] = T.RT_27,
      [4] = T.RT_27
    }
  },
  Jump = {
    ActionName = "Jump",
    GamepadIcon = {
      [1] = T.RT_6,
      [2] = T.RT_6,
      [3] = T.RT_4,
      [4] = T.RT_6
    },
    GamepadKey = {
      [1] = "FaceButton_Bottom",
      [2] = "FaceButton_Bottom",
      [3] = "RightShoulder",
      [4] = "FaceButton_Bottom"
    }
  },
  LeaveCannon = {
    ActionName = "LeaveCannon",
    GamepadIcon = {
      [1] = T.RT_23,
      [2] = T.RT_23,
      [3] = T.RT_3,
      [4] = T.RT_3
    },
    GamepadKey = {
      [1] = "FaceButton_Top",
      [2] = "FaceButton_Top",
      [3] = "FaceButton_Left",
      [4] = "FaceButton_Left"
    }
  },
  LockMonster = {
    ActionName = "LockMonster",
    GamepadIcon = {
      [1] = T.RT_28,
      [2] = T.RT_28,
      [3] = T.RT_28,
      [4] = T.RT_28
    },
    GamepadKey = {
      [1] = "RightThumbstick",
      [2] = "RightThumbstick",
      [3] = "RightThumbstick",
      [4] = "RightThumbstick"
    }
  },
  OpenArmory = {
    ActionName = "OpenArmory",
    GamepadIcon = {
      [1] = T.RT_29,
      [2] = T.RT_29,
      [3] = T.RT_29,
      [4] = T.RT_29
    },
    SystemInput = {
      [1] = "Attack",
      [2] = "Slide",
      [3] = "Attack",
      [4] = "Attack"
    }
  },
  OpenBag = {
    ActionName = "OpenBag",
    GamepadIcon = {
      [1] = T.RT_30,
      [2] = T.RT_30,
      [3] = T.RT_30,
      [4] = T.RT_30
    },
    SystemInput = {
      [1] = "Avoid",
      [2] = "Avoid",
      [3] = "GamepadUseSkill",
      [4] = "GamepadUseSkill"
    }
  },
  OpenBattlePass = {
    ActionName = "OpenBattlePass",
    GamepadIcon = {
      [1] = T.RT_31,
      [2] = T.RT_31,
      [3] = T.RT_31,
      [4] = T.RT_31
    },
    SystemInput = {
      [1] = "GamepadUseSkill",
      [2] = "GamepadUseSkill",
      [3] = "Slide",
      [4] = "Slide"
    }
  },
  OpenBattleWheel = {
    ActionName = "OpenBattleWheel",
    GamepadIcon = {
      [1] = T.RT_32,
      [2] = T.RT_32,
      [3] = T.RT_32,
      [4] = T.RT_32
    },
    GamepadKey = {
      [1] = "LeftTrigger",
      [2] = "LeftTrigger",
      [3] = "LeftTrigger",
      [4] = "LeftTrigger"
    }
  },
  OpenChat = {
    ActionName = "OpenChat",
    GamepadIcon = T.RT_34
  },
  OpenEvent = {
    ActionName = "OpenEvent",
    GamepadIcon = {
      [1] = T.RT_35,
      [2] = T.RT_35,
      [3] = T.RT_35,
      [4] = T.RT_35
    },
    SystemInput = {
      [1] = "Interactive",
      [2] = "Interactive",
      [3] = "Interactive",
      [4] = "Interactive"
    }
  },
  OpenForge = {
    ActionName = "OpenForge",
    GamepadIcon = {
      [1] = T.RT_36,
      [2] = T.RT_36,
      [3] = T.RT_36,
      [4] = T.RT_36
    },
    SystemInput = T.RT_12
  },
  OpenGacha = {
    ActionName = "OpenGacha",
    GamepadIcon = {
      [1] = T.RT_37,
      [2] = T.RT_37,
      [3] = T.RT_37,
      [4] = T.RT_37
    },
    SystemInput = {
      [1] = "Slide",
      [2] = "Attack",
      [3] = "Jump",
      [4] = "Avoid"
    }
  },
  OpenGuideBook = {
    ActionName = "OpenGuideBook",
    BattleInput = {
      [1] = "ShowTeamInfo",
      [2] = "ShowTeamInfo",
      [3] = "ShowTeamInfo",
      [4] = "ShowTeamInfo"
    },
    GamepadIcon = {
      [1] = T.RT_38,
      [2] = T.RT_38,
      [3] = T.RT_39,
      [4] = T.RT_39
    }
  },
  OpenMap = {
    ActionName = "OpenMap",
    GamepadIcon = T.RT_34,
    GamepadKey = T.RT_40
  },
  OpenMenu = {
    ActionName = "OpenMenu",
    GamepadIcon = {
      [1] = T.RT_41,
      [2] = T.RT_41,
      [3] = T.RT_41,
      [4] = T.RT_41
    },
    GamepadKey = {
      [1] = "Special_Right",
      [2] = "Special_Right",
      [3] = "Special_Right",
      [4] = "Special_Right"
    }
  },
  OpenPlay = {
    ActionName = "OpenPlay",
    GamepadIcon = {
      [1] = T.RT_42,
      [2] = T.RT_42,
      [3] = T.RT_42,
      [4] = T.RT_42
    },
    SystemInput = {
      [1] = "Jump",
      [2] = "Jump",
      [3] = "Avoid",
      [4] = "Jump"
    }
  },
  OpenTask = {
    ActionName = "OpenTask",
    GamepadIcon = {
      [1] = T.RT_43,
      [2] = T.RT_43,
      [3] = T.RT_43,
      [4] = T.RT_43
    },
    SystemInput = {
      [1] = "OpenBattleWheel",
      [2] = "OpenBattleWheel",
      [3] = "OpenBattleWheel",
      [4] = "OpenBattleWheel"
    }
  },
  QuitChallenge = {
    ActionName = "QuitChallenge",
    GamepadIcon = {
      [1] = T.RT_44,
      [2] = T.RT_44,
      [3] = T.RT_44,
      [4] = T.RT_44
    },
    SystemInput = {
      [1] = "LockMonster",
      [2] = "LockMonster",
      [3] = "LockMonster",
      [4] = "LockMonster"
    }
  },
  Recovery = {
    ActionName = "Recovery",
    GamepadIcon = T.RT_24,
    GamepadKey = T.RT_25
  },
  RougeOpenBag = {
    ActionName = "RougeOpenBag",
    GamepadIcon = T.RT_20,
    GamepadKey = T.RT_21
  },
  ShowTeamInfo = {
    ActionName = "ShowTeamInfo",
    GamepadIcon = T.RT_46,
    GamepadKey = T.RT_47
  },
  Skill1 = {
    ActionName = "Skill1",
    BattleInput = {
      [1] = "Attack",
      [2] = "Slide",
      [3] = "Slide",
      [4] = "Slide"
    },
    GamepadIcon = {
      [1] = T.RT_48,
      [2] = T.RT_48,
      [3] = T.RT_49,
      [4] = T.RT_49
    }
  },
  Skill2 = {
    ActionName = "Skill2",
    BattleInput = {
      [1] = "Interactive",
      [2] = "Interactive",
      [3] = "Jump",
      [4] = "Avoid"
    },
    GamepadIcon = {
      [1] = T.RT_50,
      [2] = T.RT_50,
      [3] = T.RT_51,
      [4] = T.RT_51
    }
  },
  Skill3 = {
    ActionName = "Skill3",
    BattleInput = {
      [1] = "Avoid",
      [2] = "Avoid",
      [3] = "Interactive",
      [4] = "Interactive"
    },
    GamepadIcon = {
      [1] = T.RT_52,
      [2] = T.RT_52,
      [3] = T.RT_53,
      [4] = T.RT_53
    }
  },
  Slide = {
    ActionName = "Slide",
    GamepadIcon = {
      [1] = T.RT_4,
      [2] = T.RT_3,
      [3] = T.RT_22,
      [4] = T.RT_22
    },
    GamepadKey = {
      [1] = "RightShoulder",
      [2] = "FaceButton_Left",
      [3] = "LeftShoulder",
      [4] = "LeftShoulder"
    }
  },
  StoryInteractive = {
    ActionName = "StoryInteractive",
    GamepadIcon = T.RT_54,
    GamepadKey = T.RT_55
  },
  StoryInteractiveClose = {
    ActionName = "StoryInteractiveClose",
    GamepadIcon = T.RT_56,
    GamepadKey = T.RT_57
  },
  TalkAutoPlay = {
    ActionName = "TalkAutoPlay",
    GamepadIcon = T.RT_24,
    GamepadKey = T.RT_25
  },
  TalkClick = {
    ActionName = "TalkClick",
    GamepadIcon = T.RT_54,
    GamepadKey = T.RT_55
  },
  TalkDownSelect = {
    ActionName = "TalkDownSelect",
    GamepadIcon = T.RT_16,
    GamepadKey = T.RT_17
  },
  TalkExit = {
    ActionName = "TalkExit",
    GamepadIcon = T.RT_56,
    GamepadKey = T.RT_57
  },
  TalkOption = {
    ActionName = "TalkOption",
    GamepadIcon = T.RT_54,
    GamepadKey = T.RT_55
  },
  TalkReview = {
    ActionName = "TalkReview",
    GamepadIcon = T.RT_34,
    GamepadKey = T.RT_40
  },
  TalkSkip = {
    ActionName = "TalkSkip",
    GamepadIcon = T.RT_54,
    GamepadKey = T.RT_55
  },
  TalkUpSelect = {
    ActionName = "TalkUpSelect",
    GamepadIcon = T.RT_59,
    GamepadKey = T.RT_60
  },
  TalkWiki = {
    ActionName = "TalkWiki",
    GamepadIcon = T.RT_20,
    GamepadKey = T.RT_21
  },
  TrainingCharacterSkills = {
    ActionName = "TrainingCharacterSkills",
    GamepadIcon = T.RT_59,
    GamepadKey = T.RT_60
  },
  TrainingKillMonsters = {
    ActionName = "TrainingKillMonsters",
    GamepadIcon = T.RT_16,
    GamepadKey = T.RT_17
  },
  TrainingOpenSetup = {
    ActionName = "TrainingOpenSetup",
    GamepadIcon = T.RT_46,
    GamepadKey = T.RT_47
  },
  UpSelect = {
    ActionName = "UpSelect",
    GamepadIcon = T.RT_59,
    GamepadKey = T.RT_60
  }
})
