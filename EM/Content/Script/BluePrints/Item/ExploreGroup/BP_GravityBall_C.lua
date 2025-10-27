require("UnLua")
local M = Class({
  "BluePrints/Item/ExploreGroup/BP_DongGuoBreakableItem_C"
})

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.InitLoc = self.Ball:K2_GetComponentLocation()
  self.InitRot = self.Ball:K2_GetComponentRotation()
  self.CanUse = true
end

function M:ReceiveBeginPlay()
  self.Super.ReceiveBeginPlay(self)
  self.ResetRange.OnComponentEndOverlap:Add(self, self.OnEndOverlap)
end

function M:OnEndOverlap(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex)
  if OtherActor and OtherActor == self and self.CanUse then
    self.CanUse = false
    self:OnLeaveMaxDistance()
  end
end

function M:OnSpecialBulletHitted(SourceId)
  if not self.IsActive then
    return
  end
  if not self.CanUse then
    return
  end
  local Player = Battle(self):GetEntity(SourceId)
  if not Player then
    return
  end
  if 1 == self.MoveMode then
    local Impulse = (Player:K2_GetActorLocation() - self.Ball:K2_GetComponentLocation()) * self.Intensity
    self.Ball:AddImpulse(Impulse)
  elseif 2 == self.MoveMode then
    local ImpulseDir = Player:K2_GetActorLocation() - self.Ball:K2_GetComponentLocation()
    ImpulseDir:Normalize()
    local UpVector = FVector(0, 0, 1)
    local TorqueDir = UKismetMathLibrary.Cross_VectorVector(UpVector, ImpulseDir)
    local Torque = TorqueDir * self.Intensity
    self.Ball:AddTorqueInRadians(Torque, "", true)
  end
end

function M:OnComplete()
  self:ChangeState("Manual", 0, self.CompleteStateId)
  self.Ball:SetSimulatePhysics(false)
end

function M:ResetState()
  self.CanUse = true
  self.Ball:K2_SetWorldLocationAndRotation(self.InitLoc, self.InitRot, false, nil, false)
end

return M
