local M = Class({
  "BluePrints.Item.Fushu.BP_FushuItemBase_C"
})

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.InteractiveType = Const.EndByTargetInteractive
  self.ChestInteractiveComponent:InitInteractiveComponent(self.Data.InteractiveId)
  self.SkillEffectHp = self.UnitParams.SkillEffectHp
  self.SkillEffectSp = self.UnitParams.SkillEffectSp
  self.FirstInteractive = true
end

function M:OnActorReady(Info)
  M.Super.OnActorReady(self, Info)
  self.Sphere.OnComponentBeginOverlap:Add(self, self.OnPlayerIn)
  self.Sphere.OnComponentEndOverlap:Add(self, self.OnPlayerOut)
  self.Sphere:SetCollisionProfileName("OnlyPlayer", true)
end

function M:OnPlayerIn(Component, OtherActor, OtherComp)
  self:OnPlayerEnterCheckBuff(OtherActor)
  self.OverlappingPlayer = OtherActor
end

function M:OnPlayerOut(Component, OtherActor, OtherComp)
  self:OnPlayerLeaveCheckBuff(OtherActor)
  self.OverlappingPlayer = nil
end

function M:ActiveCombat()
  M.Super.ActiveCombat(self)
  self:OnPlayerEnterCheckBuff(self.OverlappingPlayer)
end

function M:GetCanOpen()
  if self.StateId == self.InitStateId then
    self.CanOpen = true
  else
    self.CanOpen = false
  end
end

function M:OnShowEnd()
  self.ChestInteractiveComponent.bCanUsed = true
  if self.StateId == self.FirstInteractiveStateId then
    self:ChangeState("Manual", 0, self.FirstInteractiveDoneStateId)
  else
    self:ChangeState("Manual", 0, self.InteractiveDoneStateId)
  end
end

function M:OnEnterState(NowStateId)
  self.Overridden.OnEnterState(self, NowStateId)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if NowStateId == self.FirstInteractiveStateId then
    self.ChestInteractiveComponent.bCanUsed = false
    self:AddTimer(self.DelayTime, self.OnShowEnd, false, 0)
    for i = 1, self.KongmingLanterns:Length() do
      self.KongmingLanterns[i]:OnWindBellActive()
    end
    self.Super.PropUseSkill(self, self.SkillEffectHp, Player)
    self.Super.PropUseSkill(self, self.SkillEffectSp, Player)
  elseif NowStateId == self.InteractiveStateId then
    self.ChestInteractiveComponent.bCanUsed = false
    self:AddTimer(1, self.OnShowEnd, false, 0)
  end
  if NowStateId == self.InitStateId then
    self.ChestInteractiveComponent.bCanUsed = true
  else
    self.ChestInteractiveComponent.bCanUsed = false
  end
end

return M
