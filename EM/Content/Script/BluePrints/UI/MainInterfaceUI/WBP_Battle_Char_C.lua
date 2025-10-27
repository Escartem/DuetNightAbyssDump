require("UnLua")
local CommonUtils = require("Utils.CommonUtils")
local EMCache = require("EMCache.EMCache")
local Const = require("Const")
local WBP_Battle_Char_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Battle_Char_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.CharHpPercent = 1.0
  self.CharShieldPercent = 1.0
  self.HelpCharHpPercent = 1.0
  self.HelpCharShieldPercent = 1.0
  self.TickTime = 0.1
  self.AnimTime = 0.5
  self.FixTime = 1.0
  self.NowTime = nil
  self.Hp = 0.0
  self.Shield = 0.0
  self.MaxHp = 0.0
  self.MaxShield = 0.0
  self.OverShield = 0.0
  self.IsLowHealth = false
  self.IsOverShield = false
  self.LastHp = 0.0
  self.LastShield = 0.0
  self.LastOverShield = 0.0
  self.Owner = nil
  self.RoleId = nil
  self.NowEid = nil
  self.IsShowDeductBlood = false
  self.IsShowDeductShield = false
end

function WBP_Battle_Char_C:Construct()
  self.Overridden.Construct(self)
  self:InitCharEvent()
end

function WBP_Battle_Char_C:InitCharEvent()
  self:AddDispatcher(EventID.ShowMainPlayerBlood, self, self.UpdateState)
  self:AddDispatcher(EventID.CharDie, self, self.CharDie)
  self:AddDispatcher(EventID.CharRecover, self, self.CharRecovery)
  self:AddDispatcher(EventID.OnCharLevelUpInBattle, self, self.OnUpdateCharLevelAndExp)
  self:AddDispatcher(EventID.OnUpdateCharExp, self, self.OnUpdateCharLevelAndExp)
  self:AddDispatcher(EventID.OnMainCharacterInitReady, self, self.OnMainCharacterInitReady)
  self:AddDispatcher(EventID.OnShowMainPlayerHealEvent, self, self.OnShowMainPlayerHealEvent)
end

function WBP_Battle_Char_C:OnMainCharacterInitReady()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(Player) then
    return
  end
  self:GetCharacter(Player)
end

function WBP_Battle_Char_C:GetCharacter(Character)
  self.Owner = Character
  self.NowEid = self.Owner.Eid
  self.RoleId = self.Owner.CurrentRoleId
  self:InitChar()
  self:OnUpdateCharLevelAndExp()
  self:PlayAnimation(self.Main_In)
  self:AddTimer(1.0, self.CheckMaxHpAndShieldChange, true, 0, "CheckMaxHpAndShieldChange")
end

function WBP_Battle_Char_C:InitChar()
  self.MaxHp = self.Owner:GetMaxBloodVolume()
  self.MaxShield = self.Owner:GetAttr("MaxES")
  self.Hp = self.Owner:GetAttr("Hp")
  self.LastHp = self.Hp
  self.Shield = self.Owner:GetAttr("ES")
  self.LastShield = self.Shield
  self.OverShield = self.Owner:GetAttr("OverShield")
  self.LastOverShield = self.OverShield
  if 0 == self.MaxShield and 0 == self.MaxHp then
    return
  end
  self.CharHpPercent = math.min(math.max(self.Hp / self.MaxHp, 0), 1)
  self.HelpCharHpPercent = self.CharHpPercent
  self.CharShieldPercent = math.min(math.max(self.Shield / self.MaxShield, 0), 1)
  self.HelpCharShieldPercent = self.CharShieldPercent
  if self.MaxShield > 0 then
    if self.Owner.UIModePlatform == "PC" then
      self:ResetShieldBarSize()
      self.bg_shield:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Shield_Bar:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Shield_Deduct:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Char_Shield_Bar:SetSize(FVector2D(self.ShieldBarLength * self.CharShieldPercent, self.ShieldBarHeight))
      self.Char_Shield_Deduct:SetSize(FVector2D(self.ShieldBarLength * self.HelpCharShieldPercent, self.ShieldBarHeight))
      self:UpdateShieldEffect()
    end
  elseif self.Owner.UIModePlatform == "PC" then
    self:ResetShieldBarSize()
    self.bg_shield:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Shield_Bar:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Shield_Deduct:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.DeductShield:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.Char_Blood_Bar = self.Bar_Blood
  self.Char_Blood_Deduct = self.Bar_Blood_Deduct
  self.Char_Blood_Bar:SetPercent(self.CharHpPercent)
  self.Char_Blood_Bar:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Char_Blood_Deduct:SetPercent(self.HelpCharHpPercent)
  self.Char_Blood_Deduct:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if not self.IsShowDeductBlood then
    self.Char_Blood_Deduct:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.DeductBlood:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if not self.IsShowDeductShield then
    self.Shield_Deduct:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.DeductShield:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self:UpdateBloodEffect()
  self:SetBloodNum()
  self:SetShieldNum()
end

function WBP_Battle_Char_C:ResetShieldBarSize()
  local CanvasSlot1 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.bg_shield)
  self.Char_Shield_Bar = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Shield_Bar)
  self.Char_Shield_Deduct = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Shield_Deduct)
  self.BloodEffect = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.DeductBlood)
  self.ShieldEffect = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.DeductShield)
  local BarSize1 = CanvasSlot1:GetSize()
  local BarSize2 = self.Char_Shield_Bar:GetSize()
  self.ShieldBarLength = BarSize1.X
  self.ShieldBarHeight = BarSize2.Y
  self.EffectHeight = self.BloodEffect:GetSize().Y
end

function WBP_Battle_Char_C:UpdateBloodEffect()
  local Percent = math.min(math.max((self.LastHp - self.Hp) / self.MaxHp, 0), 1)
  self.BloodEffect:SetSize(FVector2D(self.ShieldBarLength * Percent, self.EffectHeight))
  self.BloodEffect:SetPosition(FVector2D(self.ShieldBarLength * self.CharHpPercent, self.BloodEffect:GetPosition().Y))
  self:PlayAnimation(self.Deduct_Blood)
end

function WBP_Battle_Char_C:UpdateShieldEffect()
  local Percent = math.min(math.max((self.LastShield - self.Shield) / self.MaxShield, 0), 1)
  self.ShieldEffect:SetSize(FVector2D(self.ShieldBarLength * Percent, self.EffectHeight))
  self.ShieldEffect:SetPosition(FVector2D(self.ShieldBarLength * self.CharShieldPercent, self.ShieldEffect:GetPosition().Y))
  self:PlayAnimation(self.Deduct_Shield)
end

function WBP_Battle_Char_C:OnUpdateCharLevelAndExp()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if not IsValid(self.Owner) then
    return
  end
  local NowLevel = self.Owner:GetAttr("Level")
  self.Lv:SetText(GText("BATTLE_UI_BLOOD_LV"))
  self.Text_Lv:SetText(NowLevel)
end

function WBP_Battle_Char_C:UpdateState()
  if not IsValid(self.Owner) then
    return
  end
  self.NowTime = UE4.UGameplayStatics.GetTimeSeconds(self)
  self.StartReduceTime = self.NowTime
  self.LastHp = self.Hp
  self.LastShield = self.Shield
  self.LastOverShield = self.OverShield
  self.OverShield = self.Owner:GetAttr("OverShield")
  self.Hp = self.Owner:GetAttr("Hp")
  if self.Hp > self.LastHp then
    self.CharHpPercent = math.min(math.max(self.Hp / self.MaxHp, 0), 1)
    self.HelpCharHpPercent = self.CharHpPercent
    self.Char_Blood_Bar:SetPercent(self.CharHpPercent)
    self.Char_Blood_Deduct:SetPercent(self.HelpCharHpPercent)
    self.DeductBlood:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.Shield = self.Owner:GetAttr("ES")
  self.HpReduce = self.LastHp - self.Hp
  self.ShieldReduce = self.LastShield - self.Shield
  self.HelpCharHpPercent = math.max(self.HelpCharHpPercent, self.Char_Blood_Bar.Percent)
  self.HelpCharShieldPercent = math.max(self.HelpCharShieldPercent, self.Char_Shield_Bar:GetSize().X / self.ShieldBarLength)
  self.CharHpPercent = math.min(math.max(self.Hp / self.MaxHp, 0), 1)
  if self.Hp == self.MaxHp and self.IsPlayingReturning then
    self:StopAnimation(self.Blood_Returning)
    self:PlayAnimation(self.Return_End)
    self.IsPlayingReturning = false
  end
  self:SetBloodNum()
  local IsRealReduceBlood = self.CharHpPercent < self.Char_Blood_Bar.Percent
  self.Char_Blood_Bar:SetPercent(self.CharHpPercent)
  if self.LastShield > self.Shield or self.LastHp > self.Hp then
    self:PlayAnimation(self.Hit)
  end
  if self.MaxShield <= 0 then
    self.Char_Shield_Bar:SetSize(FVector2D(self.ShieldBarLength * 0, self.ShieldBarHeight))
    self:SetShieldNum()
  elseif self.ShieldReduce < 0 then
    self:RecoveryShield()
    self.DeductShield:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self:SetShieldNum()
    self.CharShieldPercent = math.min(math.max(self.Owner:GetAttr("ES") / self.MaxShield, 0), 1)
    self.DeductShield:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    local ShieldPercent = self.Char_Shield_Bar:GetSize().X / self.ShieldBarLength
    self.FixTime = ShieldPercent > self.CharShieldPercent and 1.0 or 0.0
    self.Char_Shield_Bar:SetSize(FVector2D(self.ShieldBarLength * self.CharShieldPercent, self.ShieldBarHeight))
    if self.Shield > 1.0E-5 then
      self:UpdateShieldEffect()
    elseif self.LastShield >= 1 then
      self:PlayAnimation(self.Sheild_Broken)
    end
    self:DecreaseShield()
  end
  if IsRealReduceBlood then
    self.DeductBlood:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self:UpdateBloodEffect()
    self:DecreaseBlood()
  end
end

function WBP_Battle_Char_C:SetShieldNum(DelayShield)
  self.Num_Shield:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if self.MaxHp > 0 and self.MaxShield <= 1.0E-4 and self.OverShield <= 1.0E-4 then
    self.Num_Shield:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Num_Shield:SetText("0")
  end
  if self.OverShield > 0 then
    self.Num_Shield:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if self.LastOverShield < self.OverShield then
      self.IsOverShield = true
      self:UnbindAllFromAnimationFinished(self.Shield_Overload)
      
      local function PlayAnimFinished()
        self:PlayAnimation(self.Shield_Overload_Remind)
      end
      
      self:PlayAnimation(self.Shield_Overload)
      self:BindToAnimationFinished(self.Shield_Overload, {self, PlayAnimFinished})
    end
    if DelayShield then
      self.Num_Shield:SetText(math.floor(DelayShield + self.OverShield))
      return
    end
    self.Num_Shield:SetText(math.floor(self.Shield + self.OverShield))
  else
    if self.IsOverShield then
      self:UnbindAllFromAnimationFinished(self.Shield_Overload)
      self:StopAnimation(self.Shield_Overload)
      self:PlayAnimationReverse(self.Shield_Overload)
    end
    self.IsOverShield = false
    if DelayShield then
      self.Num_Shield:SetText(math.floor(DelayShield))
      return
    end
    self.Num_Shield:SetText(math.floor(self.Shield))
  end
end

function WBP_Battle_Char_C:SetBloodNum()
  self.Num_Blood:SetText(math.floor(self.Hp))
  if self.CharHpPercent > 0.3 then
    self.Char_Blood_Deduct.WidgetStyle.FillImage.TintColor = self.HighDeductBloodBarTintColor
    if self:IsExistTimer("PlayWarningAnimation") then
      self:RemoveTimer("PlayWarningAnimation")
      self:StopAnimation(self.Health_Warning)
    end
    if self.IsLowHealth then
      self:StopAnimation(self.Health_Low)
      self:PlayAnimationReverse(self.Health_Low)
    end
    self.IsLowHealth = false
  else
    self.Char_Blood_Deduct.WidgetStyle.FillImage.TintColor = self.LowDeductBloodBarTintColor
    if self.IsLowHealth == false then
      self:PlayAnimation(self.Health_Low)
      local AnimTime = self.Health_Warning:GetEndTime()
      
      local function PlayWarningAnimation()
        self:PlayAnimation(self.Health_Warning)
      end
      
      self:AddTimer(AnimTime, PlayWarningAnimation, true, 0, "PlayWarningAnimation")
    end
    self.IsLowHealth = true
  end
end

function WBP_Battle_Char_C:OnShowMainPlayerHealEvent(HealEvent)
  if self.Hp == self.MaxHp then
    if self.IsPlayingReturning then
      self:StopAnimation(self.Blood_Returning)
      self:PlayAnimation(self.Return_End)
      self.IsPlayingReturning = false
    end
    return
  end
  if self.IsCharInHotUI then
    self:UpdateCharHotUIState(true)
    return
  end
  local IsHaveHot = false
  if HealEvent.DamageTag then
    for key, value in pairs(HealEvent.DamageTag) do
      if "Hot" == value then
        IsHaveHot = true
      end
    end
  end
  if not self.IsCharInHotUI and not IsHaveHot then
    self:PlayAnimation(self.Blood_Return)
  end
end

function WBP_Battle_Char_C:UpdateCharHotUIState(HotUI)
  self.IsCharInHotUI = HotUI
  if self.Hp == self.MaxHp then
    if self.IsPlayingReturning then
      self:StopAnimation(self.Blood_Returning)
      self:PlayAnimation(self.Return_End)
      self.IsPlayingReturning = false
    end
    return
  end
  if HotUI then
    self:PlayAnimation(self.Blood_Returning)
    self.IsPlayingReturning = true
  else
    self:StopAnimation(self.Blood_Returning)
    self:PlayAnimation(self.Return_End)
    self.IsPlayingReturning = false
  end
end

function WBP_Battle_Char_C:RecoveryShield()
  local TickTime = 0.033
  local AnimTime = 1.0
  
  local function ShieldRecoveryFunc()
    local NowTime = UE4.UGameplayStatics.GetTimeSeconds(self)
    local PassedTime = NowTime - self.NowTime
    if PassedTime >= AnimTime then
      self:RemoveTimer("RealRecoveryShield")
      self.CharShieldPercent = math.min(math.max(self.Owner:GetAttr("ES") / self.MaxShield, 0), 1)
      self.Char_Shield_Bar:SetSize(FVector2D(self.ShieldBarLength * self.CharShieldPercent, self.ShieldBarHeight))
      self:SetShieldNum()
      self.HelpCharShieldPercent = self.CharShieldPercent
      self.Char_Shield_Deduct:SetSize(FVector2D(self.ShieldBarLength * self.HelpCharShieldPercent, self.ShieldBarHeight))
    end
    local DelayShield = math.min(math.floor(self.Shield + self.ShieldReduce * (1 - (NowTime - self.NowTime) / AnimTime)), self.MaxShield)
    self.CharShieldPercent = math.min(math.max(DelayShield / self.MaxShield, 0), 1)
    self.Char_Shield_Bar:SetSize(FVector2D(self.ShieldBarLength * self.CharShieldPercent, self.ShieldBarHeight))
    self:SetShieldNum(DelayShield)
    self.HelpCharShieldPercent = self.CharShieldPercent
    self.Char_Shield_Deduct:SetSize(FVector2D(self.ShieldBarLength * self.HelpCharShieldPercent, self.ShieldBarHeight))
  end
  
  self:AddTimer(TickTime, ShieldRecoveryFunc, true, 0, "RealRecoveryShield")
end

function WBP_Battle_Char_C:DecreaseShield()
  if self:IsExistTimer("RealRecoveryShield") then
    self.HelpCharShieldPercent = self.Char_Shield_Deduct:GetSize().X / self.ShieldBarLength
    self:RemoveTimer("RealRecoveryShield")
  end
  if self:IsExistTimer("RealReduceShield") then
    self.HelpCharShieldPercent = self.Char_Shield_Deduct:GetSize().X / self.ShieldBarLength
    self:RemoveTimer("RealReduceShield")
  end
  if not self.IsShowDeductShield then
    return
  end
  
  local function WrapShieldFunc()
    local NowTime = UE4.UGameplayStatics.GetTimeSeconds(self)
    local PassedTime = NowTime - self.NowTime
    if PassedTime >= self.AnimTime + 1.0 then
      self:RemoveTimer("RealReduceShield")
      self.HelpCharShieldPercent = self.CharShieldPercent
      self.Char_Shield_Deduct:SetSize(FVector2D(self.ShieldBarLength * self.HelpCharShieldPercent, self.ShieldBarHeight))
      return
    end
    local DelayShield = self.HelpCharShieldPercent - self.CharShieldPercent
    self.HelpCharShieldPercent = self.CharShieldPercent + DelayShield * (self.AnimTime + 1.0 - PassedTime) / self.AnimTime
    self.Char_Shield_Deduct:SetSize(FVector2D(self.ShieldBarLength * self.HelpCharShieldPercent, self.ShieldBarHeight))
  end
  
  self:AddTimer(self.TickTime, WrapShieldFunc, true, 1.0, "RealReduceShield")
end

function WBP_Battle_Char_C:DecreaseBlood()
  if self:IsExistTimer("RealReduceBlood") then
    self.HelpCharHpPercent = self.Char_Blood_Deduct.Percent
    self:RemoveTimer("RealReduceBlood")
  end
  if not self.IsShowDeductBlood then
    return
  end
  
  local function WrapFunc()
    if self:IsExistTimer("RealReduceShield") then
      self.StartReduceTime = UE4.UGameplayStatics.GetTimeSeconds(self)
      return
    end
    local NowTime = UE4.UGameplayStatics.GetTimeSeconds(self)
    local PassedTime = NowTime - self.StartReduceTime
    if PassedTime >= self.AnimTime + self.FixTime then
      self:RemoveTimer("RealReduceBlood")
      self.Char_Blood_Deduct:SetPercent(self.CharHpPercent)
      self.HelpCharHpPercent = self.CharHpPercent
      return
    end
    local DelayBlood = self.HelpCharHpPercent - self.CharHpPercent
    self.HelpCharHpPercent = self.CharHpPercent + DelayBlood * (self.AnimTime + self.FixTime - PassedTime) / self.AnimTime
    self.Char_Blood_Deduct:SetPercent(self.HelpCharHpPercent)
  end
  
  self:AddTimer(self.TickTime, WrapFunc, true, self.FixTime, "RealReduceBlood")
end

function WBP_Battle_Char_C:CheckChangeRole()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(Player) then
    return
  end
  local NewRoleId = Player.CurrentRoleId
  if self.RoleId ~= nil and self.RoleId ~= NewRoleId and 0 ~= NewRoleId then
    self:GetCharacter(Player)
  end
end

function WBP_Battle_Char_C:CheckMaxHpAndShieldChange()
  if self:IsVisible() == false then
    return
  end
  local NowMaxHp = self.Owner:GetMaxBloodVolume()
  local NowMaxShield = self.Owner:GetAttr("MaxES")
  if self.MaxHp ~= NowMaxHp or self.MaxShield ~= NowMaxShield then
    self:InitChar()
  end
end

function WBP_Battle_Char_C:CharRecovery(Eid)
  if self.NowEid == Eid then
    self:InitChar()
    self:PlayAnimation(self.Main_In)
  end
end

return WBP_Battle_Char_C
