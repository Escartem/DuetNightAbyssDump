local Component = {}

function Component:SwitchAmmoBar()
  local Widget
  if self.AmmoBarStyle then
    Widget = self["Panel_Ammo_" .. self.AmmoBarStyle]
    if not Widget then
      Widget = UIManager(self):_CreateWidgetNew("BattleAmmo" .. self.AmmoBarStyle)
      Widget:Init(self)
      self["Panel_Ammo_" .. self.AmmoBarStyle] = Widget
      self.Panel_Ammo:AddChild(Widget)
    end
  end
  if self.AmmoBarPanel then
    self.LastAmmoBarPanel = self.AmmoBarPanel
  end
  self.AmmoBarPanel = Widget
  if self.LastAmmoBarPanel then
    self.LastAmmoBarPanel:SwitchOut()
  end
  if self.AmmoBarPanel then
    self.AmmoBarPanel:SwitchIn()
    self:RefreshAmmoBar()
  end
end

function Component:RefreshAmmoBar()
  if self.AmmoBarPanel and self.AmmoBarPanel.Refresh then
    self.AmmoBarPanel:Refresh()
  end
end

function Component:IsNoBullets()
  local Skill
  if IsValid(self.OwnerPlayer) then
    local SkillId = self.OwnerPlayer:GetSkillByType(UE.ESkillType.Shooting)
    Skill = self.OwnerPlayer:GetSkill(SkillId)
  end
  local RangedWeapon = self.OwnerPlayer.RangedWeapon
  if IsValid(RangedWeapon) then
    if Skill then
      local SkillNodeId = Skill.BeginNodeId
      local SkillNodeConfig = DataMgr.SkillNode[SkillNodeId]
      if not SkillNodeConfig then
        return false
      end
      return not RangedWeapon:IsAllBulletEnough(SkillNodeConfig.CostBullet or 0)
    end
    return not RangedWeapon:IsAllBulletEnough(0)
  end
  return false
end

function Component:ShowOutOfBulletTip()
  UIManager(self):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, "BATTLE_BULLETNUMZERO")
  if self:IsNoBullets() then
    self:PlayOutOfBulletAnim()
  end
end

function Component:ShowFullOfMagazineTip()
  UIManager(self):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, "BATTLE_MAGAZINECAPACITYMAX")
end

function Component:PlayOutOfBulletAnim()
  if self.AmmoBarPanel and self.AmmoBarPanel.PlayOutOfBulletAnim then
    self.AmmoBarPanel:PlayOutOfBulletAnim()
  end
end

function Component:LerpSetAmmoBarPercentInTick(DeltaTime)
  if self.IsLerpSetAmmo and self.AmmoBarPanel and self.AmmoBarPanel.LerpSetAmmoBarPercentInTick then
    self.AmmoBarPanel:LerpSetAmmoBarPercentInTick(DeltaTime)
  end
end

function Component:UpdateAmmoBarProgress(bLerp)
  if self.AmmoBarPanel and self.AmmoBarPanel.UpdateAmmoBarProgress then
    if not IsValid(self.CurrentWeapon) then
      return
    end
    self.AmmoBarPanel:UpdateAmmoBarProgress(bLerp)
    self:UpdateAimStarOpacity()
  end
end

function Component:TryToEnterReloadState()
  if not IsValid(self.CurrentWeapon) then
    return
  end
  if self:ShouldNotKeepReloading() then
    return
  end
  if self.CurState == "Reload" then
    return
  end
  self:EnterReloadState()
end

function Component:EnterReloadState()
  self.Panel_Target:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_Kill:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:RealEnterReloadState()
end

function Component:RealEnterReloadState()
  self.CurState = "Reload"
  self:SwitchAimStar("BulletReload")
  self.AmmoBarPanel:RealEnterReloadState()
end

function Component:PlayReloadAnimInTick(DeltaTime)
  if self.IsReloadingBar and self.AmmoBarPanel and self.AmmoBarPanel.PlayReloadAnimInTick then
    self.AmmoBarPanel:PlayReloadAnimInTick(DeltaTime)
  end
end

function Component:ShouldNotKeepReloading()
  if not IsValid(self.CurrentWeapon) then
    return true
  end
  local MagazineBulletNum = self.CurrentWeapon:GetAttr("MagazineBulletNum")
  local BulletNum = self.CurrentWeapon:GetAttr("BulletNum")
  return BulletNum <= 0 or MagazineBulletNum >= self.CurMagazineCapacity
end

function Component:GetFirstReloadAnimPlayTime()
  if not IsValid(self.OwnerPlayer) or self.OwnerPlayer.GetCurMontageNotifyEventsTriggerTime == nil then
    return
  end
  local TriggerTimeInfos = self.OwnerPlayer:GetCurMontageNotifyEventsTriggerTime():ToTable()
  local Hit1Name = "\230\149\136\230\158\156:hit1"
  local Hit1_TriggerTime = TriggerTimeInfos[Hit1Name]
  return Hit1_TriggerTime or 0
end

function Component:GetAmmoBarStyle(WeaponStyleNode, MagazineCapacity, SightUI)
  if SightUI and self.SightUI2AmmoBarStyle[SightUI] then
    return self.SightUI2AmmoBarStyle[SightUI]
  elseif "Melee" == WeaponStyleNode or "Bow" == WeaponStyleNode or "Archer" == WeaponStyleNode or "TrackingBow" == WeaponStyleNode or "AimStarButterfly" == WeaponStyleNode then
    return nil
  elseif "Funnel" == WeaponStyleNode then
    return "BarFunnel"
  elseif "Cannon" == WeaponStyleNode then
    if MagazineCapacity > self.MaxSingleMagazine then
      return "UnlimitedSingle"
    else
      return "Single"
    end
  else
    return "Bar"
  end
end

function Component:IsReloadBreaked()
  if self.OwnerPlayer.CurrentSkillId ~= self.OwnerPlayer:GetSkillByType(UE.ESkillType.Reload) or not IsValid(self.CurrentWeapon) then
    return true
  else
    return false
  end
end

function Component:TryToLeaveReloadState_End()
  if self.CurState == "Reload" and self.AmmoBarPanel and self.AmmoBarPanel.TryToLeaveReloadState then
    self.AmmoBarPanel:TryToLeaveReloadState("LeaveNormal")
  end
end

function Component:TryToLeaveReloadState_Stop()
  if self.CurState == "Reload" and self.AmmoBarPanel and self.AmmoBarPanel.TryToLeaveReloadState then
    self.AmmoBarPanel:TryToLeaveReloadState("Break")
  end
end

function Component:LeaveReloadState(Reason)
  if self.AmmoBarPanel and self.AmmoBarPanel.LeaveReloadState then
    self.CurState = "Normal"
    self:SwitchAimStar()
    self.AmmoBarPanel:LeaveReloadState(Reason)
  end
end

return Component
