require("UnLua")
local BP_TcpDedicatedServer_C = Class("BluePrints.Client.BP_TcpConnection_C")

function BP_TcpDedicatedServer_C:Initialize(Initializer)
  self.Super.Initialize(self)
end

AssembleComponents(BP_TcpDedicatedServer_C)
return BP_TcpDedicatedServer_C
