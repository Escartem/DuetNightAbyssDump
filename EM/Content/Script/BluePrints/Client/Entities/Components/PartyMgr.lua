local Component = {}
local EntertainmentController = require("BluePrints.UI.WBP.Entertainment.EntertainmentController")

function Component:EnterWorld()
  EntertainmentController:Init()
end

function Component:LeaveWorld()
  EntertainmentController:Destory()
end

function Component:GetPartyTopic(CharId, Level)
  if not CharId then
    return
  end
  if not Level then
    return
  end
  local Party = self.PartyNpcs[CharId]
  if not Party then
    return
  end
  local PartyTopic = Party.PartyTopics[Level]
  if not PartyTopic then
    return
  end
  return PartyTopic
end

function Component:TriggerPartyTopicUnLock(CharId, Level, HandleCallback)
  CharId = tonumber(CharId)
  Level = tonumber(Level)
  self.logger.debug("TriggerPartyTopicUnLock Start", CharId, Level)
  
  local function Callback(Ret)
    self.logger.debug("TriggerPartyTopicUnLock callback", Ret, CharId, Level)
    if HandleCallback then
      HandleCallback(Ret)
    end
    EntertainmentController:GetModel():RefreshRedState()
  end
  
  self:CallServer("TriggerPartyTopicUnLock", Callback, CharId, Level)
end

function Component:TriggerPartyTopicComplete(PartyId, Level, HandleCallback)
  PartyId = tonumber(PartyId)
  Level = tonumber(Level)
  self.logger.debug("TriggerPartyTopicComplete Start", PartyId, Level)
  
  local function Callback(Ret)
    self.logger.debug("TriggerPartyTopicComplete callback", Ret, PartyId, Level)
    if HandleCallback then
      HandleCallback(Ret)
    end
    EntertainmentController:GetModel():RefreshRedState()
  end
  
  self:CallServer("TriggerPartyTopicComplete", Callback, PartyId, Level)
end

function Component:StartSojourns(PartyId, Level, HandleCallback)
  local function Callback(Ret)
    if HandleCallback then
      HandleCallback(ErrorCode:Check(Ret), Ret)
    end
  end
  
  self:CallServer("StartSojourns", Callback, PartyId, Level)
end

function Component:ExitSojourns(PartyId, Level, HandleCallback)
  local function Callback(Ret)
    if HandleCallback then
      HandleCallback(ErrorCode:Check(Ret), Ret)
    end
  end
  
  self:CallServer("ExitSojourns", Callback, PartyId, Level)
end

return Component
