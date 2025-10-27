local T = {}
T.RT_1 = {"FX_Dead"}
T.RT_2 = {"Fish"}
T.RT_3 = {"Prop"}
T.RT_4 = {
  0,
  0,
  -5
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("EffectCreature", {
  [1] = {
    EffectCreatureId = 1,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Common/BP_EffectCreature_Excavation_MapCircle.BP_EffectCreature_Excavation_MapCircle",
    SocketName = "root_effect"
  },
  [2] = {
    EffectCreatureId = 2,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Common/BP_EffectCreature_Key.BP_EffectCreature_Key",
    SocketName = "root_effect"
  },
  [10] = {EffectCreatureId = 10},
  [101] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet005_Shanling/Animation/Sequence/Locomotion/Pet_Shanling_Idle.Pet_Shanling_Idle",
    EffectCreatureId = 101,
    MeshResourceId = 406,
    ModelOffset = {
      0,
      0,
      70
    },
    SocketName = "Root"
  },
  [121] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/NPC001_Nvzhu/Animation/Summon/Montage/Nvzhu_Dark_Summon_Montage.Nvzhu_Dark_Summon_Montage",
    EffectCreatureId = 121,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Nvzhu_Dark_Skill01.BP_EffectCreature_Nvzhu_Dark_Skill01",
    EffectCreatureTag = {"NvzhuDark"},
    MeshResourceId = 120102,
    SocketName = "Root"
  },
  [400] = {
    EffectCreatureId = 400,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet.BP_EffectCreature_BattlePet",
    SocketName = "Root"
  },
  [4011] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet006_Zisha/Animation/Montage/Pet_Zisha_Skill01_Montage.Pet_Zisha_Skill01_Montage",
    EffectCreatureId = 4011,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 401,
    SocketName = "Root"
  },
  [4012] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet006_Zisha/Animation/Montage/Pet_Zisha_Skill01_Montage.Pet_Zisha_Skill01_Montage",
    EffectCreatureId = 4012,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 431,
    SocketName = "Root"
  },
  [4013] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet006_Zisha/Animation/Montage/Pet_Zisha_Skill01_Montage.Pet_Zisha_Skill01_Montage",
    EffectCreatureId = 4013,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 441,
    SocketName = "Root"
  },
  [4021] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet001_Yuyi/Animation/Montage/Pet_Yuyi_Skill01_Montage.Pet_Yuyi_Skill01_Montage",
    EffectCreatureId = 4021,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 402,
    SocketName = "Root"
  },
  [4022] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet001_Yuyi/Animation/Montage/Pet_Yuyi_Skill01_Montage.Pet_Yuyi_Skill01_Montage",
    EffectCreatureId = 4022,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 432,
    SocketName = "Root"
  },
  [4023] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet001_Yuyi/Animation/Montage/Pet_Yuyi_Skill01_Montage.Pet_Yuyi_Skill01_Montage",
    EffectCreatureId = 4023,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 442,
    SocketName = "Root"
  },
  [4031] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet002_Dahuo/Animation/Montage/Pet_Dahuo_Skill01_Montage.Pet_Dahuo_Skill01_Montage",
    EffectCreatureId = 4031,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 403,
    SocketName = "Root"
  },
  [4032] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet002_Dahuo/Animation/Montage/Pet_Dahuo_Skill01_Montage.Pet_Dahuo_Skill01_Montage",
    EffectCreatureId = 4032,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 433,
    SocketName = "Root"
  },
  [4033] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet002_Dahuo/Animation/Montage/Pet_Dahuo_Skill01_Montage.Pet_Dahuo_Skill01_Montage",
    EffectCreatureId = 4033,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 443,
    SocketName = "Root"
  },
  [4041] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet004_Zhamao/Animation/Montage/Pet_Zhamao_Skill01_Montage.Pet_Zhamao_Skill01_Montage",
    EffectCreatureId = 4041,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 404,
    SocketName = "Root"
  },
  [4042] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet004_Zhamao/Animation/Montage/Pet_Zhamao_Skill01_Montage.Pet_Zhamao_Skill01_Montage",
    EffectCreatureId = 4042,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 434,
    SocketName = "Root"
  },
  [4043] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet004_Zhamao/Animation/Montage/Pet_Zhamao_Skill01_Montage.Pet_Zhamao_Skill01_Montage",
    EffectCreatureId = 4043,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 444,
    SocketName = "Root"
  },
  [4051] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet003_Yaoye/Animation/Montage/Pet_Yaoye_Skill01_Montage.Pet_Yaoye_Skill01_Montage",
    EffectCreatureId = 4051,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 405,
    SocketName = "Root"
  },
  [4052] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet003_Yaoye/Animation/Montage/Pet_Yaoye_Skill01_Montage.Pet_Yaoye_Skill01_Montage",
    EffectCreatureId = 4052,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 435,
    SocketName = "Root"
  },
  [4053] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet003_Yaoye/Animation/Montage/Pet_Yaoye_Skill01_Montage.Pet_Yaoye_Skill01_Montage",
    EffectCreatureId = 4053,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 445,
    SocketName = "Root"
  },
  [4061] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet005_Shanling/Animation/Montage/Pet_Shanling_Skill01_Montage.Pet_Shanling_Skill01_Montage",
    EffectCreatureId = 4061,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 406,
    SocketName = "Root"
  },
  [4062] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet005_Shanling/Animation/Montage/Pet_Shanling_Skill01_Montage.Pet_Shanling_Skill01_Montage",
    EffectCreatureId = 4062,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 436,
    SocketName = "Root"
  },
  [4063] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet005_Shanling/Animation/Montage/Pet_Shanling_Skill01_Montage.Pet_Shanling_Skill01_Montage",
    EffectCreatureId = 4063,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 446,
    SocketName = "Root"
  },
  [4071] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet007_Nihao/Animation/Montage/Pet_Nihao_Skill01_Montage.Pet_Nihao_Skill01_Montage",
    EffectCreatureId = 4071,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 407,
    SocketName = "Root"
  },
  [4072] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet007_Nihao/Animation/Montage/Pet_Nihao_Skill01_Montage.Pet_Nihao_Skill01_Montage",
    EffectCreatureId = 4072,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 437,
    SocketName = "Root"
  },
  [4073] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet007_Nihao/Animation/Montage/Pet_Nihao_Skill01_Montage.Pet_Nihao_Skill01_Montage",
    EffectCreatureId = 4073,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 447,
    SocketName = "Root"
  },
  [4081] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet008_Zhenzhu/Animation/Montage/Pet_Zhenzhu_Skill01_Montage.Pet_Zhenzhu_Skill01_Montage",
    EffectCreatureId = 4081,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 408,
    SocketName = "Root"
  },
  [4082] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet008_Zhenzhu/Animation/Montage/Pet_Zhenzhu_Skill01_Montage.Pet_Zhenzhu_Skill01_Montage",
    EffectCreatureId = 4082,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 438,
    SocketName = "Root"
  },
  [4083] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet008_Zhenzhu/Animation/Montage/Pet_Zhenzhu_Skill01_Montage.Pet_Zhenzhu_Skill01_Montage",
    EffectCreatureId = 4083,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 448,
    SocketName = "Root"
  },
  [4091] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet009_Haomeng/Animation/Montage/Pet_Haomeng_Skill01_Montage.Pet_Haomeng_Skill01_Montage",
    EffectCreatureId = 4091,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 409,
    SocketName = "Root"
  },
  [4092] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet009_Haomeng/Animation/Montage/Pet_Haomeng_Skill01_Montage.Pet_Haomeng_Skill01_Montage",
    EffectCreatureId = 4092,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 439,
    SocketName = "Root"
  },
  [4093] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet009_Haomeng/Animation/Montage/Pet_Haomeng_Skill01_Montage.Pet_Haomeng_Skill01_Montage",
    EffectCreatureId = 4093,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 449,
    SocketName = "Root"
  },
  [4111] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet018_Fuyou/Animation/Montage/Pet018_Fuyou_Skill01_Montage.Pet018_Fuyou_Skill01_Montage",
    EffectCreatureId = 4111,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 411,
    SocketName = "Root"
  },
  [4112] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet018_Fuyou/Animation/Montage/Pet018_Fuyou_Skill01_Montage.Pet018_Fuyou_Skill01_Montage",
    EffectCreatureId = 4112,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 451,
    SocketName = "Root"
  },
  [4113] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet018_Fuyou/Animation/Montage/Pet018_Fuyou_Skill01_Montage.Pet018_Fuyou_Skill01_Montage",
    EffectCreatureId = 4113,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 461,
    SocketName = "Root"
  },
  [4121] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet013_Tangshuang/Animation/Montage/Pet_Tangshuang_Skill01_Montage.Pet_Tangshuang_Skill01_Montage",
    EffectCreatureId = 4121,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 412,
    SocketName = "Root"
  },
  [4122] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet013_Tangshuang/Animation/Montage/Pet_Tangshuang_Skill01_Montage.Pet_Tangshuang_Skill01_Montage",
    EffectCreatureId = 4122,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 452,
    SocketName = "Root"
  },
  [4123] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet013_Tangshuang/Animation/Montage/Pet_Tangshuang_Skill01_Montage.Pet_Tangshuang_Skill01_Montage",
    EffectCreatureId = 4123,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 462,
    SocketName = "Root"
  },
  [4131] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet014_YYHW/Animation/Montage/Pet_YYHW_Skill01_Montage.Pet_YYHW_Skill01_Montage",
    EffectCreatureId = 4131,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 413,
    SocketName = "Root"
  },
  [4132] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet014_YYHW/Animation/Montage/Pet_YYHW_Skill01_Montage.Pet_YYHW_Skill01_Montage",
    EffectCreatureId = 4132,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 453,
    SocketName = "Root"
  },
  [4133] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet014_YYHW/Animation/Montage/Pet_YYHW_Skill01_Montage.Pet_YYHW_Skill01_Montage",
    EffectCreatureId = 4133,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 463,
    SocketName = "Root"
  },
  [4141] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet016_Pipa/Animation/Montage/Pet_Pipa_Skill01_Montage.Pet_Pipa_Skill01_Montage",
    EffectCreatureId = 4141,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 414,
    SocketName = "Root"
  },
  [4142] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet016_Pipa/Animation/Montage/Pet_Pipa_Skill01_Montage.Pet_Pipa_Skill01_Montage",
    EffectCreatureId = 4142,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 454,
    SocketName = "Root"
  },
  [4143] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet016_Pipa/Animation/Montage/Pet_Pipa_Skill01_Montage.Pet_Pipa_Skill01_Montage",
    EffectCreatureId = 4143,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 464,
    SocketName = "Root"
  },
  [4151] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet015_Mianmian/Animation/Montage/Pet_Mianmian_Skill01_Montage.Pet_Mianmian_Skill01_Montage",
    EffectCreatureId = 4151,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 415,
    SocketName = "Root"
  },
  [4152] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet015_Mianmian/Animation/Montage/Pet_Mianmian_Skill01_Montage.Pet_Mianmian_Skill01_Montage",
    EffectCreatureId = 4152,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 455,
    SocketName = "Root"
  },
  [4153] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet015_Mianmian/Animation/Montage/Pet_Mianmian_Skill01_Montage.Pet_Mianmian_Skill01_Montage",
    EffectCreatureId = 4153,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 465,
    SocketName = "Root"
  },
  [4161] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet017_Qiuqiu/Animation/Montage/Pet_Qiuqiu_Skill01_Montage.Pet_Qiuqiu_Skill01_Montage",
    EffectCreatureId = 4161,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 416,
    SocketName = "Root"
  },
  [4162] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet017_Qiuqiu/Animation/Montage/Pet_Qiuqiu_Skill01_Montage.Pet_Qiuqiu_Skill01_Montage",
    EffectCreatureId = 4162,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 456,
    SocketName = "Root"
  },
  [4163] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet017_Qiuqiu/Animation/Montage/Pet_Qiuqiu_Skill01_Montage.Pet_Qiuqiu_Skill01_Montage",
    EffectCreatureId = 4163,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 466,
    SocketName = "Root"
  },
  [4211] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet024_Heiyao/Animation/Montage/Combat/Pet_Heiyao_Skill01_Montage.Pet_Heiyao_Skill01_Montage",
    EffectCreatureId = 4211,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 421,
    SocketName = "Root"
  },
  [4221] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet020_Jinqing/Animation/Montage/Combat/Pet_Jinqing_Skill01_Montage.Pet_Jinqing_Skill01_Montage",
    EffectCreatureId = 4221,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 422,
    SocketName = "Root"
  },
  [4231] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet022_Manao/Animation/Montage/Combat/Pet_Manao_Skill01_Montage.Pet_Manao_Skill01_Montage",
    EffectCreatureId = 4231,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 423,
    SocketName = "Root"
  },
  [4241] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet023_Zijing/Animation/Montage/Combat/Pet_Zijing_Skill01_Montage.Pet_Zijing_Skill01_Montage",
    EffectCreatureId = 4241,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 424,
    SocketName = "Root"
  },
  [4251] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet021_Bixi/Animation/Montage/Combat/Pet_Bixi_Skill01_Montage.Pet_Bixi_Skill01_Montage",
    EffectCreatureId = 4251,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 425,
    SocketName = "Root"
  },
  [4261] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet025_Oubo/Animation/Montage/Combat/Pet_Oubo_Skill01_Montage.Pet_Oubo_Skill01_Montage",
    EffectCreatureId = 4261,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 426,
    SocketName = "Root"
  },
  [4911] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet010_HealRobot/Animation/Sequence/Locomotion/Pet_HealRobot_Idle.Pet_HealRobot_Idle",
    EffectCreatureId = 4911,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 491,
    ModelOffset = T.RT_4,
    SocketName = "Root"
  },
  [4912] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet010_HealRobot/Animation/Sequence/Locomotion/Pet_HealRobot_Idle.Pet_HealRobot_Idle",
    EffectCreatureId = 4912,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 494,
    ModelOffset = T.RT_4,
    SocketName = "Root"
  },
  [4913] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet010_HealRobot/Animation/Sequence/Locomotion/Pet_HealRobot_Idle.Pet_HealRobot_Idle",
    EffectCreatureId = 4913,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 496,
    ModelOffset = T.RT_4,
    SocketName = "Root"
  },
  [4921] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet011_BlastRobot/Animation/Sequence/Locomotion/Pet_BlastRobot_Idle.Pet_BlastRobot_Idle",
    EffectCreatureId = 4921,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 492,
    SocketName = "Root"
  },
  [4922] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet011_BlastRobot/Animation/Sequence/Locomotion/Pet_BlastRobot_Idle.Pet_BlastRobot_Idle",
    EffectCreatureId = 4922,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 495,
    SocketName = "Root"
  },
  [4923] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet011_BlastRobot/Animation/Sequence/Locomotion/Pet_BlastRobot_Idle.Pet_BlastRobot_Idle",
    EffectCreatureId = 4923,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 497,
    SocketName = "Root"
  },
  [4931] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet019_YYD/Animation/Sequence/Locomotion/Pet_YYD01_Idle.Pet_YYD01_Idle",
    EffectCreatureId = 4931,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 493,
    SocketName = "Root"
  },
  [4932] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet019_YYD/Animation/Sequence/Locomotion/Pet_YYD01_Idle.Pet_YYD01_Idle",
    EffectCreatureId = 4932,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 498,
    SocketName = "Root"
  },
  [4933] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet019_YYD/Animation/Sequence/Locomotion/Pet_YYD01_Idle.Pet_YYD01_Idle",
    EffectCreatureId = 4933,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 499,
    SocketName = "Root"
  },
  [4934] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet019_YYD/Animation/Sequence/Locomotion/Pet_YYD01_Idle.Pet_YYD01_Idle",
    EffectCreatureId = 4934,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 499,
    SocketName = "Root"
  },
  [6011] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet026_Wuyou/Animation/Montage/Combat/Pet_Wuyou01_Skill01_Montage.Pet_Wuyou01_Skill01_Montage",
    EffectCreatureId = 6011,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 471,
    SocketName = "Root"
  },
  [6021] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet026_Wuyou/Animation/Montage/Combat/Pet_Wuyou02_Skill01_Montage.Pet_Wuyou02_Skill01_Montage",
    EffectCreatureId = 6021,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 472,
    SocketName = "Root"
  },
  [6031] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet026_Wuyou/Animation/Montage/Combat/Pet_Wuyou03_Skill01_Montage.Pet_Wuyou03_Skill01_Montage",
    EffectCreatureId = 6031,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 473,
    SocketName = "Root"
  },
  [6041] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet026_Wuyou/Animation/Montage/Combat/Pet_Wuyou04_Skill01_Montage.Pet_Wuyou04_Skill01_Montage",
    EffectCreatureId = 6041,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 474,
    SocketName = "Root"
  },
  [9011] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet026_Wuyou/Animation/Montage/Combat/Pet_Wuyou04_Skill01_Montage.Pet_Wuyou04_Skill01_Montage",
    EffectCreatureId = 9011,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet_New.BP_EffectCreature_BattlePet_New",
    MeshResourceId = 470,
    SocketName = "Root"
  },
  [10101] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Kaorou01_Girl_Montage.Show_Kaorou01_Girl_Montage",
    EffectCreatureId = 10101,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Kaorou.BP_EffectCreature_Gesture_Kaorou",
    MeshResourceId = 301,
    SocketName = "Root"
  },
  [10102] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Kaorou01_Loli_Montage.Show_Kaorou01_Loli_Montage",
    EffectCreatureId = 10102,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Kaorou.BP_EffectCreature_Gesture_Kaorou",
    MeshResourceId = 302,
    SocketName = "Root"
  },
  [10201] = {
    EffectCreatureId = 10201,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Zhixiang_01.BP_EffectCreature_Gesture_Zhixiang_01",
    SocketName = "Root"
  },
  [10202] = {
    EffectCreatureId = 10202,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Zhixiang_02.BP_EffectCreature_Gesture_Zhixiang_02"
  },
  [10203] = {
    EffectCreatureId = 10203,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Zhixiang_03.BP_EffectCreature_Gesture_Zhixiang_03"
  },
  [10301] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Saoba01_Girl_Montage.Show_Saoba01_Girl_Montage",
    EffectCreatureId = 10301,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture.BP_EffectCreature_Gesture",
    MeshResourceId = 303,
    SocketName = "Root"
  },
  [10302] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Saoba01_Man_Montage.Show_Saoba01_Man_Montage",
    EffectCreatureId = 10302,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture.BP_EffectCreature_Gesture",
    MeshResourceId = 304,
    SocketName = "Root"
  },
  [10401] = {
    EffectCreatureId = 10401,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Caocong.BP_EffectCreature_Gesture_Caocong",
    SocketName = "Root"
  },
  [10501] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Xiangzi01_Loli_Montage.Show_Xiangzi01_Loli_Montage",
    EffectCreatureId = 10501,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture.BP_EffectCreature_Gesture",
    MeshResourceId = 305,
    SocketName = "Root"
  },
  [10502] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Xiangzi01_Man_Montage.Show_Xiangzi01_Man_Montage",
    EffectCreatureId = 10502,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture.BP_EffectCreature_Gesture",
    MeshResourceId = 305,
    SocketName = "Root"
  },
  [10503] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Xiangzi01_Girl_Montage.Show_Xiangzi01_Girl_Montage",
    EffectCreatureId = 10503,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture.BP_EffectCreature_Gesture",
    MeshResourceId = 305,
    SocketName = "Root"
  },
  [10601] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Bed01_Montage.Show_Bed01_Montage",
    EffectCreatureId = 10601,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture.BP_EffectCreature_Gesture",
    MeshResourceId = 306,
    SocketName = "Root"
  },
  [10602] = {
    EffectCreatureId = 10602,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Bed.BP_EffectCreature_Gesture_Bed",
    SocketName = "Root"
  },
  [10701] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01A_Girl_Montage.Show_Violin01A_Girl_Montage",
    EffectCreatureId = 10701,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin01.BP_EffectCreature_Gesture_Violin01",
    MeshResourceId = 307,
    SocketName = "hook_arm_l"
  },
  [10702] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01A_Loli_Montage.Show_Violin01A_Loli_Montage",
    EffectCreatureId = 10702,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin01.BP_EffectCreature_Gesture_Violin01",
    MeshResourceId = 307,
    SocketName = "hook_arm_l"
  },
  [10703] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01A_Man_Montage.Show_Violin01A_Man_Montage",
    EffectCreatureId = 10703,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin01.BP_EffectCreature_Gesture_Violin01",
    MeshResourceId = 307,
    SocketName = "hook_arm_l"
  },
  [10704] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01A_Woman_Montage.Show_Violin01A_Woman_Montage",
    EffectCreatureId = 10704,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin01.BP_EffectCreature_Gesture_Violin01",
    MeshResourceId = 307,
    SocketName = "hook_arm_l"
  },
  [10705] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01A_Boy_Montage.Show_Violin01A_Boy_Montage",
    EffectCreatureId = 10705,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin01.BP_EffectCreature_Gesture_Violin01",
    MeshResourceId = 307,
    SocketName = "hook_arm_l"
  },
  [10706] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01A_Girl_Montage.Show_Violin01A_Girl_Montage",
    EffectCreatureId = 10706,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin02.BP_EffectCreature_Gesture_Violin02",
    MeshResourceId = 307,
    SocketName = "hook_arm_l"
  },
  [10707] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01A_Loli_Montage.Show_Violin01A_Loli_Montage",
    EffectCreatureId = 10707,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin02.BP_EffectCreature_Gesture_Violin02",
    MeshResourceId = 307,
    SocketName = "hook_arm_l"
  },
  [10708] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01A_Man_Montage.Show_Violin01A_Man_Montage",
    EffectCreatureId = 10708,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin02.BP_EffectCreature_Gesture_Violin02",
    MeshResourceId = 307,
    SocketName = "hook_arm_l"
  },
  [10709] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01A_Woman_Montage.Show_Violin01A_Woman_Montage",
    EffectCreatureId = 10709,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin02.BP_EffectCreature_Gesture_Violin02",
    MeshResourceId = 307,
    SocketName = "hook_arm_l"
  },
  [10710] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01A_Boy_Montage.Show_Violin01A_Boy_Montage",
    EffectCreatureId = 10710,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin02.BP_EffectCreature_Gesture_Violin02",
    MeshResourceId = 307,
    SocketName = "hook_arm_l"
  },
  [10711] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01A_Girl_Montage.Show_Violin01A_Girl_Montage",
    EffectCreatureId = 10711,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin03.BP_EffectCreature_Gesture_Violin03",
    MeshResourceId = 307,
    SocketName = "hook_arm_l"
  },
  [10712] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01A_Loli_Montage.Show_Violin01A_Loli_Montage",
    EffectCreatureId = 10712,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin03.BP_EffectCreature_Gesture_Violin03",
    MeshResourceId = 307,
    SocketName = "hook_arm_l"
  },
  [10713] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01A_Man_Montage.Show_Violin01A_Man_Montage",
    EffectCreatureId = 10713,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin03.BP_EffectCreature_Gesture_Violin03",
    MeshResourceId = 307,
    SocketName = "hook_arm_l"
  },
  [10714] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01A_Woman_Montage.Show_Violin01A_Woman_Montage",
    EffectCreatureId = 10714,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin03.BP_EffectCreature_Gesture_Violin03",
    MeshResourceId = 307,
    SocketName = "hook_arm_l"
  },
  [10715] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01A_Boy_Montage.Show_Violin01A_Boy_Montage",
    EffectCreatureId = 10715,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin03.BP_EffectCreature_Gesture_Violin03",
    MeshResourceId = 307,
    SocketName = "hook_arm_l"
  },
  [10801] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01B_Girl_Montage.Show_Violin01B_Girl_Montage",
    EffectCreatureId = 10801,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin01.BP_EffectCreature_Gesture_Violin01",
    MeshResourceId = 308,
    SocketName = "hook_arm_r"
  },
  [10802] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01B_Loli_Montage.Show_Violin01B_Loli_Montage",
    EffectCreatureId = 10802,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin01.BP_EffectCreature_Gesture_Violin01",
    MeshResourceId = 308,
    SocketName = "hook_arm_r"
  },
  [10803] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01B_Man_Montage.Show_Violin01B_Man_Montage",
    EffectCreatureId = 10803,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin01.BP_EffectCreature_Gesture_Violin01",
    MeshResourceId = 308,
    SocketName = "hook_arm_r"
  },
  [10804] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01B_Woman_Montage.Show_Violin01B_Woman_Montage",
    EffectCreatureId = 10804,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin01.BP_EffectCreature_Gesture_Violin01",
    MeshResourceId = 308,
    SocketName = "hook_arm_r"
  },
  [10805] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01B_Boy_Montage.Show_Violin01B_Boy_Montage",
    EffectCreatureId = 10805,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin01.BP_EffectCreature_Gesture_Violin01",
    MeshResourceId = 308,
    SocketName = "hook_arm_r"
  },
  [10806] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01B_Girl_Montage.Show_Violin01B_Girl_Montage",
    EffectCreatureId = 10806,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin02.BP_EffectCreature_Gesture_Violin02",
    MeshResourceId = 308,
    SocketName = "hook_arm_r"
  },
  [10807] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01B_Loli_Montage.Show_Violin01B_Loli_Montage",
    EffectCreatureId = 10807,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin02.BP_EffectCreature_Gesture_Violin02",
    MeshResourceId = 308,
    SocketName = "hook_arm_r"
  },
  [10808] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01B_Man_Montage.Show_Violin01B_Man_Montage",
    EffectCreatureId = 10808,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin02.BP_EffectCreature_Gesture_Violin02",
    MeshResourceId = 308,
    SocketName = "hook_arm_r"
  },
  [10809] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01B_Woman_Montage.Show_Violin01B_Woman_Montage",
    EffectCreatureId = 10809,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin02.BP_EffectCreature_Gesture_Violin02",
    MeshResourceId = 308,
    SocketName = "hook_arm_r"
  },
  [10810] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01B_Boy_Montage.Show_Violin01B_Boy_Montage",
    EffectCreatureId = 10810,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin02.BP_EffectCreature_Gesture_Violin02",
    MeshResourceId = 308,
    SocketName = "hook_arm_r"
  },
  [10811] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01B_Girl_Montage.Show_Violin01B_Girl_Montage",
    EffectCreatureId = 10811,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin03.BP_EffectCreature_Gesture_Violin03",
    MeshResourceId = 308,
    SocketName = "hook_arm_r"
  },
  [10812] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01B_Loli_Montage.Show_Violin01B_Loli_Montage",
    EffectCreatureId = 10812,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin03.BP_EffectCreature_Gesture_Violin03",
    MeshResourceId = 308,
    SocketName = "hook_arm_r"
  },
  [10813] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01B_Man_Montage.Show_Violin01B_Man_Montage",
    EffectCreatureId = 10813,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin03.BP_EffectCreature_Gesture_Violin03",
    MeshResourceId = 308,
    SocketName = "hook_arm_r"
  },
  [10814] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01B_Woman_Montage.Show_Violin01B_Woman_Montage",
    EffectCreatureId = 10814,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin03.BP_EffectCreature_Gesture_Violin03",
    MeshResourceId = 308,
    SocketName = "hook_arm_r"
  },
  [10815] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01B_Boy_Montage.Show_Violin01B_Boy_Montage",
    EffectCreatureId = 10815,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin03.BP_EffectCreature_Gesture_Violin03",
    MeshResourceId = 308,
    SocketName = "hook_arm_r"
  },
  [10901] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01C_Girl_Montage.Show_Violin01C_Girl_Montage",
    EffectCreatureId = 10901,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin01.BP_EffectCreature_Gesture_Violin01",
    MeshResourceId = 309,
    SocketName = "hook_arm_l"
  },
  [10902] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01C_Loli_Montage.Show_Violin01C_Loli_Montage",
    EffectCreatureId = 10902,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin01.BP_EffectCreature_Gesture_Violin01",
    MeshResourceId = 309,
    SocketName = "hook_arm_l"
  },
  [10903] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01C_Man_Montage.Show_Violin01C_Man_Montage",
    EffectCreatureId = 10903,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin01.BP_EffectCreature_Gesture_Violin01",
    MeshResourceId = 309,
    SocketName = "hook_arm_l"
  },
  [10904] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01C_Woman_Montage.Show_Violin01C_Woman_Montage",
    EffectCreatureId = 10904,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin01.BP_EffectCreature_Gesture_Violin01",
    MeshResourceId = 309,
    SocketName = "hook_arm_l"
  },
  [10905] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01C_Boy_Montage.Show_Violin01C_Boy_Montage",
    EffectCreatureId = 10905,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin01.BP_EffectCreature_Gesture_Violin01",
    MeshResourceId = 309,
    SocketName = "hook_arm_l"
  },
  [10906] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01C_Girl_Montage.Show_Violin01C_Girl_Montage",
    EffectCreatureId = 10906,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin02.BP_EffectCreature_Gesture_Violin02",
    MeshResourceId = 309,
    SocketName = "hook_arm_l"
  },
  [10907] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01C_Loli_Montage.Show_Violin01C_Loli_Montage",
    EffectCreatureId = 10907,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin02.BP_EffectCreature_Gesture_Violin02",
    MeshResourceId = 309,
    SocketName = "hook_arm_l"
  },
  [10908] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01C_Man_Montage.Show_Violin01C_Man_Montage",
    EffectCreatureId = 10908,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin02.BP_EffectCreature_Gesture_Violin02",
    MeshResourceId = 309,
    SocketName = "hook_arm_l"
  },
  [10909] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01C_Woman_Montage.Show_Violin01C_Woman_Montage",
    EffectCreatureId = 10909,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin02.BP_EffectCreature_Gesture_Violin02",
    MeshResourceId = 309,
    SocketName = "hook_arm_l"
  },
  [10910] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01C_Boy_Montage.Show_Violin01C_Boy_Montage",
    EffectCreatureId = 10910,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin02.BP_EffectCreature_Gesture_Violin02",
    MeshResourceId = 309,
    SocketName = "hook_arm_l"
  },
  [10911] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01C_Girl_Montage.Show_Violin01C_Girl_Montage",
    EffectCreatureId = 10911,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin03.BP_EffectCreature_Gesture_Violin03",
    MeshResourceId = 309,
    SocketName = "hook_arm_l"
  },
  [10912] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01C_Loli_Montage.Show_Violin01C_Loli_Montage",
    EffectCreatureId = 10912,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin03.BP_EffectCreature_Gesture_Violin03",
    MeshResourceId = 309,
    SocketName = "hook_arm_l"
  },
  [10913] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01C_Man_Montage.Show_Violin01C_Man_Montage",
    EffectCreatureId = 10913,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin03.BP_EffectCreature_Gesture_Violin03",
    MeshResourceId = 309,
    SocketName = "hook_arm_l"
  },
  [10914] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01C_Woman_Montage.Show_Violin01C_Woman_Montage",
    EffectCreatureId = 10914,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin03.BP_EffectCreature_Gesture_Violin03",
    MeshResourceId = 309,
    SocketName = "hook_arm_l"
  },
  [10915] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Show_Violin01C_Boy_Montage.Show_Violin01C_Boy_Montage",
    EffectCreatureId = 10915,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin03.BP_EffectCreature_Gesture_Violin03",
    MeshResourceId = 309,
    SocketName = "hook_arm_l"
  },
  [11001] = {
    EffectCreatureId = 11001,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin04.BP_EffectCreature_Gesture_Violin04",
    SocketName = "hand_l"
  },
  [11002] = {
    EffectCreatureId = 11002,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin04.BP_EffectCreature_Gesture_Violin04",
    SocketName = "hand_l"
  },
  [11003] = {
    EffectCreatureId = 11003,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin04.BP_EffectCreature_Gesture_Violin04",
    SocketName = "hand_l"
  },
  [11004] = {
    EffectCreatureId = 11004,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin04.BP_EffectCreature_Gesture_Violin04",
    SocketName = "hand_l"
  },
  [11005] = {
    EffectCreatureId = 11005,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin04.BP_EffectCreature_Gesture_Violin04",
    SocketName = "hand_l"
  },
  [11101] = {
    EffectCreatureId = 11101,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin05.BP_EffectCreature_Gesture_Violin05",
    SocketName = "root"
  },
  [11102] = {
    EffectCreatureId = 11102,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin05.BP_EffectCreature_Gesture_Violin05",
    SocketName = "root"
  },
  [11103] = {
    EffectCreatureId = 11103,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin05.BP_EffectCreature_Gesture_Violin05",
    SocketName = "root"
  },
  [11104] = {
    EffectCreatureId = 11104,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin05.BP_EffectCreature_Gesture_Violin05",
    SocketName = "root"
  },
  [11105] = {
    EffectCreatureId = 11105,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Violin05.BP_EffectCreature_Gesture_Violin05",
    SocketName = "root"
  },
  [11201] = {
    EffectCreatureId = 11201,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Car01.BP_EffectCreature_Gesture_Car01",
    SocketName = "root"
  },
  [11202] = {
    EffectCreatureId = 11202,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Car02.BP_EffectCreature_Gesture_Car02",
    SocketName = "root"
  },
  [11203] = {
    EffectCreatureId = 11203,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Gesture/BP_EffectCreature_Gesture_Car03.BP_EffectCreature_Gesture_Car03",
    SocketName = "root"
  },
  [14001] = {
    EffectCreatureId = 14001,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/DeadFx/BP_EffectCreature_Dead_Default.BP_EffectCreature_Dead_Default",
    EffectCreatureTag = T.RT_1
  },
  [14002] = {
    EffectCreatureId = 14002,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/DeadFx/BP_EffectCreature_Dead_01.BP_EffectCreature_Dead_01",
    EffectCreatureTag = T.RT_1
  },
  [14003] = {
    EffectCreatureId = 14003,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/DeadFx/BP_EffectCreature_Dead_02.BP_EffectCreature_Dead_02",
    EffectCreatureTag = T.RT_1
  },
  [14004] = {
    EffectCreatureId = 14004,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/DeadFx/BP_EffectCreature_Dead_03.BP_EffectCreature_Dead_03",
    EffectCreatureTag = T.RT_1
  },
  [18011] = {
    EffectCreatureId = 18011,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Event/BP_EffectCreature_FeinaEvent.BP_EffectCreature_FeinaEvent"
  },
  [20101] = {
    EffectCreatureId = 20101,
    MeshResourceId = 700803,
    SocketName = "lowerarmpendant_left01_a"
  },
  [30101] = {
    EffectCreatureId = 30101,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Others/BP_EffectCreature_Fish.BP_EffectCreature_Fish",
    EffectCreatureTag = T.RT_2,
    MeshResourceId = 299,
    ReplaceByFish = true,
    SocketName = "hook_arm_r"
  },
  [30102] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Fish_Girl_Fishing_Start_Montage.Fish_Girl_Fishing_Start_Montage",
    EffectCreatureId = 30102,
    EffectCreatureTag = T.RT_2,
    MeshResourceId = 299,
    SocketName = "hook_arm_r"
  },
  [30112] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Fish_Loli_Fishing_Start_Montage.Fish_Loli_Fishing_Start_Montage",
    EffectCreatureId = 30112,
    EffectCreatureTag = T.RT_2,
    MeshResourceId = 299,
    SocketName = "hook_arm_r"
  },
  [30122] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Fish_Woman_Fishing_Start_Montage.Fish_Woman_Fishing_Start_Montage",
    EffectCreatureId = 30122,
    EffectCreatureTag = T.RT_2,
    MeshResourceId = 299,
    SocketName = "hook_arm_r"
  },
  [30132] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Part/Show/Animation/Montage/Fish_Boy_Fishing_Start_Montage.Fish_Boy_Fishing_Start_Montage",
    EffectCreatureId = 30132,
    EffectCreatureTag = T.RT_2,
    MeshResourceId = 299,
    SocketName = "hook_arm_r"
  },
  [30140] = {
    EffectCreatureId = 30140,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Others/BP_EffectCreature_Hook_Effect.BP_EffectCreature_Hook_Effect",
    SocketName = "hook_arm_l"
  },
  [42001] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet006_Zisha/Animation/Montage/Pet_Zisha_Skill01_Montage.Pet_Zisha_Skill01_Montage",
    EffectCreatureId = 42001,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_Prop_42001.BP_EffectCreature_Prop_42001",
    EffectCreatureTag = T.RT_3,
    MeshResourceId = 401,
    SocketName = "Root"
  },
  [42002] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/SPet001_Qianji/Animation/Montage/SPet_Qianji_Idle_Montage.SPet_Qianji_Idle_Montage",
    EffectCreatureId = 42002,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_Prop_42002.BP_EffectCreature_Prop_42002",
    EffectCreatureTag = T.RT_3,
    MeshResourceId = 42002,
    SocketName = "Root"
  },
  [80001] = {
    EffectCreatureId = 80001,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/DeadFx/BP_EffectCreature_BodyFx.BP_EffectCreature_BodyFx",
    EffectCreatureTag = {"FX_Body"},
    SocketName = "Root_Effect"
  },
  [110101] = {
    EffectCreatureId = 110101,
    MeshResourceId = 110102,
    SocketName = "hook_upperarm_l"
  },
  [110102] = {
    EffectCreatureId = 110102,
    MeshResourceId = 110101,
    SocketName = "hook_arm_r"
  },
  [110103] = {
    EffectCreatureId = 110103,
    MeshResourceId = 110102,
    SocketName = "hook_upperarm_l"
  },
  [110104] = {
    EffectCreatureId = 110104,
    MeshResourceId = 110101,
    SocketName = "hook_arm_l"
  },
  [110111] = {
    EffectCreatureId = 110111,
    EnterPool = true,
    MeshResourceId = 110102,
    SocketName = "hook_upperarm_l"
  },
  [110112] = {
    EffectCreatureId = 110112,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Heitao_Skill02.BP_EffectCreature_Heitao_Skill02",
    EnterPool = true,
    SocketName = "hook_arm_r"
  },
  [110201] = {
    EffectCreatureId = 110201,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Fuluo_Doll.BP_EffectCreature_Fuluo_Doll",
    MeshResourceId = 110201,
    SocketName = "Root"
  },
  [110301] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char025_Tuosi/Animation/Sequence/Combat/Skill/Tuosi_Skill02.Tuosi_Skill02",
    EffectCreatureId = 110301,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Tuosi_Skill2.BP_EffectCreature_Tuosi_Skill2",
    MeshResourceId = 1103
  },
  [110302] = {EffectCreatureId = 110302, MeshResourceId = 110311},
  [110312] = {
    EffectCreatureId = 110312,
    MeshResourceId = 110312,
    SocketName = "claviclependant_left02_a"
  },
  [120211] = {
    EffectCreatureId = 120211,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Falu_Skill01.BP_EffectCreature_Falu_Skill01",
    SocketName = "root"
  },
  [150201] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char031_Nifu/Animation/Part/Montage/Nifu_Armory_Part01_Montage.Nifu_Armory_Part01_Montage",
    EffectCreatureId = 150201,
    MeshResourceId = 150201,
    SocketName = "hook_arm_r"
  },
  [150202] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char031_Nifu/Animation/Part/Sequence/Nifu_Emo_IdleShow_01_Part01.Nifu_Emo_IdleShow_01_Part01",
    EffectCreatureId = 150202,
    MeshResourceId = 150201,
    SocketName = "hook_arm_r"
  },
  [150211] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char031_Nifu/Animation/Part/Sequence/Nifu_Skill01_01_Part01.Nifu_Skill01_01_Part01",
    EffectCreatureId = 150211,
    MeshResourceId = 150201,
    SocketName = "hook_arm_r"
  },
  [150212] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char031_Nifu/Animation/Part/Sequence/Nifu_Skill01_02_Part01.Nifu_Skill01_02_Part01",
    EffectCreatureId = 150212,
    MeshResourceId = 150201,
    SocketName = "hook_arm_r"
  },
  [150221] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char031_Nifu/Animation/Part/Sequence/Nifu_Skill02_Part01.Nifu_Skill02_Part01",
    EffectCreatureId = 150221,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Common/BP_EffectCreature_CustomDepth1.BP_EffectCreature_CustomDepth1",
    MeshResourceId = 150201,
    SocketName = "hook_arm_l"
  },
  [150301] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Part/Kezhou_Skill02_Off.Kezhou_Skill02_Off",
    EffectCreatureId = 150301,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Kezhou_Skill02_Off.BP_EffectCreature_Kezhou_Skill02_Off",
    MeshResourceId = 150316,
    SocketName = "hook_arm_l"
  },
  [150311] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Part/Kezhou_Skill01.Kezhou_Skill01",
    EffectCreatureId = 150311,
    MeshResourceId = 150316,
    SocketName = "hook_arm_r"
  },
  [150321] = {
    EffectCreatureId = 150321,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Kezhou_Skill02.BP_EffectCreature_Kezhou_Skill02",
    SocketName = "hook_arm_r"
  },
  [150322] = {
    EffectCreatureId = 150322,
    MeshResourceId = 1029901,
    SocketName = "hook_arm_r"
  },
  [150323] = {
    EffectCreatureId = 150323,
    MeshResourceId = 1049901,
    SocketName = "hook_arm_l"
  },
  [150324] = {
    EffectCreatureId = 150324,
    MeshResourceId = 1049902,
    SocketName = "hook_arm_r"
  },
  [150331] = {
    EffectCreatureId = 150331,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/EmoIdle/BP_EffectCreature_Kezhou_Emoidle.BP_EffectCreature_Kezhou_Emoidle",
    SocketName = "hook_arm_l"
  },
  [150341] = {
    EffectCreatureId = 150341,
    MeshResourceId = 150313,
    SocketName = "hook_arm_l"
  },
  [150342] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Part/Kezhou_Armory_Start_Part01.Kezhou_Armory_Start_Part01",
    EffectCreatureId = 150342,
    MeshResourceId = 150312,
    SocketName = "hook_arm_r"
  },
  [150343] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Part/Kezhou_Armory_Start_Part02.Kezhou_Armory_Start_Part02",
    EffectCreatureId = 150343,
    MeshResourceId = 150311,
    SocketName = "hook_arm_r"
  },
  [150344] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Part/Kezhou_Armory_Start_Part03.Kezhou_Armory_Start_Part03",
    EffectCreatureId = 150344,
    MeshResourceId = 150311,
    SocketName = "hook_arm_r"
  },
  [150345] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Part/Kezhou_Armory_Start_Part04.Kezhou_Armory_Start_Part04",
    EffectCreatureId = 150345,
    MeshResourceId = 150311,
    SocketName = "hook_arm_r"
  },
  [150346] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Part/Kezhou_Armory_Start_Part05.Kezhou_Armory_Start_Part05",
    EffectCreatureId = 150346,
    MeshResourceId = 150311,
    SocketName = "hook_arm_r"
  },
  [150347] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Part/Kezhou_Armory_Start_Part06.Kezhou_Armory_Start_Part06",
    EffectCreatureId = 150347,
    MeshResourceId = 150311,
    SocketName = "hook_arm_r"
  },
  [150348] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Part/Kezhou_Armory_Start_Part07.Kezhou_Armory_Start_Part07",
    EffectCreatureId = 150348,
    MeshResourceId = 150311,
    SocketName = "hook_arm_r"
  },
  [150349] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Part/Kezhou_Armory_Start_Part08.Kezhou_Armory_Start_Part08",
    EffectCreatureId = 150349,
    MeshResourceId = 150314,
    SocketName = "hook_arm_r"
  },
  [150350] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char030_Kezhou/Animation/Part/Kezhou_Armory_Start_Part09.Kezhou_Armory_Start_Part09",
    EffectCreatureId = 150350,
    MeshResourceId = 150315,
    SocketName = "hook_arm_r"
  },
  [150401] = {
    EffectCreatureId = 150401,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Suyi_UAV01.BP_EffectCreature_Suyi_UAV01",
    MeshResourceId = 150401,
    SocketName = "Root"
  },
  [150411] = {
    EffectCreatureId = 150411,
    EffectCreaturePath = "/Game/Asset/Effect/Blueprint/Child/EF_BP_Decal_Bullet03.EF_BP_Decal_Bullet03",
    EnterPool = true
  },
  [150412] = {
    EffectCreatureId = 150412,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Suyi_Funnel.BP_EffectCreature_Suyi_Funnel",
    MeshResourceId = 150402,
    SocketName = "Root"
  },
  [160101] = {
    EffectCreatureId = 160101,
    MeshResourceId = 1010301,
    SocketName = "root_hook_arm_r"
  },
  [160111] = {
    EffectCreatureId = 160111,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Armory/BP_EffectCreature_Zhujue_Light.BP_EffectCreature_Zhujue_Light",
    SocketName = "root_hook_arm_r"
  },
  [180101] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char019_Feina/Animation/Part/Feina_Part01_Skill01_Start_Montage.Feina_Part01_Skill01_Start_Montage",
    EffectCreatureId = 180101,
    EnterPool = true,
    MeshResourceId = 180101
  },
  [180102] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char019_Feina/Animation/Part/Feina_Part01_Skill02.Feina_Part01_Skill02",
    EffectCreatureId = 180102,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Common/BP_EffectCreature_CustomDepth15.BP_EffectCreature_CustomDepth15",
    EnterPool = true,
    MeshResourceId = 180101
  },
  [180103] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char019_Feina/Animation/Part/Feina_Part01_Armory_Show.Feina_Part01_Armory_Show",
    EffectCreatureId = 180103,
    MeshResourceId = 180101
  },
  [180104] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char019_Feina/Animation/Summon/Montage/Feina_Part_Interactive_Sit02_Montage.Feina_Part_Interactive_Sit02_Montage",
    EffectCreatureId = 180104,
    MeshResourceId = 180101
  },
  [180111] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char019_Feina/Animation/Part/Feina_Part01_Skill01_End_Montage.Feina_Part01_Skill01_End_Montage",
    EffectCreatureId = 180111,
    EnterPool = true,
    MeshResourceId = 180101
  },
  [180112] = {
    EffectCreatureId = 180112,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Feina_Skill1.BP_EffectCreature_Feina_Skill1"
  },
  [180121] = {
    EffectCreatureId = 180121,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Feina_Skill2.BP_EffectCreature_Feina_Skill2",
    SocketName = "Root"
  },
  [180122] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char019_Feina/Animation/Summon/Montage/Feina_Sum01_Montage.Feina_Sum01_Montage",
    EffectCreatureId = 180122,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Feina_Summon.BP_EffectCreature_Feina_Summon",
    MeshResourceId = 180121,
    SocketName = "Root"
  },
  [180123] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char019_Feina/Animation/Summon/Montage/Feina_Sum04_Montage.Feina_Sum04_Montage",
    EffectCreatureId = 180123,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Feina_Summon.BP_EffectCreature_Feina_Summon",
    MeshResourceId = 180122,
    SocketName = "Root"
  },
  [180124] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char019_Feina/Animation/Summon/Montage/Feina_Sum03_Montage.Feina_Sum03_Montage",
    EffectCreatureId = 180124,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Feina_Summon.BP_EffectCreature_Feina_Summon",
    MeshResourceId = 180123,
    SocketName = "Root"
  },
  [180125] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char019_Feina/Animation/Summon/Montage/Feina_Sum02_Montage.Feina_Sum02_Montage",
    EffectCreatureId = 180125,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Feina_Summon.BP_EffectCreature_Feina_Summon",
    MeshResourceId = 180124,
    SocketName = "Root"
  },
  [180131] = {
    EffectCreatureId = 180131,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Armory/BP_EffectCreature_Feina_Armory.BP_EffectCreature_Feina_Armory"
  },
  [210101] = {
    EffectCreatureId = 210101,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/EmoIdle/BP_EffectCreature_ShuimuIdle.BP_EffectCreature_ShuimuIdle"
  },
  [210102] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char005_Shuimu/Animation/Summon/Sequence/Shuimu_Summon_LevelFinish.Shuimu_Summon_LevelFinish",
    EffectCreatureId = 210102,
    MeshResourceId = 210101,
    SocketName = "Root"
  },
  [210103] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char005_Shuimu/Animation/Summon/Montage/Shuimu_Part_Interactive_Sit02_Montage.Shuimu_Part_Interactive_Sit02_Montage",
    EffectCreatureId = 210103,
    MeshResourceId = 210102,
    ReplaceBySkin = {
      [210199] = 210113
    }
  },
  [210113] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char005_Shuimu/Animation/Summon/Montage/Shuimu_Part_Interactive_Sit02_Montage.Shuimu_Part_Interactive_Sit02_Montage",
    EffectCreatureId = 210113,
    MeshResourceId = 210102
  },
  [240102] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char015_Baiheng/Animation/Summon/Montage/Interactive/Baiheng_LevelFinish_Summon_Montage.Baiheng_LevelFinish_Summon_Montage",
    EffectCreatureId = 240102,
    MeshResourceId = 240101,
    SocketName = "Root"
  },
  [240103] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char015_Baiheng/Animation/Summon/Montage/Interactive/Baiheng_LevelFinish_Part01_Montage.Baiheng_LevelFinish_Part01_Montage",
    EffectCreatureId = 240103,
    MeshResourceId = 240102,
    SocketName = "Root"
  },
  [240104] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char015_Baiheng/Animation/Summon/Sequnence/Baiheng_Emo_IdleShow_01_Part01.Baiheng_Emo_IdleShow_01_Part01",
    EffectCreatureId = 240104,
    MeshResourceId = 240102,
    SocketName = "Root_hook_arm_l"
  },
  [240105] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char015_Baiheng/Animation/Summon/Sequnence/Baiheng_Emo_IdleShow_01_Summon.Baiheng_Emo_IdleShow_01_Summon",
    EffectCreatureId = 240105,
    MeshResourceId = 240101,
    SocketName = "Root"
  },
  [240107] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char015_Baiheng/Animation/Summon/Montage/Interactive/Baiheng_Armory_Show_Part01_Montage.Baiheng_Armory_Show_Part01_Montage",
    EffectCreatureId = 240107,
    MeshResourceId = 240102,
    SocketName = "Root_hook_arm_r"
  },
  [240108] = {
    EffectCreatureId = 240108,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Baiheng_Skill02_Buff.BP_EffectCreature_Baiheng_Skill02_Buff",
    SocketName = "Root"
  },
  [240109] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char015_Baiheng/Animation/Summon/Montage/Interactive/Baiheng_Part_Interactive_Sit02_Montage.Baiheng_Part_Interactive_Sit02_Montage",
    EffectCreatureId = 240109,
    MeshResourceId = 240102,
    SocketName = "Root"
  },
  [240111] = {
    EffectCreatureId = 240111,
    EnterPool = true,
    MeshResourceId = 240102,
    SocketName = "hook_arm_r"
  },
  [240115] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char015_Baiheng/Animation/Summon/Montage/Combat/Skill/Baiheng_Summon_Skill02_EffectCreature01_Montage.Baiheng_Summon_Skill02_EffectCreature01_Montage",
    EffectCreatureId = 240115,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Common/BP_EffectCreature_CustomDepth1.BP_EffectCreature_CustomDepth1",
    EnterPool = true,
    MeshResourceId = 240101,
    SocketName = "Root"
  },
  [240116] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char015_Baiheng/Animation/Summon/Sequnence/Baiheng_Skill02_Part01.Baiheng_Skill02_Part01",
    EffectCreatureId = 240116,
    EnterPool = true,
    MeshResourceId = 240102,
    SocketName = "Root"
  },
  [240121] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Pet/Pet017_Qiuqiu/Animation/Sequence/Locomotion/Pet_Qiuqiu_Idle.Pet_Qiuqiu_Idle",
    EffectCreatureId = 240121,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Pet/BP_EffectCreature_BattlePet.BP_EffectCreature_BattlePet",
    MeshResourceId = 416,
    SocketName = "Root"
  },
  [240131] = {
    EffectCreatureId = 240131,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Baiheng_Skill02_01.BP_EffectCreature_Baiheng_Skill02_01",
    SocketName = "Root"
  },
  [240132] = {
    EffectCreatureId = 240132,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Baiheng_Skill02_02.BP_EffectCreature_Baiheng_Skill02_02",
    SocketName = "Root"
  },
  [240133] = {
    EffectCreatureId = 240133,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Baiheng_Skill02_03.BP_EffectCreature_Baiheng_Skill02_03",
    SocketName = "Root"
  },
  [240134] = {
    EffectCreatureId = 240134,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Baiheng_Skill02_04.BP_EffectCreature_Baiheng_Skill02_04",
    SocketName = "Root"
  },
  [310101] = {EffectCreatureId = 310101, MeshResourceId = 310103},
  [310102] = {EffectCreatureId = 310102, MeshResourceId = 310101},
  [310103] = {EffectCreatureId = 310103, MeshResourceId = 310102},
  [310104] = {EffectCreatureId = 310104, MeshResourceId = 310101},
  [310202] = {EffectCreatureId = 310202, MeshResourceId = 310204},
  [310203] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char023_Xier/Animation/Part/Montage/Xier_Armory_Show_Part07_Montage.Xier_Armory_Show_Part07_Montage",
    EffectCreatureId = 310203,
    MeshResourceId = 310205,
    SocketName = "Root"
  },
  [310204] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char023_Xier/Animation/Part/Montage/Xier_Armory_Show_Part02_Montage.Xier_Armory_Show_Part02_Montage",
    EffectCreatureId = 310204,
    MeshResourceId = 310206,
    SocketName = "Root"
  },
  [310205] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char023_Xier/Animation/Part/Montage/Xier_Armory_Show_Part04_Montage.Xier_Armory_Show_Part04_Montage",
    EffectCreatureId = 310205,
    MeshResourceId = 310207,
    SocketName = "Root"
  },
  [310206] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char023_Xier/Animation/Part/Montage/Xier_Armory_Show_Part03_Montage.Xier_Armory_Show_Part03_Montage",
    EffectCreatureId = 310206,
    MeshResourceId = 310208,
    SocketName = "Root"
  },
  [310207] = {EffectCreatureId = 310207, MeshResourceId = 310204},
  [310301] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char017_Yeer/Animation/Summon/Montage/Combat/Skill/Yeer_EffectCreatrue_Skill01_Start.Yeer_EffectCreatrue_Skill01_Start",
    EffectCreatureId = 310301,
    EnterPool = true,
    MeshResourceId = 310304,
    SocketName = "pelvis"
  },
  [310302] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char017_Yeer/Animation/Summon/Montage/Interactive/Yeer_Armory_Show_Accessory01_Montage.Yeer_Armory_Show_Accessory01_Montage",
    EffectCreatureId = 310302,
    MeshResourceId = 310303,
    SocketName = "Root"
  },
  [310303] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char017_Yeer/Animation/Summon/Montage/Combat/Skill/Yeer_EffectCreatrue_Skill02.Yeer_EffectCreatrue_Skill02",
    EffectCreatureId = 310303,
    EnterPool = true,
    MeshResourceId = 310303,
    SocketName = "hook_arm_l"
  },
  [310311] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char017_Yeer/Animation/Summon/Montage/Combat/Skill/Yeer_EffectCreatrue_Skill01_Loop.Yeer_EffectCreatrue_Skill01_Loop",
    EffectCreatureId = 310311,
    EnterPool = true,
    MeshResourceId = 310304,
    SocketName = "pelvis"
  },
  [310312] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char017_Yeer/Animation/Summon/Montage/Combat/Skill/Yeer_EffectCreatrue_Skill01_Attack.Yeer_EffectCreatrue_Skill01_Attack",
    EffectCreatureId = 310312,
    EnterPool = true,
    MeshResourceId = 310304,
    SocketName = "pelvis"
  },
  [320201] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char014_Kami/Animation/Part/Montage/Kami_Skill02_Part01_01.Kami_Skill02_Part01_01",
    EffectCreatureId = 320201,
    EnterPool = true,
    MeshResourceId = 320201,
    SocketName = "Root"
  },
  [320202] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char014_Kami/Animation/Part/Montage/Kami_Skill02_Part02.Kami_Skill02_Part02",
    EffectCreatureId = 320202,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Kami_Skill02_02.BP_EffectCreature_Kami_Skill02_02",
    EnterPool = true,
    MeshResourceId = 320202,
    SocketName = "Root"
  },
  [320203] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char014_Kami/Animation/Part/Montage/Kami_Skill02_Part01_02.Kami_Skill02_Part01_02",
    EffectCreatureId = 320203,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Kami_Skill02.BP_EffectCreature_Kami_Skill02",
    EnterPool = true,
    MeshResourceId = 320201,
    SocketName = "Root"
  },
  [320204] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char014_Kami/Animation/Part/Montage/Kami_Skill02_Part03.Kami_Skill02_Part03",
    EffectCreatureId = 320204,
    EnterPool = true,
    MeshResourceId = 320203,
    SocketName = "root_hook_arm_r"
  },
  [320205] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char014_Kami/Animation/Part/Montage/Kami_Emo_IdleShow_Part05.Kami_Emo_IdleShow_Part05",
    EffectCreatureId = 320205,
    EnterPool = true,
    MeshResourceId = 320204,
    SocketName = "Root"
  },
  [320206] = {
    EffectCreatureId = 320206,
    EnterPool = true,
    MeshResourceId = 320205,
    SocketName = "hook_arm_r"
  },
  [330110] = {
    EffectCreatureId = 330110,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Maer_Skill01_Target.BP_EffectCreature_Maer_Skill01_Target",
    SocketName = "Root"
  },
  [330111] = {
    EffectCreatureId = 330111,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Maer_Skill03.BP_EffectCreature_Maer_Skill03",
    SocketName = "skirt_right01_c"
  },
  [330112] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char024_Maer/Animation/Part/Sequence/Maer_Part01_Skill01_Loop.Maer_Part01_Skill01_Loop",
    EffectCreatureId = 330112,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Maer_Skill01.BP_EffectCreature_Maer_Skill01",
    EnterPool = true,
    MeshResourceId = 330101,
    SocketName = "hook_arm_r"
  },
  [330113] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char024_Maer/Animation/Part/Montage/Maer_Part01_Skill02_Start_Montage.Maer_Part01_Skill02_Start_Montage",
    EffectCreatureId = 330113,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Maer_Skill02.BP_EffectCreature_Maer_Skill02",
    EnterPool = true,
    MeshResourceId = 330101,
    SocketName = "hook_arm_r"
  },
  [330114] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char024_Maer/Animation/Part/Montage/Maer_Part01_Skill02_End_Montage.Maer_Part01_Skill02_End_Montage",
    EffectCreatureId = 330114,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Maer_Skill02_End.BP_EffectCreature_Maer_Skill02_End",
    EnterPool = true,
    MeshResourceId = 330101,
    SocketName = "hook_arm_r"
  },
  [330121] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char024_Maer/Animation/Part/Montage/Maer_Part01_Armory_Montage.Maer_Part01_Armory_Montage",
    EffectCreatureId = 330121,
    EnterPool = true,
    MeshResourceId = 330101,
    SocketName = "Root"
  },
  [410101] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char020_Lise/Animation/Part/Montage/Lise_Skill01_Part.Lise_Skill01_Part",
    EffectCreatureId = 410101,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Lise_Skill01.BP_EffectCreature_Lise_Skill01",
    EnterPool = true,
    SocketName = "Root"
  },
  [410102] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char020_Lise/Animation/Part/Montage/Lise_Armory_Part_Montage.Lise_Armory_Part_Montage",
    EffectCreatureId = 410102,
    MeshResourceId = 410101,
    SocketName = "Root"
  },
  [410201] = {
    EffectCreatureId = 410201,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Zhiliu_Skill02_DD.BP_EffectCreature_Zhiliu_Skill02_DD"
  },
  [410202] = {
    EffectCreatureId = 410202,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Zhiliu_Skill02_DD_Out.BP_EffectCreature_Zhiliu_Skill02_DD_Out"
  },
  [410211] = {
    EffectCreatureId = 410211,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/EmoIdle/BP_EffectCreatur_Zhiliu_Idle_01.BP_EffectCreatur_Zhiliu_Idle_01"
  },
  [410212] = {
    EffectCreatureId = 410212,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/EmoIdle/BP_EffectCreatur_Zhiliu_Idle_02.BP_EffectCreatur_Zhiliu_Idle_02"
  },
  [410221] = {
    EffectCreatureId = 410221,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Armory/BP_EffectCreature_Zhiliu_Skill02_Armory.BP_EffectCreature_Zhiliu_Skill02_Armory"
  },
  [410222] = {
    EffectCreatureId = 410222,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Armory/BP_EffectCreature_Zhiliu_Skill02_Armory_Loop.BP_EffectCreature_Zhiliu_Skill02_Armory_Loop"
  },
  [420103] = {
    EffectCreatureId = 420103,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Armory/BP_EffectCreature_Yuming_Armory.BP_EffectCreature_Yuming_Armory"
  },
  [420104] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char008_Yuming/Animation/Summon/Sequnence/Yuming_Part_Interactive_Sit02.Yuming_Part_Interactive_Sit02",
    EffectCreatureId = 420104,
    MeshResourceId = 420102
  },
  [420111] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char008_Yuming/Animation/Summon/Sequnence/Yuming_Summon_Skill01_Start.Yuming_Summon_Skill01_Start",
    EffectCreatureId = 420111,
    EnterPool = true,
    MeshResourceId = 420101
  },
  [420112] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char008_Yuming/Animation/Summon/Montage/Combat/Skill/Yuming_Summon_Attack01_Montage.Yuming_Summon_Attack01_Montage",
    EffectCreatureId = 420112,
    EnterPool = true,
    MeshResourceId = 420101
  },
  [420113] = {
    EffectCreatureId = 420113,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Yuming_Polearm.BP_EffectCreature_Yuming_Polearm",
    EnterPool = true
  },
  [420121] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char008_Yuming/Animation/Summon/Montage/Combat/Skill/Yuming_Summon_Skill02_Montage.Yuming_Summon_Skill02_Montage",
    EffectCreatureId = 420121,
    EnterPool = true,
    MeshResourceId = 420101,
    SocketName = "Root"
  },
  [420201] = {
    EffectCreatureId = 420201,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Landi_Skill01_Start.BP_EffectCreature_Landi_Skill01_Start",
    EnterPool = true
  },
  [420202] = {
    EffectCreatureId = 420202,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Landi_Skill01_End.BP_EffectCreature_Landi_Skill01_End",
    EnterPool = true
  },
  [420203] = {
    EffectCreatureId = 420203,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Landi_Skill02.BP_EffectCreature_Landi_Skill02",
    EnterPool = true
  },
  [420204] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char012_Landi/Animation/Part/Montage/Interactive/Landi_LevelFinish_Accessory01_Montage.Landi_LevelFinish_Accessory01_Montage",
    EffectCreatureId = 420204,
    MeshResourceId = 420201,
    SocketName = "Root"
  },
  [420205] = {
    EffectCreatureId = 420205,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Landi_Skill01_Chair.BP_EffectCreature_Landi_Skill01_Chair"
  },
  [420207] = {EffectCreatureId = 420207, MeshResourceId = 420202},
  [420208] = {EffectCreatureId = 420208, MeshResourceId = 420203},
  [430101] = {
    EffectCreatureId = 430101,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Xibi_Skill01_Start.BP_EffectCreature_Xibi_Skill01_Start",
    EnterPool = true,
    SocketName = "hook_arm_r"
  },
  [430102] = {
    EffectCreatureId = 430102,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Xibi_Skill01_Loop.BP_EffectCreature_Xibi_Skill01_Loop",
    EnterPool = true,
    SocketName = "hook_arm_r"
  },
  [430103] = {
    EffectCreatureId = 430103,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Xibi_Skill01_End.BP_EffectCreature_Xibi_Skill01_End",
    EnterPool = true,
    SocketName = "hook_arm_r"
  },
  [510101] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char021_Songlu/Animation/Summon/Montage/Interactive/Songlu_Summon_LevelFinish_Montage.Songlu_Summon_LevelFinish_Montage",
    EffectCreatureId = 510101,
    MeshResourceId = 510101,
    ReplaceBySkin = {
      [510199] = 510192
    },
    SocketName = "Root"
  },
  [510102] = {
    EffectCreatureId = 510102,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Songlu_Lanzi.BP_EffectCreature_Songlu_Lanzi",
    EnterPool = true
  },
  [510103] = {
    EffectCreatureId = 510103,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Songlu_Mianbao.BP_EffectCreature_Songlu_Mianbao",
    EnterPool = true
  },
  [510104] = {
    EffectCreatureId = 510104,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Songlu_Shaozi.BP_EffectCreature_Songlu_Shaozi",
    EnterPool = true
  },
  [510105] = {
    EffectCreatureId = 510105,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/EmoIdle/BP_EffectCreature_SongluIdle.BP_EffectCreature_SongluIdle"
  },
  [510111] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char021_Songlu/Animation/Summon/Montage/Combat/Skill/Songlu_Summon_Skill01_Montage.Songlu_Summon_Skill01_Montage",
    EffectCreatureId = 510111,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Songlu_Skill01.BP_EffectCreature_Songlu_Skill01",
    MeshResourceId = 510101,
    ReplaceBySkin = {
      [510199] = 510191
    },
    SocketName = "Root"
  },
  [510191] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char099_Songlu01/Animation/Summon/Montage/Combat/Skill/Songlu_Summon_Skill01_Montage.Songlu_Summon_Skill01_Montage",
    EffectCreatureId = 510191,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Songlu_Skill01.BP_EffectCreature_Songlu_Skill01",
    MeshResourceId = 510198,
    SocketName = "Root"
  },
  [510192] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char099_Songlu01/Animation/Summon/Montage/Interactive/Songlu_Summon_LevelFinish_Montage.Songlu_Summon_LevelFinish_Montage",
    EffectCreatureId = 510192,
    MeshResourceId = 510198,
    SocketName = "Root"
  },
  [510201] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char018_Aote/Animation/Part/Montage/Aote_Part01_Armory_Montage.Aote_Part01_Armory_Montage",
    EffectCreatureId = 510201,
    MeshResourceId = 510201,
    SocketName = "Root"
  },
  [510221] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char018_Aote/Animation/Part/Sequence/Aote_Skill02_Part02.Aote_Skill02_Part02",
    EffectCreatureId = 510221,
    MeshResourceId = 510202,
    SocketName = "hook_arm_r"
  },
  [510222] = {
    EffectCreatureId = 510222,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Aote_Skill02.BP_EffectCreature_Aote_Skill02",
    SocketName = "Root"
  },
  [530101] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char010_Saiqi/Animation/Part/Montage/Saiqi_Part_LevelFinish_Montage.Saiqi_Part_LevelFinish_Montage",
    EffectCreatureId = 530101,
    MeshResourceId = 530102,
    ReplaceBySkin = {
      [530199] = 530111
    },
    SocketName = "Root"
  },
  [530102] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char010_Saiqi/Animation/Part/Montage/Saiqi_Part_Armory_Montage.Saiqi_Part_Armory_Montage",
    EffectCreatureId = 530102,
    MeshResourceId = 530102,
    ReplaceBySkin = {
      [530199] = 530112
    },
    SocketName = "Root"
  },
  [530103] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char010_Saiqi/Animation/Part/Sequnence/Saiqi_Part_Emo_IdleShow_01.Saiqi_Part_Emo_IdleShow_01",
    EffectCreatureId = 530103,
    MeshResourceId = 530102,
    ReplaceBySkin = {
      [530199] = 530113
    }
  },
  [530104] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char010_Saiqi/Animation/Part/Montage/Saiqi_Part_Ultra_Show_Montage.Saiqi_Part_Ultra_Show_Montage",
    EffectCreatureId = 530104,
    MeshResourceId = 530102,
    ReplaceBySkin = {
      [530199] = 530114
    }
  },
  [530105] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char010_Saiqi/Animation/Part/Montage/Saiqi_Part_Interactive_Sit02_Montage.Saiqi_Part_Interactive_Sit02_Montage",
    EffectCreatureId = 530105,
    MeshResourceId = 530102,
    ReplaceBySkin = {
      [530199] = 530115
    }
  },
  [530111] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char010_Saiqi/Animation/Part/Montage/Saiqi_Part_LevelFinish_Montage.Saiqi_Part_LevelFinish_Montage",
    EffectCreatureId = 530111,
    MeshResourceId = 530198,
    SocketName = "Root"
  },
  [530112] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char098_Saiqi01/Animation/Part/Saiqi_Part_Armory_Montage.Saiqi_Part_Armory_Montage",
    EffectCreatureId = 530112,
    MeshResourceId = 530198,
    SocketName = "Root"
  },
  [530113] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char098_Saiqi01/Animation/Part/Saiqi_Part_Emo_IdleShow_01.Saiqi_Part_Emo_IdleShow_01",
    EffectCreatureId = 530113,
    MeshResourceId = 530198
  },
  [530114] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char098_Saiqi01/Animation/Part/Saiqi_Part_Ultra_Show_Montage.Saiqi_Part_Ultra_Show_Montage",
    EffectCreatureId = 530114,
    MeshResourceId = 530198
  },
  [530115] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Char098_Saiqi01/Animation/Part/Saiqi_Part_Interactive_Sit02_Montage.Saiqi_Part_Interactive_Sit02_Montage",
    EffectCreatureId = 530115,
    MeshResourceId = 530198
  },
  [540101] = {
    EffectCreatureId = 540101,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/EmoIdle/BP_EffectCreature_DafuIdle.BP_EffectCreature_DafuIdle"
  },
  [900601] = {
    EffectCreatureId = 900601,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Monster/BP_EffectCreature_SQQizha01.BP_EffectCreature_SQQizha01",
    SocketName = "Root"
  },
  [1040101] = {
    EffectCreatureId = 1040101,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Skill/BP_EffectCreature_Dualblade_01.BP_EffectCreature_Dualblade_01",
    MeshResourceIdByCreator = true,
    ReplaceAnimPath = "Combat/Weapon/Dualblade/Heitao_Dualblade_RunAttack_03_EffectCreature_Montage.Heitao_Dualblade_RunAttack_03_EffectCreature_Montage",
    SocketName = "Root"
  },
  [2010100] = {EffectCreatureId = 2010100},
  [2010101] = {
    EffectCreatureId = 2010101,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Others/BP_EffectCreature_Funnel_ArmoryShow.BP_EffectCreature_Funnel_ArmoryShow"
  },
  [2020106] = {
    EffectCreatureId = 2020106,
    EffectCreaturePath = "/Game/Asset/Effect/Blueprint/Child/EF_BP_Decal_Bullet.EF_BP_Decal_Bullet",
    EnterPool = true
  },
  [2040501] = {
    EffectCreatureAnimPath = "/Game/Asset/Char/Player/Common/Weapon/Shotgun/Shotgun_Baopo/Animation/Shotgun_Baopo_Part01_Reload.Shotgun_Baopo_Part01_Reload",
    EffectCreatureId = 2040501,
    MeshResourceId = 2040502,
    SocketName = "Root"
  },
  [2050701] = {
    EffectCreatureId = 2050701,
    EffectCreaturePath = "/Game/Asset/Effect/Blueprint/Child/EF_BP_Decal_Bullet02.EF_BP_Decal_Bullet02",
    EnterPool = true
  },
  [5000303] = {
    EffectCreatureId = 5000303,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Dungeon/BP_EffectCreature_Dungeon_303.BP_EffectCreature_Dungeon_303",
    SocketName = "Root"
  },
  [5000304] = {
    EffectCreatureId = 5000304,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Dungeon/BP_EffectCreature_Dungeon_304.BP_EffectCreature_Dungeon_304",
    SocketName = "Root"
  },
  [5000305] = {
    EffectCreatureId = 5000305,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Dungeon/BP_EffectCreature_Dungeon_305.BP_EffectCreature_Dungeon_305",
    SocketName = "Root"
  },
  [10102101] = {
    EffectCreatureId = 10102101,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Common/BP_EffectCreature_Rou_10102.BP_EffectCreature_Rou_10102",
    SocketName = "pelvis"
  },
  [101128001] = {
    EffectCreatureId = 101128001,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Others/BP_EffectCreature_Story_101128Flower.BP_EffectCreature_Story_101128Flower",
    SocketName = "hook_arm_r"
  },
  [101128002] = {
    EffectCreatureId = 101128002,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Others/BP_EffectCreature_Home_Cat.BP_EffectCreature_Home_Cat",
    SocketName = "Root"
  },
  [101128003] = {
    EffectCreatureId = 101128003,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Others/BP_EffectCreature_Story_Gob01.BP_EffectCreature_Story_Gob01",
    SocketName = "hook_arm_r"
  },
  [101128004] = {
    EffectCreatureId = 101128004,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Others/BP_EffectCreature_Story_Crossbow_Liandu.BP_EffectCreature_Story_Crossbow_Liandu",
    SocketName = "hook_arm_r"
  },
  [304000001] = {
    EffectCreatureId = 304000001,
    EffectCreaturePath = "/Game/BluePrints/Combat/EffectCreature/Monster/BP_EffectCreature_TestText.BP_EffectCreature_TestText"
  }
})
