require("UnLua")
local Component = {}

function Component:InitComponentCoroutine()
  local Coroutine = CreateCoroutine(self.InitTeleportPoint)
  table.insert(self.InitCoroutines, Coroutine)
  coroutine.resume(Coroutine, self, #self.InitCoroutines)
end

function Component:ClearData()
  if self.TeleportPoints then
    for _, widget in pairs(self.TeleportPoints) do
      widget:RemoveFromParent()
    end
    self.TeleportPoints = {}
  end
end

function Component:InitTeleportPoint(CoroutineIndex)
  self.TeleportPoints = {}
  self.TeleportPointLocation = {}
  self.TeleportPoint2FloorId = {}
  self.TeleportState = {}
  self.TeleportIdToHardBossId = {}
  self.Teleport2LocalPos = {}
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if nil == GameMode or nil == GameMode:GetRegionDataMgrSubSystem() then
    return
  end
  local Avatar = GWorld:GetAvatar()
  local transferDatas = {}
  for _, subRegionID in pairs(self.RegionData.IsRandom) do
    for id, transferData in pairs(DataMgr.TeleportPoint) do
      if transferData.TeleportPointSubRegion == subRegionID and transferData.StaticId then
        transferDatas[transferData.StaticId] = transferData
        local floorId
        if transferData.BuildingNameAndId then
          local name
          name, floorId = self:GetBuildingNameAndId(transferData.BuildingNameAndId)
        end
        floorId = floorId or self.MaxFloorId
        self.TeleportPoint2FloorId[transferData.Id] = floorId
        self.TeleportState[id] = false
      end
    end
  end
  local TmpFullRegionStoreDatas = GameMode:GetRegionDataMgrSubSystem().DataLibrary:GetFullRegionStoreDatas()
  if nil ~= TmpFullRegionStoreDatas then
    for _, RegionBaseData in pairs(TmpFullRegionStoreDatas) do
      local data = transferDatas[RegionBaseData.CreatorId]
      if data then
        local state
        if RegionBaseData.State then
          state = RegionBaseData.State.OpenState
        end
        state = state or false
        self.TeleportState[data.Id] = state
      end
    end
  end
  for _, data in pairs(transferDatas) do
    local point, select = self:NewPointAsync(self.InitCoroutines[CoroutineIndex])
    point:Init(self, data, self.TeleportState[data.Id], self.OnTeleportPointClick, self.OnTeleportHover, self.OnTeleportUnhover)
    local position = self:TransformWorldLocToUILoc(data.MechanismPos[1], data.MechanismPos[2])
    point:SetRenderTranslation(position)
    select:SetRenderTranslation(position)
    self.TeleportPoints[data.Id] = point
    self.TeleportPointLocation[data.Id] = FVector2D(data.MechanismPos[1], data.MechanismPos[2])
    self.SelectWidgetTable[data.Id] = select
    if data.Id == GWorld.GameInstance.TrackingID then
      point:PlayAnimation(point.Loop, 0, 0)
      self:CreateTrackIndicator(point)
    end
  end
  for _, HardBossData in pairs(DataMgr.HardBossMain) do
    local TeleportId = HardBossData.TeleportId
    if TeleportId and not self.TeleportPoints[TeleportId] then
      local data = DataMgr.TeleportPoint[TeleportId]
      local SubRegionId = data.TeleportPointSubRegion
      local RegionId = DataMgr.SubRegion[SubRegionId].RegionId
      if RegionId == self.RegionData.RegionId and Avatar and Avatar:CheckHardBossUnlockCondition(HardBossData.HardBossId) then
        local point, select = self:NewPointAsync(self.InitCoroutines[CoroutineIndex])
        point:Init(self, data, true, self.OnTeleportPointClick, self.OnTeleportHover, self.OnTeleportUnhover)
        point.HardBossId = HardBossData.HardBossId
        local position = self:TransformWorldLocToUILoc(data.MechanismPos[1], data.MechanismPos[2])
        point:SetRenderTranslation(position)
        select:SetRenderTranslation(position)
        self.TeleportIdToHardBossId[data.Id] = HardBossData.HardBossId
        self.TeleportPoints[data.Id] = point
        self.TeleportState[data.Id] = true
        self.TeleportPointLocation[data.Id] = FVector2D(data.MechanismPos[1], data.MechanismPos[2])
        self.SelectWidgetTable[data.Id] = select
        local floorId
        if data.BuildingNameAndId then
          local name
          name, floorId = self:GetBuildingNameAndId(data.BuildingNameAndId)
        end
        floorId = floorId or self.MaxFloorId
        self.TeleportPoint2FloorId[data.Id] = floorId
      end
    end
  end
  local UIUnlockRuleId = DataMgr.UIUnlockRule.HardBoss.UIUnlockRuleId
  if Avatar then
    local bUnlocked = Avatar:CheckUIUnlocked(UIUnlockRuleId)
    if bUnlocked then
      for TeleportId, HardBossId in pairs(self.TeleportIdToHardBossId) do
        if self.TeleportPoint2FloorId[TeleportId] == self.MaxFloorId then
          self.TeleportPoints[TeleportId]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        end
      end
    end
  end
  self:InitCoroutineCheck(CoroutineIndex)
end

function Component:ShowFloor_Component(FloorId)
  for id, teleportPoint in pairs(self.TeleportPoints) do
    teleportPoint:SetFloor(self.TeleportPoint2FloorId[id] - FloorId)
  end
end

function Component:OnScaleChange_Component(Percent)
  local TrackingID = GWorld.GameInstance.TrackingID
  local Visible = self:GetMapIconVisible("UI_TELEPORTPOINT", Percent)
  local BossVisible = self:GetMapIconVisible("UI_BOSS", Percent)
  for id, point in pairs(self.TeleportPoints) do
    local thisVisible = DataMgr.TeleportPoint[id] and Visible or BossVisible
    if thisVisible or id == self.CurrentConveyId or id == TrackingID then
      if (point:GetVisibility() ~= ESlateVisibility.SelfHitTestInvisible or not point.PlayForward) and point:SetPointVisibility("Scale", true) then
        point:StopAnimation(point.In)
        point:PlayAnimation(point.In)
        point.PlayForward = true
      end
    elseif point:GetVisibility() ~= ESlateVisibility.Collapsed or point.PlayForward then
      if not point:IsAnimationPlaying(point.In) or point.PlayForward then
        point:StopAnimation(point.In)
        point:PlayAnimationReverse(point.In)
        point.PlayForward = false
      end
      point:SetPointVisibility("Scale", false)
    end
    if point:GetVisibility() ~= ESlateVisibility.Collapsed then
      local position = self:TransformWorldLocToUILoc(self.TeleportPointLocation[id].X, self.TeleportPointLocation[id].Y)
      point:SetRenderTranslation(position)
      self.SelectWidgetTable[id]:SetRenderTranslation(position)
    end
  end
end

function Component:CheckIsAnyTeleporPointUnlock(InSubRegionId, IsInAllSubRegion)
  local RegionId = DataMgr.SubRegion[InSubRegionId].RegionId
  local RegionData = DataMgr.Region[RegionId]
  if not RegionData then
    return
  end
  local TempTransferDatas = {}
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  for _, TransferData in pairs(DataMgr.TeleportPoint) do
    if IsInAllSubRegion then
      if CommonUtils.HasValue(RegionData.IsRandom, TransferData.TeleportPointSubRegion) and TransferData.StaticId then
        TempTransferDatas[TransferData.StaticId] = TransferData
      end
    elseif TransferData.TeleportPointSubRegion == InSubRegionId and TransferData.StaticId then
      TempTransferDatas[TransferData.StaticId] = TransferData
    end
  end
  local TmpFullRegionStoreDatas = GameMode:GetRegionDataMgrSubSystem().DataLibrary:GetFullRegionStoreDatas()
  if nil ~= TmpFullRegionStoreDatas then
    for _, RegionBaseData in pairs(TmpFullRegionStoreDatas) do
      local Data = TempTransferDatas[RegionBaseData.CreatorId]
      if Data then
        local State = false
        if RegionBaseData.State then
          State = RegionBaseData.State.OpenState
        end
        if State then
          return true
        end
      end
    end
  end
  return false
end

function Component:GetTeleportLocalPos()
  for Id, Point in pairs(self.TeleportPoints) do
    if not self.TeleportIdToHardBossId[Id] then
      local LocalPos, Result = self:GetWidgetLocalPos(Point)
      if Result then
        self.Teleport2LocalPos[Id] = LocalPos
      end
    end
  end
end

function Component:OnTeleportPointClick(Id)
  self.CurrentConveyId = nil
  local data = DataMgr.TeleportPoint[Id]
  if not data or not self:CheckControlPriority_Normal() then
    return
  end
  self:ClosePanel(true)
  if self.CurrentSelectPoint and self.TeleportPoints[Id] then
    self.CurrentSelectPoint:PlayAnimation(self.CurrentSelectPoint.NormalAni)
    self.CurrentSelectPoint.IsSelected = false
    self.CurrentSelectPoint.Slot:SetZOrder(0)
  end
  if not self:CheckSelect(self.TeleportPoints[Id]) then
    return
  end
  self.CurrentSelectPoint = self.TeleportPoints[Id]
  self.CurrentSelectPoint.Slot:SetZOrder(20)
  self.SelectWidgetTable[Id]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.SelectWidgetTable[Id]:PlayAnimation(self.SelectWidgetTable[Id].Click)
  if self.ClickedSelectWidget then
    self.ClickedSelectWidget:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.ClickedSelectWidget = self.SelectWidgetTable[Id]
  self.CurrentConveyId = Id
  if self.TeleportIdToHardBossId[self.CurrentConveyId] then
    self.TureHardBoss_MapTips:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.TureHardBoss_MapTips:RefreshMapTips(self.TeleportIdToHardBossId[self.CurrentConveyId])
    local floorId = self.TeleportPoint2FloorId[data.Id]
    if floorId then
      self:OnFloorBtnClicked(floorId, true)
    end
    self.TureHardBoss_MapTips:SetFocus()
  else
    self.LevelMap_Convey_Widget_PC.Btn_Go:UnBindEventOnClickedByObj(self)
    self.LevelMap_Convey_Widget_PC.Btn_Go:BindEventOnClicked(self, self.OnConveyClicked)
    self.LevelMap_Convey_Widget_PC:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.LevelMap_Convey_Widget_PC:PlayAnimation(self.LevelMap_Convey_Widget_PC.Auto_In)
    self.LevelMap_Convey_Widget_PC.Text_Name:SetText(GText(data.TeleportPointName))
    self.LevelMap_Convey_Widget_PC.Text_Describe:SetText(GText(data.TeleportPointDes))
    self.LevelMap_Convey_Widget_PC.Img_GuidePoint_Icon:SetBrushFromTexture(self.CurrentSelectPoint.Img_Point.Brush.ResourceObject)
    if self.TeleportState[data.Id] or Const.UnlockRegionTeleport then
      self.LevelMap_Convey_Widget_PC.Lock:SetVisibility(ESlateVisibility.Collapsed)
      self.LevelMap_Convey_Widget_PC.Switch_Button:SetActiveWidgetIndex(0)
      local Dungeons = self:CheckTempleAndPartyInfo(data.Id)
      if nil ~= Dungeons and #Dungeons > 0 then
        self.LevelMap_Convey_Widget_PC.Group_Temple:SetVisibility(self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad and ESlateVisibility.HitTestInvisible or ESlateVisibility.SelfHitTestInvisible)
        self.LevelMap_Convey_Widget_PC:InitialTempleAndPartyInfo(Dungeons, self.CurrentSelectPoint.Img_Point.Brush.ResourceObject, self.RegionIcon)
      end
    else
      self.LevelMap_Convey_Widget_PC.Lock:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.LevelMap_Convey_Widget_PC.Switch_Button:SetActiveWidgetIndex(1)
    end
    local floorId = self.TeleportPoint2FloorId[data.Id]
    if floorId then
      self:OnFloorBtnClicked(floorId, true)
    end
  end
  self:OnPanelOpen(2)
  if GWorld.GameInstance.TrackingID ~= self.CurrentConveyId then
    self.LevelMap_Convey_Widget_PC.Btn_Track:SetText(GText("UI_RegionMap_Track"))
    self.LevelMap_Convey_Widget_PC.Btn_Track.Img_Track:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Static/Atlas/Common/T_Com_IconTrack.T_Com_IconTrack"))
    self.LevelMap_Convey_Widget_PC.Btn_Track.Img_Track:SetBrushTintColor(UE4.UUIFunctionLibrary.StringToSlateColor("E1B454"))
  else
    self.LevelMap_Convey_Widget_PC.Btn_Track:SetText(GText("UI_RegionMap_Untrack"))
    self.LevelMap_Convey_Widget_PC.Btn_Track.Img_Track:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Static/Atlas/Common/T_Com_IconNo.T_Com_IconNo"))
    self.LevelMap_Convey_Widget_PC.Btn_Track.Img_Track:SetBrushTintColor(UE4.UUIFunctionLibrary.StringToSlateColor("BD4545"))
  end
  self:MoveMapToTelepoint(Id)
  self.LevelMap_Convey_Widget_PC:SetFocus()
end

function Component:OnConveyClicked()
  if not self.TeleportState[self.CurrentConveyId] and not Const.UnlockRegionTeleport then
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_TELEPORTPOINT_UNLOCK"))
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_click_enter_level", "", nil)
  if self.CurrentConveyId and not self.IsConveyClicked then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    local Avatar = GWorld:GetAvatar()
    local data = DataMgr.TeleportPoint[self.CurrentConveyId]
    if Avatar and GameMode and data then
      self.MainMap:BindToAnimationFinished(self.MainMap.Auto_Out, function()
        GameMode:HandleLevelDeliver(UE4.EModeType.ModeRegion, data.TeleportPointSubRegion, data.TeleportPointPos, nil, true, true)
      end)
      self.MainMap:Close()
      self.IsConveyClicked = true
    end
  end
end

function Component:OnTraceSound()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", "", nil)
end

function Component:OnConveyTrace()
  if self.CurrentConveyId then
    if GWorld.GameInstance.TrackingID ~= self.CurrentConveyId then
      if GWorld.GameInstance.TrackingID then
        local TrackingID = GWorld.GameInstance.TrackingID
        local trackTarget = self.MarkTable[TrackingID] or self.TeleportPoints[TrackingID] or self.RegionPoints[TrackingID]
        if trackTarget then
          EventManager:FireEvent(EventID.OnCommonTrack, TrackingID, false)
          trackTarget:StopAllAnimations()
        end
      end
      EventManager:FireEvent(EventID.OnCommonTrack, self.CurrentConveyId, true)
      self.CurrentSelectPoint:PlayAnimation(self.CurrentSelectPoint.Loop, 0, 0)
      GWorld.GameInstance.TrackingID = self.CurrentConveyId
      self:CreateTrackIndicator(self.CurrentSelectPoint)
    else
      EventManager:FireEvent(EventID.OnCommonTrack, self.CurrentConveyId, false)
      self.CurrentSelectPoint:StopAllAnimations()
      GWorld.GameInstance.TrackingID = nil
      self:RemoveTrackIndicator()
    end
  end
  self:ClosePanel(false)
end

function Component:OnTeleportHover(Id)
  if self.TeleportPoints[Id] and self.SelectWidgetTable[Id] ~= self.ClickedSelectWidget then
    self.SelectWidgetTable[Id]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.SelectWidgetTable[Id]:PlayAnimation(self.SelectWidgetTable[Id].Hover)
  end
end

function Component:OnTeleportUnhover(Id)
  if self.TeleportPoints[Id] and self.SelectWidgetTable[Id] ~= self.ClickedSelectWidget then
    self.SelectWidgetTable[Id]:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function Component:ShowHardBoss(bShow)
  for Id, _ in pairs(self.TeleportIdToHardBossId) do
    self.TeleportPoints[Id]:SetVisibility(bShow and ESlateVisibility.SelfHitTestInvisible or ESlateVisibility.Collapsed)
  end
end

function Component:CheckTempleAndPartyInfo(Id)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    error("Avatar is nil")
  end
  local Dungeons = {}
  local UIUnlockRule = DataMgr.UIUnlockRule
  local TempleRuleId = UIUnlockRule.Temple.UIUnlockRuleId
  local bTempleUnlocked = Avatar:CheckUIUnlocked(TempleRuleId)
  if bTempleUnlocked and DataMgr.TeleportPoint[Id] and DataMgr.TeleportPoint[Id].Temples ~= nil then
    for _, Id in ipairs(DataMgr.TeleportPoint[Id].Temples) do
      table.insert(Dungeons, Id)
    end
  end
  return Dungeons
end

return Component
