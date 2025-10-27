local Component = {}

function Component:NotifyModBookQuestComplete(ModBookQuestId)
  EventManager:FireEvent(EventID.OnModBookQuestFinished, ModBookQuestId)
  local PhaseId = DataMgr.ModGuideBookTask[ModBookQuestId].QuestPhaseId
  local ReddotNode = "ModArchive_Task"
  if not ReddotManager.GetTreeNode("ModArchive") then
    ReddotManager.AddNodeEx("ModArchive")
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(ReddotNode)
  CacheDetail = CacheDetail or {}
  if not CacheDetail.PhaseId then
    CacheDetail.PhaseId = PhaseId
  end
  ReddotManager.IncreaseLeafNodeCount(ReddotNode, 1, CacheDetail)
end

function Component:GMCompleteModBookQuest(ModBookQuestId)
  ModBookQuestId = tonumber(ModBookQuestId)
  if not ModBookQuestId then
    return
  end
  self:CallServerMethod("GMCompleteModBookQuest", ModBookQuestId)
end

function Component:ModBookQuestGetReward(ModBookQuestId, CallBack)
  self.logger.debug("ModBookQuestGetReward", ModBookQuestId)
  
  local function callback(ret, rewards)
    self.logger.debug("ModBookQuestGetReward callback", ret)
    DebugPrintTable({rewards = rewards})
    if CallBack then
      CallBack(ret, rewards)
    end
  end
  
  self:CallServer("ModBookQuestGetReward", callback, ModBookQuestId)
end

function Component:ModBookQuestGetRewardByPhase(ModBookQuestPhaseId, CallBack)
  self.logger.debug("ModBookQuestGetRewardByPhase", ModBookQuestPhaseId)
  
  local function callback(ret, rewards)
    self.logger.debug("ModBookQuestGetRewardByPhase callback", ret)
    DebugPrintTable({rewards = rewards})
    if CallBack then
      CallBack(ret, rewards)
    end
  end
  
  self:CallServer("ModBookQuestGetRewardByPhase", callback, ModBookQuestPhaseId)
end

function Component:ModBookQuestGetAllRewardByPhase(ModBookQuestPhaseId, CallBack)
  self.logger.debug("ModBookQuestGetAllRewardByPhase", ModBookQuestPhaseId)
  
  local function callback(ret, rewards)
    self.logger.debug("ModBookQuestGetAllRewardByPhase callback", ret)
    DebugPrintTable({rewards = rewards})
    if CallBack then
      CallBack(ret, rewards)
    end
  end
  
  self:CallServer("ModBookQuestGetAllRewardByPhase", callback, ModBookQuestPhaseId)
end

return Component
