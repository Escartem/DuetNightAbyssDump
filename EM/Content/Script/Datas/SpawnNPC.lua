local T = {}
T.RT_1 = {
  0,
  0,
  0
}
T.RT_2 = {
  -10,
  150,
  60
}
T.RT_3 = {
  -10,
  120,
  70
}
T.RT_4 = {
  20,
  250,
  60
}
T.RT_5 = {
  -15,
  220,
  50
}
T.RT_6 = {
  0,
  -120,
  0
}
T.RT_7 = {
  0,
  -50,
  0
}
T.RT_8 = {
  20,
  350,
  150
}
T.RT_9 = {
  30,
  350,
  150
}
T.RT_10 = {
  0,
  -70,
  0
}
T.RT_11 = {
  20,
  250,
  65
}
T.RT_12 = {
  0,
  150,
  65
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SpawnNPC", {
  [220040] = {
    CameraPosition = T.RT_1,
    CameraPositionStart = T.RT_1,
    CameraRotation = T.RT_1,
    CameraRotationStart = T.RT_1,
    FixedCamera = "/Game/BluePrints/Char/BP_ZhiLiuEntrustCamera",
    IsOnlyMoveCamera = true,
    NPCName = "UI_DGNpc_Name_NPC_Zhiliu",
    SpawnNPCId = 220040
  },
  [900001] = {
    BPPath = "/Game/AssetDesign/Char/Npc/BaiNpc/Bai_Duanzao/BP_BaiDZ",
    EndDialogue = 21000202,
    FixedCamera = "/Game/UI/UI_PC/Forging/Blueprint/BP_ForgeCamera",
    FixedCameraM = "/Game/UI/UI_PC/Forging/Blueprint/BP_ForgeCamera_Mobile",
    NPCName = "UI_Npc_Name_Duanzao",
    SpawnNPCId = 900001,
    StartDialogue = 21000201
  },
  [900002] = {
    BPPath = "/Game/AssetDesign/Char/Npc/BaiNpc/BaiSD/BP_BaiSDRegion",
    CameraPosition = T.RT_2,
    CameraPositionM = T.RT_3,
    CameraPositionStart = T.RT_4,
    CameraPositionStartM = T.RT_5,
    CameraRotation = T.RT_6,
    CameraRotationM = T.RT_7,
    CameraRotationStart = T.RT_6,
    CameraRotationStartM = T.RT_7,
    CameraTime = 1,
    DetectionDiatance = 100,
    EndDialogue = 21000304,
    FixedCamera = "/Game/BluePrints/Char/BP_ShopCamera",
    FixedCameraM = "/Game/BluePrints/Char/BP_ShopCamera_Mobile",
    NPCName = "UI_Npc_Name_Shangdian",
    SpawnAngle = 0,
    SpawnNPCId = 900002,
    SpawnRadius = 0.5,
    StartDialogue = 21000303
  },
  [900003] = {
    BPPath = "/Game/AssetDesign/Char/Npc/BaiNpc/Bai_Setting/BP_BaiTXSetting",
    CameraFov = 50,
    CameraPosition = {
      -18,
      381.5,
      143
    },
    CameraPositionM = {
      -5,
      360,
      144
    },
    CameraPositionStart = T.RT_8,
    CameraPositionStartM = T.RT_9,
    CameraRotation = {
      0,
      -105,
      0
    },
    CameraRotation2 = {
      0,
      -11,
      0
    },
    CameraRotationM = T.RT_10,
    CameraRotationStart = T.RT_6,
    CameraRotationStartM = T.RT_10,
    CameraTime = 1,
    ConditionID = {100103},
    DetectionDiatance = 100,
    EndDialogue = 21000402,
    NPCName = "UI_Npc_Name_Bai",
    SpawnAngle = 0,
    SpawnNPCId = 900003,
    SpawnRadius = 1.5,
    StartDialogue = 21000401
  },
  [900005] = {
    BPPath = "/Game/AssetDesign/Char/Npc/BaiNpc/Bai_Beibao/BP_NPC_BaiBB",
    CameraFov = 50,
    CameraPosition = {
      -19.5,
      250,
      65
    },
    CameraPositionM = {
      -55,
      235,
      65
    },
    CameraPositionStart = T.RT_11,
    CameraPositionStartM = T.RT_11,
    CameraRotation = {
      0,
      -104.5,
      0
    },
    CameraRotation2 = {
      0,
      -10,
      0
    },
    CameraRotationM = {
      0,
      -98,
      0
    },
    CameraRotationStart = T.RT_6,
    CameraRotationStartM = T.RT_6,
    CameraTime = 1,
    ConditionID = {27},
    DetectionDiatance = 100,
    EndDialogue = 21000102,
    NPCName = "UI_Npc_Name_Bag",
    SpawnAngle = 0,
    SpawnNPCId = 900005,
    SpawnRadius = 0.5,
    StartDialogue = 21000101
  },
  [900010] = {
    BPPath = "/Game/AssetDesign/Char/Npc/BaiNpc/BaiJT/BP_BaiJT",
    CameraPosition = T.RT_2,
    CameraPositionM = T.RT_3,
    CameraPositionStart = T.RT_4,
    CameraPositionStartM = T.RT_5,
    CameraRotation = T.RT_6,
    CameraRotationM = T.RT_7,
    CameraRotationStart = T.RT_6,
    CameraRotationStartM = T.RT_7,
    CameraTime = 1,
    DetectionDiatance = 100,
    FixedCamera = "/Game/BluePrints/Char/BP_FishingShopCamera",
    FixedCameraM = "/Game/BluePrints/Char/BP_FishingShopCamera_Mobile",
    NPCName = "UI_Npc_Name_Shangdian",
    SpawnAngle = 0,
    SpawnNPCId = 900010,
    SpawnRadius = 0.5
  },
  [910001] = {
    BPPath = "/Game/AssetDesign/Char/Npc/BaiNpc/Bai_Duanzao/BP_BaiDZ",
    CameraFov = 50,
    CameraPosition = {
      45,
      119,
      0.5
    },
    CameraPositionM = {
      55,
      163,
      102.5
    },
    CameraPositionStart = T.RT_11,
    CameraPositionStartM = T.RT_11,
    CameraRotation = {
      30,
      230.3,
      0
    },
    CameraRotation2 = {
      5,
      -9,
      0
    },
    CameraRotationM = {
      350,
      -135,
      5
    },
    CameraRotationStart = {
      30,
      -120,
      0
    },
    CameraRotationStartM = T.RT_6,
    CameraTime = 1,
    DetectionDiatance = 100,
    EndDialogue = 21000203,
    NPCName = "UI_Npc_Name_Duanzao",
    SpawnAngle = 0,
    SpawnNPCId = 910001,
    SpawnRadius = 0.5,
    StartDialogue = 21000201
  },
  [910002] = {
    BPPath = "/Game/AssetDesign/Char/Npc/BaiNpc/Bai_Beibao/BP_NPC_BaiBB",
    CameraPosition = T.RT_12,
    CameraPositionM = {
      -25,
      120,
      50
    },
    CameraPositionStart = T.RT_11,
    CameraPositionStartM = T.RT_5,
    CameraRotation = T.RT_6,
    CameraRotationM = T.RT_7,
    CameraRotationStart = T.RT_6,
    CameraRotationStartM = T.RT_7,
    CameraTime = 1,
    DetectionDiatance = 100,
    EndDialogue = 21000102,
    IsOnlyMoveCamera = true,
    NPCName = "UI_Npc_Name_Shangdian",
    SpawnAngle = 0,
    SpawnNPCId = 910002,
    SpawnRadius = 0.5,
    StartDialogue = 21000101
  },
  [910003] = {
    BPPath = "/Game/AssetDesign/Char/Npc/BaiNpc/Bai_Setting/BP_BaiTXSetting",
    CameraFov = 50,
    CameraPosition = {
      -3,
      383.5,
      145
    },
    CameraPositionM = {
      37,
      352,
      142
    },
    CameraPositionStart = T.RT_8,
    CameraPositionStartM = T.RT_9,
    CameraRotation = {
      0,
      -107,
      0
    },
    CameraRotation2 = {
      0,
      -7,
      0
    },
    CameraRotationM = {
      0,
      -81,
      0
    },
    CameraRotationStart = T.RT_6,
    CameraRotationStartM = T.RT_10,
    CameraTime = 1,
    DetectionDiatance = 100,
    EndDialogue = 21000504,
    FixedCamera = "/Game/UI/WBP/Play/PC/BP_PlayCamera",
    FixedCameraM = "/Game/UI/WBP/Play/Mobile/BP_PlayCamera_Mobile",
    NPCName = "UI_Npc_Name_Bai",
    SpawnAngle = 0,
    SpawnNPCId = 910003,
    SpawnRadius = 1.5,
    StartDialogue = 21000503
  },
  [910005] = {
    BPPath = "/Game/AssetDesign/Char/Npc/BaiNpc/Bai_Beibao/BP_NPC_BaiBB",
    CameraFov = 50,
    CameraPosition = T.RT_12,
    CameraPositionStart = T.RT_11,
    CameraRotation = T.RT_6,
    CameraRotationStart = T.RT_6,
    CameraTime = 1,
    DetectionDiatance = 100,
    EndDialogue = 21000102,
    NPCName = "UI_Npc_Name_Bag",
    SpawnAngle = 0,
    SpawnNPCId = 910005,
    SpawnRadius = 0.5,
    StartDialogue = 21000101
  },
  [910008] = {
    BPPath = "/Game/UI/Blueprint/BP_Book_Loop.BP_Book_Loop",
    CameraPosition = {
      -15,
      150,
      65
    },
    CameraPositionStart = T.RT_11,
    CameraRotation = T.RT_6,
    CameraRotationStart = T.RT_6,
    CameraTime = 1,
    DetectionDiatance = 100,
    NPCName = "UI_Wiki_Book",
    SpawnAngle = 0,
    SpawnNPCId = 910008,
    SpawnRadius = 0.5
  },
  [920005] = {
    CameraPosition = T.RT_12,
    CameraPositionStart = T.RT_11,
    CameraRotation = T.RT_6,
    CameraRotationStart = T.RT_6,
    CameraTime = 1,
    EndDialogue = 21000102,
    FixedCamera = "/Game/BluePrints/Char/BP_ExploreBadgeShopCamera",
    FixedCameraM = "/Game/BluePrints/Char/BP_ExploreBadgeShopCamera_Mobile",
    IsOnlyMoveCamera = true,
    NPCName = "UI_Npc_Name_Bag",
    SpawnNPCId = 920005,
    StartDialogue = 21000101
  }
})
