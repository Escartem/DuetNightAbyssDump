require("UnLua")
local Component = {}

function Component:InitComponentCoroutine()
  local Coroutine = CreateCoroutine(self.InitDispatchPoint)
  table.insert(self.InitCoroutines, Coroutine)
  coroutine.resume(Coroutine, self, #self.InitCoroutines)
end

function Component:AddComponentEvent()
  EventManager:AddEvent(EventID.StartDispatch, self, self.StartDispatch)
  EventManager:AddEvent(EventID.CancelDispatch, self, self.CancelDispatch)
  EventManager:AddEvent(EventID.CompleteDispatch, self, self.CompleteDispatch)
  EventManager:AddEvent(EventID.GetAllDispatchReward, self, self.GetAllDispatchReward)
  EventManager:AddEvent(EventID.OnDispatchOverdate, self, self.OnDispatchOverdate)
  EventManager:AddEvent(EventID.OnDispatchComplete, self, self.OnDispatchComplete)
  EventManager:AddEvent(EventID.OnActiveDynamicQuest, self, self.OnActiveDynamicQuest)
  EventManager:AddEvent(EventID.GoToDispatch, self, self.OnDispatchTrace)
end

function Component:RemoveComponentEvent()
  EventManager:RemoveEvent(EventID.StartDispatch, self)
  EventManager:RemoveEvent(EventID.CancelDispatch, self)
  EventManager:RemoveEvent(EventID.CompleteDispatch, self)
  EventManager:RemoveEvent(EventID.GetAllDispatchReward, self)
  EventManager:RemoveEvent(EventID.OnDispatchOverdate, self)
  EventManager:RemoveEvent(EventID.OnDispatchComplete, self)
  EventManager:RemoveEvent(EventID.OnActiveDynamicQuest, self)
  EventManager:RemoveEvent(EventID.GoToDispatch, self)
end

function Component:ClearData()
  if next(self.DispatchPoint) then
    for Id, Item in pairs(self.DispatchPoint) do
      if Item then
        Item:RemoveFromParent()
      end
    end
    self.DispatchPoint = {}
  end
  if next(self.DispatchSelect) then
    for Id, Item in pairs(self.DispatchSelect) do
      if Item then
        Item:RemoveFromParent()
      end
    end
    self.DispatchSelect = {}
  end
  if next(self.DispatchLocations) then
    self.DispatchLocations = {}
  end
end

function Component:InitDispatchPoint(CoroutineIndex)
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar or self.IsMiniMap then
    self:InitCoroutineCheck(CoroutineIndex)
    return
  end
  for Id, Dispatch in pairs(Avatar.Dispatches) do
    if (Dispatch.State == CommonConst.DispatchState.Success or Dispatch.State == CommonConst.DispatchState.Perfect or Dispatch.State == CommonConst.DispatchState.Qualified or Dispatch.State == CommonConst.DispatchState.Disqualified) and Dispatch.RegionId == self.RegionID and nil == self.DispatchPoint[Id] then
      local Point
      if nil == CoroutineIndex then
        Point = UIManager(self):_CreateWidgetNew("RegionMapDispatchPointInfo")
      else
        Point = UIManager(self):CreateWidgetAsync("RegionMapDispatchPointInfo", self.InitCoroutines[CoroutineIndex])
      end
      self.Panel_Point:AddChild(Point)
      
      local function AdjustSlot(Point)
        Point:SetAlignment(FVector2D(0.5, 0.5))
        Point:SetAutoSize(true)
        local Anchors = FAnchors()
        Anchors.Minimum = FVector2D(0.5, 0.5)
        Anchors.Maximum = FVector2D(0.5, 0.5)
        Point:SetAnchors(Anchors)
        local Offset = FMargin()
        Offset.Left = 0
        Offset.Top = 0
        Point:SetOffsets(Offset)
      end
      
      AdjustSlot(Point.Slot)
      local UIPos = DataMgr.DispatchUI[Dispatch.DispatchId].UIPos
      local Pos = self:TransformWorldLocToUILoc(UIPos[1], UIPos[2])
      Point:SetRenderTranslation(Pos)
      Point:Init(Dispatch, self)
      self.DispatchPoint[Id] = Point
      self.DispatchLocations[Id] = Pos
    end
  end
  for _, DispatchListProp in ipairs(Avatar.CurrentDispatchList) do
    local Id = DispatchListProp:GetDispatchId()
    if -1 ~= Id then
      local Dispatch = Avatar.Dispatches[Id]
      if nil == self.DispatchPoint[Id] and Dispatch.RegionId == self.RegionID then
        local Point
        if nil == CoroutineIndex then
          Point = UIManager(self):_CreateWidgetNew("RegionMapDispatchPointInfo")
        else
          Point = UIManager(self):CreateWidgetAsync("RegionMapDispatchPointInfo", self.InitCoroutines[CoroutineIndex])
        end
        self.Panel_Point:AddChild(Point)
        
        local function AdjustSlot(Point)
          Point:SetAlignment(FVector2D(0.5, 0.5))
          Point:SetAutoSize(true)
          local Anchors = FAnchors()
          Anchors.Minimum = FVector2D(0.5, 0.5)
          Anchors.Maximum = FVector2D(0.5, 0.5)
          Point:SetAnchors(Anchors)
          local Offset = FMargin()
          Offset.Left = 0
          Offset.Top = 0
          Point:SetOffsets(Offset)
          Point:SetZOrder(0)
        end
        
        AdjustSlot(Point.Slot)
        local UIPos = DataMgr.DispatchUI[Dispatch.DispatchId].UIPos
        local Pos = self:TransformWorldLocToUILoc(UIPos[1], UIPos[2])
        Point:SetRenderTranslation(Pos)
        Point:Init(Dispatch, self)
        self.DispatchPoint[Id] = Point
        self.DispatchLocations[Id] = Pos
      end
    end
  end
  for Id, Ponit in pairs(self.DispatchPoint) do
    if nil == self.DispatchSelect[Id] then
      local Select
      if nil == CoroutineIndex then
        Select = UIManager(self):_CreateWidgetNew("RegionMapSelect")
      else
        Select = UIManager(self):CreateWidgetAsync("RegionMapSelect", self.InitCoroutines[CoroutineIndex])
      end
      self.Panel_Point:AddChild(Select)
      
      local function AdjustSlot(Point)
        Point:SetAlignment(FVector2D(0.5, 0.5))
        Point:SetAutoSize(true)
        local Anchors = FAnchors()
        Anchors.Minimum = FVector2D(0.5, 0.5)
        Anchors.Maximum = FVector2D(0.5, 0.5)
        Point:SetAnchors(Anchors)
        local Offset = FMargin()
        Offset.Left = 0
        Offset.Top = 0
        Point:SetOffsets(Offset)
        Point:SetZOrder(10)
      end
      
      AdjustSlot(Select.Slot)
      Select:SetRenderTranslation(self.DispatchLocations[Id])
      self.DispatchSelect[Id] = Select
      Select:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  self:InitCoroutineCheck(CoroutineIndex)
end

function Component:OnScaleChange_Component(Percent)
  for Id, Point in pairs(self.DispatchPoint) do
    local UIPos = DataMgr.DispatchUI[Id].UIPos
    local Pos = self:TransformWorldLocToUILoc(UIPos[1], UIPos[2])
    Point:SetRenderTranslation(Pos)
  end
  for Id, Point in pairs(self.DispatchSelect) do
    local UIPos = DataMgr.DispatchUI[Id].UIPos
    local Pos = self:TransformWorldLocToUILoc(UIPos[1], UIPos[2])
    Point:SetRenderTranslation(Pos)
  end
end

function Component:RefreshDispatchMap(RegionId, DispatchId)
  if RegionId ~= self.RegionID then
    self:ChangeRegion(RegionId, function()
      self:CloseForDispatch(true)
      self:OnPanelOpen(5)
      local Pos = self.DispatchLocations[DispatchId]
      if Pos then
        self:MoveMapTo(Pos * -1)
        self:RefreshDispatchSelect()
        self:RefreshSingleDispatchPoint()
        self:DispatchSelectClick(DispatchId)
        local Item = self.DispatchPoint[DispatchId]
        if Item then
          Item.Slot:SetZOrder(20)
          Item:OnItemSelect(true)
        end
      end
    end)
  else
    local Item = self.DispatchPoint[DispatchId]
    if nil == Item then
      self:InitDispatchPoint()
    end
    local Pos = self.DispatchLocations[DispatchId]
    if Pos then
      self:MoveMapTo(Pos * -1)
      self:RefreshDispatchSelect()
      self:RefreshSingleDispatchPoint()
      self:DispatchSelectClick(DispatchId)
      local Item = self.DispatchPoint[DispatchId]
      if Item then
        Item.Slot:SetZOrder(20)
        Item:OnItemSelect()
      end
    end
  end
  self:ShowAllMiniHead(DispatchId)
end

function Component:ShowAllMiniHead(DispatchId)
  for Id, Point in pairs(self.DispatchPoint) do
    Point:ShowMiniHead(DispatchId)
  end
end

function Component:RefreshDispatchPoint(Id, CharId)
  local Point = self.DispatchPoint[Id]
  if Point then
    Point:RefreshAgent(CharId)
  end
end

function Component:RemoveDispatchPoint(Id, AgentId)
  local Point = self.DispatchPoint[Id]
  if Point then
    Point:RemoveAgent(AgentId)
  end
end

function Component:StartDispatch(Id)
  if self.IsMiniMap then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  for DispatchId, Point in pairs(self.DispatchPoint) do
    if DispatchId == Id then
      local Dispatch = Avatar.Dispatches[Id]
      Point:StartDispatch(Dispatch)
    end
  end
end

function Component:CancelDispatch(Id)
  if self.IsMiniMap then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return
  end
  local Item = self.DispatchPoint[Id]
  local Select = self.DispatchSelect[Id]
  Item:RemoveFromParent()
  Select:RemoveFromParent()
  if self.MainMap.DispatchDetail then
    self.MainMap.DispatchDetail:RealClose()
  end
  self.DispatchPoint[Id] = nil
  self.DispatchSelect[Id] = nil
  self.DispatchLocations[Id] = nil
end

function Component:CompleteDispatch(TotalReward, Id)
  if self.IsMiniMap then
    return
  end
  local Item = self.DispatchPoint[Id]
  local Select = self.DispatchSelect[Id]
  Item:RemoveFromParent()
  Select:RemoveFromParent()
  if self.MainMap.DispatchDetail then
    self.MainMap.DispatchDetail:RealClose()
  end
  self.DispatchPoint[Id] = nil
  self.DispatchSelect[Id] = nil
  self.DispatchLocations[Id] = nil
end

function Component:GetAllDispatchReward(TotalReward, CompleteDispatchs)
  if self.IsMiniMap then
    return
  end
  for _, Id in pairs(CompleteDispatchs) do
    local Item = self.DispatchPoint[Id]
    local Select = self.DispatchSelect[Id]
    if Item then
      Item:RemoveFromParent()
    end
    if Select then
      Select:RemoveFromParent()
    end
    self.DispatchPoint[Id] = nil
    self.DispatchSelect[Id] = nil
    self.DispatchLocations[Id] = nil
  end
end

function Component:OnDispatchOverdate(Id)
  if self.IsMiniMap then
    return
  end
  if next(self.DispatchPoint) then
    for Id, Item in pairs(self.DispatchPoint) do
      if Item then
        Item:RemoveFromParent()
      end
    end
    self.DispatchPoint = {}
  end
  if next(self.DispatchSelect) then
    for Id, Item in pairs(self.DispatchSelect) do
      if Item then
        Item:RemoveFromParent()
      end
    end
    self.DispatchSelect = {}
  end
  if next(self.DispatchLocations) then
    self.DispatchLocations = {}
  end
  self:InitDispatchPoint()
end

function Component:OnActiveDynamicQuest(Id)
  self:OnCommonTrack(Id, false)
end

function Component:RefreshAllDispatchPoint()
  for DispatchId, Point in pairs(self.DispatchPoint) do
    Point:RefreshPoint()
  end
end

function Component:RefreshSingleDispatchPoint()
  for DispatchId, Point in pairs(self.DispatchPoint) do
    Point:RefreshSinglePoint()
  end
end

function Component:DispatchSelectHover(Id)
  if Id ~= self.CurClickDispatchId then
    local Select = self.DispatchSelect[Id]
    Select:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    Select:PlayAnimation(Select.Hover)
  end
end

function Component:DispatchSelectUnHover(Id)
  if Id ~= self.CurClickDispatchId then
    local Select = self.DispatchSelect[Id]
    Select:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function Component:PlaySelectAni(Id)
  local Point = self.DispatchPoint[Id]
  if Point then
    Point:PlaySelectAnimation()
  end
end

function Component:DispatchSelectClick(Id)
  self.CurClickDispatchId = Id
  self.MainMap.DispatchId = Id
  local UIId = DataMgr.Dispatch[Id].DispatchUIId
  local FloorId = DataMgr.DispatchUI[UIId].FloorId
  self:OnFloorBtnClicked(FloorId, true)
  local Select = self.DispatchSelect[Id]
  Select.Slot:SetZOrder(10)
  Select:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  Select.IsPlay = false
  Select:PlayAnimation(Select.Click)
end

function Component:RefreshDispatchSelect()
  for _, Select in pairs(self.DispatchSelect) do
    if Select then
      Select:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end

function Component:OnDispatchExistingComplete(Id)
  if self.IsMiniMap then
    return
  end
  if self.MainMap.DispatchAgentList then
    return
  end
  local Point = self.DispatchPoint[Id]
  local Select = self.DispatchSelect[Id]
  if Point then
    Point:RemoveFromParent()
    self.DispatchPoint[Id] = nil
    if Select then
      Select:RemoveFromParent()
      self.DispatchSelect[Id] = nil
    end
  end
end

function Component:OnDispatchComplete(Id)
  if self.IsMiniMap then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Dispatch = Avatar.Dispatches[Id]
  local Point = self.DispatchPoint[Id]
  if Point then
    Point:SetState(Dispatch)
  end
end

function Component:BackToOriginalRegion()
  self:ChangeRegion(self.OriginalRegionId)
end

function Component:OnDispatchTrace(Dispatch)
  self.CurTrackDispatchId = Dispatch
  if GWorld.GameInstance.TrackingID ~= self.CurTrackDispatchId then
    if GWorld.GameInstance.TrackingID then
      local TrackingID = GWorld.GameInstance.TrackingID
      local trackTarget = self.MarkTable[TrackingID] or self.TeleportPoints[TrackingID] or self.RegionPoints[TrackingID]
      if trackTarget then
        EventManager:FireEvent(EventID.OnCommonTrack, TrackingID, false)
        trackTarget:StopAllAnimations()
      end
    end
    EventManager:FireEvent(EventID.OnCommonTrack, self.CurTrackDispatchId, true)
    GWorld.GameInstance.TrackingID = self.CurTrackDispatchId
  else
    EventManager:FireEvent(EventID.OnCommonTrack, self.CurTrackDispatchId, false)
    GWorld.GameInstance.TrackingID = nil
  end
end

function Component:CloseForDispatch(ShowDispatch)
  local Avatar = GWorld:GetAvatar()
  local Visible = ShowDispatch and ESlateVisibility.Collapsed or ESlateVisibility.SelfHitTestInvisible
  for _, Point in pairs(self.TeleportPoints) do
    Point:SetPointVisibility("Dispatch", not ShowDispatch, true)
  end
  for _, Point in pairs(self.RegionPoints) do
    Point:SetPointVisibility("Dispatch", not ShowDispatch, true)
  end
  for _, Point in pairs(self.MarkTable) do
    Point:SetPointVisibility("Dispatch", not ShowDispatch, true)
  end
  if not IsEmptyTable(self.IndicatorWidgets) then
    for _, v in pairs(self.IndicatorWidgets) do
      if IsValid(v) then
        v:SetVisibility(Visible)
      end
    end
  end
  if ShowDispatch then
    self.Panel_Gamer:SetVisibility(ESlateVisibility.Collapsed)
    self.MainMap.Slider_Zoom:SetVisibility(ESlateVisibility.Collapsed)
  elseif self.IsInRegion and not DataMgr.SubRegion[Avatar.CurrentRegionId].NotShowInRegionMap then
    self.Panel_Gamer:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.MainMap.Slider_Zoom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

return Component
