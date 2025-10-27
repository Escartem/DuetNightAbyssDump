require("UnLua")
require("DataMgr")
local ExpressionComp_C = require("BluePrints.Story.Talk.Controller.ExpressionComp")
local WBP_GuideTextBox_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_GuideTextBox_C:Initialize(Initializer)
  WBP_GuideTextBox_C.Super.Initialize(self, Initializer)
end

function WBP_GuideTextBox_C:Construct()
  self.GuideManIdx = 0
  self.GuideManInfos = {}
  self.ExpressionComp = ExpressionComp_C.New()
  self.LastGuideManActor = nil
  self.bIsFocusable = true
  self:SetKeyboardFocus()
  for i = 0, 10 do
    self:AddTimer(0.05 * i, self.SetKeyboardFocus)
  end
  WBP_GuideTextBox_C.Super.Construct(self)
  self.IsDestroied = false
  self:InitListenEvent()
  self:SetFocus()
end

function WBP_GuideTextBox_C:Destruct()
  WBP_GuideTextBox_C.Super.Destruct(self)
  if self.IsTimePause then
    self:UISetGamePaused("GuideTextBox", false)
  end
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
  local GameInstance = GWorld.GameInstance
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  self:SetInputUIOnly(false)
  if PlayerCharacter then
    PlayerCharacter:RemoveDisableInputTag("ResetPlayerState")
  end
end

function WBP_GuideTextBox_C:GuideUIInit_TextGuide(UIKey, MessageId, GuidemanHead, GuideManPosEnum, Time, ExecuteLogic, IsTimeDilation, IsForceClick, IsResetPlayer, IsForbidInAnim, IsForbidOutAnim)
  self:AddGuideMessage(UIKey, MessageId, IsTimeDilation, GuidemanHead, GuideManPosEnum, IsResetPlayer, IsForbidInAnim, IsForbidOutAnim)
end

function WBP_GuideTextBox_C:Hide(HideTag)
  AudioManager(self):PauseObjectAllEvent(self, true)
  if self.IgnoreHideTags and CommonUtils.HasValue(self.IgnoreHideTags, HideTag) then
    return
  end
  HideTag = HideTag or "DefaultTag"
  self:SetUIVisibilityTag(HideTag, true)
  self:SetInputUIOnly(false)
  if self.IsUIPopUp == true then
    UIManager(self):OpenResidentUI(self.WidgetName)
  end
  if self.IsTimePause then
    self:UISetGamePaused(self.WidgetName or self.ConfigName, false)
  end
  if self.KeyboardSetName and self.IsBanningAction then
    UIManager(self):SetBannedActionCallback(self.KeyboardSetName, false, self:GetName())
    self.IsBanningAction = nil
  end
end

function WBP_GuideTextBox_C:Show(ShowTag)
  AudioManager(self):PauseObjectAllEvent(self, false)
  ShowTag = ShowTag or "DefaultTag"
  self:SetUIVisibilityTag(ShowTag, false)
  self:SetInputUIOnly(true)
  if self.IsUIPopUp == true then
    UIManager(self):CloseResidentUI(self.WidgetName)
  end
  if self.IsTimePause then
    self:UISetGamePaused(self.WidgetName or self.ConfigName, true)
  end
  if self.KeyboardSetName and not self.IsBanningAction then
    UIManager(self):SetBannedActionCallback(self.KeyboardSetName, true, self:GetName())
    self.IsBanningAction = true
  end
end

function WBP_GuideTextBox_C:AddGuideMessage(UIKey, MessageId, IsTimePause, GuidemanHead, GuideManPosEnum, IsResetPlayer, IsForbidInAnim, IsForbidOutAnim)
  self.IsForbidInAnim = IsForbidInAnim
  self.IsForbidOutAnim = IsForbidOutAnim
  self.MessageId = MessageId
  self.UIKey = UIKey
  self.IsTimePause = IsTimePause
  self.Btn_Confirm:SetGamePadImg("A")
  local TextMapId = CommonUtils.ChooseOptionByPlatform(DataMgr.Message[MessageId].MessageContentPC, DataMgr.Message[MessageId].MessageContentPhone)
  local TitleId = DataMgr.Message[MessageId].MessageTitlePC
  local MessageContent = GText(TextMapId)
  local TitleContent = GText(TitleId)
  self.TitleContent = TitleContent
  self.Text_Guide_Name:SetText(TitleContent)
  self.Btn_Confirm:SetGamePadIconVisible(true)
  
  local function ParseActionMapContent(SourceContent)
    local FirstIndex = string.find(SourceContent, "&")
    if not FirstIndex then
      return SourceContent
    end
    local SecondIndex = string.find(SourceContent, "&", FirstIndex + 1)
    local ActionContent = string.sub(SourceContent, FirstIndex + 1, SecondIndex - 1)
    local ActionMapContent = GText(DataMgr.KeyboardMap[ActionContent].Key)
    local sub1 = string.sub(SourceContent, 1, FirstIndex - 1)
    local sub2 = string.sub(SourceContent, SecondIndex + 1)
    return sub1 .. ActionMapContent .. sub2
  end
  
  MessageContent = ParseActionMapContent(MessageContent)
  self.Text_Content:SetText(MessageContent)
  self:PlayInAnimation()
  local GameInputSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  self.PreMode = GameInputSubsystem:GetCurrentInputMode()
  self:SetInputUIOnly(true)
  if self.IsTimePause then
    self:UISetGamePaused("GuideTextBox", true)
  end
  self.Btn_Confirm:SetText(GText("UI_LOGIN_ENSURE"))
  self.Btn_Confirm:BindEventOnClicked(self, self.PlayOutAnimation)
  DebugPrint("WBP_GuideTextBox_C:GuideUIInit_TextGuide: GuideManPosEnum", GuideManPosEnum)
  self:SetGuideCanvasRelativePosition(GuideManPosEnum)
  self:PlayTextGuide(GuidemanHead)
  if IsResetPlayer then
    local GameInstance = GWorld.GameInstance
    local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
    local Battle = Battle(PlayerCharacter)
    local TraceInfo = "From WBP_GuideTextBox_C:AddGuideMessage"
    if PlayerCharacter:CharacterInTag("Idle") == false or false == Battle:CheckConditionNew(11, PlayerCharacter, nil, TraceInfo) then
      self:BlackScreenUIFadeIn()
    end
  end
end

function WBP_GuideTextBox_C:BlackScreenUIFadeIn()
  self.OriginalVisibility = self:GetVisibility()
  self:SetVisibility(UE4.ESlateVisibility.Hidden)
  local GameInstance = GWorld.GameInstance
  local UIManger = GameInstance:GetGameUIManager()
  local Params = {}
  Params.InAnimationObj = self
  Params.InAnimationCallback = self.ResetPlayerStateStart
  Params.InAnimationPlayTime = 0.5
  Params.BlackScreenHandle = "GuideTextBox"
  Params.OutAnimationObj = self
  Params.OutAnimationCallback = self.ResetPlayerStateEnd
  Params.OutAnimationPlayTime = 0.5
  UIManger:ShowCommonBlackScreen(Params)
  self:AddTimer(1, function()
    UIManger:HideCommonBlackScreen("GuideTextBox")
  end)
end

function WBP_GuideTextBox_C:BlackScreenUIFadeOut()
  self:SetVisibility(self.OriginalVisibility)
  Params.InAnimationObj = self
  Params.InAnimationCallback = self.ResetPlayerStateStart
  Params.InAnimationPlayTime = 0.5
  UIManger:ShowCommonBlackScreen(Params)
end

function WBP_GuideTextBox_C:ResetPlayerStateStart()
  DebugPrint("==========================================================ResetPlayerStateStart")
  local GameInstance = GWorld.GameInstance
  local GameMode = UE4.UGameplayStatics.GetGameMode(GameInstance)
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  GameMode:KillHatredMonsters()
  local Transform = PlayerCharacter:GetTransform()
  Transform.Translation = PlayerCharacter:GetLastSafeLocation()
  Transform.Translation.Z = Transform.Translation.Z + PlayerCharacter.OriginHalfHeight
  GameMode:TriggerFallingCallable(PlayerCharacter, Transform, 10000, false)
  GameMode:SwitchToQuestRole(0)
  if self.IsTimePause then
    self:UISetGamePaused("GuideTextBox", false)
  end
  PlayerCharacter:AddDisableInputTag("ResetPlayerState")
end

function WBP_GuideTextBox_C:ResetPlayerStateEnd()
  DebugPrint("==========================================================ResetPlayerStateEnd")
  local GameInstance = GWorld.GameInstance
  local GameMode = UE4.UGameplayStatics.GetGameMode(GameInstance)
  if self.IsTimePause then
    self:UISetGamePaused("GuideTextBox", true)
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  PlayerCharacter:RemoveDisableInputTag("ResetPlayerState")
  if self.BlackScreenUI ~= nil then
    self.BlackScreenUI:RemoveFromViewport()
    self.BlackScreenUI = nil
  end
end

function WBP_GuideTextBox_C:SetGuideCanvasRelativePosition(GuideManPosEnum)
  local CanvasSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Panel_Guide)
  local ViewportSize = UIManager(self):GetViewportSize()
  local RelativePositionScaleTable = {
    Up = {x = 0, y = -0.1},
    Down = {x = 0, y = 0.1},
    Left = {x = -0.1, y = 0},
    Right = {x = 0.1, y = 0},
    Middle = {x = 0, y = 0},
    Upleft = {x = -0.1, y = -0.1},
    DownLeft = {x = -0.1, y = 0.1},
    UpRight = {x = 0.1, y = -0.1},
    DownRight = {x = 0.1, y = 0.1}
  }
  local ViewPortScale = UWidgetLayoutLibrary.GetViewportScale(self)
  DebugPrint("WBP_GuideTextBox_C:SetGuideCanvasRelativePosition:", ViewportSize, ViewportSize.X * RelativePositionScaleTable[GuideManPosEnum].x, ViewportSize.Y * RelativePositionScaleTable[GuideManPosEnum].y)
  CanvasSlot:SetPosition(FVector2D(ViewportSize.X / ViewPortScale * RelativePositionScaleTable[GuideManPosEnum].x, ViewportSize.Y / ViewPortScale * RelativePositionScaleTable[GuideManPosEnum].y))
end

function WBP_GuideTextBox_C:PlayTextGuide(GuidemanHead)
  self:MakeGuideManInfo(GuidemanHead)
end

function WBP_GuideTextBox_C:GetOrCreateNewGuideManInfo(GuidemanConfigId, GuidemanConfigData)
  if self.GuideManInfos[GuidemanConfigId] then
    local Info = self.GuideManInfos[GuidemanConfigId]
    return Info.GuideMan, Info.Idx, Info.DriveCameraConfig
  end
  
  local function JointFinalAnimPath(ModelId, Path, SubPath)
    local ModelData = DataMgr.Model[ModelId]
    local MontageFolder = ModelData.MontageFolder
    local Prefix = ModelData.MontagePrefix
    local SequenceFolder = string.gsub(MontageFolder, "Montage", "Sequence")
    return SequenceFolder .. SubPath .. "/" .. Prefix .. Path
  end
  
  local GuideManIdx = self.GuideManIdx
  self.GuideManIdx = self.GuideManIdx + 1
  local Transform = FTransform(FRotator(0, 0, 0):ToQuat(), FVector(0, 0 + GuideManIdx * 10000, -50000))
  local GuideMan
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  
  local function LoadFinishCallback(Unit)
    GuideMan = Unit
  end
  
  GameMode.EMGameState.EventMgr:CreateAIUnit({
    UnitId = GuidemanConfigData.NpcId,
    RoleId = GuidemanConfigData.NpcId,
    UnitType = "Npc",
    Loc = FVector(Transform.Translation.X, Transform.Translation.Y, Transform.Translation.Z),
    ActorPath = "Blueprint'/Game/AssetDesign/Char/Npc/GuideMan/BP_GuideMan.BP_GuideMan_C'",
    LoadFinishCallback = LoadFinishCallback
  }, true)
  local NpcData = DataMgr.Npc[GuidemanConfigData.NpcId]
  local MeshPath = GuidemanConfigData.OverrideNpcMeshPath or DataMgr.Model[NpcData.ModelId].SkeletonMeshPath
  local TargetMesh = LoadObject("/Game/" .. MeshPath)
  local CaptureTargetMesh = LoadObject("/Game/AssetDesign/Char/Npc/GuideMan/RT_GuideTextNodeMan.RT_GuideTextNodeMan")
  GuideMan.Mesh:SetSkeletalMesh(TargetMesh)
  GuideMan.CaptureCam.TextureTarget = CaptureTargetMesh
  GuideMan.CaptureCam:ShowOnlyComponent(GuideMan.Mesh)
  GuideMan.CaptureCam:ShowOnlyComponent(GuideMan.ExpressionMask)
  GuideMan.CaptureCam:ShowOnlyComponent(GuideMan.Sphere)
  local AnimInstance = GuideMan.Mesh:GetAnimInstance()
  if AnimInstance then
    local FinalAnimPath = JointFinalAnimPath(NpcData.ModelId, GuidemanConfigData.GuidemanDefaultActionPath, "Interactive")
    local DefaultAnim = LoadObject(FinalAnimPath)
    if not DefaultAnim then
      FinalAnimPath = JointFinalAnimPath(NpcData.ModelId, GuidemanConfigData.GuidemanDefaultActionPath, "Locomotion")
      DefaultAnim = LoadObject(FinalAnimPath)
    end
    DebugPrint("DefaultAnim", DefaultAnim, FinalAnimPath)
    AnimInstance:SetNpcDefaultAnimEnable(true)
    AnimInstance:SetNpcDefaultAnim(DefaultAnim)
  end
  local DriveCameraConfig = {
    CameraHeight = GuidemanConfigData.CameraHeight,
    CameraYaw = GuidemanConfigData.CameraYaw,
    CameraDistance = GuidemanConfigData.CameraDistance,
    SocketName = GuidemanConfigData.SocketName,
    CameraFOV = GuidemanConfigData.CameraFOV
  }
  self.GuideManInfos[GuidemanConfigId] = {
    GuideMan = GuideMan,
    Idx = GuideManIdx,
    DriveCameraConfig = DriveCameraConfig
  }
  return GuideMan, GuideManIdx, DriveCameraConfig
end

function WBP_GuideTextBox_C:CameraFocusActor(Idx, TalkActor, CameraParams)
  local SocketName = CameraParams.SocketName or "head"
  local SocketLoc = TalkActor.Mesh:GetSocketLocation(SocketName)
  local TalkActorRot = TalkActor:K2_GetActorRotation()
  local TalkActorLoc = TalkActor:K2_GetActorLocation()
  DebugPrint("CameraFocusActor", SocketLoc)
  local FinalLoc = UKismetMathLibrary.Add_VectorVector(FVector(SocketLoc.X, SocketLoc.Y, SocketLoc.Z + CameraParams.CameraHeight), UKismetMathLibrary.Multiply_VectorFloat(UKismetMathLibrary.Conv_RotatorToVector(FRotator(TalkActorRot.Pitch, TalkActorRot.Yaw - CameraParams.CameraYaw, TalkActorRot.Roll)), CameraParams.CameraDistance))
  local FinalRot = UKismetMathLibrary.FindLookAtRotation(FinalLoc, FVector(TalkActorLoc.X, TalkActorLoc.Y, FinalLoc.Z))
  DebugPrint("CameraFocusActor", SocketLoc, TalkActorRot, FinalRot, FinalLoc)
  if self.LastGuideManActor then
    self.LastGuideManActor.CaptureCam:SetComponentTickEnabled(false)
  end
  TalkActor.CaptureCam:SetComponentTickEnabled(true)
  DebugPrint("K2_SetWorldTransform", FinalLoc, FinalRot)
  TalkActor.CaptureCam:K2_SetWorldTransform(UE4.UKismetMathLibrary.MakeTransform(FinalLoc, FinalRot), false, nil, false)
  TalkActor.CaptureCam.FOVAngle = CameraParams.CameraFOV or 20
  self.LastGuideManActor = TalkActor
end

function WBP_GuideTextBox_C:GetImageWidget()
  return self.Img_Animation01
end

function WBP_GuideTextBox_C:MakeGuideManInfo(GuidemanHead)
  if nil == GuidemanHead or "" == GuidemanHead then
    self:GetImageWidget():SetVisibility(UE4.ESlateVisibility.Collapsed)
    if nil == self.TitleContent or "" == self.TitleContent then
      self.Line:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  else
    local Success = UIUtils.SwitchGuideHead(GuidemanHead, self.GuideManMID)
    if false == Success then
      self:GetImageWidget():SetVisibility(UE4.ESlateVisibility.Collapsed)
      if nil == self.TitleContent or "" == self.TitleContent then
        self.Line:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    else
      self:GetImageWidget():SetVisibility(UE4.ESlateVisibility.Visible)
    end
  end
end

function WBP_GuideTextBox_C:PlayInAnimation()
  local InAnimation = self.Auto_In
  self:PlayAnimation(InAnimation)
  DebugPrint("================WBP_GuideTextBox_C:PlayInAnimation==================", self.IsForbidInAnim)
  if self.IsForbidInAnim ~= true then
    self:PlayAnimation(self.Bg_In)
  else
    self.Bg_Black:SetRenderOpacity(1)
  end
end

function WBP_GuideTextBox_C:PlayOutAnimation()
  if self.IsPlayingOutAnimation then
    return
  end
  self.IsPlayingOutAnimation = true
  local TimerTime = 0
  local OutAnimation = self.Auto_Out
  self:PlayAnimation(OutAnimation)
  TimerTime = OutAnimation:GetEndTime() * UE4.UGameplayStatics.GetGlobalTimeDilation(self)
  self:AddTimer(TimerTime, self.Close)
  DebugPrint("================WBP_GuideTextBox_C:PlayOutAnimation==================", self.IsForbidOutAnim)
  if true ~= self.IsForbidOutAnim then
    self:PlayAnimation(self.Bg_Out)
  end
end

function WBP_GuideTextBox_C:Close()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  local IsNeedResetInputMode = false
  IsNeedResetInputMode = self.PreMode ~= EGameInputMode.UI and self.PreMode ~= EGameInputMode.GameAndUI
  IsNeedResetInputMode = true
  if IsNeedResetInputMode then
    self:SetInputUIOnly(false)
  else
    local TopUI = UIManger:GetTopUIModeUI(self)
    if nil ~= TopUI then
      DebugPrint("=SystemGuide==GuideTextBox==TopUI:SetKeyboardFocus=============TopUIName:", TopUI:GetName())
      TopUI:SetKeyboardFocus()
    end
  end
  if self.IsTimePause then
    self:UISetGamePaused("GuideTextBox", false)
  end
  UIManger:UnLoadUI(self.UIKey)
  if SystemGuideManager.RunningId > 0 then
    DebugPrint("GuideTextBox UploadTrackLog_Lua guide_step_client step_id:", SystemGuideManager.RunningId, "branch_guide_id:", self.MessageId)
    HeroUSDKSubsystem():UploadTrackLog_Lua("guide_step_client", {
      step_id = SystemGuideManager.RunningId,
      branch_guide_id = self.MessageId
    })
  end
  if self.OnGuideEnd:IsBound() then
    self.OnGuideEnd:Broadcast()
  end
  self.IsDestroied = true
end

function WBP_GuideTextBox_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function WBP_GuideTextBox_C:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_FaceButton_Bottom" == InKeyName then
    self:PlayOutAnimation()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function WBP_GuideTextBox_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_GuideTextBox_C:RefreshBaseInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function WBP_GuideTextBox_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
  else
    self:AddTimer(0.01, function()
      self.GameInputModeSubsystem:SetTargetUIFocusWidget(self)
    end)
  end
end

return WBP_GuideTextBox_C
