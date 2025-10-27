require("UnLua")
local M = Class({
  "BluePrints.Item.Temple.BP_TouchBombBase_C"
})

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.MoveSpeed = self.UnitParams.MoveSpeed
  self.ExplosionTime = self.UnitParams.ExplosionTime
  self.ChestInteractiveComponent:InitInteractiveComponent(self.Data.InteractiveId)
  self.Dir = nil
end

function M:ReceiveBeginPlay()
  M.Super.ReceiveBeginPlay(self)
  self.Sphere.OnComponentBeginOverlap:Add(self, self.SphereOverlap)
end

function M:SphereOverlap(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex, bFromSweep, SweepResult)
  if self.IsActive and self.OnHitMonsterEffect and self.OnHitMonsterEffect > 0 and not OtherActor:IsDead() then
    self.Super.PropUseSkill(self, self.OnHitMonsterEffect, OtherActor)
  end
end

function M:ReceiveTick(DeltaSeconds)
  self.Overridden.ReceiveTick(self, DeltaSeconds)
  self:ShowArrowDirection()
  if not self.IsActive then
    return
  end
  self:Lanuch(DeltaSeconds)
end

function M:TimerCrash()
  self:SetActorEnableCollision(false)
  self:SetActorTickEnabled(false)
  self:K2_SetActorLocation(self.Mesh:K2_GetComponentLocation(), false, nil, false)
  self.Mesh:K2_SetRelativeLocation(FVector(0, 0, 0), false, nil, false)
  self:CrashEffect()
  self:EMActorDestroy(EDestroyReason.MechanismDead)
  self.IsActive = false
end

function M:GetCanOpen()
  self.CanOpen = true
end

function M:ActiveCombat()
  M.Super.ActiveCombat(self)
  self.ChestInteractiveComponent.bCanUsed = false
  self.Dir = self:GetDirection()
  self:AddTimer(self.ExplosionTime, self.TimerCrash, false, 0, "TimerCrash")
  self:OnInteractived()
  local Actors = self.Sphere:GetOverlappingActors()
  if Actors:Length() > 0 and self.OnHitMonsterEffect and self.OnHitMonsterEffect > 0 then
    for i = 1, Actors:Length() do
      if not Actors[i]:IsDead() then
        self.Super.PropUseSkill(self, self.OnHitMonsterEffect, Actors[i])
      end
    end
  end
end

function M:Lanuch(DeltaSeconds)
  if self.Dir then
    local Offset = self.Dir * self.MoveSpeed * DeltaSeconds
    local HitResult = UE.FHitResult()
    self.Mesh:K2_AddWorldOffset(Offset, true, HitResult, false)
    if HitResult.bBlockingHit then
      DebugPrint("zwk \230\146\158\229\136\176\231\137\169\228\189\147\229\141\179\229\176\134\229\143\141\229\188\185", HitResult.Actor:GetName())
      local Direction = UKismetMathLibrary.GetReflectionVector(self.Dir, HitResult.ImpactNormal)
      Direction.Z = 0
      Direction:Normalize()
      self.Dir = Direction
    end
  end
end

return M
