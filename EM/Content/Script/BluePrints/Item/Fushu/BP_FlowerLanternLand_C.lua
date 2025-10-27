require("UnLua")
local BP_FlowerLanternLand_C = Class({
  "BluePrints.Item.Fushu.BP_FushuItemBase_C"
})

function BP_FlowerLanternLand_C:CommonInitInfo(Info)
  BP_FlowerLanternLand_C.Super.CommonInitInfo(self, Info)
  self.SkillEffectHp = self.UnitParams.SkillEffectHp
  self.SkillEffectSp = self.UnitParams.SkillEffectSp
  self.RestoreHpCD = self.UnitParams.RestoreHpCD
  self.RestoreSpCD = self.UnitParams.RestoreSpCD
  self.CanRestorePlayer = self.UnitParams.CanRestorePlayer
  self.IsRedLight = self.UnitParams.IsRedLight
  self.TargetInRange = false
  self.HasRestore = false
  self:ChangeColor(self.IsRedLight)
end

function BP_FlowerLanternLand_C:OnActorReady(Info)
  BP_FlowerLanternLand_C.Super.OnActorReady(self, Info)
  if not self.ToughRange then
    return
  end
  if self.CanRestorePlayer then
    self.ToughRange.OnComponentBeginOverlap:Add(self, self.OnStartTough)
    self.ToughRange.OnComponentEndOverlap:Add(self, self.OnEndTough)
    self.ToughRange:SetCollisionProfileName("OnlyPlayer", true)
  end
end

function BP_FlowerLanternLand_C:OnStartTough(Component, OtherActor, OtherComp)
  if OtherActor.IsPlayer and OtherActor:IsPlayer() then
    self.TargetInRange = true
    if not self:IsExistTimer("RestorePlayer") then
      if self.IsRedLight then
        self:AddTimer(self.RestoreHpCD, self.RestorePlayer, true, -self.RestoreHpCD, "RestorePlayer", nil, OtherActor)
      else
        self:AddTimer(self.RestoreSpCD, self.RestorePlayer, true, -self.RestoreSpCD, "RestorePlayer", nil, OtherActor)
      end
    end
    self:OnPlayerEnterCheckBuff(OtherActor)
  end
end

function BP_FlowerLanternLand_C:OnEndTough(Component, OtherActor, OtherComp)
  if OtherActor.IsPlayer and OtherActor:IsPlayer() then
    self.TargetInRange = false
    self:OnPlayerLeaveCheckBuff(OtherActor)
  end
end

function BP_FlowerLanternLand_C:RestorePlayer(Player)
  if not self.TargetInRange then
    self:RemoveTimer("RestorePlayer")
    return
  end
  self:UseEffect(Player)
end

function BP_FlowerLanternLand_C:UseEffect(Player)
  if self.SkillEffectHp and self.SkillEffectHp > 0 and self.IsRedLight then
    self.Super.PropUseSkill(self, self.SkillEffectHp, Player)
  elseif self.SkillEffectSp and self.SkillEffectSp > 0 and not self.IsRedLight then
    self.Super.PropUseSkill(self, self.SkillEffectSp, Player)
  end
end

function BP_FlowerLanternLand_C:OnEnterState(NowStateId)
  self.Overridden.OnEnterState(self, NowStateId)
  if NowStateId == self.NormalStateId then
    self.HasRestore = false
  end
end

return BP_FlowerLanternLand_C
