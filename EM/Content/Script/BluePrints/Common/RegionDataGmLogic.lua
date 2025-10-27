require("UnLua")
require("Const")
local M = Class()

function M:OnRegionDataClaim_Log(WorldRegionEid, Eid, LevelName, Message)
  self.DataLibrary.LogHelper:OnRegionDataClaim(WorldRegionEid, Eid, LevelName, Message)
end

function M:OnRegionDataFill_Log(WorldRegionEid, Eid, LevelName)
  self.DataLibrary.LogHelper:OnRegionDataFill(WorldRegionEid, Eid, LevelName)
end

function M:OnRegionEntityCreated_Log(WorldRegionEid, Eid, LevelName)
  self.DataLibrary.LogHelper:OnEntityCreated(WorldRegionEid, Eid, LevelName)
end

function M:OnRegionEntityDeleted_Log(WorldRegionEid, Eid, LevelName)
  self.DataLibrary.LogHelper:OnEntityRemoved(WorldRegionEid, Eid, LevelName)
end

function M:PrintRegionLog(Id)
  self.DataLibrary.LogHelper:PrintRegionData(Id)
end

function M:GMTest_PrintServerRegionData(PartRegionStoreData)
  local TempGMType = self.TestGMRegionDataType
  self.TestGMRegionDataType = Const.TestGMRegionType.NoneTest
  self.TestGMRegionServerData = {}
  for RegionDataType, SubRegionDatas in pairs(PartRegionStoreData) do
    for SubRegionId, LevelRegionDatas in pairs(SubRegionDatas) do
      for LevelName, RegionDatas in pairs(LevelRegionDatas) do
        for WorldRegionEid, RegionBaseData in pairs(RegionDatas) do
          self.TestGMRegionServerData[tonumber(RegionDataType)] = self.TestGMRegionServerData[tonumber(RegionDataType)] or {}
          self.TestGMRegionServerData[tonumber(RegionDataType)][tonumber(SubRegionId)] = self.TestGMRegionServerData[tonumber(RegionDataType)][tonumber(SubRegionId)] or {}
          self.TestGMRegionServerData[tonumber(RegionDataType)][tonumber(SubRegionId)][LevelName] = self.TestGMRegionServerData[tonumber(RegionDataType)][tonumber(SubRegionId)][LevelName] or {}
          self.TestGMRegionServerData[tonumber(RegionDataType)][tonumber(SubRegionId)][LevelName][WorldRegionEid] = RegionBaseData
        end
      end
    end
  end
  GWorld.logger.errorlog("======================\230\137\147\229\141\176\229\140\186\229\159\159\230\156\141\229\138\161\229\153\168\230\149\176\230\141\174\229\186\147======================")
  
  local function _PrintData(Type, TypeData)
    GWorld.logger.errorlog("======================" .. Const.RegionDataTypeDebugText[tonumber(Type) + 1] .. "======================")
    for SubRegionId, TempData in pairs(TypeData) do
      GWorld.logger.errorlog("======================\229\140\186\229\159\159Id: " .. SubRegionId .. "======================")
      PrintTable(TempData, 10)
    end
  end
  
  for Type, TypeData in pairs(self.TestGMRegionServerData) do
    _PrintData(Type, TypeData)
  end
  GWorld.logger.errorlog("======================\230\137\147\229\141\176\229\140\186\229\159\159\230\156\141\229\138\161\229\153\168\230\149\176\230\141\174\229\186\147End===================")
  if TempGMType == Const.TestGMRegionType.CompareServer then
    GWorld.logger.errorlog("======================\230\175\148\232\190\131\229\174\162\230\136\183\231\171\175\231\188\147\229\173\152\229\146\140\230\156\141\229\138\161\229\153\168\230\149\176\230\141\174\229\186\147======================")
    for RegionDataType, SubRegionDatas in pairs(self.DataLibrary.RegionCacheDatas) do
      for SubRegionId, LevelRegionDatas in pairs(SubRegionDatas) do
        for LevelName, RegionDatas in pairs(LevelRegionDatas) do
          for WorldRegionEid, RegionBaseData in pairs(RegionDatas) do
            local _NotExist = false
            if self.TestGMRegionServerData[RegionDataType] == nil or self.TestGMRegionServerData[RegionDataType][SubRegionId] == nil or self.TestGMRegionServerData[RegionDataType][SubRegionId][LevelName] == nil or self.TestGMRegionServerData[RegionDataType][SubRegionId][LevelName][WorldRegionEid] == nil then
              _NotExist = true
            end
            if _NotExist then
              GWorld.logger.errorlog("\229\140\186\229\159\159\227\128\144\229\174\162\230\136\183\231\171\175\231\188\147\229\173\152\227\128\145\230\175\148\227\128\144\230\156\141\229\138\161\229\153\168\227\128\145\229\164\154\228\186\134\230\149\176\230\141\174\239\188\154" .. WorldRegionEid)
              PrintTable(RegionBaseData)
            else
              self.TestGMRegionServerData[RegionDataType][SubRegionId][LevelName][WorldRegionEid].ClientExit = true
            end
          end
        end
      end
    end
    for RegionDataType, SubRegionDatas in pairs(self.TestGMRegionServerData) do
      for SubRegionId, LevelRegionDatas in pairs(SubRegionDatas) do
        for LevelName, RegionDatas in pairs(LevelRegionDatas) do
          for WorldRegionEid, RegionBaseData in pairs(RegionDatas) do
            if not self.TestGMRegionServerData[RegionDataType][SubRegionId][LevelName][WorldRegionEid].ClientExit then
              GWorld.logger.errorlog("\229\140\186\229\159\159\227\128\144\230\156\141\229\138\161\229\153\168\227\128\145\230\175\148\227\128\144\229\174\162\230\136\183\231\171\175\231\188\147\229\173\152\227\128\145\229\164\154\228\186\134\230\149\176\230\141\174\239\188\154" .. WorldRegionEid)
              PrintTable(RegionBaseData)
            end
          end
        end
      end
    end
    GWorld.logger.errorlog("======================\230\175\148\232\190\131\229\174\162\230\136\183\231\171\175\231\188\147\229\173\152\229\146\140\230\156\141\229\138\161\229\153\168\230\149\176\230\141\174\229\186\147 End======================")
  end
end

function M:GMTest_PrintServerQuestChainData(ServerRegionDatas)
  local ServerQuestDatas = ServerRegionDatas[ERegionDataType.RDT_QuestData] or {}
  local Avatar = GWorld:GetAvatar()
  local DoingQuestChainIds = {}
  local DoingQuestIds
  DoingQuestChainIds, DoingQuestIds = Avatar:GetCurrentDoingQuest()
  local TestServerQuestDatas = {}
  for _, ChainId in pairs(DoingQuestChainIds) do
    GWorld.logger.errorlog("======================\230\137\147\229\141\176\230\173\163\229\156\168\230\137\167\232\161\140\231\154\132\228\187\187\229\138\161\233\147\190 " .. ChainId .. " \230\149\176\230\141\174======================")
    GWorld.logger.errorlog("======================\229\189\147\229\137\141\229\183\178\231\187\143\229\173\152\229\130\168\229\156\168\230\156\141\229\138\161\229\153\168\231\154\132\230\149\176\230\141\174======================")
    for SubRegionId, LevelRegionDatas in pairs(ServerQuestDatas) do
      for LevelName, RegionDatas in pairs(LevelRegionDatas) do
        for WorldRegionEid, RegionBaseData in pairs(RegionDatas) do
          if RegionBaseData.QuestChainId == ChainId then
            PrintTable(RegionBaseData)
          end
          TestServerQuestDatas[ChainId] = TestServerQuestDatas[ChainId] or {}
          TestServerQuestDatas[ChainId][WorldRegionEid] = 1
        end
      end
    end
    GWorld.logger.errorlog("======================\229\189\147\229\137\141\228\187\133\229\173\152\229\130\168\229\156\168\229\174\162\230\136\183\231\171\175\231\154\132\230\149\176\230\141\174======================")
    for LevelName, LevelData in pairs(self.DataLibrary.RegionSSDatas) do
      for WorldRegionEid, RegionBaseData in pairs(LevelData) do
        if RegionBaseData.QuestChainId == ChainId and RegionBaseData.WorldRegionEid and (nil == TestServerQuestDatas[ChainId] or 1 ~= TestServerQuestDatas[ChainId][RegionBaseData.WorldRegionEid]) then
          PrintTable(RegionBaseData)
        end
      end
    end
    GWorld.logger.errorlog("======================\230\137\147\229\141\176\230\173\163\229\156\168\230\137\167\232\161\140\231\154\132\228\187\187\229\138\161\233\147\190 " .. ChainId .. " \230\149\176\230\141\174\231\187\147\230\157\159======================")
  end
end

return M
