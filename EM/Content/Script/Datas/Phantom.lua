local T = {}
T.RT_1 = {
  [1] = "/Game/AssetDesign/AI/Player/Heitao/BT_Phantom_Heitao.BT_Phantom_Heitao"
}
T.RT_2 = {
  [1] = "/Game/AssetDesign/AI/Player/BattleNPC/Nvzhu/BT_Phantom_Nvzhu.BT_Phantom_Nvzhu"
}
T.RT_3 = {
  [1] = "/Game/AssetDesign/AI/Player/Kezhou/BT_Phantom_Kezhou.BT_Phantom_Kezhou"
}
T.RT_4 = {
  [1] = "/Game/AssetDesign/AI/Player/Nvzhu/BT_Phantom_Nvzhu_Light.BT_Phantom_Nvzhu_Light"
}
T.RT_5 = {
  [1] = "/Game/AssetDesign/AI/Player/Lise/BT_Phantom_Lise.BT_Phantom_Lise"
}
T.RT_6 = {
  [1] = "/Game/AssetDesign/AI/Player/Yuming/BT_Phantom_Yuming.BT_Phantom_Yuming"
}
T.RT_7 = {
  [1] = "/Game/AssetDesign/AI/Player/Baiheng/BT_Phantom_Baiheng.BT_Phantom_Baiheng"
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Phantom", {
  [1] = {
    BT = T.RT_1,
    Camp = "Player",
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacterAI.BP_PlayerCharacterAI",
    UnitId = 1,
    UnitName = "\232\183\145\230\181\139\230\156\186\229\153\168\228\186\186"
  },
  [10] = {
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/BattleNPC/Hostage/BT_Phantom_Hostage.BT_Phantom_Hostage"
    },
    BattleRoleId = 10,
    Camp = "Player",
    GuideIconAni = "/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Hostage.WBP_GuidePoint_Hostage",
    HatredRatio = 2,
    InitGuide = {All = -1},
    IsHostage = true,
    IsNPCPhantom = true,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_NPCPhantom.BP_NPCPhantom",
    UnitId = 10,
    UnitName = "NPC-\228\186\186\232\180\168"
  },
  [101] = {
    BT = {
      [1] = "/Game/AssetDesign/AI/Z_Misc_Test/PhantomTest/BT_Phantom_Test.BT_Phantom_Test"
    },
    BattleRoleId = 1101,
    Camp = "Player",
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 101,
    UnitName = "\230\181\139\232\175\149\231\148\168\233\173\133\229\189\177",
    WearMeleeWeapon = 1,
    WearRangedWeapon = 1
  },
  [110] = {
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/Heitao/BT_Prologue_Heitao.BT_Prologue_Heitao"
    },
    BattleRoleId = 1101,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0,
    IsNPCPhantom = true,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_NPCPhantom.BP_NPCPhantom",
    UnitId = 110,
    UnitName = "NPC-\229\186\143\231\171\160\233\187\145\230\161\131"
  },
  [111] = {
    BT = T.RT_2,
    BattleRoleId = 111,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0,
    IsNPCPhantom = true,
    IsPlayerMapping = true,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_NPCPhantom.BP_NPCPhantom",
    UnitId = 111,
    UnitName = "NPC-\229\186\143\231\171\160\229\165\179\228\184\187",
    WearMeleeWeapon = 1
  },
  [112] = {
    BT = T.RT_2,
    BattleRoleId = 112,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0,
    IsNPCPhantom = true,
    IsPlayerMapping = true,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_NPCPhantom.BP_NPCPhantom",
    UnitId = 112,
    UnitName = "NPC-\229\186\143\231\171\160\231\148\183\228\184\187",
    WearMeleeWeapon = 1
  },
  [201] = {
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/BattleNPC/Awa/BT_Phantom_Awa.BT_Phantom_Awa"
    },
    BattleRoleId = 201,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    IsNPCPhantom = true,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_NPCPhantom.BP_NPCPhantom",
    UnitId = 201,
    UnitName = "NPC-\233\152\191\231\147\166"
  },
  [202] = {
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/BattleNPC/Dafu/BT_Phantom_Dafu.BT_Phantom_Dafu"
    },
    BattleRoleId = 202,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0,
    IsNPCPhantom = true,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_NPCPhantom.BP_NPCPhantom",
    UnitId = 202,
    UnitName = "NPC-\232\190\190\232\138\153\230\182\133"
  },
  [203] = {
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/Saiqi/BT_Phantom_SaiqiNPC.BT_Phantom_SaiqiNPC"
    },
    BattleRoleId = 5301,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0,
    IsNPCPhantom = true,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_NPCPhantom.BP_NPCPhantom",
    UnitId = 203,
    UnitName = "NPC-\232\157\182\229\166\185-\230\137\147\229\151\156\230\153\182\232\128\133",
    WearMeleeWeapon = 1
  },
  [204] = {
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/Tuosi/BT_Npc_Tuosi.BT_Npc_Tuosi"
    },
    BattleRoleId = 110301,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0,
    IsNPCPhantom = true,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_NPCPhantom.BP_NPCPhantom",
    UnitId = 204,
    UnitName = "NPC-\230\137\152\230\150\175\229\141\161",
    WearMeleeWeapon = 1
  },
  [205] = {
    BT = T.RT_2,
    BattleRoleId = 205,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0,
    IsNPCPhantom = true,
    IsPlayerMapping = true,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_NPCPhantom.BP_NPCPhantom",
    UnitId = 205,
    UnitName = "NPC-\231\172\172\228\186\140\231\171\160\229\165\179\228\184\187",
    WearMeleeWeapon = 1
  },
  [206] = {
    BT = T.RT_2,
    BattleRoleId = 206,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0,
    IsNPCPhantom = true,
    IsPlayerMapping = true,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_NPCPhantom.BP_NPCPhantom",
    UnitId = 206,
    UnitName = "NPC-\231\172\172\228\186\140\231\171\160\231\148\183\228\184\187",
    WearMeleeWeapon = 1
  },
  [207] = {
    BT = T.RT_5,
    BattleRoleId = 207,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0,
    IsNPCPhantom = true,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_NPCPhantom.BP_NPCPhantom",
    UnitId = 207,
    UnitName = "NPC-\231\172\172\228\186\140\231\171\160\233\187\142\231\145\159",
    WearMeleeWeapon = 1
  },
  [210] = {
    BT = T.RT_6,
    BattleRoleId = 210,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0,
    IsNPCPhantom = true,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_NPCPhantom.BP_NPCPhantom",
    UnitId = 210,
    UnitName = "NPC-\228\184\156\229\155\189-\231\133\156\230\152\142\233\173\133\229\189\177",
    WearMeleeWeapon = 1
  },
  [211] = {
    BT = T.RT_7,
    BattleRoleId = 211,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0,
    IsNPCPhantom = true,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_NPCPhantom.BP_NPCPhantom",
    UnitId = 211,
    UnitName = "NPC-\228\184\156\229\155\189-\230\137\182\231\150\143\233\173\133\229\189\177",
    WearMeleeWeapon = 1
  },
  [212] = {
    BT = T.RT_3,
    BattleRoleId = 212,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0,
    IsNPCPhantom = true,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_NPCPhantom.BP_NPCPhantom",
    UnitId = 212,
    UnitName = "NPC-\228\184\156\229\155\189-\229\136\187\232\136\159\233\173\133\229\189\177",
    WearMeleeWeapon = 1
  },
  [1101] = {
    AutoRespawn = 5,
    BT = T.RT_1,
    BattleRoleId = 1101,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 1101,
    UnitName = "\233\187\145\230\161\131-\233\173\133\229\189\177",
    WearMeleeWeapon = 1
  },
  [1103] = {
    AutoRespawn = 5,
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/Tuosi/BT_Phantom_Tuosi.BT_Phantom_Tuosi"
    },
    BattleRoleId = 1103,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 1103,
    UnitName = "\230\137\152\230\150\175\229\141\161-\233\173\133\229\189\177",
    WearMeleeWeapon = 1
  },
  [1501] = {
    AutoRespawn = 5,
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/Baonu/BT_Phantom_Baonu.BT_Phantom_Baonu"
    },
    BattleRoleId = 1501,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 1501,
    UnitName = "\230\154\180\230\128\146-\233\173\133\229\189\177",
    WearMeleeWeapon = 1
  },
  [1502] = {
    AutoRespawn = 5,
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/Nifu/BT_Phantom_Nifu.BT_Phantom_Nifu"
    },
    BattleRoleId = 1502,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 1502,
    UnitName = "\229\166\174\229\188\151\229\176\148\229\164\171\228\186\186-\233\173\133\229\189\177",
    WearMeleeWeapon = 1
  },
  [1503] = {
    AutoRespawn = 5,
    BT = T.RT_3,
    BattleRoleId = 1503,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 1503,
    UnitName = "\229\136\187\232\136\159-\233\173\133\229\189\177",
    WearRangedWeapon = 1
  },
  [1601] = {
    AutoRespawn = 5,
    BT = T.RT_4,
    BattleRoleId = 1601,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 1601,
    UnitName = "\229\165\179\228\184\187-\229\133\137-\233\173\133\229\189\177",
    WearMeleeWeapon = 1
  },
  [1801] = {
    AutoRespawn = 5,
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/Feina/BT_Phantom_Feina.BT_Phantom_Feina"
    },
    BattleRoleId = 1801,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 1801,
    UnitName = "\232\143\178\229\168\156-\233\173\133\229\189\177",
    WearMeleeWeapon = 1
  },
  [2101] = {
    AutoRespawn = 5,
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/Shuimu/BT_Phantom_Shuimu.BT_Phantom_Shuimu"
    },
    BattleRoleId = 2101,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 2101,
    UnitName = "\230\176\180\230\175\141-\233\173\133\229\189\177",
    WearMeleeWeapon = 1
  },
  [2301] = {
    AutoRespawn = 5,
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/Zhangyu/BT_Phantom_Zhangyu.BT_Phantom_Zhangyu"
    },
    BattleRoleId = 2301,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 2301,
    UnitName = "\231\171\160\233\177\188-\233\173\133\229\189\177",
    WearRangedWeapon = 1
  },
  [2401] = {
    AutoRespawn = 5,
    BT = T.RT_7,
    BattleRoleId = 2401,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 2401,
    UnitName = "\231\153\189\232\152\133-\233\173\133\229\189\177",
    WearRangedWeapon = 1
  },
  [3101] = {
    AutoRespawn = 5,
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/Linen/BT_Phantom_Linen.BT_Phantom_Linen"
    },
    BattleRoleId = 3101,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 3101,
    UnitName = "\229\165\179\230\158\170-\233\173\133\229\189\177",
    WearRangedWeapon = 1
  },
  [3102] = {
    AutoRespawn = 5,
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/Xier/BT_Phantom_Xier.BT_Phantom_Xier"
    },
    BattleRoleId = 3102,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 3102,
    UnitName = "\229\184\140\229\176\148\229\166\178-\233\173\133\229\189\177",
    WearRangedWeapon = 1
  },
  [3103] = {
    AutoRespawn = 5,
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/Yeer/BT_Phantom_Yeer.BT_Phantom_Yeer"
    },
    BattleRoleId = 3103,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 3103,
    UnitName = "\232\128\182\229\176\148-\233\173\133\229\189\177",
    WearRangedWeapon = 1
  },
  [3201] = {
    AutoRespawn = 5,
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/Haier/BT_Phantom_Haier.BT_Phantom_Haier"
    },
    BattleRoleId = 3201,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 3201,
    UnitName = "\229\133\184\231\139\177\233\149\191-\233\173\133\229\189\177",
    WearMeleeWeapon = 1
  },
  [3301] = {
    AutoRespawn = 5,
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/Maer/BT_Phantom_Maer.BT_Phantom_Maer"
    },
    BattleRoleId = 3301,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 3301,
    UnitName = "\231\142\155\229\176\148\230\180\129-\233\173\133\229\189\177",
    WearMeleeWeapon = 1
  },
  [4101] = {
    AutoRespawn = 5,
    BT = T.RT_5,
    BattleRoleId = 4101,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 4101,
    UnitName = "\233\187\142\231\145\159-\233\173\133\229\189\177",
    WearMeleeWeapon = 1
  },
  [4102] = {
    AutoRespawn = 5,
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/Zhiliu/BT_Phantom_Zhiliu.BT_Phantom_Zhiliu"
    },
    BattleRoleId = 4102,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 4102,
    UnitName = "\230\173\162\230\181\129-\233\173\133\229\189\177",
    WearMeleeWeapon = 1
  },
  [4201] = {
    AutoRespawn = 5,
    BT = T.RT_6,
    BattleRoleId = 4201,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 4201,
    UnitName = "\233\187\145\233\190\153-\233\173\133\229\189\177",
    WearMeleeWeapon = 1
  },
  [4202] = {
    AutoRespawn = 5,
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/Landi/BT_Phantom_Landi.BT_Phantom_Landi"
    },
    BattleRoleId = 4202,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 4202,
    UnitName = "\229\133\176\232\191\170-\233\173\133\229\189\177",
    WearMeleeWeapon = 1
  },
  [4301] = {
    AutoRespawn = 5,
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/Xibi/BT_Phantom_Xibi.BT_Phantom_Xibi"
    },
    BattleRoleId = 4301,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 4301,
    UnitName = "\232\165\191\230\175\148-\233\173\133\229\189\177",
    WearMeleeWeapon = 1
  },
  [5101] = {
    AutoRespawn = 5,
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/Songlu/BT_Phantom_Songlu.BT_Phantom_Songlu"
    },
    BattleRoleId = 5101,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 5101,
    UnitName = "\230\157\190\233\156\178-\233\173\133\229\189\177",
    WearMeleeWeapon = 1
  },
  [5102] = {
    AutoRespawn = 5,
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/Aote/BT_Phantom_Aote.BT_Phantom_Aote"
    },
    BattleRoleId = 5102,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 5102,
    UnitName = "\229\165\165\231\137\185\232\181\155\229\190\183-\233\173\133\229\189\177",
    WearMeleeWeapon = 1
  },
  [5301] = {
    AutoRespawn = 5,
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/Saiqi/BT_Phantom_Saiqi.BT_Phantom_Saiqi"
    },
    BattleRoleId = 5301,
    Camp = "Player",
    FlyParams = {AlwaysFly = false, EnableFly = true},
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 5301,
    UnitName = "\232\157\182\229\166\185-\233\173\133\229\189\177",
    WearMeleeWeapon = 1
  },
  [5401] = {
    AutoRespawn = 5,
    BT = {
      [1] = "/Game/AssetDesign/AI/Player/Dafu/BT_Phantom_Dafu.BT_Phantom_Dafu"
    },
    BattleRoleId = 5401,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 5401,
    UnitName = "\232\190\190\232\138\153\230\182\133-\233\173\133\229\189\177",
    WearRangedWeapon = 1
  },
  [160101] = {
    AutoRespawn = 5,
    BT = T.RT_4,
    BattleRoleId = 160101,
    Camp = "Player",
    GuideIconAni = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    HatredRatio = 0.5,
    RespawnUI = 20001,
    UnitBPPath = "/Game/BluePrints/Char/BP_Phantom/BP_PhantomCharacter.BP_PhantomCharacter",
    UnitId = 160101,
    UnitName = "\231\148\183\228\184\187-\229\133\137-\233\173\133\229\189\177",
    WearMeleeWeapon = 1
  }
})
