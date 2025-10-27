local T = {}
T.RT_1 = {1000101}
T.RT_2 = {1000102}
T.RT_3 = {
  1000103,
  1000104,
  1000105
}
T.RT_4 = {600001, 600002}
T.RT_5 = {1000106, 1000107}
T.RT_6 = {
  1000103,
  1000104,
  1000105,
  1000106,
  1000107,
  1000110
}
T.RT_7 = {
  1000307,
  1000309,
  800206,
  800207
}
T.RT_8 = {
  1000310,
  1000311,
  800206,
  800207
}
T.RT_9 = {1000401}
T.RT_10 = {
  1000404,
  1000405,
  800206,
  800207
}
T.RT_11 = {
  1000414,
  1000415,
  800206,
  800207
}
T.RT_12 = {10011}
T.RT_13 = {10021, 10022}
T.RT_14 = {
  SocketA = "weapon_01",
  SocketB = "root_hook_arm_r"
}
T.RT_15 = {
  SocketA = "root_Claymore_back",
  SocketB = "root_point"
}
T.RT_16 = {
  HandHold = T.RT_14,
  UnbindHand = T.RT_15
}
T.RT_17 = {
  SocketA = "Root",
  SocketB = "root_hook_arm_r"
}
T.RT_18 = {
  SocketA = "root_Katana01_back",
  SocketB = "root_point"
}
T.RT_19 = {
  HandHold = T.RT_17,
  UnbindHand = T.RT_18
}
T.RT_20 = {
  110111,
  110112,
  110113,
  110114
}
T.RT_21 = {110312}
T.RT_22 = {110331}
T.RT_23 = {110332}
T.RT_24 = {110333}
T.RT_25 = {110334}
T.RT_26 = {110341, 110342}
T.RT_27 = {110411}
T.RT_28 = {2030421}
T.RT_29 = {2050321}
T.RT_30 = {210212}
T.RT_31 = {210221, 210222}
T.RT_32 = {210231}
T.RT_33 = {
  30,
  31,
  32,
  33
}
T.RT_34 = {310111}
T.RT_35 = {310131}
T.RT_36 = {
  320215,
  320222,
  320223
}
T.RT_37 = {600209}
T.RT_38 = {600504}
T.RT_39 = {600506}
T.RT_40 = {600507}
T.RT_41 = {601609}
T.RT_42 = {
  700402,
  700403,
  700404,
  700405
}
T.RT_43 = {701001, 701004}
T.RT_44 = {
  800203,
  800204,
  800205
}
T.RT_45 = {800206, 800207}
T.RT_46 = {
  800203,
  800204,
  800205,
  800206,
  800207,
  800210
}
T.RT_47 = {800301}
T.RT_48 = {
  8500111,
  8500112,
  8500113,
  8500114,
  8500115,
  8500119
}
T.RT_49 = {
  8500121,
  8500122,
  8500123,
  8500124,
  8500125,
  8500126
}
T.RT_50 = {850206}
T.RT_51 = {850237}
T.RT_52 = {8502106}
T.RT_53 = {8502137}
T.RT_54 = {
  850601,
  850602,
  850603
}
T.RT_55 = {
  850601,
  850602,
  850603,
  850604
}
T.RT_56 = {850605, 850606}
T.RT_57 = {850607}
T.RT_58 = {850608}
T.RT_59 = {850932}
T.RT_60 = {
  850920,
  850921,
  850926,
  850929,
  850939,
  850944
}
T.RT_61 = {851201, 851202}
T.RT_62 = {851206}
T.RT_63 = {
  851211,
  851212,
  851213
}
T.RT_64 = {
  851216,
  851217,
  851218
}
T.RT_65 = {
  851221,
  851223,
  851224,
  851225
}
T.RT_66 = {851226, 851229}
T.RT_67 = {851231}
T.RT_68 = {
  851236,
  851237,
  851238,
  851239
}
T.RT_69 = {
  851241,
  851266,
  851269
}
T.RT_70 = {851246}
T.RT_71 = {851254}
T.RT_72 = {851256}
T.RT_73 = {851261}
T.RT_74 = {851291, 851292}
T.RT_75 = {851503, 851530}
T.RT_76 = {851812}
T.RT_77 = {851921, 851924}
T.RT_78 = {851940, 851948}
T.RT_79 = {900101}
T.RT_80 = {900201}
T.RT_81 = {900204}
T.RT_82 = {900301}
T.RT_83 = {900501}
T.RT_84 = {900601}
T.RT_85 = {950101}
T.RT_86 = {950105}
T.RT_87 = {980101}
T.RT_88 = {980104}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SkillNode", {
  [10] = {AnimPlayRate = 1, NodeId = 10},
  [20] = {
    AnimName = "Recover_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Hit/",
    DisableBlendBone = true,
    NodeId = 20,
    SkillNodeEffects = {20, 21}
  },
  [30] = {
    AnimName = "Condemn_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Skill/",
    NodeId = 30,
    SkillNodeEffects = T.RT_33
  },
  [91] = {
    AnimName = "Machinegun_Paotai_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Machinegun/",
    DisableBlendBone = true,
    NextNodeId = 91,
    NodeId = 91,
    PhantomAutoInput = 1,
    SkillNodeEffects = {94}
  },
  [10011] = {
    AnimPath = "/Game/Asset/Char/Player/NPC001_Nvzhu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Nvzhu_Skill01_Montage",
    DisableBlendBone = true,
    NodeId = 10011,
    SkillNodeEffects = T.RT_12
  },
  [10021] = {
    AnimPath = "/Game/Asset/Char/Player/NPC001_Nvzhu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Nvzhu_Skill02_Montage",
    CostSp = 20,
    DisableBlendBone = true,
    NodeId = 10021,
    SkillNodeEffects = T.RT_13
  },
  [10041] = {
    AnimPath = "/Game/Asset/Char/Player/NPC002_Nanzhu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Nanzhu_Skill01_Montage",
    DisableBlendBone = true,
    NodeId = 10041,
    SkillNodeEffects = T.RT_12
  },
  [10051] = {
    AnimPath = "/Game/Asset/Char/Player/NPC002_Nanzhu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Nanzhu_Skill02_Montage",
    CostSp = 20,
    DisableBlendBone = true,
    NodeId = 10051,
    SkillNodeEffects = T.RT_13
  },
  [10061] = {
    AnimPath = "/Game/Asset/Char/Player/NPC004_WeitaF/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "WeitaF_Skill01_Montage",
    DisableBlendBone = true,
    NodeId = 10061,
    SkillNodeEffects = T.RT_12
  },
  [10071] = {
    AnimPath = "/Game/Asset/Char/Player/NPC004_WeitaF/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "WeitaF_Skill02_Montage",
    CostSp = 20,
    DisableBlendBone = true,
    NodeId = 10071,
    SkillNodeEffects = T.RT_13
  },
  [10081] = {
    AnimPath = "/Game/Asset/Char/Player/NPC005_WeitaM/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "WeitaM_Skill01_Montage",
    DisableBlendBone = true,
    NodeId = 10081,
    SkillNodeEffects = T.RT_12
  },
  [10091] = {
    AnimPath = "/Game/Asset/Char/Player/NPC005_WeitaM/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "WeitaM_Skill02_Montage",
    CostSp = 20,
    DisableBlendBone = true,
    NodeId = 10091,
    SkillNodeEffects = T.RT_13
  },
  [20111] = {
    AnimPath = "/Game/Asset/Char/Npc/Npc_Awa/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Awa_Skill01_Montage",
    DisableBlendBone = true,
    NodeId = 20111,
    SkillNodeEffects = {
      20111,
      20112,
      20113
    }
  },
  [20121] = {
    AnimPath = "/Game/Asset/Char/Npc/Npc_Awa/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Awa_Skill02_Montage",
    DisableBlendBone = true,
    NodeId = 20121,
    SkillNodeEffects = {20121}
  },
  [30401] = {
    AnimPath = "/Game/Asset/Char/Monster/BossOnline_Test/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "BossOnline_Test_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 30401,
    SkillNodeEffects = {30443}
  },
  [30402] = {
    AnimPath = "/Game/Asset/Char/Monster/BossOnline_Test/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "BossOnline_Test_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 30402,
    SkillNodeEffects = {30401}
  },
  [30403] = {
    AnimPath = "/Game/Asset/Char/Monster/BossOnline_Test/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "BossOnline_Test_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 30403,
    SkillNodeEffects = {30432}
  },
  [30404] = {
    AnimPath = "/Game/Asset/Char/Monster/BossOnline_Test/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "BossOnline_Test_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 30404,
    SkillNodeEffects = {30436}
  },
  [30405] = {
    AnimPath = "/Game/Asset/Char/Monster/BossOnline_Test/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "BossOnline_Test_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 30405
  },
  [30406] = {
    AnimPath = "/Game/Asset/Char/Monster/BossOnline_Test/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "BossOnline_Test_Skill06_Montage",
    DisableBlendBone = false,
    NodeId = 30406
  },
  [30407] = {
    AnimPath = "/Game/Asset/Char/Monster/BossOnline_Test/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "BossOnline_Test_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 30407,
    SkillNodeEffects = {
      30414,
      30416,
      30417,
      30418,
      30419,
      30420
    }
  },
  [30408] = {
    AnimPath = "/Game/Asset/Char/Monster/BossOnline_Test/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "BossOnline_Test_Skill08_Montage",
    DisableBlendBone = false,
    NodeId = 30408,
    SkillNodeEffects = {30421, 30422}
  },
  [30409] = {
    AnimPath = "/Game/Asset/Char/Monster/BossOnline_Test/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "BossOnline_Test_Skill09_Montage",
    DisableBlendBone = false,
    NodeId = 30409,
    SkillNodeEffects = {30423, 30424}
  },
  [30410] = {
    AnimPath = "/Game/Asset/Char/Monster/BossOnline_Test/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "BossOnline_Test_Skill10_Montage",
    DisableBlendBone = false,
    NodeId = 30410,
    SkillNodeEffects = {
      30427,
      30428,
      30429
    }
  },
  [30411] = {
    AnimPath = "/Game/Asset/Char/Monster/BossOnline_Test/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "BossOnline_Test_Skill11_Montage",
    DisableBlendBone = false,
    NodeId = 30411,
    SkillNodeEffects = {30434}
  },
  [30412] = {
    AnimPath = "/Game/Asset/Char/Monster/BossOnline_Test/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "BossOnline_Test_Skill12_Montage",
    DisableBlendBone = false,
    NodeId = 30412,
    SkillNodeEffects = {
      30451,
      30479,
      30480,
      30481,
      30482,
      30483
    }
  },
  [30413] = {
    AnimPath = "/Game/Asset/Char/Monster/BossOnline_Test/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "BossOnline_Test_Skill13_Montage",
    DisableBlendBone = false,
    NodeId = 30413,
    SkillNodeEffects = {30452}
  },
  [30414] = {
    AnimPath = "/Game/Asset/Char/Monster/BossOnline_Test/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "BossOnline_Test_Skill14_Montage",
    DisableBlendBone = false,
    NodeId = 30414,
    SkillNodeEffects = {
      30455,
      30489,
      30490,
      30491
    }
  },
  [30415] = {
    AnimPath = "/Game/Asset/Char/Monster/BossOnline_Test/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "BossOnline_Test_Skill15_Montage",
    DisableBlendBone = false,
    NodeId = 30415,
    SkillNodeEffects = {30456}
  },
  [30416] = {
    AnimPath = "/Game/Asset/Char/Monster/BossOnline_Test/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "BossOnline_Test_Skill16_Montage",
    DisableBlendBone = false,
    NodeId = 30416,
    SkillNodeEffects = {30457, 30458}
  },
  [30417] = {
    AnimPath = "/Game/Asset/Char/Monster/BossOnline_Test/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "BossOnline_Test_Skill17_Montage",
    DisableBlendBone = false,
    NodeId = 30417,
    SkillNodeEffects = {
      30460,
      30461,
      30462,
      30467,
      30468,
      30469,
      30484,
      30485,
      30486
    }
  },
  [30418] = {
    AnimPath = "/Game/Asset/Char/Monster/BossOnline_Test/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "BossOnline_Test_Skill18_Montage",
    DisableBlendBone = false,
    NodeId = 30418,
    SkillNodeEffects = {30496}
  },
  [30419] = {
    AnimPath = "/Game/Asset/Char/Monster/BossOnline_Test/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "BossOnline_Test_Skill19_Montage",
    DisableBlendBone = false,
    NodeId = 30419,
    SkillNodeEffects = {30497}
  },
  [30420] = {
    AnimPath = "/Game/Asset/Char/Monster/BossOnline_Test/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "BossOnline_Test_Skill20_Montage",
    DisableBlendBone = false,
    NodeId = 30420,
    SkillNodeEffects = {30498, 30499}
  },
  [110111] = {
    AnimPath = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Heitao_Skill01_Montage",
    CostSp = 20,
    DisableBlendBone = true,
    NodeId = 110111,
    SkillNodeEffects = T.RT_20
  },
  [110119] = {
    AnimPath = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Heitao_Skill01_Montage",
    DisableBlendBone = true,
    NodeId = 110119,
    SkillNodeEffects = T.RT_20
  },
  [110121] = {
    AnimPath = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Heitao_Skill02_On_Montage",
    CanExtractZVelocity = true,
    CostSp = 10,
    DisableBlendBone = true,
    NodeId = 110121,
    SkillNodeEffects = {110121, 110122}
  },
  [110131] = {
    AnimPath = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Heitao_Skill02_Off_Montage",
    DisableBlendBone = true,
    NodeId = 110131,
    SkillNodeEffects = {110131}
  },
  [110141] = {
    AnimPath = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Heitao_Skill02_01_Montage",
    DisableBlendBone = true,
    NextNodeId = 110142,
    NodeId = 110141,
    PhantomAutoInput = 1,
    SkillNodeEffects = {110141, 110146}
  },
  [110142] = {
    AnimPath = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Heitao_Skill02_02_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = true,
    NextNodeId = 110143,
    NodeId = 110142,
    PhantomAutoInput = 1,
    SkillNodeEffects = {110142, 110147}
  },
  [110143] = {
    AnimPath = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Heitao_Skill02_03_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = true,
    NextNodeId = 110144,
    NodeId = 110143,
    PhantomAutoInput = 1,
    SkillNodeEffects = {110143, 110148}
  },
  [110144] = {
    AnimPath = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Heitao_Skill02_04_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = true,
    NextNodeId = 110145,
    NodeId = 110144,
    PhantomAutoInput = 1,
    SkillNodeEffects = {110144, 110149}
  },
  [110145] = {
    AnimPath = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Heitao_Skill02_05_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = true,
    NextNodeId = 110142,
    NodeId = 110145,
    PhantomAutoInput = 2,
    SkillNodeEffects = {110145, 110150}
  },
  [110151] = {
    AnimPath = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Heitao_Skill02_01_Montage",
    DisableBlendBone = true,
    NextNodeId = 110152,
    NodeId = 110151,
    PhantomAutoInput = 1,
    SkillNodeEffects = {110141, 110161}
  },
  [110152] = {
    AnimPath = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Heitao_Skill02_02_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = true,
    NextNodeId = 110153,
    NodeId = 110152,
    PhantomAutoInput = 1,
    SkillNodeEffects = {110142, 110162}
  },
  [110153] = {
    AnimPath = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Heitao_Skill02_03_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = true,
    NextNodeId = 110154,
    NodeId = 110153,
    PhantomAutoInput = 1,
    SkillNodeEffects = {110143, 110163}
  },
  [110154] = {
    AnimPath = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Heitao_Skill02_04_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = true,
    NextNodeId = 110155,
    NodeId = 110154,
    PhantomAutoInput = 1,
    SkillNodeEffects = {110144, 110164}
  },
  [110155] = {
    AnimPath = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Heitao_Skill02_05_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = true,
    NextNodeId = 110152,
    NodeId = 110155,
    PhantomAutoInput = 2,
    SkillNodeEffects = {110145, 110165}
  },
  [110211] = {
    AnimPath = "/Game/Asset/Char/Player/Char016_Fuluo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Fuluo_Skill01_Montage",
    CostSp = 10,
    DisableBlendBone = true,
    NodeId = 110211,
    SkillNodeEffects = {110212}
  },
  [110212] = {
    AnimPath = "/Game/Asset/Char/Player/Char016_Fuluo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Fuluo_Skill01_Ultra_Montage",
    CostSp = 30,
    DisableBlendBone = true,
    NodeId = 110212,
    SkillNodeEffects = {110213, 110214}
  },
  [110213] = {
    AnimPath = "/Game/Asset/Char/Player/Char016_Fuluo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Fuluo_Skill01_Move_Montage",
    CostSp = 20,
    DisableBlendBone = true,
    NodeId = 110213,
    SkillNodeEffects = {110211, 110212}
  },
  [110221] = {
    AnimPath = "/Game/Asset/Char/Player/Char016_Fuluo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Fuluo_Skill02_On_Montage",
    CostSp = 60,
    DisableBlendBone = true,
    NodeId = 110221,
    SkillNodeEffects = {110221}
  },
  [110222] = {
    AnimPath = "/Game/Asset/Char/Player/Char016_Fuluo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Fuluo_Skill02_Off_Montage",
    DisableBlendBone = true,
    NodeId = 110222,
    SkillNodeEffects = {110222}
  },
  [110231] = {
    AnimPath = "/Game/Asset/Char/Player/Char016_Fuluo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Fuluo_HeavyAttack_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = true,
    NodeId = 110231,
    SkillNodeEffects = {110231}
  },
  [110311] = {
    AnimPath = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Tuosi_Skill01_Montage",
    CostSp = 20,
    DisableBlendBone = true,
    NodeId = 110311,
    SkillNodeEffects = {110311}
  },
  [110312] = {
    AnimPath = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Tuosi02_Skill01_Montage",
    CostSp = 20,
    DisableBlendBone = true,
    NodeId = 110312,
    SkillNodeEffects = T.RT_21
  },
  [110313] = {
    AnimPath = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Tuosi02_Skill01_Montage",
    CostSp = 20,
    DisableBlendBone = true,
    NodeId = 110313,
    SkillNodeEffects = {110315}
  },
  [110321] = {
    AnimPath = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Tuosi02_Skill02_Montage",
    CostSp = 10,
    DisableBlendBone = true,
    NodeId = 110321,
    SkillNodeEffects = {110321, 110324}
  },
  [110322] = {
    AnimPath = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Tuosi02_Skill02_Off_Montage",
    DisableBlendBone = true,
    NodeId = 110322,
    SkillNodeEffects = {110322}
  },
  [110331] = {
    AnimPath = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Tuosi02_Attack01_Montage",
    DisableBlendBone = true,
    NextNodeId = 110332,
    NodeId = 110331,
    PhantomAutoInput = 1,
    SkillNodeEffects = T.RT_22
  },
  [110332] = {
    AnimPath = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Tuosi02_Attack02_Montage",
    DisableBlendBone = true,
    NextNodeId = 110333,
    NodeId = 110332,
    PhantomAutoInput = 1,
    SkillNodeEffects = T.RT_23
  },
  [110333] = {
    AnimPath = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Tuosi02_Attack03_1_Montage",
    DisableBlendBone = true,
    ExtraNextNodeId = 110335,
    NextNodeId = 110334,
    NodeId = 110333,
    PhantomAutoInput = 1,
    SkillNodeEffects = T.RT_24
  },
  [110334] = {
    AnimPath = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Tuosi02_Attack03_2_Montage",
    DisableBlendBone = true,
    ExtraNextNodeId = 110335,
    NextNodeId = 110333,
    NodeId = 110334,
    PhantomAutoInput = 2,
    SkillNodeEffects = T.RT_24
  },
  [110335] = {
    AnimPath = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Tuosi02_Attack04_Montage",
    DisableBlendBone = true,
    NextNodeId = 110331,
    NodeId = 110335,
    SkillNodeEffects = T.RT_25
  },
  [110341] = {
    AnimPath = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Tuosi02_FallAttack_Montage",
    DisableBlendBone = true,
    NodeId = 110341,
    SkillNodeEffects = T.RT_26
  },
  [110351] = {
    AnimPath = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Tuosi02_Shooting_Montage",
    DisableBlendBone = true,
    NodeId = 110351,
    SkillNodeEffects = {
      110352,
      110353,
      110354
    }
  },
  [110391] = {
    AnimPath = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/Combat/Ch02/",
    AnimPlayRate = 1,
    AnimResource = "Tuosi03_Skill01_Montage",
    CostSp = 20,
    DisableBlendBone = true,
    NodeId = 110391,
    SkillNodeEffects = T.RT_21
  },
  [110392] = {
    AnimPath = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/Combat/Ch02/",
    AnimPlayRate = 1,
    AnimResource = "Tuosi03_Attack01_Montage",
    DisableBlendBone = true,
    NextNodeId = 110393,
    NodeId = 110392,
    PhantomAutoInput = 1,
    SkillNodeEffects = T.RT_22
  },
  [110393] = {
    AnimPath = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/Combat/Ch02/",
    AnimPlayRate = 1,
    AnimResource = "Tuosi03_Attack02_Montage",
    DisableBlendBone = true,
    NextNodeId = 110394,
    NodeId = 110393,
    PhantomAutoInput = 1,
    SkillNodeEffects = T.RT_23
  },
  [110394] = {
    AnimPath = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/Combat/Ch02/",
    AnimPlayRate = 1,
    AnimResource = "Tuosi03_Attack03_1_Montage",
    DisableBlendBone = true,
    ExtraNextNodeId = 110396,
    NextNodeId = 110395,
    NodeId = 110394,
    PhantomAutoInput = 1,
    SkillNodeEffects = T.RT_24
  },
  [110395] = {
    AnimPath = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/Combat/Ch02/",
    AnimPlayRate = 1,
    AnimResource = "Tuosi03_Attack03_2_Montage",
    DisableBlendBone = true,
    ExtraNextNodeId = 110396,
    NextNodeId = 110394,
    NodeId = 110395,
    PhantomAutoInput = 2,
    SkillNodeEffects = T.RT_24
  },
  [110396] = {
    AnimPath = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/Combat/Ch02/",
    AnimPlayRate = 1,
    AnimResource = "Tuosi03_Attack04_Montage",
    DisableBlendBone = true,
    NextNodeId = 110392,
    NodeId = 110396,
    SkillNodeEffects = T.RT_25
  },
  [110397] = {
    AnimPath = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/Combat/Ch02/",
    AnimPlayRate = 1,
    AnimResource = "Tuosi03_FallAttack_Montage",
    DisableBlendBone = true,
    NodeId = 110397,
    SkillNodeEffects = T.RT_26
  },
  [110411] = {
    AnimPath = "/Game/Asset/Char/Player/Char033_Qiu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Qiu_Skill01_Montage",
    DisableBlendBone = true,
    NodeId = 110411,
    SkillNodeEffects = T.RT_27
  },
  [110412] = {
    AnimPath = "/Game/Asset/Char/Player/Char033_Qiu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Qiu_Skill01_Loop_Montage",
    DisableBlendBone = true,
    NodeId = 110412,
    SkillNodeEffects = {
      110412,
      110413,
      110414,
      110416
    }
  },
  [110413] = {
    AnimPath = "/Game/Asset/Char/Player/Char033_Qiu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Qiu_Skill01_01_Montage",
    DisableBlendBone = true,
    NodeId = 110413,
    SkillNodeEffects = {110451}
  },
  [110414] = {
    AnimPath = "/Game/Asset/Char/Player/Char033_Qiu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Qiu_Skill01_02_Montage",
    DisableBlendBone = true,
    NodeId = 110414,
    SkillNodeEffects = {110461}
  },
  [110415] = {
    AnimPath = "/Game/Asset/Char/Player/Char033_Qiu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Qiu_Skill01_03_Montage",
    DisableBlendBone = true,
    NodeId = 110415,
    SkillNodeEffects = {110471}
  },
  [110419] = {
    AnimPath = "/Game/Asset/Char/Player/Char033_Qiu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1.3,
    AnimResource = "Qiu_Skill01_Montage",
    DisableBlendBone = true,
    NodeId = 110419,
    SkillNodeEffects = T.RT_27
  },
  [110421] = {
    AnimPath = "/Game/Asset/Char/Player/Char033_Qiu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Qiu_Skill02_Montage",
    DisableBlendBone = true,
    NodeId = 110421,
    SkillNodeEffects = {110421}
  },
  [120111] = {
    AnimPath = "/Game/Asset/Char/Player/NPC001_Nvzhu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Nvzhu_Dark_Skill01_Montage",
    CostSp = 5,
    DisableBlendBone = true,
    NodeId = 120111,
    SkillNodeEffects = {120111, 120112}
  },
  [120121] = {
    AnimPath = "/Game/Asset/Char/Player/NPC001_Nvzhu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Nvzhu_Dark_Skill02_Montage",
    CostSp = 5,
    DisableBlendBone = true,
    NodeId = 120121,
    SkillNodeEffects = {
      120121,
      120122,
      120123,
      120124
    }
  },
  [120211] = {
    AnimPath = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Falu_Skill01_On_Montage",
    DisableBlendBone = true,
    NodeId = 120211,
    SkillNodeEffects = {120211}
  },
  [120212] = {
    AnimPath = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Falu_Skill01_Off_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = true,
    NodeId = 120212,
    SkillNodeEffects = {120212}
  },
  [120221] = {
    AnimPath = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Falu_Skill02_Montage",
    DisableBlendBone = true,
    NodeId = 120221,
    SkillNodeEffects = {120221, 120222}
  },
  [120222] = {
    AnimPath = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Falu_Skill02_Montage",
    DisableBlendBone = true,
    NodeId = 120222,
    SkillNodeEffects = {
      120221,
      120222,
      120223
    }
  },
  [150111] = {
    AnimPath = "/Game/Asset/Char/Player/Char007_Baonu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Baonu_Skill01_Montage",
    CanExtractZVelocity = true,
    CostSp = 15,
    DisableBlendBone = true,
    NodeId = 150111,
    SkillNodeEffects = {150111, 150112}
  },
  [150121] = {
    AnimPath = "/Game/Asset/Char/Player/Char007_Baonu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Baonu_Skill02_On_Montage",
    CanExtractZVelocity = true,
    CostSp = 10,
    DisableBlendBone = true,
    NodeId = 150121,
    SkillNodeEffects = {150121, 150123}
  },
  [150122] = {
    AnimPath = "/Game/Asset/Char/Player/Char007_Baonu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Baonu_Skill02_Off_Montage",
    DisableBlendBone = true,
    NodeId = 150122,
    SkillNodeEffects = {150122}
  },
  [150131] = {
    AnimPath = "/Game/Asset/Char/Player/Char007_Baonu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Baonu_Skill02_Attack01_Montage",
    DisableBlendBone = true,
    NextNodeId = 150132,
    NodeId = 150131,
    PhantomAutoInput = 1,
    SkillNodeEffects = {150131}
  },
  [150132] = {
    AnimPath = "/Game/Asset/Char/Player/Char007_Baonu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Baonu_Skill02_Attack02_Montage",
    DisableBlendBone = true,
    NextNodeId = 150133,
    NodeId = 150132,
    PhantomAutoInput = 1,
    SkillNodeEffects = {150132}
  },
  [150133] = {
    AnimPath = "/Game/Asset/Char/Player/Char007_Baonu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Baonu_Skill02_Attack03_Montage",
    DisableBlendBone = true,
    NextNodeId = 150134,
    NodeId = 150133,
    PhantomAutoInput = 1,
    SkillNodeEffects = {150133}
  },
  [150134] = {
    AnimPath = "/Game/Asset/Char/Player/Char007_Baonu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Baonu_Skill02_Attack04_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = true,
    NextNodeId = 150131,
    NodeId = 150134,
    PhantomAutoInput = 2,
    SkillNodeEffects = {150134, 150135}
  },
  [150141] = {
    AnimPath = "/Game/Asset/Char/Player/Char007_Baonu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Baonu_Skill02_HeavyAttack_Montage",
    CanExtractZVelocity = true,
    CostSp = 25,
    DisableBlendBone = true,
    NodeId = 150141,
    SkillNodeEffects = {
      150141,
      150142,
      150143,
      150144,
      150145
    }
  },
  [150211] = {
    AnimPath = "/Game/Asset/Char/Player/Char031_Nifu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Nifu_Skill01_01_Montage",
    CostSp = 12,
    DisableBlendBone = true,
    NodeId = 150211,
    SkillNodeEffects = {150211, 150216}
  },
  [150212] = {
    AnimPath = "/Game/Asset/Char/Player/Char031_Nifu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Nifu_Skill01_02_Montage",
    CostSp = 12,
    DisableBlendBone = true,
    NodeId = 150212,
    SkillNodeEffects = {150212, 150215}
  },
  [150213] = {
    AnimPath = "/Game/Asset/Char/Player/Char031_Nifu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Nifu_Skill01_03_Montage",
    DisableBlendBone = true,
    NodeId = 150213,
    SkillNodeEffects = {150211, 150223}
  },
  [150214] = {
    AnimPath = "/Game/Asset/Char/Player/Char031_Nifu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Nifu_Skill01_04_Montage",
    DisableBlendBone = true,
    NodeId = 150214,
    SkillNodeEffects = {150212, 150222}
  },
  [150221] = {
    AnimPath = "/Game/Asset/Char/Player/Char031_Nifu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Nifu_Skill02_Montage",
    CostSp = 120,
    DisableBlendBone = true,
    NodeId = 150221,
    SkillNodeEffects = {150221}
  },
  [150311] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill01_Montage",
    DisableBlendBone = true,
    NodeId = 150311
  },
  [150321] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_On_Montage",
    CostSp = 100,
    DisableBlendBone = true,
    NodeId = 150321,
    SkillNodeEffects = {
      150321,
      150322,
      150325,
      150331,
      150328
    }
  },
  [150322] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_Off_Montage",
    CanExtractZVelocity = true,
    CostSp = 100,
    DisableBlendBone = true,
    NodeId = 150322,
    SkillNodeEffects = {
      150340,
      150341,
      150342,
      150346
    }
  },
  [150412] = {
    AnimPath = "/Game/Asset/Char/Player/Char032_Suyi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Suyi_Skill01_On_Montage",
    DisableBlendBone = true,
    NodeId = 150412,
    SkillNodeEffects = {150412}
  },
  [150413] = {
    AnimPath = "/Game/Asset/Char/Player/Char032_Suyi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Suyi_Skill01_Off_Montage",
    DisableBlendBone = true,
    NodeId = 150413,
    SkillNodeEffects = {150413}
  },
  [150421] = {
    AnimPath = "/Game/Asset/Char/Player/Char010_Saiqi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Saiqi_Skill02_On_Montage",
    DisableBlendBone = true,
    NodeId = 150421,
    SkillNodeEffects = {150421}
  },
  [150422] = {
    AnimPath = "/Game/Asset/Char/Player/Char032_Suyi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Suyi_Skill02_Off_Montage",
    DisableBlendBone = true,
    NodeId = 150422,
    SkillNodeEffects = {150422, 150425}
  },
  [150423] = {
    AnimPath = "/Game/Asset/Char/Player/Char010_Saiqi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Saiqi_Skill02_On_Montage",
    DisableBlendBone = true,
    NodeId = 150423,
    SkillNodeEffects = {150423}
  },
  [150431] = {
    AnimPath = "/Game/Asset/Char/Player/Char032_Suyi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Suyi_Skill02_01_Montage",
    CostBullet = 1,
    DisableBlendBone = true,
    MontageBlendOutTime = 0.5,
    NodeId = 150431,
    SkillNodeEffects = {150431, 150432}
  },
  [150432] = {
    AnimPath = "/Game/Asset/Char/Player/Char032_Suyi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Suyi_Skill02_01_Montage",
    CostBullet = 1,
    DisableBlendBone = true,
    MontageBlendOutTime = 0.5,
    NodeId = 150432,
    SkillNodeEffects = {150442, 150443}
  },
  [150441] = {
    AnimPath = "/Game/Asset/Char/Player/Char032_Suyi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Suyi_Skill02_Claymore_RunAttack_01_Montage",
    CostBullet = 5,
    DisableBlendBone = true,
    NextNodeId = 150442,
    NodeId = 150441,
    PhantomAutoInput = 1,
    SkillNodeEffects = {
      150451,
      150413,
      150455,
      150456
    }
  },
  [150442] = {
    AnimPath = "/Game/Asset/Char/Player/Char032_Suyi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Suyi_Skill02_Claymore_RunAttack_02_Montage",
    CostBullet = 5,
    DisableBlendBone = true,
    NextNodeId = 150441,
    NodeId = 150442,
    PhantomAutoInput = 1,
    SkillNodeEffects = {
      150452,
      150455,
      150456
    }
  },
  [150511] = {
    AnimPath = "/Game/Asset/Char/Player/Char037_Lizi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Lizi_Skill01_Start_Montage",
    DisableBlendBone = true,
    NodeId = 150511,
    SkillNodeEffects = {150511}
  },
  [150521] = {
    AnimPath = "/Game/Asset/Char/Player/Char037_Lizi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Lizi_Skill02_Montage",
    DisableBlendBone = true,
    NodeId = 150521
  },
  [150531] = {
    AnimPath = "/Game/Asset/Char/Player/Char037_Lizi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Lizi_Skill01_Attack01_Montage",
    DisableBlendBone = true,
    NextNodeId = 150531,
    NodeId = 150531,
    PhantomAutoInput = 2,
    SkillNodeEffects = {150531}
  },
  [150532] = {
    AnimPath = "/Game/Asset/Char/Player/Char037_Lizi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Lizi_Skill01_Attack02_Montage",
    DisableBlendBone = true,
    NextNodeId = 150532,
    NodeId = 150532,
    PhantomAutoInput = 2,
    SkillNodeEffects = {150532}
  },
  [150533] = {
    AnimPath = "/Game/Asset/Char/Player/Char037_Lizi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Lizi_Skill01_End01_Montage",
    DisableBlendBone = true,
    NextNodeId = 150534,
    NodeId = 150533,
    PhantomAutoInput = 1,
    SkillNodeEffects = {150512, 150533}
  },
  [150534] = {
    AnimPath = "/Game/Asset/Char/Player/Char037_Lizi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Lizi_Skill01_End02_Montage",
    DisableBlendBone = true,
    NodeId = 150534,
    PhantomAutoInput = 2,
    SkillNodeEffects = {150534}
  },
  [160111] = {
    AnimName = "Light_Skill01_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Skill/",
    CostSp = 15,
    DisableBlendBone = true,
    NodeId = 160111,
    SkillNodeEffects = {160111, 160112}
  },
  [160112] = {
    AnimName = "Light_Skill02_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Skill/",
    CostSp = 35,
    DisableBlendBone = true,
    NodeId = 160112,
    SkillNodeEffects = {
      160121,
      160122,
      160123,
      160125
    }
  },
  [180111] = {
    AnimPath = "/Game/Asset/Char/Player/Char019_Feina/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Feina_Skill01_Montage",
    CostSp = 15,
    DisableBlendBone = true,
    NodeId = 180111,
    SkillNodeEffects = {180111, 180112}
  },
  [180121] = {
    AnimPath = "/Game/Asset/Char/Player/Char019_Feina/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Feina_Skill02_On_Montage",
    CostSp = 10,
    DisableBlendBone = true,
    NodeId = 180121,
    SkillNodeEffects = {180123}
  },
  [180122] = {
    AnimPath = "/Game/Asset/Char/Player/Char019_Feina/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Feina_Skill02_Off_Montage",
    DisableBlendBone = true,
    NodeId = 180122,
    SkillNodeEffects = {180122}
  },
  [210111] = {
    AnimPath = "/Game/Asset/Char/Player/Char005_Shuimu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Shuimu_Skill01_Montage",
    CostSp = 35,
    DisableBlendBone = true,
    NodeId = 210111,
    SkillNodeEffects = {210111}
  },
  [210112] = {
    AnimPath = "/Game/Asset/Char/Player/Char005_Shuimu/Animation/Summon/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Shuimu_Summon_Attack_Montage",
    DisableBlendBone = false,
    NodeId = 210112,
    SkillNodeEffects = {210112}
  },
  [210113] = {
    AnimPath = "/Game/Asset/Char/Player/Char005_Shuimu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Shuimu_Skill01_Montage",
    CostSp = 35,
    DisableBlendBone = true,
    NodeId = 210113,
    SkillNodeEffects = {210113}
  },
  [210114] = {
    AnimPath = "/Game/Asset/Char/Player/Char005_Shuimu/Animation/Summon/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Shuimu_Summon_Attack_Montage",
    DisableBlendBone = false,
    NodeId = 210114,
    SkillNodeEffects = {210114}
  },
  [210115] = {
    AnimPath = "/Game/Asset/Char/Player/Char005_Shuimu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Shuimu_Skill01_Loop_Montage",
    CostSp = 35,
    DisableBlendBone = true,
    NodeId = 210115,
    SkillNodeEffects = {210115}
  },
  [210116] = {
    AnimPath = "/Game/Asset/Char/Player/Char005_Shuimu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Shuimu_Skill01_Loop_Montage",
    CostSp = 35,
    DisableBlendBone = true,
    NodeId = 210116,
    SkillNodeEffects = {210116}
  },
  [210121] = {
    AnimPath = "/Game/Asset/Char/Player/Char005_Shuimu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Shuimu_Skill02_Montage",
    CanExtractZVelocity = true,
    CostSp = 75,
    DisableBlendBone = true,
    NodeId = 210121,
    SkillNodeEffects = {
      210121,
      210122,
      210123
    }
  },
  [210211] = {
    AnimPath = "/Game/Asset/Char/Player/Char035_Eve/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Eve_Skill01_02_Montage",
    CostSp = 10,
    DisableBlendBone = true,
    NextNodeId = 210212,
    NodeId = 210211,
    SkillNodeEffects = T.RT_30
  },
  [210212] = {
    AnimPath = "/Game/Asset/Char/Player/Char035_Eve/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Eve_Skill01_01_Montage",
    CostSp = 10,
    DisableBlendBone = true,
    NextNodeId = 210211,
    NodeId = 210212,
    SkillNodeEffects = T.RT_30
  },
  [210213] = {
    AnimPath = "/Game/Asset/Char/Player/Char035_Eve/Animation/Summon/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Eve_Summon_Soldier_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 210213,
    SkillNodeEffects = T.RT_31
  },
  [210214] = {
    AnimPath = "/Game/Asset/Char/Player/Char035_Eve/Animation/Summon/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Eve_Summon_Soldier_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 210214,
    SkillNodeEffects = T.RT_31
  },
  [210215] = {
    AnimPath = "/Game/Asset/Char/Player/Char035_Eve/Animation/Summon/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Eve_Summon_Rook_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 210215,
    SkillNodeEffects = T.RT_32
  },
  [210216] = {
    AnimPath = "/Game/Asset/Char/Player/Char035_Eve/Animation/Summon/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Eve_Summon_Rook_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 210216,
    SkillNodeEffects = T.RT_32
  },
  [210217] = {
    AnimPath = "/Game/Asset/Char/Player/Char035_Eve/Animation/Summon/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Eve_Summon_Queen_Attack01_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 210217,
    SkillNodeEffects = T.RT_32
  },
  [210221] = {
    AnimPath = "/Game/Asset/Char/Player/Char035_Eve/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Eve_Skill02_Montage",
    CanExtractZVelocity = true,
    CostSp = 45,
    DisableBlendBone = true,
    NodeId = 210221,
    SkillNodeEffects = {210241}
  },
  [210222] = {
    AnimPath = "/Game/Asset/Char/Player/Char035_Eve/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Eve_Skill02_Off_Montage",
    DisableBlendBone = true,
    NodeId = 210222,
    SkillNodeEffects = {210251}
  },
  [210231] = {
    AnimPath = "/Game/Asset/Char/Player/Char035_Eve/Animation/Summon/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Eve_Summon_Replicant_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 210231,
    SkillNodeEffects = {210263}
  },
  [210232] = {
    AnimPath = "/Game/Asset/Char/Player/Char035_Eve/Animation/Summon/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Eve_Summon_Replicant_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 210232
  },
  [230111] = {
    AnimPath = "/Game/Asset/Char/Player/Char004_Zhangyu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Zhangyu_Skill01_Montage",
    CostSp = 30,
    DisableBlendBone = true,
    NodeId = 230111,
    SkillNodeEffects = {
      230111,
      230112,
      230113
    }
  },
  [230121] = {
    AnimPath = "/Game/Asset/Char/Player/Char004_Zhangyu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Zhangyu_Skill02_Montage",
    CanExtractZVelocity = true,
    CostSp = 50,
    DisableBlendBone = true,
    NodeId = 230121,
    SkillNodeEffects = {
      230121,
      230122,
      230123
    }
  },
  [230122] = {
    AnimPath = "/Game/Asset/Char/Player/Char004_Zhangyu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Zhangyu_Skill02_Montage",
    CanExtractZVelocity = true,
    CostSp = 50,
    DisableBlendBone = true,
    NodeId = 230122,
    SkillNodeEffects = {
      230124,
      230125,
      230126
    }
  },
  [230131] = {
    AnimPath = "/Game/Asset/Char/Player/Char004_Zhangyu/Animation/Tentacle/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Zhangyu_Tentacle_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 230131,
    SkillNodeEffects = {230135}
  },
  [230132] = {
    AnimPath = "/Game/Asset/Char/Player/Char004_Zhangyu/Animation/Tentacle/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Zhangyu_Tentacle_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 230132,
    SkillNodeEffects = {230133}
  },
  [240111] = {
    AnimPath = "/Game/Asset/Char/Player/Char015_Baiheng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Baiheng_Skill01_Montage",
    CostSp = 50,
    DisableBlendBone = true,
    NodeId = 240111,
    SkillNodeEffects = {240111}
  },
  [240112] = {
    AnimPath = "/Game/Asset/Char/Player/Char015_Baiheng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Baiheng_Skill01_Montage",
    CostSp = 50,
    DisableBlendBone = true,
    NodeId = 240112,
    SkillNodeEffects = {240112}
  },
  [240113] = {
    AnimPath = "/Game/Asset/Char/Player/Char015_Baiheng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Baiheng_Skill01_Loop_Montage",
    CostSp = 50,
    DisableBlendBone = true,
    NodeId = 240113,
    SkillNodeEffects = {240113}
  },
  [240114] = {
    AnimPath = "/Game/Asset/Char/Player/Char015_Baiheng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Baiheng_Skill01_Loop_Montage",
    CostSp = 50,
    DisableBlendBone = true,
    NodeId = 240114,
    SkillNodeEffects = {240114}
  },
  [240121] = {
    AnimPath = "/Game/Asset/Char/Player/Char015_Baiheng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Baiheng_Skill02_Montage",
    CostSp = 75,
    DisableBlendBone = true,
    NodeId = 240121,
    SkillNodeEffects = {
      240121,
      240122,
      240123
    }
  },
  [240141] = {
    AnimPath = "/Game/Asset/Char/Player/Char015_Baiheng/Animation/Summon/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Baiheng_Summon_Skill01_Montage",
    DisableBlendBone = true,
    NodeId = 240141,
    SkillNodeEffects = {240141}
  },
  [310111] = {
    AnimPath = "/Game/Asset/Char/Player/Char011_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Linen_Skill01_02_Montage",
    CostSp = 12,
    DisableBlendBone = true,
    NodeId = 310111,
    SkillNodeEffects = T.RT_34
  },
  [310112] = {
    AnimPath = "/Game/Asset/Char/Player/Char011_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Linen_Skill01_Montage",
    CostSp = 12,
    DisableBlendBone = true,
    NodeId = 310112,
    SkillNodeEffects = T.RT_34
  },
  [310121] = {
    AnimPath = "/Game/Asset/Char/Player/Char011_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Linen_Skill02_On_Montage",
    CostSp = 10,
    DisableBlendBone = true,
    NodeId = 310121,
    SkillNodeEffects = {310120, 310121}
  },
  [310122] = {
    AnimPath = "/Game/Asset/Char/Player/Char011_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Linen_Skill02_Off_Montage",
    DisableBlendBone = true,
    NodeId = 310122,
    SkillNodeEffects = {310123}
  },
  [310123] = {
    AnimPath = "/Game/Asset/Char/Player/Char011_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Linen_Skill02_On_Montage",
    CostSp = 10,
    DisableBlendBone = true,
    NodeId = 310123,
    SkillNodeEffects = {310121, 310122}
  },
  [310141] = {
    AnimPath = "/Game/Asset/Char/Player/Char011_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Linen_Skill02_01_Montage",
    DisableBlendBone = true,
    ExtraNextNodeId = 310151,
    NextNodeId = 310142,
    NodeId = 310141,
    PhantomAutoInput = 1,
    SkillNodeEffects = T.RT_35
  },
  [310142] = {
    AnimPath = "/Game/Asset/Char/Player/Char011_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Linen_Skill02_02_Montage",
    DisableBlendBone = true,
    ExtraNextNodeId = 310151,
    NextNodeId = 310143,
    NodeId = 310142,
    PhantomAutoInput = 1,
    SkillNodeEffects = T.RT_35
  },
  [310143] = {
    AnimPath = "/Game/Asset/Char/Player/Char011_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Linen_Skill02_03_Montage",
    DisableBlendBone = true,
    ExtraNextNodeId = 310151,
    NextNodeId = 310144,
    NodeId = 310143,
    PhantomAutoInput = 1,
    SkillNodeEffects = T.RT_35
  },
  [310144] = {
    AnimPath = "/Game/Asset/Char/Player/Char011_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Linen_Skill02_04_Montage",
    DisableBlendBone = true,
    ExtraNextNodeId = 310151,
    NextNodeId = 310145,
    NodeId = 310144,
    PhantomAutoInput = 1,
    SkillNodeEffects = T.RT_35
  },
  [310145] = {
    AnimPath = "/Game/Asset/Char/Player/Char011_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Linen_Skill02_05_Montage",
    DisableBlendBone = true,
    ExtraNextNodeId = 310151,
    NextNodeId = 310146,
    NodeId = 310145,
    PhantomAutoInput = 1,
    SkillNodeEffects = T.RT_35
  },
  [310146] = {
    AnimPath = "/Game/Asset/Char/Player/Char011_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Linen_Skill02_06_Montage",
    DisableBlendBone = true,
    ExtraNextNodeId = 310151,
    NextNodeId = 310147,
    NodeId = 310146,
    PhantomAutoInput = 1,
    SkillNodeEffects = T.RT_35
  },
  [310147] = {
    AnimPath = "/Game/Asset/Char/Player/Char011_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Linen_Skill02_07_Montage",
    DisableBlendBone = true,
    ExtraNextNodeId = 310151,
    NextNodeId = 310148,
    NodeId = 310147,
    PhantomAutoInput = 1,
    SkillNodeEffects = T.RT_35
  },
  [310148] = {
    AnimPath = "/Game/Asset/Char/Player/Char011_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Linen_Skill02_08_Montage",
    DisableBlendBone = true,
    ExtraNextNodeId = 310151,
    NextNodeId = 310149,
    NodeId = 310148,
    PhantomAutoInput = 1,
    SkillNodeEffects = T.RT_35
  },
  [310149] = {
    AnimPath = "/Game/Asset/Char/Player/Char011_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Linen_Skill02_09_Montage",
    DisableBlendBone = true,
    ExtraNextNodeId = 310151,
    NextNodeId = 310150,
    NodeId = 310149,
    PhantomAutoInput = 1,
    SkillNodeEffects = T.RT_35
  },
  [310150] = {
    AnimPath = "/Game/Asset/Char/Player/Char011_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Linen_Skill02_10_Montage",
    DisableBlendBone = true,
    ExtraNextNodeId = 310151,
    NextNodeId = 310141,
    NodeId = 310150,
    PhantomAutoInput = 1,
    SkillNodeEffects = T.RT_35
  },
  [310151] = {
    AnimPath = "/Game/Asset/Char/Player/Char011_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Linen_Skill02_End_Montage",
    DisableBlendBone = true,
    NodeId = 310151
  },
  [310211] = {
    AnimPath = "/Game/Asset/Char/Player/Char023_Xier/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Xier_Skill02_Montage",
    CanExtractZVelocity = true,
    CostSp = 30,
    DisableBlendBone = true,
    NodeId = 310211,
    SkillNodeEffects = {
      310202,
      310203,
      310205
    }
  },
  [310311] = {
    AnimPath = "/Game/Asset/Char/Player/Char017_Yeer/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Yeer_Skill01_01_Montage",
    CostSp = 15,
    DisableBlendBone = true,
    NodeId = 310311,
    PhantomAutoInput = 1,
    SkillNodeEffects = {
      310311,
      310316,
      310317
    }
  },
  [310312] = {
    AnimPath = "/Game/Asset/Char/Player/Char017_Yeer/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Yeer_Skill01_02_Montage",
    CostSp = 15,
    DisableBlendBone = true,
    NodeId = 310312,
    PhantomAutoInput = 2,
    SkillNodeEffects = {310311, 310317}
  },
  [310321] = {
    AnimPath = "/Game/Asset/Char/Player/Char017_Yeer/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Yeer_Skill02_On_Montage",
    CostSp = 30,
    DisableBlendBone = true,
    NodeId = 310321,
    SkillNodeEffects = {310321}
  },
  [320111] = {
    AnimPath = "/Game/Asset/Char/Player/Char006_Haier/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Haier_Skill01_Montage",
    CostSp = 75,
    DisableBlendBone = true,
    NodeId = 320111,
    SkillNodeEffects = {320111}
  },
  [320121] = {
    AnimPath = "/Game/Asset/Char/Player/Char006_Haier/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Haier_Skill02_Montage",
    CostSp = 50,
    DisableBlendBone = true,
    NodeId = 320121,
    SkillNodeEffects = {320123}
  },
  [320212] = {
    AnimPath = "/Game/Asset/Char/Player/Char014_Kami/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kami_Skill01Loop_01_Montage",
    CostSp = 1,
    DisableBlendBone = true,
    NextNodeId = 320213,
    NodeId = 320212,
    PhantomAutoInput = 1,
    SkillNodeEffects = {
      320212,
      320222,
      320215,
      320223
    }
  },
  [320213] = {
    AnimPath = "/Game/Asset/Char/Player/Char014_Kami/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kami_Skill01Loop_02_Montage",
    CostSp = 1,
    DisableBlendBone = true,
    NextNodeId = 320214,
    NodeId = 320213,
    PhantomAutoInput = 1,
    SkillNodeEffects = T.RT_36
  },
  [320214] = {
    AnimPath = "/Game/Asset/Char/Player/Char014_Kami/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kami_Skill01Loop_03_Montage",
    CostSp = 1,
    DisableBlendBone = true,
    NextNodeId = 320215,
    NodeId = 320214,
    PhantomAutoInput = 1,
    SkillNodeEffects = T.RT_36
  },
  [320215] = {
    AnimPath = "/Game/Asset/Char/Player/Char014_Kami/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kami_Skill01Loop_04_Montage",
    CostSp = 1,
    DisableBlendBone = true,
    NextNodeId = 320213,
    NodeId = 320215,
    PhantomAutoInput = 1,
    SkillNodeEffects = T.RT_36
  },
  [320221] = {
    AnimPath = "/Game/Asset/Char/Player/Char014_Kami/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kami_Skill02_Montage",
    CostSp = 40,
    DisableBlendBone = true,
    NodeId = 320221,
    SkillNodeEffects = {
      320231,
      320232,
      320233,
      320234,
      320235
    }
  },
  [330111] = {
    AnimPath = "/Game/Asset/Char/Player/Char024_Maer/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Maer_Skill01_Montage",
    CostSp = 10,
    DisableBlendBone = true,
    NodeId = 330111,
    SkillNodeEffects = {330111, 330112}
  },
  [330112] = {
    AnimPath = "/Game/Asset/Char/Player/Char024_Maer/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Maer_Skill01_Loop_Montage",
    CostSp = 10,
    DisableBlendBone = true,
    NodeId = 330112,
    PhantomPressTime = 5,
    SkillNodeEffects = {
      330114,
      330115,
      330116
    }
  },
  [330121] = {
    AnimPath = "/Game/Asset/Char/Player/Char024_Maer/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Maer_Skill02_Montage",
    CostSp = 50,
    DisableBlendBone = true,
    NodeId = 330121,
    SkillNodeEffects = {330121, 330130}
  },
  [410111] = {
    AnimPath = "/Game/Asset/Char/Player/Char020_Lise/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Lise_Skill01_Montage",
    CanExtractZVelocity = true,
    CostSp = 20,
    DisableBlendBone = true,
    NodeId = 410111,
    SkillNodeEffects = {
      410112,
      410113,
      410116,
      410118,
      410119
    }
  },
  [410121] = {
    AnimPath = "/Game/Asset/Char/Player/Char020_Lise/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Lise_Skill02_Montage",
    CanExtractZVelocity = true,
    CostSp = 10,
    DisableBlendBone = true,
    NodeId = 410121,
    SkillNodeEffects = {410121, 410126}
  },
  [410211] = {
    AnimPath = "/Game/Asset/Char/Player/Char029_Zhiliu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Zhiliu_Skill01_01_Montage",
    CostSp = 15,
    DisableBlendBone = true,
    NodeId = 410211,
    SkillNodeEffects = {410211, 410212}
  },
  [410212] = {
    AnimPath = "/Game/Asset/Char/Player/Char029_Zhiliu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Zhiliu_Skill01_02_Montage",
    CostSp = 15,
    DisableBlendBone = true,
    NodeId = 410212,
    SkillNodeEffects = {410214, 410215}
  },
  [410221] = {
    AnimPath = "/Game/Asset/Char/Player/Char029_Zhiliu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Zhiliu_Skill02_Montage",
    CostSp = 20,
    DisableBlendBone = true,
    NodeId = 410221,
    SkillNodeEffects = {410221}
  },
  [410222] = {
    AnimPath = "/Game/Asset/Char/Player/Char029_Zhiliu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Zhiliu_Skill02_TT_Montage",
    CanExtractZVelocity = true,
    CostSp = 45,
    DisableBlendBone = true,
    NodeId = 410222,
    SkillNodeEffects = {410231, 410227}
  },
  [410223] = {
    AnimPath = "/Game/Asset/Char/Player/Char029_Zhiliu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Zhiliu_Skill02_TD_Montage",
    CanExtractZVelocity = true,
    CostSp = 60,
    DisableBlendBone = true,
    NodeId = 410223,
    SkillNodeEffects = {
      410240,
      410241,
      410227
    }
  },
  [410224] = {
    AnimPath = "/Game/Asset/Char/Player/Char029_Zhiliu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Zhiliu_Skill02_DD_Montage",
    CostSp = 30,
    DisableBlendBone = true,
    NodeId = 410224,
    SkillNodeEffects = {
      410225,
      410226,
      410227
    }
  },
  [410225] = {
    AnimPath = "/Game/Asset/Char/Player/Char029_Zhiliu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Zhiliu_Skill02_TD_Montage",
    CanExtractZVelocity = true,
    CostSp = 60,
    DisableBlendBone = true,
    NodeId = 410225,
    SkillNodeEffects = {
      410260,
      410261,
      410227
    }
  },
  [420111] = {
    AnimPath = "/Game/Asset/Char/Player/Char008_Yuming/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Yuming_Skill01_Montage",
    CostSp = 18,
    DisableBlendBone = true,
    NodeId = 420111,
    SkillNodeEffects = {420111, 420112}
  },
  [420112] = {
    AnimPath = "/Game/Asset/Char/Player/Char008_Yuming/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Yuming_Skill01_FallAttack_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = true,
    NodeId = 420112,
    SkillNodeEffects = {
      420140,
      420141,
      420143,
      420144
    }
  },
  [420113] = {
    AnimPath = "/Game/Asset/Char/Player/Char008_Yuming/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Yuming_Skill01_Montage",
    CostSp = 18,
    DisableBlendBone = true,
    NodeId = 420113,
    SkillNodeEffects = {420118, 420112}
  },
  [420114] = {
    AnimPath = "/Game/Asset/Char/Player/Char008_Yuming/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Yuming_Skill01_FallAttack_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = true,
    NodeId = 420114,
    SkillNodeEffects = {
      420140,
      420142,
      420143,
      420144
    }
  },
  [420121] = {
    AnimPath = "/Game/Asset/Char/Player/Char008_Yuming/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Yuming_Skill02_Montage",
    CostSp = 100,
    DisableBlendBone = true,
    NodeId = 420121,
    SkillNodeEffects = {420121, 420122}
  },
  [420211] = {
    AnimPath = "/Game/Asset/Char/Player/Char012_Landi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Landi_Skill01_Montage",
    CostSp = 30,
    DisableBlendBone = true,
    NodeId = 420211,
    SkillNodeEffects = {420211, 420214}
  },
  [420221] = {
    AnimPath = "/Game/Asset/Char/Player/Char012_Landi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Landi_Skill02_Montage",
    CanExtractZVelocity = true,
    CostSp = 30,
    DisableBlendBone = true,
    NodeId = 420221,
    SkillNodeEffects = {420221}
  },
  [420241] = {
    AnimPath = "/Game/Asset/Char/Player/Char012_Landi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Landi_Skill01_End_Montage",
    DisableBlendBone = true,
    NodeId = 420241,
    SkillNodeEffects = {420213}
  },
  [430111] = {
    AnimPath = "/Game/Asset/Char/Player/Char009_Xibi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Xibi_Skill01_Montage",
    CostSp = 30,
    DisableBlendBone = true,
    NodeId = 430111,
    SkillNodeEffects = {430111}
  },
  [430121] = {
    AnimPath = "/Game/Asset/Char/Player/Char009_Xibi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Xibi_Skill02_Montage",
    CostSp = 50,
    DisableBlendBone = true,
    NodeId = 430121,
    SkillNodeEffects = {430121}
  },
  [510111] = {
    AnimPath = "/Game/Asset/Char/Player/Char021_Songlu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Songlu_Skill01_Montage",
    CostSp = 20,
    DisableBlendBone = true,
    NodeId = 510111,
    SkillNodeEffects = {510114, 510111}
  },
  [510112] = {
    AnimPath = "/Game/Asset/Char/Player/Char021_Songlu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Songlu_Skill01_Ride_HitWall_Montage",
    CostSp = 0,
    DisableBlendBone = true,
    NodeId = 510112,
    SkillNodeEffects = {510113, 510116}
  },
  [510121] = {
    AnimPath = "/Game/Asset/Char/Player/Char021_Songlu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Songlu_Skill02_On_Montage",
    CostSp = 60,
    DisableBlendBone = true,
    NodeId = 510121,
    SkillNodeEffects = {510121}
  },
  [510122] = {
    AnimPath = "/Game/Asset/Char/Player/Char021_Songlu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Songlu_Skill02_Off_Montage",
    CostSp = 0,
    DisableBlendBone = true,
    NodeId = 510122,
    SkillNodeEffects = {510122}
  },
  [510141] = {
    AnimPath = "/Game/Asset/Char/Player/Char021_Songlu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1.2,
    AnimResource = "Songlu_Skill02_RunAttack_01_Montage",
    DisableBlendBone = true,
    NextNodeId = 510142,
    NodeId = 510141,
    SkillNodeEffects = {510141}
  },
  [510142] = {
    AnimPath = "/Game/Asset/Char/Player/Char021_Songlu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1.2,
    AnimResource = "Songlu_Skill02_RunAttack_02_Montage",
    DisableBlendBone = true,
    NextNodeId = 510141,
    NodeId = 510142,
    SkillNodeEffects = {510142}
  },
  [510151] = {
    AnimPath = "/Game/Asset/Char/Player/Char021_Songlu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Songlu_Skill02_FallAttack_Montage",
    DisableBlendBone = true,
    NodeId = 510151,
    SkillNodeEffects = {510151, 510152}
  },
  [510171] = {
    AnimPath = "/Game/Asset/Char/Player/Char021_Songlu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Songlu_Condemn02_Montage",
    NodeId = 510171,
    SkillNodeEffects = T.RT_33
  },
  [510211] = {
    AnimPath = "/Game/Asset/Char/Player/Char018_Aote/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Aote_Skill01_Montage",
    CostSp = 10,
    DisableBlendBone = true,
    NodeId = 510211,
    SkillNodeEffects = {510211, 510212}
  },
  [510212] = {
    AnimPath = "/Game/Asset/Char/Player/Char018_Aote/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Aote_Skill01_Montage",
    CostSp = 10,
    DisableBlendBone = true,
    NodeId = 510212,
    SkillNodeEffects = {510213, 510212}
  },
  [510221] = {
    AnimPath = "/Game/Asset/Char/Player/Char018_Aote/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Aote_Skill02_Montage",
    CostSp = 60,
    DisableBlendBone = true,
    NodeId = 510221,
    SkillNodeEffects = {
      510221,
      510222,
      510223
    }
  },
  [530111] = {
    AnimPath = "/Game/Asset/Char/Player/Char010_Saiqi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Saiqi_Skill01_Montage",
    CostSp = 30,
    DisableBlendBone = true,
    NodeId = 530111,
    SkillNodeEffects = {530112}
  },
  [530121] = {
    AnimPath = "/Game/Asset/Char/Player/Char010_Saiqi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Saiqi_Skill02_On_Montage",
    CostSp = 10,
    DisableBlendBone = true,
    NodeId = 530121,
    SkillNodeEffects = {530121}
  },
  [530122] = {
    AnimPath = "/Game/Asset/Char/Player/Char010_Saiqi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Saiqi_Skill02_Off_Montage",
    DisableBlendBone = true,
    NodeId = 530122,
    SkillNodeEffects = {530122}
  },
  [530123] = {
    AnimPath = "/Game/Asset/Char/Player/Char010_Saiqi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Saiqi_Skill02_Montage",
    DisableBlendBone = true,
    MontageBlendOutTime = 0.5,
    NodeId = 530123,
    PhantomPressTime = 5,
    SkillNodeEffects = {530123, 530126}
  },
  [530151] = {
    AnimPath = "/Game/Asset/Char/Player/Char010_Saiqi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Saiqi_Condemn02_Montage",
    NodeId = 530151,
    SkillNodeEffects = T.RT_33
  },
  [540111] = {
    AnimPath = "/Game/Asset/Char/Player/Char026_Dafu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Dafu_Skill01_Montage",
    CostSp = 50,
    DisableBlendBone = true,
    NodeId = 540111,
    SkillNodeEffects = {540111}
  },
  [540112] = {
    AnimPath = "/Game/Asset/Char/Player/Char026_Dafu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Dafu_Skill01_Montage",
    CostSp = 50,
    DisableBlendBone = true,
    NodeId = 540112,
    SkillNodeEffects = {540113}
  },
  [540121] = {
    AnimPath = "/Game/Asset/Char/Player/Char026_Dafu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Dafu_Skill02_Montage",
    CostSp = 60,
    DisableBlendBone = true,
    NodeId = 540121,
    SkillNodeEffects = {
      540121,
      540122,
      540123
    }
  },
  [540122] = {
    AnimPath = "/Game/Asset/Char/Player/Char026_Dafu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Dafu_Skill02_Montage",
    CostSp = 60,
    DisableBlendBone = true,
    NodeId = 540122,
    SkillNodeEffects = {
      540124,
      540122,
      540123
    }
  },
  [540211] = {
    AnimPath = "/Game/Asset/Char/Player/Char026_Dafu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Dafu_Skill01_Montage",
    CostSp = 50,
    DisableBlendBone = true,
    NodeId = 540211,
    SkillNodeEffects = {
      540211,
      540212,
      540201
    }
  },
  [540220] = {
    AnimPath = "/Game/Asset/Char/Player/Char026_Dafu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Dafu_Skill02_Montage",
    CostSp = 60,
    DisableBlendBone = true,
    NodeId = 540220,
    SkillNodeEffects = {540221}
  },
  [540221] = {
    AnimPath = "/Game/Asset/Char/Player/Char034_Lilikou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Lilikou_Skill02_Left_Montage",
    DisableBlendBone = true,
    NodeId = 540221
  },
  [540222] = {
    AnimPath = "/Game/Asset/Char/Player/Char034_Lilikou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Lilikou_Skill02_Right_Montage",
    DisableBlendBone = true,
    NodeId = 540222
  },
  [540223] = {
    AnimPath = "/Game/Asset/Char/Player/Char026_Dafu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Dafu_Skill02_Montage",
    CostSp = 60,
    DisableBlendBone = true,
    NodeId = 540223,
    SkillNodeEffects = {540222}
  },
  [540231] = {
    AnimPath = "/Game/Asset/Char/Player/Char026_Dafu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Dafu_Skill01_Montage",
    CostSp = 50,
    DisableBlendBone = true,
    NodeId = 540231,
    SkillNodeEffects = {540231, 540202}
  },
  [540241] = {
    AnimPath = "/Game/Asset/Char/Player/Char026_Dafu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Dafu_Skill01_Montage",
    CostSp = 50,
    DisableBlendBone = true,
    NodeId = 540241,
    SkillNodeEffects = {540241, 540203}
  },
  [540251] = {
    AnimPath = "/Game/Asset/Char/Player/Char034_Lilikou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Lilikou_Skill02_Finish_Montage",
    DisableBlendBone = true,
    NodeId = 540251,
    SkillNodeEffects = {540251, 540252}
  },
  [600101] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Jichong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Jichong_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 600101,
    RootMotionRadius = 2,
    SkillNodeEffects = {600101}
  },
  [600102] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Jichong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Jichong_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 600102,
    RootMotionRadius = 2,
    SkillNodeEffects = {600102}
  },
  [600103] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Jichong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Jichong_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 600103,
    SkillNodeEffects = {600103}
  },
  [600104] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Jichong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Jichong_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 600104
  },
  [600111] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Jichong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Jichong_Alarm01_Montage",
    DisableBlendBone = false,
    NodeId = 600111,
    SkillNodeEffects = T.RT_4
  },
  [600201] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Youji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Youji_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 600201,
    SkillNodeEffects = {600201}
  },
  [600202] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Youji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Youji_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 600202,
    SkillNodeEffects = {600202, 600203}
  },
  [600203] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Youji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Youji_Reload_Montage",
    DisableBlendBone = false,
    NodeId = 600203
  },
  [600204] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Youji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Youji_Single_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 600204,
    RootMotionRadius = 2,
    SkillNodeEffects = T.RT_37
  },
  [600205] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Youji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Youji_Single_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 600205,
    RootMotionRadius = 2,
    SkillNodeEffects = T.RT_37
  },
  [600211] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Youji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Youji_Alarm01_Montage",
    DisableBlendBone = false,
    NodeId = 600211,
    SkillNodeEffects = T.RT_4
  },
  [600301] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Piaofu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Piaofu_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 600301,
    SkillNodeEffects = {600301}
  },
  [600302] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Piaofu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Piaofu_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 600302,
    SkillNodeEffects = {600302, 600303}
  },
  [600303] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Piaofu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Piaofu_C01_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 600303,
    SkillNodeEffects = {600304}
  },
  [600311] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Piaofu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Piaofu_Alarm01_Montage",
    DisableBlendBone = false,
    NodeId = 600311,
    SkillNodeEffects = T.RT_4
  },
  [600401] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Baotu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Baotu_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 600401,
    RootMotionRadius = 2,
    SkillNodeEffects = {600401}
  },
  [600402] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Baotu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Baotu_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 600402,
    RootMotionRadius = 2,
    SkillNodeEffects = {600402}
  },
  [600403] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Baotu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Baotu_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 600403,
    SkillNodeEffects = {
      600403,
      600404,
      600405,
      600406,
      600407
    }
  },
  [600404] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Baotu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Baotu_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 600404,
    SkillNodeEffects = {600408, 600409}
  },
  [600411] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Baotu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Baotu_Alarm01_Montage",
    DisableBlendBone = false,
    NodeId = 600411,
    SkillNodeEffects = T.RT_4
  },
  [600501] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Longcao/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Longcao_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 600501,
    SkillNodeEffects = {600501}
  },
  [600502] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Longcao/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Longcao_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 600502,
    SkillNodeEffects = T.RT_38
  },
  [600503] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Longcao/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Longcao_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 600503,
    SkillNodeEffects = T.RT_39
  },
  [600504] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Longcao/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Longcao_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 600504,
    SkillNodeEffects = T.RT_40
  },
  [600505] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Longcao/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Longcao_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 600505,
    SkillNodeEffects = T.RT_38
  },
  [600506] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Longcao/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Longcao_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 600506,
    SkillNodeEffects = T.RT_39
  },
  [600507] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Longcao/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Longcao_Skill06_Montage",
    DisableBlendBone = false,
    NodeId = 600507,
    SkillNodeEffects = T.RT_40
  },
  [600508] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Longcao/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Longcao_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 600508,
    SkillNodeEffects = T.RT_39
  },
  [600601] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Banyun/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Banyun_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 600601,
    SkillNodeEffects = {600601}
  },
  [600602] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Banyun/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Banyun_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 600602
  },
  [600603] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Banyun/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Banyun_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 600603,
    SkillNodeEffects = {600604, 600605}
  },
  [600611] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Banyun/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Banyun_Alarm01_Montage",
    DisableBlendBone = false,
    NodeId = 600611,
    SkillNodeEffects = T.RT_4
  },
  [600701] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Zhuoxin/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Zhuoxin_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 600701,
    SkillNodeEffects = {600701}
  },
  [600702] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Zhuoxin/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Zhuoxin_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 600702,
    SkillNodeEffects = {600704}
  },
  [600711] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Zhuoxin/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Zhuoxin_Alarm01_Montage",
    DisableBlendBone = false,
    NodeId = 600711,
    SkillNodeEffects = T.RT_4
  },
  [601101] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Jichong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Jichong_C01_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 601101,
    SkillNodeEffects = {601101}
  },
  [601201] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Youji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Youji_C01_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 601201,
    SkillNodeEffects = {601201, 601205}
  },
  [601202] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Youji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Youji_C01_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 601202,
    SkillNodeEffects = {601201, 601202}
  },
  [601301] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Piaofu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Piaofu_C01_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 601301,
    SkillNodeEffects = {601301, 601302}
  },
  [601302] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Piaofu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Piaofu_C01_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 601302,
    SkillNodeEffects = {601304}
  },
  [601401] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Baotu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Baotu_C01_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 601401,
    RootMotionRadius = 2,
    SkillNodeEffects = {601401}
  },
  [601402] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Baotu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Baotu_C01_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 601402,
    RootMotionRadius = 2,
    SkillNodeEffects = {601402}
  },
  [601403] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Baotu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Baotu_C01_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 601403,
    SkillNodeEffects = {601403, 601404}
  },
  [601405] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Baotu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Baotu_C01_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 601405,
    SkillNodeEffects = {601405, 601406}
  },
  [601501] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Fangjin/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Fangjin_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 601501,
    SkillNodeEffects = {601501}
  },
  [601502] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Fangjin/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Fangjin_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 601502,
    SkillNodeEffects = {601504}
  },
  [601511] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Fangjin/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Fangjin_Alarm01_Montage",
    DisableBlendBone = false,
    NodeId = 601511,
    SkillNodeEffects = T.RT_4
  },
  [601601] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Eshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Eshi_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 601601,
    SkillNodeEffects = {601601}
  },
  [601602] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Eshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Eshi_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 601602,
    SkillNodeEffects = {601602, 601603}
  },
  [601603] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Eshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Eshi_Reload_Montage",
    DisableBlendBone = false,
    NodeId = 601603
  },
  [601604] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Eshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Eshi_Single_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 601604,
    RootMotionRadius = 2,
    SkillNodeEffects = T.RT_41
  },
  [601605] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Eshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Eshi_Single_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 601605,
    RootMotionRadius = 2,
    SkillNodeEffects = T.RT_41
  },
  [601611] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Eshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Eshi_Alarm01_Montage",
    DisableBlendBone = false,
    NodeId = 601611,
    SkillNodeEffects = T.RT_4
  },
  [601701] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Kuirui/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Kuirui_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 601701,
    RootMotionRadius = 2,
    SkillNodeEffects = {601701}
  },
  [601702] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Kuirui/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Kuirui_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 601702,
    RootMotionRadius = 2,
    SkillNodeEffects = {601702}
  },
  [601703] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Kuirui/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Kuirui_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 601703,
    SkillNodeEffects = {601703}
  },
  [601704] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Kuirui/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Kuirui_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 601704
  },
  [601711] = {
    AnimPath = "/Game/Asset/Char/Monster/GR_Kuirui/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "GR_Kuirui_Alarm01_Montage",
    DisableBlendBone = false,
    NodeId = 601711,
    SkillNodeEffects = T.RT_4
  },
  [700101] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Juji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Juji_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 700101,
    SkillNodeEffects = {700101, 700106}
  },
  [700102] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Juji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Juji_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 700102,
    SkillNodeEffects = {700102, 700108}
  },
  [700103] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Juji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Juji_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 700103
  },
  [700104] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Juji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Juji_Single_Attack01_Montage",
    DisableBlendBone = true,
    NodeId = 700104,
    RootMotionRadius = 2,
    SkillNodeEffects = {700109}
  },
  [700105] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Juji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Juji_Single_Attack02_Montage",
    DisableBlendBone = true,
    NodeId = 700105,
    RootMotionRadius = 2,
    SkillNodeEffects = {700110}
  },
  [700106] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Juji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Juji_Skill03_Montage",
    DisableBlendBone = true,
    NodeId = 700106
  },
  [700107] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Juji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Juji_Skill04_Montage",
    DisableBlendBone = true,
    NodeId = 700107
  },
  [700108] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Juji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Juji_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 700108,
    SkillNodeEffects = {700107, 700106}
  },
  [700111] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Juji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Juji_Alarm01_Montage",
    DisableBlendBone = false,
    NodeId = 700111,
    SkillNodeEffects = T.RT_4
  },
  [700201] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Pizhuo_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 700201,
    RootMotionRadius = 2,
    SkillNodeEffects = {700201}
  },
  [700202] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Pizhuo_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 700202,
    RootMotionRadius = 2,
    SkillNodeEffects = {700202}
  },
  [700203] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Pizhuo_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 700203,
    SkillNodeEffects = {700203}
  },
  [700210] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Pizhuo_ShakeIdle_Montage",
    DisableBlendBone = false,
    NodeId = 700210
  },
  [700211] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Pizhuo_Alarm01_Montage",
    DisableBlendBone = false,
    NodeId = 700211,
    SkillNodeEffects = T.RT_4
  },
  [700215] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Pizhuo_DYZAlarmTest_Montage",
    DisableBlendBone = false,
    NodeId = 700215,
    SkillNodeEffects = {600003}
  },
  [700223] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Pizhuo_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 700223,
    SkillNodeEffects = {700223}
  },
  [700224] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Pizhuo_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 700224,
    SkillNodeEffects = {700224}
  },
  [700301] = {
    AnimPath = "/Game/Asset/Char/Monster/Jt_Ranger/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Ranger_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 700301,
    SkillNodeEffects = {700301}
  },
  [700302] = {
    AnimPath = "/Game/Asset/Char/Monster/Jt_Ranger/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Ranger_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 700302,
    SkillNodeEffects = {700303}
  },
  [700303] = {
    AnimPath = "/Game/Asset/Char/Monster/Jt_Ranger/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Ranger_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 700303,
    SkillNodeEffects = {700305}
  },
  [700304] = {
    AnimPath = "/Game/Asset/Char/Monster/Jt_Ranger/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Ranger_Reload_Montage",
    DisableBlendBone = false,
    NodeId = 700304
  },
  [700305] = {
    AnimPath = "/Game/Asset/Char/Monster/Jt_Ranger/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Ranger_Skill01_Montage",
    DisableBlendBone = true,
    NodeId = 700305,
    SkillNodeEffects = {700306}
  },
  [700306] = {
    AnimPath = "/Game/Asset/Char/Monster/Jt_Ranger/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Ranger_Single_Attack01_Montage",
    DisableBlendBone = true,
    NodeId = 700306,
    RootMotionRadius = 2,
    SkillNodeEffects = {700308}
  },
  [700307] = {
    AnimPath = "/Game/Asset/Char/Monster/Jt_Ranger/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Ranger_Single_Attack02_Montage",
    DisableBlendBone = true,
    NodeId = 700307,
    RootMotionRadius = 2,
    SkillNodeEffects = {700309}
  },
  [700311] = {
    AnimPath = "/Game/Asset/Char/Monster/Jt_Ranger/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Ranger_Alarm01_Montage",
    DisableBlendBone = true,
    NodeId = 700311,
    SkillNodeEffects = T.RT_4
  },
  [700321] = {
    AnimPath = "/Game/Asset/Char/Monster/Jt_Ranger/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Ranger_Skill01_Montage",
    DisableBlendBone = true,
    NodeId = 700321,
    SkillNodeEffects = {700321}
  },
  [700323] = {
    AnimPath = "/Game/Asset/Char/Monster/Jt_Ranger/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Ranger_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 700323,
    SkillNodeEffects = {700322}
  },
  [700401] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Tuji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Tuji_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 700401,
    RootMotionRadius = 2,
    SkillNodeEffects = {700401}
  },
  [700402] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Tuji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Tuji_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 700402,
    SkillNodeEffects = T.RT_42
  },
  [700403] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Tuji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Tuji_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 700403,
    SkillNodeEffects = T.RT_42
  },
  [700411] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Tuji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Tuji_Alarm01_Montage",
    DisableBlendBone = false,
    NodeId = 700411,
    SkillNodeEffects = T.RT_4
  },
  [700621] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_HealRobot/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_HealRobot_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 700621,
    SkillNodeEffects = {700621, 700622}
  },
  [700721] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_BlastRobot/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_BlastRobot_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 700721,
    SkillNodeEffects = {
      700721,
      700722,
      700723
    }
  },
  [700731] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_BlastRobot/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_BlastRobot_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 700731,
    SkillNodeEffects = {
      700731,
      700732,
      700733
    }
  },
  [700741] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_BlastRobot/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_BlastRobot_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 700741,
    SkillNodeEffects = {
      700741,
      700742,
      700743
    }
  },
  [700751] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_BlastRobot/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_BlastRobot_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 700751,
    SkillNodeEffects = {
      700751,
      700752,
      700753
    }
  },
  [700801] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Zhihui/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Zhihui_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 700801,
    SkillNodeEffects = {700801, 700802}
  },
  [700802] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Zhihui/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Zhihui_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 700802,
    SkillNodeEffects = {700804}
  },
  [700803] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Zhihui/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Zhihui_Skill03_Montage",
    DisableBlendBone = true,
    NodeId = 700803,
    SkillNodeEffects = {700809}
  },
  [700804] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Zhihui/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Zhihui_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 700804,
    SkillNodeEffects = {700805, 700806}
  },
  [700805] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Zhihui/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Zhihui_Skill06_Montage",
    DisableBlendBone = false,
    NodeId = 700805,
    SkillNodeEffects = {700810}
  },
  [700806] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Zhihui/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Zhihui_Skill05_Montage",
    DisableBlendBone = true,
    NodeId = 700806,
    SkillNodeEffects = {
      700811,
      700813,
      700814
    }
  },
  [700807] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Zhihui/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Zhihui_Reload_Montage",
    DisableBlendBone = false,
    NodeId = 700807
  },
  [700808] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Zhihui/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Zhihui_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 700808,
    SkillNodeEffects = {700816, 700817}
  },
  [700901] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Zhiren/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Zhiren_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 700901,
    RootMotionRadius = 1,
    SkillNodeEffects = {700901}
  },
  [700902] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Zhiren/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Zhiren_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 700902,
    RootMotionRadius = 1,
    SkillNodeEffects = {700902, 700903}
  },
  [700903] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Zhiren/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Zhiren_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 700903,
    SkillNodeEffects = {700904}
  },
  [701001] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Zhijian/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Zhijian_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 701001,
    SkillNodeEffects = T.RT_43
  },
  [701002] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Zhijian/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Zhijian_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 701002,
    SkillNodeEffects = T.RT_43
  },
  [701003] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Zhijian/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Zhijian_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 701003,
    SkillNodeEffects = {701008, 701009}
  },
  [701011] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Zhijian/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Zhijian_Alarm01_Montage",
    DisableBlendBone = false,
    NodeId = 701011,
    SkillNodeEffects = T.RT_4
  },
  [701103] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Juji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Juji_C01_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 701103,
    SkillNodeEffects = {701101}
  },
  [701104] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Juji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Juji_C01_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 701104,
    SkillNodeEffects = {701102}
  },
  [701201] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Pizhuo_C01_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 701201,
    SkillNodeEffects = {701201}
  },
  [701202] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Pizhuo_C01_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 701202,
    SkillNodeEffects = {701202}
  },
  [701203] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Pizhuo_C01_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 701203,
    SkillNodeEffects = {701203}
  },
  [701301] = {
    AnimPath = "/Game/Asset/Char/Monster/Jt_Ranger/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Ranger_C01_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 701301,
    SkillNodeEffects = {701301}
  },
  [701302] = {
    AnimPath = "/Game/Asset/Char/Monster/Jt_Ranger/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Ranger_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 701302,
    SkillNodeEffects = {701304}
  },
  [701401] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Tuji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Tuji_C01_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 701401,
    SkillNodeEffects = {701401}
  },
  [701402] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Tuji/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Jt_Tuji_C01_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 701402,
    SkillNodeEffects = {701402, 701403}
  },
  [701501] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Jingjie/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Jingjie_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 701501,
    SkillNodeEffects = {701501, 701502}
  },
  [701502] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Jingjie/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Jingjie_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 701502,
    SkillNodeEffects = {701505}
  },
  [701503] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Jingjie/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Jingjie_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 701503,
    SkillNodeEffects = {
      800206,
      800207,
      701511,
      701512
    }
  },
  [701511] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Jingjie/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Jingjie_Alarm01_Montage",
    DisableBlendBone = false,
    NodeId = 701511,
    SkillNodeEffects = T.RT_4
  },
  [701601] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Zhiyan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Zhiyan_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 701601,
    SkillNodeEffects = {701601, 701602}
  },
  [701611] = {
    AnimPath = "/Game/Asset/Char/Monster/JT_Zhiyan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JT_Zhiyan_Alarm01_Montage",
    DisableBlendBone = false,
    NodeId = 701611,
    SkillNodeEffects = T.RT_4
  },
  [800101] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Zhishi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Zhishi_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 800101,
    SkillNodeEffects = {800101}
  },
  [800102] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Zhishi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Zhishi_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 800102,
    SkillNodeEffects = {800102, 800107}
  },
  [800103] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Zhishi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Zhishi_Reload_Montage",
    DisableBlendBone = false,
    NodeId = 800103
  },
  [800104] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Zhishi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Zhishi_Single_Attack01_Montage",
    DisableBlendBone = true,
    NodeId = 800104,
    RootMotionRadius = 4,
    SkillNodeEffects = {800105}
  },
  [800105] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Zhishi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Zhishi_Single_Attack02_Montage",
    DisableBlendBone = true,
    NodeId = 800105,
    RootMotionRadius = 4,
    SkillNodeEffects = {800106}
  },
  [800106] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Zhishi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Zhishi_Alarm01_Montage",
    DisableBlendBone = true,
    NodeId = 800106,
    SkillNodeEffects = T.RT_4
  },
  [800107] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Zhishi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Zhishi_Skill02_Montage",
    DisableBlendBone = true,
    NodeId = 800107
  },
  [800108] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Zhishi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Zhishi_Skill03_Montage",
    DisableBlendBone = true,
    NodeId = 800108
  },
  [800201] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Xianfeng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Xianfeng_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 800201,
    RootMotionRadius = 1.5,
    SkillNodeEffects = {800201}
  },
  [800202] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Xianfeng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Xianfeng_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 800202,
    RootMotionRadius = 1.5,
    SkillNodeEffects = {800202}
  },
  [800203] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Xianfeng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Xianfeng_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 800203,
    SkillNodeEffects = T.RT_44
  },
  [800204] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Xianfeng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Xianfeng_Alarm01_Montage",
    DisableBlendBone = false,
    NodeId = 800204,
    SkillNodeEffects = T.RT_4
  },
  [800205] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Xianfeng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Xianfeng_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 800205,
    SkillNodeEffects = T.RT_44
  },
  [800206] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Xianfeng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Xianfeng_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 800206,
    SkillNodeEffects = T.RT_45
  },
  [800207] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Xianfeng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Xianfeng_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 800207,
    SkillNodeEffects = T.RT_46
  },
  [800208] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Xianfeng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Xianfeng_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 800208,
    SkillNodeEffects = T.RT_44
  },
  [800209] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Xianfeng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Xianfeng_Skill06_Montage",
    DisableBlendBone = false,
    NodeId = 800209,
    SkillNodeEffects = T.RT_45
  },
  [800210] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Xianfeng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Xianfeng_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 800210,
    SkillNodeEffects = T.RT_46
  },
  [800301] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Shenfu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Shenfu_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 800301,
    SkillNodeEffects = T.RT_47
  },
  [800302] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Shenfu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Shenfu_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 800302,
    SkillNodeEffects = T.RT_47
  },
  [800303] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Shenfu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Shenfu_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 800303,
    SkillNodeEffects = {800304}
  },
  [800304] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Shenfu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Shenfu_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 800304,
    SkillNodeEffects = {800306}
  },
  [800305] = {
    AnimPath = "/Game/Asset/Char/Monster/JH_Shenfu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "JH_Shenfu_Alarm01_Montage",
    DisableBlendBone = true,
    NodeId = 800305,
    SkillNodeEffects = T.RT_4
  },
  [850001] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 850001,
    SkillNodeEffects = {
      850011,
      850012,
      850013,
      850014,
      850015
    }
  },
  [850002] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 850002,
    SkillNodeEffects = {
      850021,
      850022,
      850023,
      850024,
      850025
    }
  },
  [850003] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 850003
  },
  [850004] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 850004,
    SkillNodeEffects = {850041, 850042}
  },
  [850005] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 850005,
    SkillNodeEffects = {850051, 850052}
  },
  [850006] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill06_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850006,
    SkillNodeEffects = {
      850061,
      850062,
      850063,
      850064,
      850065
    }
  },
  [850007] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 850007,
    SkillNodeEffects = {850071}
  },
  [850008] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill08_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850008,
    SkillNodeEffects = {
      850081,
      850082,
      850083,
      850084,
      850085,
      850086,
      850087
    }
  },
  [850009] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill09_Montage",
    DisableBlendBone = false,
    NodeId = 850009
  },
  [850011] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill01_H_Montage",
    DisableBlendBone = false,
    NodeId = 850011,
    SkillNodeEffects = T.RT_48
  },
  [850012] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill02_H_Montage",
    DisableBlendBone = false,
    NodeId = 850012,
    SkillNodeEffects = T.RT_49
  },
  [850013] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill03_H_Montage",
    DisableBlendBone = false,
    NodeId = 850013,
    SkillNodeEffects = {
      8500131,
      8500132,
      8500133
    }
  },
  [850014] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill04_H_Montage",
    DisableBlendBone = false,
    NodeId = 850014,
    SkillNodeEffects = {8500141, 8500142}
  },
  [850015] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill05_H_Montage",
    DisableBlendBone = false,
    NodeId = 850015,
    SkillNodeEffects = {8500151, 8500152}
  },
  [850016] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill06_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850016,
    SkillNodeEffects = {
      8500161,
      8500162,
      8500163,
      8500164,
      8500165,
      8500166,
      8500167,
      8500168,
      8500169
    }
  },
  [850017] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill07_H_Montage",
    DisableBlendBone = false,
    NodeId = 850017,
    SkillNodeEffects = {8500171}
  },
  [850018] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill08_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850018,
    SkillNodeEffects = {
      8500181,
      8500182,
      8500183,
      8500184,
      8500185,
      8500186,
      8500187,
      8500188
    }
  },
  [850019] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill09_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850019,
    SkillNodeEffects = {
      8500161,
      8500162,
      8500191,
      8500192,
      8500193,
      8500196
    }
  },
  [850020] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill10_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850020,
    SkillNodeEffects = {
      8500161,
      8500162,
      8500191,
      8500192,
      8500193,
      8500198
    }
  },
  [850021] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill11_H_Montage",
    DisableBlendBone = false,
    NodeId = 850021,
    SkillNodeEffects = T.RT_48
  },
  [850022] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill12_H_Montage",
    DisableBlendBone = false,
    NodeId = 850022,
    SkillNodeEffects = T.RT_49
  },
  [850023] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill13_H_Montage",
    DisableBlendBone = false,
    NodeId = 850023,
    SkillNodeEffects = T.RT_48
  },
  [850024] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill14_H_Montage",
    DisableBlendBone = false,
    NodeId = 850024,
    SkillNodeEffects = T.RT_49
  },
  [850025] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Xibi_Skill15_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850025,
    SkillNodeEffects = {
      8500161,
      8500162,
      8500191,
      8500192,
      8500193,
      8500194
    }
  },
  [850101] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss06_Lizhan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lizhan_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 850101,
    RootMotionRadius = 1.75,
    SkillNodeEffects = {8501101, 8501102}
  },
  [850102] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss06_Lizhan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lizhan_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 850102,
    RootMotionRadius = 1.25,
    SkillNodeEffects = {8501106}
  },
  [850103] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss06_Lizhan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lizhan_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 850103,
    SkillNodeEffects = {8501111}
  },
  [850104] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss06_Lizhan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lizhan_Skill04_1_Montage",
    DisableBlendBone = false,
    NodeId = 850104,
    SkillNodeEffects = {8501116}
  },
  [850105] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss06_Lizhan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lizhan_Skill05_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850105,
    SkillNodeEffects = {
      8501121,
      8501124,
      8501156,
      8501157
    }
  },
  [850107] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss06_Lizhan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lizhan_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 850107,
    RootMotionRadius = 1.75,
    SkillNodeEffects = {8501131, 8501132}
  },
  [850110] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss06_Lizhan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lizhan_Skill10_Montage",
    DisableBlendBone = false,
    NodeId = 850110,
    RootMotionRadius = 1.75,
    SkillNodeEffects = {8501146, 8501147}
  },
  [850111] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss06_Lizhan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lizhan_Skill11_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850111,
    SkillNodeEffects = {
      8501151,
      8501152,
      8501153
    }
  },
  [850112] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss06_Lizhan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lizhan_Skill11_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850112
  },
  [850113] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss06_Lizhan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lizhan_Skill13_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850113,
    SkillNodeEffects = {8501161}
  },
  [850114] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss06_Lizhan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lizhan_Skill04_2_Montage",
    DisableBlendBone = false,
    NodeId = 850114,
    SkillNodeEffects = {8501117}
  },
  [850201] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 850201,
    SkillNodeEffects = {850201, 850202}
  },
  [850202] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 850202,
    SkillNodeEffects = {850204}
  },
  [850203] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 850203,
    SkillNodeEffects = T.RT_50
  },
  [850204] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill04_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850204,
    SkillNodeEffects = {850208}
  },
  [850205] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill05_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850205,
    SkillNodeEffects = {850210, 850211}
  },
  [850206] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill06_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850206,
    SkillNodeEffects = {
      850213,
      850214,
      850215,
      850216
    }
  },
  [850207] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 850207,
    SkillNodeEffects = {850218, 850219}
  },
  [850208] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill08_Montage",
    DisableBlendBone = false,
    NodeId = 850208,
    SkillNodeEffects = {850221, 850222}
  },
  [850209] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill09_Montage",
    DisableBlendBone = false,
    NodeId = 850209
  },
  [850210] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill10_Montage",
    DisableBlendBone = false,
    NodeId = 850210,
    SkillNodeEffects = {
      850212,
      850228,
      850229,
      850231,
      850232,
      850233,
      850235
    }
  },
  [850211] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill11_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850211,
    SkillNodeEffects = T.RT_51
  },
  [850212] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill12_Montage",
    DisableBlendBone = false,
    NodeId = 850212,
    SkillNodeEffects = {
      850201,
      850202,
      850203
    }
  },
  [850213] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill13_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850213,
    SkillNodeEffects = {850208, 850209}
  },
  [850214] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill14_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850214,
    SkillNodeEffects = {
      850238,
      850239,
      850236
    }
  },
  [850215] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill15_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850215,
    SkillNodeEffects = {
      850238,
      850240,
      850236
    }
  },
  [850216] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill16_Montage",
    DisableBlendBone = false,
    NodeId = 850216,
    SkillNodeEffects = T.RT_50
  },
  [850217] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill17_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850217,
    SkillNodeEffects = T.RT_51
  },
  [850220] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 850220,
    SkillNodeEffects = {8502101, 8502102}
  },
  [850221] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 850221,
    SkillNodeEffects = {8502104}
  },
  [850222] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 850222,
    SkillNodeEffects = T.RT_52
  },
  [850223] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill04_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850223,
    SkillNodeEffects = {8502108}
  },
  [850224] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill05_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850224,
    SkillNodeEffects = {8502110, 8502111}
  },
  [850225] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill06_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850225,
    SkillNodeEffects = {
      8502113,
      8502114,
      8502115,
      8502116
    }
  },
  [850226] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 850226,
    SkillNodeEffects = {8502118, 8502119}
  },
  [850227] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill08_Montage",
    DisableBlendBone = false,
    NodeId = 850227,
    SkillNodeEffects = {
      850221,
      8502122,
      8502124
    }
  },
  [850228] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill09_Montage",
    DisableBlendBone = false,
    NodeId = 850228
  },
  [850229] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill10_Montage",
    DisableBlendBone = false,
    NodeId = 850229,
    SkillNodeEffects = {
      8502112,
      8502128,
      8502129,
      8502131,
      8502132,
      8502133,
      8502135
    }
  },
  [850230] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill11_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850230,
    SkillNodeEffects = T.RT_53
  },
  [850231] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill12_Montage",
    DisableBlendBone = false,
    NodeId = 850231,
    SkillNodeEffects = {
      8502101,
      8502102,
      8502103
    }
  },
  [850232] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill13_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850232,
    SkillNodeEffects = {8502108, 8502109}
  },
  [850233] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill14_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850233,
    SkillNodeEffects = {
      8502138,
      8502139,
      8502136
    }
  },
  [850234] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill15_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850234,
    SkillNodeEffects = {
      8502138,
      8502140,
      8502136
    }
  },
  [850235] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill16_Montage",
    DisableBlendBone = false,
    NodeId = 850235,
    SkillNodeEffects = T.RT_52
  },
  [850236] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill17_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850236,
    SkillNodeEffects = T.RT_53
  },
  [850237] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill18_Montage",
    DisableBlendBone = false,
    NodeId = 850237,
    SkillNodeEffects = {8502141, 8502142}
  },
  [850238] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill19_Montage",
    DisableBlendBone = false,
    NodeId = 850238,
    SkillNodeEffects = {8502144}
  },
  [850239] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill20_Montage",
    DisableBlendBone = false,
    NodeId = 850239,
    SkillNodeEffects = {8502145}
  },
  [850240] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill21_Montage",
    DisableBlendBone = false,
    NodeId = 850240,
    SkillNodeEffects = {8502147}
  },
  [850241] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill08_Montage",
    DisableBlendBone = false,
    NodeId = 850241,
    SkillNodeEffects = {
      850221,
      8502150,
      8502157
    }
  },
  [850242] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill08_Montage",
    DisableBlendBone = false,
    NodeId = 850242,
    SkillNodeEffects = {
      850221,
      8502150,
      8502151,
      8502158,
      8502157
    }
  },
  [850243] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill08_Montage",
    DisableBlendBone = false,
    NodeId = 850243,
    SkillNodeEffects = {
      850221,
      8502152,
      8502159
    }
  },
  [850244] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill22_Montage",
    DisableBlendBone = false,
    NodeId = 850244,
    SkillNodeEffects = {8502154, 8502155}
  },
  [850245] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill22_Montage",
    DisableBlendBone = false,
    NodeId = 850245,
    SkillNodeEffects = {8502154, 8502156}
  },
  [850246] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 850246,
    SkillNodeEffects = {8502118, 8502160}
  },
  [850247] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi_Skill23_Montage",
    DisableBlendBone = false,
    NodeId = 850247,
    SkillNodeEffects = {
      8502161,
      8502162,
      8502163,
      8502164
    }
  },
  [850301] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill01_01_R_Montage",
    DisableBlendBone = false,
    NodeId = 850301,
    SkillNodeEffects = {850301, 850343}
  },
  [850302] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill01_01_L_Montage",
    DisableBlendBone = false,
    NodeId = 850302,
    SkillNodeEffects = {850319, 850343}
  },
  [850303] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 850303,
    SkillNodeEffects = {850302, 850320}
  },
  [850304] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill03_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850304,
    SkillNodeEffects = {
      850303,
      850321,
      850337
    }
  },
  [850305] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 850305,
    SkillNodeEffects = {850304, 850343}
  },
  [850306] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill05_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850306,
    SkillNodeEffects = {
      850305,
      850307,
      850326,
      850334,
      850343
    }
  },
  [850307] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill06_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850307
  },
  [850308] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill07_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850308,
    SkillNodeEffects = {
      850309,
      850335,
      850338,
      850340,
      850343
    }
  },
  [850309] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill08_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850309,
    SkillNodeEffects = {
      850305,
      850307,
      850326,
      850334
    }
  },
  [850310] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill09_Montage",
    DisableBlendBone = false,
    NodeId = 850310,
    SkillNodeEffects = {
      850313,
      850314,
      850315,
      850333,
      850343
    }
  },
  [850311] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill10_Montage",
    DisableBlendBone = false,
    NodeId = 850311,
    SkillNodeEffects = {
      850344,
      850345,
      850346,
      850343,
      850347,
      850348,
      850349,
      850351,
      850352,
      850353
    }
  },
  [850313] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill11_Montage",
    DisableBlendBone = false,
    NodeId = 850313,
    SkillNodeEffects = {850325}
  },
  [850314] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill12_L_Montage",
    DisableBlendBone = false,
    NodeId = 850314,
    SkillNodeEffects = {850331}
  },
  [850315] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill12_R_Montage",
    DisableBlendBone = false,
    NodeId = 850315,
    SkillNodeEffects = {850332, 850343}
  },
  [850316] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill01_01_R_Montage",
    DisableBlendBone = false,
    NodeId = 850316,
    SkillNodeEffects = {8503101, 8503122}
  },
  [850317] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill01_01_L_Montage",
    DisableBlendBone = false,
    NodeId = 850317,
    SkillNodeEffects = {8503106, 8503122}
  },
  [850318] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 850318,
    SkillNodeEffects = {8503111, 8503112}
  },
  [850319] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill03_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850319,
    SkillNodeEffects = {
      8503116,
      8503117,
      8503118,
      8503119
    }
  },
  [850320] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 850320,
    SkillNodeEffects = {8503121, 8503122}
  },
  [850321] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill05_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850321,
    SkillNodeEffects = {
      8503126,
      8503127,
      8503128,
      8503129,
      8503122
    }
  },
  [850322] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill07_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850322,
    SkillNodeEffects = {
      8503131,
      8503132,
      8503133,
      8503134,
      8503122
    }
  },
  [850323] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill08_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850323,
    SkillNodeEffects = {
      8503126,
      8503127,
      8503128,
      8503129
    }
  },
  [850324] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill09_Montage",
    DisableBlendBone = false,
    NodeId = 850324,
    SkillNodeEffects = {
      8503141,
      8503142,
      8503143,
      8503144,
      8503122
    }
  },
  [850325] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill10_Montage",
    DisableBlendBone = false,
    NodeId = 850325,
    SkillNodeEffects = {
      8503186,
      8503187,
      8503188,
      8503122,
      850347,
      850348,
      850349,
      850351,
      850352,
      850353
    }
  },
  [850327] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill11_Montage",
    DisableBlendBone = false,
    NodeId = 850327,
    SkillNodeEffects = {
      8503151,
      8503152,
      8503153,
      8503154
    }
  },
  [850328] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill12_L_Montage",
    DisableBlendBone = false,
    NodeId = 850328,
    SkillNodeEffects = {8503156, 8503157}
  },
  [850329] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill12_R_Montage",
    DisableBlendBone = false,
    NodeId = 850329,
    SkillNodeEffects = {
      8503161,
      8503162,
      8503122
    }
  },
  [850330] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill13_Montage",
    DisableBlendBone = false,
    NodeId = 850330,
    SkillNodeEffects = {
      8503181,
      8503182,
      8503183,
      8503184,
      8503185,
      8503198
    }
  },
  [850331] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill14_1_Montage",
    DisableBlendBone = false,
    NodeId = 850331,
    SkillNodeEffects = {
      8503176,
      8503136,
      8503137,
      8503138
    }
  },
  [850332] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill14_2_Montage",
    DisableBlendBone = false,
    NodeId = 850332,
    SkillNodeEffects = {8503176, 8503139}
  },
  [850333] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill14_3_Montage",
    DisableBlendBone = false,
    NodeId = 850333,
    SkillNodeEffects = {8503176, 8503140}
  },
  [850334] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill14_4_Montage",
    DisableBlendBone = false,
    NodeId = 850334
  },
  [850335] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shijingzhe_Skill15_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850335,
    SkillNodeEffects = {
      8503201,
      8503202,
      8503203,
      8503204,
      8503205,
      8503206,
      8503208,
      8503209,
      8503213,
      8503214,
      8503215,
      8503216,
      8503217,
      8503218,
      8503220,
      8503221
    }
  },
  [850401] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 850401,
    SkillNodeEffects = {850401}
  },
  [850402] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 850402,
    SkillNodeEffects = {850402}
  },
  [850403] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 850403,
    SkillNodeEffects = {850403}
  },
  [850404] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 850404,
    SkillNodeEffects = {850404}
  },
  [850405] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 850405,
    SkillNodeEffects = {850405}
  },
  [850406] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill06_Montage",
    DisableBlendBone = false,
    NodeId = 850406,
    SkillNodeEffects = {850407, 850447}
  },
  [850407] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 850407,
    SkillNodeEffects = {850440}
  },
  [850408] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill08_Montage",
    DisableBlendBone = false,
    NodeId = 850408,
    SkillNodeEffects = {850408, 850442}
  },
  [850409] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill09_Montage",
    DisableBlendBone = false,
    NodeId = 850409,
    SkillNodeEffects = {850409, 850410}
  },
  [850410] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill10_Montage",
    DisableBlendBone = false,
    NodeId = 850410,
    SkillNodeEffects = {850411, 850422}
  },
  [850411] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill11_Montage",
    DisableBlendBone = false,
    NodeId = 850411,
    SkillNodeEffects = {850413, 850414}
  },
  [850412] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill12_Montage",
    DisableBlendBone = false,
    NodeId = 850412,
    SkillNodeEffects = {850416, 850440}
  },
  [850413] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill13_Montage",
    DisableBlendBone = false,
    NodeId = 850413,
    SkillNodeEffects = {850417, 850432}
  },
  [850414] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill14_Montage",
    DisableBlendBone = false,
    NodeId = 850414,
    SkillNodeEffects = {850420}
  },
  [850415] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill15_Montage",
    DisableBlendBone = false,
    NodeId = 850415,
    SkillNodeEffects = {850421}
  },
  [850416] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill16_Montage",
    DisableBlendBone = false,
    NodeId = 850416,
    SkillNodeEffects = {850424}
  },
  [850417] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill17_Montage",
    DisableBlendBone = false,
    NodeId = 850417,
    SkillNodeEffects = {850428, 850442}
  },
  [850418] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill18_Montage",
    DisableBlendBone = false,
    NodeId = 850418,
    SkillNodeEffects = {850435}
  },
  [850419] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill19_Montage",
    DisableBlendBone = false,
    NodeId = 850419,
    SkillNodeEffects = {850436}
  },
  [850420] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 850420,
    SkillNodeEffects = {850437}
  },
  [850421] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill21_Montage",
    DisableBlendBone = false,
    NodeId = 850421,
    SkillNodeEffects = {
      850438,
      850448,
      850449,
      850450,
      850451,
      850452,
      850453,
      850454,
      850455
    }
  },
  [850422] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 850422
  },
  [850423] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill23_Montage",
    DisableBlendBone = false,
    NodeId = 850423
  },
  [850424] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill24_Montage",
    DisableBlendBone = false,
    NodeId = 850424,
    SkillNodeEffects = {850443}
  },
  [850425] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill25_Montage",
    DisableBlendBone = false,
    NodeId = 850425,
    SkillNodeEffects = {850444}
  },
  [850426] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill26_Montage",
    DisableBlendBone = false,
    NodeId = 850426,
    SkillNodeEffects = {850445, 850447}
  },
  [850427] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill27_Montage",
    DisableBlendBone = false,
    NodeId = 850427,
    SkillNodeEffects = {850446, 850447}
  },
  [850428] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill28_Montage",
    DisableBlendBone = false,
    NodeId = 850428,
    SkillNodeEffects = {
      850413,
      850414,
      850430
    }
  },
  [850429] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 850429,
    SkillNodeEffects = {850457}
  },
  [850430] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Saiqi02_Skill14_Montage",
    DisableBlendBone = false,
    NodeId = 850430,
    SkillNodeEffects = {850456}
  },
  [850501] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill01_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850501,
    SkillNodeEffects = {
      850501,
      850502,
      850503
    }
  },
  [850502] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill02_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850502,
    SkillNodeEffects = {
      850504,
      850505,
      850506,
      850507
    }
  },
  [850503] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill03_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850503,
    SkillNodeEffects = {850508, 850509}
  },
  [850504] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill04_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850504,
    SkillNodeEffects = {
      850512,
      850506,
      850544
    }
  },
  [850505] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill05_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850505,
    SkillNodeEffects = {850515, 850516}
  },
  [850506] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill06_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850506,
    SkillNodeEffects = {
      850518,
      850542,
      850549
    }
  },
  [850507] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill07_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850507,
    SkillNodeEffects = {
      850532,
      850533,
      850535,
      850536,
      850555
    }
  },
  [850508] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill08_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850508,
    SkillNodeEffects = {
      850524,
      850525,
      850527,
      850529,
      850530,
      850531,
      850546,
      850547,
      850550,
      850551,
      850552
    }
  },
  [850509] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill09_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850509
  },
  [850510] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill10_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850510,
    SkillNodeEffects = {850515, 850523}
  },
  [850511] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill11_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850511,
    SkillNodeEffects = {
      850524,
      850525,
      850527,
      850528,
      850529,
      850530,
      850531,
      850547,
      850550,
      850551,
      850553
    }
  },
  [850512] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill12_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850512,
    SkillNodeEffects = {850538, 850539}
  },
  [850521] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill01_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850521,
    SkillNodeEffects = {
      8505101,
      8505102,
      8505103,
      8505104,
      8505110
    }
  },
  [850522] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill02_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850522,
    SkillNodeEffects = {
      8505105,
      8505106,
      8505107,
      8505108,
      8505109,
      8505110
    }
  },
  [850523] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill03_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850523,
    SkillNodeEffects = {8505111, 8505112}
  },
  [850524] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill04_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850524,
    SkillNodeEffects = {
      8505116,
      8505117,
      8505122
    }
  },
  [850525] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill05_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850525,
    SkillNodeEffects = {8505123, 8505124}
  },
  [850526] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill06_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850526,
    SkillNodeEffects = {
      8505126,
      8505127,
      8505129
    }
  },
  [850527] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill07_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850527,
    SkillNodeEffects = {
      8505130,
      8505131,
      8505133,
      8505134,
      850555
    }
  },
  [850528] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill08_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850528,
    SkillNodeEffects = {
      8505135,
      8505136,
      8505138,
      8505139,
      8505140,
      8505141,
      8505142,
      8505144,
      8505145,
      8505146,
      8505148
    }
  },
  [850529] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill09_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850529
  },
  [850530] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill10_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850530,
    SkillNodeEffects = {
      8505123,
      8505152,
      8505160
    }
  },
  [850531] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill11_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850531,
    SkillNodeEffects = {
      8505136,
      8505138,
      8505139,
      8505140,
      8505141,
      8505143,
      8505144,
      8505145,
      8505146,
      8505149,
      8505161
    }
  },
  [850532] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lianhuo_Skill12_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850532,
    SkillNodeEffects = {
      8505153,
      8505154,
      8505162
    }
  },
  [850601] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss07_Nvzhu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Nvzhu_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 850601,
    SkillNodeEffects = T.RT_54
  },
  [850602] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss07_Nvzhu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Nvzhu_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 850602,
    SkillNodeEffects = T.RT_55
  },
  [850603] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss07_Nvzhu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Nvzhu_Skill03_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850603,
    SkillNodeEffects = T.RT_56
  },
  [850604] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss07_Nvzhu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Nvzhu_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 850604,
    SkillNodeEffects = T.RT_57
  },
  [850605] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss07_Nvzhu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Nvzhu_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 850605,
    SkillNodeEffects = T.RT_58
  },
  [850606] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss07_Nvzhu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Nvzhu_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 850606
  },
  [850701] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss08_Nanzhu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Nanzhu_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 850701,
    SkillNodeEffects = T.RT_54
  },
  [850702] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss08_Nanzhu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Nanzhu_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 850702,
    SkillNodeEffects = T.RT_55
  },
  [850703] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss08_Nanzhu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Nanzhu_Skill03_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 850703,
    SkillNodeEffects = T.RT_56
  },
  [850704] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss08_Nanzhu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Nanzhu_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 850704,
    SkillNodeEffects = T.RT_57
  },
  [850705] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss08_Nanzhu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Nanzhu_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 850705,
    SkillNodeEffects = T.RT_58
  },
  [850706] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss08_Nanzhu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Nanzhu_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 850706
  },
  [850904] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss09_Tuosi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Tuosi_Skill04_E_Montage",
    DisableBlendBone = false,
    NodeId = 850904,
    SkillNodeEffects = T.RT_59
  },
  [850911] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss09_Tuosi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Tuosi_Skill01_H_Montage",
    DisableBlendBone = false,
    NodeId = 850911,
    RootMotionRadius = 1.75,
    SkillNodeEffects = {850901, 850902}
  },
  [850912] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss09_Tuosi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Tuosi_Skill02_H_Montage",
    DisableBlendBone = false,
    NodeId = 850912,
    SkillNodeEffects = {850903, 850937}
  },
  [850913] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss09_Tuosi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Tuosi_Skill03_H_Montage",
    DisableBlendBone = false,
    NodeId = 850913
  },
  [850914] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss09_Tuosi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Tuosi_Skill04_H_Montage",
    DisableBlendBone = false,
    NodeId = 850914,
    SkillNodeEffects = T.RT_59
  },
  [850915] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss09_Tuosi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Tuosi_Skill05_H_Montage",
    DisableBlendBone = false,
    NodeId = 850915,
    SkillNodeEffects = {850909}
  },
  [850916] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss09_Tuosi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Tuosi_Skill06_H_Montage",
    DisableBlendBone = false,
    NodeId = 850916,
    SkillNodeEffects = {
      850911,
      850912,
      850933,
      850934,
      850935,
      850904
    }
  },
  [850917] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss09_Tuosi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Tuosi_Skill07_H_Montage",
    DisableBlendBone = false,
    NodeId = 850917,
    SkillNodeEffects = {
      850916,
      850919,
      850941
    }
  },
  [850918] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss09_Tuosi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Tuosi_Skill08_H_Montage",
    DisableBlendBone = false,
    NodeId = 850918,
    SkillNodeEffects = T.RT_60
  },
  [850919] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss09_Tuosi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Tuosi_Skill09_H_Montage",
    DisableBlendBone = false,
    NodeId = 850919,
    SkillNodeEffects = T.RT_60
  },
  [850920] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss09_Tuosi/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Tuosi_Skill10_H_Montage",
    DisableBlendBone = false,
    NodeId = 850920
  },
  [851001] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss10_Heilong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Heilong_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 851001,
    SkillNodeEffects = {851001}
  },
  [851002] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss10_Heilong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Heilong_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 851002,
    SkillNodeEffects = {851002}
  },
  [851003] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss10_Heilong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Heilong_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 851003,
    SkillNodeEffects = {851003}
  },
  [851004] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss10_Heilong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Heilong_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 851004,
    SkillNodeEffects = {851005, 851006}
  },
  [851005] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss10_Heilong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Heilong_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 851005,
    SkillNodeEffects = {851011}
  },
  [851006] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss10_Heilong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Heilong_Skill06_Montage",
    DisableBlendBone = false,
    NodeId = 851006,
    SkillNodeEffects = {851012, 851041}
  },
  [851007] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss10_Heilong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Heilong_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 851007,
    SkillNodeEffects = {
      851014,
      851015,
      851016,
      851021,
      851025,
      851029
    }
  },
  [851008] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss10_Heilong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Heilong_Skill08_Montage",
    DisableBlendBone = false,
    NodeId = 851008,
    SkillNodeEffects = {
      851034,
      851035,
      851036,
      851037,
      851038
    }
  },
  [851009] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss10_Heilong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Heilong_Skill09_Montage",
    DisableBlendBone = false,
    NodeId = 851009,
    SkillNodeEffects = {
      851027,
      851031,
      851033,
      851039
    }
  },
  [851010] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss10_Heilong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Heilong_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 851010,
    SkillNodeEffects = {851030}
  },
  [851101] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss11_Bailong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Bailong_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 851101,
    SkillNodeEffects = {851101}
  },
  [851102] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss11_Bailong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Bailong_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 851102,
    SkillNodeEffects = {851102}
  },
  [851103] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss11_Bailong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Bailong_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 851103,
    SkillNodeEffects = {851103}
  },
  [851104] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss11_Bailong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Bailong_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 851104,
    SkillNodeEffects = {851115, 851116}
  },
  [851105] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss11_Bailong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Bailong_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 851105,
    SkillNodeEffects = {851111}
  },
  [851106] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss11_Bailong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Bailong_Skill06_Montage",
    DisableBlendBone = false,
    NodeId = 851106
  },
  [851107] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss11_Bailong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Bailong_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 851107
  },
  [851108] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss11_Bailong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Bailong_Skill08_Montage",
    DisableBlendBone = false,
    NodeId = 851108,
    SkillNodeEffects = {
      851118,
      851119,
      851120,
      851121
    }
  },
  [851109] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss11_Bailong/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Bailong_Skill09_Montage",
    DisableBlendBone = false,
    NodeId = 851109,
    SkillNodeEffects = {851114}
  },
  [851201] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 851201,
    SkillNodeEffects = T.RT_61
  },
  [851202] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 851202,
    SkillNodeEffects = T.RT_62
  },
  [851203] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 851203,
    SkillNodeEffects = T.RT_63
  },
  [851204] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill04_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 851204,
    SkillNodeEffects = T.RT_64
  },
  [851205] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 851205,
    SkillNodeEffects = T.RT_65
  },
  [851206] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill06_Montage",
    DisableBlendBone = false,
    NodeId = 851206,
    SkillNodeEffects = T.RT_66
  },
  [851207] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill07_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 851207,
    SkillNodeEffects = T.RT_67
  },
  [851208] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill08_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 851208,
    SkillNodeEffects = T.RT_68
  },
  [851209] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill09_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 851209,
    SkillNodeEffects = T.RT_69
  },
  [851210] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill10_1_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 851210,
    SkillNodeEffects = T.RT_70
  },
  [851211] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill11_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 851211,
    SkillNodeEffects = T.RT_71
  },
  [851222] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill10_2_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 851222,
    SkillNodeEffects = T.RT_70
  },
  [851223] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill02_2_Montage",
    DisableBlendBone = false,
    NodeId = 851223,
    SkillNodeEffects = T.RT_72
  },
  [851224] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill06_2_Montage",
    DisableBlendBone = false,
    NodeId = 851224,
    SkillNodeEffects = T.RT_73
  },
  [851225] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill08_2_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 851225,
    SkillNodeEffects = T.RT_68
  },
  [851226] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill01_2_Montage",
    DisableBlendBone = false,
    NodeId = 851226,
    SkillNodeEffects = T.RT_74
  },
  [851227] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 851227,
    SkillNodeEffects = {8512901, 851202}
  },
  [851228] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 851228,
    SkillNodeEffects = {8512906}
  },
  [851229] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill02_2_Montage",
    DisableBlendBone = false,
    NodeId = 851229,
    SkillNodeEffects = {8512956}
  },
  [851230] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 851230,
    SkillNodeEffects = {
      8512911,
      8512912,
      8512913
    }
  },
  [851231] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill01_2_Montage",
    DisableBlendBone = false,
    NodeId = 851231,
    SkillNodeEffects = {8512991, 8512992}
  },
  [851251] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill01_H_Montage",
    DisableBlendBone = false,
    NodeId = 851251,
    SkillNodeEffects = T.RT_61
  },
  [851252] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill02_H_Montage",
    DisableBlendBone = false,
    NodeId = 851252,
    SkillNodeEffects = T.RT_62
  },
  [851253] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill03_H_Montage",
    DisableBlendBone = false,
    NodeId = 851253,
    SkillNodeEffects = T.RT_63
  },
  [851254] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill04_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 851254,
    SkillNodeEffects = T.RT_64
  },
  [851255] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill05_H_Montage",
    DisableBlendBone = false,
    NodeId = 851255,
    SkillNodeEffects = T.RT_65
  },
  [851256] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill06_H_Montage",
    DisableBlendBone = false,
    NodeId = 851256,
    SkillNodeEffects = T.RT_66
  },
  [851257] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill07_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 851257,
    SkillNodeEffects = T.RT_67
  },
  [851258] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill08_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 851258,
    SkillNodeEffects = T.RT_68
  },
  [851259] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill09_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 851259,
    SkillNodeEffects = T.RT_69
  },
  [851260] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill10_1_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 851260,
    SkillNodeEffects = T.RT_70
  },
  [851261] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill11_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 851261,
    SkillNodeEffects = T.RT_71
  },
  [851272] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill10_2_H_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 851272,
    SkillNodeEffects = T.RT_70
  },
  [851273] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill02_2_H_Montage",
    DisableBlendBone = false,
    NodeId = 851273,
    SkillNodeEffects = T.RT_72
  },
  [851274] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill06_2_H_Montage",
    DisableBlendBone = false,
    NodeId = 851274,
    SkillNodeEffects = T.RT_73
  },
  [851275] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/Combat/Skill/Hard/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Linen_Skill01_2_H_Montage",
    DisableBlendBone = false,
    NodeId = 851275,
    SkillNodeEffects = T.RT_74
  },
  [851301] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss13_Kuxiu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Kuxiu_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 851301,
    SkillNodeEffects = {851301, 851302}
  },
  [851302] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss13_Kuxiu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Kuxiu_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 851302,
    SkillNodeEffects = {851305, 851306}
  },
  [851303] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss13_Kuxiu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Kuxiu_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 851303,
    SkillNodeEffects = {851308}
  },
  [851304] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss13_Kuxiu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Kuxiu_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 851304,
    SkillNodeEffects = {851303}
  },
  [851305] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss13_Kuxiu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Kuxiu_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 851305,
    SkillNodeEffects = {
      851320,
      851311,
      851304,
      851333
    }
  },
  [851306] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss13_Kuxiu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Kuxiu_Skill06_Montage",
    DisableBlendBone = false,
    NodeId = 851306,
    SkillNodeEffects = {851314}
  },
  [851307] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss13_Kuxiu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Kuxiu_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 851307,
    SkillNodeEffects = {
      851325,
      851326,
      851327,
      851328,
      851329
    }
  },
  [851401] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss14_Shenpan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shenpan_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 851401,
    SkillNodeEffects = {851401}
  },
  [851402] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss14_Shenpan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shenpan_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 851402,
    SkillNodeEffects = {
      851401,
      851409,
      851412,
      851413,
      851414,
      851415,
      851416
    }
  },
  [851403] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss14_Shenpan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shenpan_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 851403,
    SkillNodeEffects = {851410}
  },
  [851404] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss14_Shenpan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shenpan_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 851404,
    SkillNodeEffects = {851417}
  },
  [851405] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss14_Shenpan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shenpan_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 851405,
    SkillNodeEffects = {
      851417,
      851418,
      851409,
      851412,
      851413,
      851414,
      851415,
      851416
    }
  },
  [851406] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss14_Shenpan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shenpan_Skill06_Montage",
    DisableBlendBone = false,
    NodeId = 851406
  },
  [851407] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss14_Shenpan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shenpan_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 851407,
    SkillNodeEffects = {851420}
  },
  [851408] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss14_Shenpan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shenpan_Skill08_Montage",
    DisableBlendBone = false,
    NodeId = 851408,
    SkillNodeEffects = {851421}
  },
  [851409] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss14_Shenpan/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Shenpan_Skill09_Montage",
    DisableBlendBone = false,
    NodeId = 851409
  },
  [851501] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss15_Jushi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Jushi_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 851501,
    SkillNodeEffects = {851501}
  },
  [851502] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss15_Jushi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Jushi_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 851502,
    SkillNodeEffects = {851502}
  },
  [851503] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss15_Jushi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Jushi_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 851503,
    SkillNodeEffects = T.RT_75
  },
  [851504] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss15_Jushi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Jushi_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 851504,
    SkillNodeEffects = {
      851504,
      851507,
      851510,
      851511
    }
  },
  [851505] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss15_Jushi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Jushi_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 851505,
    SkillNodeEffects = {851512, 851515}
  },
  [851506] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss15_Jushi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Jushi_Skill06_Montage",
    DisableBlendBone = false,
    NodeId = 851506,
    SkillNodeEffects = {851517, 851518}
  },
  [851507] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss15_Jushi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Jushi_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 851507,
    SkillNodeEffects = {851520}
  },
  [851508] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss15_Jushi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Jushi_Skill08_Montage",
    DisableBlendBone = false,
    NodeId = 851508,
    SkillNodeEffects = {
      851525,
      851528,
      851514,
      851532,
      851533,
      851534,
      851535
    }
  },
  [851509] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss15_Jushi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Jushi_Skill09_Montage",
    DisableBlendBone = false,
    NodeId = 851509,
    SkillNodeEffects = T.RT_75
  },
  [851601] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss16_Fuer/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Fuer_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 851601,
    SkillNodeEffects = {
      851601,
      851602,
      851643,
      851646,
      851647,
      851648
    }
  },
  [851602] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss16_Fuer/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Fuer_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 851602,
    SkillNodeEffects = {
      851604,
      851605,
      851649,
      851650
    }
  },
  [851603] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss16_Fuer/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Fuer_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 851603,
    SkillNodeEffects = {851607}
  },
  [851604] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss16_Fuer/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Fuer_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 851604,
    SkillNodeEffects = {851610, 851611}
  },
  [851605] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss16_Fuer/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Fuer_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 851605,
    SkillNodeEffects = {851621, 851622}
  },
  [851606] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss16_Fuer/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Fuer_Skill06_Montage",
    DisableBlendBone = false,
    NodeId = 851606,
    SkillNodeEffects = {
      851626,
      851630,
      851631,
      851632,
      851633,
      851634,
      851635,
      851639,
      851644,
      851645
    }
  },
  [851607] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss16_Fuer/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Fuer_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 851607,
    SkillNodeEffects = {
      851631,
      851633,
      851634,
      851635,
      851640,
      851641
    }
  },
  [851608] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss16_Fuer/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Fuer_Skill08_Montage",
    DisableBlendBone = false,
    NodeId = 851608
  },
  [851609] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss16_Fuer/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Fuer_Skill09_Montage",
    DisableBlendBone = false,
    NodeId = 851609
  },
  [851701] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss17_Yuming/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Yuming_Attack_Montage",
    DisableBlendBone = false,
    NodeId = 851701,
    SkillNodeEffects = {
      851701,
      851702,
      851713,
      851714
    }
  },
  [851702] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss17_Yuming/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Yuming_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 851702,
    SkillNodeEffects = {
      851701,
      851702,
      851704,
      851713,
      851714
    }
  },
  [851703] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss17_Yuming/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Yuming_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 851703,
    SkillNodeEffects = {851705, 851706}
  },
  [851704] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss17_Yuming/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Yuming_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 851704,
    SkillNodeEffects = {
      851707,
      851713,
      851714
    }
  },
  [851705] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss17_Yuming/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Yuming_Skill03_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 851705,
    SkillNodeEffects = {
      851707,
      851708,
      851713,
      851714
    }
  },
  [851706] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss17_Yuming/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Yuming_Skill04_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 851706,
    SkillNodeEffects = {851709, 851710}
  },
  [851707] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss17_Yuming/Animation/Summon/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Yuming_Summon_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 851707
  },
  [851801] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss18_Juque/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Juque_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 851801,
    SkillNodeEffects = T.RT_76
  },
  [851802] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss18_Juque/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Juque_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 851802,
    SkillNodeEffects = T.RT_76
  },
  [851803] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss18_Juque/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Juque_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 851803,
    SkillNodeEffects = {851810, 851811}
  },
  [851804] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss18_Juque/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Juque_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 851804,
    SkillNodeEffects = {851805, 851813}
  },
  [851805] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss18_Juque/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Juque_Skill05_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 851805,
    SkillNodeEffects = {
      851805,
      851806,
      851808
    }
  },
  [851806] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss18_Juque/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Juque_Skill06_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 851806,
    SkillNodeEffects = {851815}
  },
  [851807] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss18_Juque/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Juque_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 851807,
    SkillNodeEffects = {851805, 851814}
  },
  [851808] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss18_Juque/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Juque_Skill08_Montage",
    DisableBlendBone = false,
    NodeId = 851808,
    SkillNodeEffects = {
      851801,
      851802,
      851803
    }
  },
  [851901] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_LiecheCannon_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 851901,
    SkillNodeEffects = {851901}
  },
  [851902] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_LiecheCannon_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 851902,
    SkillNodeEffects = {851904, 851907}
  },
  [851911] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_LiecheHand_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 851911,
    SkillNodeEffects = {851908}
  },
  [851912] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_LiecheHand_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 851912,
    SkillNodeEffects = {851909}
  },
  [851913] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_LiecheHand_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 851913,
    SkillNodeEffects = {851912}
  },
  [851914] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_LiecheHand_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 851914
  },
  [851921] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lieche_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 851921,
    SkillNodeEffects = {
      851913,
      851927,
      851950,
      851951
    }
  },
  [851922] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lieche_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 851922,
    SkillNodeEffects = {
      851915,
      851916,
      851917,
      851918
    }
  },
  [851923] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lieche_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 851923,
    SkillNodeEffects = {851919}
  },
  [851924] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lieche_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 851924,
    SkillNodeEffects = {851922}
  },
  [851925] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lieche_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 851925,
    SkillNodeEffects = {
      851923,
      851938,
      851939
    }
  },
  [851926] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lieche_Skill06_Montage",
    DisableBlendBone = false,
    NodeId = 851926,
    SkillNodeEffects = {851925}
  },
  [851927] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lieche_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 851927,
    SkillNodeEffects = {851929}
  },
  [851928] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lieche_Skill08_Montage",
    DisableBlendBone = false,
    NodeId = 851928,
    SkillNodeEffects = {
      851953,
      851954,
      851955,
      851956,
      851915,
      851916,
      851917,
      851918
    }
  },
  [851929] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Lieche_Skill09_Montage",
    DisableBlendBone = false,
    NodeId = 851929,
    SkillNodeEffects = {
      851957,
      851958,
      851959,
      851960,
      851961,
      851962
    }
  },
  [851931] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_LiecheBomb_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 851931,
    SkillNodeEffects = T.RT_77
  },
  [851932] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_LiecheBomb_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 851932,
    SkillNodeEffects = T.RT_77
  },
  [851933] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_LiecheBomb_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 851933,
    SkillNodeEffects = T.RT_77
  },
  [851941] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_LiecheCore_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 851941,
    SkillNodeEffects = T.RT_78
  },
  [851942] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_LiecheCore_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 851942,
    SkillNodeEffects = {851943}
  },
  [851943] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_LiecheCore_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 851943,
    SkillNodeEffects = {851963}
  },
  [851944] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_LiecheCore_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 851944,
    SkillNodeEffects = T.RT_78
  },
  [851945] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_LiecheCore_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 851945,
    SkillNodeEffects = {851975}
  },
  [852001] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 852001,
    SkillNodeEffects = {
      852001,
      852002,
      852003,
      852069,
      852013
    }
  },
  [852002] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 852002,
    SkillNodeEffects = {852005, 852014}
  },
  [852003] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 852003,
    SkillNodeEffects = {852006}
  },
  [852004] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 852004,
    SkillNodeEffects = {
      852070,
      852097,
      852098
    }
  },
  [852005] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 852005,
    SkillNodeEffects = {
      852015,
      852090,
      852098
    }
  },
  [852006] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill06_Montage",
    DisableBlendBone = false,
    NodeId = 852006
  },
  [852007] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 852007,
    SkillNodeEffects = {
      852016,
      852017,
      852019,
      852021,
      852022,
      852023,
      852025
    }
  },
  [852008] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill08_Montage",
    DisableBlendBone = false,
    NodeId = 852008,
    SkillNodeEffects = {
      852029,
      852030,
      852032,
      852033
    }
  },
  [852009] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill09_Montage",
    DisableBlendBone = false,
    NodeId = 852009,
    SkillNodeEffects = {
      852029,
      852038,
      852071
    }
  },
  [852010] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill10_Montage",
    DisableBlendBone = false,
    NodeId = 852010,
    SkillNodeEffects = {
      852047,
      852049,
      852050,
      852051,
      852052,
      852053,
      852054,
      852055,
      852056,
      852057,
      852061,
      852063
    }
  },
  [852011] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill11_Montage",
    DisableBlendBone = false,
    NodeId = 852011,
    SkillNodeEffects = {852039}
  },
  [852012] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill12_Montage",
    DisableBlendBone = false,
    NodeId = 852012,
    SkillNodeEffects = {852013}
  },
  [852013] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill13_Montage",
    DisableBlendBone = false,
    NodeId = 852013
  },
  [852014] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill14_Montage",
    DisableBlendBone = false,
    NodeId = 852014,
    SkillNodeEffects = {852040}
  },
  [852015] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill15_Montage",
    DisableBlendBone = false,
    NodeId = 852015
  },
  [852016] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill11_Montage",
    DisableBlendBone = false,
    NodeId = 852016,
    SkillNodeEffects = {852072}
  },
  [852017] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill17_Montage",
    DisableBlendBone = false,
    NodeId = 852017,
    SkillNodeEffects = {
      852073,
      852074,
      852077
    }
  },
  [852018] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 852018,
    SkillNodeEffects = {
      852086,
      852087,
      852088,
      852089
    }
  },
  [852019] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill11_Montage",
    DisableBlendBone = false,
    NodeId = 852019,
    SkillNodeEffects = {8520101}
  },
  [852020] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill11_Montage",
    DisableBlendBone = false,
    NodeId = 852020,
    SkillNodeEffects = {8520106}
  },
  [852021] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill21_Montage",
    DisableBlendBone = false,
    NodeId = 852021,
    SkillNodeEffects = {8520107}
  },
  [852022] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill22_Montage",
    DisableBlendBone = false,
    NodeId = 852022
  },
  [852023] = {
    AnimPath = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Boss_Aida_Skill23_Montage",
    DisableBlendBone = false,
    NodeId = 852023,
    SkillNodeEffects = {8520109}
  },
  [900101] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Yinxie/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Yinxie_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 900101,
    SkillNodeEffects = T.RT_79
  },
  [900102] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Yinxie/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Yinxie_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 900102,
    SkillNodeEffects = T.RT_79
  },
  [900103] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Yinxie/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Yinxie_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 900103,
    SkillNodeEffects = {900102, 900103}
  },
  [900111] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Yinxie/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Yinxie_Alarm01_Montage",
    DisableBlendBone = false,
    NodeId = 900111,
    SkillNodeEffects = T.RT_4
  },
  [900201] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Dufeng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Dufeng_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 900201,
    SkillNodeEffects = T.RT_80
  },
  [900202] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Dufeng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Dufeng_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 900202,
    SkillNodeEffects = T.RT_80
  },
  [900203] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Dufeng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Dufeng_Dual_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 900203,
    SkillNodeEffects = T.RT_81
  },
  [900204] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Dufeng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Dufeng_Dual_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 900204,
    SkillNodeEffects = T.RT_81
  },
  [900211] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Dufeng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Dufeng_Alarm01_Montage",
    DisableBlendBone = false,
    NodeId = 900211,
    SkillNodeEffects = T.RT_4
  },
  [900301] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Wanju/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Wanju_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 900301,
    SkillNodeEffects = T.RT_82
  },
  [900302] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Wanju/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Wanju_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 900302,
    SkillNodeEffects = T.RT_82
  },
  [900303] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Wanju/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Wanju_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 900303,
    SkillNodeEffects = {900302}
  },
  [900304] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Wanju/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Wanju_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 900304,
    SkillNodeEffects = {900303, 900304}
  },
  [900305] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Wanju/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Wanju_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 900305,
    SkillNodeEffects = {900305}
  },
  [900401] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Wanju/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Wanju_Sum01_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 900401,
    SkillNodeEffects = {900401, 900402}
  },
  [900402] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Wanju/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Wanju_Sum01_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 900402,
    SkillNodeEffects = {900405, 900406}
  },
  [900501] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Baozha/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Baozha_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 900501,
    SkillNodeEffects = T.RT_83
  },
  [900502] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Baozha/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Baozha_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 900502,
    SkillNodeEffects = T.RT_83
  },
  [900503] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Baozha/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Baozha_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 900503,
    SkillNodeEffects = {900502}
  },
  [900504] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Baozha/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Baozha_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 900504,
    SkillNodeEffects = {900504, 900505}
  },
  [900505] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Baozha/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Baozha_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 900505,
    SkillNodeEffects = {900506, 900507}
  },
  [900601] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Qizha/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Qizha_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 900601,
    SkillNodeEffects = T.RT_84
  },
  [900602] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Qizha/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Qizha_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 900602,
    SkillNodeEffects = T.RT_84
  },
  [900603] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Qizha/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Qizha_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 900603,
    SkillNodeEffects = {
      900602,
      900603,
      900604,
      900605,
      900606
    }
  },
  [900604] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Qizha/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Qizha_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 900604,
    SkillNodeEffects = {900607}
  },
  [900605] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Qizha/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Qizha_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 900605,
    SkillNodeEffects = {900608}
  },
  [900606] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Qizha/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Qizha_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 900606,
    SkillNodeEffects = {
      900609,
      900610,
      900611,
      900612,
      900613,
      900620
    }
  },
  [900607] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Qizha/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Qizha_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 900607,
    SkillNodeEffects = {
      900609,
      900615,
      900616
    }
  },
  [900608] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Qizha/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Qizha_Skill06_Montage",
    DisableBlendBone = false,
    NodeId = 900608,
    SkillNodeEffects = {900609}
  },
  [900701] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Niaopao/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Niaopao_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 900701,
    SkillNodeEffects = {900701}
  },
  [900702] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Niaopao/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Niaopao_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 900702,
    SkillNodeEffects = {900701, 900704}
  },
  [900703] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Niaopao/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Niaopao_Attack03_Montage",
    DisableBlendBone = false,
    NodeId = 900703,
    SkillNodeEffects = {
      900701,
      900704,
      900707
    }
  },
  [900704] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Niaopao/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Niaopao_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 900704,
    SkillNodeEffects = {900709}
  },
  [900711] = {
    AnimPath = "/Game/Asset/Char/Monster/SQ_Niaopao/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "SQ_Niaopao_Alarm01_Montage",
    DisableBlendBone = false,
    NodeId = 900711,
    SkillNodeEffects = T.RT_4
  },
  [950001] = {
    AnimPath = "/Game/Asset/Char/Monster/NE_Dajie/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "NE_Dajie_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 950001,
    SkillNodeEffects = {950003}
  },
  [950002] = {
    AnimPath = "/Game/Asset/Char/Monster/NE_Dajie/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "NE_Dajie_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 950002,
    SkillNodeEffects = {950004}
  },
  [950003] = {
    AnimPath = "/Game/Asset/Char/Monster/NE_Dajie/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "NE_Dajie_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 950003,
    SkillNodeEffects = {950005}
  },
  [950004] = {
    AnimPath = "/Game/Asset/Char/Monster/NE_Dajie/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "NE_Dajie_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 950004
  },
  [950005] = {
    AnimPath = "/Game/Asset/Char/Monster/NE_Dajie/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "NE_Dajie_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 950005,
    SkillNodeEffects = {950019}
  },
  [950101] = {
    AnimPath = "/Game/Asset/Char/Monster/NE_Villiger/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "NE_Villiger_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 950101,
    RootMotionRadius = 3,
    SkillNodeEffects = T.RT_85
  },
  [950102] = {
    AnimPath = "/Game/Asset/Char/Monster/NE_Villiger/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "NE_Villiger_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 950102,
    RootMotionRadius = 3,
    SkillNodeEffects = T.RT_85
  },
  [950103] = {
    AnimPath = "/Game/Asset/Char/Monster/NE_Villiger/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "NE_Villiger_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 950103,
    SkillNodeEffects = {
      950102,
      950103,
      950104
    }
  },
  [950104] = {
    AnimPath = "/Game/Asset/Char/Monster/NE_Villiger/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "NE_Villiger_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 950104,
    SkillNodeEffects = T.RT_86
  },
  [950105] = {
    AnimPath = "/Game/Asset/Char/Monster/NE_Villiger/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "NE_Villiger_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 950105,
    SkillNodeEffects = T.RT_86
  },
  [950106] = {
    AnimPath = "/Game/Asset/Char/Monster/NE_Villiger/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "NE_Villiger_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 950106,
    SkillNodeEffects = {950105, 950110}
  },
  [950401] = {
    AnimPath = "/Game/Asset/Char/Monster/NE_Wuyou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "NE_Wuyou_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 950401,
    SkillNodeEffects = {
      950401,
      950404,
      950408
    }
  },
  [950402] = {
    AnimPath = "/Game/Asset/Char/Monster/NE_Wuyou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "NE_Wuyou_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 950402,
    SkillNodeEffects = {
      950405,
      950406,
      950407
    }
  },
  [950501] = {
    AnimPath = "/Game/Asset/Char/Monster/NE_Wuyou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "NE_Wuyou_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 950501,
    SkillNodeEffects = {950501}
  },
  [950502] = {
    AnimPath = "/Game/Asset/Char/Monster/NE_Wuyou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "NE_Wuyou_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 950502,
    SkillNodeEffects = {950502}
  },
  [950601] = {
    AnimPath = "/Game/Asset/Char/Monster/NE_Wuyou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "NE_Wuyou_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 950601,
    SkillNodeEffects = {950601}
  },
  [950602] = {
    AnimPath = "/Game/Asset/Char/Monster/NE_Wuyou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "NE_Wuyou_Skill06_Montage",
    DisableBlendBone = false,
    NodeId = 950602,
    SkillNodeEffects = {950602}
  },
  [950701] = {
    AnimPath = "/Game/Asset/Char/Monster/NE_Villiger04/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "NE_Villiger04_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 950701,
    SkillNodeEffects = {950701}
  },
  [950702] = {
    AnimPath = "/Game/Asset/Char/Monster/NE_Villiger04/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "NE_Villiger04_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 950702,
    SkillNodeEffects = {950702}
  },
  [980101] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal01_Xuelang/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Xuelang_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 980101,
    SkillNodeEffects = T.RT_87
  },
  [980102] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal01_Xuelang/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Xuelang_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 980102,
    SkillNodeEffects = T.RT_87
  },
  [980103] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal01_Xuelang/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Xuelang_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 980103,
    SkillNodeEffects = {980102, 980103}
  },
  [980104] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal01_Xuelang/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Xuelang_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 980104
  },
  [980105] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal01_Xuelang/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Xuelang_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 980105
  },
  [980106] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal01_Xuelang/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Xuelang_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 980106
  },
  [980107] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal01_Xuelang/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_XuelangB_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 980107,
    SkillNodeEffects = T.RT_88
  },
  [980108] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal01_Xuelang/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_XuelangB_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 980108,
    SkillNodeEffects = T.RT_88
  },
  [980109] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal01_Xuelang/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_XuelangB_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 980109,
    SkillNodeEffects = {980105, 980106}
  },
  [980201] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal02_Hongjiaolu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Hongjiaolu_Attack_Montage",
    DisableBlendBone = false,
    NodeId = 980201,
    SkillNodeEffects = {980201}
  },
  [980202] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal02_Hongjiaolu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Hongjiaolu_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 980202,
    SkillNodeEffects = {980202}
  },
  [980203] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal02_Hongjiaolu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Hongjiaolu_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 980203,
    SkillNodeEffects = {980203}
  },
  [980204] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal02_Hongjiaolu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Hongjiaolu_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 980204,
    SkillNodeEffects = {980204}
  },
  [980205] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal02_Hongjiaolu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Hongjiaolu_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 980205
  },
  [980206] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal02_Hongjiaolu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Hongjiaolu_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 980206
  },
  [980207] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal02_Hongjiaolu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Hongjiaolu_Skill06_Montage",
    DisableBlendBone = false,
    NodeId = 980207
  },
  [980301] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal03_Yinbeishu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Yinbeishu_Attack_Montage",
    DisableBlendBone = false,
    NodeId = 980301,
    SkillNodeEffects = {980301}
  },
  [980302] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal03_Yinbeishu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Yinbeishu_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 980302,
    SkillNodeEffects = {980302}
  },
  [980303] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal03_Yinbeishu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Yinbeishu_Attack_Montage",
    DisableBlendBone = false,
    NodeId = 980303,
    SkillNodeEffects = {980303}
  },
  [980304] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal03_Yinbeishu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_YinbeishuB_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 980304,
    SkillNodeEffects = {980304, 980306}
  },
  [980401] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal04_Jiujiu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Jiujiu_Skill01_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 980401,
    SkillNodeEffects = {980401}
  },
  [980402] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal04_Jiujiu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Jiujiu_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 980402
  },
  [980501] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal05_Suoweng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Suoweng_Skill01_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = false,
    NodeId = 980501,
    SkillNodeEffects = {980501}
  },
  [980502] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal05_Suoweng/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Suoweng_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 980502
  },
  [980701] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal07_Zhenzhu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Zhenzhu_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 980701,
    SkillNodeEffects = {980701}
  },
  [980702] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal07_Zhenzhu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Zhenzhu_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 980702
  },
  [980901] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal08_Chihu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Chihu_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 980901
  },
  [980902] = {
    AnimPath = "/Game/Asset/Char/Monster/Animal08_Chihu/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Mon_Chihu_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 980902
  },
  [1000101] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianshi_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 1000101,
    RootMotionRadius = 1.5,
    SkillNodeEffects = T.RT_1
  },
  [1000102] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianshi_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 1000102,
    RootMotionRadius = 1.5,
    SkillNodeEffects = T.RT_2
  },
  [1000103] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianshi_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 1000103,
    SkillNodeEffects = T.RT_3
  },
  [1000104] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianshi_Alarm01_Montage",
    DisableBlendBone = false,
    NodeId = 1000104,
    SkillNodeEffects = T.RT_4
  },
  [1000105] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianshi_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 1000105,
    SkillNodeEffects = T.RT_3
  },
  [1000106] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianshi_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 1000106,
    SkillNodeEffects = T.RT_5
  },
  [1000107] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianshi_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 1000107,
    SkillNodeEffects = T.RT_6
  },
  [1000108] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianshi_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 1000108,
    SkillNodeEffects = T.RT_3
  },
  [1000109] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianshi_Skill06_Montage",
    DisableBlendBone = false,
    NodeId = 1000109,
    SkillNodeEffects = T.RT_5
  },
  [1000110] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianshi_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 1000110,
    SkillNodeEffects = T.RT_6
  },
  [1000201] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianwei/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianwei_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 1000201,
    RootMotionRadius = 2,
    SkillNodeEffects = {1000201}
  },
  [1000202] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianwei/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianwei_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 1000202,
    RootMotionRadius = 1.5,
    SkillNodeEffects = {
      1000202,
      1000203,
      1000204
    }
  },
  [1000203] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianwei/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianwei_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 1000203,
    RootMotionRadius = 1.5,
    SkillNodeEffects = {1000201, 1000205}
  },
  [1000204] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianwei/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianwei_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 1000204,
    SkillNodeEffects = {1000206, 1000207}
  },
  [1000205] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianwei/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianwei_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 1000205,
    SkillNodeEffects = {1000208, 1000209}
  },
  [1000206] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianwei/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianwei_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 1000206,
    SkillNodeEffects = {1000212}
  },
  [1000207] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianwei/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianwei_Alarm01_Montage",
    DisableBlendBone = true,
    NodeId = 1000207,
    SkillNodeEffects = T.RT_4
  },
  [1000301] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_A/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 1000301,
    SkillNodeEffects = {
      1000301,
      1000314,
      1000315
    }
  },
  [1000302] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_A/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 1000302,
    SkillNodeEffects = {1000302, 1000303}
  },
  [1000303] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_A/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 1000303,
    SkillNodeEffects = {1000304}
  },
  [1000304] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_A/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 1000304,
    SkillNodeEffects = {1000307, 1000308}
  },
  [1000305] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_A/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 1000305,
    SkillNodeEffects = T.RT_7
  },
  [1000306] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_A/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 1000306,
    SkillNodeEffects = T.RT_8
  },
  [1000307] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_A/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_Skill06_Montage",
    DisableBlendBone = false,
    NodeId = 1000307,
    SkillNodeEffects = {1000312}
  },
  [1000308] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_A/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_C01_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 1000308,
    SkillNodeEffects = T.RT_7
  },
  [1000309] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_A/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_C01_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 1000309,
    SkillNodeEffects = T.RT_8
  },
  [1000401] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_B/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 1000401,
    SkillNodeEffects = T.RT_9
  },
  [1000402] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_B/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 1000402,
    SkillNodeEffects = T.RT_9
  },
  [1000403] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_B/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 1000403,
    SkillNodeEffects = {1000404, 1000405}
  },
  [1000404] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_B/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 1000404
  },
  [1000405] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_B/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 1000405,
    SkillNodeEffects = {1000412}
  },
  [1000406] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_B/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 1000406,
    SkillNodeEffects = T.RT_10
  },
  [1000407] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_B/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 1000407,
    SkillNodeEffects = T.RT_11
  },
  [1000408] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_B/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_Skill06_Montage",
    DisableBlendBone = false,
    NodeId = 1000408,
    SkillNodeEffects = {1000416}
  },
  [1000409] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_B/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 1000409
  },
  [1000410] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_B/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_Skill08_Montage",
    DisableBlendBone = false,
    NodeId = 1000410
  },
  [1000411] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_B/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_Skill09_Montage",
    DisableBlendBone = false,
    NodeId = 1000411
  },
  [1000412] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_B/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_C01_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 1000412,
    SkillNodeEffects = T.RT_10
  },
  [1000413] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/Combat/Skill/Skill_B/",
    AnimPlayRate = 1,
    AnimResource = "HX_Bian_C01_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 1000413,
    SkillNodeEffects = T.RT_11
  },
  [1000501] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianshi_C01_Attack01_Montage",
    DisableBlendBone = false,
    NodeId = 1000501,
    RootMotionRadius = 1.5,
    SkillNodeEffects = T.RT_1
  },
  [1000502] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianshi_C01_Attack02_Montage",
    DisableBlendBone = false,
    NodeId = 1000502,
    RootMotionRadius = 1.5,
    SkillNodeEffects = T.RT_2
  },
  [1000503] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianshi_C01_Skill01_Montage",
    DisableBlendBone = false,
    NodeId = 1000503,
    SkillNodeEffects = T.RT_3
  },
  [1000504] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianshi_Alarm01_Montage",
    DisableBlendBone = false,
    NodeId = 1000504,
    SkillNodeEffects = T.RT_4
  },
  [1000505] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianshi_C01_Skill02_Montage",
    DisableBlendBone = false,
    NodeId = 1000505,
    SkillNodeEffects = T.RT_3
  },
  [1000506] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianshi_C01_Skill03_Montage",
    DisableBlendBone = false,
    NodeId = 1000506,
    SkillNodeEffects = T.RT_5
  },
  [1000507] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianshi_C01_Skill04_Montage",
    DisableBlendBone = false,
    NodeId = 1000507,
    SkillNodeEffects = T.RT_6
  },
  [1000508] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianshi_C01_Skill05_Montage",
    DisableBlendBone = false,
    NodeId = 1000508,
    SkillNodeEffects = T.RT_3
  },
  [1000509] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianshi_C01_Skill06_Montage",
    DisableBlendBone = false,
    NodeId = 1000509,
    SkillNodeEffects = T.RT_5
  },
  [1000510] = {
    AnimPath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "HX_Tianshi_C01_Skill07_Montage",
    DisableBlendBone = false,
    NodeId = 1000510,
    SkillNodeEffects = T.RT_6
  },
  [1010111] = {
    AnimName = "Sword_RunAttack_01_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Sword/",
    NextNodeId = 1010112,
    NodeId = 1010111,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1010111}
  },
  [1010112] = {
    AnimName = "Sword_RunAttack_02_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Sword/",
    DisableBlendBone = true,
    NextNodeId = 1010113,
    NodeId = 1010112,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1010112}
  },
  [1010113] = {
    AnimName = "Sword_RunAttack_03_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Sword/",
    DisableBlendBone = true,
    NextNodeId = 1010114,
    NodeId = 1010113,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1010113, 1010115}
  },
  [1010114] = {
    AnimName = "Sword_RunAttack_04_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Sword/",
    DisableBlendBone = true,
    NextNodeId = 1010111,
    NodeId = 1010114,
    PhantomAutoInput = 2,
    SkillNodeEffects = {1010114}
  },
  [1010121] = {
    AnimName = "Sword_HeavyAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Sword/",
    DisableBlendBone = true,
    NodeId = 1010121,
    SkillNodeEffects = {1010121}
  },
  [1010131] = {
    AnimName = "Sword_FallAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Sword/",
    DisableBlendBone = true,
    NodeId = 1010131,
    SkillNodeEffects = {1010131, 1010132}
  },
  [1010141] = {
    AnimName = "Sword_SlideAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Sword/",
    DisableBlendBone = true,
    NodeId = 1010141,
    SkillNodeEffects = {1010141}
  },
  [1010211] = {
    AnimName = "Sword_Mod01_RunAttack_01_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Sword/",
    NextNodeId = 1010212,
    NodeId = 1010211,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1010211}
  },
  [1010212] = {
    AnimName = "Sword_Mod01_RunAttack_02_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Sword/",
    DisableBlendBone = true,
    NextNodeId = 1010213,
    NodeId = 1010212,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1010212}
  },
  [1010213] = {
    AnimName = "Sword_Mod01_RunAttack_03_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Sword/",
    DisableBlendBone = true,
    NextNodeId = 1010214,
    NodeId = 1010213,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1010213}
  },
  [1010214] = {
    AnimName = "Sword_Mod01_RunAttack_04_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Sword/",
    DisableBlendBone = true,
    NextNodeId = 1010211,
    NodeId = 1010214,
    PhantomAutoInput = 2,
    SkillNodeEffects = {1010214}
  },
  [1010221] = {
    AnimName = "Sword_Mod01_HeavyAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Sword/",
    DisableBlendBone = true,
    NodeId = 1010221,
    SkillNodeEffects = {1010221}
  },
  [1010321] = {
    AnimName = "Sword_Mod02_HeavyAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Sword/",
    DisableBlendBone = true,
    NodeId = 1010321,
    SkillNodeEffects = {1010321}
  },
  [1020111] = {
    AnimName = "Polearm_RunAttack_01_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Polearm/",
    DisableBlendBone = true,
    NextNodeId = 1020112,
    NodeId = 1020111,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1020111}
  },
  [1020112] = {
    AnimName = "Polearm_RunAttack_02_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Polearm/",
    DisableBlendBone = true,
    NextNodeId = 1020113,
    NodeId = 1020112,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1020112}
  },
  [1020113] = {
    AnimName = "Polearm_RunAttack_03_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Polearm/",
    DisableBlendBone = true,
    NextNodeId = 1020114,
    NodeId = 1020113,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1020113}
  },
  [1020114] = {
    AnimName = "Polearm_RunAttack_04_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Polearm/",
    DisableBlendBone = true,
    NextNodeId = 1020115,
    NodeId = 1020114,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1020114}
  },
  [1020115] = {
    AnimName = "Polearm_RunAttack_05_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Polearm/",
    DisableBlendBone = true,
    NextNodeId = 1020111,
    NodeId = 1020115,
    PhantomAutoInput = 2,
    SkillNodeEffects = {1020115}
  },
  [1020121] = {
    AnimName = "Polearm_HeavyAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Polearm/",
    DisableBlendBone = true,
    NodeId = 1020121,
    SkillNodeEffects = {
      1020121,
      1020122,
      1020123
    }
  },
  [1020131] = {
    AnimName = "Polearm_FallAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Polearm/",
    DisableBlendBone = true,
    NodeId = 1020131,
    SkillNodeEffects = {1020131, 1020132}
  },
  [1020141] = {
    AnimName = "Polearm_SlideAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Polearm/",
    DisableBlendBone = true,
    NodeId = 1020141,
    SkillNodeEffects = {1020141}
  },
  [1020161] = {
    AnimName = "Polearm_HeavyAttack_Callback_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Polearm/",
    DisableBlendBone = true,
    NodeId = 1020161,
    SkillNodeEffects = {1020161}
  },
  [1020211] = {
    AnimName = "Polearm_Mod01_RunAttack_01_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Polearm/",
    DisableBlendBone = true,
    NextNodeId = 1020212,
    NodeId = 1020211,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1020211}
  },
  [1020212] = {
    AnimName = "Polearm_Mod01_RunAttack_02_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Polearm/",
    DisableBlendBone = true,
    NextNodeId = 1020213,
    NodeId = 1020212,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1020212}
  },
  [1020213] = {
    AnimName = "Polearm_Mod01_RunAttack_03_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Polearm/",
    DisableBlendBone = true,
    NextNodeId = 1020214,
    NodeId = 1020213,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1020213, 1020214}
  },
  [1020214] = {
    AnimName = "Polearm_Mod01_RunAttack_04_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Polearm/",
    DisableBlendBone = true,
    NextNodeId = 1020211,
    NodeId = 1020214,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1020215, 1020216}
  },
  [1020221] = {
    AnimName = "Polearm_Mod01_HeavyAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Polearm/",
    DisableBlendBone = true,
    NodeId = 1020221,
    SkillNodeEffects = {1020221}
  },
  [1020231] = {
    AnimName = "Polearm_Mod01_FallAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Polearm/",
    DisableBlendBone = true,
    NodeId = 1020231,
    SkillNodeEffects = {1020231, 1020232}
  },
  [1020321] = {
    AnimName = "Polearm_Mod02_HeavyAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Polearm/",
    DisableBlendBone = true,
    NodeId = 1020321,
    SkillNodeEffects = {1020321}
  },
  [1030111] = {
    AnimName = "Claymore_RunAttack_01_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Claymore/",
    DisableBlendBone = true,
    NextNodeId = 1030112,
    NodeId = 1030111,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1030111}
  },
  [1030112] = {
    AnimName = "Claymore_RunAttack_02_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Claymore/",
    DisableBlendBone = true,
    NextNodeId = 1030113,
    NodeId = 1030112,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1030112}
  },
  [1030113] = {
    AnimName = "Claymore_RunAttack_03_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Claymore/",
    DisableBlendBone = true,
    NextNodeId = 1030114,
    NodeId = 1030113,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1030113}
  },
  [1030114] = {
    AnimName = "Claymore_RunAttack_04_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Claymore/",
    DisableBlendBone = true,
    NextNodeId = 1030111,
    NodeId = 1030114,
    PhantomAutoInput = 2,
    SkillNodeEffects = {1030114}
  },
  [1030121] = {
    AnimName = "Claymore_HeavyAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Claymore/",
    DisableBlendBone = true,
    NodeId = 1030121,
    PhantomPressTime = 2.2,
    SkillNodeEffects = {1030121, 1030122}
  },
  [1030131] = {
    AnimName = "Claymore_FallAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Claymore/",
    DisableBlendBone = true,
    NodeId = 1030131,
    SkillNodeEffects = {1030131, 1030132}
  },
  [1030141] = {
    AnimName = "Claymore_SlideAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Claymore/",
    DisableBlendBone = true,
    NodeId = 1030141,
    SkillNodeEffects = {1030141}
  },
  [1030211] = {
    AnimName = "Claymore_Mod01_RunAttack_01_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Claymore/",
    ChangeHandHold = T.RT_16,
    DisableBlendBone = true,
    NextNodeId = 1030212,
    NodeId = 1030211,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1030211}
  },
  [1030212] = {
    AnimName = "Claymore_Mod01_RunAttack_02_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Claymore/",
    ChangeHandHold = T.RT_16,
    DisableBlendBone = true,
    NextNodeId = 1030213,
    NodeId = 1030212,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1030212}
  },
  [1030213] = {
    AnimName = "Claymore_Mod01_RunAttack_03_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Claymore/",
    ChangeHandHold = T.RT_16,
    DisableBlendBone = true,
    NextNodeId = 1030211,
    NodeId = 1030213,
    PhantomAutoInput = 2,
    SkillNodeEffects = {1030213, 1030214}
  },
  [1030221] = {
    AnimName = "Claymore_Mod01_HeavyAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Claymore/",
    DisableBlendBone = true,
    NodeId = 1030221,
    SkillNodeEffects = {
      1030221,
      1030222,
      1030224
    }
  },
  [1030311] = {
    AnimName = "Claymore_Mod02_RunAttack_01_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Claymore/",
    DisableBlendBone = true,
    NextNodeId = 1030312,
    NodeId = 1030311,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1030311}
  },
  [1030312] = {
    AnimName = "Claymore_Mod02_RunAttack_02_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Claymore/",
    DisableBlendBone = true,
    NextNodeId = 1030313,
    NodeId = 1030312,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1030312}
  },
  [1030313] = {
    AnimName = "Claymore_Mod02_RunAttack_03_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Claymore/",
    DisableBlendBone = true,
    NextNodeId = 1030314,
    NodeId = 1030313,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1030313}
  },
  [1030314] = {
    AnimName = "Claymore_Mod02_RunAttack_04_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Claymore/",
    DisableBlendBone = true,
    NextNodeId = 1030311,
    NodeId = 1030314,
    PhantomAutoInput = 2,
    SkillNodeEffects = {1030314}
  },
  [1040111] = {
    AnimName = "Dualblade_RunAttack_01_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Dualblade/",
    DisableBlendBone = true,
    NextNodeId = 1040112,
    NodeId = 1040111,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1040111}
  },
  [1040112] = {
    AnimName = "Dualblade_RunAttack_02_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Dualblade/",
    DisableBlendBone = true,
    NextNodeId = 1040113,
    NodeId = 1040112,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1040112}
  },
  [1040113] = {
    AnimName = "Dualblade_RunAttack_03_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Dualblade/",
    DisableBlendBone = true,
    NextNodeId = 1040114,
    NodeId = 1040113,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1040113}
  },
  [1040114] = {
    AnimName = "Dualblade_RunAttack_04_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Dualblade/",
    DisableBlendBone = true,
    NextNodeId = 1040111,
    NodeId = 1040114,
    PhantomAutoInput = 2,
    SkillNodeEffects = {1040114}
  },
  [1040121] = {
    AnimName = "Dualblade_HeavyAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Dualblade/",
    DisableBlendBone = true,
    NodeId = 1040121,
    SkillNodeEffects = {1040121, 1040122}
  },
  [1040131] = {
    AnimName = "Dualblade_FallAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Dualblade/",
    DisableBlendBone = true,
    NodeId = 1040131,
    SkillNodeEffects = {1040131, 1040132}
  },
  [1040141] = {
    AnimName = "Dualblade_SlideAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Dualblade/",
    DisableBlendBone = true,
    NodeId = 1040141,
    SkillNodeEffects = {1040141}
  },
  [1040211] = {
    AnimName = "Dualblade_Mod01_RunAttack_01_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Dualblade/",
    DisableBlendBone = true,
    NextNodeId = 1040212,
    NodeId = 1040211,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1040211}
  },
  [1040212] = {
    AnimName = "Dualblade_Mod01_RunAttack_02_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Dualblade/",
    DisableBlendBone = true,
    NextNodeId = 1040213,
    NodeId = 1040212,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1040212}
  },
  [1040213] = {
    AnimName = "Dualblade_Mod01_RunAttack_03_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Dualblade/",
    DisableBlendBone = true,
    NextNodeId = 1040214,
    NodeId = 1040213,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1040213}
  },
  [1040214] = {
    AnimName = "Dualblade_Mod01_RunAttack_04_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Dualblade/",
    DisableBlendBone = true,
    NextNodeId = 1040211,
    NodeId = 1040214,
    PhantomAutoInput = 2,
    SkillNodeEffects = {1040214}
  },
  [1040221] = {
    AnimName = "Dualblade_Mod01_HeavyAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Dualblade/",
    DisableBlendBone = true,
    NodeId = 1040221,
    SkillNodeEffects = {1040221}
  },
  [1040241] = {
    AnimName = "Dualblade_Mod01_SlideAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Dualblade/",
    DisableBlendBone = true,
    NodeId = 1040241,
    SkillNodeEffects = {1040241}
  },
  [1050111] = {
    AnimName = "Swordwhip_RunAttack_01_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Swordwhip/",
    NextNodeId = 1050112,
    NodeId = 1050111,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1050111}
  },
  [1050112] = {
    AnimName = "Swordwhip_RunAttack_02_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Swordwhip/",
    DisableBlendBone = true,
    NextNodeId = 1050113,
    NodeId = 1050112,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1050112}
  },
  [1050113] = {
    AnimName = "Swordwhip_RunAttack_03_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Swordwhip/",
    DisableBlendBone = true,
    NextNodeId = 1050114,
    NodeId = 1050113,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1050113}
  },
  [1050114] = {
    AnimName = "Swordwhip_RunAttack_04_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Swordwhip/",
    DisableBlendBone = true,
    NextNodeId = 1050111,
    NodeId = 1050114,
    PhantomAutoInput = 2,
    SkillNodeEffects = {1050114}
  },
  [1050121] = {
    AnimName = "Swordwhip_HeavyAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Swordwhip/",
    DisableBlendBone = true,
    NodeId = 1050121,
    SkillNodeEffects = {1050121}
  },
  [1050131] = {
    AnimName = "Swordwhip_FallAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Swordwhip/",
    DisableBlendBone = true,
    NodeId = 1050131,
    SkillNodeEffects = {1050131, 1050132}
  },
  [1050141] = {
    AnimName = "Swordwhip_SlideAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Swordwhip/",
    DisableBlendBone = true,
    NodeId = 1050141,
    SkillNodeEffects = {1050141}
  },
  [1060111] = {
    AnimName = "Katana_RunAttack_01_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Katana/",
    ChangeHandHold = T.RT_19,
    DisableBlendBone = true,
    NextNodeId = 1060112,
    NodeId = 1060111,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1060111}
  },
  [1060112] = {
    AnimName = "Katana_RunAttack_02_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Katana/",
    ChangeHandHold = T.RT_19,
    DisableBlendBone = true,
    NextNodeId = 1060113,
    NodeId = 1060112,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1060112}
  },
  [1060113] = {
    AnimName = "Katana_RunAttack_03_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Katana/",
    ChangeHandHold = T.RT_19,
    DisableBlendBone = true,
    NextNodeId = 1060114,
    NodeId = 1060113,
    PhantomAutoInput = 1,
    SkillNodeEffects = {1060113, 1060115}
  },
  [1060114] = {
    AnimName = "Katana_RunAttack_04_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Katana/",
    ChangeHandHold = T.RT_19,
    DisableBlendBone = true,
    NextNodeId = 1060111,
    NodeId = 1060114,
    PhantomAutoInput = 2,
    SkillNodeEffects = {1060114}
  },
  [1060121] = {
    AnimName = "Katana_HeavyAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Katana/",
    ChangeHandHold = T.RT_19,
    DisableBlendBone = true,
    NodeId = 1060121,
    SkillNodeEffects = {1060120}
  },
  [1060131] = {
    AnimName = "Katana_FallAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Katana/",
    ChangeHandHold = T.RT_19,
    DisableBlendBone = true,
    NodeId = 1060131,
    SkillNodeEffects = {1060131, 1060132}
  },
  [1060141] = {
    AnimName = "Katana_SlideAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Katana/",
    ChangeHandHold = T.RT_19,
    DisableBlendBone = true,
    NodeId = 1060141,
    SkillNodeEffects = {1060141}
  },
  [1060221] = {
    AnimName = "Katana_Mod01_HeavyAttack_01_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Katana/",
    ChangeHandHold = T.RT_19,
    DisableBlendBone = true,
    ExtraNextNodeId = 1060222,
    NextNodeId = 1060222,
    NodeId = 1060221,
    SkillNodeEffects = {
      1060251,
      1060252,
      1060253
    }
  },
  [1060222] = {
    AnimName = "Katana_Mod01_HeavyAttack_02_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Katana/",
    CanExtractZVelocity = true,
    ChangeHandHold = T.RT_19,
    DisableBlendBone = true,
    ExtraNextNodeId = 1060223,
    NextNodeId = 1060223,
    NodeId = 1060222
  },
  [1060223] = {
    AnimName = "Katana_Mod01_HeavyAttack_03_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Katana/",
    ChangeHandHold = T.RT_19,
    DisableBlendBone = true,
    NodeId = 1060223,
    SkillNodeEffects = {1060221, 1060220}
  },
  [1503101] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_Sword_RunAttack_01_Montage",
    KeepComboInDodge = true,
    NextNodeId = 1503102,
    NodeId = 1503101,
    PhantomAutoInput = 1,
    SkillNodeEffects = {150351}
  },
  [1503102] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_Sword_RunAttack_02_Montage",
    DisableBlendBone = true,
    KeepComboInDodge = true,
    NextNodeId = 1503103,
    NodeId = 1503102,
    PhantomAutoInput = 1,
    SkillNodeEffects = {150352}
  },
  [1503103] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_Sword_RunAttack_03_Montage",
    DisableBlendBone = true,
    KeepComboInDodge = true,
    NextNodeId = 1503104,
    NodeId = 1503103,
    PhantomAutoInput = 1,
    SkillNodeEffects = {150353}
  },
  [1503104] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_Sword_RunAttack_04_Montage",
    DisableBlendBone = true,
    KeepComboInDodge = true,
    NextNodeId = 1503101,
    NodeId = 1503104,
    PhantomAutoInput = 2,
    SkillNodeEffects = {150354}
  },
  [1503105] = {
    AnimName = "Sword_HeavyAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Sword/",
    DisableBlendBone = true,
    NodeId = 1503105,
    SkillNodeEffects = {150356}
  },
  [1503106] = {
    AnimName = "Sword_FallAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Sword/",
    DisableBlendBone = true,
    NodeId = 1503106,
    SkillNodeEffects = {150357, 150358}
  },
  [1503107] = {
    AnimName = "Sword_SlideAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Sword/",
    DisableBlendBone = true,
    NodeId = 1503107,
    SkillNodeEffects = {150359}
  },
  [1503121] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_Polearm_RunAttack_01_Montage",
    DisableBlendBone = true,
    KeepComboInDodge = true,
    NextNodeId = 1503122,
    NodeId = 1503121,
    PhantomAutoInput = 1,
    SkillNodeEffects = {150361}
  },
  [1503122] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_Polearm_RunAttack_02_Montage",
    DisableBlendBone = true,
    KeepComboInDodge = true,
    NextNodeId = 1503123,
    NodeId = 1503122,
    PhantomAutoInput = 1,
    SkillNodeEffects = {150362, 150363}
  },
  [1503123] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_Polearm_RunAttack_03_Montage",
    DisableBlendBone = true,
    KeepComboInDodge = true,
    NextNodeId = 1503124,
    NodeId = 1503123,
    PhantomAutoInput = 1,
    SkillNodeEffects = {150364}
  },
  [1503124] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_Polearm_RunAttack_04_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = true,
    KeepComboInDodge = true,
    NextNodeId = 1503121,
    NodeId = 1503124,
    PhantomAutoInput = 2,
    SkillNodeEffects = {150365}
  },
  [1503126] = {
    AnimName = "Polearm_Mod01_HeavyAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Polearm/",
    DisableBlendBone = true,
    NodeId = 1503126,
    SkillNodeEffects = {150367}
  },
  [1503127] = {
    AnimName = "Polearm_Mod01_FallAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Polearm/",
    DisableBlendBone = true,
    NodeId = 1503127,
    SkillNodeEffects = {150369, 150370}
  },
  [1503128] = {
    AnimName = "Polearm_SlideAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Polearm/",
    DisableBlendBone = true,
    NodeId = 1503128,
    SkillNodeEffects = {150373}
  },
  [1503141] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_Claymore_RunAttack_01_Montage",
    DisableBlendBone = true,
    KeepComboInDodge = true,
    NextNodeId = 1503142,
    NodeId = 1503141,
    PhantomAutoInput = 1,
    SkillNodeEffects = {150381}
  },
  [1503142] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_Claymore_RunAttack_02_Montage",
    DisableBlendBone = true,
    KeepComboInDodge = true,
    NextNodeId = 1503143,
    NodeId = 1503142,
    PhantomAutoInput = 1,
    SkillNodeEffects = {150382}
  },
  [1503143] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_Claymore_RunAttack_03_Montage",
    DisableBlendBone = true,
    KeepComboInDodge = true,
    NextNodeId = 1503144,
    NodeId = 1503143,
    PhantomAutoInput = 1,
    SkillNodeEffects = {150383}
  },
  [1503144] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_Claymore_RunAttack_04_Montage",
    DisableBlendBone = true,
    KeepComboInDodge = true,
    NextNodeId = 1503141,
    NodeId = 1503144,
    PhantomAutoInput = 2,
    SkillNodeEffects = {150384}
  },
  [1503145] = {
    AnimName = "Claymore_HeavyAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Claymore/",
    DisableBlendBone = true,
    NodeId = 1503145,
    SkillNodeEffects = {150385, 150386}
  },
  [1503146] = {
    AnimName = "Claymore_FallAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Claymore/",
    DisableBlendBone = true,
    NodeId = 1503146,
    SkillNodeEffects = {150387, 150388}
  },
  [1503147] = {
    AnimName = "Claymore_SlideAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Claymore/",
    DisableBlendBone = true,
    NodeId = 1503147,
    SkillNodeEffects = {150389}
  },
  [1503161] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_Dualblade_RunAttack_01_Montage",
    DisableBlendBone = true,
    KeepComboInDodge = true,
    NextNodeId = 1503162,
    NodeId = 1503161,
    PhantomAutoInput = 1,
    SkillNodeEffects = {150391}
  },
  [1503162] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_Dualblade_RunAttack_02_Montage",
    DisableBlendBone = true,
    KeepComboInDodge = true,
    NextNodeId = 1503163,
    NodeId = 1503162,
    PhantomAutoInput = 1,
    SkillNodeEffects = {150392}
  },
  [1503163] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_Dualblade_RunAttack_03_Montage",
    DisableBlendBone = true,
    KeepComboInDodge = true,
    NextNodeId = 1503164,
    NodeId = 1503163,
    PhantomAutoInput = 1,
    SkillNodeEffects = {150393}
  },
  [1503164] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_Dualblade_RunAttack_04_Montage",
    DisableBlendBone = true,
    KeepComboInDodge = true,
    NextNodeId = 1503161,
    NodeId = 1503164,
    PhantomAutoInput = 2,
    SkillNodeEffects = {150394}
  },
  [1503165] = {
    AnimName = "Dualblade_HeavyAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Dualblade/",
    DisableBlendBone = true,
    NodeId = 1503165,
    SkillNodeEffects = {150395, 150396}
  },
  [1503166] = {
    AnimName = "Dualblade_FallAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Dualblade/",
    DisableBlendBone = true,
    NodeId = 1503166,
    SkillNodeEffects = {150397, 150398}
  },
  [1503167] = {
    AnimName = "Dualblade_SlideAttack_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Dualblade/",
    DisableBlendBone = true,
    NodeId = 1503167,
    SkillNodeEffects = {150399}
  },
  [1503201] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_ChangeWeapon_Sword_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = true,
    NextNodeId = 1503101,
    NodeId = 1503201,
    PhantomAutoInput = 1,
    SkillNodeEffects = {
      150331,
      150346,
      150335
    }
  },
  [1503202] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_ChangeWeapon_Polearm_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = true,
    NextNodeId = 1503121,
    NodeId = 1503202,
    PhantomAutoInput = 1,
    SkillNodeEffects = {
      150332,
      150346,
      150336
    }
  },
  [1503203] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_ChangeWeapon_Claymore_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = true,
    NextNodeId = 1503141,
    NodeId = 1503203,
    PhantomAutoInput = 1,
    SkillNodeEffects = {
      150333,
      150346,
      150337
    }
  },
  [1503204] = {
    AnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/Combat/Skill/",
    AnimPlayRate = 1,
    AnimResource = "Kezhou_Skill02_ChangeWeapon_Dualblae_Montage",
    CanExtractZVelocity = true,
    DisableBlendBone = true,
    NextNodeId = 1503161,
    NodeId = 1503204,
    PhantomAutoInput = 1,
    SkillNodeEffects = {
      150334,
      150346,
      150338
    }
  },
  [2010111] = {
    AnimName = "Pistol01_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Pistol/",
    CostBullet = 1,
    DisableBlendBone = true,
    NextNodeId = 2010111,
    NodeId = 2010111,
    PhantomAutoInput = 1,
    SkillNodeEffects = {2010111, 2010116}
  },
  [2010121] = {
    AnimName = "Pistol01_Reload_Montage",
    AnimPlayRate = 1.5,
    AnimSubPath = "Combat/Weapon/Pistol/",
    DisableBlendBone = true,
    NodeId = 2010121,
    SkillNodeEffects = {2010121}
  },
  [2019911] = {
    AnimName = "Pistol01_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Pistol/",
    CostBullet = 1,
    DisableBlendBone = true,
    NextNodeId = 2019911,
    NodeId = 2019911,
    PhantomAutoInput = 1,
    SkillNodeEffects = {2019911}
  },
  [2019921] = {
    AnimName = "Pistol01_Reload_Montage",
    AnimPlayRate = 1.5,
    AnimSubPath = "Combat/Weapon/Pistol/",
    DisableBlendBone = true,
    NodeId = 2019921,
    SkillNodeEffects = {2019921}
  },
  [2020111] = {
    AnimName = "Crossbow01_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Crossbow/",
    CostBullet = 1,
    DisableBlendBone = true,
    EnableShootShakeBlend = true,
    NextNodeId = 2020111,
    NodeId = 2020111,
    PhantomAutoInput = 1,
    SkillNodeEffects = {2020111, 2020112}
  },
  [2020121] = {
    AnimName = "Crossbow01_Reload_Montage",
    AnimPlayRate = 1.5,
    AnimSubPath = "Combat/Weapon/Crossbow/",
    DisableBlendBone = true,
    NodeId = 2020121,
    SkillNodeEffects = {2020121}
  },
  [2020311] = {
    AnimName = "Crossbow01_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Crossbow/",
    CostBullet = 1,
    DisableBlendBone = true,
    EnableShootShakeBlend = true,
    NextNodeId = 2020311,
    NodeId = 2020311,
    PhantomAutoInput = 1,
    SkillNodeEffects = {2020311, 2020312}
  },
  [2020321] = {
    AnimName = "Crossbow01_Reload_Montage",
    AnimPlayRate = 1.5,
    AnimSubPath = "Combat/Weapon/Crossbow/",
    DisableBlendBone = true,
    NodeId = 2020321,
    SkillNodeEffects = {2020321}
  },
  [2020711] = {
    AnimName = "Crossbow01_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Crossbow/",
    CostBullet = 1,
    DisableBlendBone = true,
    EnableShootShakeBlend = true,
    NextNodeId = 2020711,
    NodeId = 2020711,
    PhantomAutoInput = 1,
    SkillNodeEffects = {2020711, 2020712}
  },
  [2020721] = {
    AnimName = "Crossbow01_Reload_Montage",
    AnimPlayRate = 1.5,
    AnimSubPath = "Combat/Weapon/Crossbow/",
    DisableBlendBone = true,
    NodeId = 2020721,
    SkillNodeEffects = {2020721}
  },
  [2030111] = {
    AnimName = "Cannon01_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Cannon/",
    CostBullet = 1,
    DisableBlendBone = true,
    NextNodeId = 2030111,
    NodeId = 2030111,
    PhantomAutoInput = 1,
    SkillNodeEffects = {2030111}
  },
  [2030121] = {
    AnimName = "Cannon01_Reload_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Cannon/",
    DisableBlendBone = true,
    NodeId = 2030121,
    SkillNodeEffects = {2030121}
  },
  [2030211] = {
    AnimName = "Cannon01_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Cannon/",
    CostBullet = 1,
    DisableBlendBone = true,
    NextNodeId = 2030211,
    NodeId = 2030211,
    PhantomAutoInput = 1,
    SkillNodeEffects = {2030211}
  },
  [2030221] = {
    AnimName = "Cannon02_Reload_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Cannon/",
    DisableBlendBone = true,
    NodeId = 2030221,
    SkillNodeEffects = {2030221}
  },
  [2030311] = {
    AnimName = "Cannon02_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Cannon/",
    CostBullet = 1,
    DisableBlendBone = true,
    NextNodeId = 2030311,
    NodeId = 2030311,
    PhantomAutoInput = 1,
    SkillNodeEffects = {
      2030311,
      2030321,
      2030322
    }
  },
  [2030321] = {
    AnimName = "Cannon02_Reload_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Cannon/",
    DisableBlendBone = true,
    NodeId = 2030321,
    SkillNodeEffects = {2030331}
  },
  [2030411] = {
    AnimName = "Cannon01_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Cannon/",
    CostBullet = 1,
    DisableBlendBone = true,
    NextNodeId = 2030411,
    NodeId = 2030411,
    PhantomAutoInput = 1,
    SkillNodeEffects = {2030411}
  },
  [2030421] = {
    AnimName = "Cannon02_Reload_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Cannon/",
    DisableBlendBone = true,
    NodeId = 2030421,
    SkillNodeEffects = T.RT_28
  },
  [2030511] = {
    AnimName = "Cannon03_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Cannon/",
    CostBullet = 1,
    DisableBlendBone = true,
    NextNodeId = 2030511,
    NodeId = 2030511,
    PhantomAutoInput = 1,
    PhantomPressTime = 20,
    SkillNodeEffects = {
      2030514,
      2030515,
      2030516,
      2030517,
      2030518,
      2030519
    }
  },
  [2030521] = {
    AnimName = "Cannon02_Reload_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Cannon/",
    DisableBlendBone = true,
    NodeId = 2030521,
    SkillNodeEffects = {2030521}
  },
  [2040111] = {
    AnimName = "Shotgun01_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Shotgun/",
    CostBullet = 1,
    DisableBlendBone = true,
    NextNodeId = 2040111,
    NodeId = 2040111,
    PhantomAutoInput = 1,
    SkillNodeEffects = {2040111}
  },
  [2040121] = {
    AnimName = "Shotgun01_Reload_Montage",
    AnimPlayRate = 1.5,
    AnimSubPath = "Combat/Weapon/Shotgun/",
    DisableBlendBone = true,
    NodeId = 2040121,
    SkillNodeEffects = {2040121}
  },
  [2040211] = {
    AnimName = "Shotgun02_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Shotgun/",
    CostBullet = 1,
    DisableBlendBone = true,
    NextNodeId = 2040211,
    NodeId = 2040211,
    PhantomAutoInput = 1,
    SkillNodeEffects = {2040211}
  },
  [2040221] = {
    AnimName = "Shotgun03_Reload_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Shotgun/",
    DisableBlendBone = true,
    NodeId = 2040221,
    SkillNodeEffects = {2040221}
  },
  [2040311] = {
    AnimName = "Shotgun02_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Shotgun/",
    CostBullet = 1,
    DisableBlendBone = true,
    NextNodeId = 2040311,
    NodeId = 2040311,
    PhantomAutoInput = 1,
    SkillNodeEffects = {2040311}
  },
  [2040321] = {
    AnimName = "Shotgun02_Reload_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Shotgun/",
    DisableBlendBone = true,
    NodeId = 2040321,
    SkillNodeEffects = {2040321}
  },
  [2040511] = {
    AnimName = "Shotgun01_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Shotgun/",
    CostBullet = 1,
    DisableBlendBone = true,
    NextNodeId = 2040511,
    NodeId = 2040511,
    PhantomAutoInput = 1,
    SkillNodeEffects = {2040511}
  },
  [2040512] = {
    AnimName = "Shotgun03_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Shotgun/",
    CostBullet = 1,
    DisableBlendBone = true,
    NextNodeId = 2040512,
    NodeId = 2040512,
    PhantomAutoInput = 1,
    PhantomPressTime = 1.5,
    SkillNodeEffects = {2040531, 2040532}
  },
  [2040521] = {
    AnimName = "Shotgun06_Reload_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Shotgun/",
    DisableBlendBone = true,
    NodeId = 2040521,
    SkillNodeEffects = {2040521}
  },
  [2040611] = {
    AnimName = "Shotgun02_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Shotgun/",
    CostBullet = 1,
    DisableBlendBone = true,
    NextNodeId = 2040611,
    NodeId = 2040611,
    PhantomAutoInput = 1,
    SkillNodeEffects = {2040611}
  },
  [2040621] = {
    AnimName = "Shotgun05_Reload_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Shotgun/",
    DisableBlendBone = true,
    NodeId = 2040621,
    SkillNodeEffects = T.RT_28
  },
  [2050111] = {
    AnimName = "Machinegun01_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Machinegun/",
    CostBullet = 1,
    DisableBlendBone = true,
    MontageBlendOutTime = 0,
    NextNodeId = 2050111,
    NodeId = 2050111,
    PhantomAutoInput = 1,
    SkillNodeEffects = {2050115, 2050116}
  },
  [2050121] = {
    AnimName = "Machinegun01_Reload_Montage",
    AnimPlayRate = 1.5,
    AnimSubPath = "Combat/Weapon/Machinegun/",
    DisableBlendBone = true,
    NodeId = 2050121,
    SkillNodeEffects = {2050121}
  },
  [2050211] = {
    AnimName = "Machinegun02_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Machinegun/",
    CostBullet = 1,
    DisableBlendBone = true,
    MontageBlendOutTime = 0,
    NextNodeId = 2050211,
    NodeId = 2050211,
    PhantomAutoInput = 1,
    PhantomPressTime = 5,
    SkillNodeEffects = {2050215, 2050216}
  },
  [2050221] = {
    AnimName = "Machinegun02_Reload_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Machinegun/",
    DisableBlendBone = true,
    NodeId = 2050221,
    SkillNodeEffects = {2050221}
  },
  [2050311] = {
    AnimName = "Machinegun02_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Machinegun/",
    CostBullet = 1,
    DisableBlendBone = true,
    MontageBlendOutTime = 0,
    NextNodeId = 2050311,
    NodeId = 2050311,
    PhantomAutoInput = 1,
    PhantomPressTime = 5,
    SkillNodeEffects = {2050315, 2050316}
  },
  [2050321] = {
    AnimName = "Machinegun03_Reload_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Machinegun/",
    DisableBlendBone = true,
    NodeId = 2050321,
    SkillNodeEffects = T.RT_29
  },
  [2050411] = {
    AnimName = "Machinegun04_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Machinegun/",
    CostBullet = 1,
    DisableBlendBone = true,
    NextNodeId = 2050411,
    NodeId = 2050411,
    PhantomAutoInput = 1,
    PhantomPressTime = 20,
    SkillNodeEffects = {
      2050414,
      2050415,
      2050416,
      2050417,
      2050418
    }
  },
  [2050421] = {
    AnimName = "Machinegun03_Reload_Montage",
    AnimPlayRate = 1.5,
    AnimSubPath = "Combat/Weapon/Machinegun/",
    DisableBlendBone = true,
    NodeId = 2050421,
    SkillNodeEffects = {2050421}
  },
  [2050511] = {
    AnimName = "Machinegun05_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Machinegun/",
    CostBullet = 1,
    DisableBlendBone = true,
    NextNodeId = 2050511,
    NodeId = 2050511,
    PhantomAutoInput = 1,
    SkillNodeEffects = {
      2050513,
      2050515,
      2050516
    }
  },
  [2050521] = {
    AnimName = "Machinegun02_Reload_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Machinegun/",
    DisableBlendBone = true,
    NodeId = 2050521,
    SkillNodeEffects = {2050521}
  },
  [2050611] = {
    AnimName = "Machinegun06_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Machinegun/",
    CostBullet = 1,
    DisableBlendBone = true,
    NextNodeId = 2050611,
    NodeId = 2050611,
    PhantomAutoInput = 1,
    SkillNodeEffects = {
      2050612,
      2050613,
      2050615
    }
  },
  [2050621] = {
    AnimName = "Machinegun03_Reload_Montage",
    AnimPlayRate = 1.5,
    AnimSubPath = "Combat/Weapon/Machinegun/",
    DisableBlendBone = true,
    NodeId = 2050621,
    SkillNodeEffects = {2050621}
  },
  [2050711] = {
    AnimName = "Machinegun01_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Machinegun/",
    CostBullet = 1,
    DisableBlendBone = true,
    NextNodeId = 2050711,
    NodeId = 2050711,
    PhantomAutoInput = 1,
    SkillNodeEffects = {2050715, 2050716}
  },
  [2050921] = {
    AnimName = "Machinegun04_Reload_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Machinegun/",
    DisableBlendBone = true,
    NodeId = 2050921,
    SkillNodeEffects = T.RT_29
  },
  [2051011] = {
    AnimName = "Machinegun01_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Machinegun/",
    CostBullet = 1,
    DisableBlendBone = true,
    NextNodeId = 2051011,
    NodeId = 2051011,
    PhantomAutoInput = 1,
    SkillNodeEffects = {2051015, 2051016}
  },
  [2060111] = {
    AnimName = "Bow02_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Bow/",
    CostBullet = 1,
    DisableBlendBone = true,
    MontageBlendOutTime = 0.3,
    NextNodeId = 2060111,
    NodeId = 2060111,
    PhantomAutoInput = 1,
    SkillNodeEffects = {2060111}
  },
  [2060121] = {
    AnimName = "Bow_HeavyShooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Bow/",
    CostBullet = 1,
    DisableBlendBone = true,
    NextNodeId = 2060121,
    NodeId = 2060121,
    PhantomAutoInput = 1,
    PhantomPressTime = 1.5,
    SkillNodeEffects = {2060141, 2060142}
  },
  [2060211] = {
    AnimName = "Bow01_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Bow/",
    CostBullet = 1,
    DisableBlendBone = true,
    MontageBlendOutTime = 0.01,
    NextNodeId = 2060211,
    NodeId = 2060211,
    PhantomAutoInput = 1,
    SkillNodeEffects = {
      25,
      2060211,
      2060212
    }
  },
  [2060311] = {
    AnimName = "Bow02_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Bow/",
    CostBullet = 1,
    DisableBlendBone = true,
    MontageBlendOutTime = 0.3,
    NextNodeId = 2060311,
    NodeId = 2060311,
    PhantomAutoInput = 1,
    SkillNodeEffects = {24, 2060311}
  },
  [2060321] = {
    AnimName = "Bow_HeavyShooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Bow/",
    CostBullet = 1,
    DisableBlendBone = true,
    NextNodeId = 2060321,
    NodeId = 2060321,
    PhantomAutoInput = 1,
    PhantomPressTime = 2,
    SkillNodeEffects = {
      24,
      25,
      2060312,
      2060313,
      2060314,
      2060321
    }
  },
  [2069911] = {
    AnimName = "Bow02_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Bow/",
    CostBullet = 1,
    DisableBlendBone = true,
    MontageBlendOutTime = 0.3,
    NextNodeId = 2069911,
    NodeId = 2069911,
    PhantomAutoInput = 1,
    SkillNodeEffects = {2069911}
  },
  [2069921] = {
    AnimName = "Bow_HeavyShooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Bow/",
    CostBullet = 1,
    DisableBlendBone = true,
    NextNodeId = 2069921,
    NodeId = 2069921,
    PhantomAutoInput = 1,
    PhantomPressTime = 1.5,
    SkillNodeEffects = {2069931, 2069932}
  },
  [4010100] = {
    AnimName = "Machinegun_Paotai_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Machinegun/",
    DisableBlendBone = true,
    NextNodeId = 4010100,
    NodeId = 4010100,
    PhantomAutoInput = 1,
    SkillNodeEffects = {401010001}
  },
  [4010200] = {
    AnimName = "Machinegun_Paotai_Shooting_Montage",
    AnimPlayRate = 1,
    AnimSubPath = "Combat/Weapon/Machinegun/",
    DisableBlendBone = true,
    NextNodeId = 4010200,
    NodeId = 4010200,
    PhantomAutoInput = 1,
    SkillNodeEffects = {401020010}
  }
})
