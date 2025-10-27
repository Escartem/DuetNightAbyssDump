require("UnLua")
require("DataMgr")
local WBP_TakeAimIndicator_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})
WBP_TakeAimIndicator_C._components = {
  "BluePrints.UI.WBP_TakeAimIndicatorAimStarComponent_C",
  "BluePrints.UI.WBP_TakeAimIndicatorAmmoBarComponent_C"
}

function WBP_TakeAimIndicator_C:Initialize(Initializer)
  self.BordSize = FVector2D(30, 30)
  self.AllShootingTargets = nil
  self.LastShootTargetEid = {}
  self.OwnerPlayer = nil
  self.OwnerPlayerCameraComponent = nil
  self.CurrentWeapon = nil
  self.CurWeaponStyle = nil
  self.CurWeaponStyleNode = nil
  self.SightUI = nil
  self.AmmoBarStyle = nil
  self.ChangeAimStarColorAndShowBillboardTimer = nil
  self.UpdateDiffusionStateTimer = nil
  self.UpdateAccumulateStateTimer = nil
  self.PlayReloadAnimTimer = nil
  self.LerpSetAmmoBarPercentTimer = nil
  self.CurState = "Normal"
  self.AllCurWeaponStyle = {
    "Melee",
    "Ranged",
    "NoWeapon"
  }
  self.AllWeaponStyleNode = {
    "Funnel",
    "Melee",
    "AimStarButterfly",
    "Crossbow",
    "Shotgun",
    "Cannon",
    "Thunder",
    "Fire",
    "Rifle",
    "Bow",
    "Archer",
    "TrackingBow"
  }
  self.AllAmmoBarStyle = {
    "BarFunnel",
    "Single",
    "UnlimitedSingle",
    "Bar"
  }
  self.AllCurState = {"Normal", "Reload"}
  self.SightUI2WeaponStyleNode = {
    Bow01 = "Bow",
    Bow02 = "Bow",
    Bow03 = "Bow",
    Bow04 = "Archer",
    Bow05 = "TrackingBow",
    Shotgun02 = "Bow"
  }
  self.SightUI2AmmoBarStyle = {Shotgun02 = "Bar"}
  self.BarColor = nil
  self.MaxSingleMagazine = 8
  self.CurMagazineCapacity = nil
  self.AllColorIntensty = {}
  self.NextActorRelation = nil
end

function WBP_TakeAimIndicator_C:InitListenEvent()
  EventManager:AddEvent(EventID.ReloadStart, self, self.TryToEnterReloadState)
  EventManager:AddEvent(EventID.ReloadEnd, self, self.TryToLeaveReloadState_End)
  EventManager:AddEvent(EventID.ReloadStop, self, self.TryToLeaveReloadState_Stop)
  EventManager:AddEvent(EventID.OutOfBullet, self, self.ShowOutOfBulletTip)
  EventManager:AddEvent(EventID.FullOfMagazine, self, self.ShowFullOfMagazineTip)
  EventManager:AddEvent(EventID.OnCharForbidWeapon, self, self.HideOrShowTargetAim)
end

function WBP_TakeAimIndicator_C:Init(Player)
  self.OwnerPlayer = Player
  if not IsValid(self.OwnerPlayer) then
    self:Close()
    return
  end
  self.OwnerPlayerCameraComponent = self.OwnerPlayer.CharCameraComponent
  self.Panel_Aim_Melee = self.Aim_Melee
  self.Panel_Aim_BulletReload = self.Panel_Reload
  self.OwnerPlayer.TakeAimIndicator = self
  self:InitListenEvent()
  self:InitAllColorIntensty()
  self:RefreshUIShowPage()
  self.ChangeAimStarColorAndShowBillboardTimer = self:AddTimer(0.1, self.ChangeAimStarColorAndShowBillboard, true, 0.5, "ChangeAimStarColorAndShowBillboardTimer")
  UIManager(self).TakeAimIndicator = self
end

function WBP_TakeAimIndicator_C:InitAllColorIntensty()
  self.AllColorIntensty.Default = UE4.UUIFunctionLibrary.StringToLinearColor(self.AimColorDefault)
  self.AllColorIntensty.ForceDefault = UE4.UUIFunctionLibrary.StringToLinearColor(self.AimColorForceDefault)
  self.AllColorIntensty.Enemy = UE4.UUIFunctionLibrary.StringToLinearColor(self.AimColorEnemy)
  self.AllColorIntensty.Friend = UE.UUIFunctionLibrary.StringToLinearColor(self.AimColorFriend)
end

function WBP_TakeAimIndicator_C:RefreshUIShowPage()
  if not IsValid(self.OwnerPlayer) then
    self.OwnerPlayer = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    if not IsValid(self.OwnerPlayer) then
      return
    end
    self.OwnerPlayer.TakeAimIndicator = self
    self.OwnerPlayerCameraComponent = self.OwnerPlayer.CharCameraComponent
  end
  self.CurrentWeapon = "NeedUpdate"
  self.CurWeaponStyle = "NeedUpdate"
  self.CurWeaponStyleNode = "NeedUpdate"
  self.SightUI = "NeedUpdate"
  self.AmmoBarStyle = "NeedUpdate"
  self:UpdateWeaponInfo(self.OwnerPlayer)
end

function WBP_TakeAimIndicator_C:UpdateWeaponInfo(Owner, LastWeapon, NewWeapon)
  if self.OwnerPlayer ~= Owner then
    return
  end
  if not IsValid(NewWeapon) and IsValid(self.OwnerPlayer) then
    NewWeapon = self.OwnerPlayer:GetCurrentWeapon()
  end
  local NewMagazineCapacity
  if IsValid(NewWeapon) then
    NewMagazineCapacity = NewWeapon:GetAttr("MagazineCapacity")
  end
  if self.CurrentWeapon ~= NewWeapon or self.CurMagazineCapacity ~= NewMagazineCapacity then
    self.CurrentWeapon = NewWeapon
    self.CurMagazineCapacity = NewMagazineCapacity
    local NewSightUI = self:GetWeaponSightUI(self.CurrentWeapon)
    if self.SightUI ~= NewSightUI then
      self.SightUI = NewSightUI
      local NewWeaponStyleNode = self:GetWeaponStyleNode(NewSightUI)
      if self.CurWeaponStyleNode ~= NewWeaponStyleNode then
        self.CurWeaponStyleNode = NewWeaponStyleNode
        self.CurWeaponStyle = self:GetWeaponStyle(self.CurWeaponStyleNode)
        self:SwitchAimStar()
      else
        self:RefreshAimStar()
      end
    end
    local HideMagazineBar = self:GetIsHideMagazineBar(self.CurrentWeapon)
    local NewAmmoBarStyle
    if not HideMagazineBar then
      NewAmmoBarStyle = self:GetAmmoBarStyle(self.CurWeaponStyleNode, self.CurMagazineCapacity, self.SightUI)
    end
    if self.AmmoBarStyle ~= NewAmmoBarStyle then
      self.AmmoBarStyle = NewAmmoBarStyle
      self:SwitchAmmoBar()
    else
      self:RefreshAmmoBar()
    end
  end
end

function WBP_TakeAimIndicator_C:GetWeaponSightUI(Weapon)
  if not IsValid(Weapon) then
    return nil
  end
  local BattleWeaponConfigData = DataMgr.BattleWeapon[Weapon.WeaponId]
  local SightUI
  if BattleWeaponConfigData.FrontSight and BattleWeaponConfigData.FrontSight.SightUI then
    SightUI = BattleWeaponConfigData.FrontSight.SightUI
  end
  return SightUI
end

function WBP_TakeAimIndicator_C:GetIsHideMagazineBar(Weapon)
  if not IsValid(Weapon) then
    return nil
  end
  local BattleWeaponConfigData = DataMgr.BattleWeapon[Weapon.WeaponId]
  local HideMagazineBar
  if BattleWeaponConfigData.FrontSight and BattleWeaponConfigData.FrontSight.HideMagazineBar then
    HideMagazineBar = BattleWeaponConfigData.FrontSight.HideMagazineBar
  end
  return HideMagazineBar
end

function WBP_TakeAimIndicator_C:GetWeaponStyleNode(SightUI)
  if not SightUI then
    return "Melee"
  end
  local WeaponStyleNode = SightUI
  if SightUI and self.SightUI2WeaponStyleNode[SightUI] then
    WeaponStyleNode = self.SightUI2WeaponStyleNode[SightUI]
  end
  return WeaponStyleNode
end

function WBP_TakeAimIndicator_C:GetWeaponStyle(WeaponStyleNode)
  if nil == WeaponStyleNode then
    return "NoWeapon"
  elseif "Melee" == WeaponStyleNode then
    return "Melee"
  else
    return "Ranged"
  end
end

function WBP_TakeAimIndicator_C:SetInPressShootingBtn(IsPress)
  self.IsInPressMouseRight = IsPress
end

function WBP_TakeAimIndicator_C:HideOrShowTargetAim(WeaponTag, IsHide)
  if not IsValid(self.OwnerPlayer) then
    return
  end
  local Widget
  if "Ranged" == WeaponTag then
    local RangedWeapon = self.OwnerPlayer.RangedWeapon
    if IsValid(RangedWeapon) then
      local AllWeaponTags = RangedWeapon:GetWeaponTags()
      for i = 1, AllWeaponTags:Length() do
        local WeaponTagStr = AllWeaponTags:GetRef(i)
        if self["Panel_Aim_" .. WeaponTagStr] ~= nil then
          Widget = self["Panel_Aim_" .. WeaponTagStr]
          break
        end
      end
    end
  else
    Widget = self["Panel_Aim_" .. WeaponTag]
  end
  if nil ~= Widget then
    if IsHide then
      Widget:SetRenderOpacity(0.0)
      if "Ranged" == WeaponTag and nil ~= self.AmmoBarPanel then
        self.AmmoBarPanel:SetRenderOpacity(0.0)
      end
    else
      Widget:SetRenderOpacity(1.0)
      if "Ranged" == WeaponTag and nil ~= self.AmmoBarPanel then
        self.AmmoBarPanel:SetRenderOpacity(1.0)
      end
    end
  end
end

function WBP_TakeAimIndicator_C:GetMeshLocationByShootTarget(ShootTarget)
  local Skill
  if self.OwnerPlayer then
    local SkillId = self.OwnerPlayer:GetSkillByType(UE.ESkillType.Shooting)
    Skill = self.OwnerPlayer:GetSkill(SkillId)
  end
  if not Skill then
    return ShootTarget:K2_GetActorLocation()
  end
  local TargetLocation
  local SkillNodeId = Skill.BeginNodeId
  local SkillNodeConfig = DataMgr.SkillNode[SkillNodeId]
  if not SkillNodeConfig then
    return ShootTarget:K2_GetActorLocation()
  end
  local AllSkillTaskIds = SkillNodeConfig.SkillNodeEffects
  if not AllSkillTaskIds then
    return ShootTarget:K2_GetActorLocation()
  end
  local AimSkeletal
  for _, SkillTaskId in pairs(AllSkillTaskIds) do
    local SkillEffectConfig = DataMgr.SkillEffects[SkillTaskId]
    if SkillEffectConfig.TaskEffects and SkillEffectConfig.TaskEffects[1] and SkillEffectConfig.TaskEffects[1].AimSkeletal then
      AimSkeletal = SkillEffectConfig.TaskEffects[1].AimSkeletal
      break
    end
  end
  if ShootTarget.Mesh and AimSkeletal then
    TargetLocation = ShootTarget.Mesh:GetSocketLocation(AimSkeletal)
  else
    TargetLocation = ShootTarget:K2_GetActorLocation()
  end
  return TargetLocation
end

function WBP_TakeAimIndicator_C:AddAndUpdateFilterShootingTarget(Index, MiniAimWidget, ShootingTarget)
  local TargetLocation = self:GetMeshLocationByShootTarget(ShootingTarget)
  local TargetScreenLocation = FVector2D(0, 0)
  local Controller = self.OwnerPlayer:GetController()
  local IndicatorAngle, PointDistance, IsTargetPointNotInScreen = UE4.UUIFunctionLibrary.ProjectWorldToScreenAsIndicator(Controller, TargetLocation, self.BordSize, TargetScreenLocation, 0, 0)
  local DesignedSize = UIManager(self):GetDesignedScreenSize()
  local ScreenCenterPos = FVector2D(DesignedSize.X * 0.5, DesignedSize.Y * 0.5)
  local ViewPortScale = UE4.UWidgetLayoutLibrary.GetViewportScale(self)
  local RealTargetScreenLocation = FVector2D(TargetScreenLocation.X / ViewPortScale, TargetScreenLocation.Y / ViewPortScale)
  local PointDistance = UE4.UKismetMathLibrary.Distance2D(RealTargetScreenLocation, ScreenCenterPos)
  if PointDistance < 280 then
    local DestCircleDeltaVec = FVector2D(RealTargetScreenLocation.X - ScreenCenterPos.X, RealTargetScreenLocation.Y - ScreenCenterPos.Y)
    local NowCirclePosVec = MiniAimWidget:GetFilterShootingTargetCurPos()
    local ToDestDistance = UE4.UKismetMathLibrary.Distance2D(DestCircleDeltaVec, NowCirclePosVec)
    if ToDestDistance <= 50 or self.LastShootTargetEid[Index] == ShootingTarget.Eid then
      MiniAimWidget:UpdateFilterShootingTargetToPos(DestCircleDeltaVec)
    else
      MiniAimWidget:UpdateFilterShootingTargetTweenToPos(MiniAimWidget.Aim_Node, DestCircleDeltaVec)
    end
  end
  self.LastShootTargetEid[Index] = ShootingTarget.Eid
end

function WBP_TakeAimIndicator_C:UpdateFunnelWeapon()
  self.AllShootingTargets = self.OwnerPlayer:GetShootingTargets()
  if self.AllShootingTargets == nil or nil == self.FunnelAimItem then
    self:ResetFunnelWeaponState()
    return
  end
  local TargetCount = self.AllShootingTargets:Length()
  local IsOpenNormalAir = self.OwnerPlayer:IsOpenNormalAim()
  local IsInShooting = self.OwnerPlayer:CharacterInTag("Shooting")
  if IsInShooting then
    if 0 == TargetCount or not IsOpenNormalAir then
      self:ChangeFunnelWeaponNoTargetState()
      return
    end
  else
    self:ResetFunnelWeaponState()
    return
  end
  self:ChangeFunnelWeaponFireState()
  local AllMiniAimChildren = self.Mini_Aim_Parent:GetAllChildren()
  local MiniAimCount = AllMiniAimChildren:Length()
  for index = 1, TargetCount do
    local ShootingTarget = self.AllShootingTargets:GetRef(index)
    local MiniWidget
    if index <= MiniAimCount then
      MiniWidget = AllMiniAimChildren:GetRef(index)
    end
    if nil == MiniWidget then
      MiniWidget = UE4.UWidgetBlueprintLibrary.Create(self, self.FunnelAimItem)
      MiniWidget:Init(index, ShootingTarget)
      self.Mini_Aim_Parent:AddChildToCanvas(MiniWidget)
    else
      MiniWidget:ReShow(index, ShootingTarget)
    end
    self:AddAndUpdateFilterShootingTarget(index, MiniWidget, ShootingTarget)
  end
  for i = TargetCount + 1, MiniAimCount do
    local NotUseMiniWidget = AllMiniAimChildren:GetRef(i)
    NotUseMiniWidget:StopAllAnimations()
    NotUseMiniWidget.Aim_Node:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_TakeAimIndicator_C:ChangeFunnelWeaponNoTargetState()
  local AllMiniAimChildren = self.Mini_Aim_Parent:GetAllChildren()
  local MiniAimCount = AllMiniAimChildren:Length()
  for index = 1, MiniAimCount do
    local MiniWidget = AllMiniAimChildren:GetRef(index)
    MiniWidget:HideAim()
  end
end

function WBP_TakeAimIndicator_C:ChangeFunnelWeaponFireState()
  if not self:IsAnimationPlaying(self.Funnel_Change) and not self.Mini_Aim_Parent:IsVisible() then
    local function PlayAnimFinished()
      self.Mini_Aim_Parent:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    
    self:BindToAnimationFinished(self.Funnel_Change, {self, PlayAnimFinished})
    self:PlayAnimationForward(self.Funnel_Change)
  end
end

function WBP_TakeAimIndicator_C:ResetFunnelWeaponState()
  if self.Mini_Aim_Parent:IsVisible() and not self:IsAnimationPlaying(self.Funnel_Change) then
    local function PlayAnimFinished()
      self.Mini_Aim_Parent:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    
    self:BindToAnimationFinished(self.Funnel_Change, {self, PlayAnimFinished})
    self:PlayAnimationReverse(self.Funnel_Change)
  end
end

function WBP_TakeAimIndicator_C:Destruct()
  EventManager:RemoveEvent(EventID.ReloadStart, self)
  EventManager:RemoveEvent(EventID.ReloadEnd, self)
  EventManager:RemoveEvent(EventID.ReloadStop, self)
  EventManager:RemoveEvent(EventID.OutOfBullet, self)
  EventManager:RemoveEvent(EventID.FullOfMagazine, self)
  EventManager:RemoveEvent(EventID.OnCharForbidWeapon, self)
  self:RemoveTimer(self.ChangeAimStarColorAndShowBillboardTimer)
  self:RemoveTimer(self.UpdateDiffusionStateTimer)
  self:RemoveTimer(self.UpdateAccumulateStateTimer)
  self:RemoveTimer(self.PlayReloadAnimTimer)
  self:RemoveTimer(self.LerpSetAmmoBarPercentTimer)
  self.ChangeAimStarColorAndShowBillboardTimer = nil
  self.UpdateDiffusionStateTimer = nil
  self.UpdateAccumulateStateTimer = nil
  self.PlayReloadAnimTimer = nil
  self.LerpSetAmmoBarPercentTimer = nil
end

AssembleComponents(WBP_TakeAimIndicator_C)
return WBP_TakeAimIndicator_C
