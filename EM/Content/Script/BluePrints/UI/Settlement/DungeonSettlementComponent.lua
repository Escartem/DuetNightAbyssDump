local M = {}

function M:GetDungeonInfo(DungeonId)
  return DataMgr.Dungeon[DungeonId]
end

function M:GetDungeonName(DungeonInfo)
  return GText(DungeonInfo.DungeonName)
end

return M
