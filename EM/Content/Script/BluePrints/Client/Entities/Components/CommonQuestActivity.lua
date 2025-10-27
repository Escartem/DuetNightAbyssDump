local Component = {}

function Component:CommonQuestActivityGetPhaseReward(EventId, QuestPhaseId)
  self.logger.info("CommonQuestActivityGetPhaseReward", EventId, QuestPhaseId)
  
  local function Cb(ErrCode)
    DebugPrint("CommonQuestActivityGetPhaseReward", ErrorCode:Name(ErrCode))
  end
  
  self:CallServer("CommonQuestActivityGetPhaseReward", Cb, EventId, QuestPhaseId)
end

function Component:CommonQuestActivityGetReward(EventId, CommonQuestId)
  self.logger.info("CommonQuestActivityGetReward", EventId, CommonQuestId)
  
  local function Cb(ErrCode)
    DebugPrint("CommonQuestActivityGetReward", ErrorCode:Name(ErrCode))
  end
  
  self:CallServer("CommonQuestActivityGetReward", Cb, EventId, CommonQuestId)
end

return Component
