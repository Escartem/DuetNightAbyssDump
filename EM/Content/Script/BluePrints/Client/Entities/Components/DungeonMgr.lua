local MiscUtils = require("Utils.MiscUtils")
local Component = {}

function Component:EnterWorld()
end

function Component:GMEnterDsVersion(DungeonId, DSVersion)
  self:EnterDungeon(DungeonId, 2, nil, nil, nil, {DSVersion = DSVersion})
end

function Component:CommonPreEnterDungeon()
  GWorld:CloseWorldRegionState()
end

function Component:EnterDungeon(DungeonId, DungeonNetMode, OtherCallback, TicketId, SquadId, CustomParams)
  self:CommonPreEnterDungeon()
  if not DungeonId then
    return
  end
  local DungeonInfo = DataMgr.Dungeon[DungeonId]
  if not DungeonInfo then
    return
  end
  
  local function callback(Ret, ...)
    self.logger.debug(string.format("EnterDungeon callback, Ret is %s, DungeonId is %s, DungeonNetMode is %s", Ret, DungeonId, DungeonNetMode))
    if OtherCallback then
      OtherCallback(Ret, ...)
    end
  end
  
  local DungeonType = DungeonInfo.DungeonType
  print(_G.LogTag, "EnterDungeon with DungeonType", DungeonType, DungeonId, TicketId)
  DungeonNetMode = DungeonNetMode or CommonConst.DungeonNetMode.Standalone
  CustomParams = CustomParams or {}
  CustomParams.DSVersion = CustomParams.DSVersion or MiscUtils.GetGameCofingSettings("DSVersion") or 0
  TicketId = TicketId or -1
  SquadId = SquadId or 0
  self:CallServer("ClientEnterDungeon", callback, DungeonId, DungeonNetMode, SquadId, TicketId, CustomParams)
end

function Component:EnterDungeonAgain(OtherCallback, TicketId, SquadId, CustomParams)
  DebugPrint("gmy@DungeonMgr Component:EnterDungeonAgain", OtherCallback, TicketId, SquadId, CustomParams)
  self:CommonPreEnterDungeon()
  
  local function callback(Ret, ...)
    self.logger.debug(string.format("EnterDungeonAgain callback, Ret is %s", Ret))
    if OtherCallback then
      OtherCallback(Ret, ...)
    end
  end
  
  CustomParams = CustomParams or {}
  CustomParams.DSVersion = CustomParams.DSVersion or Const.DSVersion
  TicketId = TicketId or -1
  SquadId = SquadId or 0
  self:CallServer("ClientEnterDungeonAgain", callback, SquadId, TicketId, CustomParams)
end

function Component:CancelEnterDungeon(DungeonNetMode)
  if self:IsInTeam() then
    self:CallServer("TeamCancelEnterDungeon")
  else
    local function callback(Ret)
      self.logger.debug("CancelEnterDungeon callback, ", Ret)
      
      ErrorCode:Check(Ret)
    end
    
    self:CallServer("CancelEnterDungeon", callback, DungeonNetMode)
  end
end

function Component:OnCancelEnterDungeon()
  print(_G.LogTag, "OnCancelEnterDungeon")
end

function Component:EnterCharTrial(Callback, DungeonId, CharTrialId)
  self:EnterDungeon(DungeonId, nil, Callback, nil, nil, {Id = CharTrialId})
end

function Component:EnterCharTrialByEvent(Callback, DungeonId, EventId)
  self:EnterEventDungeon(Callback, DungeonId, nil, EventId)
end

function Component:EnterEventDungeon(Callback, DungeonId, SquadId, EventId, CustomParams)
  self:CommonPreEnterDungeon()
  if not DungeonId then
    return
  end
  assert(DataMgr.Dungeon[DungeonId])
  assert(EventId)
  SquadId = SquadId or 0
  CustomParams = CustomParams or {}
  
  local function cb(Ret, ...)
    print(_G.LogTag, "EnterEventDungeon callback, ret ", Ret)
    if Callback then
      Callback(Ret, ...)
    end
  end
  
  self:CallServer("EnterEventDungeon", cb, DungeonId, SquadId, EventId, CustomParams)
end

function Component:OnDungeonFinish(DungeonId, IsWin, Rewards, DungeonRewards, PlayerTime, GameTime, bInterrupt)
  self.logger.info(string.format("OnDungeonFinish, DungeonId is %d, IsWin is %s, PlayerTime is %s, GameTime is %s", DungeonId, IsWin, PlayerTime, GameTime))
  self.CacheDSInfo = nil
  self:ResetCachedDungeonRewards()
  local UIManger = GWorld.GameInstance:GetGameUIManager()
  if not UIManger then
    return
  end
  if not self:IsInDungeon2() and not self:IsInHardBoss() then
    print(_G.LogTag, "LogicServer_OnDungeonFinish Not InDungeon or InHardBoss")
    return
  end
  
  local function RealOnDungeonFinish()
    print(_G.LogTag, "LogicServer_OnDungeonFinish RealOnDungeonFinish", DungeonId, IsWin, Rewards, DungeonRewards, PlayerTime, GameTime, bInterrupt)
    if self.ReconnectTag then
      EventManager:RemoveEvent(EventID.CloseLoading, self)
    end
    GWorld.GameInstance:PushLogicServerCallbackInfo(IsWin, DungeonId, Rewards, DungeonRewards, PlayerTime, GameTime)
  end
  
  if GWorld.GameInstance:GetLoadingUI() then
    print(_G.LogTag, "LogicServer_OnDungeonFinish GetLoadingUI")
    self.ReconnectTag = true
    EventManager:AddEvent(EventID.CloseLoading, self, RealOnDungeonFinish)
    return
  end
  print(_G.LogTag, "LogicServer_OnDungeonFinish OnDungeonFinish")
  RealOnDungeonFinish()
end

function Component:NotifyUnCostItems(Items)
  self.logger.info("NotifyUnCostItems")
  PrintTable(Items, 3)
  DebugPrint("thy    NotifyUnCostItems In")
  GWorld.GameInstance.UnCostItemsInfo = Items
  local DungeonSettlementView = UIManager(self):GetUI("DungeonSettlement")
  if DungeonSettlementView then
    DungeonSettlementView:InitRefundInfo(GWorld.GameInstance.UnCostItemsInfo)
  end
end

function Component:UpdateDungeonProgress()
  print(_G.LogTag, "Avatar UpdateDungeonProgress")
  self:CallServerMethod("UpdateDungeonProgress")
end

function Component:ContinueDungeonSettlement(BattleInfo, Callback, TicketId, SquadId)
  if self:IsInDungeon() then
    self:EnterDungeon(BattleInfo, nil, Callback, TicketId, SquadId)
  elseif self:IsInHardBoss() then
    self:EnterHardBoss(BattleInfo.HardBossId, BattleInfo.DifficultyId, Callback)
  end
end

function Component:ExitDungeonSettlement()
  if self:IsInDungeon() then
    self:ExitDungeon()
  elseif self:IsInHardBoss() then
    self:ExitHardBoss()
  end
end

function Component:ExitDungeon()
  if GWorld:IsListenServer() then
    self:UnregisterLS()
  end
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  PlayerController = PlayerController:Cast(UE4.ASinglePlayerController)
  if PlayerController then
    local Player = PlayerController:GetMyPawn()
    if Player then
      Player:SetCanInteractiveTrigger(true)
    end
  end
  if (GWorld:IsStandAlone() or GWorld:IsClient()) and PlayerController then
    local PreloadSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(PlayerController, UE4.URolePreloadGameInstanceSubsystem)
    if PreloadSystem then
      PreloadSystem:ReleaseAllCacheBeforeChangeScene(UE.TArray(0))
      PreloadSystem:ReleaseAllCacheObj()
    end
  end
  self:RecoverRegion_ExitDungeon()
end

function Component:CheckMoveToTempScene(CurrentDungeonId, IsWin)
  local GameState = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(GWorld.GameInstance)
  local LevelLoader = GameState:GetCurrentLevelLoader()
  if LevelLoader then
    local PlayerController = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
    local PlayerCharacter = PlayerController:GetMyPawn()
    local PlayerCharacterLocation = PlayerCharacter:K2_GetActorLocation()
    local PlayerCharacterRotation = PlayerCharacter:K2_GetActorRotation()
    local LevelId = LevelLoader:GetLevelId(PlayerCharacter)
    local MapFile, Position, Rotation = LevelLoader:K2_GetArtPathByLevelId(LevelId)
    local DungeonInfo = DataMgr.Dungeon[CurrentDungeonId]
    if DungeonInfo and DungeonInfo.ExitLevel then
      MapFile = DungeonInfo.ExitLevel
      local EndLocation = FVector(DungeonInfo.ExitPlayerLocation[1], DungeonInfo.ExitPlayerLocation[2], DungeonInfo.ExitPlayerLocation[3])
      local EndRotaion = FRotator(DungeonInfo.ExitPlayerRotation[2], DungeonInfo.ExitPlayerRotation[3], DungeonInfo.ExitPlayerRotation[1])
      local SpawnTransform = FTransform(EndRotaion:ToQuat(), EndLocation)
      GWorld.GameInstance:SetExitLevelEndPointInfo(SpawnTransform)
      local EndPointSeqEnable, EndPointLocation, EndPointRotation = PlayerCharacter:GetEndPointInfo()
      if EndPointSeqEnable then
        EndPointLocation = PlayerCharacterLocation
        EndPointRotation = PlayerCharacterRotation
        GWorld.GameInstance:CachePlayerCharacterInfo(EndPointSeqEnable, EndPointLocation, EndPointRotation)
      end
    else
      local LevelTransform = UE4.UKismetMathLibrary.MakeTransform(Position, Rotation, UE4.UKismetMathLibrary.Vector_One())
      PlayerCharacterLocation = UE4.UKismetMathLibrary.InverseTransformLocation(LevelTransform, PlayerCharacterLocation)
      PlayerCharacterRotation = UE4.UKismetMathLibrary.InverseTransformRotation(LevelTransform, PlayerCharacterRotation)
      local ControllerRotation = UE4.UKismetMathLibrary.InverseTransformRotation(LevelTransform, PlayerController:GetControlRotation())
      GWorld.GameInstance:SetFixedStartPoint(PlayerCharacterLocation, PlayerCharacterRotation, ControllerRotation, PlayerCharacter:IsDead())
      local EndPointSeqEnable, EndPointLocation, EndPointRotation = PlayerCharacter:GetEndPointInfo()
      if EndPointSeqEnable then
        EndPointLocation = UE4.UKismetMathLibrary.InverseTransformLocation(LevelTransform, EndPointLocation)
        EndPointRotation = UE4.UKismetMathLibrary.InverseTransformRotation(LevelTransform, EndPointRotation)
        GWorld.GameInstance:CachePlayerCharacterInfo(EndPointSeqEnable, EndPointLocation, EndPointRotation)
      end
    end
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
      local tempPath = string.gsub(MapFile, "/Maps/", "/Maps_Phone/")
      if UResourceLibrary.CheckResourceExistOnDisk(tempPath) then
        MapFile = tempPath
      end
    end
    if MapFile then
      self:NotifyServerStatusModify(CommonConst.AvatarStatus.EnterSingleDungeon)
      UE4.UGameplayStatics.OpenLevel(GWorld.GameInstance, MapFile, true, "EMCUSTOM=TempScene")
    else
      print(_G.ErrorTag, "MapFile is null.")
      return false
    end
  else
    print(_G.WarningTag, "LevelLoader is null.")
    return false
  end
  return true
end

function Component:TryEnterNextProgress(Callback)
  self:CallServer("TryEnterNextProgress", Callback)
end

function Component:SaveProgressData(DataTable)
  print(_G.LogTag, "SaveProgressData")
  local Character = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  DataTable.AvatarInitData = Character:GetBattleExtraInfo()
  local SerializedString = SerializeUtils:Serialize(DataTable)
  self:CallServerMethod("SaveProgressData", SerializedString)
end

function Component:RecoverSingleDungeon(AvatarBattleInfo, DataString, PlayerSlice, DungeonId, bEnter, CurrentRewards)
  print(_G.LogTag, "RecoverSingleDungeon", DungeonId, bEnter)
  local SerializedTable
  if "" ~= DataString then
    SerializedTable = SerializeUtils:UnSerialize(DataString)
    self.AvatarInitData = SerializedTable.AvatarInitData
  end
  local GameInstance = GWorld.GameInstance
  GameInstance:SetProgressData(SerializedTable, PlayerSlice)
  self.AvatarBattleInfo = AvatarBattleInfo
  if not bEnter then
    return
  end
  if CurrentRewards then
    self:CacheDungeonRewards(CurrentRewards)
  end
  WorldTravelSubsystem():ChangeDungeonByDungeonId(DungeonId, CommonConst.DungeonNetMode.Standalone)
end

function Component:ConsumeAvatarInitData()
  local result = self.AvatarInitData
  self.AvatarInitData = nil
  return result
end

function Component:SetDungeonDoubleCost(bDoubleCost)
  self:CallServerMethod("SetDungeonDoubleCost", bDoubleCost)
end

function Component:SelectTicket(Callback, DungeonId, TicketId)
  DebugPrint("SelectTicket", DungeonId, TicketId)
  assert(DungeonId)
  assert(TicketId)
  
  local function cb(ret)
    DebugPrint("SelectTicket callback", ret)
    if Callback then
      Callback(ret)
    end
  end
  
  self:CallServer("SelectTicketForRunningDungeon", cb, DungeonId, TicketId)
end

function Component:GMDungeonEventTest(DungeonId, Count)
  local function Cb(ret1, ret2)
    DebugPrint("[GMDungeonEventTest] Detail:", CommonUtils.TableToString(ret2))
    
    DebugPrint("[GMDungeonEventTest] Count Result:", CommonUtils.TableToString(ret1))
  end
  
  self:CallServer("GMDungeonEventTest", Cb, DungeonId, Count)
end

function Component:GMSetMustHappenDungenEvent(EventId)
  self:CallServerMethod("GMSetMustHappenDungenEvent", EventId)
end

function Component:GMCleanMustHappenDungenEvent()
  self:CallServerMethod("GMCleanMustHappenDungenEvent")
end

function Component:GMHappenDungenEvent(EventId, DungeonId)
  self:CallServerMethod("GMHappenDungenEvent", EventId, DungeonId)
end

function Component:GMMiniGameTest(PetId, ResourceId, xValue)
  local function Cb(ret1)
    DebugPrint("[GMMiniGameTest]", ret1)
  end
  
  self:CallServer("GMMiniGameTest", Cb, PetId, ResourceId, xValue)
end

return Component
