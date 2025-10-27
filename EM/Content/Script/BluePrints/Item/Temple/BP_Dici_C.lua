local M = Class("BluePrints.Item.BP_CombatItemBase_C")

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.OriginalIsOpen = self.IsOpen
  self.originalPosX = self.SM_Dici.RelativeLocation.X
  self.originalPosY = self.SM_Dici.RelativeLocation.Y
  self.originalPosZ = self.SM_Dici.RelativeLocation.Z
  self.CurTime = 0
  if self.IsOpen then
    self:ActiveCombat()
  end
end

function M:ActiveCombat(bFromGameMode)
  DebugPrint("ActiveCombat Dici ==========================")
  self.IsOpen = true
end

function M:InactiveCombat(bFromGameMode)
  DebugPrint("InactiveCombat Dici =============================")
  self.IsOpen = false
end

function M:ResetInfo()
  self.IsOpen = self.OriginalIsOpen
  self.CurTime = 0
  local CurPos = FVector(self.originalPosX, self.originalPosY, self.originalPosZ)
  self.SM_Dici:K2_SetRelativeLocation(CurPos, false, nil, false)
end

function M:OnPlayerEnter(Player)
  DebugPrint(Player:GetName(), "Player Enter Dici =============================")
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  GameMode:TriggerFallingCallable(Player, self.SM_Dici:K2_GetComponentToWorld(), 10000, false)
end

function M:ReceiveTick(DeltaSeconds)
  if self.IsOpen == false then
    return
  end
  self.CurTime = self.CurTime + DeltaSeconds
  if self.CurTime < self.StayTime then
    self.IsMovingDown = false
    self.IsMovingUp = false
  elseif self.CurTime < self.StayTime + self.MoveTime + DeltaSeconds then
    if self.IsMovingDown ~= true then
      self.IsMovingDown = true
      self:StartMoveDown()
    end
    local rate = (self.CurTime - self.StayTime) / self.MoveTime
    if rate > 1 then
      rate = 1
    end
    local OffsetZ = rate * self.MoveOffsetZ
    local CurPos = FVector(self.originalPosX, self.originalPosY, self.originalPosZ - OffsetZ)
    self.SM_Dici:K2_SetRelativeLocation(CurPos, false, nil, false)
  elseif self.CurTime < self.StayTime * 2 + self.MoveTime then
    self.IsMovingDown = false
    self.IsMovingUp = false
  elseif self.CurTime < self.StayTime * 2 + self.MoveTime * 2 + DeltaSeconds then
    local rate = (self.CurTime - self.StayTime * 2 - self.MoveTime) / self.MoveTime
    if self.IsMovingUp ~= true then
      self.IsMovingUp = true
      self:StartMoveUp()
    end
    if rate > 1 then
      rate = 1
    end
    local OffsetZ = rate * self.MoveOffsetZ
    local CurPos = FVector(self.originalPosX, self.originalPosY, self.originalPosZ + OffsetZ - self.MoveOffsetZ)
    self.SM_Dici:K2_SetRelativeLocation(CurPos, false, nil, false)
  else
    self.CurTime = 0
    self.IsMovingDown = false
    self.IsMovingUp = false
  end
end

return M
