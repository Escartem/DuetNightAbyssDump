require("UnLua")
local Component = {}

function Component:InitComponentCoroutine()
  local Coroutine = CreateCoroutine(self.InitDoorIcons)
  table.insert(self.InitCoroutines, Coroutine)
  coroutine.resume(Coroutine, self, #self.InitCoroutines)
end

function Component:AddComponentEvent()
  EventManager:AddEvent(EventID.OnDoorStateChange, self, self.OnDoorStateChange)
end

function Component:RemoveComponentEvent()
  EventManager:RemoveEvent(EventID.OnDoorStateChange, self)
end

function Component:ClearData()
  if self.DoorIcons then
    for _, Widget in pairs(self.DoorIcons) do
      Widget:RemoveFromParent()
    end
    self.DoorIcons = {}
  end
end

function Component:InitDoorIcons(CoroutineIndex)
  self.DoorIcons = {}
  self.DoorIconLocation = {}
  self.DoorIcon2FloorId = {}
  self.DoorState = {}
  self.DoorTeleportPointId = {}
  self.ManualItemId2DoorIcon = {}
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if nil == GameMode or nil == GameMode:GetRegionDataMgrSubSystem() then
    self:InitCoroutineCheck(CoroutineIndex)
    return
  end
  local Avatar = GWorld:GetAvatar()
  for _, SubRegionID in pairs(self.RegionData.IsRandom) do
    local DoorDatas = {}
    for Id, DoorData in pairs(DataMgr.RegionDoor) do
      if DoorData.DoorSubRegion == SubRegionID and DoorData.StaticId then
        DoorDatas[DoorData.StaticId] = DoorData
        local FloorId
        if DoorData.BuildingNameAndId then
          local Name
          Name, FloorId = self:GetBuildingNameAndId(DoorData.BuildingNameAndId)
        end
        FloorId = FloorId or self.MaxFloorId
        self.DoorIcon2FloorId[DoorData.Id] = FloorId
      end
    end
    local TmpFullRegionStoreDatas = GameMode:GetRegionDataMgrSubSystem().DataLibrary:GetFullRegionStoreDatas()
    if nil ~= TmpFullRegionStoreDatas then
      for _, DoorBaseData in pairs(TmpFullRegionStoreDatas) do
        local Data = DoorDatas[DoorBaseData.ManualItemId]
        if Data then
          local Point = self:NewPointAsync(self.InitCoroutines[CoroutineIndex])
          local State = false
          local Scale = 1
          if Data.Scale then
            Scale = Data.Scale
          end
          if DoorBaseData.State then
            State = DoorBaseData.State.StateId
          end
          Point:InitDoor(self, Data, State, Scale)
          local Position = self:TransformWorldLocToUILoc(Data.DoorPos[1], Data.DoorPos[2])
          Point:SetRenderTranslation(Position)
          Point:SetVisibility(ESlateVisibility.Collapsed)
          DoorDatas[DoorBaseData.ManualItemId] = nil
          self.DoorIcons[Data.Id] = Point
          self.DoorState[Data.Id] = true
          self.ManualItemId2DoorIcon[DoorBaseData.ManualItemId] = Point
          self.DoorIconLocation[Data.Id] = FVector2D(Data.DoorPos[1], Data.DoorPos[2])
          self.DoorTeleportPointId[Data.Id] = Data.DoorTelepointId
          if Data.Id == GWorld.GameInstance.TrackingID then
            Point:PlayAnimation(Point.Loop, 0, 0)
            self:CreateTrackIndicator(Point)
          end
          if not self.TeleportState[Data.DoorTelepointId] then
            Point:SetDoorVisibility("Lock", false, true)
          end
        end
      end
    end
    for _, Data in pairs(DoorDatas) do
      local Point = self:NewPointAsync(self.InitCoroutines[CoroutineIndex])
      local Scale = 1
      if Data.Scale then
        Scale = Data.Scale
      end
      Point:InitDoor(self, Data, 104012, Scale)
      local Position = self:TransformWorldLocToUILoc(Data.DoorPos[1], Data.DoorPos[2])
      Point:SetRenderTranslation(Position)
      Point:SetVisibility(ESlateVisibility.HitTestInvisible)
      self.DoorIcons[Data.Id] = Point
      self.DoorState[Data.Id] = true
      self.ManualItemId2DoorIcon[Data.StaticId] = Point
      self.DoorIconLocation[Data.Id] = FVector2D(Data.DoorPos[1], Data.DoorPos[2])
      self.DoorTeleportPointId[Data.Id] = Data.DoorTelepointId
      if not self.TeleportState[Data.DoorTelepointId] then
        Point:SetDoorVisibility("Lock", false, true)
      end
    end
  end
  self:InitCoroutineCheck(CoroutineIndex)
end

function Component:ShowFloor_Component(FloorId)
  if self.DoorIcons then
    for Id, DoorIcon in pairs(self.DoorIcons) do
      if self.DoorIcon2FloorId[Id] == FloorId then
        local Avatar = GWorld:GetAvatar()
        if nil ~= Avatar then
          DoorIcon:SetDoorVisibility("Floor", true)
        end
      else
        DoorIcon:SetDoorVisibility("Floor", false, true)
      end
    end
  end
end

function Component:OnScaleChange_Component(Percent)
  local TrackingID = GWorld.GameInstance.TrackingID
  local Visible = self:GetMapIconVisible("UI_DOORICONS", Percent)
  for Id, Point in pairs(self.DoorIcons) do
    local ThisVisible = DataMgr.RegionDoor[Id] and Visible
    if ThisVisible or Id == self.CurrentConveyId or Id == TrackingID then
      if Point:GetVisibility() ~= ESlateVisibility.HitTestInvisible and Point:SetDoorVisibility("Scale", true) then
        Point:StopAnimation(Point.In)
        Point:PlayAnimation(Point.In)
        Point.PlayForward = true
      end
    elseif Point:GetVisibility() ~= ESlateVisibility.Collapsed then
      if not Point:IsAnimationPlaying(Point.In) or Point.PlayForward then
        Point:StopAnimation(Point.In)
        Point:PlayAnimationReverse(Point.In)
        Point.PlayForward = false
      end
      Point:SetDoorVisibility("Scale", false)
    end
    if Point:GetVisibility() ~= ESlateVisibility.Collapsed then
      local Position = self:TransformWorldLocToUILoc(self.DoorIconLocation[Id].X, self.DoorIconLocation[Id].Y)
      Point:SetRenderTranslation(Position)
    end
  end
end

function Component:OnDoorStateChange(DoorType, ManualItemId)
  if self.ManualItemId2DoorIcon[ManualItemId] then
    self.ManualItemId2DoorIcon[ManualItemId]:UpdateDoor(DoorType)
  end
end

return Component
