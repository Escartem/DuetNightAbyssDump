local ServerInfo = {}

function ServerInfo:New(info)
  local server = {}
  self.__index = self
  setmetatable(server, self)
  server:Init(info)
  return server
end

function ServerInfo:Init(info)
  self.ServerId = info.hostnum or 0
  self.Area = info.area or "China"
  self.ServerName = info.name or ""
  self.ServerGateList = {}
  self.Channel = info.channel or ""
  self.StartTime = info.start_time or ""
  self.ServerLanguage = info.language or ""
  self.IsRecommend = info.is_recommend or false
  self.RecommendWeight = info.recommend_weight or 0
  self.IsDev = info.is_dev or false
  self.IsDocker = info.is_docker or false
end

function ServerInfo:AddToGateList(gate_host)
  self.ServerGateList[#self.ServerGateList + 1] = gate_host
end

local ServerListMgr = {}
ServerListMgr.Servers = {}

function ServerListMgr:QueryServerListCb(data)
  DebugPrint("QueryServerListCb", data)
  if not data or "" == data then
    DebugPrint("QueryServerList error, no data")
    return
  end
  local loadFunction, errorMessage = load(data)
  if errorMessage then
    DebugPrint("QueryServerList error, message is:", data)
    if GWorld.IsDev then
      self:AddDevServerList()
    else
      self:HandleServerList()
    end
    return
  end
  data = loadFunction()
  if data then
    self:GenerateServerList(data)
  end
  if GWorld.IsDev then
    self:AddDevServerList()
  else
    self:HandleServerList()
  end
end

function ServerListMgr:GenerateServerList(data)
  DebugPrint("GenerateServerList")
  for server_id, info in pairs(data) do
    local server = self.Servers[server_id]
    server = server or ServerInfo:New(info)
    for index, v in ipairs(info.gateList) do
      server:AddToGateList({
        v.ip,
        v.port
      })
    end
    self.Servers[server_id] = server
  end
end

function ServerListMgr:AddDevServerList()
  DebugPrint("AddDevServerList")
  local DevServerList = require("BluePrints/UI/GameLogin/DevServerList")
  for server_id, info in pairs(DevServerList) do
    if not self.Servers[server_id] then
      info.is_dev = true
      local server = ServerInfo:New(info)
      local ip = info.ip
      local port = info.port
      server:AddToGateList({ip, port})
      self.Servers[server_id] = server
    end
  end
  self:HandleServerList()
end

function ServerListMgr:HandleServerList()
  DebugPrint("HandleServerList begin")
  self.ServerAreaDict = {
    China = {},
    HMT = {},
    Asian = {},
    America = {},
    Europe = {}
  }
  if next(self.Servers) == nil then
    return
  end
  for server_id, server in pairs(self.Servers) do
    if not self.ServerAreaDict[server.Area] then
      self.ServerAreaDict[server.Area] = {}
    end
    local ServerArea = self.ServerAreaDict[server.Area]
    ServerArea[#ServerArea + 1] = server
  end
  
  local function cmp(s1, s2)
    if s1.IsRecommend and s2.IsRecommend then
      if s1.RecommendWeight == s2.RecommendWeight then
        return s2.ServerId > s1.ServerId
      else
        return s1.RecommendWeight > s2.RecommendWeight
      end
    elseif s1.IsRecommend then
      return true
    elseif s2.IsRecommend then
      return false
    else
      return s2.ServerId > s1.ServerId
    end
  end
  
  local all_server = self.ServerAreaDict[self:GetServerArea()]
  table.sort(all_server, cmp)
  DebugPrint("HandleServerList end")
  if self.GetServerListCb then
    self.GetServerListCb(all_server)
  end
end

function ServerListMgr:GetServerArea()
  return GWorld.ChooseServerArea
end

function ServerListMgr:GetServers()
  if self.ServerAreaDict then
    return self.ServerAreaDict[self:GetServerArea()]
  end
end

function ServerListMgr:GetChanelProvider()
  local ChannelId = HeroUSDKSubsystem(GWorld.GameInstance):GetChannelId()
  if DataMgr.ChannelInfo[ChannelId] then
    local ChannelProvider = DataMgr.ChannelInfo[ChannelId].Provider
    return ChannelProvider
  else
    print("\230\137\167\232\161\140GetCdnHideData\229\135\186\233\148\153\239\188\140\229\189\147\229\137\141ChannelId:" .. tostring(ChannelId) .. "\228\184\173\230\178\161\230\156\137\229\175\185\229\186\148\231\154\132Provider")
  end
end

return ServerListMgr
