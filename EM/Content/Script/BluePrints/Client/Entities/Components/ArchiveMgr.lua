local Component = {}
local NumberModel = require("BluePrints.UI.UI_PC.Archive.WBP_Archive_Number_Model")

function Component:EnterWorld()
  self:RefreshArchiveReddot()
end

function Component:GetArchiveReward(CallBackFunction, ArchiveId, ArchiveCount)
  self.logger.debug("GetArchiveReward Begin", ArchiveId, ArchiveCount)
  
  local function Callback(Ret, RewardReturn)
    CallBackFunction(Ret, RewardReturn)
    self.logger.debug("GetArchiveReward Callback", Ret, ArchiveId, ArchiveCount, RewardReturn)
  end
  
  self:CallServer("GetArchiveReward", Callback, ArchiveId, ArchiveCount)
end

function Component:GetAllArchiveReward(CallBackFunction, ArchiveId)
  self.logger.debug("GetAllArchiveReward Begin", ArchiveId)
  
  local function Callback(Ret, RewardReturn)
    CallBackFunction(Ret, RewardReturn)
    self.logger.debug("GetAllArchiveReward Callback", Ret, ArchiveId, RewardReturn)
  end
  
  self:CallServer("GetAllArchiveReward", Callback, ArchiveId)
end

function Component:_OnPropChangeArchives(key)
  local ArchiveType = key[1]
  self:_TryAddRewardReddotCommon(ArchiveType)
  self:_TryAddNewReddot(ArchiveType)
end

function Component:_TryAddRewardReddotCommon(ArchiveType)
  local Info = DataMgr.ArchiveInfo[ArchiveType]
  local Count = self.Archives[Info.ArchiveType]:GetArchiveCount()
  if 1005 == ArchiveType then
    Count = NumberModel:GetCurrentBookNumber()
  end
  if not ReddotManager.GetTreeNode("ArchiveReward") then
    ReddotManager.AddNode("ArchiveReward")
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("ArchiveReward")
  local IncreaceNum = 0
  for i = Info.ArchiveStep, Count, Info.ArchiveStep do
    if not self.Archives[Info.ArchiveType].ArchiveRewardGot[i] then
      if not CacheDetail[Info.ArchiveType] then
        CacheDetail[Info.ArchiveType] = {}
      end
      if not CacheDetail[Info.ArchiveType][i] then
        CacheDetail[Info.ArchiveType][i] = 1
        IncreaceNum = IncreaceNum + 1
      end
    end
  end
  if IncreaceNum > 0 then
    ReddotManager.IncreaseLeafNodeCount("ArchiveReward", IncreaceNum)
  end
end

function Component:_TryAddNewReddot(ArchiveType)
  local NodeName = self:GetNodeName(ArchiveType)
  self:_TryAddNewReddotCommon(ArchiveType, NodeName)
end

function Component:_TryAddNewReddotCommon(ArchiveType, NodeName)
  if NodeName then
    if not ReddotManager.GetTreeNode(NodeName) then
      ReddotManager.AddNode(NodeName)
    end
    local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(NodeName)
    local IncreaceNum = 0
    for Id, _ in pairs(self.Archives[ArchiveType].ArchiveList) do
      if not CacheDetail[Id] then
        CacheDetail[Id] = 1
        IncreaceNum = IncreaceNum + 1
      end
    end
    if IncreaceNum > 0 then
      ReddotManager.IncreaseLeafNodeCount(NodeName, IncreaceNum)
    end
  end
end

function Component:GetNodeName(ArchiveType)
  local NodeName
  if 1001 == ArchiveType then
    NodeName = DataMgr.ReddotNode.ArchiveNewChar.Name
  elseif 1002 == ArchiveType then
    NodeName = DataMgr.ReddotNode.ArchiveNewMelee.Name
  elseif 1003 == ArchiveType then
    NodeName = DataMgr.ReddotNode.ArchiveNewRanged.Name
  elseif 1004 == ArchiveType then
    NodeName = DataMgr.ReddotNode.ArchiveNewResource.Name
  elseif 1005 == ArchiveType then
    NodeName = DataMgr.ReddotNode.ArchiveNewReadBook.Name
  elseif 1006 == ArchiveType then
    NodeName = DataMgr.ReddotNode.ArchiveNewMonster.Name
  end
  return NodeName
end

function Component:RefreshArchiveReddot()
  if not ReddotManager.GetTreeNode("ArchiveReward") then
    ReddotManager.AddNode("ArchiveReward")
  end
  ReddotManager.ClearLeafNodeCount("ArchiveReward", true)
  for ArchiveType = 1001, 1006 do
    self:_TryAddRewardReddotCommon(ArchiveType)
    self:_TryAddNewReddot(ArchiveType)
  end
end

return Component
