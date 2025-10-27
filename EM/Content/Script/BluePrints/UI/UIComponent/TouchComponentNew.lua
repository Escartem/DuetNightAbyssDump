require("UnLua")
local TouchComponent = {}

function TouchComponent:Initialize(Initializer)
  self.WidgetStartLocalPos = nil
  self.WidgetCurLocalPos = nil
  self.NowTouchWorldPos = {}
  self.m_LastWorldPosTable = {}
  self.LastTouch_Time = 0
  self.Click_MaxLen = 5
  self.DClick_Prepared = false
  self.Lpress_Began = false
  self.Lpress_Interval = 0.5
  self.Lpress_MaxLen = 20
  self.Touching_Flag = {}
  self.AllTouchItems = {}
  self.AllParentWidget = {}
  self.SubTouchItems = {}
  self.SubTouchParentWidget = {}
  self.SubTouchItemsName = {}
  self.SubTouchItemsStartWorldPos = {}
  self.UpdatePosFlag = {}
  self.m_LastHandleMoveTimeStamp = {}
  self.CurrentTouchingGeometry = {}
  self.CurrentTouchingGestureEvent = {}
  self.AllTouchCallBack = {}
  self.Owner_Player = nil
  self.m_UpdateTimerFlag_X = false
  self.m_UpdateTimerFlag_Y = false
  self.CanLimitRange = false
  self.LimitRangeParam = {}
  self.IsAutoAdjustByMultiTouch = false
  self.DefaultPixelSeries = 1.5
  self.MultiTouchLastTimeStamp = -1
  self.bNotUseOptimizationMove = false
  self.BackgroundPlateOffset = 100
end

function TouchComponent:SetClickMaxLen(MaxLen)
  self.ClickMaxLen = MaxLen
end

function TouchComponent:SetLongTouchInterval(Interval)
  self.LpressInterval = Interval
end

function TouchComponent:InitTouchLayer(OwnerPlayer, UpdatetimeX, UpdatetimeY, bNotUseOptimization)
  self.Owner_Player = OwnerPlayer
  self.m_SavePrePos = FVector2D(0, 0)
  self.m_SaveTarPos = FVector2D(0, 0)
  self.Updatetime_X = UpdatetimeX
  self.Updatetime_Y = UpdatetimeY
  self.m_LastHandleMoveTimeStamp = {}
  self.bNotUseOptimizationMove = bNotUseOptimization
end

function TouchComponent:InitTouchListenEvent()
  EventManager:AddEvent(EventID.CharDie, self, self.HandleOnCharDie)
  EventManager:AddEvent(EventID.StartTalk, self, self.HandleEventByInterrupt)
  self:ListenForInputAction("OpenMenu", EInputEvent.IE_Pressed, false, {
    self,
    self.HandleEventByInterrupt
  })
end

function TouchComponent:RemoveTouchListenEvent()
  EventManager:RemoveEvent(EventID.CharDie, self)
  EventManager:RemoveEvent(EventID.StartTalk, self)
  self:StopListeningForInputAction("OpenMenu", EInputEvent.IE_Pressed)
end

function TouchComponent:HandleOnCharDie(Eid)
  local Entity = GWorld.Battle:GetEntity(Eid)
  if Entity and Entity.IsMainPlayer and Entity:IsMainPlayer() then
    self:HandleEventByInterrupt()
  end
end

function TouchComponent:HandleEventByInterrupt()
  for k, CurrentGeometry in pairs(self.CurrentTouchingGeometry) do
    if self.Touching_Flag[k] then
      self:MouseOrTouchButtonUp(CurrentGeometry, self.CurrentTouchingGestureEvent[k], k - 1)
    end
  end
end

function TouchComponent:AddStaticSubTouchItem(SubTouchName, SubTouchItem, AllCallBack)
  self.UpdatePosFlag[SubTouchName] = false
  for k, v in pairs(AllCallBack) do
    if self.AllTouchCallBack[k] == nil then
      self.AllTouchCallBack[k] = {
        {Name = SubTouchName, Value = v}
      }
    else
      table.insert(self.AllTouchCallBack[k], {Name = SubTouchName, Value = v})
    end
  end
  self.AllTouchItems[SubTouchName] = SubTouchItem
end

function TouchComponent:AddMovedSubTouchItem(SubTouchName, SubTouchItem, ParentWidget, AllCallBack, LimitParams)
  self.UpdatePosFlag[SubTouchName] = true
  for k, v in pairs(AllCallBack) do
    if self.AllTouchCallBack[k] == nil then
      self.AllTouchCallBack[k] = {
        {Name = SubTouchName, Value = v}
      }
    else
      table.insert(self.AllTouchCallBack[k], {Name = SubTouchName, Value = v})
    end
  end
  self.AllParentWidget[SubTouchName] = ParentWidget
  self.LimitRangeParam[SubTouchItem] = LimitParams
  self.AllTouchItems[SubTouchName] = SubTouchItem
end

function TouchComponent:OnTouchStarted(InGeometry, InGestureEvent)
  return self:MouseOrTouchButtonDown(InGeometry, InGestureEvent)
end

function TouchComponent:OnTouchMoved(InGeometry, InGestureEvent)
  return self:MouseOrTouchButtonMove(InGeometry, InGestureEvent)
end

function TouchComponent:OnTouchEnded(InGeometry, InGestureEvent)
  return self:MouseOrTouchButtonUp(InGeometry, InGestureEvent)
end

function TouchComponent:GetOwningPlayer()
  return self.Owner_Player
end

function TouchComponent:GetWorldPos(Widget)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return FVector2D(0, 0), FVector2D(0, 0)
  end
  return UIManager:GetWorldPosition(Widget), UIManager:GetWidgetAbsoluteSize(Widget)
end

function TouchComponent:GetLastPosTableLength()
  local NowCount = 0
  for k, v in pairs(self.m_LastWorldPosTable) do
    NowCount = NowCount + 1
  end
  return NowCount
end

function TouchComponent:GetNowTouchWorldPosTableLength()
  local NowCount = 0
  for k, v in pairs(self.NowTouchWorldPos) do
    NowCount = NowCount + 1
  end
  return NowCount
end

function TouchComponent:MouseOrTouchButtonDown(InGeometry, InGestureEvent)
  local ScreenSpacePosition = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(InGestureEvent)
  local thisPos = UE4.UUIFunctionLibrary.ScreenSpaceToAbsolute(ScreenSpacePosition)
  local SubTouchItem, SubTouchItemName, SubTouchItemStartWorldPos, SubTouchParentWidget
  for k, v in pairs(self.AllTouchItems) do
    local WidgetWorldPos, WidgetWorldSize = self:GetWorldPos(v)
    if ScreenSpacePosition.X >= WidgetWorldPos.X and ScreenSpacePosition.X <= WidgetWorldPos.X + WidgetWorldSize.X and ScreenSpacePosition.Y >= WidgetWorldPos.Y and ScreenSpacePosition.Y <= WidgetWorldPos.Y + WidgetWorldSize.Y then
      if nil == SubTouchItem then
        SubTouchItem = v
        SubTouchItemName = k
        SubTouchItemStartWorldPos = FVector2D(WidgetWorldPos.X + WidgetWorldSize.X * 0.5, WidgetWorldPos.Y + WidgetWorldSize.Y * 0.5)
        SubTouchParentWidget = self.AllParentWidget[k]
      else
        local ChooseCanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(SubTouchItem)
        local TouchCanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(v)
        if TouchCanvasSlot.ZOrder > ChooseCanvasSlot.ZOrder then
          SubTouchItem = v
          SubTouchItemName = k
          SubTouchItemStartWorldPos = FVector2D(WidgetWorldPos.X + WidgetWorldSize.X * 0.5, WidgetWorldPos.Y + WidgetWorldSize.Y * 0.5)
          SubTouchParentWidget = self.AllParentWidget[k]
        end
      end
      if nil ~= SubTouchItem then
        break
      end
    end
  end
  if nil == SubTouchItem then
    DebugPrint("TouchComponent== MouseOrTouchButtonDown Error, Not Find Can Interactive Item")
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(SubTouchItem)
  local PointerIndex = UE4.UKismetInputLibrary.PointerEvent_GetPointerIndex(InGestureEvent)
  self.CurrentTouchingGeometry[PointerIndex + 1] = InGeometry
  self.CurrentTouchingGestureEvent[PointerIndex + 1] = InGestureEvent
  self.SubTouchItems[PointerIndex + 1] = SubTouchItem
  self.SubTouchParentWidget[PointerIndex + 1] = SubTouchParentWidget
  self.SubTouchItemsName[PointerIndex + 1] = SubTouchItemName
  self.SubTouchItemsStartWorldPos[PointerIndex + 1] = SubTouchItemStartWorldPos
  self.WidgetCurLocalPos = CanvasSlot:GetPosition()
  if nil == self.WidgetStartLocalPos then
    self.WidgetStartLocalPos = CanvasSlot:GetPosition()
  else
    local LimitRangeInfo = self.LimitRangeParam[SubTouchItem]
    if LimitRangeInfo and LimitRangeInfo.NeedResetPos then
      local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(SubTouchItem)
      if nil ~= CanvasSlot then
        CanvasSlot:SetPosition(self.WidgetStartLocalPos)
      end
    end
  end
  self.Touching_Flag[PointerIndex + 1] = true
  local AllDownCallBack = self.AllTouchCallBack.Down
  if type(AllDownCallBack) == "table" then
    for k, v in pairs(AllDownCallBack) do
      if v.Name == SubTouchItemName and type(v.Value) == "function" then
        v.Value(self, PointerIndex, self.WidgetCurLocalPos)
        break
      end
    end
  end
  local TotalTouchCount = self:GetNowTouchWorldPosTableLength()
  if TotalTouchCount <= 2 then
    self.NowTouchWorldPos[PointerIndex + 1] = thisPos
    if TotalTouchCount <= 1 then
      self.CanLimitRange = true
      self.m_IsTap = true
    elseif 2 == TotalTouchCount then
      if nil == SubTouchItem.PixelSeries then
        SubTouchItem.PixelSeries = self.DefaultPixelSeries
      end
      self.CanLimitRange = false
      local otherPos = FVector2D(0, 0)
      for i = 1, #self.NowTouchWorldPos do
        if i ~= PointerIndex + 1 then
          otherPos = self.NowTouchWorldPos[i]
        end
        self.m_ZoomStartLength = UE4.UKismetMathLibrary.Distance2D(thisPos, otherPos)
        self.m_IsTap = false
        self.m_OriginPoint = (thisPos + otherPos) / 2
        self:CalcZoomRatio(PointerIndex)
        self.StartPixelSeries = SubTouchItem.PixelSeries
      end
    end
    local Handled = UE4.UWidgetBlueprintLibrary.Handled()
    return UE4.UWidgetBlueprintLibrary.CaptureMouse(Handled, self)
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function TouchComponent:MouseOrTouchButtonMove(InGeometry, InGestureEvent)
  local PointerIndex = UE4.UKismetInputLibrary.PointerEvent_GetPointerIndex(InGestureEvent)
  if self.Touching_Flag[PointerIndex + 1] then
    local SubTouchItem = self.SubTouchItems[PointerIndex + 1]
    local NowTime = UE4.UGameplayStatics.GetRealTimeSeconds(self:GetOwningPlayer())
    if not self.bNotUseOptimizationMove then
      local LastHandleMoveTimeStamp = self.m_LastHandleMoveTimeStamp[PointerIndex + 1]
      if LastHandleMoveTimeStamp and NowTime - LastHandleMoveTimeStamp <= 0.033 then
        return UIUtils.Handled
      end
    end
    self.m_LastHandleMoveTimeStamp[PointerIndex + 1] = NowTime
    local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(SubTouchItem)
    local ScreenSpacePosition = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(InGestureEvent)
    local thisPos = UE4.UUIFunctionLibrary.ScreenSpaceToAbsolute(ScreenSpacePosition)
    local AllSingleMoveCallBack = self.AllTouchCallBack.Move
    local AllMultiMoveCallBack = self.AllTouchCallBack.MultiMove
    self.CurrentTouchingGeometry[PointerIndex + 1] = InGeometry
    self.CurrentTouchingGestureEvent[PointerIndex + 1] = InGestureEvent
    local TotalTouchCount = self:GetNowTouchWorldPosTableLength()
    if self.NowTouchWorldPos[PointerIndex + 1] ~= nil then
      if 1 == TotalTouchCount then
        if type(AllSingleMoveCallBack) == "table" then
          for k, v in pairs(AllSingleMoveCallBack) do
            if v.Name == self.SubTouchItemsName[PointerIndex + 1] and type(v.Value) == "function" and NowTime - self.MultiTouchLastTimeStamp >= 0.2 then
              v.Value(self, TotalTouchCount, PointerIndex, self.WidgetCurLocalPos, thisPos - self.SubTouchItemsStartWorldPos[PointerIndex + 1], thisPos - self.NowTouchWorldPos[PointerIndex + 1], thisPos)
              break
            end
          end
        end
      elseif 2 == TotalTouchCount then
        local otherPos
        for i = 1, TotalTouchCount do
          if i ~= PointerIndex + 1 then
            otherPos = self.NowTouchWorldPos[i]
          end
        end
        local MoveDist = UE4.UKismetMathLibrary.Distance2D(thisPos, otherPos)
        if type(AllMultiMoveCallBack) == "table" then
          for k, v in pairs(AllMultiMoveCallBack) do
            if v.Name == self.SubTouchItemsName[PointerIndex + 1] and type(v.Value) == "function" then
              v.Value(self, TotalTouchCount, PointerIndex, thisPos, otherPos, MoveDist)
              break
            end
          end
        elseif type(AllSingleMoveCallBack) == "table" then
          for k, v in pairs(AllSingleMoveCallBack) do
            if v.Name == self.SubTouchItemsName[PointerIndex + 1] and type(v.Value) == "function" and NowTime - self.MultiTouchLastTimeStamp >= 0.2 then
              v.Value(self, TotalTouchCount, PointerIndex, self.WidgetCurLocalPos, thisPos - self.SubTouchItemsStartWorldPos[PointerIndex + 1], thisPos - self.NowTouchWorldPos[PointerIndex + 1], thisPos)
              break
            end
          end
        end
        if self.IsAutoAdjustByMultiTouch then
          self.CanLimitRange = false
          if MoveDist >= self.m_ZoomStartLength then
            local newPixelSeries = (MoveDist - self.m_ZoomStartLength) / 20
            SubTouchItem.PixelSeries = self.StartPixelSeries + newPixelSeries
            if SubTouchItem.PixelSeries > 80 then
              SubTouchItem.PixelSeries = 80
            end
          else
            local newPixelSeries = (self.m_ZoomStartLength - MoveDist) / 20
            SubTouchItem.PixelSeries = self.StartPixelSeries - newPixelSeries
            if SubTouchItem.PixelSeries < 30 then
              SubTouchItem.PixelSeries = 30
            end
          end
          if SubTouchItem.AdjustSize then
            SubTouchItem:AdjustSize()
          end
          self:SetZoomPos(PointerIndex)
        end
      end
      self.NowTouchWorldPos[PointerIndex + 1] = thisPos
      if self.UpdatePosFlag[self.SubTouchItemsName[PointerIndex + 1]] == true then
        self.WidgetCurLocalPos = self:GetNextMoveLocalPos(InGeometry, thisPos, PointerIndex)
        CanvasSlot:SetPosition(self.WidgetCurLocalPos)
        self.m_LastWorldPosTable[PointerIndex + 1] = thisPos
      end
      return UIUtils.Handled
    end
  end
  return UIUtils.Unhandled
end

function TouchComponent:MouseOrTouchButtonUp(InGeometry, InGestureEvent, TargetPointerIndex)
  local PointerIndex = TargetPointerIndex or UE4.UKismetInputLibrary.PointerEvent_GetPointerIndex(InGestureEvent)
  local SubTouchItem = self.SubTouchItems[PointerIndex + 1]
  if nil == SubTouchItem then
    DebugPrint("TouchComponent== MouseOrTouchButtonUp, Not Find Can Interactive Item", PointerIndex)
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  self.m_IsTap = false
  self.Touching_Flag[PointerIndex + 1] = nil
  self.m_LastHandleMoveTimeStamp[PointerIndex + 1] = nil
  self.CurrentTouchingGeometry[PointerIndex + 1] = InGeometry
  self.CurrentTouchingGestureEvent[PointerIndex + 1] = InGestureEvent
  local AllUpCallBack = self.AllTouchCallBack.Up
  if type(AllUpCallBack) == "table" then
    for k, v in pairs(AllUpCallBack) do
      if v.Name == self.SubTouchItemsName[PointerIndex + 1] and type(v.Value) == "function" then
        local ScreenSpacePosition = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(InGestureEvent)
        local thisPos = UE4.UUIFunctionLibrary.ScreenSpaceToAbsolute(ScreenSpacePosition)
        v.Value(self, PointerIndex, self.WidgetCurLocalPos, self.m_LastWorldPosTable[PointerIndex + 1], self.NowTouchWorldPos[PointerIndex + 1], thisPos - self.SubTouchItemsStartWorldPos[PointerIndex + 1])
        break
      end
    end
  end
  if nil ~= self.NowTouchWorldPos[PointerIndex + 1] then
    self.NowTouchWorldPos[PointerIndex + 1] = nil
    local TotalTouchCount = self:GetNowTouchWorldPosTableLength()
    if 0 == TotalTouchCount then
      if self.CanLimitRange then
        self:LimitRange(PointerIndex)
      end
    elseif 1 == TotalTouchCount then
      self.MultiTouchLastTimeStamp = UE4.UGameplayStatics.GetRealTimeSeconds(self:GetOwningPlayer())
    end
    local Handled = UE4.UWidgetBlueprintLibrary.Handled()
    if self.UpdatePosFlag[self.SubTouchItemsName[PointerIndex + 1]] == true then
      self.UpdatePosFlag[self.SubTouchItemsName[PointerIndex + 1]] = false
      self:OnUpdatePosFlag(PointerIndex)
    end
    return UE4.UWidgetBlueprintLibrary.ReleaseMouseCapture(Handled)
  end
  if self.UpdatePosFlag[self.SubTouchItemsName[PointerIndex + 1]] == true then
    self.UpdatePosFlag[self.SubTouchItemsName[PointerIndex + 1]] = false
    self:OnUpdatePosFlag(PointerIndex)
  else
    self:AfterTouchItemMove(PointerIndex)
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function TouchComponent:CalcZoomRatio(PointerIndex)
  self.m_OriginPoint = self.m_OriginPoint + FVector2D(math.abs(self.WidgetCurLocalPos.X), math.abs(self.WidgetCurLocalPos.Y))
  self.m_LeftPointPoint = FVector2D(self.BackgroundPlateOffset, self.BackgroundPlateOffset)
  self.m_RelativePos = self.m_OriginPoint - self.m_LeftPointPoint
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.SubTouchItems[PointerIndex + 1])
  local W = CanvasSlot:GetSize().X
  local H = CanvasSlot:GetSize().Y
  self.m_RelativePosRatio = FVector2D(self.m_RelativePos.X / W, self.m_RelativePos.Y / H)
end

function TouchComponent:SetZoomPos(PointerIndex)
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.SubTouchItems[PointerIndex + 1])
  local newW = CanvasSlot:GetSize().X
  local newH = CanvasSlot:GetSize().Y
  self.m_newRelativePos = FVector2D(newW * self.m_RelativePosRatio.X, newH * self.m_RelativePosRatio.Y)
  local newPos = self.WidgetCurLocalPos - self.m_newRelativePos + self.m_RelativePos
  CanvasSlot:SetPosition(newPos)
end

function TouchComponent:GetNextMoveLocalPos(InGeometry, PointWorldPos, PointerIndex)
  local StartTouchWorldPos = self.SubTouchItemsStartWorldPos[PointerIndex + 1]
  local PointLocalPos = UE4.USlateBlueprintLibrary.AbsoluteToLocal(InGeometry, PointWorldPos)
  local StartTouchLocalPos = UE4.USlateBlueprintLibrary.AbsoluteToLocal(InGeometry, StartTouchWorldPos)
  local ChangeLocalDis = PointLocalPos - StartTouchLocalPos
  local FinalLocalPos = self.WidgetStartLocalPos + ChangeLocalDis
  local LimitRangeInfo = self.LimitRangeParam[self.SubTouchItems[PointerIndex + 1]]
  if LimitRangeInfo and LimitRangeInfo.Type == "Circle" then
    local TwoPointDistance = UE4.UKismetMathLibrary.Distance2D(FinalLocalPos, self.WidgetStartLocalPos)
    if TwoPointDistance > LimitRangeInfo.Param.Radius then
      local k = ChangeLocalDis.Y / ChangeLocalDis.X
      local x, y = 0, 0
      if ChangeLocalDis.X < 0 then
        x = -LimitRangeInfo.Param.Radius / math.sqrt(1 + k * k) + self.WidgetStartLocalPos.X
        y = -k * LimitRangeInfo.Param.Radius / math.sqrt(1 + k * k) + self.WidgetStartLocalPos.Y
      else
        x = LimitRangeInfo.Param.Radius / math.sqrt(1 + k * k) + self.WidgetStartLocalPos.X
        y = k * LimitRangeInfo.Param.Radius / math.sqrt(1 + k * k) + self.WidgetStartLocalPos.Y
      end
      FinalLocalPos.X = self.WidgetStartLocalPos.X + x
      FinalLocalPos.Y = self.WidgetStartLocalPos.Y + y
    end
  end
  return FinalLocalPos
end

function TouchComponent:LimitRange(PointerIndex)
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.SubTouchItems[PointerIndex + 1])
  if nil == CanvasSlot then
    return
  end
  self.WidgetCurLocalPos = CanvasSlot:GetPosition()
  local LimitRangeInfo = self.LimitRangeParam[self.SubTouchItems[PointerIndex + 1]]
  if nil ~= LimitRangeInfo then
    local UpLimitParam = LimitRangeInfo.UpLimitParam
    if nil ~= UpLimitParam then
      local IsNeedRebackX = false
      if self.WidgetCurLocalPos.X + CanvasSlot:GetSize().X < UpLimitParam.LeftMoveLen then
        self.m_SavePrePos.X = self.WidgetCurLocalPos.X
        self.m_SaveTarPos.X = -CanvasSlot:GetSize().X + UpLimitParam.LeftMoveLen
        IsNeedRebackX = true
      elseif self.WidgetCurLocalPos.X + CanvasSlot:GetSize().X > UpLimitParam.RightMoveLen then
        self.m_SavePrePos.X = self.WidgetCurLocalPos.X
        self.m_SaveTarPos.X = -CanvasSlot:GetSize().X + UpLimitParam.RightMoveLen
        IsNeedRebackX = true
      end
      if self.m_UpdateTimerFlag_X == true and IsNeedRebackX then
        self.m_UpdateTimerFlag_X = false
        self.TimerHandle_X = UE4.UKismetSystemLibrary.K2_SetTimerDelegate({
          self,
          self.OnUpdateEdgeLerpTimer_X
        }, 0.02, true)
      end
      local IsNeedRebackY = false
      if self.WidgetCurLocalPos.Y + CanvasSlot:GetSize().Y < UpLimitParam.DownMoveLen then
        self.m_SavePrePos.Y = self.WidgetCurLocalPos.Y
        self.m_SaveTarPos.Y = -CanvasSlot:GetSize().Y + UpLimitParam.DownMoveLen
        IsNeedRebackY = true
      elseif self.WidgetCurLocalPos.Y + CanvasSlot:GetSize().Y > UpLimitParam.UpMoveLen then
        self.m_SavePrePos.Y = self.WidgetCurLocalPos.Y
        self.m_SaveTarPos.Y = -CanvasSlot:GetSize().Y + UpLimitParam.UpMoveLen
        IsNeedRebackY = true
      end
      if true == (self.m_UpdateTimerFlag_Y and IsNeedRebackY) then
        self.m_UpdateTimerFlag_Y = false
        self.TimerHandle_Y = UE4.UKismetSystemLibrary.K2_SetTimerDelegate({
          self,
          self.OnUpdateEdgeLerpTimer_Y
        }, 0.02, true)
      end
      CanvasSlot:SetPosition(self.WidgetCurLocalPos)
    else
      local viewport_geometry = UE4.UWidgetLayoutLibrary.GetViewportWidgetGeometry(self:GetOwningPlayer())
      local viewportlocalsize = UE4.USlateBlueprintLibrary.GetLocalSize(viewport_geometry)
      if self.WidgetCurLocalPos.X + CanvasSlot:GetSize().X < viewportlocalsize.X / 2 then
        self.m_SavePrePos.X = self.WidgetCurLocalPos.X
        self.m_SaveTarPos.X = -CanvasSlot:GetSize().X + viewportlocalsize.X / 2
        if self.m_UpdateTimerFlag_X == true then
          self.m_UpdateTimerFlag_X = false
          self.TimerHandle_X = UE4.UKismetSystemLibrary.K2_SetTimerDelegate({
            self,
            self.OnUpdateEdgeLerpTimer_X
          }, 0.02, true)
        end
      end
      if self.WidgetCurLocalPos.Y + CanvasSlot:GetSize().Y < 0 then
        self.m_SavePrePos.Y = self.WidgetCurLocalPos.Y
        self.m_SaveTarPos.Y = -CanvasSlot:GetSize().Y
        if true == self.m_UpdateTimerFlag_Y then
          self.m_UpdateTimerFlag_Y = false
          self.TimerHandle_Y = UE4.UKismetSystemLibrary.K2_SetTimerDelegate({
            self,
            self.OnUpdateEdgeLerpTimer_Y
          }, 0.02, true)
        end
      end
      CanvasSlot:SetPosition(self.WidgetCurLocalPos)
    end
  end
end

function TouchComponent:OnUpdateEdgeLerpTimer_X()
  self.Updatetime_X = self.Updatetime_X + 0.1
  self.WidgetCurLocalPos.X = UE4.UKismetMathLibrary.Lerp(self.m_SavePrePos.X, self.m_SaveTarPos.X, self.Updatetime_X)
  if self.Updatetime_X > 1 then
    self.Updatetime_X = 0
    self.m_UpdateTimerFlag_X = true
    UE4.UKismetSystemLibrary.K2_ClearAndInvalidateTimerHandle(self, self.TimerHandle_X)
  end
end

function TouchComponent:OnUpdateEdgeLerpTimer_Y()
  self.Updatetime_Y = self.Updatetime_Y + 0.1
  self.WidgetCurLocalPos.Y = UE4.UKismetMathLibrary.Lerp(self.m_SavePrePos.Y, self.m_SaveTarPos.Y, self.Updatetime_Y)
  if self.Updatetime_Y > 1 then
    self.Updatetime_Y = 0
    self.m_UpdateTimerFlag_X = true
    UE4.UKismetSystemLibrary.K2_ClearAndInvalidateTimerHandle(self, self.TimerHandle_Y)
  end
end

function TouchComponent:OnUpdatePosFlag(PointerIndex)
  local SubTouchItem = self.SubTouchItems[PointerIndex + 1]
  local LimitRangeInfo = self.LimitRangeParam[SubTouchItem]
  if LimitRangeInfo and -1 == LimitRangeInfo.TouchTimes then
    self.UpdatePosFlag[self.SubTouchItemsName[PointerIndex + 1]] = true
  end
  if LimitRangeInfo and LimitRangeInfo.NeedResetPos then
    local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(SubTouchItem)
    if nil ~= CanvasSlot then
      CanvasSlot:SetPosition(self.WidgetStartLocalPos)
    end
  end
  self:AfterTouchItemMove(PointerIndex)
  UE4.UKismetSystemLibrary.K2_ClearAndInvalidateTimerHandle(self, self.UpdatePosTimerHandle)
end

function TouchComponent:AfterTouchItemMove(PointerIndex)
  self.SubTouchItems[PointerIndex + 1] = nil
  self.SubTouchParentWidget[PointerIndex + 1] = nil
  self.SubTouchItemsName[PointerIndex + 1] = nil
  self.SubTouchItemsStartWorldPos[PointerIndex + 1] = nil
  self.m_LastWorldPosTable[PointerIndex + 1] = nil
  self.CurrentTouchingGeometry[PointerIndex + 1] = nil
  self.CurrentTouchingGestureEvent[PointerIndex + 1] = nil
end

return TouchComponent
