require("UnLua")
local EMCache = require("EMCache.EMCache")
local M = Class("BluePrints.UI.BP_UIState_C")
local Rotation = FRotator()
local Position = FVector()
local HitResult = FHitResult()

function M:Construct()
  M.Super.Construct(self)
  self:InitConstValue()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.CameraIndexes = {
    1,
    2,
    3
  }
  self.Controller = self:GetOwningPlayer()
  self.Player = self.Controller:K2_GetPawn()
  self.ActorsToIgnore = TArray(AActor)
  self.ActorsToIgnore:Add(self.Player)
  self.CameraManager = self.Controller.PlayerCameraManager
  self.PlayerCapsuleRadius = self.Player.CapsuleComponent:GetScaledCapsuleRadius()
  self.CameraProbeSize = math.min(self.CameraProbeSize, self.PlayerCapsuleRadius - 0.1)
  self.PlayerCapsuleHalfHeight = self.Player.CapsuleComponent:GetScaledCapsuleHalfHeight()
  self:CreateCamera()
  self.PlayerLocation = self.Player:K2_GetActorLocation()
  self.PlayerForward = self.Player:GetActorForwardVector()
  self.TraceStartLocation = FVector(0, 0, 0)
  self.TraceStartLocation.X = self.PlayerLocation.X
  self.TraceStartLocation.Y = self.PlayerLocation.Y
  self.TraceStartLocation.Z = self.PlayerLocation.Z + self.PlayerCapsuleHalfHeight - self.PlayerCapsuleRadius
  self.Camera:SetMoveRange(self.PlayerLocation, self.CameraMoveMaxRang)
  self.CurCameraIndex = 0
  if self.FocalLengthSlider then
    self.FocalLengthSlider:BindEvents({
      EventObj = self,
      OnSliderChangedEvent = self.OnFocalLengthSliderValueChanged
    })
  end
  self.RollScrollMin = -180
  self.RollScrollMax = 180
  if self.RollScrollBar then
    self.RollScrollBar:BindEvents({
      EventObj = self,
      OnScrolledEvent = self.OnRollScrollBarPercentChanged,
      OnInertialScrollingEndEvent = self.OnRollScrollBarInertialScrollingEnd
    })
  end
  self.CameraTrans = {}
  self.Main:SetVisibility(UIConst.VisibilityOp.Visible)
  self.SoundFlags = {}
  self.SoundPaths = {
    Camera_Motor = "event:/ui/common/camera_move"
  }
  self.AudioManager = AudioManager(self)
  self.CurCharHiddenState = 0
  self.CharType = {
    Char = 1,
    Player = 2,
    NPC = 4,
    Monster = 8,
    Pet = 16,
    All = 31
  }
  self.bHasFoundTargets = false
  self.IsShotTargetSucceeded = false
  self.CloseCallback = nil
  self.ActorTickableStates = {}
  self.Btn_Pause:AddEventOnCheckStateChanged(self, self.NotifyGamePauseChange)
  self.Text_Pause:SetText(GText("UI_CameraSystem_PauseGame"))
  self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
end

function M:InitConstValue()
  local Data = DataMgr.GlobalConstant
  
  local function GetDataValue(DataRow)
    return DataRow and DataRow.ConstantValue
  end
  
  self.CameraMoveSpeedX = GetDataValue(Data.PhotoCameraForwardAdjustSpeed) or 20
  self.CameraMoveSpeedY = GetDataValue(Data.PhotoCameraHorizontalAdjustSpeed) or 20
  self.CameraMoveSpeedZ = GetDataValue(Data.PhotoCameraVerticalAdjustSpeed) or 20
  self.CameraMoveMaxRang = GetDataValue(Data.PhotoCamaraMoveMaxRange) or 1000
  self.CameraProbeSize = GetDataValue(Data.PhotoCameraSphereCollisionRadius) or 20
  self.YawSpeed = GetDataValue(Data.PhotoCameraYawPitchAdjustSpeed) or 1
  self.PitchSpeed = self.YawSpeed
  self.RollSpeed = GetDataValue(Data.PhotoCameraRollAdjustSpeed) or 1
  self.RollSpeed = self.RollSpeed + 0.01
  self.RotYawGamepadCoe = GetDataValue(Data.RotYawGamepadCoe) or 2.5
  self.RotPitchGamepadCoe = GetDataValue(Data.RotPitchGamepadCoe) or 2.5
  local V1 = FVector()
  V1.X = GetDataValue(Data.PhotoCameraPrefabCameraRelativeLocationX) or 0
  V1.Y = GetDataValue(Data.PhotoCameraPrefabCameraRelativeLocationY) or 20
  V1.Z = GetDataValue(Data.PhotoCameraPrefabCameraRelativeLocationZ) or 0
  self.FreeCameraOffset = V1
  local V2 = FVector()
  V2.X = GetDataValue(Data.PhotoCameraPrefabPortraitRelativeLocationX) or 0
  V2.Y = GetDataValue(Data.PhotoCameraPrefabPortraitRelativeLocationY) or 500
  V2.Z = GetDataValue(Data.PhotoCameraPrefabPortraitRelativeLocationZ) or 0
  self.PortraitCameraOffset = V2
  self.MaxFocalLength = GetDataValue(Data.PhotoCameraMaxFocalLength) or 100
  self.MinFocalLength = GetDataValue(Data.PhotoCameraMinFocalLength) or 1
  self.FocalLengthSpeed = GetDataValue(Data.PhotoCameraFocalLengthAdjustSpeed) or 10
end

function M:InitUIInfo(Name, IsInUIMode, EventList, Params)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, Params)
  USequenceFunctionLibrary.SetViewTarget(self:GetOwningPlayer(), self.Camera)
  self.Hide_Role:SetText(GText("UI_CameraSystem_HideModel_Character"))
  self.Hide_Role:SetHiddenState(false)
  self.Hide_Player:SetText(GText("UI_CameraSystem_HideModel_OtherPlayer"))
  self.Hide_Player:SetHiddenState(false)
  self.Hide_NPC:SetText(GText("UI_CameraSystem_HideModel_NPC"))
  self.Hide_NPC:SetHiddenState(false)
  self.Hide_Monster:SetText(GText("UI_CameraSystem_HideModel_Monster"))
  self.Hide_Monster:SetHiddenState(false)
  self.Hide_Pet:SetText(GText("UI_CameraSystem_HideModel_Pet"))
  self.Hide_Pet:SetHiddenState(false)
  self.InitParams = Params or nil
  if self.InitParams ~= nil then
    EventManager:FireEvent(EventID.OnInitScreenshotParams, self.InitParams)
    self:SetInitParams(self.InitParams)
  else
    self.InitParams = {}
    EventManager:FireEvent(EventID.OnInitScreenshotParams, self.InitParams)
    self:SetInitParams(self.InitParams)
    if self.Btn_Pause:GetChecked() == false then
      self.Btn_Pause:SetChecked(true, true)
      self.Btn_Pause:StopAllAnimations()
      self.Btn_Pause:PlayAnimation(self.Btn_Pause.Open_Normal)
    end
  end
  self.Main:SetVisibility(UIConst.VisibilityOp.Visible)
  self:BlockAllUIInput(true)
  self:ResetCamera()
  self.bHasAnyOperation = false
  self.PlayerController = self:GetOwningPlayer()
  self:SaveAndSetNPCTickableState()
end

function M:SetInitParams(Params)
  self.InitFocalLength = Params.FocalLength
  self.TargetPointNames = Params.TargetPointNames
  self.Text_TargetFound = Params.Text_TargetFound
  self.Text_TargetNotFound = Params.Text_TargetNotFound
  self.LookAtTargetName = Params.LookAtTargetName
  self.TargetActors = nil
  if self.TargetPointNames then
    self.TargetActors = {}
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    if GameState then
      for key, value in pairs(self.TargetPointNames) do
        self.TargetActors[value] = GameState:GetTargetPoint(value) or GameState.StaticCreatorStringNameMap:FindRef(value)
      end
    end
  end
  if self.TargetActors and next(self.TargetActors) then
    self.Panel_FindTarget:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Border_FindTarget:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.Panel_FindTarget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Border_FindTarget:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Panel_FailToast:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Panel_SuccessToast:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_LostTarget:SetText(self.Text_TargetNotFound)
  self.bHasFoundTargets = false
  self.CloseCallback = Params.CloseCallback
  self.OnShotTargetSuccess = Params.OnShotTargetSuccess
  if Params.bStartHiddenRole then
    self:OnHideBtnClickedImp(UIConst.PhotoCameraHiddenButton.Role, self.CharType.Char)
  end
  if Params.bStartHiddenPlayer then
    self:OnHideBtnClickedImp(UIConst.PhotoCameraHiddenButton.Player, self.CharType.Player)
  end
  if Params.bStartHiddenNPC then
    self:OnHideBtnClickedImp(UIConst.PhotoCameraHiddenButton.NPC, self.CharType.NPC)
  end
  if Params.bStartHiddenMonster then
    self:OnHideBtnClickedImp(UIConst.PhotoCameraHiddenButton.Monster, self.CharType.Monster)
  end
  if Params.bStartHiddenPet then
    self:OnHideBtnClickedImp(UIConst.PhotoCameraHiddenButton.Pet, self.CharType.Pet)
  end
  if Params.LockHiddenList and #Params.LockHiddenList > 0 then
    for i = 1, #Params.LockHiddenList do
      if Params.LockHiddenList[i] then
        self:SetLockHiddenButton(Params.LockHiddenList[i], true)
      end
    end
  else
    self:SetLockAllHiddenButton(false)
  end
  self.Btn_Pause:SetChecked(Params.bForceGamePause)
  self:NotifyGamePauseChange(Params.bForceGamePause)
  self:SetLockGamePause(Params.bLockGamePause)
  self:SetLockCameraPos(Params.bLockCameraPos)
  if Params.StartPos ~= "" then
    local OutConvertedVector, OutIsValid = UE4.UKismetStringLibrary.Conv_StringToVector(Params.StartPos)
    if OutIsValid then
      self.Camera:SetLocation(OutConvertedVector)
      self.Camera:SetRotation(self.Camera:K2_GetActorRotation())
      self.OriginalCameraTransform.Translation = self.Camera:K2_GetActorLocation()
      Params.bUseStartPos = true
    end
  end
end

function M:OnLoaded(...)
  M.Super.OnLoaded(self, ...)
  self:BlockAllUIInput(false)
  self.bHasAnyOperation = false
  EventManager:AddEvent(EventID.OnTeamRecoveryStateChange, self, function(self, Eid, Type, PrevType)
    if Eid == self.Player:GetEid() then
      if Type == UE4.ETeamRecoveryState.Dying then
        self.IsNeedCloseWorldMenu = true
        self:Close()
      end
      local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
      local UIManager = GameInstance:GetGameUIManager()
      if UIManager then
        local MenuWorld = UIManager:GetUI("MenuWorld")
        if MenuWorld then
          MenuWorld.CloseByChild = true
        end
      end
    end
  end)
  self:InitTaskInfo()
end

function M:InitTaskInfo()
  local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")
  local CurrentEvent = ClientEventUtils:GetCurrentDoingDynamicEvent()
  if CurrentEvent then
    local TaskPanel
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    local BattleMainUI = UIManager:GetUIObj("BattleMain")
    if nil ~= BattleMainUI then
      TaskPanel = BattleMainUI.Pos_DynamicEvent:GetChildAt(0)
    end
    self.TaskBar.Text_TaskName:SetText(GText(CurrentEvent.DynamicQuestConfig.DynName))
    if nil ~= TaskPanel then
      self.TaskBar.Text_TaskContent:SetText(TaskPanel.Text_Describe:GetText())
    end
    self.TaskBar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.TaskBar:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:Tick(MyGeometry, InDeltaTime)
  if self.CameraManager then
    local CameraLocation = self.CameraManager:GetCameraLocation()
    Position.X = self.PlayerLocation.X
    Position.Y = self.PlayerLocation.Y
    Position.Z = self.PlayerLocation.Z
    local Dis2D = (CameraLocation.X - Position.X) ^ 2 + (CameraLocation.Y - Position.Y) ^ 2
    if Dis2D < self.PlayerCapsuleRadius * self.PlayerCapsuleRadius and CameraLocation.Z < Position.Z + self.PlayerCapsuleHalfHeight and CameraLocation.Z > Position.Z - self.PlayerCapsuleHalfHeight then
      if not self.Player.bHidden then
        self.Player:SetActorHideTag("CameraScreenshotTick", true)
      end
    elseif self.Player.bHidden and 0 == self.CharType.Char & self.CurCharHiddenState then
      self.Player:SetActorHideTag("CameraScreenshotTick", false)
    end
  end
  for key, value in pairs(self.SoundPaths) do
    if self.SoundFlags[key] then
      self:PlayMotorSound(key)
    elseif not self.SoundFlags[key] then
      self:PauseMotorSound(key)
    end
  end
  self:TickFindTargets()
end

local ScreenPos = FVector2D()

function M:TickFindTargets()
  if self.IsShotTargetSucceeded then
    return
  end
  if self.TargetActors then
    local ViewPortScale = UWidgetLayoutLibrary.GetViewportScale(self)
    local Geo = self.Border_FindTarget:GetTickSpaceGeometry()
    local LeftTop = USlateBlueprintLibrary.GetLocalTopLeft(Geo) * ViewPortScale
    local Size = USlateBlueprintLibrary.GetLocalSize(Geo) * ViewPortScale
    self.bFindTarget = false
    for key, value in pairs(self.TargetActors) do
      UGameplayStatics.ProjectWorldToScreen(self.PlayerController, value:K2_GetActorLocation(), ScreenPos, false)
      if ScreenPos.X > LeftTop.X and ScreenPos.Y > LeftTop.Y and ScreenPos.X < LeftTop.X + Size.X and ScreenPos.Y < LeftTop.Y + Size.Y then
        self.bFindTarget = true
      else
        self.bFindTarget = false
        break
      end
    end
    if self.bFindTarget then
      if not self.bHasFoundTargets then
        self:StopAnimation(self.TargetOut)
        self:PlayAnimation(self.TargetIn)
        self.Text_FindTarget:SetText(self.Text_TargetFound)
        self.Panel_FailToast:SetVisibility(UIConst.VisibilityOp.Collapsed)
        self.Panel_SuccessToast:SetVisibility(UIConst.VisibilityOp.Visible)
        self.bHasFoundTargets = true
        if not self.bHasPlayedFoundSound then
          AudioManager(self):PlayUISound(self, "event:/ui/common/task_target_detect", "Camera_Target_Found", nil)
          self.bHasPlayedFoundSound = true
          self.bHasPlayedNotFoundSound = false
        end
      end
    elseif self.bHasFoundTargets then
      self:StopAnimation(self.TargetIn)
      self:PlayAnimation(self.TargetOut)
      self.Text_LostTarget:SetText(self.Text_TargetNotFound)
      self.Panel_FailToast:SetVisibility(UIConst.VisibilityOp.Visible)
      self.Panel_SuccessToast:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.bHasFoundTargets = false
      if self.bHasPlayedFoundSound ~= nil and not self.bHasPlayedNotFoundSound then
        AudioManager(self):PlayUISound(self, "event:/ui/common/task_target_lost", "Camera_Target_Not_Found", nil)
        self.bHasPlayedFoundSound = false
        self.bHasPlayedNotFoundSound = true
      end
    end
  end
end

function M:PlayMotorSound(key)
  if not self.AudioManager:IsSoundPlaying(self, key) then
    self.AudioManager:PlayUISound(self, self.SoundPaths[key], key, nil)
  end
  AudioManager(self):SetEventSoundParam(self, key, {drag = 1})
  self:RemoveTimer("DelayPauseMotorSound")
end

function M:PauseMotorSound(key)
  if not self:IsExistTimer("DelayPauseMotorSound") then
    self:AddTimer(0.1, function()
      if self.AudioManager:IsSoundPlaying(self, key) then
        AudioManager(self):SetEventSoundParam(self, key, {drag = 0})
      end
    end, false, 0, "DelayPauseMotorSound")
  end
end

function M:CreateCamera()
  self.OriginalCameraTransform = FTransform()
  self.OriginalCameraTransform.Translation = self.CameraManager:GetCameraLocation()
  self.OriginalCameraTransform.Rotation = self.CameraManager:GetCameraRotation():ToQuat()
  self.Camera = self:GetWorld():SpawnActor(LoadClass("/Game/AssetDesign/Camera/BP_ScreenshotCamera.BP_ScreenshotCamera_C"), self.OriginalCameraTransform, UE4.ESpawnActorCollisionHandlingMethod.AdjustIfPossibleButAlwaysSpawn, nil, nil, nil)
  if not IsValid(self.Camera) then
    self:Close()
  end
  self.Camera.ProbeSize = self.CameraProbeSize
  self.Camera.LocationAlpha = 4
  self.Camera.RotationAlpha = 16
  self.Camera:SetActiveCamera(0)
end

function M:ToggleHideSelf()
  self.bSelfHidden = not self.bSelfHidden
  if self.bSelfHidden then
    AudioManager(self):PlayUISound(self, "event:/ui/common/camera_reset", "Camera_HideUI", nil)
    self:PlayAnimation(self.Hide_Out or self.Auto_Out)
    self.Main:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    UIUtils.PlayCommonBtnSe(self)
    self:PlayAnimation(self.Hide_In or self.Auto_In)
    self.Main:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end

function M:OnHideRoleBtnClicked()
  self:OnHideBtnClickedImp(UIConst.PhotoCameraHiddenButton.Role, self.CharType.Char)
end

function M:OnHidePlayerBtnClicked()
  self:OnHideBtnClickedImp(UIConst.PhotoCameraHiddenButton.Player, self.CharType.Player)
end

function M:OnHideNPCBtnClicked()
  self:OnHideBtnClickedImp(UIConst.PhotoCameraHiddenButton.NPC, self.CharType.NPC)
end

function M:OnHideMonsterBtnClicked()
  self:OnHideBtnClickedImp(UIConst.PhotoCameraHiddenButton.Monster, self.CharType.Monster)
end

function M:OnHidePetBtnClicked()
  self:OnHideBtnClickedImp(UIConst.PhotoCameraHiddenButton.Pet, self.CharType.Pet)
end

function M:OnHideBtnClickedImp(HiddenButtonType, CharacterType)
  if self[HiddenButtonType].bLocked then
    return
  end
  self:SetCharHiddengState(CharacterType ~ self.CurCharHiddenState)
  self[HiddenButtonType]:SetHiddenState(0 ~= CharacterType & self.CurCharHiddenState)
  self:UpdateCheckBox()
end

function M:SetCharHiddengState(CharHiddenState)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click", "Camera_HideCharacter", nil)
  self.bHasAnyOperation = true
  self:HideChar(CharHiddenState)
  self:HidePlayer(CharHiddenState)
  self:HideNPC(CharHiddenState)
  self:HideMonster(CharHiddenState)
  self:HidePet(CharHiddenState)
  self.CurCharHiddenState = CharHiddenState
end

function M:HideChar(HiddenState)
  if self.CharType.Char & HiddenState ~= self.CharType.Char & self.CurCharHiddenState then
    local bHide = 0 ~= self.CharType.Char & HiddenState
    self.Player:SetActorHideTag("CameraScreenshot", bHide)
    self.Player:HideAllEffectCreature("CameraScreenshot", bHide)
  end
end

function M:HidePlayer(HiddenState)
  if self.CharType.Player & HiddenState ~= self.CharType.Player & self.CurCharHiddenState then
    local bHide = 0 ~= self.CharType.Player & HiddenState
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    local GamePlayers = GameState and GameState:GetAllOtherPlayers():ToTable()
    for Index, OtherPlayer in pairs(GamePlayers) do
      if OtherPlayer ~= self.Player and IsValid(OtherPlayer) then
        if OtherPlayer.SetActorHideTag then
          OtherPlayer:SetActorHideTag("CameraScreenshot", bHide)
        end
        if OtherPlayer.HideAllEffectCreature then
          OtherPlayer:HideAllEffectCreature("CameraScreenshot", bHide)
        end
      end
    end
  end
end

function M:HideNPC(HiddenState)
  if self.CharType.NPC & HiddenState ~= self.CharType.NPC & self.CurCharHiddenState then
    local bHide = 0 ~= self.CharType.NPC & HiddenState
    local GameInstance = GWorld.GameInstance
    local GameState = UE4.UGameplayStatics.GetGameState(GameInstance)
    if not GameState then
      return
    end
    local NpcMap = GameState.NpcMap:ToTable()
    for _, entity in pairs(NpcMap) do
      if IsValid(entity) then
        entity:SetActorHideTag("CameraScreenshot", bHide)
      end
    end
    local CustomNpcSet = GameState.CustomNpcSet:ToTable()
    for _, entity in pairs(CustomNpcSet) do
      if IsValid(entity) then
        entity:SetCustomNpcHideTag("CameraScreenshot", bHide)
      end
    end
    local PetsMap = GameState.PetCharacterMap:ToTable()
    for _, entity in pairs(PetsMap) do
      if IsValid(entity) then
        entity:SetActorHideTag("CameraScreenshot", bHide)
      end
    end
  end
end

function M:HideMonster(HiddenState)
  if self.CharType.Monster & HiddenState ~= self.CharType.Monster & self.CurCharHiddenState then
    local bHide = 0 ~= self.CharType.Monster & HiddenState
    local GameInstance = GWorld.GameInstance
    local GameState = UE4.UGameplayStatics.GetGameState(GameInstance)
    if not GameState then
      return
    end
    local Entities = GameState.MonsterMap:ToTable()
    for _, entity in pairs(Entities) do
      if entity.IsMonster and entity:IsMonster() then
        if entity.SetActorHideTag then
          entity:SetActorHideTag("CameraScreenshot", bHide)
        else
          entity:SetActorHiddenInGame(bHide)
        end
      end
    end
  end
end

function M:HidePet(HiddenState)
  if self.CharType.Pet & HiddenState ~= self.CharType.Pet & self.CurCharHiddenState then
    local bHide = 0 ~= self.CharType.Pet & HiddenState
    local BattlePet = self.Player:GetBattlePet()
    if BattlePet then
      BattlePet:HideBattlePet("CameraScreenshot", bHide)
    end
  end
end

function M:ResetCamera()
  AudioManager(self):PlayUISound(self, "event:/ui/common/camera_reset", "Camera_ResetCamera", nil)
  self.bHasAnyOperation = true
  if self.CurCameraIndex and self["ResetCamera" .. self.CurCameraIndex] then
    self["ResetCamera" .. self.CurCameraIndex](self)
  end
  self:ResetFocalLength()
  self:ResetRollScrollBar()
end

function M:ResetCamera0()
  local OriRotation
  if self.LookAtTargetName and self.TargetActors[self.LookAtTargetName] then
    local LookAtTarget = self.TargetActors[self.LookAtTargetName]
    OriRotation = UKismetMathLibrary.FindLookAtRotation(self.Camera:K2_GetActorLocation(), LookAtTarget:K2_GetActorLocation())
  else
    OriRotation = UKismetMathLibrary.Quat_Rotator(self.OriginalCameraTransform.Rotation)
  end
  local OriLocation = self.OriginalCameraTransform.Translation
  Rotation.Roll = OriRotation.Roll
  Rotation.Pitch = OriRotation.Pitch
  Rotation.Yaw = OriRotation.Yaw
  self.Camera:SetRotation(Rotation)
  Position.X = OriLocation.X
  Position.Y = OriLocation.Y
  Position.Z = OriLocation.Z
  if self.InitParams.bUseStartPos then
    self.Camera:SetLocation(Position)
  else
    UKismetSystemLibrary.SphereTraceSingle(self, self.TraceStartLocation, Position, self.CameraProbeSize, UE4.ETraceTypeQuery.Camera, false, self.ActorsToIgnore, 0, HitResult, true)
    if HitResult.bBlockingHit then
      self.Camera:SetLocation(HitResult.Location)
    else
      self.Camera:SetLocation(Position)
    end
  end
end

function M:ResetCamera1()
  local StartLoc = self.TraceStartLocation
  local StartRot
  local DesiredLoc = FVector(0, 0, 0)
  if self.Player.Mesh then
    DesiredLoc = self.Player.Mesh:GetSocketLocation("Sight")
    StartRot = self.Player.Mesh:K2_GetComponentRotation()
  else
    StartRot = self.Player.CapsuleComponent:K2_GetComponentRotation()
    StartRot.Yaw = StartRot.Yaw - 90
  end
  local Forward = self.PlayerForward
  local LookAtRotation = UKismetMathLibrary.FindLookAtRotation(Forward + StartLoc, StartLoc)
  DesiredLoc = DesiredLoc + UKismetMathLibrary.GreaterGreater_VectorRotator(self.PortraitCameraOffset, StartRot)
  self.Camera:SetRotation(LookAtRotation)
  UKismetSystemLibrary.SphereTraceSingle(self, StartLoc, DesiredLoc, self.CameraProbeSize, UE4.ETraceTypeQuery.Camera, false, self.ActorsToIgnore, 0, HitResult, true)
  if HitResult.bBlockingHit then
    self.Camera:SetLocation(HitResult.Location)
  else
    self.Camera:SetLocation(DesiredLoc)
  end
end

function M:ResetCamera2()
  local StartLoc = self.TraceStartLocation
  local StartRot
  local DesiredLoc = FVector(0, 0, 0)
  if self.Player.Mesh then
    DesiredLoc = self.Player.Mesh:GetSocketLocation("Sight")
    StartRot = self.Player.Mesh:K2_GetComponentRotation()
  else
    StartRot = self.Player.CapsuleComponent:K2_GetComponentRotation()
    StartRot.Yaw = StartRot.Yaw - 90
  end
  local Forward = self.Player:GetActorForwardVector()
  local LookAtRotation = UKismetMathLibrary.FindLookAtRotation(StartLoc, Forward + StartLoc)
  DesiredLoc = DesiredLoc + UKismetMathLibrary.GreaterGreater_VectorRotator(self.FreeCameraOffset, StartRot)
  self.Camera:SetRotation(LookAtRotation)
  UKismetSystemLibrary.SphereTraceSingle(self, StartLoc, DesiredLoc, self.CameraProbeSize, UE4.ETraceTypeQuery.Camera, false, self.ActorsToIgnore, 0, HitResult, true)
  if HitResult.bBlockingHit then
    self.Camera:SetLocation(HitResult.Location, false, nil, false)
  else
    self.Camera:SetLocation(DesiredLoc, false, nil, false)
  end
end

function M:ResetFocalLength()
  if self.InitFocalLength then
    self.Camera.OriginalFocalLengths[1] = self.InitFocalLength
  end
  self.Camera:ResetFocalLength()
  if self.FocalLengthSlider then
    local MinFocalLength, MaxFocalLength = self.Camera:GetFocalLengthRange()
    if MinFocalLength < self.MinFocalLength then
      MinFocalLength = self.MinFocalLength
    end
    MaxFocalLength = self.MaxFocalLength
    self.SliderClickInterval = 1
    self.FocalLengthSlider:InitSliderValue(self.Camera:GetActiveCamera().CurrentFocalLength, MinFocalLength, MaxFocalLength, self.SliderClickInterval)
  end
end

function M:ResetRollScrollBar()
  if self.RollScrollBar then
    self.RollScrollBar:Init(self.RollScrollMin, self.RollScrollMax, 10)
  end
end

function M:ChangeCamera(CameraIndex)
  self.bHasAnyOperation = true
  AudioManager(self):PlayUISound(self, "event:/ui/common/camera_mode_switch", "Camera_ChangeCamera", nil)
  if IsValid(self.Camera) then
    self.CameraTrans[self.CurCameraIndex + 1] = {
      Location = self.Camera:K2_GetActorLocation(),
      Rotation = self.Camera:K2_GetActorRotation()
    }
    self.CurCameraIndex = CameraIndex
    self.Camera:SetActiveCamera(CameraIndex)
    if not self.CameraTrans[CameraIndex + 1] then
      self:ResetCamera()
      return
    else
      local TransInfo = self.CameraTrans[self.CurCameraIndex + 1]
      self.Camera:SetLocation(TransInfo.Location)
      self.Camera:SetRotation(TransInfo.Rotation)
      local CameraComponent = self.Camera:GetActiveCamera()
      self.FocalLengthSlider:SetSliderValue(CameraComponent.CurrentFocalLength)
      self.RollScrollBar:SetScrollPercent(self:CalcRollPercent(TransInfo.Rotation.Roll))
    end
  end
end

function M:Screenshot()
  if self.bSelfHidden then
    return
  end
  if not self.IsShotTargetSucceeded then
    self.IsShotTargetSucceeded = self.bHasFoundTargets
  end
  if self.IsShotTargetSucceeded then
    UIManager(self):ShowUITip("CommonTopTips", string.format(GText("UI_CameraSystem_QuestFinished_Default")))
    self.Text_FindTarget:SetText(GText("UI_CameraSystem_QuestFinished_Default"))
    self.Panel_FailToast:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Panel_SuccessToast:SetVisibility(UIConst.VisibilityOp.Visible)
    self.bHasFoundTargets = true
    if self.OnShotTargetSuccess then
      self.OnShotTargetSuccess()
    end
  end
  local CacheValue = EMCache:Get("ScreenQuality") or 1
  local GameUserSettings = UGameUserSettings.GetGameUserSettings()
  local ScreenResolution = GameUserSettings:GetScreenResolution()
  if ScreenResolution then
    DebugPrint("ScreenResolution get success")
  end
  DebugPrint("Current Screen Resolution: " .. ScreenResolution.X .. "x" .. ScreenResolution.Y)
  local DesktopResolution = GameUserSettings:GetDesktopResolution()
  DebugPrint("Current DesktopResolution: " .. DesktopResolution.X .. "x" .. DesktopResolution.Y)
  local AspectRatio = ScreenResolution.X / ScreenResolution.Y
  local Height = 1080
  local Width = math.floor(Height * AspectRatio)
  if Height > Width then
    Width = 1080
    Height = math.floor(Width / AspectRatio)
  end
  Width = math.floor(Width * CacheValue)
  Height = math.floor(Height * CacheValue)
  DebugPrint("Final Screenshot Resolution: " .. Width .. "x" .. Height)
  local Action = UE4.UAsyncHighResScreenshotAction.HighResScreenshotToColors(self, Width, Height)
  Action.ToColors:Add(self, self.OnScreenshotEnd)
end

function M:OnScreenshotEnd(Width, Height, Colors)
  local Image = ULowEntryExtendedStandardLibrary.PixelsToTexture2D(Width, Height, Colors)
  if not IsValid(Image) then
    return
  end
  self:ShowScreenshotWidget(Image)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:ServerTargetFinish(CommonConst.TargetTakePhotoCount, -1, 1)
  end
  EventManager:FireEvent(EventID.OnScreenshotToken)
  HeroUSDKSubsystem(self):UploadTrackLog_Lua("camera_use")
end

function M:ShowScreenshotWidget(Image)
  if not IsValid(self.ScreenshotWidget) then
    local Widget = UIManager(self):CreateWidget(UIConst.ScreenshotWidget)
    self.ScreenshotWidget = Widget
    self.Main:AddChild(Widget)
    local CanvasSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(Widget)
    local Anchors = FAnchors()
    Anchors.Minimum = FVector2D(0, 0)
    Anchors.Maximum = FVector2D(1, 1)
    CanvasSlot:SetAnchors(Anchors)
    CanvasSlot:SetOffsets(FMargin(0, 0, 0, 0))
  end
  if IsValid(self.ScreenshotWidget) then
    self.ScreenshotWidget:Init(Image, self, self.OnScreenshotWidgetHidden)
    self.bScreenshotWidgetShow = true
  end
end

function M:OnScreenshotWidgetHidden(bSaved)
  if bSaved then
    self.bHasAnyOperation = false
  end
  self.bScreenshotWidgetShow = false
  self:SetFocus()
end

function M:MoveCamera(X, Y, Z)
  if self.bLockCameraPos then
    return
  end
  self.bHasAnyOperation = true
  X = X * self.CameraMoveSpeedX
  Y = Y * self.CameraMoveSpeedY
  Z = Z * self.CameraMoveSpeedZ
  self.Camera:Move(X, Y, Z, self.ActorsToIgnore)
end

function M:SetFocalLength(FocalLength)
  self.bHasAnyOperation = true
  local CameraComponent = self.Camera:GetActiveCamera()
  FocalLength = math.clamp(FocalLength, self.MinFocalLength, self.MaxFocalLength)
  local BeforFocalLength = CameraComponent.CurrentFocalLength
  CameraComponent:SetCurrentFocalLength(FocalLength)
  if CameraComponent.CurrentFocalLength ~= BeforFocalLength then
    AudioManager(self):PlayUISound(self, "event:/ui/common/slider_value_change", "Camera_FocalLength", nil)
    AudioManager(self):PlayUISound(self, "event:/ui/common/camera_move_scale_change", "Camera_Move_Scale_Change", nil)
  end
end

function M:RotateCamera(Roll, Pitch, Yaw)
  self.bHasAnyOperation = true
  Roll = Roll * self.RollSpeed
  Pitch = Pitch * -self.PitchSpeed
  Yaw = Yaw * self.YawSpeed
  self.Camera:Rotate(Roll, Pitch, Yaw)
end

function M:RotateCameraRoll(Roll)
  self.bHasAnyOperation = true
  if 0 ~= Roll then
    AudioManager(self):PlayUISound(self, "event:/ui/common/camera_scale_change", "Camera_Roll", nil)
    self:PlayMotorSound("Camera_Motor")
    self.Camera.DesiredRotation.Roll = math.floor(self.Camera.DesiredRotation.Roll + Roll * self.RollSpeed + 0.5)
    if self.Camera.DesiredRotation.Roll <= -180 then
      self.Camera.DesiredRotation.Roll = math.max(-179.89999, self.Camera.DesiredRotation.Roll)
    elseif self.Camera.DesiredRotation.Roll >= 180 then
      self.Camera.DesiredRotation.Roll = math.min(179.89999, self.Camera.DesiredRotation.Roll)
    end
    self.Camera.CurRotation.Roll = self.Camera.DesiredRotation.Roll
    self.Camera:SetRotation(self.Camera.CurRotation)
    self.RollScrollBar:SetScrollPercentWithAnim(self:CalcRollPercent(self.Camera.DesiredRotation.Roll))
  end
end

function M:CalcRollPercent(Roll)
  Roll = UKismetMathLibrary.NormalizeAxis(Roll)
  if Roll > 0 then
    return Roll / self.RollScrollMax * 0.5 + 0.5
  else
    return 0.5 - Roll / self.RollScrollMin * 0.5
  end
end

function M:SetRollPercent(Percent)
  self.bHasAnyOperation = true
  AudioManager(self):PlayUISound(self, "event:/ui/common/camera_scale_change", "Camera_Roll", nil)
  self:PlayMotorSound("Camera_Motor")
  local DesiredRoll
  if Percent > 0.5 then
    DesiredRoll = self.RollScrollMax * ((Percent - 0.5) / 0.5)
  else
    DesiredRoll = self.RollScrollMin * ((0.5 - Percent) / 0.5)
  end
  self.Camera.DesiredRotation.Roll = DesiredRoll
  self.Camera:SetRotation(self.Camera.DesiredRotation)
end

function M:OnRollScrollBarInertialScrollingEnd()
  self:RoundRoll()
end

function M:RoundRoll()
  self.Camera.DesiredRotation.Roll = math.floor(self.Camera.DesiredRotation.Roll + 0.5)
  self.Camera:SetRotation(self.Camera.DesiredRotation)
  self.RollScrollBar:SetScrollPercent(self:CalcRollPercent(self.Camera.DesiredRotation.Roll))
end

function M:CheckHasAnyOperationOrClose()
  self.AudioManager:PlayUISound(self, "event:/ui/common/click_btn_return", "Camera_Close", nil)
  if self.bSelfHidden then
    self:OnHideUIKeyDown()
  elseif self.bHasAnyOperation then
    local function func1()
    end
    
    local function func2()
      self:Close()
    end
    
    local Params = {
      LeftCallbackFunction = func1,
      CloseBtnCallbackFunction = func1,
      RightCallbackFunction = func2
    }
    UIManager(self):ShowCommonPopupUI(100087, Params, self)
  else
    self:Close()
  end
end

function M:Close()
  self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  for key, value in pairs(self.SoundPaths) do
    self.AudioManager:StopSound(self, key)
  end
  for _, value in pairs(UIConst.PhotoCameraHiddenButton) do
    self[value].bLocked = false
  end
  M.Super.Close(self)
end

function M:Destruct()
  self:SetCharHiddengState(0)
  self.Player:SetActorHideTag("CameraScreenshotTick", false)
  self:RecoverActorTickableState()
  if IsValid(self.Camera) then
    self.Camera:K2_DestroyActor()
  end
  M.Super.Destruct(self)
  if self.CloseCallback then
    local function OnUnloadUI(_self, UIName)
      if UIName == self.WidgetName then
        EventManager:RemoveEvent(EventID.UnLoadUI, _self)
        
        self.CloseCallback({
          IsSucceeded = self.IsShotTargetSucceeded
        })
      end
    end
    
    EventManager:AddEvent(EventID.UnLoadUI, self, OnUnloadUI)
  end
  if self.InitParams ~= nil or self.InitParams ~= {} then
    self:UISetGamePaused(self.WidgetName or self.ConfigName, false)
  end
end

function M:SaveAndSetNPCTickableState()
  self.ActorTickableStates = {}
  local GameInstance = GWorld.GameInstance
  local GameState = UE4.UGameplayStatics.GetGameState(GameInstance)
  if not GameState then
    return
  end
  local NpcCharacterMap = GameState.NpcCharacterMap:ToTable()
  for _, entity in pairs(NpcCharacterMap) do
    self:SaveAndSetActorTickableState(entity, self.ActorTickableStates)
  end
  local CustomNpcSet = GameState.CustomNpcSet:ToTable()
  for _, entity in pairs(CustomNpcSet) do
    self:SaveAndSetActorTickableState(entity, self.ActorTickableStates)
  end
end

function M:SaveAndSetActorTickableState(TargetActor, TickableStates)
  if not IsValid(TargetActor) then
    return
  end
  TickableStates[TargetActor] = TargetActor:GetTickableWhenPaused()
  TargetActor:SetTickableWhenPaused(false)
  local Components = TargetActor:K2_GetComponentsByClass(UActorComponent:StaticClass())
  if Components then
    for _, _Component in pairs(Components) do
      _Component:SetTickableWhenPaused(false)
    end
  end
  if URuntimeCommonFunctionLibrary.ObjIsChildOf(TargetActor, ACharacterBase) then
    local Attaches = TargetActor:GetAllAttaches()
    for _, Actor in pairs(Attaches) do
      self:SaveAndSetActorTickableState(Actor, TickableStates)
    end
  end
end

function M:RecoverActorTickableState()
  for actor, bTickable in pairs(self.ActorTickableStates) do
    if IsValid(actor) then
      actor:SetTickableWhenPaused(bTickable)
      local Components = actor:K2_GetComponentsByClass(UActorComponent:StaticClass())
      if Components then
        for _, _Component in pairs(Components) do
          _Component:SetTickableWhenPaused(bTickable)
        end
      end
    end
  end
end

function M:NotifyGamePauseChange(IsGamePause)
  self:UISetGamePaused(self.WidgetName or self.ConfigName, IsGamePause)
end

function M:SetLockGamePause(bNewLock)
  if bNewLock then
    self.Btn_Pause:RemoveAllBtnEvents()
    self.Btn_Pause:AddBtnEvent("OnClicked", self, self.OnGamePauseBtnLockedClick)
  else
    self.Btn_Pause:RemoveBtnEvent("OnClicked", self.OnGamePauseBtnLockedClick)
    self.Btn_Pause:AddAllBtnEvents()
  end
  local TxtOpacity = bNewLock and 0.7 or 1
  self.Btn_Pause:SetRenderOpacity(TxtOpacity)
  self.Text_Pause:SetOpacity(TxtOpacity)
end

function M:SetLockHiddenButton(HiddenButton, bNewLock)
  if nil == HiddenButton then
    return
  end
  self[HiddenButton]:SetLockState(bNewLock)
  local TxtOpacity = bNewLock and 0.7 or 1
  self.Btn_AISetting:SetRenderOpacity(TxtOpacity)
  self.Text_Hide_All:SetOpacity(TxtOpacity)
end

function M:SetLockAllHiddenButton(bNewLock)
  for _, value in pairs(UIConst.PhotoCameraHiddenButton) do
    self:SetLockHiddenButton(value, bNewLock)
  end
end

function M:SetLockHiddenAllButton(bNewLock)
  if bNewLock then
    self.Btn_AISetting:RemoveAllBtnEvents()
    self.Btn_AISetting:AddBtnEvent("OnClicked", self, self.OnHiddenAllBtnLockedClick)
  else
    self.Btn_AISetting:RemoveBtnEvent("OnClicked", self.OnHiddenAllBtnLockedClick)
    self.Btn_AISetting:AddAllBtnEvents()
  end
  self.bAllHiddenButtonLocked = bNewLock
end

function M:SetLockCameraPos(bNewLock)
  self.bLockCameraPos = bNewLock
end

function M:OnGamePauseBtnLockedClick()
  self:PlayAnimation(self.Pause_Warning)
end

function M:OnHiddenAllBtnLockedClick()
  self:PlayAnimation(self.AllHide_Warning)
end

return M
