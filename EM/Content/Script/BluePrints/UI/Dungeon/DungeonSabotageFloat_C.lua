require("UnLua")
local M = Class("BluePrints.UI.Dungeon.WBP_DungeonUIBase_C")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")

function M:OnLoaded(...)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState.OnRepEidsDelegate:Add(self, self.OnNewEid)
  local DungeonId = GameState.DungeonId
  local Sabotage = DataMgr.Sabotage[DungeonId]
  self.SabotageTimer = Sabotage.SabotageRewardRemainTimes
  self.TotalTime = Sabotage.SabotageCountDownTime
  if -1 == self.TotalTime then
    self.NoCountDown = true
  end
  self.RewardLevelStr = {
    "C",
    "B",
    "A",
    "S"
  }
  self.CurrentRewardLevel = 4
  if not self.NoCountDown then
    self:InitCountDownBar()
  end
  self:InitOptionTask()
  self.Super.OnLoaded(self, ...)
  self:InitListenEvent()
  self:AddDispatcher(EventID.OnRepSabotageCountDownTime, self, self.SabotageCountDown)
end

function M:InitOptionTask()
  self.OptionalTask = self:CreateWidgetNew("DestroyTaskBar")
  if self.OptionalTask then
    self.OptionalTask.Text_Describe:SetText(GText("DUNGEON_SABOTAGE_102"))
  end
end

function M:AfterAddToParent()
  self.Super.AfterAddToParent(self)
  local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
  if BattleMainUI then
    BattleMainUI.Task:AddChildToOverlay(self.OptionalTask)
  end
end

function M:InitCountDownBar()
  local ProgressBarLength = 0
  for i = 1, #self.SabotageTimer do
    ProgressBarLength = ProgressBarLength + self["SizeBox_Progress_" .. tostring(i)].WidthOverride
  end
  local UpperTime = self.TotalTime
  local SabotageTime = math.floor(GameState(self).SabotageCountDownTime)
  for RewardLevel = #self.SabotageTimer, 1, -1 do
    local LowerTime = self.SabotageTimer[RewardLevel]
    local SlotLength = (UpperTime - LowerTime) / self.TotalTime
    self["SizeBox_Progress_" .. tostring(RewardLevel)].WidthOverride = ProgressBarLength * SlotLength
    UpperTime = LowerTime
    local RewardTime = self.SabotageTimer[RewardLevel]
    local Percent = 0
    if SabotageTime > RewardTime then
      Percent = 1
    end
    local ProgressBar = self["Image_ProgressBar_" .. tostring(RewardLevel)]
    local Mat = ProgressBar:GetDynamicMaterial()
    Mat:SetScalarParameterValue("percent", Percent)
  end
end

function M:OnGameStateTimerAdded(TimerHandleName, Time, TimeStamp)
  self.RemainingTime = Time
end

function M:OnNewEid()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if nil ~= Player then
    print(_G.LogTag, "OnRepEidsDelegateSent")
    Player.RPCComponent:RequestSabotageGuideInfo_Client(self, self.UpdateGuide)
  end
end

function M:UpdateGuide(Eids, UnitIds)
  print(_G.LogTag, "OnRepEidsDelegateRec")
  if self.OptionalTask.Visibility == UE4.ESlateVisibility.Collapsed then
    return
  end
  self.OptionalTask:RemoveAllDestroyTarget()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  if not GameInstance then
    return
  end
  local SceneManager = GameInstance:GetSceneManager()
  local EidsTable = Eids:ToTable()
  local UnitIdsTable = UnitIds:ToTable()
  PrintTable(EidsTable, 2)
  PrintTable(UnitIdsTable, 2)
  for i, UnitId in ipairs(UnitIdsTable) do
    local Eid = EidsTable[i]
    if 0 ~= Eid then
      if #UnitIdsTable > 0 and not self.FirstSeen then
        self.FirstSeen = true
        UE4.UPlayTalkAsyncAction.PlayTalk(self, 601305, nil)
      end
      local Monster = DataMgr.Monster[UnitId]
      local MonsterName = GText(Monster.UnitName)
      local Letter = string.char(string.byte("A") + i - 1)
      DebugPrint("SabotageComponent: AddWidget Eid", Eid, "UnitId", UnitId, Letter)
      self.OptionalTask:AddDestroyTarget(Letter, MonsterName)
    end
  end
end

function M:UIStateChange_None()
  self.Group_DestoryProgress:SetVisibility(ESlateVisibility.Collapsed)
  self:PlayAnimationReverse(self.SToA)
end

function M:UIStateChange_BeforeTarget()
  self.Group_DestoryProgress:SetVisibility(ESlateVisibility.Collapsed)
  self:PlayAnimationReverse(self.SToA)
end

function M:UIStateChange_OnTarget()
  self.OptionalTask:SetVisibility(ESlateVisibility.Collapsed)
  if self.NoCountDown then
    self.Group_DestoryProgress:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  self:PlayAnimation(self.In)
  self.Text_ProgressNum_Total:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_ProgressNum_Total:SetText(self:GetTimeStr(self.TotalTime))
  self.Text_ProgressTitle:SetText(GText("DUNGEON_SABOTAGE_107"))
  self:SabotageCountDown()
  AudioManager(self):PlayUISound(self, "event:/ui/common/reward_countdown", nil, nil)
end

function M:SabotageCountDown()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    return
  end
  if self.NoCountDown then
    return
  end
  local SabotageTime = math.floor(GameState.SabotageCountDownTime)
  local HigherRewardLevelTime = self.SabotageTimer[self.CurrentRewardLevel + 1] or 10000
  local LowerRewardLevelTime = self.SabotageTimer[self.CurrentRewardLevel] or -10000
  if SabotageTime > HigherRewardLevelTime then
    self:ChangeRewardLevel(self.CurrentRewardLevel + 1)
  end
  if SabotageTime < LowerRewardLevelTime then
    self:ChangeRewardLevel(self.CurrentRewardLevel - 1)
  end
  if SabotageTime < 10 and not self:IsAnimationPlaying(self.CountDown) then
    self:PlayAnimation(self.CountDown)
  end
  self.Text_ProgressNum:SetText(self:GetTimeStr(SabotageTime))
  self.VX_Text_ProgressNum:SetText(self:GetTimeStr(SabotageTime))
  local ProgressBar = self["Image_ProgressBar_" .. tostring(self.CurrentRewardLevel)]
  local Mat = ProgressBar:GetDynamicMaterial()
  local CurrentUpTime = self.SabotageTimer[self.CurrentRewardLevel + 1] or self.TotalTime
  local TotalTimeWindow = CurrentUpTime - self.SabotageTimer[self.CurrentRewardLevel]
  local CurrentTimePassed = CurrentUpTime - SabotageTime
  local Percent = CurrentTimePassed / TotalTimeWindow
  Mat:SetScalarParameterValue("percent", 1 - Percent)
end

function M:ChangeRewardLevel(TargetRewardLevel)
  AudioManager(self):PlayUISound(self, "event:/ui/common/reward_countdown", nil, nil)
  local RewardLevelUp = TargetRewardLevel > self.CurrentRewardLevel
  local AnimString = ""
  if RewardLevelUp then
    AnimString = self.RewardLevelStr[TargetRewardLevel] .. "To" .. self.RewardLevelStr[self.CurrentRewardLevel]
  else
    AnimString = self.RewardLevelStr[self.CurrentRewardLevel] .. "To" .. self.RewardLevelStr[TargetRewardLevel]
  end
  local PlayMode = EUMGSequencePlayMode.Forward
  if RewardLevelUp then
    PlayMode = EUMGSequencePlayMode.Reverse
  end
  self:PlayAnimation(self[AnimString], 0, 1, PlayMode)
  self.CurrentRewardLevel = TargetRewardLevel
end

function M:UIStateChange_AfterTarget()
end

function M:OnImageGuideBecameRelative(Index)
  self:SetVisibility(ESlateVisibility.Collapsed)
end

return M
