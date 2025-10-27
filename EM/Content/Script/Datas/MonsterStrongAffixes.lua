local T = {}
T.RT_1 = {
  7.2,
  11.9,
  7.2,
  1
}
T.RT_2 = {
  6.5,
  10.5,
  22.5,
  1
}
T.RT_3 = {
  13.8,
  4.3,
  22.6,
  1
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MonsterStrongAffixes", {
  ["Mon.Strong.Blood"] = {
    AffixesBuffIds = {6000405},
    EffectColor = T.RT_1,
    GamePlayTag = "Mon.Strong.Blood",
    Note = "\231\140\169\231\186\162",
    Priority = 31
  },
  ["Mon.Strong.Blood.Double"] = {
    AffixesBuffIds = {6000505},
    EffectColor = T.RT_2,
    GamePlayTag = "Mon.Strong.Blood.Double",
    Note = "\231\140\169\231\186\162",
    Priority = 31
  },
  ["Mon.Strong.Blood.Triple"] = {
    AffixesBuffIds = {6000605},
    EffectColor = T.RT_3,
    GamePlayTag = "Mon.Strong.Blood.Triple",
    Note = "\231\140\169\231\186\162",
    Priority = 31
  },
  ["Mon.Strong.Burst"] = {
    AffixesBuffIds = {6000402},
    EffectColor = T.RT_1,
    GamePlayTag = "Mon.Strong.Burst",
    Note = "\231\136\134\231\160\180",
    Priority = 21
  },
  ["Mon.Strong.Burst.Double"] = {
    AffixesBuffIds = {6000502},
    EffectColor = T.RT_2,
    GamePlayTag = "Mon.Strong.Burst.Double",
    Note = "\231\136\134\231\160\180",
    Priority = 21
  },
  ["Mon.Strong.Burst.Triple"] = {
    AffixesBuffIds = {6000602},
    EffectColor = T.RT_3,
    GamePlayTag = "Mon.Strong.Burst.Triple",
    Note = "\231\136\134\231\160\180",
    Priority = 21
  },
  ["Mon.Strong.Fade"] = {
    AffixesBuffIds = {6000406},
    EffectColor = T.RT_1,
    GamePlayTag = "Mon.Strong.Fade",
    Note = "\230\158\175\232\144\142",
    Priority = 32
  },
  ["Mon.Strong.Fade.Double"] = {
    AffixesBuffIds = {6000506},
    EffectColor = T.RT_2,
    GamePlayTag = "Mon.Strong.Fade.Double",
    Note = "\230\158\175\232\144\142",
    Priority = 32
  },
  ["Mon.Strong.Fade.Triple"] = {
    AffixesBuffIds = {6000606},
    EffectColor = T.RT_3,
    GamePlayTag = "Mon.Strong.Fade.Triple",
    Note = "\230\158\175\232\144\142",
    Priority = 32
  },
  ["Mon.Strong.Frozen"] = {
    AffixesBuffIds = {6000401},
    EffectColor = T.RT_1,
    GamePlayTag = "Mon.Strong.Frozen",
    Note = "\229\135\155\233\156\156",
    Priority = 15
  },
  ["Mon.Strong.Frozen.Double"] = {
    AffixesBuffIds = {6000501},
    EffectColor = T.RT_2,
    GamePlayTag = "Mon.Strong.Frozen.Double",
    Note = "\229\135\155\233\156\156",
    Priority = 15
  },
  ["Mon.Strong.Frozen.Triple"] = {
    AffixesBuffIds = {6000601},
    EffectColor = T.RT_3,
    GamePlayTag = "Mon.Strong.Frozen.Triple",
    Note = "\229\135\155\233\156\156",
    Priority = 15
  },
  ["Mon.Strong.IceOrb"] = {
    AffixesBuffIds = {6000409},
    EffectColor = T.RT_1,
    GamePlayTag = "Mon.Strong.IceOrb",
    Note = "\233\156\156\231\139\177",
    Priority = 11
  },
  ["Mon.Strong.IceOrb.Double"] = {
    AffixesBuffIds = {6000509},
    EffectColor = T.RT_2,
    GamePlayTag = "Mon.Strong.IceOrb.Double",
    Note = "\233\156\156\231\139\177",
    Priority = 11
  },
  ["Mon.Strong.IceOrb.Triple"] = {
    AffixesBuffIds = {6000609},
    EffectColor = T.RT_3,
    GamePlayTag = "Mon.Strong.IceOrb.Triple",
    Note = "\233\156\156\231\139\177",
    Priority = 11
  },
  ["Mon.Strong.Kamikaze"] = {
    AffixesBuffIds = {6000411},
    EffectColor = T.RT_1,
    GamePlayTag = "Mon.Strong.Kamikaze",
    Note = "\232\136\141\232\186\171",
    Priority = 45
  },
  ["Mon.Strong.Kamikaze.Double"] = {
    AffixesBuffIds = {6000511},
    EffectColor = T.RT_2,
    GamePlayTag = "Mon.Strong.Kamikaze.Double",
    Note = "\232\136\141\232\186\171",
    Priority = 45
  },
  ["Mon.Strong.Kamikaze.Triple"] = {
    AffixesBuffIds = {6000611},
    EffectColor = T.RT_3,
    GamePlayTag = "Mon.Strong.Kamikaze.Triple",
    Note = "\232\136\141\232\186\171",
    Priority = 45
  },
  ["Mon.Strong.Poison"] = {
    AffixesBuffIds = {6000403},
    EffectColor = T.RT_1,
    GamePlayTag = "Mon.Strong.Poison",
    Note = "\228\190\181\232\154\128",
    Priority = 41
  },
  ["Mon.Strong.Poison.Double"] = {
    AffixesBuffIds = {6000503},
    EffectColor = T.RT_2,
    GamePlayTag = "Mon.Strong.Poison.Double",
    Note = "\228\190\181\232\154\128",
    Priority = 41
  },
  ["Mon.Strong.Poison.Triple"] = {
    AffixesBuffIds = {6000603},
    EffectColor = T.RT_3,
    GamePlayTag = "Mon.Strong.Poison.Triple",
    Note = "\228\190\181\232\154\128",
    Priority = 41
  },
  ["Mon.Strong.Reflect"] = {
    AffixesBuffIds = {6000410},
    EffectColor = T.RT_1,
    GamePlayTag = "Mon.Strong.Reflect",
    Note = "\230\174\139\231\129\171",
    Priority = 25
  },
  ["Mon.Strong.Reflect.Double"] = {
    AffixesBuffIds = {6000510},
    EffectColor = T.RT_2,
    GamePlayTag = "Mon.Strong.Reflect.Double",
    Note = "\230\174\139\231\129\171",
    Priority = 25
  },
  ["Mon.Strong.Reflect.Triple"] = {
    AffixesBuffIds = {6000610},
    EffectColor = T.RT_3,
    GamePlayTag = "Mon.Strong.Reflect.Triple",
    Note = "\230\174\139\231\129\171",
    Priority = 25
  },
  ["Mon.Strong.Revenge"] = {
    AffixesBuffIds = {6000408},
    EffectColor = T.RT_1,
    GamePlayTag = "Mon.Strong.Revenge",
    Note = "\229\164\141\228\187\135",
    Priority = 35
  },
  ["Mon.Strong.Revenge.Double"] = {
    AffixesBuffIds = {6000508},
    EffectColor = T.RT_2,
    GamePlayTag = "Mon.Strong.Revenge.Double",
    Note = "\229\164\141\228\187\135",
    Priority = 35
  },
  ["Mon.Strong.Revenge.Triple"] = {
    AffixesBuffIds = {6000608},
    EffectColor = T.RT_3,
    GamePlayTag = "Mon.Strong.Revenge.Triple",
    Note = "\229\164\141\228\187\135",
    Priority = 35
  },
  ["Mon.Strong.Shield"] = {
    AffixesBuffIds = {6000407},
    EffectColor = T.RT_1,
    GamePlayTag = "Mon.Strong.Shield",
    Note = "\229\174\136\230\138\164",
    Priority = 16
  },
  ["Mon.Strong.Shield.Double"] = {
    AffixesBuffIds = {6000507},
    EffectColor = T.RT_2,
    GamePlayTag = "Mon.Strong.Shield.Double",
    Note = "\229\174\136\230\138\164",
    Priority = 16
  },
  ["Mon.Strong.Shield.Triple"] = {
    AffixesBuffIds = {6000607},
    EffectColor = T.RT_3,
    GamePlayTag = "Mon.Strong.Shield.Triple",
    Note = "\229\174\136\230\138\164",
    Priority = 16
  },
  ["Mon.Strong.Threefold"] = {
    AffixesBuffIds = {6000414},
    EffectColor = T.RT_1,
    GamePlayTag = "Mon.Strong.Threefold",
    Note = "\230\142\160\229\189\177",
    Priority = 62
  },
  ["Mon.Strong.Threefold.Double"] = {
    AffixesBuffIds = {6000514},
    EffectColor = T.RT_2,
    GamePlayTag = "Mon.Strong.Threefold.Double",
    Note = "\230\142\160\229\189\177",
    Priority = 62
  },
  ["Mon.Strong.Threefold.Triple"] = {
    AffixesBuffIds = {6000614},
    EffectColor = T.RT_3,
    GamePlayTag = "Mon.Strong.Threefold.Triple",
    Note = "\230\142\160\229\189\177",
    Priority = 62
  },
  ["Mon.Strong.Thunder"] = {
    AffixesBuffIds = {6000404},
    EffectColor = T.RT_1,
    GamePlayTag = "Mon.Strong.Thunder",
    Note = "\233\156\185\233\155\179",
    Priority = 52
  },
  ["Mon.Strong.Thunder.Double"] = {
    AffixesBuffIds = {6000504},
    EffectColor = T.RT_2,
    GamePlayTag = "Mon.Strong.Thunder.Double",
    Note = "\233\156\185\233\155\179",
    Priority = 52
  },
  ["Mon.Strong.Thunder.Triple"] = {
    AffixesBuffIds = {6000604},
    EffectColor = T.RT_3,
    GamePlayTag = "Mon.Strong.Thunder.Triple",
    Note = "\233\156\185\233\155\179",
    Priority = 52
  },
  ["Mon.Strong.ThunderLaser"] = {
    AffixesBuffIds = {6000412},
    EffectColor = T.RT_1,
    GamePlayTag = "Mon.Strong.ThunderLaser",
    Note = "\232\189\172\233\155\183",
    Priority = 51
  },
  ["Mon.Strong.ThunderLaser.Double"] = {
    AffixesBuffIds = {6000512},
    EffectColor = T.RT_2,
    GamePlayTag = "Mon.Strong.ThunderLaser.Double",
    Note = "\232\189\172\233\155\183",
    Priority = 51
  },
  ["Mon.Strong.ThunderLaser.Triple"] = {
    AffixesBuffIds = {6000612},
    EffectColor = T.RT_3,
    GamePlayTag = "Mon.Strong.ThunderLaser.Triple",
    Note = "\232\189\172\233\155\183",
    Priority = 51
  },
  ["Mon.Strong.Vampire"] = {
    AffixesBuffIds = {6000413},
    EffectColor = T.RT_1,
    GamePlayTag = "Mon.Strong.Vampire",
    Note = "\230\181\180\232\161\128",
    Priority = 61
  },
  ["Mon.Strong.Vampire.Double"] = {
    AffixesBuffIds = {6000513},
    EffectColor = T.RT_2,
    GamePlayTag = "Mon.Strong.Vampire.Double",
    Note = "\230\181\180\232\161\128",
    Priority = 61
  },
  ["Mon.Strong.Vampire.Triple"] = {
    AffixesBuffIds = {6000613},
    EffectColor = T.RT_3,
    GamePlayTag = "Mon.Strong.Vampire.Triple",
    Note = "\230\181\180\232\161\128",
    Priority = 61
  }
})
