local M = Class({
  "BluePrints/Common/EMLevelLoader",
  "BluePrints.Common.TimerMgr"
})

function M:ReceiveBeginPlay()
  self.Overridden.ReceiveBeginPlay(self)
  self:BeginPlay()
  self.LoadingComplete = false
  self.RoomData = DataMgr.RougeLikeRoom
  self.SeasonId = 0
  self.CurrentRoomId = nil
  self.LastRoomId = nil
  self.NextRoomId = TArray(0)
  self.StepId = 0
  self.RoomId2StreamLevel = {}
  self.StreamLevelNavMeshCheck = {}
  self.ID2DesignStreamingLevel = {}
  self.LoadingFlag = false
  self.NextRoomReady = false
  self.LevelSpacing = 100000
  self.IsMobile = CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile"
  if not IsDedicatedServer(self) then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    self.LoadingUI = GameInstance:ShowLoadingUI(UIConst.COMMONCHANGESCENE)
  end
  self.RenderTexture = UKismetRenderingLibrary.CreateRenderTarget2D(self)
  local size = UWidgetLayoutLibrary.GetViewportSize(self)
  URuntimeCommonFunctionLibrary.RenderTarget2DResize(self.RenderTexture, size.X, size.Y)
  self.RenderTexture.RenderTargetFormat = ETextureRenderTargetFormat.RTF_RGBA8_SRGB
  self.RenderTexture.LODGroup = 28
  DebugPrint("RenderTarget2DResize", self.RenderTexture.SizeX, self.RenderTexture.SizeY)
  local player = UGameplayStatics.GetPlayerCharacter(self, 0)
  self.SceneCaptureComponent = NewObject(USceneCaptureComponent2D, player)
  self.SceneCaptureComponent:K2_AttachToComponent(player.CharCameraComponent)
  self.SceneCaptureComponent:K2_SetRelativeTransform(FTransform(), false, nil, false)
  URuntimeCommonFunctionLibrary.RegisterComponent(self.SceneCaptureComponent)
  self.SceneCaptureComponent.FOVAngle = player.CharCameraComponent.FieldOfView
  self.SceneCaptureComponent.TextureTarget = self.RenderTexture
  self.SceneCaptureComponent.CaptureSource = ESceneCaptureSource.SCS_FinalColorHDR
  self.SceneCaptureComponent:SetComponentTickEnabled(false)
  self.SceneCaptureComponent.bCaptureEveryFrame = false
  self.SceneCaptureComponent.bCaptureOnMovement = false
  EventManager:AddEvent(EventID.OnRougeLikeEnterRoom, self, self.OnRougeLikeEnterRoom)
  GWorld.RougelikeLevelLoader = self
end

function M:TestTimer()
  local random = math.random(1, 3)
  local table = {
    102,
    301,
    302
  }
  self:EnterRoom(table[random], table)
end

function M:ReceiveEndPlay(reason)
  EventManager:RemoveEvent(EventID.OnRougeLikeEnterRoom, self)
  if self.SceneCaptureComponent then
    self.SceneCaptureComponent:K2_DestroyComponent(self.SceneCaptureComponent)
    self.SceneCaptureComponent = nil
  end
  UKismetRenderingLibrary.ReleaseRenderTarget2D(self.RenderTexture)
  self.RenderTexture = nil
end

function M:InitSettings()
  DebugPrint("LevelLoaderInitSettings RougeLike")
  local WorldContext = GWorld.GameInstance
  URuntimeCommonFunctionLibrary.SetConsoleVariableIntValue("r.Mobile.EnableReadSurface", 0, true)
end

function M:EnterRoom(RoomId, NextRoomId)
  self.LastRoomId = self.CurrentRoomId
  self.CurrentRoomId = RoomId
  self:AddBuildingLock()
  if not self.LoadingComplete then
    self:LoadStreamLevelByRoomId(self.CurrentRoomId, 0)
  else
    local IsBossRoom = 5 == DataMgr.RougeLikeRoom[self.CurrentRoomId].RoomType
    if IsBossRoom then
      UIManager(self):LoadUINew("RougeTransitionBoss", self.SceneCaptureComponent, self.RenderTexture, IsBossRoom)
    else
      UIManager(self):LoadUINew("RougeTransition", self.SceneCaptureComponent, self.RenderTexture, IsBossRoom)
    end
    coroutine.resume(coroutine.create(self.LoadNavMeshLevel), self, RoomId)
    self:AddTimer(0.1, function()
      self:SetPlayerTrans()
      self.StepId = self.StepId + 1
      coroutine.resume(coroutine.create(self.LoadNextLevel), self, NextRoomId)
    end)
    return
  end
  self.StepId = self.StepId + 1
  coroutine.resume(coroutine.create(self.LoadNextLevel), self, NextRoomId)
end

function M:LoadNavMeshLevel(RoomId)
  UKismetSystemLibrary.Delay(self, 1.5)
  UGameplayStatics.LoadStreamLevel(self, self.StepId - 1 .. "-" .. RoomId .. "_NavMesh", false, false)
end

function M:LoadNextLevel(NextRoomId)
  self.NextRoomReady = false
  while not self.LoadingComplete do
    UKismetSystemLibrary.Delay(self, 0.1)
  end
  local RougeLikeManager = GWorld.RougeLikeManager
  if self.LastRoomId then
    RougeLikeManager:OnUnLoadLastLevel(self.LastRoomId, self.CurrentRoomId)
    coroutine.resume(coroutine.create(self.UnloadStreamLevelByRoomId), self, self.LastRoomId, self.StepId - 2)
    self.LastRoomId = nil
    UKismetSystemLibrary.Delay(self, 0.5)
  end
  if self.NextRoomId:Length() > 0 then
    for i = 1, self.NextRoomId:Length() do
      local roomId = self.NextRoomId[i]
      if roomId ~= self.CurrentRoomId then
        RougeLikeManager:OnUnLoadOtherLevel(roomId)
        coroutine.resume(coroutine.create(self.UnloadStreamLevelByRoomId), self, roomId, self.StepId - 1)
        UKismetSystemLibrary.Delay(self, 0.5)
      end
    end
  end
  if NextRoomId then
    for index = 1, NextRoomId:Length() do
      local roomId = NextRoomId[index]
      self:LoadStreamLevelByRoomId(roomId, index)
      while self.LoadingFlag do
        UKismetSystemLibrary.Delay(self, 0.1)
      end
    end
  end
  self.NextRoomId:Clear()
  self.NextRoomId:Append(NextRoomId)
  self.NextRoomReady = true
  self:ReleaseInitialBuildingLock()
  self:PrintRougeLikeLevelLoader("ReleaseBuildingLock")
end

function M:OnArtLevelLoaded(RoomId)
  if self.LoadingComplete then
    self:DisableLevelRVTVolume(self.RoomId2StreamLevel[RoomId][3])
  end
  coroutine.resume(coroutine.create(self.CheckLevelLoaded), self, RoomId)
end

function M:CheckLevelLoaded(RoomId)
  self:PrintRougeLikeLevelLoader("CheckLevelLoaded:" .. RoomId)
  if not self.LoadingComplete then
    self.LoadingUI:AddQuene(45.0)
  end
  while true do
    local levelCheck = true
    for i = 1, #self.RoomId2StreamLevel[RoomId] do
      local streamLevel = self.RoomId2StreamLevel[RoomId][i]
      if streamLevel and 2 ~= i and i <= 3 then
        if not streamLevel:GetLoadedLevel() or not streamLevel:GetLoadedLevel().bIsVisible then
          levelCheck = false
          break
        else
        end
      else
        if i > 3 and #streamLevel > 0 and (not streamLevel[1]:GetLoadedLevel() or not streamLevel[1]:GetLoadedLevel().bIsVisible) then
          levelCheck = false
          break
        else
        end
      end
    end
    if levelCheck then
      self:PrintRougeLikeLevelLoader("check complete:" .. RoomId)
      break
    end
    UKismetSystemLibrary.Delay(self, 0.1)
  end
  if not self.LoadingComplete then
    self.LoadingUI:AddQuene(90.0)
    self:SetForceGCAfterLevelStreamedOut(false)
    self:LevelLoaderReady()
    self.LoadingComplete = true
  else
  end
  self.LoadingFlag = false
end

function M:OnPostAttachNavMeshDataChunk_Lua(InStreamLevel)
  self.StreamLevelNavMeshCheck[InStreamLevel] = true
end

function M:SetPlayerTrans()
  self:CreateBattleMap()
  if self.RoomId2StreamLevel[self.CurrentRoomId] and self.RoomId2StreamLevel[self.CurrentRoomId][3] then
    self:EnableLevelRVTVolume(self.RoomId2StreamLevel[self.CurrentRoomId][3])
  end
  local startPoints = FArray(AActor)
  startPoints = UGameplayStatics.GetAllActorsOfClass(self, LoadClass("/Game/BluePrints/Common/Level/BP_StartPoint.BP_StartPoint_C"))
  local currentId = tostring(self.CurrentRoomId)
  for _, startPoint in pairs(startPoints:ToTable()) do
    if currentId == self:GetDesignActorLevelName(startPoint) then
      startPoint:SetPlayerTrans()
      UGameplayStatics.GetGameMode(self):InitRougeLikeSubGameMode(self.RoomData[self.CurrentRoomId].GameModePath, currentId)
      return
    end
  end
end

function M:CreateBattleMap()
  local battleMain = UIManager(self):GetUI("BattleMain")
  if not battleMain then
    return
  end
  local MiniMap = battleMain.Battle_Map
  if MiniMap then
    local data = {}
    data[1] = string.gsub(self.RoomData[self.CurrentRoomId].ArtDataPath, "_Art", "")
    data[1] = string.gsub(data[1], "_Layout", "")
    data[1] = string.sub(data[1], string.find(data[1], "%.") + 1)
    local levelTransform = self.LevelID2GridFrame:FindRef(self.CurrentRoomId):GetTransform()
    data[2] = {
      X = levelTransform.Translation.X,
      Y = levelTransform.Translation.Y
    }
    data[3] = levelTransform.Rotation:ToRotator().Yaw
    data[4] = ""
    MiniMap.MapNeedDynamicMaterial = false
    MiniMap:CreateRougelikeBattleMap(self.CurrentRoomId, data)
  end
end

function M:UnloadStreamLevelByRoomId(RoomId, StepId)
  self.LevelID2GridFrame:Remove(tostring(RoomId))
  UAsyncFunctionLibrary.UnloadStreamLevelWithID(self, StepId .. "-" .. RoomId .. "_Art", RoomId, false)
  UAsyncFunctionLibrary.UnloadStreamLevelWithID(self, StepId .. "-" .. RoomId .. "_Design", RoomId * 1000, false)
  if self.RoomId2StreamLevel[RoomId][2] then
    UAsyncFunctionLibrary.UnloadStreamLevelWithID(self, StepId .. "-" .. RoomId .. "_NavMesh", RoomId * 1000 + 1, false)
  end
  if #self.RoomId2StreamLevel[RoomId][4] > 0 then
    UAsyncFunctionLibrary.UnloadStreamLevelWithID(self, StepId .. "-" .. RoomId .. "_Sound", RoomId * 1000 + 2, false)
  end
  if #self.RoomId2StreamLevel[RoomId][5] > 0 then
    UAsyncFunctionLibrary.UnloadStreamLevelWithID(self, StepId .. "-" .. RoomId .. "_Effect", RoomId * 1000 + 3, false)
  end
end

function M:LoadStreamLevelByRoomId(RoomId, Index)
  self.LoadingFlag = true
  local artPath = self.RoomData[RoomId].ArtDataPath
  local designPath = self.RoomData[RoomId].DesignDataPath
  local navPath = string.gsub(artPath, "_Art", "_NavMesh")
  navPath = string.gsub(navPath, "_Layout", "_NavMesh")
  local soundPath = string.gsub(artPath, "_Art", "_Sound")
  local effectPath = string.gsub(artPath, "_Art", "_Effect")
  if self.IsMobile then
    local tempPath = string.gsub(artPath, "/Maps/", "/Maps_Phone/")
    if UResourceLibrary.CheckResourceExistOnDisk(tempPath) then
      artPath = tempPath
    end
  end
  local success = false
  local streamLevel
  self.RoomId2StreamLevel[RoomId] = {}
  local location = self:GetRoomLocation(Index)
  success, streamLevel = ULevelStreamingDynamic.LoadLevelInstance(self, designPath, location, FRotator(), success, self.StepId .. "-" .. RoomId .. "_Design")
  table.insert(self.RoomId2StreamLevel[RoomId], streamLevel)
  self.ID2DesignStreamingLevel[tostring(RoomId)] = streamLevel
  if self.LoadingComplete then
    success, streamLevel = UAsyncFunctionLibrary.LoadLevelInstance(self, navPath, location, FRotator(), success, self.StepId .. "-" .. RoomId .. "_NavMesh")
  else
    success, streamLevel = ULevelStreamingDynamic.LoadLevelInstance(self, navPath, location, FRotator(), success, self.StepId .. "-" .. RoomId .. "_NavMesh")
  end
  table.insert(self.RoomId2StreamLevel[RoomId], streamLevel)
  self.LevelName2Center:Add(navPath, FVector2D(0, 0))
  self.StreamLevel2ID:Add(streamLevel, RoomId)
  self.LevelID2Yaw:Add(RoomId, 0)
  success, streamLevel = ULevelStreamingDynamic.LoadLevelInstance(self, artPath, location, FRotator(), success, self.StepId .. "-" .. RoomId .. "_Art")
  table.insert(self.RoomId2StreamLevel[RoomId], streamLevel)
  streamLevel.OnLevelLoaded:Add(self, function()
    self:OnArtLevelLoaded(RoomId)
  end)
  success, streamLevel = ULevelStreamingDynamic.LoadLevelInstance(self, soundPath, location, FRotator(), success, self.StepId .. "-" .. RoomId .. "_Sound")
  table.insert(self.RoomId2StreamLevel[RoomId], {streamLevel})
  success, streamLevel = ULevelStreamingDynamic.LoadLevelInstance(self, effectPath, location, FRotator(), success, self.StepId .. "-" .. RoomId .. "_Effect")
  table.insert(self.RoomId2StreamLevel[RoomId], {streamLevel})
end

function M:GetRoomLocation(Index)
  local row = self.StepId % 10
  return FVector(self.LevelSpacing * (row - 5), self.LevelSpacing * Index, 0)
end

function M:OnRougeLikeEnterRoom(RoomId, RandomRooms)
  self:PrintRougeLikeLevelLoader("Enter Room:" .. RoomId)
  for i = 1, RandomRooms:Length() do
    local id = RandomRooms[i]
    self:PrintRougeLikeLevelLoader("Next Room:" .. id)
  end
  self:EnterRoom(RoomId, RandomRooms)
end

function M:K2_GetArtPathByLevelId(LevelId)
  if not self.ID2DesignStreamingLevel[LevelId] then
    return
  end
  local transform = self.ID2DesignStreamingLevel[LevelId].LevelTransform
  return self.RoomData[tonumber(LevelId)].ArtDataPath, transform.Translation, transform.Rotation
end

function M:PrintRougeLikeLevelLoader(Str)
  print(_G.LogTag, "RougeLike_LevelLoader", Str)
end

function M:CheckIsRougeLike()
  return true
end

function M:GetLevelIdByLevel(InLevel)
  for RoomId, Table in pairs(self.RoomId2StreamLevel) do
    if Table[2] and Table[2]:GetLoadedLevel() and Table[2]:GetLoadedLevel() == InLevel then
      return RoomId
    end
  end
  return ""
end

return M
