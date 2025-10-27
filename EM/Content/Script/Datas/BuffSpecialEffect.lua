local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("BuffSpecialEffect", {
  Invincible = {Invincible = 1, SpecialEffect = "Invincible"},
  Invisible = {Invisible = 1, SpecialEffect = "Invisible"},
  Stealth = {SpecialEffect = "Stealth", Stealth = 1},
  Taunt = {SpecialEffect = "Taunt"},
  Translucency = {
    SpecialEffect = "Translucency",
    Translucency = 1
  }
})
