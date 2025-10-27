local BP_PickupStatic_C = Class({
  "BluePrints.Item.Pickups.BP_PickupBase_C"
})

function BP_PickupStatic_C:ClientInitInfo(Info)
  BP_PickupStatic_C.Super.ClientInitInfo(self, Info)
  self:SetMeshEffectColor(self:GetEffectColor())
end

return BP_PickupStatic_C
