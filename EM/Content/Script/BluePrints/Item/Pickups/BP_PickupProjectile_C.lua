require("UnLua")
local BP_PickupProjectile_C = Class({
  "BluePrints.Item.Pickups.BP_PickupBase_C"
})

function BP_PickupProjectile_C:AddPickupBaseToCache_Lua()
  BP_PickupProjectile_C.Super.AddPickupBaseToCache_Lua(self)
  if self.DropEffectNew then
    UCharacterFunctionLibrary.DeactivateNiagaraImmediately(self.DropEffectNew)
  end
end

return BP_PickupProjectile_C
