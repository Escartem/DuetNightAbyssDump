local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local CommonUtils = require("Utils.CommonUtils")
local MiscUtils = require("Utils.MiscUtils")
local SettingUtils = require("Utils.SettingUtils")
local M = {}

function M:EnterWorld()
  self:OnEnterWorld_HeroUSDK()
  self:OnEnterWorld_Sentry()
  self:OnEnterWorld_ACE()
  SettingUtils.InitPerformanceSetting()
end

function M:OnEnterWorld_HeroUSDK()
  local HeroUSDKSubsystem = HeroUSDKSubsystem()
  if not HeroUSDKSubsystem then
    return
  end
  if self.Nickname and self.Nickname ~= "" then
    HeroUSDKSubsystem:HeroSDKRoleEnterGame(HeroUSDKUtils.GenHeroHDCGameRoleInfo())
  end
  HeroUSDKSubsystem:SetNewBDCPublicAttriubute(tostring(self.Uid), tostring(self.Hostnum))
  local BDCSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UNewBdcSubsystem)
  if BDCSubsystem then
    BDCSubsystem:Login(HeroUSDKSubsystem.UserInfo.sdkUserId, CommonUtils.ObjId2Str2(self.Eid))
  end
end

function M:OnEnterWorld_Sentry()
  local SentrySubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UEMSentrySubsystem)
  if not SentrySubsystem then
    return
  end
  SentrySubsystem:OnLoginSuccess()
end

function M:Init_ACE_Windows(ACESubsystem)
  local function SendACEToServer(self, PacketData, _)
    local Avatar = GWorld:GetAvatar()
    
    if Avatar then
      local binary_string = MiscUtils.ByteArrayToString(PacketData)
      Avatar:CallServerMethod("AceSendData", binary_string)
    end
  end
  
  ACESubsystem.OnSendPacketToGameServerDelegate:Add(ACESubsystem, SendACEToServer)
end

function M:Init_ACE_Mobile(ACESubsystem)
  local PlatformName = UE4.UUIFunctionLibrary.GetDevicePlatformName(self)
  local IsIOS = "IOS" == PlatformName
  
  local function SendACEToServer(self, PacketData, Type)
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      local binary_string = MiscUtils.ByteArrayToString(PacketData)
      Avatar:CallServerMethod("MobileSendData" .. Type, binary_string, IsIOS)
    end
  end
  
  ACESubsystem.OnSendPacketToGameServerDelegate:Add(ACESubsystem, SendACEToServer)
end

function M:Init_ACE()
  if self.bInitACE then
    return
  end
  local ACESubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UACESubsystem)
  if not ACESubsystem then
    return
  end
  self.bInitACE = true
  local Platform = CommonUtils.GetDeviceTypeByPlatformName(self)
  if "PC" == Platform then
    self:Init_ACE_Windows(ACESubsystem)
  elseif "Mobile" == Platform then
    self:Init_ACE_Mobile(ACESubsystem)
  end
end

function M:Login_ACE_Windows()
  local function Callback(_, Ticket)
    local ACESubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UACESubsystem)
    
    if not ACESubsystem then
      return
    end
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      ACESubsystem:Login(tostring(Avatar.Uid), 601, 0, Ticket)
    end
  end
  
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:CallServer("AceGetTicket", Callback)
  end
end

function M:Login_ACE()
  local Platform = CommonUtils.GetDeviceTypeByPlatformName(self)
  if "PC" == Platform then
    self:Login_ACE_Windows()
  end
end

function M:OnEnterWorld_ACE()
  self:Init_ACE()
  self:Login_ACE()
end

return M
