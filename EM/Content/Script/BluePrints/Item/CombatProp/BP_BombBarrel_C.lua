require("UnLua")
local BP_BombBarrel_C = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function BP_BombBarrel_C:ChangeToBomb()
  if not IsAuthority(self) or IsStandAlone(self) then
    local FXAsset = LoadObject("/Game/Asset/Effect/Niagara/Scene/Common/NS_Scene_Baolie_Explode.NS_Scene_Baolie_Explode")
    local BombLoc = self.ExplodeFX:K2_GetComponentLocation()
    local FXObject = self.FXComponent:PlayEffectByIDParams(self.BombEffectId, {
      UseAbsoluteLocation = true,
      Location = {
        BombLoc.X,
        BombLoc.Y,
        BombLoc.Z
      }
    })
    if FXObject then
      local Scale = FVector(self.BombRadius / 250, self.BombRadius / 250, self.BombRadius / 250)
      FXObject:SetRelativeScale3D(Scale)
      FXObject:SetNiagaraVariableVec3("Scale", Scale)
    end
  end
  if IsAuthority(self) then
    self:OnBomb()
    self:AddTimer(0.1, function(...)
      Battle(self):RemoveEntity(self.Eid)
      self:EMActorDestroy(EDestroyReason.MechanismDead)
    end)
  end
end

function BP_BombBarrel_C:AuthorityInitInfo(Info)
  BP_BombBarrel_C.Super.AuthorityInitInfo(self, Info)
  self.SkillEffect = self.UnitParams.SkillEffect
  self.ActiveRange = self.UnitParams.ActiveRange
end

function BP_BombBarrel_C:CommonInitInfo(Info)
  BP_BombBarrel_C.Super.CommonInitInfo(self, Info)
  self.BombRadius = self.UnitParams.BombRadius
  self.BombDelay = self.UnitParams.BombDelay
  self.BombEffectId = self.UnitParams.EffectId
end

function BP_BombBarrel_C:OnBomb()
  self:BluePrintBomb()
  local ObjectTypes = TArray(EObjectTypeQuery)
  ObjectTypes:Add(EObjectTypeQuery.Pawn)
  ObjectTypes:Add(EObjectTypeQuery.MonsterHitedCapsule)
  ObjectTypes:Add(EObjectTypeQuery.BreakableItem)
  local ActorsToIgnore = TArray(AActor)
  ActorsToIgnore:Add(self)
  local OutActors = TArray(AActor)
  local bHit = UE4.UKismetSystemLibrary.SphereOverlapActors(self, self:K2_GetActorLocation(), self.BombRadius, ObjectTypes, nil, ActorsToIgnore, OutActors)
  for key, value in pairs(OutActors) do
    self.Super.PropAttack(self, value)
  end
end

function BP_BombBarrel_C:ShowDeath()
  self:AddTimer(self.BombDelay, self.ChangeToBomb, false, 0)
end

function BP_BombBarrel_C:OnDead(KillMineRoleEid, KillMineSkillId, DeathReason)
  BP_BombBarrel_C.Super.OnDead(self, KillMineRoleEid, KillMineSkillId, DeathReason)
end

return BP_BombBarrel_C
