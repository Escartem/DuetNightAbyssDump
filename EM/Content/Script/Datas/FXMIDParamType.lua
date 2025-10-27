local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("FXMIDParamType", {
  Dark = {AbnormalIndex = 9, ParamType = "Dark"},
  Fire = {AbnormalIndex = 1, ParamType = "Fire"},
  Invisibility = {
    AbnormalIndex = 4,
    ParamType = "Invisibility"
  },
  Light = {AbnormalIndex = 8, ParamType = "Light"},
  ShuimuDot = {AbnormalIndex = 10, ParamType = "ShuimuDot"},
  StunBlind = {AbnormalIndex = 7, ParamType = "StunBlind"},
  StunFire = {AbnormalIndex = 6, ParamType = "StunFire"},
  StunParalysis = {
    AbnormalIndex = 5,
    ParamType = "StunParalysis"
  },
  Thunder = {AbnormalIndex = 3, ParamType = "Thunder"},
  Water = {AbnormalIndex = 0, ParamType = "Water"},
  Wind = {AbnormalIndex = 2, ParamType = "Wind"}
})
