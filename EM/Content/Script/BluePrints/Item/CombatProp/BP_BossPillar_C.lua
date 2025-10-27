require("UnLua")
local BP_Pillar_ShiJingZhe_C = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function BP_Pillar_ShiJingZhe_C:AuthorityInitInfo(Info)
  BP_Pillar_ShiJingZhe_C.Super.AuthorityInitInfo(self, Info)
  self:AdjustTransform()
end

function BP_Pillar_ShiJingZhe_C:ShowDeath()
  self.Overridden.ShowDeath(self)
end

function BP_Pillar_ShiJingZhe_C:AdjustTransform()
  local Scale = self.UnitParams.Scale
  if not Scale then
    return
  end
  local CurrentScale = self:GetActorScale3D()
  local BodySize = self.BodyCollision.BoxExtent
  local CurrentLocation = self:K2_GetActorLocation()
  self:SetActorScale3D(FVector(Scale[1], Scale[2], Scale[3]))
  local ResX = (Scale[1] - CurrentScale.X) * BodySize.X
  local ResY = (Scale[2] - CurrentScale.Y) * BodySize.Y
  local ResZ = (Scale[3] - CurrentScale.Z) * BodySize.Z
  local Res = FVector(ResX, ResY, ResZ)
  self:K2_SetActorLocation(Res + CurrentLocation, false, nil, false)
end

return BP_Pillar_ShiJingZhe_C
