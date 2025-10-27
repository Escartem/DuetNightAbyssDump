require("UnLua")
local BP_AOITriggerSphere_C = Class("BluePrints.Common.Triggers.BP_AOITriggerBox_C")

function BP_AOITriggerSphere_C:SetSphereRadius_Lua(Size, TipSize)
  if Size and 0 ~= Size then
    self.CollisionComponent:SetSphereRadius(Size)
  else
    local ObjectTypes = TArray(EObjectTypeQuery)
    ObjectTypes:Add(UE4.EObjectTypeQuery.Pawn)
    local OutActors = TArray(AActor)
    OutActors = UE4.UKismetSystemLibrary.ComponentOverlapActors(self.CollisionComponent, self.CollisionComponent:K2_GetComponentToWorld(), ObjectTypes)
    for i = 1, OutActors:Length() do
      local TargetActor = OutActors:GetRef(i)
      self:CollisionBeginOverlap(nil, TargetActor)
    end
  end
end

function BP_AOITriggerSphere_C:BindEvent(Info)
  if not IsAuthority(self) then
    return
  end
  self.CollisionComponent.OnComponentBeginOverlap:Add(self, self.CollisionBeginOverlap)
  self.CollisionComponent.OnComponentEndOverlap:Add(self, self.CollisionEndOverlap)
  if Info.Creator then
    self:SetSphereRadius(Info.Creator.TriggerSphereRadius, Info.Creator.TriggerSphereRadius)
  else
    self:SetSphereRadius(nil, nil)
  end
end

return BP_AOITriggerSphere_C
