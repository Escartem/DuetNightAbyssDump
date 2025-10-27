local Component = {}

function Component:EnterWorld()
  self.logger.debug("DSBattleComponent EnterWorld")
  self.AvatarInfos = {}
  self.PersistPlayerInfos = {}
  self.HasLeaveAvatars = {}
end

function Component:HandleAvatarBattleInfo(Callback, AvatarBattleInfos)
  self.logger.debug("HandleAvatarBattleInfo [GetAvatarCrossInfo Success]", CommonUtils.TableToString(AvatarBattleInfos))
  local GameMode = UE.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  assert(GameMode, "GameMode is nil")
  if not GameMode.AvatarInfos then
    GameMode.AvatarInfos = {}
  end
  for AvatarEid, Info in pairs(AvatarBattleInfos) do
    local AvatarEidStr = CommonUtils.ObjId2Str(AvatarEid)
    self.AvatarInfos[AvatarEidStr] = Info
    if GameMode.AvatarInfos[AvatarEidStr] == nil then
      GameMode.AvatarInfos[AvatarEidStr] = Info
    end
  end
  local PlayerInfos = {}
  for AvatarEid, Info in pairs(GameMode.AvatarInfos) do
    table.insert(PlayerInfos, Info.PlayerInfo)
  end
  self:ServerMulticast("TryAddRecentMatchedFriendList", PlayerInfos)
  GameMode:OnAvatarInfoInitDS()
  self:CallSkynetServerCallback(Callback)
end

function Component:GetAvatarInfo(GameMode, AvatarEid)
  print(_G.LogTag, "GetAvatarInfo", CommonUtils.Size(self.AvatarInfos))
  local Info = GameMode.AvatarInfos[AvatarEid]
  if Info then
    return Info
  end
  Info = self.AvatarInfos[AvatarEid]
  if Info then
    GameMode.AvatarInfos[AvatarEid] = Info
  end
  return Info
end

function Component:RequestDSLeaveBattle(Callback, AvatarEid)
  AvatarEid = CommonUtils.ObjId2Str(AvatarEid)
  ServerPrint("RequestDSLeaveBattle", AvatarEid)
  local GameMode = GWorld.GameInstance:GetCurrentGameMode()
  if not GameMode then
    self:CallSkynetServerCallback(Callback, ErrorCode.RET_FAIL)
    return
  end
  if not GameMode.AvatarInfos[AvatarEid] then
    self:CallSkynetServerCallback(Callback, ErrorCode.RET_FAIL)
    return
  end
  if self.HasLeaveAvatars[AvatarEid] ~= nil then
    self:CallSkynetServerCallback(Callback, ErrorCode.RET_FAIL)
    return
  end
  GameMode:TriggerPlayerFailed({AvatarEid})
  self:CallSkynetServerCallback(Callback, ErrorCode.RET_SUCCESS)
end

function Component:HandleClientNetworkError(AvatarEid)
  ServerPrint("HandleClientNetworkError", CommonUtils.ObjId2Str(AvatarEid))
  local result = self:OnAvatarDestroy(AvatarEid)
  self:CallServerMethod("OnHandleClientNetworkError", AvatarEid, result)
end

function Component:OnAvatarDestroy(AvatarEid)
  AvatarEid = CommonUtils.ObjId2Str(AvatarEid)
  ServerPrint("OnAvatarDestroy", AvatarEid)
  local PlayerController = UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerByAvatarEid(GWorld.GameInstance, AvatarEid)
  if PlayerController then
    PlayerController:OnRealDisconnectWithParams(true)
    return true
  else
    DebugPrint("OnAvatarDestroy with Controller not found")
    local GameMode = GWorld.GameInstance:GetCurrentGameMode()
    GameMode:TriggerPlayerFailed({AvatarEid})
    GameMode:OnAvatarLogout(AvatarEid)
  end
  return false
end

function Component:HandleNotValidForReconnect(AvatarEid)
  ServerPrint("HandleNotValidForReconnect", AvatarEid)
  local GameMode = GWorld.GameInstance:GetCurrentGameMode()
  if not GameMode then
    return
  end
  GameMode:OnAvatarLogout(AvatarEid)
end

function Component:OnAvatarLoseClient(AvatarEid)
  ServerPrint("OnAvatarLoseClient", AvatarEid)
  local PlayerController = UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerByAvatarEid(GWorld.GameInstance, AvatarEid)
  if PlayerController then
    PlayerController:OnLoseClient()
  end
end

function Component:OnAvatarLeaveServer(AvatarEid)
  if not self.AvatarInfos[AvatarEid] then
    return
  end
  ServerPrint("OnAvatarLeaveServer but still in DS", AvatarEid)
  self:HandleNotValidForReconnect(AvatarEid)
end

function Component:BattleFinish(IsWin, AvatarEids)
  ServerPrint("BattleFinish", IsWin)
  local RealFinishAvatar = {}
  local AvatarArr = TArray("")
  local GameMode = GWorld.GameInstance:GetCurrentGameMode()
  local GameTime = GameMode.EMGameState:GetGameEndTime()
  GameMode:FlushRewards()
  local ExtraInfo = {}
  if AvatarEids then
    if type(AvatarEids) == "table" then
      for _, AvatarEid in ipairs(AvatarEids) do
        self:AddFinishAvatar(ExtraInfo, AvatarEid, RealFinishAvatar, AvatarArr, IsWin)
      end
    else
      self:AddFinishAvatar(ExtraInfo, AvatarEids, RealFinishAvatar, AvatarArr, IsWin)
    end
  else
    for AvatarEid, _ in pairs(GameMode.AvatarInfos) do
      self:AddFinishAvatar(ExtraInfo, AvatarEid, RealFinishAvatar, AvatarArr, IsWin)
    end
  end
  local AvatarArrLen = AvatarArr:Length()
  if 0 == AvatarArrLen then
    ServerPrint("BattleFinish with no valid avatar")
    return
  end
  GameMode:NotifyClientGameEnd(IsWin, RealFinishAvatar)
  GameMode:OnPlayersDungeonEnd(RealFinishAvatar)
  local SumAvatars = CommonUtils.Size(GameMode.AvatarInfos)
  ServerPrint("Finish Player Count", AvatarArrLen, SumAvatars)
  self:CallSkynetServerMethod("BattleFinish", IsWin, GameMode.EMGameState.DungeonProgress - 1, GameTime, ExtraInfo)
  GameMode:TriggerOnExit(AvatarArr)
end

function Component:AddFinishAvatar(ExtraInfo, AvatarEid, RealFinishAvatar, AvatarArr, IsWin)
  local AvatarStr = AvatarEid
  AvatarEid = CommonUtils.Str2ObjId(AvatarEid)
  if rawget(self.HasLeaveAvatars, AvatarStr) ~= nil then
    ServerPrint("AddFinishAvatar duplicated Avatar", AvatarStr)
    return
  end
  ServerPrint("AddFinishAvatar", AvatarStr)
  rawset(ExtraInfo, AvatarEid, {
    PersistenceRewards = {},
    CacheRewards = {},
    ImmediateResources = {}
  })
  if rawget(self.PersistenceRewards, AvatarStr) then
    ExtraInfo[AvatarEid].PersistenceRewards = self.PersistenceRewards[AvatarStr]:DumpAll()
  end
  if IsWin and rawget(self.CacheRewards, AvatarStr) then
    self.CacheRewards[AvatarStr]:Merge(self.CommonRewards)
    ExtraInfo[AvatarEid].CacheRewards = self.CacheRewards[AvatarStr]:DumpAll()
  end
  if rawget(self.ImmediateResources, AvatarStr) then
    ExtraInfo[AvatarEid].ImmediateResources = self.ImmediateResources[AvatarStr]
  end
  local PlayerController = UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerByAvatarEid(GWorld.GameInstance, AvatarStr)
  local Player = PlayerController and PlayerController:GetMyPawn()
  local PlayerTime = Player and Player.PlayerState:GetPlayerEndTime()
  local bInactive = true
  if Player and not Player.PlayerState.bIsEMInactive then
    bInactive = false
  end
  local GameMode = GWorld.GameInstance:GetCurrentGameMode()
  ExtraInfo[AvatarEid].PlayerTime = PlayerTime
  ExtraInfo[AvatarEid].CombatStatistics = PlayerController and PlayerController:GetCombatStatistics() or {}
  ExtraInfo[AvatarEid].CustomInfo = GameMode:TriggerDungeonComponentFun("CustomFinishInfo", AvatarStr, IsWin) or {}
  ExtraInfo[AvatarEid].PlayerInfo = self.PersistPlayerInfos[AvatarStr] or self.AvatarInfos[AvatarStr].PlayerInfo
  ExtraInfo[AvatarEid].bInactive = bInactive
  rawset(self.HasLeaveAvatars, AvatarStr, IsWin)
  self.CacheRewards[AvatarStr] = nil
  self.PersistenceRewards[AvatarStr] = nil
  self.ImmediateResources[AvatarStr] = nil
  RealFinishAvatar[#RealFinishAvatar + 1] = AvatarStr
  AvatarArr:Add(AvatarStr)
end

function Component:BlockEntrance()
  ServerPrint("BlockEntrance")
  self:CallServerMethod("BlockEntrance")
end

function Component:UpdateDungeonProgress()
  ServerPrint("UpdateDungeonProgress")
  for Eid, _ in pairs(self.AvatarInfos) do
    local Rewards = self.CacheRewards[Eid]
    self.PersistenceRewards[Eid]:Merge(Rewards)
    self.CacheRewards[Eid]:Clear()
    self.PersistenceRewards[Eid]:Merge(self.CommonRewards)
    self.PersistPlayerInfos[Eid] = CommonUtils.CopyTable(self.AvatarInfos[Eid].PlayerInfo)
  end
  self.CommonRewards:Clear()
  self:CallServerMethod("UpdateDungeonProgress")
end

return Component
