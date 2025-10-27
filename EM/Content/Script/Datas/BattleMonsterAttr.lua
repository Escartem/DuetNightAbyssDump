local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("BattleMonsterAttr", {
  ATK = {AttrName = "ATK", DefaultValue = 1},
  BaseOverShield = {
    AttrName = "BaseOverShield",
    DefaultValue = 1000
  },
  BossTNToZeroRecoverSpeed = {
    AttrName = "BossTNToZeroRecoverSpeed",
    DefaultValue = 0
  },
  CollisionLevel = {
    AttrName = "CollisionLevel",
    DefaultValue = 99
  },
  DEF = {AttrName = "DEF", DefaultValue = 0},
  ESRates = {AttrName = "ESRates", DefaultValue = 0},
  ESRecoverRate = {
    AttrName = "ESRecoverRate",
    DefaultValue = 0.05
  },
  ESRecoverTime = {
    AttrName = "ESRecoverTime",
    DefaultValue = 5
  },
  ESRecoverValue = {
    AttrName = "ESRecoverValue",
    DefaultValue = 15
  },
  HpRates = {AttrName = "HpRates", DefaultValue = 0},
  MaxES = {AttrName = "MaxES", DefaultValue = 0},
  MaxHp = {AttrName = "MaxHp", DefaultValue = 1},
  MaxTN = {AttrName = "MaxTN", DefaultValue = 1},
  MonsterDamageRate = {
    AttrName = "MonsterDamageRate",
    DefaultValue = 1
  },
  PlayerDamagedRate = {
    AttrName = "PlayerDamagedRate",
    DefaultValue = 1
  },
  TN = {AttrName = "TN", DefaultValue = 1},
  TNRecoverS = {AttrName = "TNRecoverS", DefaultValue = 2},
  TNRecoverTimeB = {
    AttrName = "TNRecoverTimeB",
    DefaultValue = 5
  },
  TNRecoverTimeZ = {
    AttrName = "TNRecoverTimeZ",
    DefaultValue = 3
  },
  TNResistance = {
    AttrName = "TNResistance",
    DefaultValue = 1
  }
})
