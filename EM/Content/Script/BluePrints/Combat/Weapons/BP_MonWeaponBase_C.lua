require("UnLua")
local EffectResults = require("BluePrints.Combat.BattleLogic.EffectResults")
local BP_MonWeaponBase_C = Class({
  "BluePrints.Combat.Weapons.BP_WeaponBase_C"
})

function BP_MonWeaponBase_C:InitFromCache()
end

AssembleComponents(BP_MonWeaponBase_C)
return BP_MonWeaponBase_C
