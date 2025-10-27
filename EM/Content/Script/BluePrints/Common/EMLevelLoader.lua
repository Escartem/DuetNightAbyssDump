local EMLevelLoader = Class()
local EMCache = require("EMCache.EMCache")
local EMDungeonPreloadData = require("DungeonPreloadData")
local EMRegionPreloadData = require("RegionPreloadData")
local EMAbyssPreloadData = require("AbyssPreloadData")

function EMLevelLoader:Initialize(Initializer)
  self.artLevelLoadedCompleteCallback = {}
  self.volumeArray = nil
  self.startPoint = nil
  self.ID2DesignStreamingLevel = {}
  self.StartPoints = {}
  self.StartPointManagers = {}
  self.id2LevelNameAndTransform = {}
  self.id2LevelLocationAndRotation = {}
  self.artStreamingLevel2ID = {}
end

function EMLevelLoader:BeginPlay()
  self:InitEnvironment()
  self:InitSettings()
  self:InitGameScreenFilter()
  self:InitGameDLSS()
end

function EMLevelLoader:InitEnvironment()
  if not self.EnvironmentManager then
    local EnvironmentManager = UE4.UGameplayStatics.GetActorOfClass(self, UE4.AEnvironmentManager:StaticClass())
    if EnvironmentManager then
      self.EnvironmentManager = EnvironmentManager
    else
      self.EnvironmentManager = self:GetWorld():SpawnActor(LoadClass("/Game/Asset/Scene/common/EnvirSystem/EnvirCreat.EnvirCreat_C"), self:GetTransform())
    end
  end
end

function EMLevelLoader:InitSettings()
  DebugPrint("LevelLoaderInitSettings")
  local WorldContext = GWorld.GameInstance
  URuntimeCommonFunctionLibrary.SetConsoleVariableIntValue("r.Mobile.EnableReadSurface", 1, true)
end

function EMLevelLoader:InitGameScreenFilter()
  local OptionName = "ScreenFilter"
  local GameCache = EMCache:Get(OptionName)
  if GameCache then
    self.EnvironmentManager:SetPosLUT(GameCache)
  else
    local ScreenFilterList = {
      [1] = 1,
      [2] = 2,
      [3] = 0
    }
    local OptionInfo = DataMgr.Option[OptionName]
    local DefaultScreenFilter = 1
    if OptionInfo and OptionInfo.DefaultValue then
      DefaultScreenFilter = ScreenFilterList[tonumber(OptionInfo.DefaultValue)]
      if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" and OptionInfo.DefaultValueM ~= nil then
        DefaultScreenFilter = ScreenFilterList[tonumber(OptionInfo.DefaultValueM)]
      end
    end
    self.EnvironmentManager:SetPosLUT(DefaultScreenFilter)
    EMCache:Set(OptionName, DefaultScreenFilter)
  end
end

function EMLevelLoader:InitGameDLSS()
  DebugPrint("InitGameDLSS Initialize")
  if URuntimeCommonFunctionLibrary.IsDLSSSupported() then
    local OptionName = "DLSS"
    local GameDLSS = URuntimeCommonFunctionLibrary.GetDefaultDLSSQualityMode()
    if 0 == GameDLSS then
      GameDLSS = EMCache:Get(OptionName)
    end
    if nil == GameDLSS then
      GameDLSS = UDLSSMode.Quality
      EMCache:Set(OptionName, GameDLSS)
    end
    if 3 == GameDLSS then
      GameDLSS = 1
    end
    UDLSSLibrary.SetDLSSMode(GameDLSS)
  else
    local OptionName = "FSR"
    local GameFSR = EMCache:Get(OptionName)
    if nil == GameFSR then
      GameFSR = false
      EMCache:Set(OptionName, false)
    end
    URuntimeCommonFunctionLibrary.SetFSREnabled(GameFSR)
  end
end

function EMLevelLoader:OnArtLevelLoadedCallback(LevelId)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if nil == GameMode then
    EventManager:FireEvent(EventID.OnArtLevelLoaded, LevelId)
    return
  end
  if IsStandAlone(self) then
    EventManager:FireEvent(EventID.OnArtLevelLoaded, LevelId)
  end
  DebugPrint("EMLevelLoader Loaded Level:", LevelId)
  GameMode:TriggerActiveSubGameModeInfo(LevelId)
  GameMode:DungeonRecoverSnapShot(LevelId)
  if self.artLevelLoadedCompleteCallback[LevelId] then
    for _, func in pairs(self.artLevelLoadedCompleteCallback[LevelId]) do
      func()
    end
  end
  if self.AfterLevelLoadeCallback then
    self:AfterLevelLoadeCallback(LevelId)
  end
end

function EMLevelLoader:OnArtLevelUnloadedCallback(LevelId)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if nil == GameMode then
    return
  end
  GameMode:TriggerDeActiveSubGameModeInfo(LevelId)
end

function EMLevelLoader:BeforeLevelUnloadedCallback(LevelName)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if nil ~= GameMode then
    DebugPrint("EMLevelLoader Unloaded Level:", LevelName)
    GameMode:SetSnapShot(LevelName)
    GameMode:UpdateMonsterSpawnInfo()
  end
end

function EMLevelLoader:GetAllLevelVolume()
  self.volumeArray = UGameplayStatics.GetAllActorsOfClass(self, LoadClass("/Game/BluePrints/Common/Level/BP_LevelVolume.BP_LevelVolume_C"))
  PrintTable(self.volumeArray)
end

function EMLevelLoader:GetAllLevelBounds()
  self.LevelBoundsArray = UGameplayStatics.GetAllActorsOfClass(self, ALevelBounds.StaticClass())
end

function EMLevelLoader:GetRandStartPoint()
  if #self.StartPoints > 0 then
    self.startPoint = self.StartPoints[1]
    return
  end
  local temp = UGameplayStatics.GetAllActorsOfClass(self, LoadClass("/Game/BluePrints/Common/Level/BP_StartPoint.BP_StartPoint_C"))
  if temp:Length() > 0 then
    self.startPoint = temp:GetRef(1)
  end
end

function EMLevelLoader:LevelLoaderReady()
  local GameState = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(self)
  GameState.LevelLoaderReady = true
  GameState:TryEndLoading("LevelLoaderReady")
  AudioManager(self):PlayDungeonBGM()
  self:TriggerLevelInitMonsterPool(Const.DungeonPreloadMonster)
  self:TriggerLevelInitIndicatorPool(true)
  self:InitGameStatePickupUnitPool()
  self:InitGameStateBloodbarSubWidgetPool()
  self:InitGameStatePickupIconComponentPool()
  if IsAuthority(self) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if GameMode.RandomActorManager and not GameMode:IsInRegion() then
      GameMode.RandomActorManager:RegisterAllData()
    end
    GameMode:RegisterBPArrow()
    GameMode:TryTriggerOnPrepare("LevelActorInit")
  end
end

function EMLevelLoader:TriggerLevelInitIndicatorPool(IsOpen)
  if IsOpen then
    self:InitGameStateIndicatorPool()
  end
end

function EMLevelLoader:InitGameStateIndicatorPool()
  local DungeonId = GWorld.GameInstance:GetCurrentDungeonId()
  local DungeonData = DataMgr.Dungeon[DungeonId]
  if nil == DungeonData then
    return
  end
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if not UIManager then
    return
  end
  local GameState = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(self)
  
  local function AddMonsterIndicatorToPool(Index)
    local Annihilate_S = "/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Annihilate.WBP_GuidePoint_Annihilate"
    local PoolClass = UIManager:LoadUI(Annihilate_S, "PoolClass_Monster_" .. Index, UIConst.ZORDER_FOR_INDICATORS)
    PoolClass.GuideType = "Monster"
    PoolClass.IsFromPool = true
    PoolClass.IsActiveInPoor = false
    GameState:AddIndicatorToPool("Monster", PoolClass)
  end
  
  for i = 0, 7 do
    AddMonsterIndicatorToPool(i)
  end
end

function EMLevelLoader:InitGameStatePickupUnitPool()
  local Avatar = GWorld:GetAvatar()
  if self.IsWorldLoader and Avatar and Avatar:GetIsInHome() then
    return
  end
  local CommonUnitBPPath
  if IsClient(self) then
    CommonUnitBPPath = {
      {
        "/Game/AssetDesign/Item/Pickups/AutoPick/ResourceNew.ResourceNew",
        20
      },
      {
        "/Game/AssetDesign/Item/Pickups/AutoPick/AmmoNew.AmmoNew",
        10
      },
      {
        "/Game/AssetDesign/Item/Pickups/AutoPick/ModNew.ModNew",
        10
      },
      {
        "/Game/AssetDesign/Item/Pickups/AutoPick/HpBall.HpBall",
        10
      },
      {
        "/Game/AssetDesign/Item/Pickups/AutoPick/MpBall.MpBall",
        10
      }
    }
  elseif IsDedicatedServer(self) then
    CommonUnitBPPath = {}
  else
    CommonUnitBPPath = {
      {
        "/Game/AssetDesign/Item/Pickups/AutoPick/ResourceNew.ResourceNew",
        20
      },
      {
        "/Game/AssetDesign/Item/Pickups/AutoPick/AmmoNew.AmmoNew",
        10
      },
      {
        "/Game/AssetDesign/Item/Pickups/AutoPick/ModNew.ModNew",
        10
      },
      {
        "/Game/AssetDesign/Item/Pickups/AutoPick/HpBall.HpBall",
        10
      },
      {
        "/Game/AssetDesign/Item/Pickups/AutoPick/MpBall.MpBall",
        10
      }
    }
  end
  local GameModeUnitBPPath = {}
  local GameMode = UGameplayStatics.GetGameMode(self)
  if GameMode and GameMode.GetPickupUnitPreloadTable then
    GameModeUnitBPPath = GameMode:GetPickupUnitPreloadTable() or {}
  end
  for _, BPPath in pairs(CommonUnitBPPath) do
    self:AddPickupUnitToPool(BPPath)
  end
  for _, BPPath in pairs(GameModeUnitBPPath) do
    self:AddPickupUnitToPool(BPPath)
  end
end

function EMLevelLoader:AddPickupUnitToPool(BPPath)
  local GameState = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(self)
  
  local function LoadClassFinished(self, UnitBlueprint)
    local Rotation = FRotator(0, 0, 0)
    local Transform = UE4.FTransform(Rotation:ToQuat(), FVector(100000, 100000, 100000))
    local Unit = self:GetWorld():SpawnActor(UnitBlueprint, Transform, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
    if Unit.GuideIconComponent then
      Unit.GuideIconComponent:SetHiddenInGame(true)
    end
    Unit:ResetForCache()
    Unit:TryInitActorInfo("OnInit")
    GameState:DoPickUpUnitToCache(BPPath[1], Unit)
  end
  
  for i = 1, BPPath[2] + 1 do
    UResourceLibrary.LoadClassAsync(self, BPPath[1], {self, LoadClassFinished})
  end
end

function EMLevelLoader:GetSkeletalMeshAccessoryBPPath()
  return Const.CharResourcePaths.AccessoryBP
end

function EMLevelLoader:GetStaticMeshAccessoryBPPath()
  return Const.CharResourcePaths.StaticAccessoryBP
end

function EMLevelLoader:InitGameStateBloodbarSubWidgetPool()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if not UIManager then
    return
  end
  local GameState = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(self)
  if not GameState then
    return
  end
  local PlatformName = CommonUtils.GetDeviceTypeByPlatformName(self)
  local WidgetNum = 30
  if "PC" == PlatformName then
    WidgetNum = 50
  end
  local WidgetNeedCache = {
    {"HPBar", WidgetNum},
    {"ShieldBar", WidgetNum},
    {"BuffBar", WidgetNum},
    {"EliteBar", WidgetNum},
    {"BuffIcon", WidgetNum}
  }
  for _, Element in pairs(WidgetNeedCache) do
    local WidgetName = Element[1]
    local Num = Element[2]
    for i = 1, Num do
      local SubWidget = UIManager:_CreateWidgetNew(WidgetName)
      GameState:DoBloodbarSubWidgetCache(WidgetName, SubWidget)
    end
  end
end

function EMLevelLoader:AddStartPoint(StartPoint)
  self.StartPoints[#self.StartPoints + 1] = StartPoint
end

function EMLevelLoader:AddStartPointManager(StartPointManager)
  self.StartPointManagers[#self.StartPointManagers + 1] = StartPointManager
end

function EMLevelLoader:SetPlayerTrans()
end

function EMLevelLoader:SetNewEnteredPlayerTrans(AvatarEidStr)
end

function EMLevelLoader:RealSetNewEnteredPlayerTrans(AvatarEidStr)
end

function EMLevelLoader:BindArtLevelLoadedCompleteCallback(LevelId, FunctionCallBack)
  print(_G.LogTag, "ZJT_ BindArtLevelLoadedCompleteCallback ", LevelId, self.artLevelLoadedCompleteCallback[LevelId])
  if self.artLevelLoadedCompleteCallback[LevelId] then
    self.artLevelLoadedCompleteCallback[LevelId][#self.artLevelLoadedCompleteCallback[LevelId] + 1] = FunctionCallBack
  else
    self.artLevelLoadedCompleteCallback[LevelId] = {}
    self.artLevelLoadedCompleteCallback[LevelId][#self.artLevelLoadedCompleteCallback[LevelId] + 1] = FunctionCallBack
  end
end

function EMLevelLoader:RemoveArtLevelLoadedCompleteCallback(LevelId)
  if self.artLevelLoadedCompleteCallback[LevelId] then
    self.artLevelLoadedCompleteCallback[LevelId] = nil
  end
end

function EMLevelLoader:CheckActorInGridframeByLevelId(LevelId, Actor)
  if not Actor then
    return false
  end
  return self:CheckLocationInGridframeByLevelId(LevelId, Actor:K2_GetActorLocation())
end

function EMLevelLoader:GetActorInLevelTransform(InActor)
  print("EnvirSystemActor GetActorInLevelTransform")
  if not self.artStreamingLevel2ID then
    return FTransform()
  end
  local level = UE4.URuntimeCommonFunctionLibrary.GetLevel(InActor)
  for streamLevel, _ in pairs(self.artStreamingLevel2ID) do
    if streamLevel:GetLoadedLevel() == level then
      return streamLevel.LevelTransform
    end
  end
  return FTransform()
end

function EMLevelLoader:GetDesignActorLevelName(Actor)
  local level = UE4.URuntimeCommonFunctionLibrary.GetLevel(Actor)
  for id, streamLevel in pairs(self.ID2DesignStreamingLevel) do
    if streamLevel:GetLoadedLevel() == level then
      return id
    end
  end
  return nil
end

function EMLevelLoader:GetLevelTransformByLevelName(LevelName)
  local Level = self.ID2DesignStreamingLevel[LevelName]
  return Level.LevelTransform
end

function EMLevelLoader:AddGridFrame(GridFrame)
  local level = UE4.URuntimeCommonFunctionLibrary.GetLevel(GridFrame)
  PrintTable(self.ID2DesignStreamingLevel)
  for id, streamLevel in pairs(self.ID2DesignStreamingLevel) do
    if streamLevel:GetLoadedLevel() == level then
      self.LevelID2GridFrame:Add(id, GridFrame)
      if self.LevelPathfinding and GridFrame.Elevator and GridFrame.ElevatorTopBPArrow and GridFrame.ElevatorBottomBPArrow then
        self.LevelPathfinding.ID2Elevator:Add(id, GridFrame.Elevator)
        self.LevelPathfinding.ID2ElevatorTopDoor:Add(id, GridFrame.ElevatorTopBPArrow)
        self.LevelPathfinding.ID2ElevatorBottomDoor:Add(id, GridFrame.ElevatorBottomBPArrow)
      end
      local battleMap
      local UIManager = GWorld.GameInstance:GetGameUIManager()
      if UIManager then
        local battleMain = UIManager:GetUI("BattleMain")
        if battleMain then
          battleMap = battleMain.Battle_Map or battleMain.Battle_Map_PC
        end
      end
      if self.id2LevelNameAndTransform[id] then
        self.id2LevelNameAndTransform[id][4] = GridFrame.Floor
        if battleMap then
          battleMap:CreateSingleBattleMap(id, self.id2LevelNameAndTransform[id])
        end
      else
        for id1, data in pairs(self.id2LevelNameAndTransform) do
          if string.find(data[1], id) then
            data[4] = GridFrame.Floor
            if battleMap then
              battleMap:CreateSingleBattleMap(id, data)
            end
            break
          end
        end
      end
    end
  end
end

function EMLevelLoader:SetDesignLevelHidden(bHidden)
  for _, DesignStreamingLevel in pairs(self.ID2DesignStreamingLevel) do
    DebugPrint("SetDesignLevelHidden", DesignStreamingLevel:GetName())
    DesignStreamingLevel:SetShouldBeVisible(not bHidden)
  end
end

function EMLevelLoader:CheckIsRougeLike()
  return false
end

function EMLevelLoader:GetConstStandAloneMonsterCanCache()
  return Const.StandAloneMonsterCanCache
end

function EMLevelLoader:GetConstOnlineMonsterCanCache()
  return Const.OnlineMonsterCanCache
end

function EMLevelLoader:LoadPreviewLevel(Name, Path, Callback, Position, Rotation, IsHide)
  local Success
  if not self[Name] then
    Success, self[Name] = UAsyncFunctionLibrary.LoadLevelInstance(self, Path, Position or FVector(0, 0, 0), Rotation or FRotator(0, 0, 0), Success, Name)
  end
  if self[Name] then
    local WCSubsystem = UGameplayStatics.GetGameMode(self):GetWCSubSystem()
    if WCSubsystem then
      WCSubsystem:FreezeWorldComposition()
      WCSubsystem:FreezeDistanceBasedRegion()
    end
    self[Name].OnLevelShown:Clear()
    self[Name].OnLevelShown:Add(self, Callback)
    coroutine.resume(coroutine.create(self.LatentPrevewLevelAction), self, true, Name, IsHide)
    return true
  end
end

function EMLevelLoader:UnloadPreviewLevel(Name)
  if self[Name] then
    local WCSubsystem = UGameplayStatics.GetGameMode(self):GetWCSubSystem()
    if WCSubsystem then
      WCSubsystem:UnFreezeWorldComposition()
      WCSubsystem:UnFreezeDistanceBasedRegion()
    end
    coroutine.resume(coroutine.create(self.LatentPrevewLevelAction), self, false, Name)
  end
end

function EMLevelLoader:LatentPrevewLevelAction(IsLoad, LevelName, IsHide)
  if IsLoad then
    UGameplayStatics.LoadStreamLevel(self, LevelName, not IsHide, true)
  else
    UGameplayStatics.UnloadStreamLevel(self, LevelName, true)
  end
end

function EMLevelLoader:SetLevelVisible(LevelName)
  if self[LevelName] then
    self[LevelName]:SetShouldBeVisible(true)
  end
end

function EMLevelLoader:GetDungeonPreloadData(DungeonId)
  local Ret = FDungeonPreloadData()
  if nil == EMDungeonPreloadData[DungeonId] then
    return Ret
  end
  local Data = EMDungeonPreloadData[DungeonId]
  Ret.OnlineCoefficient = Data.OnlineCoefficient
  for key, value in pairs(Data.MonsterSpawn) do
    Ret.MonsterSpawn:Add(key, value)
  end
  return Ret
end

function EMLevelLoader:GetRegionPreloadData(RegionName)
  local Ret = FDungeonPreloadData()
  if nil == EMRegionPreloadData[RegionName] then
    return Ret
  end
  local Data = EMRegionPreloadData[RegionName]
  Ret.OnlineCoefficient = 1.0
  for key, value in pairs(Data.MonsterSpawn) do
    Ret.MonsterSpawn:Add(key, value)
  end
  return Ret
end

function EMLevelLoader:GetAbyssPreloadData(AbyssId)
  local Ret = FDungeonPreloadData()
  if nil == EMAbyssPreloadData[AbyssId] then
    return Ret
  end
  local Data = EMAbyssPreloadData[AbyssId]
  Ret.OnlineCoefficient = 1.0
  for key, value in pairs(Data.MonsterSpawn) do
    Ret.MonsterSpawn:Add(key, value)
  end
  return Ret
end

return EMLevelLoader
