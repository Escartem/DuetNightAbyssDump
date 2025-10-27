local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("GachaRebate", {
  Char = {
    [4] = {Rarity = 4, Type = "Char"},
    [5] = {Rarity = 5, Type = "Char"}
  },
  Weapon = {
    [3] = {Rarity = 3, Type = "Weapon"},
    [4] = {Rarity = 4, Type = "Weapon"},
    [5] = {Rarity = 5, Type = "Weapon"}
  }
})
