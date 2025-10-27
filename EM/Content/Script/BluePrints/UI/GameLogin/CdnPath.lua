local M = {}
local DEV_CDN_URL = {
  "https://pan01-1-dev.oss-cn-hangzhou.aliyuncs.com"
}
local PUB_CDN_URL_ROOT_CN = {
  "http://pan01-cdn-dna-ali.shyxhy.com",
  "http://pan01-cdn-dna-huawei.shyxhy.com",
  "http://pan01-1-hs.shyxhy.com",
  "http://pan01-1-eo.shyxhy.com"
}
local PUB_CDN_URL_ROOT_GLOBAL = {
  "http://pan01-cdn-ali-jp.dna-panstudio.com",
  "http://pan01-cdn-aws-jp.dna-panstudio.com",
  "http://pan01-cdn-eo-jp.dna-panstudio.com/",
  "http://pan01-cdn-hs-jp.dna-panstudio.com"
}

local function IsChina()
  return UE.AHotUpdateGameMode.IsGlobalPak() == false
end

local function IsDev()
  return GWorld.IsDev
end

function M:CdnUrl(Hostnum)
  if IsDev() and Hostnum and ServerConfig[Hostnum] then
    local ServerInfo = ServerConfig[Hostnum]
    if ServerInfo.DevFlag == "Public" then
      if ServerInfo.Area == "China" then
        return PUB_CDN_URL_ROOT_CN
      else
        return PUB_CDN_URL_ROOT_GLOBAL
      end
    end
    return DEV_CDN_URL
  end
  if false == IsChina() then
    return PUB_CDN_URL_ROOT_GLOBAL
  else
    return PUB_CDN_URL_ROOT_CN
  end
end

function M:OperationWebSuffix()
  local name = ""
  if IsDev() then
    name = name .. "Test"
  else
    name = name .. "Production"
  end
  if IsChina() then
    name = name .. "China"
  else
    name = name .. "Global"
  end
  return name
end

function M:ServerList()
  local ServerListName = UE4.UEMServerSettings:GetDefaultObject().ServerListTag or "PubServerList.lua"
  return "/ServerList/" .. ServerListName
end

function M:GameNotice(ServerID)
  if ServerConfig[ServerID] then
    ServerID = ServerConfig[ServerID].GroupId
  end
  return "/OperationGameNotice/OperationGameNotice" .. tostring(ServerID)
end

function M:GetHideUICtrl(ServerID)
  if ServerConfig[ServerID] then
    ServerID = ServerConfig[ServerID].GroupId
  end
  return "/OperationGameUIHideCtrl/OperationGameUIHideCtrl" .. tostring(ServerID)
end

function M:GameNoticeVersion(ServerID)
  if ServerConfig[ServerID] then
    ServerID = ServerConfig[ServerID].GroupId
  end
  return "/OperationGameNotice/OperationGameNoticeVersion" .. tostring(ServerID)
end

function M:Maintenance(ServerID)
  if ServerConfig[ServerID] then
    ServerID = ServerConfig[ServerID].GroupId
  end
  return "/OperationMaintenance/OperationMaintenance" .. tostring(ServerID)
end

function M:MaintenanceInterceptUrl(ServerID)
  if ServerConfig[ServerID] then
    ServerID = ServerConfig[ServerID].GroupId
  end
  return "/OperationMaintenance/OperationMaintenanceInterceptUrl" .. tostring(ServerID)
end

return M
