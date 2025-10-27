require("UnLua")
local M = Class({
  "BluePrints.Item.Fushu.BP_FushuItemBase_C"
})

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.InteractiveSkillId = self.UnitParams.InteractiveSkillId
  self.SkillEffectCyan = self.UnitParams.SkillEffectCyan
  self.SkillEffectCyanCd = self.UnitParams.SkillEffectCyanCd
  self.NpcSkillEffect = self.UnitParams.NpcSkillEffect
  self.NpcSkillCd = self.UnitParams.NpcSkillCd
  self.NpcHpThreshold = self.UnitParams.NpcHpThreshold
  self.ActiveTime = self.UnitParams.ActiveTime
  self.RestoreTime = self.UnitParams.RestoreTime
  self.MinSize = self.UnitParams.MinSize
  self.ChestInteractiveComponent:InitInteractiveComponent(self.Data.InteractiveId)
  self.Npc = nil
  self.MaxTimes = self.ActiveTime / 0.02
  self.CurTimes = self.MaxTimes
  self.MinTimes = self.MaxTimes * self.MinSize
  self.LastNpcHpRate = 1
  self.NowNpcHpRate = 1
  self.LowThanThreshold = false
  self.MaxRestoreTimes = self.RestoreTime / 0.02
  self.CurRestoreTime = 0
  self.CanRestorePlayer = true
end

function M:ReceiveBeginPlay()
  M.Super.ReceiveBeginPlay(self)
  self.Platform:SetVisibility(false, false)
  self.InitScalePlatform = self.Platform:K2_GetComponentScale()
  self.InitScaleSphere = self.Sphere:K2_GetComponentScale()
  self.Sphere.OnComponentBeginOverlap:Add(self, self.OnBeginOverlap)
  self.Sphere.OnComponentEndOverlap:Add(self, self.OnEndOverlap)
end

function M:OnActorReady(Info)
  M.Super.OnActorReady(self, Info)
  EventManager:AddEvent(EventID.OnMonsterAlive, self, self.OnMonsterAlive)
  EventManager:AddEvent(EventID.OnMonsterClear, self, self.OnMonsterClear)
end

function M:OnBeginOverlap(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex, bFromSweep, SweepResult)
  if OtherActor.IsPlayer and OtherActor:IsPlayer() then
    self.OverlappingPlayer = OtherActor
    self:OnPlayerEnterCheckBuff(OtherActor)
    if self.IsActive and self.CanRestorePlayer then
      self:RestorePlayer()
      self.CanRestorePlayer = false
      if self.SkillEffectCyan and self.SkillEffectCyan > 0 and self.SkillEffectCyanCd and self.SkillEffectCyanCd > 0 then
        self:AddTimer(self.SkillEffectCyanCd, self.RestorePlayer, true, 0, "RestorePlayer")
      end
    end
  end
end

function M:OnEndOverlap(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex)
  if OtherActor.IsPlayer and OtherActor:IsPlayer() then
    self.OverlappingPlayer = nil
    self:OnPlayerLeaveCheckBuff(OtherActor)
  end
end

function M:OnMonsterAlive()
  self:ChangeState("Manual", 0, self.PauseStateId)
end

function M:OnMonsterClear()
  if self.StateId == self.PauseStateId then
    self:ChangeState("Manual", 0, self.MovingStateId)
  end
end

function M:OnFlowerLanternActive(IsRed)
end

function M:ActiveCombat()
  M.Super.ActiveCombat(self)
  self.Platform:SetVisibility(true, false)
  self:ChangeColor(self.IsRedColor)
  self:OnPlayerEnterCheckBuff(self.OverlappingPlayer)
end

function M:DeActiveCombat()
  M.Super.DeActiveCombat(self)
  self:ResetColor()
  if self.StateId ~= self.SpecialPauseStateId then
    self:OnPlayerLeaveCheckBuff(self.OverlappingPlayer)
  else
    self.IsActive = true
  end
end

function M:GetCanOpen()
  if self.StateId == self.ActiveCyanStateId or self.StateId == self.CanInteractiveStateId then
    self.CanOpen = true
  else
    self.CanOpen = false
  end
end

function M:OnEnterState(NowStateId)
  self.Overridden.OnEnterState(self, NowStateId)
  if NowStateId == self.ActiveCyanStateId then
    self:SwitchRestorePlayer(true)
  elseif NowStateId == self.MovingStateId then
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    if Player then
      self.Super.PropUseSkill(self, self.InteractiveSkillId, Player)
    end
    if not Player:IsDead() then
      self:SwitchChangeScale(true)
      self:SwitchRestorePlayer(true)
      local GameState = UE4.UGameplayStatics.GetGameState(self)
      if GameState and GameState.MonsterSmokes then
        for _, v in pairs(GameState.MonsterSmokes) do
          if v then
            self:ChangeState("Manual", 0, self.PauseStateId)
          end
        end
      end
    end
  elseif NowStateId == self.PauseStateId then
    self:SwitchChangeScale(false)
  elseif NowStateId == self.SpecialPauseStateId then
    self:SwitchRestorePlayer(false)
    self:SwitchChangeScale(false)
    self:ResetColor()
  elseif NowStateId == self.CanInteractiveStateId then
    self:SwitchRestorePlayer(true)
    self:ChangeColor(self.IsRedColor)
    self:BeginRestoreRange()
    self.CurTimes = self.MaxTimes
  end
end

function M:ChangeScale()
  self.CurTimes = self.CurTimes - 1
  if self.CurTimes > self.MinTimes then
    local NewScale = self.CurTimes / self.MaxTimes
    self.Platform:SetWorldScale3D(FVector(self.InitScalePlatform.X * NewScale, self.InitScalePlatform.Y * NewScale, self.InitScalePlatform.Z))
    self.Sphere:SetWorldScale3D(FVector(self.InitScaleSphere.X * NewScale, self.InitScaleSphere.X * NewScale, self.InitScaleSphere.X * NewScale))
  end
end

function M:SwitchRestorePlayer(Enable)
  if Enable and not self:IsExistTimer("RestorePlayer") and self.SkillEffectCyan and self.SkillEffectCyan > 0 and self.SkillEffectCyanCd and self.SkillEffectCyanCd > 0 then
    self:AddTimer(self.SkillEffectCyanCd, self.RestorePlayer, true, -self.SkillEffectCyanCd, "RestorePlayer")
  elseif not Enable then
    self:RemoveTimer("RestorePlayer")
  end
end

function M:SwitchChangeScale(Enable)
  if Enable and not self:IsExistTimer("ChangeScale") then
    self:AddTimer(0.02, self.ChangeScale, true, 0, "ChangeScale")
  elseif not Enable then
    self:RemoveTimer("ChangeScale")
  end
end

function M:RestorePlayer()
  if not self.OverlappingPlayer then
    self.CanRestorePlayer = true
    return
  end
  self.Super.PropUseSkill(self, self.SkillEffectCyan, self.OverlappingPlayer)
  self.CanRestorePlayer = false
end

function M:ResetRange()
  self.Platform:SetWorldScale3D(FVector(self.InitScalePlatform.X, self.InitScalePlatform.Y, self.InitScalePlatform.Z))
  self.Sphere:SetWorldScale3D(FVector(self.InitScaleSphere.X, self.InitScaleSphere.Y, self.InitScaleSphere.Z))
  self.CurTimes = self.MaxTimes
end

function M:BeginRestoreRange()
  self.CurRestoreTime = 0
  local ScalePlat = self.Platform:K2_GetComponentScale()
  local ScaleRange = self.Sphere:K2_GetComponentScale()
  
  local function Restore()
    self.CurRestoreTime = self.CurRestoreTime + 1
    if self.CurRestoreTime >= self.MaxRestoreTimes then
      self:RemoveTimer("RestoreRange")
      self.Platform:SetWorldScale3D(self.InitScalePlatform)
      self.Sphere:SetWorldScale3D(self.InitScaleSphere)
      self.ChestInteractiveComponent.bCanUsed = true
      return
    end
    local alpha = self.CurRestoreTime / self.MaxRestoreTimes
    local XPlat = ScalePlat.X + (self.InitScalePlatform.X - ScalePlat.X) * alpha
    local YPlat = ScalePlat.Y + (self.InitScalePlatform.Y - ScalePlat.Y) * alpha
    local XRange = ScaleRange.X + (self.InitScaleSphere.X - ScaleRange.X) * alpha
    local YRange = ScaleRange.Y + (self.InitScaleSphere.Y - ScaleRange.Y) * alpha
    local ZRange = ScaleRange.Z + (self.InitScaleSphere.Z - ScaleRange.Z) * alpha
    self.Platform:SetWorldScale3D(FVector(XPlat, YPlat, self.InitScalePlatform.Z))
    self.Sphere:SetWorldScale3D(FVector(XRange, YRange, ZRange))
  end
  
  self:AddTimer(0.02, Restore, true, -0.02, "RestoreRange")
end

function M:ReceiveEndPlay()
  M.Super.ReceiveEndPlay(self)
  self:RemoveTimer("ChangeScale")
  self:RemoveTimer("RestorePlayer")
  EventManager:RemoveEvent(EventID.OnMonsterAlive, self)
  EventManager:RemoveEvent(EventID.OnMonsterClear, self)
end

return M
