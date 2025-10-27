local Component = {}

function Component:GetFeiNaProgressRewerd(InCallBack, FeiNaId, Index)
  local function Callback(Ret, Rewards)
    self.logger.debug("ZJT_ GetFeiNaProgressRewerd ", Ret, Rewards)
    
    if InCallBack then
      InCallBack(Ret, Rewards)
    end
  end
  
  self:CallServer("GetFeiNaProgressRewerd", Callback, FeiNaId, Index)
end

function Component:GetAllFeiNaProgressRewerd(FeiNaId, InCallBack)
  local function Callback(Ret, Rewards)
    self.logger.debug("ZJT_ GetAllFeiNaProgressRewerd ", Ret, Rewards)
    
    if InCallBack then
      InCallBack(Ret, Rewards)
    end
  end
  
  self:CallServer("GetAllFeiNaProgressRewerd", Callback, FeiNaId)
end

function Component:GetFeinaRewardInfo(DungeonId)
  local RewardsGot = self.FeiNaDungeonData[DungeonId] and self.FeiNaDungeonData[DungeonId].RewardsGot
  return RewardsGot
end

function Component:IsPassDungeon(DungeonId)
  if not DungeonId then
    return false
  end
  local IsPass = self.Dungeons and self.Dungeons[DungeonId] and self.Dungeons[DungeonId].IsPass or false
  return IsPass
end

function Component:_OnPropChangeFeiNaDungeonData()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  for Id, Info in pairs(DataMgr.FeinaEvent) do
    for _, DungeonId in pairs(Info.DungeonId) do
      local RewardsGot = Avatar:GetFeinaRewardInfo(DungeonId)
      if RewardsGot then
        for RewardIndex, State in pairs(RewardsGot) do
          if 1 == State then
            local Node = ReddotManager.GetTreeNode("FeinaEventReward")
            if not Node then
              ReddotManager.AddNodeEx("FeinaEventReward")
            end
            local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("FeinaEventReward")
            if not CacheDetail[Id] then
              CacheDetail[Id] = {}
            end
            if not CacheDetail[Id][DungeonId] then
              CacheDetail[Id][DungeonId] = {}
            end
            if not CacheDetail[Id][DungeonId][RewardIndex] then
              CacheDetail[Id][DungeonId][RewardIndex] = 1
              ReddotManager.IncreaseLeafNodeCount("FeinaEventReward")
            end
          end
        end
      end
    end
  end
end

return Component
