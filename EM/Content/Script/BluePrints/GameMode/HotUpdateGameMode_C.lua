require("Unlua")
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local EMCache = require("EMCache.EMCache")
local M = Class()

function M:ShowOptionPatchPopUI(OptionalAssetsSize, TotalSize)
  local GameInstance = UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local LoginMain = UIManager:GetUIObj("LoginMainPage")
  LoginMain:ShowOptionPatchPopUI(OptionalAssetsSize, TotalSize)
end

function M:ShowPatchUI()
  local GameInstance = UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local LoginMain = UIManager:GetUIObj("LoginMainPage")
  LoginMain:ShowPatchUI()
end

function M:ShowLoginMainUI()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  local LoginMain = UIManger:LoadUINew("LoginMainPage")
  local PlayerController = UGameplayStatics.GetPlayerController(self, 0)
  if IsValid(PlayerController) then
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
      PlayerController.bShowMouseCursor = true
    else
      PlayerController.bShowMouseCursor = false
    end
  end
end

function M:ShowDownloadBasepakUI()
  local GameInstance = UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local LoginMain = UIManager:GetUIObj("LoginMainPage")
  LoginMain:ShowDownloadBasepakUI()
end

function M:OnPatchPreSuccess(bFirst)
  if IsDedicatedServer(self) then
    return
  end
  local LoginMainPage = GWorld.GameInstance:GetGameUIManager():GetUIObj("LoginMainPage")
  if LoginMainPage then
    LoginMainPage:OnPatchPreSuccess(bFirst)
  end
end

function M:OnPatchFinished(bFrist)
  if IsDedicatedServer(self) then
    return
  end
  if bFrist then
    ReddotManager._Close()
    ReddotManager._Init()
    local AnnounceUtils = require("BluePrints.UI.WBP.Announcement.AnnounceUtils")
    AnnounceUtils:Init()
    local SystemLanguage = EMCache:Get("SystemLanguage")
    if nil ~= SystemLanguage then
      CommonConst.SystemLanguage = CommonConst.SystemLanguages[SystemLanguage]
    end
    local SystemVoice = EMCache:Get("SystemVoice")
    if nil ~= SystemVoice then
      CommonConst.SystemVoice = SystemVoice
    end
    local DelayFrameSubSystem = USubsystemBlueprintLibrary.GetWorldSubsystem(self, UEMLuaTickManagerSubsystem)
    DelayFrameSubSystem.DelayFuncs = {}
    local RegionDataMgrSubSystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self, URegionDataMgrSubsystem)
    if RegionDataMgrSubSystem then
      RegionDataMgrSubSystem:Initialize_Lua()
    end
  end
  local LoginMainPage = GWorld.GameInstance:GetGameUIManager():GetUIObj("LoginMainPage")
  if LoginMainPage then
    LoginMainPage:OnPatchFinished(bFrist)
  end
end

function M:TryCompilePSO_Internal(bFirst)
  if IsDedicatedServer(self) then
    return
  end
  local LoginMainPage = GWorld.GameInstance:GetGameUIManager():GetUIObj("LoginMainPage")
  if LoginMainPage then
    LoginMainPage:PreBindDelegates()
  end
end

function M:ShowRestartDialog()
  local Params = {}
  Params.LeftCallbackObj = self
  Params.LeftCallbackFunction = self.QuitAndReopenGame
  Params.RightCallbackObj = self
  Params.RightCallbackFunction = self.QuitAndReopenGame
  Params.CloseBtnCallbackObj = self
  Params.CloseBtnCallbackFunction = self.QuitAndReopenGame
  UIManager(self):ShowCommonPopupUI(100053, Params)
end

function M:GetWhiteListDevices()
  local WhiteList = {}
  return WhiteList
end

function M:GetCurrentSystemVoiceOptionalSign()
  if CommonConst.SystemVoice == CommonConst.SystemVoices.CN or CommonConst.SystemVoice == CommonConst.SystemVoices.Default then
    return "VoiceCN"
  elseif CommonConst.SystemVoice == CommonConst.SystemVoices.JP then
    return "VoiceJP"
  elseif CommonConst.SystemVoice == CommonConst.SystemVoices.KR then
    return "VoiceKR"
  end
  return "VoiceEN"
end

function M:GetCustomSystemVoiceOptionalSign()
  return {
    "VoiceCN",
    "VoiceEN",
    "VoiceJP",
    "VoiceKR"
  }
end

return M
