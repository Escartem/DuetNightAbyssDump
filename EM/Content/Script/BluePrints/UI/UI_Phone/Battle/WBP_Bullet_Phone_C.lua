require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Initialize(Initializer)
end

function M:Construct()
  self.Button_Area.OnPressed:Add(self, self.OnPressed)
  self.OwnerPlayer = UGameplayStatics.GetPlayerCharacter(self, 0)
  self:InitVariable()
end

function M:InitVariable()
  self.CurButtonState = "Normal"
  self.HasReloadSkill = true
  if IsValid(self.RangedWeapon) then
    self:UpdatePlayerWeaponInfo()
  end
  self:PlayButtonStateAnimation()
end

function M:OnPressed()
  self.OwnerPanel:TryToPlayTargetCommand("Reload", true)
  self:OnPressed_Presentation()
end

function M:OnPressed_Presentation()
  if self.CurButtonState == "Ban" then
    UIManager(self):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_RANGED_FORBIDDEN"))
    return
  elseif self.CurButtonState == "Empty" or self.CurButtonState == "Forbidden" then
    return
  end
  if not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Click) then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Click)
  end
end

function M:TryToEnterReloadState()
  self.CurButtonState = "ChangeMagazine"
  self:PlayButtonStateAnimation()
end

function M:UpdatePlayerWeaponInfo()
  if not self.RangedWeapon then
    return
  end
  local MagazineBulletNum = self.RangedWeapon:GetAttr("MagazineBulletNum")
  local BulletNum = self.RangedWeapon:GetAttr("BulletNum")
  local TotalBulletNum = MagazineBulletNum + BulletNum
  if -1 == MagazineBulletNum then
    MagazineBulletNum = GText("INFINITY_SYMBOL")
  end
  if -1 == BulletNum then
    BulletNum = GText("INFINITY_SYMBOL")
  end
  if -2 == TotalBulletNum then
    TotalBulletNum = GText("INFINITY_SYMBOL")
  end
  if self.HasReloadSkill then
    if type(MagazineBulletNum) == "number" and type(BulletNum) == "number" and MagazineBulletNum <= 0 and BulletNum <= 0 then
      if self.CurButtonState ~= "ChangeMagazine" then
        self.CurButtonState = "Forbidden"
        self:PlayButtonStateAnimation()
      end
    elseif type(MagazineBulletNum) == "number" and MagazineBulletNum <= 0 then
      if self.CurButtonState ~= "ChangeMagazine" then
        self.CurButtonState = "EmptyMagazine"
        self:PlayButtonStateAnimation()
      end
    else
      self.CurButtonState = "Normal"
      self:PlayButtonStateAnimation()
    end
  else
    self.CurButtonState = "NoReloadSkill"
    self:PlayButtonStateAnimation()
  end
  if self.MagazineUIType == "NoMagazine" then
    self.Num_Bullet:SetText(tostring(TotalBulletNum))
    if type(TotalBulletNum) == "number" and TotalBulletNum <= 0 then
      self.Switcher_Bullet:SetActiveWidgetIndex(1)
    else
      self.Switcher_Bullet:SetActiveWidgetIndex(0)
    end
  else
    self.Num_Bullet:SetText(tostring(MagazineBulletNum))
    self.Total_Bullet:SetText(tostring(BulletNum))
    if type(MagazineBulletNum) == "number" and MagazineBulletNum <= 0 then
      self.Switcher_Bullet:SetActiveWidgetIndex(1)
    else
      self.Switcher_Bullet:SetActiveWidgetIndex(0)
    end
  end
end

function M:PlayButtonStateAnimation()
  if self.LastCurButtonState == self.CurButtonState then
    return
  end
  if self.CurButtonState == "Normal" then
    if not self:IsAnimationPlaying(self.Normal) then
      self:PlayAnimationForward(self.Normal)
    end
  elseif self.CurButtonState == "Forbidden" then
    self.Switcher_Bullet:SetActiveWidgetIndex(1)
    if not self:IsAnimationPlaying(self.Forbidden) then
      self:PlayAnimationForward(self.Forbidden)
    end
  elseif self.CurButtonState == "EmptyMagazine" then
    if not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.EmptyMagazine) then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.EmptyMagazine)
    end
  elseif self.CurButtonState == "ChangeMagazine" then
    if not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.ChangeMagazine) then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.ChangeMagazine)
    end
  elseif self.CurButtonState == "Ban" then
    if not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Ban) then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Ban)
    end
  elseif self.CurButtonState == "NoReloadSkill" and not self:IsAnimationPlaying(self.NoReloadSkill) then
    self:PlayAnimation(self.NoReloadSkill)
  end
  self.LastCurButtonState = self.CurButtonState
end

function M:HandleCurButtonState(CurButtonState)
  if "ChangeMagazine" == CurButtonState and (self.OwnerPlayer.CurrentSkillId ~= self.OwnerPlayer:GetSkillByType(UE.ESkillType.Reload) or not IsValid(self.OwnerPlayer:GetCurrentWeapon())) then
    self.CurButtonState = "Normal"
    self:PlayButtonStateAnimation()
  end
end

function M:UpdateButtonInTimer()
  self:HandleCurButtonState(self.CurButtonState)
end

function M:UpdateBulletType()
  local RangedWeapon
  if -1 ~= self.OwnerPlayer.BuffManager.UseSummonWeapon then
    local WeaponId = self.OwnerPlayer.UltraWeapon.WeaponId
    local WeaponTags = DataMgr.BattleWeapon[WeaponId].WeaponTag
    if CommonUtils.HasValue(WeaponTags, "Ranged") then
      RangedWeapon = self.OwnerPlayer.UltraWeapon
    else
      RangedWeapon = self.OwnerPlayer.RangedWeapon
    end
  else
    RangedWeapon = self.OwnerPlayer.RangedWeapon
  end
  if not IsValid(RangedWeapon) then
    self.RangedWeapon = nil
    return
  end
  self.RangedWeapon = RangedWeapon
  local WeaponId = RangedWeapon.WeaponId
  self.MagazineUIType = DataMgr.BattleWeapon[WeaponId].MagazineUIType
  if self.MagazineUIType == "NoMagazine" then
    self.Split:SetVisibility(ESlateVisibility.Collapsed)
    self.Total_Bullet:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Split:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Total_Bullet:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  local BulletIcon = DataMgr.BattleWeapon[WeaponId].BulletIcon
  local BulletIconObj, Path
  if BulletIcon then
    Path = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_" .. BulletIcon
  else
    Path = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Bullet"
  end
  UE.UResourceLibrary.LoadObjectAsync(self, Path, {
    self,
    M.OnBulletIconLoadFinish
  })
  local WeaponSkills = RangedWeapon:GetSkills()
  self.HasReloadSkill = false
  for _, SkillId in pairs(WeaponSkills) do
    local SkillType = DataMgr.Skill[SkillId][1][0].SkillType
    if "Reload" == SkillType then
      self.HasReloadSkill = true
      break
    end
  end
  self:UpdatePlayerWeaponInfo()
end

function M:OnBulletIconLoadFinish(Object)
  if IsValid(self) and Object and self.Icon_Bullet then
    self.Icon_Bullet:SetBrushResourceObject(Object)
  end
end

return M
