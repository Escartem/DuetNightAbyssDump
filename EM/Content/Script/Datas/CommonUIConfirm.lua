local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("CommonUIConfirm", {
  [98] = {
    AutoRotate = true,
    ConfirmText = "UI_MECHANISM_98",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 98,
    TriggerInterAnim = "Interactive_02_Montage"
  },
  [99] = {
    ConfirmText = "UI_MECHANISM_101",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 99,
    InteractiveFailMsg = "UI_Mechanism_CannotEnterPaotai"
  },
  [100] = {
    ConfirmText = "UI_MECHANISM_100",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Box",
    Id = 100
  },
  [101] = {
    ConfirmText = "UI_MECHANISM_101",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 101
  },
  [102] = {
    AutoRotate = true,
    ConfirmText = "UI_MECHANISM_102",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 102,
    InteractiveFailMsg = "UI_INTERACTIVE_FAILMSG",
    TriggerInterAnim = "Interactive_01_Montage"
  },
  [103] = {
    ConfirmText = "UI_MECHANISM_103",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 103
  },
  [104] = {
    ConfirmText = "UI_MECHANISM_104",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 104,
    InteractiveAngle = 120,
    InteractiveRadius = 150
  },
  [105] = {
    ConfirmText = "UI_MECHANISM_105",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Leave",
    Id = 105
  },
  [106] = {
    ConfirmText = "UI_MECHANISM_106",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 106
  },
  [107] = {
    ConfirmText = "UI_MECHANISM_107",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 107
  },
  [108] = {
    ConfirmText = "UI_MECHANISM_108",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Counterclockwise.T_Interactive_Counterclockwise",
    Id = 108,
    InteractivePriority = 1
  },
  [109] = {
    ConfirmText = "UI_MECHANISM_109",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Clockwise.T_Interactive_Clockwise",
    Id = 109,
    InteractivePriority = 2
  },
  [110] = {
    ConfirmText = "UI_MECHANISM_110",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 110
  },
  [111] = {
    ConfirmText = "UI_MECHANISM_111",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 111
  },
  [113] = {
    ConfirmText = "UI_MECHANISM_113",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Position",
    Id = 113
  },
  [114] = {
    ConfirmText = "UI_MECHANISM_114",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 114,
    InteractivePriority = 1
  },
  [115] = {
    ConfirmText = "UI_MECHANISM_115",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 115,
    InteractivePriority = 1
  },
  [116] = {
    ConfirmText = "UI_MECHANISM_116",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 116,
    InteractivePriority = 1
  },
  [117] = {
    ConfirmText = "UI_MECHANISM_117",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 117,
    InteractivePriority = 1
  },
  [118] = {
    ConfirmText = "UI_MECHANISM_118",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 118,
    InteractivePriority = 1
  },
  [119] = {
    ConfirmText = "UI_MECHANISM_119",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Talk",
    Id = 119,
    InteractivePriority = 2
  },
  [120] = {
    ConfirmText = "UI_MECHANISM_103",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Piano.T_Interactive_Piano",
    Id = 120,
    InteractiveRadius = 250
  },
  [121] = {
    ConfirmText = "UI_MECHANISM_121",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Excavation",
    Id = 121
  },
  [122] = {
    ConfirmText = "UI_MECHANISM_122",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 122
  },
  [200] = {
    ConfirmText = "UI_DUNGEON_DES_TRAINING_11",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Training",
    Id = 200
  },
  [300] = {
    ConfirmText = "UI_MECHANISM_111",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 300
  },
  [301] = {
    ConfirmText = "UI_MECHANISM_111",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 301
  },
  [400] = {
    ConfirmText = "UI_MECHANISM_400",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 400
  },
  [401] = {
    ConfirmText = "UI_MECHANISM_401",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 401
  },
  [402] = {
    ConfirmText = "UI_MECHANISM_401",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 402,
    InteractiveCondition = 9,
    InteractiveFailMsg = "UI_Temple_CantGetBall"
  },
  [900] = {
    AutoRotate = true,
    ConfirmText = "UI_ENERGYSUPPLY_100",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 900,
    InteractiveFailMsg = "UI_INTERACTIVE_FAILMSG",
    TriggerInterAnim = "Interactive_01_Montage"
  },
  [901] = {
    ConfirmText = "INTERACTIVE_SEAT",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Sit",
    Id = 901,
    InteractiveFailMsg = "UI_INTERACTIVE_FAILMSG",
    InteractiveTag = "Seating",
    InteractiveType = 4,
    TriggerInterAnim = "Interactive_Sit"
  },
  [902] = {
    ConfirmText = "INTERACTIVE_SEAT",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Sit",
    Id = 902,
    InteractiveFailMsg = "UI_INTERACTIVE_FAILMSG",
    InteractiveTag = "Seating",
    InteractiveType = 4,
    TriggerInterAnim = "Interactive_Sit_01"
  },
  [903] = {
    ConfirmText = "UI_CONFIRM_BREAKCODE",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 903
  },
  [904] = {
    ConfirmText = "TARGET_DUNGEON_101",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 904
  },
  [905] = {
    ConfirmText = "DUNGEON_SABOTAGE_109",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 905
  },
  [906] = {
    ConfirmText = "DUNGEON_TRAINING_103",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 906
  },
  [907] = {
    ConfirmText = "TARGET_DUNGEON_100",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 907
  },
  [908] = {
    ConfirmText = "UI_MECHANISM_100",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Box",
    Id = 908,
    InteractiveCondition = 6,
    TalkTriggerId = 602005
  },
  [909] = {
    ConfirmText = "UI_MECHANISM_100",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Box",
    Id = 909,
    InteractiveCondition = 21,
    InteractiveFailMsg = "UI_INTERACTIVE_CONDITION_909",
    TalkTriggerId = 602005
  },
  [910] = {
    ConfirmText = "UI_MECHANISM_100",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Box",
    Id = 910,
    InteractiveCondition = 22,
    InteractiveFailMsg = "UI_INTERACTIVE_CONDITION_910",
    TalkTriggerId = 602005
  },
  [911] = {
    ConfirmText = "TARGET_DUNGEON_106",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Car",
    Id = 911,
    InteractiveCondition = 9,
    InteractiveFailMsg = "DUNGEON_HIJACK_102"
  },
  [912] = {
    ConfirmText = "TARGET_DUNGEON_106",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Car",
    Id = 912
  },
  [913] = {
    ConfirmText = "TARGET_DUNGEON_106",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Car",
    Id = 913,
    InteractiveCondition = 9,
    InteractiveFailMsg = "DUNGEON_HIJACK_101"
  },
  [914] = {
    AutoRotate = true,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 914,
    InteractiveAngle = 360,
    InteractiveRadius = 300,
    PlayerFaceAngle = 360,
    TriggerInterAnim = "Interactive_01_Montage"
  },
  [915] = {
    ConfirmText = "UI_Harvest_100",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 915,
    InteractiveAngle = 360,
    InteractiveRadius = 300,
    PlayerFaceAngle = 360
  },
  [917] = {
    ConfirmText = "UI_PowerSeat",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Sit",
    Id = 917,
    InteractiveFailMsg = "UI_INTERACTIVE_FAILMSG",
    InteractiveTag = "Seating",
    TriggerInterAnim = "Interactive_Sit"
  },
  [918] = {
    AutoRotate = true,
    ConfirmText = "UI_MECHANISM_120",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 918
  },
  [919] = {
    AutoRotate = true,
    ConfirmText = "UI_MECHANISM_12001",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 919,
    InteractivePriority = 5
  },
  [920] = {
    AutoRotate = true,
    ConfirmText = "UI_MECHANISM_12002",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 920,
    InteractivePriority = 4
  },
  [921] = {
    ConfirmText = "TARGET_DUNGEON_Trial_100",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 921
  },
  [922] = {
    ConfirmText = "UI_MECHANISM_106124",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 922
  },
  [923] = {
    ConfirmText = "UI_MECHANISM_106125",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 923
  },
  [924] = {
    ConfirmText = "UI_MECHANISM_106126",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 924
  },
  [925] = {
    AutoRotate = true,
    ConfirmText = "UI_CONTINUOUSINTERACTIVE_100",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 925,
    InteractiveFailMsg = "UI_INTERACTIVE_FAILMSG",
    TriggerInterAnim = "Interactive_01_Montage"
  },
  [926] = {
    ConfirmText = "UI_MECHANISM_926",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 926
  },
  [1003] = {
    ConfirmText = "UI_MECHANISM_104",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 1003,
    InteractiveRadius = 200
  },
  [1004] = {
    ConfirmText = "UI_MECHANISM_104",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 1004,
    InteractiveAngle = 180,
    InteractiveRadius = 150,
    PlayerFaceAngle = 180
  },
  [1005] = {
    ConfirmText = "UI_MECHANISM_103",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 1005,
    InteractiveAngle = 180,
    InteractiveRadius = 150,
    PlayerFaceAngle = 180
  },
  [1190] = {
    ConfirmText = "UI_MECHANISM_1190",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 1190
  },
  [10301] = {
    ConfirmText = "DROP_QUEST_FISHDOOR",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Talk",
    Id = 10301,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10306] = {
    ConfirmText = "DROP_QUEST_GOTOTHEA",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Talk",
    Id = 10306,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10410] = {
    ConfirmText = "UI_MECHANISM_10410",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10410
  },
  [10411] = {
    ConfirmText = "UI_MECHANISM_10411",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10411
  },
  [10412] = {
    ConfirmText = "UI_MECHANISM_10412",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10412
  },
  [10413] = {
    ConfirmText = "UI_MECHANISM_10413",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10413
  },
  [10414] = {
    ConfirmText = "UI_MECHANISM_10414",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10414
  },
  [10415] = {
    ConfirmText = "UI_MECHANISM_10415",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10415
  },
  [10416] = {
    ConfirmText = "UI_MECHANISM_10416",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10416
  },
  [10417] = {
    ConfirmText = "UI_MECHANISM_10417",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10417
  },
  [10418] = {
    ConfirmText = "UI_MECHANISM_10418",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10418
  },
  [10419] = {
    ConfirmText = "UI_MECHANISM_10419",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10419
  },
  [10420] = {
    ConfirmText = "UI_MECHANISM_10420",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10420
  },
  [10421] = {
    ConfirmText = "UI_MECHANISM_10421",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10421
  },
  [10422] = {
    ConfirmText = "UI_MECHANISM_10422",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10422
  },
  [10423] = {
    ConfirmText = "UI_MECHANISM_10423",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10423
  },
  [10424] = {
    ConfirmText = "UI_MECHANISM_10424",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10424
  },
  [10425] = {
    ConfirmText = "UI_MECHANISM_10425",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10425
  },
  [10426] = {
    ConfirmText = "UI_MECHANISM_10426",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10426
  },
  [10427] = {
    ConfirmText = "UI_MECHANISM_10427",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10427
  },
  [10428] = {
    ConfirmText = "UI_MECHANISM_10428",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10428
  },
  [10429] = {
    ConfirmText = "UI_MECHANISM_10429",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10429
  },
  [10430] = {
    ConfirmText = "UI_MECHANISM_10430",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10430
  },
  [10431] = {
    ConfirmText = "UI_MECHANISM_10431",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10431
  },
  [10432] = {
    ConfirmText = "UI_MECHANISM_10432",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10432
  },
  [10433] = {
    ConfirmText = "UI_MECHANISM_10433",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10433
  },
  [10434] = {
    ConfirmText = "UI_MECHANISM_10434",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10434
  },
  [10435] = {
    ConfirmText = "UI_MECHANISM_10435",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10435
  },
  [10436] = {
    ConfirmText = "UI_MECHANISM_10436",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10436
  },
  [10437] = {
    ConfirmText = "UI_MECHANISM_10437",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10437
  },
  [10438] = {
    ConfirmText = "UI_MECHANISM_10438",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10438
  },
  [10439] = {
    ConfirmText = "UI_MECHANISM_10439",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10439
  },
  [10440] = {
    ConfirmText = "UI_MECHANISM_10440",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10440
  },
  [10441] = {
    ConfirmText = "UI_MECHANISM_10441",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10441
  },
  [10442] = {
    ConfirmText = "UI_MECHANISM_10442",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10442
  },
  [10443] = {
    ConfirmText = "UI_MECHANISM_10443",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10443
  },
  [10444] = {
    ConfirmText = "UI_MECHANISM_10444",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10444
  },
  [10445] = {
    ConfirmText = "UI_MECHANISM_10445",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10445
  },
  [10446] = {
    ConfirmText = "UI_MECHANISM_10446",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10446
  },
  [10447] = {
    ConfirmText = "UI_MECHANISM_10447",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10447
  },
  [10448] = {
    ConfirmText = "UI_MECHANISM_10448",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10448
  },
  [10449] = {
    ConfirmText = "UI_MECHANISM_10449",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10449
  },
  [10450] = {
    ConfirmText = "UI_MECHANISM_10450",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10450
  },
  [10451] = {
    ConfirmText = "UI_MECHANISM_10451",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10451
  },
  [10452] = {
    ConfirmText = "DROP_QUEST_GUN",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 10452,
    InteractiveAngle = 360,
    InteractivePriority = 2,
    InteractiveRadius = 300,
    PlayerFaceAngle = 360
  },
  [10453] = {
    ConfirmText = "DROP_QUEST_DIAOXIANG",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10453,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10454] = {
    ConfirmText = "DROP_QUEST_LEAVECAVE",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Leave",
    Id = 10454,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10455] = {
    ConfirmText = "UI_WEAPON_NAME_10103",
    Icon = "/Game/UI/Texture/Dynamic/Image/Head/Weapon/T_Head_Sword_Zhuiyi.T_Head_Sword_Zhuiyi",
    Id = 10455,
    InteractivePriority = 2,
    InteractiveRadius = 100
  },
  [10456] = {
    ConfirmText = "UI_Observe_Storm",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10456,
    InteractivePriority = 2,
    InteractiveRadius = 100
  },
  [10457] = {
    ConfirmText = "DROP_QUEST_MUBEI",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 10457,
    InteractiveAngle = 360,
    InteractivePriority = 2,
    InteractiveRadius = 300,
    PlayerFaceAngle = 360
  },
  [10458] = {
    ConfirmText = "UI_MECHANISM_10458",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10458,
    InteractivePriority = 2
  },
  [10459] = {
    ConfirmText = "UI_MECHANISM_10459",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10459,
    InteractivePriority = 2
  },
  [10460] = {
    ConfirmText = "UI_MECHANISM_10460",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10460,
    InteractivePriority = 2
  },
  [10463] = {
    ConfirmText = "UI_MECHANISM_10463",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10463,
    InteractivePriority = 2
  },
  [10464] = {
    ConfirmText = "DROP_QUEST_GOTOEX01",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Talk",
    Id = 10464,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10465] = {
    ConfirmText = "DROP_QUEST_TRAVELINGEXPENSE",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 10465,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10466] = {
    ConfirmText = "DROP_QUEST_ToNight",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Talk",
    Id = 10466,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10467] = {
    ConfirmText = "UI_BAG_Read",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Book",
    Id = 10467,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10468] = {
    ConfirmText = "DROP_QUEST_200209D",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Talk",
    Id = 10468,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10469] = {
    ConfirmText = "DROP_QUEST_HERB",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 10469,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10470] = {
    ConfirmText = "DROP_QUEST_East00Sit",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Sit",
    Id = 10470,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10471] = {
    ConfirmText = "DROP_QUEST_PlaceBomb",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 10471,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10472] = {
    ConfirmText = "DROP_QUEST_PickUpBomb",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 10472,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10473] = {
    ConfirmText = "INTERACTIVE_SEAT",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Sit",
    Id = 10473,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 100
  },
  [10474] = {
    ConfirmText = "UI_Npc_Name_GotoFort",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10474,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 100
  },
  [10475] = {
    ConfirmText = "UI_MECHANISM_10475",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10475,
    InteractiveAngle = 120,
    InteractiveRadius = 150
  },
  [10501] = {
    ConfirmText = "DROP_QUEST_HIDEYUMING",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Excavation",
    Id = 10501,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10502] = {
    ConfirmText = "UI_Drop_Check",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10502,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10503] = {
    ConfirmText = "UI_PickupExplore1",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 10503,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10504] = {
    ConfirmText = "UI_Harvest_100",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 10504,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10505] = {
    ConfirmText = "UI_Quest_BattLeave",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 10505,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10550] = {
    ConfirmText = "DROP_QUEST_FeinaLeave",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Leave",
    Id = 10550,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10551] = {
    ConfirmText = "DROP_QUEST_FeinaWindow",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10551,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10552] = {
    ConfirmText = "DROP_QUEST_FeinaMuban",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10552,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10553] = {
    ConfirmText = "DROP_QUEST_FeinaYingBi",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Leave",
    Id = 10553,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10554] = {
    ConfirmText = "DROP_QUEST_FeinaFengxi",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10554,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10555] = {
    ConfirmText = "DROP_QUEST_FeinaMuxiang",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10555,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10556] = {
    ConfirmText = "DROP_QUEST_FeinaShuShu",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10556,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10557] = {
    ConfirmText = "DROP_QUEST_FeinaBack",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_OutsidersHome",
    Id = 10557,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10558] = {
    ConfirmText = "DROP_QUEST_FeinaBook",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10558,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 150
  },
  [10559] = {
    ConfirmText = "DROP_QUEST_FeinaMagicBook",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10559,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 150
  },
  [10560] = {
    ConfirmText = "DROP_QUEST_FindAnimalSaiqi",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10560,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 150
  },
  [10561] = {
    ConfirmText = "DROP_QUEST_CheckRubishBin01",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10561,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 150
  },
  [10562] = {
    ConfirmText = "DROP_QUEST_CheckRubishBin02",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10562,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 150
  },
  [10563] = {
    ConfirmText = "DROP_QUEST_Check",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 10563,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 150
  },
  [10564] = {
    ConfirmText = "DROP_QUEST_FeinaWait",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Sit",
    Id = 10564,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 150
  },
  [10565] = {
    ConfirmText = "UI_MECHANISM_39045",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Leave.T_Interactive_Leave",
    Id = 10565,
    InteractiveAngle = 360,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10566] = {
    ConfirmText = "UI_MECHANISM_39046",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 10566,
    InteractiveAngle = 360,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [10567] = {
    ConfirmText = "UI_Npc_Name_FeinaSystem",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_TaskActivityMainLine",
    Id = 10567,
    InteractiveAngle = 360,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [20001] = {
    ConfirmText = "BATTLE_RECOVERY_LONGPRESSHELP",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Rescue",
    Id = 20001,
    InteractiveFailMsg = "BATTLE_RECOVERY_TEAMMATESTAYDEAD"
  },
  [20002] = {
    ConfirmText = "BATTLE_RECOVERY_LONGPRESSHELP",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Rescue",
    Id = 20002,
    InteractiveFailMsg = "BATTLE_RECOVERY_TEAMMATESTAYDEAD"
  },
  [50000] = {
    ConfirmText = "Abyss_ExchangeStore",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_ZhiliuShop.T_Interactive_ZhiliuShop",
    Id = 50000,
    InteractiveRadius = 300
  },
  [50001] = {
    ConfirmText = "UI_CONFIRM_PLAY",
    HighLight = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_ZhiliuExchange.T_Interactive_ZhiliuExchange",
    Id = 50001,
    InteractiveRadius = 300
  },
  [50002] = {
    ConfirmText = "MAIN_UI_SHOP",
    HighLight = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_ZhiliuShop.T_Interactive_ZhiliuShop",
    Id = 50002,
    InteractiveRadius = 300
  },
  [50003] = {
    ConfirmText = "Abyss_entry",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Permanent",
    Id = 50003,
    InteractiveRadius = 300
  },
  [60000] = {
    ConfirmText = "UI_CONFIRM_OPENRLBSHOP",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Shop",
    Id = 60000,
    InteractiveAngle = 360,
    InteractivePriority = 2,
    InteractiveRadius = 350,
    PlayerFaceAngle = 360
  },
  [60001] = {
    ConfirmText = "UI_CONFIRM_OPENRLTSHOP",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Shop",
    Id = 60001,
    InteractiveAngle = 360,
    InteractivePriority = 1,
    InteractiveRadius = 350,
    PlayerFaceAngle = 360
  },
  [60002] = {
    ConfirmText = "UI_EXPLORE_BOX_RLSUPPLY",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Box",
    Id = 60002,
    InteractivePriority = 4,
    InteractiveRadius = 400
  },
  [60003] = {
    ConfirmText = "UI_CONFIRM_SHOPTALK",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Talk",
    Id = 60003,
    InteractiveAngle = 360,
    InteractivePriority = 3,
    InteractiveRadius = 350,
    PlayerFaceAngle = 360
  },
  [70000] = {
    ConfirmText = "UI_EXPLORE_BOX_1",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Box",
    Id = 70000
  },
  [70001] = {
    ConfirmText = "UI_EXPLORE_BOX_2",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Excavation",
    Id = 70001
  },
  [70002] = {
    ConfirmText = "UI_MECHANISM_100",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Key",
    Id = 70002,
    InteractiveCondition = 70000,
    InteractiveFailMsg = "UI_EXPLORE_KEY"
  },
  [70003] = {
    ConfirmText = "UI_MECHANISM_100",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Key",
    Id = 70003,
    InteractiveCondition = 70001,
    InteractiveFailMsg = "UI_EXPLORE_KEY",
    TalkTriggerId = 608001
  },
  [70796] = {
    ConfirmText = "UI_Pan_Push",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 70796,
    IfSkipAnim = true,
    InteractiveRadius = 200
  },
  [70798] = {
    ConfirmText = "UI_Pan_Survey",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 70798,
    IfSkipAnim = true,
    InteractiveRadius = 200
  },
  [70799] = {
    ConfirmText = "UI_Pan_Survey",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 70799,
    IfSkipAnim = true,
    InteractiveRadius = 150
  },
  [70800] = {
    ConfirmText = "UI_Pan_Touch",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 70800,
    IfSkipAnim = true,
    InteractiveRadius = 200
  },
  [80001] = {
    ConfirmText = "UI_DynInteract_1",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 80001,
    InteractiveRadius = 250
  },
  [80002] = {
    ConfirmText = "UI_DynInteract_2",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 80002,
    InteractiveRadius = 400
  },
  [80003] = {
    ConfirmText = "UI_DynInteract_3",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 80003,
    InteractiveRadius = 300
  },
  [80004] = {
    ConfirmText = "UI_DynInteract_4",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 80004,
    InteractiveRadius = 300
  },
  [90000] = {
    ConfirmText = "HARDBOSS_OPENMECHANISM_1",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 90000
  },
  [90100] = {
    ConfirmText = "UI_MECHANISM_113",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Position",
    Id = 90100
  },
  [90200] = {
    ConfirmText = "UI_CONFIRM_90200",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Leave",
    Id = 90200,
    InteractiveRadius = 350
  },
  [90201] = {
    ConfirmText = "UI_CONFIRM_90201",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Leave",
    Id = 90201,
    InteractiveRadius = 350
  },
  [90202] = {
    ConfirmText = "UI_CONFIRM_90202",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Leave",
    Id = 90202,
    InteractiveRadius = 350
  },
  [90203] = {
    ConfirmText = "UI_CONFIRM_90203",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Leave",
    Id = 90203,
    InteractiveRadius = 350
  },
  [90204] = {
    ConfirmText = "UI_CONFIRM_90204",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Leave",
    Id = 90204,
    InteractiveRadius = 350
  },
  [90205] = {
    ConfirmText = "UI_CONFIRM_90205",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Talk",
    Id = 90205,
    InteractiveRadius = 350
  },
  [90206] = {
    ConfirmText = "UI_CONFIRM_90206",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Leave",
    Id = 90206,
    InteractiveRadius = 350
  },
  [90301] = {
    ConfirmText = "UI_DUNGEON_DES_TRAINING_1",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 90301,
    InteractiveAngle = 360,
    InteractiveRadius = 400,
    PlayerFaceAngle = 360
  },
  [91501] = {
    ConfirmText = "RESOURCE_NAME_4010001",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 91501,
    InteractiveRadius = 300
  },
  [91502] = {
    ConfirmText = "RESOURCE_NAME_4010002",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 91502,
    InteractiveRadius = 300
  },
  [91503] = {
    ConfirmText = "RESOURCE_NAME_4010003",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 91503,
    InteractiveRadius = 300
  },
  [91504] = {
    ConfirmText = "RESOURCE_NAME_4010004",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 91504,
    InteractiveRadius = 300
  },
  [91505] = {
    ConfirmText = "RESOURCE_NAME_4020005",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 91505,
    InteractiveRadius = 300
  },
  [91506] = {
    ConfirmText = "RESOURCE_NAME_4010006",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 91506,
    InteractiveRadius = 300
  },
  [91507] = {
    ConfirmText = "RESOURCE_NAME_4010007",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 91507,
    InteractiveRadius = 300
  },
  [91508] = {
    ConfirmText = "RESOURCE_NAME_4010008",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 91508,
    InteractiveRadius = 300
  },
  [91509] = {
    ConfirmText = "RESOURCE_NAME_4020002",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 91509,
    InteractiveRadius = 300
  },
  [91510] = {
    ConfirmText = "RESOURCE_NAME_4020003",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 91510,
    InteractiveRadius = 300
  },
  [91511] = {
    ConfirmText = "RESOURCE_NAME_4020004",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 91511
  },
  [91512] = {
    ConfirmText = "RESOURCE_NAME_4010005",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 91512
  },
  [91513] = {
    ConfirmText = "RESOURCE_NAME_4020001",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 91513,
    InteractiveRadius = 300
  },
  [91514] = {
    ConfirmText = "RESOURCE_NAME_4010009",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 91514,
    InteractiveRadius = 300
  },
  [91515] = {
    ConfirmText = "RESOURCE_NAME_4010010",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 91515,
    InteractiveRadius = 300
  },
  [91516] = {
    ConfirmText = "RESOURCE_NAME_4010011",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 91516,
    InteractiveRadius = 300
  },
  [91517] = {
    ConfirmText = "RESOURCE_NAME_4010012",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 91517,
    InteractiveRadius = 300
  },
  [91518] = {
    ConfirmText = "RESOURCE_NAME_4010013",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 91518,
    InteractiveRadius = 300
  },
  [92501] = {
    AutoRotate = true,
    ConfirmText = "UI_CONTINUOUSINTERACTIVE_101",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 92501,
    InteractiveFailMsg = "UI_INTERACTIVE_FAILMSG",
    TriggerInterAnim = "Interactive_01_Montage"
  },
  [92502] = {
    AutoRotate = true,
    ConfirmText = "UI_Npc_Name_GotoFort",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 92502,
    InteractiveFailMsg = "UI_INTERACTIVE_FAILMSG",
    TriggerInterAnim = "Interactive_01_Montage"
  },
  [99999] = {
    ConfirmText = "UI_CONFIRM_PETCAPTURE",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 99999,
    InteractivePriority = 3,
    InteractiveRadius = 200
  },
  [100001] = {
    ConfirmText = "UI_CONFIRM_OPENMAP",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Position",
    Id = 100001,
    InteractivePriority = 3,
    InteractiveRadius = 300
  },
  [100002] = {
    ConfirmText = "UI_CONFIRM_OPENSHOP",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Shop",
    Id = 100002,
    InteractiveFailMsg = "UI_Unlock_Des_Shop",
    InteractivePriority = 3,
    InteractiveRadius = 300
  },
  [100003] = {
    ConfirmText = "UI_FORGING_START",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Forging",
    Id = 100003,
    InteractivePriority = 3,
    InteractiveRadius = 300
  },
  [100004] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Talk",
    Id = 100004,
    InteractiveFailMsg = "UI_INTERACTIVE_FAILMSG",
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [100005] = {
    ConfirmText = "UI_PickupExplore1",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 100005,
    InteractiveRadius = 300
  },
  [100006] = {
    ConfirmText = "UI_MECHANISM_105",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Leave",
    Id = 100006
  },
  [100007] = {
    ConfirmText = "UI_MECHANISM_107",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 100007
  },
  [100008] = {
    ConfirmText = "UI_MECHANISM_106",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 100008
  },
  [100009] = {
    ConfirmText = "UI_Interact_Test",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Talk",
    Id = 100009,
    InteractiveRadius = 1500
  },
  [100010] = {
    ConfirmText = "MAIN_UI_GACHA",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Gacha",
    Id = 100010,
    InteractivePriority = 3,
    InteractiveRadius = 300
  },
  [100011] = {
    ConfirmText = "NpcBiography_UI_Probe",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Check",
    Id = 100011,
    InteractivePriority = 1,
    InteractiveRadius = 300
  },
  [100012] = {
    ConfirmText = "NpcBiography_UI_Probe",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Lock",
    Id = 100012,
    InteractivePriority = 1,
    InteractiveRadius = 300
  },
  [100013] = {
    ConfirmText = "MAIN_UI_ACHIEVEMENT",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Achievement",
    Id = 100013,
    InteractivePriority = 3,
    InteractiveRadius = 2000
  },
  [100014] = {
    ConfirmText = "UI_CONFIRM_PLAY",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Play",
    Id = 100014,
    InteractivePriority = 3,
    InteractiveRadius = 300
  },
  [100015] = {
    ConfirmText = "UI_PickupExplore2",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 100015,
    InteractiveRadius = 300
  },
  [100016] = {
    ConfirmText = "UI_Carhorn",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Mechanism",
    Id = 100016,
    InteractiveRadius = 300
  },
  [100017] = {
    ConfirmText = "UI_PickupExplore3",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Box",
    Id = 100017
  },
  [100018] = {
    ConfirmText = "UI_PickupExplore2",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 100018,
    InteractivePriority = 1,
    InteractiveRadius = 300
  },
  [100019] = {
    ConfirmText = "UI_Drop_Check",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 100019,
    InteractivePriority = 1,
    InteractiveRadius = 300
  },
  [100020] = {
    ConfirmText = "DROP_QUEST_LOCKEDDOOR",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 100020,
    InteractivePriority = 1,
    InteractiveRadius = 300
  },
  [100021] = {
    ConfirmText = "DROP_QUEST_DIG",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Excavation",
    Id = 100021,
    InteractivePriority = 1,
    InteractiveRadius = 300
  },
  [100022] = {
    ConfirmText = "MAIN_UI_WIKI",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Wiki.T_Interactive_Wiki",
    Id = 100022,
    InteractiveRadius = 330
  },
  [100023] = {
    ConfirmText = "UI_CONFIRM_ExploreBadgeShop",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Shop",
    Id = 100023,
    InteractiveFailMsg = "UI_Locked_Des_ExploreBadgeShop",
    InteractivePriority = 3,
    InteractiveRadius = 300
  },
  [100024] = {
    ConfirmText = "UI_CONFIRM_FISHING",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Angling",
    Id = 100024,
    InteractiveFailMsg = "UI_INTERACTIVE_FAILMSG",
    InteractivePriority = 3,
    InteractiveRadius = 300
  },
  [100025] = {
    ConfirmText = "UI_Drop_Check",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 100025,
    InteractiveRadius = 300
  },
  [100026] = {
    ConfirmText = "UI_PickupExplore4",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 100026,
    InteractiveRadius = 300
  },
  [100027] = {
    ConfirmText = "UI_Npc_DreamAware",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Talk",
    Id = 100027,
    InteractiveRadius = 100
  },
  [100028] = {
    ConfirmText = "UI_Npc_DreamDafu",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Talk",
    Id = 100028,
    InteractiveRadius = 100
  },
  [100029] = {
    ConfirmText = "UI_Npc_DreamMaerke",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Talk",
    Id = 100029,
    InteractiveRadius = 100
  },
  [100030] = {
    ConfirmText = "UI_Npc_DreamLaiang",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Talk",
    Id = 100030,
    InteractiveRadius = 100
  },
  [100031] = {
    ConfirmText = "DROP_QUEST_HAVEAREST",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Talk",
    Id = 100031,
    InteractivePriority = 5,
    InteractiveRadius = 250,
    QuestInteractiveType = 2
  },
  [100032] = {
    ConfirmText = "UI_Interact_Player",
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey.T_Interactive_Survey'",
    Id = 100032,
    InteractivePriority = 9,
    InteractiveRadius = 300
  },
  [100033] = {
    ConfirmText = "UI_Interact_Detective",
    Icon = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Reasoning_Nanzhu.T_Interactive_Reasoning_Nanzhu'",
    IconFemale = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Reasoning_Nvzhu.T_Interactive_Reasoning_Nvzhu'",
    Id = 100033,
    InteractiveFailMsg = "UI_INTERACTIVE_FAILMSG",
    InteractivePriority = 2,
    InteractiveRadius = 300,
    QuestInteractiveType = 2
  },
  [100034] = {
    ConfirmText = "UI_MECHANISM_104",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 100034,
    InteractiveRadius = 1000
  },
  [100035] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Talk",
    Id = 100035,
    InteractiveFailMsg = "UI_INTERACTIVE_FAILMSG",
    InteractivePriority = 2,
    InteractiveRadius = 180
  },
  [100036] = {
    ConfirmText = "UI_Quest_WaitDafu",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 100036,
    InteractiveRadius = 100
  },
  [100037] = {
    ConfirmText = "UI_Drop_Check",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 100037,
    InteractiveRadius = 100
  },
  [100038] = {
    ConfirmText = "UI_Npc_Name_TpSew",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 100038,
    InteractiveAngle = 360,
    InteractiveRadius = 200,
    QuestInteractiveType = 1
  },
  [100039] = {
    ConfirmText = "TARGET_DUNGEON_101",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Survey",
    Id = 100039,
    InteractiveRadius = 100,
    QuestInteractiveType = 1
  },
  [118001] = {
    ConfirmText = "UI_PickupExplore1",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick",
    Id = 118001,
    InteractiveRadius = 150
  },
  [118002] = {
    ConfirmText = "UI_EXPLORE_BOX_1",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Box",
    Id = 118002,
    InteractiveRadius = 150
  },
  [1030601] = {
    ConfirmText = "DROP_QUEST_THEAACTOR",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Talk",
    Id = 1030601,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [1030602] = {
    ConfirmText = "DROP_QUEST_BODY01",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Talk",
    Id = 1030602,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  },
  [1030603] = {
    ConfirmText = "DROP_QUEST_BODY02",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Talk",
    Id = 1030603,
    InteractiveAngle = 120,
    InteractivePriority = 2,
    InteractiveRadius = 300
  }
})
