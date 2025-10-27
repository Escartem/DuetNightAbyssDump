local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("GachaType", {
  GACHA_TYPE_MUSTUP = {
    GachaType = "GACHA_TYPE_MUSTUP"
  },
  GACHA_TYPE_NORMAL = {
    GachaType = "GACHA_TYPE_NORMAL"
  },
  GACHA_TYPE_NORMAL_WEAPON = {
    GachaType = "GACHA_TYPE_NORMAL_WEAPON"
  },
  GACHA_TYPE_START = {
    GachaType = "GACHA_TYPE_START"
  },
  GACHA_TYPE_UP = {
    GachaType = "GACHA_TYPE_UP"
  },
  GACHA_TYPE_WEAPON_UP = {
    GachaType = "GACHA_TYPE_WEAPON_UP"
  }
})
