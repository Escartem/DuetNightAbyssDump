require("UnLua")
local EMCache = require("EMCache.EMCache")
local msgpack = require("msgpack_core")
local BP_TcpClient_C = Class("BluePrints.Client.BP_TcpConnection_C")

function BP_TcpClient_C:Initialize(Initializer)
  self.Super.Initialize(self)
end

function BP_TcpClient_C:K2_DisConnect()
  print(_G.LogTag, "K2_Disconnect")
end

function BP_TcpClient_C:K2_OnDisconnect()
  print(_G.LogTag, "K2_OnDisconnect")
  GWorld.NetworkMgr:DisconnectAndShowUI()
end

function BP_TcpClient_C:K2_Close()
  print(_G.LogTag, "K2_Close")
end

function BP_TcpClient_C:K2_TryReConnect()
  DebugPrint("BP_TcpClient_C:K2_TryReConnect")
  GWorld.NetworkMgr:StartShowReConnectUI()
end

function BP_TcpClient_C:K2_ConnectSuccess()
  DebugPrint("BP_TcpClient_C:K2_ConnectSuccess")
  EMCache:SaveCommon(false)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:ResetOnReconnect()
  end
  GWorld.NetworkMgr:ConnectSuccess()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if UIManager then
    local LoginMainPage = UIManager:GetUIObj("LoginMainPage")
    if LoginMainPage then
      LoginMainPage:CloseLoadingReconnect(true)
    end
  end
end

function BP_TcpClient_C:DestroyAvatar()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self:DestroyEntity(Avatar.Eid)
  end
  GWorld.EntityManager:DelAllEntities()
end

AssembleComponents(BP_TcpClient_C)
return BP_TcpClient_C
