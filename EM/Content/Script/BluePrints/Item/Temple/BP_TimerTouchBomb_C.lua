require("UnLua")
local M = Class({
  "BluePrints.Item.Temple.BP_TouchBombBase_C"
})

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.MoveSpeed = self.UnitParams.MoveSpeed
  self.MaxMoveTime = self.UnitParams.MaxMoveTime
  self.ExplosionTime = self.UnitParams.ExplosionTime
  self.ChestInteractiveComponent:InitInteractiveComponent(self.Data.InteractiveId)
  self.InitStateId = self.Data.FirstStateId
  self.Dir = nil
end

function M:ReceiveBeginPlay()
  M.Super.ReceiveBeginPlay(self)
  self.Sphere.OnComponentBeginOverlap:Add(self, self.SphereOverlap)
end

function M:SphereOverlap(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex, bFromSweep, SweepResult)
  if self.IsActive then
    self:ChangeState("Manual", 0, self.InitStateId)
  end
end

function M:OnActorReady(Info)
  M.Super.OnActorReady(self, Info)
  self:AddTimer(self.ExplosionTime, self.TimerCrash, false)
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

function M:OnMoveTimeEnd()
  self:ChangeState("Manual", 0, self.InitStateId)
end

function M:GetCanOpen()
  self.CanOpen = true
end

function M:ActiveCombat()
  M.Super.ActiveCombat(self)
  self.ChestInteractiveComponent.bCanUsed = false
  self.Dir = self:GetDirection()
  self:AddTimer(self.MaxMoveTime, self.OnMoveTimeEnd, false, 0, "OnMoveTimeEnd")
  self:OnInteractived()
  local Actors = self.Sphere:GetOverlappingActors()
  if Actors:Length() > 0 then
    self:ChangeState("Manual", 0, self.InitStateId)
  end
end

function M:DeActiveCombat()
  M.Super.DeActiveCombat(self)
  self.ChestInteractiveComponent.bCanUsed = true
end

function M:Lanuch(DeltaSeconds)
  if self.Dir then
    local Offset = self.Dir * self.MoveSpeed * DeltaSeconds
    local HitResult = UE.FHitResult()
    self.Mesh:K2_AddWorldOffset(Offset, true, HitResult, false)
    if HitResult.bBlockingHit then
      DebugPrint("zwk \230\146\158\229\136\176\231\137\169\228\189\147\229\129\156\228\184\139\230\157\165", HitResult.Actor:GetName())
      self:ChangeState("Manual", 0, self.InitStateId)
      self:RemoveTimer("OnMoveTimeEnd")
    end
  end
end

return M
