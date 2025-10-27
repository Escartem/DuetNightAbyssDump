require("UnLua")
require("DataMgr")
local WBP_Battle_Aim_Fort_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_Battle_Aim_Fort_C:Construct()
  self:InitInfo()
end

function WBP_Battle_Aim_Fort_C:Init(Root)
  self.Root = Root
  self.OwnerPlayer = self.Root.OwnerPlayer
  local Time = self.Root.Percent * self.SumTime
  self:PlayAnimation(self.Test, Time)
  self:PauseAnimation(self.Test)
end

function WBP_Battle_Aim_Fort_C:UpdateAmmo()
  local Time = self.Root.Percent * self.SumTime
  self:PlayAnimation(self.Test, Time)
  self:PauseAnimation(self.Test)
  if self.Root.Percent <= 0 then
    if not self.PanelAmmoHide then
      self:RefreshPanelAmmo(true)
    end
  elseif self.PanelAmmoHide then
    self:RefreshPanelAmmo(false)
  end
end

function WBP_Battle_Aim_Fort_C:GetCurrentPercent()
  return self.BarAmmoMat:K2_GetScalarParameterValue("Percent")
end

function WBP_Battle_Aim_Fort_C:RefreshAimColorByState(ActorRelation)
  if "Default" == ActorRelation then
    ActorRelation = "Normal"
  end
  if self.CurActorRelation ~= ActorRelation then
    self.CurActorRelation = ActorRelation
    if EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Normal) then
      EMUIAnimationSubsystem:EMStopAnimation(self, self.Normal)
    elseif EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Enemy) then
      EMUIAnimationSubsystem:EMStopAnimation(self, self.Enemy)
    elseif EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Friend) then
      EMUIAnimationSubsystem:EMStopAnimation(self, self.Friend)
    end
    EMUIAnimationSubsystem:EMPlayAnimation(self, self[self.CurActorRelation])
  end
end

function WBP_Battle_Aim_Fort_C:GetAimNeedChangeState(SourceActor, TargetActor)
  if not IsValid(SourceActor) or not IsValid(TargetActor) then
    return "Normal"
  end
  if not TargetActor.InitSuccess then
    return "Normal"
  end
  local IsInvisible = TargetActor.HideTags and TargetActor.HideTags:Length() > 0
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local SceneMgrComponent = GameInstance:GetSceneManager()
  if IsInvisible and IsValid(SceneMgrComponent) then
    local StateName = "Normal"
    local SpecialMonsterInfo = SceneMgrComponent.SpecialMonsterInfo[TargetActor.Eid] or {}
    if SpecialMonsterInfo.LastAttackedTime ~= nil then
      local NowTime = UE4.UGameplayStatics.GetTimeSeconds(self)
      if NowTime - SpecialMonsterInfo.LastAttackedTime < 0.5 then
        StateName = "Enemy"
      end
    end
    return StateName
  elseif SourceActor.IsEnemy and SourceActor:IsEnemy(TargetActor) then
    return "Enemy"
  elseif SourceActor.IsFriend and SourceActor:IsFriend(TargetActor) then
    return "Friend"
  else
    return "Normal"
  end
end

function WBP_Battle_Aim_Fort_C:InitInfo()
  self.BarAmmoMat = self.Bar_Ammo:GetDynamicMaterial()
  self.PanelAmmoHide = false
  self.SumTime = self.Test:GetEndTime()
end

function WBP_Battle_Aim_Fort_C:RefreshPanelAmmo(IsHide)
  if IsHide then
    self.Panel_Ammo:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Panel_Ammo:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  self.PanelAmmoHide = IsHide
end

function WBP_Battle_Aim_Fort_C:TryToPlayAimDiffusionStartAnim()
  if EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Normal) then
    EMUIAnimationSubsystem:EMStopAnimation(self, self.Normal)
  elseif EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Enemy) then
    EMUIAnimationSubsystem:EMStopAnimation(self, self.Enemy)
  elseif EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Friend) then
    EMUIAnimationSubsystem:EMStopAnimation(self, self.Friend)
  end
  if "Friend" == self.CurActorRelation or self.CurActorRelation == "Enery" then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.AimFire)
  else
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.AirFire)
  end
end

return WBP_Battle_Aim_Fort_C
