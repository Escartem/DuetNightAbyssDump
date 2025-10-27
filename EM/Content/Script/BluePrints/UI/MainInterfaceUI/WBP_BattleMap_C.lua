require("UnLua")
local WBP_BattleMap_C = Class("BluePrints.UI.BP_UIState_C")
WBP_BattleMap_C._components = {
  "BluePrints.UI.UIComponent.TouchComponent"
}

function WBP_BattleMap_C:Construct()
  self.Super.Construct(self)
  self.bNewMaterial = true
  self.MapMaterialTexNum = 10
  self.levelLoader = UGameplayStatics.GetGameInstance(self):GetSceneManager():GetLevelLoader()
  self.Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  self.GameState = UGameplayStatics.GetGameState(self)
  self.MapPanelCPP = self.MapPanel
  self.PointPanelCPP = self.PointPanel
  self.RangePanelCPP = self.RangePanel
  self.FloorPanelCPP = self.FloorPanel
  self.TracePanelCPP = self.TracePanel
  self.PhantomPanelCPP = self.PhantomPanel
  self.GamerCPP = self.Gamer
  self.DirectionCPP = self.Direction
  self.YawOff = 90
  self.Battle = nil
  self.IsInRegionMap = false
  self.MapImageCenter = UKismetMathLibrary.Vector2D_Zero()
  self.HudKeyShow = false
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.OnChangeKeyBoardSet)
  self.Scale = 0.05
  self.MiniMapRad = 135
  self.panelLoc = FVector2D(0, 0)
  self.IsOpen = false
  self.IsAnimating = false
  self.LastTouchMultiDist = nil
  self.MapArray = {}
  self.LevelId2Map = {}
  self.DoorIcons = {}
  self.EnemyMaxDis = DataMgr.GlobalConstant.BatteMapMonDis.ConstantValue
  self.EnemyStand = "/Game/UI/UI_PNG/Battle/Icon_Map_Arrow02.Icon_Map_Arrow02"
  self.EnemyPoint:Clear()
  self.BatteMapMonNum = DataMgr.GlobalConstant.BatteMapMonNum.ConstantValue
  EventManager:AddEvent(EventID.ShowDropInMinimap, self, self.ShowDropInMinimap)
  EventManager:AddEvent(EventID.ShowRangedIconInMinimap, self, self.ShowRangedIconInMinimap)
  EventManager:AddEvent(EventID.OnArtLevelLoadedStateChange, self, self.OnArtLevelLoadedStateChange)
  EventManager:AddEvent(EventID.OnChangeKeyBoardSet, self, self.OnChangeKeyBoardSet)
  EventManager:AddEvent(EventID.OnTeamRecoveryStateChange, self, self.SetPhantomGuideStateByEvent)
  EventManager:AddEvent(EventID.EdgeFalltrigerChangeOverlapState, self, self.InOrOutEdgeState)
  EventManager:AddEvent(EventID.UpdateDoorIcon, self, self.UpdateDoorIcon)
  EventManager:AddEvent(EventID.ForceUpdatePlayerCurrentLevelId, self, self.ForceUpdatePlayerCurrentLevelId)
  self.SabotageABCGuideCache = {}
  local DungeonId = GWorld.GameInstance:GetCurrentDungeonId()
  if DungeonId then
    self.DungeonData = DataMgr.Dungeon[DungeonId]
  end
  self.RetainerBox_101:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Btn_Open:SetVisibility(UE4.ESlateVisibility.Visible)
  self.BG:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Btn_Close:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.VX_CombatStats:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:OnChangeKeyBoardSet()
  local Avatar = GWorld:GetAvatar()
  if self.levelLoader and self.levelLoader.IsWorldLoader and Avatar then
    self.WildMap = self:InitWildMap()
    self.WildMap:Init(true, DataMgr.SubRegion[Avatar.CurrentRegionId].RegionId, self)
    self.Scale = self.WildMap.Scale
    self.MapImageCenter = self.WildMap.MapImageCenter
    self.IsInRegionMap = true
    self.MapRotation = self.WildMap.MapRotation
    self.YawOff = self.MapRotation + 90
    self.WildMap.TracePanelBattleMapScale = self.PointPanel.RenderTransform.Scale
  end
  self.TracePanel:SetRenderScale(self.PointPanel.RenderTransform.Scale)
  self.MapPanelStandScale = FVector2D(self.MapPanel.RenderTransform.Scale.X, self.MapPanel.RenderTransform.Scale.Y)
  self.PointPanelScale = self.PointPanel.RenderTransform.Scale
  if self.levelLoader then
    self:CreateBattleMap(self.levelLoader.id2LevelNameAndTransform)
    self.IsPrologue = self.levelLoader.shortname == "Prologue/Main/prologue"
    if self.IsPrologue then
      local PrologueFloorBox = GWorld.GameInstance:GetSceneManager().PrologueFloorBox
      if PrologueFloorBox then
        self.PrologueFloorBoxZ = PrologueFloorBox:K2_GetActorLocation().Z
      end
    end
  end
  self:InitFloorBox()
  self:InitPointPool()
  self:InitMinimapDoor()
  if self.bNewMaterial then
    self:AddTimer(0.01, function()
      self.InMapWidth = USlateBlueprintLibrary.GetLocalSize(self.RetainerBox_101:GetCachedGeometry())
      self.OutMapWidth = USlateBlueprintLibrary.GetLocalSize(self.Battle.RetainerBox_2:GetCachedGeometry())
      self:InitMapWidth()
    end)
    self.EnemyMaterial = self.EnemyPanel:GetDynamicMaterial()
    for i = 1, 3 do
      if self["MapPanel" .. i] then
        local Material = self["MapPanel" .. i]:GetDynamicMaterial()
        if i < 3 then
          self.MapMaterialArray:Add(Material)
        else
          self.DoorMaterial = Material
        end
        Material:SetScalarParameterValue("Appear", 1)
        for i = 1, self.MapMaterialTexNum do
          Material:SetScalarParameterValue("MapOpacity" .. i, 0)
        end
      end
    end
    self.DoorArrowMaterial = self.DoorArrowPanel:GetDynamicMaterial()
    self.GuideIconMaterial = self.GuidePanel:GetDynamicMaterial()
    self.DropIconMaterial = self.DropPanel:GetDynamicMaterial()
    self.GuideIconArrowMaterial = self.GuideArrowPanel:GetDynamicMaterial()
    self.DropIconArrowMaterial = self.DropArrowPanel:GetDynamicMaterial()
    local GuideIconArrow = LoadObject("/Game/UI/Texture/Static/Atlas/Map/Src_T_Map_Subscript_MiniMap.Src_T_Map_Subscript_MiniMap")
    for i = 1, 10 do
      local Obj1 = NewObject(UBattleMapEnemyObj.StaticClass(), self)
      local Obj2 = NewObject(UBattleMapEnemyObj.StaticClass(), self)
      Obj1.Index = i
      Obj2.Index = i
      self.GuideIndexPool:Add(Obj1)
      self.DropIndexPool:Add(Obj2)
      self.GuideIconMaterial:SetScalarParameterValue("EnemyOpacity" .. i, 0)
      self.DropIconMaterial:SetScalarParameterValue("EnemyOpacity" .. i, 0)
      self.GuideIconArrowMaterial:SetScalarParameterValue("EnemyOpacity" .. i, 0)
      self.DropIconArrowMaterial:SetScalarParameterValue("EnemyOpacity" .. i, 0)
      self.GuideIconArrowMaterial:SetTextureParameterValue("GuideTex" .. i, GuideIconArrow)
      self.DropIconArrowMaterial:SetTextureParameterValue("GuideTex" .. i, GuideIconArrow)
      self.DoorArrowMaterial:SetScalarParameterValue("MapOpacity" .. i, 0)
      self.DoorArrowMaterial:SetTextureParameterValue("MapTex" .. i, GuideIconArrow)
    end
  else
    for i = 1, 3 do
      if self["MapPanel" .. i] then
        self["MapPanel" .. i]:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
    self.EnemyPanel:SetVisibility(ESlateVisibility.Collapsed)
    self.GuidePanel:SetVisibility(ESlateVisibility.Collapsed)
    self.DropPanel:SetVisibility(ESlateVisibility.Collapsed)
    self.GuideArrowPanel:SetVisibility(ESlateVisibility.Collapsed)
    self.DropArrowPanel:SetVisibility(ESlateVisibility.Collapsed)
  end
  local IsMobile = CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile"
  for i = 1, self.BatteMapMonNum do
    local enemy = self:NewEnemy()
    enemy:SetAnimation(enemy.In, enemy.Out, enemy.Loop)
    enemy:SetVisibility(ESlateVisibility.Collapsed)
    enemy.IsMobile = IsMobile
    self.EnemyPoint:Add(enemy)
    if self.bNewMaterial then
      local Obj = NewObject(UBattleMapEnemyObj.StaticClass(), self)
      Obj.Index = i
      Obj.MonsterIcon2EndIcon:Add("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Enemy.T_Gp_Enemy", "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Enemy_Sleep.T_Gp_Enemy_Sleep")
      Obj.MonsterIcon2EndIcon:Add("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rescue_Elite.T_Gp_Rescue_Elite", "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rescue_Elite_Sleep.T_Gp_Rescue_Elite_Sleep")
      self.EnemyIndexPool:Add(Obj)
      self.EnemyMaterial:SetScalarParameterValue("EnemyOpacity" .. i, 0)
    end
  end
  local scenemanager = UGameplayStatics.GetGameInstance(self):GetSceneManager()
  local cacheInfo = scenemanager.CacheGuideInfo
  if cacheInfo then
    for name, info in pairs(cacheInfo) do
      if info then
        self:UpdateGuideIcon(scenemanager, name, "Add", info[4], info[1], info[2], info[3], info[5], info[6], info[7])
      end
    end
    scenemanager.CacheGuideInfo = {}
  end
  self.UnlockEventId = nil
  if Avatar then
    self.UnlockEventId = Avatar:BindOnUIFirstTimeUnlock("Map", function()
      self:OnChangeKeyBoardSet()
    end)
  end
  self.VX_EdgeWarnings:SetVisibility(ESlateVisibility.Collapsed)
  self.TextureLoadingMap = {}
  if IsMobile then
    self.RenderTarget = LoadObject("/Game/UI/Texture/Static/Atlas/Battle/T_Minimap_RT_Mobile.T_Minimap_RT_Mobile")
  else
    self.RenderTarget = LoadObject("/Game/UI/Texture/Static/Atlas/Battle/T_Minimap_RT.T_Minimap_RT")
  end
  UKismetRenderingLibrary.ClearRenderTarget2D(self, self.RenderTarget)
  if self.DungeonData and self.DungeonData.bHideBatttleMap then
    self:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_BattleMap_C:InitMapWidth()
  self.MapWidth = self.IsOpen and self.OutMapWidth or self.InMapWidth
  for _, Material in pairs(self.MapMaterialArray) do
    Material:SetScalarParameterValue("PanelSizeY", self.MapWidth.Y)
  end
  self.DoorMaterial:SetScalarParameterValue("PanelSizeY", self.MapWidth.Y)
  self.GuideIconMaterial:SetScalarParameterValue("PanelSizeY", self.MapWidth.Y)
  self.DropIconMaterial:SetScalarParameterValue("PanelSizeY", self.MapWidth.Y)
  self.GuideIconArrowMaterial:SetScalarParameterValue("PanelSizeY", self.MapWidth.Y)
  self.DropIconArrowMaterial:SetScalarParameterValue("PanelSizeY", self.MapWidth.Y)
  self.EnemyMaterial:SetScalarParameterValue("PanelSizeY", self.MapWidth.Y)
  self.TraceArrowRange = (1 - 32 / self.MapWidth.X) / 2
  self.DoorArrowMaterial:SetScalarParameterValue("PanelSizeY", self.MapWidth.Y)
end

function WBP_BattleMap_C:ChangeEvent()
  if self.IsOpen then
    self.RetainerBox_101:SetVisibility(ESlateVisibility.Collapsed)
    self.Battle.Map_Img:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Battle.Map_Img:AddChild(self.Panel_Root)
    self.Battle.Map_Out:AddChild(self.TracePanel)
    self.Battle.Map_Out:AddChild(self.GamerPanel)
    self.Battle:PlayAnimation(self.Battle.ShowMap)
    self:AdjustSlot(self.Panel_Root.Slot)
    self:AdjustSlot(self.TracePanel.Slot)
    self:AdjustSlot(self.GamerPanel.Slot)
    self.MiniMapRad = 320
  else
    self.RetainerBox_101:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Battle.Map_Img:SetVisibility(ESlateVisibility.Collapsed)
    self.RetainerBox_101:AddChild(self.Panel_Root)
    self.Panel_Map:AddChild(self.TracePanel)
    self.Panel_Map:AddChild(self.GamerPanel)
    self:AdjustSlot(self.TracePanel.Slot)
    self:AdjustSlot(self.GamerPanel.Slot)
    self.Battle:PlayAnimation(self.Battle.CollapsedMap)
    self:SetVisibility(0)
    self.MiniMapRad = 135
  end
  if self.bNewMaterial then
    self:InitMapWidth()
  end
end

function WBP_BattleMap_C:AdjustSlot(CanvasSlot)
  local half = UKismetMathLibrary.Vector2D_One() / 2
  local anchors = CanvasSlot:GetAnchors()
  if self.bNewMaterial then
    anchors.Minimum = UKismetMathLibrary.Vector2D_Zero()
    anchors.Maximum = UKismetMathLibrary.Vector2D_One()
  else
    anchors.Minimum = half
    anchors.Maximum = half
  end
  CanvasSlot:SetAnchors(anchors)
  CanvasSlot:SetPosition(UKismetMathLibrary.Vector2D_Zero())
  CanvasSlot:SetSize(UKismetMathLibrary.Vector2D_Zero())
  CanvasSlot:SetAlignment(half)
end

function WBP_BattleMap_C:DelayAddTouchLayer()
  self.InitBoxScale = FVector2D(self.RetainerBox_101.RenderTransform.Scale.X, self.RetainerBox_101.RenderTransform.Scale.Y)
  self.ScaleByFingerTouch = self.RetainerBox_101.RenderTransform.Scale
  self:AddStaticSubTouchItem("BattleMapLayer", self.MapPanel, {
    Move = self.TouchMapMove,
    MultiMove = self.TouchMapMultiMove
  })
end

function WBP_BattleMap_C:CreateBattleMap(mapData)
  if not mapData then
    return
  end
  for id, data in pairs(mapData) do
    self:CreateSingleBattleMap(id, data)
  end
end

function WBP_BattleMap_C:CreateSingleBattleMap(id, data)
  if not data[4] or self.levelLoader.IsWorldLoader then
    return
  end
  if self.bNewMaterial then
    local path = "/Game/UI/Texture/Dynamic/Image/Map/T_MiniMap_"
    local temp, _ = UNameStringFunctionLibrary.LongPathNameToName(data[1])
    path = path .. temp
    if not UResourceLibrary.CheckResourceExistOnDisk(path) then
      return
    end
    local Obj = NewObject(UBattleMapLevelObj.StaticClass(), self)
    Obj.ImagePath = path
    Obj.LevelCenter = FVector2D(data[2].X, data[2].Y)
    Obj.Angle = (data[3] or 0) / 360
    self.LevelId2MapObj:Add(id, Obj)
    if self.LevelId2BuildingMap:FindRef(id) then
      Obj:SetRenderOpacity(0.3)
      Obj.TargetOpacity = 0.3
    else
      Obj:SetRenderOpacity(1)
      Obj.TargetOpacity = 1
    end
    return
  end
  local path = "/Game/UI/Texture/Dynamic/Image/Map/T_MiniMap_"
  local temp, _ = UNameStringFunctionLibrary.LongPathNameToName(data[1])
  local texture = LoadObject(path .. temp)
  if texture then
    local isPc = UGameplayStatics.GetPlatformName() == "Windows"
    local map = self:NewMap()
    local DMI = map.Map:GetDynamicMaterial()
    DMI:SetTextureParameterValue("MapTexture", texture)
    DMI:SetScalarParameterValue("Angle", (data[3] + 360) / 360)
    local size = FVector2D(texture:Blueprint_GetSizeX(), texture:Blueprint_GetSizeY())
    map.Map:SetBrushSize(size)
    local levelLocation = FVector2D(data[2].X, data[2].Y) * self.Scale
    DMI:setVectorParameterValue("Center", FLinearColor(levelLocation.X, levelLocation.Y, size.X, size.Y))
    map:SetRenderTranslation(levelLocation)
    map:SetRenderTransformAngle(data[3])
    if math.abs(data[3]) > 45 and math.abs(data[3]) < 145 then
      size = FVector2D(size.Y, size.X)
    end
    self.MapArray[#self.MapArray + 1] = map
    self.LevelId2Map[id] = map
    self:AddAppearMap(map.Map, levelLocation, size)
    map:SetVisibility(ESlateVisibility.Collapsed)
    if self.LevelId2BuildingMap:FindRef(id) then
      map:SetRenderOpacity(0.3)
    else
      map:SetRenderOpacity(1)
    end
  end
end

function WBP_BattleMap_C:CreateRougelikeBattleMap(Id, Data)
  if self.bNewMaterial then
    if not self.RougelikeMaterial then
      local Material = UKismetMaterialLibrary.CreateDynamicMaterialInstance(self, LoadObject("/Game/UI/Materials/MiniMap/MI_MiniMap_Pack_NoFog.MI_MiniMap_Pack_NoFog"), nil, 0)
      self.MapPanel1:SetBrushFromMaterial(Material)
      self.MapMaterialArray:Clear()
      self.MapMaterialArray:Add(Material)
      self.RougelikeMaterial = true
    end
    local path = "/Game/UI/Texture/Dynamic/Image/Map/T_MiniMap_" .. Data[1]
    if not UResourceLibrary.CheckResourceExistOnDisk(path) then
      return
    end
    local Obj = NewObject(UBattleMapLevelObj.StaticClass(), self)
    Obj.ImagePath = path
    Obj.LevelCenter = FVector2D(Data[2].X, Data[2].Y)
    Obj.Angle = (Data[3] or 0) / 360
    if self.LevelId2BuildingMap:FindRef(Id) then
      Obj:SetRenderOpacity(0.3)
      Obj.TargetOpacity = 0.3
    else
      Obj:SetRenderOpacity(1)
      Obj.TargetOpacity = 1
    end
    self:AddRougelikeMap(Id, Obj)
    return
  end
  for _, map in pairs(self.MapArray) do
    map:RemoveFromParent()
  end
  self.MapArray = {}
  local texture = LoadObject("/Game/UI/Texture/Dynamic/Image/Map/T_MiniMap_" .. Data[1])
  if texture then
    local map = self:NewMap()
    map.Map:SetBrushFromTexture(texture, true)
    local size = FVector2D(texture:Blueprint_GetSizeX(), texture:Blueprint_GetSizeY())
    map.Map:SetBrushSize(size)
    local levelLocation = FVector2D(Data[2].X, Data[2].Y) * self.Scale
    map:SetRenderTranslation(levelLocation)
    map:SetRenderTransformAngle(Data[3])
    map:SetRenderOpacity(1)
    self.MapArray[#self.MapArray + 1] = map
  end
end

function WBP_BattleMap_C:TouchMapMove()
end

function WBP_BattleMap_C:TouchMapMultiMove(TouchFingerCount, Index, Pos1, Pos2, TwoPointDist)
  if not UE4.UKismetSystemLibrary.IsValid(self.Player) or TouchFingerCount <= 1 then
    return
  end
  if self.LastTouchMultiDist == nil then
    self.LastTouchMultiDist = TwoPointDist
    return
  end
  local DeltaDis = TwoPointDist - self.LastTouchMultiDist
  if DeltaDis >= 5 then
    self.ScaleByFingerTouch.X = math.min(self.ScaleByFingerTouch.X + 0.05, 2)
    self.ScaleByFingerTouch.Y = math.min(self.ScaleByFingerTouch.Y + 0.05, 2)
  elseif DeltaDis <= -5 then
    self.ScaleByFingerTouch.X = math.max(self.ScaleByFingerTouch.X - 0.05, 1)
    self.ScaleByFingerTouch.Y = math.max(self.ScaleByFingerTouch.Y - 0.05, 1)
  end
  self.RetainerBox_101:SetRenderScale(self.ScaleByFingerTouch)
  self.LastTouchMultiDist = TwoPointDist
end

function WBP_BattleMap_C:OnClickOpen(Geometry, InputEvent)
  if self.IsDisableClick then
    DebugPrint("WBP_BattleMap_C.IsDisableClick = true")
    return
  end
  if not self.Player:GetController():IsA(APlayerController) then
    return
  end
  local Size = USlateBlueprintLibrary.GetAbsoluteSize(Geometry)
  local Position = USlateBlueprintLibrary.LocalToAbsolute(Geometry, FVector2D(0, 0))
  FVector2D.Div(Size, 2)
  FVector2D.Add(Position, Size)
  local MousePosition = UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(InputEvent)
  if UKismetMathLibrary.Distance2D(Position, MousePosition) >= Size.X then
    return
  end
  self:OnClickRealOpen()
end

function WBP_BattleMap_C:OnClickRealOpen()
  if self.levelLoader and self.levelLoader.IsWorldLoader then
    self:OnKeyboardClick()
    return
  end
  if self.DungeonData and (self.DungeonData.DungeonType == "Temple" or self.DungeonData.bHideBatttleMap) then
    return
  end
  if self.IsOpen == true then
    return
  end
  self.IsOpen = true
  self.IsAnimating = true
  if self.Common_Key_Hud_PC then
    self.Common_Key_Hud_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.MapPanel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Btn_Open:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:ChangeEvent()
  self.BG:SetVisibility(UE4.ESlateVisibility.Hidden)
  self.IsAnimating = false
  self.Btn_Close:SetVisibility(UE4.ESlateVisibility.Visible)
end

function WBP_BattleMap_C:OnClickClose()
  self.IsOpen = false
  self.IsAnimating = true
  if self.Common_Key_Hud_PC and self.HudKeyShow then
    self.Common_Key_Hud_PC:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  self.MapPanel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Btn_Close:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:ChangeEvent()
  self.IsAnimating = false
  self.Btn_Open:SetVisibility(UE4.ESlateVisibility.Visible)
  self.BG:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function WBP_BattleMap_C:OnKeyboardClick()
  if TeamController:IsTeamPopupBarOpenInGamepad() then
    return
  end
  if self.IsAnimating then
    return
  end
  if self.levelLoader and self.levelLoader.IsWorldLoader then
    local Avatar = GWorld:GetAvatar()
    if not (Avatar and Avatar:IsRealInBigWorld()) or Avatar:IsInHardBoss() then
      return
    end
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManager = GameInstance:GetGameUIManager()
    if not UIManager then
      return
    end
    local unlocked = Avatar:CheckUIUnlocked("Map")
    if unlocked then
      local UIObj = UIManager:GetUIObj("LevelMapMain")
      if UIObj then
      else
        UIManager:LoadUINew("LevelMapMain")
      end
    end
  elseif self.IsOpen then
    self:OnClickClose()
  else
    self:OnClickRealOpen()
  end
end

function WBP_BattleMap_C:InitPointPool()
  self.PointPool_TracePanel = {}
  self.PointPool_PointPanel = {}
  self.PointArrowPool = {}
  local TempPool = {}
  for i = 1, 5 do
    local Point_T, Arrow = self.Overridden.NewPoint(self, true)
    local Point_P, _ = self.Overridden.NewPoint(self, false)
    table.insert(self.PointPool_TracePanel, Point_T)
    table.insert(self.PointPool_PointPanel, Point_P)
    table.insert(TempPool, Arrow)
    Point_T:SetVisibility(ESlateVisibility.Collapsed)
    Point_P:SetVisibility(ESlateVisibility.Collapsed)
    Arrow:SetVisibility(ESlateVisibility.Collapsed)
    local ExtraArrow = self:NewPointArrow()
    ExtraArrow:SetVisibility(ESlateVisibility.Collapsed)
    table.insert(TempPool, ExtraArrow)
    if not self.GuidePointClass then
      self.GuidePointClass = UGameplayStatics.GetObjectClass(Point_T)
    end
  end
  self.PointArrowPool = TempPool
end

function WBP_BattleMap_C:NewPointArrow()
  local Arrow
  if self.PointArrowPool and #self.PointArrowPool > 0 then
    Arrow = self.PointArrowPool[#self.PointArrowPool]
    table.remove(self.PointArrowPool, #self.PointArrowPool)
  end
  Arrow = Arrow or self.Overridden.NewPointArrow(self)
  Arrow:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  return Arrow
end

function WBP_BattleMap_C:NewPoint(NeedTrace)
  local Point, Arrow
  if NeedTrace then
    if self.PointPool_TracePanel and #self.PointPool_TracePanel > 0 then
      Point = self.PointPool_TracePanel[#self.PointPool_TracePanel]
      table.remove(self.PointPool_TracePanel, #self.PointPool_TracePanel)
    end
    if not Point then
      Point, Arrow = self.Overridden.NewPoint(self, NeedTrace)
    end
    if NeedTrace and not Arrow then
      Arrow = self:NewPointArrow()
    end
    if Point then
      Point:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    if Arrow then
      Arrow:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  else
    if self.PointPool_PointPanel and #self.PointPool_PointPanel > 0 then
      Point = self.PointPool_PointPanel[#self.PointPool_PointPanel]
      table.remove(self.PointPool_PointPanel, #self.PointPool_PointPanel)
    end
    if not Point then
      Point, Arrow = self.Overridden.NewPoint(self, NeedTrace)
    end
    if Point then
      Point:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  end
  return Point, Arrow
end

function WBP_BattleMap_C:UpdateGuideIcon(SceneManager, GuideName, OpType, TargetEid, TargetActor, TargetActorLocation, ConfigData, IsNeedArrow, IsGuideFollowActor, IsNeedLookUpEntity)
  DebugPrint(" WBP_BattleMap_C:UpdateGuideIcon", GuideName, OpType)
  if "Delete" == OpType then
    self:RemoveGuidePoint(GuideName)
  else
    if nil == ConfigData then
      ConfigData = {
        UnitType = "",
        GuideIconAni = "triangle",
        GuideIconBPPath = "/Game/UI/UI_Phone/Battle/Battle_Main/Frames/Icon_MapMark_05.Icon_MapMark_05"
      }
    end
    local GuideAni = SceneManager:GetGuideGuideAnimByBPPath(ConfigData.GuideIconAni, ConfigData.GuideIconBPPath)
    if "Phantom" == GuideAni then
      local bNeedTrack = ConfigData.PlayerIndex and ConfigData.PlayerIndex > 0
      if not self.GuidePoint:Find(GuideName) then
        self.GuidePoint:Add(GuideName, self:NewPhantom(bNeedTrack))
      end
      if not self.GuideData:Find(GuideName) then
        self.GuideData:Add(GuideName, FBattleMapGuideInfo())
      end
      local guideData = self.GuideData:FindRef(GuideName)
      guideData.GuideTarget = TargetActor
      guideData.GuideTargetLocation = TargetActorLocation
      guideData.GuideTargetEid = TargetEid
      guideData.IsGuideFollowActor = IsGuideFollowActor
      guideData.IsNeedLookUpEntity = IsNeedLookUpEntity
      guideData.PlayerIndex = ConfigData.PlayerIndex
      guideData.NeedTrack = bNeedTrack
      self:InitPhantomConfigData(GuideName, guideData, ConfigData.UnitId)
      if guideData.NeedTrack and not self.GuidePointArrow:Find(self.GuidePoint:Find(GuideName)) then
        local GuideIconSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.GuidePoint:Find(GuideName))
        if GuideIconSlot then
          GuideIconSlot:SetZOrder(UIConst.ZORDER_FOR_NORMAL)
        end
        self:AddTrack(GuideName)
        local Arrow = self:NewPointArrow()
        self.GuidePointArrow:Add(self.GuidePoint:Find(GuideName), Arrow)
      end
      return
    elseif "Hostage" == GuideAni then
      if not self.GuidePoint:Find(GuideName) then
        local HostageIcon = self:NewHostage()
        HostageIcon.IsHostage = true
        HostageIcon:AttachEvent()
        self.GuidePoint:Add(GuideName, HostageIcon)
      end
      if not self.GuideData:Find(GuideName) then
        self.GuideData:Add(GuideName, FBattleMapGuideInfo())
      end
      local guideData = self.GuideData:FindRef(GuideName)
      guideData.GuideTarget = TargetActor
      guideData.GuideTargetLocation = TargetActorLocation
      guideData.GuideTargetEid = TargetEid
      guideData.IsGuideFollowActor = IsGuideFollowActor
      guideData.IsNeedLookUpEntity = IsNeedLookUpEntity
      guideData.NeedTrack = false
      self:InitHostageImage(GuideName)
      return
    end
    if ConfigData.GuideVisibility then
      return
    end
    local MiniMapGuidePNG = ConfigData.GuideIconBPPath
    if "Pet" == GuideAni then
      local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
      if GameMode and false == GameMode:IsInDungeon() and ConfigData.GuideIconBPPath2 then
        MiniMapGuidePNG = ConfigData.GuideIconBPPath2
      end
    end
    if nil ~= TargetEid and "Destroy" == GuideAni then
      local Info = {
        TargetActor = TargetActor,
        TargetActorLocation = TargetActorLocation,
        TargetEid = TargetEid,
        IsGuideFollowActor = IsGuideFollowActor,
        IsNeedLookUpEntity = IsNeedLookUpEntity
      }
      self.SabotageABCGuideCache[GuideName] = Info
      local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
      if nil ~= Player then
        Player.RPCComponent:RequestSabotageGuideInfo_Client(self, self.SetSabotageABCGuideIcon_Callback)
      end
      return
    elseif nil ~= TargetEid and "Excavation" == GuideAni then
      if not IsValid(TargetActor) then
        return
      end
      local Index = (TargetActor.GuideOrderIndex - 1) % 6
      local Content = string.char(string.byte("A") + Index)
      MiniMapGuidePNG = SceneManager:GetExcavationABCIconPath(Content)
    else
      return
    end
    if not MiniMapGuidePNG then
      return
    end
    if self.bNewMaterial then
      if not self.GuideIconMap:Find(GuideName) then
        local Index = self.GuideIndexPool:Num()
        if 0 == Index then
          GWorld.logger.error("UpdateGuideIcon Out Of Range !!!")
          return
        end
        local Obj = self.GuideIndexPool:Get(Index)
        Obj.RangeArrow = self:NewPointArrow()
        self.GuideIconMap:Add(GuideName, Obj)
        self.GuideIndexPool:Remove(Index)
        self.GuideIconMaterial:SetScalarParameterValue("EnemyOpacity" .. Obj.Index, 1)
        Obj:SetGuideTarget(MiniMapGuidePNG, self.GuideIconMaterial)
      end
      if not self.GuideData:Find(GuideName) then
        self.GuideData:Add(GuideName, FBattleMapGuideInfo())
      end
      local guideData = self.GuideData:FindRef(GuideName)
      guideData.GuideTarget = TargetActor
      guideData.GuideTargetLocation = TargetActorLocation
      guideData.GuideTargetEid = TargetEid
      guideData.IsGuideFollowActor = IsGuideFollowActor
      guideData.IsNeedLookUpEntity = IsNeedLookUpEntity
    else
      if not self.GuidePoint:Find(GuideName) then
        local point, arrow = self:NewPoint(true)
        self.GuidePoint:Add(GuideName, point)
        self.GuidePointArrow:Add(point, arrow)
      end
      if not self.GuideData:Find(GuideName) then
        self.GuideData:Add(GuideName, FBattleMapGuideInfo())
      end
      local guideData = self.GuideData:FindRef(GuideName)
      guideData.GuideTarget = TargetActor
      guideData.GuideTargetLocation = TargetActorLocation
      guideData.GuideTargetEid = TargetEid
      guideData.IsGuideFollowActor = IsGuideFollowActor
      guideData.IsNeedLookUpEntity = IsNeedLookUpEntity
      self:LoadTextureAsync(MiniMapGuidePNG, self.GuidePoint:FindRef(GuideName), "SetImageWithTextureOrSprite", self:GetAssetNameFromPath(MiniMapGuidePNG))
      self:AddTrack(GuideName)
    end
  end
end

function WBP_BattleMap_C:MiniMapGuidePNGLoadFinish(Object)
  if not Object then
    return
  end
  local GuideName = self.LoadingGuidePNGMap[Object]
end

function WBP_BattleMap_C:SetSabotageABCGuideIcon_Callback(Eids, UnitIds)
  for GuideName, Info in pairs(self.SabotageABCGuideCache) do
    self:RealSetSabotageABCGuideIcon(Eids, GuideName, Info)
  end
  self.SabotageABCGuideCache = {}
end

function WBP_BattleMap_C:RealSetSabotageABCGuideIcon(Eids, GuideName, Info)
  DebugPrint("WBP_BattleMap_C: RealSetSabotageABCGuideIcon: GuideName", GuideName, "Eid", Info.TargetEid)
  local index = 0
  for i, Eid in pairs(Eids) do
    if Eid == Info.TargetEid then
      index = i
      break
    end
  end
  if 0 == index then
    return
  end
  local Content = string.char(string.byte("A") + index - 1)
  DebugPrint("WBP_BattleMap_C:SetSabotageABCGuideIcon_Callback Content:", Content)
  local SceneManager = GWorld.GameInstance:GetSceneManager()
  if nil == SceneManager then
    ScreenPrint("WBP_BattleMap_C:SetSabotageABCGuideIcon_Callback: SceneManager \228\184\141\229\173\152\229\156\168")
    return
  end
  local MiniMapGuidePNG = SceneManager:GetSabotageABCIconPath(Content)
  if not MiniMapGuidePNG then
    return
  end
  if not self.GuidePoint:Find(GuideName) then
    local point, arrow = self:NewPoint(true)
    self.GuidePoint:Add(GuideName, point)
    self.GuidePointArrow:Add(point, arrow)
  end
  if not self.GuideData:Find(GuideName) then
    self.GuideData:Add(GuideName, FBattleMapGuideInfo())
  end
  local guideData = self.GuideData:FindRef(GuideName)
  guideData.GuideTarget = Info.TargetActor
  guideData.GuideTargetLocation = Info.TargetActorLocation
  guideData.GuideTargetEid = Info.TargetEid
  guideData.IsGuideFollowActor = Info.IsGuideFollowActor
  guideData.IsNeedLookUpEntity = Info.IsNeedLookUpEntity
  self:LoadTextureAsync(MiniMapGuidePNG, self.GuidePoint:FindRef(GuideName), "SetImageWithTextureOrSprite", self:GetAssetNameFromPath(MiniMapGuidePNG))
  self:AddTrack(GuideName)
end

function WBP_BattleMap_C:ArrangeGuideIcons(TargetEid, TargetDoorLocation, IsInLevel)
  local table = self.GuideData:ToTable()
  for guideName, guideData in pairs(table) do
    if TargetEid == guideData.GuideTargetEid then
      local guidePoint = self.GuidePoint:FindRef(guideName)
      if guidePoint then
        if IsInLevel then
          self.TrackTargetsToTempLocation:Remove(guidePoint)
        else
          local targetLocation = self:TransformWorldLocToUILoc(TargetDoorLocation.X, TargetDoorLocation.Y, false)
          FVector2D.Mul(targetLocation, self.MapPanelStandScale)
          FVector2D.Div(targetLocation, self.PointPanel.RenderTransform.Scale)
          self.TrackTargetsToTempLocation:Add(guidePoint, targetLocation)
        end
      end
    end
  end
end

function WBP_BattleMap_C:SetImageWithTextureOrSprite(Image, Res)
  if URuntimeCommonFunctionLibrary.ObjIsChildOf(Res, UPaperSprite) then
    Image:SetBrushResourceObject(Res)
    Image:SetBrushSize(Res.SourceDimension)
  else
    Image:SetBrushFromTexture(Res, true)
  end
end

function WBP_BattleMap_C:RemoveGuidePoint(GuideName)
  local guidePoint = self.GuidePoint:FindRef(GuideName)
  if nil ~= guidePoint then
    local NeedTrace = guidePoint:GetParent() == self.TracePanel
    self:RemoveTrack(GuideName)
    local guideArrow = self.GuidePointArrow:Find(guidePoint)
    if nil ~= guideArrow then
      guideArrow:SetVisibility(ESlateVisibility.Collapsed)
      if self.PointArrowPool then
        table.insert(self.PointArrowPool, guideArrow)
      end
      self.GuidePointArrow:Remove(guidePoint)
    end
    if UGameplayStatics.GetObjectClass(guidePoint) == self.GuidePointClass then
      guidePoint:SetVisibility(ESlateVisibility.Collapsed)
      if NeedTrace then
        table.insert(self.PointPool_TracePanel, guidePoint)
      else
        table.insert(self.PointPool_PointPanel, guidePoint)
      end
    else
      guidePoint:RemoveFromParent()
    end
    self.GuidePoint:Remove(GuideName)
    self.GuideData:Remove(GuideName)
  end
  if self.bNewMaterial then
    local Obj = self.GuideIconMap:FindRef(GuideName)
    if Obj then
      if Obj.ParentEnemyMaterial == self.GuideIconMaterial then
        self.GuideIndexPool:Add(Obj)
        self.GuideIconMaterial:SetScalarParameterValue("EnemyOpacity" .. Obj.Index, 0)
        self.GuideIconArrowMaterial:SetScalarParameterValue("EnemyOpacity" .. Obj.Index, 0)
      else
        self.DropIndexPool:Add(Obj)
        self.DropIconMaterial:SetScalarParameterValue("EnemyOpacity" .. Obj.Index, 0)
        self.DropIconArrowMaterial:SetScalarParameterValue("EnemyOpacity" .. Obj.Index, 0)
      end
      if Obj.RangeArrow then
        Obj.RangeArrow:SetVisibility(ESlateVisibility.Collapsed)
        if self.PointArrowPool then
          table.insert(self.PointArrowPool, Obj.RangeArrow)
        end
      end
      Obj.TextureSize = UKismetMathLibrary.Vector2D_Zero()
      self.GuideIconMap:Remove(GuideName)
    end
  end
end

function WBP_BattleMap_C:CheckIsNeedCalEveryFrameByActor(guideData)
  if nil == guideData[1] or not UE4.UKismetSystemLibrary.IsValid(guideData[1]) then
    return false
  end
  return guideData[6] or nil == guideData[2]
end

function WBP_BattleMap_C:Destruct()
  WBP_BattleMap_C.Super.Destruct(self)
  self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.OnChangeKeyBoardSet)
  EventManager:RemoveEvent(EventID.ShowDropInMinimap, self)
  EventManager:RemoveEvent(EventID.ShowRangedIconInMinimap, self)
  EventManager:RemoveEvent(EventID.OnArtLevelLoadedStateChange, self)
  EventManager:RemoveEvent(EventID.OnChangeKeyBoardSet, self)
  EventManager:RemoveEvent(EventID.EdgeFalltrigerChangeOverlapState, self)
  EventManager:RemoveEvent(EventID.PlayerRecoveryStateChange, self)
  EventManager:RemoveEvent(EventID.UpdateDoorIcon, self)
  EventManager:RemoveEvent(EventID.OnTeamRecoveryStateChange, self)
  EventManager:RemoveEvent(EventID.ForceUpdatePlayerCurrentLevelId, self)
  self:OnClickClose()
  for _, map in pairs(self.MapArray) do
    map:RemoveFromParent()
  end
  self.MapArray = {}
  for _, point in pairs(self.GuidePoint:ToTable()) do
    point:RemoveFromParent()
  end
  for _, point in pairs(self.GuidePointArrow:ToTable()) do
    point:RemoveFromParent()
  end
  for _, point in pairs(self.EnemyPoint:ToTable()) do
    point:RemoveFromParent()
  end
  self.TracePanel:ClearChildren()
  self.PointPanel:ClearChildren()
  self.PointPool_TracePanel = nil
  self.PointPool_PointPanel = nil
  self.PointArrowPool = nil
  self.EnemyPoint:Clear()
  self.EnemyIndexPool:Clear()
  self.GuideIndexPool:Clear()
  self.DropIndexPool:Clear()
  self.LevelId2MapObj:Clear()
  for _, Obj in pairs(self.GuideIconMap:ToTable()) do
    if Obj.RangeArrow then
      Obj.RangeArrow:RemoveFromParent()
    end
  end
  self.GuideIconMap:Clear()
  self.GuideData:Clear()
  if self.WildMap then
    self.WildMap:RemoveFromParent()
    self.WildMap = nil
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar and self.UnlockEventId then
    Avatar:UnBindOnUIFirstTimeUnlock("Map", self.UnlockEventId)
    self.UnlockEventId = nil
  end
  UGameplayStatics.GetGameInstance(self):GetSceneManager().CacheGuideInfo = self.GuideData
end

function WBP_BattleMap_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.SpecialLeft then
    self:OnClickRealOpen()
    return UWidgetBlueprintLibrary.Handled()
  end
  return UWidgetBlueprintLibrary.Unhandled()
end

function WBP_BattleMap_C:OnChangeKeyBoardSet()
  local platformName = UGameplayStatics.GetPlatformName()
  local IsTemple = self.DungeonData and self.DungeonData.DungeonType == "Temple"
  local IsGamepad = self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad
  self.HudKeyShow = "Windows" == platformName and not IsTemple and IsGamepad
  if self.Common_Key_Hud_PC and self.HudKeyShow then
    local keyName = CommonUtils:GetActionMappingKeyName("OpenMap", true)
    self.Common_Key_Hud_PC:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = CommonUtils:GetKeyText(keyName)
        }
      }
    })
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local unlocked = Avatar:CheckUIUnlocked("Map")
  if unlocked and self.HudKeyShow then
    self.Common_Key_Hud_PC:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Common_Key_Hud_PC:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_BattleMap_C:AddArea(TargetAreaName)
  if not self.GameState.QuestArea or self.IsInRegionMap then
    return
  end
  local TargetArea = self.GameState.QuestArea[TargetAreaName]
  if not TargetArea then
    return
  end
  local pos = TargetArea:K2_GetActorLocation()
  local location = FVector2D(pos.X, pos.Y) * self.Scale * self.MapPanelStandScale / self.RangePanel.RenderTransform.Scale
  local scale = FVector2D(TargetArea.Radius * 2 * self.Scale / 230)
  local area = self:NewArea()
  area:SetRenderTranslation(location)
  area:SetRenderScale(scale)
end

function WBP_BattleMap_C:ShowDropInMinimap(PickupBase, IsShow)
  local GuideName = tostring(PickupBase.Eid)
  if not IsShow then
    if self.GuideData:Find(GuideName) then
      self:RemoveGuidePoint(GuideName)
    end
    return
  end
  if not PickupBase.Data.GuideIconBPPath then
    return
  end
  if self.bNewMaterial then
    if not self.GuideIconMap:Find(GuideName) then
      local Index = self.DropIndexPool:Num()
      if 0 == Index then
        GWorld.logger.error("UpdateGuideIcon Out Of Range !!!")
        return
      end
      local Obj = self.DropIndexPool:Get(Index)
      self.GuideIconMap:Add(GuideName, Obj)
      self.DropIndexPool:Remove(Index)
      self.DropIconMaterial:SetScalarParameterValue("EnemyOpacity" .. Obj.Index, 1)
      Obj:SetGuideTarget(PickupBase.Data.GuideIconBPPath, self.DropIconMaterial)
    end
    if not self.GuideData:Find(GuideName) then
      self.GuideData:Add(GuideName, FBattleMapGuideInfo())
    end
    local guideData = self.GuideData:FindRef(GuideName)
    guideData.GuideTarget = PickupBase
    guideData.GuideTargetLocation = PickupBase:K2_GetActorLocation()
    guideData.GuideTargetEid = PickupBase.Eid
    guideData.IsGuideFollowActor = true
    guideData.IsNeedLookUpEntity = true
    guideData.NeedTrack = false
  else
    if not self.GuidePoint:Find(GuideName) then
      local point, arrow = self:NewPoint(false)
      self.GuidePoint:Add(GuideName, point)
    end
    if not self.GuideData:Find(GuideName) then
      self.GuideData:Add(GuideName, FBattleMapGuideInfo())
    end
    local guideData = self.GuideData:FindRef(GuideName)
    guideData.GuideTarget = PickupBase
    guideData.GuideTargetLocation = PickupBase:K2_GetActorLocation()
    guideData.GuideTargetEid = PickupBase.Eid
    guideData.IsGuideFollowActor = true
    guideData.IsNeedLookUpEntity = true
    guideData.NeedTrack = false
    self:LoadTextureAsync(PickupBase.Data.GuideIconBPPath, self.GuidePoint:FindRef(GuideName), "SetImageWithTextureOrSprite", self:GetAssetNameFromPath(PickupBase.Data.GuideIconBPPath))
  end
end

function WBP_BattleMap_C:ShowRangedIconInMinimap(Eid, IsShow, ImagePath, Radius)
  local GuideName = Eid .. "Ranged"
  local Actor = Battle(self):GetEntity(Eid)
  if not IsShow then
    if self.GuideData:Find(GuideName) then
      self:RemoveGuidePoint(GuideName)
    end
    return
  end
  if not ImagePath or not Actor then
    return
  end
  if not self.GuideIconMap:Find(GuideName) then
    local Index = self.GuideIndexPool:Num()
    if 0 == Index then
      GWorld.logger.error("UpdateGuideIcon Out Of Range !!!")
      return
    end
    local Obj = self.GuideIndexPool:Get(Index)
    self.GuideIconMap:Add(GuideName, Obj)
    self.GuideIndexPool:Remove(Index)
    self.GuideIconMaterial:SetScalarParameterValue("EnemyOpacity" .. Obj.Index, 1)
    Obj:SetGuideTarget(ImagePath, self.GuideIconMaterial)
  end
  if not self.GuideData:Find(GuideName) then
    self.GuideData:Add(GuideName, FBattleMapGuideInfo())
  end
  local guideData = self.GuideData:FindRef(GuideName)
  guideData.GuideTarget = Actor
  guideData.GuideTargetLocation = Actor:K2_GetActorLocation()
  guideData.GuideTargetEid = Eid
  guideData.IsGuideFollowActor = true
  guideData.IsNeedLookUpEntity = false
  guideData.NeedTrack = false
  guideData.Radius = Radius
end

function WBP_BattleMap_C:TickFloor()
  if not self.Player or 0 == self.Player.CurrentLevelId:Num() or self.Player:IsCharacterInAir() then
    return
  end
  local levelId = self.Player.CurrentLevelId:GetRef(1)
  if self.Player.CurrentLevelId:Num() > 1 then
    for _, id in pairs(self.Player.CurrentLevelId:ToTable()) do
      if self.levelLoader:CheckLocationInGridframeByLevelId(id, self.Player.CurrentLocation) then
        levelId = id
        break
      end
    end
  end
  local playerZ = self.Player.CurrentLocation.Z
  local currentFloorId
  if self.LevelId2BuildingMap[levelId] then
    local currentZ
    for floorId, map in pairs(self.LevelId2BuildingMap[levelId]) do
      if self.BuildingFloor2Z[map] and playerZ > self.BuildingFloor2Z[map] and (nil == currentFloorId or currentZ < self.BuildingFloor2Z[map]) then
        currentFloorId = floorId
        currentZ = self.BuildingFloor2Z[map]
      end
    end
  end
  if self.LastFloorId == currentFloorId and self.LastFloorLevelId == levelId then
    return
  end
  self.LastFloorId = currentFloorId
  self.LastFloorLevelId = levelId
  for id, mapArray in pairs(self.LevelId2BuildingMap) do
    for floorId, map in pairs(mapArray) do
      if id == levelId then
        if floorId == currentFloorId then
          if map.CurrentAni ~= map.In then
            map:StopAllAnimations()
            map:PlayAnimation(map.In)
            map.CurrentAni = map.In
          end
        elseif map.CurrentAni ~= map.Out then
          map:StopAllAnimations()
          map:PlayAnimation(map.Out)
          map.CurrentAni = map.Out
        end
      elseif map.CurrentAni ~= map.Out then
        map:StopAllAnimations()
        map:PlayAnimation(map.Out)
        map.CurrentAni = map.Out
      end
    end
  end
end

function WBP_BattleMap_C:OnArtLevelLoadedStateChange(LevelId, IsLoad)
  if self.bNewMaterial then
    return
  end
  self:SetFloorState(LevelId, IsLoad)
  if self.LevelId2Map[LevelId] then
    self.LevelId2Map[LevelId]:SetVisibility(IsLoad and ESlateVisibility.SelfHitTestInvisible or ESlateVisibility.Collapsed)
  end
end

function WBP_BattleMap_C:InitFloorBox()
  local array = GWorld.GameInstance:GetSceneManager().FloorBoxArray
  if not array or self.IsInRegionMap then
    return
  end
  for _, FloorBox in pairs(array) do
    self:AddFloorBox(FloorBox)
  end
end

function WBP_BattleMap_C:AddFloorBox(FloorBox)
  if FloorBox.TriggerOnly then
    return
  end
  if self.levelLoader and self.levelLoader.IsWorldLoader then
    return
  end
  if self.bNewMaterial then
    local path = "/Game/UI/Texture/Dynamic/Image/Map/T_MiniMap_"
    local mapName = FloorBox.BulidingName .. "_L" .. FloorBox.BuildingFloor
    local Obj = NewObject(UBattleMapLevelObj.StaticClass(), self)
    local loc = FloorBox:K2_GetActorLocation()
    Obj.ImagePath = path .. mapName
    Obj.LevelCenter = FVector2D(loc.X, loc.Y)
    Obj.Angle = (FloorBox:K2_GetActorRotation().Yaw + 360) / 360
    local levelId = self.levelLoader:GetDesignActorLevelName(FloorBox)
    self:AddBuildingMapNew(levelId, FloorBox.BuildingFloor, Obj, FloorBox:k2_GetActorLocation().Z)
    local Map = self.LevelId2MapObj:FindRef(levelId)
    if Map then
      Map:SetRenderOpacity(0.3)
      Map.TargetOpacity = 0.3
    end
    return
  end
  local path = "/Game/UI/Texture/Dynamic/Image/Map/T_MiniMap_"
  local mapName = FloorBox.BulidingName .. "_L" .. FloorBox.BuildingFloor
  local texture = LoadObject(path .. mapName)
  if not texture then
    return
  end
  local isPc = UGameplayStatics.GetPlatformName() == "Windows"
  local map = self:NewFloor()
  map.BulidingName = FloorBox.BulidingName
  local DMI = map.Map:GetDynamicMaterial()
  local loc = FloorBox:K2_GetActorLocation()
  local rot = FloorBox:K2_GetActorRotation().Yaw
  DMI:SetTextureParameterValue("MapTexture", texture)
  DMI:SetScalarParameterValue("Angle", (rot + 360) / 360)
  local size = FVector2D(texture:Blueprint_GetSizeX(), texture:Blueprint_GetSizeY())
  map.Map:SetBrushSize(size)
  local levelLocation = FVector2D(loc.X, loc.Y) * self.Scale
  DMI:setVectorParameterValue("Center", FLinearColor(levelLocation.X, levelLocation.Y, size.X, size.Y))
  map:SetRenderTranslation(levelLocation)
  map:SetRenderTransformAngle(rot)
  self.MapArray[#self.MapArray + 1] = map
  self:AddAppearMap(map.Map, levelLocation, size)
  map:SetVisibility(ESlateVisibility.Collapsed)
  local levelId = self.levelLoader:GetDesignActorLevelName(FloorBox)
  self:AddBuildingMap(levelId, FloorBox.BuildingFloor, map, FloorBox:k2_GetActorLocation().Z)
  if self.LevelId2Map[levelId] then
    self.LevelId2Map[levelId]:SetRenderOpacity(0.3)
  end
end

function WBP_BattleMap_C:OnTargetActorLookUp(GuideName)
  local guideData = self.GuideData:FindRef(GuideName)
  if guideData.GuideTarget.UnitType == "Phantom" then
    self:InitPhantomConfigData(GuideName, guideData, guideData.GuideTarget.UnitId)
  end
end

function WBP_BattleMap_C:InitPhantomConfigData(GuideName, GuideData, UnitId)
  local phantom = self.GuidePoint:FindRef(GuideName)
  local TexturePath
  if 0 == GuideData.PlayerIndex then
    phantom.Icon.PhantomEid = GuideData.GuideTargetEid
    phantom.Icon.PhantomActor = GuideData.GuideTarget
    local MiniIconPath = "/Game/UI/Texture/Dynamic/Image/Head/Mini/"
    if not DataMgr.BattleChar[UnitId] and GuideData.PlayerIndex == nil then
      return
    end
    if DataMgr.BattleChar[UnitId] == nil or nil == DataMgr.BattleChar[UnitId].GuideIconImg then
      return
    end
    local PhantomGuideIconImg = DataMgr.BattleChar[UnitId].GuideIconImg
    local NormalIconName = "T_Normal_" .. PhantomGuideIconImg
    TexturePath = MiniIconPath .. NormalIconName .. "." .. NormalIconName
  elseif GuideData.PlayerIndex > 0 then
    phantom.Icon.PhantomEid = GuideData.GuideTargetEid
    phantom.Icon.PhantomActor = GuideData.GuideTarget
    phantom.Icon.PlayerIndex = GuideData.PlayerIndex
    TexturePath = UGameplayStatics.GetGameInstance(self):GetSceneManager():GetPlayerGuideIcon(phantom.Icon.PlayerIndex, true)
  end
  phantom:InitPhantom()
  if TexturePath then
    self:LoadTextureAsync(TexturePath, phantom, "SetBrushResourceObject", self:GetAssetNameFromPath(TexturePath))
  end
end

function WBP_BattleMap_C:InitHostageImage(GuideName)
  local phantom = self.GuidePoint:FindRef(GuideName)
  local Path = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rescue_HostageA.T_Gp_Rescue_HostageA"
  self:LoadTextureAsync(Path, phantom, "SetBrushResourceObject", "Rescue_HostageA")
end

function WBP_BattleMap_C:ShowHardBoss(bShow)
  if self.WildMap then
    self.WildMap:ShowHardBoss(bShow)
  end
end

function WBP_BattleMap_C:SetPhantomGuideStateByEvent(Eid, State, PrevState)
  DebugPrint("WBP_BattleMap_C:SetPhantomGuideStateByEvent", State, Eid)
  local GuideData = self.GuideData:FindRef(tostring(Eid))
  if not GuideData or GuideData.GuideTargetEid ~= Eid then
    DebugPrint("WBP_BattleMap_C:SetPhantomGuideStateByEvent Not Find Data", GuideData)
    return
  end
  local IsAlive = false
  if State == ETeamRecoveryState.IsWaitingRecover or State == ETeamRecoveryState.RealDead then
    IsAlive = false
  elseif State == ETeamRecoveryState.Alive then
    IsAlive = true
  else
    return
  end
  local SceneManager = GWorld.GameInstance:GetSceneManager()
  if not SceneManager then
    DebugPrint("WBP_BattleMap_C:SetPhantomGuideStateByEvent SceneManager Is Nil")
    return
  end
  local Path = SceneManager:GetPlayerGuideIcon(GuideData.PlayerIndex, IsAlive)
  DebugPrint("WBP_BattleMap_C:SetPhantomGuideStateByEvent Path = ", Path)
  self:LoadTextureAsync(Path, self.GuidePoint:FindRef(tostring(Eid)), "SetBrushResourceObject", self:GetAssetNameFromPath(Path))
end

function WBP_BattleMap_C:InOrOutEdgeState(bIn)
  if not self.VX_EdgeWarnings then
    return
  end
  self.bEdgeState = bIn
  if bIn then
    if not self:IsAnimationPlaying(self.EdgeWarnings_In) then
      self:StopAnimation(self.EdgeWarnings_Out)
      self:PlayAnimation(self.EdgeWarnings_In)
    end
  else
    if not self:IsAnimationPlaying(self.EdgeWarnings_Out) then
      self:StopAnimation(self.EdgeWarnings_In)
      self:PlayAnimation(self.EdgeWarnings_Out)
    end
    self:RemoveTimer("BattleMapCheckEdgeTimer")
    self:AddTimer(0.2, function()
      if self.bEdgeState == false and self.VX_EdgeWarnings:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
        self:StopAnimation(self.EdgeWarnings_In)
        self:StopAnimation(self.EdgeWarnings_Out)
        self.VX_EdgeWarnings:SetVisibility(ESlateVisibility.Collapsed)
      end
    end, false, nil, "BattleMapCheckEdgeTimer")
  end
end

function WBP_BattleMap_C:OnTextureLoadFinish(Object)
  if not Object then
    return
  end
  local AssetName = Object:GetName()
  if not self.TextureLoadingMap[AssetName] then
    DebugPrint("WBP_BattleMap_C:OnTextureLoadFinish Can not Find Widget", AssetName)
    return
  end
  local InfoNum = #self.TextureLoadingMap[AssetName]
  local Info = self.TextureLoadingMap[AssetName][InfoNum]
  local Widget, FuncName = Info[1], Info[2]
  table.remove(self.TextureLoadingMap[AssetName], InfoNum)
  if IsEmptyTable(self.TextureLoadingMap[AssetName]) then
    self.TextureLoadingMap[AssetName] = nil
  end
  if not IsValid(Widget) then
    DebugPrint("WBP_BattleMap_C:OnTextureLoadFinish Widget Not Valid", Widget, AssetName)
    return
  end
  if "SetImageWithTextureOrSprite" == FuncName and Widget.Icon then
    self:SetImageWithTextureOrSprite(Widget.Icon, Object)
  elseif "SetBrushResourceObject" == FuncName and Widget.Icon then
    if Widget.Icon.Img_Avatar then
      Widget.Icon.Img_Avatar:SetBrushResourceObject(Object)
    else
      Widget.Icon:SetBrushResourceObject(Object)
    end
  else
    DebugPrint("Invalid FunaName = ", FuncName, AssetName)
  end
end

function WBP_BattleMap_C:LoadTextureAsync(Path, Widget, FuncName, AssetName)
  DebugPrint("WBP_BattleMap_C:LoadTextureAsync ", Path, Widget, FuncName, AssetName)
  if not (Path and Widget) or not FuncName then
    return
  end
  self.TextureLoadingMap = self.TextureLoadingMap or {}
  self.TextureLoadingMap[AssetName] = self.TextureLoadingMap[AssetName] or {}
  table.insert(self.TextureLoadingMap[AssetName], {Widget, FuncName})
  UE.UResourceLibrary.LoadObjectAsync(self, Path, {
    self,
    WBP_BattleMap_C.OnTextureLoadFinish
  })
end

function WBP_BattleMap_C:GetAssetNameFromPath(Path)
  local Index = string.find(Path, "%.")
  if Index then
    return string.sub(Path, Index + 1)
  end
  DebugPrint("WBP_BattleMap_C:GetAssetNameFromPath Path Wrong", Path)
  return nil
end

function WBP_BattleMap_C:InitMinimapDoor()
  local Array = GWorld.GameInstance:GetSceneManager().MinimapDoorArray
  if not Array or self.IsInRegionMap then
    return
  end
  for _, Door in pairs(Array) do
    self:AddDoorToMinimap(Door)
  end
end

function WBP_BattleMap_C:AddDoorToMinimap(Door)
  if self.IsInRegionMap then
    return
  end
  local DoorLocation = Door:K2_GetActorLocation()
  local UiLocation = self:TransformWorldLocToUILoc(DoorLocation.X, DoorLocation.Y, false)
  local Path = ""
  if -1 == Door.OtherLevelId then
    Path = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_GP_SealedDoor.T_GP_SealedDoor"
  elseif Door.door_state then
    Path = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_GP_Door.T_GP_Door"
  else
    return
  end
  if self.bNewMaterial then
    local Obj = NewObject(UBattleMapLevelObj.StaticClass(), self)
    Obj.ImagePath = Path
    Obj.LevelCenter = FVector2D(DoorLocation.X, DoorLocation.Y)
    Obj:SetRenderOpacity(1)
    Obj.TargetOpacity = 1
    Obj.FloorZ = DoorLocation.Z
    local LevelConnect = self.DoorMap:Find(Door.LevelId)
    LevelConnect = LevelConnect or FBattleMapLevelConnect()
    LevelConnect.ConnectedLevelID2Door:Add(Door.OtherLevelId, Obj)
    self.DoorMap:Add(Door.LevelId, LevelConnect)
    if Door.OtherLevelId ~= "-1" and "" ~= Door.OtherLevelId then
      local LevelConnect1 = self.DoorMap:Find(Door.OtherLevelId)
      LevelConnect1 = LevelConnect1 or FBattleMapLevelConnect()
      LevelConnect1.ConnectedLevelID2Door:Add(Door.LevelId, Obj)
      self.DoorMap:Add(Door.OtherLevelId, LevelConnect1)
    end
    return
  end
  local Texture = LoadObject(Path)
  local Map = self:NewEnemy()
  local DMI = Map.Icon:GetDynamicMaterial()
  DMI:SetTextureParameterValue("EnemyTexture", Texture)
  local Size = FVector2D(Texture:Blueprint_GetSizeX(), Texture:Blueprint_GetSizeY())
  local ScaleFactor = 0.5
  local ScaledSize = FVector2D(Size.X * ScaleFactor, Size.Y * ScaleFactor)
  Map.Icon:SetBrushSize(ScaledSize)
  local MapLoc = UiLocation * self.MapPanelStandScale / self.PointPanelScale
  DMI:SetVectorParameterValue("Center", FLinearColor(MapLoc.X, MapLoc.Y, Size.X, Size.Y))
  DMI:SetScalarParameterValue("Display", 0)
  Map:SetRenderTranslation(MapLoc)
  Map:SetVisibility(ESlateVisibility.Collapsed)
  self.DoorIcons[Door] = Map
end

function WBP_BattleMap_C:AppearDoor(Map)
  if self.IsInRegionMap then
    return
  end
  local LevelId
  for Id, SavedMap in pairs(self.LevelId2Map) do
    if Map == SavedMap.Map then
      LevelId = Id
      break
    end
  end
  if LevelId then
    local LevelId2Doors = self.levelLoader.LevelId2Doors[LevelId]
    if LevelId2Doors then
      for _, Door in ipairs(LevelId2Doors) do
        if self.DoorIcons[Door] then
          self.DoorIcons[Door]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        end
      end
    end
  end
end

function WBP_BattleMap_C:UpdateDoorIcon(AutoDoor)
  if self.IsInRegionMap then
    return
  end
  if self.bNewMaterial then
    local Obj = self.LevelId2MapObj:FindRef(AutoDoor:GetName())
    if Obj then
      Obj:UpdateIcon("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_GP_Door.T_GP_Door")
    else
      Obj = NewObject(UBattleMapLevelObj.StaticClass(), self)
      Obj.ImagePath = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_GP_LockedDoor.T_GP_LockedDoor"
      local DoorLocation = AutoDoor:K2_GetActorLocation()
      Obj.LevelCenter = FVector2D(DoorLocation.X, DoorLocation.Y)
      Obj:SetRenderOpacity(1)
      Obj.TargetOpacity = 1
      if AutoDoor.CurrentLevelId then
        for _, LevelIdStr in pairs(AutoDoor.CurrentLevelId) do
          local LevelConnect = self.DoorMap:Find(LevelIdStr)
          LevelConnect = LevelConnect or FBattleMapLevelConnect()
          LevelConnect.ConnectedLevelID2Door:Add("-1", Obj)
          self.DoorMap:Add(LevelIdStr, LevelConnect)
        end
      end
    end
  elseif self.DoorIcons[AutoDoor] then
    local Path = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_GP_Door.T_GP_Door"
    local Texture = LoadObject(Path)
    local DMI = self.DoorIcons[AutoDoor].Icon:GetDynamicMaterial()
    DMI:SetTextureParameterValue("EnemyTexture", Texture)
  else
    local DoorLocation = AutoDoor:K2_GetActorLocation()
    local UiLocation = self:TransformWorldLocToUILoc(DoorLocation.X, DoorLocation.Y, false)
    local Path = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_GP_LockedDoor.T_GP_LockedDoor"
    local Texture = LoadObject(Path)
    local Map = self:NewEnemy()
    local DMI = Map.Icon:GetDynamicMaterial()
    DMI:SetTextureParameterValue("EnemyTexture", Texture)
    local Size = FVector2D(Texture:Blueprint_GetSizeX(), Texture:Blueprint_GetSizeY())
    local ScaleFactor = 0.5
    local ScaledSize = FVector2D(Size.X * ScaleFactor, Size.Y * ScaleFactor)
    Map.Icon:SetBrushSize(ScaledSize)
    local MapLoc = UiLocation * self.MapPanelStandScale / self.PointPanelScale
    DMI:SetVectorParameterValue("Center", FLinearColor(MapLoc.X, MapLoc.Y, Size.X, Size.Y))
    DMI:SetScalarParameterValue("Display", 0)
    Map:SetRenderTranslation(MapLoc)
    self.DoorIcons[AutoDoor] = Map
  end
  if AutoDoor.CurrentLevelId then
    for _, LevelIdStr in pairs(AutoDoor.CurrentLevelId) do
      if self.levelLoader.LevelId2Doors[LevelIdStr] then
        table.insert(self.levelLoader.LevelId2Doors[LevelIdStr], AutoDoor)
      else
        self.levelLoader.LevelId2Doors[LevelIdStr] = {AutoDoor}
      end
    end
  end
end

function WBP_BattleMap_C:ForceUpdatePlayerCurrentLevelId()
  self.Player:UpdateCurrentLevelId()
  self.bForceUpdatePlayerCurrentLevelId = true
end

AssembleComponents(WBP_BattleMap_C)
return WBP_BattleMap_C
