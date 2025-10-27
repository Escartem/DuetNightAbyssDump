require("UnLua")
local RpcRecorder = require("NetworkEngine.Rpc.RpcRecorder")
local table = _ENV.table
local BP_TcpConnection_C = Class()

function BP_TcpConnection_C:Initialize(Initializer)
end

local function errorHandler(err)
  return err .. "\n" .. debug.traceback()
end

function BP_TcpConnection_C:InitSuccessLua()
  function _G.NetProxy(FuncName, ArgsTable)
    local ok, ret = xpcall(function()
      local func = self[FuncName]
      
      if not func then
        error("NetProxy function not found: " .. FuncName)
      end
      if ArgsTable then
        func(self, table.unpack(ArgsTable))
      else
        func(self)
      end
    end, errorHandler)
    if not ok then
      DebugPrint(ErrorTag, "NetProxy error:", ret)
    end
  end
end

function BP_TcpConnection_C:CreateEntity(entity_type, entity_id, info, use_protoattr)
  DebugNetPrint("CreateEntity ", entity_type, use_protoattr)
  local entity = GWorld.EntityManager:GetEntity(entity_id)
  if not entity then
    if "Avatar" == entity_type then
      EventManager:CheckIsLeak()
    end
    print(_G.LogTag, "CreateNewEntity", entity_type)
    entity = GWorld.EntityFactory:CreateEntity(entity_type, entity_id)
    if entity then
      entity:SetServerProxy(self)
    end
  end
  if entity then
    DebugPrint("InitFromDict before", os.time())
    entity:InitFromDict(info, use_protoattr)
    DebugPrint("InitFromDict after", os.time())
    entity:CreateSuccess()
  end
end

function BP_TcpConnection_C:DestroyEntity(entity_id)
  DebugNetPrint("DestroyEntity", entity_id)
  local entity = GWorld.EntityManager:GetEntity(entity_id)
  if entity then
    entity:Destroy()
  end
  GWorld.EntityManager:DelEntity(entity_id)
end

function BP_TcpConnection_C:EntityMessage(entity_id, func_name, ...)
  if GWorld.IsForbidEntityMessage then
    return
  end
  local entity = GWorld.EntityManager:GetEntity(entity_id)
  if nil == entity then
    return
  end
  local method = entity[func_name]
  if nil == method then
    return
  end
  local Args = {
    ...
  }
  Args = RpcUtils.ConvertArgs(Args)
  method(entity, table.unpack(Args))
end

AssembleComponents(BP_TcpConnection_C)
return BP_TcpConnection_C
