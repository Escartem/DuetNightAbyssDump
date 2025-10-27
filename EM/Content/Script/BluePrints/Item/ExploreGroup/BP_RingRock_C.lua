require("UnLua")
local M = Class({
  "BluePrints.Item.ExploreGroup.BP_DongGuoBreakableItem_C",
  "BluePrints.Common.TimerMgr"
})

function M:ReceiveBeginPlay()
  self.Super.ReceiveBeginPlay(self)
  self.InitLoc = self.Mesh:K2_GetComponentLocation()
  self.EndLoc = self.InitLoc + self.Arrow:GetForwardVector() * self.MaxDistance
  self.Finish = false
  self.AlreadyPull = false
  self.IsInReset = false
  self.InitForward = self.Arrow:GetForwardVector()
end

function M:ReceiveTick(DeltaSeconds)
  self.Overridden.ReceiveTick(self, DeltaSeconds)
  local CurLocation = self.Rock:K2_GetComponentLocation()
  if not self.IsInReset then
    local AimLocation = CurLocation + self.Arrow:GetForwardVector() * self.PullSpeed * DeltaSeconds
    if UE4.UKismetMathLibrary.Vector_Distance(self.InitLoc, AimLocation) >= self.MaxDistance then
      self.Rock:K2_SetWorldLocation(self.EndLoc, false, nil, false)
      self.Finish = true
      self:SetActorTickEnabled(false)
      EventManager:FireEvent(EventID.OnRingRockFinish, self.IsRightOne)
    else
      self.Rock:K2_SetWorldLocation(AimLocation, false, nil, false)
    end
  else
    local AimLocation = CurLocation - self.Arrow:GetForwardVector() * self.ResetSpeed * DeltaSeconds
    if UE4.UKismetMathLibrary.Vector_Distance(self.InitLoc, AimLocation) <= self.MinDistance then
      self.Rock:K2_SetWorldLocation(self.InitLoc, false, nil, false)
      self.IsInReset = false
      self:SetActorTickEnabled(false)
    else
      self.Rock:K2_SetWorldLocation(AimLocation, false, nil, false)
    end
  end
end

function M:CheckPlayerFaceToAim(SourceId)
  if self.IsInReset then
    return false
  end
  local Player = Battle(self):GetEntity(SourceId)
  if Player and Player.IsPlayer and Player:IsPlayer() and not Player:IsDead() then
    local ForwardVector = self.Arrow:GetForwardVector()
    local DirectionVector = Player:K2_GetActorLocation() - self.Rock:K2_GetComponentLocation()
    DirectionVector:Normalize()
    local Dot = UE4.UKismetMathLibrary.Dot_VectorVector(ForwardVector, DirectionVector)
    local InitDot = UE4.UKismetMathLibrary.Dot_VectorVector(self.InitForward, DirectionVector)
    if Dot > 0 and InitDot > 0 then
      return true
    end
  end
  return false
end

function M:OnValidHit()
  local function ResetState()
    self.Energy = 0
  end
  
  if self.Energy < self.MaxEnergy then
    self:AddTimer(self.WaitTime, ResetState, false, 0, "ResetState")
  end
end

function M:OnMaxEnergyHit()
  self:RemoveTimer("ResetState")
  if self.Finish then
    return
  end
  if self.IsInReset then
    return
  end
  self:SetActorTickEnabled(true)
  self.AlreadyPull = true
  
  local function DisableTick()
    if self.IsInReset then
      return
    end
    self:SetActorTickEnabled(false)
  end
  
  self:AddTimer(self.SpecialWaitTime, DisableTick, false, 0, "DisableTick")
end

function M:StartReset()
  self:SetActorTickEnabled(true)
end

return M
