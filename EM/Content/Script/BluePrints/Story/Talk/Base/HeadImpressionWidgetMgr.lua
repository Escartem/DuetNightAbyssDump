require("UnLua")
local HeadImpressionWidgetMgr = Class("BluePrints.Common.TimerMgr")
local EImpressionState = {
  Undefined = 0,
  Unopened = 1,
  Working = 2,
  Completed = 3
}

function HeadImpressionWidgetMgr:OnInitialize(...)
  EventManager:AddEvent(EventID.OnImprTalkTriggerComplete, self, self.OnTalkTriggerComplete)
end

function HeadImpressionWidgetMgr:OnDeinitialize(...)
  EventManager:RemoveEvent(EventID.OnImprTalkTriggerComplete, self)
end

function HeadImpressionWidgetMgr:OnTalkTriggerComplete(TalkTriggerId, RegionId)
  self:ForceRefreshState()
end

function HeadImpressionWidgetMgr:GetNpcImpressionState(Npc)
  if not Npc then
    return EImpressionState.Undefined
  end
  local NpcId = Npc.NpcId
  if not NpcId or 0 == NpcId then
    return EImpressionState.Undefined
  end
  local NpcData = DataMgr.Npc[NpcId]
  if not NpcData then
    return EImpressionState.Undefined
  end
  local RelatedTalks = NpcData.RelatedTalks
  if not RelatedTalks then
    return EImpressionState.Undefined
  end
  local TalkTriggers = DataMgr.TalkTrigger
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  local State = EImpressionState.Completed
  local Avatar = GWorld:GetAvatar()
  for _, TalkTriggerId in pairs(RelatedTalks) do
    local TalkTriggerData = TalkTriggers[TalkTriggerId]
    if TalkTriggerData and TalkContext.TalkTriggerComponent:IsImpression(TalkTriggerData) then
      local bCompleted = Avatar and Avatar:IsStorylineComplete(TalkTriggerId)
      if not bCompleted then
        local bConditionMet = TalkContext.TalkTriggerComponent:CheckCondition(TalkTriggerId)
        if bConditionMet then
          State = EImpressionState.Working
          break
        else
          State = EImpressionState.Unopened
        end
      end
    end
  end
  return State
end

return HeadImpressionWidgetMgr
