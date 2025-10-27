require("UnLua")
local BP_RockTrap_C = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function BP_RockTrap_C:AuthorityInitInfo(Info)
  BP_RockTrap_C.Super.AuthorityInitInfo(self, Info)
  self.Skill_Damage = self.UnitParams.SkillEffect or 900002
  self.Effect_Warning = self.UnitParams.WarningEffect or 900001
  self.IsActive = false
end

function BP_RockTrap_C:CommonInitInfo(Info)
  self.WarningTime = self.UnitParams.WarningTime or 5
  self.SetupTime = self.UnitParams.SetupTime or 1
  self.SkillRadius = self.UnitParams.SkillRadius or 200
  self.ShakeRange = self.UnitParams.ShakeRange or 10000
  self.InitSpeed = self.UnitParams.InitSpeed or 0
  self.CrashTrace = self.Crash
  self:CalDropSpeed()
  self.ActiveBox:SetCollisionEnabled(1)
  BP_RockTrap_C.Super.CommonInitInfo(self, Info)
end

function BP_RockTrap_C:CalDropSpeed()
  local StartPos = self:K2_GetActorLocation()
  local bHit, HitResult = self:GetFloor()
  local MoveZ = 1400
  self.FloorPos = FVector(StartPos.X, StartPos.Y, StartPos.Z - MoveZ)
  if bHit then
    self.FloorPos = HitResult.Location
    local MoveZ = StartPos.Z - HitResult.Location.Z
  end
  self.DropAcceleration = FVector(0, 0, -1000)
  self:SetMovementParam(FVector(0, 0, -self.InitSpeed), self.DropAcceleration)
  self.DropTime = (-self.InitSpeed + math.sqrt(self.InitSpeed * self.InitSpeed + 2 * -self.DropAcceleration.Z * MoveZ)) / -self.DropAcceleration.Z
end

function BP_RockTrap_C:SetActiveType()
  self.ActiveType = "PlayerAttack"
end

function BP_RockTrap_C:OnActiveBoxOverlap()
  if not self.IsActive then
    self.IsActive = true
    self:ActiveCombat()
  end
end

function BP_RockTrap_C:OnBreakCountDown(SourceEid)
  if not self.IsActive then
    self.IsActive = true
    self:ActiveCombat()
  end
end

function BP_RockTrap_C:ActiveOnServer(StateId)
  if self.IsActive then
    self:AddTimer(self.SetupTime, self.StartDrop, false)
  end
end

function BP_RockTrap_C:OnActiveStateChange(StateId)
  if self.IsActive then
    self:PlaySmokeEffect()
  end
end

function BP_RockTrap_C:StartDrop()
  if self.DropTime < self.WarningTime then
    self:PlayWarningEffect()
    self:AddTimer(self.WarningTime - self.DropTime, self.Droping, false)
  elseif self.DropTime == self.WarningTime then
    self:PlayWarningEffect()
    self:Droping()
  else
    self:Droping()
    self:AddTimer(self.DropTime - self.WarningTime, self.PlayWarningEffect, false)
  end
end

function BP_RockTrap_C:PlaySmokeEffect()
  if not IsAuthority(self) or IsStandAlone(self) then
    local FXObject = self.FXComponent:PlayFX(self.SmokeFX, self.Mesh, self:GetCurrentModelInfo().DamageFXSockets[1], self.Smoke:K2_GetComponentLocation(), FRotator(0, 0, 0), true, nil)
    FXObject:SetRelativeScale3D(self.SmokeFXScale)
    self:OnPreFall()
  end
end

function BP_RockTrap_C:PlayWarningEffect()
  if not IsAuthority(self) or IsStandAlone(self) then
    self.FXComponent:PlayFxDecalByID(self.Effect_Warning, self.FloorPos, true)
  end
end

function BP_RockTrap_C:Droping()
  if not IsAuthority(self) or IsStandAlone(self) then
    self:OnFallDown()
  end
  self.bIsDroping = true
end

function BP_RockTrap_C:OnCrash(HitLoc)
  if not self.IsActive then
    return
  end
  self:TryToShakeCamera()
  self:OnPreDestroy()
  local TargetArray = self:FindTarget(HitLoc)
  for i = 1, TargetArray:Length() do
    self:PropUseSkill(self.Skill_Damage, TargetArray[i])
  end
  local FXObject = self.FXComponent:PlayFX(self.CrashFX, self.Mesh, self:GetCurrentModelInfo().DamageFXSockets[1], self.Crash:K2_GetComponentLocation(), FRotator(0, 0, 0), true, nil)
  FXObject:SetRelativeScale3D(self.CrashFXScale)
  self:EMActorDestroy(EDestroyReason.MechanismDead)
  self.IsActive = false
end

function BP_RockTrap_C:TryToShakeCamera()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local Result = TArray(AActor)
  for _, Player in pairs(GameMode:GetAllPlayer()) do
    local Dis = (Player:K2_GetActorLocation() - self:K2_GetActorLocation()):Size()
    if Dis < self.ShakeRange then
      Result:Add(Player)
    end
  end
  self:CameraShake(Result)
end

AssembleComponents(BP_RockTrap_C)
return BP_RockTrap_C
