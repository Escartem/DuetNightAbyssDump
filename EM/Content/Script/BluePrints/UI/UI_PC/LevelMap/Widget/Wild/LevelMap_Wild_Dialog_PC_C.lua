require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
M._components = {
  "BluePrints.UI.UIComponent.TouchComponent",
  "BluePrints.UI.UI_PC.Common.LSFocusComp",
  "BluePrints.UI.UI_PC.LevelMap.Widget.Wild.Components.TeleportPointComponent",
  "BluePrints.UI.UI_PC.LevelMap.Widget.Wild.Components.RegionPointComponent",
  "BluePrints.UI.UI_PC.LevelMap.Widget.Wild.Components.MarkPointComponent",
  "BluePrints.UI.UI_PC.LevelMap.Widget.Wild.Components.DoorIconComponent",
  "BluePrints.UI.UI_PC.LevelMap.Widget.Wild.Components.FloorBoxComponent",
  "BluePrints.UI.UI_PC.LevelMap.Widget.Wild.Components.DispatchPointComponent",
  "BluePrints.UI.UI_PC.LevelMap.Widget.Wild.Components.TaskIndicatorComponent"
}
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local CommonUtils = require("Utils.CommonUtils")
local TimeUtils = require("Utils.TimeUtils")
local ControlPriority = {
  Normal = 0,
  Inertia = 1,
  Stop = 2,
  Resilience = 3,
  Drag = 4
}

function M:Construct()
  self.Super.Construct(self)
  self.Scale = 0.03333333333333333
  self.WheelMaxScale = 1.25
  self.WheelMinScale = 0.5
  self.MapPanelCPP = self.Panel_Map
  self.PointPanelCPP = self.Panel_Point
  self.GamerCPP = self.Gamer
  self.DirectionCPP = self.Direction
  self.IsDragging = false
  self.IsClicked = false
  self.levelLoader = UGameplayStatics.GetGameInstance(self):GetSceneManager():GetLevelLoader()
  self.Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  self.IsInRegion = false
  self.CurrentConveyId = nil
  self.CurTrackDispatchId = nil
  self.ChangeAreaWidget = nil
  self.MapTipsWidget = nil
  self.GameState = UGameplayStatics.GetGameState(self)
  self.ScreenSize = UIManager(self):GetDesignedScreenSize(self)
  FVector2D.Div(self.ScreenSize, 2)
  self.MaxFloorId = 0
  self.CurrentFloorId = self.MaxFloorId
  self.BranchQuestMiniPointWidgets = {}
  self.BranchQuestPointWidgets = {}
  self.IndicatorWidgets = {}
  self.RegionMapIndicatorWidgets = {}
  self.DispatchPoint = {}
  self.MiniDispatchPoint = {}
  self.DispatchSelect = {}
  self.DispatchLocations = {}
  self.EnterTaskRegion = {}
  self.CurClickDispatchId = 0
  self.OriginalRegionId = 0
  self.MaxMarkNum = math.floor(DataMgr.GlobalConstant.MaxMapMarkIcon.ConstantValue)
  self.MapDrawMistyMaterialInstance = UKismetMaterialLibrary.CreateDynamicMaterialInstance(self, self.MapDrawMistyMaterial)
  EventManager:AddEvent(EventID.EnterOrExitFloor, self, self.EnterOrExitFloor)
  EventManager:AddEvent(EventID.OnCommonTrack, self, self.OnCommonTrack)
  EventManager:AddEvent(EventID.OnSkipRegion, self, self.OnSkipRegion)
  EventManager:AddEvent(EventID.GameViewportSizeChanged, self, self.GameViewportSizeChanged)
  EventManager:AddEvent(EventID.ConditionComplete, self, self.OnConditionComplete)
  self:AddComponentEvent()
  self.MiniMapTrackQuestId = nil
  self.IsOpenDispatch = false
end

function M:AddComponentEvent()
end

function M:RemoveComponentEvent()
end

function M:Destruct()
  M.Super.Destruct(self)
  self:RemoveComponentEvent()
  EventManager:RemoveEvent(EventID.EnterOrExitFloor, self)
  EventManager:RemoveEvent(EventID.OnCommonTrack, self)
  EventManager:RemoveEvent(EventID.OnSkipRegion, self)
  EventManager:RemoveEvent(EventID.GameViewportSizeChanged, self)
  EventManager:RemoveEvent(EventID.OnDispatchExistingComplete, self)
  EventManager:RemoveEvent(EventID.ConditionComplete, self)
  self:RemoveTimer("TickRegionMapImageOpen")
  self:RemoveTimer("TickPointActivityTime")
  if not self.IsMiniMap and not self.IsEmpty then
    self:ClosePanel(true)
  end
  self:ClearData()
  if self.Indicator then
    self.Indicator:RemoveFromParent()
  end
  self:RemoveTrackIndicator()
  if self.MarkPanel then
    self.MarkPanel:RemoveFromParent()
  end
  if self.RegionInfo then
    self.RegionInfo:RemoveFromParent()
  end
  if self.LevelMap_Convey_Widget_PC then
    self.LevelMap_Convey_Widget_PC:RemoveFromParent()
  end
  if self.TureHardBoss_MapTips then
    self.TureHardBoss_MapTips:RemoveFromParent()
  end
  if self.ChangeAreaWidget then
    self.ChangeAreaWidget:RemoveFromParent()
  end
  if self.Panel_Close then
    self.Panel_Close:SetVisibility(ESlateVisibility.Collapsed)
  end
  if self.GamepadSelect then
    self.GamepadSelect:RemoveFromParent()
    self.GamepadSelect = nil
  end
  if self.InteractivePanel then
    self.InteractivePanel.WBox:ClearChildren()
  end
  self:RemoveFocusTarget("Right")
end

function M:ClearData()
  if self.FloorWidget then
    self.FloorWidget:ClearData()
  end
  if self.SelectWidgetTable then
    for _, select in pairs(self.SelectWidgetTable) do
      select:RemoveFromParent()
    end
    self.SelectWidgetTable = {}
  end
  if self.MapImage then
    self.MapImage:RemoveFromParent()
    self.MapImage = nil
  end
  self:RemoveTrackIndicator()
end

function M:Init(IsMiniMap, RegionID, MainMap, InitCompleteFunc)
  self.IsMiniMap = IsMiniMap
  if DataMgr.Region[RegionID] and DataMgr.Region[RegionID].RegionMapId then
    self.RegionID = DataMgr.RegionMap[DataMgr.Region[RegionID].RegionMapId].RegionId
  else
    self.RegionID = RegionID
  end
  self.MainMap = MainMap
  self.InitComplete = false
  if self.CoroutineInitObj then
    coroutine.close(self.CoroutineInitObj)
  end
  if self.InitCoroutines then
    for _, Coroutine in pairs(self.InitCoroutines) do
      coroutine.close(Coroutine)
    end
  end
  local Avatar = GWorld:GetAvatar()
  if self.RegionID and DataMgr.Region[self.RegionID] and Avatar.CurrentRegionId ~= 100104 or self.IsMiniMap then
    self.Panel_Empty:SetVisibility(ESlateVisibility.Collapsed)
    self.IsEmpty = false
  else
    self.Panel_Empty:SetVisibility(ESlateVisibility.HitTestInvisible)
    self.Panel_Gamer:SetVisibility(ESlateVisibility.Collapsed)
    self.Text_Describe:SetText(GText("UI_Banned_Des_Map"))
    self.IsEmpty = true
    self.MainMap.Slider_Zoom:SetVisibility(ESlateVisibility.Collapsed)
    self.MainMap.WildMapKeysShow = false
    self.MainMap.Tab:SetVisibility(ESlateVisibility.Collapsed)
    self.MainMap.Entrance_Dispatch:SetVisibility(ESlateVisibility.Collapsed)
    self.MainMap.FloorWidget:SetVisibility(ESlateVisibility.Collapsed)
    self:PlayAnimation(self.Auto_In)
    self.InitComplete = true
    return
  end
  self.RegionData = DataMgr.Region[self.RegionID]
  self.InitCompleteFunc = InitCompleteFunc
  self.InitCoroutines = {}
  self.CoroutineInitObj = CreateCoroutine(self.InitCoroutine)
  coroutine.resume(self.CoroutineInitObj, self)
end

function M:InitCoroutine()
  if self.RegionData.RegionMapImage then
    self.MapRotation = self.RegionData.RegionRotation or 0
    self.MapImage = UIManager(self):_CreateWidgetByUMGClass(LoadClass(self.RegionData.RegionMapImage), nil, nil, nil, false)
    if self.MapImage then
      self.Panel_Map:AddChild(self.MapImage)
      self.MapImage:SetRenderTransformAngle(self.MapRotation)
      local half = UKismetMathLibrary.Vector2D_One() / 2
      local anchors = self.MapImage.Slot:GetAnchors()
      anchors.Minimum = half
      anchors.Maximum = half
      self.MapImage.Slot:SetAnchors(anchors)
      self.MapImage.Slot:SetAutoSize(true)
      self.MapImage.Slot:SetAlignment(half)
      self.NewMapType = self.MapImage.Img_Map == nil
      self.AllMapImage:Clear()
      self.MapImage2LocalPos:Clear()
      self.AllMapImage:Append(UUIFunctionLibrary.GetAllImageWidget(self.MapImage))
      self.MapFog = {}
      if not self.NewMapType then
        self:CreateMapFog(self.MapImage.Img_Map, self.MaxFloorId, self.RegionID)
      else
        self.MapImageTable = {}
        self.MapBoxMax = FVector2D(0, 0)
        self.MapBoxMin = FVector2D(0, 0)
        local mapJointOffset
        local tempRotation = self.MapRotation
        self.MapRotation = 0
        local tempScale = FVector2D()
        tempScale:Set(self.MapScale.X, self.MapScale.Y)
        if 0 == self.MapScale.X or 0 == self.MapScale.Y then
          self.MapScale:Set(1, 1)
        end
        for _, subRegionId in pairs(self.RegionData.IsRandom) do
          if self.MapImage[subRegionId] then
            local tempImage = self.MapImage[subRegionId]
            self.MapImageTable[subRegionId] = tempImage
            self:CreateMapFog(tempImage, self.MaxFloorId, subRegionId)
            local subRegionData = DataMgr.SubRegion[subRegionId]
            if subRegionData and subRegionData.SubRegionCenter and #subRegionData.SubRegionCenter > 1 then
              if not mapJointOffset then
                mapJointOffset = tempImage.Slot:GetPosition()
                self.MapImageCenter = FVector2D(subRegionData.SubRegionCenter[1], subRegionData.SubRegionCenter[2])
              else
                local position = self:TransformWorldLocToUILoc(subRegionData.SubRegionCenter[1], subRegionData.SubRegionCenter[2]) / self.MapScale + mapJointOffset
                tempImage.Slot:SetPosition(position)
                if self.MapImage["Panel_" .. subRegionId] then
                  self.MapImage["Panel_" .. subRegionId].Slot:SetPosition(position)
                end
              end
              tempImage:ForceLayoutPrepass()
              local tempPos = tempImage.Slot:GetPosition()
              local tempSize = tempImage.Slot:GetSize()
              self.MapBoxMax:Set(math.max(self.MapBoxMax.X, tempPos.X + tempSize.X / 2), math.max(self.MapBoxMax.Y, tempPos.Y + tempSize.Y / 2))
              self.MapBoxMin:Set(math.min(self.MapBoxMin.X, tempPos.X - tempSize.X / 2), math.min(self.MapBoxMin.Y, tempPos.Y - tempSize.Y / 2))
            else
              error("\229\173\144\229\140\186\229\159\159" .. subRegionId .. "\231\188\186\229\176\145Grdiframe\229\157\144\230\160\135\239\188\129")
            end
          end
        end
        local centerOffset = (self.MapBoxMax + self.MapBoxMin) / -2
        self.MapImage.Main:SetRenderTranslation(centerOffset)
        self.MapImageCenter = (centerOffset * -1 - mapJointOffset) / self.Scale + self.MapImageCenter
        self.MapRotation = tempRotation
        self.MapScale:Set(tempScale.X, tempScale.Y)
      end
    end
  end
  if not self.NewMapType then
    local center = FVector2D()
    if self.RegionData.RegionMapImageCenter and #self.RegionData.RegionMapImageCenter > 1 then
      center:Set(self.RegionData.RegionMapImageCenter[1], self.RegionData.RegionMapImageCenter[2])
    end
    self.MapImageCenter = center
  end
  self.MapScale = FVector2D(1, 1)
  self.CurrentDragOffset = FVector2D()
  self.BuildingFloor2Map = {}
  self.BuildingName2Map = {}
  self.BulidingState = {}
  self.LimitOffset = nil
  self.DragLimitOffset = nil
  self.TaskArea = {}
  self.SelectWidgetTable = {}
  self.IsConveyClicked = false
  if self.IsMiniMap then
    self:InitInMiniMap()
  else
    self.MainMap.WildMapKeysShow = true
    self.MainMap.Tab:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:InitInRegionMap()
  end
  self:InitComponentCoroutine()
  coroutine.yield()
  self:InitMapFog()
  if self.DefaultFloorId and self.FloorWidgetTable and self.FloorWidgetTable[self.DefaultFloorId] then
    self.FloorWidgetTable[self.DefaultFloorId].Btn.OnClicked:Broadcast()
    self.FloorWidgetTable[self.DefaultFloorId]:PlayAnimation(self.FloorWidgetTable[self.MaxFloorId].Click)
    self.FloorWidgetTable[self.DefaultFloorId].SizeBox:SetRenderOpacity(self.IsInRegion and 1 or 0)
  end
  self:InitTaskArea()
  if self.IsMiniMap and GWorld.GameInstance.TrackingID then
    self:OnCommonTrack(GWorld.GameInstance.TrackingID, true)
  end
  if self.InitCompleteFunc then
    self.InitCompleteFunc()
  end
  self:InitDispatchCondition()
  self.InitComplete = true
  self.CoroutineInitObj = nil
  if self.IsMiniMap then
    local Array = GWorld.GameInstance:GetSceneManager().FloorBoxArray
    if Array then
      self.CurrentFloorId = nil
      for _, FloorBox in pairs(Array) do
        FloorBox:CheckPlayerIn()
        DebugPrint("MiniMap Wild CheckPlayerIn", FloorBox:GetName())
      end
      DebugPrint("MiniMap Wild CheckPlayerIn", self.CurrentFloorId)
    end
    if not self.CurrentFloorId then
      self:ShowFloor(self.MaxFloorId)
    end
  end
end

function M:InitCoroutineCheck(Index)
  if not Index then
    return
  end
  self.InitCoroutines[Index] = nil
  DebugPrint("RegionMap InitCoroutineCheck", Index)
  if CommonUtils.IsEmpty(self.InitCoroutines) then
    coroutine.resume(self.CoroutineInitObj)
  end
end

function M:InitInMiniMap()
  self.Panel_Gamer:SetVisibility(ESlateVisibility.Collapsed)
  self.Panel_Bg:SetVisibility(ESlateVisibility.Collapsed)
  self.BackgroundBlur:SetVisibility(ESlateVisibility.Collapsed)
  self:SetVisibility(ESlateVisibility.HitTestInvisible)
  if self.MapImage then
    self.MapImage:SetRenderOpacity(self.BattleMapOpacity)
  end
  self.MiniMapRad = 135
  local Avatar = GWorld:GetAvatar()
  self:OnSkipRegion(Avatar.CurrentRegionId)
  self:AddTimer(0.1, function()
    if MissionIndicatorManager.TrackingSpecialSideQuestChainId and DataMgr.QuestChain[MissionIndicatorManager.TrackingSpecialSideQuestChainId] and DataMgr.QuestChain[MissionIndicatorManager.TrackingSpecialSideQuestChainId].SpecialQuestDisplayName and DataMgr.QuestChain[MissionIndicatorManager.TrackingSpecialSideQuestChainId].QuestNpcId then
      MissionIndicatorManager:ActiveMissionIndicatorByRegionMap(DataMgr.QuestChain[MissionIndicatorManager.TrackingSpecialSideQuestChainId].SpecialQuestDisplayName, DataMgr.QuestChain[MissionIndicatorManager.TrackingSpecialSideQuestChainId].QuestNpcId)
    end
  end)
end

function M:InitInRegionMap()
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_switch_to_level", "", nil)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if not self.GamepadSelect then
    self.GamepadSelect = NewObject(LoadClass("/Game/UI/WBP/Map/Widget/WBP_Map_Select.WBP_Map_Select_C"), self)
    self.Panel_Gamer:GetParent():AddChild(self.GamepadSelect)
    self:AdjustSlot(self.GamepadSelect.Slot)
  end
  self.GamepadSelect:SetVisibility(self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad and ESlateVisibility.SelfHitTestInvisible or ESlateVisibility.Collapsed)
  self.GamepadSelect:PlayAnimation(self.GamepadSelect.Normal)
  self:AddInputMethodChangedListen()
  self:SetControlPriority(ControlPriority.Normal)
  self:SetVisibility(ESlateVisibility.Visible)
  self.CurrentFloorId = self.MaxFloorId
  self.Panel_Bg:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.BackgroundBlur:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self:PlayAnimation(self.Auto_In)
  self.MapScale = FVector2D(0.75, 0.75)
  self.BackgroundScale = FVector2D(self.BackgroundMinScale.X, self.BackgroundMinScale.Y)
  self.MapImage:SetRenderScale(self.MapScale)
  self.MapImage:SetRenderOpacity(self.RegionMapOpacity)
  self.Bg_Map:SetRenderScale(self.BackgroundMinScale)
  self.CurrentInnerSubRegionId = nil
  self.CurrentInnerId = nil
  self.RegionIcon = nil
  self.WorldId = nil
  for _, MapData in pairs(DataMgr.WorldMap) do
    for _, regionMapId in pairs(MapData.WorldMapRegion) do
      if self.RegionID == DataMgr.RegionMap[regionMapId].RegionId then
        self.RegionIcon = MapData.RegionIcon
        self.WorldId = MapData.WorldMapId
        break
      end
    end
  end
  self.Panel_Gamer:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.WS_Indoor:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local Avatar = GWorld:GetAvatar()
  self.IsInRegion = Avatar.CurrentRegionId and DataMgr.SubRegion[Avatar.CurrentRegionId].RegionId == self.RegionID
  if self.IsInRegion and not DataMgr.SubRegion[Avatar.CurrentRegionId].NotShowInRegionMap then
    self.WS_Indoor:SetActiveWidgetIndex(0)
    self.Direction:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Gamer:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.gamerLoc = self:TransformWorldLocToUILoc(self.Player.CurrentLocation.X, self.Player.CurrentLocation.Y)
    self.Gamer:SetRenderTranslation(self.gamerLoc)
    self.Direction:SetRenderTranslation(self.gamerLoc)
    self.Direction:SetRenderTransformAngle(self.Player:GetController().PlayerCameraManager:GetCameraRotation().Yaw + self.MapRotation + 90)
    self.Gamer:SetRenderTransformAngle(self.Player.CurrentRotation.Yaw + self.MapRotation + 90)
  else
    if self.IsInRegion then
      self.CurrentInnerSubRegionId = Avatar.CurrentRegionId
      self.WS_Indoor:SetActiveWidgetIndex(1)
    else
      local RegionMapId = DataMgr.Region[DataMgr.Subregion[Avatar.CurrentRegionId].RegionId].RegionMapId
      local SpecialCheck = RegionMapId and DataMgr.RegionMap[RegionMapId].RegionId == self.RegionID or false
      if SpecialCheck then
        self.CurrentInnerSubRegionId = Avatar.CurrentRegionId
        self.WS_Indoor:SetActiveWidgetIndex(1)
      else
        self.WS_Indoor:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
    self.gamerLoc = nil
  end
  if not self.RegionInfo then
    self.RegionInfo = self:CreateWidgetAsync("RegionMapRegionInfo", self.CoroutineInitObj)
    self.MainMap.AreaInfo:AddChild(self.RegionInfo)
    self.RegionInfo.Btn_ShowUp:BindEventOnClicked(self, self.OnClickOpenRegionList)
    self.RegionInfo.Btn_Name.OnClicked:Clear()
    self.RegionInfo.Btn_Name.OnClicked:Add(self, self.OnClickOpenRegionList_Sound)
    self.RegionInfo.Impression_Dimension:UnBindEventOnClicked(self, self.OnClickDimension)
    self.RegionInfo.Impression_Dimension:BindEventOnClicked(self, self.OnClickDimension)
    self:AddLSFocusTarget(self.RegionInfo.Impression_Dimension.Key_Dimension, self.RegionInfo.Impression_Dimension, "Right", true)
    local IconTexture = TaskUtils:GetIconTextureByTrackQuestChainType()
    if IconTexture then
      self.RegionInfo.GuidePoint.Img_GuidePoint_Icon:SetBrushResourceObject(IconTexture)
    end
    self.RegionInfo:SetVisibility(ESlateVisibility.Collapsed)
  end
  if self:CheckIsTrackingQuest(self.RegionID) then
    self.RegionInfo.GuidePoint:PlayAnimation(self.RegionInfo.GuidePoint.Loop, 0, 0)
    self.RegionInfo.Panel_Guidepoint:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.RegionInfo.GuidePoint:StopAllAnimations()
    self.RegionInfo.Panel_Guidepoint:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.RegionInfo:Init(self.RegionID, self.MainMap.Spacer_Impression)
  if self.MapImage then
    self.MapImage:SetRenderTranslation(self.CurrentDragOffset)
    self.Bg_Map:SetRenderTranslation(self.CurrentDragOffset * self.BackgroundDragRatio)
  end
  self.Panel_Gamer:SetRenderTranslation(self.CurrentDragOffset)
  self.Panel_Point:SetRenderTranslation(self.CurrentDragOffset)
  self.FloorWidget = self.MainMap.FloorWidget
  self.FloorWidget:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  if not self.LevelMap_Convey_Widget_PC then
    self.LevelMap_Convey_Widget_PC = self:CreateWidgetAsync("RegionMapConvey", self.CoroutineInitObj)
    self.MainMap.Convey:AddChild(self.LevelMap_Convey_Widget_PC)
    self.LevelMap_Convey_Widget_PC.Text_LockTips:SetText(GText("UI_TELEPORTPOINT_UNLOCK"))
    self.LevelMap_Convey_Widget_PC.Btn_Go:SetText(GText("UI_MECHANISM_105"))
    self.LevelMap_Convey_Widget_PC.Btn_Track:SetText(GText("UI_RegionMap_Track"))
    self.LevelMap_Convey_Widget_PC.Btn_Go:BindEventOnClicked(self, self.OnConveyClicked)
    self.LevelMap_Convey_Widget_PC.Btn_Track:BindEventOnClicked(self, self.OnConveyTrace)
    self.LevelMap_Convey_Widget_PC.Btn_Track:TryOverrideSoundFunc(self.OnTraceSound)
    self.LevelMap_Convey_Widget_PC.Btn_Go_Track:BindEventOnClicked(self, self.OnConveyGoTrace)
    self.LevelMap_Convey_Widget_PC.Btn_Go_Track:TryOverrideSoundFunc(self.OnTraceSound)
    self.LevelMap_Convey_Widget_PC.Btn_Go_Track:SetText(GText("UI_RegionMap_Track"))
    self.LevelMap_Convey_Widget_PC:InitWildMap(self)
  end
  self.LevelMap_Convey_Widget_PC:SetVisibility(ESlateVisibility.Collapsed)
  if not self.TureHardBoss_MapTips then
    self.TureHardBoss_MapTips = self:CreateWidgetAsync("HardBossMapTips", self.CoroutineInitObj)
    self.MainMap.Convey_HardBoss:AddChild(self.TureHardBoss_MapTips)
    self.TureHardBoss_MapTips:BindToAnimationFinished(self.TureHardBoss_MapTips.Out, {
      self.TureHardBoss_MapTips,
      self.TureHardBoss_MapTips.PlayOutAnimFinished
    })
    self.TureHardBoss_MapTips.Common_Button_Text_PC:BindEventOnClicked(self, self.OnConveyClicked)
    self.TureHardBoss_MapTips.Parent = self
  end
  if self.RegionIcon then
    local Icon = LoadObject(self.RegionIcon)
    if Icon then
      self.TureHardBoss_MapTips.Icon_Camp:SetBrushResourceObject(Icon)
    end
  end
  self.TureHardBoss_MapTips:SetVisibility(ESlateVisibility.Collapsed)
  if not self.InteractivePanel then
    self.InteractivePanel = self.MainMap.Interactive_Locate
    local Item1 = self:CreateWidgetAsync("RegionMapSelectItem", self.CoroutineInitObj)
    self.InteractivePanel.WBox:AddChild(Item1)
    Item1.Img_Icon:SetBrushResourceObject(self.Gamer.Brush.ResourceObject)
    Item1.Text_Interactive:SetText(GText("UI_RegionMap_GotoCurrentPosition"))
    Item1.Button_Area.OnClicked:Add(self, self.JumpToCurrentPosition)
    local Item2 = self:CreateWidgetAsync("RegionMapSelectItem", self.CoroutineInitObj)
    self.InteractivePanel.WBox:AddChild(Item2)
    Item2.Img_Icon:SetBrushFromTexture(LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SideMission.T_Gp_SideMission"))
    Item2.Text_Interactive:SetText(GText("UI_RegionMap_GotoCurrentTask"))
    Item2.Button_Area.OnClicked:Add(self, self.JumpToTaskPosition)
    if self.MainMap.Btn_Location then
      self.MainMap.Btn_Location:SetText(GText("UI_RegionMap_GotoPosition"))
      self.MainMap.Btn_Location:BindEventOnClicked(self, self.OpenOptionSelect)
    end
  end
  self.BgHeight = FVector2D(0, self.MainMap.Tab_Top.Slot:GetSize().Y)
  if not self.Indicator then
    self.Indicator = self:CreateWidgetAsync("RegionMapIndicator", self.CoroutineInitObj)
    self.Panel_Floor:AddChild(self.Indicator)
    self:AdjustSlot(self.Indicator.Slot)
  end
  self.Indicator:Init(self, self.ScreenSize - self.BgHeight, self.Gamer, true)
  self.Indicator.Slot:SetZOrder(0)
  self:UpdateLimitOffset()
  if self.gamerLoc and not DataMgr.SubRegion[Avatar.CurrentRegionId].NotShowInRegionMap then
    self:MoveMapTo(self.gamerLoc * -1)
  elseif self.CurrentInnerSubRegionId then
    local HasInnerSubRegion = false
    for _, RegionPointData in pairs(DataMgr.RegionPoint) do
      if RegionPointData.TargetSubRegion then
        for _, TargetSbugRegionId in pairs(RegionPointData.TargetSubRegion) do
          if TargetSbugRegionId == self.CurrentInnerSubRegionId then
            self.CurrentInnerId = RegionPointData.Id
            local Pos = self:TransformWorldLocToUILoc(RegionPointData.Pos[1], RegionPointData.Pos[2])
            self.Gamer_Indoor:SetRenderTranslation(Pos)
            self:MoveMapTo(Pos * -1)
            HasInnerSubRegion = true
            break
          end
        end
      end
    end
    if not HasInnerSubRegion then
      self.WS_Indoor:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  self.Panel_Close = self.MainMap.Btn_Panel_Close
  self.Panel_Close.OnClicked:Clear()
  self.Panel_Close.OnClicked:Add(self, self.OnPanelClose)
  self.MainMap.Slider_Zoom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self:InitTouchLayer(self.Player, 0, 0, true)
  self:AddStaticSubTouchItem("RegionMapLayer", self.Panel_Touch, {
    MultiMove = self.TouchWildMapMultiMove,
    Down = self.OnRegionTouchDown,
    Move = self.OnRegionTouchMove,
    Up = self.OnRegionTouchUp
  })
end

function M:InitDispatchCondition()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local ConditionId = DataMgr.UIUnlockRule.Dispatch.ConditionId
  local Res = ConditionUtils.CheckCondition(Avatar, ConditionId)
  if not self.NormalInit then
    return
  end
  if Res then
    if self.MainMap.Entrance_Dispatch then
      self.MainMap.Entrance_Dispatch:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      SystemGuideManager:RunGuideById(2057)
    end
  elseif self.MainMap.Entrance_Dispatch then
    self.MainMap.Entrance_Dispatch:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:OnReturnKeyDown()
  if self.ChangeAreaWidget and self.ChangeAreaWidget:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
    self:ClosePanel()
    return true
  end
  return false
end

function M:CreateMapFog(MapWidget, FloorId, SubRegionId)
  SubRegionId = self.NewMapType and SubRegionId or self.RegionID
  local MapTable = UUIFunctionLibrary.GetAllImageWidget(MapWidget):ToTable()
  if not self.MapFog[SubRegionId] then
    self.MapFog[SubRegionId] = {}
  end
  if not self.MapFog[SubRegionId][FloorId] then
    self.MapFog[SubRegionId][FloorId] = {}
  end
  local NoFog = DataMgr.Region[self.RegionID].CloseBlock
  for Index, Map in pairs(MapTable) do
    self.MapFog[SubRegionId][FloorId][Index] = Map
    local Material
    if self.IsMiniMap then
      Material = UKismetMaterialLibrary.CreateDynamicMaterialInstance(self, self.MapMistyMaterialMiniMap)
    else
      Material = UKismetMaterialLibrary.CreateDynamicMaterialInstance(self, self.MapMistyMaterial)
    end
    Material:SetTextureParameterValue("Map", Map.Brush.ResourceObject)
    Material:SetScalarParameterValue("Layer", FloorId)
    Material:SetScalarParameterValue("Appear", NoFog and 0 or 1)
    Map:SetBrushFromMaterial(Material)
  end
end

function M:InitMapFog()
  if self.IsMiniMap then
  else
    UKismetRenderingLibrary.ClearRenderTarget2D(self, self.MapMistyRT)
    UKismetRenderingLibrary.ClearRenderTarget2D(self, self.MapMistyRT2)
    self:AddTimer(0.01, function()
      self:GetTeleportLocalPos()
      self:GetMapImageLocalPos()
      self.TickRegionMapImageOpen = true
    end)
  end
end

function M:UpdateMapImageFog()
  if not self.MapImage then
    return
  end
  local AddX = 100000
  local AddY = 100000
  local TempPos
  for SubRegionId, table1 in pairs(self.MapFog) do
    for FloorId, table2 in pairs(table1) do
      for _, Map in pairs(table2) do
        TempPos = self.MapImage2LocalPos:Find(Map)
        AddX = math.min(AddX, TempPos.X)
        AddY = math.min(AddY, TempPos.Y)
      end
    end
  end
  self.MapImageAddVector = FVector2D(AddX, AddY)
  self.MapPosPer = USlateBlueprintLibrary.TransformVectorAbsoluteToLocal(self.MapImage:GetCachedGeometry(), FVector2D(512, 512))
  self.MapPosPer = USlateBlueprintLibrary.TransformVectorLocalToAbsolute(self:GetCachedGeometry(), self.MapPosPer)
  self.MapPosPer:Set(math.abs(self.MapPosPer.X), math.abs(self.MapPosPer.Y))
  for SubRegionId, table1 in pairs(self.MapFog) do
    for FloorId, table2 in pairs(table1) do
      table.sort(table2, function(X, Y)
        local PosX = self.MapImage2LocalPos:Find(X)
        local PosY = self.MapImage2LocalPos:Find(Y)
        if PosX.Y == PosY.Y then
          return PosX.X < PosY.X
        else
          return PosX.Y < PosY.Y
        end
      end)
      for Index, Map in pairs(table2) do
        local Material = Map:GetDynamicMaterial()
        local Pos = self.MapImage2LocalPos:Find(Map)
        FVector2D.Sub(Pos, self.MapImageAddVector)
        FVector2D.Div(Pos, self.MapPosPer)
        local LinerColor = FLinearColor(Pos.X, Pos.Y, 0, 0)
        Material:SetVectorParameterValue("Offset", LinerColor)
        Material:SetScalarParameterValue("Rotator", self.MapRotation / 360.0)
        if _G.ShowRegionmapPane and not self.IsMiniMap then
          local Pane = UIManager(self):CreateWidget("/Game/UI/WBP/Map/Widget/RegionMap/WBP_Map_Pane.WBP_Map_Pane_C")
          Map:GetParent():AddChild(Pane)
          Pane.Slot:SetAnchors(Map.Slot:GetAnchors())
          Pane.Slot:SetPosition(Map.Slot:GetPosition())
          Pane.Slot:SetAlignment(Map.Slot:GetAlignment())
          Pane.Slot:SetZOrder(1)
          Pane.Text:SetText(Index)
          Pane:SetRenderTransformAngle(360 - self.MapRotation)
        end
      end
    end
  end
  local ShowFogAnimId = {}
  if not self.IsMiniMap and GWorld.GameInstance.ShowFogAnimId then
    for _, Id in pairs(GWorld.GameInstance.ShowFogAnimId) do
      ShowFogAnimId[Id] = true
    end
    local ShowId = GWorld.GameInstance.ShowFogAnimId[#GWorld.GameInstance.ShowFogAnimId]
    if self.Teleport2LocalPos[ShowId] then
      local Pos = self.Teleport2LocalPos[ShowId]
      FVector2D.Sub(Pos, self.MapImageAddVector)
      FVector2D.Div(Pos, self.MapPosPer)
      self.ShowFogPos = FLinearColor(Pos.X, Pos.Y, 0, 0)
    end
  end
  local AnimId = {}
  for Id, State in pairs(self.TeleportState) do
    if State or Const.UnlockRegionTeleport then
      local ShowAnimId = ShowFogAnimId[Id] and Id or nil
      if not ShowAnimId then
        self:UpdateSingleMapFogByTeleport(DataMgr.TeleportPoint[Id].Block, true, nil)
      else
        table.insert(AnimId, ShowAnimId)
      end
    end
  end
  local Avatar = GWorld:GetAvatar()
  for Id, Data in pairs(DataMgr.MapFogCondition) do
    if Data.RegionId == self.RegionID and ConditionUtils.CheckCondition(Avatar, Id) or Const.UnlockRegionTeleport then
      self:UpdateSingleMapFogByTeleport(Data.Block, true, nil)
    end
  end
  for _, ShowAnimId in pairs(AnimId) do
    if self.TeleportPoints[ShowAnimId] then
      self.TeleportPoints[ShowAnimId]:PlayAnimation(self.TeleportPoints[ShowAnimId].FirstUnlock)
    end
    self:UpdateSingleMapFogByTeleport(DataMgr.TeleportPoint[ShowAnimId].Block, true, ShowAnimId)
  end
  if self.ShowFogPos then
    local Seconds, PartialSeconds = UGameplayStatics.GetAccurateRealTime()
    local Time = Seconds + PartialSeconds
    for _, Image in pairs(self.AllMapImage) do
      local Material = Image:GetDynamicMaterial()
      if Material then
        Material:SetVectorParameterValue("Position", self.ShowFogPos)
        Material:SetScalarParameterValue("Time", Time)
      end
    end
    AudioManager(self):PlayUISound(self, "event:/ui/common/map_mist_disappear", nil, nil)
  end
  if not self.IsMinimap then
    GWorld.GameInstance.ShowFogAnimId = nil
  end
end

function M:UpdateSingleMapFogByTeleport(TeleportJson, ShowFog, ShowAnimId)
  if not TeleportJson then
    return
  end
  local Liner
  if ShowAnimId and self.Teleport2LocalPos[ShowAnimId] then
    if self.IsMiniMap or not self.ShowFogPos then
      local Pos = self.Teleport2LocalPos[ShowAnimId]
      FVector2D.Sub(Pos, self.MapImageAddVector)
      FVector2D.Div(Pos, self.MapPosPer)
      Liner = FLinearColor(Pos.X, Pos.Y, 0, 0)
    else
      Liner = self.ShowFogPos
    end
  end
  local Seconds, PartialSeconds = UGameplayStatics.GetAccurateRealTime()
  local Time = Seconds + PartialSeconds
  for _, Block in pairs(TeleportJson) do
    local SubRegionId = self.NewMapType and Block.SubRegionId or self.RegionID
    if SubRegionId and self.MapFog[SubRegionId] and self.MapFog[SubRegionId][Block.FloorId] and self.MapFog[SubRegionId][Block.FloorId][Block.Big] then
      if ShowFog then
        local MapMaterial = self.MapFog[SubRegionId][Block.FloorId][Block.Big]:GetDynamicMaterial()
        for _, Index in pairs(Block.Small) do
          self.MapDrawMistyMaterialInstance:SetScalarParameterValue("Pos", Index - 1)
          self.MapDrawMistyMaterialInstance:SetVectorParameterValue("Offset", MapMaterial:K2_GetVectorParameterValue("Offset"))
          self.MapDrawMistyMaterialInstance:SetScalarParameterValue("Layer", Block.FloorId)
          if self.IsMiniMap then
            UKismetRenderingLibrary.DrawMaterialToRenderTarget(self, self.MapMistyRTMiniMap, self.MapDrawMistyMaterialInstance)
          elseif Liner then
            UKismetRenderingLibrary.DrawMaterialToRenderTarget(self, self.MapMistyRT, self.MapDrawMistyMaterialInstance)
          else
            UKismetRenderingLibrary.DrawMaterialToRenderTarget(self, self.MapMistyRT2, self.MapDrawMistyMaterialInstance)
          end
        end
        if Liner then
          MapMaterial:SetVectorParameterValue("Position", Liner)
          MapMaterial:SetScalarParameterValue("Time", Time)
        end
      end
    elseif Const.EnableTaskPrintError then
      ScreenPrint(string.format("\229\156\176\229\155\190\232\191\183\233\155\190block\228\184\141\229\173\152\229\156\168\239\188\140SubRegionId:%s  FloorId:%s  BlockIndex:%s", SubRegionId, Block.FloorId, Block.Big))
    end
  end
end

function M:OnConditionComplete(ConditionId)
  local Avatar = GWorld:GetAvatar()
  local Data = DataMgr.MapFogCondition[ConditionId]
  if Data and Data.RegionId == self.RegionID and ConditionUtils.CheckCondition(Avatar, ConditionId) then
    self:UpdateSingleMapFogByTeleport(Data.Block, true, nil)
  end
end

function M:OnSkipRegion(SubRegionId)
  if not self.IsMiniMap or not self.MapImage then
    return
  end
  if DataMgr.SubRegion[SubRegionId].NotShowInRegionMap then
    self.Panel_Point:SetVisibility(ESlateVisibility.Collapsed)
    self.MapImage:SetVisibility(ESlateVisibility.Collapsed)
    self.HideTrack = true
  else
    self.Panel_Point:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.MapImage:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.HideTrack = false
    if not self.TickRegionMapImageOpen then
      UKismetRenderingLibrary.ClearRenderTarget2D(self, self.MapMistyRTMiniMap)
      self:AddTimer(0.1, function()
        local UIManager = GWorld.GameInstance:GetGameUIManager()
        local Battle = UIManager:GetUIObj("BattleMain")
        if self.MainMap.Battle and self.MainMap.Battle:IsVisible() and self.MainMap:IsVisible() and Battle and not Battle:IsHide() then
          DebugPrint("TickRegionMapImageOpen")
          self:GetTeleportLocalPos()
          self:GetMapImageLocalPos()
          self.TickRegionMapImageOpen = true
          self:RemoveTimer("TickRegionMapImageOpen")
        end
      end, true, 0, "TickRegionMapImageOpen")
    end
  end
  self:CheckRegionPointCancelTrack(SubRegionId)
end

function M:PlayCloseAnimation()
  self:PlayAnimation(self.Auto_Out)
  local Task = UIManager(self):GetUIObj("TaskPanel")
  if Task then
    local Objs = MissionIndicatorManager:GetAllIndicatorUIObjs()
    if not IsEmptyTable(Objs) then
      for Name, UIObj in pairs(Objs) do
        UIObj:Hide("UIPopUp")
      end
    end
  end
  if self.IsEmpty then
    return
  end
  if self.RegionInfo then
    self.RegionInfo:Close()
  end
  self:ClosePanel()
  local Impression = UIManager(self):GetUIObj("RegionMapImpression")
  if Impression then
    Impression:Close()
  end
end

function M:NewPoint()
  local point, select = self.Overridden.NewPoint(self)
  if self.IsMiniMap then
    point:SetRenderScale(self.MinimapIconScale)
  else
    point:SetRenderScale(UKismetMathLibrary.Vector2D_One())
  end
  return point, select
end

function M:NewPointAsync(Coroutine)
  local Point = self:CreateWidgetAsync("RegionMapPoint", Coroutine)
  self.Panel_Point:AddChild(Point)
  local Select = self:CreateWidgetAsync("RegionMapSelect", Coroutine)
  self.Panel_Point:AddChild(Select)
  self:AdjustSlot(Point.Slot)
  self:AdjustSlot(Select.Slot)
  if self.IsMiniMap then
    Point:SetRenderScale(self.MinimapIconScale)
  else
    Point:SetRenderScale(UKismetMathLibrary.Vector2D_One())
  end
  Point.Slot:SetZOrder(0)
  Select.Slot:SetZOrder(10)
  Select:SetVisibility(ESlateVisibility.Collapsed)
  return Point, Select
end

function M:OnPanelClose()
end

function M:OpenOptionSelect()
  self:OnPanelOpen(6)
  self.MainMap:OpenOptionSelect()
  local Avatar = GWorld:GetAvatar()
  local TaskCheck = false
  if Avatar then
    local TrackingQuestChainId = Avatar.TrackingQuestChainId
    local TrackingQuestId = 0
    if Avatar.QuestChains[TrackingQuestChainId] then
      TrackingQuestId = Avatar.QuestChains[TrackingQuestChainId].DoingQuestId
    end
    if 0 ~= TrackingQuestId then
      local SubRegionId = MissionIndicatorManager:GetTargetTaskSubRegionId(TrackingQuestChainId, TrackingQuestId)
      if SubRegionId and 0 ~= SubRegionId then
        TaskCheck = true
      end
    end
    local QuestItem = self.InteractivePanel.WBox:GetChildAt(1)
    QuestItem:SetVisibility(TaskCheck and ESlateVisibility.SelfHitTestInvisible or ESlateVisibility.Collapsed)
    if TaskCheck then
      local IconTexture = TaskUtils:GetIconTextureByTrackQuestChainType()
      if IconTexture then
        QuestItem.Img_Icon:SetBrushFromTexture(IconTexture)
      end
    end
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  if self.IsMiniMap then
    return UWidgetBlueprintLibrary.Unhandled()
  end
  if not self.InitComplete then
    return UWidgetBlueprintLibrary.Handled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self.IsEmpty then
    if "Escape" == InKeyName or InKeyName == UIConst.GamePadKey.FaceButtonRight then
      return UWidgetBlueprintLibrary.Unhandled()
    end
    return UWidgetBlueprintLibrary.Handled()
  end
  if "Escape" == InKeyName or InKeyName == UIConst.GamePadKey.FaceButtonRight then
    if self.MainMap.DispatchAgentList ~= nil then
      self.MainMap.DispatchAgentList:OnClickClose()
      self.MainMap.DispatchAgentList = nil
      return UWidgetBlueprintLibrary.Handled()
    end
    if nil ~= self.MainMap.DispatchList and nil ~= self.MainMap.DispatchDetail or nil ~= self.MainMap.DispatchList then
      if self.MainMap.DispatchList then
        self.MainMap.DispatchList:Close()
      end
      self.MainMap.Dispatch = nil
      self.MainMap.DispatchList = nil
      return UWidgetBlueprintLibrary.Handled()
    end
    return self:ClosePanel() and UWidgetBlueprintLibrary.Handled() or UWidgetBlueprintLibrary.Unhandled()
  elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
    self:OnClickOpenRegionList_Sound()
    return UWidgetBlueprintLibrary.Handled()
  elseif InKeyName == UIConst.GamePadKey.FaceButtonBottom then
    if self.GamepadSelectPoint then
      if self.GamepadSelectPoint.Btn_Level then
        self.GamepadSelectPoint.Btn_Level.OnClicked:Broadcast()
      elseif self.GamepadSelectPoint.GuidePoint then
        self.GamepadSelectPoint.GuidePoint.Button_GuidePoint.OnClicked:Broadcast()
      end
    else
      self:ClosePanel(true)
      self:OpenMark(nil, self.CurrentDragOffset * -1 + self.ScreenSize)
    end
    return UWidgetBlueprintLibrary.Handled()
  elseif InKeyName == UIConst.GamePadKey.LeftThumb or "V" == InKeyName then
    if not self.LastPanelId and self.InteractivePanel then
      self:OpenOptionSelect()
      return UWidgetBlueprintLibrary.Handled()
    end
  elseif InKeyName == UIConst.GamePadKey.DPadUp then
    if next(self.FloorWidgetTable) then
      local Index = self.FloorWidget.WrapBox:GetChildIndex(self.LastFloorWidget)
      if 0 ~= Index then
        local Child = self.FloorWidget.WrapBox:GetChildAt(Index - 1)
        Child.Btn.OnClicked:Broadcast()
        Child:PlayAnimation(Child.Click)
        return UWidgetBlueprintLibrary.Handled()
      end
    end
  elseif InKeyName == UIConst.GamePadKey.DPadDown then
    if next(self.FloorWidgetTable) then
      local Index = self.FloorWidget.WrapBox:GetChildIndex(self.LastFloorWidget)
      if Index ~= self.FloorWidget.WrapBox:GetChildrenCount() - 1 then
        local Child = self.FloorWidget.WrapBox:GetChildAt(Index + 1)
        Child.Btn.OnClicked:Broadcast()
        Child:PlayAnimation(Child.Click)
        return UWidgetBlueprintLibrary.Handled()
      end
    end
  elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft or "L" == InKeyName then
    if self.MainMap.Entrance_Dispatch:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
      self.MainMap:OnClickDispatch()
    end
    return UWidgetBlueprintLibrary.Handled()
  elseif "SpaceBar" == InKeyName then
    if self.MainMap.DispatchList and self.MainMap.DispatchAgentList == nil then
      self.MainMap.DispatchList:OnClickSpace()
    end
    return UWidgetBlueprintLibrary.Handled()
  end
  return UWidgetBlueprintLibrary.Unhandled()
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  if self.IsEmpty then
    return M.Super.OnPreviewKeyDown(self, MyGeometry, InKeyEvent)
  end
  if not self.InitComplete then
    return UWidgetBlueprintLibrary.Handled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  IsHandled = self:OnKeyDownForLSComp(MyGeometry, InKeyEvent)
  if IsHandled then
    return UIUtils.Handled
  end
  return M.Super.OnPreviewKeyDown(self, MyGeometry, InKeyEvent)
end

function M:GetBuildingNameAndId(InName)
  local index = string.find(InName, "_L%d")
  local negativeIndex = string.find(InName, "_L%-%d")
  local floorId, buildingName
  if index or negativeIndex then
    local floor
    if index then
      buildingName = string.sub(InName, 1, index - 1)
      floorId = tonumber(string.sub(InName, index + 2))
    else
      buildingName = string.sub(InName, 1, negativeIndex - 1)
      floorId = tonumber(string.sub(InName, negativeIndex + 3)) * -1
    end
  end
  return buildingName, floorId
end

function M:OnMouseWheel(MyGeometry, Event)
  if self.MainMap.IsPanelOpen then
    return
  end
  local delta = UKismetInputLibrary.PointerEvent_GetWheelDelta(Event) * 0.05
  local temp = self.MapScale.X + delta
  if temp < self.WheelMinScale then
    temp = self.WheelMinScale
  elseif temp > self.WheelMaxScale then
    temp = self.WheelMaxScale
  end
  self.MainMap:OnMouseWheelTurned((temp - self.WheelMinScale) / (self.WheelMaxScale - self.WheelMinScale))
  return UWidgetBlueprintLibrary.Handled()
end

function M:OnScaleChange(Percent)
  if not Percent or not self.MapImage then
    return
  end
  if self.SlideTween ~= nil then
    self:StopSlide(ControlPriority.Stop)
  end
  self.CurrentPercent = Percent
  local temp = self.WheelMinScale + (self.WheelMaxScale - self.WheelMinScale) * Percent
  local TargetOffset = self.CurrentDragOffset * temp / self.MapScale.X
  self.MapScale:Set(temp, temp)
  self.MapImage:SetRenderScale(self.MapScale)
  self.BackgroundScale:Set(self.BackgroundMaxScale.X, self.BackgroundMaxScale.Y)
  FVector2D.Sub(self.BackgroundScale, self.BackgroundMinScale)
  self.BackgroundScale = self.BackgroundScale * Percent
  FVector2D.Add(self.BackgroundScale, self.BackgroundMinScale)
  self.Bg_Map:SetRenderScale(self.BackgroundScale)
  self:UpdateLimitOffset()
  if self.CurrentInnerSubRegionId and self.CurrentInnerId then
    if self.RegionPointLocation[self.CurrentInnerId] then
      self.Gamer_Indoor:SetRenderTranslation(self:TransformWorldLocToUILoc(self.RegionPointLocation[self.CurrentInnerId].X, self.RegionPointLocation[self.CurrentInnerId].Y))
    end
  elseif self.IsInRegion then
    self.gamerLoc = self:TransformWorldLocToUILoc(self.Player.CurrentLocation.X, self.Player.CurrentLocation.Y)
    self.Gamer:SetRenderTranslation(self.gamerLoc)
    self.Direction:SetRenderTranslation(self.gamerLoc)
  end
  self:OnScaleChange_Component(Percent)
  self:MoveMapTo(TargetOffset)
end

function M:GetMapIconVisible(IconType, Percent)
  local Data = DataMgr.RegionMapIconRange[IconType]
  if not (Data and Data.IconScaleInterval) or 2 == not #Data.IconScaleInterval then
    return true
  end
  return Percent * 100 >= Data.IconScaleInterval[1] and Percent <= Data.IconScaleInterval[2]
end

function M:UpdateLimitOffset()
  if self.NewMapType then
    self.LimitOffset = self.MapBoxMax - self.MapBoxMin
    if 0 ~= self.MapRotation and self.MapRotation ~= 180 then
      self.LimitOffset:Set(self.LimitOffset.Y, self.LimitOffset.X)
    end
  else
    self.MapImage.Img_Map:ForceLayoutPrepass()
    self.LimitOffset = self.MapImage.Img_Map.Slot:GetSize()
  end
  FVector2D.Mul(self.LimitOffset, self.MapScale)
  FVector2D.Div(self.LimitOffset, 2)
  if self.LimitOffset.X < 0 then
    self.LimitOffset:Set(-self.LimitOffset.X, self.LimitOffset.Y)
  end
  if self.LimitOffset.Y < 0 then
    self.LimitOffset:Set(self.LimitOffset.X, -self.LimitOffset.Y)
  end
  FVector2D.Add(self.LimitOffset, self.BgHeight)
  self:AddTimer(0.01, function()
    self.DragLimitOffset = UIManager(self):GetWidgetRenderSize(self.Bg_Map)
    FVector2D.Mul(self.DragLimitOffset, self.BackgroundScale)
    self.DragLimitOffset = self.DragLimitOffset / 2
    self.DragLimitOffset = self.DragLimitOffset * self.BackgroundDragRatio
  end)
end

function M:OnRegionTouchDown(Index, StartPos)
  self:OnPointerDown(nil, nil)
end

function M:OnRegionTouchMove(TouchFingerCount, Index, LastPos, TotalDeltaDis, LastDeltaDis)
  self:OnPointerMove(nil, self.CurrentTouchingGestureEvent[Index + 1])
end

function M:OnRegionTouchUp(Index, WidgetLocalPos, LastWidgetTouchPos, EndTouchPos, TotalDeltaDis)
  self:OnPointerUp(nil, self.CurrentTouchingGestureEvent[Index + 1])
end

function M:OnPointerDown(MyGeometry, Event)
  if self.IsEmpty then
    return UWidgetBlueprintLibrary.Unhandled()
  end
  if not self.InitComplete then
    return UWidgetBlueprintLibrary.Handled()
  end
  self.IsDragging = true
  self.IsClicked = true
  if self.SlideTween ~= nil then
    self:StopSlide(ControlPriority.Stop)
  end
  self.CacheDragOffset = {}
  return UWidgetBlueprintLibrary.Handled()
end

function M:OnPointerMove(MyGeometry, Event)
  if not self.IsDragging then
    return UWidgetBlueprintLibrary.Unhandled()
  end
  if not self.InitComplete then
    return UWidgetBlueprintLibrary.Handled()
  end
  local deltaLoc = UKismetInputLibrary.PointerEvent_GetCursorDelta(Event)
  if not UKismetMathLibrary.EqualEqual_Vector2DVector2D(deltaLoc, UKismetMathLibrary.Vector2D_Zero(), 0.001) then
    if self.IsClicked and not self.IsOpenDispatch then
      self:ClosePanel()
    end
    self.IsClicked = false
    self:UpdateMapDelta(deltaLoc)
    table.insert(self.CacheDragOffset, {
      X = self.CurrentDragOffset.X,
      Y = self.CurrentDragOffset.Y,
      Time = UGameplayStatics.GetRealTimeSeconds(self)
    })
    if #self.CacheDragOffset > 5 then
      table.remove(self.CacheDragOffset, 1)
    end
    if self.SlideTween ~= nil then
      self:StopSlide(ControlPriority.Drag)
    end
  end
  return UWidgetBlueprintLibrary.Handled()
end

function M:UpdateMapDelta(DeltaLoc)
  local Geometry = self:GetCachedGeometry()
  DeltaLoc = USlateBlueprintLibrary.TransformVectorLocalToAbsolute(Geometry, DeltaLoc)
  FVector2D.Mul(DeltaLoc, -1)
  self.CurrentDragOffset:Set(self.MapImage.RenderTransform.Translation.X, self.MapImage.RenderTransform.Translation.Y)
  FVector2D.Sub(self.CurrentDragOffset, DeltaLoc)
  if self.DragLimitOffset then
    if self.CurrentDragOffset.X > self.DragLimitOffset.X then
      self.CurrentDragOffset:Set(self.DragLimitOffset.X, self.CurrentDragOffset.Y)
    elseif self.CurrentDragOffset.X < -self.DragLimitOffset.X then
      self.CurrentDragOffset:Set(-self.DragLimitOffset.X, self.CurrentDragOffset.Y)
    end
    if self.CurrentDragOffset.Y > self.DragLimitOffset.Y then
      self.CurrentDragOffset:Set(self.CurrentDragOffset.X, self.DragLimitOffset.Y)
    elseif self.CurrentDragOffset.Y < -self.DragLimitOffset.Y then
      self.CurrentDragOffset:Set(self.CurrentDragOffset.X, -self.DragLimitOffset.Y)
    end
  end
  self:SetDragOffset()
  self.NeedResilience = self:IsOverBorder()
end

function M:CheckUpdateMapDelta()
  if self.NeedResilience then
    self:LimitDragOffset()
    self:SetDragOffset()
  end
end

function M:IsOverBorder()
  return self.CurrentDragOffset.X > self.LimitOffset.X or self.CurrentDragOffset.X < -self.LimitOffset.X or self.CurrentDragOffset.Y > self.LimitOffset.Y or self.CurrentDragOffset.Y < -self.LimitOffset.Y
end

function M:SetDragOffset()
  self.MapImage:SetRenderTranslation(self.CurrentDragOffset)
  self.Bg_Map:SetRenderTranslation(self.CurrentDragOffset * self.BackgroundDragRatio)
  self.Panel_Gamer:SetRenderTranslation(self.CurrentDragOffset)
  self.Panel_Point:SetRenderTranslation(self.CurrentDragOffset)
  if self.IsInRegion then
    self.Indicator:OnPointerMove(self.CurrentDragOffset, self.gamerLoc)
  else
  end
  if self.TrackIndicator then
    self.TrackIndicator:OnPointerMove(self.CurrentDragOffset, self.TrackTarget.RenderTransform.Translation)
  end
  if not IsEmptyTable(self.RegionMapIndicatorWidgets) then
    for k, v in pairs(self.RegionMapIndicatorWidgets) do
      if IsValid(v) and self.IndicatorWidgets[k] and IsValid(self.IndicatorWidgets[k]) then
        v:OnPointerMove(self.CurrentDragOffset, self.IndicatorWidgets[k].RenderTransform.Translation)
      end
    end
  end
end

function M:LimitDragOffset()
  self.CurrentDragOffset:Set(math.min(self.CurrentDragOffset.X, self.LimitOffset.X), math.min(self.CurrentDragOffset.Y, self.LimitOffset.Y))
  self.CurrentDragOffset:Set(math.max(self.CurrentDragOffset.X, -self.LimitOffset.X), math.max(self.CurrentDragOffset.Y, -self.LimitOffset.Y))
end

function M:GameViewportSizeChanged()
  if self.IsMiniMap then
    return
  end
  self.ScreenSize = UIManager(self):GetDesignedScreenSize(self)
  FVector2D.Div(self.ScreenSize, 2)
end

function M:OnPointerUp(MyGeometry, Event)
  if self.IsEmpty then
    return UWidgetBlueprintLibrary.Unhandled()
  end
  if not self.InitComplete then
    return UWidgetBlueprintLibrary.Handled()
  end
  self.IsDragging = false
  if self.IsClicked and false == self.IsOpenDispatch and not self:ClosePanel() and self:CheckControlPriority(ControlPriority.Normal) then
    local position = USlateBlueprintLibrary.AbsoluteToLocal(self.Panel_Point:GetCachedGeometry(), UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(Event))
    self:OpenMark(nil, position)
  end
  if not IsEmptyTable(self.IndicatorWidgets) then
    for _, v in pairs(self.IndicatorWidgets) do
      if IsValid(v) then
        v.IsSelected = false
        v:PlayAnimation(v.Normal)
      end
    end
  end
  self.IsClicked = false
  if self.NeedResilience then
    self:LimitDragOffset()
    self:SetSlideTarget(self.CurrentDragOffset, ControlPriority.Resilience, 0.5)
  else
    self:StartInertiaSlide()
  end
  return UWidgetBlueprintLibrary.Unhandled()
end

function M:ClosePanel(IsImmediately)
  for _, selectWidget in pairs(self.SelectWidgetTable) do
    selectWidget:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.ClickedSelectWidget = nil
  if self.CurrentSelectPoint then
    if self.CurrentSelectPoint.VisibilityTag.SingleCreate then
      self.CurrentSelectPoint:SetPointVisibility("SingleCreate", false, true)
    end
    self.CurrentSelectPoint.Slot:SetZOrder(0)
    self.CurrentSelectPoint:PlayAnimation(self.CurrentSelectPoint.NormalAni)
    self.CurrentSelectPoint.IsSelected = false
    self.CurrentSelectPoint = nil
  end
  if not IsImmediately then
    self.LastPanelId = nil
    self.MainMap.IsPanelOpen = false
    self:SetFocus()
    self:InitDispatchCondition()
    if self.RegionInfo then
      self.RegionInfo:Show()
      if self.RegionInfo.Img_Arrow.RenderTransform.Angle == -180 then
        self.RegionInfo:PlayAnimation(self.RegionInfo.Spin_Arrow)
      end
    end
    self.MainMap:ShoworHideTopTab(true)
    self.MainMap.WildMapKeysShow = true
    self.MainMap:UpdateWildMapKeys()
    if self.GamepadSelect then
      self.GamepadSelect:PlayAnimation(self.GamepadSelect.Normal)
    end
  end
  self.MainMap:ShoworHideBottomTab(true)
  if false == self.IsOpenDispatch then
    if self.FloorWidget then
      self.FloorWidget:SetVisibility(IsEmptyTable(self.FloorWidgetTable) and ESlateVisibility.Collapsed or ESlateVisibility.SelfHitTestInvisible)
    end
    self.MainMap.DispatchId = -1
  end
  if self.MainMap.DispatchDetail then
    self.MainMap.DispatchDetail:RealClose()
    self:RefreshAllDispatchPoint()
    self:RefreshDispatchSelect()
    self.CurClickDispatchId = -1
    return true
  end
  if self.LevelMap_Convey_Widget_PC and self.LevelMap_Convey_Widget_PC:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
    self.CurrentConveyId = nil
    self:OnScaleChange(self.CurrentPercent)
    self.LevelMap_Convey_Widget_PC.Group_Temple:SetVisibility(ESlateVisibility.Collapsed)
    self.LevelMap_Convey_Widget_PC:RemoveKey()
    if IsImmediately then
      self.LevelMap_Convey_Widget_PC:SetVisibility(ESlateVisibility.Collapsed)
    elseif not self.LevelMap_Convey_Widget_PC:IsAnimationPlaying(self.LevelMap_Convey_Widget_PC.Auto_Out) then
      self.LevelMap_Convey_Widget_PC:PlayAnimation(self.LevelMap_Convey_Widget_PC.Auto_Out)
      return true
    end
  end
  if self.TureHardBoss_MapTips and self.TureHardBoss_MapTips:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
    self.CurrentConveyId = nil
    self:OnScaleChange(self.CurrentPercent)
    if IsImmediately then
      self.TureHardBoss_MapTips:SetVisibility(ESlateVisibility.Collapsed)
    else
      self.TureHardBoss_MapTips:PlayAnimation(self.TureHardBoss_MapTips.Out)
      return true
    end
  end
  if self.ChangeAreaWidget and self.ChangeAreaWidget:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and not self.ChangeAreaWidget:IsAnimationPlaying(self.ChangeAreaWidget.Auto_Out) then
    self.ChangeAreaWidget:PlayAnimation(self.ChangeAreaWidget.Auto_Out)
    return true
  end
  if self.MarkPanel and self.MarkPanel.IsVisible then
    self:TryDeleteTempMarkAndClose()
    self.CurrentMarkUuid = nil
    self:OnScaleChange(self.CurrentPercent)
    return true
  end
  if not IsEmptyTable(self.IndicatorWidgets) then
    for k, v in pairs(self.IndicatorWidgets) do
      if IsValid(v) then
        v:PlayAnimation(v.Normal)
        v.IsSelected = false
      end
      if IsValid(self.SelectWidgetTable[k]) then
        self.SelectWidgetTable[k]:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
  end
  if self.MapTipsWidget and self.MapTipsWidget:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
    if IsImmediately then
      self.MapTipsWidget:SetVisibility(ESlateVisibility.Collapsed)
      self.MapTipsWidget:OnHide()
    else
      self.MapTipsWidget:BindToAnimationFinished(self.MapTipsWidget.Auto_Out, {
        self.MapTipsWidget,
        function()
          self.MapTipsWidget:UnbindAllFromAnimationFinished(self.MapTipsWidget.Auto_In)
          self.MapTipsWidget:SetVisibility(ESlateVisibility.Collapsed)
          self.MapTipsWidget:OnHide()
        end
      })
      if not self.MapTipsWidget:IsAnimationPlaying(self.MapTipsWidget.Auto_Out) then
        self.MapTipsWidget:PlayAnimation(self.MapTipsWidget.Auto_Out)
      end
      return true
    end
  end
  return false
end

function M:OnMouseLeave(Event)
  if self.IsDragging then
    self:OnPointerUp(nil, Event)
  end
end

function M:OnPanelOpen(panel)
  self.MainMap:ShoworHideTopTab(false)
  self.MainMap.WildMapKeysShow = false
  self.MainMap.IsPanelOpen = true
  self.MainMap:UpdateWildMapKeys()
  if 0 == panel then
    self.LevelMap_Convey_Widget_PC:SetVisibility(ESlateVisibility.Collapsed)
    self.TureHardBoss_MapTips:SetVisibility(ESlateVisibility.Collapsed)
    self.RegionInfo:Close()
    self.FloorWidget:SetVisibility(ESlateVisibility.Collapsed)
    self.MainMap.Entrance_Dispatch:SetVisibility(ESlateVisibility.Collapsed)
    self:RefreshAllDispatchPoint()
    self:RefreshDispatchSelect()
    if self.MainMap.DispatchDetail then
      self.MainMap.DispatchDetail:RealClose()
    end
  elseif 1 == panel then
    if self.MarkPanel then
      self.MarkPanel:SetVisibility(ESlateVisibility.Collapsed)
    end
    self.LevelMap_Convey_Widget_PC:SetVisibility(ESlateVisibility.Collapsed)
    self.TureHardBoss_MapTips:SetVisibility(ESlateVisibility.Collapsed)
    self.FloorWidget:SetVisibility(ESlateVisibility.Collapsed)
    self.MainMap.Entrance_Dispatch:SetVisibility(ESlateVisibility.Collapsed)
    self:RefreshAllDispatchPoint()
    self:RefreshDispatchSelect()
    if self.MainMap.DispatchDetail then
      self.MainMap.DispatchDetail:RealClose()
    end
    self.MainMap:ShoworHideBottomTab(false)
    self.RegionInfo:Close()
  elseif 2 == panel then
    if self.MarkPanel then
      self.MarkPanel:SetVisibility(ESlateVisibility.Collapsed)
    end
    self.RegionInfo:Close()
    self.FloorWidget:SetVisibility(ESlateVisibility.Collapsed)
    self.MainMap.Entrance_Dispatch:SetVisibility(ESlateVisibility.Collapsed)
    self:RefreshAllDispatchPoint()
    self:RefreshDispatchSelect()
    if self.MainMap.DispatchDetail then
      self.MainMap.DispatchDetail:RealClose()
    end
  elseif 3 == panel then
    self.MainMap.Entrance_Dispatch:SetVisibility(ESlateVisibility.Collapsed)
    self:RefreshAllDispatchPoint()
    self:RefreshDispatchSelect()
    if self.MainMap.DispatchDetail then
      self.MainMap.DispatchDetail:RealClose()
    end
  elseif 4 == panel then
    self.RegionInfo:Close()
    self.MainMap.Entrance_Dispatch:SetVisibility(ESlateVisibility.Collapsed)
    self.FloorWidget:SetVisibility(ESlateVisibility.Collapsed)
    self:RefreshAllDispatchPoint()
    self:RefreshDispatchSelect()
    if self.MainMap.DispatchDetail then
      self.MainMap.DispatchDetail:RealClose()
    end
  elseif 5 == panel then
    self.RegionInfo:SetVisibility(ESlateVisibility.Collapsed)
    self.FloorWidget:SetVisibility(ESlateVisibility.Collapsed)
    self.MainMap.Entrance_Dispatch:SetVisibility(ESlateVisibility.Collapsed)
  elseif 6 == panel then
    if self.MarkPanel then
      self.MarkPanel:SetVisibility(ESlateVisibility.Collapsed)
    end
    self.LevelMap_Convey_Widget_PC:SetVisibility(ESlateVisibility.Collapsed)
    self.TureHardBoss_MapTips:SetVisibility(ESlateVisibility.Collapsed)
    self.RegionInfo:Close()
    self.FloorWidget:SetVisibility(ESlateVisibility.Collapsed)
    self.MainMap.Entrance_Dispatch:SetVisibility(ESlateVisibility.Collapsed)
    self:RefreshAllDispatchPoint()
    self:RefreshDispatchSelect()
    if self.MainMap.DispatchDetail then
      self.MainMap.DispatchDetail:RealClose()
    end
  end
  self.LastPanelId = panel
end

function M:TouchWildMapMultiMove(TouchFingerCount, Index, Pos1, Pos2, TwoPointDist)
  if not UE4.UKismetSystemLibrary.IsValid(self.Player) or TouchFingerCount <= 1 then
    return
  end
  if self.LastTouchMultiDist == nil then
    self.LastTouchMultiDist = TwoPointDist
    return
  end
  self.IsDragging = false
  if self.IsClicked then
    self:ClosePanel()
  end
  self.IsClicked = false
  local DeltaDis = TwoPointDist - self.LastTouchMultiDist
  local temp = self.MapScale.X
  if DeltaDis >= 5 then
    temp = math.min(temp + 0.05, self.WheelMaxScale)
  elseif DeltaDis <= -5 then
    temp = math.max(temp - 0.05, self.WheelMinScale)
  end
  self.MainMap:OnMouseWheelTurned((temp - self.WheelMinScale) / (self.WheelMaxScale - self.WheelMinScale))
  self.LastTouchMultiDist = TwoPointDist
end

function M:CheckControlPriority(RequireControlPriority)
  return RequireControlPriority >= self.CurrentControlPriority
end

function M:SetControlPriority(TargetControlPriority)
  self.CurrentControlPriority = TargetControlPriority
end

function M:CheckControlPriority_Normal()
  return self.CurrentControlPriority <= ControlPriority.Normal
end

function M:SetSlideTarget(TargetLoc, InControlPriority, Duration)
  if not self:CheckControlPriority(InControlPriority) or UUIFunctionLibrary.Vector2D_IsNAN(TargetLoc) then
    return
  end
  self:SetControlPriority(InControlPriority)
  self:DOVector2D(Duration, self.MapImage.RenderTransform.Translation, TargetLoc, EaseType.OutCirc)
end

function M:StopSlide(InControlPriority)
  if not self:CheckControlPriority(InControlPriority) then
    return
  end
  UDBTweenBase.DBTweenStop("RegionMapSlide")
  self.SlideTween = nil
  self:SetControlPriority(ControlPriority.Normal)
end

function M:OnUpdateSlide(curValue)
  self.CurrentDragOffset = curValue
  self:SetDragOffset()
end

function M:OnCompleteSlide(curValue)
  self:SetControlPriority(ControlPriority.Normal)
  self.NeedResilience = false
  self.SlideTween = nil
end

function M:StartInertiaSlide()
  if not self.CacheDragOffset or #self.CacheDragOffset < 2 then
    return
  end
  local startT = self.CacheDragOffset[1]
  local endT = self.CacheDragOffset[#self.CacheDragOffset]
  if 0 == endT.Time - startT.Time then
    return
  end
  local v = FVector2D(endT.X - startT.X, endT.Y - startT.Y)
  v = v / (endT.Time - startT.Time) * 0.2
  v:Set(math.min(v.X, 4000), math.min(v.Y, 4000))
  v:Set(math.max(v.X, -4000), math.max(v.Y, -4000))
  local time = math.max(0, 0.5 - (UGameplayStatics.GetRealTimeSeconds(self) - endT.Time))
  if time > 0 then
    v = v * time
    FVector2D.Add(self.CurrentDragOffset, v)
    if self:IsOverBorder() then
      self:LimitDragOffset()
    end
    self:SetSlideTarget(self.CurrentDragOffset, ControlPriority.Inertia, time)
  end
end

function M:MoveMapAndCheck(DeltaLoc)
  self:UpdateMapDelta(DeltaLoc)
  self:CheckUpdateMapDelta()
end

function M:JumpToCurrentPosition()
  self.MainMap:OnAreaClicked()
  local Avatar = GWorld:GetAvatar()
  local RegionId = DataMgr.SubRegion[Avatar.CurrentRegionId].RegionId
  if DataMgr.Region[RegionId].RegionMapId then
    RegionId = DataMgr.RegionMap[DataMgr.Region[RegionId].RegionMapId].RegionId
  end
  self:ChangeRegion(RegionId, function()
    self:ShowMissionIndicatorsInRegionMap()
  end)
end

function M:JumpToTaskPosition()
  self.MainMap:OnAreaClicked()
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
  local SubRegionId = MissionIndicatorManager:GetTargetTaskSubRegionId(TrackingQuestChainId, TrackingQuestId)
  if not SubRegionId or 0 == SubRegionId then
    return
  end
  self:ChangeRegionForSmartIndicator(SubRegionId, TrackingQuestChainId)
end

function M:MoveMapTo(TargetLoc)
  local Geometry = self:GetCachedGeometry()
  local TargetDeltaLoc = TargetLoc - self.CurrentDragOffset
  TargetDeltaLoc = USlateBlueprintLibrary.TransformVectorAbsoluteToLocal(Geometry, TargetDeltaLoc)
  self:MoveMapAndCheck(TargetDeltaLoc)
end

function M:MoveMapToTelepoint(Id)
  local data = DataMgr.TeleportPoint[Id]
  if not data then
    return
  end
  self:MoveMapTo(self:TransformWorldLocToUILoc(data.MechanismPos[1], data.MechanismPos[2]) * -1)
  local floorid = self.TeleportPoint2FloorId[Id]
  if floorid then
    self:OnFloorBtnClicked(floorid, true)
  end
end

function M:MoveMapToQuestTarget(InQuestChainId, GuidePoint)
  local FloorId
  for k, v in pairs(self.IndicatorLocations) do
    if IsValid(self.IndicatorWidgets[k]) and IsValid(self.IndicatorWidgets[k]) == GuidePoint then
      self.IndicatorWidgets[k].IsSelected = true
      self:MoveMapTo(self:TransformWorldLocToUILoc(v.X, v.Y) * -1)
      FloorId = GuidePoint.FloorId
    elseif InQuestChainId and IsValid(self.IndicatorWidgets[k]) and self.IndicatorWidgets[k].TargetQuestChainId and self.IndicatorWidgets[k].TargetQuestChainId == InQuestChainId then
      self.IndicatorWidgets[k].IsSelected = true
      self:MoveMapTo(self:TransformWorldLocToUILoc(v.X, v.Y) * -1)
      FloorId = self.IndicatorWidgets[k].FloorId
      if IsValid(self.SelectWidgetTable[k]) then
        self.SelectWidgetTable[k]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        self.SelectWidgetTable[k]:PlayAnimation(self.SelectWidgetTable[k].Click)
      end
      break
    elseif IsValid(self.IndicatorWidgets[k]) and self.IndicatorWidgets[k].IsSelected then
      self:MoveMapTo(self:TransformWorldLocToUILoc(v.X, v.Y) * -1)
      FloorId = self.IndicatorWidgets[k].FloorId
      if IsValid(self.SelectWidgetTable[k]) then
        self.SelectWidgetTable[k]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        self.SelectWidgetTable[k]:PlayAnimation(self.SelectWidgetTable[k].Click)
      end
      break
    end
  end
  if FloorId then
    self:OnFloorBtnClicked(FloorId, true)
  end
  self:ShowQuestDetailInRegionMap(InQuestChainId)
end

function M:MoveMapToRegionPoint(Id)
  local Position = self.RegionPointLocation[Id]
  if not Position then
    return
  end
  self:MoveMapTo(self:TransformWorldLocToUILoc(Position.X, Position.Y) * -1)
  local FloorId = self.RegionPoint2FloorId[Id]
  if FloorId then
    self:OnFloorBtnClicked(FloorId, true)
  end
end

function M:MoveMapToMarkPoint(Id)
  local Data = self.MarkData[Id]
  if not Data then
    return
  end
  local Position = FVector2D(Data.PositionX, Data.PositionY)
  FVector2D.Mul(Position, self.MapScale)
  self:MoveMapTo(Position * -1)
  local FloorId = Data.FloorId
  if FloorId then
    self:OnFloorBtnClicked(FloorId, true)
  end
end

function M:CheckSelect(Point)
  if self.CheckBreak then
    self.CheckBreak = false
    return true
  end
  local SelectTable = self:GetPointByPosition(Point.RenderTransform.Translation, Point:GetDesiredSize() / 2 * 1.5, Point)
  if 1 == #SelectTable then
    return true
  else
    self.MainMap:OpenSelectList(SelectTable)
    return false
  end
end

function M:GetPointByPosition(MyPosition, MySize, CheckPoint)
  local SelectTable = {}
  local IsGuidePoint = false
  if CheckPoint then
    table.insert(SelectTable, CheckPoint)
    if CheckPoint.TargetQuestChainId and CheckPoint.TargetQuestChainId > 0 then
      IsGuidePoint = true
    end
  end
  for i = 1, self.Panel_Point:GetChildrenCount() do
    local TempPoint = self.Panel_Point:GetChildAt(i - 1)
    if TempPoint ~= CheckPoint and TempPoint:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and TempPoint:GetClass():GetName() ~= "WBP_Map_Select_C" then
      local Position = TempPoint.RenderTransform.Translation
      if MyPosition.X - MySize.X <= Position.X and MyPosition.X + MySize.X >= Position.X and MyPosition.Y - MySize.Y <= Position.Y and MyPosition.Y + MySize.Y >= Position.Y then
        table.insert(SelectTable, TempPoint)
      end
    end
  end
  for _, GuideWidget in pairs(self.IndicatorWidgets) do
    if GuideWidget ~= CheckPoint and GuideWidget:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and false == IsGuidePoint then
      local Position = GuideWidget.RenderTransform.Translation
      if MyPosition.X - MySize.X <= Position.X and MyPosition.X + MySize.X >= Position.X and MyPosition.Y - MySize.Y <= Position.Y and MyPosition.Y + MySize.Y >= Position.Y then
        table.insert(SelectTable, GuideWidget)
        IsGuidePoint = true
      end
    end
  end
  return SelectTable
end

function M:CheckSelectByPosition(Position, Size)
  local SelectTable = self:GetPointByPosition(Position, Size, nil)
  local MinDistance, MinDisPoint
  for _, Point in pairs(SelectTable) do
    local Distance = UKismetMathLibrary.Distance2D(Position, Point.RenderTransform.Translation)
    if not MinDistance or MinDistance > Distance then
      MinDistance = Distance
      MinDisPoint = Point
    end
  end
  return MinDisPoint
end

function M:EnterOrExitFloor(IsEnter, Box)
  if not self.BulidingState[Box.BuildingFloor] then
    self.BulidingState[Box.BuildingFloor] = {}
  end
  self.BulidingState[Box.BuildingFloor][Box] = IsEnter
  local targetFloor = self.MaxFloorId
  if IsEnter then
    targetFloor = Box.BuildingFloor
  else
    for floor, boxMap in pairs(self.BulidingState) do
      for box, IsShow in pairs(boxMap) do
        if IsShow then
          targetFloor = floor
        end
      end
    end
  end
  DebugPrint("EnterOrExitFloor", IsEnter, Box:GetName(), Box.BuildingFloor, targetFloor)
  self:ShowFloor(targetFloor)
end

function M:ShowFloor(FloorId)
  if not self.MapImage then
    return
  end
  for floor, boxMap in pairs(self.BulidingState) do
    for box, IsShow in pairs(boxMap) do
      if floor < FloorId and IsShow then
        FloorId = floor
      end
    end
  end
  self.CurrentFloorId = FloorId
  self:ShowFloor_Component(FloorId)
end

function M:OnClickOpenRegionList_Sound()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", "", nil)
  self:OnClickOpenRegionList()
end

function M:OnClickOpenRegionList()
  self.RegionInfo.Btn_ShowUp:PlayAnimation(self.RegionInfo.Btn_ShowUp.Btn_Click)
  if not self.ChangeAreaWidget then
    self.ChangeAreaWidget = UIManager(self):_CreateWidgetNew("RegionMapChangeRegion")
    self.MainMap.ChangeArea:AddChild(self.ChangeAreaWidget)
    self.ChangeAreaWidget:Init(self)
    self:OnPanelOpen(1)
    self.ChangeAreaWidget:PlayAnimation(self.ChangeAreaWidget.Auto_In)
    self.RegionInfo:PlayAnimationReverse(self.RegionInfo.Spin_Arrow)
  elseif self.ChangeAreaWidget:GetVisibility() == ESlateVisibility.Collapsed then
    self.ChangeAreaWidget:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.ChangeAreaWidget:Init(self)
    self.ChangeAreaWidget:PlayAnimation(self.ChangeAreaWidget.Auto_In)
    self:OnPanelOpen(1)
    self.RegionInfo:PlayAnimationReverse(self.RegionInfo.Spin_Arrow)
  else
    self:ClosePanel()
    self.RegionInfo:PlayAnimation(self.RegionInfo.Spin_Arrow)
  end
end

function M:OnRegionClick(RegionId)
  self.RegionInfo.Img_Arrow:SetRenderTransformAngle(0)
  self:ChangeRegion(RegionId, function()
    self:ShowMissionIndicatorsInRegionMap()
  end)
  self.MainMap:UpdateWildMapKeys()
  self.MainMap.Btn_ReturnHome:SetVisibility(ESlateVisibility.Collapsed)
  self:AddTimer(0.01, function()
    self.MainMap.Entrance_Dispatch:SetVisibility(ESlateVisibility.Collapsed)
  end)
end

function M:ChangeRegion(RegionId, InitCompleteFunc)
  self:ClearData()
  self:Init(false, RegionId, self.MainMap, InitCompleteFunc)
end

function M:ChangeRegionForSmartIndicator(InTaskSubRegionId, TrackingQuestChainId)
  local function TryGetSmartPointDataForRegionMap(InTaskSubRegionId)
    local TempRegionDatas, RegionTargetDatas
    
    if DataMgr.RegionGraph[InTaskSubRegionId] == nil or nil == DataMgr.RegionGraph[InTaskSubRegionId].SubRegionTarget or nil == DataMgr.RegionGraph[InTaskSubRegionId].SubRegionTarget.RegionTarget then
      return nil
    end
    local RetSubRegionId, RetData = InTaskSubRegionId
    TempRegionDatas = DataMgr.RegionGraph[InTaskSubRegionId].SubRegionTarget.RegionTarget
    for _, Data in pairs(TempRegionDatas) do
      if Data and Data[1] and RetSubRegionId > Data[1] then
        RetSubRegionId = Data[1]
      end
    end
    if DataMgr.RegionGraph[RetSubRegionId] == nil or nil == DataMgr.RegionGraph[RetSubRegionId].SubRegionTarget or nil == DataMgr.RegionGraph[RetSubRegionId].SubRegionTarget.RegionTarget then
      return nil
    end
    RegionTargetDatas = DataMgr.RegionGraph[RetSubRegionId].SubRegionTarget.RegionTarget
    for _, Data in pairs(RegionTargetDatas) do
      if Data and Data[1] and Data[2] and Data[1] == InTaskSubRegionId then
        return {SubRegionId = RetSubRegionId, Data = Data}
      end
    end
    return nil
  end
  
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local RegionId = DataMgr.SubRegion[InTaskSubRegionId].RegionId
  if self:CheckIsAnyTeleporPointUnlock(InTaskSubRegionId, true) or DataMgr.RegionGraph[Avatar.CurrentRegionId] and DataMgr.RegionGraph[Avatar.CurrentRegionId].RegionStart == nil then
    self:ChangeRegion(RegionId, function()
      self:ShowMissionIndicatorsInRegionMap()
      self:MoveMapToQuestTarget(TrackingQuestChainId)
    end)
  else
    local TargetRegionId, Data = TaskUtils:TryGetSmartPointDataForRegionMap(Avatar.CurrentRegionId, InTaskSubRegionId)
    if nil == TargetRegionId and Data and Data[1] and Data[2] then
      local RegionId = DataMgr.SubRegion[Data[1]].RegionId
      self:ChangeRegion(RegionId, function()
        self:AddMainTaskGuidePointToRegionMapForTrackingQuest(Data[2])
        self:MoveMapToQuestTarget(TrackingQuestChainId)
      end)
    elseif nil ~= TargetRegionId and Data and Data[1] and Data[2] then
      self:ChangeRegion(TargetRegionId, function()
        self:AddMainTaskGuidePointToRegionMapForTrackingQuest(Data[2])
        self:MoveMapToQuestTarget(TrackingQuestChainId)
      end)
    else
      if DataMgr.RegionGraph[InTaskSubRegionId] == nil or nil == DataMgr.RegionGraph[InTaskSubRegionId].SubRegionTarget or nil == DataMgr.RegionGraph[InTaskSubRegionId].SubRegionTarget.RegionTarget then
        self:ChangeRegion(RegionId, function()
          self:ShowMissionIndicatorsInRegionMap()
          self:MoveMapToQuestTarget(TrackingQuestChainId)
        end)
        return
      end
      local TargetRegionTargetDatas = DataMgr.RegionGraph[InTaskSubRegionId].SubRegionTarget.RegionTarget
      for _, IterData in pairs(TargetRegionTargetDatas) do
        if IterData and IterData[1] and IterData[2] and self:CheckIsAnyTeleporPointUnlock(IterData[1], true) then
          local IterRegionId = DataMgr.SubRegion[IterData[1]].RegionId
          self:ChangeRegion(IterRegionId, function()
            self:AddMainTaskGuidePointToRegionMapForTrackingQuest(IterData[2])
            self:MoveMapToQuestTarget(TrackingQuestChainId)
          end)
          return
        end
      end
      self:ChangeRegion(RegionId, function()
        self:ShowMissionIndicatorsInRegionMap()
        self:MoveMapToQuestTarget(TrackingQuestChainId)
      end)
    end
  end
end

function M:OnCommonTrack(Id, IsAdd)
  if self.IsMiniMap and DataMgr.Dispatch[Id] ~= nil and true == IsAdd then
    local Path = "/Game/UI/WBP/Map/Widget/Dispatch/WBP_Map_DispatchPointInfo.WBP_Map_DispatchPointInfo"
    local Point = UIManager(self):CreateWidget(Path)
    local UIPos = DataMgr.DispatchUI[Id].UIPos
    local Pos = self:TransformWorldLocToUILoc(UIPos[1], UIPos[2])
    Point:SetRenderTranslation(Pos)
    Point:InitMini(Id)
    self.MiniDispatchPoint[Id] = Point
    DebugPrint("Point", Point, IsAdd)
  end
  if not self.IsMiniMap or not self.MarkTable[Id] and not self.TeleportPoints[Id] and not self.RegionPoints[Id] and not self.MiniDispatchPoint[Id] then
    return
  end
  local trackTarget = self.MarkTable[Id] or self.TeleportPoints[Id] or self.RegionPoints[Id] or self.MiniDispatchPoint[Id]
  if IsAdd then
    local TargetActor
    if self.TeleportPoints[Id] then
      local Data = DataMgr.TeleportPoint[Id]
      TargetActor = self.GameState.StaticCreatorMap:FindRef(trackTarget.Data.StaticId)
    elseif self.RegionPoints[Id] then
      local Data = DataMgr.RegionPoint[Id]
      local CreatorId = Data.StaticId
      if CreatorId then
        TargetActor = self.GameState.StaticCreatorMap:FindRef(CreatorId)
      else
        local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
        if GameMode then
          local ManualItemId = Data.ManualItemId
          TargetActor = GameMode.BPBornRegionActor:FindRef(ManualItemId)
        end
      end
    elseif self.MiniDispatchPoint[Id] then
      local Data = DataMgr.DynQuest[Id]
      local CreatorId = Data.TriggerBoxID
      if CreatorId then
        TargetActor = self.GameState.StaticCreatorMap:FindRef(CreatorId)
      end
    end
    local arrow = self.MainMap:NewPointArrow()
    self:AddTrack(trackTarget, arrow, TargetActor)
    self.MainMap.TracePanel:AddChild(trackTarget)
    if self.TeleportPoints[Id] then
      trackTarget:ReInitTeleportPoint(DataMgr.TeleportPoint[Id])
    end
    self:AdjustSlot(trackTarget.Slot)
    trackTarget:SetRenderScale(self.MinimapIconScale / FVector2D(0.7, 0.7))
    trackTarget:StopAllAnimations()
    trackTarget:PlayAnimation(trackTarget.Loop, 0, 0)
  elseif self.MainMap.TracePanel:HasChild(trackTarget) then
    if DataMgr.Dispatch[Id] ~= nil then
      self:RemoveTrack(trackTarget)
      trackTarget:RemoveFromParent()
      GWorld.GameInstance.TrackingID = nil
      return
    end
    self.Panel_Point:AddChild(trackTarget)
    self:AdjustSlot(trackTarget.Slot)
    trackTarget:SetRenderScale(self.MinimapIconScale)
    self:RemoveTrack(trackTarget)
    if self.TeleportPoints[Id] then
      trackTarget:ReInitTeleportPoint(DataMgr.TeleportPoint[Id])
    end
    trackTarget:StopAllAnimations()
    GWorld.GameInstance.TrackingID = nil
  end
end

function M:OnTrackCancel(TrackTarget)
  local Id = GWorld.GameInstance.TrackingID
  if not Id then
    return
  end
  local CurrentTarget = self.MarkTable[Id] or self.TeleportPoints[Id] or self.RegionPoints[Id] or self.MiniDispatchPoint[Id]
  if not CurrentTarget or TrackTarget ~= CurrentTarget then
    return
  end
  UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_ARRIVED"))
  self:OnCommonTrack(Id, false)
end

function M:OnClickDimension()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click", "", nil)
  self.RegionInfo.Impression_Dimension:SetIsChecked(false)
  local DimensionPanel = UIManager(self):LoadUINew("RegionMapImpression")
  DimensionPanel:Init(self.RegionID, self)
  if self.ChangeAreaWidget and self.ChangeAreaWidget:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
    self:OnClickOpenRegionList()
  end
end

function M:CreateTrackIndicator(TrackTarget)
  if self.IsMiniMap then
    return
  end
  if not self.TrackIndicator then
    self.TrackIndicator = self:NewIndicator()
    self.TrackIndicator:Init(self, self.ScreenSize - self.BgHeight, TrackTarget, false)
    self.TrackIndicator.Slot:SetZOrder(2)
  end
  self.TrackTarget = TrackTarget
  self.TrackIndicator:SetIcon(TrackTarget.Img_Point.Brush.ResourceObject)
  self.TrackIndicator:OnPointerMove(self.CurrentDragOffset, self.TrackTarget.RenderTransform.Translation)
end

function M:RemoveTrackIndicator()
  if self.TrackIndicator then
    self.TrackIndicator:RemoveFromParent()
    self.TrackIndicator = nil
  end
  self.TrackTarget = nil
end

function M:AdjustSlot(CanvasSlot)
  local half = UKismetMathLibrary.Vector2D_One() / 2
  local anchors = CanvasSlot:GetAnchors()
  anchors.Minimum = half
  anchors.Maximum = half
  CanvasSlot:SetAnchors(anchors)
  CanvasSlot:SetAlignment(half)
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Gamepad then
    if self.MainMap:IsInteractiveOpen() or self.IsOpenDispatch then
      return
    end
    if UIManager(self):GetUIObj("RegionMapImpression") then
      return
    end
    self.GamepadSelect:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if not self.LastPanelId then
      self:SetFocus()
    elseif 2 == self.LastPanelId then
      if self.TureHardBoss_MapTips and self.TureHardBoss_MapTips:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
        self.TureHardBoss_MapTips:SetFocus()
      elseif self.LevelMap_Convey_Widget_PC and self.LevelMap_Convey_Widget_PC:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
        self.LevelMap_Convey_Widget_PC:SetFocus()
      end
    end
    if self.FloorWidget and next(self.FloorWidgetTable) then
      self.FloorWidget.Key_Controller_Up:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.FloorWidget.Key_Controller_Down:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  else
    self.GamepadSelect:SetVisibility(ESlateVisibility.Collapsed)
    if self.FloorWidget and next(self.FloorWidgetTable) then
      self.FloorWidget.Key_Controller_Up:SetVisibility(ESlateVisibility.Collapsed)
      self.FloorWidget.Key_Controller_Down:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  if self.IsMiniMap then
    return UWidgetBlueprintLibrary.Unhandled()
  end
  if self.IsEmpty then
    return UWidgetBlueprintLibrary.Handled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if not self.CurrentAnalogDelta then
    self.CurrentAnalogDelta = FVector2D(0, 0)
  else
    self.CurrentAnalogDelta:Set(0, 0)
  end
  if InKeyName == UIConst.GamePadKey.LeftAnalogX then
    local DeltaX = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * -15
    if self.CurrentDragOffset.X + DeltaX > self.LimitOffset.X or self.CurrentDragOffset.X + DeltaX < -self.LimitOffset.X then
      DeltaX = 0
    end
    self.CurrentAnalogDelta:Set(DeltaX, 0)
  elseif InKeyName == UIConst.GamePadKey.LeftAnalogY then
    local DeltaY = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 15
    if self.CurrentDragOffset.Y + DeltaY > self.LimitOffset.Y or self.CurrentDragOffset.Y + DeltaY < -self.LimitOffset.Y then
      DeltaY = 0
    end
    self.CurrentAnalogDelta:Set(0, DeltaY)
  elseif InKeyName == UIConst.GamePadKey.RightAnalogY then
    local delta = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 0.05
    local temp = self.MapScale.X + delta
    if temp < self.WheelMinScale then
      temp = self.WheelMinScale
    elseif temp > self.WheelMaxScale then
      temp = self.WheelMaxScale
    end
    self.MainMap:OnMouseWheelTurned((temp - self.WheelMinScale) / (self.WheelMaxScale - self.WheelMinScale))
    return UWidgetBlueprintLibrary.Handled()
  end
  if UKismetMathLibrary.EqualEqual_Vector2DVector2D(self.CurrentAnalogDelta, UKismetMathLibrary.Vector2D_Zero(), 2.25) then
    return UWidgetBlueprintLibrary.Handled()
  end
  self.bCheckGamepadSelect = true
  self.CheckGamepadSelectTime = UGameplayStatics.GetRealTimeSeconds(self)
  self.GamepadSelect:PlayAnimation(self.GamepadSelect.Normal)
  self.GamepadSelectState = false
  self.GamepadSelectPoint = nil
  self:UpdateMapDelta(self.CurrentAnalogDelta)
  return UWidgetBlueprintLibrary.Handled()
end

function M:CheckGamepadSelect()
  if not self.GamepadSelectState then
    self.GamepadSelectState = true
    self.GamepadSelectPoint = self:CheckSelectByPosition(self.CurrentDragOffset * -1, FVector2D(50, 50))
    if self.GamepadSelectPoint then
      self.GamepadSelect:PlayAnimation(self.GamepadSelect.Hover)
      self:MoveMapTo(self.GamepadSelectPoint.RenderTransform.Translation * -1)
      if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
        self.MainMap.Key_Tip:UpdateKeyInfo(self.MainMap.WildMapGamePadEnsureKeys)
      end
    elseif self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
      self.MainMap.Key_Tip:UpdateKeyInfo(self.MainMap.WildMapGamePadKeys)
    end
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.GamepadSelect then
    self.GamepadSelect:SetRenderOpacity(1)
  end
  return UWidgetBlueprintLibrary.Unhandle
end

function M:OnFocusLost(MyGeometry, InFocusEvent)
  if self.GamepadSelect then
    self.GamepadSelect:SetRenderOpacity(0)
  end
  return UWidgetBlueprintLibrary.Unhandle
end

AssembleComponents(M)
return M
