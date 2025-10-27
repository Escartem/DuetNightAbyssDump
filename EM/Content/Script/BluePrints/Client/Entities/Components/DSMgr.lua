local Component = {}

function Component:ConnectAndEnterDS(DSIp, DSPort, DungeonId, CurrentRewards)
  self.logger.info("DSMgr ConnectAndEnterDS")
  self.AvatarBattleInfo = nil
  self.CacheDSInfo = {
    DSIp = DSIp,
    DSPort = DSPort,
    DungeonId = DungeonId
  }
  if CurrentRewards then
    self:CacheDungeonRewards(CurrentRewards)
  end
  self:ConnectDSServer(DSIp, DSPort, DungeonId)
  if GWorld.IsDev then
    self:GetDSLogPath()
  end
end

function Component:ConnectDSServer(DSIp, DSPort, DungeonId)
  self.logger.debug("ConnectDSServer", DSIp, DSPort, type(DSIp), type(DSPort))
  self.logger.debug("other info", self.Account, CommonUtils.ObjId2Str(self.Eid), DungeonId)
  WorldTravelSubsystem():ChangeSceneConnectDedicatedServer(DungeonId, DSIp, DSPort, self.Account, CommonUtils.ObjId2Str(self.Eid))
end

function Component:QuickReconnectDS()
  print(_G.LogTag, "QuickReconnectDS")
  if not self.CacheDSInfo then
    return false
  end
  self:ConnectDSServer(self.CacheDSInfo.DSIp, self.CacheDSInfo.DSPort, self.CacheDSInfo.DungeonId)
  return true
end

function Component:OnClientWasKicked(Reason)
  self:CallServerMethod("OnClientWasKicked", Reason)
end

function Component:OnMatchPrepareToBattle()
  print(_G.LogTag, "OnMatchPrepareToBattle")
  EventManager:FireEvent(EventID.OnMatchPrepareToBattle)
end

function Component:ExitDS()
  self.logger.info("DSMgr ExitDS")
  local Avatar = GWorld:GetAvatar()
  Avatar:ExitDungeon()
end

function Component:KickPlayer(AvatarEid)
  self:CallServerMethod("KickPlayer", AvatarEid)
end

function Component:GetDSLogPath()
  local function cb(DSLogPath)
    print(_G.LogTag, "DSLogPath", DSLogPath)
  end
  
  self:CallServer("GMGetDSLogPath", cb)
end

function Component:OnDisconnectDS()
  DebugPrint("OnDisconnectDS")
  if GWorld.GameInstance:IsInTempScene() then
    return
  end
  local Avatar = GWorld:GetAvatar()
  Avatar:ExitDungeon()
  GWorld.GameInstance.LogicServerCallbackInfo = nil
  GWorld.GameInstance.IsInSettlementScene = nil
  DebugPrint("TryDungeonSettlement: OnDisconnectDS ClearInfo")
end

return Component
