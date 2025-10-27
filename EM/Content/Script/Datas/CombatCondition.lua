local T = {}
T.RT_1 = {800203}
T.RT_2 = {Key = "Sword"}
T.RT_3 = {BuffId = 110302}
T.RT_4 = {BuffId = 110331}
T.RT_5 = {BuffId = 120101}
T.RT_6 = {BuffId = 15}
T.RT_7 = {BuffId = 150111}
T.RT_8 = {
  Int = 0,
  Key = "Skill01Count2"
}
T.RT_9 = {150206}
T.RT_10 = {
  Int = 0,
  Key = "Skill01Count1"
}
T.RT_11 = {150205}
T.RT_12 = {BuffId = 150221}
T.RT_13 = {
  CompareBase = 1000,
  CompareBaseInt = 1,
  Key = "Default",
  SummonId = 180101
}
T.RT_14 = {CompareBaseInt = 1, Int = 20405}
T.RT_15 = {901}
T.RT_16 = {CompareBaseInt = 0, CompareLogic = "Equal"}
T.RT_17 = {310124}
T.RT_18 = {BuffId = 310301}
T.RT_19 = {BuffId = 310303}
T.RT_20 = {Key = "ToExplode"}
T.RT_21 = {BuffId = 320111}
T.RT_22 = {BuffId = 320113}
T.RT_23 = {BuffId = 410101}
T.RT_24 = {
  Key = "SuperFallAttack"
}
T.RT_25 = {BuffId = 510106}
T.RT_26 = {BuffId = 530100}
T.RT_27 = {CompareBase = 0.15}
T.RT_28 = {BuffId = 106}
T.RT_29 = {SkillGrade = 1}
T.RT_30 = {SkillGrade = 2}
T.RT_31 = {SkillGrade = 4}
T.RT_32 = {SkillGrade = 6}
T.RT_33 = {PartId = 1}
T.RT_34 = {PartId = 2}
T.RT_35 = {PartId = 3}
T.RT_36 = {PartId = 4}
T.RT_37 = {HpPercent = 0.45}
T.RT_38 = {RelativeDis = 2000}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("CombatCondition", {
  [1] = {Id = 1},
  [2] = {FuncName = "Not_HpMax", Id = 2},
  [3] = {FuncName = "Not_SpMax", Id = 3},
  [4] = {
    FuncName = "Not_BulletMax",
    Id = 4
  },
  [5] = {
    ConditionVars = {
      BuffId = 50,
      CompareBaseInt = 4,
      CompareLogic = "Less"
    },
    FuncName = "Check_Buff_Layer",
    Id = 5
  },
  [6] = {
    FuncName = "Is_In_SkillFeature",
    Id = 6,
    Not = true
  },
  [8] = {FuncName = "Sp_Zero", Id = 8},
  [9] = {
    FuncName = "Is_In_SkillFeature",
    Id = 9
  },
  [11] = {
    FuncName = "Not_In_Battle",
    Id = 11
  },
  [15] = {
    ConditionVars = T.RT_6,
    FuncName = "Check_Buff",
    Id = 15
  },
  [16] = {
    ConditionVars = T.RT_6,
    FuncName = "Check_Buff",
    Id = 16,
    Not = true
  },
  [20] = {FuncName = "Is_In_Air", Id = 20},
  [21] = {
    FuncName = "Is_In_Air",
    Id = 21,
    Not = true
  },
  [22] = {
    FuncName = "Not_Attack_Hold",
    Id = 22
  },
  [23] = {
    ConditionVars = {Key = "Attack"},
    FuncName = "Press_Attack",
    Id = 23
  },
  [24] = {
    FuncName = "Magazine_Is_Full",
    Id = 24
  },
  [25] = {
    ConditionVars = T.RT_16,
    FuncName = "Check_No_Bullet",
    Id = 25
  },
  [26] = {
    FuncName = "Skill1_Hold",
    Id = 26,
    Not = true
  },
  [27] = {
    FuncName = "Skill2_Hold",
    Id = 27,
    Not = true
  },
  [28] = {
    FuncName = "Is_FallAttack_Landed",
    Id = 28
  },
  [29] = {
    FuncName = "Not_Shoot_Hold",
    Id = 29
  },
  [30] = {
    FuncName = "IsInteractive",
    Id = 30,
    Not = true
  },
  [31] = {
    FuncName = "Has_Movement_Input",
    Id = 31
  },
  [32] = {
    FuncName = "Not_Shoot_Hold",
    Id = 32,
    Not = true,
    Or = T.RT_15
  },
  [33] = {
    FuncName = "Has_Movement_Input",
    Id = 33,
    Not = true
  },
  [34] = {
    FuncName = "Is_In_BulletJump",
    Id = 34
  },
  [35] = {FuncName = "Is_Flying", Id = 35},
  [36] = {FuncName = "Is_Idle", Id = 36},
  [37] = {FuncName = "Is_Seating", Id = 37},
  [38] = {
    FuncName = "Bullet_Zero",
    Id = 38
  },
  [39] = {
    FuncName = "Press_AnyAttack",
    Id = 39,
    Or = T.RT_15
  },
  [40] = {
    FuncName = "Not_Attack_Hold",
    Id = 40,
    Not = true,
    Or = T.RT_15
  },
  [41] = {
    FuncName = "Magazine_Zero",
    Id = 41,
    Not = true
  },
  [42] = {
    FuncName = "Magazine_Zero",
    Id = 42
  },
  [43] = {
    FuncName = "Is_Shooting",
    Id = 43,
    Not = true
  },
  [44] = {
    ConditionVars = T.RT_16,
    FuncName = "Check_No_Bullet",
    Id = 44,
    Not = true
  },
  [52] = {
    FuncName = "Check_Mon_Region_EscapingFromBattle",
    Id = 52
  },
  [54] = {
    FuncName = "Check_Mon_Dungeon_EscapingFromBattle",
    Id = 54
  },
  [60] = {
    ConditionVars = {BuffId = 101},
    FuncName = "Check_Buff",
    Id = 60
  },
  [61] = {
    ConditionVars = {BuffId = 102},
    FuncName = "Check_Buff",
    Id = 61
  },
  [62] = {
    ConditionVars = {BuffId = 103},
    FuncName = "Check_Buff",
    Id = 62
  },
  [63] = {
    ConditionVars = {BuffId = 104},
    FuncName = "Check_Buff",
    Id = 63
  },
  [64] = {
    ConditionVars = {BuffId = 105},
    FuncName = "Check_Buff",
    Id = 64
  },
  [65] = {
    ConditionVars = T.RT_28,
    FuncName = "Check_Buff",
    Id = 65
  },
  [66] = {FuncName = "Is_In_Stun", Id = 66},
  [67] = {
    ConditionVars = {Int = 70},
    FuncName = "Can_Interactive_Paotai",
    Id = 67
  },
  [68] = {
    ConditionVars = {Int = 71},
    FuncName = "Check_Buff_Type",
    Id = 68,
    Not = true
  },
  [69] = {
    FuncName = "CheckInSquadDungeon",
    Id = 69,
    Not = true
  },
  [71] = {
    ConditionVars = T.RT_29,
    FuncName = "Check_Skill_Grade",
    Id = 71
  },
  [72] = {
    ConditionVars = T.RT_30,
    FuncName = "Check_Skill_Grade",
    Id = 72
  },
  [74] = {
    ConditionVars = T.RT_31,
    FuncName = "Check_Skill_Grade",
    Id = 74
  },
  [76] = {
    ConditionVars = T.RT_32,
    FuncName = "Check_Skill_Grade",
    Id = 76
  },
  [81] = {
    FuncName = "Is_PlayerCharacter",
    Id = 81
  },
  [82] = {
    FuncName = "Is_MonsterCharacter",
    Id = 82
  },
  [91] = {
    ConditionVars = T.RT_29,
    FuncName = "Check_Skill_Grade",
    Id = 91,
    Not = true
  },
  [92] = {
    ConditionVars = T.RT_30,
    FuncName = "Check_Skill_Grade",
    Id = 92,
    Not = true
  },
  [94] = {
    ConditionVars = T.RT_31,
    FuncName = "Check_Skill_Grade",
    Id = 94,
    Not = true
  },
  [96] = {
    ConditionVars = T.RT_32,
    FuncName = "Check_Skill_Grade",
    Id = 96,
    Not = true
  },
  [100] = {FuncName = "hit_target", Id = 100},
  [101] = {
    FuncName = "effect_hit_target",
    Id = 101
  },
  [102] = {
    FuncName = "Check_TriggerProb",
    Id = 102
  },
  [103] = {
    FuncName = "IsRecovering",
    Id = 103,
    Not = true
  },
  [200] = {
    FuncName = "Summoner_Skill1_Hold",
    Id = 200,
    Not = true
  },
  [210] = {
    ConditionVars = {CompareBaseInt = 0},
    FuncName = "SummonNumMore_Arbitray",
    Id = 210
  },
  [211] = {
    ConditionVars = {CompareBaseInt = 1},
    FuncName = "SummonNumMore_Arbitray",
    Id = 211
  },
  [212] = {
    ConditionVars = {CompareBaseInt = 2},
    FuncName = "SummonNumMore_Arbitray",
    Id = 212
  },
  [213] = {
    FuncName = "IsRealSummon",
    Id = 213
  },
  [300] = {
    FuncName = "Is_In_Rouge",
    Id = 300
  },
  [301] = {
    FuncName = "Is_In_Rouge",
    Id = 301,
    Not = true
  },
  [415] = {
    ConditionVars = {
      CompareBase = 0.25,
      CompareLogic = "Less",
      Key = "HpPercent"
    },
    FuncName = "Check_Attr_Self",
    Id = 415
  },
  [500] = {
    FuncName = "Can_Gesture",
    Id = 500
  },
  [501] = {
    FuncName = "Can_BattleProp",
    Id = 501
  },
  [502] = {
    FuncName = "IsQuestRole",
    Id = 502,
    Not = true
  },
  [900] = {
    ConditionVars = T.RT_38,
    FuncName = "Phantom_OwnerDis",
    Id = 900
  },
  [901] = {FuncName = "Is_Phantom", Id = 901},
  [902] = {
    ConditionVars = T.RT_38,
    FuncName = "Phantom_OwnerDis",
    Id = 902,
    Not = true
  },
  [903] = {
    ConditionVars = {RelativeDis = 750},
    FuncName = "Phantom_OwnerDis",
    Id = 903
  },
  [904] = {
    ConditionVars = {CompareBase = 30},
    FuncName = "Phantom_BulletJump",
    Id = 904
  },
  [905] = {
    ConditionVars = {CompareBaseInt = 4},
    FuncName = "Check_ComboLevel",
    Id = 905
  },
  [906] = {
    FuncName = "Is_Phantom",
    Id = 906,
    Not = true
  },
  [907] = {
    ConditionVars = {RelativeDis = 300},
    FuncName = "Phantom_OwnerDis",
    Id = 907
  },
  [908] = {
    And = {906},
    FuncName = "Not_Shoot_Hold",
    Id = 908
  },
  [911] = {
    FuncName = "Can_Phantom_Summon_Num",
    Id = 911
  },
  [912] = {
    FuncName = "Can_Phantom_Summon_Id",
    Id = 912
  },
  [913] = {
    FuncName = "Is_Phantom_Dispatching",
    Id = 913,
    Not = true
  },
  [921] = {
    ConditionVars = {CompareBase = 0.4},
    FuncName = "Is_TeamHp_Below",
    Id = 921
  },
  [922] = {
    ConditionVars = {CompareBase = 0.9},
    FuncName = "Is_TeamHp_Below",
    Id = 922
  },
  [1001] = {
    ConditionVars = {Key = "Dark"},
    FuncName = "Check_Attr_Element",
    Id = 1001
  },
  [1002] = {
    ConditionVars = {Key = "Water"},
    FuncName = "Check_Attr_Element",
    Id = 1002
  },
  [1003] = {
    ConditionVars = {Key = "Fire"},
    FuncName = "Check_Attr_Element",
    Id = 1003
  },
  [1004] = {
    ConditionVars = {Key = "Thunder"},
    FuncName = "Check_Attr_Element",
    Id = 1004
  },
  [1005] = {
    ConditionVars = {Key = "Wind"},
    FuncName = "Check_Attr_Element",
    Id = 1005
  },
  [1006] = {
    ConditionVars = {Key = "Light"},
    FuncName = "Check_Attr_Element",
    Id = 1006
  },
  [1007] = {
    ConditionVars = {Int = 2},
    FuncName = "Check_Team_Same_Element",
    Id = 1007
  },
  [1011] = {
    ConditionVars = T.RT_2,
    FuncName = "Check_Excel_Weapon",
    Id = 1011
  },
  [1012] = {
    ConditionVars = {Key = "Polearm"},
    FuncName = "Check_Excel_Weapon",
    Id = 1012
  },
  [1013] = {
    ConditionVars = {Key = "Claymore"},
    FuncName = "Check_Excel_Weapon",
    Id = 1013
  },
  [1014] = {
    ConditionVars = {Key = "Dualblade"},
    FuncName = "Check_Excel_Weapon",
    Id = 1014
  },
  [1015] = {
    ConditionVars = {Key = "Swordwhip"},
    FuncName = "Check_Excel_Weapon",
    Id = 1015
  },
  [1016] = {
    ConditionVars = {Key = "Katana"},
    FuncName = "Check_Excel_Weapon",
    Id = 1016
  },
  [1021] = {
    ConditionVars = {Key = "Pistol"},
    FuncName = "Check_Excel_Weapon",
    Id = 1021
  },
  [1022] = {
    ConditionVars = {Key = "Crossbow"},
    FuncName = "Check_Excel_Weapon",
    Id = 1022
  },
  [1023] = {
    ConditionVars = {Key = "Cannon"},
    FuncName = "Check_Excel_Weapon",
    Id = 1023
  },
  [1024] = {
    ConditionVars = {Key = "Shotgun"},
    FuncName = "Check_Excel_Weapon",
    Id = 1024
  },
  [1025] = {
    ConditionVars = {Key = "Machinegun"},
    FuncName = "Check_Excel_Weapon",
    Id = 1025
  },
  [1026] = {
    ConditionVars = {Key = "Bow"},
    FuncName = "Check_Excel_Weapon",
    Id = 1026
  },
  [1031] = {
    ConditionVars = T.RT_2,
    FuncName = "Check_Excel_Weapon",
    Id = 1031,
    Or = {1025}
  },
  [10001] = {
    FuncName = "Is_PlayerCharacter",
    Id = 10001
  },
  [10002] = {
    And = {10003},
    FuncName = "Is_MonsterCharacter",
    Id = 10002
  },
  [10003] = {
    ConditionVars = {MonsterId = 7011101},
    FuncName = "Check_Mon_UnitId",
    Id = 10003,
    Not = true
  },
  [110101] = {
    ConditionVars = {BuffId = 110101},
    FuncName = "Check_Buff",
    Id = 110101
  },
  [110102] = {
    FuncName = "Check_Heitao_SkillGrade6",
    Id = 110102
  },
  [110201] = {
    ConditionVars = {
      BuffId = 110232,
      CompareBaseInt = 6,
      CompareLogic = "Less"
    },
    FuncName = "Check_Buff_Layer",
    Id = 110201
  },
  [110211] = {
    ConditionVars = {
      BuffId = 110232,
      CompareBaseInt = 1,
      CompareLogic = "NotLess"
    },
    FuncName = "Check_Buff_Layer",
    Id = 110211
  },
  [110301] = {
    ConditionVars = T.RT_3,
    FuncName = "Check_Buff",
    Id = 110301
  },
  [110302] = {
    ConditionVars = {CompareBase = 0.8, CompareLogic = "NotLess"},
    FuncName = "Check_SecondSpRate",
    Id = 110302
  },
  [110311] = {
    ConditionVars = T.RT_3,
    FuncName = "Check_Buff",
    Id = 110311,
    Not = true
  },
  [110312] = {
    ConditionVars = T.RT_4,
    FuncName = "Check_Buff",
    Id = 110312,
    Not = true
  },
  [110313] = {
    ConditionVars = T.RT_4,
    FuncName = "Check_Buff",
    Id = 110313
  },
  [110401] = {
    ConditionVars = {
      Key = "Qiuxian_Skill01_Grade2"
    },
    FuncName = "Check_Key_Bool",
    Id = 110401
  },
  [110441] = {
    ConditionVars = {CompareBase = 0.3, CompareLogic = "Greater"},
    FuncName = "Check_Char_AO",
    Id = 110441
  },
  [110442] = {
    ConditionVars = {CompareBase = -0.3, CompareLogic = "Less"},
    FuncName = "Check_Char_AO",
    Id = 110442
  },
  [120101] = {
    ConditionVars = T.RT_5,
    FuncName = "Check_Buff",
    Id = 120101
  },
  [120102] = {
    ConditionVars = T.RT_5,
    FuncName = "Check_Buff",
    Id = 120102,
    Not = true
  },
  [120201] = {
    ConditionVars = {CompareBase = 0.251},
    FuncName = "Is_Hp_Above",
    Id = 120201
  },
  [150101] = {
    ConditionVars = {Key = "BaonuEnd"},
    FuncName = "Check_Key_Bool",
    Id = 150101,
    Or = {22}
  },
  [150102] = {
    ConditionVars = {Key = "BaonuInAir"},
    FuncName = "Check_Key_Bool",
    Id = 150102
  },
  [150103] = {
    ConditionVars = {BuffId = 150102},
    FuncName = "Check_Buff",
    Id = 150103
  },
  [150104] = {
    ConditionVars = T.RT_7,
    FuncName = "Check_Buff",
    Id = 150104
  },
  [150111] = {
    ConditionVars = {
      Key = "BaonuFinish"
    },
    FuncName = "Check_Key_Bool",
    Id = 150111
  },
  [150141] = {
    ConditionVars = T.RT_7,
    FuncName = "Check_Buff",
    Id = 150141,
    Not = true
  },
  [150201] = {
    ConditionVars = T.RT_8,
    FuncName = "Check_Key_Int",
    Id = 150201,
    Or = T.RT_9
  },
  [150202] = {
    ConditionVars = T.RT_10,
    FuncName = "Check_Key_Int",
    Id = 150202,
    Or = T.RT_9
  },
  [150203] = {
    And = T.RT_11,
    ConditionVars = T.RT_8,
    FuncName = "Check_Key_Int",
    Id = 150203,
    Not = true
  },
  [150204] = {
    And = T.RT_11,
    ConditionVars = T.RT_10,
    FuncName = "Check_Key_Int",
    Id = 150204,
    Not = true
  },
  [150205] = {
    ConditionVars = T.RT_12,
    FuncName = "Check_Buff",
    Id = 150205
  },
  [150206] = {
    ConditionVars = T.RT_12,
    FuncName = "Check_Buff",
    Id = 150206,
    Not = true
  },
  [150301] = {
    ConditionVars = {BuffId = 150305},
    FuncName = "Check_Buff",
    Id = 150301
  },
  [150302] = {
    ConditionVars = {BuffId = 150306},
    FuncName = "Check_Buff",
    Id = 150302
  },
  [150303] = {
    ConditionVars = {BuffId = 150325},
    FuncName = "Check_Buff",
    Id = 150303
  },
  [150403] = {
    ConditionVars = {BuffId = 150401},
    FuncName = "Check_Buff",
    Id = 150403
  },
  [150404] = {
    ConditionVars = {BuffId = 150407},
    FuncName = "Check_Buff",
    Id = 150404
  },
  [180101] = {
    ConditionVars = T.RT_13,
    FuncName = "SummonInRange",
    Id = 180101,
    Not = true
  },
  [180102] = {
    ConditionVars = T.RT_13,
    FuncName = "SummonInRange",
    Id = 180102
  },
  [180104] = {
    ConditionVars = T.RT_13,
    FuncName = "SummonInRange",
    Id = 180104
  },
  [180111] = {
    ConditionVars = {BuffId = 180102},
    FuncName = "Check_Buff",
    Id = 180111
  },
  [210101] = {
    ConditionVars = {
      CompareBase = 1000,
      Key = "SummonNum",
      SummonId = 210101
    },
    FuncName = "SummonInRange",
    Id = 210101
  },
  [210201] = {
    ConditionVars = {
      Int = 0,
      Key = "PassiveWaitingNum"
    },
    FuncName = "Check_Creater_Key_Int",
    Id = 210201,
    Not = true
  },
  [210202] = {
    ConditionVars = {BuffId = 210202},
    FuncName = "CheckCreaterBuff",
    Id = 210202
  },
  [230101] = {
    ConditionVars = {
      CompareBase = 1000,
      Key = "SummonNum",
      SummonId = 230101
    },
    FuncName = "SummonInRange",
    Id = 230101
  },
  [240101] = {
    ConditionVars = {
      CompareBase = 1000,
      Key = "SummonNum",
      SummonId = 240101
    },
    FuncName = "SummonInRange",
    Id = 240101
  },
  [240102] = {
    ConditionVars = {CompareBase = 0.6},
    FuncName = "Is_TeamHp_Below",
    Id = 240102
  },
  [310120] = {
    ConditionVars = {BuffId = 310120},
    FuncName = "Check_Buff",
    Id = 310120,
    Or = T.RT_17
  },
  [310121] = {
    ConditionVars = {
      BuffId = 310124,
      CompareBaseInt = 10,
      CompareLogic = "Less"
    },
    FuncName = "Check_Buff_Layer",
    Id = 310121
  },
  [310122] = {
    ConditionVars = {
      BuffId = 310124,
      CompareBaseInt = 10,
      CompareLogic = "NotLess"
    },
    FuncName = "Check_Buff_Layer",
    Id = 310122
  },
  [310123] = {
    ConditionVars = {
      BuffId = 310124,
      CompareBaseInt = 25,
      CompareLogic = "NotLess"
    },
    FuncName = "Check_Buff_Layer",
    Id = 310123
  },
  [310124] = {
    ConditionVars = {BuffId = 310121},
    FuncName = "Check_Buff",
    Id = 310124
  },
  [310201] = {
    ConditionVars = {
      CompareBase = 1000,
      CompareBaseInt = 6,
      Key = "Default",
      SummonId = 310202
    },
    FuncName = "SummonInRange",
    Id = 310201
  },
  [310202] = {
    FuncName = "Check_Xier_InSkill2",
    Id = 310202,
    Not = true
  },
  [310203] = {
    ConditionVars = {Height = 125},
    FuncName = "Is_HighEnough",
    Id = 310203
  },
  [310301] = {
    ConditionVars = T.RT_18,
    FuncName = "Check_Buff",
    Id = 310301
  },
  [310302] = {
    ConditionVars = T.RT_18,
    FuncName = "Check_Buff",
    Id = 310302,
    Not = true
  },
  [310303] = {
    ConditionVars = T.RT_19,
    FuncName = "Check_Yeer_Skill01A",
    Id = 310303
  },
  [310304] = {
    ConditionVars = T.RT_19,
    FuncName = "Check_Yeer_Skill01B",
    Id = 310304
  },
  [310305] = {
    ConditionVars = T.RT_20,
    FuncName = "Check_Key_Bool",
    Id = 310305
  },
  [310306] = {
    ConditionVars = T.RT_20,
    FuncName = "Check_Key_Bool",
    Id = 310306,
    Not = true
  },
  [320101] = {
    ConditionVars = {BuffId = 320111, CompareBase = 3},
    FuncName = "Check_Buff_LastTime",
    Id = 320101
  },
  [320111] = {
    ConditionVars = T.RT_21,
    FuncName = "Check_Buff",
    Id = 320111
  },
  [320112] = {
    ConditionVars = T.RT_21,
    FuncName = "Check_Buff",
    Id = 320112,
    Not = true
  },
  [320113] = {
    ConditionVars = T.RT_22,
    FuncName = "Check_Buff",
    Id = 320113
  },
  [320114] = {
    ConditionVars = T.RT_22,
    FuncName = "Check_Buff",
    Id = 320114,
    Not = true
  },
  [320201] = {
    ConditionVars = {BuffId = 320202},
    FuncName = "Check_Buff",
    Id = 320201
  },
  [330101] = {
    FuncName = "Check_Maer_Skill01_Grade2",
    Id = 330101
  },
  [330102] = {
    FuncName = "Check_Maer_PassiveBuff",
    Id = 330102
  },
  [330103] = {
    ConditionVars = {
      BuffId = 330101,
      CompareBaseInt = 5,
      CompareLogic = "NotLess"
    },
    FuncName = "Check_Buff_Layer",
    Id = 330103
  },
  [330104] = {
    FuncName = "Check_Maer_Skill01_Target",
    Id = 330104
  },
  [330111] = {
    ConditionVars = {
      Key = "Maer_Skill02_Level1"
    },
    FuncName = "Check_Key_Bool",
    Id = 330111
  },
  [330112] = {
    ConditionVars = {
      Key = "Maer_Skill02_Level2"
    },
    FuncName = "Check_Key_Bool",
    Id = 330112
  },
  [330113] = {
    ConditionVars = {
      Key = "Maer_Skill02_Level3"
    },
    FuncName = "Check_Key_Bool",
    Id = 330113
  },
  [410101] = {
    ConditionVars = {BuffId = 410111},
    FuncName = "Check_Buff",
    Id = 410101,
    Or = T.RT_17
  },
  [410102] = {
    FuncName = "Is_OnGround",
    Id = 410102
  },
  [410103] = {
    ConditionVars = T.RT_23,
    FuncName = "Check_Buff",
    Id = 410103
  },
  [410104] = {
    ConditionVars = T.RT_23,
    FuncName = "Check_Buff",
    Id = 410104,
    Not = true
  },
  [420101] = {
    ConditionVars = {BuffId = 420111},
    FuncName = "Check_Buff",
    Id = 420101,
    Not = true
  },
  [420102] = {
    ConditionVars = {BuffId = 420121},
    FuncName = "Check_Buff",
    Id = 420102
  },
  [420103] = {
    ConditionVars = T.RT_24,
    FuncName = "Check_Key_Bool",
    Id = 420103
  },
  [420104] = {
    ConditionVars = T.RT_24,
    FuncName = "Check_Key_Bool",
    Id = 420104,
    Not = true
  },
  [420201] = {
    And = {902},
    ConditionVars = {
      CompareBaseInt = 5,
      TargetFilter = "Char_Cylinder_Large180"
    },
    FuncName = "Check_Ranged_Mon_Num",
    Id = 420201
  },
  [420202] = {
    ConditionVars = {
      CompareBase = 0,
      CompareLogic = "NotGreater",
      Key = "ES"
    },
    FuncName = "Check_Attr_Self",
    Id = 420202
  },
  [420221] = {
    ConditionVars = {
      CompareBaseInt = 3,
      RelativeDis = 2000,
      SummonId = 420202
    },
    FuncName = "Check_SkillCreature",
    Id = 420221,
    Not = true
  },
  [430101] = {
    ConditionVars = {CompareBaseInt = 15, CompareLogic = "NotLess"},
    FuncName = "Check_SecondSP",
    Id = 430101
  },
  [430102] = {
    ConditionVars = {CompareBaseInt = 15, CompareLogic = "Less"},
    FuncName = "Check_SecondSP",
    Id = 430102
  },
  [430103] = {
    ConditionVars = {CompareBaseInt = 60, CompareLogic = "NotLess"},
    FuncName = "Check_SecondSP",
    Id = 430103
  },
  [430104] = {
    ConditionVars = {CompareBaseInt = 60, CompareLogic = "Less"},
    FuncName = "Check_SecondSP",
    Id = 430104
  },
  [430105] = {
    ConditionVars = {
      Key = "Xibi_Grade4_Bool"
    },
    FuncName = "Check_Key_Bool",
    Id = 430105
  },
  [430121] = {
    ConditionVars = {
      CompareBase = 1000,
      CompareBaseInt = 1,
      Key = "Default",
      SummonId = 430101
    },
    FuncName = "SummonInRange",
    Id = 430121
  },
  [510101] = {
    ConditionVars = T.RT_25,
    FuncName = "Check_Buff",
    Id = 510101
  },
  [510102] = {
    ConditionVars = T.RT_25,
    FuncName = "Summoner_Check_Buff",
    Id = 510102
  },
  [510103] = {
    ConditionVars = {BuffId = 510121},
    FuncName = "Check_Buff",
    Id = 510103
  },
  [510104] = {
    FuncName = "Check_Songlu_CanDash",
    Id = 510104
  },
  [530102] = {
    ConditionVars = T.RT_26,
    FuncName = "Check_Buff",
    Id = 530102,
    Or = {530123}
  },
  [530121] = {
    ConditionVars = T.RT_27,
    FuncName = "Is_Hp_Above",
    Id = 530121
  },
  [530122] = {
    ConditionVars = T.RT_27,
    FuncName = "Is_Hp_Above",
    Id = 530122,
    Not = true
  },
  [530123] = {
    And = {530122},
    ConditionVars = T.RT_26,
    FuncName = "Check_Buff",
    Id = 530123
  },
  [540201] = {
    ConditionVars = {BuffId = 540201},
    FuncName = "Check_Buff",
    Id = 540201
  },
  [540202] = {
    And = {540201},
    ConditionVars = {BuffId = 540202},
    FuncName = "Check_Buff",
    Id = 540202
  },
  [540203] = {
    And = {540202},
    ConditionVars = {BuffId = 540203},
    FuncName = "Check_Buff",
    Id = 540203
  },
  [540205] = {
    ConditionVars = {BuffId = 540205},
    FuncName = "Check_Buff",
    Id = 540205,
    Not = true,
    Or = {540206}
  },
  [540206] = {
    ConditionVars = {
      BuffId = 540206,
      CompareBaseInt = 20,
      CompareLogic = "NotLess"
    },
    FuncName = "Check_Buff_Layer",
    Id = 540206
  },
  [600401] = {
    ConditionVars = {HalfHeight = 70, Radius = 150},
    FuncName = "IsAnySceneAroundBTTarget",
    Id = 600401,
    Not = true
  },
  [600501] = {
    ConditionVars = {BuffId = 600502},
    FuncName = "Check_Buff",
    Id = 600501
  },
  [600502] = {
    ConditionVars = T.RT_28,
    FuncName = "Check_Buff",
    Id = 600502,
    Or = {
      60,
      61,
      62,
      63,
      64
    }
  },
  [700101] = {
    And = {700102},
    ConditionVars = {MonsterId = 7016001},
    FuncName = "Check_Mon_UnitId",
    Id = 700101
  },
  [700102] = {
    ConditionVars = {KeyName = "Rider"},
    FuncName = "Check_Mon_BBValue_ObjectIsNull",
    Id = 700102
  },
  [700301] = {
    ConditionVars = {Radius = 1000},
    FuncName = "Check_Mon_EX02_EscapingFromBattle",
    Id = 700301
  },
  [700801] = {
    And = T.RT_1,
    ConditionVars = {MonsterId = 7015061},
    FuncName = "Check_Mon_UnitId",
    Id = 700801
  },
  [701501] = {
    ConditionVars = {KeyName = "CorpPhase"},
    FuncName = "Check_Mon_BBValue_Int",
    Id = 701501
  },
  [800201] = {
    And = T.RT_1,
    ConditionVars = {MonsterId = 8002061},
    FuncName = "Check_Mon_UnitId",
    Id = 800201
  },
  [800202] = {
    And = T.RT_1,
    ConditionVars = {MonsterId = 8002062},
    FuncName = "Check_Mon_UnitId",
    Id = 800202
  },
  [800203] = {
    And = {800204},
    FuncName = "Check_Mon_IsActive",
    Id = 800203
  },
  [800204] = {
    FuncName = "Check_Mon_IsInBattle",
    Id = 800204
  },
  [850000] = {
    FuncName = "IsStoryBoss",
    Id = 850000
  },
  [850001] = {
    ConditionVars = {TNValue = 0},
    FuncName = "Check_CurrentTN",
    Id = 850001
  },
  [850002] = {
    ConditionVars = {HpPercent = 0.85},
    FuncName = "Check_Mon_HpPercentUnder",
    Id = 850002
  },
  [850003] = {
    ConditionVars = {HpPercent = 0.5},
    FuncName = "Check_Mon_HpPercentUnder",
    Id = 850003
  },
  [850004] = {
    ConditionVars = {HpPercent = 0.15},
    FuncName = "Check_Mon_HpPercentUnder",
    Id = 850004
  },
  [850011] = {
    ConditionVars = {RelativeDis = 600},
    FuncName = "Check_BTTargetLoc",
    Id = 850011,
    Or = {850012}
  },
  [850012] = {
    ConditionVars = {RelativeAngle = 120},
    FuncName = "Check_BTTargetAngle",
    Id = 850012
  },
  [850071] = {
    ConditionVars = {EffectId = 850071},
    FuncName = "Check_EffectTargetValid",
    Id = 850071
  },
  [850072] = {
    ConditionVars = {EffectId = 8500171},
    FuncName = "Check_EffectTargetValid",
    Id = 850072
  },
  [850081] = {
    ConditionVars = {RelativeDis = 1000},
    FuncName = "Check_BTTargetLoc",
    Id = 850081
  },
  [850201] = {
    ConditionVars = T.RT_33,
    FuncName = "PartIsBroken",
    Id = 850201,
    Not = true
  },
  [850202] = {
    ConditionVars = T.RT_34,
    FuncName = "PartIsBroken",
    Id = 850202,
    Not = true
  },
  [850203] = {
    ConditionVars = T.RT_35,
    FuncName = "PartIsBroken",
    Id = 850203,
    Not = true
  },
  [850204] = {
    ConditionVars = T.RT_36,
    FuncName = "PartIsBroken",
    Id = 850204,
    Not = true
  },
  [850205] = {
    ConditionVars = T.RT_33,
    FuncName = "BrokenPart",
    Id = 850205
  },
  [850206] = {
    ConditionVars = T.RT_34,
    FuncName = "BrokenPart",
    Id = 850206
  },
  [850207] = {
    ConditionVars = T.RT_35,
    FuncName = "BrokenPart",
    Id = 850207
  },
  [850208] = {
    ConditionVars = T.RT_36,
    FuncName = "BrokenPart",
    Id = 850208
  },
  [850209] = {
    ConditionVars = {UnitId = 8502001},
    FuncName = "Is_UnitId_Match",
    Id = 850209
  },
  [850210] = {
    ConditionVars = {
      BuffId = 850210,
      CompareBaseInt = 2,
      CompareLogic = "Equal"
    },
    FuncName = "Check_Buff_Layer",
    Id = 850210
  },
  [850211] = {
    ConditionVars = {
      BuffId = 850210,
      CompareBaseInt = 3,
      CompareLogic = "Equal"
    },
    FuncName = "Check_Buff_Layer",
    Id = 850211
  },
  [850212] = {
    ConditionVars = {
      BuffId = 850210,
      CompareBaseInt = 4,
      CompareLogic = "Equal"
    },
    FuncName = "Check_Buff_Layer",
    Id = 850212
  },
  [850301] = {
    ConditionVars = T.RT_33,
    FuncName = "BrokenPart",
    Id = 850301
  },
  [850302] = {
    ConditionVars = T.RT_34,
    FuncName = "BrokenPart",
    Id = 850302
  },
  [850303] = {
    ConditionVars = T.RT_35,
    FuncName = "BrokenPart",
    Id = 850303
  },
  [850304] = {
    ConditionVars = T.RT_36,
    FuncName = "BrokenPart",
    Id = 850304
  },
  [850305] = {
    ConditionVars = {EffectId = 8503182},
    FuncName = "Check_EffectTargetValid",
    Id = 850305
  },
  [850306] = {
    FuncName = "Is_In_LieDown",
    Id = 850306,
    Not = true
  },
  [850501] = {
    ConditionVars = {BuffId = 207},
    FuncName = "Check_BTTarget_Buff",
    Id = 850501
  },
  [850502] = {
    ConditionVars = {
      CompareBaseInt = 1,
      TargetFilter = "BossLianhuo_Skill02_Cylinder"
    },
    FuncName = "Check_Ranged_Mon_Num",
    Id = 850502
  },
  [850901] = {
    And = {850902},
    ConditionVars = {RelativeDis = 1200},
    FuncName = "Check_BTTargetLoc",
    Id = 850901,
    Not = true
  },
  [850902] = {
    ConditionVars = {RelativeAngle = 180},
    FuncName = "Check_BTTargetAngle",
    Id = 850902,
    Not = true
  },
  [850903] = {
    ConditionVars = {HpPercent = 0.9},
    FuncName = "Check_Mon_HpPercentUnder",
    Id = 850903
  },
  [850904] = {
    ConditionVars = T.RT_37,
    FuncName = "Check_Mon_HpPercentUnder",
    Id = 850904
  },
  [850905] = {
    ConditionVars = {HpPercent = 0.25},
    FuncName = "Check_Mon_HpPercentUnder",
    Id = 850905
  },
  [850906] = {
    ConditionVars = {
      KeyName = "Skill01Hit3"
    },
    FuncName = "Check_Mon_BBValue",
    Id = 850906
  },
  [850907] = {
    ConditionVars = {
      KeyName = "Skill03Left"
    },
    FuncName = "Check_Mon_BBValue",
    Id = 850907
  },
  [850908] = {
    ConditionVars = {
      KeyName = "Skill03Right"
    },
    FuncName = "Check_Mon_BBValue",
    Id = 850908
  },
  [850909] = {
    ConditionVars = {
      KeyName = "Skill03Front"
    },
    FuncName = "Check_Mon_BBValue",
    Id = 850909
  },
  [850910] = {
    FuncName = "BossTuosi_CanUseSkill04",
    Id = 850910,
    Not = true
  },
  [851401] = {
    ConditionVars = {MonsterId = 8514051},
    FuncName = "Check_Mon_UnitId",
    Id = 851401,
    Not = true
  },
  [851601] = {
    ConditionVars = {HpPercent = 0.67},
    FuncName = "Check_Mon_HpPercentUnder",
    Id = 851601
  },
  [851602] = {
    ConditionVars = {HpPercent = 0.33},
    FuncName = "Check_Mon_HpPercentUnder",
    Id = 851602
  },
  [851701] = {
    ConditionVars = {
      KeyName = "PartIsAlive"
    },
    FuncName = "Check_Mon_BBValue",
    Id = 851701
  },
  [852001] = {
    ConditionVars = {HpPercent = 0.8},
    FuncName = "Check_Mon_HpPercentUnder",
    Id = 852001
  },
  [852002] = {
    ConditionVars = T.RT_37,
    FuncName = "Check_Mon_HpPercentUnder",
    Id = 852002
  },
  [852003] = {
    FuncName = "BossAida_InP1orP2",
    Id = 852003
  },
  [852004] = {
    FuncName = "BossAida_InP3orP4orP5",
    Id = 852004
  },
  [859901] = {
    ConditionVars = {
      CompareBase = 30,
      CompareLogic = "NotGreater",
      Key = "Level"
    },
    FuncName = "Check_Attr_Self",
    Id = 859901
  },
  [859902] = {
    ConditionVars = {
      CompareBase = 40,
      CompareLogic = "NotGreater",
      Key = "Level"
    },
    FuncName = "Check_Attr_Self",
    Id = 859902
  },
  [859903] = {
    ConditionVars = {
      CompareBase = 50,
      CompareLogic = "NotGreater",
      Key = "Level"
    },
    FuncName = "Check_Attr_Self",
    Id = 859903
  },
  [859904] = {
    ConditionVars = {
      CompareBase = 60,
      CompareLogic = "NotGreater",
      Key = "Level"
    },
    FuncName = "Check_Attr_Self",
    Id = 859904
  },
  [950001] = {
    ConditionVars = {MonsterId = 9500001},
    FuncName = "Check_Mon_UnitId",
    Id = 950001,
    Or = {950051}
  },
  [950011] = {
    ConditionVars = {MonsterId = 9500101},
    FuncName = "Check_Mon_UnitId",
    Id = 950011
  },
  [950051] = {
    ConditionVars = {MonsterId = 9500051},
    FuncName = "Check_Mon_UnitId",
    Id = 950051,
    Or = {950052}
  },
  [950052] = {
    ConditionVars = {MonsterId = 9500052},
    FuncName = "Check_Mon_UnitId",
    Id = 950052
  },
  [950053] = {
    ConditionVars = {MonsterId = 9500053},
    FuncName = "Check_Mon_UnitId",
    Id = 950053
  },
  [950054] = {
    ConditionVars = {MonsterId = 9500054},
    FuncName = "Check_Mon_UnitId",
    Id = 950054
  },
  [950101] = {
    ConditionVars = {MonsterId = 9501001},
    FuncName = "Check_Mon_UnitId",
    Id = 950101,
    Or = {950102}
  },
  [950102] = {
    ConditionVars = {MonsterId = 9501002},
    FuncName = "Check_Mon_UnitId",
    Id = 950102
  },
  [980101] = {
    ConditionVars = {Int = 3, KeyName = "VehPhase"},
    FuncName = "Check_Mon_BBValue_Int",
    Id = 980101,
    Not = true
  },
  [980501] = {
    ConditionVars = {BuffId = 980501},
    FuncName = "Check_Buff",
    Id = 980501
  },
  [1000101] = {
    And = T.RT_1,
    ConditionVars = {MonsterId = 10001061},
    FuncName = "Check_Mon_UnitId",
    Id = 1000101
  },
  [1000102] = {
    And = T.RT_1,
    ConditionVars = {MonsterId = 10001062},
    FuncName = "Check_Mon_UnitId",
    Id = 1000102
  },
  [1000301] = {
    And = T.RT_1,
    ConditionVars = {CorpType = "BiAn02"},
    FuncName = "Check_Mon_CorpType",
    Id = 1000301
  },
  [1000401] = {
    And = T.RT_1,
    ConditionVars = {CorpType = "BiAn01"},
    FuncName = "Check_Mon_CorpType",
    Id = 1000401
  },
  [1000501] = {
    And = T.RT_1,
    ConditionVars = {MonsterId = 10005061},
    FuncName = "Check_Mon_UnitId",
    Id = 1000501
  },
  [1000502] = {
    And = T.RT_1,
    ConditionVars = {MonsterId = 10005062},
    FuncName = "Check_Mon_UnitId",
    Id = 1000502
  },
  [1030101] = {
    ConditionVars = {
      Key = "Claymore_Heavyattack_Mod01_Grab"
    },
    FuncName = "Check_Key_Bool",
    Id = 1030101,
    Not = true,
    Or = {1030102}
  },
  [1030102] = {
    ConditionVars = {
      Key = "Claymore_Heavyattack_Mod01_Grab_Cilent"
    },
    FuncName = "Check_Key_Bool",
    Id = 1030102,
    Not = true
  },
  [1060101] = {
    ConditionVars = {EffectId = 1060251},
    FuncName = "Check_EffectTargetValid",
    Id = 1060101
  },
  [1060102] = {
    ConditionVars = {BuffId = 1060202},
    FuncName = "Check_Buff",
    Id = 1060102
  },
  [2010211] = {
    ConditionVars = {Int = 100},
    FuncName = "Check_Buff_Type",
    Id = 2010211,
    Not = true
  },
  [2030501] = {
    ConditionVars = {CompareBaseInt = 1, Int = 20305},
    FuncName = "Check_HeavyCharge_Grade",
    Id = 2030501
  },
  [2030502] = {
    ConditionVars = {CompareBaseInt = 2, Int = 20305},
    FuncName = "Check_HeavyCharge_Grade",
    Id = 2030502
  },
  [2030503] = {
    ConditionVars = {CompareBaseInt = 3, Int = 20305},
    FuncName = "Check_HeavyCharge_Grade",
    Id = 2030503
  },
  [2040201] = {
    ConditionVars = {
      CompareBase = 1,
      Key = "Weapon20402_Scale"
    },
    FuncName = "Check_Key_Float",
    Id = 2040201,
    Or = {
      2040204,
      2040203,
      2040202
    }
  },
  [2040202] = {
    ConditionVars = {
      CompareBase = 1.5,
      Key = "Weapon20402_Scale"
    },
    FuncName = "Check_Key_Float",
    Id = 2040202,
    Or = {2040204, 2040203}
  },
  [2040203] = {
    ConditionVars = {
      CompareBase = 2,
      Key = "Weapon20402_Scale"
    },
    FuncName = "Check_Key_Float",
    Id = 2040203,
    Or = {2040204}
  },
  [2040204] = {
    ConditionVars = {
      CompareBase = 2.5,
      Key = "Weapon20402_Scale"
    },
    FuncName = "Check_Key_Float",
    Id = 2040204
  },
  [2040501] = {
    ConditionVars = T.RT_14,
    FuncName = "Check_HeavyCharge_Grade",
    Id = 2040501
  },
  [2040502] = {
    ConditionVars = T.RT_14,
    FuncName = "Check_HeavyCharge_Grade",
    Id = 2040502,
    Not = true
  },
  [2050401] = {
    ConditionVars = {CompareBaseInt = 1, Int = 20504},
    FuncName = "Check_HeavyCharge_Grade",
    Id = 2050401
  },
  [2050402] = {
    ConditionVars = {CompareBaseInt = 2, Int = 20504},
    FuncName = "Check_HeavyCharge_Grade",
    Id = 2050402
  },
  [2050501] = {
    ConditionVars = {
      BuffId = 2050501,
      CompareBaseInt = 10,
      CompareLogic = "NotLess"
    },
    FuncName = "Check_Buff_Layer",
    Id = 2050501
  },
  [2050601] = {
    ConditionVars = {CompareBaseInt = 1, Int = 20506},
    FuncName = "Check_HeavyCharge_Grade",
    Id = 2050601
  },
  [2060100] = {
    ConditionVars = {CompareBaseInt = 0, Int = 20601},
    FuncName = "Check_HeavyCharge_Grade",
    Id = 2060100
  },
  [2060101] = {
    ConditionVars = {CompareBaseInt = 1, Int = 20601},
    FuncName = "Check_HeavyCharge_Grade",
    Id = 2060101
  },
  [2060102] = {
    ConditionVars = {CompareBaseInt = 2, Int = 20601},
    FuncName = "Check_HeavyCharge_Grade",
    Id = 2060102
  },
  [2060103] = {
    ConditionVars = {CompareBaseInt = 3, Int = 20601},
    FuncName = "Check_HeavyCharge_Grade",
    Id = 2060103
  },
  [2060111] = {
    And = T.RT_15,
    FuncName = "Not_PerfectHeavyShooting",
    Id = 2060111
  },
  [2060301] = {
    FuncName = "CustomizedTargets_IsValid",
    Id = 2060301
  },
  [3040001] = {
    ConditionVars = {HpPercent = 0.95},
    FuncName = "Check_Mon_HpPercentUnder",
    Id = 3040001
  },
  [3040002] = {
    ConditionVars = {HpPercent = 0.63},
    FuncName = "Check_Mon_HpPercentUnder",
    Id = 3040002
  },
  [3040003] = {
    ConditionVars = {HpPercent = 0.31},
    FuncName = "Check_Mon_HpPercentUnder",
    Id = 3040003
  },
  [3040004] = {
    ConditionVars = {Int = 30401},
    FuncName = "Check_Buff_Type",
    Id = 3040004
  },
  [3040005] = {
    ConditionVars = {Int = 30402},
    FuncName = "Check_Buff_Type",
    Id = 3040005
  },
  [3040006] = {
    ConditionVars = {Int = 30407},
    FuncName = "Check_Buff_Type",
    Id = 3040006
  },
  [3040007] = {
    ConditionVars = {HpPercent = 0.21},
    FuncName = "Check_Mon_HpPercentUnder",
    Id = 3040007
  },
  [3040008] = {
    ConditionVars = {MonsterId = 309},
    FuncName = "Check_Mon_UnitId",
    Id = 3040008
  },
  [10104101] = {
    ConditionVars = {CompareBaseInt = 0, SummonId = 9901113},
    FuncName = "SummonNumMore",
    Id = 10104101,
    Not = true
  }
})
