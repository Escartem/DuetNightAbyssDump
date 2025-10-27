local Component = {}

function Component:ReceiveBeginPlay()
end

function Component:OnCharacterReady()
  self.RecoverMontageName = "Interactive_01_Montage"
end

function Component:UpdateRecoveryValue(DeltaSeconds)
  if self.CurRecoverySpeed > 0 then
    self.RecoveryValue = math.min(self.RecoveryValue + self.CurRecoverySpeed * DeltaSeconds, Const.MaxRecoverValue)
  else
    self.RecoveryValue = 0
    if self.DyingDuration then
      self.DyingDuration = self.DyingDuration + DeltaSeconds
    end
  end
end

function Component:TryEnterRecovery()
  local Reason, Recoverer
  if self:IsPhantom() then
    Recoverer = self
    Reason = UE4.ERecoverReason.RecoverReason_SelfRecover
  end
  for Id, RecoveryInfo in pairs(self.RecovererList) do
    if self:IsPhantom() and Id == self.Eid then
    else
      local _Recoverer = Battle(self):GetEntity(Id)
      if _Recoverer then
        Recoverer = _Recoverer
        Reason = RecoveryInfo.Reason
      end
    end
  end
  if Recoverer and Reason then
    Recoverer:OnRecoverOtherSuccess(self, Reason)
    Battle(self):Recovery(self.Eid)
    self:OnRecoverSuccess(Reason)
  end
end

function Component:ClearRecovererList()
  if self.RecovererList then
    for Id, RecoveryInfo in pairs(self.RecovererList) do
      local Recoverer = Battle(self):GetEntity(Id)
      if Recoverer then
        self:RefreshRecovererInfo(Recoverer, nil)
        self:UnbindTeamRecoveryEffect(Id)
        self.RecovererList[Id] = nil
      end
    end
  end
  self.RecovererList = {}
end

function Component:BindTeamReocveryEffect(RecovererEid, EffectId)
  if not IsStandAlone(self) and not IsClient(self) then
    return
  end
  if self.RecovererList[RecovererEid] then
    self.RecovererList[RecovererEid].RecoveryEffectCreatureId = EffectId
    self.RecovererList[RecovererEid].RecoveryEffectCreature = self:CreateEffectCreature(EffectId, FTransform(), true, "Root")
  end
end

function Component:UnbindTeamRecoveryEffect(RecovererEid)
  if not IsStandAlone(self) and not IsClient(self) then
    return
  end
  if self.RecovererList[RecovererEid] and self.RecovererList[RecovererEid].RecoveryEffectCreature then
    local RecoveryEffectCreature = self.RecovererList[RecovererEid].RecoveryEffectCreature
    RecoveryEffectCreature:OnCharRecovery()
    self.RecovererList[RecovererEid].RecoveryEffectCreatureId = nil
    self.RecovererList[RecovererEid].RecoveryEffectCreature = nil
  end
end

function Component:RefreshRecovererInfo(Recoverer, RecoverSpeed)
  Recoverer.RecoverTargets = Recoverer.RecoverTargets or {}
  Recoverer.RecoverTargets[self.Eid] = RecoverSpeed
  if not next(Recoverer.RecoverTargets) then
    DebugPrint("Tianyi@ \230\149\145\229\138\169\232\128\133: " .. Recoverer.Eid .. "\228\184\141\229\134\141\230\149\145\229\138\169\229\175\185\232\177\161")
    Recoverer.IsRecoveringOthers = false
  else
    DebugPrint("Tianyi@ \230\149\145\229\138\169\232\128\133: " .. Recoverer.Eid .. "\230\173\163\229\156\168\230\149\145\229\138\169\229\175\185\232\177\161")
    Recoverer.IsRecoveringOthers = true
  end
end

function Component:CalcRecoverySpeed()
  local Speed = 0
  for _, RecoveryInfo in pairs(self.RecovererList) do
    if RecoveryInfo.RecoverSpeed <= 0 then
      self.CurRecoverySpeed = -1
      return
    end
    Speed = Speed + RecoveryInfo.RecoverSpeed
  end
  self.CurRecoverySpeed = Speed
end

function Component:CheckCanRecoverOther(Target, Reason)
  if not Reason or Reason == UE4.ERecoverReason.RecoverReason_NoReason then
    return true
  end
  if Reason == UE4.ERecoverReason.RecoverReason_TeammateRecover then
    local TargetCanRecover = Target:CheckCanRecovery()
    if Target:IsPlayer() then
      return TargetCanRecover and Target:IsRecoveredBySelf() and not Target:IsRecoveringByOther(self.Eid)
    elseif Target:IsPhantom() then
      return TargetCanRecover and not Target:IsRecoveringByOther(self.Eid)
    end
  elseif Reason == UE4.ERecoverReason.RecoverReason_SkillEffect and not self:CheckCanSkillRecoverTarget(Target.Eid) then
    DebugPrint("Tianyi@ Run out of SkillRecoverTargetCount")
    return false
  end
  return true
end

function Component:OnRecoverSuccess(Reason)
  if Reason ~= UE4.ERecoverReason.RecoverReason_SkillEffect then
    self:AddRecoveryCount(1)
  end
end

function Component:OnRecoverOtherSuccess(Target, Reason)
  DebugPrint("Tianyi@ " .. self:GetName() .. " \229\143\130\228\184\142\229\164\141\230\180\187\231\155\174\230\160\135: " .. Target:GetName() .. " \230\136\144\229\138\159, Reason = " .. Reason)
  if Reason == UE4.ERecoverReason.RecoverReason_SelfRecover then
  elseif Reason == UE4.ERecoverReason.RecoverReason_TeammateRecover then
  elseif Reason == UE4.ERecoverReason.RecoverReason_SkillEffect then
    self:AddSkillRecoverTarget(Target.Eid)
    DebugPrint("Tianyi@ Recover " .. Target:GetName() .. " Success! SkillRecoverTime was cost")
  end
  if IsStandAlone(self) or IsDedicatedServer(self) then
    local RootSource = self:GetRootSource()
    if IsValid(RootSource) and RootSource:IsPlayer() and Reason ~= UE4.ERecoverReason.RecoverReason_SelfRecover then
      RootSource.BattleAchievement:OnRecoverTeammate(Target)
    end
  end
end

function Component:GetCanRecover(PlayerId)
  return self:CheckCanRecovery()
end

function Component:GetCurRecoveryUIName()
  local RespawnRuleName = self:GetCurRespawnRuleName()
  local RespawnRule = DataMgr.RespawnRule[RespawnRuleName]
  return RespawnRule and RespawnRule.RecoverUI or "BattleResurgence"
end

function Component:ClientPlayAnimOnRecoverInteractive(TargetEid, RecoverInteractiveState)
  if 0 == RecoverInteractiveState then
    self.WaitCallBack = true
    self:SetEnterInteractive(true, self.RecoverMontageName, self.InteractiveTag)
  elseif 2 == RecoverInteractiveState then
    self:SetEnterInteractive(false, self.RecoverMontageName)
  end
end

return Component
