require("UnLua")
local WBP_DungeonDefenseFloat_C = Class("BluePrints.UI.Dungeon.WBP_DungeonUIBase_C")

function WBP_DungeonDefenseFloat_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.IsPause = false
  self.LastShield = nil
  self.LastHp = nil
  self.UpdateTickTime = 0.5
  self.LowHpPercent = 0.5
  self.WavesRemained = nil
  self.CurTargetActor = nil
  self.ToastShowTime = 1
  rawset(self, "NormalColor", FLinearColor(0.274677, 0.637597, 0.341915, 1.0))
  rawset(self, "CriticalColor", FLinearColor(0.63, 0, 0, 1.0))
end

function WBP_DungeonDefenseFloat_C:InitListenEvent()
  self.Super.InitListenEvent(self)
  self:AddDispatcher(EventID.CloseDungeonUI, self, self.CloseDungeonUI)
  self:AddDispatcher(EventID.OnSetTempleLimit, self, self.OnSetTempleLimit)
  self:AddDispatcher(EventID.OnTempleTimeChanged, self, self.OnTempleTimeChanged)
  self:AddDispatcher(EventID.OnTempleScoreCollectChanged, self, self.OnTempleScoreCollectChanged)
  self:AddDispatcher(EventID.OnDefenseWaveStart, self, self.OnDefenseWaveStart)
  self:AddDispatcher(EventID.OnWaveStart, self, self.OnWaveStart)
  self:AddDispatcher(EventID.OnWaveEnd, self, self.OnWaveEnd)
  self:AddDispatcher(EventID.OnDefenceWaveEnd, self, self.OnDefenceWaveEnd)
  self:AddDispatcher(EventID.OnRepDungeonProgress, self, self.UpdateDungeonProgressDisplay)
end

function WBP_DungeonDefenseFloat_C:UIStateChange_OnTarget()
  if self.TempleMode then
    return
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    return
  end
  self.IsRescueMode = GameState.GameModeType == "Rescue"
  if self.IsRescueMode then
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.BattlePanel:SetVisibility(UE4.ESlateVisibility.Visible)
    self:AddTimer(self.UpdateTickTime, self.UpdateTargetInfo, true, 0, "UpdateMechanism", false)
    self.DefenseCoreName:SetText(GText("UI_DUNGEON_HOSTAGE"))
    self.LowHpPercent = 0.01
    self:HideUselessWidget()
    self.IsClient = IsClient(self)
    self:AddDispatcher(EventID.NotifyClientChangeHostageInvincible, self, self.SetInvincibility)
  else
    self:TryOnDefenceCoreActive()
    self:UpdateWaveCount()
    self:AddTimer(self.UpdateTickTime, self.UpdateTargetInfo, true, 0, "UpdateMechanism", false)
  end
  if self.IsSynthesisMode then
    self:HideUselessWidget()
  end
  self.BattlePanel:SetVisibility(UE4.ESlateVisibility.Visible)
end

function WBP_DungeonDefenseFloat_C:CloseDungeonUI()
  if self.TempleMode then
    return
  end
  if self.IsSynthesisMode then
    local LowHealthUI = UIManager(self):GetUIObj("DefenseLowHealth")
    if LowHealthUI then
      UIManager(self):UnLoadUINew("DefenseLowHealth")
    end
  end
  self:RemoveFromParent()
end

function WBP_DungeonDefenseFloat_C:PauseCountDown()
  self.IsPause = true
end

function WBP_DungeonDefenseFloat_C:ResumeCountDown()
  self.IsPause = false
end

function WBP_DungeonDefenseFloat_C:OnEnd()
  print(_G.LogTag, "WBP_DungeonDefenseFloat_C:OnEnd()")
end

function WBP_DungeonDefenseFloat_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.BattlePanel:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.IsActive = nil
  self:CheckDungeonMode()
  self:OnDungeonUIStateUpdated()
  self:InitWidgetInfo()
  self:InitListenEvent()
  if self.TempleMode then
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.BattlePanel:SetVisibility(UE4.ESlateVisibility.Visible)
    return
  end
  self.IsRescueMode = (...)
  self.LastHpPercent = 1.0
  self.SizeBox_HP:ClearChildren()
  self.SizeBox_Shield:ClearChildren()
  self:LoadHpBar()
  self:LoadShieldBar()
end

function WBP_DungeonDefenseFloat_C:ReActiveCurGuideAnim()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager or not UE4.UKismetSystemLibrary.IsValid(UIManager) then
    return
  end
  local Result = TArray("")
  for k, v in pairs(UIConst.DUNGEONINDICATOR) do
    local ret = UIManager:GetAllUINameByBPClass(UE4.UClass.Load(v))
    if ret:Length() > 0 then
      for i = 1, ret:Length() do
        Result:Add(ret:GetRef(i))
      end
    end
  end
  for i = 1, Result:Length() do
    local UIName = Result:GetRef(i)
    local GuideIcon = UIManager:GetUIObj(UIName)
    if nil ~= GuideIcon then
      GuideIcon:RePlayAppearAnim()
    end
  end
end

function WBP_DungeonDefenseFloat_C:UpdateTargetInfo()
  local CurTargetActor = self:GetTargetActor()
  if not CurTargetActor and not self.IsClient then
    return
  end
  if not self:IsAnimationPlaying(self.Shield_Glow) then
    self.Shield_glowLine:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if not self:IsAnimationPlaying(self.HP_Glow) then
    self.HP_glowLine:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if not self.IsRescueMode and CurTargetActor and DataMgr.Mechanism[CurTargetActor.UnitId].UnitName then
    self.DefenseCoreName:SetText(GText(DataMgr.Mechanism[CurTargetActor.UnitId].UnitName))
  end
  local NewShield = self:GetAttrFromTarget(CurTargetActor, "ES")
  local MaxShield = self:GetAttrFromTarget(CurTargetActor, "MaxES")
  local NewHp = self:GetAttrFromTarget(CurTargetActor, "Hp")
  local MaxHp = self:GetAttrFromTarget(CurTargetActor, "MaxHp")
  local OverShield = self:GetAttrFromTarget(CurTargetActor, "OverShield")
  if not self.LastHp then
    self.LastHp = NewHp
  end
  if not self.LastShield then
    self.LastShield = NewShield
  end
  if not self.LastOverShield then
    self.LastOverShield = OverShield
  end
  local NewShieldPercent = (NewShield + OverShield) / MaxShield
  if NewShield < self.LastShield then
    self.ShieldBar:SetBarPercent(NewShieldPercent)
    if NewShield < self.LastShield then
      self.ShieldBar:PlayDeduct(true)
    end
  elseif NewShield > self.LastShield then
    self.ShieldBar:SetBarPercent(NewShieldPercent, false)
    self.ShieldBar:PlayRecoveryShield()
  else
    self.ShieldBar:DirectSetBarPercent(NewShieldPercent, 0.0)
  end
  if self.IsRescueMode then
    local NewOverShieldPercent = MaxShield > 0 and OverShield / MaxShield or 0
    if OverShield < self.LastOverShield or NewOverShieldPercent < 0.001 then
      self.ShieldBar:SetOverShieldPercent(NewOverShieldPercent)
      self.ShieldBar:PlayOverShieldDeduct(true)
      if NewOverShieldPercent < 0.001 then
        self.ShieldBar:ShowOrHideOverShieldGroup(false)
      end
    elseif OverShield > self.LastOverShield then
      self.ShieldBar:SetOverShieldPercent(NewOverShieldPercent)
      if self.LastOverShield < 0.001 then
        self.ShieldBar:ShowOrHideOverShieldGroup(true)
      end
      self.ShieldBar:PlayOverShieldRecover()
    end
  end
  local NewHpPercent = NewHp / MaxHp
  self.HpBar:SetBarPercent(NewHpPercent)
  if NewHp < self.LastHp and NewHp < self.LastHp then
    self.HpBar:PlayDeduct(true)
  end
  if not self.IsRescueMode then
    if not CurTargetActor or not CurTargetActor.ForbideLowHealthUI then
      self:LoadLowHealthUI(NewHpPercent)
    end
    if NewHp < self.LastHp then
      if NewHpPercent < self.LastHpPercent then
        self:PlayGlowAnim(NewHp / MaxHp, self.HP_glowLine, self.Warning_Glow)
      else
        self:PlayGlowAnim(NewHp / MaxHp, self.HP_glowLine, self.HP_Glow)
      end
    end
    if NewShield < self.LastShield then
      self:PlayGlowAnim(NewShield / MaxShield, self.Shield_glowLine, self.Shield_Glow)
    end
  end
  if NewHpPercent < (self.LowHpPercent or 0.5) then
    self.HpBar:SetProgressBarColorInner(self.CriticalColor)
  else
    self.HpBar:SetProgressBarColorInner(self.NormalColor)
  end
  self.LastShield = NewShield
  self.LastHp = NewHp
  self.LastHpPercent = NewHpPercent
  self:SetBloodAndShieldNum(NewHp, NewShield, NewHpPercent)
end

function WBP_DungeonDefenseFloat_C:PlayGlowAnim(NewPercent, Glow, GlowAnim)
  if self.IsRescueMode then
    return
  end
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

function WBP_DungeonDefenseFloat_C:SetInvincibility(bIsInvincibility)
  if nil == bIsInvincibility then
    bIsInvincibility = true
  end
  if self.HpBar then
    self.HpBar:PlayInvincibility(bIsInvincibility)
  end
  if self.ShieldBar then
    self.ShieldBar:PlayInvincibility(bIsInvincibility)
  end
end

function WBP_DungeonDefenseFloat_C:SetBloodAndShieldNum(NewHp, NewShield, HpPercent)
  self.Num_Shield:SetText(math.floor(NewShield))
  self.Num_Blood:SetText(math.floor(NewHp))
  local Color = FSlateColor()
  local bIsLowPercent = HpPercent < self.LowHpPercent
  if bIsLowPercent then
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
  if self.IsRescueMode then
    if bIsLowPercent then
      self.DefenseCoreName:SetColorAndOpacity(Color)
    else
      Color.SpecifiedColor.R = 1.0
      Color.SpecifiedColor.G = 1.0
      Color.SpecifiedColor.B = 1.0
      self.DefenseCoreName:SetColorAndOpacity(Color)
    end
  end
end

function WBP_DungeonDefenseFloat_C:UpdateDungeonProgressDisplay(DungeonProgress)
  self.Num_Wave_Now:SetText(DungeonProgress)
end

function WBP_DungeonDefenseFloat_C:TryOnDefenceCoreActive()
  if self:OnDefenceCoreActive() then
    return
  else
    self:AddTimer(0.1, function()
      if self:OnDefenceCoreActive() then
        self:RemoveTimer("TryOnDefenceCoreActive")
      end
    end, true, 0, "TryOnDefenceCoreActive")
  end
end

function WBP_DungeonDefenseFloat_C:OnDefenceCoreActive()
  if self.TempleMode then
    return
  end
  local DefenseCore = self:GetDefenseCore()
  if not DefenseCore or self.IsActive then
    return false
  end
  self.IsActive = true
  self.LowHpPercent = 0.5
  self.TextBlock_1:SetText(GText("UI_Defense_Done"))
  self.TextBlock_2:SetText(GText("UI_Defense_Remain"))
  self.Num_Shield:SetText(math.floor(DefenseCore:GetAttr("MaxES")))
  self.Num_Blood:SetText(math.floor(DefenseCore:GetAttr("MaxHp")))
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.BattlePanel:SetVisibility(UE4.ESlateVisibility.Visible)
  if self.IsNewDefenceMode then
    self.Defensivewave:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.LeftWave:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if self.IsEndlessMode then
      self.Panel_Wave_Now:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    self.Panel_Wave:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Text_Wave_Now:SetText(GText("TARGET_DUNGEON_ROUND"))
    self:UpdateDungeonProgressDisplay(GameState(self).DungeonProgress)
    self.Text_Wave:SetText(GText("TARGET_DUNGEON_DEFENCE_WAVE"))
  end
  return true
end

function WBP_DungeonDefenseFloat_C:OnDefenceCoreDead(Callback)
  if self.TempleMode then
    return
  end
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

function WBP_DungeonDefenseFloat_C:LoadLowHealthUI(CurrentPercent)
  if not CurrentPercent then
    return
  end
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if CurrentPercent <= 0.3 then
    if self.LastHpPercent > 0.3 then
      local WarningLastTime = 1.5
      local WarningText = GText("UI_Tosat_Defense_LowHealth")
      if self.IsSynthesisMode then
        WarningText = GText("DUNGEON_SYNTHESIS_106")
      end
      UIManager:ShowUITip(UIConst.Tip_CommonWarning, WarningText, WarningLastTime)
      self:AddTimer(WarningLastTime + 0.2, function()
        UIManager:LoadUINew("DefenseLowHealth")
      end, false, 0, nil, false)
    end
    local LowHealthUI = UIManager:GetUIObj("DefenseLowHealth")
    if LowHealthUI then
      LowHealthUI.Text_Health:SetText(tostring(math.floor(CurrentPercent * 100)))
    end
  else
    local LowHealthUI = UIManager:GetUIObj("DefenseLowHealth")
    if LowHealthUI then
      UIManager:UnLoadUINew("DefenseLowHealth")
    end
  end
end

function WBP_DungeonDefenseFloat_C:LoadSubWidget(Container, WidgetName, ...)
  if not Container then
    return
  end
  local SubWidget = self:CreateWidgetNew(WidgetName)
  Container:AddChild(SubWidget)
  SubWidget:Init(...)
  return Container:GetChildAt(0)
end

function WBP_DungeonDefenseFloat_C:LoadHpBar()
  local BarLength = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.SizeBox_HP):GetSize().X
  self.HpBar = self:LoadSubWidget(self.SizeBox_HP, "HPBar", false, BarLength)
end

function WBP_DungeonDefenseFloat_C:LoadShieldBar()
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.SizeBox_Shield)
  local Size = CanvasSlot:GetSize()
  self.ShieldBar = self:LoadSubWidget(self.SizeBox_Shield, "ShieldBar", Size.X, Size.Y)
end

function WBP_DungeonDefenseFloat_C:HideUselessWidget()
  local function SafeHide(Target, Level)
    if Target and Level then
      Target:SetVisibility(Level)
    end
  end
  
  SafeHide(self.HorizontalBox_HP, UE4.ESlateVisibility.Collapsed)
  SafeHide(self.Deduct_Blood, UE4.ESlateVisibility.Collapsed)
  SafeHide(self.Deduct_Shield, UE4.ESlateVisibility.Collapsed)
  if self.IsRescueMode then
    SafeHide(self.Defensivewave, UE4.ESlateVisibility.Collapsed)
    SafeHide(self.LeftWave, UE4.ESlateVisibility.Collapsed)
  end
  if self.IsSynthesisMode then
    SafeHide(self.Defensivewave, UE4.ESlateVisibility.Collapsed)
    SafeHide(self.LeftWave, UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_DungeonDefenseFloat_C:GetTargetActor()
  local Target
  if self.IsRescueMode then
    Target = self:GetRescueActor()
  else
    Target = self:GetDefenseCore()
  end
  if IsValid(Target) then
    return Target
  end
end

function WBP_DungeonDefenseFloat_C:GetDefenseCore()
  if IsValid(self.CurTargetActor) then
    return self.CurTargetActor
  end
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
  self.CurTargetActor = CurTargetActor
  return self.CurTargetActor
end

function WBP_DungeonDefenseFloat_C:GetRescueActor()
  if IsValid(self.CurTargetActor) then
    return self.CurTargetActor
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    return
  end
  for _, AI in pairs(GameState.MonsterMap) do
    if IsValid(AI) and AI.IsHostage then
      self.CurTargetActor = AI
      break
    end
  end
  return self.CurTargetActor
end

function WBP_DungeonDefenseFloat_C:CheckDungeonMode()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  if not GameInstance then
    return
  end
  self.DungeonId = GameInstance:GetCurrentDungeonId()
  self.DungeonInfo = DataMgr.Dungeon[self.DungeonId]
  if not self.DungeonInfo then
    return
  end
  if self.DungeonInfo.DungeonWinMode == CommonConst.DungeonWinMode.Endless then
    self.IsEndlessMode = true
  end
  if self.DungeonInfo.DungeonType == "Defence" or self.DungeonInfo.DungeonType == "DefenceMove" then
    self.IsNewDefenceMode = true
  end
  if self.DungeonInfo.DungeonType == "Temple" then
    self.TempleMode = true
    self.TempleInfo = DataMgr.Temple[self.DungeonId]
    self:InitTemple()
  end
  if self.DungeonInfo.DungeonType == "Synthesis" then
    self.IsSynthesisMode = true
  end
end

function WBP_DungeonDefenseFloat_C:InitTemple()
  self.BattlePanel:SetVisibility(UE4.ESlateVisibility.Visible)
  self.Bar_Blood:SetVisibility(ESlateVisibility.Collapsed)
  self.Num_Shield:SetVisibility(ESlateVisibility.Collapsed)
  self.Num_Blood:SetVisibility(ESlateVisibility.Collapsed)
  self.DefendedWaveCount:SetVisibility(ESlateVisibility.Collapsed)
  self.RemainingWaveCount:SetVisibility(ESlateVisibility.Collapsed)
  self.DefenseCoreName:SetVisibility(ESlateVisibility.Hidden)
  self.Spacer_Temple:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local CurrentColor = self.TextBlock_1.ColorAndOpacity
  CurrentColor.SpecifiedColor.A = 1.0
  self.TextBlock_1:SetColorAndOpacity(CurrentColor)
  self.BattlePanel:SetVisibility(ESlateVisibility.Hidden)
  self.IsCountDown = false
  if self.TempleInfo.SucRule == "CountDown" then
    self.IsCountDown = true
  else
    self:InitTargetInfo()
  end
end

function WBP_DungeonDefenseFloat_C:OnTempleTimeChanged(CurrentTime, ThresholdTime)
  if self.TempleInfo.SucRule == "Time" then
    local Time = self:GetTimeStr(CurrentTime)
    self.TextBlock_2:SetText(GText("UI_TEMPLE_TOTAL_TIME") .. ": " .. Time)
  end
  if self.Limit == "TIME" then
    local Time = ThresholdTime - CurrentTime
    if Time >= 0 then
      self.DefenseCoreName:SetText(GText("UI_TEMPLE_LIMIT_" .. self.Limit) .. self:GetTimeStr(Time))
    end
  end
end

function WBP_DungeonDefenseFloat_C:OnSetTempleLimit(Limit, Value)
  self.Limit = Limit
  self.DefenseCoreName:SetVisibility(ESlateVisibility.Visible)
  if "TIME" == Limit then
    self.TimeThreshold = Value
    local Time = self:GetTimeStr(Value)
    self.DefenseCoreName:SetText(GText("UI_TEMPLE_LIMIT_" .. self.Limit) .. Time)
  else
    self.DefenseCoreName:SetText(GText("UI_TEMPLE_LIMIT_" .. self.Limit) .. Value)
  end
  if self.IsCountDown then
    self:InitTargetInfo()
  end
end

function WBP_DungeonDefenseFloat_C:OnTempleScoreCollectChanged(Value)
  self.TextBlock_2:SetText(GText("UI_TEMPLE_TOTAL_" .. string.upper(self.TempleInfo.SucRule)) .. ": " .. Value)
end

function WBP_DungeonDefenseFloat_C:OnTempleDeathFallChanged(Value)
  if Value >= 0 then
    self.DefenseCoreName:SetText(GText("UI_TEMPLE_LIMIT_" .. self.Limit) .. Value)
  end
end

function WBP_DungeonDefenseFloat_C:InitTargetInfo()
  local TextRule2 = ""
  if self.TempleInfo.SucRule == "Time" then
    TextRule2 = "SECONDS"
    self.TextBlock_2:SetText(GText("UI_TEMPLE_TOTAL_" .. string.upper(self.TempleInfo.SucRule)) .. ": 00:00")
  elseif self.TempleInfo.SucRule == "CountDown" then
    TextRule2 = "SECONDS"
    self.TextBlock_2:SetVisibility(ESlateVisibility.Collapsed)
  elseif self.TempleInfo.SucRule == "Score" then
    TextRule2 = "SCORE"
    self.TextBlock_2:SetText(GText("UI_TEMPLE_TOTAL_" .. string.upper(self.TempleInfo.SucRule)) .. ": 0")
  elseif self.TempleInfo.SucRule == "Collect" then
    TextRule2 = "COUNT"
    self.TextBlock_2:SetText(GText("UI_TEMPLE_TOTAL_" .. string.upper(self.TempleInfo.SucRule)) .. ": 0")
  end
  local Text = GText("UI_TEMPLE_" .. self.DungeonId)
  if #self.TempleInfo.RewardId > 1 and #self.TempleInfo.RatingRange > 1 then
    for i = 3, 1, -1 do
      local TextInfo = ""
      local Target = self.TempleInfo.RatingRange[i]
      if 0 == Target then
        TextInfo = GText("UI_TEMPLE_SUCRULE_ZERO")
      elseif self.TempleInfo.SucRule == "CountDown" and self.TempleInfo.UIShowType and self.TempleInfo.UIShowType > 0 and self.TimeThreshold and self.TimeThreshold > 0 then
        TextInfo = string.format(GText("UI_TEMPLE_SUCRULE_COUNTDOWN_" .. self.TempleInfo.UIShowType), self.TimeThreshold - Target)
      elseif "SCORE" == TextRule2 then
        TextInfo = GText("UI_TEMPLE_SUCRULE_" .. string.upper(self.TempleInfo.SucRule)) .. Target
      else
        TextInfo = GText("UI_TEMPLE_SUCRULE_" .. string.upper(self.TempleInfo.SucRule)) .. Target .. GText("UI_TEMPLE_MEASURE_" .. TextRule2)
      end
      Text = Text .. "\n" .. GText("UI_TEMPLE_BLANK") .. GText("UI_TEMPLE_STAR_" .. i) .. TextInfo
    end
  end
  self.TextBlock_1:SetText(Text)
  self.BattlePanel:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end

function WBP_DungeonDefenseFloat_C:GetWaveStartBP()
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

function WBP_DungeonDefenseFloat_C:OnDefenseWaveStart()
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
  self:UpdateWaveCount()
  self:AddTimer(self.UpdateTickTime, self.UpdateTargetInfo, true, 0, "UpdateMechanism", false)
end

function WBP_DungeonDefenseFloat_C:OnWaveStart()
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

function WBP_DungeonDefenseFloat_C:OnDefenceWaveEnd()
  local WaveStartBP = self:GetWaveStartBP()
  if WaveStartBP then
    WaveStartBP.Text_WaveStart:SetText(GText("DUNGEON_DEFENCE_102"))
    EMUIAnimationSubsystem:EMPlayAnimation(WaveStartBP, WaveStartBP.In)
    self:AddTimer(self.ToastShowTime, function()
      EMUIAnimationSubsystem:EMPlayAnimation(WaveStartBP, WaveStartBP.Out)
    end)
  end
end

function WBP_DungeonDefenseFloat_C:OnWaveEnd()
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

function WBP_DungeonDefenseFloat_C:ShowCountDown()
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

function WBP_DungeonDefenseFloat_C:InitWidgetInfo()
  self.Bar_Blood:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Num_Shield:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Num_Blood:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.DefendedWaveCount:SetVisibility(ESlateVisibility.Visible)
  self.RemainingWaveCount:SetVisibility(ESlateVisibility.Visible)
  self.DefenseCoreName:SetVisibility(ESlateVisibility.Visible)
  self.Spacer_Temple:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.TextBlock_1:SetVisibility(ESlateVisibility.Visible)
  local CurrentColor = self.TextBlock_1.ColorAndOpacity
  CurrentColor.SpecifiedColor.A = 0.8
  self.TextBlock_1:SetColorAndOpacity(CurrentColor)
  self.TextBlock_2:SetVisibility(ESlateVisibility.Visible)
  self.DefenseCoreName:SetText(GText("UI_DUNGEON_HOSTAGE"))
end

function WBP_DungeonDefenseFloat_C:UpdateWaveCount()
  if not GameState then
    return
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local WavesFinished = (GameState.DefenceWave - 1) % 3
  self.WavesRemained = GameState.DefenceWavesPerStage - WavesFinished
  if self.IsNewDefenceMode then
    self.Num_DefensedWave:SetText(WavesFinished)
    self.Num_TotalWave:SetText(GameState.DefenceWavesPerStage)
  else
    self.DefendedWaveCount:SetText(GameState.DefenceWave - 1)
    self.RemainingWaveCount:SetText(self.WavesRemained)
  end
end

function WBP_DungeonDefenseFloat_C:GetAttrFromTarget(CurTargetActor, AttrName)
  if CurTargetActor then
    return CurTargetActor:GetAttr(AttrName)
  end
  if self.IsClient then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    if not GameState then
      return
    end
    return GameState.HostageState["Hostage" .. AttrName] or 0
  end
end

return WBP_DungeonDefenseFloat_C
