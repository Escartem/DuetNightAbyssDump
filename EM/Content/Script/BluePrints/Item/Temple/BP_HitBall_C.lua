local M = Class("BluePrints/Item/CombatProp/BP_CombatPropBase_C")

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.DefaultCollisionType = self.SphereCollision:GetCollisionEnabled()
  self.OriginalIsOpen = self.IsOpen
  if self.IsOpen then
    self.Sphere:SetHiddenInGame(false)
    self.SphereCollision:SetCollisionEnabled(self.DefaultCollisionType)
    self:ShowFX()
  else
    self.Sphere:SetHiddenInGame(true)
    self.SphereCollision:SetCollisionEnabled(ECollisionEnabled.NoCollision)
    self:HideFX()
  end
end

function M:ActiveCombat(bFromGameMode)
  self:SetAttr("BreakCount", 99)
  DebugPrint("ActiveCombat BP_HitBall_C ==========================")
  self.IsOpen = true
  self.Sphere:SetHiddenInGame(false)
  self.SphereCollision:SetCollisionEnabled(self.DefaultCollisionType)
  self:ShowFX()
end

function M:InactiveCombat(bFromGameMode)
  DebugPrint("InactiveCombat BP_HitBall_C =============================")
  self.IsOpen = false
  self.Sphere:SetHiddenInGame(true)
  self.SphereCollision:SetCollisionEnabled(ECollisionEnabled.NoCollision)
  self:HideFX()
end

function M:InactiveCombatDestroy(bFromGameMode)
  DebugPrint("InactiveCombatDestroy BP_HitBall_C =============================")
  self.IsOpen = false
  self.Sphere:SetHiddenInGame(true)
  self.SphereCollision:SetCollisionEnabled(ECollisionEnabled.NoCollision)
  self:DestroyHideFX()
end

function M:ResetInfo()
  if self.OriginalIsOpen then
    self:ActiveCombat()
  else
    self:InactiveCombat()
  end
  self.CurTime = 0
end

function M:ReceiveTick(DeltaSeconds)
  if self.IsOpen == false then
    return
  end
  self.Distance = 0
  if 0 == self.MoveType then
    if self.CurTime > self.TotalTime then
      return
    end
    self.CurTime = self.CurTime + DeltaSeconds
    self.Distance = self.CurTime / self.TotalTime * self.Spline:GetSplineLength()
  elseif 1 == self.MoveType then
    self.CurTime = self.CurTime + DeltaSeconds
    if self.CurTime > self.TotalTime then
      self.CurTime = 0
    end
    self.Distance = self.CurTime / self.TotalTime * self.Spline:GetSplineLength()
  elseif 2 == self.MoveType then
    self.CurTime = self.CurTime + DeltaSeconds
    if self.CurTime > self.TotalTime * 2 then
      self.CurTime = 0
    end
    if self.CurTime < self.TotalTime then
      self.Distance = self.CurTime / self.TotalTime * self.Spline:GetSplineLength()
    else
      self.Distance = (self.TotalTime * 2 - self.CurTime) / self.TotalTime * self.Spline:GetSplineLength()
    end
  end
  self.Overridden.ReceiveTick(self, DeltaSeconds)
end

function M:SetBroken()
  if self.IsOpen == false then
    return
  end
  self:InactiveCombatDestroy()
  local CurGameMode = UE4.UGameplayStatics.GetGameMode(self)
  local DamageType = ""
  if 1 == self.DamageType then
    DamageType = "Positive"
  elseif 2 == self.DamageType then
    DamageType = "SpecialPositive"
  elseif 3 == self.DamageType then
    DamageType = "Negative"
  end
  local Factor = 1
  if self.ShowNegative then
    Factor = -1
  end
  if 1 == self.JumpWordType then
    CurGameMode:TriggerDungeonComponentFun("AddToTempleTime", self.JumpWordValue)
    if 4 ~= self.DamageType then
      self.JumpWordComponent:ShowNonCambatJumpWord(UE4.EJumpWordType.Time, DamageType, self.Sphere:K2_GetComponentLocation() + FVector(0, 0, 50), Factor * self.JumpWordValue)
    end
    DebugPrint("AddTime:", self.JumpWordValue, "ShowNegative:", self.ShowNegative)
  elseif 2 == self.JumpWordType then
    CurGameMode:TriggerDungeonComponentFun("AddToScore", self.JumpWordValue)
    if 4 ~= self.DamageType then
      self.JumpWordComponent:ShowNonCambatJumpWord(UE4.EJumpWordType.Score, DamageType, self.Sphere:K2_GetComponentLocation() + FVector(0, 0, 50), Factor * self.JumpWordValue)
    end
    DebugPrint("AddScore:", self.JumpWordValue, "ShowNegative:", self.ShowNegative)
  end
  local CurGameMode = UE4.UGameplayStatics.GetGameMode(self)
  if nil ~= CurGameMode then
    CurGameMode:TriggerGameModeEvent("OnHitBall", self)
    if nil ~= self.HitVentilatorManualItemId and nil ~= CurGameMode then
      local HitVentilator = CurGameMode.EMGameState.ManualActiveCombat:Find(self.HitVentilatorManualItemId)
      if nil ~= HitVentilator then
        HitVentilator:SetBroken()
      end
    end
  end
end

function M:OnBreakCountDown(SourceEid)
  self.Overridden.OnBreakCountDown(self, SourceEid)
  self:SetBroken()
end

return M
