require("UnLua")
local M = Class("BluePrints.UI.Dungeon.WBP_DungeonUIBase_C")
local IsInDungeon = true
local EscortPanelUIName = "DungeonHijackFloatPanel"

function M:OnLoaded(...)
  local GameMode = UGameplayStatics.GetGameMode(self)
  if GameMode and GameMode:IsInRegion() then
    IsInDungeon = false
    EscortPanelUIName = "RegionHijackFloatPanel"
    self.UpdateHp = false
  else
    IsInDungeon = true
    EscortPanelUIName = "DungeonHijackFloatPanel"
  end
  self.InformationPanel = UIManager(self):LoadUINew(EscortPanelUIName)
  self.Super.OnLoaded(self, ...)
  self:InitListenEvent()
  self.Spline = nil
  self:SetVisibility(ESlateVisibility.Collapsed)
  self.Panel_Information:SetVisibility(ESlateVisibility.Collapsed)
  if IsInDungeon then
    self.InformationPanel:HideSelfAndSubWidget()
  end
  self.SpeedStates = {
    Unkown = 0,
    Fastest = 1,
    Slowest = 2,
    SpeedUp = 3,
    SlowDown = 4
  }
  self.SpeedState = 0
  self.CanvasSlotLength = 0
  self.Text_Health:SetText(GText("DUNGEON_HIJACK_106"))
  self.Speed:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_02:SetText(GText("DUNGEON_HIJACK_107"))
  self.Text_03:SetText(GText("DUNGEON_HIJACK_105"))
  self.InformationPanel:InitText()
  self.Text_03:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Text_Time:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:UIStateChange_None()
  self:UIStateChange_BeforeTarget()
end

function M:UIStateChange_BeforeTarget()
  self:SetVisibility(ESlateVisibility.Collapsed)
  self.Panel_Information:SetVisibility(ESlateVisibility.Collapsed)
  if IsInDungeon then
    self.InformationPanel:HideSelfAndSubWidget()
  end
end

function M:UIStateChange_OnTarget()
  DebugPrint("DungeonHijackFloat UIStateChange_OnTarget")
  if IsInDungeon then
    self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Information:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  self.InformationPanel:ShowSelfAndSubWidget()
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.In)
  self.UpdateHp = true
  self.BeginTime = URuntimeCommonFunctionLibrary.GetTimeSeconds(self)
  self:AddTimer(1, self.InitAllTargetPoint, true, 0, "TryInitAllTargetPoint")
  self:InitAllTargetPoint()
  self:UpdateUILength(0)
end

function M:UIStateChange_AfterTarget()
end

function M:UpdateTime()
  self.NowTime = URuntimeCommonFunctionLibrary.GetTimeSeconds(self)
  local TimeDiff = self.NowTime - self.BeginTime
  self.Text_Time:SetText(self:GetTimeStr(math.floor(TimeDiff)))
end

function M:OnCarDamage(NewHp, MaxHp)
  local Percent = NewHp / MaxHp
  self.Bar_Health:SetPercent(Percent)
  if self.UpdateHp then
    self.InformationPanel:UpdateHp(Percent)
  end
end

function M:UpdateSpeed(Speed, Acc, MaxSpeed, MinSpeed, TrollyStateId, Trolly)
  if not IsInDungeon then
    return
  end
  self.Text_Speed:SetText(tostring(math.floor(Speed / 100 * 3.6)) .. "km/h")
  if MaxSpeed <= Speed then
    if self.SpeedState ~= self.SpeedStates.Fastest then
      self.SpeedState = self.SpeedStates.Fastest
      self:PanelChange(self.InformationPanel.Panel_Fastest)
      self.InformationPanel:PlayAnimation(self.InformationPanel.Fastest, 0, 0)
    end
    return
  end
  if Speed <= MinSpeed then
    self.SpeedState = self.SpeedStates.Slowest
    self:PanelChange(self.InformationPanel.Panel_Slowest, 0, 0)
    if 240 == TrollyStateId then
      local GameState = UGameplayStatics.GetGameState(self)
      local AllPlayer = {}
      if GameState then
        AllPlayer = GameState:GetAllPlayer():ToTable()
      end
      local HasPlayerInRange = false
      local Radius = DataMgr.TargetFilter.TrollyAbsorbES.LuaFilterParaments.Radius
      for _, Player in pairs(AllPlayer) do
        if Radius > UKismetMathLibrary.Vector_Distance(Trolly:K2_GetActorLocation(), Player:K2_GetActorLocation()) then
          HasPlayerInRange = true
          break
        end
      end
      if HasPlayerInRange then
        self.InformationPanel.Text_Slowest:SetText(GText("DUNGEON_HIJACK_117"))
      else
        self.InformationPanel.Text_Slowest:SetText(GText("DUNGEON_HIJACK_116"))
      end
    else
      self.InformationPanel.Text_Slowest:SetText(GText("DUNGEON_HIJACK_108"))
    end
    return
  end
  if Acc > 0 then
    if self.SpeedState ~= self.SpeedStates.SpeedUp then
      self.SpeedState = self.SpeedStates.SpeedUp
      self:PanelChange(self.InformationPanel.Panel_SpeedUp)
      self.InformationPanel:PlayAnimation(self.InformationPanel.SpeedUp, 0, 0)
    end
    return
  end
  if Acc < 0 then
    if self.SpeedState ~= self.SpeedStates.SlowDown then
      self.SpeedState = self.SpeedStates.SlowDown
      self:PanelChange(self.InformationPanel.Panel_SlowDown)
      self.InformationPanel:PlayAnimation(self.InformationPanel.SlowDown, 0, 0)
    end
    return
  end
end

function M:PanelChange(Panel)
  if self.LastPanel then
    if self.LastPanel == Panel then
      return
    end
    self.LastPanel:SetVisibility(ESlateVisibility.Collapsed)
    self.InformationPanel:OnPanelChange()
  end
  Panel:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.LastPanel = Panel
end

function M:UpdateUILength(Length)
  if not self.SplineLength then
    return
  end
  local Percent = Length / self.SplineLength
  self.InformationPanel:UpdateLength(Percent)
  if self.PercentToWidget and self.PercentToWidget[self.PointIndex] and Percent > self.PercentToWidget[self.PointIndex][1] then
    local Widget = self.PercentToWidget[self.PointIndex][2]
    Widget.Img_Pass:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_Stronghold:SetText(tostring(math.max(self.TriggerBoxNum - self.PointIndex, 0)))
  end
end

function M:TriggerBoxStop()
  if not self.PercentToWidget or not self.PercentToWidget[self.PointIndex] then
    self.Text_Stronghold:SetText(tostring((math.max(self.TriggerBoxNum - self.PointIndex, 0))))
    self.PointIndex = self.PointIndex + 1
    return
  end
  local Widget = self.PercentToWidget[self.PointIndex][2]
  local Percent = self.PercentToWidget[self.PointIndex][1]
  Widget.Img_Pass:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.InformationPanel:UpdateLength(Percent)
  local VXParSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.InformationPanel.VX_par)
  VXParSlot:SetPosition(FVector2D(self.CanvasSlotLength * Percent, 0))
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.ProgressJump)
  self.Text_Stronghold:SetText(tostring((math.max(self.TriggerBoxNum - self.PointIndex, 0))))
  self.PointIndex = self.PointIndex + 1
end

function M:InitAllMainPathSpline(SplineActor)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local HijackPathInfo = GameState.HijackPathInfo
  if not HijackPathInfo then
    return
  end
  self.UISpline = SplineActor
  SplineActor.Spline:ClearSplinePoints(false)
end

function M:InitSplineInfo()
  if self.AlreadInitSplineInfo then
    return
  end
  if not self.UISpline then
    return
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local HijackPathInfo = GameState.HijackPathInfo
  local NowPathId = GameState.NowPathId
  local bShouldContinue = true
  DebugPrint("M:InitSplineInfo 111111111111111111111111111111", NowPathId, HijackPathInfo[NowPathId])
  PrintTable(HijackPathInfo)
  while bShouldContinue do
    bShouldContinue = false
    local CurrentPath = HijackPathInfo[NowPathId]
    for _, PathPoint in ipairs(CurrentPath or {}) do
      self.UISpline.Spline:AddSplinePoint(PathPoint:K2_GetActorLocation(), ESplineCoordinateSpace.World, true)
      if 0 ~= PathPoint.NextPathId then
        NowPathId = PathPoint.NextPathId
        bShouldContinue = true
      end
    end
  end
  self.SplineLength = self.UISpline.Spline:GetSplineLength()
  if self.SplineLength and self.SplineLength > 0 then
    self.AlreadInitSplineInfo = true
  end
end

function M:InitAllTargetPoint()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  DebugPrint("111111111111111111111 InitAllTargetPoint", GameState, GameState.HijackPathInfo, self.UISpline)
  if not (GameState and GameState.HijackPathInfo) or not GameState.HijackPathInfo[GameState.NowPathId] then
    return
  end
  if not self.UISpline then
    return
  end
  self:InitSplineInfo()
  local TriggerBoxArray = GameState.StopTrollyBoxLocation
  if not TriggerBoxArray then
    self.Text_Stronghold:SetText("0")
    return
  end
  local TriggerBoxTable = TriggerBoxArray:ToTable()
  self.PercentToWidget = {}
  table.sort(TriggerBoxTable, function(FirstBoxLoc, SecondBoxLoc)
    local FirstBoxInputKey = self.UISpline.Spline:FindInputKeyClosestToWorldLocation(FirstBoxLoc)
    local FirstBoxPointLength = self.UISpline.Spline:GetDistanceAlongSplineAtSplineInputKey(FirstBoxInputKey)
    local SecondBoxInputKey = self.UISpline.Spline:FindInputKeyClosestToWorldLocation(SecondBoxLoc)
    local SecondBoxPointLength = self.UISpline.Spline:GetDistanceAlongSplineAtSplineInputKey(SecondBoxInputKey)
    return FirstBoxPointLength < SecondBoxPointLength
  end)
  if self.InformationPanel.Panel_StrongHold then
    local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.InformationPanel.Panel_StrongHold)
    self.CanvasSlotLength = CanvasSlot:GetSize().X
    for i, TriggerBoxLoc in ipairs(TriggerBoxTable) do
      local WidgetClass = LoadClass("/Game/UI/WBP/Dungeon/Hijack/WBP_Dungeon_HijackPoint.WBP_Dungeon_HijackPoint_C")
      local Widget = UE4.UWidgetBlueprintLibrary.Create(self, WidgetClass)
      self.InformationPanel.Panel_StrongHold:AddChildToCanvas(Widget)
      Widget.Img_Pass:SetVisibility(ESlateVisibility.Collapsed)
      local InputKey = self.UISpline.Spline:FindInputKeyClosestToWorldLocation(TriggerBoxLoc)
      local PointLength = self.UISpline.Spline:GetDistanceAlongSplineAtSplineInputKey(InputKey) - 550
      local Percent = PointLength / self.SplineLength
      local GlowSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(Widget)
      GlowSlot:SetPosition(FVector2D(self.CanvasSlotLength * Percent, 0))
      if not self.PercentToWidget then
        self.PercentToWidget = {}
      end
      self.PercentToWidget[#self.PercentToWidget + 1] = {Percent, Widget}
    end
  end
  self.PointIndex = 1
  self.TriggerBoxNum = #TriggerBoxTable
  self.Text_Stronghold:SetText(tostring(self.TriggerBoxNum))
  DebugPrint("InitAllTargetPoint RemoveTimer")
  self:RemoveTimer("TryInitAllTargetPoint")
end

function M:UpdatePath(SplineActor)
  DebugPrint("11111111111111111111111111111111111 DungeonHijackFloat UpdatePath", SplineActor)
  if not self.UISpline then
    self:InitAllMainPathSpline(SplineActor)
  end
end

function M:CloseDungeonUI()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if UIManager then
    if IsInDungeon then
      UIManager:UnLoadUINew(EscortPanelUIName)
    else
      self.InformationPanel:ReceiveClose()
    end
    UIManager:RemoveUserWidgetFromParent("DungeonHijackFloat")
  end
end

function M:AfterAddToParent()
  self.Super.AfterAddToParent(self)
  if not self.AlreadInitSplineInfo and IsClient(self) then
    self:AddTimer(1, self.InitAllTargetPoint, true, 0, "TryInitAllTargetPoint")
  end
  self.InformationPanel:AfterAddToParent()
end

return M
