local Component = {}

function Component:EnterWorld()
  self:RefreshBattlePassReddot()
end

function Component:RpcBattlePassGetTaskReward(Callback, TaskType, TaskId)
  self.logger.debug("RpcBattlePassGetTaskReward")
  
  local function Cb(Reward)
    self.logger.debug("RpcBattlePassGetTaskReward ", TaskId)
    if Callback then
      Callback(Reward)
    end
  end
  
  self:CallServer("RpcBattlePassGetTaskReward", Cb, TaskType, TaskId)
end

function Component:RpcBattlePassGetAllTaskReward(Callback)
  self.logger.debug("RpcBattlePassGetAllTaskReward")
  
  local function Cb(Reward)
    self.logger.debug("RpcBattlePassGetAllTaskReward Ret:", CommonUtils.TableToString(GotSuccessTasks))
    if Callback then
      Callback(Reward)
    end
  end
  
  self:CallServer("RpcBattlePassGetAllTaskReward", Cb)
end

function Component:RpcBattlePassGetLevelReward(Level, IsRank2, Callback)
  self.logger.debug("BattlePassComp RpcBattlePassGetLevelReward", Level, IsRank2)
  
  local function Cb(ret, Reward)
    self.logger.debug("BattlePassComp RpcBattlePassGetLevelReward Cb")
    if not ErrorCode:Check(ret) then
      return
    end
    if Callback then
      Callback(Reward)
    end
  end
  
  self:CallServer("RpcBattlePassGetLevelReward", Cb, Level, IsRank2)
end

function Component:RpcBattlePassGetAllLevelReward(Callback)
  self.logger.debug("BattlePassComp RpcBattlePassGetAllLevelReward")
  
  local function Cb(Rewards)
    self.logger.debug("BattlePassComp RpcBattlePassGetAllLevelReward Cb")
    if Callback then
      Callback(Rewards)
    end
  end
  
  self:CallServer("RpcBattlePassGetAllLevelReward", Cb)
end

function Component:BattlePassChoosePet(PetId, Callback)
  self.logger.debug("BattlePassComp BattlePassChoosePet", PetId)
  
  local function Cb(ret)
    self.logger.debug("BattlePassComp BattlePassChoosePet Cb")
    if not ErrorCode:Check(ret) then
      return
    end
    if Callback then
      Callback()
    end
  end
  
  self:CallServer("BattlePassChoosePet", Cb, PetId)
end

function Component:BattlePassChooseLastVersionPet(PetId, Callback)
  self.logger.debug("BattlePassComp BattlePassChooseLastVersionPet", PetId)
  
  local function Cb(ret)
    self.logger.debug("BattlePassComp BattlePassChooseLastVersionPet Cb")
    if not ErrorCode:Check(ret) then
      return
    end
    if Callback then
      Callback()
    end
  end
  
  self:CallServer("BattlePassChooseLastVersionPet", Cb, PetId)
end

function Component:_OnPropChangeBattlePassVersion()
  EventManager:FireEvent(EventID.BattlePassVersionChange)
  self:OnBattlePassVersionChange()
end

function Component:OnBattlePassVersionChange()
  self:RefreshBattlePassNewVisionReddot()
end

function Component:_OnPropChangeBattlePassUnlockRank2()
  if self.BattlePassUnlockRank2 then
    EventManager:FireEvent(EventID.BattlePassRank2Unlock)
    if not ReddotManager.GetTreeNode("BattlePassReward") then
      ReddotManager.AddNode("BattlePassReward")
    end
    local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("BattlePassReward")
    local IncreaceNum = 0
    for i = 1, self.BattlePassLevel do
      if not self.BattlePassRank2LevelRewardsGot[i] then
        if not CacheDetail.Rank2 then
          CacheDetail.Rank2 = {}
        end
        local Rank2CacheDetail = CacheDetail.Rank2
        if not Rank2CacheDetail[i] then
          Rank2CacheDetail[i] = 1
          IncreaceNum = IncreaceNum + 1
        end
      end
    end
    if IncreaceNum > 0 then
      ReddotManager.IncreaseLeafNodeCount("BattlePassReward", IncreaceNum)
    end
  end
end

function Component:_OnPropChangeBattlePassLevel()
  EventManager:FireEvent(EventID.BattlePassLevelChange)
  self:TryIncreaceBattlePassRewardReddot()
  self:TryClearBattlePassMissionReddot()
end

function Component:_OnPropChangeBattlePassRank1LevelRewardsGot(Keys)
  self:OnBattlePassLevelRewardsGotChange(Keys, "Rank1")
end

function Component:_OnPropChangeBattlePassRank2LevelRewardsGot(Keys)
  self:OnBattlePassLevelRewardsGotChange(Keys, "Rank2")
end

function Component:OnBattlePassLevelRewardsGotChange(Keys, Type)
  local Level = Keys and Keys[1]
  if not Level then
    return
  end
  local BattlePassReward = self:GetBattlePassReward()
  if not BattlePassReward then
    return
  end
  local MaxLevel = #BattlePassReward
  if Level > MaxLevel then
    return
  end
  local LevelRewardsGot
  if "Rank1" == Type then
    LevelRewardsGot = self.BattlePassRank1LevelRewardsGot
  elseif "Rank2" == Type then
    LevelRewardsGot = self.BattlePassRank2LevelRewardsGot
  end
  if not LevelRewardsGot then
    return
  end
  if not ReddotManager.GetTreeNode("BattlePassReward") then
    ReddotManager.AddNode("BattlePassReward")
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("BattlePassReward")
  if not LevelRewardsGot[Level] then
    if not CacheDetail[Type] then
      CacheDetail[Type] = {}
    end
    local Rank1CacheDetail = CacheDetail[Type]
    if not Rank1CacheDetail[Level] then
      Rank1CacheDetail[Level] = 1
      ReddotManager.IncreaseLeafNodeCount("BattlePassReward", 1)
    end
  else
    local Rank1CacheDetail = CacheDetail[Type]
    if Rank1CacheDetail and Rank1CacheDetail[Level] then
      Rank1CacheDetail[Level] = nil
      if nil == next(CacheDetail[Type]) then
        CacheDetail[Type] = nil
      end
      ReddotManager.DecreaseLeafNodeCount("BattlePassReward", 1)
    end
  end
end

function Component:TryIncreaceBattlePassRewardReddot()
  local BattlePassReward = self:GetBattlePassReward()
  if not BattlePassReward then
    return
  end
  local MaxLevel = #BattlePassReward
  if not ReddotManager.GetTreeNode("BattlePassReward") then
    ReddotManager.AddNode("BattlePassReward")
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("BattlePassReward")
  local IncreaceNum = 0
  for i = 1, self.BattlePassLevel do
    if i > MaxLevel then
      return
    end
    if not self.BattlePassRank1LevelRewardsGot[i] then
      if not CacheDetail.Rank1 then
        CacheDetail.Rank1 = {}
      end
      local Rank1CacheDetail = CacheDetail.Rank1
      if not Rank1CacheDetail[i] then
        Rank1CacheDetail[i] = 1
        IncreaceNum = IncreaceNum + 1
      end
    end
    if self.BattlePassUnlockRank2 and not self.BattlePassRank2LevelRewardsGot[i] then
      if not CacheDetail.Rank2 then
        CacheDetail.Rank2 = {}
      end
      local Rank2CacheDetail = CacheDetail.Rank2
      if not Rank2CacheDetail[i] then
        Rank2CacheDetail[i] = 1
        IncreaceNum = IncreaceNum + 1
      end
    end
  end
  if IncreaceNum > 0 then
    ReddotManager.IncreaseLeafNodeCount("BattlePassReward", IncreaceNum)
  end
end

function Component:TryClearBattlePassMissionReddot()
  local BattlePassReward = self:GetBattlePassReward()
  if not BattlePassReward then
    return
  end
  local MaxLevel = #BattlePassReward
  if MaxLevel <= self.BattlePassLevel then
    if not ReddotManager.GetTreeNode("BattlePassMission") then
      ReddotManager.AddNode("BattlePassMission")
    end
    ReddotManager.ClearLeafNodeCount("BattlePassMission", true)
  end
end

function Component:_OnPropChangeBattlePassTaskDaily(Keys)
  self:BattlePassTaskChange(Keys, "Daily")
end

function Component:_OnPropChangeBattlePassTaskWeekly(Keys)
  self:BattlePassTaskChange(Keys, "Weekly")
end

function Component:_OnPropChangeBattlePassTaskVersion(Keys)
  self:BattlePassTaskChange(Keys, "Version")
end

function Component:BattlePassTaskChange(Keys, Type)
  local TaskId = Keys and Keys[1]
  if not TaskId then
    return
  end
  local BattlePassReward = self:GetBattlePassReward()
  if not BattlePassReward then
    return
  end
  local MaxLevel = #BattlePassReward
  if MaxLevel <= self.BattlePassLevel then
    return
  end
  local Prop = Keys[2]
  if Prop and "Progress" == Prop then
    EventManager:FireEvent(EventID.BattlePassTaskProgressChange, Type, TaskId)
    local BattlePassTaskInfo = self["BattlePassTask" .. Type][TaskId]
    if BattlePassTaskInfo:IsComplete() and not BattlePassTaskInfo.RewardsGot then
      self:RefreshBattlePassMissionReddotInfo(Type, TaskId, true)
    end
  elseif Prop and "RewardsGot" == Prop then
    local BattlePassTaskInfo = self["BattlePassTask" .. Type][TaskId]
    if BattlePassTaskInfo.RewardsGot then
      self:RefreshBattlePassMissionReddotInfo(Type, TaskId, false)
    end
  end
end

function Component:_OnPropChangeBattlePassPetClaimed()
  DebugPrint("BattlePass Component:_OnPropChangeBattlePassPetClaimed", self.BattlePassPetClaimed)
  if self.BattlePassPetClaimed then
    EventManager:FireEvent(EventID.BattlePassPetClaimed)
    local TreeNode = ReddotManager.GetTreeNode("BattlePassPetSelection")
    if not TreeNode or 0 == TreeNode.Count then
      return
    end
    ReddotManager.ClearLeafNodeCount("BattlePassPetSelection", true)
  end
end

function Component:_OnPropChangeBattlePassPetCanClaim(Keys)
  if self.BattlePassPetCanClaim and not self.BattlePassPetClaimed then
    EventManager:FireEvent(EventID.BattlePassPetCanClaim)
    local TreeNode = ReddotManager.GetTreeNode("BattlePassPetSelection")
    TreeNode = TreeNode or ReddotManager.AddNode("BattlePassPetSelection")
    if 0 == TreeNode.Count then
      ReddotManager.IncreaseLeafNodeCount("BattlePassPetSelection", 1)
    end
  end
end

function Component:BattlePassBuyLevel(Level, Cb)
  self.logger.debug("BattlePassBuyLevel")
  self:CallServer("BattlePassBuyLevel", function(ErrCode)
    self.logger.debug("BattlePassBuyLevel Cb<ErrCode>", ErrCode)
    if Cb then
      Cb(ErrCode)
    end
  end, Level)
end

function Component:BattlePassReuqestPay(PayRankType, Cb)
  self.logger.debug("BattlePassReuqestPay")
  self:CallServer("BattlePassReuqestPay", function(ErrCode, OrderId, CallbackUrl, GoodsId)
    self.logger.debug("BattlePassReuqestPay Cb<ErrCode,OrderId,CallbackUrl>", ErrCode, OrderId, CallbackUrl, GoodsId)
    if Cb then
      Cb(ErrCode, OrderId, CallbackUrl, GoodsId)
    end
  end, PayRankType)
end

function Component:BattlePassBuySuccessNotify(PayRankType, Rewards)
  DebugPrint("gmy@BattlePass Component:BattlePassBuySuccessNotify", PayRankType, Rewards)
  EventManager:FireEvent(EventID.BattlePassBuySuccessNotify, PayRankType, Rewards)
  if Rewards and next(Rewards) then
    UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, nil, self, false)
  end
end

function Component:_OnPropChangeBattlePassAutoGetTaskReward(Keys)
  if self.BattlePassAutoGetTaskReward then
    EventManager:FireEvent(EventID.BattlePassAutoGetTaskReward)
  end
end

function Component:RefreshBattlePassMissionReddotInfo(Type, TaskId, Add)
  if not ReddotManager.GetTreeNode("BattlePassMission") then
    ReddotManager.AddNode("BattlePassMission")
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("BattlePassMission")
  if Add then
    if not CacheDetail[Type] then
      CacheDetail[Type] = {}
    end
    local TypeCacheDetail = CacheDetail[Type]
    if not TypeCacheDetail[TaskId] then
      TypeCacheDetail[TaskId] = 1
      ReddotManager.IncreaseLeafNodeCount("BattlePassMission", 1)
    end
  elseif CacheDetail[Type] then
    local TypeCacheDetail = CacheDetail[Type]
    if TypeCacheDetail[TaskId] then
      TypeCacheDetail[TaskId] = nil
      if nil == next(CacheDetail[Type]) then
        CacheDetail[Type] = nil
      end
      ReddotManager.DecreaseLeafNodeCount("BattlePassMission", 1)
    end
  end
end

function Component:RefreshBattlePassReddot()
  self:RefreshBattlePassNewVisionReddot()
  self:RefreshAllBattlePassRewardReddot()
  self:RefreshAllBattlePassMissionReddot()
  self:RefreshALLBattlePassPetCanClaimReddot()
end

function Component:RefreshBattlePassNewVisionReddot()
  if not ReddotManager.GetTreeNode("BattlePassNewVision") then
    ReddotManager.AddNode("BattlePassNewVision")
  end
  ReddotManager.ClearLeafNodeCount("BattlePassNewVision")
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("BattlePassNewVision")
  if not CacheDetail.VersionId or CacheDetail.VersionId ~= self.BattlePassVersion then
    CacheDetail.VersionId = self.BattlePassVersion
    if self.BattlePassVersion > 0 then
      ReddotManager.IncreaseLeafNodeCount("BattlePassNewVision", 1)
    end
  end
end

function Component:RefreshAllBattlePassRewardReddot()
  if not ReddotManager.GetTreeNode("BattlePassReward") then
    ReddotManager.AddNode("BattlePassReward")
  end
  ReddotManager.ClearLeafNodeCount("BattlePassReward", true)
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("BattlePassReward")
  local BattlePassReward = self:GetBattlePassReward()
  if not BattlePassReward then
    return
  end
  local MaxLevel = #BattlePassReward
  local IncreaceNum = 0
  for i = 1, self.BattlePassLevel do
    if i > MaxLevel then
      return
    end
    if not self.BattlePassRank1LevelRewardsGot[i] then
      if not CacheDetail.Rank1 then
        CacheDetail.Rank1 = {}
      end
      local Rank1CacheDetail = CacheDetail.Rank1
      if not Rank1CacheDetail[i] then
        Rank1CacheDetail[i] = 1
        IncreaceNum = IncreaceNum + 1
      end
    end
    if self.BattlePassUnlockRank2 and not self.BattlePassRank2LevelRewardsGot[i] then
      if not CacheDetail.Rank2 then
        CacheDetail.Rank2 = {}
      end
      local Rank2CacheDetail = CacheDetail.Rank2
      if not Rank2CacheDetail[i] then
        Rank2CacheDetail[i] = 1
        IncreaceNum = IncreaceNum + 1
      end
    end
  end
  if IncreaceNum > 0 then
    ReddotManager.IncreaseLeafNodeCount("BattlePassReward", IncreaceNum)
  end
end

function Component:RefreshAllBattlePassMissionReddot()
  if not ReddotManager.GetTreeNode("BattlePassMission") then
    ReddotManager.AddNode("BattlePassMission")
  end
  ReddotManager.ClearLeafNodeCount("BattlePassMission", true)
  local BattlePassReward = self:GetBattlePassReward()
  if not BattlePassReward then
    return
  end
  local MaxLevel = #BattlePassReward
  if MaxLevel <= self.BattlePassLevel then
    return
  end
  local AllMission = {
    Daily = self.BattlePassTaskDaily,
    Weekly = self.BattlePassTaskWeekly,
    Version = self.BattlePassTaskVersion
  }
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("BattlePassMission")
  local IncreaceNum = 0
  for Type, MissionInfo in pairs(AllMission) do
    for TaskId, TargetCounter in pairs(MissionInfo) do
      if not TargetCounter.RewardsGot and TargetCounter:IsComplete() then
        if not CacheDetail[Type] then
          CacheDetail[Type] = {}
        end
        local TypeCacheDetail = CacheDetail[Type]
        if not TypeCacheDetail[TaskId] then
          TypeCacheDetail[TaskId] = 1
          IncreaceNum = IncreaceNum + 1
        end
      end
    end
  end
  if IncreaceNum > 0 then
    ReddotManager.IncreaseLeafNodeCount("BattlePassMission", IncreaceNum)
  end
end

function Component:RefreshALLBattlePassPetCanClaimReddot()
  self:_OnPropChangeBattlePassPetCanClaim()
  self:_OnPropChangeBattlePassPetClaimed()
end

function Component:GetBattlePassReward()
  local BattlePassData = DataMgr.BattlePassMain[self.BattlePassVersion]
  if not BattlePassData then
    return nil
  end
  local BPRewardTemplateID = BattlePassData.BPRewardTemplateID
  if not BPRewardTemplateID then
    return nil
  end
  local BattlePassReward = DataMgr.BattlePassReward[BPRewardTemplateID]
  return BattlePassReward
end

return Component
