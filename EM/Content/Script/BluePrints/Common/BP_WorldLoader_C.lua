local JsonDecode = require("rapidjson")
local M = Class({
  "BluePrints/Common/EMLevelLoader",
  "BluePrints.Common.TimerMgr"
})
local GMFunctionLibrary = require("BluePrints.UI.GMInterface.GMFunctionLibrary")

function M:Initialize(Initializer)
  self.Super.Initialize(self, Initializer)
  self.ID2ArtStreamingLevel = {}
  self.DesignId2ArtId = {}
  self.ID2LayoutStreamingLevel = {}
  self.ID2NavMeshStreamingLevel = {}
  self.ID2SoundStreamingLevel = {}
  self.ArtLevelUnLoadEvent = {}
  self.ArtLevelLoadEvent = {}
  self.homeLevel2ID = {}
  self.LevelID2RegionID = {}
  self.RegionID2LevelID = {}
  self.id2NeedLoad = {}
  self.GetLevels = false
  self.enterLevelID = nil
  self.enterLoc = nil
  self.enterRot = nil
  self.levelName2Id = {}
  self.EnterRegionType = ""
  self.loadProgress = 0
end

function M:ReceiveBeginPlay()
  self.IsWorldLoader = true
  self:BeginPlay()
  self.EnvironmentManager.bFixLightDirection = false
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self:HandleEnterRegionType(Avatar, Avatar.EnterRegionType)
    DebugPrint("ZJT_ Print PlayerCharacter Recover Info ", Avatar:InitRecoverCheck(), Avatar.StartIndex, Avatar.CurrentRegionId, self.enterLevelID, Avatar:GetLastRegionId())
    PrintTable({
      Location = Avatar.LastRegionData:GetLocation()
    }, 2)
  else
    self:LevelLoaderReady()
    self:DestroySelf()
    return
  end
  self.shortname = WorldTravelSubsystem(self).LevelLoadJsonName
  local ShortString = string.find(self.shortname, "Houdini_data/")
  self.WorldCompositionSubSystem = UWorldCompositionSubSystem and USubsystemBlueprintLibrary.GetWorldSubsystem(self, UWorldCompositionSubSystem:StaticClass())
  if self.shortname and ShortString then
    self.shortname = string.sub(self.shortname, string.find(self.shortname, "Houdini_data/") + 13)
    local levelTable = DataMgr.GetLevelLoaderJsonData(self.shortname)
    self.points = levelTable.points
    print(_G.LogTag, "222222222222222222222222", self.shortname)
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  self:InitLevelID()
  self.LevelPathfinding.LevelLoaderComplete = true
end

function M:ReceiveTick(DeltaSeconds)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    self.GetLevels = true
    return
  end
  if self.GetLevels then
    return
  end
  local temp = self.StreamLevels:ToTable()
  if 0 == #temp then
    self:GetStreamingLevels()
    return
  end
  self:InitWorldLoad(temp)
end

function M:InitLevelID()
  if self.points then
    for i = 1, #self.points do
      local json = self.points[i]
      local levelName = string.sub(json.struct, #json.struct - string.reverse(json.struct):find("/") + 2)
      self.LevelIDInt2String:Add(json.id, levelName)
      self.LevelIDString2Int:Add(levelName, json.id)
    end
  end
  self:InitLevelInfo()
end

function M:InitLevelInfo(StreamLevels)
  if self.LevelInfoInited then
    return
  end
  self.LevelInfoInited = true
  self:GetStreamingLevels()
  StreamLevels = self.StreamLevels:ToTable()
  local isPIE = UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(self)
  for _, streamLevel in pairs(StreamLevels) do
    local packageName = streamLevel.PackageNameToLoad
    if "None" == packageName then
      packageName = streamLevel:GetWorldAssetPackageFName()
    end
    local temp, _ = UNameStringFunctionLibrary.LongPathNameToName(packageName)
    local bIsGameplayLevel = URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(self) and UKismetStringLibrary.EndsWith(packageName, "_Gameplay", ESearchCase.CaseSensitive)
    local bIsHomeLevel = UKismetStringLibrary.StartsWith(packageName, "/Game/Maps/Levels", ESearchCase.CaseSensitive) and not URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(self)
    if UKismetStringLibrary.EndsWith(temp, "_Art", ESearchCase.CaseSensitive) then
      local LevelID = string.gsub(temp, "_Art", "")
      self.levelName2Id[LevelID] = LevelID
      self.ID2ArtStreamingLevel[LevelID] = streamLevel
      self.artStreamingLevel2ID[streamLevel] = LevelID
      self.id2NeedLoad = {}
      streamLevel.OnLevelLoaded:Add(self, self.OnArtLevelLoaded)
    elseif UKismetStringLibrary.EndsWith(temp, "_Layout", ESearchCase.CaseSensitive) and isPIE then
      self.ID2LayoutStreamingLevel[string.gsub(temp, "_Layout", "")] = streamLevel
    elseif UKismetStringLibrary.EndsWith(temp, "_Sound", ESearchCase.CaseSensitive) then
      self.ID2SoundStreamingLevel[string.gsub(temp, "_Sound", "")] = streamLevel
    elseif UKismetStringLibrary.EndsWith(temp, "_Design", ESearchCase.CaseSensitive) then
      self.ID2DesignStreamingLevel[string.gsub(temp, "_Design", "")] = streamLevel
    elseif UKismetStringLibrary.EndsWith(temp, "_NavMesh", ESearchCase.CaseSensitive) then
      local levelName = string.gsub(temp, "_NavMesh", "")
      self.ID2NavMeshStreamingLevel[levelName] = streamLevel
      local json = self:GetLevelJsonByLevelName(levelName)
      if not URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(self) then
        self.LevelName2Center:Add(packageName, FVector2D(json.level_center[1], json.level_center[3]))
        self.StreamLevel2ID:Add(streamLevel, json.id)
        self.LevelID2Yaw:Add(json.id, json.rot)
        self.id2LevelNameAndTransform[json.id] = {
          string.gsub(json.struct, "/Game/Maps/Datas/Data_Design/", ""),
          FVector(json.P[1], json.P[3], json.P[2]),
          json.rot
        }
      end
      coroutine.resume(coroutine.create(self.LoadNavMesh), self, temp)
    elseif bIsGameplayLevel or bIsHomeLevel then
      self:InithomeLevel2IDInfo(streamLevel, temp, "_Gameplay")
    end
  end
  if CommonUtils.IsEmpty(self.homeLevel2ID) then
    for LevelName, StreamingLevel in pairs(self.ID2DesignStreamingLevel) do
      self:InithomeLevel2IDInfo(StreamingLevel, LevelName, "")
    end
  end
  for ArtLevelID, _ in pairs(self.ID2ArtStreamingLevel) do
    for DesignLevelID, _ in pairs(self.ID2DesignStreamingLevel) do
      if string.find(ArtLevelID, DesignLevelID) then
        self.DesignId2ArtId[DesignLevelID] = ArtLevelID
      end
    end
  end
  self.startPoint = self:GetStartPointByManager(self.enterLevelID, self.StartIndex)
  for regionID, subRegion in pairs(DataMgr.SubRegion) do
    if self.ID2DesignStreamingLevel[subRegion.SubRegionLevel] then
      self.LevelID2RegionID[subRegion.SubRegionLevel] = regionID
      self.RegionID2LevelID[regionID] = subRegion.SubRegionLevel
    end
  end
end

function M:InithomeLevel2IDInfo(streamLevel, temp, SubStr)
  self.homeLevel2ID[streamLevel:GetLoadedLevel()] = string.gsub(temp, SubStr, "")
  if not self.enterLevelID then
    self.enterLevelID = temp
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if nil ~= GameMode then
    GameMode:AddSubGameModeInfo(string.gsub(temp, SubStr, ""), streamLevel:GetLoadedLevel())
  end
end

function M:InitWorldLoad(StreamLevels)
  self:InitLevelInfo(StreamLevels)
  if self.TempLevelDoor then
    for _, door in pairs(self.TempLevelDoor) do
      self:RealSetLevelDoor(door)
    end
  end
  self:GetAllLevelVolume()
  for Index = 1, self.volumeArray:Length() do
    local volume = self.volumeArray:GetRef(Index)
    local level = UE4.URuntimeCommonFunctionLibrary.GetLevel(volume)
    volume.loadName = self.homeLevel2ID[level]
    volume.WorldLoader = self
  end
  self.GetLevels = true
  self:SetActorTickEnabled(false)
  if not URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(self) and self.TempGridframe and #self.TempGridframe > 0 then
    for _, gridframe in pairs(self.TempGridframe) do
      self.Super.AddGridFrame(self, gridframe)
    end
  end
  if self.enterLevelID then
    self:SetPlayerTrans()
    self:LoadArtLevel(self.enterLevelID)
    if not URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(self) then
      for id, _ in pairs(self.ID2ArtStreamingLevel) do
        if id ~= self.enterLevelID then
          self:LoadArtLevel(id)
        end
      end
    end
  end
  self:SetForceGCAfterLevelStreamedOut(false)
end

function M:AddGridFrame(GridFrame)
  if URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(self) then
    self:InitLevelInfo()
    self.Super.AddGridFrame(self, GridFrame)
    return
  end
  if self.GetLevels then
    return
  end
  if not self.TempGridframe then
    self.TempGridframe = {}
  end
  self.TempGridframe[#self.TempGridframe + 1] = GridFrame
end

function M:GetLevelJsonByLevelName(LevelName)
  if not self.points then
    return
  end
  for i = 1, #self.points do
    if string.find(self.points[i].struct, LevelName) then
      return self.points[i]
    end
  end
end

function M:GetLevelId(Actor)
  if self.WorldCompositionSubSystem then
    return self.WorldCompositionSubSystem:GetObjectLevelId(Actor)
  end
  return self.Super.GetLevelId(self, Actor)
end

function M:GetLevelIdByRegionId(RegionId)
  return self.RegionID2LevelID[RegionId]
end

function M:LoadArtLevel(LevelName)
  if URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(self) then
    self:InitLevelInfo()
    DebugPrint("WorldComposition, LoadArtLevel", LevelName)
    LevelName = string.gsub(LevelName, "_Gameplay", "")
    if self.id2NeedLoad[LevelName] then
      return
    end
    self.id2NeedLoad[LevelName] = true
    self:AddTimer(0.7, self.CheckWorldCompositionLevelLoaded, true, 0, "CheckWorldCompositionLevelLoaded", nil, LevelName)
    return
  end
  coroutine.resume(coroutine.create(self.Load), self, LevelName)
end

function M:CheckWorldCompositionLevelLoaded(id)
  self:SetLoadProgress(self.WorldCompositionSubSystem:GetLoadedLevelPercent() * 100)
  if not self.WorldCompositionSubSystem then
    return
  end
  if not self.WorldCompositionSubSystem:IsWorldCompositionIdle(self) then
    return
  end
  for id, _ in pairs(self.id2NeedLoad) do
    self:OnArtLevelLoadedCallback(id)
    self.id2NeedLoad[id] = nil
    self:OnLevelLoaderReady()
  end
  for _, _ in pairs(self.id2NeedLoad) do
    return
  end
  self:RemoveTimer("CheckWorldCompositionLevelLoaded")
end

function M:LoadNavMesh(LevelName)
  UGameplayStatics.LoadStreamLevel(self, LevelName, true, true)
end

function M:Load(LevelName)
  if UAsyncFunctionLibrary.CheckStreamLevelBeLoadState(self, LevelName .. "_Art", true) then
    print(_G.LogTag, "CheckStreamLevelBeLoadState Failed:" .. LevelName)
    return
  end
  self.id2NeedLoad[LevelName] = true
  if self.ID2ArtStreamingLevel[LevelName] then
    UGameplayStatics.LoadStreamLevel(self, LevelName .. "_Art", true, true)
  end
  if self.ID2LayoutStreamingLevel[LevelName] then
    UGameplayStatics.LoadStreamLevel(self, LevelName .. "_Layout", true, true)
  end
  if self.ID2SoundStreamingLevel[LevelName] then
    UGameplayStatics.LoadStreamLevel(self, LevelName .. "_Sound", true, true)
  end
end

function M:UnloadArtLevel(LevelName)
  if URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(self) then
    self:BeforeLevelUnloadedCallback(LevelName)
    self:OnArtLevelUnloadedCallback(LevelName)
    return
  end
  local artLevelName = LevelName
  if self.ID2ArtStreamingLevel[artLevelName]:GetLoadedLevel() == nil then
    return
  end
  if not self:GetLevelLoaded(artLevelName) then
    return
  end
  self.ArtLevelLoaded:Add(artLevelName, false)
  self:BeforeLevelUnloadedCallback(LevelName)
  coroutine.resume(coroutine.create(self.Unload), self, LevelName)
  self:OnArtLevelUnloadedCallback(LevelName)
end

function M:Unload(LevelName)
  if self.ID2ArtStreamingLevel[LevelName] then
    UGameplayStatics.UnloadStreamLevel(self, LevelName .. "_Art", true)
  end
  if self.ID2LayoutStreamingLevel[LevelName] then
    UGameplayStatics.UnloadStreamLevel(self, LevelName .. "_Layout", true)
  end
  if self.ID2SoundStreamingLevel[LevelName] then
    UGameplayStatics.UnloadStreamLevel(self, LevelName .. "_Sound", true)
  end
end

function M:OnArtLevelLoaded()
  if URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(self) then
    return
  end
  for id, streamLevel in pairs(self.ID2ArtStreamingLevel) do
    if streamLevel:GetLoadedLevel() ~= nil and not self:GetLevelLoaded(id) and self.id2NeedLoad[id] then
      self.ArtLevelLoaded:Add(id, true)
      self.id2NeedLoad[id] = nil
      coroutine.resume(coroutine.create(self.WorldLoaderCheckArtLevelLoaded), self, streamLevel:GetLoadedLevel(), id)
      break
    end
  end
end

function M:WorldLoaderCheckArtLevelLoaded(level, id)
  while true do
    if not UE4.UKismetSystemLibrary.IsValid(level) then
      return
    end
    if UE.UAsyncFunctionLibrary.CheckLevelActorsInitialized(level) then
      break
    end
    UE.UKismetSystemLibrary.Delay(self, 0.1)
  end
  self:OnArtLevelLoadedCallback(id)
  self:OnLevelLoaderReady()
end

function M:OnLevelLoaderReady()
  if not self.levelLoadComplete then
    self.levelLoadComplete = true
    self:LevelLoaderReady()
    self:ReleaseInitialBuildingLock()
  end
end

function M:SetPlayerTrans()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if self:HandleQuestChainInitLocation(Avatar, self.EnterRegionType) then
    GWorld.logger.error("ZJT_ \230\156\172\230\172\161\228\189\141\231\189\174\230\129\162\229\164\141 \232\162\171\228\187\187\229\138\161\230\142\165\231\174\161 \231\148\177\228\187\187\229\138\161\232\174\190\231\189\174\231\142\169\229\174\182\230\137\128\229\156\168\228\189\141\231\189\174 ")
  end
  DebugPrint("ZJT_ Set Current PlayerLocation ", Avatar.CurrentRegionId, self.enterLoc, self.StartIndex)
  if self.enterLoc and self.enterLoc ~= FVector(0, 0, 0) then
    self:InitSetPlayerTrans()
  else
    if not self.startPoint then
      self.startPoint = self:GetStartPointByManager(self.enterLevelID, self.StartIndex)
    end
    if not self.startPoint then
      self:AddTimer(0.5, self.SetPlayerTrans)
      return
    end
    self.startPoint:SetPlayerTrans()
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    local MovementComponent = Player:GetMovementComponent()
    MovementComponent.bIsAsyncTraveling = false
  end
end

function M:InitSetPlayerTrans()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  if self.WorldCompositionSubSystem then
    local Transform = FTransform()
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    local NewTranslation = self.enterLoc
    Transform.Translation = NewTranslation
    self.WorldCompositionSubSystem:RequestAsyncTravel(Player, Transform, {
      self,
      self.OpenPlayerPositionSync
    }, true, true)
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    Player:K2_SetActorRotation(self.enterRot, false)
    local Controller = UE4.UGameplayStatics.GetPlayerController(self, 0)
    Controller:SetControlRotation(self.enterRot)
    return
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local NewTranslation = self.enterLoc + FVector(0, 0, Player.CapsuleComponent:GetUnscaledCapsuleHalfHeight())
  Player:K2_SetActorLocation(NewTranslation, false, nil, true)
  Player:K2_SetActorRotation(self.enterRot, false)
  local Controller = UE4.UGameplayStatics.GetPlayerController(self, 0)
  Controller:SetControlRotation(self.enterRot)
  self:OpenPlayerPositionSync()
end

function M:GetRegionIdByLocation(location)
  local id = self:GetLevelIdByLocation(location)
  if self.LevelID2RegionID[id] then
    return self.LevelID2RegionID[id]
  end
  return -1
end

function M:GetStartPointByManager(LevelID, StartIndex)
  DebugPrint("GetStartPointByManager", LevelID, StartIndex)
  if not LevelID then
    return nil
  end
  local RealLevelId = self:GetRegionIdByLevelId(LevelID)
  if -1 == RealLevelId then
    return
  end
  RealLevelId = self:GetLevelIdByRegionId(RealLevelId)
  local targetLevel
  for level, id in pairs(self.homeLevel2ID) do
    if id == RealLevelId then
      targetLevel = level
    end
  end
  if self.StartPointManagers == nil or 0 == #self.StartPointManagers then
    self.StartPointManagers = UGameplayStatics.GetAllActorsOfClass(self, LoadClass("/Game/BluePrints/Common/Level/BP_StartPointManager.BP_StartPointManager_C")):ToTable()
  end
  for _, manager in pairs(self.StartPointManagers) do
    if URuntimeCommonFunctionLibrary.GetLevel(manager) == targetLevel then
      if not StartIndex or StartIndex > manager.StartPoints:Length() then
        StartIndex = 1
      end
      local Res = manager.StartPoints:GetRef(StartIndex)
      return Res
    end
  end
  return nil
end

function M:BeforeLevelUnloadedCallback(LevelName)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if IsValid(GameMode) and not IsValid(GameMode:GetWCSubSystem()) then
    GameMode:SetSnapShot(LevelName)
  end
  if not self.ArtLevelUnLoadEvent[LevelName] then
    return
  end
  for _, func in pairs(self.ArtLevelUnLoadEvent[LevelName]) do
    func(self, LevelName)
  end
end

function M:AfterLevelLoadeCallback(LevelName)
  if not self.ArtLevelLoadEvent[LevelName] then
    return
  end
  for _, func in pairs(self.ArtLevelLoadEvent[LevelName]) do
    func(self, LevelName)
  end
end

function M:OpenPlayerPositionSync()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if Avatar:CheckCurrentSubRegion() and Avatar:CheckSubRegionType(nil, CommonConst.SubRegionType.Field) and not Avatar.IsOpenPlayerPositionSync then
    Avatar:PlayerEnterBigWorld()
  end
  if not self.levelLoadComplete then
    return
  end
  Avatar:ExeRegionSkipCallbck(Avatar.CurrentRegionId, "Enter")
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if Player and GameMode and not GameMode:GetDungeonComponent() then
    Player:CreatePhantomOnLevelTransition()
  end
end

function M:OpenRegionDataRecover()
end

function M:GetRegionIdByLevelId(LevelName)
  if self.LevelID2RegionID[LevelName] then
    return self.LevelID2RegionID[LevelName]
  end
  return -1
end

function M:OnArtLevelLoadRecoverRegionData(TargetLevelId)
end

function M:OnArtLevelUnLoadSaveRegionData(TargetLevelId)
end

function M:ArtLevelBindEvent(IsRecover)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not IsValid(GameMode) then
    return
  end
  for LevelName, SubRegionId in pairs(self.LevelID2RegionID) do
    local LevelName, LevelGameMode = GameMode:GetLevelGamemModeAndLevelName(SubRegionId)
    if LevelGameMode.IsActive then
      self:OnArtLevelLoadRecoverRegionData(LevelName)
    end
    if not IsRecover then
      if not self.ArtLevelLoadEvent[LevelName] then
        self.ArtLevelLoadEvent[LevelName] = {}
      end
      table.insert(self.ArtLevelLoadEvent[LevelName], self.OnArtLevelLoadRecoverRegionData)
      if not self.ArtLevelUnLoadEvent[LevelName] then
        self.ArtLevelUnLoadEvent[LevelName] = {}
      end
      table.insert(self.ArtLevelUnLoadEvent[LevelName], self.OnArtLevelUnLoadSaveRegionData)
    end
  end
end

function M:OpenInitSuit()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local Avatar = GWorld:GetAvatar()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if PlayerCharacter.InitSuccess and PlayerCharacter:IsMainPlayer() and Avatar and (Avatar:IsRealInBigWorld() or Avatar:IsInEnterBigWorld()) then
    GameMode:InitRegionSuit(Avatar, Avatar:GetSubRegionId2RegionId())
  else
    EventManager:AddEvent(EventID.OnCharacterInitSuitRecover, PlayerCharacter, PlayerCharacter.OnCharacterInitSuitRecover)
  end
end

function M:RecoverArtLevelBreakable()
end

function M:ReAddSubGameModeInfo()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if nil == GameMode then
    return
  end
  for Level, LevelName in pairs(self.homeLevel2ID) do
    GameMode:AddSubGameModeInfo(LevelName, Level)
    if self:GetLevelLoaded(LevelName) then
      GameMode:TriggerActiveSubGameModeInfo(LevelName)
    end
  end
end

function M:HandleEnterRegionType(Avatar, EnterRegionType)
  DebugPrint("ZJT_ HandleEnterRegionType ", EnterRegionType)
  if not CommonConst.EnterRegionType[EnterRegionType] then
    return
  end
  self.EnterRegionType = EnterRegionType
  local EnterRegionTypeFunc = "Handle" .. CommonConst.EnterRegionType[EnterRegionType]
  self[EnterRegionTypeFunc](self, Avatar, EnterRegionType)
end

function M:HandleGM(Avatar, EnterRegionType)
  self.enterLevelID = DataMgr.SubRegion[Avatar.CurrentRegionId].SubRegionLevel
  self.StartIndex = Avatar.StartIndex
end

function M:HandleQuestChainInitLocation(Avatar, EnterRegionType)
  if EnterRegionType ~= CommonConst.EnterRegionType.Recover then
    return false
  end
  local QuestChain = Avatar.QuestChains[Avatar.TrackingQuestChainId]
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  DebugPrint("ZJT_ HandleQuestChainInitLocation ", Avatar.TrackingQuestChainId)
  if QuestChain and QuestChain:IsDoing() then
    local STLExportInfo = DataMgr.STLExportQuestChain[QuestChain.QuestChainId]
    DebugPrint("ZJT_ HandleQuestChainInitLocation ", STLExportInfo, QuestChain.DoingQuestId)
    if STLExportInfo and STLExportInfo.Quests[QuestChain.DoingQuestId] then
      local QuestExportInfo = STLExportInfo.Quests[QuestChain.DoingQuestId]
      DebugPrint("ZJT_ HandleQuestChainInitLocation 1111111 ", QuestExportInfo.SubRegionId, QuestExportInfo.SubRegionId == Avatar:GetCurrentRegionId())
      if QuestExportInfo.SubRegionId and DataMgr.SubRegion[QuestExportInfo.SubRegionId] and QuestExportInfo.SubRegionId == Avatar:GetCurrentRegionId() and QuestChain.LoginPlayerTransform then
        local NewTargetPointName = QuestChain.LoginPlayerTransform[QuestChain.DoingQuestId]
        if NewTargetPointName then
          local NewTargetPoint = GameMode.EMGameState:GetTargetPoint(NewTargetPointName)
          if NewTargetPoint and NewTargetPoint:IsValid() then
            self.enterLoc = NewTargetPoint:K2_GetActorLocation()
            self.enterRot = NewTargetPoint:K2_GetActorRotation()
            return true
          end
        end
      end
    end
  end
  return false
end

function M:HandleRecover(Avatar, EnterRegionType)
  if Avatar:InitRecoverCheck() then
    self.enterLevelID = DataMgr.SubRegion[Avatar:GetLastRegionId()].SubRegionLevel
    local loc = Avatar.LastRegionData:GetLocation()
    local rot = Avatar.LastRegionData:GetRotation()
    self.enterLoc = FVector(loc.X, loc.Y, loc.Z)
    self.enterRot = FRotator(0, rot.Yaw, 0)
    DebugPrint("ZJT_ HandleRecover \230\136\144\229\138\159 ", self.enterLoc, Avatar.LastRegionData.RegionId)
  else
    self.enterLevelID = DataMgr.SubRegion[Avatar.CurrentRegionId].SubRegionLevel
    self.StartIndex = Avatar.StartIndex or 1
    DebugPrint("ZJT_ HandleRecover \229\164\177\232\180\165 ", self.StartIndex, self.enterLevelID, Avatar:InitRecoverCheck())
  end
end

function M:HandleSojourns(Avatar, EnterRegionType)
  self.enterLevelID = DataMgr.SubRegion[Avatar.CurrentRegionId].SubRegionLevel
  self.StartIndex = Avatar.StartIndex
end

function M:HandleSelectMap(Avatar, EnterRegionType)
  self.enterLevelID = DataMgr.SubRegion[Avatar.CurrentRegionId].SubRegionLevel
  self.StartIndex = Avatar.StartIndex
end

function M:HandleDeliver(Avatar, EnterRegionType)
  self.enterLevelID = DataMgr.SubRegion[Avatar.CurrentRegionId].SubRegionLevel
  self.StartIndex = Avatar.StartIndex
end

function M:HandleFirstRegion(Avatar, EnterRegionType)
  self.enterLevelID = DataMgr.SubRegion[Avatar.CurrentRegionId].SubRegionLevel
  self.StartIndex = Avatar.StartIndex
end

function M:SetLevelDoor(door)
  if not self.TempLevelDoor then
    self.TempLevelDoor = {}
  end
  table.insert(self.TempLevelDoor, door)
end

function M:RealSetLevelDoor(door)
  if URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(self) then
    return
  end
  local level = UE4.URuntimeCommonFunctionLibrary.GetLevel(door)
  for id, streamLevel in pairs(self.ID2DesignStreamingLevel) do
    if streamLevel and streamLevel:GetLoadedLevel() == level then
      local datas = self:GetLevelJsonByLevelName(id).door
      if nil ~= datas then
        for j = 1, #datas do
          if datas[j].door_name == door.DisplayName then
            door.if_door = 1 == datas[j].if_door
            door.door_state = 1 == datas[j].door_state
            door.LevelPathfinding = self.LevelPathfinding
            door.LevelId = id
            door.OtherLevelId = self.LevelIDInt2String:Find(datas[j].next_id)
            self.LevelPathfinding.Name2BpArrowPos:Add(door.LevelId .. datas[j].door_name, door)
            if datas[j].next_id and -1 ~= datas[j].next_id then
              self.LevelPathfinding:AddLevelDoor(id, self.LevelIDInt2String:Find(datas[j].next_id), door.DisplayName)
            end
            return
          end
        end
      end
    end
  end
end

function M:SetLoadProgress(Num)
  if not Num or Num <= 0 or Num >= 100 then
    return
  end
  self.loadProgress = Num
  if self.LoadingUI then
    DebugPrint("SetLoadProgress CloseLoading", self.loadProgress * 0.5)
    self.LoadingUI:AddQuene(self.loadProgress * 0.5)
  else
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    self.LoadingUI = GameInstance:GetLoadingUI()
  end
end

return M
