require("UnLua")
local WBP_DungeonDefenseFloatPro_C = Class("BluePrints.UI.Dungeon.WBP_DungeonUIBase_C")

function WBP_DungeonDefenseFloatPro_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.LastShield = nil
  self.LastHp = nil
  self.UpdateTickTime = 0.5
  self.CountDownTime = -1
  self.TotalCountDownTime = 180
  self.IsShowDungeonUI = false
  self.ToastShowTime = 1
  rawset(self, "NormalColor", FLinearColor(0.274677, 0.637597, 0.341915, 1.0))
  rawset(self, "CriticalColor", FLinearColor(0.63, 0, 0, 1.0))
end

function WBP_DungeonDefenseFloatPro_C:InitListenEvent()
  self.Super.InitListenEvent(self)
  self:AddDispatcher(EventID.DefenseTimerAdded, self, self.DefenseTimerAdded)
  self:AddDispatcher(EventID.ShowDungeonUI, self, self.ShowDungeonUI)
  self:AddDispatcher(EventID.CloseDungeonUI, self, self.CloseDungeonUI)
  self:AddDispatcher(EventID.OnDefenseWaveStart, self, self.OnDefenseWaveStart)
  self:AddDispatcher(EventID.OnWaveStart, self, self.OnWaveStart)
  self:AddDispatcher(EventID.OnWaveEnd, self, self.OnWaveEnd)
  self:AddDispatcher(EventID.OnDefenceWaveEnd, self, self.OnDefenceWaveEnd)
end

function WBP_DungeonDefenseFloatPro_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.BattlePanel:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Bar_Blood:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.LastHpPercent = 1.0
  self:InitDisplayTexts()
  self.SizeBox_HP:ClearChildren()
  self.SizeBox_Shield:ClearChildren()
  self:HideUselessWidget()
  self:LoadHpBar()
  self:LoadShieldBar()
  self:InitListenEvent()
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_DungeonDefenseFloatPro_C:InitDisplayTexts()
  self.DefenceProTexts = {
    DefenceProTitle = "DUNGEON_NAME_20003",
    DefenceProSubTitle = "UI_Mail_Date_Remain"
  }
  local IsSucc, UIParams = CommonUtils.GetDungeonUIParams("DungenonDefenseProFloat")
  if IsSucc then
    self.DefenceProTexts.DefenceProTitle = UIParams.DefenceProTitle
    self.DefenceProTexts.DefenceProSubTitle = UIParams.DefenceProSubTitle
  end
  self.Timelimit:SetText(GText(self.DefenceProTexts.DefenceProTitle))
  self.Text_Timelimit:SetText(GText(self.DefenceProTexts.DefenceProSubTitle))
end

function WBP_DungeonDefenseFloatPro_C:UpdateMechanismInfo()
  local CurTargetActor = self:GetDefenseCore()
  if not CurTargetActor then
    return
  end
  if not self:IsAnimationPlaying(self.Shield_Glow) then
    self.Shield_glowLine:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if not self:IsAnimationPlaying(self.HP_Glow) then
    self.HP_glowLine:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if DataMgr.Mechanism[CurTargetActor.UnitId].UnitName then
    self.DefenseCoreName:SetText(GText(DataMgr.Mechanism[CurTargetActor.UnitId].UnitName))
  end
  local NewShield = CurTargetActor:GetAttr("ES")
  local MaxShield = CurTargetActor:GetAttr("MaxES")
  local NewHp = CurTargetActor:GetAttr("Hp")
  local MaxHp = CurTargetActor:GetAttr("MaxHp")
  if not self.LastHp then
    self.LastHp = CurTargetActor:GetAttr("Hp")
  end
  if not self.LastShield then
    self.LastShield = CurTargetActor:GetAttr("ES")
  end
  local NewShieldPercent = NewShield / MaxShield
  if NewShield < self.LastShield then
    self.ShieldBar:SetBarPercent(NewShieldPercent)
    local LastShieldPercent = self.LastShield / MaxShield
    self:PlayGlowAnim(NewShield / MaxShield, self.Shield_glowLine, self.Shield_Glow)
    if NewShield < MaxShield then
      self.ShieldBar:PlayDeduct(true)
    end
  elseif NewShield > self.LastShield then
    self.ShieldBar:SetBarPercent(NewShieldPercent, false)
    self.ShieldBar:PlayRecoveryShield()
  end
  self.LastShield = NewShield
  local NewHpPercent = NewHp / MaxHp
  self.HpBar:SetBarPercent(NewHpPercent)
  if NewHp < self.LastHp then
    local LastHpPercent = self.LastHp / MaxHp
    if NewHpPercent < 0.5 then
      self:PlayGlowAnim(NewHp / MaxHp, self.HP_glowLine, self.Warning_Glow)
    else
      self:PlayGlowAnim(NewHp / MaxHp, self.HP_glowLine, self.HP_Glow)
    end
    if NewHp < MaxHp then
      self.HpBar:PlayDeduct(true)
    end
  end
  if NewHpPercent < 0.5 then
    self.HpBar:SetProgressBarColorInner(self.CriticalColor)
  else
    self.HpBar:SetProgressBarColorInner(self.NormalColor)
  end
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if NewHpPercent <= 0.3 then
    if self.LastHpPercent > 0.3 then
      local WarningLastTime = 1.5
      UIManager:ShowUITip(UIConst.Tip_CommonWarning, GText("UI_Tosat_Defense_LowHealth"), WarningLastTime)
      if not CurTargetActor.ForbideLowHealthUI then
        self:AddTimer(WarningLastTime + 0.2, function()
          UIManager:LoadUINew("DefenseLowHealth")
        end, false, 0, nil, false)
      end
    end
    local LowHealthUI = UIManager:GetUIObj("DefenseLowHealth")
    if LowHealthUI then
      LowHealthUI.Text_Health:SetText(tostring(math.floor(NewHpPercent * 100)))
    end
    if CurTargetActor.ForbideLowHealthUI then
      self.VX_warning:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.DefenseCoreName:SetText(GText("UI_Defense_LowHealth"))
    end
  else
    local LowHealthUI = UIManager:GetUIObj("DefenseLowHealth")
    if LowHealthUI then
      UIManager:UnLoadUINew("DefenseLowHealth")
    end
    if CurTargetActor.ForbideLowHealthUI then
      self.VX_warning:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  self.LastHp = NewHp
  self:SetBloodAndShieldNum(NewHp, NewShield, NewHpPercent)
  self.LastHpPercent = NewHpPercent
end

function WBP_DungeonDefenseFloatPro_C:PlayGlowAnim(NewPercent, Glow, GlowAnim)
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.SizeBox_HP)
  local SlotSize = CanvasSlot:GetSize()
  local ProgressBarLength = SlotSize.X * self.SizeBox_HP.RenderTransform.Scale.X
  local Glow_Pos = FVector2D(0.0, 0.0)
  Glow_Pos.X = ProgressBarLength * NewPercent
  local GlowSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(Glow)
  Glow_Pos.Y = GlowSlot:GetPosition().Y
  GlowSlot:SetPosition(Glow_Pos)
  Glow:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  EMUIAnimationSubsystem:EMPlayAnimation(self, GlowAnim)
end

function WBP_DungeonDefenseFloatPro_C:DefenseTimerAdded(TimerHandleName, Time, TimeStamp)
  self.TimeStamp = TimeStamp
  self.CountDownTime = Time
  self.Text_Time:SetText(self:GetTimeStr(Time))
  self:AddTimer(1.0, self.UpdateCountDownTime, true, 0, "UpdateCountDownTime", false)
  self:AddTimer(self.UpdateTickTime, self.UpdateMechanismInfo, true, 0, "UpdateMechanism", false)
end

function WBP_DungeonDefenseFloatPro_C:ShowDungeonUI()
  self.IsShowDungeonUI = true
  self:OnDefenceCoreActive()
  self.Bar_Blood:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.BattlePanel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function WBP_DungeonDefenseFloatPro_C:OnDefenceCoreActive()
  if self.IsActive then
    return
  end
  local DefenseCore = self:GetDefenseCore()
  if DefenseCore then
    self:SetBloodAndShieldNum(math.floor(DefenseCore:GetAttr("MaxHp")), math.floor(DefenseCore:GetAttr("MaxES")), 1)
  end
  self.Text_Time:SetText(self:GetTimeStr(self.CountDownTime))
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.IsActive = true
end

function WBP_DungeonDefenseFloatPro_C:CloseDungeonUI()
  self.IsShowDungeonUI = false
  local LowHealthUI = UIManager(self):GetUIObj("DefenseLowHealth")
  if LowHealthUI then
    UIManager(self):UnLoadUINew("DefenseLowHealth")
  end
  UIManager(self):RemoveUserWidgetFromParent("DungenonDefenseProFloat")
end

function WBP_DungeonDefenseFloatPro_C:UpdateCountDownTime()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local LeftTime = self.CountDownTime - (GameState.ReplicatedTimeSeconds - self.TimeStamp)
  LeftTime = math.max(LeftTime, 0)
  self.Text_Time:SetText(self:GetTimeStr(LeftTime))
  if LeftTime <= 0 then
    self:RemoveTimer("UpdateCountDownTime", false)
    return
  end
end

function WBP_DungeonDefenseFloatPro_C:SetBloodAndShieldNum(NewHp, NewShield, HpPercent)
  self.Num_Shield:SetText(math.floor(NewShield))
  self.Num_Blood:SetText(math.floor(NewHp))
  local Color = FSlateColor()
  if HpPercent < 0.5 then
    Color.SpecifiedColor.R = 1.0
    Color.SpecifiedColor.G = 0.048
    Color.SpecifiedColor.B = 0.048
    self.Num_Blood:SetColorAndOpacity(Color)
  else
    Color.SpecifiedColor.R = 0.258183
    Color.SpecifiedColor.G = 0.590619
    Color.SpecifiedColor.B = 0.318547
    self.Num_Blood:SetColorAndOpacity(Color)
  end
end

function WBP_DungeonDefenseFloatPro_C:OnDefenceCoreDead(Callback)
  self.HpBar:SetBarPercent(0)
  self.Hp_glowLine:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:SetBloodAndShieldNum(0, 0, 0)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local LowHealthUI = UIManager:GetUIObj("DefenseLowHealth")
  if LowHealthUI then
    LowHealthUI:OnDefenceCoreDead(Callback)
  elseif Callback then
    Callback()
  end
end

function WBP_DungeonDefenseFloatPro_C:LoadSubWidget(Container, WidgetName, ...)
  if not Container then
    return
  end
  local SubWidget = self:CreateWidgetNew(WidgetName)
  Container:AddChild(SubWidget)
  SubWidget:Init(...)
  return Container:GetChildAt(0)
end

function WBP_DungeonDefenseFloatPro_C:LoadHpBar()
  local BarLength = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.SizeBox_HP):GetSize().X
  self.HpBar = self:LoadSubWidget(self.SizeBox_HP, "HPBar", false, BarLength)
end

function WBP_DungeonDefenseFloatPro_C:LoadShieldBar()
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.SizeBox_Shield)
  local Size = CanvasSlot:GetSize()
  self.ShieldBar = self:LoadSubWidget(self.SizeBox_Shield, "ShieldBar", Size.X, Size.Y)
end

function WBP_DungeonDefenseFloatPro_C:HideUselessWidget()
  local function SafeHide(Target, Level)
    if Target and Level then
      Target:SetVisibility(Level)
    end
  end
  
  SafeHide(self.HorizontalBox_HP, UE4.ESlateVisibility.Collapsed)
  SafeHide(self.Deduct_Blood, UE4.ESlateVisibility.Collapsed)
  SafeHide(self.Deduct_Shield, UE4.ESlateVisibility.Collapsed)
end

function WBP_DungeonDefenseFloatPro_C:GetDefenseCore()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    return
  end
  local Keys = GameState.DefBaseMap:Keys()
  if Keys:Length() <= 0 then
    return
  end
  local MechanismEid = Keys:GetRef(1)
  local CurTargetActor = Battle(self):GetEntity(MechanismEid)
  if not CurTargetActor then
    return
  end
  return CurTargetActor
end

function WBP_DungeonDefenseFloatPro_C:GetWaveStartBP()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
  local UIManager = GameInstance:GetGameUIManager()
  local WaveStartBP = UIManager:GetUIObj("WaveStartBP")
  WaveStartBP = WaveStartBP or UIManager:LoadUINew("WaveStartBP")
  WaveStartBP:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  return WaveStartBP
end

function WBP_DungeonDefenseFloatPro_C:OnDefenseWaveStart()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    return
  end
  self.HintTime = GameState.DefenceWaveInterval
  local WaveStartBP = self:GetWaveStartBP()
  if WaveStartBP then
    WaveStartBP:SetVisibility(ESlateVisibility.Collapsed)
    WaveStartBP.Text_WaveStart:SetText(GText("DUNGEON_DEFENCE_101"))
    self:AddTimer(self.HintTime, function()
      WaveStartBP:SetVisibility(ESlateVisibility.HitTestInvisible)
      WaveStartBP:PlayInAnimation()
      AudioManager(self):PlayUISound(nil, "event:/ui/common/battle_warning", nil, nil)
    end)
    self:AddTimer(self.HintTime + self.ToastShowTime, function()
      WaveStartBP:PlayOutAnimation()
    end)
  end
  self:ShowCountDown()
end

function WBP_DungeonDefenseFloatPro_C:OnWaveStart()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    return
  end
  self.HintTime = GameState.DefenceWaveInterval
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
  local UIManager = GameInstance:GetGameUIManager()
  local GuideTextFloat = UIManager:GetUIObj("GuideTextFloat")
  GuideTextFloat = GuideTextFloat or UIManager:LoadUI(UIConst.GUIDETEXTFLOAT, "GuideTextFloat", UIConst.ZORDER_FOR_SECONDARY_POPUP)
  if GuideTextFloat then
    GuideTextFloat:ShowDungeonGuide("DUNGEON_TRAINING_101", self.ToastShowTime)
  end
  self:AddTimer(self.ToastShowTime, self.ShowCountDown)
end

function WBP_DungeonDefenseFloatPro_C:OnDefenceWaveEnd()
  local WaveStartBP = self:GetWaveStartBP()
  if WaveStartBP then
    WaveStartBP.Text_WaveStart:SetText(GText("DUNGEON_DEFENCE_102"))
    EMUIAnimationSubsystem:EMPlayAnimation(WaveStartBP, WaveStartBP.In)
    self:AddTimer(self.ToastShowTime, function()
      EMUIAnimationSubsystem:EMPlayAnimation(WaveStartBP, WaveStartBP.Out)
    end)
  end
end

function WBP_DungeonDefenseFloatPro_C:OnWaveEnd()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
  local UIManager = GameInstance:GetGameUIManager()
  local GuideTextFloat = UIManager:GetUIObj("GuideTextFloat")
  GuideTextFloat = GuideTextFloat or UIManager:LoadUI(UIConst.GUIDETEXTFLOAT, "GuideTextFloat", UIConst.ZORDER_FOR_SECONDARY_POPUP)
  if GuideTextFloat then
    GuideTextFloat:ShowDungeonGuide("DUNGEON_TRAINING_102", self.ToastShowTime)
  end
  self:AddTimer(self.ToastShowTime, self.ShowCountDown)
end

function WBP_DungeonDefenseFloatPro_C:ShowCountDown()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
  local UIManager = GameInstance:GetGameUIManager()
  local GuideCountDownFloat = UIManager:GetUIObj("GuideCountDown")
  GuideCountDownFloat = GuideCountDownFloat or UIManager:LoadUINew("GuideCountDown")
  GuideCountDownFloat:InitializeData(self.HintTime)
end

return WBP_DungeonDefenseFloatPro_C
