require("UnLua")
local WBP_Abyss_Progress_C = Class({
  "BluePrints.UI.BP_UIState_C"
})
local PROGRESS_BAR_WIDTH = 426
local WARNING_TIME = 10

function WBP_Abyss_Progress_C:OnLoaded(...)
  WBP_Abyss_Progress_C.Super.OnLoaded(self, ...)
  local BattleMain = UIManager(self):GetUIObj("BattleMain")
  assert(BattleMain, "WBP_Abyss_Progress_C \229\138\160\232\189\189\230\151\182\230\139\191\228\184\141\229\136\176BattleMain\239\188\129")
  BattleMain.Pos_Abyss_CountDown_1:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  BattleMain.Pos_Abyss_CountDown_1:AddChildToOverlay(self)
  self:InitUi()
end

function WBP_Abyss_Progress_C:InitUi()
  self.CurTimerHandle = ""
  self:InitListenEvent()
  local Progress = 0
  self.Bar_Progress:SetPercent(Progress)
  local IconEnemyX = PROGRESS_BAR_WIDTH * Progress - PROGRESS_BAR_WIDTH
  self.Icon_Enemy:SetRenderTranslation(FVector2D(IconEnemyX, 0))
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.IsSuccess = false
  self.GameState = UE4.UGameplayStatics.GetGameState(self)
end

function WBP_Abyss_Progress_C:InitListenEvent()
  self:AddDispatcher(EventID.OnRepAbyssBattleCount, self, self.OnRepAbyssBattleCount)
end

function WBP_Abyss_Progress_C:ShowAbyssCountDown(TimerHandle)
  self:InitUi()
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.CurTimerHandle = TimerHandle
  if not self.GameState then
    return
  end
  local Info = self.GameState.ClientTimerStruct:GetTimerInfo(TimerHandle)
  self.TotalTime = Info.Time
  self:AddTimer(0.1, self.UpdateAbyssCountDownUI, true, 0, "AbyssCountDownUI")
  self:StopAnimation(self.Success)
  self:PlayAnimation(self.In)
  AudioManager(self):PlayUISound(self, "event:/ui/activity/drama_challenge_progressbar_show", nil, nil)
end

function WBP_Abyss_Progress_C:HideAbyssCountDown(TimerHandle)
  if self.CurTimerHandle ~= TimerHandle then
    return
  end
  self:RemoveTimer("AbyssCountDownUI")
  self:PlayAnimation(self.Success)
end

function WBP_Abyss_Progress_C:UpdateAbyssCountDownUI()
  local DisplayRemainTime = CommonUtils.GetClientTimerStructRemainTime(self.CurTimerHandle)
  if DisplayRemainTime < 0 then
    DisplayRemainTime = 0
  end
  local currentTimeText = self:GetTimeStr_Cpp(DisplayRemainTime)
  self.Text_Time:SetText(currentTimeText)
  if DisplayRemainTime <= WARNING_TIME then
    if not self.LastWarningTimeText then
      self.LastWarningTimeText = currentTimeText
      AudioManager(self):PlayUISound(self, "event:/ui/common/countdown_warning", nil, nil)
    end
    if currentTimeText ~= self.LastWarningTimeText then
      AudioManager(self):PlayUISound(self, "event:/ui/common/countdown_warning", nil, nil)
      self.LastWarningTimeText = currentTimeText
    end
    if not self:IsAnimationPlaying(self.Warning) then
      self:PlayAnimation(self.Warning, 0, 0, UE4.EUMGSequencePlayMode.Forward, 1, true)
    end
  elseif DisplayRemainTime <= 0 then
    if self.IsSuccess then
      self:StopAnimation(self.Warning)
      self:PlayAnimation(self.Success)
    else
      self:PlayAnimation(self.Fail)
    end
  elseif DisplayRemainTime > WARNING_TIME then
    self:StopAnimation(self.Warning)
    self.LastWarningTimeText = nil
  end
  local TimeProgress = (self.TotalTime - DisplayRemainTime) / self.TotalTime
  local IconTimeX = PROGRESS_BAR_WIDTH * TimeProgress
  self.Icon_Line:SetRenderTranslation(FVector2D(IconTimeX, 0))
  self.Icon_Clock:SetRenderTranslation(FVector2D(IconTimeX, 0))
end

function WBP_Abyss_Progress_C:OnRepAbyssBattleCount()
  if not self.GameState then
    return
  end
  local MaxNum = self.GameState.AbyssBattleMaxNum or 1
  local Count = self.GameState.AbyssBattleCount or 0
  local Progress = Count / MaxNum
  self.Bar_Progress:SetPercent(Progress)
  local IconEnemyX = PROGRESS_BAR_WIDTH * Progress - PROGRESS_BAR_WIDTH
  self.Icon_Enemy:SetRenderTranslation(FVector2D(IconEnemyX, 0))
  if MaxNum <= Count then
    self.IsSuccess = true
    self:PlayAnimation(self.Success)
  end
end

function WBP_Abyss_Progress_C:Destruct()
  self:RemoveTimer("AbyssCountDownUI")
  self:RemoveDispatcher(EventID.OnRepAbyssBattleCount)
  self.Super.Destruct(self)
end

return WBP_Abyss_Progress_C
