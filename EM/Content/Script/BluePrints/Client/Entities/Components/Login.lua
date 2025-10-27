local TimeUtils = require("Utils.TimeUtils")
local Component = {}

function Component:OnKickAvatar(ret, info)
  PrintTable(info, 2, "OnKickAvatar" .. tostring(ret))
  info.RetCode = ret
  if GWorld.NetworkMgr then
    GWorld.NetworkMgr:DisconnectAndShowUI(info)
  end
end

function Component:DisconnectServer()
  self.logger.info("DisconnectServer")
  self:CallServerMethod("DisconnectServer")
end

function Component:GetServerTime()
  self:CallServerMethod("QueryServerTime")
end

function Component:SyncServerTime(TimeOffset, TimeZone, TimeStr)
  DebugPrint("ServerTime", TimeStr)
  self.logger.debug("SyncServerTime", TimeOffset, TimeZone)
  TimeUtils.SetTimeOffset(TimeOffset)
  TimeUtils.SetServerTimeZone(TimeZone)
  self.logger.debug("Current Time is", TimeUtils.TimeToStr())
  self.logger.debug("Server TimeZone is", TimeZone)
end

return Component
