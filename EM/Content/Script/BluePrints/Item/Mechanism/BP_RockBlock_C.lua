require("UnLua")
local BP_RockBlock_C = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function BP_RockBlock_C:OnActorReady(Info)
  self.Super.OnActorReady(self, Info)
end

function BP_RockBlock_C:UseSkill()
  local Radius = self.UnitParams.SkillRadius or 1500
  local EffectId = self.UnitParams.SkillEffect or 900010
  local ObjectTypes = TArray(EObjectTypeQuery)
  ObjectTypes:Add(EObjectTypeQuery.Pawn)
  ObjectTypes:Add(EObjectTypeQuery.MonsterPawn)
  local ActorsToIgnore = TArray(AActor)
  ActorsToIgnore:Add(self)
  local OutActors = TArray(AActor)
  local bHit = UE4.UKismetSystemLibrary.SphereOverlapActors(self, self.CrashPoint:K2_GetComponentLocation(), Radius, ObjectTypes, nil, ActorsToIgnore, OutActors)
  for key, value in pairs(OutActors) do
    self.Super.PropUseSkill(self, EffectId, value)
  end
end

return BP_RockBlock_C
