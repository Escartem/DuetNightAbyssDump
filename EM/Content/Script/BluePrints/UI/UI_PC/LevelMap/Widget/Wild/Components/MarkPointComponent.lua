require("UnLua")
local Component = {}

function Component:InitComponentCoroutine()
  local Coroutine = CreateCoroutine(self.InitMark)
  table.insert(self.InitCoroutines, Coroutine)
  coroutine.resume(Coroutine, self, #self.InitCoroutines)
end

function Component:AddComponentEvent()
  EventManager:AddEvent(EventID.UpdateMapMark, self, self.UpdateMapMark)
end

function Component:RemoveComponentEvent()
  EventManager:RemoveEvent(EventID.UpdateMapMark, self)
end

function Component:ClearData()
  if self.MarkTable then
    for _, mark in pairs(self.MarkTable) do
      mark:RemoveFromParent()
    end
    self.MarkTable = {}
  end
end

function Component:OpenMark(Mark, Position)
  if not self.MarkPanel then
    self.MarkPanel = NewObject(self.MarkPanelClass, self)
    self.MainMap.Mark:AddChild(self.MarkPanel)
    self.MarkPanel.Parent = self
    self.MarkPanel.Btn_Confirm:TryOverrideSoundFunc(self.OnTraceSound)
    self.MarkPanel.Btn_Track:TryOverrideSoundFunc(self.OnTraceSound)
    self.MarkPanel:SetVisibility(ESlateVisibility.Collapsed)
  end
  if Mark then
    self.CurrentMark = Mark
    for id, tempMark in pairs(self.MarkTable) do
      if tempMark == Mark then
        self.CurrentMarkData = self.MarkData[id]
        self.CurrentMarkUuid = id
        self.MarkPanel:Open(id, self.MarkData[id], GText("UI_RegionMap_Mark"), self.MarkData[id].Type, GWorld.GameInstance.TrackingID == id, self.RegionIcon)
        self:OnPanelOpen(0)
      end
    end
  else
    if self.MarkCount >= self.MaxMarkNum then
      UIManager(self):ShowUITip("CommonToastMain", GText("UI_RegionMap_MaxMark"))
      return
    end
    local mark, select = self:NewPoint()
    FVector2D.Sub(Position, self.ScreenSize)
    mark:SetRenderTranslation(Position)
    select:SetRenderTranslation(Position)
    local Avatar = GWorld:GetAvatar()
    self.CurrentMarkUuid = URuntimeCommonFunctionLibrary.GenerateGUID()
    mark:InitAsMark(self, {
      Id = self.CurrentMarkUuid,
      ImagePath = nil
    }, self.OnMarkClick, self.OnMarkHover, self.OnMarkUnhover)
    self.TempMark = mark
    self.SelectWidgetTable[self.CurrentMarkUuid] = select
    select:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    select:PlayAnimation(select.Click)
    local tempName = GText("UI_RegionMap_Mark")
    self.CurrentMarkData = {
      PositionX = self.TempMark.RenderTransform.Translation.X / self.MapScale.X,
      PositionY = self.TempMark.RenderTransform.Translation.Y / self.MapScale.Y,
      FloorId = self.CurrentFloorId,
      Type = 1
    }
    self.MarkPanel:Open(self.CurrentMarkUuid, self.CurrentMarkData, tempName, nil, GWorld.GameInstance.TrackingID == self.CurrentMarkUuid, self.RegionIcon)
    self:OnPanelOpen(0)
  end
end

function Component:TryDeleteTempMarkAndClose()
  if self.MarkPanel then
    self.MarkPanel:Close(self.TempMark == nil)
  end
  if self.TempMark then
    self.TempMark:RemoveFromParent()
    self.TempMark = nil
    self.SelectWidgetTable[self.CurrentMarkUuid]:RemoveFromParent()
    self.SelectWidgetTable[self.CurrentMarkUuid] = nil
    self.CurrentMarkUuid = nil
    self.CurrentMarkData = {}
  end
end

function Component:DeleteMark()
  if not self.TempMark then
    if GWorld.GameInstance.TrackingID == self.CurrentMarkUuid then
      self:OnMarkTrack()
    end
    for uuid, mark in pairs(self.MarkTable) do
      if mark == self.CurrentMark then
        local Avatar = GWorld:GetAvatar()
        Avatar:DeleteMarkPoint(self.RegionID, uuid)
        self:RemoveTrack(mark)
        self.MarkTable[uuid] = nil
        self.MarkData[uuid] = nil
        mark:RemoveFromParent()
        self.MarkCount = self.MarkCount - 1
        if self.CurrentSelectPoint == mark then
          self.CurrentSelectPoint = nil
        end
        break
      end
    end
  end
  self:ClosePanel()
end

function Component:ChangeMarkType(TypeId, ImagePath)
  local mark = self.TempMark or self.CurrentMark
  if not mark then
    return
  end
  local image = LoadObject(ImagePath)
  mark.Img_Point:SetBrushFromTexture(image)
  mark.Data.ImagePath = ImagePath
  self.CurrentMarkData.Type = TypeId
  if mark == self.TrackTarget then
    self.TrackIndicator:SetIcon(image)
  end
  if mark == self.CurrentMark and self.CurrentMarkData.Type ~= TypeId then
    local Avatar = GWorld:GetAvatar()
    Avatar:UpdateMarkPoint(self.RegionID, self.CurrentMarkUuid, self.CurrentMarkData)
  end
end

function Component:OnMarkConfirm(MarkName)
  if not self.CurrentMarkData then
    return
  end
  self.CurrentMarkData.Name = MarkName
  local Avatar = GWorld:GetAvatar()
  if self.TempMark then
    self.MarkTable[self.CurrentMarkUuid] = self.TempMark
    self.MarkData[self.CurrentMarkUuid] = self.CurrentMarkData
    self.TempMark.Data = {
      Id = self.CurrentMarkUuid,
      ImagePath = self.CurrentMarkData.ImagePath,
      Name = MarkName,
      Type = self.CurrentMarkData.Type
    }
    Avatar:AddMarkPoint(self.RegionID, self.CurrentMarkUuid, self.CurrentMarkData)
    self.MarkCount = self.MarkCount + 1
    self.TempMark = nil
    self.CurrentMarkUuid = nil
    self.CurrentMarkData = {}
  end
  self:ClosePanel()
end

function Component:OnMarkNameConfirm(MarkUuid, MarkData)
  if not (MarkUuid and MarkData) or not self.MarkTable[MarkUuid] then
    return
  end
  self.MarkTable[MarkUuid].Data.Name = MarkData.Name
  local Avatar = GWorld:GetAvatar()
  Avatar:UpdateMarkPoint(self.RegionID, MarkUuid, MarkData)
end

function Component:InitMark(CoroutineIndex)
  self.MarkTable = {}
  self.MarkData = {}
  self.CurrentMark = nil
  self.TempMark = nil
  self.CurrentMarkUuid = nil
  self.CurrentMarkData = {}
  local AsyncMarkCount = 0
  self:AddTimer(0.001, function()
    coroutine.resume(self.InitCoroutines[CoroutineIndex])
  end)
  coroutine.yield()
  local Avatar = GWorld:GetAvatar()
  self.MarkCount = Avatar:GetCurrentMarkCount()
  for regionId, markPoint in pairs(Avatar.MarkPoints) do
    if regionId == self.RegionID then
      for uuid, data in pairs(markPoint.MarkPointData) do
        local mark, select = self:NewPoint(self.InitCoroutines[CoroutineIndex])
        local position = FVector2D(data.PositionX, data.PositionY)
        FVector2D.Mul(position, self.MapScale)
        mark:SetRenderTranslation(position)
        select:SetRenderTranslation(position)
        mark:InitAsMark(self, {
          Id = uuid,
          ImagePath = DataMgr.MapMarkIcon[data.Type].MarkIconPath.Point,
          Name = data.Name
        }, self.OnMarkClick, self.OnMarkHover, self.OnMarkUnhover)
        self.MarkTable[uuid] = mark
        self.MarkData[uuid] = data
        self.SelectWidgetTable[uuid] = select
        if uuid == GWorld.GameInstance.TrackingID then
          mark:PlayAnimation(mark.Loop, 0, 0)
          self:CreateTrackIndicator(mark)
        end
        AsyncMarkCount = AsyncMarkCount + 1
        if 10 == AsyncMarkCount then
          AsyncMarkCount = 0
          self:AddTimer(0.001, function()
            coroutine.resume(self.InitCoroutines[CoroutineIndex])
          end)
          coroutine.yield()
        end
      end
      break
    end
  end
  self:InitCoroutineCheck(CoroutineIndex)
end

function Component:ShowFloor_Component(FloorId)
  for id, mark in pairs(self.MarkTable) do
    mark:SetFloor(self.MarkData[id].FloorId - FloorId)
  end
end

function Component:OnScaleChange_Component(Percent)
  local TrackingID = GWorld.GameInstance.TrackingID
  local Visible = self:GetMapIconVisible("UI_CUSTOMPOINT", Percent)
  if not IsEmptyTable(self.MarkTable) then
    for id, mark in pairs(self.MarkTable) do
      if Visible or self.CurrentMarkUuid == id or id == TrackingID or mark.NewMarkTag then
        if (mark:GetVisibility() ~= ESlateVisibility.SelfHitTestInvisible or not mark.PlayForward) and mark:SetPointVisibility("Scale", true) then
          mark:StopAnimation(mark.In)
          mark:PlayAnimation(mark.In)
          mark.PlayForward = true
        end
      elseif mark:GetVisibility() ~= ESlateVisibility.Collapsed or mark.PlayForward then
        if not mark:IsAnimationPlaying(mark.In) or mark.PlayForward then
          mark:StopAnimation(mark.In)
          mark:PlayAnimationReverse(mark.In)
          mark.PlayForward = false
        end
        mark:SetPointVisibility("Scale", false)
      end
      if mark:GetVisibility() ~= ESlateVisibility.Collapsed then
        local position = FVector2D(self.MarkData[id].PositionX, self.MarkData[id].PositionY)
        FVector2D.Mul(position, self.MapScale)
        mark:SetRenderTranslation(position)
        self.SelectWidgetTable[id]:SetRenderTranslation(position)
      end
    end
  end
  if self.TempMark then
    local position = FVector2D(self.CurrentMarkData.PositionX, self.CurrentMarkData.PositionY)
    FVector2D.Mul(position, self.MapScale)
    self.TempMark:SetRenderTranslation(position)
    self.SelectWidgetTable[self.CurrentMarkUuid]:SetRenderTranslation(position)
  end
end

function Component:OnMarkClick(Uuid)
  if not Uuid or not self.MarkTable[Uuid] then
    return
  end
  if not self:CheckControlPriority_Normal() then
    return
  end
  if self.CurrentSelectPoint and self.CurrentSelectPoint ~= self.MarkTable[Uuid] then
    self.CurrentSelectPoint:PlayAnimation(self.CurrentSelectPoint.NormalAni)
    self.CurrentSelectPoint.IsSelected = false
    self.CurrentSelectPoint.Slot:SetZOrder(0)
  end
  self:ClosePanel(true)
  if not self:CheckSelect(self.MarkTable[Uuid]) then
    return
  end
  self.CurrentSelectPoint = self.MarkTable[Uuid]
  self.CurrentSelectPoint.Slot:SetZOrder(20)
  self:OpenMark(self.MarkTable[Uuid], FVector2D(self.MarkData[Uuid].PositionX, self.MarkData[Uuid].PositionY))
  self.SelectWidgetTable[Uuid]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.SelectWidgetTable[Uuid]:PlayAnimation(self.SelectWidgetTable[Uuid].Click)
  if self.ClickedSelectWidget then
    self.ClickedSelectWidget:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.ClickedSelectWidget = self.SelectWidgetTable[Uuid]
  self:MoveMapToMarkPoint(Uuid)
end

function Component:OnMarkHover(Uuid)
  if not (Uuid and self.MarkTable[Uuid]) or self.ClickedSelectWidget == self.SelectWidgetTable[Uuid] then
    return
  end
  self.SelectWidgetTable[Uuid]:SetRenderTranslation(self.MarkTable[Uuid].RenderTransform.Translation)
  self.SelectWidgetTable[Uuid]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.SelectWidgetTable[Uuid]:PlayAnimation(self.SelectWidgetTable[Uuid].Hover)
end

function Component:OnMarkUnhover(Uuid)
  if not (Uuid and self.MarkTable[Uuid]) or self.ClickedSelectWidget == self.SelectWidgetTable[Uuid] then
    return
  end
  self.SelectWidgetTable[Uuid]:SetVisibility(ESlateVisibility.Collapsed)
end

function Component:UpdateMapMark(RegionId, MarkUuid, MarkData)
  if not self.IsMiniMap or RegionId ~= self.RegionID then
    return
  end
  if MarkData then
    if self.MarkTable[MarkUuid] then
      self.MarkTable[MarkUuid]:InitAsMark(self, {
        Id = MarkUuid,
        ImagePath = DataMgr.MapMarkIcon[MarkData.Type].MarkIconPath.Point,
        Name = MarkData.Name
      })
      self.MarkData[MarkUuid] = MarkData
    else
      local mark, select = self:NewPoint()
      local position = FVector2D(MarkData.PositionX, MarkData.PositionY)
      mark:SetRenderTranslation(position)
      select:SetRenderTranslation(position)
      mark:InitAsMark(self, {
        Id = MarkUuid,
        ImagePath = DataMgr.MapMarkIcon[MarkData.Type].MarkIconPath.Point,
        Name = MarkData.Name
      }, self.OnMarkClick, self.OnMarkHover, self.OnMarkUnhover)
      self.MarkTable[MarkUuid] = mark
      self.MarkData[MarkUuid] = MarkData
      self.SelectWidgetTable[MarkUuid] = select
      if MarkData.FloorId ~= self.CurrentFloorId then
        mark:SetVisibility(ESlateVisibility.Collapsed)
      end
      if GWorld.GameInstance.TrackingID == MarkUuid then
        self:OnCommonTrack(MarkUuid, true)
      end
    end
  elseif self.MarkTable[MarkUuid] then
    self.MarkTable[MarkUuid]:RemoveFromParent()
    self.MarkTable[MarkUuid] = nil
    self.MarkData[MarkUuid] = nil
  end
end

function Component:OnMarkTrack()
  if self.CurrentMark and self.CurrentMarkUuid then
    if GWorld.GameInstance.TrackingID ~= self.CurrentMarkUuid then
      if GWorld.GameInstance.TrackingID then
        local TrackingID = GWorld.GameInstance.TrackingID
        local trackTarget = self.MarkTable[TrackingID] or self.TeleportPoints[TrackingID] or self.RegionPoints[TrackingID]
        if trackTarget then
          EventManager:FireEvent(EventID.OnCommonTrack, TrackingID, false)
          trackTarget:StopAllAnimations()
        end
      end
      EventManager:FireEvent(EventID.OnCommonTrack, self.CurrentMarkUuid, true)
      self.CurrentMark:PlayAnimation(self.CurrentMark.Loop, 0, 0)
      GWorld.GameInstance.TrackingID = self.CurrentMarkUuid
      self:CreateTrackIndicator(self.CurrentMark)
    else
      EventManager:FireEvent(EventID.OnCommonTrack, self.CurrentMarkUuid, false)
      self.CurrentMark:StopAllAnimations()
      GWorld.GameInstance.TrackingID = nil
      self:RemoveTrackIndicator()
    end
  end
  self:ClosePanel(false)
end

return Component
