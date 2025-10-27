require("UnLua")
require("DataMgr")
local EMCache = require("EMCache.EMCache")
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local TimeUtils = require("Utils.TimeUtils")
local CdnTool = require("BluePrints/UI/GameLogin/CdnTool")
local MiscUtils = require("Utils.MiscUtils")
local WBP_GameStartMainPage_C = Class("BluePrints.UI.BP_UIState_C")
WBP_GameStartMainPage_C._components = {
  "BluePrints.UI.WBP.Announcement.View.WBP_LoginMainComponent_Announcement"
}
local RightBottomBtnName = {
  "Fix",
  "Set",
  "Support",
  "Announcement",
  "Back"
}

function WBP_GameStartMainPage_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.AccountId = ""
  self.Passwords = ""
  self.bLogin = false
  self.IsQuickLogin = false
  self.TickSpeedInterval = 1
  self.TickSpeedDuration = self.TickSpeedInterval
  self.bIsDownloading = false
  self.IsInRightBtnSelectState = false
  self.bShowPauseUI = true
  self.bEnableGamePadKeyForPatchUpdate = false
  self.bStartedPatch = false
  self.bGroupPatchOutPlaying = false
  self.bCheckPatchInPlaying = false
  self.bCheckPatchOutPlayed = false
  self.PatchFinish = false
  self.bRetryRedownload = false
end

function WBP_GameStartMainPage_C:ReceiveEnterState(EnteredState)
  self.Super.ReceiveEnterState(self, EnteredState)
  if 1 == EnteredState then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    if GameInstance:GetLoadingUI() then
      return
    end
    self.bIsFocusable = true
  end
end

function WBP_GameStartMainPage_C:ReceiveExitState(ExitedState)
  if 0 == ExitedState then
  else
    self:DestroyObject()
  end
end

function WBP_GameStartMainPage_C:BindPatchDelegate()
  local HotUpdateSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self, UHotUpdateSubsystem)
  HotUpdateSubsystem.AssetStartDownloadDelegate:Bind(self, self.OnAssetStartDownload)
  HotUpdateSubsystem.AssetDownloadProgressDelegate:Bind(self, self.OnAssetDownloadProgress)
  HotUpdateSubsystem.HotUpdateEventPreChangeDelegate:Add(self, self.OnHotUpdateEventChanged)
  HotUpdateSubsystem.VertifyAssetsDelegate:Bind(self, self.OnVertifyAssets)
  HotUpdateSubsystem.PatchFailedDelegate:Add(self, self.OnPatchFailed)
  HotUpdateSubsystem.MuteMouseClickDelegate:Bind(self, self.OnMuteMouseClick)
  HotUpdateSubsystem.RepairGameFailedDelegate:Bind(self, self.OnRepairGameFailed)
  HotUpdateSubsystem.OnExamineDelegate:Add(self, self.OnExamineChanged)
end

function WBP_GameStartMainPage_C:Construct()
  self.Super.Construct(self)
  if UE4.UUCloudGameInstanceSubsystem.IsCloudGame() then
    self.Btn_Fix:SetVisibility(ESlateVisibility.Collapsed)
    self.Btn_Close:SetVisibility(ESlateVisibility.Collapsed)
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  GameInstance:InitGameSystemLanguage()
  self.bIsFocusable = true
  self.CanvasPanel_ServerList:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(self) then
    self.Panel_Platform_Selection:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    DebugPrint("Login Main Page Current work in Editor, Play Sound in Construct func")
  end
  local bank = LoadObject("/Game/Asset/Audio/FMOD/Banks/ambience/ambience_login.ambience_login")
  UFMODBlueprintStatics.LoadBank(bank, true, true)
  AudioManager(self):PlayFMODSound(self, nil, "event:/bgm/cbt01/0015_login", "LoginBGM")
  AudioManager(self):PlayFMODSound(self, nil, "event:/ambience/2d/login", "LoginAmb")
  self:PlayAnimation(self.Click)
  self.IsQuickLogin = not HeroUSDKUtils.IsEnable()
  if not self.IsQuickLogin and HeroUSDKUtils.HasLogin() then
    self:SetSwitchBtnVisable(true)
  else
    self:SetSwitchBtnVisable(false)
  end
  self.UID:HideUid()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.HB_UID.Slot:SetPosition(FVector2D(0, self.PositionY_HBUID_P))
    self.Group_LoginButton.Slot:SetPosition(FVector2D(0, self.PositionY_GroupLoginButton_P))
    self.CanvasPanel_Account.Slot:SetPosition(FVector2D(0, self.PositionY_CanvasPanelAccount_P))
    self.Panel_ModeSelection.Slot:SetPosition(FVector2D(0, self.PositionY_PanelModeSelection_P))
    self.Panel_Platform_Selection.Slot:SetPosition(FVector2D(0, self.PositionY_PanelPlatformSelection_P))
  else
    self.HB_UID.Slot:SetPosition(FVector2D(0, self.PositionY_HBUID_M))
    self.Group_LoginButton.Slot:SetPosition(FVector2D(0, self.PositionY_GroupLoginButton_M))
    self.CanvasPanel_Account.Slot:SetPosition(FVector2D(0, self.PositionY_CanvasPanelAccount_M))
    self.Panel_ModeSelection.Slot:SetPosition(FVector2D(0, self.PositionY_PanelModeSelection_M))
    self.Panel_Platform_Selection.Slot:SetPosition(FVector2D(0, self.PositionY_PanelPlatformSelection_M))
  end
  if not GWorld.IsDev then
    self.Group_ServerSelect:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.Text_BottomTips:SetText(GText("UI_Loading_Testing"))
  self.Text_StopDownload:SetText(GText("UI_Loading_Download_Pause"))
  self.Text_ContinueDownload:SetText(GText("UI_Loading_Download_Continue"))
  self.Common_Button_StopDownload:BindEventOnClicked(self, self.TryPauseDownload)
  self.Common_Button_ContinueDownload:BindEventOnClicked(self, self.ResumeDownload)
  self.HB_ContinueDownload:SetVisibility(ESlateVisibility.Collapsed)
  self.HB_StopDownload:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_Login:SetText(GText("UI_LOGIN"))
  self.EditableText_Account:SetHintText(GText("UI_LOGIN_ACCOUNT"))
  self.Text_ServerLoactionTitle:SetText(GText("UI_Server_Current"))
  self.Btn_Close:BindEventOnClicked(self, self.ExitGame)
  self.Btn_Back:BindEventOnClicked(self, self.SwitchAccount)
  self.Btn_Fix:BindEventOnClicked(self, self.RepairGame)
  self.Btn_Set:BindEventOnClicked(self, self.OnClickSet)
  self.Btn_Set:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local RemainTimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(TimeUtils.NowTime())
  self.Com_Time:SetTimeText(GText("UI_Loading_Remain"), RemainTimeDict)
  self.Progress_Download:SetVisibility(ESlateVisibility.Collapsed)
  self.Panel_OverSeaSeverSelect:SetVisibility(ESlateVisibility.Collapsed)
  self:InitWidgetInfoInGamePad()
  if GWorld.IsDev then
    self:LoadLoginInfo()
  end
  self.VB_ServerLocation:SetVisibility(ESlateVisibility.Collapsed)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode:IsEnableHotUpdate() then
    self:ShowLoginUI(false)
  end
  if UE.AHotUpdateGameMode.IsGlobalPak() or UE4.UUCloudGameInstanceSubsystem.IsCloudGame() then
    self["16+"]:SetVisibility(ESlateVisibility.Collapsed)
  else
    self["16+"]:SetVisibility(ESlateVisibility.Visible)
  end
  self.IsQuickLogin = not HeroUSDKUtils.IsEnable()
  if not self.IsQuickLogin and HeroUSDKUtils.HasLogin() then
    self:SetSwitchBtnVisable(true)
  end
  self:BindDelegates()
  local HeroUSDKSubsystem = HeroUSDKSubsystem(self)
  if HeroUSDKSubsystem:IsHeroSDKEnable() then
    self.Btn_Support:SetVisibility(ESlateVisibility.Collapsed)
    self.CanvasPanel_Account:SetVisibility(ESlateVisibility.Collapsed)
    self.Panel_ModeSelection:SetVisibility(ESlateVisibility.Collapsed)
    if HeroUSDKSubsystem:IsBilibili() then
      self.Btn_Support:SetVisibility(ESlateVisibility.Collapsed)
    end
  else
    self.Panel_ModeSelection:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Btn_Development.OnUnhovered:Add(self, self.OnUnHovered_Development)
    self.Btn_Development.OnPressed:Add(self, self.OnPress_Development)
    self.Btn_Player.OnUnhovered:Add(self, self.OnUnHovered_Player)
    self.Btn_Player.OnPressed:Add(self, self.OnPress_Player)
    self.Btn_PC.OnUnhovered:Add(self, self.OnUnHovered_PCMode)
    self.Btn_PC.OnClicked:Add(self, self.OnClick_PCMode)
    self.Btn_Phone.OnUnhovered:Add(self, self.OnUnHovered_MobileMode)
    self.Btn_Phone.OnClicked:Add(self, self.OnClick_MobileMode)
  end
  self.Login.OnHovered:Add(self, self.OnHovered_Login)
  self:BindPatchDelegate()
  if UE.AHotUpdateGameMode.IsGlobalPak() then
    self.Text_Region:SetText("OS_")
  else
    self.Text_Region:SetText("CN_")
  end
  local PlatformName = UGameplayStatics.GetPlatformName()
  local TotalVersionNumber = UE.AHotUpdateGameMode.GetTotalVersionNumber()
  if "Android" == PlatformName then
    self.Text_Device:SetText("Android_")
  elseif "Windows" == PlatformName then
    self.Text_Device:SetText("Windows_")
  elseif "IOS" == PlatformName then
    self.Text_Device:SetText("iOS_")
    self:LoginIOSGameCenter()
  end
  self.Text_Product:SetText("Product_")
  self.Text_Version:SetText(TotalVersionNumber)
  if AHotUpdateGameMode.IsExamineDistribution() then
    self.MediaPlayer:Pause()
    self.WidgetSwitcher_Bg:SetActiveWidgetIndex(1)
  end
end

function WBP_GameStartMainPage_C:OnExamineChanged()
  if AHotUpdateGameMode.IsExamineDistribution() then
    self.MediaPlayer:Pause()
    self.WidgetSwitcher_Bg:SetActiveWidgetIndex(1)
  end
end

function WBP_GameStartMainPage_C:InitWidgetInfoInGamePad()
  self.KeyControllerClose:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "X"}
    },
    bLongPress = true,
    Desc = GText("UI_LOGIN_HoldPress")
  })
  self.KeyControllerClose:AddExecuteLogic(self, self.ExitGame)
  self.KeyLogin:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    }
  })
  self.Key_PatchesDownload:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    }
  })
  self.Key_ContinueDownload:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    }
  })
  self.Key_16:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Menu"}
    }
  })
  self.Key_Other:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    }
  })
  self.Key_OverseaSever:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    }
  })
  for _, value in ipairs(RightBottomBtnName) do
    local TargetBtn = self["Btn_" .. value]
    if nil ~= TargetBtn and TargetBtn:IsVisible() then
      TargetBtn:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
      self.RightSideTargetBtn = TargetBtn
      break
    end
  end
end

function WBP_GameStartMainPage_C:Tick(MyGeometry, InDeltaTime)
  if not self.bIsDownloading then
    return
  end
  self.Progress_Download:SetPercent(self.BytesSoFar / self.TotalBytes)
  self.Text_DownloadPercent:SetText(string.format("%.0f%%", self.BytesSoFar / self.TotalBytes * 100))
  local TotalMB = self.TotalBytes / 1024 / 1024
  local SoFarMB = self.BytesSoFar / 1024 / 1024
  self.Text_DownloadSize_Num1:SetText(string.format("%.0f", SoFarMB))
  self.Text_DownloadSize_Num2:SetText(string.format("%.0f", TotalMB))
  self.TickSpeedDuration = self.TickSpeedDuration - InDeltaTime
  if self.TickSpeedDuration > 0 then
    return
  end
  local DiffBytes = self.BytesSoFar - self.LastBytesSoFar
  self.LastBytesSoFar = self.BytesSoFar
  local SpeedKB = DiffBytes / (self.TickSpeedInterval - self.TickSpeedDuration) / 1024
  local SpeedMB = SpeedKB / 1024
  SpeedKB = math.floor(SpeedKB >= 0 and SpeedKB or 0)
  SpeedMB = math.floor(SpeedMB >= 0 and SpeedMB or 0)
  if self.bShowPauseUI then
    if SpeedMB > 0 then
      self.Text_DownloadSpeed_Num:SetText(string.format("%d", SpeedMB))
      self.Text_DownloadSpeed_Unit:SetText("MB/s")
    else
      self.Text_DownloadSpeed_Num:SetText(string.format("%d", SpeedKB))
      self.Text_DownloadSpeed_Unit:SetText("KB/s")
    end
    if SpeedKB > 0 then
      local BytesRemaning = (self.TotalBytes - self.BytesSoFar) / 1024
      local TimeRemaing = math.floor(BytesRemaning / SpeedKB)
      local EndTime = TimeUtils.NowTime() + TimeRemaing
      local RemainTimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(EndTime)
      self.Com_Time:SetTimeText(GText("UI_Loading_Remain"), RemainTimeDict)
    end
  else
    self.Text_DownloadSpeed_Num:SetText("--")
    self.Text_DownloadSpeed_Unit:SetText("KB/s")
  end
  self.TickSpeedDuration = self.TickSpeedInterval
end

function WBP_GameStartMainPage_C:OnLogout()
  if GWorld.NetworkMgr then
    GWorld.NetworkMgr:Disconnect()
  end
  if not GWorld.IsDev then
    self.ServerInfo = nil
  end
  self.UID:HideUid()
  self.UID:SetUid()
  self.Text_Login:SetText(GText("UI_LOGIN"))
  HeroUSDKSubsystem(self).UserInfo.sdkUserId = ""
  self:SetSwitchBtnVisable(false)
  self.VB_ServerLocation:SetVisibility(ESlateVisibility.Collapsed)
  if self.bSwitchingAccount then
    self.bSwitchingAccount = false
    HeroUSDKSubsystem(self):HeroSDKLogin()
  end
  self.Panel_OverSeaSeverSelect:SetVisibility(ESlateVisibility.Collapsed)
  self.Btn_Announcement:SetVisibility(ESlateVisibility.Collapsed)
end

function WBP_GameStartMainPage_C:ShowPatchUI()
  self.Group_Patches:SetVisibility(ESlateVisibility.Collapsed)
  self:PlayAnimation(self.CheckPatch_In)
  self.Group_CheckPatch:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Group_DownloadPatch:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_CheckPatch:SetText(GText("UI_Loading_Checking"))
end

function WBP_GameStartMainPage_C:PreBindDelegates()
  local HotUpdateSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self, UHotUpdateSubsystem)
  HotUpdateSubsystem.OnCompilePSODelegateStart:Add(self, self.OnCompilePSODelegateStart)
  HotUpdateSubsystem.OnCompilePSODelegateTick:Add(self, self.OnCompilePSODelegateTick)
end

function WBP_GameStartMainPage_C:BindDelegates()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  EventManager:AddEvent(EventID.OnGetAllAvatars, self, self.OnGetAllAvatars)
  EventManager:AddEvent(EventID.OnLoginSuccess, self, self.OnLoginSuccess)
  EventManager:AddEvent(EventID.CloseLoading, self, self.OnCloseLoading)
  local HeroUSDKSubsystem = HeroUSDKSubsystem(self)
  if not HeroUSDKSubsystem:IsHeroSDKEnable() and GameMode:IsEnableHotUpdate() then
    self.Btn_Development.OnUnhovered:Add(self, self.OnUnHovered_Development)
    self.Btn_Development.OnPressed:Add(self, self.OnPress_Development)
    self.Btn_Player.OnUnhovered:Add(self, self.OnUnHovered_Player)
    self.Btn_Player.OnPressed:Add(self, self.OnPress_Player)
  end
  self.Btn_Close:Construct()
  self.Btn_Back:Construct()
  self.Btn_Fix:Construct()
  self.Btn_Set:Construct()
  self.Btn_Support:Construct()
  self.Btn_Close:BindEventOnClicked(self, self.ExitGame)
  self.Btn_Back:BindEventOnClicked(self, self.SwitchAccount)
  self.Btn_Fix:BindEventOnClicked(self, self.RepairGame)
  self.Btn_Set:BindEventOnClicked(self, self.OnClickSet)
  self.Btn_Support:BindEventOnClicked(self, self.OnClickSupport)
  self.Btn_ChangeOverSeaSever.OnClicked:Add(self, self.OnClickServerSelect)
  self:BindForAnnouncement()
end

function WBP_GameStartMainPage_C:OnCloseLoading()
  HeroUSDKSubsystem(self):HeroSDKLogin()
end

function WBP_GameStartMainPage_C:OnClickServerSelect()
  local RecommandSelectHostnum
  if self.RecommandServerInfo then
    RecommandSelectHostnum = self.RecommandServerInfo.hostnum
  end
  local DefaultSelectHostnum
  if self.ServerInfo then
    DefaultSelectHostnum = self.ServerInfo.hostnum
  end
  local Params = {
    AutoFocus = true,
    ServerInfos = self.ServerInfos,
    Avatars = GWorld.GetAvatarInfos,
    RecommandSelectHostnum = RecommandSelectHostnum,
    DefaultSelectHostnum = DefaultSelectHostnum,
    RightCallbackFunction = function(_, ServerInfoPak)
      if not ServerInfoPak then
        return
      end
      local ServerInfo = ServerInfoPak.Content_1
      if not ServerInfo then
        return
      end
      if not GWorld.GetAvatarInfos[ServerInfo.hostnum] then
        ServerInfos = {}
        for k, v in pairs(self.ServerInfos) do
          if v.area == ServerInfo.area then
            ServerInfos[k] = v
          end
        end
        ServerInfo = self:RandomServerInfo(ServerInfos)
      end
      self.ServerInfo = ServerInfo
      self.VB_ServerLocation:SetVisibility(ESlateVisibility.Visible)
      self.Text_ServerLoaction:SetText(GText(ServerInfo.area))
      self.Text_OverSeaSeverTitle:SetText(GText(ServerInfo.area))
    end
  }
  UIManager(self):ShowCommonPopupUI(100244, Params)
end

function WBP_GameStartMainPage_C:RandomServerInfo(InServerInfos)
  if not InServerInfos or not next(InServerInfos) then
    return nil
  end
  local ServerList = {}
  for _, ServerInfo in pairs(InServerInfos) do
    if ServerInfo.is_recommend and ServerInfo.recommend_weight then
      table.insert(ServerList, ServerInfo)
    end
  end
  if 0 == #ServerList then
    for _, ServerInfo in pairs(InServerInfos) do
      table.insert(ServerList, ServerInfo)
    end
  else
    local TotalWeight = 0
    for _, ServerInfo in pairs(ServerList) do
      TotalWeight = TotalWeight + ServerInfo.recommend_weight
    end
    DebugPrint("WBP_GameStartMainPage_C:RandomServerInfo TotalWeight", TotalWeight)
    local RandomWeight = math.random(1, TotalWeight)
    DebugPrint("WBP_GameStartMainPage_C:RandomServerInfo RandomWeight", RandomWeight)
    local CurrentWeight = 0
    for _, ServerInfo in pairs(ServerList) do
      CurrentWeight = CurrentWeight + ServerInfo.recommend_weight
      if RandomWeight <= CurrentWeight then
        DebugPrint("WBP_GameStartMainPage_C:RandomServerInfo Selected Server", ServerInfo.hostnum)
        return ServerInfo
      end
    end
  end
  if 0 == #ServerList then
    return nil
  end
  local RandomIndex = math.random(1, #ServerList)
  return ServerList[RandomIndex]
end

function WBP_GameStartMainPage_C:OnGetAllAvatars()
  DebugPrint("OnGetAllAvatars")
  self:ResetGetAllAvatarsBlock()
  self.ServerInfo = nil
  local CachedServerInfo = EMCache:Get("CacheServerInfo")
  if CachedServerInfo and CachedServerInfo.ServerInfo and CachedServerInfo.SdkUserId == HeroUSDKUtils.GetUserInfo().sdkUserId then
    for _, ServerInfo in pairs(self.ServerInfos) do
      if ServerInfo.hostnum == CachedServerInfo.ServerInfo.hostnum then
        self.ServerInfo = ServerInfo
        break
      end
    end
  end
  if AHotUpdateGameMode.IsGlobalPak() then
    self.Panel_OverSeaSeverSelect:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if not self.ServerInfo then
      local MaxLevel = 0
      local MaxLevelHostnum
      for _, Avatar in pairs(GWorld.GetAvatarInfos) do
        if MaxLevel < Avatar.AvatarInfo.Level then
          MaxLevel = Avatar.AvatarInfo.Level
          MaxLevelHostnum = Avatar.Hostnum
        end
      end
      if MaxLevelHostnum then
        for _, ServerInfo in pairs(self.ServerInfos) do
          if ServerInfo.hostnum == MaxLevelHostnum then
            self.ServerInfo = ServerInfo
            break
          end
        end
      end
      if not self.ServerInfo then
        local RegionCode = HeroUSDKSubsystem(self):GetCountryCode()
        if RegionCode then
          local ServerInfos = {}
          local RegionCodeData = DataMgr.CountryRegionCode[RegionCode]
          if RegionCodeData and RegionCodeData.ServerArea then
            for _, ServerInfo in pairs(self.ServerInfos) do
              if ServerInfo.area == RegionCodeData.ServerArea then
                table.insert(ServerInfos, ServerInfo)
              end
            end
          end
          self.ServerInfo = self:RandomServerInfo(ServerInfos)
        end
        if not self.ServerInfo then
          local ServerList = {}
          for _, ServerInfo in pairs(self.ServerInfos) do
            table.insert(ServerList, ServerInfo)
          end
          table.sort(ServerList, function(a, b)
            return a.area < b.area
          end)
          if #ServerList > 0 then
            local FirstArea = ServerList[1].area
            local NewServerInfos = {}
            for _, ServerInfo in pairs(ServerList) do
              if ServerInfo.area == FirstArea then
                table.insert(NewServerInfos, ServerInfo)
              end
            end
            self.ServerInfo = self:RandomServerInfo(NewServerInfos)
          end
        end
      end
    end
    if not self.ServerInfo then
      HeroUSDKSubsystem(self):UploadTrackLog_Lua("login_fail", {
        fail_info = "ServerInfo\230\152\175nil"
      })
      return
    end
    self.VB_ServerLocation:SetVisibility(ESlateVisibility.Visible)
    self.Text_ServerLoaction:SetText(GText(self.ServerInfo.area))
    self.Text_OverSeaSeverTitle:SetText(GText(self.ServerInfo.area))
  elseif not next(GWorld.GetAvatarInfos) then
    self.ServerInfo = self:RandomServerInfo(self.ServerInfos)
  elseif not self.ServerInfo then
    for _, Avatar in pairs(GWorld.GetAvatarInfos) do
      if self.ServerInfos[Avatar.Hostnum] then
        self.ServerInfo = self.ServerInfos[Avatar.Hostnum]
        break
      end
    end
  end
  if not self.ServerInfo then
    HeroUSDKSubsystem(self):HeroSDKLogout()
    HeroUSDKSubsystem(self):UploadTrackLog_Lua("login_fail", {
      fail_info = "ServerInfo\230\152\175nil"
    })
    UIManager(self):ShowCommonPopupUI(100109)
  else
    self.Text_Login:SetText(GText("UI_LOGIN_ENTERGAME"))
  end
  self.RecommandServerInfo = self.ServerInfo
end

function WBP_GameStartMainPage_C:OnCompilePSODelegateStart(NumPrecompilesRemaining, NumPrecompilesComplete)
  DebugPrint("OnCompilePSODelegateStart", NumPrecompilesRemaining, NumPrecompilesComplete)
  self.Progress_Download:SetVisibility(ESlateVisibility.Visible)
  self.Progress_Download:SetPercent(NumPrecompilesComplete / (NumPrecompilesRemaining + NumPrecompilesComplete))
  self.Text_CheckPatch:SetText(string.format(GText("UI_Login_Shader"), string.format("%.1f", NumPrecompilesComplete / (NumPrecompilesRemaining + NumPrecompilesComplete) * 100)))
end

function WBP_GameStartMainPage_C:OnCompilePSODelegateTick(NumPrecompilesRemaining, NumPrecompilesComplete)
  DebugPrint("OnCompilePSODelegateTick", NumPrecompilesRemaining, NumPrecompilesComplete)
  self.Progress_Download:SetPercent(NumPrecompilesComplete / (NumPrecompilesRemaining + NumPrecompilesComplete))
  self.Text_CheckPatch:SetText(string.format(GText("UI_Login_Shader"), string.format("%.1f", NumPrecompilesComplete / (NumPrecompilesRemaining + NumPrecompilesComplete) * 100)))
end

function WBP_GameStartMainPage_C:RefreshOpInfoByInputDevice(CurInputType, CurGamepadName)
  if CurInputType == ECommonInputType.Touch then
    return
  end
  self.Super.RefreshOpInfoByInputDevice(self, CurInputType, CurGamepadName)
end

function WBP_GameStartMainPage_C:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  local IsUseGamePad = CurInputType == ECommonInputType.Gamepad
  if self.IsInRightBtnSelectState then
    IsUseGamePad = false
  end
  self:UpdateUIStyleInPlatform(IsUseGamePad)
  self.Super.OnUpdateUIStyleByInputTypeChange(self, CurInputType, CurGamepadName)
end

function WBP_GameStartMainPage_C:UpdateUIStyleInPlatform(IsUseGamePad)
  local ActiveWidgetIndex = IsUseGamePad and 1 or 0
  self.WS_Close:SetActiveWidgetIndex(ActiveWidgetIndex)
  self.WS_PatchesDownload:SetActiveWidgetIndex(ActiveWidgetIndex)
  self.WS_ContinueDownload:SetActiveWidgetIndex(ActiveWidgetIndex)
  self.WS_Sign:SetActiveWidgetIndex(ActiveWidgetIndex)
  if IsUseGamePad then
    self.KeyLogin:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Key_16:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Key_Other:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Login:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if UE.AHotUpdateGameMode.IsGlobalPak() or UE4.UUCloudGameInstanceSubsystem.IsCloudGame() then
      self["16+"]:SetVisibility(ESlateVisibility.Collapsed)
    else
      self["16+"]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  else
    self.KeyLogin:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Key_16:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Key_Other:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Login:SetVisibility(UE4.ESlateVisibility.Visible)
    if UE.AHotUpdateGameMode.IsGlobalPak() or UE4.UUCloudGameInstanceSubsystem.IsCloudGame() then
      self["16+"]:SetVisibility(ESlateVisibility.Collapsed)
    else
      self["16+"]:SetVisibility(ESlateVisibility.Visible)
    end
  end
end

function WBP_GameStartMainPage_C:GetServerIdStr()
  if not AHotUpdateGameMode.IsGlobalPak() then
    return "Default"
  end
  self:GetDefaultServerInfo()
  if GWorld.IsDev then
    return tostring(self.ServerInfo.hostnum)
  else
    return GWorld.ChooseServerArea
  end
end

function WBP_GameStartMainPage_C:GetDefaultServerInfo()
  if not self.ServerInfo then
    self.ServerInfo = {}
    if GWorld.IsDev then
      for k, v in MiscUtils.PairsByKeys(require("BluePrints.UI.GameLogin.DevServerList")) do
        self.ServerInfo.hostnum = v.hostnum
        self.ServerInfo.area = v.area
        self.ServerInfo.name = v.name
        self.ServerInfo.ip = v.ip
        self.ServerInfo.port = v.port
        break
      end
    end
  end
end

function WBP_GameStartMainPage_C:Destruct()
  DebugPrint("\231\153\187\229\189\149\231\149\140\233\157\162\230\158\144\230\158\132 Destruct \229\188\128\229\167\139\239\188\154", UE4.URuntimeCommonFunctionLibrary.GetInputMode(self:GetWorld()))
  local HotUpdateSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self, UHotUpdateSubsystem)
  HotUpdateSubsystem.AssetStartDownloadDelegate:Unbind()
  HotUpdateSubsystem.AssetDownloadProgressDelegate:Unbind()
  HotUpdateSubsystem.HotUpdateEventPreChangeDelegate:Remove(self, self.OnHotUpdateEventChanged)
  HotUpdateSubsystem.VertifyAssetsDelegate:Unbind()
  HotUpdateSubsystem.PatchFailedDelegate:Remove(self, self.OnPatchFailed)
  HotUpdateSubsystem.MuteMouseClickDelegate:Unbind()
  HotUpdateSubsystem.RepairGameFailedDelegate:Unbind()
  HotUpdateSubsystem.OnCompilePSODelegateStart:Remove(self, self.OnCompilePSODelegateStart)
  HotUpdateSubsystem.OnCompilePSODelegateTick:Remove(self, self.OnCompilePSODelegateTick)
  HotUpdateSubsystem.OnExamineDelegate:Remove(self, self.OnExamineChanged)
  AudioManager(self):StopSound(self, "LoginAmb")
  self:UnbindForAnnouncement()
  self.Super.Destruct(self)
  self.MediaPlayer:Close()
  AudioManager(self):StopObjectAllSound(self)
  self:ClearOpenAnnouncementAsync()
  EventManager:RemoveEvent(EventID.OnLoginSuccess, self)
  EventManager:RemoveEvent(EventID.OnGetAllAvatars, self)
  EventManager:RemoveEvent(EventID.CloseLoading, self)
  DebugPrint("\231\153\187\229\189\149\231\149\140\233\157\162\230\158\144\230\158\132 Destruct \231\187\147\230\157\159\239\188\154", UE4.URuntimeCommonFunctionLibrary.GetInputMode(self:GetWorld()))
end

function WBP_GameStartMainPage_C:OnLoginSuccess()
  if not GWorld.IsDev then
    EMCache:Set("CacheServerInfo", {
      ServerInfo = self.ServerInfo,
      SdkUserId = HeroUSDKUtils.GetUserInfo().sdkUserId
    })
  end
  self:TryToGoToHomeCity()
  local CdnTool = require("BluePrints/UI/GameLogin/CdnTool")
  CdnTool:GetCdnHideData(self.ServerInfo.hostnum)
end

function WBP_GameStartMainPage_C:TryToGoToHomeCity()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:PlayAnimation(self.Out)
  self.IsGoToHomeCity = true
end

function WBP_GameStartMainPage_C:EnterMainCity()
  WorldTravelSubsystem():ChangeSceneByAssetPath(Const.DefaultMainCityFile)
end

function WBP_GameStartMainPage_C:GetAllAvatars()
  self:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  self.ServerInfos = nil
  CdnTool:GetAllAvatars(self.AccountId, function(Ret, Reason, Servers)
    DebugPrint("GetAllAvatars", Ret, Reason)
    if not Ret or not Servers then
      HeroUSDKSubsystem(self):UploadTrackLog_Lua("login_fail", {fail_info = Reason})
      return
    end
    self.ServerInfos = Servers
  end)
  self:AddTimer(3, function()
    if not GWorld.GetAvatarInfos then
      if GWorld.NetworkMgr then
        GWorld.NetworkMgr:Disconnect()
      end
      GWorld.bLoginConnectFailed = true
      local CheckMaintenanceHostID = 10001
      if AHotUpdateGameMode.IsGlobalPak() then
        CheckMaintenanceHostID = 20001
      end
      if GWorld.IsDev then
        CheckMaintenanceHostID = self.ServerInfo.hostnum
      end
      GWorld.GameInstance:CheckMaintenanceInfo(CheckMaintenanceHostID, function(IsSuccess, bHasContent)
        HeroUSDKSubsystem(self):UploadTrackLog_Lua("login_fail", {
          fail_info = "get avatars timeout"
        })
        self:ResetGetAllAvatarsBlock()
        if IsSuccess and not bHasContent then
          UIManager(self):ShowCommonPopupUI(100109)
        end
      end)
    end
  end, false, 0, "GetAllAvatarsTimer")
end

function WBP_GameStartMainPage_C:ConnectServer()
  DebugPrint("OnClicked Login Button")
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_enter_game", nil, nil)
  if self.bLogin then
    DebugPrint("Login still in cooldown")
    return
  end
  self.bLogin = true
  GWorld.GameInstance.bHandleNetError = false
  self:AddTimer(3, self.ReleaseLoginBtn)
  DebugPrint("Real Login")
  if GWorld:GetAvatar() then
    DebugPrint("Avatar already exists, skipping login")
    return
  end
  GWorld.bLoginConnectFailed = false
  self.AccountId = self.EditableText_Account:GetText()
  self:CacheLoginInfo()
  if HeroUSDKUtils.IsEnable() and not self.bAgreeProtocol then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManger = GameInstance:GetGameUIManager()
    UIManger:ShowCommonPopupUI_Old(100013, self, function()
      self:OnClickAgreeProtocol()
    end)
    return
  end
  self:EMLogin()
end

function WBP_GameStartMainPage_C:OnHeroSDKLogin(Result, UserInfoStr, Msg)
  if self.bSwitchAccount then
    return
  end
  if GWorld.NetworkMgr then
    GWorld.NetworkMgr:Disconnect()
  end
  self.UID:HideUid()
  self.UID:SetUid()
  if not GWorld.IsDev then
    self.ServerInfo = nil
  end
  local Json = require("rapidjson")
  if 0 == Result then
    self:SetSwitchBtnVisable(true)
    DebugPrint("HeroSDK\231\153\187\229\189\149\230\136\144\229\138\159: ", UserInfoStr, Msg)
    DebugPrint("sdk user id", HeroUSDKUtils.GetUserInfo().sdkUserId, type(HeroUSDKUtils.GetUserInfo().sdkUserId))
    HeroUSDKSubsystem(self):SetNewBDCPublicAttriubuteOnInit()
    local BDCSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UNewBdcSubsystem)
    if BDCSubsystem then
      BDCSubsystem:Login(HeroUSDKUtils.GetUserInfo().sdkUserId, "")
    end
    HeroUSDKSubsystem(self):UploadTrackLog("sdk_login", Json.encode({login_state = 1}))
    HeroUSDKSubsystem(self):MSDKUploadCommonEventByEventName("finish_sdk_login")
    GWorld.GetAvatarInfos = nil
    self.AvatarInfo = nil
    local SdkUserInfo = HeroUSDKUtils.GetUserInfo()
    if SdkUserInfo and SdkUserInfo.sdkUserId ~= "" then
      local ChannelId = HeroUSDKSubsystem():GetChannelId()
      local ChannelInfo = DataMgr.ChannelInfo[ChannelId]
      self.AccountId = ChannelInfo.AccountPrefix .. "@" .. tostring(SdkUserInfo.sdkUserId)
      DebugPrint("[OnHeroSDKLogin] Account:", self.AccountId)
    end
    if GWorld.IsDev then
      self.Text_Login:SetText(GText("UI_LOGIN_ENTERGAME"))
    end
    
    local function LoginFunc()
      if AHotUpdateGameMode.IsExamineDistribution() then
        local GameMode = UE4.UGameplayStatics.GetGameMode(self)
        local MirrorChannelId = HeroUSDKSubsystem(self):GetMirrorChannelId()
        local ExamineServerInfo
        for _, v in pairs(DataMgr.ExamineInfo) do
          if v.ChannelID and v.ChannelID == HeroUSDKSubsystem(self):GetChannelId() then
            if v.MirrorChannelID then
              if v.MirrorChannelID == MirrorChannelId then
                ExamineServerInfo = v
                break
              end
            else
              ExamineServerInfo = v
            end
          end
        end
        assert(ExamineServerInfo, "ExamineServerInfo is nil, ChannelId: " .. HeroUSDKSubsystem(self):GetChannelId() .. " MirrorChannelId: " .. MirrorChannelId)
        local HostNum = ExamineServerInfo.HostNum
        self.ServerInfo = {}
        self.ServerInfo.hostnum = HostNum
      elseif GWorld.IsDev then
        self:LoadLoginInfo()
      else
        self:SetVisibility(ESlateVisibility.HitTestInvisible)
        self.ServerInfos = nil
        self:GetAllAvatars()
      end
      self:OpenAnnouncementOnce(true)
    end
    
    LoginFunc()
    self:SendInputDiviceChangeMessage()
  elseif -1 == Result then
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_Login_Fail"))
    HeroUSDKSubsystem(self):UploadTrackLog("sdk_login", Json.encode({login_state = 2}))
    DebugPrint("HeroSDK\231\153\187\229\189\149\229\164\177\232\180\165: ", Msg)
  end
end

function WBP_GameStartMainPage_C:LoginIOSGameCenter()
  UEPrint("LoginIOSGameCenter")
  local PlatformName = UGameplayStatics.GetPlatformName()
  if "IOS" ~= PlatformName then
    return
  end
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  local Proxy = UE4.UShowLoginUICallbackProxy.ShowExternalLoginUI(GWorld.GameInstance, PlayerController)
  Proxy:Activate()
end

function WBP_GameStartMainPage_C:EMLogin()
  DebugPrint("Tianyi@ Start EMLogin....")
  self.IsQuickLogin = not HeroUSDKUtils.IsEnable()
  if not self.IsQuickLogin and not HeroUSDKUtils.HasLogin() then
    HeroUSDKSubsystem(self):HeroSDKLogin()
    return
  end
  if not self.ServerInfo then
    DebugPrint("ServerInfo is nil, trying to get all avatars")
    self:GetAllAvatars()
    return
  end
  local bUploaded = false
  
  local function TimerFunc()
    self:AddTimer(2, function()
      local GameInstance = self:GetGameInstance()
      if GWorld.NetworkMgr then
        DebugPrint("Disconnecting existing network connection...")
        GWorld.NetworkMgr:Disconnect()
      end
      GWorld.bLoginConnectFailed = true
      local CheckMaintenanceHostID = 10001
      if AHotUpdateGameMode.IsGlobalPak() then
        CheckMaintenanceHostID = 20001
      end
      if GWorld.IsDev then
        CheckMaintenanceHostID = self.ServerInfo.hostnum
      end
      GameInstance:CheckMaintenanceInfo(CheckMaintenanceHostID, function(IsSuccess, bHasContent)
        self:CloseLoadingReconnect()
        if IsSuccess and not bHasContent then
          UIManager(self):ShowCommonPopupUI(100109)
          local fail_info = "unknown error "
          fail_info = fail_info .. "hostnum:" .. (self.ServerInfo and tostring(self.ServerInfo.hostnum) or "nil")
          fail_info = fail_info .. "ip:" .. (self.ServerInfo and self.ServerInfo.ip or "nil")
          fail_info = fail_info .. "port:" .. (self.ServerInfo and tostring(self.ServerInfo.port) or "nil")
          HeroUSDKSubsystem(self):UploadTrackLog_Lua("login_fail", {fail_info = fail_info})
        elseif not bUploaded then
          local fail_info = "maintenance "
          fail_info = fail_info .. "hostnum:" .. (self.ServerInfo and tostring(self.ServerInfo.hostnum) or "nil")
          fail_info = fail_info .. "ip:" .. (self.ServerInfo and self.ServerInfo.ip or "nil")
          fail_info = fail_info .. "port:" .. (self.ServerInfo and tostring(self.ServerInfo.port) or "nil")
          HeroUSDKSubsystem(self):UploadTrackLog_Lua("login_fail", {fail_info = fail_info})
        end
      end)
    end, false, 0, "LoadLoadingReconnect")
  end
  
  local function LoginFunc()
    if GWorld.IsDev then
      if not self.ServerInfo or type(self.ServerInfo) == "table" and next(self.ServerInfo) == nil then
        DebugPrint("\229\188\128\229\143\145\230\168\161\229\188\143\228\184\139\239\188\140\230\156\170\233\128\137\230\139\169\230\156\141\229\138\161\229\153\168\239\188\129\239\188\129\239\188\129")
      else
        local hostnum = self.ServerInfo.hostnum
        local ip = self.ServerInfo.ip
        local port = self.ServerInfo.port
        GWorld.NetworkMgr:ConnectServer(hostnum, ip, port, self.AccountId, self.IsQuickLogin)
        TimerFunc()
      end
    elseif AHotUpdateGameMode.IsExamineDistribution() then
      local GameMode = UE4.UGameplayStatics.GetGameMode(self)
      local MirrorChannelId = HeroUSDKSubsystem(self):GetMirrorChannelId()
      local ExamineServerInfo
      for _, v in pairs(DataMgr.ExamineInfo) do
        if v.ChannelID and v.ChannelID == HeroUSDKSubsystem(self):GetChannelId() then
          if v.MirrorChannelID then
            if v.MirrorChannelID == MirrorChannelId then
              ExamineServerInfo = v
              break
            end
          else
            ExamineServerInfo = v
          end
        end
      end
      local HostNum = ExamineServerInfo.HostNum
      local Ip = ExamineServerInfo.IP
      local Port = ExamineServerInfo.Port
      DebugPrint("ExamineServerInfo", HostNum, Ip, Port)
      self.ServerInfo = {}
      self.ServerInfo.hostnum = HostNum
      GWorld.NetworkMgr:ConnectServer(HostNum, Ip, Port, self.AccountId, self.IsQuickLogin)
      TimerFunc()
    else
      GWorld.NetworkMgr:ConnectServer(self.ServerInfo.hostnum, self.ServerInfo.ip, self.ServerInfo.port, self.AccountId, self.IsQuickLogin)
      TimerFunc()
    end
  end
  
  LoginFunc()
  self:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
end

function WBP_GameStartMainPage_C:SwitchAccount()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  if self.bLogin then
    return
  end
  if self.bSwitchCountCD then
    return
  end
  self.bSwitchCountCD = true
  self:AddTimer(3, function()
    self.bSwitchCountCD = false
  end)
  local Platform = UE4.UUIFunctionLibrary.GetDevicePlatformName()
  if "Android" == Platform and not HeroUSDKSubsystem(self):IsGlobalSDK() then
    self.bSwitchingAccount = true
  end
  HeroUSDKSubsystem(self):EMHeroSDKSwitchAccount()
end

function WBP_GameStartMainPage_C:DeleteFileAndReentryGame()
  local GameMode = UGameplayStatics.GetGameMode(self)
  GameMode:RepairGame()
end

function WBP_GameStartMainPage_C:RepairGame()
  local Params = {}
  Params.RightCallbackObj = self
  Params.RightCallbackFunction = self.DeleteFileAndReentryGame
  UIManager(self):ShowCommonPopupUI(100186, Params, self)
end

function WBP_GameStartMainPage_C:OnSwitchAccount(Result, Msg)
  if 0 == Result then
    self:OnLogout()
  end
  DebugPrint("HERO SDK SWITCH ACCOUNT : ", Result, Msg)
end

function WBP_GameStartMainPage_C:ReleaseLoginBtn()
  self.bLogin = false
  DebugPrint("Login cooldown complete")
end

function WBP_GameStartMainPage_C:TryToVerifyAccount()
  self.AccountId = self.EditableText_Account:GetText()
  self:AddTimer(0.5, self.LoginAccountCallback)
end

function WBP_GameStartMainPage_C:LoginAccountCallback()
  self.IsVerifyAccount = true
end

function WBP_GameStartMainPage_C:ShowServerSelect()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  if nil ~= UIManger then
    UIManger:LoadUI(UIConst.SERVERSELEC, "ServerSelect", UIConst.ZORDER_FOR_SECONDARY_POPUP)
    self.Widget_ServerSelect = UIManger:GetUIObj("ServerSelect")
  end
  if nil ~= self.Widget_ServerSelect then
    self.Widget_ServerSelect:Show(UE4.ESlateVisibility.Visible)
  else
    print(_G.LogTag, "Failed to load server selection widget.")
  end
  self.WidgetSwitcher_Server:SetActiveWidgetIndex(1)
end

function WBP_GameStartMainPage_C:DevLoginServer(HostNum, Account)
  local DevServerList = require("BluePrints/UI/GameLogin/DevServerList")
  local Server = DevServerList[HostNum]
  GWorld.NetworkMgr:ConnectServer(Server.hostnum, Server.ip, Server.port, Account, true)
end

function WBP_GameStartMainPage_C:VerifyServerInfo()
  if self.Widget_ServerSelect ~= nil and self.Widget_ServerSelect.IsSelectionChanged == true then
    self.Widget_ServerSelect.IsSelectionChanged = false
    self.ServerInfo = {
      hostnum = self.Widget_ServerSelect.SelectedServer.HostId,
      name = self.Widget_ServerSelect.SelectedServer.Name,
      area = self.Widget_ServerSelect.SelectedServer.Area,
      ip = self.Widget_ServerSelect.SelectedServer.Ip,
      port = self.Widget_ServerSelect.SelectedServer.Port
    }
    self.Text_Server_Select:SetText(self.ServerInfo.hostnum .. " " .. self.ServerInfo.name)
    self:AddTimer(0.01, self.OpenAnnouncementOnce, false, 0, nil, true, true)
  end
  self.WidgetSwitcher_Server:SetActiveWidgetIndex(0)
end

function WBP_GameStartMainPage_C:ExitGame()
  local PlatformName = UGameplayStatics.GetPlatformName()
  local HeroUSDKSubsystem = HeroUSDKSubsystem(self)
  if HeroUSDKSubsystem:IsHeroSDKEnable() and "Android" == PlatformName then
    HeroUSDKSubsystem:HeroSDKExitGame()
  else
    self:ShowExitGamePopupUI()
  end
end

function WBP_GameStartMainPage_C:ShowExitGamePopupUI()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  if nil ~= UIManger then
    UIManger:ShowCommonPopupUI_Old(100003, self, function()
      self:PlayAnimation(self.Out)
      self:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    end, function()
      self.KeyControllerClose:ResetHasButtonPressed()
    end, function()
      self.KeyControllerClose:ResetHasButtonPressed()
    end, nil, true)
  end
end

function WBP_GameStartMainPage_C:RealExitGame()
end

function WBP_GameStartMainPage_C:CacheLoginInfo()
  if GWorld.IsDev then
    local LoginInfo = {
      AccountId = self.EditableText_Account:GetText(),
      Passwards = ""
    }
    if self.ServerInfo then
      LoginInfo.hostnum = self.ServerInfo.hostnum
      LoginInfo.name = self.ServerInfo.name
      LoginInfo.area = self.ServerInfo.area
      LoginInfo.ip = self.ServerInfo.ip
      LoginInfo.port = self.ServerInfo.port
    end
    LoginInfo.EnterMode = self.CurrentMode
    EMCache:Set("LoginInfo", LoginInfo)
  end
end

function WBP_GameStartMainPage_C:LoadLoginInfo(bFirst)
  local LoginInfo = EMCache:Get("LoginInfo")
  if not HeroUSDKUtils.IsEnable() and nil ~= LoginInfo then
    self.EditableText_Account:SetText(LoginInfo.AccountId)
    if LoginInfo.name and LoginInfo.name and LoginInfo.hostnum then
      self.Text_Server_Select:SetText(LoginInfo.hostnum .. " " .. LoginInfo.name)
      self.ServerInfo = {
        hostnum = LoginInfo.hostnum,
        area = LoginInfo.area,
        name = LoginInfo.name,
        ip = LoginInfo.ip,
        port = LoginInfo.port
      }
      self:ChangeEnterMode(nil, LoginInfo.EnterMode)
    end
    if not UE4.UUCloudGameInstanceSubsystem.IsCloudGame() then
      local CachePlatform = EMCache:Get("DebugPlatform")
      if not CachePlatform then
        CachePlatform = "PC"
        EMCache:Set("DebugPlatform", CachePlatform)
      end
      self:ChangePlatformMode(nil, CachePlatform)
    end
  elseif GWorld.IsDev or not bFirst then
    self:ChangeEnterMode()
    self:ChangePlatformMode()
    if LoginInfo and nil ~= LoginInfo.name and LoginInfo.name ~= "" then
      self.Text_Server_Select:SetText(LoginInfo.hostnum .. " " .. LoginInfo.name)
      self.ServerInfo = {
        hostnum = LoginInfo.hostnum,
        area = LoginInfo.area,
        name = LoginInfo.name,
        ip = LoginInfo.ip,
        port = LoginInfo.port
      }
      self:ChangeEnterMode(nil, LoginInfo.EnterMode)
    else
      self:GetDefaultServerInfo()
    end
    self.EditableText_Account:SetText("")
    self.Text_Server_Select:SetText(self.ServerInfo.hostnum .. " " .. self.ServerInfo.name)
  end
end

function WBP_GameStartMainPage_C:OnAnimationFinished(InAnimation)
  if InAnimation == self.Out then
    self:CloseLoadingReconnect()
    if not self.IsGoToHomeCity then
      self:ForceQuitGame()
    else
      self.IsGoToHomeCity = false
    end
  elseif InAnimation == self.CADPA_Click then
    self:PlayAnimation(self.CADPA_UnHover)
  elseif InAnimation == self.Group_Patches_Out then
    self.Group_Patches:SetVisibility(ESlateVisibility.Collapsed)
    if AHotUpdateGameMode.IsExamineDistribution() then
      self.WidgetSwitcher_Bg:SetActiveWidgetIndex(1)
    elseif CommonUtils.GetDeviceTypeByPlatformName(self) ~= "PC" then
      self.MediaPlayer:Play()
      self.WidgetSwitcher_Bg:SetActiveWidgetIndex(0)
    end
    self.bIsDownloading = false
    self:PlayAnimation(self.CheckPatch_In)
    self.Group_CheckPatch:SetVisibility(ESlateVisibility.Visible)
    self.Text_CheckPatch:SetText(GText("UI_Loading_Verifying"))
    self.bEnableGamePadKeyForPatchUpdate = false
  elseif InAnimation == self.CheckPatch_Out then
    self:ShowLoginUI(true)
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if not HeroUSDKUtils.IsEnable() and GWorld.IsDev then
      self:OpenAnnouncementOnce(true)
    elseif UE4.UUCloudGameInstanceSubsystem.IsCloudGame() then
      DebugPrint("Cloud Game Login, waiting for HeroSDK login")
      if HeroUSDKUtils.GetUserInfo().sdkUserId ~= "" then
        self:OnHeroSDKLogin(0, HeroUSDKUtils.GetUserInfo().sdkUserId, "Cloud Game Login Success")
      else
        DebugPrint("Cloud Game UserId is empty, waiting for HeroSDK login")
      end
    else
      local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
      if GameInstance and GameInstance:GetLoadingUI() then
        return
      end
      HeroUSDKSubsystem(self):HeroSDKLogin()
    end
  elseif InAnimation == self.CheckPatch_In and self.PatchFinish and not self.bCheckPatchOutPlayed then
    DebugPrint("Play Anim CheckPatch_In CheckPatch_Out")
    self:PlayAnimation(self.CheckPatch_Out)
  end
end

function WBP_GameStartMainPage_C:OnClickProtocol()
  if not HeroUSDKUtils.IsEnable() then
    return
  end
  self.Panel_Agreement:SetVisibility(UE4.ESlateVisibility.Visible)
  self.Panel_Pos:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local Json = require("rapidjson")
  local Protocol = Json.decode(HeroUSDKSubsystem(self):GetProtocolResult())
  local ProtocolStr = string.format(GText("UI_LOGIN_PROTOCOL"), Protocol.userAgrUrl, Protocol.userAgrName, Protocol.priAgrUrl, Protocol.priAgrName, Protocol.childAgrUrl, Protocol.childAgrName)
  self.Text_Agreement:SetText(ProtocolStr)
end

function WBP_GameStartMainPage_C:OnClickCloseProtocol()
  if not HeroUSDKUtils.IsEnable() then
    return
  end
  self.Panel_Agreement:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_Pos:SetVisibility(UE4.ESlateVisibility.Visible)
end

function WBP_GameStartMainPage_C:OnClickAgreeProtocol()
  if not HeroUSDKUtils.IsEnable() then
    return
  end
  self.bAgreeProtocol = not self.bAgreeProtocol
  if self.bAgreeProtocol then
    self.Img_check:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    self.Text_Tips:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Img_check:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Text_Tips:SetVisibility(ESlateVisibility.Visible)
  end
end

function WBP_GameStartMainPage_C:OnClickSet()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  UIManager(self):LoadUINew("Setting", true, self)
end

function WBP_GameStartMainPage_C:OnClickSupport()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  HeroUSDKSubsystem(self):OpenService()
end

function WBP_GameStartMainPage_C:OnAccountTextChanged(Text)
end

function WBP_GameStartMainPage_C:OnPress_Development()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_03", nil, nil)
  self:ChangeEnterMode(self.Switch_Development, "Development")
end

function WBP_GameStartMainPage_C:OnPress_Player()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_03", nil, nil)
  self:ChangeEnterMode(self.Switch_Player, "Player")
end

function WBP_GameStartMainPage_C:ChangeEnterMode(Btn, Mode)
  if HeroUSDKUtils.IsEnable() then
    return
  end
  if not Mode or "" == Mode then
    Mode = "Development"
  end
  GWorld.EnterMode = Mode
  DebugPrint("EnterMode changed to ", Mode)
  if self.CurrentMode == Mode then
    return
  end
  if not Btn then
    if "Development" == Mode then
      Btn = self.Switch_Development
    else
      Btn = self.Switch_Player
    end
  end
  self.CurrentMode = Mode
  Btn:SetActiveWidgetIndex(2)
  if "Development" == Mode then
    self.Switch_Player:SetActiveWidgetIndex(0)
  else
    self.Switch_Development:SetActiveWidgetIndex(0)
  end
end

function WBP_GameStartMainPage_C:OnUnHovered_Development()
  self:OnUnHovered(self.Switch_Development, "Development", self.CurrentMode)
end

function WBP_GameStartMainPage_C:OnUnHovered_Player()
  self:OnUnHovered(self.Switch_Player, "Player", self.CurrentMode)
end

function WBP_GameStartMainPage_C:OnClick_PCMode()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_03", nil, nil)
  self:ChangePlatformMode(self.Switch_PC, "PC")
  EMCache:Set("DebugPlatform", "PC")
end

function WBP_GameStartMainPage_C:OnClick_MobileMode()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_03", nil, nil)
  self:ChangePlatformMode(self.Switch_Phone, "Mobile")
  EMCache:Set("DebugPlatform", "Mobile")
end

function WBP_GameStartMainPage_C:ChangePlatformMode(Btn, Mode)
  if HeroUSDKUtils.IsEnable() then
    return
  end
  if UUCloudGameInstanceSubsystem.IsCloudGame() then
    return
  end
  if not Mode or "" == Mode then
    Mode = "PC"
  end
  if not Btn then
    if "PC" == Mode then
      Btn = self.Switch_PC
    else
      Btn = self.Switch_Phone
    end
  end
  self:SetUsePhoneMap(Mode)
  self.CurrentPlatform = Mode
  GWorld.EnterPlatform = Mode
  Btn:SetActiveWidgetIndex(2)
  if "PC" == Mode then
    UInputSettings.GetInputSettings().bUseMouseForTouch = false
    UE4.UUIFunctionLibrary.SetGameIsFakingTouchEvents(false)
    self.Switch_Phone:SetActiveWidgetIndex(0)
  else
    UInputSettings.GetInputSettings().bUseMouseForTouch = true
    UE4.UUIFunctionLibrary.SetGameIsFakingTouchEvents(true)
    self.Switch_PC:SetActiveWidgetIndex(0)
  end
end

function WBP_GameStartMainPage_C:SetUsePhoneMap(Mode)
  if UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(self) then
    if "PC" == Mode then
      UE4.UKismetSystemLibrary.ExecuteConsoleCommand(self, "stats.UseMapPhoneInPC false", nil)
    else
      UE4.UKismetSystemLibrary.ExecuteConsoleCommand(self, "stats.UseMapPhoneInPC true", nil)
    end
  end
end

function WBP_GameStartMainPage_C:OnHovered_Login()
  if self.bLogin then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/hover_enter_game", nil, nil)
end

function WBP_GameStartMainPage_C:OnUnHovered_PCMode()
  self:OnUnHovered(self.Switch_PC, "PC", self.CurrentPlatform)
end

function WBP_GameStartMainPage_C:OnUnHovered_MobileMode()
  self:OnUnHovered(self.Switch_Phone, "Mobile", self.CurrentPlatform)
end

function WBP_GameStartMainPage_C:OnUnHovered(Btn, Mode, CompareModeValue)
  local bCurrentMode = Mode == CompareModeValue
  if bCurrentMode then
    Btn:SetActiveWidgetIndex(2)
  else
    Btn:SetActiveWidgetIndex(0)
  end
end

function WBP_GameStartMainPage_C:OnAssetStartDownload(TotalBytes, DownloadedBytes)
  if not self.bStartedPatch then
    self.TotalBytes = TotalBytes
    self.BytesSoFar = 0
    self.LastBytesSoFar = 0
    self.bIsDownloading = true
    self.PaksInfo = {}
    self.Text_DownloadSpeed_Num:SetText("0")
    self.Text_DownloadSpeed_Unit:SetText("KB/s")
    self.Text_DownloadSize_Num1:SetText("0")
    self.Text_DownloadSize_Num2:SetText("0")
    self.Text_DownloadPercent:SetText("0%")
    self.Progress_Download:SetPercent(0)
    self.Progress_Download:SetVisibility(ESlateVisibility.Visible)
    if not self.bRetryRedownload then
      self:PlayAnimation(self.Group_Patches_In)
    end
    self.Group_Patches:SetVisibility(ESlateVisibility.Visible)
    self.bEnableGamePadKeyForPatchUpdate = true
    if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "PC" then
      self.MediaPlayer:Pause()
      self.WidgetSwitcher_Bg:SetActiveWidgetIndex(1)
    end
  end
  self.bStartedPatch = true
  self.DownloadedBytes = DownloadedBytes
  if self.DownloadedBytes > 0 then
    self.PaksInfo = {}
  end
  self.Group_CheckPatch:SetVisibility(ESlateVisibility.Collapsed)
  self.Group_DownloadPatch:SetVisibility(ESlateVisibility.Visible)
  self.Text_DownloadPack:SetText(GText("UI_Loading_Downloading"))
  self:ShowPauseUI(true)
end

function WBP_GameStartMainPage_C:OnAssetDownloadProgress(Url, InBytesSoFar, InTotalBytes, PatchSign)
  if not self.PaksInfo then
    self.PaksInfo = {}
  end
  if not self.PaksInfo[Url] then
    self.PaksInfo[Url] = {}
  end
  self.PaksInfo[Url].BytesSoFar = InBytesSoFar
  self.BytesSoFar = 0
  self.BytesSoFar = self.BytesSoFar + self.DownloadedBytes
  for _, PakInfo in pairs(self.PaksInfo) do
    self.BytesSoFar = self.BytesSoFar + PakInfo.BytesSoFar
  end
end

function WBP_GameStartMainPage_C:OnHotUpdateEventChanged(UpdateEvent)
  if UpdateEvent == EUpdateEvent.DownloadCompleted then
    self.Group_CheckPatch:SetVisibility(ESlateVisibility.Visible)
    self.Group_DownloadPatch:SetVisibility(ESlateVisibility.Collapsed)
    self.Text_CheckPatch:SetText(GText("UI_PATCH_MOUNTASSTES"))
  elseif UpdateEvent == EUpdateEvent.GameStart then
    EMCache:SaveCommon(true)
  end
end

function WBP_GameStartMainPage_C:OnVertifyAssets()
  self:PlayAnimation(self.Group_Patches_Out)
end

function WBP_GameStartMainPage_C:OnMuteMouseClick(bMute)
  if bMute then
    self:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  else
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_GameStartMainPage_C:OnRepairGameFailed()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  UIManger:ShowUITip(UIConst.Tip_CommonToast, GText("UI_Patch_Fix_Fail"))
end

function WBP_GameStartMainPage_C:OnPatchFailed(UpdateEvent, bRetry)
  if UpdateEvent == EUpdateEvent.GetRemoteVersionFailed then
    if bRetry then
      local GameMode = UGameplayStatics.GetGameMode(self)
      GameMode:ReGetRemoveVersion()
    else
      self:ShowPatchPopUI(100020, function()
        local GameMode = UGameplayStatics.GetGameMode(self)
        GameMode:ReGetRemoveVersion()
      end, function()
        self:ForceQuitGame()
      end)
    end
  elseif UpdateEvent == EUpdateEvent.GetRemotePakListFailed then
    if bRetry then
      local GameMode = UGameplayStatics.GetGameMode(self)
      self.bStartedPatch = false
      GameMode:ReDiffAssetList()
    else
      self:ShowPatchPopUI(100021, function()
        local GameMode = UGameplayStatics.GetGameMode(self)
        self.bStartedPatch = false
        GameMode:ReDiffAssetList()
      end, function()
        self:ForceQuitGame()
      end)
    end
  elseif UpdateEvent == EUpdateEvent.DownloadFailed then
    self.PaksInfo = {}
    if bRetry then
      local GameMode = UGameplayStatics.GetGameMode(self)
      self.bStartedPatch = false
      self.bRetryRedownload = true
      GameMode:ReDownloadAssets()
    else
      self:ShowPatchPopUI(100022, function()
        local GameMode = UGameplayStatics.GetGameMode(self)
        self.bStartedPatch = false
        self.bRetryRedownload = false
        GameMode:ReDownloadAssets()
      end, function()
        self:ForceQuitGame()
      end)
    end
  elseif UpdateEvent == EUpdateEvent.VerifyFailed then
    self.PaksInfo = {}
    self:ShowPatchPopUI(100022, function()
      local GameMode = UGameplayStatics.GetGameMode(self)
      self.bStartedPatch = false
      self.bRetryRedownload = false
      GameMode:ReDownloadAssets()
    end, function()
      self:ForceQuitGame()
    end)
  elseif UpdateEvent == EUpdateEvent.DownloadSaveFailed then
    if bRetry then
      local GameMode = UGameplayStatics.GetGameMode(self)
      self.bStartedPatch = false
      self.bRetryRedownload = true
      GameMode:ReDownloadAssets()
    else
      self:ShowPatchPopUI(100023, function()
        local GameMode = UGameplayStatics.GetGameMode(self)
        self.bStartedPatch = false
        self.bRetryRedownload = false
        GameMode:ReDownloadAssets()
      end, function()
        self:ForceQuitGame()
      end)
    end
  elseif UpdateEvent == EUpdateEvent.PersistentFailed_ReDownload or UpdateEvent == EUpdateEvent.PersistentFailed_PakMoveFailed or UpdateEvent == EUpdateEvent.PersistentFailed_InfoFileMoveFailed or UpdateEvent == EUpdateEvent.PersistentFailed_VersionListWriteFailed then
    if bRetry then
      local GameMode = UGameplayStatics.GetGameMode(self)
      self.bStartedPatch = false
      GameMode:ContinueOrReDownloadPath(UpdateEvent)
    else
      self:ShowPatchPopUI(100023, function()
        local GameMode = UGameplayStatics.GetGameMode(self)
        self.bStartedPatch = false
        GameMode:ContinueOrReDownloadPath(UpdateEvent)
      end, function()
        self:ForceQuitGame()
      end)
    end
  end
end

function WBP_GameStartMainPage_C:OnPatchPreSuccess(bFrist)
  DebugPrint("Login Main Page Play Sound")
  AudioManager(self):PlayFMODSound(self, nil, "event:/bgm/cbt01/0015_login", "LoginBGM")
  AudioManager(self):PlayFMODSound(self, nil, "event:/ambience/2d/login", "LoginAmb")
end

function WBP_GameStartMainPage_C:OnPatchFinished(bFrist)
  local totalVersionNumber = UE.AHotUpdateGameMode.GetTotalVersionNumber()
  self.Text_Version:SetText(totalVersionNumber)
  self.PatchFinish = true
  if bFrist then
    self:LoadLoginInfo(true)
    self:BindDelegates()
  end
  self.Btn_Support:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  if AHotUpdateGameMode.IsExamineDistribution() or HeroUSDKSubsystem(self):IsBilibili() or UE4.UUCloudGameInstanceSubsystem.IsCloudGame() then
    self.Btn_Support:SetVisibility(ESlateVisibility.Collapsed)
  end
  UIManager(self):UnLoadUI("CommonDialog")
  self.bGroupPatchOutPlaying = self:IsAnimationPlaying(self.Group_Patches_Out)
  self.bCheckPatchInPlaying = self:IsAnimationPlaying(self.CheckPatch_In)
  if not self.bGroupPatchOutPlaying and not self.bCheckPatchInPlaying then
    self.bCheckPatchOutPlayed = true
    DebugPrint("Play Anim OnPatchFinished CheckPatch_Out")
    self:PlayAnimation(self.CheckPatch_Out)
  end
end

function WBP_GameStartMainPage_C:ShowLoginUI(bShow)
  if bShow then
    self.main:SetVisibility(ESlateVisibility.Visible)
    self.Group_Patches:SetVisibility(ESlateVisibility.Collapsed)
    self.Group_CheckPatch:SetVisibility(ESlateVisibility.Collapsed)
    self.Progress_Download:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.main:SetVisibility(ESlateVisibility.Collapsed)
    self.Group_CheckPatch:SetVisibility(ESlateVisibility.Visible)
  end
end

function WBP_GameStartMainPage_C:ShowPatchPopUI(Id, RightBtnCallBack, LeftBtnCallBack)
  local Params = {}
  Params.CloseBtnCallbackFunction = LeftBtnCallBack
  Params.LeftCallbackFunction = LeftBtnCallBack
  Params.RightCallbackFunction = RightBtnCallBack
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  UIManager:ShowCommonPopupUI(Id, Params, self)
end

function WBP_GameStartMainPage_C:ShowPatchPopUI_ReplaceText(Id, ReplaceText, RightBtnCallBack, LeftBtnCallBack)
  local Params = {}
  Params.LeftCallbackFunction = LeftBtnCallBack
  Params.RightCallbackFunction = RightBtnCallBack
  Params.ShortText = ReplaceText
  Params.DontPlayOutAnimation = true
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  UIManager:ShowCommonPopupUI(Id, Params, self)
end

function WBP_GameStartMainPage_C:ShowPauseUI(bShow)
  if bShow then
    self.HB_StopDownload:SetVisibility(ESlateVisibility.Visible)
    self.HB_ContinueDownload:SetVisibility(ESlateVisibility.Collapsed)
    self.Text_DownloadPack:SetText(GText("UI_Loading_Downloading"))
    self.bShowPauseUI = true
  else
    self.HB_StopDownload:SetVisibility(ESlateVisibility.Collapsed)
    self.HB_ContinueDownload:SetVisibility(ESlateVisibility.Visible)
    self.Text_DownloadPack:SetText(GText("UI_Loading_Pausing"))
    self.Com_Time.Text_TimeTitle:SetText(GText("UI_Loading_Remain"))
    local FinalStr = string.format("-%s-%s", GText("UI_GameEvent_TimeRemain_Min"), GText("UI_GameEvent_TimeRemain_Sec"))
    self.Com_Time.Text_TimeDesc:SetText(FinalStr)
    self.bShowPauseUI = false
  end
end

function WBP_GameStartMainPage_C:TryPauseDownload()
  self:ShowPatchPopUI(100026, function()
    self:PauseDownload()
  end, function()
  end)
end

function WBP_GameStartMainPage_C:PauseDownload()
  self:ShowPauseUI(false)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:CancelDownloadAssets()
end

function WBP_GameStartMainPage_C:ResumeDownload()
  self:ShowPauseUI(true)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:ReDownloadAssets()
end

function WBP_GameStartMainPage_C:ShowOptionPatchPopUI(OptionalAssetsSize, TotalSize)
  local Id = -1
  local ReplaceText
  if 0 == OptionalAssetsSize then
    Id = 100024
    local SizeStr = string.format("%.1f", TotalSize / 1024 / 1024)
    if "0.00" == SizeStr then
      SizeStr = "0.01"
    end
    ReplaceText = string.format(GText("UI_Loading_Download_Complete"), SizeStr)
  else
    Id = 100025
    local TotalSizeStr = string.format("%.1f", TotalSize / 1024 / 1024)
    local OptionalAssetsSizeStr = string.format("%.1f", OptionalAssetsSize / 1024 / 1024)
    if "0.00" == TotalSizeStr then
      TotalSizeStr = "0.01"
    end
    if "0.00" == OptionalAssetsSizeStr then
      OptionalAssetsSizeStr = "0.01"
    end
    ReplaceText = string.format(GText("UI_Loading_Download_Addition"), TotalSizeStr, OptionalAssetsSizeStr)
  end
  self:ShowPatchPopUI_ReplaceText(Id, ReplaceText, function()
    local GameMode = UGameplayStatics.GetGameMode(self)
    GameMode:EnsureDonwloadOptionAssets(true)
  end, function()
    local GameMode = UGameplayStatics.GetGameMode(self)
    GameMode:EnsureDonwloadOptionAssets(false)
  end)
end

function WBP_GameStartMainPage_C:ShowDownloadBasepakUI()
  self:ShowPatchPopUI(100031, function()
    local HyperLink = ""
    for _, v in pairs(DataMgr.ExamineInfo) do
      if v.ChannelID and v.ChannelID == HeroUSDKSubsystem(self):GetChannelId() then
        local MirrorChannelID = v.MirrorChannelID
        MirrorChannelID = MirrorChannelID or 0
        local SDKMirrorChannelID = HeroUSDKSubsystem(self):GetMirrorChannelId()
        if SDKMirrorChannelID <= 0 then
          SDKMirrorChannelID = 0
        end
        if MirrorChannelID == SDKMirrorChannelID then
          HyperLink = v.JumpURL or ""
          break
        end
      end
    end
    if "" == HyperLink then
      self:ForceQuitGame()
    else
      UE4.UKismetSystemLibrary.LaunchURL(HyperLink)
      self:ForceQuitGame()
    end
  end, function()
    local HyperLink = ""
    for _, v in pairs(DataMgr.ExamineInfo) do
      if v.ChannelID and v.ChannelID == HeroUSDKSubsystem(self):GetChannelId() then
        local MirrorChannelID = v.MirrorChannelID
        MirrorChannelID = MirrorChannelID or 0
        local SDKMirrorChannelID = HeroUSDKSubsystem(self):GetMirrorChannelId()
        if SDKMirrorChannelID <= 0 then
          SDKMirrorChannelID = 0
        end
        if MirrorChannelID == SDKMirrorChannelID then
          HyperLink = v.JumpURL or ""
          break
        end
      end
    end
    if "" == HyperLink then
      self:ForceQuitGame()
    else
      UE4.UKismetSystemLibrary.LaunchURL(HyperLink)
      self:ForceQuitGame()
    end
  end)
end

function WBP_GameStartMainPage_C:OnClickAgeBtn()
  local Params = {}
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  UIManager:ShowCommonPopupUI(100046, Params, self)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  self:PlayAnimation(self.CADPA_Click)
end

function WBP_GameStartMainPage_C:SetSwitchBtnVisable(bShow)
  local bIsWegameChannel = UE4.UUsdkSettings:GetDefaultObject().Channel == UE4.EHeroUSDKChannel.WeGame
  if bShow and not bIsWegameChannel and not UE4.UUCloudGameInstanceSubsystem.IsCloudGame() then
    self.Btn_Back:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Btn_Back:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_GameStartMainPage_C:OnKeyDown(MyGeometry, InKeyEvent)
  if self:GetVisibility() == UE4.ESlateVisibility.HitTestInvisible then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local CurInputType = UGameInputModeSubsystem.GetGameInputModeSubsystem(self):GetCurrentInputType()
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == UIConst.GamePadKey.LeftThumb then
      IsEventHandled = true
      if self.IsInRightBtnSelectState then
        self:LeaveRightBtnSelectMode()
      else
        self:EnterRightBtnSelectMode()
      end
    elseif InKeyName == UIConst.GamePadKey.SpecialRight and not self.IsInRightBtnSelectState then
      IsEventHandled = true
      self:OnClickAgeBtn()
    elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft and not self.IsInRightBtnSelectState then
      IsEventHandled = true
      self.KeyControllerClose:OnButtonPressed()
    elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
      IsEventHandled = true
      self:LeaveRightBtnSelectMode()
    elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
      if self.bEnableGamePadKeyForPatchUpdate then
        if self.bShowPauseUI then
          self:TryPauseDownload()
        else
          self:ResumeDownload()
        end
      elseif GWorld.GetAvatarInfos and AHotUpdateGameMode.IsGlobalPak() then
        self:OnClickServerSelect()
      end
    elseif InKeyName == UIConst.GamePadKey.FaceButtonBottom and not self.IsInRightBtnSelectState and not self.bEnableGamePadKeyForPatchUpdate and not self.IsInRightBtnSelectState and not self.bLogin then
      IsEventHandled = true
      self:ConnectServer()
    end
  elseif "Escape" == InKeyName and CurInputType == ECommonInputType.Touch then
    self:ExitGame()
    IsEventHandled = true
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_GameStartMainPage_C:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    IsEventHandled = true
    self.KeyControllerClose:OnButtonReleased()
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_GameStartMainPage_C:EnterRightBtnSelectMode()
  if self.IsInRightBtnSelectState then
    return
  end
  self.IsInRightBtnSelectState = true
  self:OnSelectModeChange(false)
end

function WBP_GameStartMainPage_C:LeaveRightBtnSelectMode()
  if not self.IsInRightBtnSelectState then
    return
  end
  self.IsInRightBtnSelectState = false
  self:OnSelectModeChange(true)
end

function WBP_GameStartMainPage_C:OnSelectModeChange(IsUseGamePadMode)
  self:UpdateUIStyleInPlatform(IsUseGamePadMode)
  if self.IsInRightBtnSelectState then
    self.Key_Other:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if self.GameInputModeSubsystem then
      if self.RightSideTargetBtn then
        self.GameInputModeSubsystem:SetTargetUIFocusWidget(self.RightSideTargetBtn.Button_Area)
      else
        for _, value in ipairs(RightBottomBtnName) do
          local TargetBtn = self["Btn_" .. value]
          if nil ~= TargetBtn and TargetBtn:IsVisible() then
            self.GameInputModeSubsystem:SetTargetUIFocusWidget(TargetBtn.Button_Area)
            self.RightSideTargetBtn = TargetBtn
            break
          end
        end
      end
    end
  else
    if self.GameInputModeSubsystem then
      self.GameInputModeSubsystem:SetTargetUIFocusWidget(self.Login)
    end
    self.Key_Other:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_GameStartMainPage_C:CloseLoadingReconnect(bLoginSuccess)
  self:RemoveTimer("LoadLoadingReconnect")
  if not bLoginSuccess then
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_GameStartMainPage_C:ForceQuitGame()
  local GameMode = UGameplayStatics.GetGameMode(self)
  GameMode:ForceQuitGame(false)
end

function WBP_GameStartMainPage_C:SendInputDiviceChangeMessage()
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  local CurInputDeviceType = GameInputModeSubsystem:GetCurrentInputType()
  DebugPrint("yklua___@BP_EMGameInstance_C BP_EMGameInstance_C:SendInputDiviceChangeMessage", CurInputDeviceType)
  local DeviceTypeMap = {
    [ECommonInputType.MouseAndKeyboard] = "MouseAndKeyboard",
    [ECommonInputType.Gamepad] = "Gamepad",
    [ECommonInputType.Touch] = "Touch",
    [ECommonInputType.Count] = "Count"
  }
  local NewTrack = {
    device_type = DeviceTypeMap[CurInputDeviceType] or "\230\156\170\231\159\165\232\174\190\229\164\135\231\177\187\229\158\139"
  }
  if not DeviceTypeMap[CurInputDeviceType] then
    DebugPrint("yklua \229\136\135\230\141\162\232\174\190\229\164\135\230\151\182\230\151\160\230\179\149\232\175\134\229\136\171\232\190\147\229\133\165\232\174\190\229\164\135\231\177\187\229\158\139")
  end
  HeroUSDKSubsystem(self):UploadTrackLog_Lua("input_device", NewTrack)
end

function WBP_GameStartMainPage_C:ResetGetAllAvatarsBlock()
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:RemoveTimer("GetAllAvatarsTimer")
end

function WBP_GameStartMainPage_C:SetInputUIOnly(IsUIOnly)
  local PreMode, CurMode, CurDeviceType = "PreMode", "CurMode", CommonUtils.GetDeviceTypeByPlatformName(self)
  if not self.GameInputModeSubsystem then
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  end
  PreMode = self.GameInputModeSubsystem:GetCurrentInputMode()
  local UINameText = "LoginMainPage"
  if IsUIOnly then
    local Params = FGameInputModeParams()
    if self.bIsFocusable then
      Params.WidgetToFocus = self
    end
    if "PC" == CurDeviceType then
      Params.bShowMouseCursor = true
    elseif UE4.UUCloudGameInstanceSubsystem.IsCloudGame() then
      self.GameInputModeSubsystem:SetMouseCursorVisable(false)
    end
    Params.MouseLockMode = EMouseLockMode.DoNotLock
    self.GameInputModeSubsystem:EnableInputMode(UINameText, EGameInputMode.UI, Params)
  else
    self.GameInputModeSubsystem:DisableInputMode(UINameText)
  end
  CurMode = self.GameInputModeSubsystem:GetCurrentInputMode()
  if PreMode ~= CurMode then
    DebugPrint("InputModeChange => PreMode:" .. PreMode .. "," .. "CurMode:" .. CurMode .. " The Reason UIName is " .. UINameText)
    EventManager:FireEvent(EventID.SetInputMode, IsUIOnly)
  end
end

function WBP_GameStartMainPage_C:LoginToTargetServer(TargetHostNum)
  if not self.ServerInfos then
    DebugPrint("LoginToTargetServer ServerInfos is nil")
    return
  end
  local TargetServerInfo = self.ServerInfos[TargetHostNum]
  if not TargetServerInfo then
    DebugPrint("LoginToTargetServer TargetServerInfo is nil")
    return
  end
  self.ServerInfo = TargetServerInfo
  self:EMLogin()
end

AssembleComponents(WBP_GameStartMainPage_C)
return WBP_GameStartMainPage_C
