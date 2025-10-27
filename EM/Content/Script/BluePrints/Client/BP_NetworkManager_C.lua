require("UnLua")
local BP_NetworkManager_C = Class()
local CONFIRM_RECONNECT = 100074

function BP_NetworkManager_C:Initialize(Initializer)
  print(_G.LogTag, "BP_NetworkManager_C:Initialize")
end

function BP_NetworkManager_C:LogoutEvent()
  local EMSentrySubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UEMSentrySubsystem)
  if EMSentrySubsystem then
    EMSentrySubsystem:Logout()
  end
  local BDCSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UNewBdcSubsystem)
  if BDCSubsystem then
    BDCSubsystem:Logout()
  end
  local ACESubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UACESubsystem)
  if ACESubsystem then
    ACESubsystem:Logout()
  end
end

function BP_NetworkManager_C:DisconnectAndShowUI(info)
  local Uid = "Error"
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Uid = Avatar.Uid
  end
  self:Disconnect()
  self:LogoutEvent()
  info = info or {}
  PrintTable(info, 2)
  local BanReason = info.Reason
  local BanTime = info.BanTime
  local RetCode = info.RetCode
  if RetCode == CommonConst.KickAvatarType.KICK_AVATAR_FORCE_PATCH then
    DebugPrint("\229\188\186\229\136\182patch \232\162\171\232\184\162\228\184\139\231\186\191")
    local Params = {
      LeftCallbackObj = self,
      LeftCallbackFunction = self.TryToGoToLoginScene,
      RightCallbackObj = self,
      RightCallbackFunction = self.TryToGoToLoginScene
    }
    UIManager(self):ShowDisconnectUIConfirm(100151, true, Params)
    return
  end
  if "RelayAvatar" == BanReason then
    local Params = {
      LeftCallbackObj = self,
      LeftCallbackFunction = self.TryToGoToLoginScene,
      RightCallbackObj = self,
      RightCallbackFunction = self.TryToGoToLoginScene,
      ShortText = string.format(GText("UI_COMMONPOP_TEXT_100073"), tostring(Uid))
    }
    UIManager(self):ShowDisconnectUIConfirm(100073, true, Params)
  elseif not BanTime or not BanReason then
    self:EndReConnect(false)
    if not GWorld.bLoginConnectFailed then
      EventManager:FireEvent(EventID.OnNetDisconnect)
      self:ShowNetDisconnectUIConfirm()
    end
  else
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    local SystemLanguage = "CN"
    for k, v in pairs(CommonConst.SystemLanguages) do
      if CommonConst.SystemLanguage == v then
        SystemLanguage = k
        break
      end
    end
    if "Default" == SystemLanguage then
      SystemLanguage = "CN"
    end
    local Params = {
      ShortText = string.format(GText("UI_COMMONPOP_TEXT_100051"), info.Uid or 0, os.date("%Y-%m-%d %H:%M:%S", BanTime)),
      LeftCallbackObj = self,
      LeftCallbackFunction = self.TryToGoToLoginScene,
      RightCallbackObj = self,
      RightCallbackFunction = self.TryToGoToLoginScene
    }
    UIManager:ShowDisconnectUIConfirm(100051, true, Params)
    if IsStandAlone(GWorld.GameInstance) then
      local GameMode = GWorld.GameInstance:GetCurrentGameMode()
      if not GameMode then
        return
      end
      if GameMode.SetGamePaused then
        GameMode:SetGamePaused(Const.NetWorkFailure_Tag, true)
      end
    end
  end
end

function BP_NetworkManager_C:DisconnectAndReturnLogin()
  self:Disconnect()
  self:TryToGoToLoginScene()
  self:LogoutEvent()
end

function BP_NetworkManager_C:TryToGoToLoginScene()
  GWorld.GameInstance:ClearExitDungeonData()
  self:EndReConnect(false)
  HeroUSDKSubsystem():TryToGoToLoginScene()
end

function BP_NetworkManager_C:SendResolutionTrack()
  local NewTrack = {}
  local SceneManager = GWorld.GameInstance:GetSceneManager()
  local size = SceneManager:GetWindowSize()
  local NowInterfaceMode = UE4.UGameUserSettings:GetGameUserSettings():GetFullscreenMode()
  local ModeStr = {
    [EWindowMode.Fullscreen] = "\229\133\168\229\177\143",
    [EWindowMode.WindowedFullscreen] = "\230\151\160\232\190\185\230\161\134\231\170\151\229\143\163\229\140\150",
    [EWindowMode.Windowed] = "\231\170\151\229\143\163\229\140\150"
  }
  local str = string.format("%dx%d", size.X, size.Y)
  NewTrack.display_mode = ModeStr[NowInterfaceMode]
  NewTrack.display_resolution = str
  HeroUSDKSubsystem(self):UploadTrackLog_Lua("display_settings", NewTrack)
end

function BP_NetworkManager_C:OnDisconnectAndLoginAgain()
  self:SendResolutionTrack()
  self:Disconnect()
  local bHasLogOut = HeroUSDKSubsystem().UserInfo.sdkUserId == ""
  if HeroUSDKSubsystem():IsHeroSDKEnable() and not bHasLogOut and not UUCloudGameInstanceSubsystem.IsCloudGame() then
    HeroUSDKSubsystem():CleanUpUserInfo()
    if HeroUSDKSubsystem():IsBilibili() then
      HeroUSDKSubsystem():HeroSDKLogout()
    end
  end
  self:LogoutEvent()
  WorldTravelSubsystem():ChangeSceneByAssetPath(Const.DefaultLoginSceneFile)
end

function BP_NetworkManager_C:ShowNetDisconnectUIConfirm()
  local IsStopGame = true
  if GWorld.GameInstance:GetLoadingUI() then
    IsStopGame = false
    if CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance) == "PC" then
      local GameInputSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance)
      GameInputSubsystem:SetMouseCursorVisable(true)
    end
  elseif UGameplayStatics.GetCurrentLevelName(self) == "Login" then
    return
  end
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if UIManager then
    local Params = {
      LeftCallbackObj = self,
      LeftCallbackFunction = self.TryToGoToLoginScene,
      RightCallbackObj = self,
      RightCallbackFunction = self.TryToGoToLoginScene
    }
    UIManager:ShowDisconnectUIConfirm(CONFIRM_RECONNECT, IsStopGame, Params)
  end
end

function BP_NetworkManager_C:UpdateNetDisconnectUIConfirm()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local NetDisConnectedDialogUI = UIManager:GetUIObj("NetDisConnectedDialog")
  if nil == NetDisConnectedDialogUI then
    return
  end
  if IsStandAlone(GWorld.GameInstance) then
    local GameMode = GWorld.GameInstance:GetCurrentGameMode()
    if not GameMode then
      return
    end
    if GameMode.SetGamePaused then
      GameMode:SetGamePaused(Const.NetWorkFailure_Tag, true)
    end
  end
end

function BP_NetworkManager_C:StartShowReConnectUI()
  if not GWorld.GameInstance:GetLoadingUI() and UGameplayStatics.GetCurrentLevelName(self) == "Login" then
    return
  end
  DebugPrint("NetworkMgr:StartShowReConnectUI")
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  self.bUIReConnecting = true
  if UIManager then
    UIManager:LoadUINew("LoadingReconnect")
  end
end

function BP_NetworkManager_C:ConnectSuccess()
  DebugPrint("NetworkMgr:ConnectSuccess")
  self:EndReConnect(true)
end

function BP_NetworkManager_C:EndReConnect(bReConnectSucceed, bHeartbeatCall)
  if not bHeartbeatCall then
    DebugPrint("NetworkMgr:EndReConnect")
  end
  if self.bUIReConnecting then
    if self:IsReconnecting() then
      return
    end
    self.bUIReConnecting = false
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    if UIManager then
      local UIObj = UIManager:GetUIObj("LoadingReconnect")
      if UIObj then
        if bReConnectSucceed then
          UIObj:Close()
        else
          UIObj:RealClose()
        end
      end
      local LoginMainPage = UIManager:GetUIObj("LoginMainPage")
      if LoginMainPage then
        LoginMainPage:CloseLoadingReconnect()
      end
    end
  end
end

return BP_NetworkManager_C
