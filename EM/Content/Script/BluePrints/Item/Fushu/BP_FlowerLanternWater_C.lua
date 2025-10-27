require("UnLua")
local BP_FlowerLanternWater_C = Class({
  "BluePrints.Item.Fushu.BP_FushuItemBase_C"
})

function BP_FlowerLanternWater_C:CommonInitInfo(Info)
  BP_FlowerLanternWater_C.Super.CommonInitInfo(self, Info)
  self.SkillEffectHp = self.UnitParams.SkillEffectHp
  self.SkillEffectSp = self.UnitParams.SkillEffectSp
  self.RestoreHpCD = self.UnitParams.RestoreHpCD
  self.RestoreSpCD = self.UnitParams.RestoreSpCD
  self.CanRestorePlayer = self.UnitParams.CanRestorePlayer
  self.TargetInRange = false
  self.IsRedLight = true
  self.HasRestore = false
  self.OverlappingPlayer = nil
end

function BP_FlowerLanternWater_C:OnActorReady(Info)
  BP_FlowerLanternWater_C.Super.OnActorReady(self, Info)
  if not self.ToughRange then
    return
  end
  if self.CanRestorePlayer then
    self.ToughRange.OnComponentBeginOverlap:Add(self, self.OnStartTough)
    self.ToughRange.OnComponentEndOverlap:Add(self, self.OnEndTough)
    self.ToughRange:SetCollisionProfileName("OnlyPlayer", true)
  end
  EventManager:AddEvent(EventID.OnFlowerLanternActive, self, self.OnFlowerLanternActive)
  EventManager:AddEvent(EventID.OnFlowerLanternDeActive, self, self.OnFlowerLanternDeActive)
end

function BP_FlowerLanternWater_C:OnStartTough(Component, OtherActor, OtherComp)
  if OtherActor.IsPlayer and OtherActor:IsPlayer() then
    self.TargetInRange = true
    if self.IsActive and not self:IsExistTimer("RestorePlayer") then
      if self.IsRedLight then
        self:AddTimer(self.RestoreHpCD, self.RestorePlayer, true, -self.RestoreHpCD, "RestorePlayer", nil, OtherActor)
      else
        self:AddTimer(self.RestoreSpCD, self.RestorePlayer, true, -self.RestoreSpCD, "RestorePlayer", nil, OtherActor)
      end
    end
    self.OverlappingPlayer = OtherActor
    self:OnPlayerEnterCheckBuff(OtherActor)
  end
end

function BP_FlowerLanternWater_C:OnEndTough(Component, OtherActor, OtherComp)
  if OtherActor.IsPlayer and OtherActor:IsPlayer() then
    self.TargetInRange = false
    self.OverlappingPlayer = nil
    self:OnPlayerLeaveCheckBuff(OtherActor)
  end
end

function BP_FlowerLanternWater_C:RestorePlayer(Player)
  if not self.TargetInRange or not self.IsActive then
    self:RemoveTimer("RestorePlayer")
    return
  end
  self:UseEffect(Player)
end

function BP_FlowerLanternWater_C:UseEffect(Player)
  if self.SkillEffectHp and self.SkillEffectHp > 0 and self.IsRedLight then
    self.Super.PropUseSkill(self, self.SkillEffectHp, Player)
  elseif self.SkillEffectSp and self.SkillEffectSp > 0 and not self.IsRedLight then
    self.Super.PropUseSkill(self, self.SkillEffectSp, Player)
  end
end

function BP_FlowerLanternWater_C:OnFlowerLanternActive(IsRed)
  if self.IsActive then
    return
  end
  self:ChangeState("Manual", 0, self.ActiveStateId)
  self.IsRedLight = IsRed
  self:ChangeColor(self.IsRedLight)
  if self.OverlappingPlayer ~= nil then
    self:OnStartTough(nil, self.OverlappingPlayer, nil)
  end
end

function BP_FlowerLanternWater_C:OnFlowerLanternDeActive()
  if not self.IsActive then
    return
  end
  self:ChangeState("Manual", 0, self.NormalStateId)
  self:ResetColor()
  if self.OverlappingPlayer ~= nil then
    self:OnPlayerLeaveCheckBuff(self.OverlappingPlayer)
  end
end

function BP_FlowerLanternWater_C:ReceiveEndPlay()
  BP_FlowerLanternWater_C.Super.ReceiveEndPlay(self)
  self:RemoveTimer("RestorePlayer")
  EventManager:RemoveEvent(EventID.OnFlowerLanternActive, self)
  EventManager:RemoveEvent(EventID.OnFlowerLanternDeActive, self)
end

return BP_FlowerLanternWater_C
