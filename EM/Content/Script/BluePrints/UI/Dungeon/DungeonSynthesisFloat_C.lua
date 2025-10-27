require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")

function M:Construct()
  self.TotalBarLength = 320
  self.RageValueStages = {100}
  self.MaxRangeValue = 100
  self.DestructionPoints = {}
  self.CurDisplayPercent = 0
  self.FinishPercent = 1
  self.IsShowSideTaskBar = false
  self.TickInterval = 0.1
  self.ProgressUpdateSpeed = 10
  self.RealRageValue = 0
  self.DisplayRageValue = 0
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
  if BattleMainUI then
    self:AddTaskToOverlay(BattleMainUI)
  end
  self:InitDungeonInfo()
  self:InitListenEvent()
  self:InitDisplay()
  self:PlayAnimation(self.In)
  self.IsInit = true
end

function M:AddTaskToOverlay(BattleMainUI)
  BattleMainUI.Pos_Weekly:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  BattleMainUI.Pos_Weekly:AddChildToOverlay(self)
end

function M:InitDungeonInfo()
  self.DungeonId = GameState(self).DungeonId
  local DungeonData = DataMgr.Synthesis[self.DungeonId]
  if not DungeonData then
    GameState(self):ShowDungeonError("SynthesisComponent:Client \229\189\147\229\137\141\229\137\175\230\156\172ID\230\178\161\230\156\137\229\161\171\229\134\153\229\156\168\229\175\185\229\186\148\231\154\132\229\137\175\230\156\172\232\161\168\228\184\173, \232\175\187\232\161\168\229\164\177\232\180\165! \232\175\187\229\133\165Id\239\188\154" .. self.DungeonId)
    return
  end
  self.RageValueStages = DungeonData.RageValueStages or {100}
  self.MaxRangeValue = self.RageValueStages[#self.RageValueStages]
end

function M:InitDisplay()
  local GameState = GameState(self)
  self:SetTotalProgressPercent(1)
  self:SetCurProgressPercent(0)
  self.Text_Title:SetText(GText("DUNGEON_SYNTHESIS_101"))
  self:SetProgressFXVisibility(false)
  self:InitDestructionPoints()
  self:UpdateDestructionPoints(GameState.GuideSupervisorEids, GameState.DeadSupervisorEids)
  self:UpdateRageValue(GameState.RageValue)
  GameState:UpdateSynthesisDestructionTaskProgress()
  self:AddTimer(self.TickInterval, self.TickUpdateProgress, true)
end

function M:InitListenEvent()
  self:AddDispatcher(EventID.OnRepSynthesisRageValue, self, self.UpdateRageValue)
  self:AddDispatcher(EventID.OnRepGuideSupervisorEids, self, self.UpdateDestructionPoints)
  self:AddDispatcher(EventID.OnRepDeadSupervisorEids, self, self.UpdateDestructionPoints)
end

function M:UpdateRageValue(RageValue)
  if RageValue > self.MaxRangeValue then
    self.RealRageValue = self.MaxRangeValue
  else
    self.RealRageValue = RageValue
  end
end

function M:TickUpdateProgress(IsForceUpdate)
  if not IsForceUpdate and self.DisplayRageValue == self.RealRageValue then
    self:SetProgressFXVisibility(false)
    return
  end
  self:SetProgressFXVisibility(true)
  local PercentUpdateThisTick = self.ProgressUpdateSpeed * self.TickInterval / 100
  local TargetPercent = self.DisplayRageValue / self.MaxRangeValue
  local IsSetToReal = false
  if self.DisplayRageValue < self.RealRageValue then
    if self.DisplayRageValue + PercentUpdateThisTick * self.MaxRangeValue < self.RealRageValue then
      TargetPercent = TargetPercent + PercentUpdateThisTick
    else
      IsSetToReal = true
    end
  end
  if self.DisplayRageValue > self.RealRageValue then
    if self.DisplayRageValue - PercentUpdateThisTick * self.MaxRangeValue > self.RealRageValue then
      TargetPercent = TargetPercent - PercentUpdateThisTick
    else
      IsSetToReal = true
    end
  end
  if IsSetToReal then
    self.DisplayRageValue = self.RealRageValue
    TargetPercent = self.RealRageValue / self.MaxRangeValue
  else
    self.DisplayRageValue = TargetPercent * self.MaxRangeValue
  end
  self:SetCurProgressPercent(TargetPercent)
  self:ShowProgressFXAtPercent(TargetPercent)
end

function M:ShowOut()
  self:AddTimer(1, function()
    self:PlayAnimation(self.Out)
  end)
  self:ShowSideTaskBar(false)
  self.IsShowOut = true
end

function M:InitDestructionPoints()
  self.Group_BottomAnchor:ClearChildren()
  local TotalPointNum = #self.RageValueStages
  self.DestructionPoints = {}
  for i = 1, TotalPointNum do
    local DestructionPoint = self:CreateWidgetNew("SynthesisDestructionPoint")
    self.DestructionPoints[i] = DestructionPoint
    self.Group_BottomAnchor:AddChild(DestructionPoint)
    local Percent = self.RageValueStages[i] / self.MaxRangeValue
    self:SetDestructionPointPosByPercent(DestructionPoint, Percent)
    DestructionPoint:InitItem(i, self.RageValueStages[i])
  end
end

function M:SetDestructionPointPosByPercent(DestructionPoint, Percent)
  local PosX = self.TotalBarLength * Percent
  local Pos = FVector2D(PosX, 0)
  DestructionPoint:SetRenderTranslation(Pos)
end

function M:UpdateDestructionPoints(GuideSupervisorEids, DeadSupervisorEids)
  for i, GuideEid in pairs(GuideSupervisorEids) do
    local DestructionPoint = self.DestructionPoints[i]
    local IsDead = DeadSupervisorEids:Contains(GuideEid)
    if IsDead then
      DestructionPoint:SetComplete()
    else
      DestructionPoint:SetRed()
    end
  end
  if self.IsShowOut then
    return
  end
  if DeadSupervisorEids:Num() >= #self.RageValueStages then
    DebugPrint("SynthesisComponent: ShowOut \229\135\187\230\157\128\230\137\128\230\156\137\228\184\187\231\174\161")
    self:ShowOut()
  end
  self:UpdateSideTaskBar(GuideSupervisorEids, DeadSupervisorEids)
end

function M:GetShownByRageValuePointNum()
  local Count = 0
  for _, DestructionPoint in pairs(self.DestructionPoints) do
    if DestructionPoint.IsFinalHide then
      Count = Count + 1
    else
      return Count
    end
  end
  return Count
end

function M:UpdateSideTaskBar(GuideSupervisorEids, DeadSupervisorEids)
  local GuideSupervisorNum = (GuideSupervisorEids or GameState(self).GuideSupervisorEids):Num()
  local DeadSupervisorNum = (DeadSupervisorEids or GameState(self).DeadSupervisorEids):Num()
  local SupervisorTotalNum = #self.RageValueStages
  local IsShow = GuideSupervisorNum > DeadSupervisorNum and GuideSupervisorNum < SupervisorTotalNum
  self:ShowSideTaskBar(IsShow)
end

function M:SetCurProgressPercent(Percent)
  self.CurDisplayPercent = Percent
  self.Progress_01:SetPercent(Percent)
end

function M:SetTotalProgressPercent(Percent)
  self.FinishPercent = Percent
  self.Progress_02:SetPercent(Percent)
  self.Progress_03:SetPercent(1 - Percent)
end

function M:ShowProgressFXAtPercent(Percent)
  if Percent > 1 then
    Percent = 1
  end
  self:SetProgressFXVisibility(true)
  local PosX = self.TotalBarLength * (Percent - 0.5)
  local Pos = FVector2D(PosX, 0)
  self.FX_Progress:SetRenderTranslation(Pos)
  self:AddTimer(self.TickInterval, function()
    self:SetProgressFXVisibility(false)
  end, false, 0, "ProgressFXTimer")
  AudioManager(self):PlayUISound(self, "event:/ui/common/week_level_progress_add", nil, nil)
end

function M:SetProgressFXVisibility(IsVisible)
  if IsVisible then
    self.FX_Progress:SetVisibility(UE4.ESlateVisibility.Visible)
  else
    self.FX_Progress:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:ShowSideTaskBar(IsShow)
  local TaskBar = TaskUtils:GetTaskBarWidget()
  if not TaskBar then
    return
  end
  if self.IsShowSideTaskBar == IsShow then
    return
  end
  if self.IsShowOut then
    return
  end
  if IsShow then
    TaskBar:AddSynthesisOptionalTask(GText("DUNGEON_SYNTHESIS_114"), "SpecialEnemy")
  else
    TaskBar:RemoveOptionalTask()
  end
  self.IsShowSideTaskBar = IsShow
end

function M:ShowDiscoverSupervisorToast(Percent)
  self.Text_Title_1:SetText(GText("DUNGEON_SYNTHESIS_132"))
  self:PlayAnimation(self.Up)
  AudioManager(self):PlayUISound(self, "event:/ui/common/week_level_target_update", nil, nil)
end

return M
