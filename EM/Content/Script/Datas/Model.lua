local T = {}
T.RT_1 = {
  "neck_01",
  "spine_01",
  "spine_02",
  "upperarm_l",
  "upperarm_r"
}
T.RT_2 = {
  1001,
  1002,
  1003
}
T.RT_3 = {"hit1", "hit2"}
T.RT_4 = {"hit1"}
T.RT_5 = {"NpcLady"}
T.RT_6 = {
  1,
  0,
  0.564
}
T.RT_7 = {
  CutsOpacity = 0,
  Emissive = T.RT_6
}
T.RT_8 = {
  0,
  1,
  1
}
T.RT_9 = {
  CutsOpacity = 0,
  Emissive = T.RT_8
}
T.RT_10 = {
  CutsOpacity = 1,
  Emissive = T.RT_8
}
T.RT_11 = {
  Path = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi01_Part01_SM",
  Socket = "headpendant_right01_a",
  Visible = 1
}
T.RT_12 = {"NpcMan"}
T.RT_13 = {"Melee"}
T.RT_14 = {
  0,
  0,
  0
}
T.RT_15 = {
  HitFlyMinTime = 0,
  TurnIP180Threshold = 90,
  TurnIPMinAngle = 30
}
T.RT_16 = {"Ranged"}
T.RT_17 = {
  "FresnelColor"
}
T.RT_18 = {1006, 1007}
T.RT_19 = {2060100}
T.RT_20 = {
  Path = "Asset/Char/Player/Char005_Shuimu/Mesh/Shuimu_Part02_SM.Shuimu_Part02_SM",
  Socket = "skirt_right01_b1",
  Visible = 1
}
T.RT_21 = {1004, 1005}
T.RT_22 = {
  100,
  40,
  0
}
T.RT_23 = {
  CondemnSocket = "Root",
  LocationOffset = T.RT_22
}
T.RT_24 = {HitFlyMinTime = 0.63}
T.RT_25 = {
  0,
  0,
  110
}
T.RT_26 = {
  PenalizeOffset = T.RT_25,
  PenalizeSocket = "head"
}
T.RT_27 = {5001}
T.RT_28 = {5441}
T.RT_29 = {5442}
T.RT_30 = {5443}
T.RT_31 = {5444}
T.RT_32 = {5445}
T.RT_33 = {5446}
T.RT_34 = {5447}
T.RT_35 = {5448}
T.RT_36 = {5449}
T.RT_37 = {5002}
T.RT_38 = {5003, 5461}
T.RT_39 = {5462}
T.RT_40 = {5463}
T.RT_41 = {5464}
T.RT_42 = {5465}
T.RT_43 = {5466}
T.RT_44 = {"NpcGirl"}
T.RT_45 = {"NpcLoli"}
T.RT_46 = {
  Path = "Asset/Char/Player/Char010_Saiqi/Mesh/Saiqi_Part01_SM.Saiqi_Part01_SM",
  Visible = 0
}
T.RT_47 = {
  Path = "Asset/Char/Player/Char098_Saiqi01/Mesh/Saiqi_SP01_Part01_SM.Saiqi_SP01_Part01_SM",
  Visible = 0
}
T.RT_48 = {HitFlyMinTime = 0}
T.RT_49 = {
  "hit_outside"
}
T.RT_50 = {
  40,
  0,
  0
}
T.RT_51 = {
  CondemnSocket = "Root",
  LocationOffset = T.RT_50
}
T.RT_52 = {
  80,
  0,
  0
}
T.RT_53 = {
  CondemnSocket = "Root",
  LocationOffset = T.RT_52
}
T.RT_54 = {
  Arm_L = "hand_left01_b",
  Arm_L1 = "hand_left01_c",
  Arm_L2 = "lowerarm_l",
  Arm_R = "hand_right01_b",
  Arm_R1 = "hand_right01_c",
  Arm_R2 = "lowerarm_r",
  FootL = "foot_left01_b",
  FootL1 = "foot_left01_c",
  FootR = "foot_right01_b",
  FootR1 = "foot_right01_c",
  Foot_L3 = "calf_l",
  Foot_R3 = "calf_r",
  Middle = "spine01",
  Tail = "tail_f"
}
T.RT_55 = {
  70,
  100,
  0
}
T.RT_56 = {
  CondemnSocket = "Root",
  LocationOffset = T.RT_55
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Model", {
  [1] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Heitao/ABP_Heitao_Art.ABP_Heitao_Art_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Heitao_",
    CloakMeshPath = "Asset/Char/Player/Char001_Heitao_J/Mesh/Heitao_Cloak_SM.Heitao_Cloak_SM",
    DamageFXSockets = T.RT_1,
    HeadScale = 0.96,
    HitMontageRule = "RoleDefault",
    KawaiiIdList = T.RT_2,
    ModelId = 1,
    MontageFolder = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/",
    MontagePrefix = "Heitao_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = " ",
    StandId = "001"
  },
  [2] = {
    ModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Char000_AnimTest/Mesh/Ceshi_WP_SM.Ceshi_WP_SM"
  },
  [3] = {
    ModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Char000_AnimTest/Mesh/Ceshi_WP_Ranged_SM.Ceshi_WP_Ranged_SM"
  },
  [10] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/WeitaM/ABP_WeitaM.ABP_WeitaM_C'",
    AudioPrefix = "WeitaM_",
    AvatarExpressionPrefix = "Hostage_",
    FootType = "bootHeavy",
    HitMontageRule = "RoleDefault",
    ModelId = 10,
    MontageFolder = "/Game/Asset/Char/Player/NPC005_WeitaM/Animation/Montage/",
    MontagePrefix = "WeitaM_",
    RunStopStartTime = 0.16,
    SkeletonMeshPath = "Asset/Char/Npc/Npc_Hostage/Mesh/Npc_Hostage_SM.Npc_Hostage_SM"
  },
  [30] = {
    ModelId = 30,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Condemn/Condemn_Aisi/Mesh/Condemn_Aisi.Condemn_Aisi"
  },
  [98] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_Pizhuo/ABP_TestSimpleMon_JT_Pizhuo.ABP_TestSimpleMon_JT_Pizhuo_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "JT_Pizhuo_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "TestSimpleMon",
    ModelId = 98,
    MontageFolder = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/",
    MontagePrefix = "JT_Pizhuo_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_Pizhuo/Mesh/JT_Pizhuo_SM.JT_Pizhuo_SM"
  },
  [99] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_Ranger/ABP_TestSimpleMon_JT_Ranger.ABP_TestSimpleMon_JT_Ranger_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "JT_Ranger_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "TestSimpleMon",
    ModelId = 99,
    MontageFolder = "/Game/Asset/Char/Monster/Jt_Ranger/Animation/Montage/",
    MontagePrefix = "JT_Ranger_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_Ranger/Mesh/JT_Ranger_SM.JT_Ranger_SM"
  },
  [101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Nvzhu/ABP_Nvzhu.ABP_Nvzhu_C'",
    AudioPrefix = "NvzhuLight_",
    AvatarExpressionPrefix = "Nvzhu_",
    CloakMeshPath = "Asset/Char/Player/NPC001_Nvzhu/Mesh/Nvzhu_Cloak_SM.Nvzhu_Cloak_SM",
    FootType = "heeledMid",
    HeadScale = 0.95,
    HitMontageRule = "RoleDefault",
    ModelId = 101,
    MontageFolder = "/Game/Asset/Char/Player/NPC001_Nvzhu/Animation/Montage/",
    MontagePrefix = "Nvzhu_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/NPC001_Nvzhu/Mesh/Nvzhu_SM.Nvzhu_SM"
  },
  [102] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Nanzhu/ABP_Nanzhu.ABP_Nanzhu_C'",
    AudioPrefix = "NanzhuLight_",
    AvatarExpressionPrefix = "Nanzhu_",
    CloakMeshPath = "Asset/Char/Player/NPC002_Nanzhu/Mesh/Nanzhu_Cloak_SM.Nanzhu_Cloak_SM",
    FootType = "bootLight",
    HitMontageRule = "RoleDefault",
    ModelId = 102,
    MontageFolder = "/Game/Asset/Char/Player/NPC002_Nanzhu/Animation/Montage/",
    MontagePrefix = "Nanzhu_",
    RunStopStartTime = 0.16,
    SkeletonMeshPath = "Asset/Char/Player/NPC002_Nanzhu/Mesh/Nanzhu_SM.Nanzhu_SM"
  },
  [103] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/WeitaF/ABP_WeitaF.ABP_WeitaF_C'",
    AudioPrefix = "WeitaF_",
    AvatarExpressionPrefix = "WeitaF_",
    CloakMeshPath = "Asset/Char/Player/NPC004_WeitaF/Mesh/WeitaF_Cloak_SM.WeitaF_Cloak_SM",
    FootType = "heeledMid",
    HeadScale = 0.95,
    HitMontageRule = "RoleDefault",
    ModelId = 103,
    MontageFolder = "/Game/Asset/Char/Player/NPC004_WeitaF/Animation/Montage/",
    MontagePrefix = "WeitaF_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/NPC004_WeitaF/Mesh/WeitaF_SM.WeitaF_SM"
  },
  [104] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/WeitaM/ABP_WeitaM.ABP_WeitaM_C'",
    AudioPrefix = "WeitaM_",
    AvatarExpressionPrefix = "WeitaM_",
    CloakMeshPath = "Asset/Char/Player/NPC005_WeitaM/Mesh/WeitaM_Cloak_SM.WeitaM_Cloak_SM",
    FootType = "bootLight",
    HeadScale = 0.98,
    HitMontageRule = "RoleDefault",
    ModelId = 104,
    ModelScale = 1.02,
    MontageFolder = "/Game/Asset/Char/Player/NPC005_WeitaM/Animation/Montage/",
    MontagePrefix = "WeitaM_",
    RunStopStartTime = 0.16,
    SkeletonMeshPath = "Asset/Char/Player/NPC005_WeitaM/Mesh/WeitaM_SM.WeitaM_SM"
  },
  [115] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_Ranger/ABP_Mon_Jt_Ranger01.ABP_Mon_JT_Ranger01_C'",
    AssistSockets = T.RT_3,
    AudioPrefix = "JT_Ranger_",
    BehaviorMontageGroupId = 7003,
    DamageFXSockets = T.RT_3,
    HitMontageRule = "MonDefault",
    ModelId = 115,
    MontageFolder = "/Game/Asset/Char/Monster/Jt_Ranger01/Animation/Montage/",
    MontagePrefix = "JT_Ranger_",
    MoveParameters = T.RT_15,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Ranger/Mesh/JT_Ranger_SM.JT_Ranger_SM"
  },
  [116] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_Juji/ABP_Mon_JT_Juji01.ABP_Mon_JT_Juji01_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "JT_Juji_",
    BehaviorMontageGroupId = 7001,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 116,
    MontageFolder = "/Game/Asset/Char/Monster/JT_Juji01/Animation/Montage/",
    MontagePrefix = "JT_Juji_",
    MoveParameters = T.RT_15,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Juji/Mesh/JT_Juji_SM.JT_Juji_SM"
  },
  [117] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_Juji/ABP_Mon_JT_Juji.ABP_Mon_JT_Juji_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "JH_Zhishi_",
    BehaviorMontageGroupId = 8001,
    DamageFXSockets = T.RT_3,
    HitMontageRule = "MonDefault",
    ModelId = 117,
    ModelScale = 1.1,
    MontageFolder = "/Game/Asset/Char/Monster/JH_Zhishi/Animation/Montage/",
    MontagePrefix = "JH_Zhishi_",
    SkeletonMeshPath = "Asset/Char/Monster/JH_Zhishi/Mesh/JH_Zhishi_SM.JH_Zhishi_SM",
    WeaponScale = 1.1
  },
  [118] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Animal_Xuelang/ABP_Mon_Xuelang_Vehicle.ABP_Mon_Xuelang_Vehicle_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Mon_Xuelang_",
    BehaviorMontageGroupId = 9801,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonVehicle",
    ModelId = 118,
    MontageFolder = "/Game/Asset/Char/Monster/Animal01_Xuelang/Animation/Montage/",
    MontagePrefix = "Mon_Xuelang_",
    SkeletonMeshPath = "Asset/Char/Monster/Animal01_Xuelang/Mesh/Mon_XuelangA_SM_Vehicle.Mon_XuelangA_SM_Vehicle"
  },
  [119] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Gr_Baotu/ABP_Mon_Gr_Baotu.ABP_Mon_Gr_Baotu_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "GR_Baotu_",
    AvatarExpressionPrefix = "Baotu_",
    BehaviorMontageGroupId = 6004,
    BirthTime = -1,
    DamageFXSockets = T.RT_4,
    EffectShape = "Special_L",
    HitMontageRule = "MonNoRagdoll",
    ModelId = 119,
    ModelScale = 1,
    MontageFolder = "/Game/Asset/Char/Monster/GR_Baotu/Animation/Montage/",
    MontagePrefix = "GR_Baotu_",
    SkeletonMeshPath = "Asset/Char/Monster/GR_Baotu/Mesh/GR_Baotu_SM.GR_Baotu_SM"
  },
  [201] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Awa/ABP_Awa.ABP_Awa_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Awa_",
    DamageFXSockets = T.RT_1,
    FootType = "bootHeavy",
    HitMontageRule = "RoleDefault",
    ModelId = 201,
    MontageFolder = "/Game/Asset/Char/Npc/Npc_Awa/Animation/Montage/",
    MontagePrefix = "Awa_",
    RunStopStartTime = 0.13,
    SkeletonMeshPath = "Asset/Char/Npc/Npc_Awa/Mesh/Npc_Awa_SM.Npc_Awa_SM"
  },
  [298] = {
    ModelId = 298,
    SkeletonMeshPath = "Asset/Char/Player/Common/Part/Show/Mesh/Show_Fis01_Test_SM.Show_Fis01_Test_SM"
  },
  [299] = {
    ModelId = 299,
    SkeletonMeshPath = "Asset/Char/Player/Common/Part/Show/Mesh/Show_Fis01_SM.Show_Fis01_SM"
  },
  [301] = {
    ModelId = 301,
    SkeletonMeshPath = "Asset/Char/Player/Common/Part/Show/Mesh/Show_Kaorou01_SM.Show_Kaorou01_SM"
  },
  [302] = {
    ModelId = 302,
    SkeletonMeshPath = "Asset/Char/Player/Common/Part/Show/Mesh/Show_Kaorou02_SM.Show_Kaorou02_SM"
  },
  [303] = {
    ModelId = 303,
    SkeletonMeshPath = "Asset/Char/Player/Common/Part/Show/Mesh/Show_SaoZhou01_SM.Show_SaoZhou01_SM"
  },
  [304] = {
    ModelId = 304,
    SkeletonMeshPath = "Asset/Char/Player/Common/Part/Show/Mesh/Show_SaoZhou01_SM.Show_SaoZhou01_SM"
  },
  [305] = {
    ModelId = 305,
    SkeletonMeshPath = "Asset/Char/Player/Common/Part/Show/Mesh/Show_Mimic01_SM.Show_Mimic01_SM"
  },
  [306] = {
    ModelId = 306,
    SkeletonMeshPath = "Asset/Char/Player/Common/Part/Show/Mesh/Show_Bed01_SM.Show_Bed01_SM"
  },
  [307] = {
    ModelId = 307,
    SkeletonMeshPath = "Asset/Char/Player/Common/Part/Show/Mesh/Show_Violin01A_SM.Show_Violin01A_SM"
  },
  [308] = {
    ModelId = 308,
    SkeletonMeshPath = "Asset/Char/Player/Common/Part/Show/Mesh/Show_Violin01B_SM.Show_Violin01B_SM"
  },
  [309] = {
    ModelId = 309,
    SkeletonMeshPath = "Asset/Char/Player/Common/Part/Show/Mesh/Show_Violin01C_SM.Show_Violin01C_SM"
  },
  [310] = {
    ModelId = 310,
    SkeletonMeshPath = "Asset/Char/Player/Common/Part/Show/Mesh/Show_Car01_SM.Show_Car01_SM"
  },
  [401] = {
    ModelId = 401,
    ModelScale = 0.8,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet006_Zisha/Mesh/Pet_Zisha_SM.Pet_Zisha_SM"
  },
  [402] = {
    ModelId = 402,
    ModelScale = 0.8,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet001_Yuyi/Mesh/Pet_Yuyi_SM.Pet_Yuyi_SM"
  },
  [403] = {
    ModelId = 403,
    ModelScale = 0.85,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet002_Dahuo/Mesh/Pet_Dahuo_SM.Pet_Dahuo_SM"
  },
  [404] = {
    ModelId = 404,
    ModelScale = 0.7,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet004_Zhamao/Mesh/Pet_Zhamao_SM.Pet_Zhamao_SM"
  },
  [405] = {
    ModelId = 405,
    ModelScale = 0.85,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet003_Yaoye/Mesh/Pet_Yaoye_SM.Pet_Yaoye_SM"
  },
  [406] = {
    ModelId = 406,
    ModelScale = 0.85,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet005_Shanling/Mesh/Pet_Shanling_SM.Pet_Shanling_SM"
  },
  [407] = {
    ModelId = 407,
    ModelScale = 0.7,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet007_Nihao/Mesh/Pet_Nihao_SM.Pet_Nihao_SM"
  },
  [408] = {
    ModelId = 408,
    ModelScale = 0.75,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet008_Zhenzhu/Mesh/Pet_Zhenzhu_SM.Pet_Zhenzhu_SM"
  },
  [409] = {
    ModelId = 409,
    ModelScale = 0.75,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet009_Haomeng/Mesh/Pet_Haomeng_SM.Pet_Haomeng_SM"
  },
  [411] = {
    AdditionalFXID = T.RT_27,
    ModelId = 411,
    ModelScale = 0.7,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet018_Fuyou/Mesh/Pet_Fuyou_SM.Pet_Fuyou_SM"
  },
  [412] = {
    ModelId = 412,
    ModelScale = 0.8,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet013_Tangshuang/Mesh/Pet_Tangshuang_SM.Pet_Tangshuang_SM"
  },
  [413] = {
    ModelId = 413,
    ModelScale = 0.8,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet014_YYHW/Mesh/Pet_YYHW_SM.Pet_YYHW_SM"
  },
  [414] = {
    ModelId = 414,
    ModelScale = 0.8,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet016_Pipa/Mesh/Pet_Pipa_SM.Pet_Pipa_SM"
  },
  [415] = {
    ModelId = 415,
    ModelScale = 0.75,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet015_Mianmian/Mesh/Pet_Mianmian_SM.Pet_Mianmian_SM"
  },
  [416] = {
    ModelId = 416,
    ModelScale = 0.8,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet017_Qiuqiu/Mesh/Pet_Qiuqiu_SM.Pet_Qiuqiu_SM"
  },
  [421] = {
    ModelId = 421,
    ModelScale = 0.67,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet024_Heiyao/Mesh/Pet_Heiyao_SM.Pet_Heiyao_SM"
  },
  [422] = {
    ModelId = 422,
    ModelScale = 0.67,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet020_Jinqing/Mesh/Pet_Jinqing_SM.Pet_Jinqing_SM"
  },
  [423] = {
    ModelId = 423,
    ModelScale = 0.67,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet022_Manao/Mesh/Pet_Manao_SM.Pet_Manao_SM"
  },
  [424] = {
    ModelId = 424,
    ModelScale = 0.67,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet023_Zijing/Mesh/Pet_Zijing_SM.Pet_Zijing_SM"
  },
  [425] = {
    ModelId = 425,
    ModelScale = 0.67,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet021_Bixi/Mesh/Pet_Bixi_SM.Pet_Bixi_SM"
  },
  [426] = {
    ModelId = 426,
    ModelScale = 0.67,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet025_Oubo/Mesh/Pet_Oubo_SM.Pet_Oubo_SM"
  },
  [431] = {
    ModelId = 431,
    ModelScale = 0.8,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet006_Zisha/Mesh/Pet_Zisha_SM.Pet_Zisha_SM"
  },
  [432] = {
    ModelId = 432,
    ModelScale = 0.8,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet001_Yuyi/Mesh/Pet_Yuyi_SM.Pet_Yuyi_SM"
  },
  [433] = {
    ModelId = 433,
    ModelScale = 0.85,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet002_Dahuo/Mesh/Pet_Dahuo_SM.Pet_Dahuo_SM"
  },
  [434] = {
    ModelId = 434,
    ModelScale = 0.7,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet004_Zhamao/Mesh/Pet_Zhamao_SM.Pet_Zhamao_SM"
  },
  [435] = {
    ModelId = 435,
    ModelScale = 0.85,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet003_Yaoye/Mesh/Pet_Yaoye_SM.Pet_Yaoye_SM"
  },
  [436] = {
    ModelId = 436,
    ModelScale = 0.85,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet005_Shanling/Mesh/Pet_Shanling_SM.Pet_Shanling_SM"
  },
  [437] = {
    ModelId = 437,
    ModelScale = 0.7,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet007_Nihao/Mesh/Pet_Nihao_SM.Pet_Nihao_SM"
  },
  [438] = {
    ModelId = 438,
    ModelScale = 0.75,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet008_Zhenzhu/Mesh/Pet_Zhenzhu_SM.Pet_Zhenzhu_SM"
  },
  [439] = {
    ModelId = 439,
    ModelScale = 0.75,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet009_Haomeng/Mesh/Pet_Haomeng_SM.Pet_Haomeng_SM"
  },
  [441] = {
    AdditionalFXID = T.RT_28,
    ModelId = 441,
    ModelScale = 0.8,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet006_Zisha/Mesh/Pet_Zisha_SM.Pet_Zisha_SM"
  },
  [442] = {
    AdditionalFXID = T.RT_29,
    ModelId = 442,
    ModelScale = 0.8,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet001_Yuyi/Mesh/Pet_Yuyi_SM.Pet_Yuyi_SM"
  },
  [443] = {
    AdditionalFXID = T.RT_30,
    ModelId = 443,
    ModelScale = 0.85,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet002_Dahuo/Mesh/Pet_Dahuo_SM.Pet_Dahuo_SM"
  },
  [444] = {
    AdditionalFXID = T.RT_31,
    ModelId = 444,
    ModelScale = 0.7,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet004_Zhamao/Mesh/Pet_Zhamao_SM.Pet_Zhamao_SM"
  },
  [445] = {
    AdditionalFXID = T.RT_32,
    ModelId = 445,
    ModelScale = 0.85,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet003_Yaoye/Mesh/Pet_Yaoye_SM.Pet_Yaoye_SM"
  },
  [446] = {
    AdditionalFXID = T.RT_33,
    ModelId = 446,
    ModelScale = 0.85,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet005_Shanling/Mesh/Pet_Shanling_SM.Pet_Shanling_SM"
  },
  [447] = {
    AdditionalFXID = T.RT_34,
    ModelId = 447,
    ModelScale = 0.7,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet007_Nihao/Mesh/Pet_Nihao_SM.Pet_Nihao_SM"
  },
  [448] = {
    AdditionalFXID = T.RT_35,
    ModelId = 448,
    ModelScale = 0.75,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet008_Zhenzhu/Mesh/Pet_Zhenzhu_SM.Pet_Zhenzhu_SM"
  },
  [449] = {
    AdditionalFXID = T.RT_36,
    ModelId = 449,
    ModelScale = 0.75,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet009_Haomeng/Mesh/Pet_Haomeng_SM.Pet_Haomeng_SM"
  },
  [451] = {
    AdditionalFXID = T.RT_37,
    ModelId = 451,
    ModelScale = 0.7,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet018_Fuyou/Mesh/Pet_Fuyou_SM.Pet_Fuyou_SM"
  },
  [452] = {
    ModelId = 452,
    ModelScale = 0.8,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet013_Tangshuang/Mesh/Pet_Tangshuang_SM.Pet_Tangshuang_SM"
  },
  [453] = {
    ModelId = 453,
    ModelScale = 0.8,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet014_YYHW/Mesh/Pet_YYHW_SM.Pet_YYHW_SM"
  },
  [454] = {
    ModelId = 454,
    ModelScale = 0.8,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet016_Pipa/Mesh/Pet_Pipa_SM.Pet_Pipa_SM"
  },
  [455] = {
    ModelId = 455,
    ModelScale = 0.75,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet015_Mianmian/Mesh/Pet_Mianmian_SM.Pet_Mianmian_SM"
  },
  [456] = {
    ModelId = 456,
    ModelScale = 0.8,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet017_Qiuqiu/Mesh/Pet_Qiuqiu_SM.Pet_Qiuqiu_SM"
  },
  [461] = {
    AdditionalFXID = T.RT_38,
    ModelId = 461,
    ModelScale = 0.7,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet018_Fuyou/Mesh/Pet_Fuyou_SM.Pet_Fuyou_SM"
  },
  [462] = {
    AdditionalFXID = T.RT_39,
    ModelId = 462,
    ModelScale = 0.8,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet013_Tangshuang/Mesh/Pet_Tangshuang_SM.Pet_Tangshuang_SM"
  },
  [463] = {
    AdditionalFXID = T.RT_40,
    ModelId = 463,
    ModelScale = 0.8,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet014_YYHW/Mesh/Pet_YYHW_SM.Pet_YYHW_SM"
  },
  [464] = {
    AdditionalFXID = T.RT_41,
    ModelId = 464,
    ModelScale = 0.8,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet016_Pipa/Mesh/Pet_Pipa_SM.Pet_Pipa_SM"
  },
  [465] = {
    AdditionalFXID = T.RT_42,
    ModelId = 465,
    ModelScale = 0.75,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet015_Mianmian/Mesh/Pet_Mianmian_SM.Pet_Mianmian_SM"
  },
  [466] = {
    AdditionalFXID = T.RT_43,
    ModelId = 466,
    ModelScale = 0.8,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet017_Qiuqiu/Mesh/Pet_Qiuqiu_SM.Pet_Qiuqiu_SM"
  },
  [470] = {
    ModelId = 470,
    SkeletonMeshPath = "Asset/Char/Npc/NPC_Wuyou/Mesh/NPC_Wuyou01_SM.NPC_Wuyou01_SM"
  },
  [471] = {
    ModelId = 471,
    ModelScale = 0.8,
    SkeletonMeshPath = "Asset/Char/Npc/NPC_Wuyou/Mesh/NPC_Wuyou04_SM.NPC_Wuyou04_SM"
  },
  [472] = {
    ModelId = 472,
    ModelScale = 0.8,
    SkeletonMeshPath = "Asset/Char/Npc/NPC_Wuyou/Mesh/NPC_Wuyou02_SM.NPC_Wuyou02_SM"
  },
  [473] = {
    ModelId = 473,
    ModelScale = 0.8,
    SkeletonMeshPath = "Asset/Char/Npc/NPC_Wuyou/Mesh/NPC_Wuyou03_SM.NPC_Wuyou03_SM"
  },
  [474] = {
    ModelId = 474,
    ModelScale = 0.8,
    SkeletonMeshPath = "Asset/Char/Npc/NPC_Wuyou/Mesh/NPC_Wuyou01_SM.NPC_Wuyou01_SM"
  },
  [491] = {
    ModelId = 491,
    ModelScale = 0.85,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet010_HealRobot/Mesh/Pet_HealRobot_SM.Pet_HealRobot_SM"
  },
  [492] = {
    ModelId = 492,
    ModelScale = 0.75,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet011_BlastRobot/Mesh/Pet_BlastRobot_SM.Pet_BlastRobot_SM"
  },
  [493] = {
    ModelId = 493,
    ModelScale = 0.75,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet019_YYD/Mesh/Pet_YYD01_SM.Pet_YYD01_SM"
  },
  [494] = {
    ModelId = 494,
    ModelScale = 0.85,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet010_HealRobot/Mesh/Pet_HealRobot_SM.Pet_HealRobot_SM"
  },
  [495] = {
    ModelId = 495,
    ModelScale = 0.75,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet011_BlastRobot/Mesh/Pet_BlastRobot_SM.Pet_BlastRobot_SM"
  },
  [496] = {
    ModelId = 496,
    ModelScale = 0.85,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet010_HealRobot/Mesh/Pet_HealRobot_SM.Pet_HealRobot_SM"
  },
  [497] = {
    ModelId = 497,
    ModelScale = 0.75,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet011_BlastRobot/Mesh/Pet_BlastRobot_SM.Pet_BlastRobot_SM"
  },
  [498] = {
    ModelId = 498,
    ModelScale = 0.75,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet019_YYD/Mesh/Pet_YYD02_SM.Pet_YYD02_SM"
  },
  [499] = {
    ModelId = 499,
    ModelScale = 0.75,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet019_YYD/Mesh/Pet_YYD03_SM.Pet_YYD03_SM"
  },
  [601] = {
    ModelId = 601,
    SkeletonMeshPath = "Asset/Char/Player/Common/Fishing/Mesh/Fish_Common_SM.Fish_Common_SM"
  },
  [900] = {
    ModelId = 900,
    SkeletonMeshPath = "Asset/Scene/EN001_Prologue/Common/Mesh/SM_LightPedestal_02.SM_LightPedestal_02"
  },
  [901] = {
    ModelId = 901,
    SkeletonMeshPath = "Asset/Scene/EN001_Prologue/Common/Chest01/Mesh/SM_Village_Chest01_SM.SM_Village_Chest01_SM"
  },
  [902] = {
    ModelId = 902,
    SkeletonMeshPath = "Asset/Scene/EN001_Ailixian/Jingjiedao/JJD_Clouds/Mesh/SM_Clo_Cliff01"
  },
  [905] = {
    ModelId = 905,
    SkeletonMeshPath = "Asset/Scene/common/BreakableItems/Mesh/SM_TempGem.SM_TempGem"
  },
  [906] = {
    ModelId = 906,
    SkeletonMeshPath = "Asset/Scene/EN001_Ailixian/Common/Porp/Chest/Mesh/SM_Bujixiang_SM.SM_Bujixiang_SM"
  },
  [907] = {
    ModelId = 907,
    ModelScale = 1.7,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SV_IP_Chest_HB01.SV_IP_Chest_HB01"
  },
  [908] = {
    ModelId = 908,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Tele01A.SM_IP_Tele01A"
  },
  [909] = {
    ModelId = 909,
    SkeletonMeshPath = "Asset/Scene/common/Mesh/SM_Com_Exp01.SM_Com_Exp01"
  },
  [910] = {
    ModelId = 910,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SV_IP_Chest_AL04.SV_IP_Chest_AL04"
  },
  [911] = {
    ModelId = 911,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SV_IP_Chest_AL02.SV_IP_Chest_AL02"
  },
  [912] = {
    ModelId = 912,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SV_IP_Chest_AL03.SV_IP_Chest_AL03"
  },
  [913] = {
    ModelId = 913,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SV_IP_Chest_AL01.SV_IP_Chest_AL01"
  },
  [914] = {
    ModelId = 914,
    SkeletonMeshPath = "Asset/Scene/EN001_Ailixian/Common/Porp/Quarry_Dev01/Mesh/Quarry_Dev01_SM.Quarry_Dev01_SM"
  },
  [915] = {
    ModelId = 915,
    SkeletonMeshPath = "Asset/Scene/common/BreakableItems/Mesh/Chest04_Vat_Mesh.Chest04_Vat_Mesh"
  },
  [916] = {
    ModelId = 916,
    SkeletonMeshPath = "Asset/Scene/EN002_Haiboliya/Binghucheng/BH_City/Mesh/SM_Ail_Cha02.SM_Ail_Cha02"
  },
  [917] = {
    ModelId = 917,
    SkeletonMeshPath = "Asset/Scene/EN002_Haiboliya/Binghucheng/BH_Quarry/Mesh/SM_Qua_Ore08.SM_Qua_Ore08"
  },
  [918] = {
    ModelId = 918,
    SkeletonMeshPath = "Asset/Scene/EN001_Ailixian/Common/Porp/Chest/Mesh/SM_Bujixiang_SM.SM_Bujixiang_SM"
  },
  [919] = {
    ModelId = 919,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Mech_Fort_ABS01A.SM_IP_Mech_Fort_ABS01A"
  },
  [920] = {
    ModelId = 920,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Mech_Fort_HitS01A.SM_IP_Mech_Fort_HitS01A"
  },
  [921] = {
    ModelId = 921,
    SkeletonMeshPath = "Asset/Scene/EN002_Haiboliya/Binghucheng/BH_City/Mesh/SM_Ail_Rock01.SM_Ail_Rock01"
  },
  [922] = {
    ModelId = 922,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/Shouwei_Jaohui_SM.Shouwei_Jaohui_SM"
  },
  [923] = {
    ModelId = 923,
    SkeletonMeshPath = "Asset/Scene/EN001_Ailixian/Common/Porp/Tanceqi/Mesh/SM_Common_Tanceqi01.SM_Common_Tanceqi01"
  },
  [924] = {
    ModelId = 924,
    SkeletonMeshPath = "Asset/Scene/EN001_Ailixian/Common/Porp/Ailan_Car03/Mesh/Ailan_Car03_SM.Ailan_Car03_SM"
  },
  [925] = {
    ModelId = 925,
    SkeletonMeshPath = "Asset/Scene/common/Mesh/SM_Com_Ste02.SM_Com_Ste02"
  },
  [926] = {
    ModelId = 926,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Coll_Com_Flower01.SM_IP_Coll_Com_Flower01"
  },
  [927] = {
    ModelId = 927,
    SkeletonMeshPath = "Asset/Scene/EN001_Ailixian/Common/Mesh/SM_Common_Gear02.SM_Common_Gear02"
  },
  [928] = {
    ModelId = 928,
    SkeletonMeshPath = "Asset/Scene/common/BreakableItems/Mesh/Chest05_Vat_Mesh.Chest05_Vat_Mesh"
  },
  [929] = {
    ModelId = 929,
    SkeletonMeshPath = "Asset/Scene/common/BreakableItems/Mesh/Chest06_Vat_Mesh.Chest06_Vat_Mesh"
  },
  [930] = {
    ModelId = 930,
    SkeletonMeshPath = "Asset/Scene/common/BreakableItems/Mesh/Chest07_Vat_Mesh.Chest07_Vat_Mesh"
  },
  [931] = {
    ModelId = 931,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/IP_Com_Hay02A_SM.IP_Com_Hay02A_SM"
  },
  [932] = {
    ModelId = 932,
    ModelScale = 2.8383,
    SkeletonMeshPath = "Asset/Scene/EN002_Haiboliya/Binghucheng/BH_Home/Mesh/SM_Home_Forge03.SM_Home_Forge03"
  },
  [933] = {
    ModelId = 933,
    SkeletonMeshPath = "Asset/Scene/EN001_Ailixian/Jingjiedao/JJD_Village/Mesh/SM_Vil_Nos01.SM_Vil_Nos01"
  },
  [934] = {
    ModelId = 934,
    SkeletonMeshPath = "Asset/Scene/EN002_Haiboliya/Binghucheng/BH_City/Mesh/SM_Ail_Lamp07.SM_Ail_Lamp07"
  },
  [935] = {
    ModelId = 935,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Zhiyan/Mesh/JT_Zhiyan_SM.JT_Zhiyan_SM"
  },
  [936] = {
    ModelId = 936,
    SkeletonMeshPath = "Asset/Scene/EN002_Haiboliya/Binghucheng/BH_City/Mesh/SM_Ail_Han02.SM_Ail_Han02"
  },
  [937] = {
    ModelId = 937,
    SkeletonMeshPath = "Asset/Scene/EN002_Haiboliya/Binghucheng/BH_Thea/Mesh/SM_Thea_Mic01.SM_Thea_Mic01"
  },
  [938] = {
    ModelId = 938,
    SkeletonMeshPath = "Asset/Scene/EN002_Haiboliya/Binghucheng/BH_Home/Mesh/SM_Home_Gear01_06.SM_Home_Gear01_06"
  },
  [939] = {
    ModelId = 939,
    SkeletonMeshPath = "Asset/Scene/EN002_Haiboliya/Binghucheng/BH_Sew/Mesh/SM_Sew_Dev04A.SM_Sew_Dev04A"
  },
  [940] = {
    ModelId = 940,
    SkeletonMeshPath = "Asset/Scene/EN002_Haiboliya/Binghucheng/BH_Sew/Mesh/SM_Sew_Dev01E.SM_Sew_Dev01E"
  },
  [941] = {
    ModelId = 941,
    SkeletonMeshPath = "Asset/Scene/EN001_Ailixian/Common/Mesh/SM_Rock_10.SM_Rock_10"
  },
  [942] = {
    ModelId = 942,
    SkeletonMeshPath = "Asset/Scene/EN002_Haiboliya/Binghucheng/BH_City/Mesh/SM_Ail_Pho01.SM_Ail_Pho01"
  },
  [943] = {
    ModelId = 943,
    SkeletonMeshPath = "Asset/Scene/EN001_Ailixian/Common/Mesh/Mechanism/Cube.Cube"
  },
  [944] = {
    ModelId = 944,
    SkeletonMeshPath = "Asset/Scene/common/Mesh/SM_Com_Book01.SM_Com_Book01"
  },
  [945] = {
    ModelId = 945,
    SkeletonMeshPath = "Asset/Scene/EN002_Haiboliya/Binghucheng/BH_Home/Mesh/SM_Home_Pap07.SM_Home_Pap07"
  },
  [946] = {
    ModelId = 946,
    SkeletonMeshPath = "Asset/Scene/EN002_Haiboliya/Binghucheng/BH_Home/Mesh/SM_Home_Pap05.SM_Home_Pap05"
  },
  [947] = {
    ModelId = 947,
    ModelScale = 1.5,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Drop_BaiEmb01B.SM_IP_Drop_BaiEmb01B"
  },
  [948] = {
    ModelId = 948,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SV_IP_Chest_HX02.SV_IP_Chest_HX02"
  },
  [949] = {
    ModelId = 949,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SV_IP_Chest_HX03.SV_IP_Chest_HX03"
  },
  [950] = {
    ModelId = 950,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SV_IP_Chest_HX01.SV_IP_Chest_HX01"
  },
  [951] = {
    ModelId = 951,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_TreasureMap01.SM_IP_TreasureMap01"
  },
  [952] = {
    ModelId = 952,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_TreasureMap02.SM_IP_TreasureMap02"
  },
  [953] = {
    ModelId = 953,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_TreasureMap03.SM_IP_TreasureMap03"
  },
  [954] = {
    ModelId = 954,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_TreasureMap04.SM_IP_TreasureMap04"
  },
  [960] = {
    ModelId = 960,
    ModelScale = 1.2,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Com_Dev01.SM_IP_Com_Dev01"
  },
  [999] = {
    AssistSockets = T.RT_4,
    DamageFXSockets = T.RT_4,
    ModelId = 999,
    SkeletonMeshPath = "Asset/Scene/Layout/StaticCreatorMesh/TriggerMechanism_Mesh.TriggerMechanism_Mesh"
  },
  [1101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Heitao/ABP_Heitao_New.ABP_Heitao_New_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Heitao_",
    AvatarExpressionPrefix = "Heitao_",
    CloakMeshPath = "Asset/Char/Player/Char001_Heitao_J/Mesh/Heitao_Cloak_SM.Heitao_Cloak_SM",
    DamageFXSockets = T.RT_1,
    FootType = "heeledMid",
    HeadScale = 0.96,
    HitMontageRule = "RoleDefault",
    KawaiiIdList = T.RT_2,
    ModelId = 1101,
    MontageFolder = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/",
    MontagePrefix = "Heitao_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char001_Heitao_J/Mesh/Heitao_SM.Heitao_SM",
    StandId = "001",
    UnbindSocketOffset = T.RT_14,
    WeaponScale = 1
  },
  [1102] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Heitao/ABP_Heitao_New.ABP_Heitao_New_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Heitao_",
    DamageFXSockets = T.RT_1,
    FootType = "heeledMid",
    HeadScale = 0.96,
    HitMontageRule = "RoleDefault",
    ModelId = 1102,
    MontageFolder = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/",
    MontagePrefix = "Heitao_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char016_Fuluo/Mesh/Fuluo_SM.Fuluo_SM",
    StandId = "001",
    UnbindSocketOffset = T.RT_14,
    WeaponScale = 1
  },
  [1103] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Tuosi/ABP_Tuosi.ABP_Tuosi_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Tuosi_",
    BuffLightMeshPath = "/Game/Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi02B_Part03_SM.Tuosi02B_Part03_SM",
    CloakMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi01_Cloak_SM.Tuosi01_Cloak_SM",
    DamageFXSockets = T.RT_1,
    FootType = "bootHeavy",
    HitMontageRule = "RoleDefault",
    ModelId = 1103,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/",
    MontagePrefix = "Tuosi_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi01_SM.Tuosi01_SM",
    StandId = "001",
    WeaponScale = 1.14
  },
  [1201] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/WeitaF/ABP_WeitaF.ABP_WeitaF_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Nvzhu_",
    AvatarExpressionPrefix = "WeitaF_",
    CloakMeshPath = "Asset/Char/Player/NPC004_WeitaF/Mesh/WeitaF_Cloak_SM.WeitaF_Cloak_SM",
    DamageFXSockets = T.RT_1,
    FootType = "heeledMid",
    HeadScale = 0.95,
    HitMontageRule = "RoleDefault",
    ModelId = 1201,
    MontageFolder = "/Game/Asset/Char/Player/NPC004_WeitaF/Animation/Montage/",
    MontagePrefix = "WeitaF_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/NPC004_WeitaF/Mesh/WeitaF_SM.WeitaF_SM"
  },
  [1501] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Baonu/ABP_Baonu.ABP_Baonu_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Baonu_",
    BuffLightMeshPath = "/Game/Asset/Char/Player/Char007_Baonu/Mesh/Baonu_Part01_SM.Baonu_Part01_SM",
    DamageFXSockets = T.RT_1,
    FootType = "heeledLight",
    HitMontageRule = "RoleDefault",
    ModelId = 1501,
    MontageFolder = "/Game/Asset/Char/Player/Char007_Baonu/Animation/Montage/",
    MontagePrefix = "Baonu_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char007_Baonu/Mesh/Baonu_SM.Baonu_SM",
    StandId = "007",
    WeaponScale = 0.8
  },
  [1502] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Nifu/ABP_Nifu.ABP_Nifu_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Nifu_",
    BuffLightMeshPath = "/Game/Asset/Char/Player/Char031_Nifu/Mesh/Nifu_Part02_SM.Nifu_Part02_SM",
    DamageFXSockets = T.RT_1,
    FootType = "heeledHeavy",
    HitMontageRule = "RoleDefault",
    ModelId = 1502,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char031_Nifu/Animation/Montage/",
    MontagePrefix = "Nifu_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char031_Nifu/Mesh/Nifu_SM.Nifu_SM",
    StandId = "001",
    WeaponScale = 1.045
  },
  [1503] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Kezhou/ABP_Kezhou.ABP_Kezhou_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Kezhou_",
    AvatarExpressionPrefix = "Kezhou_",
    BuffLightMeshPath = "/Game/Asset/Char/Player/Char030_Kezhou/Mesh/Kezhou_Part05_SM.Kezhou_Part05_SM",
    CloakMeshPath = "Asset/Char/Player/Char030_Kezhou/Mesh/Kezhou_Cloak_SM.Kezhou_Cloak_SM",
    DamageFXSockets = T.RT_1,
    FootType = "bootHeavy",
    HitMontageRule = "RoleDefault",
    ModelId = 1503,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/",
    MontagePrefix = "Kezhou_",
    RunStopStartTime = 0.13,
    SkeletonMeshPath = "Asset/Char/Player/Char030_Kezhou/Mesh/Kezhou_SM.Kezhou_SM",
    StandId = "012",
    WeaponScale = 1.14
  },
  [1504] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Suyi/ABP_Suyi.ABP_Suyi_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Suyi_",
    DamageFXSockets = T.RT_1,
    FootType = "heeledMid",
    HeadScale = 0.98,
    HitMontageRule = "RoleDefault",
    ModelId = 1504,
    ModelTag = T.RT_17,
    MontageFolder = "/Game/Asset/Char/Player/Char032_Suyi/Animation/Montage/",
    MontagePrefix = "Suyi_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char032_Suyi/Mesh/Suyi_SM.Suyi_SM",
    StandId = "010",
    WeaponScale = 1
  },
  [1505] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Lizi/ABP_Lizi.ABP_Lizi_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Haier_",
    AvatarExpressionPrefix = "Haier_",
    DamageFXSockets = T.RT_1,
    FootType = "heeledHeavy",
    HeadScale = 0.9215,
    HitMontageRule = "RoleDefault",
    KawaiiIdList = T.RT_18,
    ModelId = 1505,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char006_Haier/Animation/Montage/",
    MontagePrefix = "Haier_",
    RunStopStartTime = 0.18,
    SkeletonMeshPath = "Asset/Char/Player/Char006_Haier/Mesh/Haier_SM.Haier_SM",
    StandId = "006",
    WeaponScale = 1.045
  },
  [1801] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Feina/ABP_Feina.ABP_Feina_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Feina_",
    AvatarExpressionPrefix = "Feina_",
    BuffLightMeshPath = "/Game/Asset/Char/Player/Char019_Feina/Mesh/Feina_Part02_SM.Feina_Part02_SM",
    DamageFXSockets = T.RT_1,
    FootType = "barefeetMid",
    HitMontageRule = "RoleDefault",
    ModelId = 1801,
    ModelScale = 0.9,
    MontageFolder = "/Game/Asset/Char/Player/Char019_Feina/Animation/Montage/",
    MontagePrefix = "Feina_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char019_Feina/Mesh/Feina_SM.Feina_SM",
    StandId = "001",
    WeaponScale = 0.9
  },
  [2101] = {
    AccessoryMeshPath = T.RT_20,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Shuimu/ABP_Shuimu.ABP_Shuimu_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Shuimu_",
    CloakMeshPath = "Asset/Char/Player/Char005_Shuimu/Mesh/Shuimu_Cloak_SM.Shuimu_Cloak_SM",
    DamageFXSockets = T.RT_1,
    FootType = "heeledMid",
    HeadScale = 0.931,
    HitMontageRule = "RoleDefault",
    KawaiiIdList = T.RT_21,
    ModelId = 2101,
    ModelScale = 0.9785,
    MontageFolder = "/Game/Asset/Char/Player/Char005_Shuimu/Animation/Montage/",
    MontagePrefix = "Shuimu_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char005_Shuimu/Mesh/Shuimu_SM.Shuimu_SM",
    StandId = "005",
    WeaponScale = 0.9785
  },
  [2301] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Zhangyu/ABP_ZhangYu.ABP_ZhangYu_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Zhangyu_",
    CloakMeshPath = "Asset/Char/Player/Char004_Zhangyu/Mesh/Zhangyu_Cloak_SM.Zhangyu_Cloak_SM",
    DamageFXSockets = T.RT_1,
    FootType = "heeledLight",
    HeadScale = 0.96,
    HitMontageRule = "RoleDefault",
    ModelId = 2301,
    MontageFolder = "/Game/Asset/Char/Player/Char004_Zhangyu/Animation/Montage/",
    MontagePrefix = "Zhangyu_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char004_Zhangyu/Mesh/Zhangyu_SM.Zhangyu_SM",
    StandId = "004",
    WeaponScale = 0.8
  },
  [2401] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Baiheng/ABP_Baiheng.ABP_Baiheng_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Baiheng_",
    BuffLightMeshPath = "/Game/Asset/Char/Player/Char015_Baiheng/Mesh/Baiheng_Part02_SM.Baiheng_Part02_SM",
    DamageFXSockets = T.RT_1,
    FootType = "heeledHeavy",
    HandScale = 0.855,
    HeadScale = 0.9595,
    HitMontageRule = "RoleDefault",
    ModelId = 2401,
    ModelScale = 0.95,
    ModelTag = T.RT_17,
    MontageFolder = "/Game/Asset/Char/Player/Char015_Baiheng/Animation/Montage/",
    MontagePrefix = "Baiheng_",
    RunStopStartTime = 0.18,
    SkeletonMeshPath = "Asset/Char/Player/Char015_Baiheng/Mesh/Baiheng_SM.Baiheng_SM",
    StandId = "004",
    WeaponScale = 1.045
  },
  [3101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Linen/ABP_Linen.ABP_Linen_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Linen_",
    DamageFXSockets = T.RT_1,
    FootType = "heeledHeavy",
    HandScale = 0.855,
    HitMontageRule = "RoleDefault",
    ModelId = 3101,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char011_Linen/Animation/Montage/",
    MontagePrefix = "Linen_",
    RunStopStartTime = 0.18,
    SkeletonMeshPath = "Asset/Char/Player/Char011_Linen/Mesh/Linen_SM.Linen_SM",
    StandId = "006",
    WeaponScale = 1.045
  },
  [3102] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Xier/ABP_Xier.ABP_Xier_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Xier_",
    DamageFXSockets = T.RT_1,
    FootType = "heeledHeavy",
    HandScale = 0.855,
    HeadScale = 1.0165,
    HitMontageRule = "RoleDefault",
    ModelId = 3102,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char023_Xier/Animation/Montage/",
    MontagePrefix = "Xier_",
    RunStopStartTime = 0.18,
    SkeletonMeshPath = "Asset/Char/Player/Char023_Xier/Mesh/Xier_SM.Xier_SM",
    StandId = "006",
    WeaponScale = 0.95
  },
  [3103] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Yeer/ABP_Yeer.ABP_Yeer_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Yeer_",
    DamageFXSockets = T.RT_1,
    FootType = "bootLight",
    HitMontageRule = "RoleDefault",
    ModelId = 3103,
    ModelScale = 0.85,
    MontageFolder = "/Game/Asset/Char/Player/Char017_Yeer/Animation/Montage/",
    MontagePrefix = "Yeer_",
    RunStopStartTime = 0.16,
    SkeletonMeshPath = "Asset/Char/Player/Char017_Yeer/Mesh/Yeer_SM.Yeer_SM",
    StandId = "007",
    WeaponScale = 0.85
  },
  [3201] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Haier/ABP_Haier.ABP_Haier_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Haier_",
    AvatarExpressionPrefix = "Haier_",
    CloakMeshPath = "Asset/Char/Player/Char006_Haier/Mesh/Haier_Cloak_SM.Haier_Cloak_SM",
    DamageFXSockets = T.RT_1,
    FootType = "heeledHeavy",
    HeadScale = 0.9215,
    HitMontageRule = "RoleDefault",
    KawaiiIdList = T.RT_18,
    ModelId = 3201,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char006_Haier/Animation/Montage/",
    MontagePrefix = "Haier_",
    RunStopStartTime = 0.18,
    SkeletonMeshPath = "Asset/Char/Player/Char006_Haier/Mesh/Haier_SM.Haier_SM",
    StandId = "006",
    WeaponScale = 1.045
  },
  [3202] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Kami/ABP_Kami.ABP_Kami_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Kami_",
    CloakMeshPath = "Asset/Char/Player/Char014_Kami/Mesh/Kami_Part04_SM.Kami_Part04_SM",
    DamageFXSockets = T.RT_1,
    FootType = "heeledHeavy",
    HandScale = 0.9,
    HitMontageRule = "RoleDefault",
    ModelId = 3202,
    MontageFolder = "/Game/Asset/Char/Player/Char014_Kami/Animation/Montage/",
    MontagePrefix = "Kami_",
    RunStopStartTime = 0.18,
    SkeletonMeshPath = "Asset/Char/Player/Char014_Kami/Mesh/Kami_SM.Kami_SM",
    StandId = "009",
    WeaponScale = 1.1
  },
  [3301] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Maer/ABP_Maer.ABP_Maer_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Maer_",
    CloakMeshPath = "Asset/Char/Player/Char024_Maer/Mesh/Maer_Part02_SM.Maer_Part02_SM",
    DamageFXSockets = T.RT_1,
    FootType = "heeledMid",
    HeadScale = 1.02,
    HitMontageRule = "RoleDefault",
    ModelId = 3301,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char024_Maer/Animation/Montage/",
    MontagePrefix = "Maer_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char024_Maer/Mesh/Maer_SM.Maer_SM",
    StandId = "006",
    WeaponScale = 0.95
  },
  [4101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Lise/ABP_Lise.ABP_Lise_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Lise_",
    AvatarExpressionPrefix = "Lise_",
    BuffLightMeshPath = "/Game/Asset/Char/Player/Char020_Lise/Mesh/Lise_Part02_SM.Lise_Part02_SM",
    CloakMeshPath = "Asset/Char/Player/Char020_Lise/Mesh/Lise_Cloak_SM.Lise_Cloak_SM",
    DamageFXSockets = T.RT_1,
    FootType = "heeledMid",
    HitMontageRule = "RoleDefault",
    ModelId = 4101,
    MontageFolder = "/Game/Asset/Char/Player/Char020_Lise/Animation/Montage/",
    MontagePrefix = "Lise_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char020_Lise/Mesh/Lise_SM.Lise_SM",
    StandId = "001",
    UnbindSocketOffset = T.RT_14
  },
  [4102] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Zhiliu/ABP_Zhiliu.ABP_Zhiliu_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Zhiliu_",
    AvatarExpressionPrefix = "Zhiliu_",
    CloakMeshPath = "Asset/Char/Player/Char029_Zhiliu/Mesh/Zhiliu_Cloak_SM.Zhiliu_Cloak_SM",
    DamageFXSockets = T.RT_1,
    FootType = "heeledHeavy",
    HandScale = 0.855,
    HitMontageRule = "RoleDefault",
    ModelId = 4102,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char029_Zhiliu/Animation/Montage/",
    MontagePrefix = "Zhiliu_",
    RunStopStartTime = 0.18,
    SkeletonMeshPath = "Asset/Char/Player/Char029_Zhiliu/Mesh/Zhiliu_SM.Zhiliu_SM",
    StandId = "006",
    WeaponScale = 1.045
  },
  [4201] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Yuming/ABP_Yuming.ABP_Yuming_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Yuming_",
    AvatarExpressionPrefix = "Yuming_",
    DamageFXSockets = T.RT_1,
    FootType = "bootHeavy",
    HitMontageRule = "RoleDefault",
    ModelId = 4201,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char008_Yuming/Animation/Montage/",
    MontagePrefix = "Yuming_",
    RunStopStartTime = 0.13,
    SkeletonMeshPath = "Asset/Char/Player/Char008_Yuming/Mesh/Yuming_SM.Yuming_SM",
    StandId = "008",
    WeaponScale = 1.14
  },
  [4202] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Landi/ABP_Landi.ABP_Landi_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Landi_",
    DamageFXSockets = T.RT_1,
    FootType = "bootHeavy",
    HitMontageRule = "RoleDefault",
    ModelId = 4202,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char012_Landi/Animation/Montage/",
    MontagePrefix = "Landi_",
    RunStopStartTime = 0.13,
    SkeletonMeshPath = "Asset/Char/Player/Char012_Landi/Mesh/Landi_SM.Landi_SM",
    StandId = "012",
    WeaponScale = 1.14
  },
  [4301] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Xibi/ABP_Xibi.ABP_Xibi_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Xibi_",
    AvatarExpressionPrefix = "Xibi_",
    DamageFXSockets = T.RT_1,
    FootType = "heeledHeavy",
    HandScale = 0.855,
    HitMontageRule = "RoleDefault",
    ModelId = 4301,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char009_Xibi/Animation/Montage/",
    MontagePrefix = "Xibi_",
    RunStopStartTime = 0.18,
    SkeletonMeshPath = "Asset/Char/Player/Char009_Xibi/Mesh/Xibi_SM.Xibi_SM",
    StandId = "009",
    WeaponScale = 1.045
  },
  [5101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Songlu/ABP_Songlu.ABP_Songlu_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Songlu_",
    AvatarExpressionPrefix = "Songlu_",
    BuffLightMeshPath = "/Game/Asset/Char/Player/Char021_Songlu/Mesh/Songlu_Part04_SM.Songlu_Part04_SM",
    DamageFXSockets = T.RT_1,
    FootType = "heeledLight",
    HeadScale = 0.98,
    HitMontageRule = "RoleDefault",
    ModelId = 5101,
    MontageFolder = "/Game/Asset/Char/Player/Char021_Songlu/Animation/Montage/",
    MontagePrefix = "Songlu_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char021_Songlu/Mesh/Songlu_SM.Songlu_SM",
    StandId = "007",
    WeaponScale = 0.8
  },
  [5102] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Aote/ABP_Aote.ABP_Aote_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Aote_",
    AvatarExpressionPrefix = "Aote_",
    CloakMeshPath = "Asset/Char/Player/Char018_Aote/Mesh/Aote_Cloak_SM.Aote_Cloak_SM",
    DamageFXSockets = T.RT_1,
    FootType = "bootHeavy",
    HitMontageRule = "RoleDefault",
    ModelId = 5102,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char018_Aote/Animation/Montage/",
    MontagePrefix = "Aote_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char018_Aote/Mesh/Aote_SM.Aote_SM",
    StandId = "001",
    WeaponScale = 1.14
  },
  [5301] = {
    AccessoryMeshPath = T.RT_46,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Saiqi/ABP_Saiqi.ABP_Saiqi_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Saiqi_",
    AvatarExpressionPrefix = "Saiqi_",
    DamageFXSockets = T.RT_1,
    FootType = "heeledMid",
    HeadScale = 0.98,
    HitMontageRule = "RoleDefault",
    ModelId = 5301,
    ModelTag = T.RT_17,
    MontageFolder = "/Game/Asset/Char/Player/Char010_Saiqi/Animation/Montage/",
    MontagePrefix = "Saiqi_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char010_Saiqi/Mesh/Saiqi_SM.Saiqi_SM",
    StandId = "010",
    WeaponScale = 1
  },
  [5401] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Dafu/ABP_Dafu.ABP_Dafu_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Dafu_",
    AvatarExpressionPrefix = "Dafu_",
    CloakMeshPath = "Asset/Char/Player/Char026_Dafu/Mesh/Dafu_Cloak_SM.Dafu_Cloak_SM",
    DamageFXSockets = T.RT_1,
    FootType = "heeledMid",
    HitMontageRule = "RoleDefault",
    ModelId = 5401,
    ModelScale = 0.893,
    MontageFolder = "/Game/Asset/Char/Player/Char026_Dafu/Animation/Montage/",
    MontagePrefix = "Dafu_",
    RunStopStartTime = 0.18,
    SkeletonMeshPath = "Asset/Char/Player/Char026_Dafu/Mesh/Dafu_SM.Dafu_SM",
    WeaponScale = 0.95
  },
  [9021] = {
    ModelId = 9021,
    SkeletonMeshPath = "Asset/Scene/EN003_EXPart/Fortress/Mesh/SM_Fort_Bric01"
  },
  [9031] = {
    ModelId = 9031,
    SkeletonMeshPath = "AssetDesign/Item/Door/BP_Yinbimen_Prologue"
  },
  [9032] = {
    ModelId = 9032,
    SkeletonMeshPath = "Asset/Scene/EN002_Imperial/Ailan/Mesh/SM_Sana_Door01A"
  },
  [9141] = {
    ModelId = 9141,
    SkeletonMeshPath = "Asset/Scene/EN001_Ailixian/Common/Mesh/SM_Kongzhitai_01.SM_Kongzhitai_01"
  },
  [9142] = {
    ModelId = 9142,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Mech_Sew_Mini01A.SM_IP_Mech_Sew_Mini01A"
  },
  [9143] = {
    ModelId = 9143,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Mech_Fort_Comp01A.SM_IP_Mech_Fort_Comp01A"
  },
  [9144] = {
    ModelId = 9144,
    SkeletonMeshPath = "Asset/Scene/EN002_Haiboliya/Binghucheng/BH_Home/Mesh/SM_Home_Forge05.SM_Home_Forge05"
  },
  [10001] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/ZhujueNpc/Nvzhu/ABP_Npc_Nvzhu.ABP_Npc_Nvzhu_C'",
    AssistSockets = T.RT_3,
    AudioPrefix = "Nvzhu_",
    AvatarExpressionPrefix = "Nvzhu_",
    CloakMeshPath = "Asset/Char/Player/NPC001_Nvzhu/Mesh/Nvzhu_Cloak_SM.Nvzhu_Cloak_SM",
    DamageFXSockets = T.RT_3,
    FootType = "barefeetMid",
    HeadScale = 0.95,
    HitMontageRule = "RoleDefault",
    ModelId = 10001,
    MontageFolder = "/Game/Asset/Char/Player/NPC001_Nvzhu/Animation/Montage/",
    MontagePrefix = "Nvzhu_",
    SkeletonMeshPath = "Asset/Char/Player/NPC001_Nvzhu/Mesh/Nvzhu_SM"
  },
  [10002] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/HeiTao/ABP_NPC_Heitao.ABP_NPC_Heitao_C'",
    AudioPrefix = "Heitao_",
    AvatarExpressionPrefix = "Heitao_",
    CloakMeshPath = "Asset/Char/Player/Char001_Heitao_J/Mesh/Heitao_Cloak_SM.Heitao_Cloak_SM",
    FootType = "heeledMid",
    HeadScale = 0.96,
    HitMontageRule = "RoleDefault",
    ModelId = 10002,
    MontageFolder = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/",
    MontagePrefix = "Heitao_",
    SkeletonMeshPath = "Asset/Char/Player/Char001_Heitao_J/Mesh/HeiTao_SM.HeiTao_SM"
  },
  [10003] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Xibi/ABP_NPC_Xibi.ABP_NPC_Xibi_C'",
    AudioPrefix = "Xibi_",
    AvatarExpressionPrefix = "Xibi_",
    FootType = "heeledHeavy",
    ModelId = 10003,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char009_Xibi/Animation/Montage/",
    MontagePrefix = "Xibi_",
    SkeletonMeshPath = "Asset/Char/Player/Char009_Xibi/Mesh/Xibi_SM.Xibi_SM"
  },
  [10004] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/ZhujueNpc/Nanzhu/ABP_NPC_Nanzhu.ABP_NPC_Nanzhu_C'",
    AssistSockets = T.RT_3,
    AudioPrefix = "Nanzhu_",
    AvatarExpressionPrefix = "Nanzhu_",
    CloakMeshPath = "Asset/Char/Player/NPC002_Nanzhu/Mesh/Nanzhu_Cloak_SM",
    DamageFXSockets = T.RT_3,
    FootType = "bootLight",
    HitMontageRule = "RoleDefault",
    ModelId = 10004,
    MontageFolder = "/Game/Asset/Char/Player/NPC002_Nanzhu/Animation/Montage/",
    MontagePrefix = "Nanzhu_",
    SkeletonMeshPath = "Asset/Char/Player/NPC002_Nanzhu/Mesh/Nanzhu_SM.Nanzhu_SM"
  },
  [10005] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Landi/ABP_NPC_Landi.ABP_NPC_Landi_C'",
    AudioPrefix = "Landi_",
    FootType = "bootHeavy",
    ModelId = 10005,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char012_Landi/Animation/Montage/",
    MontagePrefix = "Landi_",
    SkeletonMeshPath = "Asset/Char/Player/Char012_Landi/Mesh/Landi_SM"
  },
  [10006] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/BaiNpc/BaiTX/ABP_BaiTX.ABP_BaiTX_C'",
    AudioPrefix = "Npc_BaiTX_",
    AvatarExpressionPrefix = "Bai_",
    FootType = "heeledLight",
    HeadScale = 0.97,
    ModelId = 10006,
    MontageFolder = "/Game/Asset/Char/Npc/NPC_BaiTX/Animation/Montage/",
    MontagePrefix = "Npc_BaiTX_",
    SkeletonMeshPath = "Asset/Char/Npc/NPC_BaiTX/Mesh/NPC_BaiTX_SM.NPC_BaiTX_SM"
  },
  [10007] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Saiqi/ABP_NPC_Saiqi.ABP_NPC_Saiqi_C'",
    AudioPrefix = "Saiqi_",
    AvatarExpressionPrefix = "Saiqi_",
    FootType = "heeledMid",
    HeadScale = 0.98,
    ModelId = 10007,
    MontageFolder = "/Game/Asset/Char/Player/Char010_Saiqi/Animation/Montage/",
    MontagePrefix = "Saiqi_",
    SkeletonMeshPath = "Asset/Char/Player/Char010_Saiqi/Mesh/Saiqi_SM.Saiqi_SM"
  },
  [10008] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/ZhujueNpc/Weita_M/ABP_NPC_Weita_M.ABP_NPC_Weita_M_C'",
    AudioPrefix = "WeitaM_",
    AvatarExpressionPrefix = "WeitaM_",
    FootType = "bootHeavy",
    HeadScale = 0.98,
    ModelId = 10008,
    ModelScale = 1.02,
    MontageFolder = "/Game/Asset/Char/Player/NPC005_WeitaM/Animation/Montage/",
    MontagePrefix = "WeitaM_"
  },
  [10009] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Test/NervousWoman/ABP_NervousWoman.ABP_NervousWoman_C'",
    FootType = "heeledMid",
    ModelId = 10009,
    SkeletonMeshPath = "Asset/Char/Player/Char006_Haier/Mesh/Haier_SM.Haier_SM"
  },
  [10010] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Feena/ABP_NPC_Feina.ABP_NPC_Feina_C'",
    AudioPrefix = "Feina_",
    AvatarExpressionPrefix = "Feina_",
    FootType = "heeledLight",
    ModelId = 10010,
    ModelScale = 0.9,
    MontageFolder = "/Game/Asset/Char/Player/Char019_Feina/Animation/Montage/",
    MontagePrefix = "Feina_",
    SkeletonMeshPath = "Asset/Char/Player/Char019_Feina/Mesh/Feina_SM.Feina_SM"
  },
  [10011] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/BaiNpc/Bai_Duanzao_NPC200024/ABP_BaiDZ_NPC200024.ABP_BaiDZ_NPC200024_C'",
    AudioPrefix = "Npc_BaiDZ_",
    FootType = "heeledLight",
    ModelId = 10011,
    MontageFolder = "/Game/Asset/Char/Npc/NPC_BaiDZ/Animation/Montage/",
    MontagePrefix = "Npc_BaiDZ_",
    SkeletonMeshPath = "Asset/Char/Npc/NPC_BaiDZ/Mesh/NPC_BaiDZ_SM.NPC_BaiDZ_SM"
  },
  [10012] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Kamila/ABP_NPC_Kami.ABP_NPC_Kami_C'",
    AudioPrefix = "Kami_",
    CloakMeshPath = "Asset/Char/Player/Char014_Kami/Mesh/Kami_Part04_SM",
    FootType = "heeledHeavy",
    ModelId = 10012,
    MontageFolder = "/Game/Asset/Char/Player/Char014_Kami/Animation/Montage/",
    MontagePrefix = "Kami_",
    SkeletonMeshPath = "Asset/Char/Player/Char014_Kami/Mesh/Kami_SM.Kami_SM"
  },
  [10013] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/TalkMonster/ABP_NPC_JT_Pizhuo_Gun.ABP_NPC_JT_Pizhuo_Gun_C'",
    FootType = "bootHeavy",
    ModelId = 10013,
    ModelScale = 0.95,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Pizhuo/Mesh/JT_Pizhuo_SM.JT_Pizhuo_SM",
    WeaponScale = 0.95
  },
  [10014] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/TalkMonster/ABP_NPC_JT_Tuji.ABP_NPC_JT_Tuji_C'",
    FootType = "bootHeavy",
    ModelId = 10014,
    ModelScale = 0.95,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Tuji/Mesh/JT_Tuji_SM.JT_Tuji_SM"
  },
  [10015] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Test/Chapter01(LinShi)/ABP_LurenAoge.ABP_LurenAoge_C'",
    FootType = "bootHeavy",
    ModelId = 10015,
    SkeletonMeshPath = "Asset/Char/Player/Char008_Yuming/Mesh/Yuming_SM.Yuming_SM"
  },
  [10016] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Test/NervousOldMan/ABP_NervousOldMan.ABP_NervousOldMan_C'",
    ModelId = 10016,
    SkeletonMeshPath = "Asset/Char/Player/Char007_Baonu/Mesh/Baonu_SM.Baonu_SM"
  },
  [10017] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Test/EnLiKe/ABP_Enlike.ABP_Enlike_C'",
    AudioPrefix = "Landi_",
    FootType = "bootHeavy",
    ModelId = 10017,
    MontageFolder = "/Game/Asset/Char/Player/Char012_Landi/Animation/Montage/",
    MontagePrefix = "Landi_",
    SkeletonMeshPath = "Asset/Char/Player/Char012_Landi/Mesh/Landi_SM"
  },
  [10018] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Test/Chapter01(LinShi)/ABP_LurenAoge.ABP_LurenAoge_C'",
    FootType = "bootHeavy",
    ModelId = 10018,
    SkeletonMeshPath = "Asset/Char/Player/Char018_Aote/Mesh/Aote_SM.Aote_SM"
  },
  [10019] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/OutSide/ABP_NPC_Aote.ABP_NPC_Aote_C'",
    AudioPrefix = "Aote_",
    AvatarExpressionPrefix = "Aote_",
    FootType = "bootHeavy",
    ModelId = 10019,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char018_Aote/Animation/Montage/",
    MontagePrefix = "Aote_",
    SkeletonMeshPath = "Asset/Char/Player/Char018_Aote/Mesh/Aote_SM.Aote_SM"
  },
  [10020] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/TalkMonster/ABP_NPC_JT_Mid_M.ABP_NPC_JT_Mid_M_C'",
    AudioPrefix = "Kaiwen_",
    ModelId = 10020,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Monster/Common/Animation/Kaiwen/Montage/NPC_Inter/",
    MontagePrefix = "Kaiwen_"
  },
  [10021] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Test/Chapter01(LinShi)/ABP_LurenLandi.ABP_LurenLandi_C'",
    FootType = "bootHeavy",
    ModelId = 10021,
    SkeletonMeshPath = "Asset/Char/Player/Char012_Landi/Mesh/Landi_SM"
  },
  [10022] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Test/Boy/ABP_Boy.ABP_Boy_C'",
    ModelId = 10022,
    SkeletonMeshPath = "Asset/Char/Player/Char012_Landi/Mesh/Landi_SM"
  },
  [10023] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Linen/ABP_NPC_Linen.ABP_NPC_Linen_C'",
    AudioPrefix = "Linen_",
    AvatarExpressionPrefix = "Linen_",
    FootType = "heeledHeavy",
    ModelId = 10023,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char011_Linen/Animation/Montage/",
    MontagePrefix = "Linen_",
    SkeletonMeshPath = "Asset/Char/Player/Char011_Linen/Mesh/Linen_SM"
  },
  [10024] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Test/Body/ABP_NPC_Body.ABP_NPC_Body_C'",
    ModelId = 10024,
    SkeletonMeshPath = "Asset/Char/Npc/NPC_Jt_Shaonian/Mesh/Jt_Shaonian01_SM"
  },
  [10025] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Test/GloomyGirl/ABP_Npc_GloomyGirl.ABP_Npc_GloomyGirl_C'",
    FootType = "heeledMid",
    ModelId = 10025,
    SkeletonMeshPath = "Asset/Char/Player/Char006_Haier/Mesh/Haier_SM"
  },
  [10027] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/TalkMonster/Monster/Baotu/ABP_NPC_Baotu.ABP_NPC_Baotu_C'",
    AudioPrefix = "GR_Baotu_",
    AvatarExpressionPrefix = "Baotu_",
    ModelId = 10027,
    MontageFolder = "/Game/Asset/Char/Monster/GR_Baotu/Animation/Montage/",
    MontagePrefix = "GR_Baotu_",
    SkeletonMeshPath = "Asset/Char/Monster/GR_Baotu/Mesh/GR_Baotu_SM.GR_Baotu_SM"
  },
  [10028] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/TalkMonster/Monster/Baozhakuang/ABP_Baozhakuang.ABP_Baozhakuang_C'",
    AudioPrefix = "JT_Ranger_",
    FootType = "bootHeavy",
    ModelId = 10028,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Monster/JT_Ranger/Animation/Montage/",
    MontagePrefix = "JT_Ranger_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_Ranger/Mesh/JT_Ranger_SM"
  },
  [10029] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/TalkMonster/Monster/Qizhashi/ABP_Qizhashi.ABP_Qizhashi_C'",
    AudioPrefix = "JT_Ranger_",
    FootType = "bootHeavy",
    ModelId = 10029,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Monster/JT_Ranger/Animation/Montage/",
    MontagePrefix = "JT_Ranger_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_Ranger/Mesh/JT_Ranger_SM"
  },
  [10030] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/TalkMonster/Monster/Wanjujia/ABP_Wanjujia.ABP_Wanjujia_C'",
    AudioPrefix = "JT_Ranger_",
    FootType = "bootHeavy",
    ModelId = 10030,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Monster/JT_Ranger/Animation/Montage/",
    MontagePrefix = "JT_Ranger_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_Ranger/Mesh/JT_Ranger_SM"
  },
  [10031] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/BaiNpc/BaiTX/ABP_BaiTXConfident.ABP_BaiTXConfident_C'",
    AudioPrefix = "Npc_BaiTX_",
    FootType = "heeledLight",
    ModelId = 10031,
    MontageFolder = "/Game/Asset/Char/Npc/NPC_BaiTX/Animation/Montage/",
    MontagePrefix = "Npc_BaiTX_",
    SkeletonMeshPath = "Asset/Char/Npc/NPC_BaiTX/Mesh/NPC_BaiTX_SM.NPC_BaiTX_SM"
  },
  [10032] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Dafu/ABP_NPC_Dafu.ABP_NPC_Dafu_C'",
    AudioPrefix = "Dafu_",
    AvatarExpressionPrefix = "Dafu_",
    FootType = "heeledMid",
    HandScale = 0.9,
    ModelId = 10032,
    ModelScale = 0.94,
    MontageFolder = "/Game/Asset/Char/Player/Char026_Dafu/Animation/Montage/",
    MontagePrefix = "Dafu_",
    SkeletonMeshPath = "Asset/Char/Player/Char026_Dafu/Mesh/Dafu_SM.Dafu_SM"
  },
  [10033] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Awa/ABP_NPC_Awa.ABP_NPC_Awa_C'",
    AudioPrefix = "NPC_Awa_",
    AvatarExpressionPrefix = "Awa_",
    FootType = "bootHeavy",
    ModelId = 10033,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Npc/Npc_Awa/Animation/Montage/",
    MontagePrefix = "NPC_Awa_",
    SkeletonMeshPath = "Asset/Char/Npc/Npc_Awa/Mesh/Npc_Awa_SM"
  },
  [10034] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Fuer/ABP_NPC_Fuer.ABP_NPC_Fuer_C'",
    AudioPrefix = "Fuer_",
    FootType = "heeledLight",
    ModelId = 10034,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Npc/Npc_Fuer/Animation/Montage/",
    MontagePrefix = "Fuer_",
    SkeletonMeshPath = "Asset/Char/Npc/Npc_Fuer/Mesh/Npc_Fuer_SM"
  },
  [10035] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Falu/ABP_NPC_Falu.ABP_NPC_Falu_C'",
    AudioPrefix = "Falu_",
    FootType = "heeledMid",
    ModelId = 10035,
    MontageFolder = "/Game/Asset/Char/Npc/Npc_Falu/Animation/Montage/",
    MontagePrefix = "Falu_",
    SkeletonMeshPath = "Asset/Char/Npc/Npc_Falu/Mesh/Npc_Falu_SM"
  },
  [10036] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Kajia/ABP_NPC_Kajia.ABP_NPC_Kajia_C'",
    AudioPrefix = "Kajia_",
    AvatarExpressionPrefix = "KaJia_",
    FootType = "heeledMid",
    ModelId = 10036,
    MontageFolder = "/Game/Asset/Char/Player/Char028_Kajia/Animation/Montage/",
    MontagePrefix = "Kajia_",
    SkeletonMeshPath = "Asset/Char/Player/Char028_Kajia/Mesh/Kajia01_SM"
  },
  [10037] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Weiji/ABP_NPC_Weiji.ABP_NPC_Weiji_C'",
    AudioPrefix = "Weiji_",
    FootType = "bootMid",
    ModelId = 10037,
    MontageFolder = "/Game/Asset/Char/Npc/Npc_Weiji/Animation/Montage/",
    MontagePrefix = "Weiji_",
    SkeletonMeshPath = "Asset/Char/Npc/Npc_Weiji/Mesh/Npc_Weiji_SM"
  },
  [10038] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/ZhujueNpc/Weita_M/ABP_NPC_Weita_M.ABP_NPC_Weita_M_C'",
    AudioPrefix = "WeitaM_",
    AvatarExpressionPrefix = "WeitaM_",
    CloakMeshPath = "Asset/Char/Player/NPC005_WeitaM/Mesh/WeitaM_Cloak_SM",
    FootType = "heeledLight",
    HeadScale = 0.98,
    ModelId = 10038,
    ModelScale = 1.02,
    MontageFolder = "/Game/Asset/Char/Player/NPC005_WeitaM/Animation/Montage/",
    MontagePrefix = "WeitaM_",
    SkeletonMeshPath = "Asset/Char/Player/NPC005_WeitaM/Mesh/WeitaM_SM"
  },
  [10039] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Haier/ABP_NPC_Haier.ABP_NPC_Haier_C'",
    AudioPrefix = "Haier_",
    CloakMeshPath = "Asset/Char/Player/Char006_Haier/Mesh/Haier_Cloak_SM.Haier_Cloak_SM",
    FootType = "heeledHeavy",
    HeadScale = 0.8754,
    ModelId = 10039,
    ModelScale = 0.95,
    ModelTag = T.RT_5,
    MontageFolder = "/Game/Asset/Char/Player/Char006_Haier/Animation/Montage/",
    MontagePrefix = "Haier_",
    SkeletonMeshPath = "Asset/Char/Player/Char006_Haier/Mesh/Haier_SM.Haier_SM"
  },
  [10040] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Kajia2/ABP_NPC_Kajia2.ABP_NPC_Kajia2_C'",
    AudioPrefix = "Kajia_",
    AvatarExpressionPrefix = "Kajia02_",
    FootType = "heeledMid",
    ModelId = 10040,
    MontageFolder = "/Game/Asset/Char/Npc/NPC_Kajia02/Animation/Montage/",
    MontagePrefix = "Kajia02_",
    SkeletonMeshPath = "Asset/Char/Player/Char028_Kajia/Mesh/Kajia02_SM"
  },
  [10041] = {
    AudioPrefix = "Saiqi_",
    FootType = "heeledMid",
    ModelId = 10041,
    MontageFolder = "/Game/Asset/Char/Player/Char010_Saiqi/Animation/Montage/",
    MontagePrefix = "Saiqi_"
  },
  [10042] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Saiqi/ABP_NPC_saiqiboss2.ABP_NPC_saiqiboss2_C'",
    AudioPrefix = "BossSaiqi_",
    ModelId = 10042,
    MontageFolder = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/",
    MontagePrefix = "BossSaiqi_",
    SkeletonMeshPath = "Asset/Char/Monster/Boss01_Saiqi01/Mesh/BossSaiqi_SM.BossSaiqi_SM"
  },
  [10043] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Lise/ABP_NPC_Lise.ABP_NPC_Lise_C'",
    AudioPrefix = "Lise_",
    CloakMeshPath = "Asset/Char/Player/Char020_Lise/Mesh/Lise_Cloak_SM.Lise_Cloak_SM",
    ModelId = 10043,
    MontageFolder = "/Game/Asset/Char/Player/Char020_Lise/Animation/Montage/",
    MontagePrefix = "Lise_",
    SkeletonMeshPath = "Asset/Char/Player/Char020_Lise/Mesh/Lise_SM.Lise_SM"
  },
  [10044] = {
    ModelId = 10044,
    SkeletonMeshPath = "Asset/Scene/common/Mesh/SM_Com_Bag02.SM_Com_Bag02"
  },
  [10045] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Maerjie/ABP_NPC_Maer.ABP_NPC_Maer_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Maer_",
    AvatarExpressionPrefix = "Maer_",
    CloakMeshPath = "Asset/Char/Player/Char024_Maer/Mesh/Maer_Part02_SM.Maer_Part02_SM",
    DamageFXSockets = T.RT_1,
    FootType = "heeledMid",
    HeadScale = 1.02,
    HitMontageRule = "RoleDefault",
    ModelId = 10045,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char024_Maer/Animation/Montage/",
    MontagePrefix = "Maer_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char024_Maer/Mesh/Maer_SM.Maer_SM",
    StandId = "006"
  },
  [10046] = {
    ModelId = 10046,
    SkeletonMeshPath = "Asset/Scene/EN002_Haiboliya/Binghucheng/BH_Home/Mesh/SM_Home_Box01.SM_Home_Box01"
  },
  [10047] = {
    ModelId = 10047,
    SkeletonMeshPath = "Asset/Scene/EN002_Haiboliya/Binghucheng/BH_Home/Mesh/Prop/Bar_Canju03_candao_SM.Bar_Canju03_candao_SM"
  },
  [10048] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Enlike/ABP_NPC_Enlike.ABP_NPC_Enlike_C'",
    AudioPrefix = "Enli_",
    ModelId = 10048,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Npc/NPC_Enli/Animation/Montage/",
    MontagePrefix = "Enli_",
    SkeletonMeshPath = "Asset/Char/Npc/NPC_Enli/Mesh/NPC_Enli_SM.NPC_Enli_SM"
  },
  [10050] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/ZhujueNpc/Weita_M/ABP_NPC_Weita_M.ABP_NPC_Weita_M_C'",
    AudioPrefix = "WeitaM_",
    CloakMeshPath = "Asset/Char/Player/Char026_Dafu/Mesh/Dafu_Cloak_SM",
    FootType = "heeledLight",
    HandScale = 0.9,
    ModelId = 10050,
    ModelScale = 0.94,
    MontageFolder = "/Game/Asset/Char/Player/NPC005_WeitaM/Animation/Montage/",
    MontagePrefix = "WeitaM_",
    SkeletonMeshPath = "Asset/Char/Npc/NPC_Dafu/Mesh/Dafu_SM"
  },
  [10051] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/NPC_JT_Mec/ABP_NPC_JTMec01.ABP_NPC_JTMec01_C'",
    AudioPrefix = "NPC_JTMec01_",
    ModelId = 10051,
    ModelScale = 0.5,
    MontageFolder = "/Game/Asset/Char/Npc/NPC_JT_Mec/Animation/Montage/",
    MontagePrefix = "NPC_JTMec01_",
    SkeletonMeshPath = "Asset/Char/Npc/NPC_JT_Mec/Mesh/NPC_JT_Mec01_SM"
  },
  [10052] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Zhiliu/ABP_NPC_Zhiliu.ABP_NPC_Zhiliu_C'",
    AudioPrefix = "Zhiliu_",
    AvatarExpressionPrefix = "Zhiliu_",
    CloakMeshPath = "Asset/Char/Player/Char029_Zhiliu/Mesh/Zhiliu_Cloak_SM",
    FootType = "heeledHeavy",
    ModelId = 10052,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char029_Zhiliu/Animation/Montage/",
    MontagePrefix = "Zhiliu_",
    SkeletonMeshPath = "Asset/Char/Player/Char029_Zhiliu/Mesh/Zhiliu_SM"
  },
  [10053] = {
    AudioPrefix = "Heitao_",
    ModelId = 10053,
    MontageFolder = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/",
    MontagePrefix = "Heitao_"
  },
  [10054] = {
    AudioPrefix = "Saiqi_",
    ModelId = 10054,
    MontageFolder = "/Game/Asset/Char/Player/Char010_Saiqi/Animation/Montage/",
    MontagePrefix = "Saiqi_"
  },
  [10055] = {
    AudioPrefix = "Npc_BaiTX_",
    ModelId = 10055,
    MontageFolder = "/Game/Asset/Char/Npc/NPC_BaiTX/Animation/Montage/",
    MontagePrefix = "Npc_BaiTX_"
  },
  [10056] = {
    AudioPrefix = "Kami_",
    ModelId = 10056,
    MontageFolder = "/Game/Asset/Char/Player/Char014_Kami/Animation/Montage/",
    MontagePrefix = "Kami_"
  },
  [10057] = {
    AudioPrefix = "Baiheng_",
    ModelId = 10057,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char015_Baiheng/Animation/Montage/",
    MontagePrefix = "Baiheng_"
  },
  [10058] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/ZhujueNpc/Weita_F/ABP_NPC_Weita_F.ABP_NPC_Weita_F_C'",
    AudioPrefix = "WeitaF_",
    FootType = "bootHeavy",
    HeadScale = 0.98,
    ModelId = 10058,
    ModelScale = 1.02,
    MontageFolder = "/Game/Asset/Char/Player/NPC004_WeitaF/Animation/Montage/",
    MontagePrefix = "WeitaF_"
  },
  [10059] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/ZhujueNpc/Weita_F/ABP_NPC_Weita_F.ABP_NPC_Weita_F_C'",
    AudioPrefix = "WeitaF_",
    AvatarExpressionPrefix = "WeitaF_",
    CloakMeshPath = "Asset/Char/Player/NPC004_WeitaF/Mesh/WeitaF_Cloak_SM",
    FootType = "heeledLight",
    HeadScale = 0.98,
    ModelId = 10059,
    ModelScale = 1.02,
    MontageFolder = "/Game/Asset/Char/Player/NPC004_WeitaF/Animation/Montage/",
    MontagePrefix = "WeitaF_",
    SkeletonMeshPath = "Asset/Char/Player/NPC004_WeitaF/Mesh/WeitaF_SM"
  },
  [10060] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Songlu01/ABP_NPC_Songlu01.ABP_NPC_Songlu01_C'",
    AudioPrefix = "Songlu_",
    FootType = "heeledLight",
    HeadScale = 0.98,
    IsSkinModel = true,
    ModelId = 10060,
    MontageFolder = "/Game/Asset/Char/Player/Char099_Songlu01/Animation/Montage/",
    MontagePrefix = "Songlu_",
    SkeletonMeshPath = "Asset/Char/Player/Char099_Songlu01/Mesh/Songlu_SP01_SM"
  },
  [10061] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Saiqi01/ABP_NPC_Saiqi01.ABP_NPC_Saiqi01_C'",
    AudioPrefix = "Saiqi_",
    FootType = "heeledMid",
    HeadScale = 0.98,
    IsSkinModel = true,
    ModelId = 10061,
    MontageFolder = "/Game/Asset/Char/Player/Char098_Saiqi01/Animation/Montage/",
    MontagePrefix = "Saiqi_",
    SkeletonMeshPath = "Asset/Char/Player/Char098_Saiqi01/Mesh/Saiqi_SP01_SM"
  },
  [10062] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Shuimu01/ABP_NPC_Shuimu01.ABP_NPC_Shuimu01_C'",
    AudioPrefix = "Shuimu_",
    FootType = "heeledMid",
    HeadScale = 0.98,
    IsSkinModel = true,
    ModelId = 10062,
    ModelScale = 0.9785,
    MontageFolder = "/Game/Asset/Char/Player/Char097_Shuimu01/Animation/Montage/",
    MontagePrefix = "Shuimu_",
    SkeletonMeshPath = "Asset/Char/Player/Char097_Shuimu01/Mesh/Shuimu_SP01_SM"
  },
  [10063] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Tuosi/ABP_NPC_Tuosi02.ABP_NPC_Tuosi02_C'",
    AudioPrefix = "Tuosi02_",
    AvatarExpressionPrefix = "Tuosi02_",
    CloakMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi02B_Part01_SM.Tuosi02B_Part01_SM",
    FootType = "bootHeavy",
    ModelId = 10063,
    MontageFolder = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/",
    MontagePrefix = "Tuosi02_",
    OverrideMaterialParam = T.RT_7,
    SkeletonMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi02B_SM.Tuosi02B_SM"
  },
  [10064] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Tuosi/ABP_NPC_Tuosi02.ABP_NPC_Tuosi02_C'",
    AudioPrefix = "Tuosi02_",
    AvatarExpressionPrefix = "Bulu_",
    CloakMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi02B_Part01_SM.Tuosi02B_Part01_SM",
    FootType = "bootHeavy",
    ModelId = 10064,
    MontageFolder = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/",
    MontagePrefix = "Tuosi02_",
    OverrideMaterialParam = T.RT_9,
    SkeletonMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi02B_SM.Tuosi02B_SM"
  },
  [10065] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/BaiNpc/Bai_Duanzao_NPC200228/ABP_BaiDZ_NPC200228.ABP_BaiDZ_NPC200228_C'",
    AudioPrefix = "Npc_BaiDZ_",
    FootType = "heeledLight",
    ModelId = 10065,
    MontageFolder = "/Game/Asset/Char/Npc/NPC_BaiDZ/Animation/Montage/",
    MontagePrefix = "Npc_BaiDZ_",
    SkeletonMeshPath = "Asset/Char/Npc/NPC_BaiDZ/Mesh/NPC_BaiDZ_SM.NPC_BaiDZ_SM"
  },
  [10066] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Lise/ABP_NPC_LiseY.ABP_NPC_LiseY_C'",
    AudioPrefix = "LiseY_",
    ModelId = 10066,
    MontageFolder = "/Game/Asset/Char/Npc/Npc_LiseY/Animation/Montage/",
    MontagePrefix = "LiseY_",
    SkeletonMeshPath = "Asset/Char/Npc/Npc_LiseY/Mesh/Npc_LiseY_SM"
  },
  [10067] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Tuosi/ABP_NPC_BuluY.ABP_NPC_BuluY_C'",
    AudioPrefix = "BulusiY_",
    ModelId = 10067,
    MontageFolder = "/Game/Asset/Char/Npc/Npc_BulusiY/Animation/Montage/",
    MontagePrefix = "BulusiY_",
    SkeletonMeshPath = "Asset/Char/Npc/Npc_BulusiY/Mesh/Npc_BulusiY_SM"
  },
  [10068] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Tuosi/ABP_NPC_BuluQ.ABP_NPC_BuluQ_C'",
    AudioPrefix = "BulusiQ_",
    ModelId = 10068,
    MontageFolder = "/Game/Asset/Char/Npc/Npc_BulusiQ/Animation/Montage/",
    MontagePrefix = "BulusiQ_",
    SkeletonMeshPath = "Asset/Char/Npc/Npc_BulusiQ/Mesh/Npc_BulusiQ_SM"
  },
  [10069] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/TalkMonster/ABP_NPC_JT_Zhihui.ABP_NPC_JT_Zhihui_C'",
    AudioPrefix = "JT_Mid_M_",
    ModelId = 10069,
    MontageFolder = "/Game/Asset/Char/Monster/JT_Zhihui/Animation/Montage/NPC_Inter/",
    MontagePrefix = "JT_Zhihui_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_Zhihui/Mesh/JT_Zhihui_SM"
  },
  [10070] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/TalkMonster/ABP_NPC_JT_Zhijian.ABP_NPC_JT_Zhijian_C'",
    AudioPrefix = "JT_Mid_M_",
    ModelId = 10070,
    MontageFolder = "/Game/Asset/Char/Monster/Common/Animation/JT_Mid_M/Montage/NPC_Inter/",
    MontagePrefix = "JT_Mid_M_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_Zhijian/Mesh/JT_Zhijian_SM.JT_Zhijian_SM"
  },
  [10071] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Tuosi/ABP_NPC_Tuosi02.ABP_NPC_Tuosi02_C'",
    AudioPrefix = "Tuosi02_",
    CloakMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi02B_Part01_SM.Tuosi02B_Part01_SM",
    ModelId = 10071,
    MontageFolder = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/",
    MontagePrefix = "Tuosi02_",
    OverrideMaterialParam = T.RT_10,
    SkeletonMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi02B_SM.Tuosi02B_SM"
  },
  [10072] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/TalkMonster/Monster/Qizhashi/ABP_Qizhashi.ABP_Qizhashi_C'",
    AudioPrefix = "SQ_Mid_F_",
    ModelId = 10072,
    MontageFolder = "/Game/Asset/Char/Monster/Common/Animation/SQ_Mid_F/Montage/",
    MontagePrefix = "SQ_Mid_F_",
    SkeletonMeshPath = "Asset/Char/Monster/SQ_Qizha/Mesh/SQ_Qizha_SM.SQ_Qizha_SM"
  },
  [10073] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Lise/ABP_NPC_Lise_Sit.ABP_NPC_Lise_Sit_C'",
    AudioPrefix = "Lise_",
    CloakMeshPath = "Asset/Char/Player/Char020_Lise/Mesh/Lise_Cloak_SM.Lise_Cloak_SM",
    ModelId = 10073,
    MontageFolder = "/Game/Asset/Char/Player/Char020_Lise/Animation/Montage/",
    MontagePrefix = "Lise_",
    SkeletonMeshPath = "Asset/Char/Player/Char020_Lise/Mesh/Lise_SM.Lise_SM"
  },
  [10074] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Tuosi/ABP_NPC_Tuosi02.ABP_NPC_Tuosi02_C'",
    AudioPrefix = "Tuosi02_",
    AvatarExpressionPrefix = "BuluW_",
    CloakMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi02B_Part01_SM.Tuosi02B_Part01_SM",
    FootType = "bootHeavy",
    ModelId = 10074,
    MontageFolder = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/",
    MontagePrefix = "Tuosi02_",
    OverrideMaterialParam = T.RT_10,
    SkeletonMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi02B_SM.Tuosi02B_SM"
  },
  [10075] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Lise/ABP_NPC_Lise_Sit_2.ABP_NPC_Lise_Sit_2_C'",
    AudioPrefix = "Lise_",
    CloakMeshPath = "Asset/Char/Player/Char020_Lise/Mesh/Lise_Cloak_SM.Lise_Cloak_SM",
    ModelId = 10075,
    MontageFolder = "/Game/Asset/Char/Player/Char020_Lise/Animation/Montage/",
    MontagePrefix = "Lise_",
    SkeletonMeshPath = "Asset/Char/Player/Char020_Lise/Mesh/Lise_SM.Lise_SM"
  },
  [10076] = {
    AccessoryMeshPath = T.RT_11,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Tuosi/ABP_NPC_Tuosi01.ABP_NPC_Tuosi01_C'",
    AudioPrefix = "Tuosi_",
    CloakMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi01_Cloak_SM.Tuosi01_Cloak_SM",
    FootType = "bootHeavy",
    ModelId = 10076,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/",
    MontagePrefix = "Tuosi_",
    SkeletonMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi01_SM.Tuosi01_SM"
  },
  [10077] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Animal/ABP_NPC_Feina01.ABP_NPC_Feina01_C'",
    ModelId = 10077,
    SkeletonMeshPath = "Asset/Char/Player/Char019_Feina/Mesh/Feina_Sum01_SM"
  },
  [10078] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Animal/ABP_NPC_Feina02.ABP_NPC_Feina02_C'",
    ModelId = 10078,
    SkeletonMeshPath = "Asset/Char/Player/Char019_Feina/Mesh/Feina_Sum02_SM"
  },
  [10079] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Animal/ABP_NPC_Feina03.ABP_NPC_Feina03_C'",
    ModelId = 10079,
    SkeletonMeshPath = "Asset/Char/Player/Char019_Feina/Mesh/Feina_Sum03_SM"
  },
  [10080] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Animal/ABP_NPC_Feina04.ABP_NPC_Feina04_C'",
    ModelId = 10080,
    SkeletonMeshPath = "Asset/Char/Player/Char019_Feina/Mesh/Feina_Sum04_SM"
  },
  [10081] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Animal/ABP_NPC_Part.ABP_NPC_Part_C'",
    ModelId = 10081,
    SkeletonMeshPath = "Asset/Char/Player/Char019_Feina/Mesh/Feina_Part01_SM"
  },
  [10082] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/TalkMonster/Monster/Jichong/ABP_NPC_Jichong.ABP_NPC_Jichong_C'",
    AudioPrefix = "GR_Jichong_",
    ModelId = 10082,
    MontageFolder = "/Game/Asset/Char/Monster/GR_Jichong/Animation/Montage/",
    MontagePrefix = "GR_Jichong_",
    SkeletonMeshPath = "Asset/Char/Monster/GR_Jichong/Mesh/GR_Jichong_SM.GR_Jichong_SM"
  },
  [10083] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Tuosi/ABP_NPC_Tuosi01.ABP_NPC_Tuosi01_C'",
    AudioPrefix = "Tuosi_",
    CloakMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi01_Cloak_SM",
    FootType = "bootHeavy",
    ModelId = 10083,
    ModelScale = 0.95,
    ModelTag = T.RT_12,
    MontageFolder = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/",
    MontagePrefix = "Tuosi_",
    SkeletonMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi01_SM.Tuosi01_SM"
  },
  [30001] = {ModelId = 30001},
  [30002] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Custom/Base/ABP_LNM_Custom.ABP_LNM_Custom_C'",
    AudioPrefix = "Npc_Laonian_M_",
    CMNPCDefaultSpeakOral = "AnimMontage'/Game/Asset/Char/Npc/Npc_Custom/CMNPCSpeakOral/NPC_Custom_Speak_Talk01_Montage.NPC_Custom_Speak_Talk01_Montage'",
    ModelId = 30002,
    MontageFolder = "/Game/Asset/Char/Npc/Npc_Custom/CM_Laonian/Animation/Montage/",
    MontagePrefix = "Npc_Laonian_M_"
  },
  [30003] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Custom/Base/ABP_LNF_Custom.ABP_LNF_Custom_C'",
    AudioPrefix = "Npc_Laonian_F_",
    FootType = "heeledMid",
    ModelId = 30003,
    ModelScale = 0.98,
    MontageFolder = "/Game/Asset/Char/Npc/Npc_Custom/CM_Laonian/Animation/Montage/",
    MontagePrefix = "Npc_Laonian_F_"
  },
  [30004] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Custom/Base/ABP_ZNM_Custom.ABP_ZNM_Custom_C'",
    AudioPrefix = "Npc_Zhongnian_M_",
    CMNPCDefaultSpeakOral = "AnimMontage'/Game/Asset/Char/Npc/Npc_Custom/CMNPCSpeakOral/NPC_Custom_Speak_Talk01_Montage.NPC_Custom_Speak_Talk01_Montage'",
    FootType = "bootHeavy",
    ModelId = 30004,
    ModelScale = 0.915,
    MontageFolder = "/Game/Asset/Char/Npc/Npc_Custom/CM_Zhongnian/Animation/Montage/",
    MontagePrefix = "Npc_Zhongnian_M_"
  },
  [30005] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Custom/Base/ABP_ZNF_Custom.ABP_ZNF_Custom_C'",
    AudioPrefix = "Npc_Zhongnian_F_",
    CMNPCDefaultSpeakOral = "AnimMontage'/Game/Asset/Char/Npc/Npc_Custom/CMNPCSpeakOral/NPC_Custom_Speak_Talk01_Montage.NPC_Custom_Speak_Talk01_Montage'",
    FootType = "heeledMid",
    ModelId = 30005,
    ModelScale = 0.93,
    MontageFolder = "/Game/Asset/Char/Npc/Npc_Custom/CM_Zhongnian/Animation/Montage/",
    MontagePrefix = "Npc_Zhongnian_F_"
  },
  [30006] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Custom/Base/ABP_QNM_Custom.ABP_QNM_Custom_C'",
    AudioPrefix = "Npc_Qingnian_M_",
    CMNPCDefaultSpeakOral = "AnimMontage'/Game/Asset/Char/Npc/Npc_Custom/CMNPCSpeakOral/NPC_Custom_Speak_Talk01_Montage.NPC_Custom_Speak_Talk01_Montage'",
    FootType = "bootHeavy",
    ModelId = 30006,
    MontageFolder = "/Game/Asset/Char/Npc/Npc_Custom/CM_Qingnian/Animation/Montage/",
    MontagePrefix = "Npc_Qingnian_M_"
  },
  [30007] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Custom/Base/ABP_QNF_Custom.ABP_QNF_Custom_C'",
    AudioPrefix = "Npc_Qingnian_F_",
    CMNPCDefaultSpeakOral = "AnimMontage'/Game/Asset/Char/Npc/Npc_Custom/CMNPCSpeakOral/NPC_Custom_Speak_Talk01_Montage.NPC_Custom_Speak_Talk01_Montage'",
    FootType = "heeledMid",
    ModelId = 30007,
    MontageFolder = "/Game/Asset/Char/Npc/Npc_Custom/CM_Qingnian/Animation/Montage/",
    MontagePrefix = "Npc_Qingnian_F_"
  },
  [30008] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Custom/Base/ABP_YN_Custom.ABP_YN_Custom_C'",
    AudioPrefix = "Npc_Younian_",
    ModelId = 30008,
    MontageFacePrefix = "Npc_Younian_M_",
    MontageFolder = "/Game/Asset/Char/Npc/Npc_Custom/CM_Younian/Animation/Montage/",
    MontagePrefix = "Npc_Younian_"
  },
  [30009] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Custom/Base/ABP_YN_Custom.ABP_YN_Custom_C'",
    AudioPrefix = "Npc_Younian_",
    FootType = "heeledLight",
    ModelId = 30009,
    MontageFacePrefix = "Npc_Younian_F_",
    MontageFolder = "/Game/Asset/Char/Npc/Npc_Custom/CM_Younian/Animation/Montage/",
    MontagePrefix = "Npc_Younian_"
  },
  [30010] = {
    ModelId = 30010,
    SkeletonMeshPath = "Asset/Char/Npc/NPC_BaiDD/Mesh/NPC_BaiDD_SM.NPC_BaiDD_SM"
  },
  [30011] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/TalkMonster/ABP_NPC_JT_Pizhuo_BattlePose.ABP_NPC_JT_Pizhuo_BattlePose_C'",
    AudioPrefix = "JT_Mid_M_",
    AvatarExpressionPrefix = "Shibing01_",
    FootType = "bootHeavy",
    ModelId = 30011,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Monster/Common/Animation/JT_Mid_M/Montage/NPC_Inter/",
    MontagePrefix = "JT_Mid_M_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_Pizhuo/Mesh/JT_Pizhuo_SM.JT_Pizhuo_SM"
  },
  [30012] = {
    AudioPrefix = "JT_Mid_M_",
    AvatarExpressionPrefix = "Shibing01_",
    ModelId = 30012,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Monster/Common/Animation/JT_Mid_M/Montage/NPC_Inter/",
    MontagePrefix = "JT_Mid_M_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_Pizhuo/Mesh/Jt_Pizhuo_SM"
  },
  [30013] = {
    AudioPrefix = "JT_Mid_F_",
    ModelId = 30013,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Monster/Common/Animation/JT_Mid_F/Montage/NPC_Inter/",
    MontagePrefix = "JT_Mid_F_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_Juji/Mesh/JT_Juji_SM"
  },
  [30014] = {
    AudioPrefix = "JT_Zhihui_",
    ModelId = 30014,
    MontageFolder = "/Game/Asset/Char/Monster/JT_Zhihui/Animation/Montage/NPC_Inter/",
    MontagePrefix = "JT_Zhihui_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_Zhihui/Mesh/JT_Zhihui_SM"
  },
  [30015] = {
    ModelId = 30015,
    SkeletonMeshPath = "Asset/Char/Npc/Animal/Animal01_Cat/Mesh/Npc_Cat01A_SM"
  },
  [30016] = {
    AudioPrefix = "Npc_Cat01_",
    ModelId = 30016,
    MontageFolder = "/Game/Asset/Char/Npc/Animal/Animal01_Cat/Animation/Montage/",
    MontagePrefix = "Npc_Cat01_",
    SkeletonMeshPath = "Asset/Char/Npc/Animal/Animal01_Cat/Mesh/Npc_Cat01B_SM"
  },
  [30017] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/BaiNpc/Bai_Waisong/ABP_NPC_BaiWS.ABP_NPC_BaiWS_C'",
    AudioPrefix = "NPC_BaiWS",
    AvatarExpressionPrefix = "Waisong_",
    ModelId = 30017,
    MontageFolder = "/Game/Asset/Char/Npc/Npc_BaiWS/Animation/Montage/",
    MontagePrefix = "NPC_BaiWS_",
    SkeletonMeshPath = "Asset/Char/Npc/Npc_BaiWS/Mesh/Npc_BaiWS_SM.Npc_BaiWS_SM"
  },
  [30018] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/TalkMonster/ABP_NPC_JT_Mid_F_2.ABP_NPC_JT_Mid_F_2_C'",
    AudioPrefix = "JT_Mid_F_",
    ModelId = 30018,
    MontageFolder = "/Game/Asset/Char/Monster/Common/Animation/JT_Mid_F/Montage/NPC_Inter/",
    MontagePrefix = "JT_Mid_F_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_Juji/Mesh/JT_Juji_SM"
  },
  [30019] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/BaiNpc/BaiJT/ABP_BaiJT.ABP_BaiJT_C'",
    AudioPrefix = "NPC_BaiJT_",
    ModelId = 30019,
    MontageFolder = "/Game/Asset/Char/Npc/NPC_BaiJT/Animation/Montage/",
    MontagePrefix = "NPC_BaiJT_",
    SkeletonMeshPath = "Asset/Char/Npc/NPC_BaiJT/Mesh/NPC_BaiJT_SM"
  },
  [30020] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/TalkMonster/Dajie/ABP_NPC_Dajie.ABP_NPC_Dajie_C'",
    AudioPrefix = "NE_Dajie_",
    ModelId = 30020,
    ModelScale = 1.2,
    MontageFolder = "/Game/Asset/Char/Monster/NE_Dajie/Animation/Montage/",
    MontagePrefix = "NE_Dajie_",
    SkeletonMeshPath = "Asset/Char/Monster/NE_Dajie/Mesh/NE_Dajie_SM.NE_Dajie_SM"
  },
  [30021] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/NPC_Wuyou/Wuyou01/ABP_NPC_Wuyou01.ABP_NPC_Wuyou01_C'",
    AudioPrefix = "Wuyou_",
    ModelId = 30021,
    MontageFolder = "/Game/Asset/Char/Npc/NPC_Wuyou/Animation/Montage/",
    MontagePrefix = "Wuyou_",
    SkeletonMeshPath = "Asset/Char/Npc/NPC_Wuyou/Mesh/NPC_Wuyou01_SM.NPC_Wuyou01_SM"
  },
  [30022] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/NPC_Wuyou/Wuyou01/ABP_NPC_Wuyou01.ABP_NPC_Wuyou01_C'",
    AudioPrefix = "Wuyou_",
    ModelId = 30022,
    MontageFolder = "/Game/Asset/Char/Npc/NPC_Wuyou/Animation/Montage/",
    MontagePrefix = "Wuyou_",
    SkeletonMeshPath = "Asset/Char/Npc/NPC_Wuyou/Mesh/NPC_Wuyou02_SM.NPC_Wuyou02_SM"
  },
  [30023] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/NPC_Wuyou/Wuyou01/ABP_NPC_Wuyou01.ABP_NPC_Wuyou01_C'",
    AudioPrefix = "Wuyou_",
    ModelId = 30023,
    MontageFolder = "/Game/Asset/Char/Npc/NPC_Wuyou/Animation/Montage/",
    MontagePrefix = "Wuyou_",
    SkeletonMeshPath = "Asset/Char/Npc/NPC_Wuyou/Mesh/NPC_Wuyou03_SM.NPC_Wuyou03_SM"
  },
  [30024] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/NPC_Wuyou/Wuyou01/ABP_NPC_Wuyou01.ABP_NPC_Wuyou01_C'",
    AudioPrefix = "Wuyou_",
    ModelId = 30024,
    MontageFolder = "/Game/Asset/Char/Npc/NPC_Wuyou/Animation/Montage/",
    MontagePrefix = "Wuyou_",
    SkeletonMeshPath = "Asset/Char/Npc/NPC_Wuyou/Mesh/NPC_Wuyou04_SM.NPC_Wuyou04_SM"
  },
  [30025] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Pan/ABP_NPC_Pan.ABP_NPC_Pan_C'",
    AudioPrefix = "Pan_",
    ModelId = 30025,
    MontageFolder = "/Game/Asset/Char/Npc/NPC_Wuyou/Animation/Montage/",
    MontagePrefix = "Pan_",
    SkeletonMeshPath = "Asset/Char/Npc/NPC_Wuyou/Mesh/NPC_Wuyou05_SM.NPC_Wuyou05_SM"
  },
  [30026] = {
    AudioPrefix = "JT_Mid_M_",
    ModelId = 30026,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Monster/Common/Animation/JT_Mid_M/Montage/NPC_Inter/",
    MontagePrefix = "JT_Mid_M_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_Tuji/Mesh/JT_Tuji_SM"
  },
  [30027] = {
    AudioPrefix = "JT_Mid_M_",
    FootType = "bootHeavy",
    ModelId = 30027,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Monster/Common/Animation/JT_Mid_M/Montage/NPC_Inter/",
    MontagePrefix = "JT_Mid_M_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_Pizhuo/Mesh/JT_Pizhuo_SM.JT_Pizhuo_SM"
  },
  [30028] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/NPC_Wuyou/Wuyou01/ABP_NPC_Wuyou01.ABP_NPC_Wuyou01_C'",
    AudioPrefix = "Wuyou_",
    ModelId = 30028,
    MontageFolder = "/Game/Asset/Char/Npc/NPC_Wuyou/Animation/Montage/",
    MontagePrefix = "Wuyou_",
    SkeletonMeshPath = "Asset/Char/Npc/NPC_Wuyou/Mesh/NPC_Wuyou06_SM.NPC_Wuyou06_SM"
  },
  [30029] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/NPC_Shali/ABP_NPC_Shali.ABP_NPC_Shali.ABP_NPC_Shali.ABP_NPC_Shali_C'",
    ModelId = 30029,
    SkeletonMeshPath = "Asset/Char/Npc/NPC_Shali/Mesh/NPC_Shali_SM.NPC_Shali_SM"
  },
  [30030] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Lilikou/ABP_NPC_Lilikou_Story_Playlyre.ABP_NPC_Lilikou_Story_Playlyre_C'",
    AudioPrefix = "Lilikou_",
    ModelId = 30030,
    MontageFolder = "/Game/Asset/Char/Player/Char034_Lilikou/Animation/Montage/",
    MontagePrefix = "Lilikou_",
    SkeletonMeshPath = "Asset/Char/Player/Char034_Lilikou/Mesh/Lilikou_SM.Lilikou_SM"
  },
  [42002] = {
    ModelId = 42002,
    ModelScale = 0.65,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/SPet001_Qianji/Mesh/SPet_Qianji_SM.SPet_Qianji_SM"
  },
  [51101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/HeiTao/ABP_NPC_Heitao.ABP_NPC_Heitao_C'",
    AudioPrefix = "Heitao_",
    AvatarExpressionPrefix = "Heitao_",
    FootType = "heeledMid",
    ModelId = 51101,
    ModelScale = 0.9,
    ModelTag = T.RT_44,
    MontageFolder = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/",
    MontagePrefix = "Heitao_",
    SkeletonMeshPath = "Asset/Char/Player/Char001_Heitao_J/Mesh/HeiTao_SM.HeiTao_SM"
  },
  [51103] = {
    AccessoryMeshPath = T.RT_11,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Tuosi/ABP_NPC_Tuosi01.ABP_NPC_Tuosi01_C'",
    AudioPrefix = "Tuosi_",
    AvatarExpressionPrefix = "Tuosi_",
    FootType = "bootHeavy",
    ModelId = 51103,
    ModelScale = 0.95,
    ModelTag = T.RT_12,
    MontageFolder = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/",
    MontagePrefix = "Tuosi_",
    SkeletonMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi01_SM.Tuosi01_SM"
  },
  [51503] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Kezhou/ABP_NPC_Kezhou.ABP_NPC_Kezhou_C'",
    AudioPrefix = "Kezhou_",
    AvatarExpressionPrefix = "Kezhou_",
    FootType = "bootHeavy",
    ModelId = 51503,
    ModelScale = 0.95,
    ModelTag = T.RT_12,
    MontageFolder = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/",
    MontagePrefix = "Kezhou_",
    SkeletonMeshPath = "Asset/Char/Player/Char030_Kezhou/Mesh/Kezhou_SM.Kezhou_SM"
  },
  [52101] = {
    AccessoryMeshPath = T.RT_20,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Shuimu/ABP_NPC_Shuimu.ABP_NPC_Shuimu_C'",
    AudioPrefix = "ShuiMu_",
    FootType = "heeledMid",
    ModelId = 52101,
    ModelScale = 0.9785,
    ModelTag = T.RT_5,
    MontageFolder = "/Game/Asset/Char/Player/Char005_Shuimu/Animation/Montage/",
    MontagePrefix = "ShuiMu_",
    SkeletonMeshPath = "Asset/Char/Player/Char005_Shuimu/Mesh/Shuimu_SM.Shuimu_SM"
  },
  [52301] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Zhangyu/ABP_NPC_Zhangyu.ABP_NPC_Zhangyu_C'",
    AudioPrefix = "Zhangyu_",
    FootType = "heeledLight",
    ModelId = 52301,
    ModelTag = T.RT_45,
    MontageFolder = "/Game/Asset/Char/Player/Char004_Zhangyu/Animation/Montage/",
    MontagePrefix = "Zhangyu_",
    SkeletonMeshPath = "Asset/Char/Player/Char004_Zhangyu/Mesh/Zhangyu_SM.Zhangyu_SM"
  },
  [53201] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Haier/ABP_NPC_Haier.ABP_NPC_Haier_C'",
    AudioPrefix = "Haier_",
    AvatarExpressionPrefix = "Haier_",
    FootType = "heeledHeavy",
    HeadScale = 0.98,
    ModelId = 53201,
    ModelScale = 0.95,
    ModelTag = T.RT_5,
    MontageFolder = "/Game/Asset/Char/Player/Char006_Haier/Animation/Montage/",
    MontagePrefix = "Haier_",
    SkeletonMeshPath = "Asset/Char/Player/Char006_Haier/Mesh/Haier_SM.Haier_SM"
  },
  [54102] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Zhiliu/ABP_NPC_Zhiliu.ABP_NPC_Zhiliu_C'",
    AudioPrefix = "Zhiliu_",
    AvatarExpressionPrefix = "Zhiliu_",
    FootType = "heeledHeavy",
    ModelId = 54102,
    ModelScale = 0.95,
    ModelTag = T.RT_5,
    MontageFolder = "/Game/Asset/Char/Player/Char029_Zhiliu/Animation/Montage/",
    MontagePrefix = "Zhiliu_",
    SkeletonMeshPath = "Asset/Char/Player/Char029_Zhiliu/Mesh/Zhiliu_SM"
  },
  [55102] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/OutSide/ABP_NPC_Aote.ABP_NPC_Aote_C'",
    AudioPrefix = "Aote_",
    AvatarExpressionPrefix = "Aote_",
    FootType = "bootHeavy",
    ModelId = 55102,
    ModelScale = 0.95,
    ModelTag = T.RT_12,
    MontageFolder = "/Game/Asset/Char/Player/Char018_Aote/Animation/Montage/",
    MontagePrefix = "Aote_",
    SkeletonMeshPath = "Asset/Char/Player/Char018_Aote/Mesh/Aote_SM.Aote_SM"
  },
  [55401] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Dafu/ABP_NPC_Dafu.ABP_NPC_Dafu_C'",
    AudioPrefix = "Dafu_",
    AvatarExpressionPrefix = "Dafu_",
    FootType = "heeledHeavy",
    ModelId = 55401,
    ModelScale = 0.94,
    ModelTag = T.RT_5,
    MontageFolder = "/Game/Asset/Char/Player/Char026_Dafu/Animation/Montage/",
    MontagePrefix = "Dafu_",
    SkeletonMeshPath = "Asset/Char/Player/Char026_Dafu/Mesh/Dafu_SM.Dafu_SM"
  },
  [64011] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Zisha/ABP_PetQuad_Zisha.ABP_PetQuad_Zisha_C'",
    ModelId = 64011,
    ModelScale = 1.5,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet006_Zisha/Mesh/Pet_Zisha_SM.Pet_Zisha_SM"
  },
  [64012] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Zisha/ABP_PetQuad_Zisha.ABP_PetQuad_Zisha_C'",
    ModelId = 64012,
    ModelScale = 1.5,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet006_Zisha/Mesh/Pet_Zisha_SM.Pet_Zisha_SM"
  },
  [64013] = {
    AdditionalFXID = T.RT_28,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Zisha/ABP_PetQuad_Zisha.ABP_PetQuad_Zisha_C'",
    ModelId = 64013,
    ModelScale = 1.5,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet006_Zisha/Mesh/Pet_Zisha_SM.Pet_Zisha_SM"
  },
  [64021] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Yuyi/ABP_PetFloat_Yuyi.ABP_PetFloat_Yuyi_C'",
    ModelId = 64021,
    ModelScale = 1.5,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet001_Yuyi/Mesh/Pet_Yuyi_SM.Pet_Yuyi_SM"
  },
  [64022] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Yuyi/ABP_PetFloat_Yuyi.ABP_PetFloat_Yuyi_C'",
    ModelId = 64022,
    ModelScale = 1.5,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet001_Yuyi/Mesh/Pet_Yuyi_SM.Pet_Yuyi_SM"
  },
  [64023] = {
    AdditionalFXID = T.RT_29,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Yuyi/ABP_PetFloat_Yuyi.ABP_PetFloat_Yuyi_C'",
    ModelId = 64023,
    ModelScale = 1.5,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet001_Yuyi/Mesh/Pet_Yuyi_SM.Pet_Yuyi_SM"
  },
  [64031] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Dahuo/ABP_PetFloat_Dahuo.ABP_PetFloat_Dahuo_C'",
    ModelId = 64031,
    ModelScale = 1.5,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet002_Dahuo/Mesh/Pet_Dahuo_SM.Pet_Dahuo_SM"
  },
  [64032] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Dahuo/ABP_PetFloat_Dahuo.ABP_PetFloat_Dahuo_C'",
    ModelId = 64032,
    ModelScale = 1.5,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet002_Dahuo/Mesh/Pet_Dahuo_SM.Pet_Dahuo_SM"
  },
  [64033] = {
    AdditionalFXID = T.RT_30,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Dahuo/ABP_PetFloat_Dahuo.ABP_PetFloat_Dahuo_C'",
    ModelId = 64033,
    ModelScale = 1.5,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet002_Dahuo/Mesh/Pet_Dahuo_SM.Pet_Dahuo_SM"
  },
  [64041] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Zhamao/ABP_PetQuad_Zhamao.ABP_PetQuad_Zhamao_C'",
    ModelId = 64041,
    ModelScale = 1.5,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet004_Zhamao/Mesh/Pet_Zhamao_SM.Pet_Zhamao_SM"
  },
  [64042] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Zhamao/ABP_PetQuad_Zhamao.ABP_PetQuad_Zhamao_C'",
    ModelId = 64042,
    ModelScale = 1.5,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet004_Zhamao/Mesh/Pet_Zhamao_SM.Pet_Zhamao_SM"
  },
  [64043] = {
    AdditionalFXID = T.RT_31,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Zhamao/ABP_PetQuad_Zhamao.ABP_PetQuad_Zhamao_C'",
    ModelId = 64043,
    ModelScale = 1.5,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet004_Zhamao/Mesh/Pet_Zhamao_SM.Pet_Zhamao_SM"
  },
  [64051] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Yaoye/ABP_PetFloat_Yaoye.ABP_PetFloat_Yaoye_C'",
    ModelId = 64051,
    ModelScale = 1.5,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet003_Yaoye/Mesh/Pet_Yaoye_SM.Pet_Yaoye_SM"
  },
  [64052] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Yaoye/ABP_PetFloat_Yaoye.ABP_PetFloat_Yaoye_C'",
    ModelId = 64052,
    ModelScale = 1.5,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet003_Yaoye/Mesh/Pet_Yaoye_SM.Pet_Yaoye_SM"
  },
  [64053] = {
    AdditionalFXID = T.RT_32,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Yaoye/ABP_PetFloat_Yaoye.ABP_PetFloat_Yaoye_C'",
    ModelId = 64053,
    ModelScale = 1.5,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet003_Yaoye/Mesh/Pet_Yaoye_SM.Pet_Yaoye_SM"
  },
  [64061] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Shanling/ABP_PetBiped_Shanling.ABP_PetBiped_Shanling_C'",
    ModelId = 64061,
    ModelScale = 1.5,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet005_Shanling/Mesh/Pet_Shanling_SM.Pet_Shanling_SM"
  },
  [64062] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Shanling/ABP_PetBiped_Shanling.ABP_PetBiped_Shanling_C'",
    ModelId = 64062,
    ModelScale = 1.5,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet005_Shanling/Mesh/Pet_Shanling_SM.Pet_Shanling_SM"
  },
  [64063] = {
    AdditionalFXID = T.RT_33,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Shanling/ABP_PetBiped_Shanling.ABP_PetBiped_Shanling_C'",
    ModelId = 64063,
    ModelScale = 1.5,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet005_Shanling/Mesh/Pet_Shanling_SM.Pet_Shanling_SM"
  },
  [64071] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Nihao/ABP_PetFloatSpecial_Nihao.ABP_PetFloatSpecial_Nihao_C'",
    ModelId = 64071,
    ModelScale = 1.5,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet007_Nihao/Mesh/Pet_Nihao_SM.Pet_Nihao_SM"
  },
  [64072] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Nihao/ABP_PetFloatSpecial_Nihao.ABP_PetFloatSpecial_Nihao_C'",
    ModelId = 64072,
    ModelScale = 1.5,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet007_Nihao/Mesh/Pet_Nihao_SM.Pet_Nihao_SM"
  },
  [64073] = {
    AdditionalFXID = T.RT_34,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Nihao/ABP_PetFloatSpecial_Nihao.ABP_PetFloatSpecial_Nihao_C'",
    ModelId = 64073,
    ModelScale = 1.5,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet007_Nihao/Mesh/Pet_Nihao_SM.Pet_Nihao_SM"
  },
  [64081] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Zhenzhu/ABP_PetBiped_Zhenzhu.ABP_PetBiped_Zhenzhu_C'",
    ModelId = 64081,
    ModelScale = 1.5,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet008_Zhenzhu/Mesh/Pet_Zhenzhu_SM.Pet_Zhenzhu_SM"
  },
  [64082] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Zhenzhu/ABP_PetBiped_Zhenzhu.ABP_PetBiped_Zhenzhu_C'",
    ModelId = 64082,
    ModelScale = 1.5,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet008_Zhenzhu/Mesh/Pet_Zhenzhu_SM.Pet_Zhenzhu_SM"
  },
  [64083] = {
    AdditionalFXID = T.RT_35,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Zhenzhu/ABP_PetBiped_Zhenzhu.ABP_PetBiped_Zhenzhu_C'",
    ModelId = 64083,
    ModelScale = 1.5,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet008_Zhenzhu/Mesh/Pet_Zhenzhu_SM.Pet_Zhenzhu_SM"
  },
  [64091] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Haomeng/ABP_PetBiped_Haomeng.ABP_PetBiped_Haomeng_C'",
    ModelId = 64091,
    ModelScale = 1.5,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet009_Haomeng/Mesh/Pet_Haomeng_SM.Pet_Haomeng_SM"
  },
  [64092] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Haomeng/ABP_PetBiped_Haomeng.ABP_PetBiped_Haomeng_C'",
    ModelId = 64092,
    ModelScale = 1.5,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet009_Haomeng/Mesh/Pet_Haomeng_SM.Pet_Haomeng_SM"
  },
  [64093] = {
    AdditionalFXID = T.RT_36,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Haomeng/ABP_PetBiped_Haomeng.ABP_PetBiped_Haomeng_C'",
    ModelId = 64093,
    ModelScale = 1.5,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet009_Haomeng/Mesh/Pet_Haomeng_SM.Pet_Haomeng_SM"
  },
  [64111] = {
    AdditionalFXID = T.RT_27,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Fuyou/ABP_PetFloat_Fuyou.ABP_PetFloat_Fuyou_C'",
    ModelId = 64111,
    ModelScale = 1.5,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet018_Fuyou/Mesh/Pet_Fuyou_SM.Pet_Fuyou_SM"
  },
  [64112] = {
    AdditionalFXID = T.RT_37,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Fuyou/ABP_PetFloat_Fuyou.ABP_PetFloat_Fuyou_C'",
    ModelId = 64112,
    ModelScale = 1.5,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet018_Fuyou/Mesh/Pet_Fuyou_SM.Pet_Fuyou_SM"
  },
  [64113] = {
    AdditionalFXID = T.RT_38,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Fuyou/ABP_PetFloat_Fuyou.ABP_PetFloat_Fuyou_C'",
    ModelId = 64113,
    ModelScale = 1.5,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet018_Fuyou/Mesh/Pet_Fuyou_SM.Pet_Fuyou_SM"
  },
  [64121] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Tangshuang/ABP_PetBiped_Tangshuang.ABP_PetBiped_Tangshuang_C'",
    ModelId = 64121,
    ModelScale = 1.5,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet013_Tangshuang/Mesh/Pet_Tangshuang_SM.Pet_Tangshuang_SM"
  },
  [64122] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Tangshuang/ABP_PetBiped_Tangshuang.ABP_PetBiped_Tangshuang_C'",
    ModelId = 64122,
    ModelScale = 1.5,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet013_Tangshuang/Mesh/Pet_Tangshuang_SM.Pet_Tangshuang_SM"
  },
  [64123] = {
    AdditionalFXID = T.RT_39,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Tangshuang/ABP_PetBiped_Tangshuang.ABP_PetBiped_Tangshuang_C'",
    ModelId = 64123,
    ModelScale = 1.5,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet013_Tangshuang/Mesh/Pet_Tangshuang_SM.Pet_Tangshuang_SM"
  },
  [64131] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/YYHW/ABP_PetQuad_YYHW.ABP_PetQuad_YYHW_C'",
    ModelId = 64131,
    ModelScale = 1.5,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet014_YYHW/Mesh/Pet_YYHW_SM.Pet_YYHW_SM"
  },
  [64132] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/YYHW/ABP_PetQuad_YYHW.ABP_PetQuad_YYHW_C'",
    ModelId = 64132,
    ModelScale = 1.5,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet014_YYHW/Mesh/Pet_YYHW_SM.Pet_YYHW_SM"
  },
  [64133] = {
    AdditionalFXID = T.RT_40,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/YYHW/ABP_PetQuad_YYHW.ABP_PetQuad_YYHW_C'",
    ModelId = 64133,
    ModelScale = 1.5,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet014_YYHW/Mesh/Pet_YYHW_SM.Pet_YYHW_SM"
  },
  [64141] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Pipa/ABP_PetFloat_Pipa.ABP_PetFloat_Pipa_C'",
    ModelId = 64141,
    ModelScale = 1.5,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet016_Pipa/Mesh/Pet_Pipa_SM.Pet_Pipa_SM"
  },
  [64142] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Pipa/ABP_PetFloat_Pipa.ABP_PetFloat_Pipa_C'",
    ModelId = 64142,
    ModelScale = 1.5,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet016_Pipa/Mesh/Pet_Pipa_SM.Pet_Pipa_SM"
  },
  [64143] = {
    AdditionalFXID = T.RT_41,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Pipa/ABP_PetFloat_Pipa.ABP_PetFloat_Pipa_C'",
    ModelId = 64143,
    ModelScale = 1.5,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet016_Pipa/Mesh/Pet_Pipa_SM.Pet_Pipa_SM"
  },
  [64151] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Mianmian/ABP_PetFloat_Mianmian.ABP_PetFloat_Mianmian_C'",
    ModelId = 64151,
    ModelScale = 1.5,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet015_Mianmian/Mesh/Pet_Mianmian_SM.Pet_Mianmian_SM"
  },
  [64152] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Mianmian/ABP_PetFloat_Mianmian.ABP_PetFloat_Mianmian_C'",
    ModelId = 64152,
    ModelScale = 1.5,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet015_Mianmian/Mesh/Pet_Mianmian_SM.Pet_Mianmian_SM"
  },
  [64153] = {
    AdditionalFXID = T.RT_42,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Mianmian/ABP_PetFloat_Mianmian.ABP_PetFloat_Mianmian_C'",
    ModelId = 64153,
    ModelScale = 1.5,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet015_Mianmian/Mesh/Pet_Mianmian_SM.Pet_Mianmian_SM"
  },
  [64161] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Qiuqiu/ABP_PetFloat_Qiuqiu.ABP_PetFloat_Qiuqiu_C'",
    ModelId = 64161,
    ModelScale = 1.5,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet017_Qiuqiu/Mesh/Pet_Qiuqiu_SM.Pet_Qiuqiu_SM"
  },
  [64162] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Qiuqiu/ABP_PetFloat_Qiuqiu.ABP_PetFloat_Qiuqiu_C'",
    ModelId = 64162,
    ModelScale = 1.5,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet017_Qiuqiu/Mesh/Pet_Qiuqiu_SM.Pet_Qiuqiu_SM"
  },
  [64163] = {
    AdditionalFXID = T.RT_43,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/Qiuqiu/ABP_PetFloat_Qiuqiu.ABP_PetFloat_Qiuqiu_C'",
    ModelId = 64163,
    ModelScale = 1.5,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet017_Qiuqiu/Mesh/Pet_Qiuqiu_SM.Pet_Qiuqiu_SM"
  },
  [64911] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/HealRobot/ABP_PetFloat_HealRobot.ABP_PetFloat_HealRobot_C'",
    ModelId = 64911,
    ModelScale = 1.5,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet010_HealRobot/Mesh/Pet_HealRobot_SM.Pet_HealRobot_SM"
  },
  [64912] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/HealRobot/ABP_PetFloat_HealRobot.ABP_PetFloat_HealRobot_C'",
    ModelId = 64912,
    ModelScale = 1.5,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet010_HealRobot/Mesh/Pet_HealRobot_SM.Pet_HealRobot_SM"
  },
  [64913] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/HealRobot/ABP_PetFloat_HealRobot.ABP_PetFloat_HealRobot_C'",
    ModelId = 64913,
    ModelScale = 1.5,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet010_HealRobot/Mesh/Pet_HealRobot_SM.Pet_HealRobot_SM"
  },
  [64921] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/BlastRobot/ABP_PetFloat_BlastRobot.ABP_PetFloat_BlastRobot_C'",
    ModelId = 64921,
    ModelScale = 1.5,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet011_BlastRobot/Mesh/Pet_BlastRobot_SM.Pet_BlastRobot_SM"
  },
  [64922] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/BlastRobot/ABP_PetFloat_BlastRobot.ABP_PetFloat_BlastRobot_C'",
    ModelId = 64922,
    ModelScale = 1.5,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet011_BlastRobot/Mesh/Pet_BlastRobot_SM.Pet_BlastRobot_SM"
  },
  [64923] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/BlastRobot/ABP_PetFloat_BlastRobot.ABP_PetFloat_BlastRobot_C'",
    ModelId = 64923,
    ModelScale = 1.5,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet011_BlastRobot/Mesh/Pet_BlastRobot_SM.Pet_BlastRobot_SM"
  },
  [64931] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/YYD/ABP_PetFloat_YYD.ABP_PetFloat_YYD_C'",
    ModelId = 64931,
    ModelScale = 1.5,
    PetModelId = 1,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet019_YYD/Mesh/Pet_YYD01_SM.Pet_YYD01_SM"
  },
  [64932] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/YYD/ABP_PetFloat_YYD.ABP_PetFloat_YYD_C'",
    ModelId = 64932,
    ModelScale = 1.5,
    PetModelId = 2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet019_YYD/Mesh/Pet_YYD02_SM.Pet_YYD02_SM"
  },
  [64933] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/YYD/ABP_PetFloat_YYD.ABP_PetFloat_YYD_C'",
    ModelId = 64933,
    ModelScale = 1.5,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet019_YYD/Mesh/Pet_YYD03_SM.Pet_YYD03_SM"
  },
  [64934] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/Pet/YYD/ABP_PetFloat_YYD.ABP_PetFloat_YYD_C'",
    ModelId = 64934,
    ModelScale = 1.5,
    PetModelId = 3,
    SkeletonMeshPath = "Asset/Char/Player/Common/Pet/Pet019_YYD/Mesh/Pet_YYD03_SM.Pet_YYD03_SM"
  },
  [69001] = {
    ModelId = 69001,
    SkeletonMeshPath = "Asset/Char/Npc/NPC_Wuyou/Mesh/NPC_Wuyou01_SM.NPC_Wuyou01_SM"
  },
  [81101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/HeiTao/ABP_NPC_Heitao.ABP_NPC_Heitao_C'",
    AudioPrefix = "Heitao_",
    CloakMeshPath = "Asset/Char/Player/Char001_Heitao_J/Mesh/Heitao_Cloak_SM.Heitao_Cloak_SM",
    FootType = "heeledMid",
    HeadScale = 0.96,
    ModelId = 81101,
    ModelTag = T.RT_44,
    MontageFolder = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/",
    MontagePrefix = "Heitao_",
    SkeletonMeshPath = "Asset/Char/Player/Char001_Heitao_J/Mesh/HeiTao_SM.HeiTao_SM"
  },
  [81103] = {
    AccessoryMeshPath = T.RT_11,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Tuosi/ABP_NPC_Tuosi01.ABP_NPC_Tuosi01_C'",
    AudioPrefix = "Tuosi_",
    CloakMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi01_Cloak_SM",
    FootType = "bootHeavy",
    ModelId = 81103,
    ModelScale = 0.95,
    ModelTag = T.RT_12,
    MontageFolder = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/",
    MontagePrefix = "Tuosi_",
    SkeletonMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi01_SM.Tuosi01_SM"
  },
  [81501] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Baonu/ABP_NPC_Baonu.ABP_NPC_Baonu_C'",
    AudioPrefix = "Baonu_",
    FootType = "heeledLight",
    ModelId = 81501,
    ModelTag = T.RT_45,
    MontageFolder = "/Game/Asset/Char/Player/Char007_Baonu/Animation/Montage/",
    MontagePrefix = "Baonu_",
    SkeletonMeshPath = "Asset/Char/Player/Char007_Baonu/Mesh/Baonu_SM.Baonu_SM"
  },
  [81502] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Nifu/ABP_NPC_Nifu.ABP_NPC_Nifu_C'",
    AudioPrefix = "Nifu_",
    FootType = "heeledHeavy",
    ModelId = 81502,
    ModelScale = 0.95,
    ModelTag = T.RT_5,
    MontageFolder = "/Game/Asset/Char/Player/Char031_Nifu/Animation/Montage/",
    MontagePrefix = "Nifu_",
    SkeletonMeshPath = "Asset/Char/Player/Char031_Nifu/Mesh/Nifu_SM.Nifu_SM"
  },
  [81503] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Kezhou/ABP_NPC_Kezhou.ABP_NPC_Kezhou_C'",
    AudioPrefix = "Kezhou_",
    AvatarExpressionPrefix = "Kezhou_",
    CloakMeshPath = "Asset/Char/Player/Char030_Kezhou/Mesh/Kezhou_Cloak_SM",
    FootType = "bootHeavy",
    ModelId = 81503,
    ModelScale = 0.95,
    ModelTag = T.RT_12,
    MontageFolder = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Montage/",
    MontagePrefix = "Kezhou_",
    SkeletonMeshPath = "Asset/Char/Player/Char030_Kezhou/Mesh/Kezhou_SM.Kezhou_SM"
  },
  [81801] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Feena/ABP_Npc_Feina.ABP_Npc_Feina_C'",
    AudioPrefix = "Feina_",
    AvatarExpressionPrefix = "Feina_",
    FootType = "heeledLight",
    ModelId = 81801,
    ModelScale = 0.9,
    ModelTag = T.RT_44,
    MontageFolder = "/Game/Asset/Char/Player/Char019_Feina/Animation/Montage/",
    MontagePrefix = "Feina_",
    SkeletonMeshPath = "Asset/Char/Player/Char019_Feina/Mesh/Feina_SM.Feina_SM"
  },
  [82101] = {
    AccessoryMeshPath = T.RT_20,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Shuimu/ABP_NPC_Shuimu.ABP_NPC_Shuimu_C'",
    AudioPrefix = "ShuiMu_",
    CloakMeshPath = "Asset/Char/Player/Char005_Shuimu/Mesh/Shuimu_Cloak_SM.Shuimu_Cloak_SM",
    FootType = "heeledMid",
    HeadScale = 0.8844,
    ModelId = 82101,
    ModelScale = 0.9785,
    ModelTag = T.RT_5,
    MontageFolder = "/Game/Asset/Char/Player/Char005_Shuimu/Animation/Montage/",
    MontagePrefix = "ShuiMu_",
    SkeletonMeshPath = "Asset/Char/Player/Char005_Shuimu/Mesh/Shuimu_SM.Shuimu_SM",
    WeaponScale = 0.9785
  },
  [82301] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Zhangyu/ABP_NPC_Zhangyu.ABP_NPC_Zhangyu_C'",
    AudioPrefix = "Zhangyu_",
    CloakMeshPath = "Asset/Char/Player/Char004_Zhangyu/Mesh/Zhangyu_Cloak_SM",
    FootType = "heeledLight",
    HeadScale = 0.96,
    ModelId = 82301,
    ModelTag = T.RT_45,
    MontageFolder = "/Game/Asset/Char/Player/Char004_Zhangyu/Animation/Montage/",
    MontagePrefix = "Zhangyu_",
    SkeletonMeshPath = "Asset/Char/Player/Char004_Zhangyu/Mesh/Zhangyu_SM.Zhangyu_SM"
  },
  [82401] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Baiheng/ABP_NPC_Baiheng.ABP_NPC_Baiheng_C'",
    AudioPrefix = "Baiheng_",
    AvatarExpressionPrefix = "Fushu_",
    FootType = "heeledHeavy",
    HeadScale = 0.9115,
    ModelId = 82401,
    ModelScale = 0.95,
    ModelTag = T.RT_5,
    MontageFolder = "/Game/Asset/Char/Player/Char015_Baiheng/Animation/Montage/",
    MontagePrefix = "Baiheng_",
    SkeletonMeshPath = "Asset/Char/Player/Char015_Baiheng/Mesh/Baiheng_SM.Baiheng_SM"
  },
  [83101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Linen/ABP_NPC_Linen.ABP_NPC_Linen_C'",
    AudioPrefix = "Linen_",
    FootType = "heeledHeavy",
    ModelId = 83101,
    ModelScale = 0.95,
    ModelTag = T.RT_5,
    MontageFolder = "/Game/Asset/Char/Player/Char011_Linen/Animation/Montage/",
    MontagePrefix = "Linen_",
    SkeletonMeshPath = "Asset/Char/Player/Char011_Linen/Mesh/Linen_SM.Linen_SM"
  },
  [83102] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Xier/ABP_NPC_Xier.ABP_NPC_Xier_C'",
    AudioPrefix = "Xier_",
    FootType = "heeledMid",
    HeadScale = 0.9657,
    ModelId = 83102,
    ModelScale = 0.95,
    ModelTag = T.RT_5,
    MontageFolder = "/Game/Asset/Char/Player/Char023_Xier/Animation/Montage/",
    MontagePrefix = "Xier_",
    SkeletonMeshPath = "Asset/Char/Player/Char023_Xier/Mesh/Xier_SM.Xier_SM"
  },
  [83103] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Yeer/ABP_NPC_Yeer.ABP_NPC_Yeer_C'",
    AudioPrefix = "Yeer_",
    FootType = "heeledLight",
    ModelId = 83103,
    ModelScale = 0.85,
    ModelTag = T.RT_45,
    MontageFolder = "/Game/Asset/Char/Player/Char017_Yeer/Animation/Montage/",
    MontagePrefix = "Yeer_",
    SkeletonMeshPath = "Asset/Char/Player/Char017_Yeer/Mesh/Yeer_SM.Yeer_SM"
  },
  [83201] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Haier/ABP_NPC_Haier.ABP_NPC_Haier_C'",
    AudioPrefix = "Haier_",
    CloakMeshPath = "Asset/Char/Player/Char006_Haier/Mesh/Haier_Cloak_SM.Haier_Cloak_SM",
    FootType = "heeledHeavy",
    HeadScale = 0.8754,
    ModelId = 83201,
    ModelScale = 0.95,
    ModelTag = T.RT_5,
    MontageFolder = "/Game/Asset/Char/Player/Char006_Haier/Animation/Montage/",
    MontagePrefix = "Haier_",
    SkeletonMeshPath = "Asset/Char/Player/Char006_Haier/Mesh/Haier_SM.Haier_SM"
  },
  [83301] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Maerjie/ABP_NPC_Maer.ABP_NPC_Maer_C'",
    AudioPrefix = "Maer_",
    CloakMeshPath = "Asset/Char/Player/Char024_Maer/Mesh/Maer_Part02_SM.Maer_Part02_SM",
    FootType = "heeledMid",
    HeadScale = 1.02,
    ModelId = 83301,
    ModelScale = 0.95,
    ModelTag = T.RT_44,
    MontageFolder = "/Game/Asset/Char/Player/Char024_Maer/Animation/Montage/",
    MontagePrefix = "Maer_",
    SkeletonMeshPath = "Asset/Char/Player/Char024_Maer/Mesh/Maer_SM.Maer_SM"
  },
  [84101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Lise/ABP_NPC_Lise.ABP_NPC_Lise_C'",
    AudioPrefix = "Lise_",
    FootType = "heeledMid",
    ModelId = 84101,
    ModelTag = T.RT_44,
    MontageFolder = "/Game/Asset/Char/Player/Char020_Lise/Animation/Montage/",
    MontagePrefix = "Lise_",
    SkeletonMeshPath = "Asset/Char/Player/Char020_Lise/Mesh/Lise_SM.Lise_SM"
  },
  [84102] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Zhiliu/ABP_NPC_Zhiliu.ABP_NPC_Zhiliu_C'",
    AudioPrefix = "Zhiliu_",
    AvatarExpressionPrefix = "Zhiliu_",
    CloakMeshPath = "Asset/Char/Player/Char029_Zhiliu/Mesh/Zhiliu_Cloak_SM",
    FootType = "heeledHeavy",
    ModelId = 84102,
    ModelScale = 0.95,
    ModelTag = T.RT_5,
    MontageFolder = "/Game/Asset/Char/Player/Char029_Zhiliu/Animation/Montage/",
    MontagePrefix = "Zhiliu_",
    SkeletonMeshPath = "Asset/Char/Player/Char029_Zhiliu/Mesh/Zhiliu_SM"
  },
  [84201] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Yuming/ABP_NPC_Yuming.ABP_NPC_Yuming_C'",
    AudioPrefix = "Yuming_",
    AvatarExpressionPrefix = "Yuming_",
    FootType = "bootHeavy",
    ModelId = 84201,
    ModelScale = 0.95,
    ModelTag = T.RT_12,
    MontageFolder = "/Game/Asset/Char/Player/Char008_Yuming/Animation/Montage/",
    MontagePrefix = "Yuming_",
    SkeletonMeshPath = "Asset/Char/Player/Char008_Yuming/Mesh/Yuming_SM.Yuming_SM"
  },
  [84202] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Landi/ABP_NPC_Landi.ABP_NPC_Landi_C'",
    AudioPrefix = "Landi_",
    FootType = "bootHeavy",
    ModelId = 84202,
    ModelScale = 0.95,
    ModelTag = T.RT_12,
    MontageFolder = "/Game/Asset/Char/Player/Char012_Landi/Animation/Montage/",
    MontagePrefix = "Landi_",
    SkeletonMeshPath = "Asset/Char/Player/Char012_Landi/Mesh/Landi_SM.Landi_SM"
  },
  [84301] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Xibi/ABP_NPC_Xibi.ABP_NPC_Xibi_C'",
    AudioPrefix = "Xibi_",
    AvatarExpressionPrefix = "Xibi_",
    FootType = "heeledHeavy",
    ModelId = 84301,
    ModelScale = 0.95,
    ModelTag = T.RT_5,
    MontageFolder = "/Game/Asset/Char/Player/Char009_Xibi/Animation/Montage/",
    MontagePrefix = "Xibi_",
    SkeletonMeshPath = "Asset/Char/Player/Char009_Xibi/Mesh/Xibi_SM.Xibi_SM"
  },
  [85101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Songlu/ABP_NPC_Songlu.ABP_NPC_Songlu_C'",
    AudioPrefix = "Songlu_",
    AvatarExpressionPrefix = "Songlu_",
    FootType = "heeledLight",
    HeadScale = 0.98,
    ModelId = 85101,
    ModelTag = T.RT_45,
    MontageFolder = "/Game/Asset/Char/Player/Char021_Songlu/Animation/Montage/",
    MontagePrefix = "Songlu_",
    SkeletonMeshPath = "Asset/Char/Player/Char021_Songlu/Mesh/Songlu_SM.Songlu_SM"
  },
  [85102] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/OutSide/ABP_NPC_Aote.ABP_NPC_Aote_C'",
    AudioPrefix = "Aote_",
    CloakMeshPath = "Asset/Char/Player/Char018_Aote/Mesh/Aote_Cloak_SM",
    FootType = "bootHeavy",
    ModelId = 85102,
    ModelScale = 0.95,
    ModelTag = T.RT_12,
    MontageFolder = "/Game/Asset/Char/Player/Char018_Aote/Animation/Montage/",
    MontagePrefix = "Aote_",
    SkeletonMeshPath = "Asset/Char/Player/Char018_Aote/Mesh/Aote_SM.Aote_SM"
  },
  [85301] = {
    AccessoryMeshPath = T.RT_46,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Saiqi/ABP_NPC_Saiqi.ABP_NPC_Saiqi_C'",
    AudioPrefix = "Saiqi_",
    FootType = "heeledMid",
    HeadScale = 0.98,
    ModelId = 85301,
    ModelTag = T.RT_44,
    MontageFolder = "/Game/Asset/Char/Player/Char010_Saiqi/Animation/Montage/",
    MontagePrefix = "Saiqi_",
    SkeletonMeshPath = "Asset/Char/Player/Char010_Saiqi01/Mesh/Saiqi_SP01_SM"
  },
  [85401] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Dafu/ABP_NPC_Dafu.ABP_NPC_Dafu_C'",
    AudioPrefix = "Dafu_",
    AvatarExpressionPrefix = "Dafu_",
    CloakMeshPath = "Asset/Char/Player/Char026_Dafu/Mesh/Dafu_Cloak_SM",
    FootType = "heeledHeavy",
    ModelId = 85401,
    ModelScale = 0.94,
    ModelTag = T.RT_5,
    MontageFolder = "/Game/Asset/Char/Player/Char026_Dafu/Animation/Montage/",
    MontagePrefix = "Dafu_",
    SkeletonMeshPath = "Asset/Char/Player/Char026_Dafu/Mesh/Dafu_SM.Dafu_SM"
  },
  [90001] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/BaiNpc/Bai_Duanzao/ABP_BaiDZ.ABP_BaiDZ_C'",
    AudioPrefix = "Bai_",
    AvatarExpressionPrefix = "Tiejiang_",
    FootType = "heeledLight",
    HeadScale = 0.97,
    ModelId = 90001,
    MontageFolder = "/Game/Asset/Char/Npc/NPC_BaiDZ/Animation/Montage/",
    MontagePrefix = "Npc_BaiDZ_",
    SkeletonMeshPath = "Asset/Char/Npc/NPC_BaiDZ/Mesh/NPC_BaiDZ_SM.NPC_BaiDZ_SM"
  },
  [90002] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/BaiNpc/BaiSD/ABP_BaiSD.ABP_BaiSD_C'",
    AudioPrefix = "Bai_",
    FootType = "heeledLight",
    HeadScale = 0.97,
    ModelId = 90002,
    MontageFolder = "/Game/Asset/Char/Npc/NPC_BaiSD/Animation/Montage/",
    MontagePrefix = "NPC_BaiSD_",
    SkeletonMeshPath = "Asset/Char/Npc/NPC_BaiSD/Mesh/NPC_BaiSD_SM.NPC_BaiSD_SM"
  },
  [90003] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/BaiNpc/Bai_Ditu/ABP_Bai_Ditu.ABP_Bai_Ditu_C'",
    AudioPrefix = "Bai_",
    FootType = "heeledLight",
    HeadScale = 0.97,
    ModelId = 90003,
    MontageFolder = "/Game/Asset/Char/Npc/NPC_BaiTX/Animation/Montage/",
    MontagePrefix = "Npc_BaiTX_",
    SkeletonMeshPath = "Asset/Char/Npc/NPC_BaiTX/Mesh/NPC_BaiTX_SM.NPC_BaiTX_SM"
  },
  [90004] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/BaiNpc/Bai_Beibao/ABP_BaiBB.ABP_BaiBB_C'",
    AudioPrefix = "Bai_",
    AvatarExpressionPrefix = "Beibao_",
    FootType = "heeledLight",
    ModelId = 90004,
    MontageFolder = "/Game/Asset/Char/Npc/NPC_BaiBB/Animation/Montage/",
    MontagePrefix = "Npc_BaiBB_",
    SkeletonMeshPath = "Asset/Char/Npc/NPC_BaiBB/Mesh/NPC_BaiBB_SM.NPC_BaiBB_SM"
  },
  [90005] = {ModelId = 90005},
  [90006] = {ModelId = 90006},
  [91801] = {
    ModelId = 91801,
    SkeletonMeshPath = "Asset/Scene/EN003_Huaxu/Yanjindu/Mesh/SM_Batt_Gear07A.SM_Batt_Gear07A"
  },
  [91802] = {
    ModelId = 91802,
    SkeletonMeshPath = "Asset/Scene/EN003_Huaxu/Yanjindu/Mesh/SM_Batt_Bui02.SM_Batt_Bui02"
  },
  [91803] = {
    ModelId = 91803,
    SkeletonMeshPath = "Asset/Scene/EN003_Huaxu/Yanjindu/Mesh/SM_Fil_Dev01.SM_Fil_Dev01"
  },
  [91804] = {
    ModelId = 91804,
    SkeletonMeshPath = "Asset/Scene/common/BreakableItems/Mesh/Gem_mesh_MESH.Gem_mesh_MESH"
  },
  [91805] = {
    ModelId = 91805,
    SkeletonMeshPath = "Asset/Scene/common/Mesh/SM_Com_Bot02.SM_Com_Bot02"
  },
  [91806] = {
    ModelId = 91806,
    SkeletonMeshPath = "Asset/Scene/EN003_Huaxu/Yanjindu/Mesh/SM_Nai_Lamp04.SM_Nai_Lamp04"
  },
  [91807] = {
    ModelId = 91807,
    SkeletonMeshPath = "Asset/Scene/Layout/Eastern/Mechanism/Fu_Lantern.Fu_Lantern"
  },
  [91808] = {
    ModelId = 91808,
    SkeletonMeshPath = "Asset/Scene/EN003_Huaxu/Yanjindu/Mesh/SM_Nai_Dev01.SM_Nai_Dev01"
  },
  [91809] = {
    ModelId = 91809,
    SkeletonMeshPath = "Asset/Scene/EN003_Huaxu/Yanjindu/Mesh/SM_Nai_Boat01.SM_Nai_Boat01"
  },
  [91810] = {
    ModelId = 91810,
    SkeletonMeshPath = "Asset/Scene/EN003_Huaxu/Common/Mechanism/SM_HX_Mech02A.SM_HX_Mech02A"
  },
  [91811] = {
    ModelId = 91811,
    SkeletonMeshPath = "Asset/Scene/Layout/Eastern/Pingfeng01.Pingfeng01"
  },
  [91812] = {
    ModelId = 91812,
    SkeletonMeshPath = "Asset/Scene/Layout/Eastern/Pingfeng02.Pingfeng02"
  },
  [91813] = {
    ModelId = 91813,
    SkeletonMeshPath = "Asset/Scene/Layout/Eastern/Mojia/RotateCenter2.RotateCenter2"
  },
  [91814] = {
    ModelId = 91814,
    SkeletonMeshPath = "Asset/Scene/Layout/Eastern/Mojia/RotatePanal2.RotatePanal2"
  },
  [91815] = {
    ModelId = 91815,
    SkeletonMeshPath = "Asset/Scene/EN003_Huaxu/Yanjindu/Mesh/SM_Fil_Cry01.SM_Fil_Cry01"
  },
  [91816] = {
    ModelId = 91816,
    SkeletonMeshPath = "Asset/Scene/Layout/Eastern/Mechanism/Fu_LanternWater.Fu_LanternWater"
  },
  [91817] = {
    ModelId = 91817,
    SkeletonMeshPath = "Asset/Scene/EN003_Huaxu/Common/Mechanism/SM_HX_Mech04A.SM_HX_Mech04A"
  },
  [91818] = {
    ModelId = 91818,
    SkeletonMeshPath = "Asset/Scene/EN003_Huaxu/Common/Mechanism/SM_HX_Batt_Pit01.SM_HX_Batt_Pit01"
  },
  [91819] = {
    ModelId = 91819,
    SkeletonMeshPath = "Asset/Scene/EN003_Huaxu/Common/Mechanism/SM_HX_Batt_Pit02.SM_HX_Batt_Pit02"
  },
  [91820] = {
    ModelId = 91820,
    SkeletonMeshPath = "Asset/Scene/EN003_Huaxu/Common/Mechanism/SM_HX_Mech03A.SM_HX_Mech03A"
  },
  [91821] = {
    ModelId = 91821,
    SkeletonMeshPath = "Asset/Scene/EN003_Huaxu/Common/Mechanism/SM_HX_Pyr01.SM_HX_Pyr01"
  },
  [91822] = {
    ModelId = 91822,
    SkeletonMeshPath = "Asset/Scene/EN003_Huaxu/Common/Mechanism/SM_HX_Pyr01A.SM_HX_Pyr01A"
  },
  [91823] = {
    ModelId = 91823,
    SkeletonMeshPath = "Asset/Scene/EN003_Huaxu/Common/Mechanism/SM_HX_Mech06.SM_HX_Mech06"
  },
  [91824] = {
    ModelId = 91824,
    SkeletonMeshPath = "Asset/Scene/EN003_Huaxu/Yanjindu/Mesh/SM_Fil_Rhi01.SM_Fil_Rhi01"
  },
  [91825] = {
    ModelId = 91825,
    SkeletonMeshPath = "Asset/Scene/EN003_Huaxu/Yanjindu/Mesh/SM_Fil_Rhi03.SM_Fil_Rhi03"
  },
  [91826] = {
    ModelId = 91826,
    SkeletonMeshPath = "Asset/Scene/EN003_Huaxu/Yanjindu/Mesh/SM_Fil_Rhi05.SM_Fil_Rhi05"
  },
  [91827] = {
    ModelId = 91827,
    SkeletonMeshPath = "Asset/Scene/EN003_Huaxu/Yanjindu/Mesh/SM_Fil_Rhi02.SM_Fil_Rhi02"
  },
  [91828] = {
    ModelId = 91828,
    SkeletonMeshPath = "Asset/Scene/EN003_Huaxu/Yanjindu/Mesh/SM_Fil_Rhi04.SM_Fil_Rhi04"
  },
  [92001] = {
    ModelId = 92001,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Mech_Fort_HitS01B.SM_IP_Mech_Fort_HitS01B"
  },
  [92201] = {
    ModelId = 92201,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SV_IP_Defen_Sew.SV_IP_Defen_Sew"
  },
  [92401] = {
    ModelId = 92401,
    SkeletonMeshPath = "Asset/Scene/EN002_Haiboliya/Longsha/LS_Fortress/Mesh/SM_Fort_Mod01.SM_Fort_Mod01"
  },
  [92601] = {
    ModelId = 92601,
    SkeletonMeshPath = "Asset/Scene/common/Mesh/SM_Com_But01B.SM_Com_But01B"
  },
  [92602] = {
    ModelId = 92602,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Coll_Com_Nuts01.SM_IP_Coll_Com_Nuts01"
  },
  [92603] = {
    ModelId = 92603,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Coll_Com_She01A.SM_IP_Coll_Com_She01A"
  },
  [92604] = {
    ModelId = 92604,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Coll_AL_Fou01.SM_IP_Coll_AL_Fou01"
  },
  [92605] = {
    ModelId = 92605,
    SkeletonMeshPath = "Asset/Scene/common/Mesh/SM_Com_But01A.SM_Com_But01A"
  },
  [92606] = {
    ModelId = 92606,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Coll_Com_Ore01.SM_IP_Coll_Com_Ore01"
  },
  [92607] = {
    ModelId = 92607,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Coll_Com_Rock01.SM_IP_Coll_Com_Rock01"
  },
  [92608] = {
    ModelId = 92608,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Coll_Com_Flower02.SM_IP_Coll_Com_Flower02"
  },
  [92609] = {
    ModelId = 92609,
    SkeletonMeshPath = "Asset/Scene/EN002_Haiboliya/Binghucheng/BH_Quarry/Mesh/SM_Qua_Jar01.SM_Qua_Jar01"
  },
  [92610] = {
    ModelId = 92610,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Coll_Com_Mus01.SM_IP_Coll_Com_Mus01"
  },
  [92611] = {
    ModelId = 92611,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Coll_HB_Battery.SM_IP_Coll_HB_Battery"
  },
  [92612] = {
    ModelId = 92612,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Coll_Com_Birdnext01.SM_IP_Coll_Com_Birdnext01"
  },
  [92613] = {
    ModelId = 92613,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Coll_Com_Flower03.SM_IP_Coll_Com_Flower03"
  },
  [92614] = {
    ModelId = 92614,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Coll_Com_Flower04.SM_IP_Coll_Com_Flower04"
  },
  [92615] = {
    ModelId = 92615,
    ModelScale = 0.5,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Coll_Com_Mus02.SM_IP_Coll_Com_Mus02"
  },
  [94101] = {
    ModelId = 94101,
    SkeletonMeshPath = "Asset/Scene/EN002_Haiboliya/Common/Mesh/SM_Com_Ici05.SM_Com_Ici05"
  },
  [94102] = {
    ModelId = 94102,
    SkeletonMeshPath = "Asset/Scene/EN002_Haiboliya/Longsha/LS_Fortress/Mesh/SM_Fort_Iro04.SM_Fort_Iro04"
  },
  [95501] = {
    ModelId = 95501,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Mech_Sew_Twall01.SM_IP_Mech_Sew_Twall01"
  },
  [95502] = {
    ModelId = 95502,
    SkeletonMeshPath = "Asset/Scene/common/InterProps/Mesh/SM_IP_Mech_Sew_Twall01.SM_IP_Mech_Sew_Twall01"
  },
  [110101] = {
    ModelId = 110101,
    SkeletonMeshPath = "Asset/Char/Player/Char001_Heitao_J/Mesh/Heitao_WP02_SM.Heitao_WP02_SM",
    StandId = "002",
    WeaponHitedSeName = "Claymore",
    WeaponSeInfo = "Sword_Huipo"
  },
  [110102] = {
    ModelId = 110102,
    SkeletonMeshPath = "Asset/Char/Player/Char001_Heitao_J/Mesh/Heitao_WP01_SM.Heitao_WP01_SM"
  },
  [110201] = {
    ModelId = 110201,
    SkeletonMeshPath = "Asset/Char/Player/Char016_Fuluo/Mesh/Fuluo_Sum_SM.Fuluo_Sum_SM"
  },
  [110301] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Tuosi/ABP_Tuosi02.ABP_Tuosi02_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Tuosi02_",
    BuffLightMeshPath = "/Game/Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi02B_Part03_SM.Tuosi02B_Part03_SM",
    CloakMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi02B_Part01_SM.Tuosi02B_Part01_SM",
    DamageFXSockets = T.RT_1,
    FootType = "Tuosi02",
    HitMontageRule = "RoleDefault",
    ModelId = 110301,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/",
    MontagePrefix = "Tuosi02_",
    OverrideMaterialParam = T.RT_7,
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi02B_SM.Tuosi02B_SM",
    StandId = "001"
  },
  [110302] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Tuosi/ABP_Tuosi02.ABP_Tuosi02_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Tuosi02_",
    CloakMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi02B_Part01_SM.Tuosi02B_Part01_SM",
    DamageFXSockets = T.RT_1,
    FootType = "Tuosi02",
    HitMontageRule = "RoleDefault",
    ModelId = 110302,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/",
    MontagePrefix = "Tuosi02_",
    OverrideMaterialParam = T.RT_9,
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi02B_SM.Tuosi02B_SM",
    StandId = "001"
  },
  [110303] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Tuosi/ABP_Tuosi02.ABP_Tuosi02_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Tuosi02_",
    CloakMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi02B_Part01_SM.Tuosi02B_Part01_SM",
    DamageFXSockets = T.RT_1,
    FootType = "Tuosi02",
    HitMontageRule = "RoleDefault",
    ModelId = 110303,
    ModelScale = 0.95,
    MontageFolder = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/",
    MontagePrefix = "Tuosi02_",
    OverrideMaterialParam = T.RT_10,
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi02B_SM.Tuosi02B_SM",
    StandId = "001"
  },
  [110311] = {
    ModelId = 110311,
    SkeletonMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi01_Part01_SM.Tuosi01_Part01_SM"
  },
  [110312] = {
    ModelId = 110312,
    SkeletonMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi02B_Part02_SM.Tuosi02B_Part02_SM",
    StandId = "002"
  },
  [120102] = {
    ModelId = 120102,
    ModelScale = 0.08,
    SkeletonMeshPath = "Asset/Char/Monster/Boss16_Fuer/Mesh/Boss_Fuer_SM.Boss_Fuer_SM"
  },
  [150101] = {
    AdditionalFXID = {
      150151,
      150152,
      150153
    },
    ModelAixsScale = {
      1.25,
      1.25,
      1.25
    },
    ModelId = 150101,
    SkeletonMeshPath = "Asset/Char/Player/Char007_Baonu/Mesh/Baonu_WP_SM.Baonu_WP_SM",
    StandId = "005",
    WeaponHitedSeName = "Claymore",
    WeaponSeInfo = "Claymore_Baonu"
  },
  [150201] = {
    ModelId = 150201,
    SkeletonMeshPath = "Asset/Char/Player/Char031_Nifu/Mesh/Nifu_Part01_SM.Nifu_Part01_SM"
  },
  [150301] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Kezhou/ABP_Kezhou_Summon.ABP_Kezhou_Summon_C'",
    BirthTime = -1,
    HitMontageRule = "RoleDefault",
    ModelId = 150301,
    MontageFolder = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Summon/Montage/",
    MontagePrefix = "Kezhou_Summon_",
    SkeletonMeshPath = "Asset/Char/Player/Char030_Kezhou/Mesh/Kezhou_SM.Kezhou_SM"
  },
  [150311] = {
    ModelId = 150311,
    SkeletonMeshPath = "Asset/Char/Player/Char030_Kezhou/Mesh/Kezhou_WP04_SM.Kezhou_WP04_SM",
    StandId = "012",
    WeaponHitedSeName = "Sword",
    WeaponSeInfo = "Sword_Kezhou"
  },
  [150312] = {
    ModelId = 150312,
    SkeletonMeshPath = "Asset/Char/Player/Char030_Kezhou/Mesh/Kezhou_WP01_SM.Kezhou_WP01_SM",
    StandId = "003",
    WeaponHitedSeName = "spear",
    WeaponSeInfo = "Polearm_Kezhou"
  },
  [150313] = {
    ModelId = 150313,
    SkeletonMeshPath = "Asset/Char/Player/Char030_Kezhou/Mesh/Kezhou_WP02_SM.Kezhou_WP02_SM",
    StandId = "009",
    WeaponSeInfo = "Claymore_Kezhou"
  },
  [150314] = {
    ModelId = 150314,
    SkeletonMeshPath = "Asset/Char/Player/Char030_Kezhou/Mesh/Kezhou_WP03a_SM.Kezhou_WP03a_SM",
    StandId = "009",
    WeaponSeInfo = "Dualblade_Kezhou"
  },
  [150315] = {
    ModelId = 150315,
    SkeletonMeshPath = "Asset/Char/Player/Char030_Kezhou/Mesh/Kezhou_WP03b_SM.Kezhou_WP03b_SM",
    StandId = "009",
    WeaponSeInfo = "Dualblade_Kezhou"
  },
  [150316] = {
    ModelId = 150316,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Char030_Kezhou/Mesh/Kezhou_Part06_SM.Kezhou_Part06_SM",
    StandId = "004",
    WeaponSeInfo = "Machinegun_Ruohua"
  },
  [150401] = {
    ModelId = 150401,
    ModelScale = 0.5,
    SkeletonMeshPath = "Asset/Char/Monster/JT_BlastRobot/Mesh/JT_BlastRobot_SM.JT_BlastRobot_SM"
  },
  [150402] = {
    DamageFXSockets = T.RT_4,
    ModelId = 150402,
    SkeletonMeshPath = "Asset/Char/Monster/Boss12_Linen/Mesh/Boss_Linen_WP_08_SM.Boss_Linen_WP_08_SM"
  },
  [180101] = {
    ModelId = 180101,
    SkeletonMeshPath = "Asset/Char/Player/Char019_Feina/Mesh/Feina_Part01_SM.Feina_Part01_SM"
  },
  [180121] = {
    ModelId = 180121,
    SkeletonMeshPath = "Asset/Char/Player/Char019_Feina/Mesh/Feina_Sum01_SM.Feina_Sum01_SM"
  },
  [180122] = {
    ModelId = 180122,
    SkeletonMeshPath = "Asset/Char/Player/Char019_Feina/Mesh/Feina_Sum04_SM.Feina_Sum04_SM"
  },
  [180123] = {
    ModelId = 180123,
    SkeletonMeshPath = "Asset/Char/Player/Char019_Feina/Mesh/Feina_Sum03_SM.Feina_Sum03_SM"
  },
  [180124] = {
    ModelId = 180124,
    SkeletonMeshPath = "Asset/Char/Player/Char019_Feina/Mesh/Feina_Sum02_SM.Feina_Sum02_SM"
  },
  [210101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Shuimu/ABP_Shuimu_Summoned.ABP_Shuimu_Summoned_C'",
    AudioPrefix = "Shuimu_Summon_",
    BirthTime = -1,
    HitMontageRule = "OnlyDieNoDissolve",
    ModelId = 210101,
    MontageFolder = "/Game/Asset/Char/Player/Char005_Shuimu/Animation/Summon/Montage/",
    MontagePrefix = "Shuimu_Summon_",
    SkeletonMeshPath = "Asset/Char/Player/Char005_Shuimu/Mesh/Shuimu_Summon_SM.Shuimu_Summon_SM"
  },
  [210102] = {
    ModelId = 210102,
    SkeletonMeshPath = "Asset/Char/Player/Char005_Shuimu/Mesh/Shuimu_Part01_SM.Shuimu_Part01_SM"
  },
  [210199] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Shuimu/ABP_Shuimu01.ABP_Shuimu01_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Shuimu_",
    DamageFXSockets = T.RT_1,
    FootType = "heeledMid",
    HeadScale = 0.931,
    HitMontageRule = "RoleDefault",
    IsSkinModel = true,
    ModelId = 210199,
    ModelScale = 0.9785,
    MontageFolder = "/Game/Asset/Char/Player/Char097_Shuimu01/Animation/Montage/",
    MontagePrefix = "Shuimu_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char097_Shuimu01/Mesh/Shuimu_SP01_SM",
    StandId = "005",
    WeaponScale = 0.9785
  },
  [210211] = {
    AccessoryMeshPath = T.RT_20,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Shuimu/ABP_Shuimu.ABP_Shuimu_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Shuimu_",
    DamageFXSockets = T.RT_1,
    FootType = "heeledMid",
    HeadScale = 0.931,
    HitMontageRule = "RoleDefault",
    KawaiiIdList = T.RT_21,
    ModelId = 210211,
    ModelScale = 0.9785,
    MontageFolder = "/Game/Asset/Char/Player/Char005_Shuimu/Animation/Montage/",
    MontagePrefix = "Shuimu_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char005_Shuimu/Mesh/Shuimu_SM.Shuimu_SM",
    StandId = "005",
    WeaponScale = 0.9785
  },
  [210212] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/JH_Xianfeng/ABP_Mon_JH_Xianfeng.ABP_Mon_JH_Xianfeng_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Eve_Summon_Soldier_",
    DamageFXSockets = T.RT_3,
    HitMontageRule = "MonDefault",
    ModelId = 210212,
    ModelScale = 0.7,
    MontageFolder = "/Game/Asset/Char/Player/Char035_Eve/Animation/Summon/Montage/",
    MontagePrefix = "Eve_Summon_Soldier_",
    SkeletonMeshPath = "Asset/Char/Monster/HX_Tianshi/Mesh/HX_Tianshi_SM.HX_Tianshi_SM",
    WeaponScale = 0.7
  },
  [210213] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_Zhihui/ABP_Mon_Jt_Zhihui.ABP_Mon_Jt_Zhihui_C'",
    AssistSockets = T.RT_3,
    AudioPrefix = "JT_Zhihui_",
    AvatarExpressionPrefix = "Zhihui_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 210213,
    ModelScale = 1.2,
    MontageFolder = "/Game/Asset/Char/Monster/JT_Zhihui/Animation/Montage/",
    MontagePrefix = "JT_Zhihui_",
    MoveParameters = T.RT_15,
    SkeletonMeshPath = "Asset/Char/Monster/Jt_Zhihui/Mesh/JT_Zhihui_SM.JT_Zhihui_SM"
  },
  [210214] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_05_Lianhuo/ABP_Boss_Lianhuo.ABP_Boss_Lianhuo_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_Lianhuo_",
    CondemnBoneName = T.RT_23,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "BossLianhuo",
    ModelId = 210214,
    ModelScale = 0.8,
    MontageFolder = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/",
    MontagePrefix = "Boss_Lianhuo_",
    MoveParameters = T.RT_24,
    PenalizeParam = T.RT_26,
    SkeletonMeshPath = "Asset/Char/Player/Char035_Eve/Mesh/Eve_Summoned_Queen.Eve_Summoned_Queen",
    WeaponScale = 0.8
  },
  [230101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Zhangyu/ABP_Zhangyu_Summoned.ABP_Zhangyu_Summoned_C'",
    AudioPrefix = "Zhangyu_Tentacle_",
    BirthTime = -1,
    HitMontageRule = "OnlyDieWithDissolve",
    ModelId = 230101,
    MontageFolder = "/Game/Asset/Char/Player/Char004_Zhangyu/Animation/Tentacle/Montage/",
    MontagePrefix = "Zhangyu_Tentacle_",
    SkeletonMeshPath = "Asset/Char/Player/Char004_Zhangyu/Mesh/Zhangyu_Part03_SM.Zhangyu_Part03_SM"
  },
  [240101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Baiheng/ABP_Baiheng_Summoned.ABP_Baiheng_Summoned_C'",
    AudioPrefix = "Baiheng_Summon_",
    HitMontageRule = "OnlyDieWithDissolve",
    ModelId = 240101,
    MontageFolder = "/Game/Asset/Char/Player/Char015_Baiheng/Animation/Summon/Montage/",
    MontagePrefix = "Baiheng_Summon_",
    SkeletonMeshPath = "Asset/Char/Player/Char015_Baiheng/Mesh/Baiheng_Summon_SM.Baiheng_Summon_SM"
  },
  [240102] = {
    ModelId = 240102,
    SkeletonMeshPath = "Asset/Char/Player/Char015_Baiheng/Mesh/Baiheng_Part01_SM.Baiheng_Part01_SM"
  },
  [310101] = {
    ModelId = 310101,
    SkeletonMeshPath = "Asset/Char/Player/Char011_Linen/Mesh/Linen_WP01_SM.Linen_WP01_SM",
    StandId = "003"
  },
  [310102] = {
    ModelId = 310102,
    SkeletonMeshPath = "Asset/Char/Player/Char011_Linen/Mesh/Linen_WP02_SM.Linen_WP02_SM",
    StandId = "003"
  },
  [310103] = {
    ModelId = 310103,
    SkeletonMeshPath = "Asset/Char/Player/Char011_Linen/Mesh/Linen_Part02_SM.Linen_Part02_SM"
  },
  [310201] = {
    ModelId = 310201,
    SkeletonMeshPath = "Asset/Char/Player/Char023_Xier/Mesh/Xier_WP01_SM.Xier_WP01_SM",
    StandId = "003"
  },
  [310202] = {
    ModelId = 310202,
    SkeletonMeshPath = "Asset/Char/Player/Char023_Xier/Mesh/Xier_WP03_SM.Xier_WP03_SM",
    StandId = "003"
  },
  [310203] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Xier/ABP_Xier_Summoned.ABP_Xier_Summoned_C'",
    ModelId = 310203,
    SkeletonMeshPath = "Asset/Char/Player/Char023_Xier/Mesh/Xier_Part01_SM.Xier_Part01_SM",
    StandId = "003"
  },
  [310204] = {
    ModelId = 310204,
    SkeletonMeshPath = "Asset/Char/Player/Char023_Xier/Mesh/Xier_Part05_SM.Xier_Part05_SM"
  },
  [310205] = {
    ModelId = 310205,
    SkeletonMeshPath = "Asset/Char/Player/Char023_Xier/Mesh/Xier_Part07_SM.Xier_Part07_SM"
  },
  [310206] = {
    ModelId = 310206,
    SkeletonMeshPath = "Asset/Char/Player/Char023_Xier/Mesh/Xier_Part02_SM.Xier_Part02_SM"
  },
  [310207] = {
    ModelId = 310207,
    SkeletonMeshPath = "Asset/Char/Player/Char023_Xier/Mesh/Xier_Part04_SM.Xier_Part04_SM"
  },
  [310208] = {
    ModelId = 310208,
    SkeletonMeshPath = "Asset/Char/Player/Char023_Xier/Mesh/Xier_Part03_SM.Xier_Part03_SM"
  },
  [310301] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Yeer/ABP_Yeer_Summoned.ABP_Yeer_Summoned_C'",
    AudioPrefix = "Yeer_Summon_",
    BirthTime = -1,
    ModelId = 310301,
    MontageFolder = "/Game/Asset/Char/Player/Char017_Yeer/Animation/Summon/Montage/",
    MontagePrefix = "Yeer_Summon_",
    SkeletonMeshPath = "Asset/Char/Player/Char017_Yeer/Mesh/Yeer_Sum_SM.Yeer_Sum_SM"
  },
  [310303] = {
    ModelId = 310303,
    SkeletonMeshPath = "Asset/Char/Player/Char017_Yeer/Mesh/Yeer_Sum_SM.Yeer_Sum_SM"
  },
  [310304] = {
    ModelId = 310304,
    SkeletonMeshPath = "Asset/Char/Player/Char017_Yeer/Mesh/Yeer_Sum02_SM.Yeer_Sum02_SM"
  },
  [320201] = {
    ModelId = 320201,
    SkeletonMeshPath = "Asset/Char/Player/Char014_Kami/Mesh/Kami_Part01_SM.Kami_Part01_SM"
  },
  [320202] = {
    ModelId = 320202,
    SkeletonMeshPath = "Asset/Char/Player/Char014_Kami/Mesh/Kami_Part02_SM.Kami_Part02_SM"
  },
  [320203] = {
    ModelId = 320203,
    SkeletonMeshPath = "Asset/Char/Player/Char014_Kami/Mesh/Kami_Part03_SM.Kami_Part03_SM"
  },
  [320204] = {
    ModelId = 320204,
    SkeletonMeshPath = "Asset/Char/Player/Char014_Kami/Mesh/Kami_Part05_SM.Kami_Part05_SM"
  },
  [320205] = {
    ModelId = 320205,
    SkeletonMeshPath = "Asset/Char/Player/Char014_Kami/Mesh/Kami_Part06_SM.Kami_Part06_SM"
  },
  [330101] = {
    ModelId = 330101,
    SkeletonMeshPath = "Asset/Char/Player/Char024_Maer/Mesh/Maer_Part01_SM.Maer_Part01_SM"
  },
  [410101] = {
    ModelId = 410101,
    SkeletonMeshPath = "Asset/Char/Player/Char020_Lise/Mesh/Lise_Part01_SM.Lise_Part01_SM"
  },
  [410201] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Zhiliu/ABP_Zhiliu_Summoned.ABP_Zhiliu_Summoned_C'",
    ModelId = 410201,
    SkeletonMeshPath = "Asset/Char/Player/Char029_Zhiliu/Mesh/Zhiliu_Sum_SM.Zhiliu_Sum_SM"
  },
  [420101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Yuming/ABP_Yuming_Summoned.ABP_Yuming_Summoned_C'",
    AudioPrefix = "Yuming_Summon_",
    BirthTime = -1,
    ModelId = 420101,
    MontageFolder = "/Game/Asset/Char/Player/Char008_Yuming/Animation/Summon/Montage/",
    MontagePrefix = "Yuming_Summon_",
    SkeletonMeshPath = "Asset/Char/Player/Char008_Yuming/Mesh/Yuming_Summon_SM.Yuming_Summon_SM"
  },
  [420102] = {
    ModelId = 420102,
    SkeletonMeshPath = "Asset/Char/Player/Char008_Yuming/Mesh/Yuming_Part01_SM.Yuming_Part01_SM"
  },
  [420201] = {
    HitMontageRule = "NoHitOrDie",
    ModelId = 420201,
    SkeletonMeshPath = "Asset/Char/Player/Char012_Landi/Mesh/Landi_Part01_SM.Landi_Part01_SM"
  },
  [420202] = {
    ModelId = 420202,
    SkeletonMeshPath = "Asset/Char/Player/Char012_Landi/Mesh/Landi_Part02_SM.Landi_Part02_SM"
  },
  [420203] = {
    ModelId = 420203,
    SkeletonMeshPath = "Asset/Char/Player/Char012_Landi/Mesh/Landi_Part03_SM.Landi_Part03_SM"
  },
  [430101] = {
    AvatarExpressionPrefix = "Xibi_",
    HitMontageRule = "NoHitOrDie",
    ModelId = 430101
  },
  [510101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Songlu/ABP_Songlu_Summoned.ABP_Songlu_Summoned_C'",
    AudioPrefix = "Songlu_Summon_",
    AvatarExpressionPrefix = "Zhengzi_",
    BirthTime = -1,
    FootType = "SongluSummon",
    ModelId = 510101,
    MontageFolder = "/Game/Asset/Char/Player/Char021_Songlu/Animation/Summon/Montage/",
    MontagePrefix = "Songlu_Summon_",
    SkeletonMeshPath = "Asset/Char/Player/Char021_Songlu/Mesh/Songlu_Summon_SM.Songlu_Summon_SM"
  },
  [510198] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Songlu/ABP_Songlu01_Summoned.ABP_Songlu01_Summoned_C'",
    AudioPrefix = "Songlu_Summon_",
    AvatarExpressionPrefix = "Zhengzi_",
    BirthTime = -1,
    FootType = "SongluSummon",
    IsSkinModel = true,
    ModelId = 510198,
    MontageFolder = "/Game/Asset/Char/Player/Char099_Songlu01/Animation/Summon/Montage/",
    MontagePrefix = "Songlu_Summon_",
    SkeletonMeshPath = "Asset/Char/Player/Char099_Songlu01/Mesh/Songlu_SP01_Sum_SM.Songlu_SP01_Sum_SM"
  },
  [510199] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Songlu/ABP_Songlu01.ABP_Songlu01_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Songlu_",
    BuffLightMeshPath = "/Game/Asset/Char/Player/Char099_Songlu01/Mesh/Songlu_Part05_SM.Songlu_Part05_SM",
    DamageFXSockets = T.RT_1,
    FootType = "heeledLight",
    HeadScale = 0.98,
    HitMontageRule = "RoleDefault",
    IsSkinModel = true,
    ModelId = 510199,
    MontageFolder = "/Game/Asset/Char/Player/Char099_Songlu01/Animation/Montage/",
    MontagePrefix = "Songlu_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char099_Songlu01/Mesh/Songlu_SP01_SM.Songlu_SP01_SM",
    StandId = "007",
    WeaponScale = 0.8
  },
  [510201] = {
    ModelId = 510201,
    SkeletonMeshPath = "Asset/Char/Player/Char018_Aote/Mesh/Aote_Part01_SM.Aote_Part01_SM"
  },
  [510202] = {
    ModelId = 510202,
    SkeletonMeshPath = "Asset/Char/Player/Char018_Aote/Mesh/Aote_Part02_SM.Aote_Part02_SM"
  },
  [530102] = {
    ModelId = 530102,
    SkeletonMeshPath = "Asset/Char/Player/Char010_Saiqi/Mesh/Saiqi_Part02_SM.Saiqi_Part02_SM"
  },
  [530198] = {
    IsSkinModel = true,
    ModelId = 530198,
    SkeletonMeshPath = "Asset/Char/Player/Char098_Saiqi01/Mesh/Saiqi_SP01_Part02_SM.Saiqi_SP01_Part02_SM"
  },
  [530199] = {
    AccessoryMeshPath = T.RT_47,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Saiqi/ABP_Saiqi01.ABP_Saiqi01_C'",
    AssistSockets = T.RT_1,
    AudioPrefix = "Saiqi01_",
    DamageFXSockets = T.RT_1,
    FootType = "heeledMid",
    HeadScale = 0.98,
    HitMontageRule = "RoleDefault",
    IsSkinModel = true,
    ModelId = 530199,
    ModelTag = T.RT_17,
    MontageFolder = "/Game/Asset/Char/Player/Char098_Saiqi01/Animation/Montage/",
    MontagePrefix = "Saiqi_",
    RunStopStartTime = 0.23,
    SkeletonMeshPath = "Asset/Char/Player/Char098_Saiqi01/Mesh/Saiqi_SP01_SM.Saiqi_SP01_SM",
    StandId = "010",
    WeaponScale = 1
  },
  [600101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Gr_Jichong/ABP_Mon_Gr_Jichong.ABP_Mon_Gr_Jichong_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "GR_Jichong_",
    BehaviorMontageGroupId = 6001,
    DamageFXSockets = T.RT_4,
    EffectShape = "Special_M",
    HitMontageRule = "MonDefault",
    ModelId = 600101,
    MontageFolder = "/Game/Asset/Char/Monster/GR_Jichong/Animation/Montage/",
    MontagePrefix = "GR_Jichong_",
    SkeletonMeshPath = "Asset/Char/Monster/GR_Jichong/Mesh/GR_Jichong_SM.GR_Jichong_SM"
  },
  [600201] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Gr_Youji/ABP_Mon_GR_Youji.ABP_Mon_GR_Youji_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Gr_Youji_",
    BehaviorMontageGroupId = 6002,
    DamageFXSockets = T.RT_4,
    EffectShape = "Human_S",
    HitMontageRule = "MonDefault",
    ModelId = 600201,
    MontageFolder = "/Game/Asset/Char/Monster/GR_Youji/Animation/Montage/",
    MontagePrefix = "GR_Youji_",
    MoveParameters = T.RT_48,
    SkeletonMeshPath = "Asset/Char/Monster/GR_Youji/Mesh/GR_Youji_SM.GR_Youji_SM"
  },
  [600202] = {
    ModelId = 600202,
    SkeletonMeshPath = "Asset/Char/Monster/GR_Youji/Mesh/GR_Youji_WP_SM.GR_Youji_WP_SM"
  },
  [600301] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Gr_Piaofu/ABP_Mon_Gr_Piaofu.ABP_Mon_Gr_Piaofu_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "GR_Piaofu_",
    BehaviorMontageGroupId = 6003,
    DamageFXSockets = T.RT_3,
    EffectShape = "Special_S",
    HitMontageRule = "GRPiaofu",
    ModelId = 600301,
    MontageFolder = "/Game/Asset/Char/Monster/GR_Piaofu/Animation/Montage/",
    MontagePrefix = "GR_Piaofu_",
    SkeletonMeshPath = "Asset/Char/Monster/GR_Piaofu/Mesh/GR_Piaofu_SM.GR_Piaofu_SM"
  },
  [600401] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Gr_Baotu/ABP_Mon_Gr_Baotu.ABP_Mon_Gr_Baotu_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "GR_Baotu_",
    AvatarExpressionPrefix = "Baotu_",
    BehaviorMontageGroupId = 6004,
    DamageFXSockets = T.RT_4,
    EffectShape = "Special_L",
    HitMontageRule = "MonNoRagdoll",
    ModelId = 600401,
    ModelScale = 1.3,
    MontageFolder = "/Game/Asset/Char/Monster/GR_Baotu/Animation/Montage/",
    MontagePrefix = "GR_Baotu_",
    SkeletonMeshPath = "Asset/Char/Monster/GR_Baotu/Mesh/GR_Baotu_SM.GR_Baotu_SM"
  },
  [600402] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Gr_Baotu/ABP_Mon_Gr_Baotu.ABP_Mon_Gr_Baotu_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "GR_Baotu_",
    BehaviorMontageGroupId = 6004,
    DamageFXSockets = T.RT_4,
    EffectShape = "Special_L",
    HitMontageRule = "MonNoRagdoll",
    ModelId = 600402,
    ModelScale = 2.5,
    MontageFolder = "/Game/Asset/Char/Monster/GR_Baotu/Animation/Montage/",
    MontagePrefix = "GR_Baotu_",
    SkeletonMeshPath = "Asset/Char/Monster/GR_Baotu/Mesh/GR_Baotu_SM.GR_Baotu_SM"
  },
  [600501] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Gr_Longcao/ABP_Mon_Gr_Longcao.ABP_Mon_Gr_Longcao_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "GR_Longcao_",
    BehaviorMontageGroupId = 6005,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonGRLongcao",
    ModelId = 600501,
    ModelScale = 1.5,
    MontageFolder = "/Game/Asset/Char/Monster/GR_Longcao/Animation/Montage/",
    MontagePrefix = "GR_Longcao_",
    SkeletonMeshPath = "Asset/Char/Monster/GR_Longcao/Mesh/Gr_Longcao_SM.Gr_Longcao_SM"
  },
  [600601] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/GR_Banyun/ABP_Mon_GR_Banyun.ABP_Mon_GR_Banyun_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "GR_Banyun_",
    BehaviorMontageGroupId = 6006,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 600601,
    ModelScale = 0.8,
    MontageFolder = "/Game/Asset/Char/Monster/GR_Banyun/Animation/Montage/",
    MontagePrefix = "GR_Banyun_",
    SkeletonMeshPath = "Asset/Char/Monster/GR_Banyun/Mesh/GR_Banyun_SM.GR_Banyun_SM"
  },
  [600602] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/GR_Banyun/ABP_Mon_GR_Banyun.ABP_Mon_GR_Banyun_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "GR_Banyun_",
    BehaviorMontageGroupId = 6006,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 600602,
    ModelScale = 1.5,
    MontageFolder = "/Game/Asset/Char/Monster/GR_Banyun/Animation/Montage/",
    MontagePrefix = "GR_Banyun_",
    SkeletonMeshPath = "Asset/Char/Monster/GR_Banyun/Mesh/GR_Banyun_SM.GR_Banyun_SM"
  },
  [600701] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/GR_Zhuoxin/ABP_Mon_GR_Zhuoxin.ABP_Mon_GR_Zhuoxin_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "GR_Zhuoxin_",
    BehaviorMontageGroupId = 6007,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonNoRagdoll",
    ModelId = 600701,
    MontageFolder = "/Game/Asset/Char/Monster/GR_Zhuoxin/Animation/Montage/",
    MontagePrefix = "GR_Zhuoxin_",
    SkeletonMeshPath = "Asset/Char/Monster/GR_Zhuoxin/Mesh/GR_Zhuoxin_SM.GR_Zhuoxin_SM"
  },
  [601501] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/GR_Zhuoxin/ABP_Mon_GR_Zhuoxin.ABP_Mon_GR_Zhuoxin_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "GR_Fangjin_",
    BehaviorMontageGroupId = 6015,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonNoRagdoll",
    ModelId = 601501,
    MontageFolder = "/Game/Asset/Char/Monster/GR_Fangjin/Animation/Montage/",
    MontagePrefix = "GR_Fangjin_",
    SkeletonMeshPath = "Asset/Char/Monster/GR_Fangjin/Mesh/GR_Fangjin_SM.GR_Fangjin_SM"
  },
  [601601] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Gr_Youji/ABP_Mon_GR_Youji.ABP_Mon_GR_Youji_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "GR_Eshi_",
    BehaviorMontageGroupId = 6016,
    DamageFXSockets = T.RT_4,
    EffectShape = "Human_S",
    HitMontageRule = "MonDefault",
    ModelId = 601601,
    MontageFolder = "/Game/Asset/Char/Monster/GR_Eshi/Animation/Montage/",
    MontagePrefix = "GR_Eshi_",
    MoveParameters = T.RT_48,
    SkeletonMeshPath = "Asset/Char/Monster/GR_Eshi/Mesh/GR_Eshi_SM.GR_Eshi_SM"
  },
  [601701] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Gr_Jichong/ABP_Mon_Gr_Jichong.ABP_Mon_Gr_Jichong_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "GR_Kuirui_",
    BehaviorMontageGroupId = 6017,
    DamageFXSockets = T.RT_4,
    EffectShape = "Special_M",
    HitMontageRule = "MonDefault",
    ModelId = 601701,
    MontageFolder = "/Game/Asset/Char/Monster/GR_Kuirui/Animation/Montage/",
    MontagePrefix = "GR_Kuirui_",
    SkeletonMeshPath = "Asset/Char/Monster/GR_Kuirui/Mesh/GR_Kuirui_SM.GR_Kuirui_SM"
  },
  [700001] = {
    ModelId = 700001,
    SkeletonMeshPath = "Asset/Char/Monster/Common/Weapon/Single/JT_Disarm/Mesh/JT_Disarm_WP_SM.JT_Disarm_WP_SM"
  },
  [700101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_Juji/ABP_Mon_JT_Juji.ABP_Mon_JT_Juji_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "JT_Juji_",
    BehaviorMontageGroupId = 7001,
    DamageFXSockets = T.RT_4,
    EffectShape = "Human_S",
    HitMontageRule = "MonDefault",
    ModelId = 700101,
    MontageFolder = "/Game/Asset/Char/Monster/JT_Juji/Animation/Montage/",
    MontagePrefix = "JT_Juji_",
    MoveParameters = T.RT_15,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Juji/Mesh/JT_Juji_SM.JT_Juji_SM"
  },
  [700102] = {
    ModelId = 700102,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Juji/Mesh/JT_Juji_WP_SM.JT_Juji_WP_SM"
  },
  [700103] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_Juji/ABP_Mon_JT_Juji.ABP_Mon_JT_Juji_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "JT_Juji_",
    BehaviorMontageGroupId = 7001,
    DamageFXSockets = T.RT_4,
    EffectShape = "Human_S",
    HitMontageRule = "MonDefault",
    ModelId = 700103,
    ModelScale = 1.8,
    MontageFolder = "/Game/Asset/Char/Monster/JT_Juji/Animation/Montage/",
    MontagePrefix = "JT_Juji_",
    MoveParameters = T.RT_15,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Juji/Mesh/JT_Juji_SM.JT_Juji_SM"
  },
  [700104] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_Juji/ABP_Mon_JT_Juji.ABP_Mon_JT_Juji_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "JT_Juji_",
    BehaviorMontageGroupId = 7001,
    DamageFXSockets = T.RT_4,
    EffectShape = "Human_S",
    HitMontageRule = "MonDefault",
    ModelId = 700104,
    MontageFolder = "/Game/Asset/Char/Monster/JT_Juji/Animation/Montage/",
    MontagePrefix = "JT_Juji_",
    MoveParameters = T.RT_15,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Juji/Mesh/JT_Juji_SM.JT_Juji_SM"
  },
  [700201] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_Pizhuo/ABP_Mon_Jt_Pizhuo.ABP_Mon_Jt_Pizhuo_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "JT_Pizhuo_",
    BehaviorMontageGroupId = 7002,
    DamageFXSockets = T.RT_4,
    EffectShape = "Human_M",
    HitMontageRule = "MonDefault",
    ModelId = 700201,
    MontageFolder = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/",
    MontagePrefix = "JT_Pizhuo_",
    MoveParameters = T.RT_48,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Pizhuo/Mesh/JT_Pizhuo_SM.JT_Pizhuo_SM"
  },
  [700202] = {
    ModelId = 700202,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Pizhuo/Mesh/JT_Pizhuo_WP_SM.JT_Pizhuo_WP_SM"
  },
  [700203] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_Pizhuo/ABP_Mon_Jt_Pizhuo.ABP_Mon_Jt_Pizhuo_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "JT_Pizhuo_",
    BehaviorMontageGroupId = 7002,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 700203,
    MontageFolder = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/",
    MontagePrefix = "JT_Pizhuo_",
    MoveParameters = T.RT_48,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Pizhuo/Mesh/JT_Pizhuo_SM.JT_Pizhuo_SM"
  },
  [700204] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_Pizhuo/ABP_Mon_Jt_Pizhuo.ABP_Mon_Jt_Pizhuo_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "JT_Pizhuo_",
    BehaviorMontageGroupId = 7002,
    DamageFXSockets = T.RT_4,
    EffectShape = "Human_M",
    HitMontageRule = "MonDefault",
    ModelId = 700204,
    ModelScale = 1.5,
    MontageFolder = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/",
    MontagePrefix = "JT_Pizhuo_",
    MoveParameters = T.RT_48,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Pizhuo/Mesh/JT_Pizhuo_SM.JT_Pizhuo_SM"
  },
  [700301] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_Ranger/ABP_Mon_JT_Ranger.ABP_Mon_JT_Ranger_C'",
    AssistSockets = T.RT_3,
    AudioPrefix = "JT_Ranger_",
    BehaviorMontageGroupId = 7003,
    DamageFXSockets = T.RT_3,
    EffectShape = "Human_M",
    FootIKHeight = 10,
    HitMontageRule = "MonDefault",
    ModelId = 700301,
    MontageFolder = "/Game/Asset/Char/Monster/Jt_Ranger/Animation/Montage/",
    MontagePrefix = "JT_Ranger_",
    MoveParameters = T.RT_15,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Ranger/Mesh/JT_Ranger_SM.JT_Ranger_SM"
  },
  [700302] = {
    ModelId = 700302,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Ranger/Mesh/JT_Ranger_WP_SM.JT_Ranger_WP_SM"
  },
  [700401] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_Tuji/ABP_Mon_Jt_Tuji.ABP_Mon_Jt_Tuji_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "JT_Tuji_",
    BehaviorMontageGroupId = 7004,
    DamageFXSockets = T.RT_4,
    EffectShape = "Human_M",
    HitMontageRule = "MonDefault",
    ModelId = 700401,
    MontageFolder = "/Game/Asset/Char/Monster/JT_Tuji/Animation/Montage/",
    MontagePrefix = "JT_Tuji_",
    MoveParameters = T.RT_15,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Tuji/Mesh/JT_Tuji_SM.JT_Tuji_SM"
  },
  [700402] = {
    ModelId = 700402,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Tuji/Mesh/JT_Tuji_WP_Cudgel_SM_01.JT_Tuji_WP_Cudgel_SM_01"
  },
  [700403] = {
    ModelId = 700403,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Tuji/Mesh/JT_Tuji_WP_Shield_SM.JT_Tuji_WP_Shield_SM"
  },
  [700404] = {
    ModelId = 700404,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Tuji/Mesh/JT_Tuji_WP_Cudgel_SM_02.JT_Tuji_WP_Cudgel_SM_02"
  },
  [700405] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_Tuji/ABP_Mon_Jt_Tuji.ABP_Mon_Jt_Tuji_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "JT_Tuji_",
    BehaviorMontageGroupId = 7004,
    DamageFXSockets = T.RT_4,
    EffectShape = "Human_M",
    HitMontageRule = "MonDefault",
    ModelId = 700405,
    MontageFolder = "/Game/Asset/Char/Monster/JT_Tuji/Animation/Montage/",
    MontagePrefix = "JT_Tuji_",
    MoveParameters = T.RT_15,
    SkeletonMeshPath = "Asset/Char/Monster/NE_Kaiwen/Mesh/NE_Kaiwen_SM.NE_Kaiwen_SM"
  },
  [700601] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_HealRobot/ABP_Jt_HealRobot.ABP_Jt_HealRobot_C'",
    AssistSockets = T.RT_3,
    AudioPrefix = "JT_HealRobot_",
    DamageFXSockets = T.RT_4,
    EffectShape = "Special_S",
    HitMontageRule = "MonJTHealRobot",
    ModelId = 700601,
    MontageFolder = "/Game/Asset/Char/Monster/JT_HealRobot/Animation/Montage/",
    MontagePrefix = "JT_HealRobot_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_HealRobot/Mesh/JT_HealRobot_SM.JT_HealRobot_SM"
  },
  [700701] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_BlastRobot/ABP_Jt_BlastRobot.ABP_Jt_BlastRobot_C'",
    AssistSockets = T.RT_49,
    AudioPrefix = "JT_BlastRobot_",
    DamageFXSockets = T.RT_49,
    EffectShape = "Special_S",
    HitMontageRule = "MonJTBlastRobot",
    ModelId = 700701,
    MontageFolder = "/Game/Asset/Char/Monster/JT_BlastRobot/Animation/Montage/",
    MontagePrefix = "JT_BlastRobot_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_BlastRobot/Mesh/JT_BlastRobot_SM.JT_BlastRobot_SM"
  },
  [700702] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_BlastRobot/ABP_Jt_BlastRobot.ABP_Jt_BlastRobot_C'",
    AssistSockets = T.RT_49,
    AudioPrefix = "JT_BlastRobot_",
    DamageFXSockets = T.RT_49,
    HitMontageRule = "MonJTBlastRobot",
    ModelId = 700702,
    MontageFolder = "/Game/Asset/Char/Monster/JT_BlastRobot/Animation/Montage/",
    MontagePrefix = "JT_BlastRobot_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_BlastRobot/Mesh/JT_BlastRobot_SM.JT_BlastRobot_SM"
  },
  [700801] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_Zhihui/ABP_Mon_Jt_Zhihui.ABP_Mon_Jt_Zhihui_C'",
    AssistSockets = T.RT_3,
    AudioPrefix = "JT_Zhihui_",
    AvatarExpressionPrefix = "Zhihui_",
    BehaviorMontageGroupId = 7008,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 700801,
    ModelScale = 1.2,
    MontageFolder = "/Game/Asset/Char/Monster/JT_Zhihui/Animation/Montage/",
    MontagePrefix = "JT_Zhihui_",
    MoveParameters = T.RT_15,
    SkeletonMeshPath = "Asset/Char/Monster/Jt_Zhihui/Mesh/JT_Zhihui_SM.JT_Zhihui_SM"
  },
  [700802] = {
    ModelId = 700802,
    SkeletonMeshPath = "Asset/Char/Monster/Jt_Zhihui/Mesh/JT_Zhihui_WP_Sword_SM.JT_Zhihui_WP_Sword_SM"
  },
  [700803] = {
    ModelId = 700803,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Zhihui/Mesh/JT_Zhihui_WP_Gun_SM.JT_Zhihui_WP_Gun_SM"
  },
  [700901] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/JT_Zhiren/ABP_Mon_JT_Zhiren.ABP_Mon_JT_Zhiren_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "JT_Zhiren_",
    BehaviorMontageGroupId = 7009,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 700901,
    ModelScale = 0.9,
    MontageFolder = "/Game/Asset/Char/Monster/JT_Zhiren/Animation/Montage/",
    MontagePrefix = "JT_Zhiren_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_Zhiren/Mesh/JT_Zhiren_SM.JT_Zhiren_SM"
  },
  [701001] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jh_Shenfu/ABP_Mon_JH_Shenfu.ABP_Mon_JH_Shenfu_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "JT_Zhijian_",
    BehaviorMontageGroupId = 7010,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 701001,
    MontageFolder = "/Game/Asset/Char/Monster/JT_Zhijian/Animation/Montage/",
    MontagePrefix = "JT_Zhijian_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_Zhijian/Mesh/JT_Zhijian_SM.JT_Zhijian_SM"
  },
  [701002] = {
    ModelId = 701002,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Zhijian/Mesh/JT_Zhijian_WP_SM.JT_Zhijian_WP_SM"
  },
  [701003] = {
    ModelId = 701003,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Zhijian/Mesh/JT_Zhijian_Part01_SM.JT_Zhijian_Part01_SM"
  },
  [701201] = {
    ModelId = 701201,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Pizhuo/Mesh/JT_Pizhuo_WP02_SM.JT_Pizhuo_WP02_SM"
  },
  [701301] = {
    ModelId = 701301,
    SkeletonMeshPath = "Asset/Char/Monster/JT_Ranger/Mesh/JT_Ranger_WP02_SM.JT_Ranger_WP02_SM"
  },
  [701501] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/GR_Zhuoxin/ABP_Mon_GR_Zhuoxin.ABP_Mon_GR_Zhuoxin_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "GR_Zhuoxin_",
    BehaviorMontageGroupId = 7015,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonNoRagdoll",
    ModelId = 701501,
    MontageFolder = "/Game/Asset/Char/Monster/JT_Jingjie/Animation/Montage/",
    MontagePrefix = "JT_Jingjie_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_Jingjie/Mesh/JT_Jingjie_SM.JT_Jingjie_SM"
  },
  [701601] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/JT_Zhiyan/ABP_Mon_JT_Zhiyan.ABP_Mon_JT_Zhiyan_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "JT_Zhiyan_",
    DamageFXSockets = T.RT_3,
    EffectShape = "Special_L",
    HitMontageRule = "MonDefault",
    ModelId = 701601,
    MontageFolder = "/Game/Asset/Char/Monster/JT_Zhiyan/Animation/Montage/",
    MontagePrefix = "JT_Zhiyan_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_Juji/Mesh/JT_Juji_Sum_SM.JT_Juji_Sum_SM"
  },
  [800101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jh_Zhishi/ABP_Mon_JH_Zhishi.ABP_Mon_JH_Zhishi_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "JH_Zhishi_",
    BehaviorMontageGroupId = 8001,
    DamageFXSockets = T.RT_3,
    HitMontageRule = "MonDefault",
    ModelId = 800101,
    ModelScale = 1.1,
    MontageFolder = "/Game/Asset/Char/Monster/JH_Zhishi/Animation/Montage/",
    MontagePrefix = "JH_Zhishi_",
    SkeletonMeshPath = "Asset/Char/Monster/JH_Zhishi/Mesh/JH_Zhishi_SM.JH_Zhishi_SM"
  },
  [800102] = {
    ModelId = 800102,
    SkeletonMeshPath = "Asset/Char/Monster/JH_Zhishi/Mesh/JH_Zhishi_WP_SM.JH_Zhishi_WP_SM"
  },
  [800103] = {
    ModelAixsScale = {
      0.5,
      0.5,
      0.5
    },
    ModelId = 800103,
    SkeletonMeshPath = "Asset/Char/Monster/JH_Xianfeng/Mesh/JH_Xianfeng_WP_SM.JH_Xianfeng_WP_SM"
  },
  [800201] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/JH_Xianfeng/ABP_Mon_JH_Xianfeng.ABP_Mon_JH_Xianfeng_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "JH_Xianfeng_",
    BehaviorMontageGroupId = 8002,
    DamageFXSockets = T.RT_3,
    HitMontageRule = "MonDefault",
    ModelId = 800201,
    ModelScale = 1.1,
    MontageFolder = "/Game/Asset/Char/Monster/JH_Xianfeng/Animation/Montage/",
    MontagePrefix = "JH_Xianfeng_",
    SkeletonMeshPath = "Asset/Char/Monster/JH_Xianfeng/Mesh/JH_Xianfeng_SM.JH_Xianfeng_SM"
  },
  [800202] = {
    ModelId = 800202,
    SkeletonMeshPath = "Asset/Char/Monster/JH_Xianfeng/Mesh/JH_Xianfeng_WP_SM.JH_Xianfeng_WP_SM"
  },
  [800301] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jh_Shenfu/ABP_Mon_JH_Shenfu.ABP_Mon_JH_Shenfu_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "JH_Shenfu_",
    BehaviorMontageGroupId = 8003,
    DamageFXSockets = T.RT_3,
    HitMontageRule = "MonDefault",
    ModelId = 800301,
    ModelScale = 1.1,
    MontageFolder = "/Game/Asset/Char/Monster/JH_Shenfu/Animation/Montage/",
    MontagePrefix = "JH_Shenfu_",
    SkeletonMeshPath = "Asset/Char/Monster/JH_Shenfu/Mesh/JH_Shenfu_SM.JH_Shenfu_SM"
  },
  [800302] = {
    ModelId = 800302,
    SkeletonMeshPath = "Asset/Char/Monster/JH_Shenfu/Mesh/JH_Shenfu_WP02_SM.JH_Shenfu_WP02_SM"
  },
  [850001] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_00_Xibi/ABP_Boss_Xibi.ABP_Boss_Xibi_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_Xibi_",
    CondemnBoneName = T.RT_51,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "BossXibi",
    ModelId = 850001,
    MontageFolder = "/Game/Asset/Char/Monster/Boss00_Xibi/Animation/Montage/",
    MontagePrefix = "Boss_Xibi_",
    MoveParameters = T.RT_24,
    SkeletonMeshPath = "Asset/Char/Player/Char009_Xibi/Mesh/Xibi_SM.Xibi_SM"
  },
  [850002] = {
    ModelId = 850002,
    SkeletonMeshPath = "Asset/Char/Monster/Boss00_Xibi/Mesh/Boss_Xibi_WP_SM.Boss_Xibi_WP_SM"
  },
  [850101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_04_Lizhan/ABP_Boss_Lizhan.ABP_Boss_Lizhan_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_Lizhan_",
    CondemnBoneName = {
      CondemnSocket = "Root",
      LocationOffset = {
        240,
        100,
        0
      }
    },
    DamageFXSockets = T.RT_4,
    HitMontageRule = "BossLizhan",
    ModelId = 850101,
    MontageFolder = "/Game/Asset/Char/Monster/Boss06_Lizhan/Animation/Montage/",
    MontagePrefix = "Boss_Lizhan_",
    MoveParameters = T.RT_24,
    SkeletonMeshPath = "Asset/Char/Monster/Boss06_Lizhan/Mesh/Boss_Lizhan_SM.Boss_Lizhan_SM"
  },
  [850102] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_04_Lizhan/ABP_Boss_Lizhan.ABP_Boss_Lizhan_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_Lizhan_",
    CondemnBoneName = T.RT_51,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "BossLizhan",
    ModelId = 850102,
    ModelScale = 0.8,
    MontageFolder = "/Game/Asset/Char/Monster/Boss06_Lizhan/Animation/Montage/",
    MontagePrefix = "Boss_Lizhan_",
    MoveParameters = T.RT_24,
    SkeletonMeshPath = "Asset/Char/Monster/Boss06_Lizhan/Mesh/Boss_Lizhan_SM.Boss_Lizhan_SM"
  },
  [850201] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_01_Saiqi/ABP_Boss_Saiqi.ABP_Boss_Saiqi_C'",
    AssistSockets = {
      "spine_01",
      "wing_left01_e2",
      "wing_left01_e3",
      "wing_right01_e3",
      "wing_right01_e2"
    },
    AudioPrefix = "Boss_Saiqi_",
    CondemnBoneName = T.RT_53,
    DamageFXSockets = {"hit2"},
    HitMontageRule = "BossSaiqi",
    ModelId = 850201,
    MontageFolder = "/Game/Asset/Char/Monster/Boss01_Saiqi01/Animation/Montage/",
    MontagePrefix = "Boss_Saiqi_",
    MoveParameters = T.RT_24,
    SkeletonMeshPath = "Asset/Char/Monster/Boss01_Saiqi01/Mesh/BossSaiqi_SM.BossSaiqi_SM"
  },
  [850202] = {
    ModelId = 850202,
    SkeletonMeshPath = "Asset/Char/Monster/Boss01_Saiqi01/Mesh/BossSaiqi_WP_SM.BossSaiqi_WP_SM"
  },
  [850301] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_02_Shijingzhe/ABP_Boss_Shijingzhe.ABP_Boss_Shijingzhe_C'",
    AudioPrefix = "Boss_Shijingzhe_",
    CondemnBoneName = {
      CondemnSocket = "Head",
      LocationOffset = {
        120,
        97,
        -100
      }
    },
    HitCapsules = T.RT_54,
    HitMontageRule = "BossShijingzhe",
    ModelId = 850301,
    MontageFolder = "/Game/Asset/Char/Monster/Boss03_Shijingzhe/Animation/Montage/",
    MontagePrefix = "Boss_Shijingzhe_",
    PenalizeEffect = 850314,
    PenalizeParam = {
      PenalizeOffset = {
        0,
        0,
        150
      },
      PenalizeSocket = "tongue_01_c"
    },
    SkeletonMeshPath = "Asset/Char/Monster/Boss03_Shijingzhe/Mesh/Boss_Shijingzhe_SM.Boss_Shijingzhe_SM"
  },
  [850302] = {
    ModelId = 850302,
    SkeletonMeshPath = "Asset/Scene/common/BreakableItems/Mesh/Qua_Ore08_vat_mesh.Qua_Ore08_vat_mesh"
  },
  [850401] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_03_Saiqi02/ABP_Boss_Saiqi02.ABP_Boss_Saiqi02_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_Saiqi02_",
    CondemnBoneName = T.RT_53,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "BossSaiqi",
    ModelId = 850401,
    MontageFolder = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/",
    MontagePrefix = "Boss_Saiqi02_",
    MoveParameters = T.RT_24,
    SkeletonMeshPath = "Asset/Char/Monster/Boss04_Saiqi02/Mesh/Boss_Saiqi02_SM.Boss_Saiqi02_SM"
  },
  [850402] = {
    ModelId = 850402,
    SkeletonMeshPath = "Asset/Char/Monster/Boss01_Saiqi01/Mesh/BossSaiqi_WP_SM.BossSaiqi_WP_SM"
  },
  [850403] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_03_Saiqi02/ABP_Boss_Saiqi02.ABP_Boss_Saiqi02_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_Saiqi02_",
    CondemnBoneName = T.RT_53,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "BossSaiqi",
    ModelId = 850403,
    ModelScale = 2.1,
    MontageFolder = "/Game/Asset/Char/Monster/Boss04_Saiqi02/Animation/Montage/",
    MontagePrefix = "Boss_Saiqi02_",
    MoveParameters = T.RT_24,
    SkeletonMeshPath = "Asset/Char/Monster/Boss04_Saiqi02/Mesh/Boss_Saiqi02_SM.Boss_Saiqi02_SM"
  },
  [850501] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_05_Lianhuo/ABP_Boss_Lianhuo.ABP_Boss_Lianhuo_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_Lianhuo_",
    CondemnBoneName = T.RT_23,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "BossLianhuo",
    ModelId = 850501,
    MontageFolder = "/Game/Asset/Char/Monster/Boss05_Lianhuo/Animation/Montage/",
    MontagePrefix = "Boss_Lianhuo_",
    MoveParameters = T.RT_24,
    PenalizeParam = T.RT_26,
    SkeletonMeshPath = "Asset/Char/Monster/Boss05_Lianhuo/Mesh/Boss05_Lianhuo_SM.Boss05_Lianhuo_SM"
  },
  [850502] = {
    ModelId = 850502,
    ModelScale = 4,
    SkeletonMeshPath = "Asset/Char/Monster/Boss05_Lianhuo/Mesh/Boss05_Lianhuo_WP_SM.Boss05_Lianhuo_WP_SM"
  },
  [850601] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_06_Nvzhu/ABP_Boss_Nvzhu.ABP_Boss_Nvzhu_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_Nvzhu_",
    CloakMeshPath = "Asset/Char/Player/NPC004_WeitaF/Mesh/WeitaF_Cloak_SM.WeitaF_Cloak_SM",
    CondemnBoneName = T.RT_51,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "BossNvzhu",
    ModelId = 850601,
    MontageFolder = "/Game/Asset/Char/Monster/Boss07_Nvzhu/Animation/Montage/",
    MontagePrefix = "Boss_Nvzhu_",
    MoveParameters = T.RT_24,
    SkeletonMeshPath = "Asset/Char/Player/NPC004_WeitaF/Mesh/WeitaF_SM.WeitaF_SM"
  },
  [850701] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_07_Nanzhu/ABP_Boss_Nanzhu.ABP_Boss_Nanzhu_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_Nanzhu_",
    CloakMeshPath = "Asset/Char/Player/NPC005_WeitaM/Mesh/WeitaM_Cloak_SM.WeitaM_Cloak_SM",
    CondemnBoneName = T.RT_51,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "BossNvzhu",
    ModelId = 850701,
    MontageFolder = "/Game/Asset/Char/Monster/Boss08_Nanzhu/Animation/Montage/",
    MontagePrefix = "Boss_Nanzhu_",
    MoveParameters = T.RT_24,
    SkeletonMeshPath = "Asset/Char/Player/NPC005_WeitaM/Mesh/WeitaM_SM.WeitaM_SM"
  },
  [850702] = {
    ModelId = 850702,
    SkeletonMeshPath = "Asset/Char/Monster/Boss08_Nanzhu/Mesh/Boss_Nanzhu_WP_SM.Boss_Nanzhu_WP_SM"
  },
  [850901] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_09_Tuosi/ABP_Boss_Tuosi.ABP_Boss_Tuosi_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_Tuosi_",
    AvatarExpressionPrefix = "Tuosi02_",
    CondemnBoneName = T.RT_56,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "BossTuosi",
    ModelId = 850901,
    ModelScale = 1,
    MontageFolder = "/Game/Asset/Char/Monster/Boss09_Tuosi/Animation/Montage/",
    MontagePrefix = "Boss_Tuosi_",
    OverrideMaterialParam = T.RT_9,
    SkeletonMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi02B_SM.Tuosi02B_SM"
  },
  [850902] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_09_Tuosi/ABP_Boss_Tuosi.ABP_Boss_Tuosi_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_Tuosi_",
    AvatarExpressionPrefix = "Tuosi02_",
    CondemnBoneName = T.RT_56,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "BossTuosi",
    ModelId = 850902,
    ModelScale = 1,
    MontageFolder = "/Game/Asset/Char/Monster/Boss09_Tuosi/Animation/Montage/",
    MontagePrefix = "Boss_Tuosi_",
    OverrideMaterialParam = T.RT_10,
    SkeletonMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi02B_SM.Tuosi02B_SM"
  },
  [851001] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_10_Heilong/ABP_Boss_Heilong.ABP_Boss_Heilong_C'",
    AssistSockets = T.RT_3,
    AudioPrefix = "Boss_Heilong_",
    CondemnBoneName = {CondemnSocket = "Jaw02"},
    HitCapsules = T.RT_54,
    HitMontageRule = "BossShijingzhe",
    ModelId = 851001,
    ModelScale = 1,
    MontageFolder = "/Game/Asset/Char/Monster/Boss10_Heilong/Animation/Montage/",
    MontagePrefix = "Boss_Heilong_",
    PenalizeEffect = 850314,
    PenalizeParam = {
      PenalizeOffset = {
        60,
        -80,
        60
      },
      PenalizeSocket = "Jaw02"
    },
    SkeletonMeshPath = "Asset/Char/Monster/Boss10_Heilong/Mesh/Boss_Heilong_SM.Boss_Heilong_SM"
  },
  [851002] = {
    AssistSockets = T.RT_4,
    DamageFXSockets = T.RT_4,
    ModelId = 851002,
    SkeletonMeshPath = "Asset/Char/Monster/Animal07_Zhenzhu/Mesh/Mon_Zhenzhu_SM.Mon_Zhenzhu_SM"
  },
  [851201] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_12_Linen/ABP_Boss_Linen.ABP_Boss_Linen_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_Linen_",
    AvatarExpressionPrefix = "Linen_",
    CondemnBoneName = T.RT_53,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "BossLinen",
    ModelId = 851201,
    ModelScale = 1.35,
    MontageFolder = "/Game/Asset/Char/Monster/Boss12_Linen/Animation/Montage/",
    MontagePrefix = "Boss_Linen_",
    MoveParameters = T.RT_24,
    SkeletonMeshPath = "Asset/Char/Monster/Boss12_Linen/Mesh/Boss_Linen_SM.Boss_Linen_SM"
  },
  [851211] = {
    DamageFXSockets = T.RT_4,
    ModelId = 851211,
    SkeletonMeshPath = "Asset/Char/Monster/Boss12_Linen/Mesh/Boss_Linen_WP_08_SM.Boss_Linen_WP_08_SM"
  },
  [851212] = {
    DamageFXSockets = T.RT_4,
    ModelId = 851212,
    SkeletonMeshPath = "Asset/Char/Monster/Boss12_Linen/Mesh/Boss_Linen_WP_07_SM.Boss_Linen_WP_07_SM"
  },
  [851213] = {
    DamageFXSockets = T.RT_4,
    ModelId = 851213,
    SkeletonMeshPath = "Asset/Char/Monster/Boss12_Linen/Mesh/Boss_Linen_WP_06_SM.Boss_Linen_WP_06_SM"
  },
  [851301] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_13_Kuxiu/ABP_Boss_Kuxiu.ABP_Boss_Kuxiu_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_Kuxiu_",
    AvatarExpressionPrefix = "Kuxiu_",
    CondemnBoneName = T.RT_51,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "BossKuxiu",
    ModelId = 851301,
    ModelScale = 1.1,
    MontageFolder = "/Game/Asset/Char/Monster/Boss13_Kuxiu/Animation/Montage/",
    MontagePrefix = "Boss_Kuxiu_",
    SkeletonMeshPath = "Asset/Char/Monster/Boss13_Kuxiu/Mesh/Boss_Kuxiu_SM.Boss_Kuxiu_SM"
  },
  [851302] = {
    ModelId = 851302,
    SkeletonMeshPath = "Asset/Char/Monster/Boss13_Kuxiu/Mesh/Boss_Kuxiu_WP_SM.Boss_Kuxiu_WP_SM"
  },
  [851401] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_14_Shenpan/ABP_Boss_Shenpan.ABP_Boss_Shenpan_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_Shenpan_",
    CondemnBoneName = T.RT_51,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "BossShenpan",
    ModelId = 851401,
    ModelScale = 1.5,
    MontageFolder = "/Game/Asset/Char/Monster/Boss14_Shenpan/Animation/Montage/",
    MontagePrefix = "Boss_Shenpan_",
    SkeletonMeshPath = "Asset/Char/Monster/Boss14_Shenpan/Mesh/Boss_Shenpan_SM.Boss_Shenpan_SM"
  },
  [851402] = {
    ModelId = 851402,
    SkeletonMeshPath = "Asset/Char/Monster/Boss14_Shenpan/Mesh/Boss_Shenpan_WP01_SM.Boss_Shenpan_WP01_SM"
  },
  [851403] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_14_Shenpan/ABP_Boss_Shenpan.ABP_Boss_Shenpan_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_Shenpan_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "BossShenpan",
    ModelId = 851403,
    MontageFolder = "/Game/Asset/Char/Monster/Boss14_Shenpan/Animation/Montage/",
    MontagePrefix = "Boss_Shenpan_",
    SkeletonMeshPath = "Asset/Char/Monster/Boss14_Shenpan/Mesh/Boss_Shenpan_SM.Boss_Shenpan_SM"
  },
  [851501] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_15_Jushi/ABP_Boss_Jushi.ABP_Boss_Jushi_C'",
    AssistSockets = {"hit1", "weak"},
    AudioPrefix = "Boss_Jushi_",
    CondemnBoneName = {
      CondemnSocket = "Root",
      LocationOffset = {
        100,
        0,
        0
      }
    },
    DamageFXSockets = T.RT_4,
    HitMontageRule = "BossJushi",
    ModelId = 851501,
    ModelScale = 1.75,
    MontageFolder = "/Game/Asset/Char/Monster/Boss15_Jushi/Animation/Montage/",
    MontagePrefix = "Boss_Jushi_",
    SkeletonMeshPath = "Asset/Char/Monster/Boss15_Jushi/Mesh/Boss_Jushi_SM.Boss_Jushi_SM"
  },
  [851601] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_16_Fuer/ABP_Boss_Fuer.ABP_Boss_Fuer_C'",
    AssistSockets = {"_002_jnt", "_004_jnt"},
    AudioPrefix = "Boss_Fuer_",
    AvatarExpressionPrefix = "Fuer_",
    CondemnBoneName = {
      CondemnSocket = "Root",
      LocationOffset = {
        320,
        97,
        0
      }
    },
    DamageFXSockets = {"_002_jnt"},
    HitMontageRule = "BossFuer",
    ModelId = 851601,
    ModelScale = 0.5,
    MontageFolder = "/Game/Asset/Char/Monster/Boss16_Fuer/Animation/Montage/",
    MontagePrefix = "Boss_Fuer_",
    SkeletonMeshPath = "Asset/Char/Monster/Boss16_Fuer/Mesh/Boss_Fuer_SM.Boss_Fuer_SM"
  },
  [851701] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_17_Yuming/ABP_Boss_Yuming.ABP_Boss_Yuming_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_Yuming_",
    DamageFXSockets = T.RT_4,
    ModelId = 851701,
    MontageFolder = "/Game/Asset/Char/Monster/Boss17_Yuming/Animation/Montage/",
    MontagePrefix = "Boss_Yuming_",
    SkeletonMeshPath = "Asset/Char/Player/Char008_Yuming/Mesh/Yuming_SM.Yuming_SM"
  },
  [851702] = {
    ModelId = 851702,
    ModelScale = 1.2,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Polearm/Polearm_Zuiqian/Mesh/Polearm_Zuiqian_SM.Polearm_Zuiqian_SM"
  },
  [851703] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Yuming/ABP_Yuming_Summoned.ABP_Yuming_Summoned_C'",
    AudioPrefix = "Yuming_Summon_",
    BirthTime = -1,
    ModelId = 851703,
    ModelScale = 0.6,
    MontageFolder = "/Game/Asset/Char/Player/Char008_Yuming/Animation/Summon/Montage/",
    MontagePrefix = "Yuming_Summon_",
    SkeletonMeshPath = "Asset/Char/Player/Char008_Yuming/Mesh/Yuming_Summon_SM.Yuming_Summon_SM"
  },
  [851801] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_18_Juque/ABP_Boss_Juque.ABP_Boss_Juque_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_Juque_",
    CondemnBoneName = T.RT_23,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "BossJuque",
    ModelId = 851801,
    ModelScale = 1.4,
    MontageFolder = "/Game/Asset/Char/Monster/Boss18_Juque/Animation/Montage/",
    MontagePrefix = "Boss_Juque_",
    PenalizeParam = T.RT_26,
    SkeletonMeshPath = "Asset/Char/Monster/Boss18_Juque/Mesh/Boss_Juque_SM.Boss_Juque_SM"
  },
  [851901] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_15_Jushi/ABP_Boss_Jushi.ABP_Boss_Jushi_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_LiecheCannon_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonNoRagdoll",
    ModelId = 851901,
    ModelScale = 8,
    MontageFolder = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/",
    MontagePrefix = "Boss_LiecheCannon_",
    SkeletonMeshPath = "Asset/Char/Monster/Boss15_Jushi/Mesh/Boss_Jushi_SM.Boss_Jushi_SM"
  },
  [851902] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Boss_19_Lieche/ABP_Boss_LiecheHand.ABP_Boss_LiecheHand_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_LiecheHand_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonNoRagdoll",
    ModelId = 851902,
    ModelScale = 6.5,
    MontageFolder = "/Game/Asset/Char/Monster/Boss19_Lieche/Animation/Montage/",
    MontagePrefix = "Boss_LiecheHand_",
    SkeletonMeshPath = "Asset/Char/Monster/GR_Baotu/Mesh/GR_Baotu_SM.GR_Baotu_SM"
  },
  [851903] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_BlastRobot/ABP_Jt_BlastRobot.ABP_Jt_BlastRobot_C'",
    AssistSockets = T.RT_49,
    DamageFXSockets = T.RT_49,
    HitMontageRule = "MonNoRagdoll",
    ModelId = 851903,
    ModelScale = 3,
    MontageFolder = "/Game/Asset/Char/Monster/JT_BlastRobot/Animation/Montage/",
    MontagePrefix = "JT_BlastRobot_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_BlastRobot/Mesh/JT_BlastRobot_SM.JT_BlastRobot_SM"
  },
  [851904] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Gr_Jichong/ABP_Mon_Gr_Jichong.ABP_Mon_Gr_Jichong_C'",
    ModelId = 851904,
    MontageFolder = "/Game/Asset/Char/Monster/GR_Jichong/Animation/Montage/",
    MontagePrefix = "GR_Jichong_",
    SkeletonMeshPath = "Asset/Char/Monster/GR_Jichong/Mesh/GR_Jichong_SM.GR_Jichong_SM"
  },
  [852001] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_Juji/ABP_Mon_JT_Juji.ABP_Mon_JT_Juji_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_Aida_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonNoRagdoll",
    ModelId = 852001,
    ModelScale = 3,
    MontageFolder = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/",
    MontagePrefix = "Boss_Aida_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_Juji/Mesh/JT_Juji_SM.JT_Juji_SM"
  },
  [852002] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_Juji/ABP_Mon_JT_Juji.ABP_Mon_JT_Juji_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_Aida_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonNoRagdoll",
    ModelId = 852002,
    ModelScale = 3,
    MontageFolder = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/",
    MontagePrefix = "Boss_Aida_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_Juji/Mesh/JT_Juji_SM.JT_Juji_SM"
  },
  [852003] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jt_Juji/ABP_Mon_JT_Juji.ABP_Mon_JT_Juji_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Boss_Aida_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonNoRagdoll",
    ModelId = 852003,
    ModelScale = 1.5,
    MontageFolder = "/Game/Asset/Char/Monster/Boss20_Aida/Animation/Montage/",
    MontagePrefix = "Boss_Aida_",
    SkeletonMeshPath = "Asset/Char/Monster/JT_Juji/Mesh/JT_Juji_SM.JT_Juji_SM"
  },
  [900101] = {
    ModelId = 900101,
    SkeletonMeshPath = "Asset/Char/Monster/SQ_Yinxie/Mesh/SQ_Yinxie_WP_SM.SQ_Yinxie_WP_SM"
  },
  [900102] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/SQ_Baozha/ABP_Mon_SQ_Baozha.ABP_Mon_SQ_Baozha_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "SQ_Yinxie_",
    BehaviorMontageGroupId = 9001,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 900102,
    MontageFolder = "/Game/Asset/Char/Monster/SQ_Yinxie/Animation/Montage/",
    MontagePrefix = "SQ_Yinxie_",
    SkeletonMeshPath = "Asset/Char/Monster/SQ_Yinxie/Mesh/SQ_Yinxie_SM.SQ_Yinxie_SM"
  },
  [900201] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/SQ_Dufeng/ABP_Mon_SQ_Dufeng.ABP_Mon_SQ_Dufeng_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "SQ_Dufeng_",
    BehaviorMontageGroupId = 9002,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 900201,
    MontageFolder = "/Game/Asset/Char/Monster/SQ_Dufeng/Animation/Montage/",
    MontagePrefix = "SQ_Dufeng_",
    SkeletonMeshPath = "Asset/Char/Monster/SQ_Dufeng/Mesh/SQ_Dufeng_SM.SQ_Dufeng_SM"
  },
  [900202] = {
    ModelId = 900202,
    SkeletonMeshPath = "Asset/Char/Monster/SQ_Dufeng/Mesh/SQ_Dufeng_WP_SM.SQ_Dufeng_WP_SM"
  },
  [900301] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/SQ_Baozha/ABP_Mon_SQ_Baozha.ABP_Mon_SQ_Baozha_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "SQ_Wanju_",
    AvatarExpressionPrefix = "Wanju_",
    BehaviorMontageGroupId = 9003,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 900301,
    ModelScale = 1.2,
    MontageFolder = "/Game/Asset/Char/Monster/SQ_Wanju/Animation/Montage/",
    MontagePrefix = "SQ_Wanju_",
    SkeletonMeshPath = "Asset/Char/Monster/SQ_Wanju/Mesh/SQ_Wanju_SM.SQ_Wanju_SM"
  },
  [900401] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/SQ_Wanju/ABP_Mon_SQ_Wanju_Sum01.ABP_Mon_SQ_Wanju_Sum01_C'",
    AssistSockets = T.RT_49,
    AudioPrefix = "SQ_Wanju_Sum01_",
    BirthTime = -1,
    DamageFXSockets = T.RT_49,
    HitMontageRule = "MonJTBlastRobot",
    ModelId = 900401,
    MontageFolder = "/Game/Asset/Char/Monster/SQ_Wanju/Animation/Montage/",
    MontagePrefix = "SQ_Wanju_Sum01_",
    SkeletonMeshPath = "Asset/Char/Monster/SQ_Wanju/Mesh/SQ_Wanju_Sum01_SM.SQ_Wanju_Sum01_SM"
  },
  [900501] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/SQ_Baozha/ABP_Mon_SQ_Baozha.ABP_Mon_SQ_Baozha_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "SQ_Baozha_",
    AvatarExpressionPrefix = "Baozha_",
    BehaviorMontageGroupId = 9005,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonSQBaozha",
    ModelId = 900501,
    ModelScale = 1.2,
    MontageFolder = "/Game/Asset/Char/Monster/SQ_Baozha/Animation/Montage/",
    MontagePrefix = "SQ_Baozha_",
    SkeletonMeshPath = "Asset/Char/Monster/SQ_Baozha/Mesh/SQ_Baozha_SM.SQ_Baozha_SM"
  },
  [900601] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/SQ_Qizha/ABP_Mon_SQ_Qizha.ABP_Mon_SQ_Qizha_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "SQ_Qizha_",
    AvatarExpressionPrefix = "Qizha_",
    BehaviorMontageGroupId = 9006,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 900601,
    ModelScale = 1.2,
    MontageFolder = "/Game/Asset/Char/Monster/SQ_Qizha/Animation/Montage/",
    MontagePrefix = "SQ_Qizha_",
    SkeletonMeshPath = "Asset/Char/Monster/SQ_Qizha/Mesh/SQ_Qizha_SM.SQ_Qizha_SM"
  },
  [900701] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Jh_Shenfu/ABP_Mon_JH_Shenfu.ABP_Mon_JH_Shenfu_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "SQ_Niaopao_",
    BehaviorMontageGroupId = 9007,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 900701,
    MontageFolder = "/Game/Asset/Char/Monster/SQ_Niaopao/Animation/Montage/",
    MontagePrefix = "SQ_Niaopao_",
    SkeletonMeshPath = "Asset/Char/Monster/SQ_Niaopao/Mesh/SQ_Niaopao_SM.SQ_Niaopao_SM"
  },
  [900702] = {
    ModelId = 900702,
    SkeletonMeshPath = "Asset/Char/Monster/SQ_Niaopao/Mesh/SQ_Niaopao_WP_SM.SQ_Niaopao_WP_SM"
  },
  [950001] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/NE_Dajie/ABP_Mon_NE_Dajie.ABP_Mon_NE_Dajie_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "NE_Dajie_",
    AvatarExpressionPrefix = "Dajia_",
    BirthTime = -1,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonNEDajie",
    ModelId = 950001,
    ModelScale = 1.2,
    MontageFolder = "/Game/Asset/Char/Monster/NE_Dajie/Animation/Montage/",
    MontagePrefix = "NE_Dajie_",
    SkeletonMeshPath = "Asset/Char/Monster/NE_Dajie/Mesh/NE_Dajie_SM.NE_Dajie_SM"
  },
  [950101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/NE_Haer/ABP_NE_Haer.ABP_NE_Haer_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "NE_Villiger_",
    AvatarExpressionPrefix = "Haer_",
    BehaviorMontageGroupId = 9501,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonNEHaer",
    ModelId = 950101,
    MontageFolder = "/Game/Asset/Char/Monster/NE_Villiger/Animation/Montage/",
    MontagePrefix = "NE_Villiger_",
    SkeletonMeshPath = "Asset/Char/Monster/NE_Villiger/Mesh/NE_Villiger01_SM.NE_Villiger01_SM"
  },
  [950102] = {
    ModelId = 950102,
    SkeletonMeshPath = "Asset/Char/Monster/NE_Villiger/Mesh/NE_Villiger01_WP_SM.NE_Villiger01_WP_SM"
  },
  [950103] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/NE_Haer/ABP_NE_Haer.ABP_NE_Haer_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "NE_Villiger_",
    BehaviorMontageGroupId = 9501,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 950103,
    MontageFolder = "/Game/Asset/Char/Monster/NE_Villiger/Animation/Montage/",
    MontagePrefix = "NE_Villiger_",
    SkeletonMeshPath = "Asset/Char/Monster/NE_Villiger/Mesh/NE_Villiger02_SM.NE_Villiger02_SM"
  },
  [950104] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/NE_Haer/ABP_NE_Haer.ABP_NE_Haer_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "NE_Villiger_",
    BehaviorMontageGroupId = 9501,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 950104,
    MontageFolder = "/Game/Asset/Char/Monster/NE_Villiger/Animation/Montage/",
    MontagePrefix = "NE_Villiger_",
    SkeletonMeshPath = "Asset/Char/Monster/NE_Villiger/Mesh/NE_Villiger03_SM.NE_Villiger03_SM"
  },
  [950401] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/NE_Wuyou/ABP_NE_Wuyou.ABP_NE_Wuyou_C'",
    AudioPrefix = "NE_Wuyou_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "NEWuyou",
    ModelId = 950401,
    ModelScale = 2,
    MontageFolder = "/Game/Asset/Char/Monster/NE_Wuyou/Animation/Montage/",
    MontagePrefix = "NE_Wuyou_",
    SkeletonMeshPath = "Asset/Char/Npc/NPC_Wuyou/Mesh/NPC_Wuyou04_SM.NPC_Wuyou04_SM"
  },
  [950501] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/NE_Wuyou/ABP_NE_Wuyou.ABP_NE_Wuyou_C'",
    AudioPrefix = "NE_Wuyou_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "NEWuyou",
    ModelId = 950501,
    ModelScale = 2,
    MontageFolder = "/Game/Asset/Char/Monster/NE_Wuyou/Animation/Montage/",
    MontagePrefix = "NE_Wuyou_",
    SkeletonMeshPath = "Asset/Char/Npc/NPC_Wuyou/Mesh/NPC_Wuyou02_SM.NPC_Wuyou02_SM"
  },
  [950601] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/NE_Wuyou/ABP_NE_Wuyou.ABP_NE_Wuyou_C'",
    AudioPrefix = "NE_Wuyou_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "NEWuyou",
    ModelId = 950601,
    ModelScale = 2,
    MontageFolder = "/Game/Asset/Char/Monster/NE_Wuyou/Animation/Montage/",
    MontagePrefix = "NE_Wuyou_",
    SkeletonMeshPath = "Asset/Char/Npc/NPC_Wuyou/Mesh/NPC_Wuyou03_SM.NPC_Wuyou03_SM"
  },
  [950701] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/NE_Villiger04/ABP_Mon_NE_Villiger04.ABP_Mon_NE_Villiger04_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "NE_Villiger04_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 950701,
    MontageFolder = "/Game/Asset/Char/Monster/NE_Villiger04/Animation/Montage/",
    MontagePrefix = "NE_Villiger04_",
    SkeletonMeshPath = "Asset/Char/Monster/NE_Villiger/Mesh/NE_Villiger04_SM.NE_Villiger04_SM"
  },
  [980101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Animal_Xuelang/ABP_Mon_Xuelang.ABP_Mon_Xuelang_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Mon_Xuelang_",
    BehaviorMontageGroupId = 9801,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 980101,
    MontageFolder = "/Game/Asset/Char/Monster/Animal01_Xuelang/Animation/Montage/",
    MontagePrefix = "Mon_Xuelang_",
    SkeletonMeshPath = "Asset/Char/Monster/Animal01_Xuelang/Mesh/Mon_XuelangA_SM.Mon_XuelangA_SM"
  },
  [980102] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Animal_Xuelang/ABP_Mon_Xuelang_B.ABP_Mon_Xuelang_B_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Mon_Xuelang_",
    BehaviorMontageGroupId = 9801,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 980102,
    ModelScale = 1.5,
    MontageFolder = "/Game/Asset/Char/Monster/Animal01_Xuelang/Animation/Montage/",
    MontagePrefix = "Mon_Xuelang_",
    SkeletonMeshPath = "Asset/Char/Monster/Animal01_Xuelang/Mesh/Mon_XuelangB_SM.Mon_XuelangB_SM"
  },
  [980201] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Animal_Hongjiaolu/ABP_Mon_Hongjiaolu.ABP_Mon_Hongjiaolu_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Mon_Hongjiaolu_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 980201,
    MontageFolder = "/Game/Asset/Char/Monster/Animal02_Hongjiaolu/Animation/Montage/",
    MontagePrefix = "Mon_Hongjiaolu_",
    SkeletonMeshPath = "Asset/Char/Monster/Animal02_Hongjiaolu/Mesh/Mon_HongjiaoluA_SM.Mon_HongjiaoluA_SM"
  },
  [980202] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Animal_Hongjiaolu/ABP_Mon_Hongjiaolu.ABP_Mon_Hongjiaolu_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Mon_Hongjiaolu_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 980202,
    MontageFolder = "/Game/Asset/Char/Monster/Animal02_Hongjiaolu/Animation/Montage/",
    MontagePrefix = "Mon_Hongjiaolu_",
    SkeletonMeshPath = "Asset/Char/Monster/Animal02_Hongjiaolu/Mesh/Mon_HongjiaoluB_SM.Mon_HongjiaoluB_SM"
  },
  [980301] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Animal_Yinbeishu/ABP_Mon_Yinbeishu.ABP_Mon_Yinbeishu_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Mon_Yinbeishu_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 980301,
    MontageFolder = "/Game/Asset/Char/Monster/Animal03_Yinbeishu/Animation/Montage/",
    MontagePrefix = "Mon_Yinbeishu_",
    SkeletonMeshPath = "Asset/Char/Monster/Animal03_Yinbeishu/Mesh/Mon_Yinbeishu_SM.Mon_Yinbeishu_SM"
  },
  [980302] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Animal_Yinbeishu/ABP_Mon_Yinbeishu_B.ABP_Mon_Yinbeishu_B_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Mon_Yinbeishu02_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 980302,
    ModelScale = 2.5,
    MontageFolder = "/Game/Asset/Char/Monster/Animal03_Yinbeishu/Animation/Montage/",
    MontagePrefix = "Mon_Yinbeishu_",
    SkeletonMeshPath = "Asset/Char/Monster/Animal03_Yinbeishu/Mesh/Mon_YinbeishuB_SM.Mon_YinbeishuB_SM"
  },
  [980401] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Animal_Jiujiu/ABP_Mon_Jiujiu.ABP_Mon_Jiujiu_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Mon_Jiujiu_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "AnimalFly",
    ModelId = 980401,
    MontageFolder = "/Game/Asset/Char/Monster/Animal04_Jiujiu/Animation/Montage/",
    MontagePrefix = "Mon_Jiujiu_",
    SkeletonMeshPath = "Asset/Char/Monster/Animal04_Jiujiu/Mesh/Mon_Jiujiu_SM.Mon_Jiujiu_SM"
  },
  [980501] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Animal_Suoweng/ABP_Mon_Suowen.ABP_Mon_Suowen_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Mon_Suoweng_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "AnimalFly",
    ModelId = 980501,
    MontageFolder = "/Game/Asset/Char/Monster/Animal05_Suoweng/Animation/Montage/",
    MontagePrefix = "Mon_Suoweng_",
    SkeletonMeshPath = "Asset/Char/Monster/Animal05_Suoweng/Mesh/Mon_Suoweng_SM.Mon_Suoweng_SM"
  },
  [980601] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Animal_Cuiping/ABP_Mon_Cuiping.ABP_Mon_Cuiping_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Mon_Cuiping_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "AnimalCommon",
    ModelId = 980601,
    MontageFolder = "/Game/Asset/Char/Monster/Animal06_Cuiping/Animation/Montage/",
    MontagePrefix = "Mon_Cuiping_",
    SkeletonMeshPath = "Asset/Char/Monster/Animal06_Cuiping/Mesh/Mon_CuipingA_SM.Mon_CuipingA_SM"
  },
  [980602] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Animal_Cuiping/ABP_Mon_Cuiping.ABP_Mon_Cuiping_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Mon_Cuiping_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "AnimalCommon",
    ModelId = 980602,
    MontageFolder = "/Game/Asset/Char/Monster/Animal06_Cuiping/Animation/Montage/",
    MontagePrefix = "Mon_Cuiping_",
    SkeletonMeshPath = "Asset/Char/Monster/Animal06_Cuiping/Mesh/Mon_CuipingB_SM.Mon_CuipingB_SM"
  },
  [980701] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Animal_Zhenzhu/ABP_Mon_Zhenzhu.ABP_Mon_Zhenzhu_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Mon_Zhenzhu_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "AnimalCommon",
    ModelId = 980701,
    MontageFolder = "/Game/Asset/Char/Monster/Animal07_Zhenzhu/Animation/Montage/",
    MontagePrefix = "Mon_Zhenzhu_",
    SkeletonMeshPath = "Asset/Char/Monster/Animal07_Zhenzhu/Mesh/Mon_Zhenzhu_SM.Mon_Zhenzhu_SM"
  },
  [980801] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Animai_Chihu/ABP_Mon_Chihu.ABP_Mon_Chihu_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Mon_Chihu_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "AnimalCommon",
    ModelId = 980801,
    MontageFolder = "/Game/Asset/Char/Monster/Animal08_Chihu/Animation/Montage/",
    MontagePrefix = "Mon_Chihu_",
    SkeletonMeshPath = "Asset/Char/Monster/Animal08_Chihu/Mesh/Mon_Chihu_SM.Mon_Chihu_SM"
  },
  [980901] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Animal_Hongjiaolu/ABP_Mon_Hongjiaolu.ABP_Mon_Hongjiaolu_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Mon_Hongjiaolu_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 980901,
    MontageFolder = "/Game/Asset/Char/Monster/Animal02_Hongjiaolu/Animation/Montage/",
    MontagePrefix = "Mon_Hongjiaolu_",
    SkeletonMeshPath = "Asset/Char/Monster/Animal09_Yunzong/Mesh/Mon_YunzongA_SM.Mon_YunzongA_SM"
  },
  [980902] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Animal_Hongjiaolu/ABP_Mon_Hongjiaolu.ABP_Mon_Hongjiaolu_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "Mon_Hongjiaolu_",
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 980902,
    MontageFolder = "/Game/Asset/Char/Monster/Animal02_Hongjiaolu/Animation/Montage/",
    MontagePrefix = "Mon_Hongjiaolu_",
    SkeletonMeshPath = "Asset/Char/Monster/Animal09_Yunzong/Mesh/Mon_YunzongB_SM.Mon_YunzongB_SM"
  },
  [1000101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/JH_Xianfeng/ABP_Mon_JH_Xianfeng.ABP_Mon_JH_Xianfeng_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "HX_Tianshi_",
    BehaviorMontageGroupId = 10001,
    DamageFXSockets = T.RT_3,
    HitMontageRule = "MonDefault",
    ModelId = 1000101,
    ModelScale = 1.1,
    MontageFolder = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/",
    MontagePrefix = "HX_Tianshi_",
    SkeletonMeshPath = "Asset/Char/Monster/HX_Tianshi/Mesh/HX_Tianshi_SM.HX_Tianshi_SM",
    WeaponScale = 1.1
  },
  [1000102] = {
    ModelId = 1000102,
    SkeletonMeshPath = "Asset/Char/Monster/HX_Tianshi/Mesh/HX_Tianshi_WP_SM.HX_Tianshi_WP_SM"
  },
  [1000201] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/HX_Tianwei/ABP_Mon_HX_Tianwei.ABP_Mon_HX_Tianwei_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "HX_Tianwei_",
    BehaviorMontageGroupId = 10002,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 1000201,
    MontageFolder = "/Game/Asset/Char/Monster/HX_Tianwei/Animation/Montage/",
    MontagePrefix = "HX_Tianwei_",
    SkeletonMeshPath = "Asset/Char/Monster/HX_Tianwei/Mesh/HX_Tianwei_SM.HX_Tianwei_SM"
  },
  [1000202] = {
    ModelId = 1000202,
    SkeletonMeshPath = "Asset/Char/Monster/HX_Tianwei/Mesh/HX_Tianwei_WP_SM.HX_Tianwei_WP_SM"
  },
  [1000301] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/HX_Bian/ABP_Mon_HX_BiAn_A.ABP_Mon_HX_BiAn_A_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "HX_BiAn_",
    BehaviorMontageGroupId = 10003,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 1000301,
    MontageFolder = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/",
    MontagePrefix = "HX_BiAn_",
    SkeletonMeshPath = "Asset/Char/Monster/HX_Bian/Mesh/HX_Bian_SM.HX_Bian_SM"
  },
  [1000401] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/HX_Bian/ABP_Mon_HX_BiAn_B.ABP_Mon_HX_BiAn_B_C'",
    AssistSockets = T.RT_4,
    AudioPrefix = "HX_BiAn_",
    BehaviorMontageGroupId = 10003,
    DamageFXSockets = T.RT_4,
    HitMontageRule = "MonDefault",
    ModelId = 1000401,
    MontageFolder = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/",
    MontagePrefix = "HX_BiAn_",
    SkeletonMeshPath = "Asset/Char/Monster/HX_Bian/Mesh/HX_Bian_SM.HX_Bian_SM"
  },
  [1010101] = {
    ModelId = 1010101,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Sword/Sword_Huipo/Mesh/Sword_Huipo_SM.Sword_Huipo_SM",
    StandId = "001",
    WeaponHitedSeName = "Sword",
    WeaponSeInfo = "Sword_Huipo"
  },
  [1010201] = {
    ModelId = 1010201,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Sword/Sword_Guzi/Mesh/Sword_Guzi_SM.Sword_Guzi_SM",
    StandId = "010",
    WeaponHitedSeName = "Sword",
    WeaponSeInfo = "Sword_Guzi"
  },
  [1010301] = {
    ModelId = 1010301,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Sword/Sword_Zhuiyi/Mesh/Sword_Zhuiyi_SM.Sword_Zhuiyi_SM",
    StandId = "006",
    WeaponHitedSeName = "Sword",
    WeaponSeInfo = "Sword_Huipo"
  },
  [1010401] = {
    ModelId = 1010401,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Sword/Sword_Huimou/Mesh/Sword_Huimou_SM.Sword_Huimou_SM",
    StandId = "008",
    WeaponHitedSeName = "Sword",
    WeaponSeInfo = "Sword_Huimou"
  },
  [1010501] = {
    ModelId = 1010501,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Sword/Sword_Liulang/Mesh/Sword_Liulang_SM.Sword_Liulang_SM",
    StandId = "012",
    WeaponHitedSeName = "Sword",
    WeaponSeInfo = "Sword_Huipo"
  },
  [1010601] = {
    ModelId = 1010601,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Sword/Sword_Yulu/Mesh/Sword_Yulu_SM.Sword_Yulu_SM",
    StandId = "012",
    WeaponHitedSeName = "Sword",
    WeaponSeInfo = "Sword_Kezhou"
  },
  [1019801] = {
    ModelId = 1019801,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Sword/Sword_Liandu/Mesh/Sword_Liandu01_SM.Sword_Liandu01_SM",
    StandId = "014",
    WeaponHitedSeName = "Sword",
    WeaponSeInfo = "Sword_Huipo"
  },
  [1019901] = {
    ModelId = 1019901,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Sword/Sword_Jinshu/Mesh/Sword_Jinshu01_SM.Sword_Jinshu01_SM",
    StandId = "013",
    WeaponHitedSeName = "Sword",
    WeaponSeInfo = "Sword_Huipo"
  },
  [1020101] = {
    ModelId = 1020101,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Polearm/Polearm_Sairen/Mesh/Polearm_Sairen_SM.Polearm_Sairen_SM",
    StandId = "003",
    WeaponHitedSeName = "spear",
    WeaponSeInfo = "Polearm_Sairen"
  },
  [1020201] = {
    ModelId = 1020201,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Polearm/Polearm_Chunjue/Mesh/Polearm_Chunjue_SM.Polearm_Chunjue_SM",
    StandId = "011",
    WeaponHitedSeName = "spear",
    WeaponSeInfo = "Polearm_Liandu"
  },
  [1020301] = {
    ModelId = 1020301,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Polearm/Polearm_Zuiqian/Mesh/Polearm_Zuiqian_SM.Polearm_Zuiqian_SM",
    StandId = "007",
    WeaponHitedSeName = "spear",
    WeaponSeInfo = "Polearm_Zuiqian"
  },
  [1020401] = {
    ModelId = 1020401,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Polearm/Polearm_Xiji/Mesh/Polearm_Xiji_SM.Polearm_Xiji_SM",
    StandId = "015",
    WeaponHitedSeName = "sickle",
    WeaponSeInfo = "Polearm_Xiji"
  },
  [1020501] = {
    ModelId = 1020501,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Polearm/Polearm_Jiushu/Mesh/Polearm_Jiushu_SM.Polearm_Jiushu_SM",
    StandId = "015",
    WeaponHitedSeName = "sickle",
    WeaponSeInfo = "Polearm_Xiji"
  },
  [1020601] = {
    ModelId = 1020601,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Polearm/Polearm_Chixing/Mesh/Polearm_Chixing_SM.Polearm_Chixing_SM",
    StandId = "015",
    WeaponHitedSeName = "sickle",
    WeaponSeInfo = "Polearm_Xiji"
  },
  [1020701] = {
    ModelId = 1020701,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Polearm/Polearm_Weilan/Mesh/Polearm_Weilan_SM.Polearm_Weilan_SM",
    StandId = "015",
    WeaponHitedSeName = "sickle",
    WeaponSeInfo = "Polearm_Xiji"
  },
  [1020801] = {
    ModelId = 1020801,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Polearm/Polearm_Yihe/Mesh/Polearm_Yihe_SM.Polearm_Yihe_SM",
    StandId = "015",
    WeaponHitedSeName = "sickle",
    WeaponSeInfo = "Polearm_Xiji"
  },
  [1020901] = {
    ModelId = 1020901,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Polearm/Polearm_Zhuixin/Mesh/Polearm_Zhuixin_SM.Polearm_Zhuixin_SM",
    StandId = "015",
    WeaponHitedSeName = "sickle",
    WeaponSeInfo = "Polearm_Xiji"
  },
  [1029801] = {
    ModelId = 1029801,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Polearm/Polearm_Liandu/Mesh/Polearm_Liandu01_SM.Polearm_Liandu01_SM",
    StandId = "003",
    WeaponHitedSeName = "spear",
    WeaponSeInfo = "Polearm_Liandu"
  },
  [1029901] = {
    ModelId = 1029901,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Polearm/Polearm_Jinshu/Mesh/Polearm_Jinshu01_SM.Polearm_Jinshu01_SM",
    StandId = "003",
    WeaponHitedSeName = "spear",
    WeaponSeInfo = "Polearm_Liandu"
  },
  [1030101] = {
    ModelId = 1030101,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Claymore/Claymore_Chengjie/Mesh/Claymore_Chengjie_SM.Claymore_Chengjie_SM",
    StandId = "017",
    WeaponHitedSeName = "heavysword",
    WeaponSeInfo = "Claymore_Chengjie"
  },
  [1030201] = {
    ModelId = 1030201,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Claymore/Claymore_Rimian/Mesh/Claymore_Rimian_SM.Claymore_Rimian_SM",
    StandId = "009",
    WeaponHitedSeName = "heavysword",
    WeaponSeInfo = "Claymore_Common"
  },
  [1030301] = {
    ModelId = 1030301,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Claymore/Claymore_Chixing/Mesh/Claymore_Chixing_SM.Claymore_Chixing_SM",
    StandId = "009",
    WeaponHitedSeName = "heavysword",
    WeaponSeInfo = "Claymore_Common"
  },
  [1030401] = {
    ModelId = 1030401,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Claymore/Claymore_Wangu/Mesh/Claymore_Wangu_SM.Claymore_Wangu_SM",
    StandId = "009",
    WeaponHitedSeName = "heavysword",
    WeaponSeInfo = "Claymore_Wangu"
  },
  [1039801] = {
    ModelId = 1039801,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Claymore/Claymore_Liandu/Mesh/Claymore_Liandu_SM.Claymore_Liandu_SM",
    StandId = "009",
    WeaponHitedSeName = "heavysword",
    WeaponSeInfo = "Claymore_Common"
  },
  [1039901] = {
    ModelId = 1039901,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Claymore/Claymore_Jinshu/Mesh/Claymore_Jinshu_SM.Claymore_Jinshu_SM",
    StandId = "009",
    WeaponHitedSeName = "heavysword",
    WeaponSeInfo = "Claymore_Common"
  },
  [1040101] = {
    ModelId = 1040101,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Dualblade/Dualblade_Shixiang/Mesh/Dualblade_Shixiang01_SM.Dualblade_Shixiang01_SM",
    StandId = "009",
    WeaponHitedSeName = "Dualblade",
    WeaponSeInfo = "Dualblade_Shixiang"
  },
  [1040102] = {
    ModelId = 1040102,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Dualblade/Dualblade_Shixiang/Mesh/Dualblade_Shixiang02_SM.Dualblade_Shixiang02_SM",
    StandId = "009",
    WeaponHitedSeName = "Dualblade",
    WeaponSeInfo = "Dualblade_Shixiang"
  },
  [1040201] = {
    ModelId = 1040201,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Dualblade/Dualblade_Liujin/Mesh/Dualblade_Liujin01_SM.Dualblade_Liujin01_SM",
    StandId = "009",
    WeaponHitedSeName = "Dualblade",
    WeaponSeInfo = "Dualblade_Common"
  },
  [1040202] = {
    ModelId = 1040202,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Dualblade/Dualblade_Liujin/Mesh/Dualblade_Liujin02_SM.Dualblade_Liujin02_SM",
    StandId = "009",
    WeaponHitedSeName = "Dualblade",
    WeaponSeInfo = "Dualblade_Common"
  },
  [1040301] = {
    ModelId = 1040301,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Dualblade/Dualblade_Yousha/Mesh/Dualblade_Yousha01_SM.Dualblade_Yousha01_SM",
    StandId = "009",
    WeaponHitedSeName = "Dualblade",
    WeaponSeInfo = "Dualblade_Common"
  },
  [1040302] = {
    ModelId = 1040302,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Dualblade/Dualblade_Yousha/Mesh/Dualblade_Yousha02_SM.Dualblade_Yousha02_SM",
    StandId = "009",
    WeaponHitedSeName = "Dualblade",
    WeaponSeInfo = "Dualblade_Common"
  },
  [1049801] = {
    ModelId = 1049801,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Dualblade/Dualblade_Liandu/Mesh/Dualblade_Liandu01_SM.Dualblade_Liandu01_SM",
    StandId = "009",
    WeaponHitedSeName = "Dualblade",
    WeaponSeInfo = "Dualblade_Common"
  },
  [1049802] = {
    ModelId = 1049802,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Dualblade/Dualblade_Liandu/Mesh/Dualblade_Liandu02_SM.Dualblade_Liandu02_SM",
    StandId = "009",
    WeaponHitedSeName = "Dualblade",
    WeaponSeInfo = "Dualblade_Common"
  },
  [1049901] = {
    ModelId = 1049901,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Dualblade/Dualblade_Jinshu/Mesh/Dualblade_Jinshu01_SM.Dualblade_Jinshu01_SM",
    StandId = "009",
    WeaponHitedSeName = "Dualblade",
    WeaponSeInfo = "Dualblade_Common"
  },
  [1049902] = {
    ModelId = 1049902,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Dualblade/Dualblade_Jinshu/Mesh/Dualblade_Jinshu02_SM.Dualblade_Jinshu02_SM",
    StandId = "009",
    WeaponHitedSeName = "Dualblade",
    WeaponSeInfo = "Dualblade_Common"
  },
  [1050101] = {
    ModelId = 1050101,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Swordwhip/Swordwhip_Buyu/Mesh/Swordwhip_Buyu_SM.Swordwhip_Buyu_SM",
    StandId = "016",
    WeaponHitedSeName = "Swordwhip",
    WeaponSeInfo = "Swordwhip_Buyu"
  },
  [1050201] = {
    AdditionalFXID = {1050201},
    ModelId = 1050201,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Swordwhip/Swordwhip_Zeshi/Mesh/Swordwhip_Zeshi_SM.Swordwhip_Zeshi_SM",
    StandId = "016",
    WeaponHitedSeName = "Swordwhip",
    WeaponSeInfo = "Swordwhip_Zeshi"
  },
  [1050301] = {
    ModelId = 1050301,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Swordwhip/Swordwhip_Chixing/Mesh/Swordwhip_Chixing_SM.Swordwhip_Chixing_SM",
    StandId = "016",
    WeaponHitedSeName = "Swordwhip",
    WeaponSeInfo = "Swordwhip_Common"
  },
  [1050401] = {
    ModelId = 1050401,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Swordwhip/Swordwhip_Canghu/Mesh/Swordwhip_Canghu_SM.Swordwhip_Canghu_SM",
    StandId = "016",
    WeaponHitedSeName = "Swordwhip",
    WeaponSeInfo = "Swordwhip_Common"
  },
  [1060101] = {
    ModelId = 1060101,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Katana/Katana_Feiqie/Mesh/Katana_Feiqie_SM.Katana_Feiqie_SM",
    StandId = "016",
    WeaponHitedSeName = "Katana",
    WeaponSeInfo = "Katana_Hongye"
  },
  [1060102] = {
    ModelId = 1060102,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Katana/Katana_Feiqie/Mesh/Katana_Feiqie_Accessary_SM.Katana_Feiqie_Accessary_SM",
    StandId = "016",
    WeaponHitedSeName = "Katana",
    WeaponSeInfo = "Katana_Hongye"
  },
  [1060201] = {
    ModelId = 1060201,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Katana/Katana_Chixing/Mesh/Katana_Chixing_SM.Katana_Chixing_SM",
    StandId = "016",
    WeaponHitedSeName = "Katana",
    WeaponSeInfo = "Katana_Common"
  },
  [1060202] = {
    ModelId = 1060202,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Katana/Katana_Chixing/Mesh/Katana_Chixing_Accessary_SM.Katana_Chixing_Accessary_SM",
    StandId = "016",
    WeaponHitedSeName = "Katana",
    WeaponSeInfo = "Katana_Common"
  },
  [1060301] = {
    ModelId = 1060301,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Katana/Katana_Yuli/Mesh/Katana_Yuli_SM.Katana_Yuli_SM",
    StandId = "016",
    WeaponHitedSeName = "Katana",
    WeaponSeInfo = "Katana_Common"
  },
  [1060302] = {
    ModelId = 1060302,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Katana/Katana_Yuli/Mesh/Katana_Yuli_Accessary_SM.Katana_Yuli_Accessary_SM",
    StandId = "016",
    WeaponHitedSeName = "Katana",
    WeaponSeInfo = "Katana_Common"
  },
  [1069801] = {
    ModelId = 1069801,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Katana/Katana_Liandu/Mesh/Katana_Liandu_SM.Katana_Liandu_SM",
    StandId = "016",
    WeaponHitedSeName = "Katana",
    WeaponSeInfo = "Katana_Common"
  },
  [1069802] = {
    ModelId = 1069802,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Katana/Katana_Liandu/Mesh/Katana_Liandu_Accessary_SM.Katana_Liandu_Accessary_SM",
    StandId = "016",
    WeaponHitedSeName = "Katana",
    WeaponSeInfo = "Katana_Common"
  },
  [1069901] = {
    ModelId = 1069901,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Katana/Katana_Jinshu/Mesh/Katana_Jinshu_SM.Katana_Jinshu_SM",
    StandId = "016",
    WeaponHitedSeName = "Katana",
    WeaponSeInfo = "Katana_Common"
  },
  [1069902] = {
    ModelId = 1069902,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Katana/Katana_Jinshu/Mesh/Katana_Jinshu_Accessary_SM.Katana_Jinshu_Accessary_SM",
    StandId = "016",
    WeaponHitedSeName = "Katana",
    WeaponSeInfo = "Katana_Common"
  },
  [2010101] = {
    ModelId = 2010101,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Pistol/Pistol_Wuxu/Mesh/Pistol_Wuxu_SM.Pistol_Wuxu_SM",
    StandId = "001",
    WeaponSeInfo = "Pistol_Wuxu"
  },
  [2010201] = {
    ModelId = 2010201,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Crossbow/Crossbow_Chixing/Mesh/Crossbow_Chixing_R_SM.Crossbow_Chixing_R_SM",
    StandId = "001",
    WeaponSeInfo = "Pistol_Jinshu"
  },
  [2010301] = {
    ModelId = 2010301,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Crossbow/Crossbow_Gaoyu/Mesh/Crossbow_Gaoyu_R_SM.Crossbow_Gaoyu_R_SM",
    StandId = "001",
    WeaponSeInfo = "Pistol_Jinshu"
  },
  [2019801] = {
    ModelId = 2019801,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Crossbow/Crossbow_Liandu/Mesh/Crossbow_Liandu_R_SM.Crossbow_Liandu_R_SM",
    StandId = "001",
    WeaponSeInfo = "Pistol_Jinshu"
  },
  [2019901] = {
    ModelId = 2019901,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Crossbow/Crossbow_Jinshu/Mesh/Crossbow_Jinshu_R_SM.Crossbow_Jinshu_R_SM",
    StandId = "001",
    WeaponSeInfo = "Pistol_Jinshu"
  },
  [2020101] = {
    ModelId = 2020101,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Crossbow/Crossbow_Chixing/Mesh/Crossbow_Chixing_R_SM.Crossbow_Chixing_R_SM",
    StandId = "003",
    WeaponSeInfo = "Crossbow_Chixing"
  },
  [2020201] = {
    ModelId = 2020201,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Crossbow/Crossbow_Chixing/Mesh/Crossbow_Chixing_L_SM.Crossbow_Chixing_L_SM",
    StandId = "003",
    WeaponSeInfo = "Crossbow_Chixing"
  },
  [2020301] = {
    ModelId = 2020301,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Crossbow/Crossbow_Lanse/Mesh/Crossbow_Lanse_R_SM.Crossbow_Lanse_R_SM",
    StandId = "003",
    WeaponSeInfo = "Crossbow_Lanse"
  },
  [2020401] = {
    ModelId = 2020401,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Crossbow/Crossbow_Lanse/Mesh/Crossbow_Lanse_L_SM.Crossbow_Lanse_L_SM",
    StandId = "003",
    WeaponSeInfo = "Crossbow_Lanse"
  },
  [2020501] = {
    ModelId = 2020501,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Crossbow/Crossbow_Gaoyu/Mesh/Crossbow_Gaoyu_R_SM.Crossbow_Gaoyu_R_SM",
    StandId = "003",
    WeaponSeInfo = "Crossbow_Chixing"
  },
  [2020601] = {
    ModelId = 2020601,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Crossbow/Crossbow_Gaoyu/Mesh/Crossbow_Gaoyu_L_SM.Crossbow_Gaoyu_L_SM",
    StandId = "003",
    WeaponSeInfo = "Crossbow_Chixing"
  },
  [2029601] = {
    ModelId = 2029601,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Crossbow/Crossbow_Liandu/Mesh/Crossbow_Liandu_R_SM.Crossbow_Liandu_R_SM",
    StandId = "005",
    WeaponSeInfo = "Crossbow_Chixing"
  },
  [2029701] = {
    ModelId = 2029701,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Crossbow/Crossbow_Liandu/Mesh/Crossbow_Liandu_L_SM.Crossbow_Liandu_L_SM",
    StandId = "005",
    WeaponSeInfo = "Crossbow_Chixing"
  },
  [2029801] = {
    ModelId = 2029801,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Crossbow/Crossbow_Jinshu/Mesh/Crossbow_Jinshu_R_SM.Crossbow_Jinshu_R_SM",
    StandId = "004",
    WeaponSeInfo = "Crossbow_Chixing"
  },
  [2029901] = {
    ModelId = 2029901,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Crossbow/Crossbow_Jinshu/Mesh/Crossbow_Jinshu_L_SM.Crossbow_Jinshu_L_SM",
    StandId = "004",
    WeaponSeInfo = "Crossbow_Chixing"
  },
  [2030101] = {
    ModelId = 2030101,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Cannon/Cannon_Qunxing/Mesh/Cannon_Qunxing_SM.Cannon_Qunxing_SM",
    StandId = "002",
    WeaponSeInfo = "Cannon_Qunxing"
  },
  [2030201] = {
    ModelId = 2030201,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Cannon/Cannon_Chiqiang/Mesh/Cannon_Chiqiang_SM.Cannon_Chiqiang_SM",
    StandId = "002",
    WeaponSeInfo = "Cannon_Chiqiang"
  },
  [2030301] = {
    ModelId = 2030301,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Cannon/Cannon_Chixing/Mesh/Cannon_Chixing_SM.Cannon_Chixing_SM",
    StandId = "002",
    WeaponSeInfo = "Cannon_Chiqiang"
  },
  [2030401] = {
    ModelId = 2030401,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Cannon/Cannon_Guixu/Mesh/Cannon_Guixu_SM.Cannon_Guixu_SM",
    StandId = "002",
    WeaponSeInfo = "Cannon_Qingtong"
  },
  [2030501] = {
    ModelId = 2030501,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Cannon/Cannon_Yinbai/Mesh/Cannon_Yinbai_SM.Cannon_Yinbai_SM",
    StandId = "002",
    WeaponSeInfo = "Cannon_Yinbai"
  },
  [2030601] = {
    ModelId = 2030601,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Cannon/Cannon_Ronghuo/Mesh/Cannon_Ronghuo_SM.Cannon_Ronghuo_SM",
    StandId = "002",
    WeaponSeInfo = "Cannon_Chiqiang"
  },
  [2039801] = {
    ModelId = 2039801,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Cannon/Cannon_Liandu/Mesh/Cannon_Liandu_SM.Cannon_Liandu_SM",
    StandId = "002",
    WeaponSeInfo = "Cannon_Chiqiang"
  },
  [2039901] = {
    ModelId = 2039901,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Cannon/Cannon_Jinshu/Mesh/Cannon_Jinshu_SM.Cannon_Jinshu_SM",
    StandId = "002",
    WeaponSeInfo = "Cannon_Chiqiang"
  },
  [2040101] = {
    ModelId = 2040101,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Shotgun/Shotgun_Chixing/Mesh/Shotgun_Chixing_SM.Shotgun_Chixing_SM",
    StandId = "005",
    WeaponSeInfo = "Shotgun_Liandu"
  },
  [2040201] = {
    ModelId = 2040201,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Shotgun/Shotgun_Banzi/Mesh/Shotgun_Banzi_SM.Shotgun_Banzi_SM",
    StandId = "005",
    WeaponSeInfo = "Shotgun_Banzi"
  },
  [2040301] = {
    ModelId = 2040301,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Shotgun/Shotgun_Shengcai/Mesh/Shotgun_Shengcai_SM.Shotgun_Shengcai_SM",
    StandId = "005",
    WeaponSeInfo = "Shotgun_Shengcai"
  },
  [2040401] = {
    ModelId = 2040401,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Shotgun/Shotgun_Qiege/Mesh/Shotgun_Qiege_SM.Shotgun_Qiege_SM",
    StandId = "005",
    WeaponSeInfo = "Shotgun_Qiege"
  },
  [2040501] = {
    ModelId = 2040501,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Shotgun/Shotgun_Baopo/Mesh/Shotgun_Baopo.Shotgun_Baopo",
    StandId = "005",
    WeaponSeInfo = "Shotgun_Baopo"
  },
  [2040502] = {
    ModelId = 2040502,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Shotgun/Shotgun_Baopo/Mesh/Shotgun_Baopo_Part01_SM.Shotgun_Baopo_Part01_SM",
    StandId = "005",
    WeaponSeInfo = "Shotgun_Baopo"
  },
  [2049801] = {
    ModelId = 2049801,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Shotgun/Shotgun_Liandu/Mesh/Shotgun_Liandu_SM.Shotgun_Liandu_SM",
    StandId = "005",
    WeaponSeInfo = "Shotgun_Liandu"
  },
  [2049901] = {
    ModelId = 2049901,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Shotgun/Shotgun_Jinshu/Mesh/Shotgun_Jinshu_SM.Shotgun_Jinshu_SM",
    StandId = "004",
    WeaponSeInfo = "Shotgun_Liandu"
  },
  [2050101] = {
    ModelId = 2050101,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Machinegun/Machinegun_Chixing/Mesh/Machinegun_Chixing_SM.Machinegun_Chixing_SM",
    StandId = "004",
    WeaponSeInfo = "Machinegun_Chixing"
  },
  [2050201] = {
    ModelId = 2050201,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Machinegun/Machinegun_Fangzhu/Mesh/Machinegun_Fangzhu_SM.Machinegun_Fangzhu_SM",
    StandId = "004",
    WeaponSeInfo = "Machinegun_Fangzhu"
  },
  [2050301] = {
    ModelId = 2050301,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Machinegun/Machinegun_Qiqing/Mesh/Machinegun_Qiqing_SM.Machinegun_Qiqing_SM",
    StandId = "004",
    WeaponSeInfo = "Machinegun_Qiqing"
  },
  [2050401] = {
    ModelId = 2050401,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Machinegun/Machinegun_Poxiao/Mesh/Machinegun_Poxiao_SM.Machinegun_Poxiao_SM",
    StandId = "004",
    WeaponSeInfo = "Machinegun_Poxiao"
  },
  [2050701] = {
    ModelId = 2050701,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Machinegun/Machinegun_Yinlang/Mesh/Machinegun_Yinlang_SM.Machinegun_Yinlang_SM",
    StandId = "004",
    WeaponSeInfo = "Machinegun_Yinlang"
  },
  [2050801] = {
    ModelId = 2050801,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Machinegun/Machinegun_Ruohua/Mesh/Machinegun_Ruohua_SM.Machinegun_Ruohua_SM",
    StandId = "004",
    WeaponSeInfo = "Machinegun_Qiqing"
  },
  [2050901] = {
    ModelId = 2050901,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Machinegun/Machinegun_Zhimeng/Mesh/Machinegun_Zhimeng_SM.Machinegun_Zhimeng_SM",
    StandId = "004",
    WeaponSeInfo = "Machinegun_Zhimeng"
  },
  [2051001] = {
    ModelId = 2051001,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Machinegun/Machinegun_Ruohua/Mesh/Machinegun_Ruohua_SM.Machinegun_Ruohua_SM",
    StandId = "004",
    WeaponSeInfo = "Machinegun_Ruohua"
  },
  [2059801] = {
    ModelId = 2059801,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Machinegun/Machinegun_Liandu/Mesh/Machinegun_Liandu_SM.Machinegun_Liandu_SM",
    StandId = "004",
    WeaponSeInfo = "Machinegun_Chixing"
  },
  [2059901] = {
    ModelId = 2059901,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Machinegun/Machinegun_Jinshu/Mesh/Machinegun_Jinshu_SM.Machinegun_Jinshu_SM",
    StandId = "004",
    WeaponSeInfo = "Machinegun_Chixing"
  },
  [2060101] = {
    AdditionalFXID = T.RT_19,
    ModelId = 2060101,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Bow/Bow_Shashi/Mesh/Bow_Shashi_SM.Bow_Shashi_SM",
    StandId = "003",
    WeaponSeInfo = "Bow_Lieyan"
  },
  [2060201] = {
    AdditionalFXID = {2060100, 2060202},
    ModelId = 2060201,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Bow/Bow_Huguang/Mesh/Bow_Huguang_SM.Bow_Huguang_SM",
    StandId = "003",
    WeaponSeInfo = "Bow_Huguang"
  },
  [2060301] = {
    AdditionalFXID = T.RT_19,
    ModelId = 2060301,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Bow/Bow_Yinbu/Mesh/Bow_Yinbu_SM.Bow_Yinbu_SM",
    StandId = "003",
    WeaponSeInfo = "Bow_Inbu"
  },
  [2060401] = {
    AdditionalFXID = T.RT_19,
    ModelId = 2060401,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Bow/Bow_Chixing/Mesh/Bow_Chixing_SM.Bow_Chixing_SM",
    StandId = "003",
    WeaponSeInfo = "Bow_Chixing"
  },
  [2069801] = {
    AdditionalFXID = T.RT_19,
    ModelId = 2069801,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Bow/Bow_Liandu/Mesh/Bow_Liandu_SM.Bow_Liandu_SM",
    StandId = "003",
    WeaponSeInfo = "Bow_Common"
  },
  [2069901] = {
    AdditionalFXID = T.RT_19,
    ModelId = 2069901,
    ModelTag = T.RT_16,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Bow/Bow_Jinshu/Mesh/Bow_Jinshu_SM.Bow_Jinshu_SM",
    StandId = "003",
    WeaponSeInfo = "Bow_Common"
  },
  [3010101] = {
    ModelId = 3010101,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Claymore/Claymore_Kongjun/Mesh/Claymore_Kongjun_SM.Claymore_Kongjun_SM",
    WeaponHitedSeName = "heavysword"
  },
  [3010102] = {
    ModelId = 3010102,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Claymore/Claymore_Qunxing/Mesh/Claymore_Qunxing_SM.Claymore_Qunxing_SM",
    WeaponHitedSeName = "heavysword"
  },
  [3010103] = {
    ModelId = 3010103,
    ModelTag = T.RT_13,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Claymore/Claymore_Rongyao/Mesh/Claymore_Rongyao_SM.Claymore_Rongyao_SM",
    StandId = "009",
    WeaponHitedSeName = "heavysword"
  },
  [3010201] = {
    ModelId = 3010201,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Sword/Sword_Kongjun/Mesh/Sword_Kongjun_SM.Sword_Kongjun_SM",
    WeaponHitedSeName = "Sword"
  },
  [3010202] = {
    ModelId = 3010202,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Sword/Sword_Fubei/Mesh/Sword_Fubei_SM.Sword_Fubei_SM",
    WeaponHitedSeName = "lightSaber",
    WeaponSeInfo = "Sword_Lightsaber"
  },
  [3010301] = {
    AdditionalFXID = {2060100, 2060199},
    ModelId = 3010301,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Bow/Bow_Huanri/Mesh/Bow_Huanri_SM.Bow_Huanri_SM"
  },
  [3010401] = {
    AdditionalFXID = {1020199},
    ModelId = 3010401,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Polearm/Polearm_Xiaye/Mesh/Polearm_Xiaye_SM.Polearm_Xiaye_SM",
    WeaponHitedSeName = "spear"
  },
  [3010402] = {
    AdditionalFXID = {1020198},
    ModelId = 3010402,
    SkeletonMeshPath = "Asset/Char/Player/Common/Weapon/Polearm/Polearm_Talang/Mesh/Polearm_Talang_SM.Polearm_Talang_SM",
    WeaponHitedSeName = "spear"
  },
  [8210199] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Shuimu01/ABP_NPC_Shuimu01.ABP_NPC_Shuimu01_C'",
    AudioPrefix = "Shuimu_",
    FootType = "heeledMid",
    HeadScale = 0.8844,
    IsSkinModel = true,
    ModelId = 8210199,
    ModelScale = 0.9785,
    ModelTag = T.RT_5,
    MontageFolder = "/Game/Asset/Char/Player/Char097_Shuimu01/Animation/Montage/",
    MontagePrefix = "Shuimu_",
    SkeletonMeshPath = "Asset/Char/Player/Char097_Shuimu01/Mesh/Shuimu_SP01_SM",
    WeaponScale = 0.9785
  },
  [8510101] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Player/Songlu/ABP_Songlu_Summoned.ABP_Songlu_Summoned_C'",
    AudioPrefix = "Songlu_Summon_",
    AvatarExpressionPrefix = "Zhengzi_",
    ModelId = 8510101,
    MontageFolder = "/Game/Asset/Char/Player/Char021_Songlu/Animation/Summon/Montage/",
    MontagePrefix = "Songlu_Summon_",
    SkeletonMeshPath = "Asset/Char/Player/Char021_Songlu/Mesh/Songlu_Summon_SM.Songlu_Summon_SM"
  },
  [8510199] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Songlu01/ABP_NPC_Songlu01.ABP_NPC_Songlu01_C'",
    AudioPrefix = "Songlu_",
    FootType = "heeledLight",
    HeadScale = 0.98,
    IsSkinModel = true,
    ModelId = 8510199,
    ModelTag = T.RT_45,
    MontageFolder = "/Game/Asset/Char/Player/Char099_Songlu01/Animation/Montage/",
    MontagePrefix = "Songlu_",
    SkeletonMeshPath = "Asset/Char/Player/Char099_Songlu01/Mesh/Songlu_SP01_SM",
    WeaponScale = 0.8
  },
  [8530199] = {
    AccessoryMeshPath = T.RT_47,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Saiqi01/ABP_NPC_Saiqi01.ABP_NPC_Saiqi01_C'",
    AudioPrefix = "Saiqi_",
    FootType = "heeledMid",
    HeadScale = 0.98,
    IsSkinModel = true,
    ModelId = 8530199,
    ModelTag = {
      "FresnelColor",
      "NpcGirl"
    },
    MontageFolder = "/Game/Asset/Char/Player/Char098_Saiqi01/Animation/Montage/",
    MontagePrefix = "Saiqi_",
    SkeletonMeshPath = "Asset/Char/Player/Char098_Saiqi01/Mesh/Saiqi_SP01_SM",
    WeaponScale = 1
  },
  [9901101] = {
    ModelId = 9901101,
    SkeletonMeshPath = "Asset/Char/Player/Common/Rogue/Mesh/Player_RogShuimu_SM.Player_RogShuimu_SM"
  },
  [9901102] = {
    ModelId = 9901102,
    SkeletonMeshPath = "Asset/Char/Player/Common/Rogue/Mesh/Player_RogShuimu_SM.Player_RogShuimu_SM"
  },
  [9901111] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Rouge/ABP_Rou_Liuming_Seed.ABP_Rou_Liuming_Seed_C'",
    BirthTime = -1,
    HitMontageRule = "OnlyDieNoDissolve",
    ModelId = 9901111,
    ModelScale = 1.3,
    MontageFolder = "/Game/Asset/Char/Player/Common/Rogue/Animation/Montage/",
    MontagePrefix = "Rou_Liuming_Seed_",
    SkeletonMeshPath = "Asset/Char/Player/Common/Rogue/Mesh/Player_RogPick03_SM.Player_RogPick03_SM"
  },
  [9901112] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Rouge/ABP_Rou_Liuming_Leaf.ABP_Rou_Liuming_Leaf_C'",
    BirthTime = -1,
    HitMontageRule = "OnlyDieNoDissolve",
    ModelId = 9901112,
    ModelScale = 1.3,
    MontageFolder = "/Game/Asset/Char/Player/Common/Rogue/Animation/Montage/",
    MontagePrefix = "Rou_Liuming_Leaf_",
    SkeletonMeshPath = "Asset/Char/Player/Common/Rogue/Mesh/Player_RogPick02_SM.Player_RogPick02_SM"
  },
  [9901113] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Monster/Rouge/ABP_Rou_Liuming_Sapling.ABP_Rou_Liuming_Sapling_C'",
    BirthTime = -1,
    HitMontageRule = "OnlyDieNoDissolve",
    ModelId = 9901113,
    ModelScale = 1.5,
    MontageFolder = "/Game/Asset/Char/Player/Common/Rogue/Animation/Montage/",
    MontagePrefix = "Rou_Liuming_Sapling_",
    SkeletonMeshPath = "Asset/Char/Player/Common/Rogue/Mesh/Player_RogPick01_SM.Player_RogPick01_SM"
  },
  [11010010] = {
    IsSkinModel = true,
    ModelId = 11010010,
    SkeletonMeshPath = "Asset/Char/Player/Char001_Heitao_J/Mesh/Heitao_TP01_SM.Heitao_TP01_SM"
  },
  [11030010] = {
    IsSkinModel = true,
    ModelId = 11030010,
    SkeletonMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi01_TP01_SM.Tuosi01_TP01_SM"
  },
  [15010010] = {
    IsSkinModel = true,
    ModelId = 15010010,
    SkeletonMeshPath = "Asset/Char/Player/Char007_Baonu/Mesh/Baonu_TP01_SM.Baonu_TP01_SM"
  },
  [15020010] = {
    IsSkinModel = true,
    ModelId = 15020010,
    SkeletonMeshPath = "Asset/Char/Player/Char031_Nifu/Mesh/Nifu_TP01_SM.Nifu_TP01_SM"
  },
  [16010010] = {
    IsSkinModel = true,
    ModelId = 16010010,
    SkeletonMeshPath = "Asset/Char/Player/NPC001_Nvzhu/Mesh/Nvzhu_TP01_SM.Nvzhu_TP01_SM"
  },
  [16010110] = {
    IsSkinModel = true,
    ModelId = 16010110,
    SkeletonMeshPath = "Asset/Char/Player/NPC002_Nanzhu/Mesh/Nanzhu_TP01_SM.Nanzhu_TP01_SM"
  },
  [18010010] = {
    IsSkinModel = true,
    ModelId = 18010010,
    SkeletonMeshPath = "Asset/Char/Player/Char019_Feina/Mesh/Feina_TP01_SM.Feina_TP01_SM"
  },
  [21010010] = {
    IsSkinModel = true,
    ModelId = 21010010,
    SkeletonMeshPath = "Asset/Char/Player/Char005_Shuimu/Mesh/Shuimu_TP01_SM.Shuimu_TP01_SM"
  },
  [23010010] = {
    IsSkinModel = true,
    ModelId = 23010010,
    SkeletonMeshPath = "Asset/Char/Player/Char004_Zhangyu/Mesh/Zhangyu_TP01_SM.Zhangyu_TP01_SM"
  },
  [31010010] = {
    IsSkinModel = true,
    ModelId = 31010010,
    SkeletonMeshPath = "Asset/Char/Player/Char011_Linen/Mesh/Linen_TP01_SM.Linen_TP01_SM"
  },
  [31030010] = {
    IsSkinModel = true,
    ModelId = 31030010,
    SkeletonMeshPath = "Asset/Char/Player/Char017_Yeer/Mesh/Yeer_TP01_SM.Yeer_TP01_SM"
  },
  [32010010] = {
    IsSkinModel = true,
    ModelId = 32010010,
    SkeletonMeshPath = "Asset/Char/Player/Char006_Haier/Mesh/Haier_TP01_SM.Haier_TP01_SM"
  },
  [33010010] = {
    IsSkinModel = true,
    ModelId = 33010010,
    SkeletonMeshPath = "Asset/Char/Player/Char024_Maer/Mesh/Maer_TP01_SM.Maer_TP01_SM"
  },
  [41010010] = {
    IsSkinModel = true,
    ModelId = 41010010,
    SkeletonMeshPath = "Asset/Char/Player/Char020_Lise/Mesh/Lise_TP01_SM.Lise_TP01_SM"
  },
  [42020010] = {
    IsSkinModel = true,
    ModelId = 42020010,
    SkeletonMeshPath = "Asset/Char/Player/Char012_Landi/Mesh/Landi_TP01_SM.Landi_TP01_SM"
  },
  [43010010] = {
    IsSkinModel = true,
    ModelId = 43010010,
    SkeletonMeshPath = "Asset/Char/Player/Char009_Xibi/Mesh/Xibi_TP01_SM.Xibi_TP01_SM"
  },
  [51010010] = {
    IsSkinModel = true,
    ModelId = 51010010,
    SkeletonMeshPath = "Asset/Char/Player/Char021_Songlu/Mesh/Songlu_TP01_SM.Songlu_TP01_SM"
  },
  [51020010] = {
    IsSkinModel = true,
    ModelId = 51020010,
    SkeletonMeshPath = "Asset/Char/Player/Char018_Aote/Mesh/Aote_TP01_SM.Aote_TP01_SM"
  },
  [53010010] = {
    AccessoryMeshPath = T.RT_46,
    IsSkinModel = true,
    ModelId = 53010010,
    SkeletonMeshPath = "Asset/Char/Player/Char010_Saiqi/Mesh/Saiqi_TP01_SM.Saiqi_TP01_SM"
  },
  [54010010] = {
    IsSkinModel = true,
    ModelId = 54010010,
    SkeletonMeshPath = "Asset/Char/Player/Char026_Dafu/Mesh/Dafu_TP01_SM.Dafu_TP01_SM"
  },
  [811010010] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/HeiTao/ABP_NPC_Heitao.ABP_NPC_Heitao_C'",
    AudioPrefix = "Heitao_",
    FootType = "heeledMid",
    HeadScale = 0.96,
    IsSkinModel = true,
    ModelId = 811010010,
    ModelTag = T.RT_44,
    MontageFolder = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Montage/",
    MontagePrefix = "Heitao_",
    SkeletonMeshPath = "Asset/Char/Player/Char001_Heitao_J/Mesh/Heitao_TP01_SM.Heitao_TP01_SM"
  },
  [811030010] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Tuosi/ABP_NPC_Tuosi01.ABP_NPC_Tuosi01_C'",
    AudioPrefix = "Tuosi_",
    FootType = "bootHeavy",
    IsSkinModel = true,
    ModelId = 811030010,
    ModelScale = 0.95,
    ModelTag = T.RT_12,
    MontageFolder = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Montage/",
    MontagePrefix = "Tuosi_",
    SkeletonMeshPath = "Asset/Char/Player/Char025_Tuosi/Mesh/Tuosi01_TP01_SM.Tuosi01_TP01_SM"
  },
  [815010010] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Baonu/ABP_NPC_Baonu.ABP_NPC_Baonu_C'",
    AudioPrefix = "Baonu_",
    FootType = "heeledLight",
    IsSkinModel = true,
    ModelId = 815010010,
    ModelTag = T.RT_45,
    MontageFolder = "/Game/Asset/Char/Player/Char007_Baonu/Animation/Montage/",
    MontagePrefix = "Baonu_",
    SkeletonMeshPath = "Asset/Char/Player/Char007_Baonu/Mesh/Baonu_TP01_SM.Baonu_TP01_SM"
  },
  [815020010] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Nifu/ABP_NPC_Nifu.ABP_NPC_Nifu_C'",
    AudioPrefix = "Nifu_",
    FootType = "heeledHeavy",
    IsSkinModel = true,
    ModelId = 815020010,
    ModelScale = 0.95,
    ModelTag = T.RT_5,
    MontageFolder = "/Game/Asset/Char/Player/Char031_Nifu/Animation/Montage/",
    MontagePrefix = "Nifu_",
    SkeletonMeshPath = "Asset/Char/Player/Char031_Nifu/Mesh/Nifu_TP01_SM.Nifu_TP01_SM"
  },
  [818010010] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Feena/ABP_Npc_Feina.ABP_Npc_Feina_C'",
    AudioPrefix = "Feina_",
    AvatarExpressionPrefix = "Feina_",
    FootType = "heeledLight",
    IsSkinModel = true,
    ModelId = 818010010,
    ModelScale = 0.9,
    ModelTag = T.RT_44,
    MontageFolder = "/Game/Asset/Char/Player/Char019_Feina/Animation/Montage/",
    MontagePrefix = "Feina_",
    SkeletonMeshPath = "Asset/Char/Player/Char019_Feina/Mesh/Feina_TP01_SM.Feina_TP01_SM"
  },
  [821010010] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Shuimu/ABP_NPC_Shuimu.ABP_NPC_Shuimu_C'",
    AudioPrefix = "ShuiMu_",
    FootType = "heeledMid",
    HeadScale = 0.8844,
    IsSkinModel = true,
    ModelId = 821010010,
    ModelScale = 0.9785,
    ModelTag = T.RT_5,
    MontageFolder = "/Game/Asset/Char/Player/Char005_Shuimu/Animation/Montage/",
    MontagePrefix = "ShuiMu_",
    SkeletonMeshPath = "Asset/Char/Player/Char005_Shuimu/Mesh/Shuimu_TP01_SM.Shuimu_TP01_SM",
    WeaponScale = 0.9785
  },
  [823010010] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Zhangyu/ABP_NPC_Zhangyu.ABP_NPC_Zhangyu_C'",
    AudioPrefix = "Zhangyu_",
    FootType = "heeledLight",
    HeadScale = 0.96,
    IsSkinModel = true,
    ModelId = 823010010,
    ModelTag = T.RT_45,
    MontageFolder = "/Game/Asset/Char/Player/Char004_Zhangyu/Animation/Montage/",
    MontagePrefix = "Zhangyu_",
    SkeletonMeshPath = "Asset/Char/Player/Char004_Zhangyu/Mesh/Zhangyu_TP01_SM.Zhangyu_TP01_SM"
  },
  [831010010] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Linen/ABP_NPC_Linen.ABP_NPC_Linen_C'",
    AudioPrefix = "Linen_",
    FootType = "heeledHeavy",
    IsSkinModel = true,
    ModelId = 831010010,
    ModelScale = 0.95,
    ModelTag = T.RT_5,
    MontageFolder = "/Game/Asset/Char/Player/Char011_Linen/Animation/Montage/",
    MontagePrefix = "Linen_",
    SkeletonMeshPath = "Asset/Char/Player/Char011_Linen/Mesh/Linen_TP01_SM.Linen_TP01_SM"
  },
  [831030010] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Yeer/ABP_NPC_Yeer.ABP_NPC_Yeer_C'",
    AudioPrefix = "Yeer_",
    FootType = "heeledLight",
    IsSkinModel = true,
    ModelId = 831030010,
    ModelScale = 0.85,
    ModelTag = T.RT_45,
    MontageFolder = "/Game/Asset/Char/Player/Char017_Yeer/Animation/Montage/",
    MontagePrefix = "Yeer_",
    SkeletonMeshPath = "Asset/Char/Player/Char017_Yeer/Mesh/Yeer_TP01_SM.Yeer_TP01_SM"
  },
  [832010010] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Haier/ABP_NPC_Haier.ABP_NPC_Haier_C'",
    AudioPrefix = "Haier_",
    FootType = "heeledHeavy",
    HeadScale = 0.8754,
    IsSkinModel = true,
    ModelId = 832010010,
    ModelScale = 0.95,
    ModelTag = T.RT_5,
    MontageFolder = "/Game/Asset/Char/Player/Char006_Haier/Animation/Montage/",
    MontagePrefix = "Haier_",
    SkeletonMeshPath = "Asset/Char/Player/Char006_Haier/Mesh/Haier_TP01_SM.Haier_TP01_SM"
  },
  [833010010] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Maerjie/ABP_NPC_Maer.ABP_NPC_Maer_C'",
    AudioPrefix = "Maer_",
    FootType = "heeledMid",
    HeadScale = 1.02,
    IsSkinModel = true,
    ModelId = 833010010,
    ModelScale = 0.95,
    ModelTag = T.RT_44,
    MontageFolder = "/Game/Asset/Char/Player/Char024_Maer/Animation/Montage/",
    MontagePrefix = "Maer_",
    SkeletonMeshPath = "Asset/Char/Player/Char024_Maer/Mesh/Maer_TP01_SM.Maer_TP01_SM"
  },
  [841010010] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Lise/ABP_NPC_Lise.ABP_NPC_Lise_C'",
    AudioPrefix = "Lise_",
    FootType = "heeledMid",
    IsSkinModel = true,
    ModelId = 841010010,
    ModelTag = T.RT_44,
    MontageFolder = "/Game/Asset/Char/Player/Char020_Lise/Animation/Montage/",
    MontagePrefix = "Lise_",
    SkeletonMeshPath = "Asset/Char/Player/Char020_Lise/Mesh/Lise_TP01_SM.Lise_TP01_SM"
  },
  [842020010] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Landi/ABP_NPC_Landi.ABP_NPC_Landi_C'",
    AudioPrefix = "Landi_",
    FootType = "bootHeavy",
    IsSkinModel = true,
    ModelId = 842020010,
    ModelScale = 0.95,
    ModelTag = T.RT_12,
    MontageFolder = "/Game/Asset/Char/Player/Char012_Landi/Animation/Montage/",
    MontagePrefix = "Landi_",
    SkeletonMeshPath = "Asset/Char/Player/Char012_Landi/Mesh/Landi_TP01_SM.Landi_TP01_SM"
  },
  [843010010] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Xibi/ABP_NPC_Xibi.ABP_NPC_Xibi_C'",
    AudioPrefix = "Xibi_",
    AvatarExpressionPrefix = "Xibi_",
    FootType = "heeledHeavy",
    IsSkinModel = true,
    ModelId = 843010010,
    ModelScale = 0.95,
    ModelTag = T.RT_5,
    MontageFolder = "/Game/Asset/Char/Player/Char009_Xibi/Animation/Montage/",
    MontagePrefix = "Xibi_",
    SkeletonMeshPath = "Asset/Char/Player/Char009_Xibi/Mesh/Xibi_TP01_SM.Xibi_TP01_SM"
  },
  [851010010] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Songlu/ABP_NPC_Songlu.ABP_NPC_Songlu_C'",
    AudioPrefix = "Songlu_",
    AvatarExpressionPrefix = "Songlu_",
    FootType = "heeledLight",
    HeadScale = 0.98,
    IsSkinModel = true,
    ModelId = 851010010,
    ModelTag = T.RT_45,
    MontageFolder = "/Game/Asset/Char/Player/Char021_Songlu/Animation/Montage/",
    MontagePrefix = "Songlu_",
    SkeletonMeshPath = "Asset/Char/Player/Char021_Songlu/Mesh/Songlu_TP01_SM.Songlu_TP01_SM"
  },
  [851020010] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/OutSide/ABP_NPC_Aote.ABP_NPC_Aote_C'",
    AudioPrefix = "Aote_",
    FootType = "bootHeavy",
    IsSkinModel = true,
    ModelId = 851020010,
    ModelScale = 0.95,
    ModelTag = T.RT_12,
    MontageFolder = "/Game/Asset/Char/Player/Char018_Aote/Animation/Montage/",
    MontagePrefix = "Aote_",
    SkeletonMeshPath = "Asset/Char/Player/Char018_Aote/Mesh/Aote_TP01_SM.Aote_TP01_SM"
  },
  [853010010] = {
    AccessoryMeshPath = T.RT_46,
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Saiqi/ABP_NPC_Saiqi.ABP_NPC_Saiqi_C'",
    AudioPrefix = "Saiqi_",
    FootType = "heeledMid",
    HeadScale = 0.98,
    IsSkinModel = true,
    ModelId = 853010010,
    ModelTag = T.RT_44,
    MontageFolder = "/Game/Asset/Char/Player/Char010_Saiqi/Animation/Montage/",
    MontagePrefix = "Saiqi_",
    SkeletonMeshPath = "Asset/Char/Player/Char010_Saiqi/Mesh/Saiqi_TP01_SM.Saiqi_TP01_SM"
  },
  [854010010] = {
    AnimInstancePath = "AnimBlueprint'/Game/AssetDesign/Char/Npc/CharacterNpc/Dafu/ABP_NPC_Dafu.ABP_NPC_Dafu_C'",
    AudioPrefix = "Dafu_",
    AvatarExpressionPrefix = "Dafu_",
    FootType = "heeledHeavy",
    IsSkinModel = true,
    ModelId = 854010010,
    ModelScale = 0.94,
    ModelTag = T.RT_5,
    MontageFolder = "/Game/Asset/Char/Player/Char026_Dafu/Animation/Montage/",
    MontagePrefix = "Dafu_",
    SkeletonMeshPath = "Asset/Char/Player/Char026_Dafu/Mesh/Dafu_TP01_SM.Dafu_TP01_SM"
  }
})
