local Component = {}
local TimeUtils = require("Utils.TimeUtils")
local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")

function Component:CheckDynamicQuestIsInCantTriggerState(DynamicQuestId)
  DynamicQuestId = tonumber(DynamicQuestId)
  if self:IsInDynamicEvent() then
    return false
  end
  if self.CurrentDispatchList:HasValue(DynamicQuestId) then
    return true
  end
  local DynamicQuest = self.DynamicQuests[DynamicQuestId]
  if DynamicQuest then
    if DynamicQuest:IsInCD() then
      return false
    end
    local NowTime = TimeUtils.NowTime()
    if NowTime - self.DynamicQuestGlobalCD < DataMgr.GlobalConstant.DynQuestGCD.ConstantValue then
      return false
    end
    if DynamicQuest.DayLimit and self.TodayLimitDynamicQuestTimes == DataMgr.GlobalConstant.DynLimitCount.ConstantValue then
      return false
    end
    if DynamicQuest.ChanceCondition and not self:CheckCondition(DynamicQuest.ChanceCondition) then
      return false
    end
    local DynamicQuestInfo = DynamicQuest:Data()
    if DynamicQuestInfo and DynamicQuestInfo.PlayerLevel then
      local PlayerLevel = DynamicQuestInfo.PlayerLevel
      if self.Level < PlayerLevel[1] or self.Level > PlayerLevel[2] then
        return false
      end
    end
  else
    return false
  end
  return true
end

function Component:CheckAllDynamicQuestAlreadyTrigger(DynamicQuestId)
  for DQId, DynamicQuest in pairs(self.DynamicQuests) do
    if DQId ~= DynamicQuestId and DynamicQuest.LastEndTime > 0 then
      return false
    end
  end
  return true
end

function Component:CheckDynamicQuestIsFirstTrigger(DynamicQuestId)
  local DynamicQuest = self.DynamicQuests[DynamicQuestId]
  if DynamicQuest then
    local IsDoing = DynamicQuest:IsDoing()
    if IsDoing and DynamicQuest.StartTime and DynamicQuest.StartTime > 0 and (not DynamicQuest.LastEndTime or 0 == DynamicQuest.LastEndTime) then
      return true
    end
  end
  return false
end

function Component:OnActivateDynamicQuest(DynamicQuestId)
  self.logger.debug("OnActivateDynamicQuest", DynamicQuestId)
  local Avatar = GWorld:GetAvatar()
  if Avatar and not Avatar:IsInEnterBigWorld() then
    if not ClientEventUtils:CheckDynamicEventStarted(DynamicQuestId) then
      ClientEventUtils:StartDynamicEvent(DynamicQuestId)
    else
      local CurrentEvent = ClientEventUtils:GetCurrentActiveDynamicEvent(DynamicQuestId)
      CurrentEvent:ActivateTrigger()
    end
  end
end

function Component:TriggerDynamicQuestBegin(DynamicQuestId, InCallback)
  DynamicQuestId = tonumber(DynamicQuestId)
  self.logger.debug("TriggerDynamicQuestBegin", DynamicQuestId)
  
  local function Callback(Ret)
    self.logger.debug("TriggerDynamicQuestBegin callback", Ret, DynamicQuestId)
    if InCallback then
      InCallback(Ret)
    end
  end
  
  self:CallServer("TriggerDynamicQuestBegin", Callback, DynamicQuestId)
end

function Component:TriggerDynamicQuestEnd(DynamicQuestId, TriggerType, InCallback, DialogueId)
  local NewDialogueId = "-1"
  if nil ~= DialogueId then
    NewDialogueId = DialogueId
  end
  NewDialogueId = tonumber(NewDialogueId)
  DynamicQuestId = tonumber(DynamicQuestId)
  self.logger.debug("TriggerDynamicQuestEnd", DynamicQuestId, TriggerType)
  
  local function Callback(Ret)
    self.logger.debug("TriggerDynamicQuestEnd callback", Ret, DynamicQuestId, TriggerType, NewDialogueId)
    if InCallback then
      InCallback()
    end
  end
  
  self:CallServer("TriggerDynamicQuestEnd", Callback, DynamicQuestId, TriggerType, NewDialogueId)
end

function Component:OnDynamicQuestEnd(DynamicQuestId)
  self.logger.debug("OnDynamicQuestEnd", DynamicQuestId)
  local Avatar = GWorld:GetAvatar()
  if Avatar and not Avatar:IsInEnterBigWorld() then
    local DynamicEvent = ClientEventUtils:GetCurrentDoingDynamicEvent()
    if DynamicEvent then
      DynamicEvent:OnFinishEvent(false)
    end
  end
end

function Component:OnDynamicQuestDayLimitTimesChange(IsLimit)
  self.logger.debug("OnDynamicQuestDayLimitTimesChange", IsLimit)
end

return Component
