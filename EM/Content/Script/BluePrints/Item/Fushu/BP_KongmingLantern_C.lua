require("UnLua")
local BP_KongmingLantern_C = Class({
  "BluePrints.Item.Fushu.BP_FushuItemBase_C"
})

function BP_KongmingLantern_C:CommonInitInfo(Info)
  BP_KongmingLantern_C.Super.CommonInitInfo(self, Info)
  self.RestoreCD = self.UnitParams.RestoreCD
  self.SkillEffectHp = self.UnitParams.SkillEffectHp
  self.SkillEffectSp = self.UnitParams.SkillEffectSp
  self.RestoreHpCD = self.UnitParams.RestoreHpCD
  self.RestoreSpCD = self.UnitParams.RestoreSpCD
  self.HpMax = self.UnitParams.HpMax
  self.SpMax = self.UnitParams.SpMax
  self.HpActiveTime = self.UnitParams.HpActiveTime
  self.SpActiveTime = self.UnitParams.SpActiveTime
  self.IsRedLight = self.UnitParams.IsRedLight
  self.NotReduce = self.UnitParams.NotReduce
  self:ChangeColor(self.IsRedLight)
  self.LightColorRed = self.IsRedLight
  if self.IsRedLight then
    self.RestoreRemain = self.HpMax
    self.MaxTimes = self.HpActiveTime / 0.02
  else
    self.RemoveTag = true
    self.RestoreRemain = self.SpMax
    self.MaxTimes = self.SpActiveTime / 0.02
  end
  self.CurTimes = self.MaxTimes
  self.CanRestorePlayer = true
end

function BP_KongmingLantern_C:ReceiveBeginPlay()
  BP_KongmingLantern_C.Super.ReceiveBeginPlay(self)
  self.InitScale = self.Platform:K2_GetComponentScale()
  self.Platform:SetVisibility(false, false)
  self.Platform:SetCollisionEnabled(0)
end

function BP_KongmingLantern_C:OnActorReady(Info)
  BP_KongmingLantern_C.Super.OnActorReady(self, Info)
end

function BP_KongmingLantern_C:OnPlayerIn()
  self:OnPlayerEnterCheckBuff(self.OverlappingPlayer)
  if self.IsActive and self.CanRestorePlayer then
    self:RestorePlayer()
    self.CanRestorePlayer = false
    if self.IsRedLight then
      self:AddTimer(self.RestoreHpCD, self.RestorePlayer, true, 0, "RestorePlayer")
    else
      self:AddTimer(self.RestoreSpCD, self.RestorePlayer, true, 0, "RestorePlayer")
    end
  end
end

function BP_KongmingLantern_C:OnPlayerOut()
  self:OnPlayerLeaveCheckBuff(self.OverlappingPlayer)
end

function BP_KongmingLantern_C:OnWindBellActive()
  self.Lantern:SetVisibility(true, false)
  self.Lantern:SetCollisionEnabled(3)
  self.HitedCollision:SetCollisionEnabled(1)
end

function BP_KongmingLantern_C:OnBreakCountDown(SourceEid)
  if not self.IsActive then
    self:ChangeState("Hit", SourceEid)
  end
  if not self.IsRedLight then
    EventManager:FireEvent(EventID.OnKongmingLanternBreak, self.CreatorId)
  end
end

function BP_KongmingLantern_C:OnEnterState(NowStateId)
  self.Overridden.OnEnterState(self, NowStateId)
  if NowStateId == self.NormalStateId then
    self.IsActive = false
    self:OnLanternDeActive()
  else
    self.IsActive = true
    self:OnLanternActive()
  end
end

function BP_KongmingLantern_C:OnGeneratePlatform()
  self.Platform:SetVisibility(true, false)
  self.Platform:SetCollisionEnabled(1)
  self:OnPlatformGenerate()
  local Lanterns = self:CheckFlowerLanterns()
  for _, v in pairs(Lanterns) do
    v:OnFlowerLanternActive(self.IsRedLight)
  end
  local Ships = self:CheckLanternShips()
  for _, v in pairs(Ships) do
    v:OnFlowerLanternActive(self.IsRedLight)
  end
  if not self.NotReduce then
    self:AddTimer(0.02, self.ChangeScale, true, 0, "ChangeScale")
  end
  if self.IsRedLight then
    self:AddTimer(self.RestoreHpCD, self.RestorePlayer, true, -self.RestoreHpCD, "RestorePlayer")
  else
    self:AddTimer(self.RestoreSpCD, self.RestorePlayer, true, -self.RestoreSpCD, "RestorePlayer")
  end
end

function BP_KongmingLantern_C:OnGenerateLantern()
end

function BP_KongmingLantern_C:OnLanternActive()
  self.HitedCollision:SetCollisionEnabled(0)
  self.Lantern:SetVisibility(false, false)
  self.Lantern:SetCollisionEnabled(0)
  self:OnLanternBreak()
  if self.NotReduce then
    self:OnGeneratePlatform()
  else
    self:AddTimer(self.GeneratePlatformTime, self.OnGeneratePlatform, false, 0)
  end
  self:OnPlayerEnterCheckBuff(self.OverlappingPlayer)
  self.CanRestorePlayer = true
end

function BP_KongmingLantern_C:OnLanternDeActive()
  self.Platform:SetWorldScale3D(FVector(self.InitScale.X, self.InitScale.Y, self.InitScale.Z))
  self.Sphere:SetWorldScale3D(FVector(1, 1, 1))
  self.Lantern:SetVisibility(true, false)
  self.Lantern:SetCollisionEnabled(3)
  self.HitedCollision:SetCollisionEnabled(1)
  self.Platform:SetVisibility(false, false)
  self.Platform:SetCollisionEnabled(0)
  if self.IsRedLight then
    self.RestoreRemain = self.HpMax
  else
    self.RestoreRemain = self.SpMax
  end
  self:OnPlayerLeaveCheckBuff(self.OverlappingPlayer)
end

function BP_KongmingLantern_C:OnFlowerLanternIn(Lantern)
  Lantern:OnFlowerLanternActive(self.IsRedLight)
end

function BP_KongmingLantern_C:OnFlowerLanternOut(Lantern)
  Lantern:OnFlowerLanternDeActive()
end

function BP_KongmingLantern_C:ChangeScale()
  self.CurTimes = self.CurTimes - 1
  if self.CurTimes <= 0 then
    self:RemoveTimer("ChangeScale")
    self.CurTimes = self.MaxTimes
    self:ChangeState("Manual", 0, self.NormalStateId)
    self:OnRangeDisappear()
    return
  end
  local NewScale = self.CurTimes / self.MaxTimes
  self.Platform:SetWorldScale3D(FVector(self.InitScale.X * NewScale, self.InitScale.Y * NewScale, self.InitScale.Z))
  self.Sphere:SetWorldScale3D(FVector(NewScale, NewScale, NewScale))
end

function BP_KongmingLantern_C:RestorePlayer()
  if not self.IsActive or self.RestoreRemain <= 0 then
    self:RemoveTimer("RestorePlayer")
    return
  end
  if not self.OverlappingPlayer then
    self.CanRestorePlayer = true
    return
  end
  self:UseEffect()
  self.CanRestorePlayer = false
end

function BP_KongmingLantern_C:UseEffect()
  if self.SkillEffectHp and self.SkillEffectHp > 0 and self.IsRedLight then
    local PreRestore = self.OverlappingPlayer:GetAttr("Hp")
    self.Super.PropUseSkill(self, self.SkillEffectHp, self.OverlappingPlayer)
    local EndRestore = self.OverlappingPlayer:GetAttr("Hp")
    self.RestoreRemain = self.RestoreRemain - (EndRestore - PreRestore)
  elseif self.SkillEffectSp and self.SkillEffectSp > 0 and not self.IsRedLight then
    local PreRestore = self.OverlappingPlayer:GetAttr("Sp")
    self.Super.PropUseSkill(self, self.SkillEffectSp, self.OverlappingPlayer)
    local EndRestore = self.OverlappingPlayer:GetAttr("Sp")
    self.RestoreRemain = self.RestoreRemain - (EndRestore - PreRestore)
  end
end

return BP_KongmingLantern_C
