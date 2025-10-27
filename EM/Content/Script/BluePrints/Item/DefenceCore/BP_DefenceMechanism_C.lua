require("UnLua")
local BP_DefenceMechanism_C = Class({
  "BluePrints/Item/DefenceCore/BP_DefenceBase_C"
})

function BP_DefenceMechanism_C:AuthorityInitInfo(Info)
  BP_DefenceMechanism_C.Super.AuthorityInitInfo(self, Info)
  self.bDamaged = false
end

function BP_DefenceMechanism_C:ShowDamage_Lua(DamageEvent)
  if self:CheckHited(DamageEvent) then
    if DamageEvent.DamageTag:Find("Melee") then
      local Start = Battle(self):GetEntity(DamageEvent.SourceEid):K2_GetActorLocation()
      local End = FVector(self:K2_GetActorLocation().X, self:K2_GetActorLocation().Y, Start.Z)
      local HitResult = FHitResult()
      local ActorsToIgnore = TArray(AActor)
      ActorsToIgnore:Add(Battle(self):GetEntity(DamageEvent.SourceEid))
      local bHit = UE4.UKismetSystemLibrary.LineTraceSingle(self, Start, End, ETraceTypeQuery.TraceSkillCreatureBlock, false, ActorsToIgnore, 0, HitResult, false)
      if bHit and HitResult.Actor == self then
        self.FXComponent:PlayFX(self.HitedFX, self.Mesh, nil, HitResult.Location, FRotator(0, 0, 0), true, nil)
      end
    else
      local HitPosition = FVector(DamageEvent.HitPosition.X, DamageEvent.HitPosition.Y, DamageEvent.HitPosition.Z)
      self.FXComponent:PlayFX(self.HitedFX, self.Mesh, nil, HitPosition, FRotator(0, 0, 0), true, nil)
    end
  end
end

function BP_DefenceMechanism_C:OnDamaged(DamageEvent)
  BP_DefenceMechanism_C.Super.OnDamaged(self, DamageEvent)
  if DamageEvent.HpBefore > DamageEvent.HpAfter and self.bDamaged == false then
    local GameMode = UGameplayStatics.GetGameMode(self)
    if GameMode then
      GameMode:TriggerDungeonAchieve("DefenceCoreDamaged", -1, self.Eid, self.UnitId)
    end
    self.bDamaged = true
  end
end

function BP_DefenceMechanism_C:OnArtLevelLoaded(LevelId)
  if not self.CurrentLevelId:Contains(LevelId) then
    return
  end
  local MeshComps = self:K2_GetComponentsByClass(UMeshComponent):ToTable()
  for _, MeshComp in pairs(MeshComps) do
    MeshComp:SetVisibility(false, false)
    MeshComp:SetVisibility(true, false)
  end
  EventManager:RemoveEvent(EventID.OnArtLevelLoaded, self)
end

function BP_DefenceMechanism_C:OnFirstActive()
  self.Overridden.OnFirstActive(self)
end

return BP_DefenceMechanism_C
