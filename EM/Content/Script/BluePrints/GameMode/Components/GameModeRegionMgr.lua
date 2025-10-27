require("UnLua")
require("Utils")
local GameModeRegionMgr = {}

function GameModeRegionMgr:GetLevelGamemModeAndLevelName(SubRegionId)
  local LevelName = self:GetLevelLoader():GetLevelIdByRegionId(SubRegionId)
  return LevelName, self.SubGameModeInfo:FindRef(LevelName)
end

function GameModeRegionMgr:IsWorldLoader(LevelLoader)
  LevelLoader = LevelLoader or self:GetLevelLoader()
  return IsValid(LevelLoader) and LevelLoader.IsWorldLoader
end

function GameModeRegionMgr:SetEnterLevelStateReady()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  Avatar:SetEnterLevelStateReady()
end

function GameModeRegionMgr:SaveQuestData(RegionId)
  if IsStandAlone(self) then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Avatar:UpdateRegionData(RegionId, UE4.ERegionDataType.RDT_QuestData)
    end
  elseif IsDedicatedServer(self) then
    print(_G.LogTag, "ZJT_ IsDedicatedServer Not Do ")
  end
end

function GameModeRegionMgr:SaveCommonData(RegionId)
  if IsStandAlone(self) then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Avatar:UpdateRegionData(RegionId, UE4.ERegionDataType.RDT_CommonData)
    end
  elseif IsDedicatedServer(self) then
    print(_G.LogTag, "ZJT_ IsDedicatedServer Not Do")
  end
end

function GameModeRegionMgr:SaveRarelyData(RarelyId)
  print(_G.LogTag, "ZJT_ IsDedicatedServer Not Do")
end

function GameModeRegionMgr:HandleLevelDeliverBlackCurtainEnd()
  AudioManager(self):SetEventSoundParam(self, "Loading", {ToEnd = 1})
  AudioManager(self):ResumePlayBGMCauseIsLoadingOrBlackScreen()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  Player:RemoveDisableInputTag("DeliverBlackCurtain")
  DebugPrint("HandleLevelDeliverBlackCurtainEnd CB1")
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local TaskIndicator = UIManager:GetUIObj("MainTaskIndicator")
  UIManager:HideCommonBlackScreen("HandleLevelDeliverBlackCurtain")
  local UI = UIManager:GetUIObj("BlackScreenXiaobai")
  if UI then
    local SceneMgrComponent = GameInstance:GetSceneManager()
    
    local function UnLoadingUI()
      TaskIndicator = UIManager:GetUIObj("MainTaskIndicator")
      if IsValid(TaskIndicator) then
        TaskIndicator:SetVisibility(UE4.ESlateVisibility.Visible)
      end
      SceneMgrComponent = GameInstance:GetSceneManager()
      SceneMgrComponent:ShowOrHideAllSceneGuideIcon(true)
      UI:UnbindAllFromAnimationFinished(UI.Out)
      local UI = UIManager:GetUIObj("BlackScreenXiaobai")
      if UI then
        UI:CloseUI()
      end
      EventManager:FireEvent(EventID.OnLevelDeliverBlackCurtainEnd)
    end
    
    UI:BindToAnimationFinished(UI.Out, {UI, UnLoadingUI})
    UI:PlayAnimationForward(UI.Out, 1.0, true)
    if not UI.Out then
      UnLoadingUI()
    end
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if IsValid(PlayerCharacter) then
    PlayerCharacter:DisablePlayerInputInDeliver(false)
  end
  EventManager:FireEvent(EventID.OnLevelDeliverBlackCurtainEnd)
end

function GameModeRegionMgr:CloseCurUI()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local UITable = UIManager.CurrentUIList:ToTable()
  for i = #UITable, 1, -1 do
    local Name = UITable[i]
    local SystemUI = UIManager:GetUI(Name)
    if SystemUI then
      local SystemUIConfig = DataMgr.SystemUI[SystemUI:GetUIConfigName()]
      local UnloadCheck = true
      if SystemUIConfig and (SystemUIConfig.System == "Battle" or SystemUIConfig.System == "Common" or SystemUIConfig.System == "Story") then
        UnloadCheck = false
      end
      if "CommonBlackScreen" == Name or "BlackScreenXiaobai" == Name or "SceneStartUI" == Name or "SelectRole" == Name then
        UnloadCheck = false
      end
      if "GuideIconMain" == Name or SystemUI.IsDungeonIndicator then
        UnloadCheck = false
      end
      if "Entertainment" == Name then
        UnloadCheck = false
      end
      if "TalkGuideUI" == Name then
        UnloadCheck = false
      end
      if UnloadCheck then
        DebugPrint("HandleLevelDeliverBlackCurtainEnd Systemui Close:", Name)
        SystemUI:Close()
      end
    end
  end
end

function GameModeRegionMgr:InterruptBlackCurtainEnd()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local UI = UIManager:GetUIObj("CommonBlackScreen")
  UI = UI or UIManager:GetUIObj("BlackScreenXiaobai")
  if not UI then
    return
  end
  if UI:IsAnimationPlaying(UI.FadeOutAnimation) then
    UI:StopAnimation(UI.FadeOutAnimation)
  end
end

function GameModeRegionMgr:HandleLevelDeliverBlackCurtainStart(IsWhite, IsFromMap)
  DebugPrint("HandleLevelDeliverBlackCurtainStart")
  AudioManager(self):PlayUISound(self, "event:/ui/common/loading_common", "Loading", nil)
  AudioManager(self):PausePlayBGMCauseIsLoadingOrBlackScreen()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if IsValid(PlayerCharacter) then
    PlayerCharacter:DisablePlayerInputInDeliver(true)
  end
  EventManager:FireEvent(EventID.OnLevelDeliverBlackCurtainStart)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local OldUI = UIManager:GetUIObj("CommonBlackScreen")
  local SceneMgrComponent = GameInstance:GetSceneManager()
  if OldUI then
    UIManager:CloseCommonBlackScreenWithoutCB("HandleLevelDeliverBlackCurtain")
    local TaskIndicator = UIManager:GetUIObj("MainTaskIndicator")
    if IsValid(TaskIndicator) then
      TaskIndicator:SetVisibility(UE4.ESlateVisibility.Visible)
    end
    SceneMgrComponent = GameInstance:GetSceneManager()
    SceneMgrComponent:ShowOrHideAllSceneGuideIcon(true)
  end
  OldUI = UIManager:GetUIObj("BlackScreenXiaobai")
  if OldUI then
    OldUI:CloseUI()
  end
  if not IsFromMap then
    local Params = {}
    Params.BlackScreenHandle = "HandleLevelDeliverBlackCurtain"
    Params.ScreenColor = IsWhite and "White" or "Black"
    Params.OutAnimationPlayTime = 0.5
    Params.OutAnimationObj = self
    
    function Params.OutAnimationCallback()
      local SceneMgrComponent = GameInstance:GetSceneManager()
      local TaskIndicator = UIManager:GetUIObj("MainTaskIndicator")
      if IsValid(TaskIndicator) then
        TaskIndicator:SetVisibility(UE4.ESlateVisibility.Visible)
      end
      SceneMgrComponent = GameInstance:GetSceneManager()
      SceneMgrComponent:ShowOrHideAllSceneGuideIcon(true)
      EventManager:FireEvent(EventID.OnLevelDeliverBlackCurtainEnd)
    end
    
    UIManager:ShowCommonBlackScreen(Params)
  else
    local UI = UIManager:LoadUINew("BlackScreenXiaobai", IsWhite)
    UI.bUseFakeProgress = true
  end
  SceneMgrComponent:ShowOrHideAllSceneGuideIcon(false)
  local TaskIndicator = UIManager:GetUIObj("MainTaskIndicator")
  if IsValid(TaskIndicator) then
    TaskIndicator:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  PlayerCharacter:ResetIdle()
  if self:IsExistTimer("HandleLevelDeliver", true) then
    self:RemoveTimer("HandleLevelDeliver", true)
  end
end

function GameModeRegionMgr:StopLimitTimeExploreGroup()
  if 0 == self.EMGameState.ActiveLimitTimeExploreGroup then
    return
  end
  local ExploreGroup = self.EMGameState.ExploreGroupMap:FindRef(self.EMGameState.ActiveLimitTimeExploreGroup)
  ExploreGroup:FailLimitExplore()
end

function GameModeRegionMgr:AsyncSetPlayerByStartIndex(LoadLevel, LevelId, StartIndex, IsOpenSync, IsWhite, IsFromMap)
  local LevelLoader = self:GetLevelLoader()
  self:HandleLevelDeliverBlackCurtainStart(IsWhite, IsFromMap)
  local WorldCompositionSubsystem = LevelLoader.WorldCompositionSubSystem
  if WorldCompositionSubsystem then
    local TargtePoint = self:GetLevelLoader():GetStartPointByManager(LevelId, StartIndex)
    local Transform = TargtePoint:GetTransform()
    local Character = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    local SubRegionId = LevelLoader:GetRegionIdByLevelId(LevelId)
    WorldCompositionSubsystem:RequestAsyncTravel(Character, Transform, {
      self,
      function()
        local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
        Player:AddDisableInputTag("DeliverBlackCurtain")
        self:HandleLevelDeliverBlackCurtainEnd()
        local Avatar = GWorld:GetAvatar()
        DebugPrint("ExeRegionSkipCallbck", SubRegionId, Avatar.CurrentRegionId)
        Avatar:ExeRegionSkipCallbck(SubRegionId or Avatar.CurrentRegionId, "Enter")
        if Avatar:CheckCurrentSubRegion() and Avatar:CheckSubRegionType(nil, CommonConst.SubRegionType.Field) and not Avatar.IsOpenPlayerPositionSync then
          DebugPrint("AsyncSetPlayerByStartIndex, PlayerEnterBigWorld")
          Avatar:PlayerEnterBigWorld()
        end
      end
    })
    return
  end
  
  local function Callback()
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    Player:AddDisableInputTag("DeliverBlackCurtain")
    self:AddTimer(DataMgr.GlobalConstant.DeliveryBlackCurtainTime.ConstantValue, self.HandleLevelDeliverBlackCurtainEnd, false, 0, "HandleLevelDeliver", true)
    self:SetPlayerLocationAndRotation(LevelId, StartIndex)
  end
  
  if LevelLoader:GetLevelLoaded(LevelId) then
    Callback()
    return
  end
  
  local function LoadLevelCallBack()
    Callback()
    LevelLoader:RemoveArtLevelLoadedCompleteCallback(LevelId)
  end
  
  LevelLoader:BindArtLevelLoadedCompleteCallback(LevelId, LoadLevelCallBack)
  LevelLoader:LoadArtLevel(LevelId)
end

function GameModeRegionMgr:AsyncSetPlayerByLocationAndRotation(LoadLevel, LevelId, Location, Rotation, IsOpenSync, IsWhite)
  local LevelLoader = self:GetLevelLoader()
  self:HandleLevelDeliverBlackCurtainStart(IsWhite)
  local WorldCompositionSubsystem = LevelLoader.WorldCompositionSubSystem
  if WorldCompositionSubsystem then
    local Transform = UE4.UKismetMathLibrary.MakeTransform(Location, Rotation, UE4.FVector(1, 1, 1))
    local Character = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    WorldCompositionSubsystem:RequestAsyncTravel(Character, Transform, {
      self,
      function()
        local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
        Player:AddDisableInputTag("DeliverBlackCurtain")
        self:HandleLevelDeliverBlackCurtainEnd()
      end
    })
    return
  end
  
  local function Callback()
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    Player:AddDisableInputTag("DeliverBlackCurtain")
    self:AddTimer(DataMgr.GlobalConstant.DeliveryBlackCurtainTime.ConstantValue, self.HandleLevelDeliverBlackCurtainEnd, false, 0, "HandleLevelDeliver", true)
    local Character = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    local Controller = UE4.UGameplayStatics.GetPlayerController(self, 0)
    Character:K2_SetActorLocation(Location, false, nil, true)
    Character:K2_SetActorRotation(Rotation, false)
    Controller:SetControlRotation(Rotation)
    LevelLoader:OpenPlayerPositionSync()
  end
  
  if LevelLoader:GetLevelLoaded(LevelId) then
    Callback()
    return
  end
  
  local function LoadLevelCallBack()
    Callback()
    LevelLoader:RemoveArtLevelLoadedCompleteCallback(LevelId)
  end
  
  LevelLoader:BindArtLevelLoadedCompleteCallback(LevelId, LoadLevelCallBack)
  LevelLoader:LoadArtLevel(LevelId)
end

function GameModeRegionMgr:SetPlayerLocationAndRotation(LevelId, StartIndex)
  local TargtePoint = self:GetLevelLoader():GetStartPointByManager(LevelId, StartIndex)
  TargtePoint:SetPlayerTrans()
end

function GameModeRegionMgr:HandleLevelDeliver(ModeType, Id, StartIndex, IsWhite, bIsInvitation, bIsFromMap)
  Id = tonumber(Id)
  ModeType = tonumber(ModeType)
  StartIndex = tonumber(StartIndex)
  local Avatar = GWorld:GetAvatar()
  local LevelLoader = self:GetLevelLoader()
  if not Avatar or ModeType == UE4.EModeType.ModeNone then
    return false
  end
  local PlayerCharacter = UGameplayStatics.GetPlayerCharacter(self, 0)
  if ModeType == UE4.EModeType.ModeRegion then
    HeroUSDKSubsystem():UploadTrackLog_Lua("event_transmit", {
      before_map_id = tostring(Avatar.CurrentRegionId),
      position = PlayerCharacter and tostring(PlayerCharacter:K2_GetActorLocation()) or "",
      trans_id = tostring(StartIndex),
      after_map_id = tostring(Id),
      trans_type = CommonConst.EnterRegionType.Deliver
    })
  end
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  if PlayerController:GetStoryModeState() then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManger = GameInstance:GetGameUIManager()
    UIManger:ShowError(ErrorCode.RET_STORYMODE_STOP_HANDLE_DELIVER_REGION)
    return false
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local MenuWorld = UIManager:GetUIObj(UIConst.MenuWorld)
  if MenuWorld then
    MenuWorld:Close()
  end
  local SceneMgrComponent = GameInstance:GetSceneManager()
  if IsValid(SceneMgrComponent) then
    if SceneMgrComponent.NearestPetGuideEid > 0 then
      SceneMgrComponent:CloseOneGuideIconByTargetEid(SceneMgrComponent.NearestPetGuideEid)
      SceneMgrComponent.NearestPetGuideEid = 0
    end
    if SceneMgrComponent.NearestBreakableItemGuideEid > 0 then
      SceneMgrComponent:CloseOneGuideIconByTargetEid(SceneMgrComponent.NearestBreakableItemGuideEid)
      SceneMgrComponent.NearestBreakableItemGuideEid = 0
    end
  end
  GameInstance.ShouldPlayDeliveryEndMontage = false
  GameInstance.AlreadyDeliver = false
  if ModeType == UE4.EModeType.ModeRegion then
    local TargetRegionInfo = DataMgr.SubRegion[Id]
    local CurrentRegionInfo = DataMgr.SubRegion[Avatar.CurrentRegionId]
    if not TargetRegionInfo then
      return false
    end
    local CurrentRegionFile = DataMgr.Region[CurrentRegionInfo.RegionId].RegionMapFile
    local TergetRegionFile = DataMgr.Region[TargetRegionInfo.RegionId].RegionMapFile
    if not IsValid(LevelLoader) then
      if Avatar:IsRealInBigWorld() then
        if CurrentRegionFile == TergetRegionFile then
          return false
        end
        Avatar:EnterRegion(Id, StartIndex, CommonConst.EnterRegionType.Deliver, nil, bIsInvitation)
      else
        Avatar:EnterRegion(Id, StartIndex, CommonConst.EnterRegionType.Deliver, nil, bIsInvitation)
      end
    else
      local function RegionDeliver()
        if LevelLoader.IsWorldLoader then
          if CurrentRegionFile == TergetRegionFile then
            local LevelId = LevelLoader:GetLevelIdByRegionId(Id)
            
            if not self:CheckSkipRegionByStartIndex(LevelId, StartIndex) then
              return false
            end
            Avatar:ClosePlayerPositionSync()
            self:StopLimitTimeExploreGroup()
            if bIsFromMap then
              local BlackScreenHandle = {
                BlackScreenHandle = "HandleLevelDeliverBlackCurtain",
                InAnimationObj = self,
                OutAnimationObj = self,
                ScreenColor = IsWhite and "White" or "Black"
              }
              UIManager:ShowCommonBlackScreen(BlackScreenHandle)
            end
            ULoadLevel.DeliverTargtePlayer(self, LevelId, StartIndex, true, IsWhite, bIsFromMap)
          else
            Avatar:EnterRegion(Id, StartIndex, CommonConst.EnterRegionType.Deliver, nil, bIsInvitation)
          end
        else
          Avatar:EnterRegion(Id, StartIndex, CommonConst.EnterRegionType.Deliver, nil, bIsInvitation)
        end
      end
      
      local function RealDelivery()
        DebugPrint("zwk RealDelivery")
        PlayerCharacter:SetInvincible(false, "Delivery")
        PlayerCharacter:SetSuperArmor(false, "Delivery")
        PlayerCharacter:SetTNCannotReduce(false, "Delivery")
        GameInstance.AlreadyDeliver = true
        PlayerCharacter:SetActorHideTag("DeliveryMontage", true)
        RegionDeliver()
        self:DeliveryHideWeapon(PlayerCharacter, false)
      end
      
      local function NotifyBegin()
        DebugPrint("zwk OnDeliveryPreLoadingMontageNotifyBegin")
        if not GameInstance.AlreadyDeliver then
          RealDelivery()
        end
      end
      
      local function Interrupted()
        DebugPrint("zwk OnDeliveryPreLoadingInterrupted", GameInstance.ShouldPlayDeliveryEndMontage, GameInstance.AlreadyDeliver)
        if not GameInstance.AlreadyDeliver then
          local Rot = PlayerCharacter:K2_GetActorRotation()
          Rot.Pitch = 0.0
          Rot.Roll = 0.0
          PlayerCharacter:K2_SetActorRotation(Rot, false, nil, false)
          RealDelivery()
        end
      end
      
      local AllCallback = {OnNotifyBegin = NotifyBegin, OnInterrupted = Interrupted}
      if bIsFromMap then
        DebugPrint("zwk OnDeliveryPreLoadingMontageBeginLoad")
        GameInstance:OnCharaterReset()
        local CameraRot = PlayerCharacter.CharCameraComponent:K2_GetComponentRotation()
        CameraRot.Pitch = 0.0
        CameraRot.Roll = 0.0
        PlayerCharacter:K2_SetActorRotation(CameraRot, false, nil, false)
        self:CloseCurUI()
        PlayerCharacter:AddDisableInputTag("DeliverBlackCurtain")
        PlayerCharacter:DisablePlayerInputInDeliver(true)
        PlayerCharacter:SetInvincible(true, "Delivery")
        PlayerCharacter:SetSuperArmor(true, "Delivery")
        PlayerCharacter:SetTNCannotReduce(true, "Delivery")
        self:DeliveryHideWeapon(PlayerCharacter, true)
        PlayerCharacter:SetActorHideTag("DeliveryMontage", false)
        GameInstance.ShouldPlayDeliveryEndMontage = true
        PlayerCharacter:PlayTeleportAction(AllCallback, false, true, true)
        self:AddTimer(5, function()
          if PlayerCharacter then
            PlayerCharacter:SetInvincible(false, "Delivery")
            PlayerCharacter:SetSuperArmor(false, "Delivery")
            PlayerCharacter:SetTNCannotReduce(false, "Delivery")
            self:DeliveryHideWeapon(PlayerCharacter, false)
          end
        end, false, 0, "DisableInvincible", true)
      else
        RegionDeliver()
      end
    end
  elseif ModeType == UE4.EModeType.ModeDungeon then
    if Avatar:IsRealInBigWorld() then
      Avatar:EnterDungeon(Id, nil)
    else
      local CurrentDungeonId = GWorld.GameInstance:GetCurrentDungeonId()
      if CurrentDungeonId == Id then
        return false
      end
      Avatar:EnterDungeon(Id, nil)
    end
  end
  return true
end

function GameModeRegionMgr:DeliveryHideWeapon(PlayerCharacter, bHide)
  for Id, Weapon in pairs(PlayerCharacter.Weapons) do
    Weapon:SetActorHideTag("Delivery", bHide)
  end
end

function GameModeRegionMgr:CheckSkipRegionByStartIndex(LevelId, StartIndex)
  local StartPoint = self:GetLevelLoader():GetStartPointByManager(LevelId, StartIndex)
  return IsValid(StartPoint)
end

function GameModeRegionMgr:DeliverByLocationAndRotation(SubRegionId, Location, Rotation, IsWhite)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local TargetRegionInfo = DataMgr.SubRegion[SubRegionId]
  local CurrentRegionInfo = DataMgr.SubRegion[Avatar.CurrentRegionId]
  if not TargetRegionInfo then
    return
  end
  local CurrentRegionFile = DataMgr.Region[CurrentRegionInfo.RegionId].RegionMapFile
  local TergetRegionFile = DataMgr.Region[TargetRegionInfo.RegionId].RegionMapFile
  if CurrentRegionFile == TergetRegionFile then
    local LevelLoader = self:GetLevelLoader()
    local LevelId = LevelLoader:GetLevelIdByRegionId(SubRegionId)
    Avatar:ClosePlayerPositionSync()
    self:StopLimitTimeExploreGroup()
    ULoadLevel.DeliverTargtePlayerByLocationAndRotation(self, LevelId, FVector(Location.X, Location.Y, Location.Z), FRotator(Rotation.Pitch, Rotation.Yaw, Rotation.Roll), true, IsWhite)
  end
end

function GameModeRegionMgr:DelDrop(DropId)
  self.LevelGameMode.DropRule[DropId] = true
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:UpdateSuitKey2Value(CommonConst.SuitType.GameModeSuit, CommonConst.GameModeSuit.DropRule, DropId, true)
  end
end

function GameModeRegionMgr:RecoverDrop(DropId)
  self.LevelGameMode.DropRule[DropId] = false
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:UpdateSuitKey2Value(CommonConst.SuitType.GameModeSuit, CommonConst.GameModeSuit.DropRule, DropId, false)
  end
end

return GameModeRegionMgr
