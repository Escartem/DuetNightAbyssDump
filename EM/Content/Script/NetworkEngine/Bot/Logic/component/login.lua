local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local login = {}

function login:StartLogin()
  self:RawRpc("ConnectServer", CommonConst.ConnectServerRequestType.NEW_CONNECTION, self.device_id)
end

function login:CreateEntity(entity_type, entity_id, info)
  self.entity_type = entity_type
  self.entity_id = entity_id
  self:InitFromDict(info)
  self:EntityRpc("OnCreateClientEntity", true)
end

function login:BecomePlayer()
  if self.entity_type ~= "Account" then
    return
  end
  local ClientInfo = {
    Hostnum = self.Hostnum,
    Account = self.account,
    PassWord = self.account
  }
  local HeroUSDKSubsystem = HeroUSDKSubsystem()
  local BDC_Info = {
    appkey = HeroUSDKSubsystem:GetAppKey(),
    channel_id = HeroUSDKSubsystem:GetChannelId(),
    app_channel_id = HeroUSDKSubsystem:GetAppChannelId(),
    device_id = HeroUSDKSubsystem:GetDeviceId()
  }
  local IsGlobalSDk = HeroUSDKUtils.IsGlobalSDK()
  if not IsGlobalSDk then
    BDC_Info.oaid = HeroUSDKSubsystem.Oaid
  end
  self:EntityRpc("QuickLogin", ClientInfo, BDC_Info)
end

function login:OnRelayLogin()
  self:EntityRpc("GMResetState")
  self:EntityRpcWithCb("OnLoginSuccess", self.LoginSuccessCb)
end

function login:OnRefreshLogin()
  self:EntityRpcWithCb("OnLoginSuccess", self.LoginSuccessCb)
end

function login:LoginSuccessCb()
  self:EnterRegion(210101, 1, "Recover", true)
end

return login
