local M = Class("BluePrints.Item.BP_CombatItemBase_C")

function M:AuthorityInitInfo(Info)
  M.Super.AuthorityInitInfo(self, Info)
  if 0 ~= self.GroupId then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    GameMode:TriggerDungeonComponentFun("AddHitVentilator", self.GroupId, self.ManualItemId)
  end
  self.OriginalSpeed = self.Speed
end

function M:ReceiveTick(DeltaSeconds)
  self.Overridden.ReceiveTick(self, DeltaSeconds)
end

function M:OnPlayerEnter(Player)
  if IsValid(Player) == false then
    return
  end
  self.IsPlayerEnter = true
  self:ActiveHitBall()
end

function M:OnPlayerLeave(Player)
  if IsValid(Player) == false then
    return
  end
  self.IsPlayerEnter = false
  self:InactiveHitBall()
end

function M:ActiveCombat(bFromGameMode)
  DebugPrint("ActiveCombat BP_HitVentilator_C ==========================")
  self.IsOpen = true
end

function M:InactiveCombat(bFromGameMode)
  DebugPrint("InactiveCombat BP_HitVentilator_C =============================")
  self.IsOpen = false
end

function M:ResetInfo()
  self.Overridden.ResetInfo(self)
  self:InactiveCombat()
  self.IsBroken = false
  self.IsPlayerEnter = false
  self:InactiveHitBall()
  self.Speed = self.OriginalSpeed
  local CurGameMode = UE4.UGameplayStatics.GetGameMode(self)
  CurGameMode:TriggerDungeonComponentFun("HitVentilatorReset", self.GroupId, self.ManualItemId)
end

function M:ActiveHitBall()
  if self.IsOpen == false or false == self.IsPlayerEnter or self.IsBroken then
    return
  end
  local CurGameMode = UE4.UGameplayStatics.GetGameMode(self)
  if nil == CurGameMode then
    return
  end
  local HitBall = CurGameMode.EMGameState.ManualActiveCombat:Find(self.HitBallManualItemId)
  if nil ~= HitBall then
    HitBall:ActiveCombat()
    HitBall.HitVentilatorManualItemId = self.ManualItemId
  else
    DebugPrint("ActiveHitBall is nil,ManualItemId is ", self.HitBallManualItemId)
  end
end

function M:InactiveHitBall()
  if self.IsOpen == false or self.IsPlayerEnter == true or self.IsBroken then
    return
  end
  local CurGameMode = UE4.UGameplayStatics.GetGameMode(self)
  if nil == CurGameMode then
    return
  end
  local HitBall = CurGameMode.EMGameState.ManualActiveCombat:Find(self.HitBallManualItemId)
  if nil ~= HitBall then
    HitBall:InactiveCombat()
  else
    DebugPrint("InactiveHitBall is nil,ManualItemId is ", self.HitBallManualItemId)
  end
end

function M:SetBroken()
  if self.IsBroken == true then
    return
  end
  self.IsBroken = true
  local CurGameMode = UE4.UGameplayStatics.GetGameMode(self)
  CurGameMode:TriggerDungeonComponentFun("HitVentilatorBroken", self.GroupId, self.ManualItemId)
end

function M:AddSpeed(AddSpeed)
  self.Speed = self.Speed + AddSpeed
end

return M
