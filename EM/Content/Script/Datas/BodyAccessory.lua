local T = {}
T.RT_1 = {
  "front",
  "left",
  "right"
}
T.RT_2 = {
  0.6,
  0.2,
  0.2
}
T.RT_3 = {}
T.RT_4 = {
  [700001] = T.RT_3
}
T.RT_5 = {
  1,
  30,
  330
}
T.RT_6 = {
  Death = 200,
  Hit = 1000,
  Normal = 500
}
T.RT_7 = {
  "left",
  "front",
  "back"
}
T.RT_8 = {
  [700003] = T.RT_3
}
T.RT_9 = {
  90,
  120,
  60
}
T.RT_10 = {
  "right",
  "front",
  "back"
}
T.RT_11 = {
  [700004] = T.RT_3
}
T.RT_12 = {
  270,
  240,
  310
}
T.RT_13 = {
  SocketA = "Root",
  SocketB = "hook_part_back"
}
T.RT_14 = {
  "back",
  "left",
  "right"
}
T.RT_15 = {
  [700002] = T.RT_3
}
T.RT_16 = {
  180,
  150,
  210
}
T.RT_17 = {SocketA = "Root", SocketB = "xiongjia_b"}
T.RT_18 = {
  [700008] = T.RT_3
}
T.RT_19 = {SocketA = "Root", SocketB = "hook_arm_r"}
T.RT_20 = {SocketA = "Root", SocketB = "hook_arm_l"}
T.RT_21 = {SocketA = "Root", SocketB = "Root"}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("BodyAccessory", {
  [700001] = {
    AccessoryId = 700001,
    AttachRule = {
      SocketA = "Root",
      SocketB = "hook_part_front"
    },
    DamageDirect = T.RT_1,
    DelayDestroyTime = 3,
    DropProb = T.RT_2,
    HitEffect = T.RT_4,
    LandEffectId = 700011,
    ModelPath = "/Game/Asset/Char/Monster/Common/Part/Mesh/JT_Part02F_SM.JT_Part02F_SM",
    MoveDirect = T.RT_5,
    Speed = T.RT_6
  },
  [700002] = {
    AccessoryId = 700002,
    AttachRule = {
      SocketA = "Root",
      SocketB = "hook_part_left"
    },
    DamageDirect = T.RT_7,
    DelayDestroyTime = 3,
    DropProb = T.RT_2,
    HitEffect = T.RT_8,
    LandEffectId = 700011,
    ModelPath = "/Game/Asset/Char/Monster/Common/Part/Mesh/JT_Part01L_SM.JT_Part01L_SM",
    MoveDirect = T.RT_9,
    Speed = T.RT_6
  },
  [700003] = {
    AccessoryId = 700003,
    AttachRule = {
      SocketA = "Root",
      SocketB = "hook_part_right"
    },
    DamageDirect = T.RT_10,
    DelayDestroyTime = 3,
    DropProb = T.RT_2,
    HitEffect = T.RT_11,
    LandEffectId = 700011,
    ModelPath = "/Game/Asset/Char/Monster/Common/Part/Mesh/JT_Part01R_SM.JT_Part01R_SM",
    MoveDirect = T.RT_12,
    Speed = T.RT_6
  },
  [700004] = {
    AccessoryId = 700004,
    AttachRule = T.RT_13,
    DamageDirect = T.RT_14,
    DelayDestroyTime = 3,
    DropProb = T.RT_2,
    HitEffect = T.RT_15,
    LandEffectId = 700011,
    ModelPath = "/Game/Asset/Char/Monster/JT_Ranger/Mesh/JT_Ranger_Part02_SM.JT_Ranger_Part02_SM",
    MoveDirect = T.RT_16,
    PreAccessories = {700005},
    Speed = T.RT_6
  },
  [700005] = {
    AccessoryId = 700005,
    AttachRule = T.RT_13,
    DamageDirect = T.RT_14,
    DelayDestroyTime = 3,
    DropProb = T.RT_2,
    HitEffect = T.RT_15,
    LandEffectId = 700011,
    ModelPath = "/Game/Asset/Char/Monster/Common/Part/Mesh/JT_Part03A_SM.JT_Part03A_SM",
    MoveDirect = T.RT_16,
    Speed = T.RT_6
  },
  [700006] = {
    AccessoryId = 700006,
    AttachRule = {
      SocketA = "Root",
      SocketB = "hook_part_up01"
    },
    DamageDirect = {
      "front",
      "left",
      "right",
      "back"
    },
    DelayDestroyTime = 3,
    DropProb = {
      0.3,
      0.3,
      0.3,
      0.3
    },
    HitEffect = {
      [700006] = T.RT_3
    },
    LandEffectId = 700011,
    ModelPath = "/Game/Asset/Char/Monster/Jt_Ranger/Mesh/JT_Ranger_Part01_SM.JT_Ranger_Part01_SM",
    MoveDirect = {
      180,
      270,
      90,
      1
    },
    Speed = T.RT_6
  },
  [700007] = {
    AccessoryId = 700007,
    AttachRule = {SocketA = "Root", SocketB = "xiongjia_f"},
    DamageDirect = T.RT_1,
    DelayDestroyTime = 3,
    DropProb = T.RT_2,
    HitEffect = {
      [700007] = T.RT_3
    },
    LandEffectId = 700011,
    ModelPath = "/Game/Asset/Char/Monster/Common/Part/Mesh/JT_Part02F_SM.JT_Part02F_SM",
    MoveDirect = T.RT_5,
    Speed = T.RT_6
  },
  [700008] = {
    AccessoryId = 700008,
    AttachRule = {SocketA = "Root", SocketB = "jianjia_l"},
    DamageDirect = T.RT_7,
    DelayDestroyTime = 3,
    DropProb = T.RT_2,
    HitEffect = {
      [700009] = T.RT_3
    },
    LandEffectId = 700011,
    ModelPath = "/Game/Asset/Char/Monster/Common/Part/Mesh/JT_Part01L_SM.JT_Part01L_SM",
    MoveDirect = T.RT_9,
    Speed = T.RT_6
  },
  [700009] = {
    AccessoryId = 700009,
    AttachRule = {SocketA = "Root", SocketB = "jianjia_r"},
    DamageDirect = T.RT_10,
    DelayDestroyTime = 3,
    DropProb = T.RT_2,
    HitEffect = {
      [700010] = T.RT_3
    },
    LandEffectId = 700011,
    ModelPath = "/Game/Asset/Char/Monster/Common/Part/Mesh/JT_Part01R_SM.JT_Part01R_SM",
    MoveDirect = T.RT_12,
    Speed = T.RT_6
  },
  [700010] = {
    AccessoryId = 700010,
    AttachRule = T.RT_17,
    DamageDirect = T.RT_14,
    DelayDestroyTime = 3,
    DropProb = T.RT_2,
    HitEffect = T.RT_18,
    LandEffectId = 700011,
    ModelPath = "/Game/Asset/Char/Monster/Common/Part/Mesh/JT_Part02B_SM.JT_Part02B_SM",
    MoveDirect = T.RT_16,
    PreAccessories = {700011},
    Speed = T.RT_6
  },
  [700011] = {
    AccessoryId = 700011,
    AttachRule = T.RT_17,
    DamageDirect = T.RT_14,
    DelayDestroyTime = 3,
    DropProb = T.RT_2,
    HitEffect = T.RT_18,
    LandEffectId = 700011,
    ModelPath = "/Game/Asset/Char/Monster/Common/Part/Mesh/JT_Part03A_SM.JT_Part03A_SM",
    MoveDirect = T.RT_16,
    Speed = T.RT_6
  },
  [800001] = {
    AccessoryId = 800001,
    AttachRule = {
      SocketA = "Root",
      SocketB = "JH_hook_part01_front"
    },
    DamageDirect = T.RT_1,
    DelayDestroyTime = 3,
    DropProb = T.RT_2,
    HitEffect = T.RT_4,
    LandEffectId = 700011,
    ModelPath = "/Game/Asset/Char/Monster/Common/Part/Mesh/JH_Part01_SM.JH_Part01_SM",
    MoveDirect = T.RT_5,
    Speed = T.RT_6
  },
  [800002] = {
    AccessoryId = 800002,
    AttachRule = {
      SocketA = "Root",
      SocketB = "JH_hook_part01_left"
    },
    DamageDirect = T.RT_7,
    DelayDestroyTime = 3,
    DropProb = T.RT_2,
    HitEffect = T.RT_8,
    LandEffectId = 700011,
    ModelPath = "/Game/Asset/Char/Monster/Common/Part/Mesh/JH_Part02_SM.JH_Part02_SM",
    MoveDirect = T.RT_9,
    Speed = T.RT_6
  },
  [800003] = {
    AccessoryId = 800003,
    AttachRule = {
      SocketA = "Root",
      SocketB = "JH_hook_part01_right"
    },
    DamageDirect = T.RT_10,
    DelayDestroyTime = 3,
    DropProb = T.RT_2,
    HitEffect = T.RT_11,
    LandEffectId = 700011,
    ModelPath = "/Game/Asset/Char/Monster/Common/Part/Mesh/JH_Part03_SM.JH_Part03_SM",
    MoveDirect = T.RT_12,
    Speed = T.RT_6
  },
  [800004] = {
    AccessoryId = 800004,
    AttachRule = {
      SocketA = "Root",
      SocketB = "JH_hook_part01_back"
    },
    DamageDirect = T.RT_14,
    DelayDestroyTime = 3,
    DropProb = T.RT_2,
    HitEffect = T.RT_15,
    LandEffectId = 700011,
    ModelPath = "/Game/Asset/Char/Monster/Common/Part/Mesh/JH_Part04_SM.JH_Part04_SM",
    MoveDirect = T.RT_16,
    Speed = T.RT_6
  },
  [900001] = {
    AccessoryId = 900001,
    AttachRule = {
      SocketA = "Root",
      SocketB = "Upperarm_L_Hook01"
    },
    DamageDirect = T.RT_7,
    DelayDestroyTime = 3,
    DropProb = T.RT_2,
    HitEffect = T.RT_8,
    LandEffectId = 700011,
    ModelPath = "/Game/Asset/Char/Monster/Common/Part/Mesh/SQ_Part02_SM.SQ_Part02_SM",
    MoveDirect = T.RT_9,
    Speed = T.RT_6
  },
  [900002] = {
    AccessoryId = 900002,
    AttachRule = {
      SocketA = "Root",
      SocketB = "Upperarm_R_Hook01"
    },
    DamageDirect = T.RT_10,
    DelayDestroyTime = 3,
    DropProb = T.RT_2,
    HitEffect = T.RT_11,
    LandEffectId = 700011,
    ModelPath = "/Game/Asset/Char/Monster/Common/Part/Mesh/SQ_Part03_SM.SQ_Part03_SM",
    MoveDirect = T.RT_12,
    Speed = T.RT_6
  },
  [900003] = {
    AccessoryId = 900003,
    AttachRule = {
      SocketA = "Root",
      SocketB = "sq_part_back"
    },
    DamageDirect = T.RT_14,
    DelayDestroyTime = 3,
    DropProb = T.RT_2,
    HitEffect = T.RT_15,
    LandEffectId = 700011,
    ModelPath = "/Game/Asset/Char/Monster/Common/Part/Mesh/SQ_Part04_SM.SQ_Part04_SM",
    MoveDirect = T.RT_16,
    Speed = T.RT_6
  },
  [950001] = {
    AccessoryId = 950001,
    AnimNames = {
      "NPC_BaiSD_WP01_Idle",
      "NPC_BaiSD_WP01_Write_End",
      "NPC_BaiSD_WP01_Write_Loop",
      "NPC_BaiSD_WP01_Write_Start"
    },
    AnimPath = "/Game/Asset/Char/Npc/NPC_BaiSD/Animation/Summon/",
    AttachRule = T.RT_19,
    ModelPath = "/Game/Asset/Char/Npc/NPC_BaiSD/Mesh/NPC_BaiSD_WP01.NPC_BaiSD_WP01"
  },
  [950002] = {
    AccessoryId = 950002,
    AnimNames = {
      "NPC_BaiSD_WP02_Idle",
      "NPC_BaiSD_WP02_Write_End",
      "NPC_BaiSD_WP02_Write_Loop",
      "NPC_BaiSD_WP02_Write_Start"
    },
    AnimPath = "/Game/Asset/Char/Npc/NPC_BaiSD/Animation/Summon/",
    AttachRule = T.RT_20,
    ModelPath = "/Game/Asset/Char/Npc/NPC_BaiSD/Mesh/NPC_BaiSD_WP02.NPC_BaiSD_WP02"
  },
  [950003] = {
    AccessoryId = 950003,
    AnimNames = {
      "BaiTX_Part02_Emo_SpecialConfident_Idle",
      "BaiTX_Part02_Emo_SpecialConfident_Start"
    },
    AnimPath = "/Game/Asset/Char/Npc/NPC_BaiTX/Animation/Sequence/Summon/",
    AttachRule = T.RT_21,
    ModelPath = "/Game/Asset/Char/Npc/NPC_BaiTX/Mesh/NPC_BaiTX_Part02_SM.BaiTX_Part02_SM"
  },
  [950004] = {
    AccessoryId = 950004,
    AnimNames = {
      "BaiTX_Part03_Emo_SpecialConfident_Idle",
      "BaiTX_Part03_Emo_SpecialConfident_Start"
    },
    AnimPath = "/Game/Asset/Char/Npc/NPC_BaiTX/Animation/Sequence/Summon/",
    AttachRule = {SocketA = "Root", SocketB = "head"},
    ModelPath = "/Game/Asset/Char/Npc/NPC_BaiTX/Mesh/NPC_BaiTX_Part03_SM.BaiTX_Part03_SM"
  },
  [950005] = {
    AccessoryId = 950005,
    AnimNames = {
      "Shuimu_Part_Interactive_Sit02"
    },
    AnimPath = "/Game/Asset/Char/Player/Char005_Shuimu/Animation/Summon/Sequence/",
    AttachRule = T.RT_19,
    ModelPath = "/Game/Asset/Char/Player/Char005_Shuimu/Mesh/Shuimu_Part01_SM.Shuimu_Part01_SM"
  },
  [950006] = {
    AccessoryId = 950006,
    AnimNames = {
      "Yuming_Part_Interactive_Sit02"
    },
    AnimPath = "/Game/Asset/Char/Player/Char008_Yuming/Animation/Summon/Sequnence/",
    AttachRule = T.RT_19,
    ModelPath = "/Game/Asset/Char/Player/Char008_Yuming/Mesh/Yuming_Part01_SM.Yuming_Part01_SM"
  },
  [950007] = {
    AccessoryId = 950007,
    AnimNames = {
      "Saiqi_Part_Interactive_Sit02_Start",
      "Saiqi_Part_Interactive_Sit02_Loop",
      "Saiqi_Part_Interactive_Sit02_End"
    },
    AnimPath = "/Game/Asset/Char/Player/Char010_Saiqi/Animation/Part/Sequnence/",
    AttachRule = T.RT_19,
    ModelPath = "/Game/Asset/Char/Player/Char010_Saiqi/Mesh/Saiqi_Part01_SM.Saiqi_Part01_SM"
  },
  [950008] = {
    AccessoryId = 950008,
    AttachRule = T.RT_19,
    ModelPath = "/Game/Asset/Char/Player/Char011_Linen/Mesh/Linen_WP01_SM.Linen_WP01_SM"
  },
  [950009] = {
    AccessoryId = 950009,
    AnimNames = {
      "Baiheng_Part_Interactive_Sit02"
    },
    AnimPath = "/Game/Asset/Char/Player/Char015_Baiheng/Animation/Summon/Sequnence/",
    AttachRule = T.RT_19,
    ModelPath = "/Game/Asset/Char/Player/Char015_Baiheng/Mesh/Baiheng_Part01_SM.Baiheng_Part01_SM"
  },
  [950010] = {
    AccessoryId = 950010,
    AnimNames = {
      "Feina_Part_Interactive_Sit02"
    },
    AnimPath = "/Game/Asset/Char/Player/Char019_Feina/Animation/Summon/Sequence/",
    AttachRule = T.RT_21,
    ModelPath = "/Game/Asset/Char/Player/Char019_Feina/Mesh/Feina_Part01_SM.Feina_Part01_SM"
  },
  [950011] = {
    AccessoryId = 950011,
    AttachRule = T.RT_19,
    ModelPath = "/Game/Asset/Char/Player/Char023_Xier/Mesh/Xier_Part05_SM.Xier_Part05_SM"
  },
  [950012] = {
    AccessoryId = 950012,
    AttachRule = T.RT_19,
    ModelPath = "/Game/Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi01_Part01_SM.Tuosi01_Part01_SM"
  },
  [950013] = {
    AccessoryId = 950013,
    AttachRule = T.RT_19,
    ModelPath = "/Game/Asset/Scene/common/Mesh/SM_Com_Gob01.SM_Com_Gob01"
  },
  [950014] = {
    AccessoryId = 950014,
    AnimNames = {
      "Lilikou_Story_lyre_Small_Start",
      "Lilikou_Story_lyre_Small_Loop",
      "Lilikou_Story_lyre_Small_End",
      "Lilikou_Story_lyre_Small_Idle"
    },
    AnimPath = "/Game/Asset/Char/Player/Char034_Lilikou/Animation/Summon/Sequence/",
    AttachRule = T.RT_20,
    ModelPath = "/Game/Asset/Char/Player/Char034_Lilikou/Mesh/Lilikou_Part02_SM.Lilikou_Part02_SM"
  }
})
