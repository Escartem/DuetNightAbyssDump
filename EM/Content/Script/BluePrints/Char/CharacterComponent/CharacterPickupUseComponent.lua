local Component = {}

function Component:PickupToRecoverSurvival(PickUpCount, UseFunctionParam)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:TriggerDungeonComponentFun("AddSurvivalValue", UseFunctionParam * PickUpCount)
end

function Component:PickupToGetResource(PickUpCount, ResourceId, DropId, Transform, PickUpEid, bExtra)
  if not DataMgr.Resource[ResourceId] then
    return
  end
  self:PickupTriggerRewardEvent(DropId, Transform, PickUpEid, bExtra, true)
end

function Component:PickupToRecoverHp(PickUpCount, UseFunctionParam, UnitId)
  local DeltaHp = self:_PickupToRecoverHp(PickUpCount, UseFunctionParam, UnitId)
  Battle(self):TriggerBattleEvent(BattleEventName.OnGetHpBall, self, DeltaHp)
  local PhantomTeammate = self:GetPhantomTeammates()
  for _, Target in pairs(PhantomTeammate) do
    if Target ~= self then
      Target:_PickupToRecoverHp(PickUpCount, UseFunctionParam, UnitId)
    end
  end
end

function Component:_PickupToRecoverHp(PickUpCount, UseFunctionParam, UnitId)
  if 1 == DataMgr.Drop[UnitId].IsPercentage then
    UseFunctionParam = self:GetAttr("MaxHp") * UseFunctionParam / 100
  end
  local DeltaHp = PickUpCount * UseFunctionParam
  self:AddHp(DeltaHp)
  return DeltaHp
end

function Component:PickupToRecoverSp(PickUpCount, UseFunctionParam)
  local DeltaSp = PickUpCount * UseFunctionParam
  self:_PickupToRecoverSp(DeltaSp)
  Battle(self):TriggerBattleEvent(BattleEventName.OnGetSpBall, self, DeltaSp)
  local PhantomTeammate = self:GetPhantomTeammates()
  for _, Target in pairs(PhantomTeammate) do
    if Target ~= self then
      Target:_PickupToRecoverSp(DeltaSp)
    end
  end
end

function Component:_PickupToRecoverSp(DeltaSp)
  local DeltaSp = PickUpCount * UseFunctionParam
  Battle(self):AddSpToTarget(self, self, DeltaSp, EChangedSpReason.PickUpSp)
  Battle(self):TriggerBattleEvent(BattleEventName.OnGetSpBall, self, DeltaSp)
end

function Component:PickupToPickUpBattery(PickUpCount, UseFunctionParam)
  if self.BatteryNum >= Const.MaxBatteryOneChar then
    return
  end
  self.BatteryNum = self.BatteryNum + PickUpCount
  if self.BatteryNum >= Const.MaxBatteryOneChar then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    GameMode:TriggerDungeonComponentFun("BatteryFull")
  end
  for i = 1, PickUpCount do
    Battle(self):AddBuffToTarget(self, self, Const.BarriyBuffId, -1)
  end
end

function Component:PickupToPickUpCrackKey(PickUpCount, UseFunctionParam)
  if self.CrackKeyNum >= Const.MaxCrackKeyOneChar then
    return
  end
  self.CrackKeyNum = self.CrackKeyNum + PickUpCount
  if self.CrackKeyNum >= Const.MaxCrackKeyOneChar then
  end
  for i = 1, PickUpCount do
    Battle(self):AddBuffToTarget(self, self, Const.CrackKeyBuffId, -1)
  end
end

function Component:PickupToRecoverAmmo(PickUpCount, UseFunctionParam)
  local Num = PickUpCount * UseFunctionParam
  local BulletNum = self:GetBulletNum()
  if not BulletNum then
    return
  end
  self:PickUpBullet(Num, EGetBulletReason.PickBullet)
  local PhantomTeammate = self:GetPhantomTeammates()
  for _, Target in pairs(PhantomTeammate) do
    if Target ~= self then
      Target:PickUpBullet(Num, EGetBulletReason.PickBullet)
    end
  end
end

function Component:PickupToGetMod(PickUpCount, ModId, UnitId, Transform, PickUpEid, bExtra)
  self:PickupTriggerRewardEvent(UnitId, Transform, PickUpEid, bExtra, true)
end

function Component:PickupTriggerRewardEvent(UnitId, Transform, PickUpEid, bExtra, bNeedCallback)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local ExtraInfo = {
    UniqueSign = PickUpEid,
    DropId = UnitId,
    bExtra = bExtra,
    SourceEid = self.Eid
  }
  local Callback = bNeedCallback and function()
    self:TriggerPickupSuccessCallback(UnitId)
  end
  GameMode:TriggerRewardEvent(UnitId, CommonConst.RewardReason.PickUp, Transform, ExtraInfo, Callback)
end

function Component:PickupToUseSkillEffect(PickUpCount, SkillId)
  self:_PickupToUseSkillEffect(SkillId)
  local PhantomTeammate = self:GetPhantomTeammates()
  for _, Target in pairs(PhantomTeammate) do
    if Target ~= self then
      Target:_PickupToUseSkillEffect(SkillId)
    end
  end
end

function Component:_PickupToUseSkillEffect(SkillId)
  Battle(self):ExecuteSkillEffect(self, SkillId, self)
end

function Component:TriggerPickupSuccessCallback(DropId)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  local CallbackMap = GameMode.PickUpSuccessCallback
  if CallbackMap and CallbackMap[DropId] then
    for _, Callback in pairs(CallbackMap[DropId]) do
      Callback()
    end
  end
end

return Component
