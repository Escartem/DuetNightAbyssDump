require("UnLua")
local MonAnimPawn = Class()

function MonAnimPawn:KeepSightOnTarget()
  if self.OwnerController == nil then
    return
  end
  local X, Y = self.OwnerController:GetInputMouseDelta()
  self:AddControllerYawInput(X)
  self:AddControllerPitchInput(-Y)
end

function MonAnimPawn:SetFocus()
  if self.IsTriggerFocus then
    self.Target:GetMovementComponent().bOrientRotationToMovement = false
    self.IsFocus = true
    local AllActors = TArray(AActor)
    UE4.UGameplayStatics.GetAllActorsOfClass(self, APlayerCharacter, AllActors)
    local PlayerActorTab = AllActors:ToTable()
    for _, v in pairs(PlayerActorTab) do
      self.Target.BBTarget = v
      break
    end
    self.GmMoveSpeed = 100
    self.IsTriggerFocus = false
  else
    self.Target:GetMovementComponent().bOrientRotationToMovement = true
    self.IsFocus = false
    self.Target.BBTarget = nil
    self.GmMoveSpeed = 400
    self.IsTriggerFocus = true
  end
end

function MonAnimPawn:UseSkillByActionMap(Mapping)
  if Mapping.KeyName ~= nil then
    local TempKeyMap = {
      One = 1,
      Two = 2,
      Three = 3,
      Four = 4,
      Five = 5,
      Six = 6,
      Seven = 7,
      Eight = 8,
      Nine = 9,
      Zero = 0
    }
    local RealId = self.Target:GetSeqSkill(TempKeyMap[Mapping.KeyName])
    if nil ~= RealId and self.Target:GetSkill(RealId) then
      self.Target:UpdateCdAndUseSkill(RealId)
      DebugPrint("UseSkill, Id:", RealId)
    end
  end
end

return MonAnimPawn
