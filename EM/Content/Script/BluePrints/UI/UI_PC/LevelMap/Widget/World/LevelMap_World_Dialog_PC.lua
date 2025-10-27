require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")

function M:Construct()
  self.Overridden.Construct(self)
  self.DeviceInPc = CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile"
  self:InitAreaList()
  self.RealMousePos = FVector2D(0, 0)
  self.SelectBtnIdx = 0
end

function M:Init(RootPage)
  self.RootPage = RootPage
  self:InitAreaBtn()
  self:InitAllAreaName()
end

function M:Tick(MyGeometry, InDeltaTime)
  self.Overridden.Tick(self, MyGeometry, InDeltaTime)
  if not self.RootPage or self.RootPage.ReturnHomePop or self.RootPage.HasOpenWildMap then
    return
  end
  self:GetMouseLocal()
end

function M:InitAreaList()
  local NameList = self.Panel_AreaName:GetAllChildren()
  self.AreaNameList = {}
  for i, v in pairs(NameList) do
    table.insert(self.AreaNameList, {
      NameWidget = v,
      Used = false,
      MapDataId = 1
    })
  end
  local RegionNameList = self.Panel_RegionName:GetAllChildren()
  self.RegionNameList = {}
  for i, v in pairs(RegionNameList) do
    table.insert(self.RegionNameList, {
      NameWidget = v,
      Used = false,
      MapDataId = 1
    })
  end
end

function M:InitAreaBtn()
  if self.DeviceInPc then
    self.Btn_Mouse:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Btn_Mouse:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self:SetVisibility(UE4.ESlateVisibility.Visible)
  end
end

function M:InitAllAreaName()
  local TrackingQuestWorldMapId = TaskUtils:GetTrackingQuestMapInfo()
  self.NowHover = false
  local WorldMapDatas = DataMgr.WorldMap
  for i, AreaName in pairs(self.AreaNameList) do
    AreaName.Used = false
  end
  for i, WorldMapData in pairs(WorldMapDatas) do
    self:InitArea(i, WorldMapData, TrackingQuestWorldMapId)
  end
  for i, AreaName in pairs(self.AreaNameList) do
    if not AreaName.Used then
      self:LockRegion(i)
    end
  end
end

function M:InitArea(TableIndex, WorldMapData, TrackingQuestWorldMapId)
  local UIIndex = WorldMapData.UIIndex
  assert(TableIndex <= #self.AreaNameList, "\232\161\168\229\134\133\229\156\176\229\155\190\231\130\185\228\189\141\230\149\176\233\135\143\232\182\133\232\191\135\232\147\157\229\155\190\229\134\133\233\162\132\231\149\153\230\149\176\233\135\143\239\188\140\232\129\148\231\179\187\232\147\157\229\155\190\230\183\187\229\138\160\239\188\140\232\147\157\229\155\190\229\134\133\230\149\176\233\135\143\239\188\154" .. #self.AreaNameList)
  local AreaName = self.AreaNameList[UIIndex].NameWidget
  if not self:CheckRegionUnLocked(TableIndex) then
    self:LockRegion(UIIndex)
  else
    self:UnLockRegion(UIIndex)
  end
  AreaName:Init({
    UIIndex = UIIndex,
    Used = self.AreaNameList[UIIndex].Used,
    WorldMapData = WorldMapData,
    RootPage = self
  })
  if self.AreaNameList[UIIndex].Used then
    assert(nil, "\228\184\150\231\149\140\229\156\176\229\155\190\231\154\132UIIndex\230\156\137\233\135\141\229\164\141\239\188\140\233\135\141\229\164\141\230\149\176\229\128\188\239\188\154" .. UIIndex)
  end
  self.AreaNameList[UIIndex].Used = true
  self.AreaNameList[UIIndex].MapDataId = WorldMapData.WorldMapId
  AreaName.Text_Name:SetText(GText(WorldMapData.WorldMapName))
  AreaName.Text_WorldText:SetText(EnText(WorldMapData.WorldMapName))
  AreaName.Text_CL:SetText(GText("UI_WORLDMAP_CURRENTLOCATION"))
  if self:CheckCurrentRegionId(WorldMapData.WorldMapId) then
    AreaName:PlayAnimation(AreaName.CurrentPosition_In)
  else
    AreaName:PlayAnimation(AreaName.CurrentPosition_Out)
  end
  local RegionUIIndex = WorldMapData.RegionUIIndex
  if RegionUIIndex and WorldMapData.RegionName then
    self.RegionNameList[RegionUIIndex].NameWidget:SetText(GText(WorldMapData.RegionName))
  end
  local IsInEXRegion = TaskUtils:CheckTaskIsInEXRegion()
  local Info = TaskUtils:GetTrackingQuestDetailInfo()
  if Info and Info.IsFairyLand then
    AreaName.HB_AreaDesc:SetVisibility(UE4.ESlateVisibility.Collapsed)
    AreaName.Panel_GuidePoint:SetVisibility(UE4.ESlateVisibility.Collapsed)
    AreaName.GuidePoint:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif IsInEXRegion and self.RootPage.MapRegionType == "EX" then
    if UIIndex == TrackingQuestWorldMapId then
      AreaName.HB_AreaDesc:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      AreaName.Panel_GuidePoint:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      AreaName.GuidePoint:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      local IconTexture = TaskUtils:GetIconTextureByTrackQuestChainType()
      if IconTexture then
        AreaName.GuidePoint.Img_GuidePoint_Icon:SetBrushResourceObject(IconTexture)
      end
      AreaName.Text_AreaDesc:SetText(GText("UI_QUEST_MAP"))
    else
      AreaName.HB_AreaDesc:SetVisibility(UE4.ESlateVisibility.Collapsed)
      AreaName.Panel_GuidePoint:SetVisibility(UE4.ESlateVisibility.Collapsed)
      AreaName.GuidePoint:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  elseif not IsInEXRegion and self.RootPage.MapRegionType == "Now" then
    if UIIndex == TrackingQuestWorldMapId then
      AreaName.HB_AreaDesc:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      AreaName.Panel_GuidePoint:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      AreaName.GuidePoint:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      local IconTexture = TaskUtils:GetIconTextureByTrackQuestChainType()
      if IconTexture then
        AreaName.GuidePoint.Img_GuidePoint_Icon:SetBrushResourceObject(IconTexture)
      end
      AreaName.Text_AreaDesc:SetText(GText("UI_QUEST_MAP"))
    else
      AreaName.HB_AreaDesc:SetVisibility(UE4.ESlateVisibility.Collapsed)
      AreaName.Panel_GuidePoint:SetVisibility(UE4.ESlateVisibility.Collapsed)
      AreaName.GuidePoint:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  else
    AreaName.HB_AreaDesc:SetVisibility(UE4.ESlateVisibility.Collapsed)
    AreaName.Panel_GuidePoint:SetVisibility(UE4.ESlateVisibility.Collapsed)
    AreaName.GuidePoint:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:LockRegion(Index)
  self.AreaNameList[Index].NameWidget:SetVisibility(ESlateVisibility.Collapsed)
end

function M:UnLockRegion(Index)
  self.AreaNameList[Index].NameWidget:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end

function M:OnDragMap()
  self.bCanDragMap = true
end

function M:OnStopDragMap()
  self.HasMoved = false
  self.bCanDragMap = false
end

function M:UpdateMapOffset(DeltaLoc)
  if not self.bCanDragMap then
    return
  end
end

function M:OnMouseMove(MyGeometry, MouseEvent)
  local DeltaLoc = UE4.UKismetInputLibrary.PointerEvent_GetCursorDelta(MouseEvent)
  if self.bCanDragMap and not UE4.UKismetMathLibrary.EqualEqual_Vector2DVector2D(DeltaLoc, UE4.UKismetMathLibrary.Vector2D_Zero(), 0.001) then
    self:UpdateMapOffset(DeltaLoc)
  end
  local MouseViewPortPos = UE4.UWidgetLayoutLibrary.GetMousePositionOnViewport(self)
  local ViewportPos = FVector2D(0, 0)
  UE4.USlateBlueprintLibrary.LocalToViewport(self, self.CanvasPanel_20:GetCachedGeometry(), FVector2D(0, 0), nil, ViewportPos)
  local Size = UWidgetLayoutLibrary.GetViewportSize(self)
  local Scale = UWidgetLayoutLibrary.GetViewportScale(self)
  self.NewPosition = MouseViewPortPos - ViewportPos - Size / Scale / 2
  local Slot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.VX_MouseGlow)
  Slot:SetPosition(self.NewPosition)
  if self.HoverBtnIdx == nil then
    local Slot1 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Select)
    Slot1:SetPosition(self.NewPosition)
    self.Select:StopAnimation(self.Select.Hover)
    self.Select:PlayAnimation(self.Select.Normal)
  end
  local Handled = UE4.UWidgetBlueprintLibrary.Handled()
  return Handled
end

function M:OnMouseButtonDown(MyGeometry, MouseEvent)
  if UKismetInputLibrary.PointerEvent_IsMouseButtonDown(MouseEvent, EKeys.LeftMouseButton) then
    self:OnDragMap()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnMouseButtonUp(MyGeometry, MouseEvent)
  self:OnStopDragMap()
  if self.HasMoved then
    return
  end
  if 0 == self.SelectBtnIdx then
    return
  end
  self:OnClickArea(self.AreaNameList[self.SelectBtnIdx].MapDataId)
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnItemHover()
  local NameWidget = self.AreaNameList[self.HoverBtnIdx].NameWidget
  local Pos = FVector2D(0, 0)
  UE4.USlateBlueprintLibrary.LocalToViewport(self, NameWidget:GetCachedGeometry(), FVector2D(0, 0), nil, Pos)
  if self.Select then
    local selectSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Select)
    if selectSlot then
      local ViewportPos = FVector2D(0, 0)
      UE4.USlateBlueprintLibrary.LocalToViewport(self, self.CanvasPanel_20:GetCachedGeometry(), FVector2D(0, 0), nil, ViewportPos)
      local Size = UWidgetLayoutLibrary.GetViewportSize(self)
      local Scale = UWidgetLayoutLibrary.GetViewportScale(self)
      local Position = Pos - ViewportPos - Size / Scale / 2
      local NameWidgetSize = NameWidget:GetDesiredSize()
      Position.X = Position.X + NameWidgetSize.X / 2
      Position.Y = Position.Y + NameWidgetSize.Y / 2
      selectSlot:SetPosition(Position)
      self.Select:StopAnimation(self.Select.Normal)
      self.Select:PlayAnimation(self.Select.Hover)
    end
  end
end

function M:OnItemUnhover()
  self.Select:StopAnimation(self.Select.Hover)
  self.Select:PlayAnimation(self.Select.Normal)
end

function M:OnTouchStarted(MyGeometry, InTouchEvent)
  if self.DeviceInPc then
    return
  end
  local Coordinate = UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(InTouchEvent)
  local _, ViewportPosition = USlateBlueprintLibrary.AbsoluteToViewport(self, Coordinate)
  self.RealMousePos = ViewportPosition
  self:OnDragMap(ViewportPosition)
  local UnHandled = UE4.UWidgetBlueprintLibrary.UnHandled()
  return UnHandled
end

function M:OnTouchMoved(MyGeometry, InTouchEvent)
  if self.DeviceInPc then
    return
  end
  local Coordinate = UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(InTouchEvent)
  local _, ViewportPosition = USlateBlueprintLibrary.AbsoluteToViewport(self, Coordinate)
  self.RealMousePos = ViewportPosition
  local UnHandled = UE4.UWidgetBlueprintLibrary.UnHandled()
  return UnHandled
end

function M:OnTouchEnded(MyGeometry, InTouchEvent)
  if self.DeviceInPc then
    return
  end
  local UnHandled = UE4.UWidgetBlueprintLibrary.UnHandled()
  if self.RootPage.HasMoved then
    self:OnStopDragMap()
    return UnHandled
  end
  if 0 == self.SelectBtnIdx then
    return UnHandled
  end
  self:OnClickArea(self.AreaNameList[self.SelectBtnIdx].MapDataId)
  self.SelectBtnIdx = 0
  return UnHandled
end

function M:GetSelectImage()
  if self.RealMousePos == false then
    return
  end
  for i, NameWidget in pairs(self.AreaNameList) do
    local Slot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(NameWidget)
    local Size = Slot:GetSize()
    local Pos = FVector2D(0, 0)
    UE4.USlateBlueprintLibrary.LocalToViewport(self, NameWidget:GetCachedGeometry(), FVector2D(0, 0), nil, Pos)
    local Rate = (self.RealMousePos - Pos) / Size
    if Rate.X < 1 and Rate.Y < 1 then
      self.SelectBtnIdx = i
      self:OnHoveredArea(self.HoverAreaList[i])
      return
    end
  end
  self:HideHover()
  self.SelectBtnIdx = 0
end

function M:GetMouseLocal()
  if self.DeviceInPc then
    self.RealMousePos = UE4.UWidgetLayoutLibrary.GetMousePositionOnViewport(self)
  end
end

function M:HideWorldMap()
  if 3 == self:GetVisibility() then
    return
  end
  self:StopAnimation(self.In)
  self:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  self:PlayAnimation(self.Out)
end

function M:ShowWorldMap()
  if 0 == self:GetVisibility() then
    return
  end
  self:StopAnimation(self.Out)
  self:PlayAnimation(self.In)
  self:SetVisibility(UE4.ESlateVisibility.Visible)
end

function M:HideHover()
  for i, Hover in pairs(self.HoverAreaList) do
    if Hover == self.NowHover then
      self.AreaNameList[i].NameWidget:StopAnimation(self.AreaNameList[i].NameWidget.Hover)
      self:StopAnimation(self["Hover_" .. string.format("%02d", i)])
      self:PlayAnimation(self["Normal_" .. string.format("%02d", i)])
      Hover:SetRenderOpacity(0.4)
      UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self["Panel_Area" .. string.format("%02d", i)]):SetZOrder(0)
      break
    end
  end
  self.NowHover = false
end

function M:OnHoveredArea(AreaHover)
  if not self.DeviceInPc then
    return
  end
  if self.NowHover == AreaHover then
    return
  end
  self:HideHover()
  self.AreaNameList[self.SelectBtnIdx].NameWidget:StopAnimation(self.AreaNameList[self.SelectBtnIdx].NameWidget.Normal)
  self:StopAnimation(self["Normal_" .. string.format("%02d", self.SelectBtnIdx)])
  self:PlayAnimation(self["Hover_" .. string.format("%02d", self.SelectBtnIdx)])
  UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self["Panel_Area" .. string.format("%02d", self.SelectBtnIdx)]):SetZOrder(1)
  self.NowHover = AreaHover
  local NameWidget = self.AreaNameList[self.SelectBtnIdx].NameWidget
  local Pos = FVector2D(0, 0)
  UE4.USlateBlueprintLibrary.LocalToViewport(self, NameWidget:GetCachedGeometry(), FVector2D(0, 0), nil, Pos)
  if self.Select then
    local selectSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Select)
    if selectSlot then
      local ViewportPos = FVector2D(0, 0)
      UE4.USlateBlueprintLibrary.LocalToViewport(self, self.CanvasPanel_20:GetCachedGeometry(), FVector2D(0, 0), nil, ViewportPos)
      local Size = UWidgetLayoutLibrary.GetViewportSize(self)
      local Scale = UWidgetLayoutLibrary.GetViewportScale(self)
      local Position = Pos - ViewportPos - Size / Scale / 2
      local NameWidgetSize = NameWidget:GetDesiredSize()
      Position.X = Position.X + NameWidgetSize.X / 2
      Position.Y = Position.Y + NameWidgetSize.Y / 2
      selectSlot:SetPosition(Position)
      self.Select:StopAnimation(self.Select.Normal)
      self.Select:PlayAnimation(self.Select.Hover)
    end
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_hover_level", "", nil)
end

function M:OnClickArea(AreaIdx)
  print(_G.LogTag, "LXZ OnClickArea", AreaIdx)
  local MainRegionData
  for i, v in pairs(DataMgr.WorldMap[AreaIdx].WorldMapRegion) do
    local RegionMapData = DataMgr.RegionMap[v]
    if RegionMapData.MainRegionMap == true then
      MainRegionData = RegionMapData
    end
  end
  local FirstRegionMapId = DataMgr.WorldMap[AreaIdx].WorldMapRegion[1]
  local MainRegionId = DataMgr.RegionMap[FirstRegionMapId].RegionId
  if MainRegionData then
    MainRegionId = MainRegionData.RegionId
  end
  self.RootPage.CurrentMainRegionId = MainRegionId
  self.RootPage.Tab:SelectTab(2)
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_click_chapter", "", nil)
end

function M:CheckCurrentRegionId(AreaIdx)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local CurrentRegionId = Avatar.CurrentRegionId // 100
  for i, v in pairs(DataMgr.WorldMap[AreaIdx].WorldMapRegion) do
    local RegionMapData = DataMgr.RegionMap[v]
    if RegionMapData.RegionId == CurrentRegionId then
      return true
    end
  end
  return false
end

function M:CheckRegionUnLocked(AreaIdx)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return true
  end
  local ConditionId = DataMgr.WorldMap[AreaIdx].WorldMapUnlockCondition
  local Avatar = GWorld:GetAvatar()
  if not ConditionId or ConditionUtils.CheckCondition(Avatar, ConditionId) or Const.UnlockRegionTeleport then
    return true
  end
  return false
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
end

return M
