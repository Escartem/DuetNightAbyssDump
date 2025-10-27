local M = Class()
local OperateType = {
  "FillRegionData",
  "ClaimRegionData",
  "CreateEntity",
  "RemoveEntity",
  "CreateClientCacheData",
  "RemoveClientCacheData",
  "UpdateClientCacheData"
}

function M:Init()
  self.RegionLog = {}
end

function M:Clear()
  self.RegionLog = {}
end

function M:IsRegionLogEnabled()
  return self.bIsRegionLogEnabled
end

function M:PrintRegionData(WorldRegionEid)
  local EntityLog = self.RegionLog[WorldRegionEid]
  if not EntityLog then
    return
  end
  for _, Log in ipairs(EntityLog) do
    DebugPrint(OperateType[Log[1]], "WorldEid:", Log[2], "Eid:", Log[3], "Time:", Log[4], "LevelName:", Log[5], Log[6])
  end
end

function M:OnRegionDataFill(WorldRegionEid, Eid, LevelName)
  self:_Log(WorldRegionEid, Eid, 1, LevelName)
end

function M:OnRegionDataClaim(WorldRegionEid, Eid, LevelName, Message)
  self:_Log(WorldRegionEid, Eid, 2, LevelName, Message)
end

function M:OnEntityCreated(WorldRegionEid, Eid, LevelName)
  self:_Log(WorldRegionEid, Eid, 3, LevelName)
end

function M:OnEntityRemoved(WorldRegionEid, Eid, LevelName)
  self:_Log(WorldRegionEid, Eid, 4, LevelName)
end

function M:OnClientCacheCreated(WorldRegionEid, Eid, LevelName)
  self:_Log(WorldRegionEid, Eid, 5, LevelName)
end

function M:OnClientCacheDeleted(WorldRegionEid, Eid, LevelName)
  self:_Log(WorldRegionEid, Eid, 6, LevelName)
end

function M:OnClientCacheUpdated(WorldRegionEid, Eid, LevelName)
  self:_Log(WorldRegionEid, Eid, 7, LevelName)
end

function M:_Log(WorldRegionEid, Eid, OperateType, LevelName, Message)
  if not self:IsRegionLogEnabled() then
    return
  end
  if nil == Message then
    Message = debug.traceback()
  end
  local Time = UGameplayStatics.GetTimeSeconds(GWorld.GameInstance)
  LevelName = LevelName or "Unknown"
  if WorldRegionEid then
    local TmpEid = Eid or -1
    if not self.RegionLog[WorldRegionEid] then
      self.RegionLog[WorldRegionEid] = {}
    end
    table.insert(self.RegionLog[WorldRegionEid], {
      OperateType,
      WorldRegionEid,
      TmpEid,
      Time,
      LevelName,
      Message
    })
  end
  if Eid then
    WorldRegionEid = WorldRegionEid or -1
    if not self.RegionLog[Eid] then
      self.RegionLog[Eid] = {}
    end
    table.insert(self.RegionLog[Eid], {
      OperateType,
      WorldRegionEid,
      Eid,
      Time,
      LevelName,
      Message
    })
  end
end

return M
