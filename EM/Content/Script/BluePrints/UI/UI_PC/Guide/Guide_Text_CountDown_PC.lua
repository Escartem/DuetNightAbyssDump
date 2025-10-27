local Guide_Text_CountDown_PC = Class("BluePrints.UI.UI_PC.Guide.Guide_TipsAsyncActionUIBase")

function Guide_Text_CountDown_PC:OnLoaded(...)
  Guide_Text_CountDown_PC.Super.OnLoaded(self, ...)
end

function Guide_Text_CountDown_PC:InitializeData(Duration)
  local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
  if BattleMainUI then
    BattleMainUI.Pos_CountDown:AddChild(self)
    BattleMainUI.Pos_CountDown:SetVisibility(UE.ESlateVisibility.SelfHitTestInvisible)
  end
  if not self:OnTipBegin(Duration, self.OnCountDownEnd, self.In, self.Out) then
    self:OnClose()
    return
  end
  if self.TimerHandle then
    self:RemoveTimer("GuideTextCountDownTick", false)
    self.TimerHandle = nil
  end
  self.TimerHandle = self:AddTimer(1, self.Tick, true, 0, "GuideTextCountDownTick", false)
  self.CountDownTime = math.floor(Duration - 1)
  self.Guide_Text_CountDown_PC.Text_CountDown:SetText(string.format("%d", self.CountDownTime))
  AudioManager(self):PlayUISound(self, "event:/ui/common/battle_countdown", nil, nil)
end

function Guide_Text_CountDown_PC:Tick()
  local LastTime = self.CountDownTime
  self.CountDownTime = math.floor(self.CountDownTime - 1)
  local NumberChange = LastTime - self.CountDownTime > 1.0E-4
  self.Guide_Text_CountDown_PC.Text_CountDown:SetText(string.format("%d", self.CountDownTime))
  self.Guide_Text_CountDown_PC.FX_Text_CountDown_1:SetText(string.format("%d", self.CountDownTime))
  if NumberChange then
    self.Guide_Text_CountDown_PC:PlayAnimation(self.Guide_Text_CountDown_PC.RefreshCountDown)
  end
  if 0 == self.CountDownTime then
    AudioManager(self):PlayUISound(self, "event:/ui/common/battle_countdown_end", nil, nil)
  elseif self.CountDownTime > 0 then
    AudioManager(self):PlayUISound(self, "event:/ui/common/battle_countdown", nil, nil)
  end
end

function Guide_Text_CountDown_PC:OnCountDownEnd()
  self:RemoveTimer("GuideTextCountDownTick", false)
  self.TimerHandle = nil
  local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
  if BattleMainUI then
    BattleMainUI.Pos_CountDown:RemoveChild(self)
  end
end

function Guide_Text_CountDown_PC:OnClose()
  self:OnTipRealEnd()
end

function Guide_Text_CountDown_PC:InitTempleCountDown(Duration, bShowZeroText)
  if self.InCountDown then
    self:OnClose()
    return
  end
  local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
  if BattleMainUI then
    BattleMainUI.Pos_CountDown:AddChild(self)
    BattleMainUI.Pos_CountDown:SetVisibility(UE.ESlateVisibility.SelfHitTestInvisible)
  end
  if self.TempleTimerHandle then
    self:RemoveTimer("GuideTextCountDownTick", false)
    self.TempleTimerHandle = nil
  end
  self.InCountDown = true
  self.ShowZeroText = bShowZeroText
  self.IsTempleCountDownEnd = false
  self:AddTimer(Duration, self.OnTempleGuideCountDownEnd, false, 0, "TempleGuideCountDown", false)
  if nil ~= self.Guide_Text_CountDown_PC.In then
    self.Guide_Text_CountDown_PC:PlayAnimation(self.Guide_Text_CountDown_PC.In)
  end
  self.TempleTimerHandle = self:AddTimer(1, self.TempleTick, true, 0, "GuideTextCountDownTick", false)
  self.CountDownTime = math.floor(Duration - 1)
  self.Guide_Text_CountDown_PC.Text_CountDown:SetText(string.format("%d", self.CountDownTime))
  AudioManager(self):PlayUISound(self, "event:/ui/common/count_down_multi_player_challenge", nil, nil)
end

function Guide_Text_CountDown_PC:TempleTick()
  self.CountDownTime = math.floor(self.CountDownTime - 1)
  if self.CountDownTime < 0 then
    self:OnTempleGuideCountDownEnd()
    return
  end
  self.Guide_Text_CountDown_PC.Text_CountDown:SetText(string.format("%d", self.CountDownTime))
  if 0 == self.CountDownTime then
    AudioManager(self):PlayUISound(self, "event:/ui/common/count_down_multi_player_challenge_last_count", nil, nil)
    if self.ShowZeroText == false then
      self.Guide_Text_CountDown_PC.Text_CountDown:SetText(GText("UI_Temple_Countdown_Go"))
    end
  elseif self.CountDownTime > 0 then
    AudioManager(self):PlayUISound(self, "event:/ui/common/count_down_multi_player_challenge", nil, nil)
  end
end

function Guide_Text_CountDown_PC:OnTempleGuideCountDownEnd()
  if self.IsTempleCountDownEnd then
    return
  end
  self.IsTempleCountDownEnd = true
  self:OnTempleCountDownRealEnd()
  if self.Guide_Text_CountDown_PC.Out then
    self.Guide_Text_CountDown_PC:PlayAnimation(self.Guide_Text_CountDown_PC.Out)
  end
  local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
  if BattleMainUI then
    BattleMainUI.Pos_CountDown:RemoveChild(self)
  end
end

function Guide_Text_CountDown_PC:OnTempleCountDownRealEnd()
  self.InCountDown = false
  self:RemoveTimer("GuideTextCountDownTick", false)
  self:RemoveTimer("TempleGuideCountDown", false)
  self.TempleTimerHandle = nil
end

return Guide_Text_CountDown_PC
