require("UnLua")
local WBP_DungeonCapture_C = Class("BluePrints.UI.Dungeon.WBP_DungeonUIBase_C")

function WBP_DungeonCapture_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.RemainingTime = 30
  self.TurnRedTime = -1
  self.BGDefaultColor = FLinearColor(0.0, 0.0, 0.0, 0.8)
end

function WBP_DungeonCapture_C:NotifyBulletJump()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if Avatar:CheckCondition(130) then
    return
  end
  self:RemoveTimer("ShowBulletJumpMessage", false)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  if nil == UIManger then
    return
  end
  local GuideTextPanel = UIManager(GameInstance):GetUIObj("GuideTextFloat" .. 100009)
  if GuideTextPanel then
    GuideTextPanel:DeleteGuideMessage(100009)
  end
end

function WBP_DungeonCapture_C:ShowMessage()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if Avatar:CheckCondition(130) then
    return
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  if nil == UIManger then
    return
  end
  UResourceLibrary.LoadClassAsync(GameInstance, UIConst.GuideTextFloat, {
    GameInstance,
    function(_, ClassObject)
      UE4.UUIStateAsyncActionBase.ShowGuideToastWithUIClass(GameInstance, ClassObject, 100009, 15)
    end
  })
end

function WBP_DungeonCapture_C:ReActiveCurGuideAnim()
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

function WBP_DungeonCapture_C:OnLoaded(...)
  self.bNotAddToTaskPanel = true
  self.KeyToHideSelf = nil
  self.Super.OnLoaded(self, ...)
  self.panel_time:SetVisibility(ESlateVisibility.Collapsed)
  self:InitListenEvent()
  self.TaskTitle:SetText(GText("TARGET_DUNGEON_CAPTURE_106"))
  self:ListenForInputAction("ActiveGuide", EInputEvent.IE_Pressed, false, {
    self,
    self.ReActiveCurGuideAnim
  })
  self.RemainingTime, self.TurnRedTime, self.ShowBulletJumpToast, self.BGDefaultColor = ...
  if self.BGDefaultColor and self[self.BGDefaultColor .. "Color"] then
    self.BGDefaultColor = self[self.BGDefaultColor .. "Color"]
  else
    self.BGDefaultColor = self.BGDefaultColor or FLinearColor(0.0, 0.0, 0.0, 0.8)
  end
  self.Bg:SetColorAndOpacity(self.BGDefaultColor)
  self.IsRescuing = nil
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not self.RemainingTime then
    self.RemainingTime = 30
  end
  if not self.TurnRedTime then
    if GameState.GameModeType == "Capture" then
      self.TurnRedTime = DataMgr.GlobalConstant.CaptureCountdownPoint.ConstantValue
    elseif GameState.GameModeType == "Rescue" then
      self.TurnRedTime = DataMgr.GlobalConstant.RescueCountdownPoint.ConstantValue
    else
      self.TurnRedTime = 10
    end
  end
  if self.ShowBulletJumpToast then
    self:AddMessageTimer()
  end
end

function WBP_DungeonCapture_C:AddMessageTimer()
  self:AddTimer(15, self.ShowMessage, false, 0, "ShowBulletJumpMessage", false)
end

function WBP_DungeonCapture_C:InitListenEvent()
  self:AddDispatcher(EventID.OnDungeonUIStateUpdated, self, self.OnDungeonUIStateUpdated)
  self:AddDispatcher(EventID.OnRepCaptureRecoveryTime, self, self.OnCaptureRecoveryTimeUpdated)
  self:AddDispatcher(EventID.ShowDungeonUI, self, self.ShowDungeonUI)
  self:AddDispatcher(EventID.CloseDungeonUI, self, self.CloseDungeonUI)
  self:AddDispatcher(EventID.OnRepRescueCountDownTime, self, self.UpdateRemainingTimeInRescue)
  self:AddDispatcher(EventID.UpdateHostageDyingCountDown, self, self.UpdateRemainingTimeInHostage)
end

function WBP_DungeonCapture_C:OnCaptureRecoveryTimeUpdated()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    return
  end
  local LeftTime = GameState.CaptureRecoveryTime
  if LeftTime >= 0 then
    local TimeStr = self:GetTimeStr(math.floor(LeftTime))
    self.TextBlock_LeftTime:SetText(TimeStr)
    if LeftTime <= self.TurnRedTime then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.FadeInRed)
      self.TextBlock_LeftTime_1:SetText(TimeStr)
    else
      EMUIAnimationSubsystem:EMStopAnimation(self, self.FadeInRed)
      self:OutRedState()
    end
  end
end

function WBP_DungeonCapture_C:ShowDungeonUI()
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.FadeIn)
  self.panel_time:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.TextBlock_LeftTime:SetColorAndOpacity(self.NormalColor)
  self.AlreadyClose = false
end

function WBP_DungeonCapture_C:CloseDungeonUI()
  if self.AlreadyClose then
    return
  end
  self.AlreadyClose = true
  local OutAnim = self.Out
  self:RemoveTimer("RefreshDistanceTimer")
  if OutAnim then
    EMUIAnimationSubsystem:EMPlayAnimation(self, OutAnim)
  else
    self.panel_time:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_DungeonCapture_C:UIStateChange_OnTarget()
  self.AlreadyClose = false
  self.StartCountDownTime = UE4.UGameplayStatics.GetGameState(self).ReplicatedTimeSeconds
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.FadeIn)
  self:UpdateRemainingTime()
  self.panel_time:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.TextBlock_LeftTime:SetColorAndOpacity(self.NormalColor)
  self:AddTimer(1, self.UpdateRemainingTime, true, 0, "UpdateCaptureRemainingTime", false)
  self:AddTimer(2, self.AfterGuideIconReplaced, true, 0, "AfterGuideIconReplaced")
end

function WBP_DungeonCapture_C:AfterGuideIconReplaced()
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

function WBP_DungeonCapture_C:UIStateChange_AfterTarget()
  self:CloseDungeonUI()
end

function WBP_DungeonCapture_C:InitTempleDelayTimeUI(Title)
  local TimeStr = self:GetTimeStr(math.floor(self.RemainingTime))
  self.TaskTitle:SetText(GText(Title))
  self.TextBlock_LeftTime:SetText(TimeStr)
  self:AddTimer(1, self.UpdateRemainingTimeInTemple, true, 0, "TempleDelayTimer", false)
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.FadeIn)
  self.Panel_Time:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function WBP_DungeonCapture_C:InitCaptureTimeUIOnShowDownTime()
  local TimeStr = self:GetTimeStr(math.floor(self.RemainingTime))
  self.TaskTitle:SetText(GText("UI_DUNGEON_DES_RESCUE_5"))
  self.TextBlock_LeftTime:SetText(TimeStr)
  self.Panel_Time:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function WBP_DungeonCapture_C:InitPartyWaitUI()
  self.TaskTitle:SetText(GText("UI_PARTY_PARKOUR_PRESTART"))
  self:AddTimer(1, self.UpdatePartyWaitUI, true, 0, "UpdatePartyWait")
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.FadeIn)
  self.Panel_Time:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function WBP_DungeonCapture_C:UpdatePartyWaitUI()
  local RemainTime = CommonUtils.GetClientTimerStructRemainTime("PartyWaitPlayerEnter")
  local TimeStr = self:GetTimeStr(math.floor(RemainTime))
  self.TextBlock_LeftTime:SetText(TimeStr)
end

function WBP_DungeonCapture_C:ClosePartyWaitUI()
  self:RemoveTimer("UpdatePartyWait")
  self:Close()
end

function WBP_DungeonCapture_C:InitClientTimerByHandleName(TimerHandleName, DisplayText, TurnRedTime)
  assert(TimerHandleName, "\229\191\133\233\161\187\228\188\160\229\133\165TimerHandleName\239\188\129\239\188\129")
  self.CurTimerHandleName = TimerHandleName
  self.CurTurnRedTime = TurnRedTime or 0
  self.LastRemainTime = nil
  self.TaskTitle:SetText(GText(DisplayText))
  self:AddTimer(0.1, self.UpdateTimerByHandleName, true, 0, "UpdateTimerByHandleName")
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.FadeIn)
  self.Panel_Time:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:UpdateTimerByHandleName()
end

function WBP_DungeonCapture_C:UpdateTimerByHandleName()
  local RawRemainTime = CommonUtils.GetClientTimerStructRemainTime(self.CurTimerHandleName)
  local RemainTime = math.max(math.floor(RawRemainTime), 0)
  local TimeStr = self:GetTimeStr(RemainTime)
  self.TextBlock_LeftTime:SetText(TimeStr)
  if RemainTime <= self.CurTurnRedTime then
    if self.LastRemainTime and self.LastRemainTime ~= RemainTime then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.FadeInRed)
      self.TextBlock_LeftTime_1:SetText(TimeStr)
    end
  else
    EMUIAnimationSubsystem:EMStopAnimation(self, self.FadeInRed)
    self:OutRedState()
  end
  self.LastRemainTime = RemainTime
end

function WBP_DungeonCapture_C:CloseClientTimerByHandleName()
  self:RemoveTimer("UpdateTimerByHandleName")
  self.CurTimerHandleName = ""
  self.CurTurnRedTime = 0
  self.LastRemainTime = nil
  self:Close()
end

function WBP_DungeonCapture_C:InitCaptureTimeUIOnHostageDead(HostagePhantomState)
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Panel_time:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local TimeStr = self:GetTimeStr(math.floor(self.RemainingTime))
  self.TaskTitle:SetText(GText("UI_DUNGEON_DES_RESCUE_7"))
  self.TextBlock_LeftTime:SetText(TimeStr)
  self.Panel_Time:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:PlayAnimation(self.FadeInRed, 0, 0)
  if HostagePhantomState then
    self:OnHostageRecoverStateChange(HostagePhantomState.Eid, HostagePhantomState.TeamRecoveryState, nil)
  end
  self:AddDispatcher(EventID.OnTeamRecoveryStateChange, self, self.OnHostageRecoverStateChange)
end

function WBP_DungeonCapture_C:OnHostageRecoverStateChange(Eid, NewState, _)
  DebugPrint("WBP_DungeonCapture_C:UpdateRemainingTimeInHostage", Eid, NewState, _)
  if NewState == UE4.ETeamRecoveryState.IsWaitingRecover then
    self:AddDispatcher(EventID.OnRepPhantomDyingDuration, self, self.UpdateRemainingTimeInHostage)
  elseif NewState == UE4.ETeamRecoveryState.Alive then
    self:RemoveDispatcher(EventID.OnRepPhantomDyingDuration)
  end
end

function WBP_DungeonCapture_C:InitRescueTimeFloatOnHostageDead()
  if self.IsRescuing ~= nil then
    if self.Progress_Rescue then
      self.Progress_Rescue:SetPercent(0)
    end
    return
  end
  local TimeStr = self:GetTimeStr(math.floor(self.RemainingTime))
  self.TaskTitle:SetText(GText("UI_DUNGEON_DES_RESCUE_7"))
  self.TextBlock_LeftTime:SetText(TimeStr)
  self.TextBlock_LeftTime_1:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.IsRescuing = false
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_time:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Progress_Rescue:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Progress_Rescue:SetPercent(0)
end

function WBP_DungeonCapture_C:UpdateRemainingTimeInHostage(HostageDyingDuration)
  DebugPrint("WBP_DungeonCapture_C:UpdateRemainingTimeInHostage", HostageDyingDuration)
  self.RemainingTime = 15 - (HostageDyingDuration or 0)
  if self.RemainingTime >= 0 then
    local TimeStr = self:GetTimeStr(math.floor(self.RemainingTime))
    self.TextBlock_LeftTime:SetText(TimeStr)
    self.TextBlock_LeftTime_1:SetText(TimeStr)
  end
end

function WBP_DungeonCapture_C:OnHostageRecoverState(IsShow)
  if IsShow then
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Panel_time:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.TaskTitle:SetText(GText("UI_DUNGEON_DES_RESCUE_9"))
    if self:IsAnimationPlaying(self.FadeInRed) then
      self:StopAnimation(self.FadeInRed)
      self:PlayAnimation(self.FadeIn)
    end
    self:AddDispatcher(EventID.OnRepPhantomRecoveryValue, self, self.UpdateRecoveryValue)
  else
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Panel_time:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.TaskTitle:SetText(GText("UI_DUNGEON_DES_RESCUE_7"))
    self.Progress_Rescue:SetPercent(0)
    self:PlayAnimation(self.FadeInRed, 0, 0)
    self:RemoveDispatcher(EventID.OnRepPhantomRecoveryValue, self)
  end
end

function WBP_DungeonCapture_C:UpdateRecoveryValue(RecoveryValue)
  self.Progress_Rescue:SetPercent(RecoveryValue / 100)
  self.TextBlock_LeftTime:SetText(tostring(math.floor(RecoveryValue)) .. "%")
end

function WBP_DungeonCapture_C:UpdateRemainingTimeInRescue()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  self.RemainingTime = GameState.RescueCountDownTime
  if self.RemainingTime >= 0 then
    local TimeStr = self:GetTimeStr(math.floor(self.RemainingTime))
    self.TextBlock_LeftTime:SetText(TimeStr)
    if self.RemainingTime <= self.TurnRedTime then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.FadeInRed)
      self.TextBlock_LeftTime_1:SetText(TimeStr)
    else
      EMUIAnimationSubsystem:EMStopAnimation(self, self.FadeInRed)
      self:OutRedState()
    end
  end
end

function WBP_DungeonCapture_C:UpdateRemainingTime()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    return
  end
  local PassTime = GameState.ReplicatedTimeSeconds - self.StartCountDownTime
  local LeftTime = self.RemainingTime - PassTime
  if LeftTime >= 0 then
    local TimeStr = self:GetTimeStr(math.floor(LeftTime + 0.5))
    self.TextBlock_LeftTime:SetText(TimeStr)
    if LeftTime <= self.TurnRedTime then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.FadeInRed)
      self.TextBlock_LeftTime_1:SetText(TimeStr)
    else
      EMUIAnimationSubsystem:EMStopAnimation(self, self.FadeInRed)
      self:OutRedState()
    end
  else
    self:CloseDungeonUI()
  end
end

function WBP_DungeonCapture_C:UpdateRemainingTimeInTemple()
  self.RemainingTime = self.RemainingTime - 1
  if self.RemainingTime >= 0 then
    local TimeStr = self:GetTimeStr(math.floor(self.RemainingTime))
    self.TextBlock_LeftTime:SetText(TimeStr)
  else
    self:RemoveTimer("TempleDelayTimer")
  end
end

function WBP_DungeonCapture_C:RemainingDistance(SelfActor, AnotherActor)
  EMUIAnimationSubsystem:EMStopAnimation(self, self.FadeInRed)
  self.Bg:SetColorAndOpacity(FLinearColor(0.0, 0.0, 0.0, 0.8))
  self:RemoveTimer("UpdateCaptureRemainingTime", false)
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.FadeIn)
  self.Panel_Time:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.TaskTitle:SetText(GText("UI_LIMITEXPLORE_DISTANCE"))
  self.SelfActor = SelfActor
  self.AnotherActor = AnotherActor
  
  local function RefreshDistance()
    local Distance = self.SelfActor:GetDistanceTo(self.AnotherActor)
    local Meters = math.floor(Distance / 100)
    self.TextBlock_LeftTime:SetText(Meters .. GText("UI_SCALE_METER"))
  end
  
  RefreshDistance()
  self:AddTimer(0.1, RefreshDistance, true, 0, "RefreshDistanceTimer", false)
end

function WBP_DungeonCapture_C:PauseRemainingDistance()
  self:RemoveTimer("RefreshDistanceTimer")
end

function WBP_DungeonCapture_C:EndRemainingDistance()
  self.SelfActor = nil
  self.AnotherActor = nil
  self:Close()
end

function WBP_DungeonCapture_C:OnImageGuideBecameRelative(Index)
  if 1 == Index then
    self:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  if 2 == Index then
    self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    local TimeStr = self:GetTimeStr(30)
    self.TextBlock_LeftTime:SetText(TimeStr)
    self.TaskTitle:SetText(GText("TARGET_DUNGEON_CAPTURE_106"))
    self.Step_2:SetVisibility(ESlateVisibility.Visible)
    return
  end
  if 3 == Index then
    self:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
end

function WBP_DungeonCapture_C:OutRedState()
  local Bg = self.Bg
  if Bg and self.BGDefaultColor then
    Bg:SetColorAndOpacity(self.BGDefaultColor)
  end
end

function WBP_DungeonCapture_C:OnDungeonVoteBegin()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
  UIManager:LoadUINew("Vote")
end

function WBP_DungeonCapture_C:AddRemainingTime(Time)
  if not Time or not self.RemainingTime then
    return
  end
  self.Text_NumAdd:SetText("+" .. tostring(Time) .. "s")
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.AddTime)
  self.RemainingTime = self.RemainingTime + Time
end

function WBP_DungeonCapture_C:Reset(RemainTime, WarningTime, Now)
  self.StartCountDownTime = Now
  self.RemainingTime = RemainTime
  self.TurnRedTime = WarningTime
end

function WBP_DungeonCapture_C:SetTitle(Str)
  self.TaskTitle:SetText(Str)
end

function WBP_DungeonCapture_C:SetTextFromGameMode(Text)
  self.TaskTitle:SetText(GText(Text))
  self.KeyToHideSelf = Text
end

return WBP_DungeonCapture_C
