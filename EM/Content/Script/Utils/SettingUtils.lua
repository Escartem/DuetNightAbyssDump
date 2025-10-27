local SettingUtils = {}
local EMCache = require("EMCache.EMCache")

function SettingUtils.InitPerformanceSetting()
  SettingUtils.InitGameOverallPerformance()
  SettingUtils.InitGameMaxFPS()
end

function SettingUtils.InitGameOverallPerformance()
  local OptionName = "OverallPreset"
  local GameOverallPerformanceCache = EMCache:Get(OptionName)
  local NowGameOverallPerformance = GWorld.GameInstance:GetOverallScalabilityLevel()
  DebugPrint("-----jzn---InitGameOverallPerformance-----", GameOverallPerformanceCache, NowGameOverallPerformance)
  if nil ~= GameOverallPerformanceCache then
    if GameOverallPerformanceCache == CommonConst.OverallPerformanceCustom then
      SettingUtils.InitContentPerformanceCache()
      SettingUtils.InitGameUserSettingsCache()
      SettingUtils.InitConsoleVariableCache()
    end
    GWorld.GameInstance.SetOverallScalabilityLevel(GameOverallPerformanceCache)
    EventManager:FireEvent(EventID.OnOverallPresetChanged, GameOverallPerformanceCache)
  else
  end
  SettingUtils.InitAntiAliasingCache(GameOverallPerformanceCache or NowGameOverallPerformance)
  SettingUtils.InitMobileResolution(GameOverallPerformanceCache or NowGameOverallPerformance)
end

function SettingUtils.InitAntiAliasingCache(GameOverallPerformance)
  local OptionName = "AntiAliasing"
  local NowAntiAliasing = URuntimeCommonFunctionLibrary.GetAntiAliasingMethodType()
  local AntiAliasingCache = EMCache:Get(OptionName) or NowAntiAliasing
  local AntiAliasingList
  if nil == GameOverallPerformance then
    GameOverallPerformance = -1
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    if AntiAliasingCache ~= CommonConst.AntiAliasingClose then
      AntiAliasingCache = 2
    end
    AntiAliasingList = {
      [-1] = AntiAliasingCache,
      [0] = 2,
      [1] = 2,
      [2] = 2,
      [3] = 2,
      [4] = 2
    }
  else
    AntiAliasingList = {
      [-1] = AntiAliasingCache,
      [0] = 2,
      [1] = 2,
      [2] = 4,
      [3] = 4,
      [4] = 4
    }
  end
  local InitAntiAliasing = AntiAliasingList[GameOverallPerformance]
  URuntimeCommonFunctionLibrary.SetAntiAliasingMethodType(InitAntiAliasing)
end

function SettingUtils.InitContentPerformanceCache()
  local OptionName = "ContentPerformance"
  local ContentPerformanceCache = EMCache:Get(OptionName)
  local NowContentPerformance = GWorld.GameInstance.GetGameplayScalabilityLevel()
  if nil ~= ContentPerformanceCache and ContentPerformanceCache ~= NowContentPerformance then
    GWorld.GameInstance.SetGameplayScalabilityLevel(ContentPerformanceCache)
  end
end

function SettingUtils.InitGameUserSettingsCache()
  local OptionName = "GameUserSettings"
  local CacheData = EMCache:Get(OptionName)
  local GameUserSettings = UE4.UGameUserSettings:GetGameUserSettings()
  if CacheData then
    for CacheName, CacheValue in pairs(CacheData) do
      if "VSyncEnabled" == CacheName then
        local NowValue = GameUserSettings:IsVSyncEnabled()
        if CacheValue ~= NowValue then
          GameUserSettings:SetVSyncEnabled(CacheValue)
        end
      else
        local NowValue = GameUserSettings["Get" .. CacheName](GameUserSettings)
        if CacheValue ~= NowValue then
          GameUserSettings["Set" .. CacheName](GameUserSettings, CacheValue)
        end
      end
    end
    GameUserSettings:ApplySettings(true)
  end
end

function SettingUtils.InitConsoleVariableCache()
  local OptionName = "ConsoleVariable"
  local CacheData = EMCache:Get(OptionName)
  if CacheData then
    for CacheName, CacheValue in pairs(CacheData) do
      local NowValue = UE4.UKismetSystemLibrary.GetConsoleVariableIntValue(CacheName)
      if CacheValue ~= NowValue then
        GWorld.GameInstance:SetGameScalabilityLevelByName(CacheName, CacheValue)
      end
    end
  end
end

function SettingUtils.InitGameMaxFPS()
  local OptionName = "Fps"
  local GameCache = EMCache:Get(OptionName)
  local GameUserSettings = UE4.UGameUserSettings:GetGameUserSettings()
  if GameCache then
    if GameCache == CommonConst.MaxFPS then
      GWorld.GameInstance:SetUnfixedFrameRate()
    else
      local FramePace = GameCache
      if 45 == GameCache then
        FramePace = 60
      end
      UE4.UKismetSystemLibrary.ExecuteConsoleCommand(self, "r.SetFramePace " .. FramePace, nil)
      GameUserSettings:SetFrameRateLimit(GameCache)
      GameUserSettings:ApplySettings(true)
    end
  else
    local DefaultFps
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
      DefaultFps = 30
      local NowGameOverallPerformance = GWorld.GameInstance:GetOverallScalabilityLevel()
      if NowGameOverallPerformance >= CommonConst.OverallPerformanceHigh then
        DefaultFps = 60
      end
    else
      DefaultFps = 60
    end
    if DefaultFps == CommonConst.MaxFPS then
      GWorld.GameInstance:SetUnfixedFrameRate()
    else
      UE4.UKismetSystemLibrary.ExecuteConsoleCommand(self, "r.SetFramePace " .. DefaultFps, nil)
      GameUserSettings:SetFrameRateLimit(DefaultFps)
      GameUserSettings:ApplySettings(true)
    end
  end
end

function SettingUtils.InitMobileResolution(GameOverallPerformance)
  local MobileResolutionList
  local PlatformName = UE4.UUIFunctionLibrary.GetDevicePlatformName(self)
  if "Android" == PlatformName then
    MobileResolutionList = {
      [1] = {
        80,
        60,
        576
      },
      [2] = {
        90,
        70,
        648
      },
      [3] = {
        115,
        80,
        900
      }
    }
  elseif "IOS" == PlatformName then
    MobileResolutionList = {
      [1] = {
        75,
        75,
        0
      },
      [2] = {
        80,
        80,
        0
      },
      [3] = {
        115,
        115,
        0
      }
    }
  else
    return
  end
  if nil == GameOverallPerformance then
    GameOverallPerformance = -1
  end
  local CacheName = "MobileResolution"
  local OptionIndex = EMCache:Get(CacheName)
  if nil == OptionIndex then
    local OptionInfo = DataMgr.Option[CacheName]
    OptionIndex = tonumber(OptionInfo.DefaultValue)
  end
  if 0 == GameOverallPerformance or 1 == GameOverallPerformance then
    OptionIndex = 1
  elseif 2 == GameOverallPerformance or 3 == GameOverallPerformance then
    OptionIndex = 2
  elseif 4 == GameOverallPerformance then
    OptionIndex = 3
  end
  EMCache:Set(CacheName, OptionIndex)
  local MobileResolution = MobileResolutionList[OptionIndex]
  if MobileResolution then
    GWorld.GameInstance.SetScreenPercentageLevel(MobileResolution[1], MobileResolution[2], MobileResolution[3])
  end
end

return SettingUtils
