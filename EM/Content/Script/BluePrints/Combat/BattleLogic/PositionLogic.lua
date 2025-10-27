local Component = {}

function Component:PosCheckSphereHit(Source, SourceLoc, ObjectTypes, ActorsToIgnore, Radius, Angle, FilterCamp)
  local ResTargets = TArray(AActor)
  local RealSourceLoc = SourceLoc or Source:K2_GetActorLocation()
  local bHit = UE4.UKismetSystemLibrary.SphereOverlapActors(self, RealSourceLoc, Radius, ObjectTypes, AActor, ActorsToIgnore, ResTargets)
  if _G.DrawDebugTest then
    UE4.UKismetSystemLibrary.DrawDebugSphere(Source, RealSourceLoc, Radius, 12, FLinearColor(255, 0, 0), 0.5, 1)
  end
  if not bHit then
    return ResTargets
  end
  ResTargets = self:FilterTargetInitSuccess(ResTargets)
  if FilterCamp then
    self:FilterTargetsByCamp(Source, ResTargets, FilterCamp)
  end
  if Angle and Angle >= 0 then
    ResTargets = self:PosCheckTargetInSector(Source, Radius, Angle, ResTargets)
  end
  return ResTargets
end

function Component:PosCheckTargetInSector(Source, Radius, Angle, Targets)
  local NewTargets = {}
  for _, Target in pairs(Targets) do
    local bInSector = UFormulaFunctionLibrary.IsInsideSector(Target:K2_GetActorLocation(), Source:K2_GetActorLocation(), Source:GetActorForwardVector(), Angle)
    if bInSector then
      table.insert(NewTargets, Target)
    end
  end
  return NewTargets
end

function Component:PosCheckSourceInSector(Source, Radius, Angle, Targets)
  local NewTargets = TArray(AActor)
  for i = 1, Targets:Length() do
    local Target = Targets:GetRef(i)
    local bInSector = UFormulaFunctionLibrary.IsInsideSector(Source:K2_GetActorLocation(), Target:K2_GetActorLocation(), Target:GetActorForwardVector(), Angle)
    if bInSector then
      NewTargets:Add(Target)
    end
  end
  return NewTargets
end

return Component
