local net = {}
local msgpack = require("msgpack_core")

function net:LuaInit()
  self:log("net:LuaInit")
  self.device_id = math.random(100000)
  self.account = tostring(self.ID)
  self.printCtx = self.printCtx .. " Account:" .. self.account .. " "
  self.name = "Robot" .. tostring(self.ID)
  self.HeartbeatDalta = 0
  self.CallbackId = 1
  self.CallbackFuncs = {}
end

function net:HandleMessage(Message)
  local Pak = msgpack.unpack(Message:GetBytes())
  if nil == Pak or nil == Pak.Cmd then
    self:log("Robot HandleMessage unpack failed Pak is nil")
    return
  end
  if nil == self[Pak.Cmd] then
    self:log("Robot HandleMessage failed CMD Function is nil", Pak.Cmd)
    return
  end
  local EntityFunc = ""
  if Pak.Cmd == "EntityMessage" then
    EntityFunc = Pak.Args[2]
  end
  local RpcRecorder = require("NetworkEngine.Rpc.RpcRecorder")
  RpcRecorder:Recv(Pak.Cmd, #Message:GetBytes(), Pak.Args, self.printCtx)
  if Pak.Args then
    self[Pak.Cmd](self, table.unpack(Pak.Args))
  else
    self[Pak.Cmd](self)
  end
  self:TryResume(Pak.Cmd .. EntityFunc)
end

function net:EntityMessage(entity_id, func_name, ...)
  local method = self[func_name]
  if nil == method then
    return
  end
  local Args = {
    ...
  }
  Args = RpcUtils.ConvertArgs(Args)
  method(self, table.unpack(Args))
end

function net:EntityRpc(func_name, ...)
  if self.entity_id == nil then
    return
  end
  local Args = {
    ...
  }
  Args = RpcUtils.RevertArgs(Args)
  self:RawRpc("EntityMessage", func_name, table.unpack(Args))
end

function net:LatentEntityRpc(func_name, callback, ...)
  local CallbackId = self.CallbackId
  self.CallbackId = self.CallbackId + 1
  self.CallbackFuncs[CallbackId] = callback
  self:EntityRpc(func_name, CallbackId, ...)
end

function net:EntityRpcWithCb(func_name, callback, ...)
  local CallbackId = self.CallbackId
  self.CallbackId = self.CallbackId + 1
  self.CallbackFuncs[CallbackId] = callback
  self:EntityRpc(func_name, CallbackId, ...)
end

function net:CallClientCallback(CallbackId, ...)
  local callback = self.CallbackFuncs[CallbackId]
  if callback then
    callback(self, ...)
  end
  self.CallbackFuncs[CallbackId] = nil
end

function net:RawRpc(Cmd, ...)
  local PackStr = msgpack.pack({
    Cmd = Cmd,
    Args = {
      ...
    }
  })
  if not PackStr then
    return
  end
  local Package = string.pack(">s3", PackStr)
  local EntityFunc = ""
  if "EntityMessage" == Cmd then
    local Args = {
      ...
    }
    EntityFunc = Args[1]
  end
  local RpcRecorder = require("NetworkEngine.Rpc.RpcRecorder")
  RpcRecorder:Send(Cmd, #PackStr, {
    ...
  }, self.printCtx)
  local Message = UE.FRobotMessage()
  Message:SetBytes(Package, #Package)
  self:SendMessage(Message)
  self:TryResume(Cmd .. EntityFunc)
end

return net
