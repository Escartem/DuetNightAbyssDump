local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local Component = {}
local NormalRewardReddotName = "JJGameTask_Normal_Reddot"
local ChallengeRewardReddotName = "JJGameTask_Challenge_Reddot"
local MidTermGoalEventId = DataMgr.MidTermGoalConstant.MidTermGoalEventId.ConstantValue
local TaskType = {
  Daily = {1, 2},
  Cycle = 3,
  Achievement = 4
}

function Component:MidTermGetScoresRewards(InCallBack)
  self.logger.info("MidTermGetScoresRewards")
  
  local function Cb(ErrCode, Ret)
    DebugPrint("MidTermGetScoresRewards", ErrorCode:Name(ErrCode))
    if InCallBack then
      InCallBack(ErrCode, Ret)
    end
  end
  
  self:CallServer("MidTermGetScoresRewards", Cb)
end

function Component:MidTermGetAllAchvScores(InCallBack)
  self.logger.info("MidTermGetAllAchvScores")
  
  local function Cb(ErrCode, Ret)
    DebugPrint("MidTermGetAllAchvScores", ErrorCode:Name(ErrCode))
    if InCallBack then
      InCallBack(ErrCode, Ret)
    end
  end
  
  self:CallServer("MidTermGetAllAchvScores", Cb)
end

function Component:MidTermGetAllNormalScores(InCallBack)
  self.logger.info("MidTermGetAllNormalScores")
  
  local function Cb(ErrCode, Ret)
    DebugPrint("MidTermGetAllNormalScores", ErrorCode:Name(ErrCode))
    if InCallBack then
      InCallBack(ErrCode, Ret)
    end
  end
  
  self:CallServer("MidTermGetAllNormalScores", Cb)
end

function Component:MidTermGetProgressReward(InCallBack)
  self.logger.info("MidTermGetProgressReward")
  
  local function Cb(ErrCode, Ret)
    DebugPrint("MidTermGetProgressReward", ErrorCode:Name(ErrCode))
    if InCallBack then
      InCallBack(ErrCode, Ret)
    end
  end
  
  self:CallServer("MidTermGetProgressReward", Cb)
end

function Component:MidTermGetTaskReward(TaskId, InCallBack)
  self.logger.info("MidTermGetTaskReward", TaskId)
  
  local function Cb(ErrCode)
    DebugPrint("MidTermGetTaskReward", ErrorCode:Name(ErrCode))
    if InCallBack then
      InCallBack(ErrCode)
    end
  end
  
  self:CallServer("MidTermGetTaskReward", Cb, TaskId)
end

function Component:NotifyMidTermTaskComplete(TaskId)
  self.logger.info("NotifyMidTermTaskComplete", TaskId)
  EventManager:FireEvent(EventID.OnMidTermTaskComplete, TaskId)
  self:UpdateJJGameReddot(TaskId)
end

function Component:NotifyMidTermTaskProgressChange(TaskId, Progress)
  self.logger.info("NotifyMidTermTaskProgressChange", TaskId, Progress)
  EventManager:FireEvent(EventID.OnMidTermTaskProgressChange, TaskId, Progress)
end

function Component:UpdateJJGameReddot(TaskId)
  if not ActivityUtils.CheckEventIsOpen(MidTermGoalEventId, nil, true) then
    return
  end
  local Task = self.MidTermTasks[TaskId]
  if Task then
    local TaskData = DataMgr.MidTermTask[Task.UniqueID]
    if TaskData and TaskData.TaskType == TaskType.Achievement then
      self:TryIncreaceChallengeTaskRewardReddot(TaskId)
    else
      self:TryIncreaceNormalRewardReddot(TaskId)
    end
  end
end

function Component:TryIncreaceChallengeTaskRewardReddot(TaskId)
  local CacheKey = ChallengeRewardReddotName .. TaskId
  local CacheData = ReddotManager.GetLeafNodeCacheDetail(ChallengeRewardReddotName)
  if CacheData and nil == CacheData[CacheKey] then
    CacheData[CacheKey] = true
    ReddotManager.IncreaseLeafNodeCount(ChallengeRewardReddotName)
  end
end

function Component:TryIncreaceNormalRewardReddot(TaskId)
  local CacheKey = NormalRewardReddotName .. TaskId
  local CacheData = ReddotManager.GetLeafNodeCacheDetail(NormalRewardReddotName)
  if CacheData and nil == CacheData[CacheKey] then
    CacheData[CacheKey] = true
    ReddotManager.IncreaseLeafNodeCount(NormalRewardReddotName)
  end
end

return Component
