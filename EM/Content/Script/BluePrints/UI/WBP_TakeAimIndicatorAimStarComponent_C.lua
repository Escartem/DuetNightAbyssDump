local Component = {}

function Component:SwitchAimStar(StyleNode)
  StyleNode = StyleNode or self.CurWeaponStyleNode
  local Widget = self["Panel_Aim_" .. StyleNode]
  if not Widget then
    Widget = UIManager(self):_CreateWidgetNew("BattleAim" .. StyleNode)
    Widget:Init(self)
    self["Panel_Aim_" .. StyleNode] = Widget
    self.Aim_Ranged:AddChild(Widget)
  end
  if self.CurPanel then
    self.LastPanel = self.CurPanel
  end
  self.CurPanel = Widget
  if self.LastPanel then
    if self.LastPanel.SwitchOut then
      self.LastPanel:SwitchOut()
    else
      self.LastPanel:SetVisibility(UE4.ESlateVisibility.Collapsed)
      if self.LastPanel == self.Panel_Aim_BulletReload then
        EMUIAnimationSubsystem:EMStopAnimation(self, self.Reload)
      end
    end
  end
  if self.CurPanel then
    if self.CurPanel.SwitchIn then
      self.CurPanel:SwitchIn()
      self:RefreshAimStar()
    else
      self.CurPanel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      if self.CurPanel == self.Panel_Aim_BulletReload then
        EMUIAnimationSubsystem:EMPlayAnimation(self, self.Reload, 0, true)
      end
    end
  end
  if "Melee" == StyleNode then
    self.Panel_Target:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Panel_Kill:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Panel_Target:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Kill:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function Component:RefreshAimStar()
  if self.CurPanel and self.CurPanel.Refresh then
    self.CurPanel:Refresh()
  end
end

function Component:PlayHitFeedbackAnim()
  if self.CurPanel and self.CurPanel.CurActorRelation == "Enemy" and not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Aim_Critical) then
    EMUIAnimationSubsystem:EMStopAnimation(self, self.Aim_Hit)
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Aim_Critical)
  elseif self.bPlayAnim and not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Aim_Hit) then
    EMUIAnimationSubsystem:EMStopAnimation(self, self.Aim_Critical)
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Aim_Hit)
  end
end

function Component:GetScreenCenterPos()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return FVector2D(0, 0)
  end
  return UIManager:GetScreenCenterPos()
end

function Component:GetAimNeedChangeState(SourceActor, TargetActor)
  if not IsValid(SourceActor) or not IsValid(TargetActor) then
    return "Default"
  end
  if not TargetActor.InitSuccess then
    return "Default"
  end
  local HideTags = TargetActor.HideTags
  local IsInvisible = false
  if HideTags and HideTags:Length() > 0 then
    IsInvisible = true
  end
  local SceneMgrComponent = GWorld.GameInstance:GetSceneManager()
  if IsInvisible and IsValid(SceneMgrComponent) then
    local StateName = "Default"
    self.bPlayAnim = true
    local SpecialMonsterInfo = SceneMgrComponent.SpecialMonsterInfo[TargetActor.Eid] or {}
    if SpecialMonsterInfo.LastAttackedTime ~= nil then
      local NowTime = UE4.UGameplayStatics.GetTimeSeconds(self)
      if NowTime - SpecialMonsterInfo.LastAttackedTime < 0.5 then
        StateName = "Enemy"
        self.bPlayAnim = false
      end
    end
    return StateName
  end
  if SourceActor.IsEnemy and SourceActor:IsEnemy(TargetActor) then
    return "Enemy"
  elseif SourceActor.IsFriend and SourceActor:IsFriend(TargetActor) then
    local StateName = "Friend"
    if TargetActor.GetCharacterTag and TargetActor:GetCharacterTag() == "Dead" then
      StateName = "Default"
    end
    return StateName
  else
    return "Default"
  end
end

function Component:RefreshAimColorByState(ActorRelation)
  self.NextActorRelation = ActorRelation
  if self.CurWeaponStyleNode == "Melee" or self.CurState == "Reload" or self["Panel_Aim_" .. self.CurWeaponStyleNode] == nil then
    return
  end
  if self.CurPanel and self.CurPanel.CurActorRelation ~= self.NextActorRelation then
    if self.CurPanel.CurActorRelation == "ForceDefault" then
      if self.NextActorRelation == "LeaveForceDefault" then
        self.CurPanel.CurActorRelation = self.NextActorRelation
      end
      return
    end
    self.CurPanel.CurActorRelation = self.NextActorRelation
    local ColorIntensty = self.AllColorIntensty[self.CurPanel.CurActorRelation]
    self:RefreshHitEffectEnhanceVisibility()
    self:RealRefreshAimColor(ColorIntensty)
  end
end

function Component:RefreshHitEffectEnhanceVisibility()
  if self.CurPanel and self.CurPanel.RefreshHitEffectEnhanceVisibility then
    self.CurPanel:RefreshHitEffectEnhanceVisibility()
  end
end

function Component:RealRefreshAimColor(ColorIntensty)
  if self.CurPanel and self.CurPanel.RealRefreshAimColor then
    self.CurPanel:RealRefreshAimColor(ColorIntensty)
  end
end

function Component:UpdateDiffusionStateInTick(InDeltaTime)
  if self.IsDiffuseState and self.CurPanel and self.CurPanel.UpdateDiffusionStateInTick then
    self.CurPanel:UpdateDiffusionStateInTick(InDeltaTime)
  end
end

function Component:TryToPlayAimDiffusionStartAnim()
  if self.CurPanel and self.CurPanel.TryToPlayAimDiffusionStartAnim then
    self.CurPanel:TryToPlayAimDiffusionStartAnim()
  end
end

function Component:CheckNotShootHold()
  if not self.OwnerPlayer:CharacterInTag("Shooting") or self.CurState == "Reload" then
    return true
  else
    local CurSkill = self.OwnerPlayer:GetCurrentSkill()
    if CurSkill and "Shooting" == CurSkill.SkillType and (self.OwnerPlayer.bPressedFire or self.OwnerPlayer:GetInputCache() == "Fire") then
      return false
    else
      return true
    end
  end
end

function Component:UpdateAimStarOpacity()
  if self.CurPanel and self.CurPanel.UpdateAimStarOpacity then
    if self.CurrentWeapon:GetAttr("MagazineBulletNum") <= 0 and self.CurrentWeapon:GetAttr("BulletNum") <= 0 then
      self.CurPanel:UpdateAimStarOpacity(0.5)
    else
      self.CurPanel:UpdateAimStarOpacity(1)
    end
  end
end

function Component:BeginAccumulate(Skill)
  if self.CurPanel and self.CurPanel.BeginAccumulate then
    self.CurPanel:BeginAccumulate(Skill)
  end
end

function Component:EndAccumulateOnLeaveNode(Owner, NodeId, SkillNode)
  if self.CurPanel and self.CurPanel.EndAccumulateOnLeaveNode then
    self.CurPanel:EndAccumulateOnLeaveNode(Owner, NodeId, SkillNode)
  end
end

function Component:UpdateAccumulateStateInTick(InDeltaTime)
  if self.IsAccumulateState and self.CurPanel and self.CurPanel.UpdateAccumulateStateInTick then
    self.CurPanel:UpdateAccumulateStateInTick(InDeltaTime)
  end
end

function Component:UpdateTrackingBowAimColor()
  if self.IsAccumulateState and self.CurPanel and self.CurPanel.UpdateTrackingBowAimColor then
    self.CurPanel:UpdateTrackingBowAimColor()
  end
end

return Component
