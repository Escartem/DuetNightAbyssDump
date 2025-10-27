local EMLuaConst = {
  EMRandomSubSystem_MaxNumber = 10000,
  EMRandomSubSystem_MaxNumberPerTick = 1000,
  EMRandomSubSystem_TickInterval = 5
}
local PlatformName = UE4.UUIFunctionLibrary.GetDevicePlatformName()
EMLuaConst.EnableClientRpcDelay = Const.EnableClientRpcDelay
EMLuaConst.PushMonsterOptimizationLevel = Const.PushMonsterOptimizationLevel
EMLuaConst.BeginRagdollExecutePreFrame_PC = Const.BeginRagdollExecutePreFrame_PC
EMLuaConst.BeginRagdollExecutePreFrame_IOS = Const.BeginRagdollExecutePreFrame_IOS
EMLuaConst.BeginRagdollExecutePreFrame_Android = Const.BeginRagdollExecutePreFrame_Android
EMLuaConst.bPlayerMoveDefferUpdateOverlap = true
if "Android" == PlatformName then
  EMLuaConst.bPlayerPreloadSummon = Const.PlayerPreloadSummon_Android
  EMLuaConst.bSummonDeadCache = Const.SummonDeadCache_Android
  EMLuaConst.NPCDeadCache = Const.NPCDeadCache_Andriod
elseif "IOS" == PlatformName then
  EMLuaConst.bPlayerPreloadSummon = Const.PlayerPreloadSummon_IOS
  EMLuaConst.bSummonDeadCache = Const.SummonDeadCache_IOS
  EMLuaConst.NPCDeadCache = Const.NPCDeadCache_IOS
else
  EMLuaConst.bPlayerPreloadSummon = Const.PlayerPreloadSummon_Windows
  EMLuaConst.bSummonDeadCache = Const.SummonDeadCache_Windows
  EMLuaConst.NPCDeadCache = Const.NPCDeadCache_Win
end
EMLuaConst.SkillCreatureSpeed = Const.SkillCreatureSpeed
EMLuaConst.DecalHeight = 2000
EMLuaConst.DefaultSkillLevel = Const.DefaultSkillLevel
EMLuaConst.DefaultSkillGrade = Const.DefaultSkillGrade
EMLuaConst.DefaultPhantomSkillLevel = Const.DefaultPhantomSkillLevel
EMLuaConst.DefaultPhantomSkillGrade = Const.DefaultPhantomSkillGrade
EMLuaConst.ChargingFPS = 27
EMLuaConst.CheckTimeAccelerationInterval = CommonConst.CheckTimeAccelerationInterval
EMLuaConst.bShowDamageDetails = Const.bShowDamageDetails
EMLuaConst.SkillFeatureEndCameraBlendType = EViewTargetBlendFunction.VTBlend_Linear
EMLuaConst.EnableHitDelay = false
EMLuaConst.IsOpenNpcInitOpt = Const.IsOpenNpcInitOpt
EMLuaConst.EnableDynamicAIController = Const.EnableDynamicAIController
EMLuaConst.EnableMonDeathOptimization = Const.bEnableMonDeathOptimization
EMLuaConst.FlyAIControllerPath = Const.FlyAIControllerPath
EMLuaConst.MonsterNeedCache = Const.MonsterNeedCache
EMLuaConst.bSpawnAIUnitAddToEventQueue = Const.bSpawnAIUnitAddToEventQueue
EMLuaConst.RegionPlayerInterType = "Biography"
EMLuaConst.RegionPlayerInterId = 100032
EMLuaConst.bCloseWeaponMovementSync = Const.bCloseWeaponMovementSync
EMLuaConst.bCloseBodyAccessoryItemMovementSync = Const.bCloseBodyAccessoryItemMovementSync
EMLuaConst.bWeaponAndAccessoryItemHcc = Const.bWeaponAndAccessoryItemHcc
EMLuaConst.bMonsterInitByPropertySync = Const.bMonsterInitByPropertySync
EMLuaConst.IsOpenNetMultiClientOnly = Const.IsOpenNetMultiClientOnly
EMLuaConst.OpenLookAtProtect = Const.OpenLookAtProtect
EMLuaConst.AntiCheatInterval = Const.AntiCheatInterval
EMLuaConst.bOpenAntiCheat = Const.bOpenAntiCheat
EMLuaConst.bOpenPropertyEncryption = true
EMLuaConst.DungeonCheckMonsterZLocDist = 40000.0
EMLuaConst.SyncNavModiferCullIsolatedTileNums = 1
EMLuaConst.bEnableAndroidBackgroundLua = true
EMLuaConst.bEnableIOSBackgroundLua = true
EMLuaConst.IsShowRayCreature = Const.IsShowRayCreature
EMLuaConst.IsOpenBulletCreature = Const.IsOpenBulletCreature
EMLuaConst.IsOpenSkillCreature = Const.IsOpenSkillCreature
EMLuaConst.IsOpenCreatureECS = Const.IsOpenCreatureECS
EMLuaConst.MaxFilterDisSquare = 225000000
EMLuaConst.MaxBatteryOneChar = Const.MaxBatteryOneChar
EMLuaConst.MaxCrackKeyOneChar = Const.MaxCrackKeyOneChar
EMLuaConst.DungeonFrameLoadBreakableItemMaxNum = Const.DungeonFrameLoadBreakableItemMaxNum
EMLuaConst.bEnablePlayerRootMotionOptimizations = Const.bEnablePlayerRootMotionOptimizations
EMLuaConst.OpenCritCompute = true
EMLuaConst.bIsEnableHotUpdate = true
EMLuaConst.HotUpdateServerIdStr = "Default"
EMLuaConst.PCInterativeTickCount = 5
EMLuaConst.MobileInterativeTickCount = 3
EMLuaConst.bEnableHideRegionPlayer = true
EMLuaConst.RagdollClientMotorsAngularDriveParams = 1000
EMLuaConst.LowMemoryDeviceNPCOptimize = Const.LowMemoryDeviceNPCOptimize
EMLuaConst.LimitCreateCharacterNum_Low = 0
EMLuaConst.OnlineNPCCreateOptimize = Const.OnlineNPCCreateOptimize
EMLuaConst.WeaponSyncInternel = 1
EMLuaConst.HighFrequencyCheckGCInterval = 2
EMLuaConst.bMonEnableExecuteInLuaDelegate = false
return setmetatable({}, {
  __index = function(t, k)
    local v = rawget(EMLuaConst, k)
    if v then
      return v
    end
    local EMLuaConstCpp = rawget(t, "EMLuaConstCpp")
    return EMLuaConstCpp.TempVars[k]
  end,
  __newindex = function(t, k, v)
    EMLuaConst[k] = v
    local EMLuaConstCpp = rawget(t, "EMLuaConstCpp")
    if EMLuaConstCpp then
      EMLuaConstCpp:RefreshVars()
    end
  end,
  __pairs = function(t)
    return pairs(EMLuaConst)
  end
})
