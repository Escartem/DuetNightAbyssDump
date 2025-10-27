local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("InitConfig", {
  [1] = {
    AlternativeCharId = 3301,
    AlternativeRangedWeapon = {20501, 20401},
    CharId = 1101,
    Id = 1,
    MeleeWeaponId = 10101,
    RangedWeaponId = 20401,
    TitleFrameId = 10001
  }
})
