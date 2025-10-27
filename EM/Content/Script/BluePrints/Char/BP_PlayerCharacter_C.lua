require("UnLua")
require("DataMgr")
local Const = require("Const")
local EMCache = require("EMCache.EMCache")
local CommonUtils = require("Utils.CommonUtils")
local TimeUtils = require("Utils.TimeUtils")
local GMVariable = require("BluePrints.UI.GMInterface.GMVariable")
local StoryPlayableUtils = require("BluePrints.Story.StoryPlayableUtils").StoryPlayableUtils
local ForgeModel = require("Blueprints.UI.Forge.ForgeDataModel")
local AllPlayerBloodState = require("BluePrints.UI.BloodBar.BloodBarUtils").AllBloodState
local ChatController = require("BluePrints.UI.WBP.Chat.ChatController")
local MiscUtils = require("Utils.MiscUtils")
UE4.URegionPlayerManagerSubsystem.SetOnlyShowTeammate(EMCache:Get("HidePlayer"))
local BP_PlayerCharacter_C = Class("BluePrints.Char.BP_CharacterBase_C")
BP_PlayerCharacter_C._components = {
  "BluePrints.Char.CharacterComponent.PickupComponent",
  "BluePrints.Char.CharacterComponent.CameraComponent",
  "BluePrints.Char.CharacterComponent.CamPostProcessMgrComponent",
  "BluePrints.Char.CharacterComponent.AttackInputComponent",
  "BluePrints.Char.CharacterComponent.PlayerCommonInterface",
  "BluePrints.Char.CharacterComponent.NewBDCTrackComponent",
  "BluePrints.Char.CharacterComponent.CharacterPickupUseComponent",
  "BluePrints.Char.CharacterComponent.TeamRecoveryComponent",
  "BluePrints.Char.CharacterComponent.QTEComponent",
  "BluePrints.Char.CharacterComponent.CharMoveSyncMgr"
}

function BP_PlayerCharacter_C:Initialize(Initializer)
  self:PlayerCharacterInitialize()
end

function BP_PlayerCharacter_C:ReceiveBeginPlay()
  self:BeforeBeginPlay()
  self.Super.ReceiveBeginPlay(self)
  self:AfterBeginPlay()
  self.UpVector = FVector(0, 0, 1)
  self.IsNearDeath = false
  self.UpVector:Normalize()
  EventManager:AddEvent(EventID.SetDefaultWeapon, self, self.SetDefaultWeapon)
  EventManager:AddEvent(EventID.OnStartSkillFeature, self, self.OnSkillFeatureBegin)
  EventManager:AddEvent(EventID.CloseLoading, self, self.AfterLoading)
  EventManager:AddEvent(EventID.OnLevelDeliverBlackCurtainEnd, self, self.AfterLoading)
  EventManager:AddEvent(EventID.OnRepBulletNum, self, self.UpdateBulletNumUI)
  self:SetActorHideTag("login", true)
  self.DisableInputTags = TArray("")
  MiscUtils.InitializeSettings()
  self:RefreshTeamMemberInfo("ReceiveBeginPlay")
  if self:IsMainPlayer() then
    EventManager:FireEvent(EventID.OnMainCharacterBeginPlay)
    local IsOpenHelperAim = EMCache:Get("IsOpenHelperAim")
    self.IsOpenHelperAim = nil == IsOpenHelperAim and true or IsOpenHelperAim
    local IsOpenLockAim = EMCache:Get("IsOpenLockAim")
    self.IsOpenLockAim = nil == IsOpenLockAim and true or IsOpenLockAim
    self:UpdateOpenHelperAim(self.IsOpenHelperAim)
    self:InitGameSkillFaceTo()
    self:SetEnableFallAtkDir()
    self:SetRegionOnlineState()
  end
  self:SetUpAllTimer()
  self:SetGamepadFromCache()
  self:SetMobileRotationFromCache()
  self:SetMobileCameraSpringRate()
  self:BindControllerChangedDelegate()
  local Controller = self:GetController()
  if Controller then
    Controller:ShowFlags("VisualizeSkyVisibilityLightmap", false)
    Controller:ShowFlags("VisualizeBouncedSkyVisibilityLightmap", false)
  end
end

function BP_PlayerCharacter_C:BindControllerChangedDelegate()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  GameInstance.OnPawnControllerChangedDelegates:Add(self, self.OnPlayerControllerChanged)
end

function BP_PlayerCharacter_C:OnPlayerControllerChanged(Pawn, Controller)
  if Pawn == self and Controller and Controller:IsPlayerController() then
    if self.DisableInputTags:Length() > 0 then
      self:DisableInput(self:GetController())
    else
      self:EnableInput(self:GetController())
    end
  end
end

function BP_PlayerCharacter_C:SetGamepadFromCache()
  if not self:IsMainPlayer() then
    return
  end
  local GamepadLayout = EMCache:Get("GamepadLayout")
  DebugPrint("@zyh \232\142\183\229\143\150\229\136\176\231\154\132GamepadLayout", GamepadLayout)
  if not GamepadLayout then
    local DefaultLayout = tonumber(DataMgr.Option.GamepadPreset.DefaultValue)
    EMCache:Set("GamepadLayout", DefaultLayout)
    self:InitGamepadSet(DefaultLayout)
    self:InitReplaceGamepadSet(DefaultLayout)
  else
    self:InitGamepadSet(GamepadLayout)
    self:InitReplaceGamepadSet(GamepadLayout)
  end
end

function BP_PlayerCharacter_C:SwitchGamepadSet(KeySet)
  self:InitGamepadSet(KeySet)
  self:InitReplaceGamepadSet(KeySet)
  EventManager:FireEvent(EventID.OnSwitchGamepadSet)
end

function BP_PlayerCharacter_C:SetMobileRotationFromCache()
  if not self:IsMainPlayer() then
    return
  end
  local EnableMobileRotation = EMCache:Get("EnableMobileRotation")
  DebugPrint("@zyh \232\142\183\229\143\150\229\136\176\231\154\132EnableMobileRotation", EnableMobileRotation)
  if nil == EnableMobileRotation then
    local DefaultValue = DataMgr.Option.EnableMobileRotation.DefaultValueM
    local ToBool = "True" == DefaultValue and true or false
    EMCache:Set("EnableMobileRotation", ToBool)
    self.EnableMobileRotation = ToBool
  else
    self.EnableMobileRotation = EnableMobileRotation
  end
end

function BP_PlayerCharacter_C:SetMobileCameraSpringRate()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self.CameraSpringChangeRate = 0.01
  else
    self.CameraSpringChangeRate = 0.05
  end
end

function BP_PlayerCharacter_C:SwitchEnableMobileRotation(Value)
  self.EnableMobileRotation = Value
  EMCache:Set("EnableMobileRotation", Value)
end

function BP_PlayerCharacter_C:UpdateOpenHelperAim(IsOpen)
  self.IsOpenHelperAim = IsOpen
  self.CurShootingLocation = Const.ZeroVector
  EMCache:Set("IsOpenHelperAim", IsOpen)
end

function BP_PlayerCharacter_C:UpdateOpenLockAim(IsOpen)
  self.IsOpenLockAim = IsOpen
  self.CurShootingLocation = Const.ZeroVector
  EMCache:Set("IsOpenLockAim", IsOpen)
end

function BP_PlayerCharacter_C:InitGameSkillFaceTo()
  local OptionName = "SkillFaceTo"
  local GameSkillFaceTo = EMCache:Get(OptionName)
  local DefaultValue
  if nil == GameSkillFaceTo then
    local OptionInfo = DataMgr.Option[OptionName]
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" and OptionInfo.DefaultValueM then
      DefaultValue = OptionInfo.DefaultValueM
    else
      DefaultValue = OptionInfo.DefaultValue
    end
    if "True" == DefaultValue then
      GameSkillFaceTo = true
    else
      GameSkillFaceTo = false
    end
    EMCache:Set(OptionName, GameSkillFaceTo)
  end
  self:SetLockOrientpreference(GameSkillFaceTo)
end

function BP_PlayerCharacter_C:SetUpAllTimer()
  if self:IsMainPlayer() then
    self:AddTimer(1.0, self.UpdatePlayerBloodEffectInfo, true, 0, "UpdatePlayerBloodEffectInfo")
    local Avatar = GWorld:GetAvatar()
    if Avatar and Avatar:IsInBigWorld() then
      self:AddTimer(0.5, self.CalcCurrentPlayerRegionId, true)
    end
  end
end

function BP_PlayerCharacter_C:ShowCursor_Press()
  DebugPrint("ShowCursor_Press", UE4.UKismetSystemLibrary.GetFrameCount())
  local GameInputSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if not IsValid(GameInputSubsystem) then
    return
  end
  GameInputSubsystem:HandleShowCursorPressOrRelease(true)
end

function BP_PlayerCharacter_C:ShowCursor_Release()
  DebugPrint("ShowCursor_Release", UE4.UKismetSystemLibrary.GetFrameCount())
  local GameInputSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if not IsValid(GameInputSubsystem) then
    return
  end
  GameInputSubsystem:HandleShowCursorPressOrRelease(false)
end

function BP_PlayerCharacter_C:ShowCursorLock(bLock)
  self.bShowCursorLock = bLock
end

function BP_PlayerCharacter_C:ShowMonsterInfo()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  self.bShowMonsterInfo = not self.bShowMonsterInfo
  if self.bShowMonsterInfo then
    UIManager:LoadUI(UIConst.MONSTERINFOPANEL, "MonsterInfo", UIConst.ZORDER_FOR_DESKTOP_TEMP)
  else
    UIManager:UnLoadUI("MonsterInfo")
  end
  self:RemoveInputCache("ShowMonsterInfo")
end

function BP_PlayerCharacter_C:ChangeAspectAndFOV(ResolutionX, ResolutionY, bConstrainAspect)
end

function BP_PlayerCharacter_C:OpenMap()
  if TeamController:IsTeamPopupBarOpenInGamepad() then
    return
  end
  if not UIManager(self):TryOpenSystem("Map") then
    return
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if not UIManager then
    return
  end
  local battleMap
  local battleMain = UIManager:GetUI("BattleMain") or UIManager:GetUI("HomeBaseMain")
  if battleMain then
    battleMap = battleMain.Battle_Map or battleMain.Battle_Map_PC
  end
  if battleMap then
    battleMap:OnKeyboardClick()
  end
end

function BP_PlayerCharacter_C:StartOpenMap()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    local Avatar = GWorld:GetAvatar()
    if Avatar and Avatar:CheckUIUnlocked("Chat") then
      local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
      if BattleMainUI and BattleMainUI.Key_ChatEntry then
        self.Key_ChatEntry = BattleMainUI.Key_ChatEntry
        self.Key_ChatEntry:AddExecuteLogic(self, self.ChatUpdate)
        self.Key_ChatEntry:OnButtonPressed(nil, true, 0, 0.5)
        return
      end
    end
  end
  self:OpenMap()
end

function BP_PlayerCharacter_C:ClearChatEntryKey()
  self.Key_ChatEntry:RemoveExecuteLogic()
  self.Key_ChatEntry:OnButtonReleased()
  self.Key_ChatEntry = nil
end

function BP_PlayerCharacter_C:StopOpenMap()
  if self.Key_ChatEntry then
    self:ClearChatEntryKey()
    self:OpenMap()
  end
end

function BP_PlayerCharacter_C:ChatUpdate()
  self:ClearChatEntryKey()
  ChatController:OpenView(self, true)
end

function BP_PlayerCharacter_C:OpenBattleWheel()
  DebugPrint("gmy@OpenBattleWheel")
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return
  end
  local UIUnlockRule = DataMgr.UIUnlockRule
  local UIUnlockRuleId = UIUnlockRule.BattleWheel.UIUnlockRuleId
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local Controller = UE4.UGameplayStatics.GetPlayerController(GameInstance, 0)
  if Controller.bEnableBattleWheel then
    local bUnlocked = Avatar:CheckUIUnlocked(UIUnlockRuleId)
    DebugPrint("gmy@BattleMenu Unlocked", bUnlocked)
    if bUnlocked then
      local UIManager = GameInstance:GetGameUIManager()
      local BattleWheel = UIManager:GetUIObj("InBattleWheelMenu")
      if BattleWheel then
        UIManager:UnLoadUI("InBattleWheelMenu")
        BattleWheel = nil
      end
      if nil == BattleWheel then
        BattleWheel = UIManager:LoadUINew("InBattleWheelMenu")
        DebugPrint(LXYTag, "BattleWheel", BattleWheel)
        AudioManager(self):PlayUISound(BattleWheel, "event:/ui/common/combat_bag_show", "BattleMenuShow", nil)
        self:FlushInputKeyExceptMove()
        self:AddForbidTag("BattleWheelForbid")
        Controller:AddDisableRotationInputTag("SetRotation_Lerp")
      end
    else
      UIManager(self):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, UIUnlockRule.BattleWheel.UIUnlockDesc)
    end
  else
    DebugPrint("gmy@BP_PlayerCharacter_C:OpenBattleWheel DisableBattleWheel")
    local CurDungeonType = WorldTravelSubsystem():GetCurrentDungeonType()
    if CurDungeonType == CommonConst.DungeonType.Abyss then
      UIManager(self):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_Disabled_Des_BattleWheel"))
    else
      UIManager(self):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_BATTLEWHEEL_FORBIDDEN"))
    end
  end
end

function BP_PlayerCharacter_C:CloseBattleWheel(bForceClose)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local BattleWheel = UIManager:GetUIObj("InBattleWheelMenu")
  local Controller = UE4.UGameplayStatics.GetPlayerController(GameInstance, 0)
  if nil ~= BattleWheel then
    local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
    if GameInputModeSubsystem then
      local bIsGamepad = GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad
      if bIsGamepad then
        BattleWheel:CloseMenu()
      else
        BattleWheel:SelectAndCloseMenu()
      end
    end
  end
  self:MinusForbidTag("BattleWheelForbid")
  Controller:RemoveDisableRotationInputTag("SetRotation_Lerp")
end

function BP_PlayerCharacter_C:RefreshBattleWheelEnableState()
  local Controller = self:GetController()
  if not Controller.bEnableBattleWheel then
    self:CloseBattleWheel(true)
  end
  DebugPrint("gmy@BP_PlayerCharacter_C:RefreshBattleWheelEnableState", Controller.bEnableBattleWheel)
  EventManager:FireEvent(EventID.OnRefreshBattleWheelEnableState, Controller.bEnableBattleWheel, Controller.bShowBattleWheel)
end

function BP_PlayerCharacter_C:EnableBattleWheel()
  local GameInstance = GWorld.GameInstance
  local Controller = UE4.UGameplayStatics.GetPlayerController(GameInstance, 0)
  if Controller then
    Controller.bEnableBattleWheel = true
    self:RefreshBattleWheelEnableState()
  end
end

function BP_PlayerCharacter_C:DisableBattleWheel()
  local GameInstance = GWorld.GameInstance
  local Controller = UE4.UGameplayStatics.GetPlayerController(GameInstance, 0)
  if Controller then
    Controller.bEnableBattleWheel = false
    self:RefreshBattleWheelEnableState()
  end
end

function BP_PlayerCharacter_C:ShowBattleWheel()
  local Controller = self:GetController()
  if Controller then
    Controller.bShowBattleWheel = true
    self:RefreshBattleWheelEnableState()
  end
end

function BP_PlayerCharacter_C:HideBattleWheel()
  local Controller = self:GetController()
  if Controller then
    Controller.bShowBattleWheel = false
    self:RefreshBattleWheelEnableState()
  end
end

function BP_PlayerCharacter_C:CalcCurrentPlayerRegionId()
  local Avatar = GWorld:GetAvatar()
  local CalcRegionId = self:GetRegionId()
  if not (CalcRegionId and Avatar) or not Avatar:CheckCurrentSubRegion() then
    return
  end
  if Avatar.SyncReason ~= CommonConst.SyncReason.Normal then
    return
  end
  if not Avatar:CheckCurrentSubRegion(CalcRegionId) then
    return
  end
  local CurrentRegionId = Avatar.CurrentRegionId
  if CurrentRegionId ~= CalcRegionId and -1 ~= CalcRegionId then
    if Avatar:GetSubRegionId2RegionId() ~= Avatar:GetSubRegionId2RegionId(CalcRegionId) then
      return
    end
    if self:GetRegionId(self:GetLastSafeLocation()) ~= CalcRegionId then
      return
    end
    Avatar:SkipRegion(CalcRegionId)
  end
end

function BP_PlayerCharacter_C:OnEnteredNewSubRegion()
  local Avatar = GWorld:GetAvatar()
  DebugPrint("OnEnteredNewSubRegion", Avatar.CurrentRegionId)
  if self.CanChangeToMaster == nil then
    self.CanChangeToMaster = self:CheckCanChangeToMaster(false)
  end
  local OldCanChangeToMaster = self.CanChangeToMaster
  local NewCanChangeToMaster = self:CheckCanChangeToMaster(false, true)
  if self.CurrentMasterBan and not NewCanChangeToMaster then
    self:SwitchMasterOrHeroUIPerform()
    self:ChangeBackToHero()
  end
  AudioManager(self):CheckLevelSoundAndRegionId(Avatar.CurrentRegionId)
end

function BP_PlayerCharacter_C:GetRegionId(TargetLocation)
  TargetLocation = TargetLocation or self.CurrentLocation
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local CalcRegionId = -1
  if not GameMode then
    return
  end
  local LevelLoader = GameMode:GetLevelLoader()
  if LevelLoader and GWorld:GetWorldRegionState() and LevelLoader.IsWorldLoader then
    CalcRegionId = LevelLoader:GetRegionIdByLocation(TargetLocation)
  end
  return CalcRegionId
end

function BP_PlayerCharacter_C:StartLookAt(LookType, LookInfo)
  if not self:CheckLookPriority(LookType) then
    return
  end
  self:StopLookAt()
  self.CurrentLookType = LookType
  self.CurrentLookInfo = LookInfo
  self.LookAtTag:SetTagState(LookType, true)
end

function BP_PlayerCharacter_C:CheckLookPriority(LookType)
  return true
end

function BP_PlayerCharacter_C:StopLookAt(LookType)
  if not LookType then
    self.LookAtTag:SetTagState(self.CurrentLookType, false)
    return
  end
  if LookType == self.CurrentLookType then
    self.LookAtTag:SetTagState(self.CurrentLookType, false)
  end
end

function BP_PlayerCharacter_C:CheckCanLookAt(FroceStop)
  if FroceStop then
    self:StopLookAt()
    return
  end
  local CurrentStateLimit = DataMgr.PlayerStateLimit[self.AutoSyncProp.CharacterTag]
  if CurrentStateLimit and CurrentStateLimit.NeackRotation then
    local LookInfo = {
      TurnHeadParam = {bLookUseCamera = true, bIsLookAt = true}
    }
    self:StartLookAt("Camera", LookInfo)
  else
    self:StopLookAt("Camera")
  end
end

function BP_PlayerCharacter_C.OnSetLookAtTag(Owner, IsShouldLookAt)
  if not Owner.PlayerAnimInstance then
    return
  end
  if not IsShouldLookAt then
    Owner.PlayerAnimInstance:StopLookAt()
    return
  end
  Owner:SetLookAtParam()
end

function BP_PlayerCharacter_C:SetLookAtParam()
  if not self.PlayerAnimInstance then
    return
  end
  if not self.CurrentLookInfo then
    return
  end
  for k, v in pairs(self.CurrentLookInfo.TurnHeadParam) do
    if self.PlayerAnimInstance[k] ~= nil then
      self.PlayerAnimInstance[k] = v
    end
  end
  local Target = self.CurrentLookInfo.Target
  local Socket = self.CurrentLookInfo.SocketName
  if self.CurrentLookType == "Actor" then
    self.PlayerAnimInstance:SetLookAtActor(Target, Socket)
  elseif self.CurrentLookType == "Camera" then
  else
    self.PlayerAnimInstance:SetLookAtActor(Target, Socket)
  end
end

function BP_PlayerCharacter_C:OnSkillFeatureBegin()
  self:StopFire(false, true)
end

function BP_PlayerCharacter_C:CancelSkill(JumpStage, bStillHoldFire)
  if not self:IsSkillFinished() then
    self:StopSkill()
    self:StopFire(bStillHoldFire, false)
    self.PlayerAnimInstance:StopSkillAnimation()
  end
end

function BP_PlayerCharacter_C:InitSceneStartUI()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if not IsValid(UIManager) then
    return
  end
  self.UIModePlatform = CommonUtils.GetDeviceTypeByPlatformName(self)
  self.PlatformName = UGameplayStatics.GetPlatformName()
  local SceneStartUI = UIManager:LoadUI(UIConst.SCENESTARTUI, "SceneStartUI", UIConst.ZORDER_FOR_DESKTOP)
  if nil ~= SceneStartUI then
    SceneStartUI:InitMainPage()
  end
  if not self:IsDead() then
    local UIBattleMain = UIManager:GetUI("BattleMain")
    if UIBattleMain then
      UIBattleMain:HidePlayerDeadUI()
    end
    local ExceptUIName = TSet(FName)
    UIManager:HideAllUI_EX(ExceptUIName, false, "RegionResurgence")
  end
  self:UpdatePlayerTaskInfo()
  if not GameInstance:GetLoadingUI() then
    self:RefreshCharUIByPlatform()
  end
end

function BP_PlayerCharacter_C:RefreshCharUIByPlatform()
  local UIManager = UIManager(self)
  self.SkillUINames = self.SkillUINames or {}
  for SkillUIName, _ in pairs(self.SkillUINames) do
    DebugPrint("gmy@BP_PlayerCharacter_C:RefreshCharUIByPlatform ", SkillUIName)
    UIManager:UnLoadUI(SkillUIName)
    self.SkillUINames[SkillUIName] = nil
  end
  DebugPrint("gmy@BP_PlayerCharacter_C BP_PlayerCharacter_C:RefreshCharUIByPlatform1", self.CurrentRoleId)
  local BattleCharInfo = DataMgr.BattleChar[self.CurrentRoleId]
  if BattleCharInfo and BattleCharInfo.CharUIId then
    self:TryOpenSkillUI(BattleCharInfo.CharUIId, false)
  end
end

function BP_PlayerCharacter_C:CheckDraftCanProduce()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local CurrentRegionId = Avatar:GetCurrentRegionId()
  if Avatar:CheckSubRegionType(CurrentRegionId, CommonConst.SubRegionType.Home) and Avatar:IsInBigWorld() then
    local CanProductDraftIds = ForgeModel:GetCanProduceDraftIds()
    if #CanProductDraftIds > 0 then
      self:AddTimer(1, function()
        local ForgingGuideTalkTriggerId = 3001
        UE4.UTalkFunctionLibrary.PlayDirectTalkByTalkTriggerId(GWorld.GameInstance, ForgingGuideTalkTriggerId)
      end)
    end
  end
end

function BP_PlayerCharacter_C:UpdatePlayerBloodEffectInfo()
  if not self.InitSuccess then
    return
  end
  local CurrentBlood = self:GetCurrentBloodVolume()
  local MaxBlood = self:GetMaxBloodVolume()
  local BloodStrength = CurrentBlood / MaxBlood
  local NowEnergyShield = self:GetAttr("ES")
  local SystemUIConfig = DataMgr.SystemUI[UIConst.BattleNearDeathPCName]
  if SystemUIConfig then
    local FirstLevelFactor = SystemUIConfig.Params.FirstLevelFactor
    local SecondLevelFactor = SystemUIConfig.Params.SecondLevelFactor
    local ShowUIBloodStrength = SystemUIConfig.Params.ShowUIBloodStrength
    local SecondLevelBloodStrength = SystemUIConfig.Params.SecondLevelBloodStrength
    if nil == FirstLevelFactor or nil == SecondLevelFactor or nil == ShowUIBloodStrength or nil == SecondLevelBloodStrength then
      return
    end
    local PreNearDeath = self.IsNearDeath
    self.IsNearDeath = BloodStrength > 1.0E-4 and BloodStrength < ShowUIBloodStrength and NowEnergyShield <= 0
    local EffectUIWidget = UIManager(self):GetUIObj(UIConst.BattleNearDeathPCName)
    local InAnimName
    if not PreNearDeath and self.IsNearDeath then
      InAnimName = "In"
    end
    if PreNearDeath and self.IsNearDeath then
      InAnimName = "Loop"
    end
    if PreNearDeath and not self.IsNearDeath then
      InAnimName = "Out"
    end
    if self.IsNearDeath then
      if nil == EffectUIWidget then
        EffectUIWidget = UIManager(self):LoadUINew(UIConst.BattleNearDeathPCName)
      end
      if nil ~= EffectUIWidget then
        local BgMat
        local FlashFactor = BloodStrength > SecondLevelBloodStrength and FirstLevelFactor or SecondLevelFactor
        if CommonUtils.GetDeviceTypeByPlatformName() == "PC" then
          BgMat = EffectUIWidget.Bg_1:GetDynamicMaterial()
        else
          BgMat = EffectUIWidget.glassglow:GetDynamicMaterial()
        end
        if nil ~= BgMat then
          BgMat:SetScalarParameterValue("Flash", FlashFactor)
        end
      end
    elseif nil ~= EffectUIWidget and PreNearDeath then
      EffectUIWidget:BindToAnimationFinished(EffectUIWidget.Out, function()
        EffectUIWidget:UnbindAllFromAnimationFinished(EffectUIWidget.Out)
        UIManager(self):UnLoadUI(UIConst.BattleNearDeathPCName)
      end)
      EMUIAnimationSubsystem:EMPlayAnimation(EffectUIWidget, EffectUIWidget.Out)
    end
  end
end

function BP_PlayerCharacter_C:UpdateUIMode(UIMode)
  self.UIModePlatform = UIMode
  local CharMainUI = UIManager(self):GetUIObj("SceneStartUI")
  if nil ~= CharMainUI then
    CharMainUI:OnCloseOtherUI()
    CharMainUI:InitMainPage()
  end
end

function BP_PlayerCharacter_C:Landed()
  if not self:PlayerLanded() then
    return
  end
  if self:CharacterInTag("Shooting") and self:CheckCanEnterTag("LandHeavy") and self.PlayerAnimInstance.FallingSpeed < Const.LandHeavySpeed then
    self:StopFire(true, false)
    self:StopSkill()
  end
end

function BP_PlayerCharacter_C:Impending()
  if not self:PlayerImpending() then
    return
  end
  self.Overridden.Impending(self)
end

function BP_PlayerCharacter_C:StartSlide()
  print(_G.LogTag, "StartSlideStartSlideStartSlide")
  self:DoSlide()
  if self.NeedSlideEvent then
    EventManager:FireEvent(EventID.OnSlidePressed)
  end
end

function BP_PlayerCharacter_C:PressDodge()
  self.bSprintPressed = true
  self:StartDodge()
end

function BP_PlayerCharacter_C:StartDodge()
  self:DoDodge()
  if self.NeedAvoidEvent then
    EventManager:FireEvent(EventID.OnAvoidPressed)
  end
end

function BP_PlayerCharacter_C:ApplyHitFlyDown()
  self:ResetCapSize()
  self:RealStopSlide(true)
  self.Super.ApplyHitFlyDown(self)
end

function BP_PlayerCharacter_C:ShowPlayerDeadUI()
  local RecoverUIName = self:GetCurRecoveryUIName()
  local RecoverUI = UIManager(self):LoadUINew(RecoverUIName)
  RecoverUI:OnMainCharacterInitReady()
  RecoverUI:InitResurgenceUI(self.Eid)
end

function BP_PlayerCharacter_C:IsDeadDuringQuest()
  local CurrentStoryNode = GWorld.StoryMgr:GetCurrentStoryNode()
  return CurrentStoryNode and CurrentStoryNode.bDeadTriggerQuestFail
end

function BP_PlayerCharacter_C:HandleDeadDuringQuest()
  local StoryMgr = GWorld.StoryMgr
  local RespawnPointParams = StoryMgr:GetResurgencePointInfo()
  local RespawnDelayTime = 1.8
  if RespawnPointParams then
    self:AddTimer(RespawnDelayTime, function()
      self:RequestDeadAsyncTravel(RespawnPointParams)
    end)
  else
    DebugPrint("Tianyi@ \230\137\190\228\184\141\229\136\176\229\164\141\230\180\187\231\130\185\239\188\140\232\181\176\229\140\186\229\159\159\229\164\141\230\180\187\233\128\187\232\190\145")
    self:TryEnterDying()
  end
end

function BP_PlayerCharacter_C:RealOnDead_Lua(KillMineRoleEid, KillMineSkillId, DeathReason)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if nil ~= GameMode then
    GameMode:NotifyGameModePlayerDead(self)
  end
  DebugPrint("Tianyi@ Player Die!!!!!!!!!!")
  if self.PlayerAniminstance then
    self.PlayerAniminstance:ResetIdleTag(true)
    self:SetArmoryTag("None")
  end
  self:PlayHitMontage("Die")
  self:SetHoldCrouch(false)
  self:StopFire(false, false)
  self:ZeroComboCount(UE4.EClearComboReason.Dead)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameMode and (GameState.GameModeType == "Training" or GameState.GameModeType == "Trial") then
    local DelayTime = 0
    local RespawnPoint = GameState:GetTargetPoint("Training")
    if RespawnPoint then
      Battle(self):TeleportRecovery(self.Eid, RespawnPoint:K2_GetActorLocation(), RespawnPoint:K2_GetActorRotation(), DelayTime)
    else
      DebugPrint("Tianyi@ \230\137\190\228\184\141\229\136\176\232\174\173\231\187\131\229\156\186\229\164\141\230\180\187\231\130\185")
      Battle(self):TeleportRecovery(self.Eid, FVector(2148.795166, -4042.718262, 2133), FRotator(0, 0, 0), DelayTime)
    end
  elseif self:IsDeadDuringQuest() then
    DebugPrint("Tianyi@ \231\142\169\229\174\182\229\156\168\228\187\187\229\138\161\228\184\173\230\173\187\228\186\161")
    self:HandleDeadDuringQuest()
  else
    self:TryEnterDying()
  end
  local Avatar = GWorld:GetAvatar()
  if self:IsMainPlayer() and Avatar and Avatar:IsInRougeLike() then
    local CurRecoveryCount = self:GetRecoveryCount()
    Avatar:SavePlayerSlice({
      Type = Const.RougeSliceInfoType.RecoverCount,
      Value = {
        RecoveryCount = CurRecoveryCount + 1
      }
    })
  end
end

function BP_PlayerCharacter_C:OnTriggerFallTrigger(GameMode, FallTrigger)
  if GameMode and FallTrigger then
    local ControllerIndex = UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerIndex(self, self:GetController())
    GameMode:OnTriggerFallTrigger(FallTrigger, self, ControllerIndex)
  end
end

function BP_PlayerCharacter_C:HandleRemoveModPassives()
  self:ClearWeaponModPassive()
  local Controller = self:GetController()
  self:RemovePassiveEffectByRole(Controller:GetRoleId())
end

function BP_PlayerCharacter_C:TriggerFallingCallable(GameMode, DefaultTransform, MaxDis, DefaultEnable, FallTrigger, TriggerFallingScreenColor)
  DebugPrint("OtherActor is Falling Dead. ActorName:", self:GetName(), ", UnitId:", self.UnitId, ", Eid:", self.Eid, ", CreatorId:", self.CreatorId, ", CreatorType:", self.CreatorType, ", BornPos:", self.BornPos)
  if self.FromOtherWorld then
    DebugPrint("OtherActor is player, but from other world  ActorName:", self:GetName())
    return
  end
  GameMode:TriggerDungeonComponentFun("OnPlayerTriggerFallTrigger")
  self:OnTriggerFallTrigger(GameMode, FallTrigger)
  local SafeLocation = GameMode:TryGetSafeLocation(self, MaxDis)
  local SafeRotation
  if self:CharacterInTag("Interactive") then
    self:LeaveInteractiveTag("Interactive")
  end
  if GameMode.EMGameState.GameModeType == "Temple" and true ~= DefaultEnable then
    local ArchivePointLocation, ArchivePointRotation = GameMode.EMGameState:BackToTempleArchivePoint()
    if ArchivePointLocation then
      SafeLocation = ArchivePointLocation + FVector(0, 0, self.CapsuleComponent:GetScaledCapsuleHalfHeight())
      SafeRotation = ArchivePointRotation
    else
      DebugPrint("ERROR:BackToTempleArchivePoint ArchivePointLocation is nil")
    end
  elseif GameMode.EMGameState.GameModeType == "Party" and true ~= DefaultEnable then
    local ArchivePointLocation, ArchivePointRotation = GameMode.EMGameState:BackToPartyArchivePoint(self)
    if ArchivePointLocation then
      SafeLocation = ArchivePointLocation + FVector(0, 0, self.CapsuleComponent:GetScaledCapsuleHalfHeight())
      SafeRotation = ArchivePointRotation
      GameMode:OnPartyPlayerTriggerFallTrigger(self.Eid)
    else
      DebugPrint("ERROR:BackToPartyArchivePoint ArchivePointLocation is nil")
    end
  end
  DebugPrint("FallTrigger -----------------------------------------------------------------------")
  DebugPrint("FallTrigger TriggeredByPlayer  MaxDis", MaxDis, "DefaultEnable", DefaultEnable)
  if SafeLocation then
    DebugPrint("FallTrigger PrintPlayer SafeLocation ", SafeLocation.X, SafeLocation.Y, SafeLocation.Z)
  end
  if DefaultTransform and DefaultTransform.Translation then
    DebugPrint("FallTrigger PrintPlayer DefaultTransform ", DefaultTransform.Translation.X, DefaultTransform.Translation.Y, DefaultTransform.Translation.Z)
  end
  if not DefaultEnable and SafeLocation ~= FVector(0, 0, 0) then
    DebugPrint("FallTrigger SetPlayerLocation to SafeLocation", SafeLocation.X, SafeLocation.Y, SafeLocation.Z)
    self:K2_SetActorLocation(SafeLocation, false, nil, false)
    if nil ~= SafeRotation then
      self:K2_SetActorRotation(SafeRotation, false)
    end
  else
    DebugPrint("FallTrigger SetPlayerLocation to DefaultTransform", DefaultTransform.Translation.X, DefaultTransform.Translation.Y, DefaultTransform.Translation.Z)
    self:K2_SetActorLocation(DefaultTransform.Translation, false, nil, false)
    self:K2_SetActorRotation(DefaultTransform.Rotation:ToRotator(), false)
  end
  self:GetMovementComponent():ForceClientUpdate()
  self:EnableCheckOverlapPush({})
  if self.OnTriggerFallingCallable then
    self:OnTriggerFallingCallable()
  end
  if IsDedicatedServer(self) then
    self.RPCComponent:OnPlayerFallTriggerClient()
  else
    self:ShowBlackScreenFade_StandAlone(TriggerFallingScreenColor)
  end
  self:GetController():SetControlRotation(self:K2_GetActorRotation())
  self:Landed()
end

function BP_PlayerCharacter_C:TriggerWaterFallingCallable(GameMode, DefaultTransform, MaxDis, DefaultEnable)
  self:TriggerFallingCallable(GameMode, DefaultTransform, MaxDis, DefaultEnable)
end

function BP_PlayerCharacter_C:ShowBlackScreenFade_StandAlone(TriggerFallingScreenColor, OutAnimationPlayTime)
  if "White" == TriggerFallingScreenColor then
    local Params = {}
    Params.BlackScreenHandle = "BlackScreenFade"
    Params.ScreenColor = "White"
    Params.OutAnimationPlayTime = 1
    Params.IsPlayOutWhenLoaded = true
    UIManager(self):ShowCommonBlackScreen(Params)
  else
    self:NewBlackScreenFade(OutAnimationPlayTime)
  end
end

function BP_PlayerCharacter_C:TryToUpdateScreenEffect(DamageFrom, EnergyShieldReduce)
  local NowEnergyShield = self:GetAttr("ES")
  if EnergyShieldReduce > 0 then
    local MaxES = self:GetAttr("MaxES")
    if 0 ~= MaxES and DataMgr.SystemUI[UIConst.BattleBrokenShieldPCName].Params.ShieldUIResetRate and (NowEnergyShield + EnergyShieldReduce) / MaxES > DataMgr.SystemUI[UIConst.BattleBrokenShieldPCName].Params.ShieldUIResetRate then
      self.PlayBrokenShiledAnim = true
    end
    if NowEnergyShield <= 0 and self:IsMainPlayer() and self.PlayBrokenShiledAnim then
      self.PlayBrokenShiledAnim = false
      local SystemUIConfig = DataMgr.SystemUI[UIConst.BattleBrokenShieldPCName]
      if SystemUIConfig then
        local InAnimName = SystemUIConfig.Params.AnimName
        if nil ~= InAnimName then
          local ScreenEffectUI = UIManager(self):PlayScreenEffectAnim(UIConst.LoadInConfig, UIConst.BattleBrokenShieldPCName, {
            {
              AnimName = InAnimName,
              StartTime = 0.0,
              LoopNums = 1
            }
          })
          local curTime = TimeUtils.NowTime()
          AudioManager(self):PlayUISound(ScreenEffectUI, "event:/ui/common/char_sheild_break", nil, nil)
          if nil == self.PreHitSoundTime or curTime - self.PreHitSoundTime >= 30 then
            self.PreHitSoundTime = curTime
            local PlayStruct = FPlayFMODSoundStruct()
            PlayStruct.FMODEventPath, PlayStruct.SelectKey = AudioManager(self):ContactPlayerStringPath(self, "vo_be_hit_heavy")
            PlayStruct.EventKey = "vo_be_hit_heavy"
            PlayStruct.bStopWhenAttachedToDestoryed = true
            PlayStruct.bPlayAs2D = true
            PlayStruct = UE4.UAudioManager.SetObjectToFPlayFMODSoundStruct(PlayStruct, self)
            local SoundEventInstance = AudioManager(self):PlayFMODSound_Sync(PlayStruct)
          end
        end
      end
    end
  end
end

function BP_PlayerCharacter_C:SkillEnd(Owner, SkillId)
  if not SkillId or 0 == SkillId then
    return
  end
  local Skill = self:GetSkill(SkillId)
  if not Skill then
    return
  end
  self.Super.SkillEnd(Owner, SkillId)
  self:SetRotationRate("OnGround")
end

function BP_PlayerCharacter_C:ResetWeaponHandDelay()
  if not self.KeepWeaponOnHand then
    return
  end
  self.KeepWeaponOnHand = false
  self:RemoveTimer("KeepWeaponDelay")
end

function BP_PlayerCharacter_C:InitPlayerUseSkillTimes_Internal()
  if not GWorld:GetAvatar() then
    return
  end
  local NeedCountPlayerSkillUsedTimesList = EMCache:Get("bNeedCountPlayerSkillUsedTimesList", true) or {}
  for SkillType, Count in pairs(NeedCountPlayerSkillUsedTimesList) do
    self.NeedCountPlayerSkillUsedTimesList:Add(SkillType, Count)
  end
  local CountPlayerSkillUsedTimesList = EMCache:Get("CountPlayerSkillUsedTimesList", true) or {}
  for SkillType, Count in pairs(CountPlayerSkillUsedTimesList) do
    self.CountPlayerSkillUsedTimesList:Add(SkillType, Count)
  end
end

function BP_PlayerCharacter_C:GetPlayerUseSkillTimesFromCache(SkillType)
  if not GWorld:GetAvatar() then
    return
  end
  local CountPlayerSkillUsedTimesList = EMCache:Get("CountPlayerSkillUsedTimesList", true) or {}
  return CountPlayerSkillUsedTimesList[SkillType] or 0
end

function BP_PlayerCharacter_C:SavePlayerSkillUsedTimes()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    EMCache:Set("bNeedCountPlayerSkillUsedTimesList", self.NeedCountPlayerSkillUsedTimesList:ToTable(), true)
    EMCache:Set("CountPlayerSkillUsedTimesList", self.CountPlayerSkillUsedTimesList:ToTable(), true)
  end
end

function BP_PlayerCharacter_C:PressFire()
  if not self:CharacterInTag("LandHeavy") and not self:CheckCanSkillTypeCancel(UE.ESkillType.Shooting) and self:CheckForbidInput() then
    return
  end
  if self:CheckSkillOccupiedByProp(ESkillName.HeavyShooting) then
    self.PropHoldShootTimer = self:AddTimer(0.2, function()
      self.PropEffectComponent.CurrentPropEffect:OnHoldShoot()
      self.PropHoldShootTimer = nil
    end, false, 0, "PropHoldShoot")
  end
  if self:CheckSkillOccupiedByProp(ESkillName.Fire) then
    self.PropEffectComponent.CurrentPropEffect:OnShootPressed()
    return
  end
  self.bPressedFire = true
  if self:CharacterHasAnyTag("OverHeat") or self:CharacterHasAnyTag("NoBullet") then
    self:TryFireOverLoad()
    self:RemoveInputCache("Fire")
    return
  end
  local SkillId = self:GetSkillByType(UE.ESkillType.HeavyShooting)
  if SkillId and not self.PropHoldShootTimer then
    self:RemoveInputCache("Fire")
    self.HoldShootingTimer = self:AddTimer(0.2, self.HoldShooting)
    return
  end
  self:StartFire("Fire")
  if self.NeedFireEvent then
    EventManager:FireEvent(EventID.OnFirePressed)
  end
end

function BP_PlayerCharacter_C:StartFire(FireType)
  if self:CheckSkillOccupiedByProp(ESkillName.Fire) then
    return false
  end
  if self:CheckSkillIsBan(ESkillName.Fire) then
    local _ = not self.CurrentMasterBan and UIManager(self):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_RANGED_FORBIDDEN"))
    return false
  end
  if self:CheckSkillInActive(ESkillName.Fire) then
    return false
  end
  if not self:CheckCanShoot(false) then
    return
  end
  print(_G.LogTag, "StartFireStartFireStartFire", FireType)
  if self.PlayerAnimInstance then
    self.PlayerAnimInstance.bPressedFire = true
  end
  local SkillId
  if "Fire" == FireType then
    SkillId = self:GetSkillByType(UE.ESkillType.Shooting)
  else
    SkillId = self:GetSkillByType(UE.ESkillType.HeavyShooting)
  end
  print(_G.LogTag, "StartFireStartFireStartFireStartFire", SkillId)
  local FireSuccess = self:UseSkill(SkillId, 0)
  if not FireSuccess then
    return false
  end
  self.AllowEnterShoot = false
  local InputCache = "Fire" ~= FireType and "HeavyShooting" or "Fire"
  self:RemoveInputCache(InputCache)
  return true
end

function BP_PlayerCharacter_C:HoldShooting()
  self.bHoldingShooting = true
  if self:CharacterInTag("Slide") then
    return
  end
  self:SetInputCache("HeavyShooting")
  self:StartFire("HeavyShooting")
  self.HoldShootingTimer = nil
end

function BP_PlayerCharacter_C:RemoveHoldShootingTimer()
  self:RemoveTimer(self.HoldShootingTimer)
  self.HoldShootingTimer = nil
end

function BP_PlayerCharacter_C:ReleaseFire()
  if self:CheckSkillOccupiedByProp(ESkillName.HeavyShooting) and self.PropHoldShootTimer then
    self:RemoveTimer("PropHoldShoot")
    self.PropHoldShootTimer = nil
  end
  if self:CheckSkillOccupiedByProp(ESkillName.Fire) then
    self.PropEffectComponent.CurrentPropEffect:OnShootReleased()
    return
  end
  if not self.bHoldingShooting and self.HoldShootingTimer then
    self:SetInputCache("Fire")
    self:StartFire("Fire")
  end
  self:StopFire(false, true)
end

function BP_PlayerCharacter_C:StopFire(bStillHoldFire, OnlyReleaseFire)
  if self.NeedFireReleaseEvent then
    EventManager:FireEvent(EventID.OnFireRelease)
  end
  if bStillHoldFire and not self.bPressedFire then
    return
  end
  if not bStillHoldFire then
    self.bPressedFire = false
    self.bHoldingShooting = false
  end
  self:RemoveHoldShootingTimer()
  if self.PlayerAnimInstance then
    self.PlayerAnimInstance.bPressedFire = false
  end
  if OnlyReleaseFire then
    return
  end
  self.ResetedWhenShoot = false
  if self.PlayerAnimInstance then
    if bStillHoldFire then
      self.PlayerAnimInstance.StartShoot = false
      self:DisableReloadWithoutShoot()
      self:ShouldEnableHandIk()
    end
    self.PlayerAnimInstance.StopShoot = false
    self.PlayerAnimInstance.EnableAim = UE4.UKismetMathLibrary.Clamp(self.PlayerAnimInstance.EnableAim - 1, 0, 1)
  end
end

function BP_PlayerCharacter_C:AnimIdleStart()
  if self:CheckShouldEnterNormalIdle() then
    self.PlayerAnimInstance:AnimNotify_IdleStartNew()
  end
  self:TryEnterTalk()
end

function BP_PlayerCharacter_C:EnterCrouchTag()
  self:TryEnterTalk()
end

function BP_PlayerCharacter_C:CheckShouldEnterNormalIdle()
  if not self.PlayerAnimInstance then
    return false
  end
  if not self.BuffManager then
    return true
  end
  local CurIdleTag = self.BuffManager.CurrentIdleTag
  if CurIdleTag and "0" ~= CurIdleTag then
    return false
  end
  return true
end

function BP_PlayerCharacter_C:EnterSkillTag()
  if self:IsAnimCrouch() and self.CurrentSkillId == self:GetSkillByType(UE.ESkillType.SlideAttack) then
    return
  end
  self:ResetCapSize()
end

function BP_PlayerCharacter_C:EnterBulletJumpTag()
  Battle(self):TriggerBattleEvent(BattleEventName.EnterBulletJump, self)
end

function BP_PlayerCharacter_C:LeaveBulletJumpTag(NewTag)
  Battle(self):TriggerBattleEvent(BattleEventName.QuitBulletJump, self)
  self:SetPushEnemyInfo("BulletJump", false)
end

function BP_PlayerCharacter_C:CheckKeepBoneHit()
  local MoveState = self.PlayerAnimInstance:GetCurrentStateNameByStateMachineName("Movement")
  if "Idle" ~= MoveState and "Run" ~= MoveState then
    self.PlayerAnimInstance.InBoneHit = false
    if self.LuaTimerHandles.BoneHit ~= nil then
      self:RemoveTimer(self.LuaTimerHandles.BoneHit)
      self.LuaTimerHandles.BoneHit = nil
    end
  end
end

function BP_PlayerCharacter_C:ForbidRenderMainCamera()
  self.CharCameraComponent:SetOrthoNearClipPlane(100000)
  self.CharCameraComponent:SetOrthoFarClipPlane(100001)
  self.CharCameraComponent:SetOrthoWidth(1)
  self.CharCameraComponent:SetProjectionMode(1)
end

function BP_PlayerCharacter_C:AllowRenderMainCamera()
  self.CharCameraComponent:SetProjectionMode(0)
end

function BP_PlayerCharacter_C:CheckNeedFootprint()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return false
  end
  if IsStandAlone(self) or MiscUtils.IsAutonomousProxy(self) then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      local IsInBigWorld = Avatar:CheckCurrentSubRegion()
      if true == IsInBigWorld then
        print("need foot print")
        return true
      end
    else
      print("need foot print")
      return true
    end
  end
  print("not need foot print")
  return false
end

function BP_PlayerCharacter_C:IsOpenNormalAim()
  if not IsValid(self.RangedWeapon) then
    return false
  end
  local AimLockStyle = self:GetWeaponAimLockStyle()
  if AimLockStyle and "FieldAim" == AimLockStyle then
    return true
  end
  return self.ChooseTargetFilter ~= nil and nil ~= self.LockTargetFilter
end

function BP_PlayerCharacter_C:HoldToRecovery()
  Battle(self):Recovery(self.Eid)
end

function BP_PlayerCharacter_C:Recovery(...)
  BP_PlayerCharacter_C.Super.Recovery(self, ...)
  self:TryLeaveDying()
  self:ResetForbidTag("Battle")
  self:OnRecoverDissolve()
  if IsClient(self) or IsStandAlone(self) then
    self:UseSkill(Const.PlayerRecoverySkill, 0)
  end
end

function BP_PlayerCharacter_C:OnRealEnterDying()
  self.Super.OnRealEnterDying(self)
  if not IsDedicatedServer(self) and self:IsMainPlayer() then
    self:ShowPlayerDeadUI()
    self:TryHideAllSkillUI()
    if self.TeammateUI then
      self.TeammateUI:OnDead()
    end
  end
end

function BP_PlayerCharacter_C:OnRealDie()
  DebugPrint("Tianyi@ Player real die, Eid = " .. self.Eid)
  if IsAuthority(self) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    GameMode:DungeonFinish_OnPlayerRealDead({
      self:GetController().AvatarEidStr
    })
  end
end

function BP_PlayerCharacter_C:OnLanded()
  if self:IsExistTimer("PlayDeadMontage") then
    self:RemoveTimer("PlayDeadMontage")
    self:PlayHitMontage("Die")
  end
  if not self:CharacterInTag("Shooting") and self.PlayerAnimInstance and self.PlayerAnimInstance.StartShoot then
    self.PlayerAnimInstance.StartShoot = false
    self.PlayerAnimInstance.FullBody = true
    self:ShouldEnableHandIk()
  end
  if self:CharacterInTag("GrabHit") then
    self:OnGrabHitLanded()
  end
end

function BP_PlayerCharacter_C:EnterDeadTag()
  self:AddForbidTag("Battle")
  self:TrackDeadInfo()
  local BattlePet = self:GetBattlePet()
  if not BattlePet then
    return
  end
  BattlePet:HideBattlePet("Dead", true)
end

function BP_PlayerCharacter_C:LeaveDeadTag()
  local BattlePet = self:GetBattlePet()
  if not BattlePet then
    return
  end
  BattlePet:HideBattlePet("Dead", false)
end

function BP_PlayerCharacter_C:EnterRecoveryTag()
  self:TrackRecoverInfo()
end

function BP_PlayerCharacter_C:GetLogMask()
  return _G.LogTag
end

function BP_PlayerCharacter_C:SetLogMask(MaskName)
  print("LogInfo", MaskName)
  _G.LogTag = MaskName
end

function BP_PlayerCharacter_C:SetLogMask(MaskName)
  print("LogInfo", MaskName)
  _G.LogTag = MaskName
end

function BP_PlayerCharacter_C:GetLogMask()
  return _G.LogTag
end

function BP_PlayerCharacter_C:ReceiveSound(SoundSourceLoc, Strength)
  self.Overridden.ReceiveSound(self, SoundSourceLoc, Strength)
end

function BP_PlayerCharacter_C:GetCharSpringArmWorldResultLoc()
  return self.CharSpringArmComponent.bWorldResultLoc
end

function BP_PlayerCharacter_C:GetNickName()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return "\229\164\156\232\136\170\228\184\187\232\167\146\229\144\141"
  end
  if GWorld:IsStandAlone() then
    return Avatar.Nickname
  end
  return self.PlayerState.PlayerName
end

function BP_PlayerCharacter_C:CheckSkillInActive(SkillName)
  local Controller = self:GetController()
  if not Controller or not Controller.CheckSkillInActive then
    return false
  end
  return Controller:CheckSkillInActive(SkillName)
end

function BP_PlayerCharacter_C:PickupFunctionDispatcher(UnitId, PickUpCount, Transform, CharacterEid, PickUpEid, bExtra)
  local Battle = Battle(self)
  local TargetCharacter = Battle:GetEntity(CharacterEid)
  local ItemInfo = DataMgr.Drop[UnitId]
  if ItemInfo then
    Battle:TriggerBattleEvent(BattleEventName.OnGetDrop, self, UnitId)
    if ItemInfo.UseEffectType then
      local FunctionName = "PickupTo" .. ItemInfo.UseEffectType
      if IsDedicatedServer(self) then
        if rawget(Const.SavePickupType, ItemInfo.UseEffectType) and not GWorld.bDebugServer then
          local DSEntity = GWorld:GetDSEntity()
          if DSEntity then
            DSEntity:PickUpToSave(FunctionName, PickUpCount, ItemInfo, UnitId, Transform, CharacterEid, bExtra)
          end
        elseif ItemUtils:IsServerCreate(ItemInfo.DropId) and ItemInfo.IsPickShare then
          local GameMode = UE4.UGameplayStatics.GetGameMode(self)
          GameMode:PickUpForAllPlayers(FunctionName, PickUpCount, ItemInfo.UseParam, UnitId, Transform, PickUpEid, bExtra)
        else
          TargetCharacter[FunctionName](TargetCharacter, PickUpCount, ItemInfo.UseParam, UnitId, Transform, PickUpEid, bExtra)
        end
      else
        TargetCharacter[FunctionName](TargetCharacter, PickUpCount, ItemInfo.UseParam, UnitId, Transform, PickUpEid, bExtra)
      end
    end
  end
end

function BP_PlayerCharacter_C:SetDefaultWeapon()
  if not IsAuthority(self) then
    return
  end
  local Avatar = GWorld:GetAvatar()
  local UltraWeapon
  for id, _ in pairs(self.Weapons) do
    for _, tag in pairs(DataMgr.BattleWeapon[id].WeaponTag) do
      if "Ultra" == tag then
        UltraWeapon = id
      end
    end
  end
  self:ClearWeapon()
  local melee = self:AddWeapon(Avatar.Weapons[Avatar.MeleeWeapon].WeaponId)
  melee:UnBindWeaponFromHand()
  local ranged = self:AddWeapon(Avatar.Weapons[Avatar.RangedWeapon].WeaponId)
  ranged:ShouldHideWeapon(true, true)
  ranged:UnBindWeaponFromHand()
  if UltraWeapon then
    self:AddWeapon(UltraWeapon)
  end
  self:ChangeUsingWeaponByType("Melee")
end

function BP_PlayerCharacter_C:HideMonsterCapsule(IsEnable)
  local Entities = Battle(self):GetAllEntities()
  for eid, ent in pairs(Entities) do
    if ent and ent.IsMonster and ent:IsMonster() then
      ent.CapsuleComponent:SetHiddenInGame(IsEnable, false)
    end
  end
end

function BP_PlayerCharacter_C:ServerInteractiveMechanism(Id, PlayerId, NextStateId, InteractiveId, IsPlayer)
  print(_G.LogTag, "lxz ServerInteractiveMechanism", PlayerId)
  local Mechanism = Battle(self):GetEntity(Id)
  if IsPlayer then
    if Mechanism.CheckMontageInteractive then
      self:SetMechanismEid(Id, Mechanism:CheckMontageInteractive())
    else
      self:SetMechanismEid(Id, false)
    end
  end
  local InteractiveTag
  if Mechanism.CombatStateChangeComponent then
    Mechanism:ChangeState("Interactive", PlayerId, NextStateId)
  else
    if Mechanism:CharacterInTag("Defeated") then
      Mechanism:Penalize(PlayerId)
    else
      Mechanism:OpenMechanism(PlayerId)
    end
    if Mechanism.InteractiveComponent then
      InteractiveTag = Mechanism.InteractiveComponent.InteractiveTag
    else
      InteractiveTag = Mechanism.InteractiveTag
    end
    self:SetCharacterTag(InteractiveTag)
  end
end

function BP_PlayerCharacter_C:ServerDeInteractiveMechanism(Id, PlayerId, IsSuccess, ReasonId, NextStateId, IsPlayer)
  print(_G.LogTag, "lxz ServerDeInteractiveMechanism", PlayerId)
  local Mechanism = Battle(self):GetEntity(Id)
  if not Mechanism or not Mechanism.OpenMechanism then
    return
  end
  if IsPlayer then
    if Mechanism.CheckMontageInteractive then
      self:SetMechanismEid(0, Mechanism:CheckMontageInteractive())
    else
      self:SetMechanismEid(0, false)
    end
  end
  if nil == ReasonId or ReasonId ~= Const.ForceEndInteractive then
    print(_G.LogTag, "lxz ServerDeInteractiveMechanism2222", PlayerId)
    Mechanism:CloseMechanism(PlayerId, IsSuccess)
  else
    Mechanism:ForceCloseMechanism(PlayerId, IsSuccess)
  end
end

function BP_PlayerCharacter_C:LeaveInteractiveTag(NewTag)
  if "Idle" ~= NewTag and 0 ~= self.MechanismEid then
    local Mechanism = Battle(self):GetEntity(self.MechanismEid)
    if Mechanism then
      local InteractiveComponent = Mechanism:GetComponentByClass(UChestInteractiveComponent:StaticClass())
      if InteractiveComponent then
        InteractiveComponent:ForceEndInteractive(self, true, Const.ForceEndInteractive)
      end
    end
  end
end

function BP_PlayerCharacter_C:LeaveSeatingTag(NewTag)
  self:LeaveInteractiveTag(NewTag)
  self.CapsuleComponent:SetCollisionResponseToChannel(ECollisionChannel.ECC_WorldStatic, ECollisionResponse.ECR_Block)
end

function BP_PlayerCharacter_C:ReceiveEndPlay(Reason)
  if self.ArmoryHelper then
    self.ArmoryHelper:K2_DestroyActor()
  end
  self:TryCloseAllSkillUI()
  self:RefreshTeamMemberInfo("ReceiveEndPlay")
  EventManager:RemoveEvent(EventID.OnStartSkillFeature, self)
  EventManager:RemoveEvent(EventID.SetDefaultWeapon, self)
  EventManager:RemoveEvent(EventID.OnMainCharacterInitReady, self)
  EventManager:RemoveEvent(EventID.OnCharacterInitSuitRecover, self)
  EventManager:RemoveEvent(EventID.CloseLoading, self)
  EventManager:RemoveEvent(EventID.OnLevelDeliverBlackCurtainEnd, self)
  EventManager:RemoveEvent(EventID.OnRepBulletNum, self)
  self:UnBindControllerChangedDelegate()
end

function BP_PlayerCharacter_C:UnBindControllerChangedDelegate()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  GameInstance.OnPawnControllerChangedDelegates:Remove(self, self.OnPlayerControllerChanged)
end

function BP_PlayerCharacter_C:GetLastSafeLocation()
  return self.LastSafeLocation
end

function BP_PlayerCharacter_C:SetBrushStaticMeshScalarParameter(Value)
  if self.IsGetBrushStaticMesh == nil then
    self.BrushStaticMesh = {}
    self.IsGetBrushStaticMesh = false
  end
  if self.IsGetBrushStaticMesh == false then
    local MeshName = Const.BrushStaticMesh
    local AllActors = TArray(AActor)
    UE4.UGameplayStatics.GetAllActorsOfClass(self, AStaticMeshActor, AllActors)
    local ActorTab = AllActors:ToTable()
    for i, v in pairs(ActorTab) do
      if nil ~= v.StaticMeshComponent and nil ~= v.StaticMeshComponent.StaticMesh then
        for idx = 1, #MeshName do
          if v.StaticMeshComponent.StaticMesh:GetName() == MeshName[idx] then
            table.insert(self.BrushStaticMesh, v.StaticMeshComponent)
          end
        end
      end
    end
    self.IsGetBrushStaticMesh = true
  end
  for key, value in pairs(self.BrushStaticMesh) do
    local Material0 = value:CreateDynamicMaterialInstance(0)
    if IsValid(Material0) then
      Material0:SetScalarParameterValue("InteractiveScan", Value)
    end
    local Material1 = value:CreateDynamicMaterialInstance(1)
    if IsValid(Material1) then
      Material1:SetScalarParameterValue("InteractiveScan", Value)
    end
  end
end

function BP_PlayerCharacter_C:AddDisableInputTag(Tag)
  self.DisableInputTags:AddUnique(Tag)
  if self.DisableInputTags:Length() > 0 and self:GetController() and self:GetController():IsPlayerController() then
    self:DisableInput(self:GetController())
  end
end

function BP_PlayerCharacter_C:RemoveDisableInputTag(Tag)
  if self.DisableInputTags:Find(Tag) then
    self.DisableInputTags:RemoveItem(Tag)
  end
  if self.DisableInputTags:Length() <= 0 and self:GetController() and self:GetController():IsPlayerController() then
    self:EnableInput(self:GetController())
  end
end

function BP_PlayerCharacter_C:RemoveAllDisableInputTag()
  self.DisableInputTags:Clear()
  self:EnableInput(self:GetController())
end

function BP_PlayerCharacter_C:EnableInput(Controller)
  if self.DisableInputTags:Length() > 0 then
    return
  end
  self.Overridden.EnableInput(self, Controller)
end

function BP_PlayerCharacter_C:SwitchBattleShortcutKeysHidden()
  local CurrentHidden = EMCache:Get("BattleShortcutHudKeysHidden", true)
  local NewHidden = not CurrentHidden
  EMCache:Set("BattleShortcutHudKeysHidden", NewHidden, true)
  UIManager(self):SetBattleShortCutHudKeysHidden(NewHidden)
end

function BP_PlayerCharacter_C:GetSafeRegionLocation(EnterLocation)
  local Info = {}
  local Avatar = GWorld:GetAvatar()
  local CheckLocation = EnterLocation or self:GetRecentSafeLocation()
  local IsLocationValid = self:CheckLocationValid(CheckLocation)
  local CalcSubRegionId = self:GetRegionId(CheckLocation)
  if CheckLocation ~= Const.ZeroVector and -1 ~= CalcSubRegionId and IsLocationValid then
    Info.RegionId = CalcSubRegionId
    Info.Location = CheckLocation
    Info.Rotation = self:K2_GetActorRotation()
  else
    Info.RegionId = Avatar:GetLastRegionId()
    Info.Location = Avatar.LastRegionData:GetLocation()
    Info.Rotation = Avatar.LastRegionData:GetRotation()
  end
  return Info
end

function BP_PlayerCharacter_C:ImmersionModel()
  self.Overridden.ImmersionModel(self)
  GMVariable.EnableShowBillboard = false
  local UIManager = UIManager(self)
  UIManager:HideAllComponentUI(self.IsImmersionModel, Const.ImmersionModelHideTag)
  local HeadUISubsystem = USubsystemBlueprintLibrary.GetWorldSubsystem(self, UNpcHeadUISubsystem)
  if self.IsImmersionModel then
    require("EMLuaConst").IsHideJumpWord = true
    UIManager:AddUIToStateTagsCluster(1, "ImmersionModel", true)
    EventManager:AddEvent(EventID.OnAddWidgetComponent, self, self.OnAddWidgetComponent)
    if HeadUISubsystem then
      HeadUISubsystem:HideAllNpcHeadUI(true, "ImmersionModel")
    end
  else
    require("EMLuaConst").IsHideJumpWord = false
    UIManager:AddUIToStateTagsCluster(1, "ImmersionModel")
    EventManager:RemoveEvent(EventID.OnAddWidgetComponent, self)
    if HeadUISubsystem then
      HeadUISubsystem:HideAllNpcHeadUI(false, "ImmersionModel")
    end
  end
end

function BP_PlayerCharacter_C:OnAddWidgetComponent(WidgetInfo)
  local WidgetComponent = WidgetInfo.WidgetComponent
  if WidgetComponent then
    local Widget = WidgetComponent:GetWidget()
    if Widget then
      Widget:Hide(Const.ImmersionModelHideTag)
    end
  end
end

function BP_PlayerCharacter_C:UpdateBulletNumUI()
  self:AddDelayFrameFunc(function()
    if self.TakeAimIndicator then
      self.TakeAimIndicator:UpdateAmmoBarProgress(true)
    end
    local UIManager = UIManager(self)
    if UIManager then
      if self.UIModePlatform == "PC" then
        local BattleMainUI = UIManager:GetUIObj("BattleMain")
        if nil ~= BattleMainUI and nil ~= BattleMainUI.Char_Skill and BattleMainUI.Char_Skill.OnChargeWeaponBullet then
          BattleMainUI.Char_Skill:OnChargeWeaponBullet()
        end
      elseif self.UIModePlatform == "Mobile" then
        local BattleMainUI = UIManager:GetUIObj("BattleMain")
        if nil ~= BattleMainUI and nil ~= BattleMainUI.Char_Skill then
          if BattleMainUI.Char_Skill.Bullet.UpdatePlayerWeaponInfo then
            BattleMainUI.Char_Skill.Bullet:UpdatePlayerWeaponInfo()
          end
          if BattleMainUI.Char_Skill.AtkRanged.UpdateRangeWeaponButton then
            BattleMainUI.Char_Skill.AtkRanged:UpdateRangeWeaponButton()
          end
        end
      end
    end
  end, 2, "UpdateBulletNumFunc")
end

function BP_PlayerCharacter_C:UpdateSkillUIInfo(ChangedSkills)
  if IsDedicatedServer(self) then
    return
  end
  if self.UIModePlatform == "PC" then
    local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
    if nil ~= BattleMainUI and nil ~= BattleMainUI.Char_Skill then
      for k, v in pairs(ChangedSkills) do
        local Skill = self:GetSkill(v)
        if Skill then
          local SkillBaseConfig = Skill.Data
          BattleMainUI.Char_Skill:RefreshRoleTargetSkill(SkillBaseConfig.SkillType, Skill)
          DebugPrint("@zyh123", v, SkillBaseConfig.SkillType)
        end
      end
    end
  elseif self.UIModePlatform == "Mobile" then
    local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
    if nil ~= BattleMainUI and nil ~= BattleMainUI.Char_Skill then
      for k, v in pairs(ChangedSkills) do
        local Skill = self:GetSkill(v)
        if Skill then
          local SkillBaseConfig = Skill.Data
          BattleMainUI.Char_Skill:RefreshRoleTargetSkill(SkillBaseConfig.SkillType, Skill)
        end
      end
    end
  end
end

function BP_PlayerCharacter_C:SetESCMenuForbiddenState(IsForbidden)
  self.IsESCForbidden = IsForbidden or false
end

function BP_PlayerCharacter_C:GetESCMenuForbiddenState()
  if self.IsESCForbidden == nil then
    return false
  end
  return self.IsESCForbidden
end

function BP_PlayerCharacter_C:SetMaxMovingSpeed(Rate)
  Rate = math.max(0, Rate)
  self.PlayerSlideAtttirbute.NormalWalkSpeed = DataMgr.PlayerRotationRates.NormalWalkSpeed.ParamentValue[1] * Rate
  self.PlayerSlideAtttirbute.CrouchWalkSpeed = DataMgr.PlayerRotationRates.CrouchWalkSpeed.ParamentValue[1] * Rate
  self:SetWalkSpeed()
end

function BP_PlayerCharacter_C:SetMaxMovingSpeedByInfo(Info)
  self.PlayerSlideAtttirbute.NormalWalkSpeed = Info.NormalWalk
  self.PlayerSlideAtttirbute.CrouchWalkSpeed = Info.CrouchWalk
end

function BP_PlayerCharacter_C:TryOpenSkillUI(CharUIId, bIsOpenByBuff)
  DebugPrint("TryOpenSkillUI: ", CharUIId, bIsOpenByBuff)
  if not self:IsMainPlayer() then
    return
  end
  CharUIId = self:GetReplacedCharUIId(CharUIId)
  local GradeLevel = self:GetAttr("GradeLevel") or 0
  local CharUIInfo = DataMgr.BattleCharUI[CharUIId][GradeLevel]
  if bIsOpenByBuff or not CharUIInfo.TriggerBuffId then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local SceneMgrComponent = GameInstance:GetSceneManager()
    if IsValid(SceneMgrComponent) then
      local function OpenUIFunctor()
        local UIManager = GameInstance:GetGameUIManager()
        
        local UIObj = UIManager:GetUIObj(CharUIInfo.UIName)
        if UIObj then
          UIManager:UnLoadUI(CharUIInfo.UIName)
        end
        self.SkillUINames = self.SkillUINames or {}
        self.SkillUINames[CharUIInfo.UIName] = true
        UIObj = UIManager:LoadUINew(CharUIInfo.UIName, self, CharUIInfo.Params)
        if UIObj and UIObj.InitBattleCharUI then
          UIObj:InitBattleCharUI(CharUIId, GradeLevel)
        end
      end
      
      if bIsOpenByBuff and CharUIInfo.TriggerBuffDelay then
        self:AddTimer_Combat(CharUIInfo.TriggerBuffDelay, function()
          local Buffs = self.BuffManager and self.BuffManager.Buffs
          if Buffs then
            for _, Buff in pairs(Buffs) do
              if Buff.BuffId == CharUIInfo.TriggerBuffId then
                OpenUIFunctor()
                break
              end
            end
          end
        end, false, 0, nil, true)
      else
        OpenUIFunctor()
      end
    end
  end
end

function BP_PlayerCharacter_C:TryCloseSkillUI(CharUIId)
  DebugPrint("TryCloseSkillUI: ", CharUIId)
  if not self:IsMainPlayer() then
    return
  end
  CharUIId = self:GetReplacedCharUIId(CharUIId)
  local GradeLevel = self:GetAttr("GradeLevel") or 0
  local CharUIInfo = DataMgr.BattleCharUI[CharUIId][GradeLevel]
  if CharUIInfo then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManager = GameInstance:GetGameUIManager()
    local UIObj = UIManager:GetUIObj(CharUIInfo.UIName)
    if UIObj then
      UIObj:RemoveSelf()
    end
    if self.SkillUINames and self.SkillUINames[CharUIInfo.UIName] then
      self.SkillUINames[CharUIInfo.UIName] = nil
    end
  end
end

function BP_PlayerCharacter_C:GetReplacedCharUIId(CharUIId)
  if self.CurrentSkinId then
    local SkinData = DataMgr.Skin[self.CurrentSkinId]
    if SkinData then
      local BattleCharUIMap = SkinData.BattleCharUIMap
      if BattleCharUIMap and BattleCharUIMap[CharUIId] then
        DebugPrint("gmy@BP_PlayerCharacter_C BP_PlayerCharacter_C:TryOpenSkillUI Skill Replaced", CharUIId, BattleCharUIMap[CharUIId])
        CharUIId = BattleCharUIMap[CharUIId]
      end
    end
  end
  return CharUIId
end

function BP_PlayerCharacter_C:TryHideAllSkillUI()
  if not self:IsMainPlayer() then
    return
  end
  local GradeLevel = self:GetAttr("GradeLevel") or 0
  local BattleCharInfo = DataMgr.BattleChar[self.CurrentRoleId]
  if BattleCharInfo.CharUIId then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManager = GameInstance:GetGameUIManager()
    local CharUIInfo = DataMgr.BattleCharUI[BattleCharInfo.CharUIId][GradeLevel]
    if CharUIInfo then
      local UIObj = UIManager:GetUIObj(CharUIInfo.UIName)
      if UIObj then
        UIObj:Hide()
      end
    end
  end
end

function BP_PlayerCharacter_C:TryCloseAllSkillUI()
  if self.SkillUINames then
    for UIName, bValid in pairs(self.SkillUINames) do
      if bValid then
        UIManager(self):UnLoadUINew(UIName)
      end
    end
  end
  self.SkillUINames = {}
end

function BP_PlayerCharacter_C:TryShowAllSkillUI()
  if not self:IsMainPlayer() then
    return
  end
  local GradeLevel = self:GetAttr("GradeLevel")
  local BattleCharInfo = DataMgr.BattleChar[self.CurrentRoleId]
  if BattleCharInfo.CharUIId then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManager = GameInstance:GetGameUIManager()
    local CharUIInfo = DataMgr.BattleCharUI[BattleCharInfo.CharUIId][GradeLevel]
    local UIObj = UIManager:GetUIObj(CharUIInfo.UIName)
    if UIObj then
      UIObj:Show()
    end
  end
end

function BP_PlayerCharacter_C:LeaveRecoveryTag(NewTag)
  self:TryShowAllSkillUI()
end

function BP_PlayerCharacter_C:TryEnterTalk()
  if self.EnterTalkDelegates then
    for _, EnterTalkDelegate in pairs(self.EnterTalkDelegates) do
      EnterTalkDelegate()
    end
    self.EnterTalkDelegates = nil
  end
end

function BP_PlayerCharacter_C:SetEndPointInfo(EndPointSeqEnable, EndPointLocation, EndPointRotation)
  self.EndPointSeqEnable = EndPointSeqEnable
  self.EndPointLocation = EndPointLocation
  self.EndPointRotation = EndPointRotation
end

function BP_PlayerCharacter_C:GetEndPointInfo()
  return self.EndPointSeqEnable, self.EndPointLocation, self.EndPointRotation
end

function BP_PlayerCharacter_C:OnDungeonSettlement(IsWin, Index, SettlementData)
  local PathExist = true
  if IsWin then
    local WeaponType = GWorld.GameInstance.ScenePlayers[Index].CurrentWeaponType or "Armory"
    if SettlementData and SettlementData.UseDefaultMontage then
      WeaponType = "Armory"
    end
    local WeaponMeleeOrRanged = GWorld.GameInstance.ScenePlayers[Index].CurrentWeaponMeleeOrRanged
    DebugPrint("BP_PlayerCharacter_C:OnDungeonSettlement WeaponType: ", WeaponType, "WeaponMeleeOrRanged: ", WeaponMeleeOrRanged)
    local WinMont = "LevelFinish_" .. WeaponType .. "_Montage"
    PathExist = self:CheckLevelFinishMontagePath(WinMont)
    if not PathExist then
      WinMont = "LevelFinish_Armory_Montage"
    end
    local BattleCharTag = self:GetBattleCharBodyType()
    local CameraParam = FVector(0, 0, 0)
    if SettlementData and SettlementData.CameraParam then
      CameraParam.X = SettlementData.CameraParam[BattleCharTag][1]
      CameraParam.Y = SettlementData.CameraParam[BattleCharTag][2]
      CameraParam.Z = SettlementData.CameraParam[BattleCharTag][3]
    end
    DebugPrint("BP_PlayerCharacter_C:OnDungeonSettlement BattleCharTag", BattleCharTag, "CameraParam", CameraParam)
    local NewTranslation = UE4.UKismetMathLibrary.TransformLocation(self:GetTransform(), CameraParam)
    self:K2_SetActorLocation(NewTranslation, false, nil, true)
    self:PlayDungeonSettlementSimpleSkillFeature(false, false, false, false, true, true, CameraParam, Const.SettlementCameraRotation)
    NewTranslation = UE4.UKismetMathLibrary.TransformLocation(self:GetTransform(), -CameraParam)
    self:K2_SetActorLocation(NewTranslation, false, nil, true)
    self:PlayActionMontage("Interactive/LevelFinish", WinMont, {})
    self:SetEndPointOffset(Index, SettlementData)
    DebugPrint("BP_PlayerCharacter_C:OnDungeonSettlement PlayActionMontage: ", WinMont)
    if WeaponMeleeOrRanged then
      self:ChangeUsingWeaponByType(WeaponMeleeOrRanged)
    end
  else
    local WinMont = "LevelFinish_Fail_Montage"
    local PlayerController = self:GetController()
    local ControlRotation = PlayerController:GetControlRotation()
    local CharacterRotation = self:K2_EMGetActorRotation()
    PlayerController:SetControlRotation(FRotator(ControlRotation.Pitch, CharacterRotation.Yaw + 180, ControlRotation.Roll))
    self:PlayActionMontage("Interactive/LevelFinish", WinMont, {})
    self:ResetOnSetEndPoint()
  end
  self:SetCharacterTag("LevelFinish")
  if IsWin and GWorld.GameInstance.ScenePlayers[Index].CurrentWeaponType and PathExist then
    self.KeepWeaponOnHand = true
  end
  self:OnRecoverDissolve()
  local BattleResurgenceUI = UIManager(self):GetUI(self:GetCurRecoveryUIName())
  if BattleResurgenceUI then
    BattleResurgenceUI:ShowBattleMainUI()
  end
end

function BP_PlayerCharacter_C:PlayDungeonSettlementFailDeadMontage()
  local MontageFolder, MontagePrefix = self:GetHitMontageFolderAndPrefix()
  if nil ~= MontageFolder then
    local HitMontage = MontageFolder .. "Combat/Hit/" .. MontagePrefix .. "Die" .. Const.MontageSuffix .. "." .. MontagePrefix .. "Die" .. Const.MontageSuffix
    local AnimationAsset = LoadObject(HitMontage)
    if not AnimationAsset then
      DebugPrint("Error: Load Montage Failed!!!", HitMontage)
      return
    end
    self.Mesh:SetHiddenInGame(true)
    self.PartsMesh:SetHiddenInGame(true)
    self.PlayerAnimInstance:Montage_Play(AnimationAsset, 1.0, UE4.EMontagePlayReturnType.Duration, 3, true)
  end
end

function BP_PlayerCharacter_C:CheckLevelFinishMontagePath(MontageSuffix)
  local RootPath = UBlueprintPathsLibrary.ProjectContentDir()
  local ModelId = self:GetCharModelComponent():GetCurrentModelId()
  local ModelData = DataMgr.Model[ModelId]
  local PlayerAnimPath = ModelData.MontageFolder or ""
  local Prefix = ModelData.MontagePrefix or ""
  if not Prefix then
    return false
  end
  PlayerAnimPath = string.gsub(PlayerAnimPath, "/Game/", RootPath)
  local MontPath = PlayerAnimPath .. "Interactive/LevelFinish/" .. Prefix .. MontageSuffix .. ".uasset"
  DebugPrint("CheckLevelFinishMontagePath MontPath:", MontPath)
  if UBlueprintPathsLibrary.FileExists(MontPath) then
    return true
  end
  DebugPrint("CheckLevelFinishMontagePath: File not Exists")
  return false
end

function BP_PlayerCharacter_C:OnDungeonSettlementByIndex(Index, CurrentWeaponType, CurrentWeaponMeleeOrRanged, SettlementData)
  local WeaponType = CurrentWeaponType or "Armory"
  if SettlementData and SettlementData.UseDefaultMontage then
    WeaponType = "Armory"
  end
  local WeaponMeleeOrRanged = CurrentWeaponMeleeOrRanged
  local WinMont = "LevelFinish_" .. WeaponType .. "_Montage"
  local PathExist = self:CheckLevelFinishMontagePath(WinMont)
  if not PathExist then
    WinMont = "LevelFinish_Armory_Montage"
  end
  self:PlayActionMontage("Interactive/LevelFinish", WinMont, {})
  self:SetEndPointOffset(Index, SettlementData)
  DebugPrint("BP_PlayerCharacter_C:OnDungeonSettlementByIndex PlayActionMontage: ", WinMont)
  if WeaponMeleeOrRanged then
    self:ChangeUsingWeaponByType(WeaponMeleeOrRanged)
  end
  self:SetCharacterTag("LevelFinish")
  if CurrentWeaponType and PathExist then
    self.KeepWeaponOnHand = true
  end
end

function BP_PlayerCharacter_C:SetMainPlayerDungeonSettlementTransform(IsMoveToTempScene, MainPlayerOriginLoc, MainPlayerOriginRot)
  if IsMoveToTempScene then
    self:ResetIdle()
    local StartPoint = MainPlayerOriginLoc + FVector(0, 0, self.CapsuleComponent:GetUnscaledCapsuleHalfHeight())
    local EndPoint = MainPlayerOriginLoc + FVector(0, 0, -500)
    local HitResultLine = FHitResult()
    UE4.UKismetSystemLibrary.LineTraceSingle(self, StartPoint, EndPoint, ETraceTypeQuery.TraceScene, false, nil, EDrawDebugTrace.None, HitResultLine, true)
    local ImpactZ = HitResultLine.ImpactPoint.Z
    local NewTranslation = FVector(MainPlayerOriginLoc.X, MainPlayerOriginLoc.Y, ImpactZ + self.CapsuleComponent:GetUnscaledCapsuleHalfHeight())
    self:K2_SetActorLocationAndRotation(NewTranslation, MainPlayerOriginRot, false, nil, true)
  else
    local EMGameState = UE4.UGameplayStatics.GetGameState(self)
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return
    end
    if Avatar:IsInHardBoss() then
      self:ResetIdle()
      local EndPoint = MainPlayerOriginLoc + FVector(0, 0, -500)
      local HitResultLine = FHitResult()
      UE4.UKismetSystemLibrary.LineTraceSingle(self, MainPlayerOriginLoc, EndPoint, ETraceTypeQuery.TraceScene, false, nil, EDrawDebugTrace.None, HitResultLine, true)
      local ImpactZ = HitResultLine.ImpactPoint.Z
      local NewTranslation = FVector(MainPlayerOriginLoc.X, MainPlayerOriginLoc.Y, ImpactZ + self.CapsuleComponent:GetUnscaledCapsuleHalfHeight())
      self:K2_SetActorLocation(NewTranslation, false, nil, true)
      self:K2_SetActorRotation(MainPlayerOriginRot, false)
    end
  end
end

function BP_PlayerCharacter_C:SetOtherPlayerDungeonSettlementTransform()
  self:ResetIdle()
  local CurrentLoc = self:K2_GetActorLocation()
  local StartPoint = CurrentLoc + FVector(0, 0, self.CapsuleComponent:GetUnscaledCapsuleHalfHeight())
  local EndPoint = CurrentLoc + FVector(0, 0, -500)
  local HitResultLine = FHitResult()
  UE4.UKismetSystemLibrary.LineTraceSingle(self, StartPoint, EndPoint, ETraceTypeQuery.TraceScene, false, nil, EDrawDebugTrace.None, HitResultLine, true)
  local ImpactZ = HitResultLine.ImpactPoint.Z
  local NewTranslation = FVector(CurrentLoc.X, CurrentLoc.Y, ImpactZ + self.CapsuleComponent:GetUnscaledCapsuleHalfHeight())
  self:K2_SetActorLocation(NewTranslation, false, nil, true)
end

function BP_PlayerCharacter_C:SetEndPointOffset(Index, SettlementData)
  local Offset = FVector(0, 0, 0)
  if SettlementData and SettlementData.SettlementOffset then
    Offset.X = SettlementData.SettlementOffset[Index][1]
    Offset.Y = SettlementData.SettlementOffset[Index][2]
    Offset.Z = SettlementData.SettlementOffset[Index][3]
  end
  local NewTranslation = UE4.UKismetMathLibrary.TransformLocation(self:GetTransform(), Offset)
  self:K2_SetActorLocation(NewTranslation, false, nil, true)
end

function BP_PlayerCharacter_C:ResetOnSetEndPoint()
  self.CharacterMovement.Velocity = FVector(0, 0, 0)
  self:AddGravityModifier(UE4.EGravityModifierTag.AnimNotify, 0)
  self:SetActorEnableCollision(false)
end

function BP_PlayerCharacter_C:CheckCanRecovery()
  if IsClient(self) then
    local RecoveryCount = self:GetRecoveryCount()
    local RecoveryMaxCount = self:GetRecoveryMaxCount()
    return RecoveryMaxCount < 0 or RecoveryCount < RecoveryMaxCount
  else
    return self.Super.CheckCanRecovery(self)
  end
end

function BP_PlayerCharacter_C:SetIsJumpPadLaunched(value)
  self.PlayerAnimInstance.IsJumpPadLaunched = value
end

function BP_PlayerCharacter_C:SetIsJumpPadLaunching(value)
  self.PlayerAnimInstance.IsJumpPadLaunching = value
end

function BP_PlayerCharacter_C:GetBattleExtraInfo()
  local AvatarInfo = {}
  local PlayerHp = self:GetAttr("Hp")
  local PlayerSp = self:GetAttr("Sp")
  local DeathInfo = {
    RecoveryCount = self:GetRecoveryCount(),
    IsRealDead = false
  }
  if self:IsDead() then
    PlayerHp = self:GetAttr("MaxHp")
    PlayerSp = self:GetAttr("MaxSp")
    DeathInfo.RecoveryCount = math.min(DeathInfo.RecoveryCount + 1, self:GetRecoveryMaxCount())
  end
  AvatarInfo.RoleInfo = {
    Level = self:GetAttr("Level"),
    Exp = self:GetAttr("Exp"),
    PlayerHp = PlayerHp,
    PlayerSp = PlayerSp,
    DeathInfo = DeathInfo
  }
  if self.MeleeWeapon then
    AvatarInfo.MeleeWeapon = {
      Level = self.MeleeWeapon:GetAttr("Level"),
      Exp = self.MeleeWeapon:GetAttr("Exp")
    }
  end
  if self.RangedWeapon then
    AvatarInfo.RangedWeapon = {
      Level = self.RangedWeapon:GetAttr("Level"),
      Exp = self.RangedWeapon:GetAttr("Exp"),
      BulletNum = self.RangedWeapon:GetAttr("BulletNum") or 0,
      MagazineBulletNum = self.RangedWeapon:GetAttr("MagazineBulletNum") or 0
    }
  end
  if self.UltraWeapons then
    AvatarInfo.UltraWeapons = {}
    for _, weapon in pairs(self.UltraWeapons) do
      table.insert(AvatarInfo.UltraWeapons, {
        Level = weapon:GetAttr("Level"),
        Exp = weapon:GetAttr("Exp")
      })
    end
  end
  local PhantomTeammate = self:GetPhantomTeammates(false, true)
  for Index, Target in pairs(PhantomTeammate) do
    local PlayerHp = Target:GetAttr("Hp")
    local PlayerSp = Target:GetAttr("Sp")
    local DeathInfo = {
      RecoveryCount = Target:GetRecoveryCount(),
      IsRealDead = false
    }
    if Target:IsDead() then
      if Target:IsRealDead() then
        DeathInfo.IsRealDead = true
      else
        DeathInfo.RecoveryCount = math.min(DeathInfo.RecoveryCount + 1, Target:GetRecoveryMaxCount())
      end
    end
    AvatarInfo["PhantomInfo" .. Index] = {}
    AvatarInfo["PhantomInfo" .. Index].RoleInfo = {
      Level = self:GetAttr("Level"),
      PlayerHp = PlayerHp,
      PlayerSp = PlayerSp,
      DeathInfo = DeathInfo
    }
    local PhantomWeapon = Target:GetPhantomWeapon()
    if PhantomWeapon:HasTag(CommonConst.WeaponType.RangedWeapon) then
      AvatarInfo["PhantomInfo" .. Index].RangedWeapon = {
        BulletNum = PhantomWeapon:GetAttr("BulletNum") or 0,
        MagazineBulletNum = PhantomWeapon:GetAttr("MagazineBulletNum") or 0
      }
    end
  end
  return AvatarInfo
end

function BP_PlayerCharacter_C:GetCurPhantomInfo()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local CurPhantomInfo = {}
  local PhantomTeammate = self:GetPhantomTeammates()
  local PhantomTable = {}
  local WeaponToPhantom = {}
  for _, Teammate in pairs(PhantomTeammate) do
    if Teammate:IsPhantom() and (Teammate.IsSpawnByResource or Teammate.IsSpawnBySquad) then
      local MeleeWeapon = Teammate.MeleeWeapon
      local RangedWeapon = Teammate.RangedWeapon
      local WeaponId
      if MeleeWeapon then
        WeaponId = MeleeWeapon.WeaponId
      elseif RangedWeapon then
        WeaponId = RangedWeapon.WeaponId
      end
      if WeaponId then
        WeaponToPhantom[WeaponId] = Teammate.CurrentRoleId
      end
      PhantomTable[Teammate.CurrentRoleId] = Teammate
    end
  end
  for _, Char in pairs(Avatar.Chars) do
    if PhantomTable[Char.CharId] then
      local Mods = {}
      local ModSuit = Char:GetModSuit()
      for _, v in pairs(ModSuit) do
        if v.ModEid and Avatar.Mods[v.ModEid] then
          local Mod = Avatar.Mods[v.ModEid]
          local ModInfo = {
            ModId = Mod.ModId,
            Level = Mod.Level
          }
          table.insert(Mods, ModInfo)
        end
      end
      CurPhantomInfo[Char.CharId] = {}
      CurPhantomInfo[Char.CharId].Character = {
        CharId = Char.CharId,
        Level = Char.Level,
        ModSuit = Mods
      }
    end
  end
  for _, Weapon in pairs(Avatar.Weapons) do
    local PhantomCharId = WeaponToPhantom[Weapon.WeaponId]
    if PhantomCharId and CurPhantomInfo[PhantomCharId] then
      local Mods = {}
      local ModSuit = Weapon:GetModSuit()
      for _, v in pairs(ModSuit) do
        if v.ModEid and Avatar.Mods[v.ModEid] then
          local Mod = Avatar.Mods[v.ModEid]
          local ModInfo = {
            ModId = Mod.ModId,
            Level = Mod.Level
          }
          table.insert(Mods, ModInfo)
        end
      end
      CurPhantomInfo[PhantomCharId].Weapon = {
        WeaponId = Weapon.WeaponId,
        Level = Weapon.Level,
        ModSuit = Mods
      }
    end
  end
  return CurPhantomInfo
end

function BP_PlayerCharacter_C:RefreshTeamMemberInfo(OpType)
  if IsDedicatedServer(self) then
    return
  end
  local PlayerAvatar = GWorld:GetAvatar()
  if not PlayerAvatar or GWorld:IsStandAlone() or GameState(self).PlayerArray:Num() <= 1 then
    return
  end
  if not self.PlayerState then
    return
  end
  local MainPlayer = GWorld:GetMainPlayer()
  if MainPlayer and MainPlayer.Eid == self.PlayerState.Eid then
    return
  end
  local TeamData = TeamController:GetModel()
  local IsTeammate = TeamData:IsTeammateByAvatarEid(self.PlayerState.AvatarEidStr)
  if IsTeammate then
    local State = AllPlayerBloodState.OverReach
    self.PlayerState.OnReceiveActorStateChangeDelegate:Broadcast(self.PlayerState.Eid, State, true, "ReceiveBeginPlay" == OpType)
  end
end

function BP_PlayerCharacter_C:PreEnterStory(OnFinished)
  self:CleanInputWhenEnterTalk()
  self:ReleaseFire()
  self.bInStory = true
  self:SetStealth(true, "Story")
end

function BP_PlayerCharacter_C:PreExitStory(OnFinished)
  self.bInStory = false
  self:SetStealth(false, "Story")
end

function BP_PlayerCharacter_C:_CheckCanChangeToMaster(ShowLog, CheckRegion)
  if not IsStandAlone(self) then
    if ShowLog then
      GWorld.logger.error("\232\129\148\230\156\186\230\131\133\229\134\181\228\184\139\239\188\140\228\184\141\232\131\189\229\136\135\230\141\162\229\165\179\228\184\187")
    end
    return false
  end
  if self:CheckSkillIsBan(ESkillName.SwitchMasterOrHero) then
    if ShowLog then
      GWorld.logger.error("\231\166\129\231\148\168\229\136\135\230\141\162\229\165\179\228\184\187\229\146\140\229\136\135\229\155\158\229\142\187\232\139\177\233\155\132\230\138\128\232\131\189")
    end
    return false
  end
  if self:CheckSkillInActive(ESkillName.SwitchMasterOrHero) then
    if ShowLog then
      GWorld.logger.error("\229\136\135\230\141\162\229\165\179\228\184\187\229\146\140\229\136\135\229\155\158\229\142\187\232\139\177\233\155\132\230\138\128\232\131\189\230\156\170\230\191\128\230\180\187")
    end
    return false
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local DungeonId = GWorld.GameInstance:GetCurrentDungeonId()
  if DungeonId and DungeonId > 0 then
    if ShowLog then
      GWorld.logger.error("\229\137\175\230\156\172\229\134\133\239\188\140\228\184\141\232\131\189\229\136\135\230\141\162\229\165\179\228\184\187")
    end
    return false
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    if ShowLog then
      GWorld.logger.error("\230\178\161\230\156\137\232\191\158\230\142\165\230\156\141\229\138\161\229\153\168\239\188\140\228\184\141\232\131\189\229\136\135\230\141\162\229\165\179\228\184\187")
    end
    return false
  end
  local RegionId = Avatar:GetCurrentRegionId()
  if not RegionId or 0 == RegionId then
    if ShowLog then
      GWorld.logger.error("\228\184\141\229\156\168\229\140\186\229\159\159\228\184\173\230\136\150\232\128\133\229\140\186\229\159\159\231\188\150\229\143\183\229\135\186\233\148\153\239\188\140\228\184\141\232\131\189\229\136\135\230\141\162\229\165\179\228\184\187")
    end
    return false
  end
  local RegionInfo = DataMgr.SubRegion[RegionId]
  if not RegionInfo then
    if ShowLog then
      GWorld.logger.error("\228\184\141\229\156\168\229\140\186\229\159\159\228\184\173\230\136\150\232\128\133\229\140\186\229\159\159\231\188\150\229\143\183\229\135\186\233\148\153\239\188\140\228\184\141\232\131\189\229\136\135\230\141\162\229\165\179\228\184\187")
    end
    return false
  end
  return true
end

function BP_PlayerCharacter_C:CheckCanChangeToMaster(ShowLog, IsEnterRegion)
  self.CanChangeToMaster = self:_CheckCanChangeToMaster(ShowLog, true)
  if not IsEnterRegion and (not self:CanEnterInteractive() or not self:CharacterInTag("Idle")) then
    if ShowLog then
      GWorld.logger.error("\229\189\147\229\137\141\231\138\182\230\128\129\228\184\141\229\133\129\232\174\184\229\136\135\230\141\162\229\165\179\228\184\187")
    end
    self.CanChangeToMaster = false
    return self.CanChangeToMaster
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not IsValid(GameMode) then
    self.CanChangeToMaster = false
    if ShowLog then
      GWorld.logger.error("\229\189\147\229\137\141\230\184\184\230\136\143\230\168\161\229\188\143\230\151\160\230\149\136, \228\184\141\232\131\189\229\136\135\230\141\162\229\165\179\228\184\187")
    end
  elseif GameMode:IsInDungeon() then
    if self:IsDungeonInBattle() then
      self.CanChangeToMaster = false
    end
  elseif self:IsRegionInBattle() then
    self.CanChangeToMaster = false
  end
  return self.CanChangeToMaster
end

function BP_PlayerCharacter_C:CheckCanChangeBackToHero(ShowLog)
  return self:_CheckCanChangeToMaster(ShowLog, false)
end

function BP_PlayerCharacter_C:SwitchMasterOrHeroUIPerform()
  if not IsValid(self.BattleMainUI) then
    self.BattleMainUI = UIManager(self):GetUIObj("BattleMain")
  end
  if self.BattleMainUI == nil or nil == self.BattleMainUI.Char_Skill then
    return
  end
  self.BattleMainUI.Char_Skill:OnSwitchMasterOrHero()
end

function BP_PlayerCharacter_C:ChangeToMasterUIPerform()
  EventManager:FireEvent(EventID.ShowOrHideMainPlayerBloodUI, false, "ChangeRoleToMaster")
  if not IsValid(self.BattleMainUI) then
    self.BattleMainUI = UIManager(self):GetUIObj("BattleMain")
  end
  if self.BattleMainUI == nil or nil == self.BattleMainUI.Char_Skill then
    return
  end
  self.BattleMainUI.Char_Skill:OnChangeToMaster()
end

function BP_PlayerCharacter_C:ChangeBackToHeroUIPerform()
  EventManager:FireEvent(EventID.ShowOrHideMainPlayerBloodUI, true, "ChangeRoleToMaster")
  if not IsValid(self.BattleMainUI) then
    self.BattleMainUI = UIManager(self):GetUIObj("BattleMain")
  end
  if self.BattleMainUI == nil or nil == self.BattleMainUI.Char_Skill then
    return
  end
  self.BattleMainUI.Char_Skill:OnChangeBackToHero()
end

function BP_PlayerCharacter_C:SwitchMasterOrHero()
  self:SwitchMasterOrHeroUIPerform()
  if self.IsSwitchFuncInCD then
    return
  end
  if self.CurrentMasterBan then
    self:ChangeBackToHero()
  else
    self:ChangeToMaster(true)
  end
  self.IsSwitchFuncInCD = true
  self:AddTimer_Combat(1, function()
    self.IsSwitchFuncInCD = false
  end, false, 0, "SwitchFuncCDTimer")
end

function BP_PlayerCharacter_C:ChangeToMaster(ShowLog, IsEnterRegion)
  if not self:CheckCanChangeToMaster(ShowLog, IsEnterRegion) then
    return
  end
  if self.CurrentMasterBan then
    GWorld.logger.error("\229\189\147\229\137\141\229\183\178\231\187\143\230\152\175\228\184\187\232\167\146\231\138\182\230\128\129\239\188\140\228\184\141\232\131\189\230\137\167\232\161\140\229\136\135\228\184\187\232\167\146\230\147\141\228\189\156")
    return
  end
  local MasterRoleId = 111
  local Avatar = GWorld:GetAvatar()
  local RegionId = Avatar:GetCurrentRegionId()
  print(_G.LogTag, "CheckCanChangeToMaster", RegionId)
  if not RegionId or DataMgr.SubRegion[RegionId] == nil then
    GWorld.logger.error("\229\189\147\229\137\141\228\184\141\229\156\168\229\140\186\229\159\159\228\184\173\239\188\140\228\184\141\232\131\189\229\136\135\230\141\162\228\184\187\232\167\146")
    return
  end
  local PlayerIdentity = DataMgr.SubRegion[RegionId].SwitchPlayer
  if not PlayerIdentity then
    GWorld.logger.error("\229\189\147\229\137\141\229\140\186\229\159\159\230\178\161\230\156\137\229\143\175\229\136\135\230\141\162\232\167\146\232\137\178\239\188\140\228\184\141\232\131\189\229\136\135\230\141\162\228\184\187\232\167\146")
    return
  end
  local MasterGender = 1
  if not Avatar then
    GWorld.logger.error("\230\178\161\230\156\137\230\173\163\229\184\184\231\153\187\229\189\149\239\188\140\228\184\141\232\131\189\229\136\135\230\141\162\228\184\187\232\167\146")
    return
  end
  self.HeroTempInfo = {
    RoleInfo = {
      PlayerHp = self:GetAttr("Hp"),
      PlayerSp = self:GetAttr("Sp"),
      PlayerES = self:GetAttr("ES")
    },
    RangedWeapon = {
      BulletNum = self.RangedWeapon and self.RangedWeapon:GetAttr("BulletNum") or 0,
      MagazineBulletNum = self.RangedWeapon and self.RangedWeapon:GetAttr("MagazineBulletNum") or 0
    }
  }
  Avatar.HeroTempInfo = self.HeroTempInfo
  if "Player" == PlayerIdentity then
    MasterGender = Avatar.Sex
  else
    MasterGender = Avatar.WeitaSex
  end
  print(_G.LogTag, "ChangeToMaster", MasterRoleId, MasterGender, PlayerIdentity)
  local MasterInfo = DataMgr.Player2RoleId[PlayerIdentity]
  if not MasterInfo then
    GWorld.logger.error("\230\178\161\230\156\137\230\137\190\229\136\176\229\175\185\229\186\148\231\154\132\228\184\187\232\167\146\228\191\161\230\129\175\239\188\140\232\175\183\230\163\128\230\159\165\229\175\188\232\161\168")
    return
  end
  local GenderInfo = MasterInfo[MasterGender]
  if not GenderInfo then
    GWorld.logger.error("\229\175\185\229\186\148\230\128\167\229\136\171\230\178\161\230\156\137\232\167\146\232\137\178\239\188\140\232\175\183\230\163\128\230\159\165\229\175\188\232\161\168")
    return
  end
  MasterRoleId = GenderInfo
  self:ChangeRole(MasterRoleId, nil)
  self:RealChangeUsingWeapon(nil)
  self:ClearAllSuitItem()
  self:BanSkills()
  self.CurrentMasterBan = true
  if Avatar then
    Avatar.CurrentMasterBan = true
  end
  self:CombindTwoKeyToOneCommand("Skill3", "SwitchMaster")
  self:ChangeToMasterUIPerform()
  self:DisableBattleWheel()
  local BattlePet = self:GetBattlePet()
  if BattlePet then
    BattlePet:HideBattlePet("Master", true)
  end
end

function BP_PlayerCharacter_C:ChangeBackToHero()
  if not self:CheckCanChangeBackToHero(true) then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not IsValid(GameMode) then
    return
  end
  if not self.CurrentMasterBan then
    GWorld.logger.error("\229\189\147\229\137\141\228\184\141\230\152\175\229\165\179\228\184\187\231\138\182\230\128\129\239\188\140\228\184\141\232\131\189\228\187\142\229\165\179\228\184\187\229\136\135\229\155\158\229\134\155\230\162\176\229\186\147\232\167\146\232\137\178")
    return
  end
  self:RecoverBanSkills()
  self.NotChangeRoleTips = true
  self:RecoverHeroInfo()
  self:ChangeRole()
  self.NotChangeRoleTips = false
  self:WithChangeBackToHero()
end

function BP_PlayerCharacter_C:WithChangeBackToHero()
  self:SeparateTwoKeyToOneCommand("Skill3", "SwitchMaster")
  self:ChangeBackToHeroUIPerform()
  self:EnableBattleWheel()
  local BattlePet = self:GetBattlePet()
  if BattlePet then
    BattlePet:HideBattlePet("Master", false)
  end
end

function BP_PlayerCharacter_C:RecoverHeroInfo()
  local Avatar = GWorld:GetAvatar()
  local HeroTempInfo = self.HeroTempInfo or Avatar.HeroTempInfo
  if nil ~= HeroTempInfo then
    local Avatar = GWorld:GetAvatar()
    local PlayerController = self:GetController()
    local AvatarInfo = AvatarUtils:GetDefaultBattleInfo(Avatar)
    AvatarInfo = AvatarUtils:UpdateBattleInfo(AvatarInfo, HeroTempInfo)
    PlayerController:SetAvatarInfo(CommonUtils.ObjId2Str(Avatar.Eid), AvatarInfo)
    self.HeroTempInfo = nil
    Avatar.HeroTempInfo = nil
  end
end

function BP_PlayerCharacter_C:RecoverBanSkills()
  print(_G.LogTag, "RecoverBanSkills", self.CurrentRoleId)
  if self.CurrentMasterBan then
    self:UnBanSkills()
    self.CurrentMasterBan = false
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Avatar.CurrentMasterBan = false
    end
  end
end

function BP_PlayerCharacter_C:IsCurrentMasterBan()
  return self.CurrentMasterBan
end

function BP_PlayerCharacter_C:OnBattleStateChanged(RegionInBattle)
  if not RegionInBattle then
    return
  end
  if not self.CurrentMasterBan then
    return
  end
  print(_G.LogTag, "OnBattleStateChanged", RegionInBattle)
  self:ChangeBackToHero()
end

function BP_PlayerCharacter_C:BanSkills()
  local SkillNamesArray = TArray(0)
  for _, Skill in pairs(Const.AllSKillNames) do
    if not self:CheckSkillInActive(Skill) then
      SkillNamesArray:Add(Skill)
    end
  end
  local Controller = self:GetController()
  if Controller then
    Controller:BanSkills(SkillNamesArray, "MasterBan")
  end
end

function BP_PlayerCharacter_C:UnBanSkills()
  local Controller = self:GetController()
  if Controller then
    Controller:UnBanSkills("MasterUnBan")
  end
end

function BP_PlayerCharacter_C:RegionBanSkills()
  local SkillNamesArray = TArray(0)
  for _, Skill in pairs(Const.AllSKillNames) do
    if not self:CheckSkillInActive(Skill) then
      SkillNamesArray:Add(Skill)
    end
  end
  local Controller = self:GetController()
  if Controller then
    Controller:BanSkills(SkillNamesArray, "RegionBan")
  end
end

function BP_PlayerCharacter_C:RegionUnBanSkills()
  local Controller = self:GetController()
  if Controller then
    Controller:UnBanSkills("RegionUnBan")
  end
end

function BP_PlayerCharacter_C:MoveAlongSplineBanSkills()
  local SkillNamesArray = TArray(0)
  for _, Skill in pairs(Const.AllSKillNames) do
    if not self:CheckSkillInActive(Skill) then
      SkillNamesArray:Add(Skill)
    end
  end
  SkillNamesArray:Add(ESkillName.SwitchMasterOrHero)
  local Controller = self:GetController()
  if Controller then
    Controller:BanSkills(SkillNamesArray, "MoveAlongSpline")
  end
end

function BP_PlayerCharacter_C:MoveAlongSplineUnBanSkills()
  local Controller = self:GetController()
  if Controller then
    Controller:UnBanSkills("MoveAlongSpline")
  end
end

function BP_PlayerCharacter_C:ForbidActionWhileMoveAlongSpline(bForbid)
  local SkillNamesArray = TArray(0)
  SkillNamesArray:Add(ESkillName.Jump)
  SkillNamesArray:Add(ESkillName.Slide)
  SkillNamesArray:Add(ESkillName.BulletJump)
  SkillNamesArray:Add(ESkillName.Avoid)
  SkillNamesArray:Add(ESkillName.Crouch)
  local Controller = self:GetController()
  if Controller then
    if bForbid then
      Controller:InActiveSkills(SkillNamesArray, "MoveAlongSpline")
    else
      Controller:ActiveSkills(SkillNamesArray, "MoveAlongSpline")
    end
  end
end

function BP_PlayerCharacter_C:ForbidSkillsInHooking(bForbid)
  local Skills = {
    ESkillName.Fire,
    ESkillName.ChargeBullet,
    ESkillName.Attack,
    ESkillName.Jump,
    ESkillName.Avoid,
    ESkillName.Skill1,
    ESkillName.Skill2,
    ESkillName.Skill3,
    ESkillName.Slide
  }
  local SkillNamesArray = TArray(0)
  for _, Skill in pairs(Skills) do
    SkillNamesArray:Add(Skill)
  end
  local Controller = self:GetController()
  if Controller then
    if bForbid then
      Controller:InActiveSkillsInHooking(SkillNamesArray)
    else
      Controller:ActiveSkillsEndHooking(SkillNamesArray)
    end
  end
end

function BP_PlayerCharacter_C:ForbidActiveSkills(bForbid)
  local Skills = {
    ESkillName.Skill1,
    ESkillName.Skill2,
    ESkillName.Skill3
  }
  self:ForbidSkills(bForbid, Skills)
end

function BP_PlayerCharacter_C:ForbidAllSkills(bForbid)
  local Skills = {
    ESkillName.Skill1,
    ESkillName.Skill2,
    ESkillName.Skill3,
    ESkillName.Passive
  }
  self:ForbidSkills(bForbid, Skills)
end

function BP_PlayerCharacter_C:ForbidMeleeSkills(bForbid)
  local Skills = {
    ESkillName.Attack,
    ESkillName.FallAttack,
    ESkillName.HeavyAttack,
    ESkillName.SlideAttack
  }
  self:ForbidSkills(bForbid, Skills)
end

function BP_PlayerCharacter_C:ForbidRangedSkills(bForbid)
  local Skills = {
    ESkillName.Fire,
    ESkillName.ChargeBullet,
    ESkillName.HeavyShooting
  }
  self:ForbidSkills(bForbid, Skills)
end

function BP_PlayerCharacter_C:ForbidSkills(bForbid, Skills)
  local SkillNamesArray = TArray(0)
  for _, Skill in pairs(Skills) do
    SkillNamesArray:Add(Skill)
  end
  local Controller = self:GetController()
  if Controller then
    if bForbid then
      Controller:InActiveSkills(SkillNamesArray, "Ban")
    else
      Controller:ActiveSkills(SkillNamesArray, "UnBan")
    end
  end
end

function BP_PlayerCharacter_C:AfterLoading()
  if self.AfterLoadingDone then
    return
  end
  local bIsImmersionMode = EMCache:Get("ImmersionModel")
  if bIsImmersionMode then
    self:ImmersionModel()
  end
  self:RefreshCharUIByPlatform()
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar:CheckSubRegionType(nil, CommonConst.SubRegionType.Home) then
    self:CheckDraftCanProduce()
  end
  self:SetActorHideTag("DeliveryMontage", false)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  if GameInstance then
    if GameInstance.ShouldPlayDeliveryEndMontage then
      local function NotifyBegin()
        DebugPrint("zwk OnDeliveryAfterLoadingMontageNotifyBegin")
        
        self:RemoveDisableInputTag("DeliverMontage")
      end
      
      local function Interrupted()
        DebugPrint("zwk OnDeliveryAfterLoadingInterrupted", GameInstance.ShouldPlayDeliveryEndMontage)
        self:RemoveDisableInputTag("DeliverMontage")
      end
      
      local AllCallback = {OnNotifyBegin = NotifyBegin, OnInterrupted = Interrupted}
      DebugPrint("zwk OnDeliveryAfterLoadingMontageBegin")
      self:ResetIdle()
      self:AddDisableInputTag("DeliverMontage")
      self:PlayTeleportAction(AllCallback, false, true, false)
      self.Mesh:GetAnimInstance():Montage_JumpToSection("End")
      
      local function RemoveDeliverTag()
        if self.DisableInputTags:Find("DeliverMontage") then
          DebugPrint("zwk RemoveDeliverTag")
        end
        self:RemoveDisableInputTag("DeliverMontage")
        self:SetActorHideTag("DeliveryMontage", false)
      end
      
      self:AddTimer(2, RemoveDeliverTag, false, 0)
    end
    GameInstance.ShouldPlayDeliveryEndMontage = false
  end
  self.AfterLoadingDone = true
  self:AddTimer(1, function()
    self.AfterLoadingDone = false
  end)
end

function BP_PlayerCharacter_C:LoadHitDirection(HitDirectionsObject, Attacker)
  HitDirectionsObject.CurHitDirectionNum = HitDirectionsObject.CurHitDirectionNum + 1
  RunAsyncTask(self, "CreateHitDirectionHandler" .. HitDirectionsObject.CurHitDirectionNum, function(CoroutineObj)
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManager = GameInstance:GetGameUIManager()
    local HitDirection = UIManager:LoadUIAsync("BattleHitDirection", CoroutineObj, Attacker, self)
    HitDirectionsObject:AddToQueue(HitDirection)
  end)
end

function BP_PlayerCharacter_C:DungeonOtherPlayerLeave()
  if not self:IsMainPlayer() and IsClient(self) then
    EventManager:FireEvent(EventID.OnDungeonOtherPlayerLeave, self)
    local UIObj = UIManager(self):GetUIObj("TeamToast")
    if UIObj then
      UIManager(self):UnLoadUINew("TeamToast")
    end
    UIManager(self):LoadUINew("TeamToast", self.PlayerState, false)
  end
end

function BP_PlayerCharacter_C:SetCollisionProfileOverlapAll(bSet)
  DebugPrint("BP_PlayerCharacter_C:SetCollisionProfileOverlapAll", bSet, self.CachedPlayerCollisionProfile)
  local bCurrentSet = self.CachedPlayerCollisionProfile ~= nil
  if bCurrentSet == bSet then
  end
  if bSet then
    self.CachedPlayerCollisionProfile = self.CapsuleComponent:GetCollisionProfileName()
    self.CapsuleComponent:SetCollisionResponseToAllChannels(UE4.ECollisionResponse.ECR_Overlap)
    if self.SkillBlockCapsule then
      self.SkillBlockCapsuleCachedCollision = self.SkillBlockCapsule:GetCollisionEnabled()
      self.SkillBlockCapsule:SetCollisionEnabled(ECollisionEnabled.NoCollision)
    end
  else
    self.CapsuleComponent:SetCollisionProfileName("Pawn", false)
    self.CachedPlayerCollisionProfile = nil
    if self.SkillBlockCapsule then
      self.SkillBlockCapsule:SetCollisionEnabled(self.SkillBlockCapsuleCachedCollision)
    end
  end
end

function BP_PlayerCharacter_C:NeedArmoryHelper()
  return GWorld:GetAvatar() ~= nil
end

function BP_PlayerCharacter_C:RequestDeadAsyncTravel(RespawnPointParams)
  self:DisablePlayerInputInDeliver(true)
  local GameInstance = GWorld.GameInstance
  local TalkContext = GameInstance:GetTalkContext()
  local UIManager = UIManager(GameInstance)
  local EMGameState = UE4.UGameplayStatics.GetGameState(self)
  local PlayerController = self:GetController()
  local bForceAsyncLoading = false
  local bResetCamera = false
  local Transform = RespawnPointParams.Transform
  
  local function FadeOutCallback()
    UIManager:HideCommonBlackScreen("DeadAsyncTravel")
    local TaskIndicator = UIManager:GetUIObj("MainTaskIndicator")
    if IsValid(TaskIndicator) then
      TaskIndicator:SetVisibility(UE4.ESlateVisibility.Visible)
    end
    local SceneMgrComponent = GameInstance:GetSceneManager()
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    SceneMgrComponent:ShowOrHideAllSceneGuideIcon(true)
    self:EnableInput(PlayerController)
    if IsValid(LevelLoader) then
      local TargetLevelId = GameMode:GetLevelLoader():GetLevelIdByLocation(Transform.Translation)
      LevelLoader:RemoveArtLevelLoadedCompleteCallback(TargetLevelId)
    end
    self:DisablePlayerInputInDeliver(false)
    local StoryMgr = GWorld.StoryMgr
    if StoryMgr then
      StoryMgr:FailCurrentQuestWhenDead()
    end
  end
  
  local function FadeInCallback()
    local GameInstance = GWorld.GameInstance
    local UIManager = GameInstance:GetGameUIManager()
    local SceneMgrComponent = GameInstance:GetSceneManager()
    SceneMgrComponent:ShowOrHideAllSceneGuideIcon(false)
    local TaskIndicator = UIManager:GetUIObj("MainTaskIndicator")
    if IsValid(TaskIndicator) then
      TaskIndicator:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    self:DisableInput()
    self:QuickRecovery()
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    
    local function SetActorTransform()
      GameMode:SetActorLocationAndRotationByTransform(0, Transform, true)
      self:SetSafeLocation()
      if bResetCamera then
        self:GetController():SetControlRotation(self:K2_GetActorRotation())
      end
    end
    
    local LevelLoader = GameMode:GetLevelLoader()
    self.DurationEnd = false
    self.TravelFinish = false
    
    local function TryFadeOut()
      if self.DurationEnd and self.TravelFinish then
        self.DurationEnd = nil
        self.TravelFinish = nil
        FadeOutCallback()
      end
    end
    
    local function TravelFinishCallback()
      self.TravelFinish = true
      TryFadeOut()
    end
    
    local function DurationEndCallback()
      self.DurationEnd = true
      TryFadeOut()
    end
    
    GameMode:AddTimer(RespawnPointParams.ContinueTime, DurationEndCallback, false, 0, "CommonBlackScreenContinueTimer", true)
    if IsValid(LevelLoader) then
      local TargetLevelId = GameMode:GetLevelLoader():GetLevelIdByLocation(Transform.Translation)
      local CurrentLevelId = GameMode:GetLevelLoader():GetLevelIdByLocation(self:K2_GetActorLocation())
      local WorldCompositionSubsystem = GameMode:GetWCSubSystem()
      if WorldCompositionSubsystem then
        if bForceAsyncLoading then
          WorldCompositionSubsystem:RequestAsyncTravel(TalkContext.Player, Transform, {TalkContext, TravelFinishCallback}, bResetCamera)
        elseif WorldCompositionSubsystem:IsBigObjectLevelLoadedByLocation(Transform.Translation) then
          SetActorTransform()
          TravelFinishCallback()
        else
          WorldCompositionSubsystem:RequestAsyncTravel(TalkContext.Player, Transform, {TalkContext, TravelFinishCallback}, bResetCamera)
        end
        return
      else
      end
      if LevelLoader:GetLevelLoaded(TargetLevelId) then
        SetActorTransform()
        TravelFinishCallback()
        return
      end
      if TargetLevelId ~= CurrentLevelId then
        LevelLoader:BindArtLevelLoadedCompleteCallback(TargetLevelId, function()
          SetActorTransform()
          TravelFinishCallback()
        end)
        LevelLoader:LoadArtLevel(TargetLevelId)
      else
        SetActorTransform()
        TravelFinishCallback()
      end
    else
      SetActorTransform()
      TravelFinishCallback()
    end
  end
  
  UIManager:ShowCommonBlackScreen({
    BlackScreenHandle = "DeadAsyncTravel",
    BlackScreenText = GText(RespawnPointParams.FailBlackScreenText),
    InAnimationObj = self,
    InAnimationPlayTime = RespawnPointParams.FadeInTime or nil,
    InAnimationCallback = FadeInCallback,
    OutAnimationObj = self,
    OutAnimationCallback = nil,
    OutAnimationPlayTime = RespawnPointParams.FadeOutTime or nil
  })
end

function BP_PlayerCharacter_C:TeleportToCloestTeleportPoint(OnTeleportSucceedDel, TargetLoc)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return false
  end
  local WCSubsystem = GameMode:GetWCSubSystem()
  if not WCSubsystem then
    return
  end
  local RegionDataMgrSubSystem = GameMode:GetRegionDataMgrSubSystem()
  if not RegionDataMgrSubSystem then
    return
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local ActorLocation = self:K2_GetActorLocation()
  if TargetLoc then
    ActorLocation = TargetLoc
  end
  local MinDistance = 2100000000
  local FinalStaticCreator
  for _, StaticCreator in pairs(GameState.StaticCreatorMap) do
    if StaticCreator.UnitId == CommonConst.DeliveryAnchorMechanismUnitId and StaticCreator.UnitType == "Mechanism" then
      local LuaTableIndex = RegionDataMgrSubSystem:GetLuaDataIndex(StaticCreator.CreatedWorldRegionEid)
      if LuaTableIndex < 0 then
      else
        local bIsOpen = RegionDataMgrSubSystem.DataPool.RegionData[LuaTableIndex] and RegionDataMgrSubSystem.DataPool.RegionData[LuaTableIndex].State and RegionDataMgrSubSystem.DataPool.RegionData[LuaTableIndex].State.OpenState
        if not bIsOpen then
        else
          local Distance = ActorLocation:DistSquared(StaticCreator:K2_GetActorLocation())
          if MinDistance > Distance then
            MinDistance = Distance
            FinalStaticCreator = StaticCreator
          end
        end
      end
    end
  end
  if not FinalStaticCreator then
    for WorldRegionEid, CreatorId in pairs(RegionDataMgrSubSystem.CurRegionDeliverNew:ToTable()) do
      if RegionDataMgrSubSystem:CheckDeliverMechanismIsDefault(CreatorId) then
        FinalStaticCreator = GameState.StaticCreatorMap:FindRef(CreatorId)
        break
      end
    end
  end
  local PointIndex = 1
  if FinalStaticCreator then
    for _, Data in pairs(DataMgr.TeleportPoint) do
      if Data.StaticId == FinalStaticCreator.StaticCreatorId then
        PointIndex = Data.TeleportPointPos
      end
    end
  end
  local LevelName = GameMode:GetWCSubSystem():GetParentLevelIdByLocation(FinalStaticCreator and FinalStaticCreator:K2_GetActorLocation() or self.CurrentLocation)
  local WorldLoader = GameMode:GetLevelLoader()
  local TargtePoint = WorldLoader:GetStartPointByManager(LevelName, PointIndex)
  local Transform = TargtePoint:GetTransform()
  WCSubsystem:RequestAsyncTravel(self, Transform, {
    self,
    function()
      if OnTeleportSucceedDel then
        OnTeleportSucceedDel()
      end
    end
  })
  return true
end

function BP_PlayerCharacter_C:InpActEvt_GlobalSlow_K2Node_InputActionEvent_1(Key)
  if TeamController and TeamController:GetTeamPopupBarOpen() then
    return
  end
  DebugPrint(LXYTag, "BP_PlayerCharacter_C:InpActEvt_GlobalSlow_K2Node_InputActionEvent_1")
  self.Overridden.InpActEvt_GlobalSlow_K2Node_InputActionEvent_1(self, Key)
end

function BP_PlayerCharacter_C:CallClientPrint_Lua(Text)
  print(LogTag, "\230\156\141\229\138\161\229\153\168\231\154\132\232\190\147\229\135\186\228\184\186:" .. tostring(Text))
end

function BP_PlayerCharacter_C:SetEnableFallAtkDir()
  local bEnableFallAtkDir = EMCache:Get("EnableFallAtkDir")
  if nil == bEnableFallAtkDir then
    local OptionInfo = DataMgr.Option.FallAttackDirection
    local DefaultValue = OptionInfo.DefaultValue
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" and OptionInfo.DefaultValueM then
      DefaultValue = OptionInfo.DefaultValueM
    end
    bEnableFallAtkDir = true
    if "False" == DefaultValue then
      bEnableFallAtkDir = false
    end
  end
  self:UpdateEnableFallAtkDir(bEnableFallAtkDir)
end

function BP_PlayerCharacter_C:UpdateEnableFallAtkDir(Enable)
  self.Overridden.UpdateEnableFallAtkDir(self, Enable)
  EMCache:Set("EnableFallAtkDir", Enable)
end

function BP_PlayerCharacter_C:GetCurrentCharUI()
  local BattleCharInfo = DataMgr.BattleChar[self.CurrentRoleId]
  if BattleCharInfo.CharUIId then
    return self:GetCharUIObj(BattleCharInfo.CharUIId)
  end
end

function BP_PlayerCharacter_C:GetCharUIObj(CharUIId)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if not IsValid(UIManager) then
    return nil
  end
  local GradeLevel = self:GetAttr("GradeLevel") or 0
  local CharUIInfo = DataMgr.BattleCharUI[CharUIId][GradeLevel]
  return UIManager:GetUIObj(CharUIInfo.UIName)
end

function BP_PlayerCharacter_C:K2_OnEndViewTarget(PC)
  EventManager:FireEvent(EventID.OnEndViewTarget)
end

function BP_PlayerCharacter_C:K2_OnBecomeViewTarget(PC)
  rawset(self, "Controller", PC)
  rawset(PC, "PlayerCameraManager", PC.PlayerCameraManager)
  EventManager:FireEvent(EventID.OnBecomeViewTarget)
end

function BP_PlayerCharacter_C:SetRegionOnlineState()
  local bAutoJoin = EMCache:Get("AutoJoin")
  if nil == bAutoJoin then
    local OptionInfo = DataMgr.Option.AutoJoin
    local DefaultValue = OptionInfo.DefaultValue
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" and OptionInfo.DefaultValueM then
      DefaultValue = OptionInfo.DefaultValueM
    end
    bAutoJoin = true
    if "False" == DefaultValue then
      bAutoJoin = false
    end
  end
  self:UpdateRegionOnlineState(bAutoJoin)
end

function BP_PlayerCharacter_C:UpdateRegionOnlineState(bOpen)
  self.bOpenRegionOnline = bOpen
  EMCache:Set("AutoJoin", bOpen)
end

function BP_PlayerCharacter_C:GetPlayerGender(bOpen)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    return Avatar.Sex
  else
    return 0
  end
end

function BP_PlayerCharacter_C:GetTeamMemberEidArray()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  if not (TeamController and TeamController:GetModel()) or not GameInstance then
    return {}
  end
  local ScenceManager = GameInstance:GetSceneManager()
  if not ScenceManager or not ScenceManager.RegionOnlineCharacterInfo then
    return {}
  end
  local Team = TeamController:GetModel():GetTeam() or {}
  local Eids = {}
  for _, TeamMember in pairs(Team.Members or {}) do
    if TeamMember then
      table.insert(Eids, ScenceManager.RegionOnlineCharacterInfo[TeamMember.Uid])
    end
  end
  return Eids
end

AssembleComponents(BP_PlayerCharacter_C, {
  "GetDamageInstigatorCurrentAngle"
})
return BP_PlayerCharacter_C
