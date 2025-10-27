require("UnLua")
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local Json = require("rapidjson")
local EMCache = require("EMCache.EMCache")
local HeroUSDKSubSystem_C = Class()

function HeroUSDKSubSystem_C:BindDelegates()
  self.HeroSDKLogoutDelegate:Bind(self, self.OnLogout)
  self.HeroSDKSwitchAccountDelegate:Bind(self, self.OnSwitchAccount)
  self.HeroSDKLoginInvalidDelegate:Bind(self, self.OnLoginInvalid)
  self.HeroSDKPayDelegate:Bind(self, self.PayCallBack)
  self.HeroSDKExitDelegate:Bind(self, self.OnExit)
  self.HeroSDKAccountCancallationDelegate:Bind(self, self.OnAccountCancallation)
  if self.HeroMarketConversionDataSuccessDelegate then
    self.HeroMarketConversionDataSuccessDelegate:Bind(self, self.OnMarketConversionDataSuccess)
  end
  self.HeroSDKAccountUnCancallationDelegate:Bind(self, self.OnAccountUnCancallation)
  self.HeroSDKLoginDelegate:Bind(self, self.OnHeroSDKLogin)
  self.HeroSDKCmpDelegate:Bind(self, self.OnHeroSDKCmp)
  EventManager:AddEvent(EventID.OnCharLevelUpInBattle, self, self.OnLevelUp)
end

function HeroUSDKSubSystem_C:OnHeroSDKCmp(Result, Msg)
  DebugPrint("USDK OnHeroSDKCmp: Result:", Result, Msg)
end

function HeroUSDKSubSystem_C:OnHeroSDKLogin(Result, UserInfoStr, Msg)
  DebugPrint("USDK OnHeroSDKLogin: Result:", Result, Msg)
  if UGameplayStatics.GetCurrentLevelName(self) == "Login" then
    local LoginMainPage = GWorld.GameInstance:GetGameUIManager():GetUIObj("LoginMainPage")
    if LoginMainPage then
      LoginMainPage:OnHeroSDKLogin(Result, UserInfoStr, Msg)
    end
  else
    self:TryToGoToLoginScene()
  end
  local Platform = CommonUtils.GetDeviceTypeByPlatformName(self)
  if 0 == Result and "Mobile" == Platform then
    local ACESubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UACESubsystem)
    if ACESubsystem then
      ACESubsystem:Login(UserInfoStr.sdkUserId, 99, 0, "")
    end
  end
  self.bSwitchAccount = false
end

function HeroUSDKSubSystem_C:OnAccountUnCancallation(Result, Msg)
  DebugPrint("USDK OnAccountUnCancallation: Result:", Result, Msg)
  if 0 == Result then
    self:TryToGoToLoginScene()
  end
end

function HeroUSDKSubSystem_C:OnMarketConversionDataSuccess(Data)
  DebugPrint("USDK OnMarketConversionDataSuccess Data:", Data)
  local MarketConversionDataSuccessData = EMCache:Get("MarketConversionDataSuccess")
  if nil == MarketConversionDataSuccessData or MarketConversionDataSuccessData ~= Data then
    self:UploadTrackLog_Lua("attribution", {data_info = Data})
    EMCache:Set("MarketConversionDataSuccess", Data)
  end
end

function HeroUSDKSubSystem_C:OnAccountCancallation(Result, Msg)
  DebugPrint("USDK OnAccountCancallation: Result:", Result, "Msg:", Msg)
  if 0 == Result then
    if GWorld.NetworkMgr then
      GWorld.NetworkMgr:Disconnect()
    end
    self:TryToGoToLoginScene()
  end
end

function HeroUSDKSubSystem_C:OnExit(Result, Msg)
  DebugPrint("USDK OnExit: Result:", Result, "Msg:", Msg)
  if HeroUSDKSubsystem():IsBilibili() then
    HeroUSDKSubsystem():EMRequestExit()
  end
end

function HeroUSDKSubSystem_C:OnLogout(Result, Msg)
  DebugPrint("USDK OnLogOut: Result:", Result, "Msg:", Msg)
  if 0 == Result then
    self:TryToGoToLoginScene()
  end
  local BDCSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UNewBdcSubsystem)
  if BDCSubsystem then
    BDCSubsystem:Logout()
  end
end

function HeroUSDKSubSystem_C:OnSwitchAccount(Result, Msg)
  DebugPrint("USDK OnSwitchAccount: Result:", Result, "Msg:", Msg)
  if 0 == Result then
    self:TryToGoToLoginScene()
    self.bSwitchAccount = true
  end
end

function HeroUSDKSubSystem_C:PayCallBack(Result, PaymentOrder, Msg)
  DebugPrint("USDK PayCallBack: Msg:", Result, PaymentOrder, Msg)
  local Json = require("rapidjson")
  local PayCallBackMsg = "" ~= Msg and Json.decode(Msg) or {}
  if PayCallBackMsg.code == 20002 then
    local CommonDialog = UIManager(self):ShowCommonPopupUI(100235, {
      ShortText = PayCallBackMsg.msg
    }, self)
  end
  EventManager:FireEvent(EventID.OnPayCallBack, Result, PaymentOrder, Msg)
end

function HeroUSDKSubSystem_C:OnLoginInvalid(KickOffType)
  DebugPrint("OnLoginInvalid: KickOffType:", KickOffType)
  self:TryToGoToLoginScene(true, KickOffType)
end

function HeroUSDKSubSystem_C:UploadTrackLog_Lua(EventName, Properties)
  if not Properties then
    self:UploadEmptyTrackLog(EventName)
    return
  end
  if type(Properties) == "table" then
    self:UploadTrackLog(EventName, Json.encode(Properties))
  else
    self:UploadTrackLog(EventName, Properties)
  end
end

function HeroUSDKSubSystem_C:TryToGoToLoginScene(bAnti, KickOffType)
  print("TryToGoToLogin")
  if self.bSwitchAccount then
    DebugPrint("USDK TryToGoToLoginScene return because switch account")
    self.bSwitchAccount = false
    return
  end
  local bIsBilibili = HeroUSDKSubsystem():IsBilibili()
  if GWorld.NetworkMgr then
    GWorld.NetworkMgr:Disconnect()
  end
  
  local function QuitGame()
    UKismetSystemLibrary.QuitGame(self, UGameplayStatics.GetPlayerController(self, 0), EQuitPreference.Quit, true)
  end
  
  if UGameplayStatics.GetCurrentLevelName(self) == "Login" then
    local LoginMainPage = GWorld.GameInstance:GetGameUIManager():GetUIObj("LoginMainPage")
    if LoginMainPage then
      LoginMainPage:OnLogout()
    end
    self:CloseLoadingReconnect()
    if bAnti and self:IsAntiAddctionType(KickOffType) then
      local PlatformName = UE4.UUIFunctionLibrary.GetDevicePlatformName()
      if "IOS" == PlatformName then
        UIManager(self):ShowDisconnectUIConfirm(100072, true)
        return
      end
      if bIsBilibili then
        QuitGame()
      else
        local bShowDialog = self:NeedShowAntiAddctionDialog(KickOffType)
        if bShowDialog then
          local Params = {
            RightCallbackObj = self,
            RightCallbackFunction = QuitGame,
            LeftCallbackObj = self,
            LeftCallbackFunction = QuitGame
          }
          UIManager(self):ShowDisconnectUIConfirm(100072, true, Params)
        else
          QuitGame()
        end
      end
    end
    return
  end
  
  local function GoLoginFunc()
    local bHasLogOut = self.UserInfo.sdkUserId == ""
    if HeroUSDKSubsystem():IsHeroSDKEnable() and not UUCloudGameInstanceSubsystem.IsCloudGame() then
      HeroUSDKSubsystem():CleanUpUserInfo()
      local PlatformName = UE4.UUIFunctionLibrary.GetDevicePlatformName()
      if self:IsAntiAddctionType(KickOffType) then
        if not bAnti and bIsBilibili and not bHasLogOut then
          HeroUSDKSubsystem():HeroSDKLogout()
        elseif bAnti and "IOS" ~= PlatformName then
          QuitGame()
          return
        end
      end
    end
    WorldTravelSubsystem():ChangeSceneByAssetPath(Const.DefaultLoginSceneFile)
  end
  
  if bAnti and not bIsBilibili then
    if not self:IsAntiAddctionType(KickOffType) then
      GoLoginFunc()
      return
    end
    local bShowDialog = self:NeedShowAntiAddctionDialog(KickOffType)
    if bShowDialog then
      local Params = {
        LeftCallbackObj = self,
        LeftCallbackFunction = GoLoginFunc,
        RightCallbackObj = self,
        RightCallbackFunction = GoLoginFunc
      }
      UIManager(self):ShowDisconnectUIConfirm(100072, true, Params)
    else
      QuitGame()
    end
  else
    GoLoginFunc()
  end
end

function HeroUSDKSubSystem_C:IsAntiAddctionType(KickOffType)
  if KickOffType == UE4.EUsdkKickOffType.AccountCancel or KickOffType == UE4.EUsdkKickOffType.LoginInvalid then
    return false
  end
  return true
end

function HeroUSDKSubSystem_C:NeedShowAntiAddctionDialog(KickOffType)
  local bIsWeGame = UUsdkSettings:GetDefaultObject().Channel == EHeroUSDKChannel.WeGame
  if bIsWeGame and (KickOffType == UE4.EUsdkKickOffType.WeGame_kSystemStatePlatformOffline or KickOffType == UE4.EUsdkKickOffType.WeGame_kSystemStatePlatformExit or KickOffType == UE4.EUsdkKickOffType.WeGame_kSystemStatePlayerOwnershipExpired or KickOffType == UE4.EUsdkKickOffType.WeGame_kSystemStatePlayerOwnershipBanned) then
    return false
  end
  return true
end

function HeroUSDKSubSystem_C:CloseLoadingReconnect()
  local LoginMainPage = UIManager(self):GetUIObj("LoginMainPage")
  if LoginMainPage then
    LoginMainPage:CloseLoadingReconnect()
  end
end

function HeroUSDKSubSystem_C:OnLevelUp()
  local MainPlayer = UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(MainPlayer) then
    return
  end
  local GameRoleInfo = HeroUSDKUtils.GenHeroHDCGameRoleInfo(MainPlayer.CurrentRoleId, MainPlayer.BattleCharInfo.CharName, MainPlayer:GetAttr("Level"))
  self:HeroSDKRoleLevelUp(GameRoleInfo)
end

function HeroUSDKSubSystem_C:OnLoginSuccess()
  local PlayerAvatar = GWorld:GetAvatar()
  if PlayerAvatar then
    if PlayerAvatar.Nickname and PlayerAvatar.Nickname ~= "" then
      self:HeroSDKRoleEnterGame(HeroUSDKUtils.GenHeroHDCGameRoleInfo())
    end
    local BDCSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UNewBdcSubsystem)
    if BDCSubsystem then
      BDCSubsystem:Login(self.UserInfo.sdkUserId, CommonUtils.ObjId2Str2(PlayerAvatar.Eid))
    end
    self:SetNewBDCPublicAttriubute(tostring(PlayerAvatar.Uid), tostring(PlayerAvatar.Hostnum))
  end
end

function HeroUSDKSubSystem_C:RequestUploadChatData_Lua(ChatContents, DelegateReceiver, DelegateFunc)
  self:RequestUploadChatData(HeroUSDKUtils.GenHeroUSDKUploadChatItemData(ChatContents), {DelegateReceiver, DelegateFunc})
end

function HeroUSDKSubSystem_C:RequestUploadReportData_Lua(ReportData, DelegateReceiver, DelegateFunc)
  self:RequestUploadChatData(HeroUSDKUtils.GenHeroUSDKUploadChatItemData(ReportData), {DelegateReceiver, DelegateFunc})
end

function HeroUSDKSubSystem_C:RequestUploadBanLog_Lua(BanLogData, DelegateReceiver, DelegateFunc)
  self:RequestUploadLogData(HeroUSDKUtils.GenHeroUSDKUploadLogItemData(BanLogData), {DelegateReceiver, DelegateFunc})
end

function HeroUSDKSubSystem_C:UploadBDCTrackInfoWhenChangeScene()
  if USubsystemBlueprintLibrary.GetWorldSubsystem(self, UBDCUploadSubsystem) then
    USubsystemBlueprintLibrary.GetWorldSubsystem(self, UBDCUploadSubsystem):UploadAllBDCTrackInfo()
  end
  local PlayerCharacter = UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(PlayerCharacter) then
    return
  end
  if not PlayerCharacter.UploadBDCTrackInfo then
    return
  end
end

function HeroUSDKSubSystem_C:UploadBigWorldPathInfo(PlayerCharacter)
  if not PlayerCharacter.UploadBDCTrackInfo then
    return
  end
  if not PlayerCharacter.UploadBDCTrackInfo.BigWorldPathInfo then
    return
  end
  for _, Info in pairs(PlayerCharacter.UploadBDCTrackInfo.BigWorldPathInfo) do
    self:UploadTrackLog_Lua("event_explore", Info)
  end
end

function HeroUSDKSubSystem_C:UploadWeaponUseCountInfo(PlayerCharacter)
  if not PlayerCharacter.UploadBDCTrackInfo then
    return
  end
  if not PlayerCharacter.UploadBDCTrackInfo.WeaponUseCount then
    return
  end
  for _, Info in pairs(PlayerCharacter.UploadBDCTrackInfo.WeaponUseCount) do
    self:UploadTrackLog_Lua("weapon_usage_record", Info)
  end
  PlayerCharacter.UploadBDCTrackInfo.WeaponUseCount = {}
end

function HeroUSDKSubSystem_C:UploadSkillUseCountInfo(PlayerCharacter)
  if not PlayerCharacter.UploadBDCTrackInfo.SkillUseCount then
    return
  end
  for _, Info in pairs(PlayerCharacter.UploadBDCTrackInfo.SkillUseCount) do
    self:UploadTrackLog_Lua("skill_usage_record", Info)
  end
  if PlayerCharacter.UploadBDCTrackInfo.CondemnSkillCountInfo then
    self:UploadTrackLog_Lua("sentence_number", PlayerCharacter.UploadBDCTrackInfo.CondemnSkillCountInfo)
  end
end

function HeroUSDKSubSystem_C:UploadPlayerHurtInfo(PlayerCharacter)
  if not PlayerCharacter.UploadBDCTrackInfo.DamageTrack then
    return
  end
  for _, Info in ipairs(PlayerCharacter.UploadBDCTrackInfo.DamageTrack) do
    self:UploadTrackLog_Lua("player_hurt_record", Info)
  end
end

function HeroUSDKSubSystem_C:UploadBulletJumpCountInfo(PlayerCharacter)
  if not PlayerCharacter.UploadBDCTrackInfo.BulletJumpCountTrack then
    return
  end
  self:UploadTrackLog_Lua("bullet_jump_number", PlayerCharacter.UploadBDCTrackInfo.BulletJumpCountTrack)
end

function HeroUSDKSubSystem_C:UploadSlideCountInfo(PlayerCharacter)
  if not PlayerCharacter.UploadBDCTrackInfo.SlideCountTrack then
    return
  end
  self:UploadTrackLog_Lua("sliding_tackle_number", PlayerCharacter.UploadBDCTrackInfo.SlideCountTrack)
end

function HeroUSDKSubSystem_C:UploadJumpCountInfo(PlayerCharacter)
  if not PlayerCharacter.UploadBDCTrackInfo.JumpCountInfo then
    return
  end
  self:UploadTrackLog_Lua("jump_number", PlayerCharacter.UploadBDCTrackInfo.JumpCountInfo)
end

function HeroUSDKSubSystem_C:UploadSecondJumpCountInfo(PlayerCharacter)
  if not PlayerCharacter.UploadBDCTrackInfo.JumpSecondCountInfo then
    return
  end
  self:UploadTrackLog_Lua("double_jump_number", PlayerCharacter.UploadBDCTrackInfo.JumpSecondCountInfo)
end

function HeroUSDKSubSystem_C:UploadWallJumpCountInfo(PlayerCharacter)
  if not PlayerCharacter.UploadBDCTrackInfo.JumpWallCountInfo then
    return
  end
  self:UploadTrackLog_Lua("climb_wall_number", PlayerCharacter.UploadBDCTrackInfo.JumpWallCountInfo)
end

function HeroUSDKSubSystem_C:UploadFlyShootCountInfo(PlayerCharacter)
  if not PlayerCharacter.UploadBDCTrackInfo.FlyShootCountInfo then
    return
  end
  self:UploadTrackLog_Lua("fly_shoot_number", PlayerCharacter.UploadBDCTrackInfo.FlyShootCountInfo)
end

function HeroUSDKSubSystem_C:UploadDeadInfo(PlayerCharacter)
  if not PlayerCharacter.UploadBDCTrackInfo.DeadInfo then
    return
  end
  for _, Info in ipairs(PlayerCharacter.UploadBDCTrackInfo.DeadInfo) do
    self:UploadTrackLog_Lua("player_death", Info)
  end
end

function HeroUSDKSubSystem_C:UploadRecoveryInfo(PlayerCharacter)
  if not PlayerCharacter.UploadBDCTrackInfo.RecoveryInfo then
    return
  end
  for _, Info in ipairs(PlayerCharacter.UploadBDCTrackInfo.RecoveryInfo) do
    self:UploadTrackLog_Lua("player_recovery", Info)
  end
end

function HeroUSDKSubSystem_C:UploadSkipTalkInfo(PlayerCharacter)
end

function HeroUSDKSubSystem_C:ShowExitGameDialog()
  local LoginMainPage = GWorld.GameInstance:GetGameUIManager():GetUIObj("LoginMainPage")
  if LoginMainPage then
    LoginMainPage:ShowExitGamePopupUI()
  end
end

function HeroUSDKSubSystem_C:EMHeroSDKSwitchAccount()
  local Platform = UE4.UUIFunctionLibrary.GetDevicePlatformName()
  if "Android" == Platform and not self:IsGlobalSDK() then
    self:HeroSDKLogout()
  else
    self:HeroSDKSwitchAccount()
  end
end

return HeroUSDKSubSystem_C
