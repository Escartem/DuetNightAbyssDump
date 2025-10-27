local BP_TempleRotator_C = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function BP_TempleRotator_C:CommonInitInfo(Info)
  BP_TempleRotator_C.Super.CommonInitInfo(self, Info)
  self.bCanRotate = true
  self.bInStage = false
  self.CurRotateEndIdx = 1
  self.CurIdx = -1
  self.Sequence = 0
  self.PositiveRotate = 1
  self.InitRotation = self:K2_GetActorRotation()
  self.TargetRotation = self.TargetRotArray[self.CurRotateEndIdx]
end

function BP_TempleRotator_C:ResetInfo()
  self.bCanRotate = true
  self.bInStage = false
  self.CurRotateEndIdx = 1
  self.CurIdx = -1
  self.PositiveRotate = 1
  self.Sequence = 0
  self:K2_SetActorRotation(self.InitRotation, false)
  self:ChangeState("Manual", 0, self.NormalStateId)
  if self.bAutoActive then
    self:ChangeState("Manual", 0, self.ActiveStateId)
  end
  self.TargetRotation = self.TargetRotArray[self.CurRotateEndIdx]
end

function BP_TempleRotator_C:OnActorReady(Info)
  BP_TempleRotator_C.Super.OnActorReady(self, Info)
  if self.bAutoActive then
    self:ChangeState("Manual", 0, self.ActiveStateId)
  end
end

function BP_TempleRotator_C:ReceiveTick(DeltaSeconds)
  self.Overridden.ReceiveTick(self, DeltaSeconds)
  if not self.IsActive then
    return
  end
  if not self.bCanRotate then
    return
  end
  if self.bAutoMove or self.bInStage or self.Sequence > 0 then
    self:RotateMechanism(DeltaSeconds, self.RotateSpeed, self.TargetRotation:ToQuat())
    if self:CheckTarget(self.TargetRotation:ToQuat()) then
      self.CurIdx = self.CurRotateEndIdx - 1
      self:AddRotateIdx()
      if self.bInStage then
        self.Sequence = self.Sequence - 1
        if self.Sequence <= 0 then
          self.Sequence = 0
          self.bInStage = false
          local GameMode = UE4.UGameplayStatics.GetGameMode(self)
          GameMode:GetDungeonComponent():SetIsRotateEnd(self.ManualItemId, true)
          GameMode:GetDungeonComponent():RotateEndEvent(self.ManualItemId)
        end
      end
    end
  end
end

function BP_TempleRotator_C:ActiveCombat(bFromGameMode)
  self:ChangeState("Manual", 0, self.ActiveStateId)
end

function BP_TempleRotator_C:InactiveCombat(bFromGameMode)
  self:ChangeState("Manual", 0, self.NormalStateId)
end

function BP_TempleRotator_C:StartRotate()
  if self.bAutoMove or self.bInStage then
    return
  end
  self.bInStage = true
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:GetDungeonComponent():SetIsRotateEnd(self.ManualItemId, false)
end

function BP_TempleRotator_C:SetSequence(Start, End)
  if self.bAutoMove then
    return
  end
  self.TargetRotation = self.TargetRotArray[Start + 1]
  self.CurRotateEndIdx = Start + 1
  if End <= Start then
    self.PositiveRotate = -1
  else
    self.PositiveRotate = 1
  end
  self.Sequence = math.abs(Start - End) + 1
end

function BP_TempleRotator_C:SetTargetRotation(Idx)
  self.TargetRotation = self.TargetRotArray[Idx + 1]
end

function BP_TempleRotator_C:OnEnterState(NowStateId)
  self.Overridden.OnEnterState(self, NowStateId)
  if NowStateId == self.ActiveStateId then
    self.IsActive = true
  else
    self.IsActive = false
  end
end

function BP_TempleRotator_C:GetRotateState()
  if self.bAutoMove then
    return -2
  end
  if self.bInStage then
    return self.CurRotateEndIdx - 1
  else
    return self.CurIdx
  end
end

function BP_TempleRotator_C:AddRotateIdx()
  self.CurRotateEndIdx = self.CurRotateEndIdx + 1 * self.PositiveRotate
  if self.CurRotateEndIdx > self.TargetRotArray:Length() then
    if 0 == self.RotateType then
      self.CurRotateEndIdx = 1
      self.bCanRotate = false
    elseif 1 == self.RotateType then
      self.CurRotateEndIdx = 1
    else
      self.CurRotateEndIdx = self.CurRotateEndIdx - 2 * self.PositiveRotate
      self.PositiveRotate = -1 * self.PositiveRotate
      if self.CurRotateEndIdx < 1 then
        self.CurRotateEndIdx = 0
        self.PositiveRotate = -1 * self.PositiveRotate
        self.TargetRotation = self.InitRotation
        return
      end
    end
    self.TargetRotation = self.TargetRotArray[self.CurRotateEndIdx]
  elseif self.CurRotateEndIdx < 1 and 2 == self.RotateType then
    self.CurRotateEndIdx = 0
    self.PositiveRotate = -1 * self.PositiveRotate
    self.TargetRotation = self.InitRotation
  else
    self.TargetRotation = self.TargetRotArray[self.CurRotateEndIdx]
  end
end

function BP_TempleRotator_C:OnBreakCountDown(SourceEid)
  self.Overridden.OnBreakCountDown(self, SourceEid)
end

return BP_TempleRotator_C
