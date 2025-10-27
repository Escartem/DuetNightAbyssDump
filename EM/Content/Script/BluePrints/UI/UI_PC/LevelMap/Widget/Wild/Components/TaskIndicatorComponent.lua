require("UnLua")
local Component = {}
local GuidePointLocData = require("BluePrints.UI.TaskPanel/QuestGuidePointLocData")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")

function Component:InitComponentCoroutine()
end

function Component:AddComponentEvent()
  EventManager:AddEvent(EventID.UpdateMiniMap, self, self.UpdateMiniMapIndicatorsByStoryNode)
  EventManager:AddEvent(EventID.ChangeIndicatorFloorStyle, self, self.ChangeMiniMapIndicatorsFloorStyle)
end

function Component:RemoveComponentEvent()
  EventManager:RemoveEvent(EventID.UpdateMiniMap, self)
  EventManager:RemoveEvent(EventID.ChangeIndicatorFloorStyle, self)
end

function Component:ClearData()
  if self.TaskArea then
    for _, area in pairs(self.TaskArea) do
      area:RemoveFromParent()
    end
    self.TaskArea = {}
  end
  self:ClearIndicatorWidgets()
  if self.IsMiniMap and not IsEmptyTable(self.IndicatorWidgets) then
    for k, v in pairs(self.IndicatorWidgets) do
      if IsValid(v) then
        self:RemoveTrack(v)
        v:RemoveFromParent()
        if self.MainMap.TracePanel:HasChild(v) then
          self.MainMap.TracePanel:RemoveChild(v)
        end
        if self.Panel_Gamer:HasChild(v) then
          self.Panel_Gamer:RemoveChild(v)
        end
      end
      self.IndicatorWidgets[k] = nil
    end
    self.IndicatorWidgets = {}
  end
end

function Component:ShowFloor_Component(FloorId)
  self:SetMissionIndicatorsWidgetFloorStyle(FloorId)
end

function Component:OnScaleChange_Component(Percent)
  if not IsEmptyTable(self.IndicatorWidgets) then
    local ConstIndicatorScale = 0.5
    for k, v in pairs(self.IndicatorWidgets) do
      local LocationData = self.IndicatorLocations:FindRef(k)
      local UIPos = self:TransformWorldLocToUILoc(LocationData.X, LocationData.Y)
      if IsValid(v) and nil ~= LocationData then
        v:SetRenderTranslation(UIPos)
        if v.Img_Point and v.Img_Point.Visibility == UE4.ESlateVisibility.Collapsed then
          v:SetRenderScale(FVector2D(ConstIndicatorScale, ConstIndicatorScale) * self.MapScale)
        end
      end
      if IsValid(self.SelectWidgetTable[k]) then
        self.SelectWidgetTable[k]:SetRenderTranslation(UIPos)
      end
    end
  end
end

function Component:ClearIndicatorWidgets()
  if not IsEmptyTable(self.IndicatorWidgets) then
    for k, v in pairs(self.IndicatorWidgets) do
      if IsValid(v) and self.Panel_Gamer:HasChild(v) then
        self.Panel_Gamer:RemoveChild(v)
      end
      self:RemoveRegionMapGuidPointIndicator(k)
      self.IndicatorWidgets[k] = nil
    end
  end
  self.IndicatorWidgets = {}
end

function Component:CheckIsTrackingQuest(CurMapRegionId)
  local Info = TaskUtils:GetTrackingQuestDetailInfo()
  local QuestSubRegionMapId
  local IsInEXRegion = false
  local HomeBaseRegionId = Const.HomeBaseSubRegionId
  if Info and Info.IsFairyLand then
    return false
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  if Info and Info.SubRegionId and Info.SubRegionId > 0 then
    QuestSubRegionMapId = Info.SubRegionId
  else
    local CurTrackingQuestChainId = Avatar.TrackingQuestChainId
    if nil == CurTrackingQuestChainId or 0 == CurTrackingQuestChainId then
      return false
    end
    local UIObjs = MissionIndicatorManager:GetIndicatorUIObjByQuestChainIdWithType(CurTrackingQuestChainId, "Task")
    if IsEmptyTable(UIObjs) then
      return false
    end
    for _, v in pairs(UIObjs) do
      local TargetKey = v.GuideInfoCache.PointOrStaticCreatorName
      if TargetKey and GuidePointLocData[TargetKey] and GuidePointLocData[TargetKey].SubRegionId > 0 then
        QuestSubRegionMapId = GuidePointLocData[TargetKey].SubRegionId
        break
      end
      if Const.EnableTaskPrintError then
        ScreenPrint(string.format("CheckIsTrackingQuest: \230\140\135\229\188\149\231\130\185\229\140\186\229\159\159\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168, \228\187\187\229\138\161\229\140\186\229\159\159\228\191\161\230\129\175\232\142\183\229\143\150\229\164\177\232\180\165\239\188\140\232\175\183\230\163\128\230\159\165\229\175\188\229\135\186\230\149\176\230\141\174, \230\140\135\229\188\149\231\130\185: %s", v:GetName()))
      end
      break
    end
  end
  if not (QuestSubRegionMapId and DataMgr.SubRegion[QuestSubRegionMapId] and DataMgr.SubRegion[QuestSubRegionMapId].RegionId and DataMgr.Region[DataMgr.SubRegion[QuestSubRegionMapId].RegionId]) or not DataMgr.Region[DataMgr.SubRegion[QuestSubRegionMapId].RegionId].RegionMapId then
    return false
  end
  if QuestSubRegionMapId == HomeBaseRegionId then
    return false
  end
  local QuestRegionMapId = DataMgr.SubRegion[QuestSubRegionMapId].RegionId
  return QuestRegionMapId and QuestRegionMapId ~= CurMapRegionId
end

function Component:UpdateMiniMapIndicatorsByStoryNode(InUIName, InUIType, OpType)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if not self.IsMiniMap then
    return
  end
  local TrackingQuestChainId = Avatar.TrackingQuestChainId
  if "Delete" == OpType then
    local DelWidget = self.IndicatorWidgets[InUIName]
    if IsValid(DelWidget) and DelWidget then
      self:AddOrDeleteMissionIndicatorArray(false, DelWidget)
      self:RemoveTrack(DelWidget)
      if IsValid(self.MainMap.TracePanel) and self.MainMap.TracePanel:HasChild(DelWidget) then
        self.MainMap.TracePanel:RemoveChild(DelWidget)
      end
      if IsValid(self.Panel_Gamer) and self.Panel_Gamer:HasChild(DelWidget) then
        self.Panel_Gamer:RemoveChild(DelWidget)
      end
      self.IndicatorWidgets[InUIName] = nil
      self:RemoveIndicatorLocation(InUIName)
    end
  elseif "Add" == OpType then
    if 999999 == TrackingQuestChainId then
      return
    end
    local IndicatorWidget = self:CreateIndicatorMiniMapWidget()
    self.IndicatorWidgets[InUIName] = IndicatorWidget
    self:UpdateMiniIndicatorWidgetByType(InUIName, IndicatorWidget, InUIType)
  elseif "Clear" == OpType then
    if not IsEmptyTable(self.IndicatorWidgets) then
      for k, v in pairs(self.IndicatorWidgets) do
        if IsValid(v) then
          self:AddOrDeleteMissionIndicatorArray(false, v)
          self:RemoveTrack(v)
          if IsValid(self.MainMap.TracePanel) and self.MainMap.TracePanel:HasChild(v) then
            self.MainMap.TracePanel:RemoveChild(v)
          end
          if IsValid(self.Panel_Gamer) and self.Panel_Gamer:HasChild(v) then
            self.Panel_Gamer:RemoveChild(v)
          end
        end
        self.IndicatorWidgets[k] = nil
        self:RemoveIndicatorLocation(k)
      end
      self.IndicatorWidgets = {}
    end
  elseif "ChangeRegion" == OpType then
    local ChangeWidget = self.IndicatorWidgets[InUIName]
    if IsValid(ChangeWidget) then
      self:ChangeMissionIndicatorLocationtoSmartPointLoc(InUIName, ChangeWidget)
    end
  end
end

function Component:CreateIndicatorMiniMapWidget()
  local Path = "/Game/UI/UI_PC/Common/Common_GuidePoint_PC.Common_GuidePoint_PC_C"
  local GuidePointWidget = UE4.UWidgetBlueprintLibrary.Create(self, LoadClass(Path))
  return GuidePointWidget
end

function Component:CreateIndicatorRegionMapWidget(InChainId)
  local PointPath = "/Game/UI/WBP/Map/Widget/WBP_Map_Point.WBP_Map_Point"
  local Point = UIManager(self):CreateWidget(PointPath)
  local SelectPath = "/Game/UI/WBP/Map/Widget/WBP_Map_Select.WBP_Map_Select"
  local Select = UIManager(self):CreateWidget(SelectPath)
  local IconTexture = TaskUtils:GetIconTextureByTrackQuestChainType()
  if IconTexture then
    Point.Img_Point:SetBrushResourceObject(IconTexture)
    if DataMgr.QuestChain[InChainId] then
      local CurQuestChainType = DataMgr.QuestChain[InChainId].QuestChainType
      if 3 == CurQuestChainType then
      end
    end
  end
  return Point, Select
end

function Component:UpdateMiniIndicatorWidgetByType(InUIName, Widget, Type)
  if "Task" == Type then
    self:AddTaskMiniMapIndicator(InUIName, Widget)
  elseif "Dynamic" == Type then
    self:AddDynamicMiniMapIndicator(InUIName, Widget)
  elseif "SpecialSide" == Type then
    self:AddSpecialSideMiniMapIndicator(InUIName, Widget)
  end
end

function Component:ChangeMissionIndicatorLocationtoSmartPointLoc(InUIName, InWidget)
  local IndicatorUI = UIManager(self):GetUIObj(InUIName)
  if not IndicatorUI then
    return
  end
  local DelWidget = self.IndicatorWidgets[InUIName]
  if IsValid(DelWidget) and DelWidget then
    self:AddOrDeleteMissionIndicatorArray(false, DelWidget)
    self:RemoveTrack(DelWidget)
    if IsValid(self.MainMap.TracePanel) and self.MainMap.TracePanel:HasChild(DelWidget) then
      self.MainMap.TracePanel:RemoveChild(DelWidget)
    end
    if IsValid(self.Panel_Gamer) and self.Panel_Gamer:HasChild(DelWidget) then
      self.Panel_Gamer:RemoveChild(DelWidget)
    end
    self.IndicatorWidgets[InUIName] = nil
  end
  local IndicatorWidget = self:CreateIndicatorMiniMapWidget()
  self.IndicatorWidgets[InUIName] = IndicatorWidget
  self:UpdateMiniIndicatorWidgetByType(InUIName, IndicatorWidget, "Task")
end

function Component:AddTaskMiniMapIndicator(InUIName, Widget)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local TrackingQuestChainId = Avatar.TrackingQuestChainId
  local TrackingQuestId = 0
  if Avatar.QuestChains[TrackingQuestChainId] then
    TrackingQuestId = Avatar.QuestChains[TrackingQuestChainId].DoingQuestId
  end
  if 0 == TrackingQuestId then
    if Const.EnableTaskPrintError then
      ScreenPrint(string.format("[line:555]\232\191\189\232\184\170\228\187\187\229\138\161\228\184\141\229\173\152\229\156\168\239\188\140\229\176\143\229\156\176\229\155\190\230\140\135\229\188\149\231\130\185\229\138\160\232\189\189\229\164\177\232\180\165, \228\187\187\229\138\161\233\147\190Id: %s", TrackingQuestChainId))
    end
    return
  end
  local Info = TaskUtils:GetQuestDetail(TrackingQuestChainId, TrackingQuestId)
  if Info and Info.IsFairyLand then
    return
  end
  local IndicatorUI = UIManager(self):GetUIObj(InUIName)
  if not IndicatorUI then
    return
  end
  local TargetPointKey, TargetActorKey
  local IsNpcIndicator = IndicatorUI.GuideInfoCache.PointType == "N" or IndicatorUI.GuideInfoCache.PointType == "Npc"
  if IndicatorUI.GuideInfoCache and IndicatorUI.GuideInfoCache.PointName then
    TargetPointKey = IndicatorUI.GuideInfoCache.PointName
  end
  local PointOrStaticKey
  if IndicatorUI.GuideInfoCache and IndicatorUI.GuideInfoCache.PointOrStaticCreatorName then
    PointOrStaticKey = IndicatorUI.GuideInfoCache.PointOrStaticCreatorName
  end
  if nil == GuidePointLocData[TargetPointKey] and nil ~= PointOrStaticKey then
    TargetPointKey = PointOrStaticKey
  end
  if IndicatorUI.IsInTaskRegion == false and IndicatorUI.SmartGuidePointInfo and IndicatorUI.SmartGuidePointInfo[2] then
    TargetPointKey = IndicatorUI.SmartGuidePointInfo[2]
  end
  if nil == GuidePointLocData[TargetPointKey] then
    if Const.EnableTaskPrintError then
      ScreenPrint(string.format("[line:577]\228\187\187\229\138\161\229\176\143\229\156\176\229\155\190\229\156\176\229\155\190\230\140\135\229\188\149\231\130\185\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168, \230\140\135\229\188\149\231\130\185\229\144\141\231\167\176\239\188\154%s", IndicatorUI:GetName()))
    end
    return
  end
  local TempLocation = GuidePointLocData[TargetPointKey]
  local Location = {
    X = 0,
    Y = 0,
    Z = 0,
    R = 0
  }
  local TargetActor
  if IsNpcIndicator then
    TargetActor = self.GameState.NpcCharacterMap:Find(tonumber(IndicatorUI.GuideInfoCache.PointName))
    if nil == TargetActor then
      TargetActor = self:TryToFindGuidePointTarget(TargetPointKey)
    end
  else
    TargetActor = self:TryToFindGuidePointTarget(TargetPointKey)
  end
  if nil ~= TempLocation and nil ~= TargetActor then
    Location.X = TempLocation.X
    Location.Y = TempLocation.Y
    Location.Z = TempLocation.Z
    Location.R = TempLocation.R or 0
  end
  if nil == TargetActor then
    return
  end
  local TaskWorldMapRegionId = GuidePointLocData[TargetPointKey].SubRegionId
  if not TaskWorldMapRegionId then
    if Const.EnableTaskPrintError then
      ScreenPrint(string.format("[line:601]\228\187\187\229\138\161\229\176\143\229\156\176\229\155\190\229\156\176\229\155\190\230\140\135\229\188\149\231\130\185\229\140\186\229\159\159\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168, \230\140\135\229\188\149\231\130\185\229\144\141\231\167\176\239\188\154%s", TargetPointKey))
    end
    return
  end
  local IconTexture = TaskUtils:GetIconTextureByTrackQuestChainType()
  if IconTexture then
    Widget.Img_GuidePoint_Icon:SetBrushResourceObject(IconTexture)
    if DataMgr.QuestChain[TrackingQuestChainId] then
      local CurQuestChainType = DataMgr.QuestChain[TrackingQuestChainId].QuestChainType
      if 3 == CurQuestChainType then
      end
    end
  end
  if nil ~= Location.R and Location.R > 0 then
    self.Panel_Gamer:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.WS_Indoor:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if IsValid(self.Panel_Gamer) then
      self.Panel_Gamer:AddChild(Widget)
    end
    Widget.RenderTransform.Scale.X = self.MainMap.TracePanel.RenderTransform.Scale.X * 0.75
    Widget.RenderTransform.Scale.Y = self.MainMap.TracePanel.RenderTransform.Scale.Y * 0.75
  elseif IsValid(self.MainMap.TracePanel) then
    self.MainMap.TracePanel:AddChild(Widget)
  end
  self:SetIndicatorRangeMaterial(Widget, TrackingQuestChainId, false)
  self:SetIndicatorLoopColor(Widget, TrackingQuestChainId)
  local GuidePointSlot = Widget.Slot
  
  local function AdjustSlot(GuidePointSlot)
    GuidePointSlot:SetAlignment(FVector2D(0.5, 0.5))
    GuidePointSlot:SetAutoSize(true)
    local Anchors = FAnchors()
    Anchors.Minimum = FVector2D(0.5, 0.5)
    Anchors.Maximum = FVector2D(0.5, 0.5)
    GuidePointSlot:SetAnchors(Anchors)
    local Offset = FMargin()
    Offset.Left = 0
    Offset.Top = 0
    GuidePointSlot:SetOffsets(Offset)
  end
  
  AdjustSlot(GuidePointSlot)
  Widget:StopAllAnimations()
  self:AddIndicatorLocation(InUIName, Location.X, Location.Y, Location.Z, Location.R)
  self:SetIndicatorsFloorIdByData(Widget, TaskWorldMapRegionId, TargetPointKey)
  self:ChangeMiniMapIndicatorsFloorStyle(Widget)
  self:TrySetDiffGuideIcon(Widget, TrackingQuestChainId, IndicatorUI.GuideInfoCache.QuestNode.Key)
  local LocInUI = self:TransformWorldLocToUILoc(Location.X, Location.Y)
  Widget:SetRenderTranslation(LocInUI)
  local arrow = self.MainMap:NewPointArrow()
  if nil ~= Location.R and Location.R > 0 then
    Widget.Img_GuidePoint_Icon:SetVisibility(UE4.ESlateVisibility.Collapsed)
    Widget.Img_Range:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    Widget.Img_Range.Slot:SetSize(FVector2D(Location.R * 2 * self.Scale, Location.R * 2 * self.Scale))
    Widget:ClearAllFunc()
  else
    if TargetActor.IsNPC and TargetActor:IsNPC() then
      self:AddOrDeleteMissionIndicatorArray(true, Widget)
      self:AddTrack(Widget, arrow, TargetActor)
    else
      self:AddTrack(Widget, arrow, nil)
    end
    Widget:PlayAnimation(Widget.Loop, 0, 0)
  end
  local IsRangeOrPoint = self:CheckIsNeedShowRangeStyleByLocation(Location)
  self:RealChangeRangesGuideInMap(InUIName, IsRangeOrPoint)
end

function Component:AddSpecialSideMiniMapIndicator(InUIName, Widget)
  local TargetPointKey
  for _, Data in pairs(DataMgr.QuestChain) do
    if Data and Data.QuestNpcId == InUIName then
      TargetPointKey = Data.SpecialQuestDisplayName
      break
    end
  end
  if nil == GuidePointLocData[TargetPointKey] then
    if Const.EnableTaskPrintError then
      ScreenPrint(string.format("[line:577]\228\187\187\229\138\161\229\176\143\229\156\176\229\155\190\229\156\176\229\155\190\230\140\135\229\188\149\231\130\185\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168, \230\140\135\229\188\149\231\130\185\229\144\141\231\167\176\239\188\154%s", InUIName))
    end
    return
  end
  local IndicatorUI = UIManager(self):GetUIObj("UnSpecialSide_" .. tostring(InUIName))
  if not IndicatorUI then
    return
  end
  if IndicatorUI.IsInTaskRegion == false and IndicatorUI.SmartGuidePointInfo and IndicatorUI.SmartGuidePointInfo[2] then
    TargetPointKey = IndicatorUI.SmartGuidePointInfo[2]
  end
  local TempLocation = GuidePointLocData[TargetPointKey]
  local Location = {
    X = 0,
    Y = 0,
    Z = 0,
    R = 0
  }
  local TargetActor = self:TryToFindGuidePointTarget(TargetPointKey)
  if nil ~= TempLocation and nil ~= TargetActor then
    Location.X = TempLocation.X
    Location.Y = TempLocation.Y
    Location.Z = TempLocation.Z
    Location.R = TempLocation.R or 0
  end
  if nil == TargetActor then
    return
  end
  local TaskWorldMapRegionId = GuidePointLocData[TargetPointKey].SubRegionId
  if not TaskWorldMapRegionId then
    if Const.EnableTaskPrintError then
      ScreenPrint(string.format("[line:601]\228\187\187\229\138\161\229\176\143\229\156\176\229\155\190\229\156\176\229\155\190\230\140\135\229\188\149\231\130\185\229\140\186\229\159\159\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168, \230\140\135\229\188\149\231\130\185\229\144\141\231\167\176\239\188\154%s", TargetPointKey))
    end
    return
  end
  local IconTexture = LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SpSideMission_Un.T_Gp_SpSideMission_Un")
  if IconTexture then
    Widget.Img_GuidePoint_Icon:SetBrushResourceObject(IconTexture)
  end
  if IsValid(self.MainMap.TracePanel) then
    self.MainMap.TracePanel:AddChild(Widget)
  end
  local GuidePointSlot = Widget.Slot
  
  local function AdjustSlot(GuidePointSlot)
    GuidePointSlot:SetAlignment(FVector2D(0.5, 0.5))
    GuidePointSlot:SetAutoSize(true)
    local Anchors = FAnchors()
    Anchors.Minimum = FVector2D(0.5, 0.5)
    Anchors.Maximum = FVector2D(0.5, 0.5)
    GuidePointSlot:SetAnchors(Anchors)
    local Offset = FMargin()
    Offset.Left = 0
    Offset.Top = 0
    GuidePointSlot:SetOffsets(Offset)
  end
  
  AdjustSlot(GuidePointSlot)
  Widget:StopAllAnimations()
  self:AddIndicatorLocation(InUIName, Location.X, Location.Y, Location.Z, Location.R)
  self:SetIndicatorsFloorIdByData(Widget, TaskWorldMapRegionId, TargetPointKey)
  self:ChangeMiniMapIndicatorsFloorStyle(Widget)
  local LocInUI = self:TransformWorldLocToUILoc(Location.X, Location.Y)
  Widget:SetRenderTranslation(LocInUI)
  local arrow = self.MainMap:NewPointArrow()
  if TargetActor.IsNPC and TargetActor:IsNPC() then
    self:AddOrDeleteMissionIndicatorArray(true, Widget)
    self:AddTrack(Widget, arrow, TargetActor)
  else
    self:AddTrack(Widget, arrow, nil)
  end
end

function Component:TrySetDiffGuideIcon(Widget, InGuidePointChainId, InKey)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local DoingQuestId = Avatar.QuestChains[InGuidePointChainId].DoingQuestId
  local Info = TaskUtils:GetQuestExtraInfo(InGuidePointChainId, DoingQuestId)
  if not Info then
    return
  end
  for _, Data in pairs(Info) do
    if Data.Node and Data.Node.Type == "BranchQuestStartNode" and IsEmptyTable(Data.DiffGuideList) == false then
      for Index, OptionElemts in pairs(Data.DiffGuideList) do
        for _, KeyList in pairs(OptionElemts) do
          for _, KeyData in pairs(KeyList) do
            if Widget.Img_GuidePoint_Icon then
              if KeyData.IsShowOptional and KeyData.TargetIndicatorKey == InKey then
                local IconTexture = TaskUtils:GetOptinalIconTextureByQuestChainType(InGuidePointChainId)
                Widget.Img_GuidePoint_Icon:SetBrushResourceObject(IconTexture)
              elseif KeyData.TargetIndicatorKey == InKey then
                local Content = string.char(string.byte("A") + Index - 1)
                local RetPath = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Digging_" .. Content .. ".T_Gp_Digging_" .. Content
                Widget.Img_GuidePoint_Icon:SetBrushResourceObject(LoadObject(RetPath))
              end
            end
            if Widget.Img_Point then
              if KeyData.IsShowOptional and KeyData.TargetIndicatorKey == InKey then
                local IconTexture = TaskUtils:GetOptinalIconTextureByQuestChainType(InGuidePointChainId)
                Widget.Img_Point:SetBrushResourceObject(IconTexture)
              elseif KeyData.TargetIndicatorKey == InKey then
                local Content = string.char(string.byte("A") + Index - 1)
                local RetPath = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Digging_" .. Content .. ".T_Gp_Digging_" .. Content
                Widget.Img_Point:SetBrushResourceObject(LoadObject(RetPath))
              end
            end
          end
        end
      end
    end
  end
end

function Component:SetIndicatorRangeMaterial(InWidget, TrackQuestChainId, IsDynEvent)
  if not IsValid(InWidget) then
    return
  end
  if InWidget.Img_Range == nil then
    return
  end
  local Material = InWidget.Img_Range:GetDynamicMaterial()
  if not Material then
    return
  end
  if IsDynEvent and InWidget.Color_Dyn_Fill and InWidget.Color_Dyc_Stroke then
    Material:SetVectorParameterValue("Color_Fill", InWidget.Color_Dyn_Fill.SpecifiedColor)
    Material:SetVectorParameterValue("Color_Stroke", InWidget.Color_Dyc_Stroke.SpecifiedColor)
    return
  end
  if DataMgr.QuestChain[TrackQuestChainId] then
    local CurQuestChainType = DataMgr.QuestChain[TrackQuestChainId].QuestChainType
    if (CurQuestChainType == Const.MainQuestChainType or CurQuestChainType == Const.MainActivityQuestChainType) and InWidget.Color_Main_Fill and InWidget.Color_Main_Stroke then
      Material:SetVectorParameterValue("Color_Fill", InWidget.Color_Main_Fill.SpecifiedColor)
      Material:SetVectorParameterValue("Color_Stroke", InWidget.Color_Main_Stroke.SpecifiedColor)
    elseif CurQuestChainType == Const.SideQuestChainType and InWidget.Color_Side_Fill and InWidget.Color_Side_Stroke then
      Material:SetVectorParameterValue("Color_Fill", InWidget.Color_Side_Fill.SpecifiedColor)
      Material:SetVectorParameterValue("Color_Stroke", InWidget.Color_Side_Stroke.SpecifiedColor)
    elseif (CurQuestChainType == Const.SpecialSideQuestChainType or CurQuestChainType == Const.LimTimeQuestChainType) and InWidget.Color_SP_Fill and InWidget.Color_SP_Stroke then
      Material:SetVectorParameterValue("Color_Fill", InWidget.Color_SP_Fill.SpecifiedColor)
      Material:SetVectorParameterValue("Color_Stroke", InWidget.Color_SP_Stroke.SpecifiedColor)
    end
  end
end

function Component:SetIndicatorLoopColor(InWidget, TrackQuestChainId)
  if not IsValid(InWidget) then
    return
  end
  if InWidget.vx_sq01 == nil or nil == InWidget.vx_sq01_2 or nil == InWidget.vx_Light then
    return
  end
  if DataMgr.QuestChain[TrackQuestChainId] then
    local CurQuestChainType = DataMgr.QuestChain[TrackQuestChainId].QuestChainType
    if (CurQuestChainType == Const.MainQuestChainType or CurQuestChainType == Const.MainActivityQuestChainType) and InWidget.Color_Main_Loop then
      InWidget.vx_sq01:SetColorAndOpacity(InWidget.Color_Main_Loop.SpecifiedColor)
      InWidget.vx_sq01_2:SetColorAndOpacity(InWidget.Color_Main_Loop.SpecifiedColor)
      InWidget.vx_Light:SetColorAndOpacity(InWidget.Color_Main_Loop.SpecifiedColor)
    elseif CurQuestChainType == Const.SideQuestChainType and InWidget.Color_Side_Loop then
      InWidget.vx_sq01:SetColorAndOpacity(InWidget.Color_Side_Loop.SpecifiedColor)
      InWidget.vx_sq01_2:SetColorAndOpacity(InWidget.Color_Side_Loop.SpecifiedColor)
      InWidget.vx_Light:SetColorAndOpacity(InWidget.Color_Side_Loop.SpecifiedColor)
    elseif (CurQuestChainType == Const.SpecialSideQuestChainType or CurQuestChainType == Const.LimTimeQuestChainType) and InWidget.Color_SP_Loop then
      InWidget.vx_sq01:SetColorAndOpacity(InWidget.Color_SP_Loop.SpecifiedColor)
      InWidget.vx_sq01_2:SetColorAndOpacity(InWidget.Color_SP_Loop.SpecifiedColor)
      InWidget.vx_Light:SetColorAndOpacity(InWidget.Color_SP_Loop.SpecifiedColor)
    end
  end
end

function Component:AddDynamicMiniMapIndicator(InUIName, Widget)
  local IndicatorUI = UIManager(self):GetUIObj(InUIName)
  if not IndicatorUI then
    return
  end
  local TargetPointKey, TargetActor
  local IsNpcIndicator = IndicatorUI.GuideInfoCache.PointType == "N" or IndicatorUI.GuideInfoCache.PointType == "Npc"
  if IndicatorUI.GuideInfoCache and IndicatorUI.GuideInfoCache.PointName then
    TargetPointKey = IndicatorUI.GuideInfoCache.PointName
  end
  local PointOrStaticKey
  if IndicatorUI.GuideInfoCache and IndicatorUI.GuideInfoCache.PointOrStaticCreatorName then
    PointOrStaticKey = IndicatorUI.GuideInfoCache.PointOrStaticCreatorName
  end
  if nil == GuidePointLocData[TargetPointKey] and nil ~= PointOrStaticKey then
    TargetPointKey = PointOrStaticKey
  end
  local Location = GuidePointLocData[TargetPointKey]
  if nil == TargetPointKey or "" == TargetPointKey or nil == GuidePointLocData[TargetPointKey] then
    if Const.EnableTaskPrintError then
      ScreenPrint(string.format("\229\138\168\230\128\129\228\186\139\228\187\182\229\176\143\229\156\176\229\155\190\230\140\135\229\188\149\231\130\185\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168, \230\140\135\229\188\149\231\130\185\229\144\141\231\167\176 %s:", IndicatorUI:GetName()))
    end
    return
  end
  local IconTexture = LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_DynQuest.T_Gp_DynQuest")
  if IconTexture then
    Widget.Img_GuidePoint_Icon:SetBrushResourceObject(IconTexture)
  end
  if IsNpcIndicator then
    TargetActor = self.GameState.NpcCharacterMap:Find(tonumber(IndicatorUI.GuideInfoCache.PointName))
  end
  if nil ~= Location.R and Location.R > 0 then
    self.Panel_Gamer:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.WS_Indoor:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if IsValid(self.Panel_Gamer) then
      self.Panel_Gamer:AddChild(Widget)
    end
    Widget.RenderTransform.Scale.X = self.MainMap.TracePanel.RenderTransform.Scale.X * 0.75
    Widget.RenderTransform.Scale.Y = self.MainMap.TracePanel.RenderTransform.Scale.Y * 0.75
  elseif IsValid(self.MainMap.TracePanel) then
    self.MainMap.TracePanel:AddChild(Widget)
  end
  self:SetIndicatorRangeMaterial(Widget, nil, true)
  local GuidePointSlot = Widget.Slot
  
  local function AdjustSlot(GuidePointSlot)
    GuidePointSlot:SetAlignment(FVector2D(0.5, 0.5))
    GuidePointSlot:SetAutoSize(true)
    local Anchors = FAnchors()
    Anchors.Minimum = FVector2D(0.5, 0.5)
    Anchors.Maximum = FVector2D(0.5, 0.5)
    GuidePointSlot:SetAnchors(Anchors)
    local Offset = FMargin()
    Offset.Left = 0
    Offset.Top = 0
    GuidePointSlot:SetOffsets(Offset)
  end
  
  AdjustSlot(GuidePointSlot)
  Widget:StopAllAnimations()
  self:AddIndicatorLocation(InUIName, Location.X, Location.Y, Location.Z, Location.R)
  local TargetSubRegionId = GuidePointLocData[TargetPointKey].SubRegionId
  self:SetIndicatorsFloorIdByData(Widget, TargetSubRegionId, TargetPointKey)
  self:ChangeMiniMapIndicatorsFloorStyle(Widget)
  local LocInUI = self:TransformWorldLocToUILoc(Location.X, Location.Y)
  Widget:SetRenderTranslation(LocInUI)
  if nil ~= Location.R and Location.R > 0 then
    Widget.Img_GuidePoint_Icon:SetVisibility(UE4.ESlateVisibility.Collapsed)
    Widget.Img_Range:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    Widget.Img_Range.Slot:SetSize(FVector2D(Location.R * 2 * self.Scale, Location.R * 2 * self.Scale))
    Widget:ClearAllFunc()
  else
    local arrow = self.MainMap:NewPointArrow()
    if TargetActor and TargetActor.IsNPC and TargetActor:IsNPC() then
      self:AddOrDeleteMissionIndicatorArray(true, Widget)
      self:AddTrack(Widget, arrow, TargetActor)
    else
      self:AddTrack(Widget, arrow, nil)
    end
  end
  local IsRangeOrPoint = self:CheckIsNeedShowRangeStyleByLocation(Location)
  self:RealChangeRangesGuideInMap(InUIName, IsRangeOrPoint)
end

function Component:SetMiniMapIsRangeIndicator(InUIName, IsAdd)
  local IndicatorUI = UIManager(self):GetUIObj(InUIName)
  if not IndicatorUI then
    self.IsRangeIndicator = false
    return
  end
  local TargetPointKey, TargetActor
  local IsNpcIndicator = IndicatorUI.GuideInfoCache.PointType == "N" or IndicatorUI.GuideInfoCache.PointType == "Npc"
  if IndicatorUI.GuideInfoCache and IndicatorUI.GuideInfoCache.PointName then
    TargetPointKey = IndicatorUI.GuideInfoCache.PointName
  end
  local PointOrStaticKey
  if IndicatorUI.GuideInfoCache and IndicatorUI.GuideInfoCache.PointOrStaticCreatorName then
    PointOrStaticKey = IndicatorUI.GuideInfoCache.PointOrStaticCreatorName
  end
  if nil == GuidePointLocData[TargetPointKey] and nil ~= PointOrStaticKey then
    TargetPointKey = PointOrStaticKey
  end
  local Location = GuidePointLocData[TargetPointKey]
  if Location and nil ~= Location.R and Location.R > 0 then
    self.IsRangeIndicator = true
  else
    self.IsRangeIndicator = false
  end
end

function Component:TryToFindGuidePointTarget(DisplayName)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local TargetStaticCreator
  TargetStaticCreator = GameState.StaticCreatorStringNameMap:FindRef(DisplayName)
  if TargetStaticCreator then
    return TargetStaticCreator
  end
  TargetStaticCreator = GameState.StaticCreatorMap:FindRef(DisplayName)
  if TargetStaticCreator then
    return TargetStaticCreator
  end
  local NewTargetPoint = GameState:GetTargetPoint(DisplayName)
  if NewTargetPoint then
    return NewTargetPoint
  end
  local TalkSubsystem = TalkSubsystem()
  local ObservationPoint = TalkSubsystem:GetTalkInteractiveItem(DisplayName)
  if ObservationPoint then
    return ObservationPoint
  end
  return nil
end

function Component:ShowMissionIndicatorsInRegionMap()
  self:AddMainTaskGuidePointToRegionMap()
  self:AddSpecialSideTaskGuidePointToRegionMap()
  self:SetMissionIndicatorsWidgetFloorStyle()
end

function Component:ChangeMiniMapIndicatorsFloorStyle(Widget)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local CurRegionId = DataMgr.SubRegion[Avatar.CurrentRegionId].RegionId
  if Widget.TaskSubRegionId and DataMgr.SubRegion[Widget.TaskSubRegionId] then
    local TaskRegionId = DataMgr.SubRegion[Widget.TaskSubRegionId].RegionId
    if CurRegionId ~= TaskRegionId then
      Widget.Bottom:SetVisibility(UE4.ESlateVisibility.Collapsed)
      Widget.Top:SetVisibility(UE4.ESlateVisibility.Collapsed)
      return
    end
  end
  if IsValid(Widget) then
    if Widget.FloorId ~= nil and self.CurrentFloorId > Widget.FloorId then
      Widget.Bottom:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      Widget.Top:SetVisibility(UE4.ESlateVisibility.Collapsed)
    elseif Widget.FloorId ~= nil and self.CurrentFloorId < Widget.FloorId then
      Widget.Bottom:SetVisibility(UE4.ESlateVisibility.Collapsed)
      Widget.Top:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      Widget.Bottom:SetVisibility(UE4.ESlateVisibility.Collapsed)
      Widget.Top:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

function Component:SetMissionIndicatorsWidgetFloorStyle(InFloorId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local CurRegionId = DataMgr.SubRegion[Avatar.CurrentRegionId].RegionId
  for _, Widget in pairs(self.IndicatorWidgets) do
    if Widget.TaskSubRegionId and DataMgr.SubRegion[Widget.TaskSubRegionId] then
      local TaskRegionId = DataMgr.SubRegion[Widget.TaskSubRegionId].RegionId
      if CurRegionId ~= TaskRegionId then
        Widget.Bottom:SetVisibility(UE4.ESlateVisibility.Collapsed)
        Widget.Top:SetVisibility(UE4.ESlateVisibility.Collapsed)
        return
      end
    end
    if IsValid(Widget) then
      if Widget.FloorId ~= nil and self.CurrentFloorId > Widget.FloorId then
        Widget.Bottom:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        Widget.Top:SetVisibility(UE4.ESlateVisibility.Collapsed)
      elseif Widget.FloorId ~= nil and self.CurrentFloorId < Widget.FloorId then
        Widget.Bottom:SetVisibility(UE4.ESlateVisibility.Collapsed)
        Widget.Top:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      else
        Widget.Bottom:SetVisibility(UE4.ESlateVisibility.Collapsed)
        Widget.Top:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
  end
end

function Component:AddSpecialSideTaskGuidePointToRegionMap()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  for QuestChainId, QuestChainData in pairs(DataMgr.QuestChain) do
    if nil == QuestChainData or nil == QuestChainData.SpecialQuestDisplayName or nil == QuestChainData.QuestNpcId or QuestChainData.QuestChainType ~= Const.SpecialSideQuestChainType then
    elseif Avatar.QuestChains[QuestChainId] and 1 == Avatar.QuestChains[QuestChainId].State and GuidePointLocData[QuestChainData.SpecialQuestDisplayName] and GuidePointLocData[QuestChainData.SpecialQuestDisplayName].SubRegionId > 0 then
      local SubRegionId = GuidePointLocData[QuestChainData.SpecialQuestDisplayName].SubRegionId
      local TaskRegionId = DataMgr.Subregion[SubRegionId].RegionId
      if TaskRegionId == self.RegionID then
        local function CreateSpecialSideIndicatorRegionMapWidget()
          local PointPath = "/Game/UI/WBP/Map/Widget/WBP_Map_Point.WBP_Map_Point"
          
          local Point = UIManager(self):CreateWidget(PointPath)
          local SelectPath = "/Game/UI/WBP/Map/Widget/WBP_Map_Select.WBP_Map_Select"
          local Select = UIManager(self):CreateWidget(SelectPath)
          local IconTexture = LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SpSideMission.T_Gp_SpSideMission")
          if IconTexture then
            Point.Img_Point:SetBrushResourceObject(IconTexture)
          end
          return Point, Select
        end
        
        local IndicatorName = "NpcSpecialSideQuest_" .. QuestChainData.SpecialQuestDisplayName
        local Location = GuidePointLocData[QuestChainData.SpecialQuestDisplayName]
        local IndicatorWidget, SelectWidget = CreateSpecialSideIndicatorRegionMapWidget()
        IndicatorWidget.TargetQuestChainId = QuestChainId
        IndicatorWidget.UnLockSpecialTask = true
        IndicatorWidget.Tip_AcceptMission.Text_Accept:SetText(GText("UI_Quest_CanTakeQuest"))
        if nil ~= self.IndicatorWidgets[IndicatorName] then
        else
          self.Panel_Gamer:AddChildToCanvas(IndicatorWidget)
          self.Panel_Gamer:AddChildToCanvas(SelectWidget)
          IndicatorWidget.Tip_AcceptMission:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
          SelectWidget:SetVisibility(ESlateVisibility.Collapsed)
          self.IndicatorWidgets[IndicatorName] = IndicatorWidget
          self.SelectWidgetTable[IndicatorName] = SelectWidget
          IndicatorWidget:InitGuidePoint(self, IndicatorName, self.OnSpecialGuidePointClicked, self.OnGuidePointHover, self.OnGuidePointUnHover)
          
          local function AdjustSlot(GuidePointSlot)
            GuidePointSlot:SetAlignment(FVector2D(0.5, 0.5))
            GuidePointSlot:SetAutoSize(true)
            local Anchors = FAnchors()
            Anchors.Minimum = FVector2D(0.5, 0.5)
            Anchors.Maximum = FVector2D(0.5, 0.5)
            GuidePointSlot:SetAnchors(Anchors)
            local Offset = FMargin()
            Offset.Left = 0
            Offset.Top = 0
            GuidePointSlot:SetOffsets(Offset)
          end
          
          AdjustSlot(IndicatorWidget.Slot)
          AdjustSlot(SelectWidget.Slot)
          self:AddIndicatorLocation(IndicatorName, Location.X, Location.Y, Location.Z, Location.R)
          local LocInUI = self:TransformWorldLocToUILoc(Location.X, Location.Y)
          IndicatorWidget:SetRenderTranslation(LocInUI)
          SelectWidget:SetRenderTranslation(LocInUI)
          if IndicatorWidget:IsAnimationPlaying(IndicatorWidget.Loop) then
            IndicatorWidget:StopAnimation(IndicatorWidget.Loop)
          end
          if MissionIndicatorManager.TrackingSpecialSideQuestChainId == QuestChainId then
            IndicatorWidget:PlayAnimation(IndicatorWidget.Loop, 0, 0)
          end
        end
      end
    end
  end
end

function Component:AddMainTaskGuidePointToRegionMap()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local TrackingQuestChainId = Avatar.TrackingQuestChainId
  local TrackingQuestId = 0
  if Avatar.QuestChains[TrackingQuestChainId] then
    TrackingQuestId = Avatar.QuestChains[TrackingQuestChainId].DoingQuestId
  end
  if 0 == TrackingQuestId then
    return
  end
  local Info = TaskUtils:GetQuestDetail(TrackingQuestChainId, TrackingQuestId)
  if Info and Info.IsFairyLand then
    return
  end
  local UIObjs = MissionIndicatorManager:GetIndicatorUIObjByQuestChainIdWithType(TrackingQuestChainId, "Task")
  if IsEmptyTable(UIObjs) then
    return
  end
  for _, IndicatorUI in pairs(UIObjs) do
    local TargetPointKey
    if IndicatorUI.GuideInfoCache and IndicatorUI.GuideInfoCache.PointName then
      TargetPointKey = IndicatorUI.GuideInfoCache.PointName
    end
    local PointOrStaticKey
    if IndicatorUI.GuideInfoCache and IndicatorUI.GuideInfoCache.PointOrStaticCreatorName then
      PointOrStaticKey = IndicatorUI.GuideInfoCache.PointOrStaticCreatorName
    end
    if nil == GuidePointLocData[TargetPointKey] and nil ~= PointOrStaticKey then
      TargetPointKey = PointOrStaticKey
    end
    if nil == TargetPointKey or nil == GuidePointLocData[TargetPointKey] then
      if Const.EnableTaskPrintError then
        ScreenPrint(string.format("[line:782]\229\140\186\229\159\159\229\156\176\229\155\190\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168, TargetPointKey\239\188\154%s", TargetPointKey))
      end
    else
      local TempLocation = GuidePointLocData[TargetPointKey]
      local Location = {
        X = 0,
        Y = 0,
        Z = 0,
        R = 0
      }
      local TaskSubRegionId = 0
      local Info = TaskUtils:GetQuestDetail(TrackingQuestChainId, TrackingQuestId)
      if Info and Info.SubRegionId and Info.SubRegionId > 0 then
        TaskSubRegionId = Info.SubRegionId
      else
        TaskSubRegionId = GuidePointLocData[TargetPointKey].SubRegionId
      end
      if not TaskSubRegionId then
        if Const.EnableTaskPrintError then
          ScreenPrint(string.format("\229\140\186\229\159\159\229\156\176\229\155\190\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168, TargetPointKey\239\188\154%s", TargetPointKey))
        end
      elseif nil == DataMgr.SubRegion[TaskSubRegionId] or nil == DataMgr.SubRegion[TaskSubRegionId].RegionId then
        if Const.EnableTaskPrintError then
          ScreenPrint(string.format("SubRegion\232\161\168\229\140\186\229\159\159\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168, SubRegionId\239\188\154%s", TaskSubRegionId))
        end
      else
        if nil ~= TempLocation then
          if TaskSubRegionId == Const.HomeBaseSubRegionId then
            return
          else
            Location.X = TempLocation.X
            Location.Y = TempLocation.Y
            Location.Z = TempLocation.Z
            Location.R = TempLocation.R or 0
          end
        end
        if DataMgr.SubRegion[TaskSubRegionId].RegionId == self.RegionID then
          local IndicatorWidget, SelectWidget = self:CreateIndicatorRegionMapWidget()
          if nil ~= self.IndicatorWidgets[IndicatorUI:GetName()] then
          else
            self.Panel_Gamer:AddChildToCanvas(IndicatorWidget)
            self.Panel_Gamer:AddChildToCanvas(SelectWidget)
            SelectWidget:SetVisibility(ESlateVisibility.Collapsed)
            IndicatorWidget.TargetQuestChainId = TrackingQuestChainId
            self.IndicatorWidgets[IndicatorUI:GetName()] = IndicatorWidget
            self.SelectWidgetTable[IndicatorUI:GetName()] = SelectWidget
            self:SetIndicatorsFloorIdByData(IndicatorWidget, TaskSubRegionId, TargetPointKey)
            IndicatorWidget:InitGuidePoint(self, IndicatorUI:GetName(), self.OnGuidePointClicked, self.OnGuidePointHover, self.OnGuidePointUnHover)
            self:SetIndicatorRangeMaterial(IndicatorWidget, TrackingQuestChainId, false)
            self:TrySetDiffGuideIcon(IndicatorWidget, TrackingQuestChainId, IndicatorUI.GuideInfoCache.QuestNode.Key)
            
            local function AdjustSlot(GuidePointSlot)
              GuidePointSlot:SetAlignment(FVector2D(0.5, 0.5))
              GuidePointSlot:SetAutoSize(true)
              local Anchors = FAnchors()
              Anchors.Minimum = FVector2D(0.5, 0.5)
              Anchors.Maximum = FVector2D(0.5, 0.5)
              GuidePointSlot:SetAnchors(Anchors)
              local Offset = FMargin()
              Offset.Left = 0
              Offset.Top = 0
              GuidePointSlot:SetOffsets(Offset)
            end
            
            AdjustSlot(IndicatorWidget.Slot)
            AdjustSlot(SelectWidget.Slot)
            if DataMgr.SubRegion[TaskSubRegionId].DefaultQuestPoint then
              local LocData = DataMgr.SubRegion[TaskSubRegionId].DefaultQuestPoint
              
              local function SplitStrLoc(str, reps)
                local resultStrList = {}
                string.gsub(str, "[^" .. reps .. "]+", function(w)
                  table.insert(resultStrList, w)
                end)
                return resultStrList
              end
              
              local RetLoc = SplitStrLoc(LocData, ",")
              for i = 1, 3 do
                local TempNumber = tonumber(RetLoc[i])
                RetLoc[i] = TempNumber
              end
              Location.X = RetLoc[1]
              Location.Y = RetLoc[2]
              Location.Z = RetLoc[3]
            end
            self:AddIndicatorLocation(IndicatorUI:GetName(), Location.X, Location.Y, Location.Z, Location.R)
            local LocInUI = self:TransformWorldLocToUILoc(Location.X, Location.Y)
            IndicatorWidget:SetRenderTranslation(LocInUI)
            SelectWidget:SetRenderTranslation(LocInUI)
            self:CreateTaskRegionMapGuidPointIndicator(IndicatorUI:GetName())
            if nil ~= Location.R and Location.R > 0 and self:CheckIsNeedShowRangeStyleByLocation(Location) then
              IndicatorWidget.Img_Point:SetVisibility(UE4.ESlateVisibility.Collapsed)
              IndicatorWidget.Img_Range:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
              IndicatorWidget.Img_Range.Slot:SetSize(FVector2D(Location.R * 2 * self.Scale, Location.R * 2 * self.Scale))
              if IndicatorWidget:IsAnimationPlaying(IndicatorWidget.Loop) then
                IndicatorWidget:StopAnimation(IndicatorWidget.Loop)
                IndicatorWidget:ClearAllFunc()
              end
            end
          end
        end
      end
    end
  end
end

function Component:AddMainTaskGuidePointToRegionMapForTrackingQuest(TargetKey)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local TrackingQuestChainId = Avatar.TrackingQuestChainId
  local TrackingQuestId = 0
  if Avatar.QuestChains[TrackingQuestChainId] then
    TrackingQuestId = Avatar.QuestChains[TrackingQuestChainId].DoingQuestId
  end
  if 0 == TrackingQuestId then
    return
  end
  local Info = TaskUtils:GetQuestDetail(TrackingQuestChainId, TrackingQuestId)
  if Info and Info.IsFairyLand then
    return
  end
  local UIObjs = MissionIndicatorManager:GetIndicatorUIObjByQuestChainIdWithType(TrackingQuestChainId, "Task")
  if IsEmptyTable(UIObjs) then
    return
  end
  for _, IndicatorUI in pairs(UIObjs) do
    local TargetPointKey = TargetKey
    if nil == TargetPointKey or nil == GuidePointLocData[TargetPointKey] then
      if Const.EnableTaskPrintError then
        ScreenPrint(string.format("[line:782]\229\140\186\229\159\159\229\156\176\229\155\190\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168, TargetPointKey\239\188\154%s", TargetPointKey))
      end
      return
    end
    local TempLocation = GuidePointLocData[TargetPointKey]
    local Location = {
      X = 0,
      Y = 0,
      Z = 0,
      R = 0
    }
    local TaskSubRegionId = GuidePointLocData[TargetPointKey].SubRegionId
    if nil == DataMgr.SubRegion[TaskSubRegionId] or nil == DataMgr.SubRegion[TaskSubRegionId].RegionId then
      if Const.EnableTaskPrintError then
        ScreenPrint(string.format("SubRegion\232\161\168\229\140\186\229\159\159\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168, SubRegionId\239\188\154%s", TaskSubRegionId))
      end
      return
    end
    if nil ~= TempLocation then
      Location.X = TempLocation.X
      Location.Y = TempLocation.Y
      Location.Z = TempLocation.Z
      Location.R = TempLocation.R or 0
    end
    if DataMgr.SubRegion[TaskSubRegionId].RegionId == self.RegionID or DataMgr.SubRegion[TaskSubRegionId].DefaultQuestPoint then
      local IndicatorWidget, SelectWidget = self:CreateIndicatorRegionMapWidget()
      if nil ~= self.IndicatorWidgets[IndicatorUI:GetName()] then
        return
      end
      self.Panel_Gamer:AddChildToCanvas(IndicatorWidget)
      self.Panel_Gamer:AddChildToCanvas(SelectWidget)
      SelectWidget:SetVisibility(ESlateVisibility.Collapsed)
      IndicatorWidget.TargetQuestChainId = TrackingQuestChainId
      self.IndicatorWidgets[IndicatorUI:GetName()] = IndicatorWidget
      self.SelectWidgetTable[IndicatorUI:GetName()] = SelectWidget
      self:SetIndicatorsFloorIdByData(IndicatorWidget, TaskSubRegionId, TargetPointKey)
      IndicatorWidget:InitGuidePoint(self, IndicatorUI:GetName(), self.OnGuidePointClicked, self.OnGuidePointHover, self.OnGuidePointUnHover)
      self:SetIndicatorRangeMaterial(IndicatorWidget, TrackingQuestChainId, false)
      if DataMgr.SubRegion[TaskSubRegionId].DefaultQuestPoint then
        local LocData = DataMgr.SubRegion[TaskSubRegionId].DefaultQuestPoint
        
        local function SplitStrLoc(str, reps)
          local resultStrList = {}
          string.gsub(str, "[^" .. reps .. "]+", function(w)
            table.insert(resultStrList, w)
          end)
          return resultStrList
        end
        
        local RetLoc = SplitStrLoc(LocData, ",")
        for i = 1, 3 do
          local TempNumber = tonumber(RetLoc[i])
          RetLoc[i] = TempNumber
        end
        Location.X = RetLoc[1]
        Location.Y = RetLoc[2]
        Location.Z = RetLoc[3]
      end
      self:AddIndicatorLocation(IndicatorUI:GetName(), Location.X, Location.Y, Location.Z, Location.R)
      local LocInUI = self:TransformWorldLocToUILoc(Location.X, Location.Y)
      IndicatorWidget:SetRenderTranslation(LocInUI)
      SelectWidget:SetRenderTranslation(LocInUI)
      self:CreateTaskRegionMapGuidPointIndicator(IndicatorUI:GetName())
      if nil ~= Location.R and Location.R > 0 and self:CheckIsNeedShowRangeStyleByLocation(Location) then
        IndicatorWidget.Img_Point:SetVisibility(UE4.ESlateVisibility.Collapsed)
        IndicatorWidget.Img_Range:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        IndicatorWidget.Img_Range.Slot:SetSize(FVector2D(Location.R * 2 * self.Scale, Location.R * 2 * self.Scale))
        if IndicatorWidget:IsAnimationPlaying(IndicatorWidget.Loop) then
          IndicatorWidget:StopAnimation(IndicatorWidget.Loop)
          IndicatorWidget:ClearAllFunc()
        end
      end
    end
    break
  end
end

function Component:SetIndicatorsFloorIdByData(Widget, SubRegionId, TargetPointKey)
  if not GuidePointLocData[TargetPointKey] or not GuidePointLocData[TargetPointKey].FloorId then
    Widget.FloorId = 0
    return
  end
  Widget.FloorId = GuidePointLocData[TargetPointKey].FloorId
end

function Component:AddDynamicGuidePointToRegionMap()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local UIObjs = MissionIndicatorManager:GetIndicatorUIObjBySTLType("Dynamic")
  if IsEmptyTable(UIObjs) then
    return
  end
  for _, IndicatorUI in pairs(UIObjs) do
    local TargetPointKey
    if IndicatorUI.GuideInfoCache and IndicatorUI.GuideInfoCache.PointName then
      TargetPointKey = IndicatorUI.GuideInfoCache.PointName
    end
    local PointOrStaticKey
    if IndicatorUI.GuideInfoCache and IndicatorUI.GuideInfoCache.PointOrStaticCreatorName then
      PointOrStaticKey = IndicatorUI.GuideInfoCache.PointOrStaticCreatorName
    end
    if nil == GuidePointLocData[TargetPointKey] and nil ~= PointOrStaticKey then
      TargetPointKey = PointOrStaticKey
    end
    if nil == TargetPointKey or "" == TargetPointKey or nil == GuidePointLocData[TargetPointKey] then
      if Const.EnableTaskPrintError then
        ScreenPrint(string.format("\229\138\168\230\128\129\228\186\139\228\187\182\229\156\176\229\155\190\230\140\135\229\188\149\231\130\185\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168, \230\140\135\229\188\149\231\130\185\229\144\141\231\167\176\239\188\154%s", IndicatorUI:GetName()))
      end
    else
      local TempLocation = GuidePointLocData[TargetPointKey]
      local Location = {
        X = 0,
        Y = 0,
        Z = 0,
        R = 0
      }
      local TargetActor = self:TryToFindGuidePointTarget(TargetPointKey)
      if nil ~= TempLocation and nil ~= TargetActor then
        Location.X = TempLocation.X
        Location.Y = TempLocation.Y
        Location.Z = TempLocation.Z
        Location.R = TempLocation.R or 0
      end
      local TargetSubRegionId = Avatar.CurrentRegionId
      if not TargetSubRegionId or not DataMgr.SubRegion[TargetSubRegionId] then
        if Const.EnableTaskPrintError then
          ScreenPrint(string.format("\229\138\168\230\128\129\228\186\139\228\187\182\229\156\176\229\155\190\230\140\135\229\188\149\231\130\185\229\140\186\229\159\159\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168, \230\140\135\229\188\149\231\130\185\229\144\141\231\167\176\239\188\154%s", IndicatorUI:GetName()))
        end
      elseif DataMgr.SubRegion[TargetSubRegionId].RegionId == self.RegionID then
        local Path = "/Game/UI/UI_PC/Common/Common_GuidePoint_PC.Common_GuidePoint_PC_C"
        local IndicatorWidget = self:CreateIndicatorMiniMapWidget()
        local IconTexture = LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_DynQuest.T_Gp_DynQuest")
        if IconTexture then
          IndicatorWidget.Img_GuidePoint_Icon:SetBrushResourceObject(IconTexture)
        end
        if nil ~= self.IndicatorWidgets[IndicatorUI:GetName()] then
        else
          self.Panel_Gamer:AddChildToCanvas(IndicatorWidget)
          local ImgXScaleX = IndicatorWidget.Img_Range.RenderTransform.Scale.X
          local ImgXScaleY = IndicatorWidget.Img_Range.RenderTransform.Scale.Y
          self.IndicatorWidgets[IndicatorUI:GetName()] = IndicatorWidget
          self:SetIndicatorsFloorIdByData(IndicatorWidget, TargetSubRegionId, TargetPointKey)
          self:SetIndicatorRangeMaterial(IndicatorWidget, nil, true)
          local GuidePointSlot = IndicatorWidget.Slot
          
          local function AdjustSlot(GuidePointSlot)
            GuidePointSlot:SetAlignment(FVector2D(0.5, 0.5))
            GuidePointSlot:SetAutoSize(true)
            local Anchors = FAnchors()
            Anchors.Minimum = FVector2D(0.5, 0.5)
            Anchors.Maximum = FVector2D(0.5, 0.5)
            GuidePointSlot:SetAnchors(Anchors)
            local Offset = FMargin()
            Offset.Left = 0
            Offset.Top = 0
            GuidePointSlot:SetOffsets(Offset)
          end
          
          AdjustSlot(GuidePointSlot)
          if DataMgr.SubRegion[TargetSubRegionId].DefaultQuestPoint then
            local LocData = DataMgr.SubRegion[TargetSubRegionId].DefaultQuestPoint
            
            local function SplitStrLoc(str, reps)
              local resultStrList = {}
              string.gsub(str, "[^" .. reps .. "]+", function(w)
                table.insert(resultStrList, w)
              end)
              return resultStrList
            end
            
            local RetLoc = SplitStrLoc(LocData, ",")
            for i = 1, 3 do
              local TempNumber = tonumber(RetLoc[i])
              RetLoc[i] = TempNumber
            end
            Location.X = RetLoc[1]
            Location.Y = RetLoc[2]
            Location.Z = RetLoc[3]
          end
          self:AddIndicatorLocation(IndicatorUI:GetName(), Location.X, Location.Y, Location.Z, Location.R)
          local LocInUI = self:TransformWorldLocToUILoc(Location.X, Location.Y)
          IndicatorWidget:SetRenderTranslation(LocInUI)
          self:CreateDynamicRegionMapGuidPointIndicator(IndicatorUI:GetName())
          if nil ~= Location.R and Location.R > 0 and self:CheckIsNeedShowRangeStyleByLocation(Location) then
            IndicatorWidget.Panel_Guide_Point:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
            IndicatorWidget.Button_GuidePoint:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
            IndicatorWidget.Img_GuidePoint_Icon:SetVisibility(UE4.ESlateVisibility.Collapsed)
            IndicatorWidget.Img_Range:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
            IndicatorWidget.Img_Range.Slot:SetSize(FVector2D(Location.R * 2 * self.Scale, Location.R * 2 * self.Scale))
            if IndicatorWidget:IsAnimationPlaying(IndicatorWidget.Loop) then
              IndicatorWidget:StopAnimation(IndicatorWidget.Loop)
              IndicatorWidget:ClearAllFunc()
            end
          end
        end
      end
    end
  end
end

function Component:CheckIsNeedShowRangeStyleByLocation(Location)
  if nil == Location or nil == Location.R or not IsValid(self.Player) then
    return false
  end
  local RealRadius
  if Location and Location.R and Location.R > 0 then
    RealRadius = (Location.R + 5) / 100
  end
  local PointLoc = FVector(Location.X, Location.Y, Location.Z)
  local Distance = UKismetMathLibrary.Vector_Distance2D(self.Player.CurrentLocation, PointLoc) / 100.0
  if nil == RealRadius then
    return false
  end
  local IsShowRange = RealRadius > Distance
  if nil ~= RealRadius and IsShowRange then
    return true
  end
  return false
end

function Component:RealChangeRangesGuideInMap(WidgetName, IsRange)
  local Widget = self.IndicatorWidgets[WidgetName]
  
  local function AdjustSlot(GuidePointSlot)
    GuidePointSlot:SetAlignment(FVector2D(0.5, 0.5))
    GuidePointSlot:SetAutoSize(true)
    local Anchors = FAnchors()
    Anchors.Minimum = FVector2D(0.5, 0.5)
    Anchors.Maximum = FVector2D(0.5, 0.5)
    GuidePointSlot:SetAnchors(Anchors)
    local Offset = FMargin()
    Offset.Left = 0
    Offset.Top = 0
    GuidePointSlot:SetOffsets(Offset)
  end
  
  if not IsRange then
    self:RemoveTimer("TargetArea")
    if IsValid(Widget) and self.Panel_Gamer:HasChild(Widget) then
      self.Panel_Gamer:RemoveChild(Widget)
      self.MainMap.TracePanel:AddChild(Widget)
    end
    AdjustSlot(Widget.Slot)
    Widget:SetRenderScale(FVector2D(1, 1))
    local arrow = self.MainMap:NewPointArrow()
    Widget.Img_GuidePoint_Icon:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    Widget.Img_Range:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self:AddTrack(Widget, arrow, nil)
    Widget:PlayAnimation(Widget.Loop, 0, 0)
    local TaskBar = TaskUtils:GetTaskBarWidget()
    if TaskBar and TaskBar.Panel_Tips2:GetVisibility() == UE4.ESlateVisibility.SelfHitTestInvisible then
      if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
        TaskBar:PlayAnimation(TaskBar.Tooltip_In)
      end
      TaskBar.Panel_Tips2:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  else
    local IsIn = self.EnterTaskRegion[WidgetName]
    if not IsIn then
      UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_Quest_TargetArea"), 2, nil, {Color = 1})
      AudioManager(self):PlayUISound(self, "event:/ui/common/reach_target_region", nil, nil)
      self.EnterTaskRegion[WidgetName] = true
      self:AddTimer(0.5, function()
        if IsValid(Widget) and self.MainMap.TracePanel:HasChild(Widget) then
          self.MainMap.TracePanel:RemoveChild(Widget)
          self.Panel_Gamer:AddChild(Widget)
        end
        if IsValid(Widget) and self.Panel_Gamer:HasChild(Widget) then
          AdjustSlot(Widget.Slot)
          Widget.RenderTransform.Scale.X = self.MainMap.TracePanel.RenderTransform.Scale.X * 0.75
          Widget.RenderTransform.Scale.Y = self.MainMap.TracePanel.RenderTransform.Scale.Y * 0.75
          self:RemoveTrack(Widget)
          Widget.Img_GuidePoint_Icon:SetVisibility(UE4.ESlateVisibility.Collapsed)
          Widget.Img_Range:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
          if Widget:IsAnimationPlaying(Widget.Loop) then
            Widget:StopAnimation(Widget.Loop)
          end
          Widget:PlayAnimation(Widget.Range_In)
        end
        local TaskBar = TaskUtils:GetTaskBarWidget()
        if TaskBar then
          TaskBar.Text_TextTip:SetText(GText("UI_Quest_TargetArea"))
          if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
            TaskBar:PlayAnimation(TaskBar.Tooltip_Out)
          end
          TaskBar:PlayAnimation(TaskBar.Tooltip2_In)
        end
      end, false, 0, "TargetArea")
    else
      if IsValid(Widget) and self.MainMap.TracePanel:HasChild(Widget) then
        self.MainMap.TracePanel:RemoveChild(Widget)
        self.Panel_Gamer:AddChild(Widget)
      end
      AdjustSlot(Widget.Slot)
      Widget.RenderTransform.Scale.X = self.MainMap.TracePanel.RenderTransform.Scale.X * 0.75
      Widget.RenderTransform.Scale.Y = self.MainMap.TracePanel.RenderTransform.Scale.Y * 0.75
      self:RemoveTrack(Widget)
      Widget.Img_GuidePoint_Icon:SetVisibility(UE4.ESlateVisibility.Collapsed)
      Widget.Img_Range:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      if Widget:IsAnimationPlaying(Widget.Loop) then
        Widget:StopAnimation(Widget.Loop)
      end
      Widget:PlayAnimation(Widget.Range_In)
      local TaskBar = TaskUtils:GetTaskBarWidget()
      if TaskBar then
        TaskBar.Text_TextTip:SetText(GText("UI_Quest_TargetArea"))
        TaskBar:PlayAnimation(TaskBar.Tooltip_Out)
        TaskBar:PlayAnimation(TaskBar.Tooltip2_In)
      end
    end
  end
  self:ChangeLocationDataRangeOrPoint(WidgetName, IsRange)
end

function Component:OnGuidePointClicked(InFloorId, GuidePoint)
  self:ClosePanel(true)
  if not self:CheckSelect(GuidePoint) then
    return
  end
  if GuidePoint.PointWidgetName and self.SelectWidgetTable[GuidePoint.PointWidgetName] then
    self.SelectWidgetTable[GuidePoint.PointWidgetName]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.SelectWidgetTable[GuidePoint.PointWidgetName]:PlayAnimation(self.SelectWidgetTable[GuidePoint.PointWidgetName].Click)
    GuidePoint.IsSelected = true
  end
  self:MoveMapToQuestTarget(nil, GuidePoint)
end

function Component:OnSpecialGuidePointClicked(InFloorId, GuidePoint)
  self:ClosePanel(true)
  if not self:CheckSelect(GuidePoint) then
    return
  end
  if nil ~= InFloorId then
    self:OnFloorBtnClicked(InFloorId, true)
  end
  if GuidePoint.PointWidgetName and self.SelectWidgetTable[GuidePoint.PointWidgetName] then
    self.SelectWidgetTable[GuidePoint.PointWidgetName]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.SelectWidgetTable[GuidePoint.PointWidgetName]:PlayAnimation(self.SelectWidgetTable[GuidePoint.PointWidgetName].Click)
    GuidePoint.IsSelected = true
  end
  for k, v in pairs(self.IndicatorLocations) do
    if IsValid(self.SelectWidgetTable[k]) and self.IndicatorWidgets[k] == GuidePoint then
      self:MoveMapTo(self:TransformWorldLocToUILoc(v.X, v.Y) * -1)
      self.SelectWidgetTable[k]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.SelectWidgetTable[k]:PlayAnimation(self.SelectWidgetTable[k].Click)
      self.IndicatorWidgets[k].IsSelected = true
      break
    end
  end
  self:ShowQuestDetailInRegionMap(GuidePoint.TargetQuestChainId)
end

function Component:ShowQuestDetailInRegionMap(InQuestChainId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if self.MapTipsWidget == nil then
    local IsHasChildren = self.MainMap.CommonMapTips:HasAnyChildren()
    if IsHasChildren then
      self.MainMap.CommonMapTips:ClearChildren()
    end
    local Path = "/Game/UI/WBP/Map/Widget/WBP_Map_Task.WBP_Map_Task"
    self.MapTipsWidget = UE4.UWidgetBlueprintLibrary.Create(self, LoadClass(Path))
    self.MapTipsWidget:Init(self.MainMap)
    self.MainMap.CommonMapTips:AddChild(self.MapTipsWidget)
    self.MapTipsWidget:PlayAnimation(self.MapTipsWidget.Auto_In)
  else
    local VisibleStatue = self.MapTipsWidget:GetVisibility()
    if VisibleStatue == UE4.ESlateVisibility.Collapsed then
      self.MapTipsWidget:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.MapTipsWidget:OnShow()
      self.MapTipsWidget:PlayAnimation(self.MapTipsWidget.Auto_In)
    end
  end
  self.MapTipsWidget:SetFocus()
  local IconTexture, GrayTexture
  if InQuestChainId then
    IconTexture = TaskUtils:GetIconTextureByQuestChainType(InQuestChainId)
    self.MapTipsWidget.Text_CanGetTask:SetText(GText("UI_QUEST_GETNEWQUEST"))
  else
    IconTexture = TaskUtils:GetIconTextureByTrackQuestChainType()
  end
  if Avatar and InQuestChainId then
    GrayTexture = TaskUtils:GetGrayIconTextureByQuestChainType(InQuestChainId)
    local BranchQuestNpcNameId = DataMgr.QuestChain[InQuestChainId].QuestNpcId or "UI_QUEST_UNKNOWN"
    local NpcName
    if "UI_QUEST_UNKNOWN" ~= BranchQuestNpcNameId then
      NpcName = DataMgr.Npc[BranchQuestNpcNameId].UnitName
    end
    self.MapTipsWidget.Text_NPCName:SetText(GText(NpcName))
  else
    GrayTexture = TaskUtils:GetGrayIconTextureByQuestChainType(Avatar.TrackingQuestChainId)
    local BranchQuestNpcNameId = DataMgr.QuestChain[Avatar.TrackingQuestChainId].QuestNpcId or "UI_QUEST_UNKNOWN"
    local NpcName
    if "UI_QUEST_UNKNOWN" ~= BranchQuestNpcNameId then
      NpcName = DataMgr.Npc[BranchQuestNpcNameId].UnitName
    end
    self.MapTipsWidget.Text_NPCName:SetText(GText(NpcName))
  end
  if IconTexture then
    self.MapTipsWidget.Img_GuidePoint_Icon:SetBrushResourceObject(IconTexture)
  end
  if GrayTexture then
    self.MapTipsWidget.Icon_TaskType:SetBrushResourceObject(GrayTexture)
  end
  local CurTrackingQuestChaindId = 0
  local TrackingQuestId = 0
  if InQuestChainId then
    CurTrackingQuestChaindId = InQuestChainId
    local STLExportInfo = DataMgr.STLExportQuestChain[CurTrackingQuestChaindId]
    if STLExportInfo and STLExportInfo.Quests then
      local TempExportQuests = {}
      for QuestId, _ in pairs(STLExportInfo.Quests) do
        table.insert(TempExportQuests, QuestId)
      end
      table.sort(TempExportQuests, function(a, b)
        return a < b
      end)
      if Avatar.QuestChains[CurTrackingQuestChaindId] and 1 ~= Avatar.QuestChains[CurTrackingQuestChaindId].State then
        CurTrackingQuestChaindId = Avatar.TrackingQuestChainId
        TrackingQuestId = Avatar.QuestChains[CurTrackingQuestChaindId].DoingQuestId
      else
        for _, QuestId in pairs(TempExportQuests) do
          if nil == STLExportInfo.Quests[QuestId].IsPreQuest then
            TrackingQuestId = QuestId
            break
          end
        end
      end
    end
  else
    CurTrackingQuestChaindId = Avatar.TrackingQuestChainId
    TrackingQuestId = Avatar.QuestChains[CurTrackingQuestChaindId].DoingQuestId
  end
  if DataMgr.QuestChain[CurTrackingQuestChaindId] and DataMgr.QuestChain[CurTrackingQuestChaindId].QuestChainType == Const.SpecialSideQuestChainType and 1 == Avatar.QuestChains[CurTrackingQuestChaindId].State then
    self.MapTipsWidget.WS_BG:SetActiveWidgetIndex(1)
    self.MapTipsWidget.Panel_Bottom:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.MapTipsWidget.Group_CanGetTask:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.MapTipsWidget.HB_NPCName:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if DataMgr.QuestChain[CurTrackingQuestChaindId] and DataMgr.QuestChain[CurTrackingQuestChaindId].SpecialQuestDisplayName and DataMgr.QuestChain[CurTrackingQuestChaindId].QuestNpcId then
      self.MapTipsWidget.SpecialQuestDisplayName = DataMgr.QuestChain[CurTrackingQuestChaindId].SpecialQuestDisplayName
      self.MapTipsWidget.SideQuestNpcId = DataMgr.QuestChain[CurTrackingQuestChaindId].QuestNpcId
    end
  else
    self.MapTipsWidget.WS_BG:SetActiveWidgetIndex(0)
    self.MapTipsWidget.Panel_Bottom:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.MapTipsWidget.Group_CanGetTask:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.MapTipsWidget.HB_NPCName:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.MapTipsWidget.CurTrackingQuestChaindId = CurTrackingQuestChaindId
  if nil == MissionIndicatorManager.TrackingSpecialSideQuestChainId then
    self.MapTipsWidget.Btn_Track:SetText(GText("UI_RegionMap_Track"))
    self.MapTipsWidget.Switch_Button:SetActiveWidgetIndex(1)
  elseif MissionIndicatorManager.TrackingSpecialSideQuestChainId ~= CurTrackingQuestChaindId then
    self.MapTipsWidget.Btn_Track:SetText(GText("UI_RegionMap_Track"))
    self.MapTipsWidget.Switch_Button:SetActiveWidgetIndex(1)
  else
    self.MapTipsWidget.Btn_Cancel_Track:SetText(GText("UI_RegionMap_Untrack"))
    self.MapTipsWidget.Switch_Button:SetActiveWidgetIndex(3)
  end
  self.MapTipsWidget.Btn_Track:BindEventOnClicked(self, self.OnSpecialSideTaskGuidePointTrackClick)
  self.MapTipsWidget.Btn_Cancel_Track:BindEventOnClicked(self, self.OnSpecialSideTaskGuidePointUnTrackClick)
  local Info = TaskUtils:GetQuestDetail(CurTrackingQuestChaindId, TrackingQuestId)
  if not Info then
    return
  end
  for _, Data in pairs(DataMgr.QuestTab) do
    if Data and Data.QuestType == DataMgr.QuestChain[CurTrackingQuestChaindId].QuestChainType then
      self.MapTipsWidget.Text_TaskType:SetText(GText(Data.TabName))
      break
    end
  end
  if DataMgr.QuestChain[CurTrackingQuestChaindId] and DataMgr.QuestChain[CurTrackingQuestChaindId].QuestChainType == Const.SpecialSideQuestChainType and 1 == Avatar.QuestChains[CurTrackingQuestChaindId].State and DataMgr.QuestChain[CurTrackingQuestChaindId].QuestChainName then
    self.MapTipsWidget.Text_Title:SetText(GText(DataMgr.QuestChain[CurTrackingQuestChaindId].QuestChainName))
  else
    self.MapTipsWidget.Text_Title:SetText(GText(Info.QuestDescription))
  end
  self.MapTipsWidget.Text_Desc:SetText(GText(Info.QuestDeatil))
  self.MapTipsWidget.Text_TaskContent:SetText(GText("UI_QUEST_CONTENT"))
  self.MapTipsWidget.Text_TaskRewards:SetText(GText("UI_QUEST_REWARDS"))
  local Icon
  if self.RegionIcon then
    Icon = LoadObject(self.RegionIcon)
  end
  if Icon then
    self.MapTipsWidget.Icon_Camp:SetBrushFromTexture(Icon)
  end
  local RewardList = DataMgr.QuestChain[CurTrackingQuestChaindId].QuestChainReward
  if RewardList then
    self.MapTipsWidget.TileView_Rewards:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.MapTipsWidget.TileView_Rewards:ClearListItems()
    for _, RewardId in pairs(RewardList) do
      local RewardInfo = DataMgr.Reward[RewardId]
      if RewardInfo then
        local Ids = RewardInfo.Id or {}
        local RewardCount = RewardInfo.Count or {}
        local TableName = RewardInfo.Type or {}
        for i = 1, #Ids do
          local ItemId = Ids[i]
          local Count = RewardUtils:GetCount(RewardCount[i])
          local Icon = ItemUtils.GetItemIconPath(ItemId, TableName[i])
          local Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
          local ItemType = TableName[i]
          local RewardContent = TaskUtils:CreateRewardContent({
            Id = ItemId,
            Count = Count,
            OwnerWidget = self,
            Icon = Icon,
            Rarity = Rarity,
            IsShowDetails = true,
            ItemType = ItemType
          })
          RewardContent.OnMenuOpenChangedEvents = {
            Obj = self.MapTipsWidget,
            Callback = self.MapTipsWidget.OnRewardItemMenuAnchorChanged
          }
          self.MapTipsWidget.TileView_Rewards:AddItem(RewardContent)
        end
      end
    end
  else
    self.MapTipsWidget.TileView_Rewards:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self:OnPanelOpen(4)
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_click_level", nil, nil)
end

function Component:OnSpecialSideTaskGuidePointTrackClick()
  MissionIndicatorManager.TrackingSpecialSideQuestChainId = self.MapTipsWidget.CurTrackingQuestChaindId
  for k, v in pairs(self.IndicatorWidgets) do
    if v.UnLockSpecialTask and v.TargetQuestChainId and v.TargetQuestChainId == self.MapTipsWidget.CurTrackingQuestChaindId then
      v:PlayAnimation(v.Loop, 0, 0)
    elseif v.UnLockSpecialTask and v.TargetQuestChainId and v.TargetQuestChainId == self.MapTipsWidget.CurTrackingQuestChaindId then
      v:StopAnimation(v.Loop)
    end
  end
  self.MapTipsWidget.Btn_Cancel_Track:SetText(GText("UI_RegionMap_Untrack"))
  self.MapTipsWidget.Switch_Button:SetActiveWidgetIndex(3)
  if self.MapTipsWidget.SpecialQuestDisplayName then
    MissionIndicatorManager:ActiveMissionIndicatorByRegionMap(self.MapTipsWidget.SpecialQuestDisplayName, self.MapTipsWidget.SideQuestNpcId)
    EventManager:FireEvent(EventID.OnChangeTaskIndicator, TaskUtils.MissionNpcGuideMaps)
  end
  self:ClosePanel()
end

function Component:OnSpecialSideTaskGuidePointUnTrackClick()
  for k, v in pairs(self.IndicatorWidgets) do
    if v.UnLockSpecialTask and v.TargetQuestChainId and v.TargetQuestChainId == MissionIndicatorManager.TrackingSpecialSideQuestChainId then
      v:StopAnimation(v.Loop)
    end
  end
  MissionIndicatorManager.TrackingSpecialSideQuestChainId = nil
  self.MapTipsWidget.Btn_Track:SetText(GText("UI_RegionMap_Track"))
  self.MapTipsWidget.Switch_Button:SetActiveWidgetIndex(1)
  if self.MapTipsWidget.SideQuestNpcId then
    EventManager:FireEvent(EventID.UpdateMiniMap, self.MapTipsWidget.QuestNpcId, "SpecialSide", "Delete")
    MissionIndicatorManager:ReactiveMissionIndicatorByRegionMap(self.MapTipsWidget.SideQuestNpcId)
    EventManager:FireEvent(EventID.OnChangeTaskIndicator, TaskUtils.MissionNpcGuideMaps)
  end
  self:ClosePanel()
end

function Component:OnGuidePointHover(InName)
  if InName and IsValid(self.SelectWidgetTable[InName]) and IsValid(self.IndicatorWidgets[InName]) and self.IndicatorWidgets[InName].IsSelected == false then
    self.SelectWidgetTable[InName]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.SelectWidgetTable[InName]:PlayAnimation(self.SelectWidgetTable[InName].Hover)
  end
end

function Component:OnGuidePointUnHover(InName)
  if InName and IsValid(self.SelectWidgetTable[InName]) and IsValid(self.IndicatorWidgets[InName]) and self.IndicatorWidgets[InName].IsSelected == false then
    self.SelectWidgetTable[InName]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.SelectWidgetTable[InName]:PlayAnimation(self.SelectWidgetTable[InName].Out)
  end
end

function Component:InitTaskArea()
  local uiManager = UIManager(self)
  local Result = uiManager:GetAllUINameByBPClass(UE4.UClass.Load(UIConst.TASKINDICATORUIBASE))
  for i = 1, Result:Length() do
    local UIName = Result:GetRef(i)
    local UIObj = uiManager:GetUIObj(UIName)
    if UIObj.TargetAreaName then
      local TargetArea = self.GameState.QuestArea[UIObj.TargetAreaName]
      if not TargetArea then
        return
      end
      local pos = TargetArea:K2_GetActorLocation()
      local location = self:TransformWorldLocToUILoc(pos.X, pos.Y)
      local scale = FVector2D(TargetArea.Radius * 2 * self.Scale / 230)
      local area = self:NewArea()
      area:SetRenderTranslation(location)
      area:SetRenderScale(scale)
      table.insert(self.TaskArea, area)
    end
  end
end

function Component:CreateDynamicRegionMapGuidPointIndicator(InName)
  if not self.RegionMapIndicatorWidgets[InName] then
    local Widget = self:NewIndicator()
    self.RegionMapIndicatorWidgets[InName] = Widget
    if self.IndicatorWidgets[InName] and IsValid(self.IndicatorWidgets[InName]) then
      Widget:Init(self, self.ScreenSize - self.BgHeight, self.IndicatorWidgets[InName], false)
    end
    Widget.Slot:SetZOrder(3)
  end
  if self.RegionMapIndicatorWidgets[InName] and IsValid(self.RegionMapIndicatorWidgets[InName]) and self.IndicatorWidgets[InName] then
    self.RegionMapIndicatorWidgets[InName]:SetIcon(self.IndicatorWidgets[InName].Img_GuidePoint_Icon.Brush.ResourceObject)
    self.RegionMapIndicatorWidgets[InName]:OnPointerMove(self.CurrentDragOffset, self.IndicatorWidgets[InName].RenderTransform.Translation)
  end
end

function Component:CreateTaskRegionMapGuidPointIndicator(InName)
  if not self.RegionMapIndicatorWidgets[InName] then
    local Widget = self:NewIndicator()
    self.RegionMapIndicatorWidgets[InName] = Widget
    if self.IndicatorWidgets[InName] and IsValid(self.IndicatorWidgets[InName]) then
      Widget:Init(self, self.ScreenSize - self.BgHeight, self.IndicatorWidgets[InName], false)
    end
    Widget.Slot:SetZOrder(3)
  end
  if self.RegionMapIndicatorWidgets[InName] and IsValid(self.RegionMapIndicatorWidgets[InName]) and self.IndicatorWidgets[InName] then
    self.RegionMapIndicatorWidgets[InName]:SetIcon(self.IndicatorWidgets[InName].Img_Point.Brush.ResourceObject)
    self.RegionMapIndicatorWidgets[InName]:OnPointerMove(self.CurrentDragOffset, self.IndicatorWidgets[InName].RenderTransform.Translation)
  end
end

function Component:RemoveRegionMapGuidPointIndicator(InName)
  if self.RegionMapIndicatorWidgets[InName] then
    self.RegionMapIndicatorWidgets[InName]:RemoveFromParent()
    self.RegionMapIndicatorWidgets[InName] = nil
  end
end

return Component
