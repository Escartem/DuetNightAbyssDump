local Class = _G.TypeClass
local AvatarEntity = require("BluePrints.Client.Wrapper.Entity").AvatarEntity
local Assemble = require("NetworkEngine.Common.Assemble")
local MiscUtils = require("Utils.MiscUtils")
local DSEntity = Class("DSEntity", AvatarEntity)
local bHookGameModeReadyForInitNext = false
DSEntity.__Component__ = {
  "BluePrints.Client.Entities.DSComponents.DSRewardsComponent",
  "BluePrints.Client.Entities.DSComponents.DSBattleComponent",
  "BluePrints.Client.Entities.CommonComponents.ResourceUseComponent",
  "BluePrints.Client.Entities.CommonComponents.AutoBattleTestComponent",
  "BluePrints.Client.Entities.DSComponents.DSTargetComponent",
  "Blueprints.Client.Entities.CommonComponents.GameModeWalnutComponent"
}
local bStatusInPreloading = false

function DSEntity:Init(eid)
  DSEntity.Super.Init(self, eid)
  self.bClientEntity = false
end

function DSEntity:InitFromDict(attrs)
end

function DSEntity:CreateSuccess()
  self:CallServerMethod("OnCreateClientEntity", true)
end

function DSEntity:BecomePlayer(DSStatus)
  if DSStatus == CommonConst.DSRunningStatus.Preloading then
    bStatusInPreloading = true
  end
  DSEntity.Super.BecomePlayer(self)
end

function DSEntity:OnBecomePlayer()
  DSEntity.Super.OnBecomePlayer(self)
  self.logger.info("DSEntity OnBecomePlayer")
  self:EnterWorld()
  local BP_Avatar = GWorld.GameInstance:GetAvatar()
  if BP_Avatar then
    BP_Avatar:SetDSEntity(self)
  end
  self:StartSuccess()
  self:QueryHotfix()
end

function DSEntity:QueryHotfix()
  local index = GWorld.HotfixDataIndex or 0
  self:CallServerMethod("QueryHotfix", index)
end

function DSEntity:OnQueryHotfixSuccess(HotfixScript, HotfixIndex)
  ServerPrint("OnQueryHotfixSuccess", HotfixScript, HotfixIndex)
  if HotfixIndex then
    require("HotFix").ExecHotFix(HotfixIndex, HotfixScript)
    GWorld.HotfixDataIndex = HotfixIndex
  end
end

function DSEntity:CallSkynetServerMethod(FuncName, ...)
  self:CallServerMethod(FuncName, ...)
end

function DSEntity:CallSkynetServerCallback(CallbackId, ...)
  self:CallServerMethod("CallSkynetServerCallback", CallbackId, ...)
end

function DSEntity:StartSuccess()
  self:TestHotUpdate()
  local GameInstance = GWorld.GameInstance
  local Pid = GameInstance:GetPID()
  local PPid = GameInstance:GetPPid()
  local DSVersion = MiscUtils.GetGameCofingSettings("DSVersion") or 0
  local LogPath = GameInstance:LogPath()
  local DSType = GameInstance.DSType
  local Ip = GameInstance.LastUploadIp
  local Port = GameInstance.LastUploadPort
  ServerPrint("Ip, Port, PID, PPID, DSVersion, LogPath", Ip, Port, Pid, PPid, DSVersion, LogPath)
  local DSInfo = {
    Ip = Ip,
    Port = Port,
    Type = DSType,
    Pid = Pid,
    PPid = PPid,
    Hostnum = GameInstance.DSConnectHostnum,
    DSVersion = DSVersion,
    LogPath = LogPath,
    bDynamic = GameInstance.bDynamicNode,
    LocalUser = UE.UKismetSystemLibrary:GetPlatformUserName()
  }
  if GameInstance.DSType == CommonConst.DSType.Leaf then
    local DungeonId = GameInstance.TargetDungeonId
    if not DungeonId then
      error("DungeonId is nil")
    end
    DSInfo.DungeonId = DungeonId
    self:ChangeMap(DungeonId)
  end
  
  local function callback(ret, LogParam)
    if 0 ~= DSVersion and DSType == CommonConst.DSType.Root then
      if bStatusInPreloading then
        self:StartPreload()
      else
        GameInstance:RecordRunningSuccess()
        self:HotUpdate()
      end
      self:UpdateDSLogSetting(LogParam)
    end
  end
  
  if GameInstance.DSType == CommonConst.DSType.Root and bStatusInPreloading then
    self:CallServer("StartSuccess", callback)
  else
    self:CallServer("StartSuccess", callback, DSInfo)
  end
end

function DSEntity:UpdateNetDriverInfo(ip, port)
  if ip and port then
    self:CallServerMethod("UpdateNetDriverInfo", ip, port)
  end
end

function DSEntity:ConnectDSServerSuccess(AvatarEid, bReconnect)
  ServerPrint("ConnectDSServerSuccess", AvatarEid, bReconnect)
  self:CallSkynetServerMethod("ConnectDSServerSuccess", AvatarEid, bReconnect)
end

function DSEntity:DisconnectDSServerSuccess(AvatarEid)
  ServerPrint("DisconnectDSServerSuccess", AvatarEid)
  self:CallServerMethod("DisconnectDSServerSuccess", AvatarEid)
end

function DSEntity:CloseDS()
  self.logger.debug("CloseDS")
  GWorld.GameInstance:CloseDS()
end

function DSEntity:ChangeMap(DungeonId)
  ServerPrint("Change to Map: ", DungeonId)
  self.HasLeaveAvatars = {}
  GWorld.GameInstance:ChangeMapAsDedicatedServer(DungeonId)
end

function DSEntity:SetNeedWaitForOthers(NeedToWaitForOthers)
  self.logger.info("Set NeedToWaitForOthers: ", NeedToWaitForOthers)
  local GameMode = GWorld.GameInstance:GetCurrentGameMode()
  GameMode.NeedToWaitForOthers = NeedToWaitForOthers
  GameMode:TryTriggerOnInitWithoutParams()
end

function DSEntity:SystemRequireGameModeInitWithoutAnyPlayer()
  bHookGameModeReadyForInitNext = true
  self:SetNeedWaitForOthers(false)
end

function DSEntity:HookGameModeReady(GameMode)
  if self.IsAutoBattle then
    GameMode:TryTriggerOnRealInit()
  end
  if bHookGameModeReadyForInitNext then
    GameMode:RealInit()
  end
end

function DSEntity:KickPlayer(PlayerId)
  local ret
  local GameMode = GWorld.GameInstance:GetCurrentGameMode()
  if PlayerId then
    ret = GameMode:KickPlayer(PlayerId)
  else
    ret = GameMode:KickAllPlayers()
  end
  self:CallServerMethod("OnKickPlayer", ret, PlayerId)
end

function DSEntity:ForkSubProcess(ForkNums, DSType, DungeonId)
  GWorld.GameInstance.TargetDungeonId = DungeonId
  GWorld.GameInstance:SetForkInfo(ForkNums, DSType)
  GWorld.GameInstance:StartFork()
end

function DSEntity:StartPreload()
  GWorld.GameInstance:GetDSAssetsManager():PreLoadAssets()
end

function DSEntity:QueryDeviceInfo(Callback)
  print(_G.LogTag, "QueryDeviceInfo")
  local Info = {}
  Info.CPUCores = GWorld.GameInstance:GetNumberOfCores()
  self:CallSkynetServerCallback(Callback, Info)
end

function DSEntity:TriggerCondition(ConditionId)
  self:CallServerMethod("TriggerCondition", ConditionId)
end

function DSEntity:HotUpdate()
  GWorld.GameInstance:GetDSAssetsManager():HotUpdate()
end

function DSEntity:HotPatch(bNeedRestart)
  GWorld.GameInstance:QuickRestartProcess(bNeedRestart)
end

function DSEntity:UpdateDSLogSetting(LogParam)
  local WhiteCategory = TArray(FName)
  local BlackCategory = TArray(FName)
  local WhiteContent = TArray("")
  local BlackContent = TArray("")
  
  local function AddToArray(Arr, T)
    for i = 1, #T do
      Arr:Add(T[i])
    end
  end
  
  LogParam = LogParam or {}
  for k, v in pairs(LogParam) do
    if "WhiteCategory" == k then
      AddToArray(WhiteCategory, v)
    elseif "BlackCategory" == k then
      AddToArray(BlackCategory, v)
    elseif "WhiteContent" == k then
      AddToArray(WhiteContent, v)
    elseif "BlackContent" == k then
      AddToArray(BlackContent, v)
    end
  end
  GWorld.GameInstance:UpdateDSLogSetting(WhiteCategory, BlackCategory, WhiteContent, BlackContent)
end

function DSEntity:ServerMulticast(FuncName, ...)
  print(_G.LogTag, "ServerMulticast", FuncName)
  self:CallServerMethod("Multicast", FuncName, ...)
end

function DSEntity:SendAvatar(AvatarEid, FuncName, ...)
  if not AvatarEid then
    print(_G.LogTag, "SendAvatar with nil AvatarEid")
    return
  end
  self:CallServerMethod("DSSendAvatar", AvatarEid, FuncName, ...)
end

function DSEntity:ServerConditionalMulticast(ConditionalAvatars, FuncName, ...)
  print(_G.LogTag, "ServerConditionalMulticast", FuncName)
  self:CallServerMethod("ConditionalMulticast", ConditionalAvatars, FuncName, ...)
end

function DSEntity:LeaveWorld()
end

function DSEntity:Ping()
  self:CallServerMethod("Echo")
end

function DSEntity:DSStat(Cmd)
  print(_G.LogTag, "DSStat", Cmd)
  GWorld.GameInstance:ExecuteCmd(Cmd)
end

function DSEntity:TestHotUpdate()
  print(_G.LogTag, "TestHotUpdate", false)
end

function DSEntity:SendToFeishuForBattle(msg, msg_title)
  self:CallServerMethod("SendToFeishuForBattle", msg, msg_title)
end

function DSEntity:SendTraceToQaWeb(trace_type, describe_info)
  self:CallServerMethod("SendTraceToQaWeb", trace_type, describe_info)
end

function DSEntity:BLog(...)
  self:CallServerMethod("DSBLog", ...)
end

function DSEntity:SendToFeiShuForRegionMgr(msg, msg_title)
  self:CallServerMethod("SendToFeiShuForRegionMgr", msg, msg_title)
end

function DSEntity:SendToFeishuForMonster(msg, msg_title)
  self:CallServerMethod("SendToFeiShuForMonster", msg, msg_title)
end

Assemble.AssembleComponents(DSEntity)
return DSEntity
