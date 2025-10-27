require("UnLua")
local M = Class({
  "BluePrints.Item.Temple.BP_TouchBombBase_C"
})

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.MoveSpeed = self.UnitParams.MoveSpeed
  self.ChestInteractiveComponent:InitInteractiveComponent(self.Data.InteractiveId)
end

function M:ReceiveBeginPlay()
  M.Super.ReceiveBeginPlay(self)
  self.Sphere.OnComponentBeginOverlap:Add(self, self.SphereOverlap)
end

function M:OnActorReady(Info)
  M.Super.OnActorReady(self, Info)
  EventManager:FireEvent(EventID.OnSpawnTempleBomb, self.Eid, self.CreatorId)
end

function M:SphereOverlap(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex, bFromSweep, SweepResult)
  if self.IsActive then
    self:OnCrash()
    if self.SpecialEffect and self.SpecialEffect > 0 then
      Battle(self):ExecuteSkillEffect(self, self.SpecialEffect, nil, nil, self)
    end
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

function M:OnCrash()
  if not self.IsActive then
    return
  end
  self:SetActorEnableCollision(false)
  self:SetActorTickEnabled(false)
  self:K2_SetActorLocation(self.Mesh:K2_GetComponentLocation(), false, nil, false)
  self.Mesh:K2_SetRelativeLocation(FVector(0, 0, 0), false, nil, false)
  self:CrashEffect()
  self:OnEnd()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:TriggerGameModeEvent("OnBallBomb", self.UnitId, self.OwnerManualId or 0)
  end
  self.IsActive = false
end

function M:CrashEffect()
  if self.PlayerEffect and self.PlayerEffect > 0 then
    Battle(self):ExecuteSkillEffect(self, self.PlayerEffect, nil, nil, self)
  end
  if self.MonEffect and self.MonEffect > 0 then
    Battle(self):ExecuteSkillEffect(self, self.MonEffect, nil, nil, self)
  end
end

function M:GetCanOpen()
  if self.Player and self.Player.bHasAttachBomb then
    self.CanOpen = false
    return
  end
  self.CanOpen = true
end

function M:ActiveCombat()
  M.Super.ActiveCombat(self)
  self.ChestInteractiveComponent.bCanUsed = false
  self.Dir = self:GetDirection()
  self:OnInteractived()
  local Actors = self.Sphere:GetOverlappingActors()
  if Actors:Length() > 0 then
    self:OnCrash()
    if self.SpecialEffect and self.SpecialEffect > 0 then
      Battle(self):ExecuteSkillEffect(self, self.SpecialEffect, nil, nil, self)
    end
  end
end

function M:Lanuch(DeltaSeconds)
  if self.Dir then
    local Offset = self.Dir * self.MoveSpeed * DeltaSeconds
    local HitResult = UE.FHitResult()
    self.Mesh:K2_AddWorldOffset(Offset, true, HitResult, false)
    if HitResult.bBlockingHit then
      DebugPrint("zwk \230\146\158\229\136\176\231\137\169\228\189\147\229\129\156\228\184\139\230\157\165", HitResult.Actor:GetName())
      self:OnCrash()
      if HitResult.Actor and HitResult.Actor.IsPureMonster and HitResult.Actor:IsPureMonster() and self.SpecialEffect and self.SpecialEffect > 0 then
        Battle(self):ExecuteSkillEffect(self, self.SpecialEffect, nil, nil, self)
      end
    end
  end
end

function M:PreAttach(Player)
  if Player.bHasAttachBomb then
    self:ChangeState("Manual", 0, self.Data.FirstStateId)
    return false
  end
  Player.bHasAttachBomb = true
  EventManager:FireEvent(EventID.OnPlayerGetAttachBomb)
  self:OnHideEffect()
  self:OnInteractived()
  return true
end

function M:EndAttach(Player)
  Player.bHasAttachBomb = false
  EventManager:FireEvent(EventID.OnPlayerEndAttachBomb)
end

function M:OnPadLanuch(Dir)
  self.Dir = Dir
  self.Dir:Normalize()
  local Actors = self.Sphere:GetOverlappingActors()
  if Actors:Length() > 0 then
    self:OnCrash()
  end
  self.IsActive = true
end

function M:ChangeToNormalState()
  self:ChangeState("Manual", 0, self.NormalState)
end

function M:ChangeToForbiddenState()
  self:ChangeState("Manual", 0, self.ForbiddenState)
end

return M
