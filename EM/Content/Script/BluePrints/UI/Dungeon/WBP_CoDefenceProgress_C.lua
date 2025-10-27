require("UnLua")
local WBP_CoDefenceProgress_C = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.Common.TimerMgr"
})

function WBP_CoDefenceProgress_C:OnLoaded(...)
  WBP_CoDefenceProgress_C.Super.OnLoaded(self, ...)
  local BattleMain = UIManager(self):GetUIObj("BattleMain")
  assert(BattleMain, "WBP_Battle_ProcessEscape_C \229\138\160\232\189\189\230\151\182\230\139\191\228\184\141\229\136\176BattleMain\239\188\129")
  BattleMain.Pos_ProcessSew:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  BattleMain.Pos_ProcessSew:AddChild(self)
  self.IsInit = true
  self:InitDataInfo()
  self.Bar_Progress:GetDynamicMaterial():SetScalarParameterValue("Percent", 0)
  self.ProcessOngoingPositionOffSet = 12
  self:BindToAnimationFinished(self.In, {
    self,
    self.InitAllUI
  })
  self:PlayAnimation(self.In)
end

function WBP_CoDefenceProgress_C:InitDataInfo()
  local IsSuccess, DungeonInfoTemp = CommonUtils.GetDungeonUIParams("RegionCoDefenceProgress")
  self.DungeonInfo = DungeonInfoTemp
  self.PointWidgetInstances = {}
  if not IsSuccess then
    self.TotalPointNum = 3
    self.WaterLevelTextmap = {
      [1] = "\230\176\180\228\189\141\228\184\138\230\182\168\228\184\173",
      [2] = "\229\130\168\230\176\180\230\177\160\229\183\178\230\187\161",
      [3] = "\230\142\146\230\176\180\232\191\155\231\168\139\229\143\151\233\152\187\239\188\140\232\175\183\229\188\128\229\144\175\230\176\180\233\152\128",
      [4] = "\230\176\180\228\189\141\233\153\141\228\189\142\228\184\173",
      [5] = "\229\130\168\230\176\180\230\177\160\229\183\178\230\142\146\231\169\186",
      [6] = "%ss\229\144\142\230\142\146\230\176\180\230\156\186\229\133\179\230\175\129\229\157\143",
      [7] = "\230\176\180\233\152\128\229\141\179\229\176\134\229\188\128\229\144\175"
    }
    return
  end
  self.TotalPointNum = self.DungeonInfo.TotalPointNums
  self.WaterLevelTextmap = {
    [1] = self.DungeonInfo.CoDefence_1,
    [2] = self.DungeonInfo.CoDefence_2,
    [3] = self.DungeonInfo.CoDefence_3,
    [4] = self.DungeonInfo.CoDefence_4,
    [5] = self.DungeonInfo.CoDefence_5,
    [6] = self.DungeonInfo.CoDefence_6,
    [7] = self.DungeonInfo.CoDefence_7
  }
  self.IsFirstTime = true
  self.IsPlayedAnimation = false
  self:UpdateWaterLevelTickTime()
end

function WBP_CoDefenceProgress_C:UpdateWaterLevelTickTime()
  self.Time = self.IsFirstTime and 3 or 6
  self.TickTime = self.Time / 100
end

function WBP_CoDefenceProgress_C:InitAllUI()
  self:InitPointPos()
  self:InitProcessOngoing()
  self:InitProgress()
end

function WBP_CoDefenceProgress_C:InitPointPos()
  self.ProgressLen = USlateBlueprintLibrary.GetLocalSize(self.Point:GetCachedGeometry()).X
  self.PointInterval = self.ProgressLen / self.TotalPointNum
  self.Point:ClearChildren()
  for i = 1, self.TotalPointNum do
    local NewPointWidget = self:CreateWidgetNew("BattleProcessPoint")
    self.PointWidgetInstances[i] = NewPointWidget
    self.Point:AddChild(NewPointWidget)
    NewPointWidget:InitWidget(self, i)
    local Slot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(NewPointWidget)
    Slot:SetSize(FVector2D(0, 0))
    Slot:SetPosition(FVector2D(self.PointInterval * (i - 1), 0))
  end
  DebugPrint("thy     PointWidgetInstances", #self.PointWidgetInstances)
  self.CurPointIndex = self.TotalPointNum
end

function WBP_CoDefenceProgress_C:GetWaterLevelLen()
  self.WaterLevelLen = USlateBlueprintLibrary.GetLocalSize(self.WaterLevelUI.Icon_Play01:GetCachedGeometry()).X
  self.WaterLevelMoveLen = self.ProgressLen - self.WaterLevelLen
end

function WBP_CoDefenceProgress_C:InitProcessOngoing()
  self.WaterLevelUI = self:CreateWidgetNew("ProcessOngoing")
  self.Point:AddChild(self.WaterLevelUI)
  self.WaterLevelUI:BindToAnimationFinished(self.WaterLevelUI.UP, {
    self,
    self.GetWaterLevelLen
  })
  self.WaterLevelUI:PlayAnimation(self.WaterLevelUI.UP)
  self.WaterLevelLen = USlateBlueprintLibrary.GetLocalSize(self.WaterLevelUI.Icon_Play01:GetCachedGeometry()).X
  self.WaterLevelMoveLen = self.ProgressLen - self.WaterLevelLen
  self:SetProcessOngoingPosition(self.ProcessOngoingPositionOffSet, true)
end

function WBP_CoDefenceProgress_C:SetProcessOngoingPosition(Position, IsUp)
  if Position > self.WaterLevelMoveLen then
    return
  end
  local Slot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.WaterLevelUI)
  Slot:SetSize(FVector2D(0, 0))
  Slot:SetPosition(FVector2D(Position, 0))
  if IsUp then
    if not self.WaterLevelUI:IsPlayingAnimation(self.WaterLevelUI.UP) then
      self.WaterLevelUI:PlayAnimation(self.WaterLevelUI.UP, 0, 0)
    end
  elseif not self.WaterLevelUI:IsPlayingAnimation(self.WaterLevelUI.Down) then
    self.WaterLevelUI:PlayAnimation(self.WaterLevelUI.Down, 0, 0)
  end
end

function WBP_CoDefenceProgress_C:InitProgress()
  if not self.ColorBarProgress then
    self.ColorBarProgress = self.Bar_Progress:GetDynamicMaterial()
  end
  self.ColorBarProgress:SetScalarParameterValue("Percent", 0)
  self.CurPercent = 0
  self:UpdateProgressToTarget(self.TotalPointNum + 1)
  self.IsFirstTime = false
end

function WBP_CoDefenceProgress_C:UpdatePointStateByWaterLevel()
  local NeedToUpdatePointStateIndex = math.floor(self.CurPercent / (1 / (self.TotalPointNum + 1)))
  if NeedToUpdatePointStateIndex > 0 and NeedToUpdatePointStateIndex < self.TotalPointNum + 1 then
    local Point = self.PointWidgetInstances[NeedToUpdatePointStateIndex]
    Point:SetPointState("Lock")
  end
end

function WBP_CoDefenceProgress_C:SetPointState(PointIndex, NewStateIndex, TimerHandleName)
  DebugPrint("thy    SetPointState", PointIndex, NewStateIndex)
  PointIndex = PointIndex or 2
  local Point = self.PointWidgetInstances[PointIndex]
  local StateStr = Point:StateIndex2StateStr(NewStateIndex)
  DebugPrint("thy    SetPointState  StateStr", StateStr)
  self:UpdateTextByPointState(StateStr)
  Point:SetPointState(StateStr, TimerHandleName, self.WaterLevelTextmap[6])
  self.CurPointIndex = 0 == PointIndex and 1 or PointIndex
end

function WBP_CoDefenceProgress_C:UpdateTextByPointState(StateStr)
  if "Fail" == StateStr and 1 == self.CurPointIndex then
    self.Text_Title:SetText("")
  elseif "CountDown" == StateStr or "Fail" == StateStr then
    self.Text_Title:SetText(GText(self.WaterLevelTextmap[3]))
  elseif "Complete" == StateStr then
    self.Text_Title:SetText(GText(self.WaterLevelTextmap[7]))
  end
  self:PlayAnimation(self.Text_Refresh)
end

function WBP_CoDefenceProgress_C:HideWaterLevelUI()
  self.WaterLevelUI:StopAllAnimations()
  self.WaterLevelUI:SetVisibility(ESlateVisibility.Hidden)
end

function WBP_CoDefenceProgress_C:GetWaterLevelPercentByPointIndex(PointIndex)
  local PerPointPercent = 1 / self.TotalPointNum
  return PerPointPercent * (PointIndex - 1)
end

function WBP_CoDefenceProgress_C:UpdateProgressToTarget(PointIndex)
  local TargetPercent = self:GetWaterLevelPercentByPointIndex(PointIndex)
  self:AddTimer(self.TickTime, self.RealUpdateProgressToTarget, true, 0.01, "ProgressToTarget", true, TargetPercent)
end

function WBP_CoDefenceProgress_C:RealUpdateProgressToTarget(TargetPercent)
  if not self.ColorBarProgress then
    self.ColorBarProgress = self.Bar_Progress:GetDynamicMaterial()
  end
  if TargetPercent > self.CurPercent then
    self:CheckWaterLevelAndUpdateTextMap(TargetPercent)
    self.CurPercent = math.min(self.CurPercent + 0.01, TargetPercent)
    self:UpdatePointStateByWaterLevel()
    self.ColorBarProgress:SetScalarParameterValue("Percent", self.CurPercent)
    self:SetProcessOngoingPosition(self.ProgressLen * self.CurPercent, true)
  elseif TargetPercent < self.CurPercent then
    self:CheckWaterLevelAndUpdateTextMap(TargetPercent)
    self.CurPercent = math.max(self.CurPercent - 0.01, TargetPercent)
    self.ColorBarProgress:SetScalarParameterValue("Percent", self.CurPercent)
    self:SetProcessOngoingPosition(self.ProgressLen * self.CurPercent, false)
  else
    self:HideWaterLevelUI()
    self:CheckWaterLevelAndUpdateTextMap(TargetPercent)
    self:RemoveTimer("ProgressToTarget")
    if 1 == self.CurPercent then
      local GameMode = UE4.UGameplayStatics.GetGameMode(self)
      GameMode:TriggerGameModeEvent("OnCoDefenceProgressFull")
    end
  end
end

function WBP_CoDefenceProgress_C:CheckWaterLevelAndUpdateTextMap(TargetPercent)
  if not self.WaterLevelTextmap then
    return
  end
  if TargetPercent > self.CurPercent then
    if not self.IsPlayedAnimation then
      self:PlayAnimation(self.Text_Refresh)
      self.IsPlayedAnimation = true
    end
    self.Text_Title:SetText(GText(self.WaterLevelTextmap[1]))
  elseif TargetPercent < self.CurPercent then
  elseif 1 == self.CurPercent then
    self.Text_Title:SetText(GText(self.WaterLevelTextmap[2]))
    self:PlayAnimation(self.Text_Refresh)
  else
    if 0 == self.CurPercent then
      self.Text_Title:SetText(GText(self.WaterLevelTextmap[5]))
      self:PlayAnimation(self.Text_Refresh)
    else
    end
  end
end

function WBP_CoDefenceProgress_C:CloseDungeonUI()
  self:Close()
end

return WBP_CoDefenceProgress_C
