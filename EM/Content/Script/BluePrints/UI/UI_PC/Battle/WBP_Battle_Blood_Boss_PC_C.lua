require("UnLua")
local CommonConst = require("CommonConst")
local Const = require("Const")
local BloodBarUtils = require("BluePrints.UI.BloodBar.BloodBarUtils")
local WBP_Battle_Blood_Boss_PC_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Battle_Blood_Boss_PC_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.ShowES = true
end

function WBP_Battle_Blood_Boss_PC_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:InitBossUI(...)
end

function WBP_Battle_Blood_Boss_PC_C:InitBossUI(Owner, IsBossInPart, BossUIType)
  self.Owner = Owner
  self.IsBossInPart = IsBossInPart
  self.BossUIType = BossUIType
  self:K2_SetBuffsOwner(self.Owner)
  
  local function DoInit()
    if not self.Owner or not self.Owner.BillboardComponent then
      return
    end
    self:RemoveTimer("DelayInitBossBloodUI")
    self:RegisterOnBuffsChangedDelegate()
    self:InitBossComponent()
    if self.Owner.BillboardComponent then
      self.Owner.BillboardComponent.bNeedUpdateBossUI = true
    end
    self.InitSuccess = true
  end
  
  if not self.Owner.BillboardComponent and IsClient(self) then
    self:AddTimer(0.1, DoInit, true, 0, "DelayInitBossBloodUI")
  else
    DoInit()
  end
end

function WBP_Battle_Blood_Boss_PC_C:InitBossComponent()
  if self.Owner:IsBossMonster() then
    if DataMgr.Monster[self.Owner.UnitId].BossUIValues.PhaseValues ~= nil then
      self.PhaseValues = DataMgr.Monster[self.Owner.UnitId].BossUIValues.PhaseValues
    else
      self.IsBossInPart = false
      self.PhaseValues = {1}
    end
    if nil ~= DataMgr.Monster[self.Owner.UnitId].BossUIValues.ShowES then
      self.ShowES = DataMgr.Monster[self.Owner.UnitId].BossUIValues.ShowES
    end
    self.ToughnessHit = DataMgr.BattleMonster[self.Owner.Data.BattleRoleId].DeductToughnessHit or {}
    self.Part_Count = #self.PhaseValues
    local Sum = 0
    for i = 1, self.Part_Count do
      Sum = Sum + self.PhaseValues[i]
    end
    if 1 == self.Part_Count or self.Part_Count > CommonConst.BOSS_BLOOD_PART_MAX or Sum > 1.00000001 or Sum < 0.999999999999 then
      self.IsBossInPart = false
    end
    self.IsShowToughnessBar = true
  else
    self.IsBossInPart = false
    self.PhaseValues = {1}
    self.ToughnessHit = {}
    self.IsShowToughnessBar = false
  end
  self.Num_Lv_BP_1:SetText(GText("BATTLE_UI_BLOOD_LV"))
  self.Boss_Part:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.SizeBox_Toughness:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:SetBossBarPosition()
  self:InitBossParams()
  self:InitBossConfig()
  self:ResetBossPart()
  self.SizeBox_BossHP:ClearChildren()
  self.Group_BuffRoot:ClearChildren()
  self.HpBar = BloodBarUtils.LoadSubWidget(self, self.SizeBox_BossHP, "HPBar", true, self.BloodBarLenght, self.Hp / self.MaxHp)
  self.WeaknessBar = BloodBarUtils.LoadSubWidget(self, self.Group_BuffRoot, "BuffBar", true)
  if self.WeaknessBar then
    local Slot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.WeaknessBar)
    Slot:SetAutoSize(true)
  end
  self:InitBossWeakness()
  self:InitChargeBar()
  self:InitBossEvent()
  if not self.Owner:IsBossMonster() then
    self:AddTimer(self.BossTickTime, function()
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Bar_In)
    end)
  else
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self:AddTimer(0.1, function()
      if not self.Owner.bHidden then
        self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        self:OutHideTag()
        self:RemoveTimer("CheckCanShow")
      end
    end, true, 0, "CheckCanShow")
  end
  self:UpdateBossInvincibleState()
end

function WBP_Battle_Blood_Boss_PC_C:InitBossParams()
  self.MaxHp = self.Owner:GetMaxBloodVolume()
  self.Hp = self.Owner:GetCurrentBloodVolume()
  self.LastHp = self.Hp
  self.Shield = self.Owner:GetAttr("ES") or 0
  self.LastShield = self.Shield
  self.MaxShield = self.Owner:GetAttr("MaxES") or 0
  self.BossUIBuffs = nil
  self.Panel_Invincible = {}
  self.BossTickTime = 0.033
  self.BossAnimTime = Const.BloodBarAnimTime
  self.BossDelayTime = Const.BloodBarDelayTime
  self.LastAttackTime = 0
  self.ComboAttackTime = 0.3
  self.FixTime = 1.0
  self.BossHpPercent = 1.0
  self.BossShieldPercent = 1.0
  self.BossTNPercent = 1.0
  self.LastTNPercent = 1.0
  self.HelpBossTNPercent = 1.0
  self.LastTN = 0.0
  self.NowTN = 0.0
  self.TNDeductEffectHeight = 0.0
  self.TNEqualZero = false
  self.IsPlayHitAnimation = false
  self.CanShowBossTouughness = true
  if self.Owner.Data.BossUIValues and self.Owner.Data.BossUIValues.HideTNUI then
    self.CanShowBossTouughness = not self.Owner.Data.BossUIValues.HideTNUI
  end
  self.CanShowPanelTip = true
  self.WeaknessList = {}
  self.InvincinbleTags = {}
end

function WBP_Battle_Blood_Boss_PC_C:ShowToughnessBar(IsShow)
  if not self.IsShowToughnessBar then
    return
  end
  self.SizeBox_Toughness:SetVisibility(IsShow and ESlateVisibility.SelfHitTestInvisible or ESlateVisibility.Collapsed)
end

function WBP_Battle_Blood_Boss_PC_C:InitBossConfig()
  self.Boss_Part:SetRenderOpacity(0.0)
  local BossName = GText(self.Owner.Data.UnitName)
  self.Name_Boss_Part:SetText(BossName)
  local BossLevel = self.Owner:GetAttr("Level")
  if nil ~= BossLevel then
    self.Num_Lv_BP:SetText(BossLevel)
    self.Num_Lv_BP:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  self.TakeDownTip:SetText(GText("UI_BOSSBATTLE_TAKEDOWN"))
  self:SetPanelTipVisibility(UE4.ESlateVisibility.Collapsed)
  self.Shield_Boss = self.Bar_Shield_BP
  self.Deduct_Shield_Boss = self.Deduct_Shield_BP
  self.Bg_Shield = self.bg_bp_shield
  self.Bg_Blood = self.bg_bp_blood
  self.Blood_Boss = self.Bar_Blood_BP
  self.Deduct_Blood_Boss = self.Deduct_Blood_BP
  if self.MaxShield <= 0 then
    self.ShowES = false
  end
  if not self.IsShowToughnessBar then
    self.Toughness_Bar:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.DeductToughness:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Toughness_Bar:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.DeductToughness:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.TNDeductEffectSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.DeductToughness)
    self.TNDeductEffectHeight = self.TNDeductEffectSlot:GetSize().Y
  end
  self.Boss_Part:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.HB_Buff_BP:ClearChildren()
end

function WBP_Battle_Blood_Boss_PC_C:SetBossBarPosition()
  if self.BossUIType and self.BossUIType ~= EBossUIType.None then
    return
  end
  local OverlaySlot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(self.Boss_Part)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  local BattleMain = UIManger:GetUI("BattleMain")
  local Position = FVector2D(0, 80)
  if nil ~= BattleMain then
    local CanvasSlot2 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(BattleMain.Pos_Boss_Lifebar)
    Position = CanvasSlot2:GetPosition()
  end
  if OverlaySlot then
    local Padding = OverlaySlot.Padding
    Padding.Top = Position.Y
    OverlaySlot:SetPadding(Padding)
  end
end

function WBP_Battle_Blood_Boss_PC_C:ResetBossPart()
  self.ToughnessEffect = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.DeductToughness)
  local SizeBoxSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.SizeBoxBar)
  self.BloodBarLenght = SizeBoxSlot:GetSize().X
  self.BloodBarHeight = self.SizeBox_BossHP.MinDesiredHeight
  local Length_Blood = self.BloodBarLenght
  if self.IsBossInPart == true then
    local SplitPercent = {}
    for i = 1, self.Part_Count - 1 do
      SplitPercent[i] = self.PhaseValues[i] + (SplitPercent[i - 1] or 0)
    end
    for i = 1, #SplitPercent do
      self["Split_" .. i]:SetVisibility(UE4.ESlateVisibility.Visible)
      local CanvasSlot_Split = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self["Split_" .. i])
      local Position = CanvasSlot_Split:GetPosition()
      Position.X = Length_Blood * SplitPercent[i] - CanvasSlot_Split:GetSize().X / 2
      CanvasSlot_Split:SetPosition(Position)
    end
    for j = self.Part_Count, CommonConst.BOSS_BLOOD_PART_MAX - 1 do
      self["Split_" .. j]:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  else
    for i = 1, CommonConst.BOSS_BLOOD_PART_MAX - 1 do
      self["Split_" .. i]:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

function WBP_Battle_Blood_Boss_PC_C:ResetBossToughness()
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Bar_In)
  if not self.IsShowToughnessBar then
    self.IsResetBossToughness = true
    return
  end
  if self.CanShowBossTouughness ~= false then
    self.SizeBox_Toughness:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  self.RetainerBox_Toughness_Bar:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.NowTN = self.Owner:GetAttr("TN")
  self.LastTN = self.NowTN
  self.MaxTN = self.Owner:GetAttr("MaxTN")
  if self.MaxTN <= 0.001 then
    self:ShowOrHideToughnessBar(false)
    return
  end
  self.VX_percent:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.BossTNPercent = math.min(math.max(self.NowTN / self.MaxTN, 0), 1)
  self.LastTNPercent = self.BossTNPercent
  self.HelpBossTNPercent = math.min(math.max(self.NowTN / self.MaxTN, 0), 1)
  self:SetToughnessBarPercent(self.BossTNPercent)
  self.ToughnessNums = 0
  local ToughnessPercent = {}
  if self.ToughnessHit[0] == nil then
    self.ToughnessNums = 1
    ToughnessPercent[self.ToughnessNums] = 0
  end
  local SegmentNums = 1
  for key, value in pairs(self.ToughnessHit) do
    self.ToughnessNums = self.ToughnessNums + 1
    ToughnessPercent[self.ToughnessNums] = key
    if key > 0 and key < 100 then
      SegmentNums = SegmentNums + 1
    end
  end
  self:SetProgressbarSegmentNum(self.Toughness_Bar, SegmentNums)
  self:SetProgressbarSegmentNum(self.Toughness_BarDeduct, SegmentNums)
  self:SetProgressbarSegmentNum(self.Toughness_Bar_Light, SegmentNums)
  self:SetImageSegmentNum(self.Image_ToughnessBarBG, SegmentNums)
  local GroupToughnessSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.SizeBoxBar)
  self.ToughnessLength = GroupToughnessSlot:GetSize().X
  self.ToughnessWeakLength = self.SizeBox_percent_L.WidthOverride
  self.VX_percent_L:SetRenderTranslation(FVector2D(-self.ToughnessWeakLength + self.ToughnessWeakLength / 2, 0))
  self.VX_percent_R:SetRenderTranslation(FVector2D(self.ToughnessWeakLength + -self.ToughnessWeakLength / 2, 0))
  self.DeductTNOriginalPositionX = 0
  self.ToughnessPartOriginalPositionX = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.ToughnessPart):GetPosition().X
  self:UpdateToughnessEffect()
  local TNSplitPercent = {}
  for i = 2, self.ToughnessNums do
    TNSplitPercent[i - 1] = ToughnessPercent[i] / 100
  end
  self.IsResetBossToughness = true
end

function WBP_Battle_Blood_Boss_PC_C:InitBossWeakness()
  self:RefreshWeaknessIcons()
end

function WBP_Battle_Blood_Boss_PC_C:RefreshWeaknessIcons()
  local BuffManager = self.Owner.BuffManager
  local Buffs = BuffManager.Buffs
  if self.WeaknessBar then
    local Ids = TArray(0)
    for _, BuffItem in pairs(Buffs) do
      local BuffData = DataMgr.Buff[BuffItem.BuffId]
      if BuffData and BuffData.WeaknessType then
        Ids:Add(BuffItem.BuffId)
      end
    end
    if Ids:Num() > 0 then
      self.Group_BuffRoot:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.Group_BuffRoot:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    self.WeaknessBar:RefreshWeaknessIcons(Ids)
  end
end

function WBP_Battle_Blood_Boss_PC_C:InitChargeBar()
  if self.BossUIType ~= UE4.EBossUIType.ChargeLeft and self.BossUIType ~= UE4.EBossUIType.ChargeRight then
    return
  end
  self.Bar_Energy:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.PanelTip:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.PanelTipText:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.EnergyWarnPercent = self.Owner.Data.BloodUIParmas.WarnPercent
  self.Text_Energy:SetText(GText("UI_Mechanism_ZhiLvGeCharge_Charge"))
  self.IsWarning = false
  self.TargetEnergy = 0
  self.NowEnergy = 0
  self.DeltaEnergy = 0
  self.UpdateProgressHandle = nil
  self:UpdateEnergyBar(self.Owner.Eid, self.Owner.NowEnergy)
  self:BindToAnimationFinished(self.Energy_In, function()
    if self.BossUIType == UE4.EBossUIType.ChargeLeft then
      self:PlayAnimation(self.Energy_ColorL)
    else
      self:PlayAnimation(self.Energy_ColorR)
    end
  end)
  self:PlayAnimation(self.Energy_In)
end

function WBP_Battle_Blood_Boss_PC_C:InitBossEvent()
  self:AddDispatcher(EventID.ShowBossBlood, self, self.RefreshBossInfoByAction)
  self:AddDispatcher(EventID.StartTalk, self, self.HideBossBillboard)
  self:AddDispatcher(EventID.EndTalk, self, self.ShowBossBillboard)
  self:AddDispatcher(EventID.UpdateBossToughness, self, self.UpdateBossToughness)
  self:AddDispatcher(EventID.RecoveryBossShield, self, self.RecoveryBossShield)
  self:AddDispatcher(EventID.OnBloodEnergyChanged, self, self.UpdateEnergyBar)
end

function WBP_Battle_Blood_Boss_PC_C:UpdateToughnessEffect()
  if not self.IsShowToughnessBar then
    return
  end
  local Percent = math.min(math.max((self.LastTN - self.NowTN) / self.MaxTN, 0), 1)
  self.ToughnessEffect:SetSize(FVector2D(self.ToughnessLength * Percent, self.ToughnessEffect:GetSize().Y))
  self.ToughnessEffect:SetPosition(FVector2D(self.ToughnessLength * self.BossTNPercent, self.ToughnessEffect:GetPosition().Y))
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Deduct_toughness)
end

function WBP_Battle_Blood_Boss_PC_C:RefreshBossInfoByAction(ActionName, DamageEvent)
  if self.Owner == nil then
    return
  end
  self.IsPlayHitAnimation = false
  if "Attack" == ActionName then
    local NowTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
    local Info = DamageEvent.SkillId and DataMgr.Skill[DamageEvent.SkillId] or nil
    if Info and Info[1] then
      local SkillType = Info[1][0].SkillType
      if "Attack" == SkillType then
        self.LastAttackTime = NowTime
      end
      if "Attack" == SkillType or "FallAttack" == SkillType or "HeavyAttack" == SkillType or "SlideAttack" == SkillType then
        self.IsPlayHitAnimation = true
      end
    end
    if NowTime - self.LastAttackTime > self.ComboAttackTime then
      self.BossDelayTime = 0.0
    else
      self.BossDelayTime = Const.BloodBarDelayTime
    end
  end
  self:PlayWeaknessEffect(DamageEvent.DamageValues)
end

function WBP_Battle_Blood_Boss_PC_C:PlayWeaknessEffect(DamageValues)
  if not self.WeaknessBar then
    return
  end
  for DamageType, DamageRate in pairs(DamageValues or {}) do
    self.WeaknessBar:PlayWeaknessEffect(DamageType)
  end
end

function WBP_Battle_Blood_Boss_PC_C:UpdateBossBlood(ActionName, ShieldReduce)
  self.LastShield = self.Shield
  self.LastHp = self.Hp
  self.Shield = self.Owner:GetAttr("ES") or 0
  self.BloodNowTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
  self.Hp = self.Owner:GetCurrentBloodVolume()
  self.StartReduceTime = self.BloodNowTime
  ShieldReduce = self.LastShield - self.Shield
  if "Attack" == ActionName then
    local IsRealReduceBlood = self.Hp < self.LastHp
    local IsRealReduceShield = self.Shield < self.LastShield
    self.BossHpPercent = math.min(math.max(self.Hp / self.MaxHp, 0), 1)
    if self.MaxShield <= 1.0E-8 then
      self.FixTime = self.BossDelayTime
    else
      self.Shield = math.min(math.max(self.MaxShield * self.BossShieldPercent - ShieldReduce, 0), self.Shield)
      self.BossShieldPercent = math.min(math.max(self.Shield / self.MaxShield, 0), 1)
    end
    if self.HpBar then
      self.HpBar:SetBarPercent(self.BossHpPercent)
      if IsRealReduceBlood then
        self.HpBar:PlayDeduct(true)
      end
    end
    if self.MaxShield > 0 and self.ShieldBar then
      self.ShieldBar:SetBarPercent(self.BossShieldPercent)
      if IsRealReduceShield then
        self.ShieldBar:PlayDeduct(true)
      end
    end
  elseif "Heal" == ActionName then
    self.BossHpPercent = math.min(math.max(self.Hp / self.MaxHp, 0), 1)
    self.Blood_Boss:SetPercent(self.BossHpPercent)
    self.HpBar:SetBarPercent(self.BossHpPercent)
    self.LastHp = self.Hp
  end
  self:Show()
  if 0 == self.Hp then
    self:SetPanelTipVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Battle_Blood_Boss_PC_C:UpdateTakeDownTipText()
  local DamageRate = self.Owner:GetAttr(UEMNameRegisterLibrary.GetAttrNameAttributeType("DamagedRate", "NoTag_BossDown")) + 1
  DamageRate = DamageRate * 100
  self.TakeDownTip:SetText(GText("UI_STAT_SUFFER") .. "\195\151" .. DamageRate .. "%")
end

function WBP_Battle_Blood_Boss_PC_C:ShowPanelTip()
  if not self.CanShowPanelTip then
    return
  end
  self:SetPanelTipVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.TakeDown)
  AudioManager(self):PlayUISound(self, "event:/ui/common/boss_shied_bar_loop", "BossShiedBarLoop", nil)
  if self.NowTN / self.MaxTN < 0.7 then
    self:PlayAnimation(self.Loop, 0, 0)
    self.IsPlayOut = true
  end
end

function WBP_Battle_Blood_Boss_PC_C:UpdateBossToughness(bNowBossInDefeated)
  if not IsValid(self.Owner) or not self.IsShowToughnessBar then
    return
  end
  if not self.MaxTN then
    self.MaxTN = self.Owner:GetAttr("MaxTN")
  end
  if not self.NowTN then
    self.NowTN = self.MaxTN
  end
  self.NowTNTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
  self.LastTN = self.NowTN
  self.NowTN = self.Owner:GetAttr("TN")
  if self.NowTN == self.MaxTN then
    self:SetPanelTipVisibility(UE4.ESlateVisibility.Collapsed)
    self.VX_percent:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if self.TNEqualZero then
      self.LastTN = self.NowTN
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Toughness_Finsh)
      AudioManager(self):PlayUISound(self, "event:/ui/common/boss_shield_bar_loop_end", nil, nil)
    end
    self.TNEqualZero = false
  end
  self.TNReduce = self.LastTN - self.NowTN
  self.LastTNPercent = self.BossTNPercent
  self.HelpBossTNPercent = math.max(self.HelpBossTNPercent, self.LastTNPercent)
  if self.NowTN < 1.0E-7 or bNowBossInDefeated then
    self.TNEqualZero = true
    self.BossTNPercent = 0
    self:SetToughnessBarPercent(self.BossTNPercent)
  else
    if self.TNReduce < 0 then
      if self.TNEqualZero then
        self.VX_percent:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      else
        self.VX_percent:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
      self:RecoverBossTN()
    elseif self.TNReduce > 1.0E-5 or self.NowTN == self.MaxTN then
      self.VX_percent:SetVisibility(UE4.ESlateVisibility.Collapsed)
      if self:IsExistTimer("RealRecoveryTN") then
        self:RemoveTimer("RealRecoveryTN")
      end
      self.BossTNPercent = math.min(math.max(self.NowTN / self.MaxTN, 0), 1)
      self:SetToughnessBarPercent(self.BossTNPercent)
      self:CheckToughnessPartBroken()
      self:SetPanelTipVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if self.NowTN / self.MaxTN >= 0.7 and self.IsPlayOut then
      self:StopAnimation(self.Loop)
      self:PlayAnimation(self.Loop_Out)
      self.IsPlayOut = false
    end
  end
  if self.TNReduce > 0 then
    self:ReduceBossTN()
  end
end

function WBP_Battle_Blood_Boss_PC_C:UpdateEnergyBar(InEid, NewEnergy)
  if InEid ~= self.Owner.Eid then
    return
  end
  self.TargetEnergy = NewEnergy
  self.DeltaEnergy = (self.TargetEnergy - self.NowEnergy) / 10.0
  
  local function UpdateProgress()
    self.NowEnergy = self.NowEnergy + self.DeltaEnergy
    self.NowEnergy = math.min(self.NowEnergy, self.TargetEnergy)
    self.TextBlock_Energy_Num:SetText(math.floor(self.NowEnergy))
    UUIFunctionLibrary.BP_SetSingleScalarParamToImageMat(self.Bar_Energy_L, "Percent", self.NowEnergy / 100.0)
    UUIFunctionLibrary.BP_SetSingleScalarParamToImageMat(self.Bar_Energy_R, "Percent", self.NowEnergy / 100.0)
    if not self.IsWarning and self.NowEnergy >= self.EnergyWarnPercent then
      self.IsWarning = true
      self:PlayAnimation(self.Energy_Warning)
    end
    if self.NowEnergy >= self.TargetEnergy then
      self:RemoveTimer(self.UpdateProgressHandle)
      self.UpdateProgressHandle = nil
    end
  end
  
  if not self.UpdateProgressHandle then
    self.UpdateProgressHandle = self:AddTimer(0.1, UpdateProgress, true, 0, "UpdateChargeProgress", true)
  end
end

function WBP_Battle_Blood_Boss_PC_C:RecoverBossTN()
  if not self.IsShowToughnessBar then
    return
  end
  if self:IsExistTimer("RealReduceBossTN") then
    self.DeductToughness:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self:RemoveTimer("RealReduceBossTN")
  end
  self.ToughnessLength = self.ToughnessLength or 605
  self.ToughnessWeakLength = self.ToughnessWeakLength or 194
  local AnimTime = Const.MonsterTNRecoverTickInterival
  if self.TNEqualZero then
    AnimTime = Const.BossTNToZeroRecoverTickInterival
  end
  local TickTime = AnimTime / Const.BossTNRecoverTickFrequency
  
  local function TNRecoveryFunc()
    local NowTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
    local PassedTime = NowTime - self.NowTNTime
    if PassedTime >= AnimTime then
      self:RemoveTimer("RealRecoveryTN")
      self.BossTNPercent = math.min(math.max(self.NowTN / self.MaxTN, 0), 1)
      self:SetToughnessBarPercent(self.BossTNPercent)
    end
    local DelayTN = math.min(math.floor(self.NowTN + self.TNReduce * (1 - (NowTime - self.NowTNTime) / AnimTime)), self.MaxTN)
    self.LastTNPercent = self.BossTNPercent
    self.BossTNPercent = math.min(math.max(DelayTN / self.MaxTN, 0), 1)
    local VP = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.VX_percent)
    VP:SetPosition(FVector2D(self.ToughnessLength * self.BossTNPercent, VP:GetPosition().Y))
    local ReverseTime = 1 - self.BossTNPercent
    self.VX_percent_L:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.VX_percent_R:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.VX_percent_L:SetRenderTranslation(FVector2D(-self.ToughnessWeakLength * ReverseTime + self.ToughnessWeakLength / 2, 0))
    self.VX_percent_R:SetRenderTranslation(FVector2D(self.ToughnessWeakLength * ReverseTime + -self.ToughnessWeakLength / 2, 0))
    self.HelpBossTNPercent = self.BossTNPercent
    self:SetToughnessBarPercent(self.BossTNPercent)
    if self.BossTNPercent > 0.999999 then
      self.VX_percent:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  
  self:AddTimer(TickTime, TNRecoveryFunc, true, -TickTime, "RealRecoveryTN")
end

function WBP_Battle_Blood_Boss_PC_C:ReduceBossTN()
  self.Toughness_BarDeduct:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local DelayTime = self.BossDelayTime
  local TickTime = 0.033
  local AnimTime = Const.BloodBarAnimTime
  local StartReductTime = UE4.UGameplayStatics.GetTimeSeconds(self)
  local DeductEffectHeight = self.TNDeductEffectHeight
  local StartOpacity = 1.0
  local DeductPercent = self.LastTNPercent - self.BossTNPercent
  if DeductPercent < 0.1 and DeductPercent > 0.02 then
    DeductEffectHeight = ((DeductPercent - 0.02) / 0.08 * 0.5 + 0.5) * DeductEffectHeight
    StartOpacity = (DeductPercent - 0.02) / 0.08 * 0.5 + 0.5
  elseif DeductPercent < 0.02 then
    DeductEffectHeight = DeductEffectHeight * 0.5
    StartOpacity = 0.5
  end
  StartOpacity = math.max(StartOpacity, 0.5)
  DeductEffectHeight = math.min(DeductEffectHeight, self.TNDeductEffectHeight)
  if self:IsExistTimer("RealRecoveryTN") then
    self:RemoveTimer("RealRecoveryTN")
  end
  if self:IsExistTimer("RealReduceBossTN") then
    self:RemoveTimer("RealReduceBossTN")
    self.HelpBossTNPercent = self.Toughness_BarDeduct.Percent
  end
  BloodBarUtils:SetDeductEffect(DeductEffectHeight, self.ToughnessLength, self.DeductToughness, self.HelpBossTNPercent, self.BossTNPercent, StartOpacity, self.DeductTNOriginalPositionX)
  
  local function RealReduceBossTN()
    local NowTime = UE4.UGameplayStatics.GetTimeSeconds(self)
    local PassTime = NowTime - StartReductTime
    PassTime = math.max(PassTime, DelayTime)
    if PassTime > AnimTime + DelayTime then
      self.Toughness_BarDeduct:SetPercent(self.BossTNPercent)
      self.HelpBossTNPercent = self.BossTNPercent
      self.DeductToughness:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self:RemoveTimer("RealReduceBossTN")
    else
      local DelayTN = self.HelpBossTNPercent - self.BossTNPercent
      local TimeEffect = (AnimTime + DelayTime - PassTime) / AnimTime
      local Temp = self.BossTNPercent + DelayTN * TimeEffect
      local NowOpacity = StartOpacity * TimeEffect
      self.Toughness_BarDeduct:SetPercent(Temp)
      BloodBarUtils:SetDeductEffect(DeductEffectHeight, self.ToughnessLength, self.DeductToughness, Temp, self.BossTNPercent, NowOpacity, self.DeductTNOriginalPositionX)
    end
  end
  
  self:AddTimer(TickTime, RealReduceBossTN, true, DelayTime, "RealReduceBossTN")
end

function WBP_Battle_Blood_Boss_PC_C:RecoveryBossShield()
  if not self.ShieldBar or self.MaxShield <= 0 then
    return
  end
  self.LastShield = self.Shield
  self.Shield = self.Owner:GetAttr("ES")
  local CurPercent = math.clamp(self.Shield / self.MaxShield, 0, 1)
  self.ShieldBar:SetBarPercent(CurPercent, false)
  self.ShieldBar:PlayRecoveryShield()
end

function WBP_Battle_Blood_Boss_PC_C:CheckToughnessPartBroken()
  if not self.IsShowToughnessBar then
    return
  end
  for key, value in pairs(self.ToughnessHit) do
    local PartPercent = tonumber(key) / 100
    if PartPercent <= self.LastTNPercent and PartPercent > self.BossTNPercent then
      local TP = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.ToughnessPart)
      TP:SetPosition(FVector2D(self.ToughnessLength * PartPercent + self.ToughnessPartOriginalPositionX, TP:GetPosition().Y))
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Toughness_Broken)
      AudioManager(self):PlayUISound(self, "event:/ui/common/boss_shield_bar_lose", nil, nil)
    end
  end
end

function WBP_Battle_Blood_Boss_PC_C:UpdateBossInvincibleState(IsInvincible, Tag)
  if nil == IsInvincible then
    IsInvincible = self.Owner.bIsInvincible or self.Owner:IsInvincible()
  end
  if nil == Tag then
    Tag = "DefaultTag"
  end
  if IsInvincible then
    self.InvincinbleTags[Tag] = true
  else
    self.InvincinbleTags[Tag] = nil
  end
  IsInvincible = not IsEmptyTable(self.InvincinbleTags)
  if IsInvincible then
    self.VX_Boss_InvincibilLight:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Toughness_Bar.WidgetStyle.FillImage.TintColor = self.BossInvincibilityColor
    self.Toughness_Bar_Light.WidgetStyle.FillImage.TintColor = self.BossInvincibilityColor
    local AnimTime = self.invincibility:GetEndTime()
    
    local function PlayLoopAnimation()
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.invincibility)
    end
    
    self:AddTimer(AnimTime, PlayLoopAnimation, true, 0, "PlayLoopAnimation")
  else
    self.VX_Boss_InvincibilLight:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Toughness_Bar.WidgetStyle.FillImage.TintColor = self.BossNormalColor
    self.Toughness_Bar_Light.WidgetStyle.FillImage.TintColor = self.BossNormalColor
    if self:IsExistTimer("PlayLoopAnimation") then
      self:RemoveTimer("PlayLoopAnimation")
      self:StopAnimation(self.invincibility)
    end
  end
  if self.HpBar then
    self.HpBar:PlayInvincibility(IsInvincible)
  end
  if self.ShieldBar then
    self.ShieldBar:PlayInvincibility(IsInvincible)
  end
end

function WBP_Battle_Blood_Boss_PC_C:HideBossBillboard(TalkGameInput)
  if TalkGameInput then
    return
  end
  self.Boss_Part:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_Battle_Blood_Boss_PC_C:ShowBossBillboard(TalkGameInput)
  if TalkGameInput then
    return
  end
  self.Boss_Part:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function WBP_Battle_Blood_Boss_PC_C:CloseBossBlood()
  self:Close()
end

function WBP_Battle_Blood_Boss_PC_C:OutHideTag()
  self:AddTimer(self.BossTickTime, self.ResetBossToughness, false, 0, "ResetBossToughness")
end

function WBP_Battle_Blood_Boss_PC_C:SetProgressbarSegmentNum(Target, SegmentNum)
  if not Target then
    return
  end
  SegmentNum = SegmentNum or 1
  local DynamicMaterial = UE4.UWidgetBlueprintLibrary.GetDynamicMaterial(Target.WidgetStyle.FillImage)
  if DynamicMaterial then
    DynamicMaterial:SetScalarParameterValue("SegmentsNumber", SegmentNum)
  end
end

function WBP_Battle_Blood_Boss_PC_C:SetImageSegmentNum(Target, SegmentNum)
  if not Target then
    return
  end
  SegmentNum = SegmentNum or 1
  local DynamicMaterial = Target:GetDynamicMaterial()
  if DynamicMaterial then
    DynamicMaterial:SetScalarParameterValue("SegmentsNumber", SegmentNum)
  end
end

function WBP_Battle_Blood_Boss_PC_C:SetToughnessBarPercent(Percent)
  Percent = Percent or 0
  Percent = math.clamp(Percent, 0, 1)
  self.Toughness_Bar_Light:SetPercent(Percent)
  self.Toughness_Bar:SetPercent(Percent)
  local ColdDownPercent = 1 - Percent
  self.Progress_CountDownLeft:SetPercent(ColdDownPercent)
  self.Progress_CountDownRight:SetPercent(ColdDownPercent)
  if ColdDownPercent > 0 and ColdDownPercent <= 0.3 and not self.IsPercent_Warning and self.Owner:CharacterInTag("Defeated") then
    self:PlayAnimation(self.Percent_Warning)
    self.IsPercent_Warning = true
  elseif 0 == ColdDownPercent and self.IsPercent_Warning then
    self:PlayAnimationReverse(self.Percent_Warning)
    self.IsPercent_Warning = false
    self:ShowToughnessBar(true)
  end
  if 0 == ColdDownPercent then
    AudioManager(self):StopSound(self, "BossShiedBarLoop")
  end
end

function WBP_Battle_Blood_Boss_PC_C:StopBossShiedBarLoopSound()
  AudioManager(self):StopSound(self, "BossShiedBarLoop")
end

function WBP_Battle_Blood_Boss_PC_C:ShowOrHideToughnessBar(bIsShow)
  self.CanShowBossTouughness = bIsShow
  if bIsShow then
    self.SizeBox_Toughness:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.SizeBox_Toughness:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Battle_Blood_Boss_PC_C:ShowOrHidePanelTip(bIsShow)
  self.CanShowPanelTip = bIsShow
  if bIsShow then
    self:SetPanelTipVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self:SetPanelTipVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Battle_Blood_Boss_PC_C:SetBossLockHpState(bIsLock, Value, Percent)
  Value = Value or 0
  local LockPercent = Percent and Percent > 0 and Percent or Value / self.MaxHp
  local RealHpPercent = self.Owner:GetAttr("Hp") / self.MaxHp
  if not bIsLock then
    self.HpBar:DirectSetBarPercent(RealHpPercent)
  end
  self.IsLockHp = bIsLock
  self:UpdateBossInvincibleState(bIsLock, "LockHp")
  if bIsLock and self.HpBar and LockPercent <= RealHpPercent then
    self.HpBar:DirectSetBarPercent(LockPercent)
  end
end

function WBP_Battle_Blood_Boss_PC_C:SetPanelTipVisibility(Option)
  if self.PanelTipVisibility == Option then
    return
  end
  self.PanelTipVisibility = Option
  self.PanelTip:SetVisibility(Option)
  if self.PanelTipText then
    self.PanelTipText:SetVisibility(Option)
  end
  if Option == UE4.ESlateVisibility.Collapsed then
    local Padding = self.HB_Buff_BP.Slot.Padding
    Padding.Top = self.Buff_BP_TopOffset_NoTips
    self.HB_Buff_BP.Slot:SetPadding(Padding)
  else
    local Padding = self.HB_Buff_BP.Slot.Padding
    Padding.Top = self.Buff_BP_TopOffset_HaveTips
    self.HB_Buff_BP.Slot:SetPadding(Padding)
    self.VX_percent_L:SetRenderTranslation(FVector2D(-self.ToughnessWeakLength * 1 + self.ToughnessWeakLength / 2, 0))
    self.VX_percent_R:SetRenderTranslation(FVector2D(self.ToughnessWeakLength * 1 + -self.ToughnessWeakLength / 2, 0))
  end
end

function WBP_Battle_Blood_Boss_PC_C:UnLoadSelf()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance and GameInstance:GetGameUIManager()
  if not self.BossUIType or self.BossUIType == EBossUIType.None then
    UIManager:UnLoadUINew("BossBlood")
  else
    self:SetVisibility(ESlateVisibility.Collapsed)
    local DoubleBossBlood = UIManager:GetUIObj("DoubleBossBlood")
    if DoubleBossBlood then
      DoubleBossBlood:OnBossDead()
    end
  end
end

function WBP_Battle_Blood_Boss_PC_C:SetEquipartition(PromptTime, ExecuteTime, NewPercent, bReduce, bConsiderTimeDilation)
  if self.HpBar then
    self.HpBar:SetEquipartition(PromptTime, ExecuteTime, NewPercent, bReduce, bConsiderTimeDilation, self.Owner)
  end
end

function WBP_Battle_Blood_Boss_PC_C:InterruptEquipartition()
  local Res = true
  if self.HpBar then
    Res = self.HpBar:InterruptEquipartition(self.Owner)
  end
  if not Res then
    return
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if UIManager then
    UIManager:ShowUITip(UIConst.Tip_CommonToast, GText("TODO"))
  end
end

function WBP_Battle_Blood_Boss_PC_C:SetBossRecoverInfo(PromptTime, ExecuteTime, Percent)
  if self.HpBar then
    self:UpdateBossInvincibleState(true, "BossRecover")
    self:AddTimer(ExecuteTime + PromptTime, function()
      self:UpdateBossInvincibleState(false, "BossRecover")
    end, false, nil, "BossRecoverTimer")
    self.HpBar:SetBossRecoverInfo(self.Owner, PromptTime, ExecuteTime, Percent)
  end
end

function WBP_Battle_Blood_Boss_PC_C:InterruptBossRecover()
  local Res = true
  if self.HpBar then
    Res = self.HpBar:InterruptBossRecover(self.Owner)
  end
  if self:IsExistTimer("BossRecoverTimer") then
    self:RemoveTimer("BossRecoverTimer")
    self:UpdateBossInvincibleState(false, "BossRecover")
  end
  if not Res then
    return
  end
  if self.Owner and not self.Owner:IsDead() then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManager = GameInstance:GetGameUIManager()
    if UIManager then
      UIManager:ShowUITip(UIConst.Tip_CommonToast, GText("TODO"))
    end
  end
end

function WBP_Battle_Blood_Boss_PC_C:UpdateEquipartitionInfo(NewPercent, bReduce)
  if self.HpBar then
    self.HpBar:UpdateEquipartitionInfo(NewPercent, bReduce)
  end
end

return WBP_Battle_Blood_Boss_PC_C
