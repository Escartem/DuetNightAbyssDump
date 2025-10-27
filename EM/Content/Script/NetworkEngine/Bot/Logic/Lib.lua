local Lib = {}
local ServerList = require("BluePrints/UI/GameLogin/DevServerList")

function Lib:MainCoLogin()
  local Hostnum = UE.URobotInstance.GetIntFromCMD("-Hostnum=")
  self:log("MainCo Start Login", Hostnum, ServerList[Hostnum].ip, ServerList[Hostnum].port)
  self:Connect(ServerList[Hostnum].ip, ServerList[Hostnum].port)
  self:StartLogin()
  self:WaitMsg("EntityMessage" .. "PrepareToBattleRegion")
  self:log("MainCo Login Success")
end

function Lib:MainCoBattle()
  local DungeonId = UE.URobotInstance.GetIntFromCMD("-DungeonId=")
  if 0 == DungeonId then
    DungeonId = 90201
  end
  self:log("MainCo Start Battle", DungeonId)
  self:SingleGame(DungeonId)
  self:WaitMsg("EntityMessage" .. "AvatarStatusEnterSuccess")
end

function Lib:MainCoSendRecorderRpc()
  local RecorderFile = "F:/DefaultRpcRecorder.bin"
  local RpcRecorder = require("NetworkEngine.Rpc.RpcRecorder")
  local t = RpcRecorder:LoadRecordMsg(RecorderFile)
  self:log("MainCo Send Recorder Rpc", RecorderFile)
  local now = 0
  for i, v in ipairs(t) do
    if now < v.time then
      self:log("MainCo Send Recorder Rpc Delay", v.time - now)
      self:CoSleep(v.time - now)
      now = v.time
    end
    self:RawRpc(v.Cmd, table.unpack(v.Args))
  end
  self:log("MainCo Send Recorder Rpc Done")
end

return Lib
