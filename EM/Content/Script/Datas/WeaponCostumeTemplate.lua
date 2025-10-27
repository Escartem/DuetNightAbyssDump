local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("WeaponCostumeTemplate", {
  [530110] = {
    SkinId = 3010201,
    WeaponAccessory = 10001,
    WeaponCostumeId = 530110,
    WeaponSpecialColor = 10001
  },
  [1020101] = {SkinId = 3010402, WeaponCostumeId = 1020101},
  [1020401] = {SkinId = 3010401, WeaponCostumeId = 1020401},
  [2060201] = {SkinId = 3010301, WeaponCostumeId = 2060201}
})
