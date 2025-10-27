local DailyTalkController = require("BluePrints.UI.WBP.DailyTalk.DailyTalkController")
local DailyTalkCommon = require("BluePrints.UI.WBP.DailyTalk.DailyTalkCommon")
local Decorator = require("BluePrints.Client.Wrapper.Decorator")
local Component = {}
for key, value in pairs(Decorator) do
  Component[key] = value
end

function Component:EnterWorld()
  DailyTalkController:Init()
  local PlayerAvatar = GWorld:GetAvatar()
  if not PlayerAvatar then
    return
  end
  self.UnlockKey = PlayerAvatar:BindOnUIFirstTimeUnlock("DailyGoal", function()
    local bUnlocked = PlayerAvatar:CheckUIUnlocked("DailyGoal")
    if not bUnlocked then
      return
    end
    if not ReddotManager.GetTreeNode("DailyMain") then
      ReddotManager.AddNode("DailyMain")
    end
    if self:HasClaimableTaskReward() and not self:HasClaimableProgressReward() then
      local reddot = ReddotManager.GetTreeNode("DailyMain")
      if reddot.Count <= 0 then
        ReddotManager.IncreaseLeafNodeCount("DailyMain", 1)
      end
    else
      ReddotManager.ClearLeafNodeCount("DailyMain", false)
    end
  end)
end

function Component:LeaveWorld()
  DailyTalkController:Destory()
  local PlayerAvatar = GWorld:GetAvatar()
  if not PlayerAvatar then
    return
  end
  if self.UnlockKey then
    PlayerAvatar:UnBindOnUIFirstTimeUnlock("DailyGoal", self.UnlockKey)
  end
end

setmetatable(Component, getmetatable(Decorator))
Component:LimitCall(1)

function Component:GetDailyTaskReward(DailyTaskId)
  local DailyTask = self.DailyTasks:GetDailyTask(DailyTaskId)
  if not DailyTask then
    return
  end
  if not DailyTask:IsComplete() then
    return
  end
  local DailyTaskAchv = self.DailyTaskAchvs[DailyTaskId]
  if not DailyTaskAchv then
    return
  end
  if not DailyTaskAchv:IsComplete() then
    return
  end
  
  local function Callback(Ret, Rewards)
    if not self:CheckRegionErrorCode(Ret) then
      return
    else
      EventManager:FireEvent(EventID.DailyTaskRewardChange, DailyTaskId, Rewards)
    end
    self.logger.debug("ZJT_ GetDailyTaskReward ServerCallClient ", Ret, DailyTaskId)
  end
  
  self:CallServer("GetDailyTaskReward", Callback, DailyTaskId)
end

Component:LimitCall(1)

function Component:GetDailyProgressReward(TargetProgress)
  if TargetProgress > self.CurrentTaskProgress then
    return
  end
  if self.DailyTaskProgress[TargetProgress] == nil then
    return
  end
  if self.DailyTaskProgress[TargetProgress] ~= CommonConst.DailyTaskState.Complete then
    return
  end
  
  local function Callback(Ret, Rewards)
    if not self:CheckRegionErrorCode(Ret) then
      return
    else
      EventManager:FireEvent(EventID.DailyProgressRewardChange, TargetProgress, Rewards)
    end
    self.logger.debug("ZJT_ GetDailyProgressReward ServerCallClient ", Ret, TargetProgress)
  end
  
  self:CallServer("GetDailyProgressReward", Callback, TargetProgress)
end

Component:LimitCall(1)

function Component:GetAllDailyTaskReward()
  local function Callback(Ret, Rewards)
    if not self:CheckRegionErrorCode(Ret) then
      return
    else
      EventManager:FireEvent(EventID.AllDailyTaskRewardChange, Rewards)
    end
    self.logger.debug("ZJT_ GetAllDailyTaskReward ServerCallClient ", Ret)
  end
  
  self:CallServer("GetAllDailyTaskReward", Callback)
end

Component:LimitCall(1)

function Component:GetAllDailyProgressReward()
  local function Callback(Ret, Rewards)
    if not self:CheckRegionErrorCode(Ret) then
      return
    else
      EventManager:FireEvent(EventID.AllDailyProgressRewardChange, Rewards)
    end
    self.logger.debug("ZJT_ GetAllDailyProgressReward ServerCallClient ", Ret)
  end
  
  self:CallServer("GetAllDailyProgressReward", Callback)
end

function Component:OnDailyRefreshDailyTask()
  EventManager:FireEvent(EventID.DailyRefreshDailyTask)
  self.logger.debug("ZJT_ OnDailyRefreshDailyTask ServerCallClient ")
end

function Component:OnDailyRefreshDailyTalk()
  self.logger.debug("ZJT_ OnDailyRefreshDailyTalk ServerCallClient ")
end

function Component:_OnPropChangeDailyTasks(Keys)
  self:DailyTaskChange(Keys)
end

function Component:_OnPropChangeDailyTaskProgress(Keys)
  self:DailyTaskChange(Keys)
end

function Component:DailyTaskChange(Keys)
  local PlayerAvatar = GWorld:GetAvatar()
  if not PlayerAvatar then
    return
  end
  if not PlayerAvatar:CheckUIUnlocked("DailyGoal") then
    return
  end
  if not ReddotManager.GetTreeNode("DailyMain") then
    ReddotManager.AddNode("DailyMain")
  end
  if self:HasClaimableTaskReward() and not self:HasClaimableProgressReward() then
    local reddot = ReddotManager.GetTreeNode("DailyMain")
    if reddot.Count <= 0 then
      ReddotManager.IncreaseLeafNodeCount("DailyMain", 1)
    end
  else
    ReddotManager.ClearLeafNodeCount("DailyMain", false)
  end
end

function Component:HasClaimableTaskReward()
  local PlayerAvatar = GWorld:GetAvatar()
  if not PlayerAvatar then
    return false
  end
  local DailyTaskServerData = self.DailyTasks
  local DailyTaskProgressState = self.DailyTaskProgress
  for _, TaskData in pairs(DailyTaskServerData) do
    if TaskData.State == CommonConst.DailyTaskState.Complete then
      return true
    end
  end
  for _, ProgressState in pairs(DailyTaskProgressState) do
    if ProgressState == CommonConst.DailyTaskState.Complete then
      return true
    end
  end
  return false
end

function Component:HasClaimableProgressReward()
  local DataArray = {}
  local DailyGoalReward = DataMgr.DailyGoalReward[1]
  for key, ItemData in pairs(DailyGoalReward) do
    table.insert(DataArray, ItemData)
  end
  table.sort(DataArray, function(a, b)
    return a.RequiredActiveness < b.RequiredActiveness
  end)
  local bDailyTaskComplete = true
  local DailyTaskProgressState = self.DailyTaskProgress
  for _, ProgressState in pairs(DailyTaskProgressState) do
    if ProgressState ~= CommonConst.DailyTaskState.GetReward then
      bDailyTaskComplete = false
      break
    end
  end
  return self.CurrentTaskProgress >= DataArray[#DataArray].RequiredActiveness and bDailyTaskComplete
end

function Component:GetAllRewardDailyTask()
  local function Callback(Ret, Rewards)
    self.logger.debug("ZJT_ GetAllRewardDailyTask ServerCallClient ", Ret)
    
    PrintTable({Rewards = Rewards}, 10)
    EventManager:FireEvent(EventID.AllRewardDailyTask, Rewards)
  end
  
  self:CallServer("GetAllRewardDailyTask", Callback)
end

function Component:GetDailyTalkReward(DailyTalkId)
  local function Callback(Ret, Rewards)
    self.logger.debug("ZJT_ GetAllRewardDailyTask ServerCallClient ", Ret)
    
    if ErrorCode:Check(Ret) then
      DailyTalkController:ShowDailyRewards(DailyTalkId, Rewards)
    end
    DailyTalkController:OnGetReward()
  end
  
  self:CallServer("GetDailyTalkReward", Callback, DailyTalkId)
end

return Component
