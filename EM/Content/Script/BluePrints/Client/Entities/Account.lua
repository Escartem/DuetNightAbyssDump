local Class = _G.TypeClass
local AvatarEntity = require("BluePrints.Client.Wrapper.Entity").AvatarEntity
local Assemble = require("NetworkEngine.Common.Assemble")
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local MiscUtils = require("Utils.MiscUtils")
local Account = Class("Account", AvatarEntity)
Account.__Component__ = {
  "BluePrints.Client.Entities.Components.EntityBase",
  "BluePrints.Client.Entities.Components.Login"
}

function Account:Init(eid)
  Account.Super.Init(self, eid)
end

function Account:OnBecomePlayer()
  Account.Super.OnBecomePlayer(self)
  self.logger.info("Account OnBecomePlayer")
  if HeroUSDKUtils.IsEnable() and not GWorld.NetworkMgr.IsQuickLogin then
    self:SdkLogin()
  else
    local account_name = GWorld.NetworkMgr:GetAccountName()
    self:QuickLogin(MiscUtils.Trim(account_name), MiscUtils.Trim(account_name))
  end
  self:EnterWorld()
end

function Account:SdkLogin()
  self.logger.debug("SdkLogin")
  local SdkUserInfo = HeroUSDKUtils.GetUserInfo()
  if not SdkUserInfo then
    error("SdkLogin, but SdkUserInfo is invalid!!!")
    return
  end
  local HeroUSDKSubsystem = HeroUSDKSubsystem()
  local HotUpdateSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UHotUpdateSubsystem)
  local PatchKey, PatchVersion, ClientVersion = HotUpdateSubsystem:GetClientVersion()
  local ClientInfo = {
    Hostnum = GWorld.NetworkMgr.hostnum,
    ConnectType = GWorld.NetworkMgr.ConnectType,
    HotfixIndex = GWorld.HotfixDataIndex or 0,
    ClientVersion = {
      [PatchKey] = ClientVersion
    },
    PatchVersion = {
      [PatchKey] = PatchVersion
    }
  }
  local SdkInfo = {
    AccessToken = SdkUserInfo.accessToken,
    SdkUserId = SdkUserInfo.sdkUserId,
    UserName = SdkUserInfo.userName,
    IsGlobalSDK = HeroUSDKUtils.IsGlobalSDK(),
    DeviceId = HeroUSDKSubsystem:GetDeviceId()
  }
  local BDC_Info = {
    appkey = HeroUSDKSubsystem:GetAppKey(),
    channel_id = HeroUSDKSubsystem:GetChannelId(),
    app_channel_id = HeroUSDKSubsystem:GetAppChannelId(),
    device_id = HeroUSDKSubsystem:GetBDCDeviceID(),
    img_channel_id = HeroUSDKSubsystem:GetMirrorChannelId(),
    click_id = HeroUSDKSubsystem.InstallClickID,
    os = HeroUSDKSubsystem:GetOS(),
    sdk_version = HeroUSDKSubsystem:GetBDCSdkVersion(),
    ads_json = HeroUSDKSubsystem:GetAdsJson(),
    user_agent = HeroUSDKSubsystem:GetUserAgent(),
    device_key = HeroUSDKSubsystem:GetDeviceKey(),
    wegame_distribute_id = HeroUSDKSubsystem.WeGameDistributionID,
    android_id = HeroUSDKSubsystem:GetAndroidID(),
    idfa = HeroUSDKSubsystem:GetIDFA(),
    idfv = HeroUSDKSubsystem:GetIDFV()
  }
  local IsGlobalSDk = HeroUSDKUtils.IsGlobalSDK()
  if not IsGlobalSDk then
    BDC_Info.oaid = HeroUSDKSubsystem.Oaid
  else
    BDC_Info.gaid = HeroUSDKSubsystem:GetGaid()
  end
  PrintTable({ClientInfo = ClientInfo}, 2)
  PrintTable({SdkInfo = SdkInfo}, 2)
  self:CallServerMethod("SdkLogin", SdkInfo, ClientInfo, BDC_Info)
end

function Account:NotifyBindDevice()
  self.logger.debug("NotifyBindDevice")
  local Params = {}
  
  function Params.CloseBtnCallbackFunction()
    self:CallServerMethod("ConfirmBindDevice", false)
  end
  
  function Params.LeftCallbackFunction()
    self:CallServerMethod("ConfirmBindDevice", false)
  end
  
  function Params.RightCallbackFunction()
    self:CallServerMethod("ConfirmBindDevice", true)
  end
  
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  UIManager:ShowCommonPopupUI(100071, Params, UIManager:GetUIObj("LoginMainPage"))
end

function Account:QuickLogin(account_name, password)
  self.logger.debug("QuickLogin")
  local HeroUSDKSubsystem = HeroUSDKSubsystem()
  local ChannelId = GWorld.SdkChannel or 237
  local ImgChannelId = GWorld.SdkImgChannel or 0
  local HotUpdateSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UHotUpdateSubsystem)
  local PatchKey, PatchVersion, ClientVersion = HotUpdateSubsystem:GetClientVersion()
  local ClientInfo = {
    Hostnum = GWorld.NetworkMgr.hostnum,
    Account = account_name,
    PassWord = password,
    ConnectType = GWorld.NetworkMgr.ConnectType,
    HotfixIndex = GWorld.HotfixDataIndex or 0,
    ClientVersion = {
      [PatchKey] = ClientVersion
    },
    PatchVersion = {
      [PatchKey] = PatchVersion
    }
  }
  local BDC_Info = {
    appkey = HeroUSDKSubsystem:GetAppKey(),
    channel_id = ChannelId,
    app_channel_id = HeroUSDKSubsystem:GetAppChannelId(),
    img_channel_id = ImgChannelId,
    device_id = "123124342"
  }
  local IsGlobalSDk = HeroUSDKUtils.IsGlobalSDK()
  if not IsGlobalSDk then
    BDC_Info.oaid = HeroUSDKSubsystem.Oaid
  end
  local TestSdkInfo = {ChannelId = ChannelId}
  PrintTable({ClientInfo = ClientInfo}, 2)
  PrintTable({BDC_Info = BDC_Info}, 2)
  self:CallServerMethod("QuickLogin", ClientInfo, BDC_Info, TestSdkInfo)
end

function Account:OnGetAllAvatars(avatars)
  self.logger.debug("OnGetAllAvatars")
  GWorld.NetworkMgr:Disconnect()
  GWorld.GetAvatarInfos = {}
  for i, v in ipairs(avatars) do
    GWorld.GetAvatarInfos[v.Hostnum] = v
  end
  PrintTable({avatars = avatars}, 5)
  EventManager:FireEvent(EventID.OnGetAllAvatars)
end

function Account:OnPatchForceUpdate()
  local LoginMainPage = GWorld.GameInstance:GetGameUIManager():GetUIObj("LoginMainPage")
  if LoginMainPage then
    LoginMainPage:ShowLoginUI(false)
  end
  local GameMode = UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode then
    GameMode:StartUpdate()
  end
end

function Account:LoginResult(ret_code, info)
  self.LoginQueuePopUI = nil
  info = info or {}
  local Reason = info.Reason or ""
  self.logger.debug("LoginResult", ret_code, Reason)
  if ret_code ~= ErrorCode.RET_SUCCESS and GWorld.NetworkMgr then
    GWorld.NetworkMgr:Disconnect()
    local bSimpleDisconnect = ret_code == ErrorCode.RET_LOGIN_IN_DIFF_DEVICE or ret_code == ErrorCode.RET_LOGIN_REFUSE_BIND_DEVICE or ret_code == ErrorCode.RET_LOGIN_WHITE_LIST_CHECK_FAILED
    if ret_code == ErrorCode.RET_LOGIN_BY_CLIENT_VERSION_TOO_LOW then
      local Params = {}
      Params.CloseBtnCallbackFunction = self.OnPatchForceUpdate
      Params.LeftCallbackFunction = self.OnPatchForceUpdate
      Params.RightCallbackFunction = self.OnPatchForceUpdate
      local UIManager = GWorld.GameInstance:GetGameUIManager()
      UIManager:ShowCommonPopupUI(100151, Params, self)
    elseif ret_code == ErrorCode.RET_LOGIN_BY_PATCH_VERSION_TOO_LOW then
      local SplitsReason = string.split(Reason, " ")
      local ServerVersionStr = SplitsReason[#SplitsReason]
      local ServerVersion = tonumber(ServerVersionStr) or -1
      local HotupdateSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UHotUpdateSubsystem)
      HotupdateSubsystem.CacheServerPatchVersion = ServerVersion
      HotupdateSubsystem:SetServerPatchVersionVerifing()
      local Params = {}
      Params.CloseBtnCallbackFunction = self.OnPatchForceUpdate
      Params.LeftCallbackFunction = self.OnPatchForceUpdate
      Params.RightCallbackFunction = self.OnPatchForceUpdate
      local UIManager = GWorld.GameInstance:GetGameUIManager()
      UIManager:ShowCommonPopupUI(100151, Params, self)
    elseif ret_code == ErrorCode.RET_LOGIN_TO_TARGET_SERVER then
      local TargetHostnum = info.TargetHostnum
      if not TargetHostnum then
        self.logger.error("LoginResult RET_LOGIN_TO_TARGET_SERVER but TargetHostnum is nil")
        return
      end
      local UIManager = GWorld.GameInstance:GetGameUIManager()
      local LoginMainPage = UIManager:GetUIObj("LoginMainPage")
      if not LoginMainPage then
        self.logger.error("LoginResult RET_LOGIN_TO_TARGET_SERVER but LoginMainPage is nil")
        return
      end
      self.logger.debug("LoginResult RET_LOGIN_TO_TARGET_SERVER to ", TargetHostnum)
      LoginMainPage:LoginToTargetServer(TargetHostnum)
    elseif ret_code == ErrorCode.RET_LOGIN_QUIT_QUEUE then
      if GWorld.NetworkMgr then
        GWorld.NetworkMgr:Disconnect()
        GWorld.NetworkMgr:LogoutEvent()
      end
    elseif not bSimpleDisconnect then
      GWorld.NetworkMgr:DisconnectAndShowUI(info)
    end
    HeroUSDKSubsystem():CloseLoadingReconnect()
    PrintTable(info, 2, "login_result code:" .. tostring(ret_code))
    if ret_code == ErrorCode.RET_LOGIN_IN_DIFF_DEVICE then
      UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText("UI_CBT1_WARNBINDING_TOAST"))
    elseif ret_code == ErrorCode.RET_LOGIN_WHITE_LIST_CHECK_FAILED then
      UIManager(GWorld.GameInstance):ShowCommonPopupUI(100121)
    end
  end
end

function Account:OnHotfixWhenLogin(HotfixScript, HotfixIndex)
  self.logger.debug("OnHotfixWhenLogin", HotfixScript, HotfixIndex)
  if HotfixIndex then
    require("HotFix").ExecHotFix(HotfixIndex, HotfixScript)
    GWorld.HotfixDataIndex = HotfixIndex
  end
end

function Account:OnNoticeLoginQueue(QueueSite, QueueLength)
  self.logger.debug(string.format("Account:OnNoticeLoginQueue QueueSite:%s QueueLength:%s", QueueSite, QueueLength))
  if self.LoginQueuePopUI then
    return
  end
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local LoginMainPage = UIManager:GetUIObj("LoginMainPage")
  if LoginMainPage then
    LoginMainPage:CloseLoadingReconnect()
  end
  local Params = {
    CloseBtnCallbackFunction = function()
      self:CallServerMethod("QuitLoginQueue")
    end,
    LeftCallbackFunction = function()
      self:CallServerMethod("QuitLoginQueue")
    end,
    RightCallbackFunction = function()
      self:CallServerMethod("QuitLoginQueue")
    end
  }
  self.LoginQueuePopUI = UIManager:ShowCommonPopupUI(100265, Params)
end

Assemble.AssembleComponents(Account)
return Account
