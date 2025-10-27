local TalkTriggerComponent = require("BluePrints.Story.Talk.Component.TalkTriggerComponent")
local M = Class("BluePrints.Common.MVC.Model")

function M:Init()
  M.Super.Init(self)
  self.DailyTalkNpc = {}
end

function M:Destory()
  self.DailyTalkNpc = nil
  M.Super.Destory(self)
end

function M:CheckDailyTalkUnFinish(TalkTriggerId)
  local DailyTalk = DataMgr.DailyTalk[TalkTriggerId]
  if not DailyTalk then
    return false
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local DailyTalks = Avatar.DailyTalks
  return not DailyTalks[TalkTriggerId]
end

function M:CheckCanDailyTalkReward(NpcId)
  local DailyTalkNpc = DataMgr.DailyTalkNpc
  if not DailyTalkNpc then
    return
  end
  local NpcTrigger = DailyTalkNpc[NpcId]
  if not NpcTrigger then
    return
  end
  for _, TriggerId in ipairs(NpcTrigger) do
    if self:CheckDailyTalkUnFinish(TriggerId) and TalkTriggerComponent:CheckCondition(TriggerId) then
      return true
    end
  end
  return false
end

function M:CheckHasDailyTalkReward(NpcId)
  DebugPrint("DailyTalkController CheckHasDailyTalkReward", NpcId, DataMgr.DailyTalkNpc[NpcId])
  local DailyTalkNpc = DataMgr.DailyTalkNpc
  if not DailyTalkNpc then
    return
  end
  local NpcTrigger = DailyTalkNpc[NpcId]
  if not NpcTrigger then
    return
  end
  return #NpcTrigger > 0
end

function M:RegisterNpc(NpcId, InteractiveComponent)
  if not self.DailyTalkNpc then
    return
  end
  self.DailyTalkNpc[NpcId] = InteractiveComponent
end

function M:CheckNeedTick()
  if table.isempty(self.DailyTalkNpc) then
    return false
  else
    return true
  end
end

return M
