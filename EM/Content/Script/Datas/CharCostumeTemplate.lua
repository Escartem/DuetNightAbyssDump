local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("CharCostumeTemplate", {
  [210101] = {CharCostumeId = 210101, SkinId = 210102},
  [510101] = {CharCostumeId = 510101, SkinId = 510101},
  [530100] = {
    BackAccessory = 40001,
    CharCostumeId = 530100,
    ColorId = {
      1001,
      1001,
      1001,
      1001
    },
    FaceAccessory = 20001,
    HeadAccessory = 10001,
    SkinId = 210102,
    WaistAccessory = 30001
  },
  [530101] = {CharCostumeId = 530101, SkinId = 530101}
})
