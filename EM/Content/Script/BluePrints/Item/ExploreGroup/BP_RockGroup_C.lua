require("UnLua")
local M = Class({
  "BluePrints.Item.BP_CombatItemBase_C",
  "BluePrints.Common.TimerMgr"
})

function M:ReceiveBeginPlay()
  self.Super.ReceiveBeginPlay(self)
  self.FinishNum = 0
  self.CurRotate = 0
  self.HasWrongOne = false
end

function M:OnActorReady(Info)
  M.Super.OnActorReady(self, Info)
  EventManager:AddEvent(EventID.OnRingRockFinish, self, self.OnRingRockFinish)
end

function M:ReceiveTick(DeltaSeconds)
  self.Overridden.ReceiveTick(self, DeltaSeconds)
  if self.IsActive then
    local Rotate = self.RotateSpeed * DeltaSeconds * self.RotateDir
    self.CurRotate = self.CurRotate + Rotate
    for _, v in pairs(self.Rocks) do
      v:K2_AddActorWorldRotation(FRotator(0, Rotate, 0), false, nil, false)
    end
    if self.CurRotate >= self.RotateNum * 360.0 then
      self:RotateEnd()
      return
    end
  end
end

function M:OnRingRockFinish(IsRightOne)
  if not IsRightOne then
    self.HasWrongOne = true
  end
  self.FinishNum = self.FinishNum + 1
  if self.FinishNum ~= self.RightNums then
    return
  end
  if not self.HasWrongOne then
    self:ChangeState("Manual", 0, self.FinishStateId)
  else
    for _, v in pairs(self.Rocks) do
      v.Finish = false
      v.Energy = 0
      if v.AlreadyPull then
        v.IsInReset = true
        v:StartReset()
        v.AlreadyPull = false
      end
    end
    self.FinishNum = 0
    self.HasWrongOne = false
  end
end

function M:ActiveCombat()
  M.Super.ActiveCombat(self)
  for _, v in pairs(self.Rocks) do
    v.CanPull = false
    v.Finish = false
    v.Energy = 0
    if v.AlreadyPull then
      v.IsInReset = true
      v:StartReset()
      v.AlreadyPull = false
    end
  end
  self.FinishNum = 0
  self.HasWrongOne = false
  self:AddTimer(self.ResetRockTime, self.OnActive, false, 0)
end

function M:DeActiveCombat()
  M.Super.DeActiveCombat(self)
end

function M:OnActive()
  self.CurRotate = 0
  local CurRot = self.Rocks[1]:K2_GetActorRotation()
  self.TargetRotation = FRotator(CurRot.Pitch, CurRot.Yaw + tonumber(string.format("%.1f", self.RotateNum)) % 1 * 360.0, CurRot.Roll)
  self:SetActorTickEnabled(true)
end

function M:RotateEnd()
  self:SetActorTickEnabled(false)
  for _, v in pairs(self.Rocks) do
    v:K2_SetActorRotation(self.TargetRotation, false, nil, false)
  end
  self:OnDeActive()
end

function M:OnDeActive()
  self:ChangeState("Manual", 0, self.InitStateId)
  for _, v in pairs(self.Rocks) do
    v.CanPull = true
  end
end

function M:OnEnterState(NowStateId)
  self.Overridden.OnEnterState(self, NowStateId)
  if NowStateId == self.FinishStateId then
    for _, v in pairs(self.Rocks) do
      v.CanPull = false
      v.Finish = false
      v.Energy = 0
      if v.AlreadyPull then
        v.IsInReset = true
        v:StartReset()
        v.AlreadyPull = false
      end
    end
  end
end

return M
