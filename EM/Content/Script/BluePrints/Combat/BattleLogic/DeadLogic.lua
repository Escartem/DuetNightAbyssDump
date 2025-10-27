local Component = {}

function Component:AddCaptureResult(ResultName, TargetEid, KillMineRoleEid, KillMineSkillId, DeathReason)
  self.Result:Add(ResultName, {
    TargetEid = TargetEid,
    KillMineRoleEid = KillMineRoleEid,
    KillMineSkillId = KillMineSkillId,
    DeathReason = DeathReason
  })
end

function Component:Play_CaptureMonster(Content)
  local Target = self:GetEntity(Content.TargetEid)
  if not Target then
    return
  end
  self:CaptureMonster(Content.TargetEid, Content.KillMineRoleEid, Content.KillMineSkillId, Content.DeathReason)
end

function Component:CaptureMonsterSuccess(TargetEid, KillMineRoleEid, KillMineSkillId, DeathReason)
  local Entity = self:GetEntity(TargetEid)
  if not Entity then
    return
  end
  Entity:SetDead(true, DeathReason, KillMineRoleEid, KillMineSkillId)
  Entity:CaptureMonsterSuccess(KillMineRoleEid, KillMineSkillId, DeathReason)
  self.Result:Add("CaptureMonsterSuccess", {
    TargetEid = TargetEid,
    KillMineRoleEid = KillMineRoleEid,
    KillMineSkillId = KillMineSkillId,
    DeathReason = DeathReason
  })
end

function Component:Play_CaptureMonsterSuccess(Content)
  local Target = self:GetEntity(Content.TargetEid)
  if not Target then
    return
  end
  self:CaptureMonsterSuccess(Content.TargetEid, Content.KillMineRoleEid, Content.KillMineSkillId, Content.DeathReason)
end

function Component:BattleOnDead_Lua(TargetEid, KillMineRoleEid, KillMineSkillId, DeathReason)
end

function Component:QuickRecovery_Impl(Target)
  Target:QuickRecovery()
end

function Component:Recovery(TargetEid)
  local Target = self:GetEntity(TargetEid)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local IsInHomebase = Avatar:GetIsInHome()
    if Target:GetCurRespawnRuleName() == "CommonRegion" and not IsInHomebase then
      self:RegionTeleportRecovery(Target)
      return
    end
  end
  Target:Recovery()
end

function Component:TeleportRecovery(TargetEid, Location, Rotation, DelayTime)
  local Target = self:GetEntity(TargetEid)
  if not Target or not Target:CheckCanRecovery() then
    return
  end
  self:AddTimer(DelayTime, function()
    Target:K2_SetActorLocationAndRotation(Location, Rotation, false, nil, false)
    Target:Recovery()
    self.Result:Add("EntityRecovery", {
      EntityEid = Target.Eid
    })
  end)
end

function Component:RegionTeleportRecovery(Player)
  Player.IsTeleportRecovery = true
  local UIManager = UIManager(GWorld.GameInstance)
  local Params = {}
  Params.BlackScreenHandle = "Teleport"
  Params.InAnimationObj = self
  
  function Params.InAnimationCallback()
    Player:QuickRecovery()
    Player:TeleportToCloestTeleportPoint(function()
      UIManager:HideCommonBlackScreen("Teleport")
      Player.IsTeleportRecovery = false
    end)
  end
  
  Params.InAnimationPlayTime = 1
  Params.OutAnimationObj = self
  Params.OutAnimationPlayTime = 1
  UIManager:ShowCommonBlackScreen(Params)
end

function Component:Play_EntityRecovery(Content)
  DebugPrint("Tianyi@ Client Play_EntityRecovery")
  local EntityEid = Content.EntityEid
  local Entity = self:GetEntity(EntityEid)
  if not Entity then
    return
  end
  self:Recovery(Content.EntityEid)
end

function Component:RecoverOther(RecovererEid, TargetEid, IsBegin, Params, Reason)
  local Recoverer = self:GetEntity(RecovererEid)
  local Target = self:GetEntity(TargetEid)
  local OverrideSpeed = Params.Speed
  local RecoveryEffectCreatureId = Params.RecoveryEffectCreature
  local RecoverSpeed = Target and Target:GetPlayerRecoverySpeed() or nil
  if OverrideSpeed then
    RecoverSpeed = OverrideSpeed
  end
  if Recoverer and Target and RecoverSpeed then
    Recoverer = Recoverer:GetRootSource()
    if not Recoverer then
      return
    end
    if not Target:CheckCanRecovery() then
      DebugPrint("Tianyi@ " .. Target:GetName() .. " Can not be recovered")
      return
    end
    if IsBegin then
      if not Recoverer:CheckCanRecoverOther(Target, Reason) then
        DebugPrint("Tianyi@ Recoverer " .. Recoverer:GetName() .. " can not recover target: " .. Target:GetName())
        return
      end
      Target:AddTeamRecovery(Recoverer.Eid, RecoverSpeed, Reason)
      if RecoveryEffectCreatureId then
        Target:BindTeamReocveryEffect(RecovererEid, RecoveryEffectCreatureId)
      end
    else
      Target:RemoveTeamRecovery(Recoverer.Eid)
    end
    self.Result:Add("RecoverOther", {
      RecovererEid = RecovererEid,
      TargetEid = TargetEid,
      IsBegin = IsBegin,
      Params = Params,
      Reason = Reason
    })
  end
end

function Component:Play_RecoverOther(Content)
  DebugPrint("Tianyi@ Client Play_RecoverOther")
  local TargetEid = Content.TargetEid
  local IsBegin = Content.IsBegin
  local Target = self:GetEntity(TargetEid)
  if not IsValid(Target) then
    return
  end
  if IsBegin then
    if Target.IsHostage and Target.TriggerRescueTimerFloatVisibility then
      Target:TriggerRescueTimerFloatVisibility(true)
    end
  elseif Target.IsHostage and Target.TriggerRescueTimerFloatVisibility then
    Target:TriggerRescueTimerFloatVisibility(false)
  end
end

function Component:CaptureMonsterStandUp(TargetEid)
  local Target = self:GetEntity(TargetEid)
  if not Target then
    return
  end
  if not Target:CheckCanRecovery() then
    return
  end
  Target:CaptureMonsterRecover()
  self.Result:Add("CaptureMonsterStandUp", {
    EntityEid = Target.Eid
  })
end

function Component:Play_CaptureMonsterStandUp(Content)
  local EntityEid = Content.EntityEid
  local Entity = self:GetEntity(EntityEid)
  if not Entity then
    return
  end
  self:CaptureMonsterStandUp(Content.EntityEid)
end

return Component
